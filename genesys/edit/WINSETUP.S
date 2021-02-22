*
* Genesys v1.2.4
* Window editor
*

         mx    %00
         rel
         lst   off

*----------------------------

         use   4/Ctl.Macs
	 use   4/Event.Macs
         use   4/Int.Macs
         use   4/Mem.Macs
	 use   4/Menu.Macs
	 use   4/Misc.Macs
         use   4/QD.Macs
	 use   4/QDAux.Macs
         use   4/Resource.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*----------------------------

         EXT   L0106A0
         EXT   L010698
         EXT   L01069C
         EXT   L014B1E
         EXT   L014E87
         EXT   L014B68
         EXT   L0114EF
         EXT   L010A0E
         EXT   L01080E
         EXT   L01068E
         EXT   L0106A4
         EXT   L0105BB
         EXT   L030000
         EXT   L030B90
         EXT   L0300B1
         EXT   L030171
         EXT   L030255
         EXT   L0303C5
         EXT   L0304C5
         EXT   L030903
         EXT   L030A61
         EXT   L0106FA
         EXT   L0106F8
         EXT   L010419
         EXT   L01070A
         EXT   L010702
         EXT   L0106A8
         EXT   L0106AA
         EXT   L0106AE
         EXT   L0106AC
         EXT   L0106B2
         EXT   L0106B0
         EXT   L0106B6
         EXT   L0106B4
         EXT   L0106BA
         EXT   L0106B8
         EXT   L0106BE
         EXT   L0106BC
         EXT   L0106C0
         EXT   L0106C2
         EXT   L0106C4
         EXT   L0106C6
         EXT   L0106C8
         EXT   L0106CA
         EXT   L0106CC
         EXT   L0106CE
         EXT   L0106D0
         EXT   L0106D2
         EXT   L0106D6
         EXT   L0106D4
         EXT   L0106D8
         EXT   L0106DC
         EXT   L0106DA
         EXT   L0106E0
         EXT   L0106DE
         EXT   L0106E4
         EXT   L0106E2
         EXT   L0106E8
         EXT   L0106E6
         EXT   L0106EC
         EXT   L0106EA
         EXT   L0106F0
         EXT   L0106EE
         EXT   L0106F4
         EXT   L0106F2
         EXT   L0106F6
         EXT   L010706
         EXT   L01000E
         EXT   L0106A6
         EXT   L040B72
         EXT   L010700
         EXT   L010202
         EXT   L010210
         EXT   L01021E
         EXT   L0434E2
         EXT   L01060C
         EXT   L0103D4
         EXT   L0106FC
         EXT   L0106FE
         EXT   L04116F
         EXT   L0409AD
         EXT   L0104A0
         EXT   L041C02
         EXT   L010C92
         EXT   L0403A5
         EXT   L01240E
         EXT   L012A14
         EXT   L013002
         EXT   L04067F
         EXT   L0117D4
         EXT   L014F19
         EXT   L010690
         EXT   L010692
         EXT   L010694
         EXT   L010696
         EXT   L01063D
         EXT   L042E6F
         EXT   L042683
         EXT   L01070E
         EXT   L01004E
         EXT   L040000

*----------------------------

L020000  ENT
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   $1B
         BNE   L020010
         BRL   L02008B
L020010  LDX   #^L01080E
         LDA   #L01080E
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L02009B
         PEA   L02009B
         LDA   #$0057
         PHA
         JSL   L014B68
         LDA   $1B
         PHA
         LDA   #$000B
         DEC
         TAX
         TXA
         CLC
         ADC   #L01080E
         PEA   ^L01080E
         PHA
         LDA   #$0004
         PHA
         _Int2Hex
         STA   L014E87
         LDA   $19
         PHA
         LDA   #$0014
         DEC
         TAX
         TXA
         CLC
         ADC   #L01080E
         PEA   ^L01080E
         PHA
         LDA   #$0004
         PHA
         _Int2Hex
         STA   L014E87
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^L01080E
         LDA   #L01080E
         PHX
         PHA
         _AlertWindow
         STA   L014E87
         PLA
         BEQ   L02008B
         BRL   L02008B
L02008B  LDA   $17
         STA   $1B
         LDA   $16
         STA   $1A
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L02009B  ASC   '52~Error $0000 at $0000. Please record a'
         ASC   'nd report this Window Editor error to SS'
         ASC   'Si.~^#0'
L0200F2  TSC
         SEC
         SBC   #$0062
         TCS
         PHD
         INC
         TCD
         PHB
         PHB
         PLA
         STA   $06
         PEA   >L01068E
         PLB
         PLB
         PHA
         _GetCurResourceFile
         STA   L014E87
         PLA
         STA   $58
         LDA   L014E87
         PHA
         LDA   #$0023
         PHA
         JSL   L020000
         LDA   L0106A4
         PHA
         _SetCurResourceFile
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0024
         PHA
         JSL   L020000
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $16
         PLA
         STA   $18
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetWRefCon
         STA   L014E87
         PLA
         STA   $1A
         PLA
         STA   $1C
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$005A
         PHA
         _GetPortRect
         STA   L014E87
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _SetPenSize
         STA   L014E87
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0020
         BNE   L0201B4
         BRL   L0201BC
L0201B4  LDA   #$000E
         STA   $50
         BRL   L0201C1
L0201BC  LDA   #$000D
         STA   $50
L0201C1  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$0054
         LDA   [$00],Y
         PHA
         LDY   #$0052
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         LDX   #$0000
         TAY
         BPL   L0201E3
         DEX
L0201E3  LDY   #$0001
         CMP   $01,S
         BEQ   L0201EB
         DEY
L0201EB  TXA
         CMP   $03,S
         BEQ   L0201F3
         LDY   #$0000
L0201F3  PLA
         PLA
         TYA
         BNE   L0201FB
         BRL   L020203
L0201FB  LDA   #$000E
         STA   $52
         BRL   L020208
L020203  LDA   #$0001
         STA   $52
L020208  LDA   $50
         PHA
         LDA   $52
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         _SetPenPat
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _FrameRect
         STA   L014E87
         _PenNormal
         STA   L014E87
         PHA
         PHA
         LDA   #$8010
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $54
         PLA
         STA   $56
         LDA   L014E87
         BEQ   L020282
         BRL   L0202F5
L020282  LDX   $56
         LDA   $54
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0034
         PHA
         JSL   L020000
         PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         LDY   #$0002
         LDA   [$54],Y
         PHA
         LDA   [$54]
         PHA
         PEA   $000A
         JSL   L014B1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8010
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0035
         PHA
         JSL   L020000
         BRL   L02030E
L0202F5  LDA   #$0000
         STA   $46
         LDA   #$0F0F
         STA   $48
         LDA   #$0000
         STA   $4A
         LDA   #$F0FF
         STA   $4C
         LDA   #$00F0
         STA   $4E
L02030E  PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L020334
         BRL   L020344
L020334  PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         JSL   L030B90
         BRL   L020439
L020344  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L02035D
         BRL   L0203C9
L02035D  PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         JSL   L0300B1
         PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         JSL   L030171
         PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         JSL   L030255
         PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         JSL   L0303C5
         PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0304C5
L0203C9  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0203E2
         BRL   L020413
L0203E2  PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         JSL   L030903
L020413  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BNE   L02042C
         BRL   L020439
L02042C  PEA   $0000
         TDC
         CLC
         ADC   #$0046
         PHA
         JSL   L030A61
L020439  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L020452
         BRL   L020470
L020452  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$000E
         PHA
         LDA   #$0006
         PHA
         _InsetRect
         STA   L014E87
         BRL   L02052D
L020470  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L0204A4
         BRL   L0204B4
L0204A4  LDA   #$0001
         PHA
         LDA   $1E
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $1E
L0204B4  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0204CD
         BRL   L0204EB
L0204CD  LDA   #$0001
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $1E
         SEC
         SBC   $01,S
         PLX
         STA   $1E
L0204EB  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L020504
         BRL   L02050C
L020504  LDA   $24
         SEC
         SBC   #$0018
         STA   $24
L02050C  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L020525
         BRL   L02052D
L020525  LDA   $22
         SEC
         SBC   #$000C
         STA   $22
L02052D  PHA
         _GetArcRot
         STA   L014E87
         PLA
         STA   $52
         LDA   $52
         AND   #$8000
         BNE   L020545
         BRL   L020555
L020545  LDA   $52
         EOR   #$8000
         PHA
         _SetArcRot
         STA   L014E87
L020555  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _SetPortRect
         STA   L014E87
         LDX   $18
         LDA   $16
         PHX
         PHA
         _DrawControls
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$005A
         PHA
         _SetPortRect
         STA   L014E87
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L0205A4
         BRL   L0205C7
L0205A4  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$0064
         LDA   [$00],Y
         TAX
         LDY   #$0062
         LDA   [$00],Y
         PHX
         PHA
         _DrawOneCtl
         STA   L014E87
L0205C7  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L0205E0
         BRL   L020603
L0205E0  LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$0068
         LDA   [$00],Y
         TAX
         LDY   #$0066
         LDA   [$00],Y
         PHX
         PHA
         _DrawOneCtl
         STA   L014E87
L020603  LDA   $52
         PHA
         _SetArcRot
         STA   L014E87
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$0060
         LDA   [$00],Y
         BNE   L020626
         BRL   L020661
L020626  PHA
         PHA
         _GetTick
         STA   L014E87
         LDA   #$0001
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         PHX
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         LDX   L0106FA
         LDA   L0106F8
         PHX
         PHA
         JSL   L010419
L020661  LDA   $58
         PHA
         _SetCurResourceFile
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0041
         PHA
         JSL   L020000
         LDA   $06
         PHA
         PLB
         PLB
         PLD
         TSC
         CLC
         ADC   #$0062
         TCS
         RTL

L020687  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHB
         PHB
         PLA
         STA   $06
         PEA   >L01068E
         PLB
         PLB
         LDA   $17
         STA   $23
         LDA   $16
         STA   $22
         LDA   $06
         PHA
         PLB
         PLB
         PLD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L0206AF  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _GetWRefCon
         STA   L014E87
         PLA
         STA   $16
         PLA
         STA   $18
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0060
         LDA   [$00],Y
         BNE   L0206E6
         BRL   L0208CC
L0206E6  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0060
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _CheckHandle
         STA   L014E87
         LDA   L014E87
         BEQ   L020752
         BRL   L0208A2
L020752  PHA
         PHA
         _GetTick
         STA   L014E87
         LDA   #$0002
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         PHX
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         LDX   L0106FA
         LDA   L0106F8
         PHX
         PHA
         JSL   L010419
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _InvalRgn
         STA   L014E87
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _BeginUpdate
         STA   L014E87
         JSL   L0200F2
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _EndUpdate
         STA   L014E87
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _DisposeRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0003
         PHA
         JSL   L020000
         PHA
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _FindHandle
         STA   L014E87
         _DisposeHandle
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0004
         PHA
         JSL   L020000
L0208A2  LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0208AC
         DEX
L0208AC  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0072
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L0208CC  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L0208DC  ENT
         TSC
         SEC
         SBC   #$002A
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $31
         PEI   $2F
         PEA   $0008
         JSL   L014B1E
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         JSL   L0206AF
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$0060
         STA   $00
         STX   $02
         LDA   $2D
         STA   [$00]
         LDA   $2D
         LDX   #$0001
         SEC
         SBC   #$0008
         BVS   L020931
         EOR   #$8000
L020931  BMI   L020934
         DEX
L020934  TXA
         PHA
         LDA   $2D
         LDX   #$0000
         CMP   #$000A
         BNE   L020941
         INX
L020941  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L02094B
         BRL   L020971
L02094B  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _InsetRect
         STA   L014E87
         BRL   L02098C
L020971  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
L02098C  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$006A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         PHA
         PHA
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L0209C1
         DEX
L0209C1  PHX
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0209E1
         DEX
L0209E1  PHX
         PHA
         _NewHandle
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$005C
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$0009
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$000A
         PHA
         JSL   L020000
         PHA
         PHA
         _NewRgn
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$000B
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _RectRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$000C
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   #$0003
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$0002
         STA   $00
         STX   $02
         LDA   #$0001
         STA   [$00]
         PHA
         PHA
         _NewRgn
         STA   L014E87
         PLA
         STA   $1E
         PLA
         STA   $20
         LDA   L014E87
         PHA
         LDA   #$000D
         PHA
         JSL   L020000
         LDA   $2D
         CMP   #$0007
         BEQ   L020BC6
         BRL   L020CC5
L020BC6  LDA   $1C
         SEC
         SBC   #$0018
         STA   $24
         LDA   $1A
         SEC
         SBC   #$000C
         STA   $22
         LDA   $24
         CLC
         ADC   #$001E
         STA   $28
         LDA   $22
         CLC
         ADC   #$000F
         STA   $26
         LDX   $20
         LDA   $1E
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0022
         PHA
         _RectRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$000E
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         LDX   $20
         LDA   $1E
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _DiffRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$000F
         PHA
         JSL   L020000
L020CC5  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _CopyRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0010
         PHA
         JSL   L020000
         LDX   $20
         LDA   $1E
         PHX
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRgn
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0004
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         LDX   $20
         LDA   $1E
         PHX
         PHA
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _DiffRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0011
         PHA
         JSL   L020000
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _InvalRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0013
         PHA
         JSL   L020000
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _DisposeRgn
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0014
         PHA
         JSL   L020000
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _BeginUpdate
         STA   L014E87
         JSL   L0200F2
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _EndUpdate
         STA   L014E87
         LDA   $2B
         STA   $31
         LDA   $2A
         STA   $30
         PLD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L020E29  ENT
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PEI   $1B
         PEI   $19
         _GetPortRect
         STA   L014E87
         PEI   $1B
         PEI   $19
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDA   $17
         STA   $1B
         LDA   $16
         STA   $1A
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L020E66  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L020E7B
         DEX
L020E7B  PHX
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L020E9B
         DEX
L020E9B  PHX
         PHA
         _NewHandle
         STA   L014E87
         PLA
         STA   $1A
         PLA
         STA   $1C
         LDA   L014E87
         PHA
         LDA   #$0049
         PHA
         JSL   L020000
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0050
         PHA
         JSL   L020000
         LDX   $1C
         LDA   $1A
         STX   $18
         STA   $16
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STX   $08
         STA   $06
         LDA   #$0000
         STA   [$06]
         LDY   #$0002
         LDA   #$0F0F
         STA   [$06],Y
         LDY   #$0004
         LDA   #$0000
         STA   [$06],Y
         LDY   #$0006
         LDA   #$F0FF
         STA   [$06],Y
         LDY   #$0008
         LDA   #$00F0
         STA   [$06],Y
         PHA
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$8010
         PHA
         _UniqueResourceID
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0020
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$0051
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         ORA   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         LDA   #$0000
         PHA
         LDA   #$8010
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _AddResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0052
         PHA
         JSL   L020000
         LDA   #$8010
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0053
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8010
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0054
         PHA
         JSL   L020000
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L02108E  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   #$0050
         STA   L0106A8
         LDA   #$0080
         CLC
         ADC   #$0020
         STA   L0106AA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0210B1
         DEX
L0210B1  STX   L0106AE
         STA   L0106AC
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0210C1
         DEX
L0210C1  STX   L0106B2
         STA   L0106B0
         LDA   #$0000
         STA   L0106B6
         LDA   #$0000
         STA   L0106B4
         LDA   #$0000
         STA   L0106BA
         LDA   #$0000
         STA   L0106B8
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0210E9
         DEX
L0210E9  STX   L0106BE
         STA   L0106BC
         LDA   #$0000
         STA   L0106C0
         LDA   #$0000
         STA   L0106C2
         LDA   #$0000
         STA   L0106C4
         LDA   #$0000
         STA   L0106C6
         LDA   #$0000
         STA   L0106C8
         LDA   #$0000
         STA   L0106CA
         LDA   #$0000
         STA   L0106CC
         LDA   #$0000
         STA   L0106CE
         LDA   #$0000
         STA   L0106D0
         LDA   #$0000
         STA   L0106D2
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021135
         DEX
L021135  STX   L0106D6
         STA   L0106D4
         LDA   #$0000
         STA   L0106D8
         STZ   L0106DC
         STZ   L0106DA
         STZ   L0106E0
         STZ   L0106DE
         STZ   L0106E4
         STZ   L0106E2
         LDA   #$0028
         STA   L0106E8
         LDA   #$001E
         STA   L0106E6
         LDA   #$01B8
         STA   L0106EC
         LDA   #$0082
         STA   L0106EA
         LDA   #$FFFF
         LDX   #$0000
         TAY
         BPL   L021175
         DEX
L021175  STX   L0106F0
         STA   L0106EE
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021185
         DEX
L021185  STX   L0106F4
         STA   L0106F2
         LDA   #$0000
         STA   L0106F6
         PHA
         PHA
         LDA   L0106A8
         LDX   #$0000
         TAY
         BPL   L02119D
         DEX
L02119D  PHX
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0211BD
         DEX
L0211BD  PHX
         PHA
         _NewHandle
         STA   L014E87
         PLA
         STA   L010706
         PLA
         STA   L010706+2
         LDA   L014E87
         PHA
         LDA   #$0055
         PHA
         JSL   L020000
         LDX   L010706+2
         LDA   L010706
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0056
         PHA
         JSL   L020000
         LDX   #^L0106A8
         LDA   #L0106A8
         PHX
         PHA
         LDX   L010706+2
         LDA   L010706
         PHX
         PHA
         LDA   L0106A8
         LDX   #$0000
         TAY
         BPL   L021215
         DEX
L021215  PHX
         PHA
         _PtrToHand
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0057
         PHA
         JSL   L020000
         PHA
         PHA
         LDA   #$FFFF
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         _UniqueResourceID
         STA   L014E87
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0038
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$0058
         PHA
         JSL   L020000
         LDX   L010706+2
         LDA   L010706
         PHX
         PHA
         LDA   #$0000
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _AddResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0059
         PHA
         JSL   L020000
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0060
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0061
         PHA
         JSL   L020000
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L021371  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   L010706
         PLA
         STA   L010706+2
         LDA   L014E87
         PHA
         LDA   #$0065
         PHA
         JSL   L020000
         LDX   L010706+2
         LDA   L010706
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0066
         PHA
         JSL   L020000
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L0213E7  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         LDA   $21
         BEQ   L0213F7
         BRL   L021490
L0213F7  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0064
         LDA   [$00],Y
         TAX
         LDY   #$0062
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         PEA   $0008
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _EraseRect
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0064
         LDA   [$00],Y
         TAX
         LDY   #$0062
         LDA   [$00],Y
         PHX
         PHA
         _DisposeControl
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   #$080B
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L02163D
L021490  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L020E29
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L0214C0
         BRL   L0214D0
L0214C0  LDA   #$0001
         PHA
         LDA   $16
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $16
L0214D0  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0214F3
         BRL   L02151B
L0214F3  LDA   #$0001
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $16
         SEC
         SBC   $01,S
         PLX
         STA   $16
L02151B  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         LDX   #$0000
         CMP   #$0000
         BEQ   L021542
         INX
L021542  TXA
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         LDX   #$0000
         CMP   #$0000
         BEQ   L02156B
         INX
L02156B  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L021575
         BRL   L021592
L021575  LDA   $1A
         SEC
         SBC   #$000C
         STA   $1A
         LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L0215A4
L021592  LDA   #$0000
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L0215A4  LDA   $1C
         SEC
         SBC   #$001A
         STA   $18
         PHA
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         PEA   $0600
         PEA   $0000
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0215E5
         DEX
L0215E5  PHX
         PHA
         PEA   $0000
         PEA   $0000
         _NewControl
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0062
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$0071
         PHA
         JSL   L020000
         LDA   #$0001
         PHA
         LDA   #$080B
         PHA
         _CheckMItem
         STA   L014E87
L02163D  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         LDA   $1F
         STA   $21
         LDA   $1E
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L021660  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         LDA   $21
         BEQ   L021670
         BRL   L021709
L021670  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0068
         LDA   [$00],Y
         TAX
         LDY   #$0066
         LDA   [$00],Y
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         PEA   $0008
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _EraseRect
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0068
         LDA   [$00],Y
         TAX
         LDY   #$0066
         LDA   [$00],Y
         PHX
         PHA
         _DisposeControl
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   #$080C
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L021838
L021709  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L020E29
         LDA   $1A
         SEC
         SBC   #$000D
         STA   $16
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         LDX   #$0000
         CMP   #$0000
         BEQ   L021745
         INX
L021745  TXA
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         LDX   #$0000
         CMP   #$0000
         BEQ   L02176E
         INX
L02176E  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L021778
         BRL   L021795
L021778  LDA   $1C
         SEC
         SBC   #$0018
         STA   $1C
         LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L0217A7
L021795  LDA   #$0000
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L0217A7  PHA
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$001C
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         PEA   $0600
         PEA   $0000
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0217E0
         DEX
L0217E0  PHX
         PHA
         PEA   $0000
         PEA   $0000
         _NewControl
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0066
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L014E87
         PHA
         LDA   #$0076
         PHA
         JSL   L020000
         pea   $0001
         pea   $080C
         _CheckMItem
L021838  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         LDA   $1F
         STA   $21
         LDA   $1E
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L02185B  TSC
         SEC
         SBC   #$006E
         TCS
         PHD
         INC
         TCD
         _WaitCursor
         JSL   L021371
         LDX   L010706+2
         LDA   L010706
         STX   $18
         STA   $16
         PHA
         PHA
         LDA   #$007A
         LDX   #$0000
         TAY
         BPL   L021888
         DEX
L021888  PHX
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDA   #$8000
         CLC
         ADC   #$4000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0218AC
         DEX
L0218AC  PHX
         PHA
         _NewHandle
         STA   L014E87
         PLA
         STA   L010702
         PLA
         STA   L010702+2
         LDA   L014E87
         PHA
         LDA   #$0079
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         _HLock
         PHA
         LDA   #$0080
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STX   $08
         STA   $06
         PEI   $08
         PEI   $06
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDY   #$0002
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y
         LDY   #$0006
         LDA   #$0000
         STA   [$06],Y
         PHA
         PHA
         _FrontWindow
         LDY   #$0008
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y
         LDY   #$0060
         LDA   #$0000
         STA   [$06],Y
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   #$0050
         LDX   #$0000
         TAY
         BPL   L021980
         DEX
L021980  PHX
         PHA
         _BlockMove
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021996
         DEX
L021996  PHX
         PHA
         LDY   #$0072
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y
         LDA   #$0050
         STA   $1A
         LDA   #$0080
         STA   $1C
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0219B7
         DEX
L0219B7  STX   $20
         STA   $1E
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0219C5
         DEX
L0219C5  STX   $24
         STA   $22
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         LDA   #$000C
         PHA
         LDA   #$0282
         PHA
         LDA   #$00C9
         PHA
         _SetRect
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0219FA
         DEX
L0219FA  STX   $30
         STA   $2E
         LDA   #$0000
         STA   $32
         LDA   #$0000
         STA   $34
         LDA   #$0000
         STA   $36
         LDA   #$0000
         STA   $38
         LDA   #$7D00
         STA   $3A
         LDA   #$7D00
         STA   $3C
         LDA   #$0000
         STA   $3E
         LDA   #$0000
         STA   $40
         LDA   #$0000
         STA   $42
         LDA   #$0000
         STA   $44
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021A3A
         DEX
L021A3A  STX   $48
         STA   $46
         LDA   #$0000
         STA   $4A
         LDA   #$0000
         STA   $4C
         LDA   #$0000
         STA   $4E
         LDA   #$0000
         STA   $50
         LDA   #$0000
         STA   $52
         LDA   #$0000
         STA   $54
         LDA   #$0000
         STA   $56
         PEA   $0000
         TDC
         CLC
         ADC   #$0058
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$003E
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $5A
         AND   #$0001
         BNE   L021A8A
         BRL   L021AA9
L021A8A  PEA   $0000
         TDC
         CLC
         ADC   #$0058
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0000
         PHA
         _OffsetRect
         STA   L014E87
L021AA9  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         AND   #$2000
         BNE   L021AC2
         BRL   L021AE8
L021AC2  PEA   $0000
         TDC
         CLC
         ADC   #$0058
         PHA
         LDA   #$000E
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0006
         EOR   #$FFFF
         INC
         PHA
         _InsetRect
         STA   L014E87
         BRL   L021BA9
L021AE8  PEA   $0000
         TDC
         CLC
         ADC   #$0058
         PHA
         LDA   #$0004
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         AND   #$8000
         BNE   L021B24
         BRL   L021B30
L021B24  LDA   $58
         SEC
         SBC   #$000D
         CLC
         ADC   #$0001
         STA   $58
L021B30  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         AND   #$0010
         BNE   L021B49
         BRL   L021B67
L021B49  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0030
         LDA   [$00],Y
         PHA
         LDA   $58
         SEC
         SBC   $01,S
         PLX
         CLC
         ADC   #$0001
         STA   $58
L021B67  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         AND   #$1000
         BNE   L021B80
         BRL   L021B88
L021B80  LDA   $5E
         CLC
         ADC   #$0018
         STA   $5E
L021B88  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         AND   #$0800
         BNE   L021BA1
         BRL   L021BA9
L021BA1  LDA   $5C
         CLC
         ADC   #$000C
         STA   $5C
L021BA9  LDA   #$FFFF
         LDX   #$0000
         TAY
         BPL   L021BB3
         DEX
L021BB3  STX   $62
         STA   $60
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021BC1
         DEX
L021BC1  STX   $66
         STA   $64
         LDA   #$0000
         STA   $68
         LDA   #$0000
         STA   $6A
         LDA   #$0000
         STA   $6C
         PHA
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$006A
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L021BE9
         DEX
L021BE9  PHX
         PHA
         LDX   #^L0200F2
         LDA   #L0200F2
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$800E
         PHA
         _NewWindow2
         STA   L014E87
         PLA
         STA   L01070A
         PLA
         STA   L01070A+2
         LDA   L014E87
         PHA
         LDA   #$0083
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0084
         PHA
         JSL   L020000
         JSL   L01000E
         LDA   L0106A6
         CLC
         ADC   #$0001
         STA   L0106A6
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDA   L01070A+2
         PHA
         LDA   L01070A
         PHA
         PLA
         CLC
         ADC   #$00A0
         PHA
         LDX   L01070A+2
         LDA   L01070A
         STA   $00
         STX   $02
         LDY   #$00A0
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$0004
         PHA
         _SetFontFlags
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _SetWRefCon
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L021D00
         BRL   L021D08
L021D00  LDA   #$0001
         PHA
         JSL   L0213E7
L021D08  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L021D2B
         BRL   L021D33
L021D2B  LDA   #$0001
         PHA
         JSL   L021660
L021D33  LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L040B72
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _ShowWindow
         STA   L014E87
         _InitCursor
         STA   L014E87
         PLD
         TSC
         CLC
         ADC   #$006E
         TCS
         RTL

L021D6B  TSC
         SEC
         SBC   #$002E
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         _GetMouse
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $20
         CLC
         ADC   #$0004
         STA   $24
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
	 beq   L021DF6
         LDA   L010700
         CMP   #$0002
         beq   L021DED
         JSL   L010202	; LOGO - resize cursor
L021DED  LDA   #$0002
         STA   L010700
         BRL   L022179
L021DF6  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $24
         SEC
         SBC   #$0004
         STA   $20
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L021E3A
         BRL   L021E52
L021E3A  LDA   L010700
         CMP   #$0001
         BNE   L021E45
         BRL   L021E49
L021E45  JSL   L010210
L021E49  LDA   #$0001
         STA   L010700
         BRL   L022179
L021E52  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $1E
         CLC
         ADC   #$0003
         STA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         beq   L021EAE
         LDA   L010700
         CMP   #$0002
         beq   L021EA5
         JSL   L010202	; LOGO - resize cursor
L021EA5  LDA   #$0002
         STA   L010700
         BRL   L022179
L021EAE  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $22
         SEC
         SBC   #$0003
         STA   $1E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L021EF2
         BRL   L021F0A
L021EF2  LDA   L010700
         CMP   #$0001
         BNE   L021EFD
         BRL   L021F01
L021EFD  JSL   L010210
L021F01  LDA   #$0001
         STA   L010700
         BRL   L022179
L021F0A  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L021F2D
         BRL   L021FC5
L021F2D  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         JSL   L020E29
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L021F5D
         BRL   L021F7C
L021F5D  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         pea   $0000
         pea   $000c
*         LDA   #$000D
*         SEC
*         SBC   #$0001
*         PHA
         _OffsetRect
L021F7C  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $1E
         SEC
         SBC   #$0001
*         STA   $22
*         LDA   $26
*         CMP   $22
	 cmp   $26
         bne   L021FC5
         LDA   L010700
         CMP   #$0003
         beq   L021FBC
         JSL   L01021E
L021FBC  LDA   #$0003
         STA   L010700
         BRL   L022179
L021FC5  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0060
         LDA   [$00],Y
         SEC
         SBC   #$0008
         BVS   L021FE9
         EOR   #$8000
L021FE9  BMI   L021FEE
         BRL   L022161
L021FEE  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$006A
         PHA
         PEA   $0008
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $24
         SEC
         SBC   #$0004
         STA   $20
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0060
         LDA   [$00],Y
         CMP   #$000E
         BNE   L022076
         BRL   L02210D
L022076  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         PLA
         beq   L0220B1
         LDA   L010700
         CMP   #$0001
         beq   L0220A8
         JSL   L010210
L0220A8  LDA   #$0001
         STA   L010700
         BRL   L022179
L0220B1  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $22
         SEC
         SBC   #$0003
         STA   $1E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         PLA
         beq   L02210D
         LDA   L010700
         CMP   #$0001
         beq   L022104
         JSL   L010210
L022104  LDA   #$0001
         STA   L010700
         bra   L022179
L02210D  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         PLA
         beq   L022161
         LDA   L010700
         CMP   #$0002
         beq   L022158
         JSL   L010202	; LOGO - resize cursor
L022158  LDA   #$0002
         STA   L010700
         bra   L022179
L022161  LDA   L010700
         beq   L022179
         _InitCursor
         stz   L010700
L022179  PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L022181  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         PLA
         STA   L01070A
         PLA
         STA   L01070A+2
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _SetPort
         STA   L014E87
         PHA
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _GetWRefCon
         STA   L014E87
         PLA
         STA   L010702
         PLA
         STA   L010702+2
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         PHA
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0038
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L022213  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         AND   #$8000
         BNE   L022233
         BRL   L022494
L022233  LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDA   [$00]
         STA   $1A
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         TAX
         LDY   #$0002
         LDA   [$00],Y
         STX   $1E
         STA   $1C
         PHA
         PHA
         LDA   $1A
         PHA
         LDX   $1E
         LDA   $1C
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   L010706
         PLA
         STA   L010706+2
         LDA   L014E87
         PHA
         LDA   #$009B
         PHA
         JSL   L020000
         LDX   L010706+2
         LDA   L010706
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$009C
         PHA
         JSL   L020000
         LDX   L010706+2
         LDA   L010706
         STX   $18
         STA   $16
         LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDA   #$0050
         LDX   #$0000
         TAY
         BPL   L0222D1
         DEX
L0222D1  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STX   $08
         STA   $06
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$003E
         PHA
         _GetPortRect
         STA   L014E87
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$003E
         PHA
         _LocalToGlobal
         STA   L014E87
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0042
         PHA
         _LocalToGlobal
         STA   L014E87
         LDY   #$0002
         LDA   [$06],Y
         AND   #$2000
         BNE   L022332
         BRL   L022351
L022332  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$003E
         PHA
         LDA   #$000E
         PHA
         LDA   #$0006
         PHA
         _InsetRect
         STA   L014E87
         BRL   L02242B
L022351  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$003E
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$06],Y
         AND   #$8000
         BNE   L02237A
         BRL   L02239D
L02237A  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$003E
         PHA
         LDA   #$0001
         PHA
         LDY   #$003E
         LDA   [$06],Y
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02239D  LDY   #$0002
         LDA   [$06],Y
         AND   #$0010
         BNE   L0223AA
         BRL   L0223D3
L0223AA  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$003E
         PHA
         LDA   #$0001
         PHA
         LDY   #$003E
         LDA   [$06],Y
         PHA
         LDY   #$0030
         LDA   [$06],Y
         CLC
         ADC   $01,S
         PLX
         SEC
         SBC   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0223D3  LDY   #$0002
         LDA   [$06],Y
         AND   #$1000
         BNE   L0223E0
         BRL   L0223FF
L0223E0  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0044
         PHA
         LDA   #$0018
         PHA
         LDY   #$0044
         LDA   [$06],Y
         SEC
         SBC   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0223FF  LDY   #$0002
         LDA   [$06],Y
         AND   #$0800
         BNE   L02240C
         BRL   L02242B
L02240C  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0042
         PHA
         LDA   #$000C
         PHA
         LDY   #$0042
         LDA   [$06],Y
         SEC
         SBC   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02242B  LDA   #$0001
         PHA
         LDA   $1A
         PHA
         LDX   $1E
         LDA   $1C
         PHX
         PHA
         _MarkResourceChange
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0098
         PHA
         JSL   L020000
         LDA   $1A
         PHA
         LDX   $1E
         LDA   $1C
         PHX
         PHA
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0099
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $1A
         PHA
         LDX   $1E
         LDA   $1C
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$009A
         PHA
         JSL   L020000
L022494  LDA   $21
         STA   $25
         LDA   $20
         STA   $24
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L0224A4  TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         JSL   L0206AF
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         AND   #$0100
         BNE   L0224D0
         BRL   L0224F8
L0224D0  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         EOR   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0224F8  LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _SetPort
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L022213
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _CloseWindow
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0101
         PHA
         JSL   L020000
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L0434E2
         PHA
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _FindHandle
         tax
         PLA
         STA   $16
         PLA
         STA   $18
         phx
         pea   $0104
         JSL   L020000
         LDX   $18
         LDA   $16
         PHX
         PHA
         _DisposeHandle
         PHA
         pea   $0105
         JSL   L020000
         LDA   L0106A6
         SEC
         SBC   #$0001
         STA   L0106A6
         LDA   L010700
         beq   L0225B0
L0225A0  _InitCursor
         stz   L010700
L0225B0  PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0225B8  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$6000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0050
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L022649  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDA   #$0002
         PHA
         _SetPenMode
         STA   L014E87
         JSL   L01060C
         LDA   $18
         PHA
         LDA   $25
         PHA
         _MoveTo
         STA   L014E87
         LDA   $1C
         PHA
         LDA   $25
         PHA
         _LineTo
         STA   L014E87
         _PenNormal
         STA   L014E87
         LDA   [$21]
         BNE   L0226C3
         BRL   L0226CB
L0226C3  LDA   #$0000
         STA   [$21]
         BRL   L0226D0
L0226CB  LDA   #$0001
         STA   [$21]
L0226D0  LDA   #$0000
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0103D4
         LDA   $1F
         STA   $25
         LDA   $1E
         STA   $24
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L02271B  TSC
         SEC
         SBC   #$002A
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $2F
         PEI   $2D
         PEA   $0008
         JSL   L014B1E
         LDA   #$0000
         STA   $28
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _GetMouse
         STA   L014E87
         LDA   $1E
         STA   $22
         PHA
         PHA
         LDA   $20
         PHA
         LDA   $1E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _PinRect
         STA   L014E87
         PLA
         STA   $24
         PLA
         STA   $26
         LDA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L022649
L022785  PHA
         LDA   #$0000
         PHA
         _StillDown
         STA   L014E87
         PLA
         BNE   L02279A
         BRL   L02289E
L02279A  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _GetMouse
         STA   L014E87
         LDA   $22
         CMP   $1E
         BNE   L0227B6
         BRL   L02289B
L0227B6  PHA
         PHA
         LDA   $20
         PHA
         LDA   $1E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _PinRect
         STA   L014E87
         PLA
         STA   $24
         PLA
         STA   $26
         LDA   $28
         BNE   L0227DE
         BRL   L0227EE
L0227DE  LDA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L022649
L0227EE  PHA
         LDX   $26
         LDA   $24
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         STA   $22
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$003C
         STA   $00
         STX   $02
         LDA   $22
         CLC
         ADC   #$0001
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L022847
         BRL   L02288B
L022847  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$003C
         PHA
         LDA   #$000D
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         SEC
         SBC   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02288B  LDA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L022649
L02289B  BRL   L022785
L02289E  LDA   $28
         BNE   L0228A5
         BRL   L0228B5
L0228A5  LDA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L022649
L0228B5  LDA   $2B
         STA   $2F
         LDA   $2A
         STA   $2E
         PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L0228C5  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L020E29
         LDA   $1C
         SEC
         SBC   #$001A
         STA   $18
         LDA   $1A
         SEC
         SBC   #$000D
         STA   $16
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _EraseRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L022919  TSC
         SEC
         SBC   #$0022
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0040
         PHA
         PEA   $0004
         JSL   L014B1E
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0042
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0040
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L0229B7
         BRL   L0229D2
L0229B7  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0000
         PHA
         LDA   #$000D
         PHA
         _OffsetRect
         STA   L014E87
L0229D2  LDA   $1A
         SEC
         SBC   #$0003
         STA   $1A
         LDA   $16
         CLC
         ADC   #$0003
         STA   $16
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L02271B
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L020E29
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _EraseRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _KillControls
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L040B72
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L022A6B
         BRL   L022A73
L022A6B  LDA   #$0001
         PHA
         JSL   L0213E7
L022A73  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L022A96
         BRL   L022A9E
L022A96  LDA   #$0001
         PHA
         JSL   L021660
L022A9E  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BNE   L022AC1
         BRL   L022ADA
L022AC1  JSL   L0228C5
         LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L022AEC
L022ADA  LDA   #$0000
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L022AEC  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0040
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0004
         JSL   L014B1E
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PLD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L022B3A  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L022B66
         BRL   L022B76
L022B66  LDA   #$0000
         PHA
         JSL   L0213E7
         LDA   #$0001
         PHA
         JSL   L0213E7
L022B76  PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L022B7E  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L022BAA
         BRL   L022BBA
L022BAA  LDA   #$0000
         PHA
         JSL   L021660
         LDA   #$0001
         PHA
         JSL   L021660
L022BBA  PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L022BC2  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         _SetRect
         STA   L014E87
         PHA
         LDY   #$0002
         LDA   [$21],Y
         PHA
         LDA   [$21]
         PHA
         PLA
         CLC
         ADC   #$0018
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _EqualRect
         STA   L014E87
         PLA
         BNE   L022C17
         BRL   L022C4F
L022C17  LDA   #$0806
         PHA
         _DisableMItem
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         LDA   #$000C
         PHA
         LDA   #$0282
         PHA
         LDA   #$00C9
         PHA
         _SetRect
         STA   L014E87
         BRL   L022D02
L022C4F  LDA   #$0806
         PHA
         _EnableMItem
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDY   #$0002
         LDA   [$21],Y
         PHA
         LDA   [$21]
         PHA
         PLA
         CLC
         ADC   #$0018
         PHA
         PEA   $0008
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L022CB8
         BRL   L022CC0
L022CB8  LDA   $16
         SEC
         SBC   #$000D
         STA   $16
L022CC0  LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L022CD9
         BRL   L022CE1
L022CD9  LDA   $1C
         CLC
         ADC   #$0018
         STA   $1C
L022CE1  LDY   #$0002
         LDA   [$21],Y
         TAX
         LDA   [$21]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L022CFA
         BRL   L022D02
L022CFA  LDA   $1A
         CLC
         ADC   #$000D
         STA   $1A
L022D02  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDX   $27
         LDA   $25
         PHX
         PHA
         _SetZoomRect
         STA   L014E87
         LDA   $1F
         STA   $27
         LDA   $1E
         STA   $26
         PLD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L022D2B  TSC
         SEC
         SBC   #$0056
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $1E
         PLA
         STA   $20
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _SetPort
         STA   L014E87
         PHA
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _GetWRefCon
         STA   L014E87
         PLA
         STA   $22
         PLA
         STA   $24
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0001
         BEQ   L022DA7
         BRL   L022F12
L022DA7  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0206AF
         LDX   $24
         LDA   $22
         PHX
         PHA
         JSL   L022213
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         EOR   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   L010700
         BNE   L022DFC
         BRL   L022E06
L022DFC  _InitCursor
         STA   L014E87
L022E06  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L022E1F
         BRL   L022F0F
L022E1F  PHA
         PHA
         LDA   #$8010
         PHA
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $34
         PLA
         STA   $36
         LDA   L014E87
         BEQ   L022E56
         BRL   L022EB1
L022E56  LDX   $36
         LDA   $34
         PHX
         PHA
         _HLock
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$34],Y
         PHA
         LDA   [$34]
         PHA
         PEA   $000A
         JSL   L014B1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8010
         PHA
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         BRL   L022ECA
L022EB1  LDA   #$0000
         STA   $26
         LDA   #$0F0F
         STA   $28
         LDA   #$0000
         STA   $2A
         LDA   #$F0FF
         STA   $2C
         LDA   #$00F0
         STA   $2E
L022ECA  PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         JSL   L030171
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         JSL   L0304C5
L022F0F  BRL   L02382B
L022F12  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L020E29
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003E
         LDA   [$00],Y
         CMP   #$0006
         BNE   L022F5E
         BRL   L022F8C
L022F5E  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDA   #$0001
         PHA
         LDA   $16
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $1A
         BRL   L023614
L022F8C  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0050
         LDA   [$00],Y
         LDX   #$0000
         CMP   #$8004
         BNE   L022FA4
         INX
L022FA4  TXA
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L022FB0
         DEX
L022FB0  LDY   #$0000
         CMP   L0106FC
         BNE   L022FBB
         CPX   L0106FE
L022FBB  BNE   L022FBE
         INY
L022FBE  TYA
         AND   $01,S
         PLX
         TAX
         BNE   L022FC8
         BRL   L0232AD
L022FC8  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0030
         LDA   [$00],Y
         PHA
         LDY   #$002E
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L022FE8
         DEX
L022FE8  LDY   #$0001
         CMP   $01,S
         BEQ   L022FF0
         DEY
L022FF0  TXA
         CMP   $03,S
         BEQ   L022FF8
         LDY   #$0000
L022FF8  PLA
         PLA
         TYA
         BEQ   L023000
         BRL   L0232AA
L023000  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0054
         LDA   [$00],Y
         TAX
         LDY   #$0052
         LDA   [$00],Y
         PHX
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         JSL   L04116F
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$6000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         _GetPortRect
         STA   L014E87
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L023098
         BRL   L0230B6
L023098  PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         LDA   #$000B
         PHA
         LDA   #$0005
         PHA
         _InsetRect
         STA   L014E87
         BRL   L0230FA
L0230B6  PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L0230EA
         BRL   L0230FA
L0230EA  LDA   #$0001
         PHA
         LDA   $42
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $42
L0230FA  PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         _SetPortRect
         STA   L014E87
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0054
         LDA   [$00],Y
         TAX
         LDY   #$0052
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $52
         PLA
         STA   $54
         LDA   #$8004
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0054
         LDA   [$00],Y
         TAX
         LDY   #$0052
         LDA   [$00],Y
         PHX
         PHA
         _DetachResource
         STA   L014E87
         LDY   #$0002
         LDA   [$52],Y
         TAX
         LDA   [$52]
         STA   $00
         STX   $02
         LDY   #$0010
         LDA   [$00],Y
         PHA
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$8500
         LDY   #$0001
         CMP   $01,S
         BEQ   L023185
         DEY
L023185  TXA
         CMP   $03,S
         BEQ   L02318D
         LDY   #$0000
L02318D  PLA
         PLA
         TYA
         BNE   L023195
         BRL   L02321D
L023195  LDY   #$0002
         LDA   [$52],Y
         TAX
         LDA   [$52]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         PLA
         AND   #$0000
         PHA
         LDA   $03,S
         AND   #$0010
         STA   $03,S
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0231C3
         DEX
L0231C3  LDY   #$0001
         CMP   $01,S
         BEQ   L0231CB
         DEY
L0231CB  TXA
         CMP   $03,S
         BEQ   L0231D3
         LDY   #$0000
L0231D3  PLA
         PLA
         TYA
         BNE   L0231DB
         BRL   L02321D
L0231DB  LDY   #$0002
         LDA   [$52],Y
         TAX
         LDA   [$52]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         PLA
         ORA   #$0000
         PHA
         LDA   $03,S
         ORA   #$0010
         STA   $03,S
         LDY   #$0002
         LDA   [$52],Y
         PHA
         LDA   [$52]
         PHA
         PLA
         CLC
         ADC   #$001A
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L02321D  PHA
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         LDA   #$0001
         PHA
         LDX   $54
         LDA   $52
         PHX
         PHA
         _NewControl2
         STA   L014E87
         PLA
         STA   $30
         PLA
         STA   $32
         LDX   $32
         LDA   $30
         PHX
         PHA
         _HideControl
         STA   L014E87
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0054
         LDA   [$00],Y
         TAX
         LDY   #$0052
         LDA   [$00],Y
         PHX
         PHA
         LDX   $32
         LDA   $30
         PHX
         PHA
         _SetCtlRefCon
         STA   L014E87
         LDX   $32
         LDA   $30
         PHX
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         JSL   L0409AD	; LOGO - called when new control is added
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         _SetPortRect
         STA   L014E87
L0232AA  BRL   L0235C8
L0232AD  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0050
         LDA   [$00],Y
         CMP   #$8010
         BEQ   L0232C4
         BRL   L0232C7
L0232C4  BRL   L0235C8
L0232C7  PHA
         LDX   L0106FE
         LDA   L0106FC
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L0232E4
         INX
L0232E4  TXA
         PHA
         PHA
         LDX   L0106FE
         LDA   L0106FC
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L023303
         INX
L023303  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L02330D
         BRL   L023310
L02330D  BRL   L023614
L023310  PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         _GetPortRect
         STA   L014E87
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L02334F
         BRL   L02336D
L02334F  PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         LDA   #$000B
         PHA
         LDA   #$0005
         PHA
         _InsetRect
         STA   L014E87
         BRL   L0233B1
L02336D  PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L0233A1
         BRL   L0233B1
L0233A1  LDA   #$0001
         PHA
         LDA   $42
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $42
L0233B1  PEA   $0000
         TDC
         CLC
         ADC   #$0042
         PHA
         _SetPortRect
         STA   L014E87
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   L0106FE
         LDA   L0106FC
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $4A
         PLA
         STA   $4C
         LDX   $4C
         LDA   $4A
         PHX
         PHA
         _HLock
         STA   L014E87
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$4A],Y
         TAX
         LDA   [$4A]
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         TAX
         LDY   #$0002
         LDA   [$00],Y
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _HideControl
         STA   L014E87
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$4A],Y
         TAX
         LDA   [$4A]
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         TAX
         LDY   #$0002
         LDA   [$00],Y
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _DisposeControl
         STA   L014E87
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   L0106FE
         LDA   L0106FC
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $52
         PLA
         STA   $54
         LDA   #$8004
         PHA
         LDX   L0106FE
         LDA   L0106FC
         PHX
         PHA
         _DetachResource
         STA   L014E87
         LDY   #$0002
         LDA   [$52],Y
         TAX
         LDA   [$52]
         STA   $00
         STX   $02
         LDY   #$0010
         LDA   [$00],Y
         PHA
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$8500
         LDY   #$0001
         CMP   $01,S
         BEQ   L0234B6
         DEY
L0234B6  TXA
         CMP   $03,S
         BEQ   L0234BE
         LDY   #$0000
L0234BE  PLA
         PLA
         TYA
         BNE   L0234C6
         BRL   L02354E
L0234C6  LDY   #$0002
         LDA   [$52],Y
         TAX
         LDA   [$52]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         PLA
         AND   #$0000
         PHA
         LDA   $03,S
         AND   #$0010
         STA   $03,S
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0234F4
         DEX
L0234F4  LDY   #$0001
         CMP   $01,S
         BEQ   L0234FC
         DEY
L0234FC  TXA
         CMP   $03,S
         BEQ   L023504
         LDY   #$0000
L023504  PLA
         PLA
         TYA
         BNE   L02350C
         BRL   L02354E
L02350C  LDY   #$0002
         LDA   [$52],Y
         TAX
         LDA   [$52]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDY   #$001A
         LDA   [$00],Y
         PHA
         PLA
         ORA   #$0000
         PHA
         LDA   $03,S
         ORA   #$0010
         STA   $03,S
         LDY   #$0002
         LDA   [$52],Y
         PHA
         LDA   [$52]
         PHA
         PLA
         CLC
         ADC   #$001A
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
L02354E  PHA
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         LDA   #$0001
         PHA
         LDX   $54
         LDA   $52
         PHX
         PHA
         _NewControl2
         STA   L014E87
         PLA
         STA   $30
         PLA
         STA   $32
         LDA   L014E87
         PHA
         LDA   #$0125
         PHA
         JSL   L020000
         LDX   L0106FE
         LDA   L0106FC
         PHX
         PHA
         LDX   $32
         LDA   $30
         PHX
         PHA
         _SetCtlRefCon
         STA   L014E87
         LDX   $32
         LDA   $30
         PHX
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         JSL   L0409AD
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         _SetPortRect
         STA   L014E87
L0235C8  LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0235D2
         DEX
L0235D2  STX   L0106FE
         STA   L0106FC
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0235E2
         DEX
L0235E2  PHX
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L023614  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L023640
         BRL   L0236C1
L023640  LDA   #$0807
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$0808
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$0809
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$080A
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$080B
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$080C
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$080D
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$0805
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$0806
         PHA
         _DisableMItem
         STA   L014E87
         BRL   L02380A
L0236C1  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L0236DA
         BRL   L02375E
L0236DA  LDA   #$0001
         PHA
         LDA   #$0807
         PHA
         _CheckMItem
         STA   L014E87
         LDA   #$0808
         PHA
         _EnableMItem
         STA   L014E87
         LDA   #$0809
         PHA
         _EnableMItem
         STA   L014E87
         LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$4000
         BNE   L023721
         BRL   L023733
L023721  LDA   #$0001
         PHA
         LDA   #$0808
         PHA
         _CheckMItem
         STA   L014E87
L023733  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0100
         BNE   L02374C
         BRL   L02375E
L02374C  LDA   #$0001
         PHA
         LDA   #$0809
         PHA
         _CheckMItem
         STA   L014E87
L02375E  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L023777
         BRL   L023789
L023777  LDA   #$0001
         PHA
         LDA   #$080A
         PHA
         _CheckMItem
         STA   L014E87
L023789  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L0237A2
         BRL   L0237B4
L0237A2  LDA   #$0001
         PHA
         LDA   #$080B
         PHA
         _CheckMItem
         STA   L014E87
L0237B4  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L0237CD
         BRL   L0237DF
L0237CD  LDA   #$0001
         PHA
         LDA   #$080C
         PHA
         _CheckMItem
         STA   L014E87
L0237DF  LDY   #$0002
         LDA   [$22],Y
         TAX
         LDA   [$22]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BNE   L0237F8
         BRL   L02380A
L0237F8  LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L02380A  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         JSL   L022BC2
L02382B  LDX   $20
         LDA   $1E
         PHX
         PHA
         _SetPort
         STA   L014E87
         PLD
         TSC
         CLC
         ADC   #$0056
         TCS
         RTL

L023843  TSC
         SEC
         SBC   #$0044
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         PEI   $49
         PEI   $47
         PEA   $0008
         JSL   L014B1E
         LDA   #$0000
         STA   $16
         LDA   #$0001
         STA   $28
         PEA   $0000
         TDC
         CLC
         ADC   #$002E
         PHA
         JSL   L020E29
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         PHA
         PHA
         LDA   #$8010
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PEA   $000A
         JSL   L014B1E
         LDA   L014E87
         BNE   L0238D1
         BRL   L0238EA
L0238D1  LDA   #$0000
         STA   $3A
         LDA   #$0F0F
         STA   $3C
         LDA   #$0000
         STA   $3E
         LDA   #$F0FF
         STA   $40
         LDA   #$00F0
         STA   $42
L0238EA  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8010
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         TAX
         LDY   #$0020
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   $3C
         PHA
         JSL   L0104A0
         PHA
         _SetForeColor
         STA   L014E87
         LDA   $3E
         PHA
         JSL   L0104A0
         PHA
         _SetBackColor
         STA   L014E87
         PHA
         PHA
         _GetFont
         STA   L014E87
         PLA
         STA   $36
         PLA
         STA   $38
         PHA
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         LDX   #$0000
         TAY
         BPL   L023969
         DEX
L023969  PHX
         PHA
         _SetWindowIcons
         STA   L014E87
         _SetFont
         STA   L014E87
         LDA   $4B
         BEQ   L023986
         BRL   L0239A1
L023986  LDA   $30
         CLC
         ADC   #$000A
         PHA
         LDA   $2E
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
         BRL   L0239B9
L0239A1  LDA   $34
         SEC
         SBC   #$001E
         PHA
         LDA   $2E
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
L0239B9  LDA   #$0001
         PHA
         _DrawChar
         STA   L014E87
L0239C7  PHA
         LDA   #$0000
         PHA
         _Button
         STA   L014E87
         PLA
         BNE   L0239DC
         BRL   L023A85
L0239DC  PEA   $0000
         TDC
         CLC
         ADC   #$002A
         PHA
         _GetMouse
         STA   L014E87
         LDA   $4B
         BEQ   L0239F6
         BRL   L023A11
L0239F6  LDA   $30
         CLC
         ADC   #$000A
         PHA
         LDA   $2E
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
         BRL   L023A29
L023A11  LDA   $34
         SEC
         SBC   #$001E
         PHA
         LDA   $2E
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
L023A29  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$002A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BEQ   L023A4C
         BRL   L023A68
L023A4C  LDA   $28
         BNE   L023A53
         BRL   L023A60
L023A53  LDA   $4B
         PHA
         _DrawChar
         STA   L014E87
L023A60  LDA   #$0000
         STA   $28
         BRL   L023A82
L023A68  LDA   $28
         BEQ   L023A6F
         BRL   L023A7D
L023A6F  LDA   #$0001
         PHA
         _DrawChar
         STA   L014E87
L023A7D  LDA   #$0001
         STA   $28
L023A82  BRL   L0239C7
L023A85  PEA   $0000
         TDC
         CLC
         ADC   #$002A
         PHA
         _GetMouse
         STA   L014E87
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$002A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L023ABB
         BRL   L023B11
L023ABB  LDA   $28
         CMP   #$0001
         BEQ   L023AC5
         BRL   L023B0C
L023AC5  LDA   $4B
         BEQ   L023ACC
         BRL   L023AE7
L023ACC  LDA   $30
         CLC
         ADC   #$000A
         PHA
         LDA   $2E
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
         BRL   L023AFF
L023AE7  LDA   $34
         SEC
         SBC   #$001E
         PHA
         LDA   $2E
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
L023AFF  LDA   $4B
         PHA
         _DrawChar
         STA   L014E87
L023B0C  LDA   #$0001
         STA   $16
L023B11  LDX   $38
         LDA   $36
         PHX
         PHA
         _SetFont
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$0136
         PHA
         JSL   L020000
         LDA   #$0000
         PHA
         _SetForeColor
         STA   L014E87
         LDA   #$FFFF
         PHA
         _SetBackColor
         STA   L014E87
         LDA   $45
         STA   $4B
         LDA   $44
         STA   $4A
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$004A
         TCS
         TXA
         RTL

L023B5C  TSC
         SEC
         SBC   #$0036
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L020E29
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         PEA   $0004
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         _GlobalToLocal
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         STA   $00
         STX   $02
         LDY   #$00C8
         LDA   [$00],Y
         TAX
         LDY   #$00C6
         LDA   [$00],Y
         STX   $34
         STA   $32
L023BBC  LDA   $32
         ORA   $34
         BNE   L023BC5
         BRL   L023F5C
L023BC5  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         PEA   $0008
         JSL   L014B1E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L023C07
         BRL   L023F41
L023C07  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0064
         LDA   [$00],Y
         TAX
         LDY   #$0062
         LDA   [$00],Y
         CMP   $32
         BNE   L023C2E
         CPX   $34
L023C2E  BEQ   L023C33
         BRL   L023C36
L023C33  BRL   L023F5C
L023C36  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0068
         LDA   [$00],Y
         TAX
         LDY   #$0066
         LDA   [$00],Y
         CMP   $32
         BNE   L023C5D
         CPX   $34
L023C5D  BEQ   L023C62
         BRL   L023C65
L023C62  BRL   L023F5C
L023C65  PHA
         PHA
         LDX   $34
         LDA   $32
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         PLA
         STA   $2A
         PLA
         STA   $2C
         PHA
         LDX   $2C
         LDA   $2A
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$00E0
         BEQ   L023C97
         BRL   L023CFF
L023C97  LDY   #$0002
         LDA   [$32],Y
         TAX
         LDA   [$32]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         STX   $30
         STA   $2E
         PHA
         LDX   $30
         LDA   $2E
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0600
         BEQ   L023CCD
         INX
L023CCD  TXA
         PHA
         PHA
         LDX   $30
         LDA   $2E
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BEQ   L023CEA
         INX
L023CEA  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L023CF4
         BRL   L023CF7
L023CF4  BRL   L023F5C
L023CF7  LDX   $2C
         LDA   $2A
         STX   $34
         STA   $32
L023CFF  PHA
         LDX   $2C
         LDA   $2A
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L023D1A
         INX
L023D1A  TXA
         PHA
         PHA
         LDX   $2C
         LDA   $2A
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L023D37
         INX
L023D37  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L023D41
         BRL   L023D44
L023D41  BRL   L023F5C
L023D44  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L023D5B
         BRL   L023E6A
L023D5B  PHA
         PHA
         LDX   $34
         LDA   $32
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         PLA
         STA   $2A
         PLA
         STA   $2C
         PHA
         LDX   $2C
         LDA   $2A
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L023D8E
         INX
L023D8E  TXA
         PHA
         PHA
         LDX   $2C
         LDA   $2A
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L023DAB
         INX
L023DAB  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L023DB5
         BRL   L023DB8
L023DB5  BRL   L024B7D
L023DB8  PHA
         PHA
         LDX   $34
         LDA   $32
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         PLA
         STA   L0106FC
         PLA
         STA   L0106FE
         LDY   #$0002
         LDA   [$32],Y
         TAX
         LDA   [$32]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         PHA
         LDY   #$0014
         LDA   [$00],Y
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   L0106FE
         PHA
         LDA   L0106FC
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8004
         STA   [$00]
         BRL   L023F3E
L023E6A  LDX   $34
         LDA   $32
         STX   $2C
         STA   $2A
         PHA
         LDX   $2C
         LDA   $2A
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L023E8D
         INX
L023E8D  TXA
         PHA
         PHA
         LDX   $2C
         LDA   $2A
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L023EAA
         INX
L023EAA  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L023EB4
         BRL   L023EB7
L023EB4  BRL   L023F5C
L023EB7  PHA
         PHA
         LDX   $34
         LDA   $32
         PHX
         PHA
         _GetCtlID
         STA   L014E87
         PLA
         STA   $2A
         PLA
         STA   $2C
         LDA   L014E87
         BNE   L023ED7
         BRL   L023EDA
L023ED7  BRL   L023F5C
L023EDA  LDX   $34
         LDA   $32
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDA   L010700
         PHA
         JSL   L041C02
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L023F3E  BRL   L024B7D
L023F41  LDY   #$0002
         LDA   [$32],Y
         TAX
         LDA   [$32]
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STX   $34
         STA   $32
         BRL   L023BBC
L023F5C  PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         PEA   $0004
         JSL   L014B1E
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         JSL   L0206AF
         LDA   L010700
         BRL   L024B5D
L023F8C  PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         _GlobalToLocal
         STA   L014E87
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L023FC2
         BRL   L0242BE
L023FC2  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$4000
         BNE   L023FE5
         BRL   L02407D
L023FE5  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $20
         CLC
         ADC   #$000E
         STA   $20
         LDA   $20
         CLC
         ADC   #$000C
         STA   $24
         LDA   #$0005
         STA   $1E
         LDA   #$000A
         STA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L02403B
         BRL   L02407D
L02403B  LDA   #$0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         JSL   L023843
         TAX
         BNE   L024052
         BRL   L02407A
L024052  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02407A  BRL   L024B7D
L02407D  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0100
         BNE   L0240A0
         BRL   L02412E
L0240A0  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $24
         SEC
         SBC   #$000E
         STA   $24
         LDA   $24
         SEC
         SBC   #$000C
         STA   $20
         LDA   #$0005
         STA   $1E
         LDA   #$000A
         STA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L0240F6
         BRL   L02412E
L0240F6  LDA   #$0002
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         JSL   L023843
         TAX
         BNE   L02410D
         BRL   L02412B
L02410D  LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _ZoomWindow
         STA   L014E87
         JSL   L022B3A
         JSL   L022B7E
         JSL   L0228C5
L02412B  BRL   L024B7D
L02412E  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $1E
         CLC
         ADC   #$000D
         STA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L024172
         BRL   L0242AE
L024172  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L024189
         BRL   L024250
L024189  LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         JSL   L010C92
         TAX
         BNE   L0241AB
         BRL   L02424D
L0241AB  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$6000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8006
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDY   #$0010
         LDA   [$00],Y
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02424D  BRL   L0242AB
L024250  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L0403A5
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0001
         PHA
         JSL   L0208DC
L0242AB  BRL   L024B7D
L0242AE  LDA   #$0001
         PHA
         LDA   $16
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $16
L0242BE  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0242E1
         BRL   L0243CD
L0242E1  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $1E
         STA   $22
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L02433D
         BRL   L0243A5
L02433D  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L024354
         BRL   L024391
L024354  LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L0114EF
         TAX
         BNE   L024366
         BRL   L02438E
L024366  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02438E  BRL   L0243A2
L024391  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0002
         PHA
         JSL   L0208DC
L0243A2  BRL   L024B7D
L0243A5  LDA   #$0001
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $16
         SEC
         SBC   $01,S
         PLX
         STA   $16
L0243CD  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L0243F0
         BRL   L024A81
L0243F0  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L024413
         BRL   L024521
L024413  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $24
         SEC
         SBC   #$001A
         STA   $20
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         LDX   #$0000
         CMP   #$0000
         BEQ   L02445B
         INX
L02445B  TXA
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         LDX   #$0000
         CMP   #$0000
         BEQ   L024484
         INX
L024484  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L02448E
         BRL   L024496
L02448E  LDA   $22
         SEC
         SBC   #$000C
         STA   $22
L024496  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L0244B9
         BRL   L024521
L0244B9  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L0244D0
         BRL   L02450D
L0244D0  LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L01240E
         TAX
         BNE   L0244E2
         BRL   L02450A
L0244E2  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02450A  BRL   L02451E
L02450D  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0004
         PHA
         JSL   L0208DC
L02451E  BRL   L024B7D
L024521  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L024544
         BRL   L024652
L024544  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $22
         SEC
         SBC   #$000D
         STA   $1E
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         LDX   #$0000
         CMP   #$0000
         BEQ   L02458C
         INX
L02458C  TXA
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         LDX   #$0000
         CMP   #$0000
         BEQ   L0245B5
         INX
L0245B5  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L0245BF
         BRL   L0245C7
L0245BF  LDA   $24
         SEC
         SBC   #$0018
         STA   $24
L0245C7  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L0245EA
         BRL   L024652
L0245EA  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L024601
         BRL   L02463E
L024601  LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L012A14
         TAX
         BNE   L024613
         BRL   L02463B
L024613  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02463B  BRL   L02464F
L02463E  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0005
         PHA
         JSL   L0208DC
L02464F  BRL   L024B7D
L024652  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BNE   L024675
         BRL   L02479C
L024675  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $22
         SEC
         SBC   #$000D
         STA   $1E
         LDA   $24
         SEC
         SBC   #$001A
         STA   $20
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _PtInRect
         STA   L014E87
         PLA
         BNE   L0246C1
         BRL   L02479C
L0246C1  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L0246D8
         BRL   L024715
L0246D8  LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L013002
         TAX
         BNE   L0246EA
         BRL   L024712
L0246EA  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024712  BRL   L024799
L024715  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L04067F
         JSL   L022B3A
         JSL   L022B7E
         JSL   L0228C5
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         JSL   L020E29
         LDA   $22
         SEC
         SBC   #$000D
         STA   $1E
         LDA   $24
         SEC
         SBC   #$001A
         STA   $20
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0006
         PHA
         JSL   L0208DC
L024799  BRL   L024B7D
L02479C  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L0247B3
         BRL   L024953
L0247B3  LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         JSL   L0206AF
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L0117D4
         TAX
         BNE   L0247D1
         BRL   L0247F9
L0247D1  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0247F9  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L02481C
         BRL   L024950
L02481C  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L02483F
         BRL   L0248B6
L02483F  LDA   #$0000
         PHA
         JSL   L0213E7
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$1000
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0248B6  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L0248D9
         BRL   L024950
L0248D9  LDA   #$0000
         PHA
         JSL   L021660
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         PHA
         LDA   #$FFFF
         SEC
         SBC   #$0800
         AND   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024950  BRL   L024A81
L024953  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L0403A5
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BNE   L0249C0
         BRL   L024A1A
L0249C0  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BEQ   L0249E3
         BRL   L024A1A
L0249E3  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BEQ   L024A06
         BRL   L024A1A
L024A06  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0007
         PHA
         JSL   L0208DC
         BRL   L024B7D
L024A1A  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L024A3D
         BRL   L024A45
L024A3D  LDA   $1C
         SEC
         SBC   #$0018
         STA   $1C
L024A45  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L024A68
         BRL   L024A70
L024A68  LDA   $1A
         SEC
         SBC   #$000C
         STA   $1A
L024A70  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$0003
         PHA
         JSL   L0208DC
L024A81  BRL   L024B7D
L024A84  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L0403A5
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024B7D
L024AD1  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$000A
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L04067F
         JSL   L022B3A
         JSL   L022B7E
         JSL   L0228C5
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024B7D
L024B2A  JSL   L022919
         JSL   L022B3A
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L024B7D
L024B5D  CMP   #$0004
         BCC   L024B65
         LDA   #$0004
L024B65  ASL
         TAX
         LDAL  L024B73,X
         BEQ   L024B6F
         PHA
         RTS

L024B6F  JSL   L014F19
L024B73  DA    L023F8C-1
         DA    L024AD1-1
         DA    L024A84-1
         DA    L024B2A-1
         DW    $0000

L024B7D  PLD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L024B85  ENT
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHB
         PHB
         PLA
         STA   $06
         PEA   >L01068E
         PLB
         PLB
         PHA
         PHA
         _GetPort
         STA   L014E87
         _DrawControls
         STA   L014E87
         LDA   $06
         PHA
         PLB
         PLB
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L024BBB  TSC
         SEC
         SBC   #$005C
         TCS
         PHD
         INC
         TCD
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L022213
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         STA   $16
         PLA
         STA   $18
         PHA
         PHA
         LDA   #$800E
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   L010698
         PLA
         STA   L010698+2
         LDX   L010698+2
         LDA   L010698
         PHX
         PHA
         _HLock
         STA   L014E87
         PEA   ^L020687
         PEA   L020687
         LDX   L010698+2
         LDA   L010698
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0036
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         PHA
         PHA
         LDA   #$8010
         PHA
         LDX   L010698+2
         LDA   L010698
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $58
         PLA
         STA   $5A
         LDA   L014E87
         BNE   L024C92
         BRL   L024CB3
L024C92  LDA   #$0000
         STA   L01068E
         LDA   #$0F0F
         STA   L010690
         LDA   #$0000
         STA   L010692
         LDA   #$F0FF
         STA   L010694
         LDA   #$00F0
         STA   L010696
         bra   L024CD9
L024CB3  pei   $5A
         pei   $58
         _HLock
         PEA   ^L01068E
         PEA   L01068E
         LDY   #$0002
         LDA   [$58],Y
         PHA
         LDA   [$58]
         PHA
         PEA   $000A
         JSL   L014B1E
L024CD9  LDX   L010698+2
         LDA   L010698
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$004E
         LDA   [$00],Y
         AND   #$0800
         BNE   L024CFC
         BRL   L024D3B
L024CFC  LDX   L010698+2
         LDA   L010698
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$004E
         PHA
         LDX   L010698+2
         LDA   L010698
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$004E
         LDA   [$00],Y
         EOR   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L024D3B  PEA   ^L01068E
         PEA   L01068E
         LDX   L010698+2
         LDA   L010698
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         JSL   L01063D
         pea   $0004
         _SetFontFlags
         LDX   L01069C+2
         LDA   L01069C
         PHX
         PHA
         _ShowWindow
         pei   $18
         pei   $16
         _HideWindow
L024D9D  LDA   #$B706
         STA   $32
         LDA   #$001F
         STA   $34
         PHA
         pea   $0002
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _EventAvail
         PLA
         beq   L024E03
L024DC5  PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         pei   $2A
         pei   $28
         _FindWindow
         PLA
         CMP   #$001B
         BEQ   L024DE8
         BRL   L024E03
L024DE8  LDX   L01069C+2
         LDA   L01069C
         CMP   $1A
         BNE   L024DF4
         CPX   $1C
L024DF4  BEQ   L024DF9
         BRL   L024E03
L024DF9  LDA   #$7FFF
         STA   $32
         LDA   #$001F
         STA   $34
L024E03  LDA   #$0000
         STA   $4C
         PHA
         pea   $FFFF
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _TaskMaster
         PLA
         STA   $4E
         bra   L024E80
L024E28  LDA   #$0001
         STA   $4C
         BRL   L024EAA
L024E30  PEA   $0000
         TDC
         CLC
         ADC   #$0050
         PHA
         pea   $0000
         pea   $0000
         pea   $0280
         pea   $00C8
         _SetRect
         pea   $0000
         pei   $2A
         pei   $28
         pea   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$0050
         PHA
         pei   $30
         pei   $2E
         _DragWindow
L024E7D  bra   L024EAA
L024E80  SEC
         SBC   #$0010
         CMP   #$0007
         BCC   L024E8C
         LDA   #$0007
L024E8C  ASL
         TAX
         LDAL  L024E9A,X
         BEQ   L024E96
         PHA
         RTS

L024E96  JSL   L014F19
L024E9A  DA    L024E28-1
         DA    L024E28-1
         DA    L024E7D-1
         DA    L024E7D-1
         DA    L024E30-1
         DA    L024E7D-1
         DA    L024E28-1
         DA    L024E7D-1

L024EAA  LDA   $4C
         BNE   L024EB1
         BRL   L024D9D
L024EB1  pei   $18
         pei   $16
         _ShowWindow
         LDX   L01069C+2
         LDA   L01069C
         PHX
         PHA
         _CloseWindow
         pei   $18
         pei   $16
         _SelectWindow
         pei   $18
         pei   $16
         _SetPort
         PLD
         TSC
         CLC
         ADC   #$005C
         TCS
         RTL

L024EFB  TSC
         SEC
         SBC   #$0022
         TCS
         PHD
         INC
         TCD
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0074
         LDA   [$00],Y
         TAX
         LDY   #$0072
         LDA   [$00],Y
         STX   $20
         STA   $1E
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         JSL   L0206AF
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         JSL   L020E29
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         BRL   L026153

* 804 Zoom window

L024F68  LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _ZoomWindow
         JSL   L022B3A
         JSL   L022B7E
         JSL   L0228C5
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 807 Title bar

L024FB1  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BEQ   L025013
         BRL   L0252B2
L025013  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$4000
         BNE   L025036
         BRL   L025087
L025036  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$4000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$0000
         PHA
         LDA   #$0808
         PHA
         _CheckMItem
         STA   L014E87
L025087  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0100
         BNE   L0250AA
         BRL   L0250FB
L0250AA  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$0000
         PHA
         LDA   #$0809
         PHA
         _CheckMItem
         STA   L014E87
L0250FB  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDY   #$0010
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L025127
         DEX
L025127  LDY   #$0001
         CMP   $01,S
         BEQ   L02512F
         DEY
L02512F  TXA
         CMP   $03,S
         BEQ   L025137
         LDY   #$0000
L025137  PLA
         PLA
         TYA
         BEQ   L02513F
         BRL   L02525D
L02513F  LDA   #$8006
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _RemoveResource
         STA   L014E87
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$1000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8006
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDY   #$0010
         LDA   [$00],Y
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0251F4
         DEX
L0251F4  PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0010
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         EOR   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L02525D  LDA   #$0000
         PHA
         LDA   #$0807
         PHA
         _CheckMItem
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   #$0808
         PHA
         _CheckMItem
         STA   L014E87
         LDA   #$0000
         PHA
         LDA   #$0809
         PHA
         _CheckMItem
         STA   L014E87
         LDA   #$0808
         PHA
         _DisableMItem
         STA   L014E87
         LDA   #$0809
         PHA
         _DisableMItem
         STA   L014E87
         BRL   L02537C
L0252B2  LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         PEA   ^L026F9F
         PEA   L026F9F
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA
         JSL   L010A0E
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$6000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8006
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         PHA
         LDY   #$0010
         LDA   [$00],Y
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   #$0001
         PHA
         LDA   #$0807
         PHA
         _CheckMItem
         STA   L014E87
         LDA   #$0808
         PHA
         _EnableMItem
         STA   L014E87
         LDA   #$0809
         PHA
         _EnableMItem
         STA   L014E87
L02537C  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _EraseRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _KillControls
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L040B72
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L0253EB
         BRL   L0253F3
L0253EB  LDA   #$0001
         PHA
         JSL   L0213E7
L0253F3  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L025416
         BRL   L02541E
L025416  LDA   #$0001
         PHA
         JSL   L021660
L02541E  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BNE   L025441
         BRL   L02545A
L025441  JSL   L0228C5
         pea   $0001
         pea   $080D
         _CheckMItem
         bra   L02546C
L02545A  pea   $0000
         pea   $080D
         _CheckMItem
L02546C  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 80A Info bar

L025497  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0010
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0254F9
         BRL   L02552D
L0254F9  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$003C
         STA   $00
         STX   $02
         LDA   #$000D
         STA   [$00]
         LDA   #$0001
         PHA
         LDA   #$080A
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L02555E
L02552D  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$003C
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         LDA   #$0000
         PHA
         LDA   #$080A
         PHA
         _CheckMItem
         STA   L014E87
L02555E  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L025581
         BRL   L025589
L025581  LDA   $16
         CLC
         ADC   #$000D
         STA   $16
L025589  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _EraseRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _KillControls
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L040B72
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L0255F8
         BRL   L025600
L0255F8  LDA   #$0001
         PHA
         JSL   L0213E7
L025600  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L025623
         BRL   L02562B
L025623  LDA   #$0001
         PHA
         JSL   L021660
L02562B  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BNE   L02564E
         BRL   L025667
L02564E  JSL   L0228C5
         LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L025679
L025667  LDA   #$0000
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L025679  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 80B Right scroll bar

L0256A4  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$1000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L025706
         BRL   L0257B6
L025706  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L025729
         BRL   L0257B6
L025729  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BEQ   L02574C
         BRL   L0257A4
L02574C  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         JSL   L0228C5
         LDA   #$0000
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L0257B6
L0257A4  LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L0257B6  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         PHA
         JSL   L0213E7
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L0257FC
         BRL   L025800
L0257FC  JSL   L022B7E
L025800  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 80C Bottom scroll bar

L02582B  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L02588D
         BRL   L02593D
L02588D  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L0258B0
         BRL   L02593D
L0258B0  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BEQ   L0258D3
         BRL   L02592B
L0258D3  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         JSL   L0228C5
         LDA   #$0000
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L02593D
L02592B  LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L02593D  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         PHA
         JSL   L021660
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L025983
         BRL   L025987
L025983  JSL   L022B3A
L025987  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 80D Size box

L0259B2  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         JSL   L0228C5
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0400
         BEQ   L025A18
         BRL   L025B15
L025A18  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         LDX   #$0000
         CMP   #$0000
         BEQ   L025A3F
         INX
L025A3F  TXA
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         LDX   #$0000
         CMP   #$0000
         BEQ   L025A68
         INX
L025A68  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L025A72
         BRL   L025B00
L025A72  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$1000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$0000
         PHA
         JSL   L0213E7
         LDA   #$0000
         PHA
         JSL   L021660
L025B00  LDA   #$0000
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L025B27
L025B15  LDA   #$0001
         PHA
         LDA   #$080D
         PHA
         _CheckMItem
         STA   L014E87
L025B27  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$1000
         BNE   L025B4A
         BRL   L025B4E
L025B4A  JSL   L022B3A
L025B4E  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L025B71
         BRL   L025B75
L025B71  JSL   L022B7E
L025B75  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 802 Edit colors

L025BA0  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         PHA
         LDY   #$0020
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L025BF4
         DEX
L025BF4  LDY   #$0001
         CMP   $01,S
         BEQ   L025BFC
         DEY
L025BFC  TXA
         CMP   $03,S
         BEQ   L025C04
         LDY   #$0000
L025C04  PLA
         PLA
         TYA
         BNE   L025C0C
         BRL   L025C10
L025C0C  JSL   L020E66
L025C10  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0022
         LDA   [$00],Y
         PHA
         LDY   #$0020
         LDA   [$00],Y
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8010
         STA   [$00]
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$6000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 803 Add control

L025C8D  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L025CBF
         DEX
L025CBF  PHX
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0052
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$8004
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L025CFB
         DEX
L025CFB  STX   L0106FE
         STA   L0106FC
L025D04  BRL   L026F97
L025D07  pei   $20
         pei   $1E
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L042E6F
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L025D23
         DEX
L025D23  PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
*         PHA
*         PLA
         CLC
         ADC   #$0072
*         PHA
*         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
*         PHA
*         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$6000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L025D92
         DEX
L025D92  PHX
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
*         PHA
*         PLA
         CLC
         ADC   #$0052
*         PHA
*         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
*         PHA
*         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 808 Close box

L025DDC  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$4000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$4000
         BNE   L025E3E
         BRL   L025E53
L025E3E  pea   $0001
         pea   $0808
         _CheckMItem
         bra   L025E65
L025E53  pea   $0000
         pea   $0808
         _CheckMItem
L025E65  LDA   $18
         CLC
         ADC   #$0023
         STA   $1C
         LDA   $16
         CLC
         ADC   #$000A
         STA   $1A
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 809 Zoom box

L025EB3  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$000E
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         EOR   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0100
         BNE   L025F15
         BRL   L025F2A
L025F15  LDA   #$0001
         PHA
         LDA   #$0809
         PHA
         _CheckMItem
         STA   L014E87
         BRL   L025F3C
L025F2A  LDA   #$0000
         PHA
         LDA   #$0809
         PHA
         _CheckMItem
         STA   L014E87
L025F3C  LDA   $1C
         SEC
         SBC   #$0023
         STA   $18
         LDA   $16
         CLC
         ADC   #$000A
         STA   $1A
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _InvalRect
         STA   L014E87
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 805 Set zoom rect

L025F8A  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         CLC
         ADC   #$000C
         STX   $08
         STA   $06
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$000C
         PHA
         _GetPortRect
         STA   L014E87
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$06],Y
         AND   #$8000
         BNE   L025FE1
         BRL   L025FFC
L025FE1  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$000C
         PHA
         LDY   #$000C
         LDA   [$06],Y
         CLC
         ADC   #$000D
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L025FFC  LDY   #$0002
         LDA   [$06],Y
         AND   #$1000
         BNE   L026009
         BRL   L026028
L026009  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0012
         PHA
         LDA   #$0018
         PHA
         LDY   #$0012
         LDA   [$06],Y
         SEC
         SBC   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L026028  LDY   #$0002
         LDA   [$06],Y
         AND   #$0800
         BNE   L026035
         BRL   L026054
L026035  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0010
         PHA
         LDA   #$000D
         PHA
         LDY   #$0010
         LDA   [$06],Y
         SEC
         SBC   $01,S
         PLX
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L026054  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$000C
         PHA
         _LocalToGlobal
         STA   L014E87
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0010
         PHA
         _LocalToGlobal
         STA   L014E87
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$0806
         PHA
         _EnableMItem
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L022BC2
         BRL   L026F97

* 806 Clear zoom rect

L0260C9  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0018
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         PHA
         _SetRect
         STA   L014E87
         LDA   #$0806
         PHA
         _DisableMItem
         STA   L014E87
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L022BC2
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L026F97

* 80E Test window

L026149  JSL   L024BBB

L026150  BRL   L026F97

L026153  SEC
         SBC   #$00FB
         CMP   #$0714
         BCC   L02615F
         LDA   #$0714
L02615F  ASL
         TAX
         LDAL  L02616D,X
         BEQ   L026169
         PHA
         RTS

L026169  JSL   L014F19

L02616D  DA    L025D04-1
         DA    L025D04-1
         DA    L025D04-1
         DA    L025D07-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L026150-1
         DA    L025BA0-1	; 802 Edit colors
         DA    L025C8D-1	; 803 Add control
         DA    L024F68-1	; 804 Zoom window
         DA    L025F8A-1	; 805 Set zoom rect
         DA    L0260C9-1	; 806 Clear zoom rect
         DA    L024FB1-1	; 807 Title bar
         DA    L025DDC-1	; 808 Close box
         DA    L025EB3-1	; 809 Zoom box
         DA    L025497-1	; 80A Info bar
         DA    L0256A4-1	; 80B Right scroll bar
         DA    L02582B-1	; 80C Bottom scroll bar
         DA    L0259B2-1	; 80D Size box
         DA    L026149-1	; 80E Test window
         DA    L026150-1	; 80F

L026F97  PLD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L026F9F  STR   ' Title '
         DB    $00
L026FA8  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         TAX
         LDY   #$0002
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         STA   $16
         LDA   $16
         CMP   #$001B
         BEQ   L026FE0
         BRL   L026FEC
L026FE0  LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         JSL   L0206AF
L026FEC  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0800
         BNE   L027003
         BRL   L0271ED
L027003  LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0060
         LDA   [$00],Y
         BRL   L0271C5
L027021  BRL   L0271ED
L027024  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         PEA   $0000
         TDC
         CLC
         ADC   #$0018
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0018
         PHA
         _LocalToGlobal
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$001C
         PHA
         _LocalToGlobal
         STA   L014E87
         LDA   $16
         CMP   #$0008
         BEQ   L02708F
         BRL   L0270C3
L02708F  LDA   #$0004
         SEC
         SBC   $1E
         BEQ   L02709E
         BVS   L02709C
         EOR   #$8000
L02709C  BMI   L0270A1
L02709E  BRL   L0270A4
L0270A1  BRL   L0271ED
L0270A4  LDA   $1A
         SEC
         SBC   #$0002
         PHA
         LDA   $18
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _MoveWindow
         STA   L014E87
         BRL   L027180
L0270C3  LDA   $16
         CMP   #$000A
         BEQ   L0270CD
         BRL   L027101
L0270CD  LDA   $18
         SEC
         SBC   #$00C6
         BEQ   L0270DC
         BVS   L0270DA
         EOR   #$8000
L0270DA  BMI   L0270DF
L0270DC  BRL   L0270E2
L0270DF  BRL   L0271ED
L0270E2  LDA   $1A
         PHA
         LDA   $18
         CLC
         ADC   #$0001
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _MoveWindow
         STA   L014E87
         BRL   L027180
L027101  LDA   $16
         CMP   #$000B
         BEQ   L02710B
         BRL   L02713F
L02710B  LDA   #$0011
         SEC
         SBC   $1C
         BEQ   L02711A
         BVS   L027118
         EOR   #$8000
L027118  BMI   L02711D
L02711A  BRL   L027120
L02711D  BRL   L0271ED
L027120  LDA   $1A
         PHA
         LDA   $18
         SEC
         SBC   #$0001
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _MoveWindow
         STA   L014E87
         BRL   L027180
L02713F  LDA   $16
         CMP   #$0015
         BEQ   L027149
         BRL   L02717D
L027149  LDA   $1A
         SEC
         SBC   #$027C
         BEQ   L027158
         BVS   L027156
         EOR   #$8000
L027156  BMI   L02715B
L027158  BRL   L02715E
L02715B  BRL   L0271ED
L02715E  LDA   $1A
         CLC
         ADC   #$0002
         PHA
         LDA   $18
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _MoveWindow
         STA   L014E87
         BRL   L027180
L02717D  BRL   L0271ED
L027180  BRL   L0271ED
L027183  LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDA   $16
         PHA
         JSL   L042683
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         BRL   L0271ED
L0271C5  CMP   #$0008
         BCC   L0271CD
         LDA   #$0008
L0271CD  ASL
         TAX
         LDAL  L0271DB,X
         BEQ   L0271D7
         PHA
         RTS

L0271D7  JSL   L014F19
L0271DB  DA    L027021-1
         DA    L027021-1
         DA    L027021-1
         DA    L027024-1
         DA    L027021-1
         DA    L027021-1
         DA    L027021-1
         DA    L027024-1
         DA    L027183-1

L0271ED  PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L0271F5  ENT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$004E
         LDA   [$00],Y
         STA   L0106A4
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003E
         LDA   [$00],Y
         BRL   L027539
L027222  LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L02726A
         DEX
L02726A  LDY   #$0001
         CMP   $01,S
         BEQ   L027272
         DEY
L027272  TXA
         CMP   $03,S
         BEQ   L02727A
         LDY   #$0000
L02727A  PLA
         PLA
         TYA
         BNE   L027282
         BRL   L0272B2
L027282  JSL   L02108E
         JSL   L0225B8
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0272B2  JSL   L02185B
         BRL   L027561
L0272B9  LDX   #^L01070E
         LDA   #L01070E
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L027571
         PEA   L027571
         LDA   #$0012
         PHA
         JSL   L014B68
         PEA   ^L01070E
         PEA   L01070E
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         BRL   L027561
L0272F9  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$004A
         LDA   [$00],Y
         CMP   #$0008
         BEQ   L027310
         BRL   L027317
L027310  JSL   L022D2B
         BRL   L027396
L027317  JSL   L022181
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$004A
         LDA   [$00],Y
         BRL   L02734C
L02732D  JSL   L0224A4
         BRL   L027396
L027334  JSL   L023B5C
         BRL   L027396
L02733B  JSL   L024EFB
         BRL   L027396
L027342  JSL   L026FA8
         BRL   L027396
L027349  BRL   L027396
L02734C  SEC
         SBC   #$0003
         CMP   #$0017
         BCC   L027358
         LDA   #$0017
L027358  ASL
         TAX
         LDAL  L027366,X
         BEQ   L027362
         PHA
         RTS

L027362  JSL   L014F19
L027366  DA    L027342-1
         DA    L027349-1
         DA    L027342-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L027349-1
         DA    L02733B-1
         DA    L027349-1
         DA    L027334-1
         DA    L027349-1
         DA    L027349-1
         DA    L02732D-1
         DA    L027349-1
         DA    L027349-1
         DA    L02733B-1
         DA    L027349-1

L027396  BRL   L027561
L027399  LDA   #$0000
         STA   L0106A6
         LDA   #$0000
         STA   L010700
         LDX   #^L01070E
         LDA   #L01070E
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L027583
         PEA   L027583
         LDA   #$0006
         PHA
         JSL   L014B68
         PEA   ^L01070E
         PEA   L01070E
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$002E
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L0106A0+2
         LDA   L0106A0
         CLC
         ADC   #$0036
         STA   $00
         STX   $02
         LDA   #$800E
         STA   [$00]
         JSL   L01004E
         PHX
         PHA
         LDA   L0106A0+2
         PHA
         LDA   L0106A0
         PHA
         PLA
         CLC
         ADC   #$0032
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$005C
         LDA   [$00],Y
         TAX
         LDY   #$005A
         LDA   [$00],Y
         STX   L0106FA
         STA   L0106F8
         LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         JSL   L040000
         BRL   L027561
L027451  JSL   L022181
         JSL   L0224A4
         BRL   L027561
L02745C  PHA
         PHA
         _FrontWindow
         STA   L014E87
         PLA
         STA   L01070A
         PLA
         STA   L01070A+2
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _SetPort
         STA   L014E87
         PHA
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         _GetWRefCon
         STA   L014E87
         PLA
         STA   L010702
         PLA
         STA   L010702+2
         JSL   L021D6B
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0060
         LDA   [$00],Y
         beq   L027514
L0274C2  LDX   L0106A0+2
         LDA   L0106A0
         STA   $00
         STX   $02
         LDY   #$0008
         LDA   [$00],Y
         TAX
         LDY   #$0006
         LDA   [$00],Y
         PHX
         PHA
         LDA   #$0000
         PHA
         LDX   L010702+2
         LDA   L010702
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$005E
         LDA   [$00],Y
         TAX
         LDY   #$005C
         LDA   [$00],Y
         PHX
         PHA
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         LDX   L0106FA
         LDA   L0106F8
         PHX
         PHA
         JSL   L010419
L027514  BRL   L027561
L027517  JSL   L022181
         LDX   L01070A+2
         LDA   L01070A
         PHX
         PHA
         JSL   L0206AF
         LDX   L010702+2
         LDA   L010702
         PHX
         PHA
         JSL   L022213
L027536  BRL   L027561
L027539  CMP   #$0008
         BCC   L027541
         LDA   #$0008
L027541  ASL
         TAX
         LDAL  L02754F,X
         BEQ   L02754B
         PHA
         RTS

L02754B  JSL   L014F19

L02754F  DA    L027222-1
         DA    L0272B9-1
         DA    L0272F9-1
         DA    L027399-1
         DA    L027451-1
         DA    L02745C-1
         DA    L0272F9-1
         DA    L027517-1
         DA    L027536-1

L027561  LDA   #$0000
         STA   $16
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         TXA
         RTL

L027571  ASC   'Window editor v1.2'
L027583  ASC   'Window'

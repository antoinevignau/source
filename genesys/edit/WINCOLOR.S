*
* Genesys v1.2.4
* Window editor
*

         mx    %00
         rel
         lst   off

*----------------------------

	 use   4/Ctl.Macs
         use   4/Int.Macs
         use   4/QD.Macs
	 use   4/QDAux.Macs
	 use   4/Resource.Macs
         use   4/Util.Macs
	 use   4/Window.Macs
	 
*----------------------------

         EXT   L014B1E
         EXT   L014E87
         EXT   L014B68
         EXT   L014ADD
         EXT   L014A35
         EXT   L0105BB
         EXT   L0104A0
         EXT   L0104D5
         EXT   L01050A
         EXT   L01090E
         EXT   L01485A
         EXT   L01497D
         EXT   L0153AF
	
*----------------------------

L030000  ENT
         TSC
         SEC
         SBC   #$004A
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $4F
         PEI   $4D
         PEA   $000A
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDA   $16
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPenPat
         STA   L014E87
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _SetPenSize
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _FrameRect
         STA   L014E87
         LDA   $4B
         STA   $4F
         LDA   $4A
         STA   $4E
         PLD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL

L0300B1  ENT
         TSC
         SEC
         SBC   #$004A
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $4F
         PEI   $4D
         PEA   $000A
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDA   $16
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPenPat
         STA   L014E87
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _SetPenSize
         STA   L014E87
         LDA   #$000E
         STA   $24
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _FrameRect
         STA   L014E87
         _PenNormal
         STA   L014E87
         LDA   $4B
         STA   $4F
         LDA   $4A
         STA   $4E
         PLD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL

L030171  ENT
         TSC
         SEC
         SBC   #$004A
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $4F
         PEI   $4D
         PEA   $000A
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDA   #$000D
         STA   $24
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         PLX
         LDY   #$0001
         CMP   $01,S
         BEQ   L0301E3
         DEY
L0301E3  TXA
         CMP   $03,S
         BEQ   L0301EB
         LDY   #$0000
L0301EB  PLA
         PLA
         TYA
         BNE   L0301F3
         BRL   L0301FD
L0301F3  LDA   $1A
         AND   #$000F
         STA   $48
         BRL   L03020C
L0301FD  LDA   $18
         AND   #$0F00
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         STA   $48
L03020C  LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _FillRect
         STA   L014E87
         _PenNormal
         STA   L014E87
         LDA   $4B
         STA   $4F
         LDA   $4A
         STA   $4E
         PLD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL

L030255  ENT
         TSC
         SEC
         SBC   #$004A
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $4F
         PEI   $4D
         PEA   $000A
         JSL   L014B1E
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         PLX
         LDY   #$0001
         CMP   $01,S
         BEQ   L030294
         DEY
L030294  TXA
         CMP   $03,S
         BEQ   L03029C
         LDY   #$0000
L03029C  PLA
         PLA
         TYA
         BEQ   L0302A4
         BRL   L0302A7
L0302A4  BRL   L0303AB
L0302A7  LDA   $1A
         AND   #$0200
         BEQ   L0302B1
         BRL   L0302B4
L0302B1  BRL   L0303AB
L0302B4  PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0006
         PHA
         LDA   #$0004
         PHA
         _InsetRect
         STA   L014E87
         LDA   $1A
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPenPat
         STA   L014E87
         LDA   $22
         PHA
         LDA   $20
         PHA
         _MoveTo
         STA   L014E87
         LDA   $26
         PHA
         LDA   $20
         PHA
         _LineTo
         STA   L014E87
         LDA   $22
         PHA
         LDA   $20
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
         LDA   $26
         PHA
         LDA   $20
         CLC
         ADC   #$0002
         PHA
         _LineTo
         STA   L014E87
         LDA   $22
         PHA
         LDA   $20
         CLC
         ADC   #$0004
         PHA
         _MoveTo
         STA   L014E87
         LDA   $26
         PHA
         LDA   $20
         CLC
         ADC   #$0004
         PHA
         _LineTo
         STA   L014E87
         LDA   $22
         PHA
         LDA   $20
         CLC
         ADC   #$0006
         PHA
         _MoveTo
         STA   L014E87
         LDA   $26
         PHA
         LDA   $20
         CLC
         ADC   #$0006
         PHA
         _LineTo
         STA   L014E87
L0303AB  _PenNormal
         STA   L014E87
         LDA   $4B
         STA   $4F
         LDA   $4A
         STA   $4E
         PLD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL

L0303C5  ENT
         TSC
         SEC
         SBC   #$004C
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $51
         PEI   $4F
         PEA   $000A
         JSL   L014B1E
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         PLX
         LDY   #$0001
         CMP   $01,S
         BEQ   L030404
         DEY
L030404  TXA
         CMP   $03,S
         BEQ   L03040C
         LDY   #$0000
L03040C  PLA
         PLA
         TYA
         BEQ   L030414
         BRL   L030417
L030414  BRL   L0304AB
L030417  LDA   $1A
         AND   #$0100
         BEQ   L030421
         BRL   L030424
L030421  BRL   L0304AB
L030424  PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDA   #$000D
         STA   $24
         LDA   $1A
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $1A
         AND   #$000F
         STA   $4A
         LDA   $48
         PHA
         LDA   $4A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPenPat
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _FillRect
         STA   L014E87
L0304AB  _PenNormal
         STA   L014E87
         LDA   $4D
         STA   $51
         LDA   $4C
         STA   $50
         PLD
         TSC
         CLC
         ADC   #$0050
         TCS
         RTL

L0304C5  ENT
         TSC
         SEC
         SBC   #$002C
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $37
         PEI   $35
         PEA   $000A
         JSL   L014B1E
         LDA   $33
         AND   #$8000
         BEQ   L0304EC
         BRL   L0304EF
L0304EC  BRL   L0308B8
L0304EF  PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         PHA
         PHA
         _FrontWindow
         STA   L014E87
         PHA
         PHA
         _GetPort
         STA   L014E87
         PLA
         PLX
         LDY   #$0001
         CMP   $01,S
         BEQ   L03053F
         DEY
L03053F  TXA
         CMP   $03,S
         BEQ   L030547
         LDY   #$0000
L030547  PLA
         PLA
         TYA
         BNE   L03054F
         BRL   L030576
L03054F  LDA   $18
         PHA
         JSL   L0104A0
         PHA
         _SetForeColor
         STA   L014E87
         LDA   $1A
         PHA
         JSL   L0104A0
         PHA
         _SetBackColor
         STA   L014E87
         BRL   L03059A
L030576  LDA   $18
         PHA
         JSL   L0104D5
         PHA
         _SetForeColor
         STA   L014E87
         LDA   $18
         PHA
         JSL   L01050A
         PHA
         _SetBackColor
         STA   L014E87
L03059A  PHA
         PHA
         _GetFont
         STA   L014E87
         PLA
         STA   $28
         PLA
         STA   $2A
         PHA
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         LDX   #$0000
         TAY
         BPL   L0305BC
         DEX
L0305BC  PHX
         PHA
         _SetWindowIcons
         STA   L014E87
         _SetFont
         STA   L014E87
         LDA   $33
         AND   #$4000
         BNE   L0305DC
         BRL   L030602
L0305DC  LDA   $22
         CLC
         ADC   #$000A
         PHA
         LDA   $20
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
         LDA   #$0000
         PHA
         _DrawChar
         STA   L014E87
L030602  LDA   $33
         AND   #$0100
         BNE   L03060C
         BRL   L030632
L03060C  LDA   $26
         SEC
         SBC   #$001E
         PHA
         LDA   $20
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
         LDA   #$0002
         PHA
         _DrawChar
         STA   L014E87
L030632  LDX   $2A
         LDA   $28
         PHX
         PHA
         _SetFont
         STA   L014E87
         PHA
         LDX   $31
         LDA   $2F
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L03065D
         INX
L03065D  TXA
         PHA
         PHA
         LDX   $31
         LDA   $2F
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L03067A
         INX
L03067A  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L030684
         BRL   L030687
L030684  BRL   L0308B8
L030687  LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         LDA   #$FF01
         PHA
         PHA
         PHA
         LDA   #$8006
         PHA
         LDX   $31
         LDA   $2F
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
         LDA   #$FF01
         PHA
         JSL   L014B68
         LDA   L014E87
         BNE   L0306C8
         BRL   L0306CB
L0306C8  BRL   L0308B8
L0306CB  LDA   $33
         AND   #$4000
         BNE   L0306D5
         BRL   L0306E0
L0306D5  LDA   $22
         CLC
         ADC   #$0020
         STA   $22
         BRL   L0306E8
L0306E0  LDA   $22
         CLC
         ADC   #$000A
         STA   $22
L0306E8  LDA   $33
         AND   #$0100
         BNE   L0306F2
         BRL   L0306FD
L0306F2  LDA   $26
         SEC
         SBC   #$0020
         STA   $26
         BRL   L030705
L0306FD  LDA   $26
         SEC
         SBC   #$000A
         STA   $26
L030705  LDA   $22
         SEC
         SBC   $26
         BEQ   L030713
         BVS   L030711
         EOR   #$8000
L030711  BMI   L030716
L030713  BRL   L030719
L030716  BRL   L0308B8
L030719  LDA   $26
         SEC
         SBC   $22
         PHA
         PHA
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         _StringWidth
         STA   L014E87
         PLA
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L030741
         BVS   L03073F
         EOR   #$8000
L03073F  BMI   L030744
L030741  BRL   L0307FF
L030744  LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L030900
         PEA   L030900
         LDA   #$0003
         PHA
         LDA   #$0002
         PHA
         JSL   L01485A
         JSL   L014B68
         JSL   L014A35
L030776  LDA   $26
         SEC
         SBC   $22
         PHA
         PHA
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         _StringWidth
         STA   L014E87
         PLA
         LDX   #$0001
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0307A1
         BVS   L03079F
         EOR   #$8000
L03079F  BMI   L0307A2
L0307A1  DEX
L0307A2  TXA
         PHA
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014ADD
         LDX   #$0001
         SEC
         SBC   #$0004
         BEQ   L0307C4
         BVS   L0307C2
         EOR   #$8000
L0307C2  BMI   L0307C5
L0307C4  DEX
L0307C5  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L0307CF
         BRL   L0307FF
L0307CF  LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDA   #$0004
         PHA
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         LDA   #$FF01
         PHA
         JSL   L014ADD
         SEC
         SBC   $01,S
         PLX
         PHA
         LDA   #$0001
         PHA
         JSL   L01497D
         BRL   L030776
L0307FF  LDA   $26
         SEC
         SBC   $22
         PHA
         PHA
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         _StringWidth
         STA   L014E87
         PLA
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L030827
         BVS   L030825
         EOR   #$8000
L030825  BMI   L03082A
L030827  BRL   L03082D
L03082A  BRL   L0308B8
L03082D  LDA   $33
         AND   #$4000
         BNE   L030837
         BRL   L030842
L030837  LDA   $22
         SEC
         SBC   #$0020
         STA   $22
         BRL   L03084A
L030842  LDA   $22
         SEC
         SBC   #$000A
         STA   $22
L03084A  LDA   $33
         AND   #$0100
         BNE   L030854
         BRL   L03085F
L030854  LDA   $26
         CLC
         ADC   #$0020
         STA   $26
         BRL   L030867
L03085F  LDA   $26
         CLC
         ADC   #$000A
         STA   $26
L030867  PHA
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         _StringWidth
         STA   L014E87
         PLA
         LDX   #$0002
         JSL   L0153AF
         PHA
         LDA   $26
         SEC
         SBC   $22
         LDX   #$0002
         JSL   L0153AF
         SEC
         SBC   $01,S
         PLX
         CLC
         ADC   #$0002
         PHA
         LDA   #$000B
         PHA
         _MoveTo
         STA   L014E87
         LDX   #^L01090E
         LDA   #L01090E
         PHX
         PHA
         _DrawString
         STA   L014E87
L0308B8  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDX   $31
         LDA   $2F
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   #$0000
         PHA
         _SetForeColor
         STA   L014E87
         LDA   #$FFFF
         PHA
         _SetBackColor
         STA   L014E87
         LDA   $2D
         STA   $37
         LDA   $2C
         STA   $36
         PLD
         TSC
         CLC
         ADC   #$0036
         TCS
         RTL

L030900  ROL   $2E2E
L030903  ENT
         TSC
         SEC
         SBC   #$004C
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $55
         PEI   $53
         PEA   $000A
         JSL   L014B1E
         LDA   $4F
         AND   #$0010
         BEQ   L03092A
         BRL   L03092D
L03092A  BRL   L030A51
L03092D  PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDA   $4F
         AND   #$8000
         BNE   L030965
         BRL   L030980
L030965  PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0000
         PHA
         LDA   #$000C
         PHA
         _OffsetRect
         STA   L014E87
L030980  LDA   $20
         CLC
         ADC   $51
         STA   $24
         LDA   $16
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPenPat
         STA   L014E87
         LDA   $22
         PHA
         LDA   #$0001
         PHA
         LDA   $20
         CLC
         ADC   $51
         SEC
         SBC   $01,S
         PLX
         PHA
         _MoveTo
         STA   L014E87
         LDA   $26
         SEC
         SBC   #$0001
         PHA
         LDA   #$0001
         PHA
         LDA   $20
         CLC
         ADC   $51
         SEC
         SBC   $01,S
         PLX
         PHA
         _LineTo
         STA   L014E87
         _PenNormal
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         LDA   $1E
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _FillRect
         STA   L014E87
L030A51  LDA   $4D
         STA   $55
         LDA   $4C
         STA   $54
         PLD
         TSC
         CLC
         ADC   #$0054
         TCS
         RTL

L030A61  ENT
         TSC
         SEC
         SBC   #$002C
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
         PEA   $000A
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         _InsetRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   $26
         SEC
         SBC   #$001A
         PHA
         LDA   $24
         SEC
         SBC   #$000D
         PHA
         LDA   $26
         PHA
         LDA   $24
         PHA
         _SetRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   $16
         PHA
         JSL   L0104D5
         PHA
         LDA   $1C
         PHA
         JSL   L0104D5
         PHA
         _SpecialRect
         STA   L014E87
         LDA   #$0004
         PHA
         _SetTextMode
         STA   L014E87
         PHA
         PHA
         _GetFont
         STA   L014E87
         PLA
         STA   $28
         PLA
         STA   $2A
         PHA
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         LDX   #$0000
         TAY
         BPL   L030B26
         DEX
L030B26  PHX
         PHA
         _SetCtlIcons
         STA   L014E87
         _SetFont
         STA   L014E87
         LDA   $22
         CLC
         ADC   #$0004
         PHA
         LDA   $20
         CLC
         ADC   #$0002
         PHA
         _MoveTo
         STA   L014E87
         LDA   #$0010
         PHA
         _DrawChar
         STA   L014E87
         LDX   $2A
         LDA   $28
         PHX
         PHA
         _SetFont
         STA   L014E87
         LDA   #$0000
         PHA
         _SetTextMode
         STA   L014E87
         LDA   $2D
         STA   $31
         LDA   $2C
         STA   $30
         PLD
         TSC
         CLC
         ADC   #$0030
         TCS
         RTL

L030B90  ENT
         TSC
         SEC
         SBC   #$004A
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $4F
         PEI   $4D
         PEA   $000A
         JSL   L014B1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDA   $1C
         AND   #$F000
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPenPat
         STA   L014E87
         LDA   #$0005
         PHA
         LDA   #$0002
         PHA
         _SetPenSize
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _FrameRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         LDA   #$0005
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDA   #$0005
         PHA
         LDA   #$0002
         PHA
         _SetPenSize
         STA   L014E87
         LDA   $1E
         AND   #$F000
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         STA   $48
         LDA   $48
         PHA
         LDA   $48
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         JSL   L0105BB
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPenPat
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0020
         PHA
         _FrameRect
         STA   L014E87
         _PenNormal
         STA   L014E87
         LDA   $4B
         STA   $4F
         LDA   $4A
         STA   $4E
         PLD
         TSC
         CLC
         ADC   #$004E
         TCS
         RTL


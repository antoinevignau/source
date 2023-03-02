*
* SynthLAB - PATCH
*
* (c) 1990, Apple Computer, Inc.
* (s) 2023, Antoine Vignau
*

	mx	%00
	rel
	lst	off
	
*-----------------------------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/Event.Macs
	use	4/Line.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/QD.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-----------------------------------

L030000      ENT
             PHB
             PHK
             PLB
             PEA   $0000
             PEA   $0000
             PEA   $0000
             PEA   $0015
             _GetTSPtr
             PLA
             STA   L030055
             PLA
             STA   L030055+2
             PEA   $0000
             PEA   $0015
             PEA   ^L0303E6
             PEA   L0303E6
             _SetTSPtr
             PLB
             RTL

L030033      ENT
             PHB
             PHK
             PLB
             LDA   L030055
             ORA   L030055+2
             BEQ   L030053
             PEA   $0000
             PEA   $0015
             LDA   L030055+2
             PHA
             LDA   L030055
             PHA
             _SetTSPtr
L030053      PLB
             RTL

L030055      ADRL  $00000000

ModalDialog  TAY
             TSC
             SEC
             SBC   #$002C
             TCS
             PHD
             INC
             TCD
             STY   $24
             STZ   $26
             STZ   $36
             STZ   $22
             PHA
             PHA
             _FrontWindow
             LDA   $01,S
             STA   $14
             LDA   $03,S
             STA   $16
             PEA   $0001
             JSL   L03078F
             BCC   L03008B
             LDA   #$150D
             BRL   L030174
L03008B      PHA
             PHA
             _GetPort
             PLA
             STA   $28
             PLA
             STA   $2A
             LDA   $16
             PHA
             LDA   $14
             PHA
             _SetPort
             LDA   #$0000
             PHA
             PHA
L0300AC      _SetOrigin
L0300B3      _SystemTask
             LDA   $16
             PHA
             LDA   $14
             PHA
             JSL   L03072F
             PHA
             PEA   $FFFF
             PEA   $0000
             TDC
             CLC
             ADC   #$0000
             PHA
             _GetNextEvent
             PLA
             LDA   $32
             BNE   L0300E1
             LDA   $33
             BEQ   L03010C
L0300E1      PHA
             LDA   $16
             PHA
             LDA   $14
             PHA
             PEA   $0000
             TDC
             CLC
             ADC   #$0000
             PHA
             PEA   $0000
             TDC
             CLC
             ADC   #$0036
             PHA
             LDA   $32
             LDX   $33
             JSL   L030543
             PLA
             BNE   L03015D
             LDA   $34
             AND   #$8000
             BEQ   L03012C
L03010C      PHA
             LDA   $16
             PHA
             LDA   $14
             PHA
             PEA   $0000
             TDC
             CLC
             ADC   #$0000
             PHA
             PEA   $0000
             TDC
             CLC
             ADC   #$0036
             PHA
             JSL   L0305FF
             PLA
             BNE   L03015D
L03012C      LDA   $00
             ASL
             TAX
             LDAL  L030136,X
             PHA
             RTS

L030136      DA    L0300B3-1
             DA    L03017A-1
             DA    L0300B3-1
             DA    L030290-1
             DA    L0300B3-1
             DA    L030290-1
             DA    L03033A-1
             DA    L0300B3-1
             DA    L030368-1
             DA    L0300B3-1
             DA    L0300B3-1
             DA    L0300B3-1
             DA    L0300B3-1
             DA    L0300B3-1
             DA    L0300B3-1
             DA    L0300B3-1
L030156      LDA   $36
             BNE   L03015D
             BRL   L0300B3
L03015D      LDA   $2A
             PHA
             LDA   $28
             PHA
             _SetPort
             LDA   $22
             LDY   #$00A0
             STA   [$24],Y
             LDA   #$0000
L030174      LDX   #$002C
             JMP   L0305E9

L03017A      PHA
             PEA   $0000
             TDC
             CLC
             ADC   #$0010
             PHA
             LDA   $0C
             PHA
             LDA   $0A
             PHA
             _FindWindow
             PLA
             AND   #$7FFF
             STA   $18
             LDA   $10
             CMP   $14
             BNE   L0301A3
             LDA   $12
             CMP   $16
             BEQ   L0301A3
L0301A3      LDA   $18
             CMP   #$0013
             BEQ   L0301AD
             BRL   L030289
L0301AD      PHA
             PEA   $0000
             TDC
             CLC
             ADC   #$001A
             PHA
             LDA   $0C
             PHA
             LDA   $0A
             PHA
             LDA   $16
             PHA
             LDA   $14
             PHA
             _FindControl
             PLA
             STA   $22
             BNE   L0301D2
             BRL   L030289
L0301D2      LDA   [$1A]
             STA   $1E
             LDY   #$0002
             LDA   [$1A],Y
             STA   $20
             LDY   #$0020
             LDA   [$1E],Y
             BNE   L0301E7
             BRL   L030289
L0301E7      LDA   $22
             CMP   #$000B
             BNE   L03020D
             PEA   $0000
             TDC
             CLC
             ADC   #$0000
             PHA
             LDY   #$001E
             LDA   [$1E],Y
             PHA
             LDY   #$001C
             LDA   [$1E],Y
             PHA
             _LEClick
             BRL   L0303C1
L03020D      LDA   $22
             CMP   #$0009
             BEQ   L030228
             CMP   #$000C
             BEQ   L030228
             CMP   #$000D
             BEQ   L030228
             CMP   #$000F
             BEQ   L030228
             CMP   #$000E
             BNE   L03022B
L030228      BRL   L0303C1
L03022B      LDA   $22
             CMP   #$0005
             BEQ   L030267
             CMP   #$0006
             BEQ   L030267
             CMP   #$0007
             BEQ   L030267
             CMP   #$0008
             BEQ   L030267
             CMP   #$0081
             BEQ   L030267
             PHA
             LDA   $0C
             PHA
             LDA   $0A
             PHA
             LDA   #$FFFF
             PHA
             PHA
             LDA   $1C
             PHA
             LDA   $1A
             PHA
             _TrackControl
             PLA
             STA   $22
             BEQ   L030289
             BRL   L0303C1
L030267      PHA
             LDA   $0C
             PHA
             LDA   $0A
             PHA
             PEA   ^L030549
             PEA   L030549
             LDA   $1C
             PHA
             LDA   $1A
             PHA
             _TrackControl
             PLA
             STA   $22
             BEQ   L030289
             BRL   L0303C1
L030289      STZ   $36
             STZ   $22
             BRL   L030156
L030290      LDY   #$0114
             LDA   [$14],Y
             BNE   L03029A
             BRL   L030333
L03029A      TAX
             PHA
             PHA
             LDA   $16
             PHA
             LDA   $14
             PHA
             PHX
             _GetControlDItem
             BCC   L0302B0
             BRL   L030331
L0302B0      PLA
             STA   $1A
             PLA
             STA   $1C
             LDA   $02
             AND   #$00FF
             CMP   #$0009
             BNE   L0302E9
             PHA
             LDA   $16
             PHA
             LDA   $14
             PHA
             LDA   $1C
             PHA
             LDA   $1A
             PHA
             JSL   L0304D2
             PLX
             LDA   $16
             PHA
             LDA   $14
             PHA
             PHX
             PEA   $0000
             PEA   $7FFF
             _SelectIText
             BRL   L030333
L0302E9      LDA   $0E
             AND   #$0100
             BEQ   L030302
             LDA   $02
             AND   #$00FF
             CMP   #$0008
             BEQ   L030302
             CMP   #$0015
             BEQ   L030302
             BRL   L0303C1
L030302      LDA   [$1A]
             STA   $1E
             LDY   #$0002
             LDA   [$1A],Y
             STA   $20
             LDA   $02
             AND   #$00FF
             PHA
             LDA   $0E
             PHA
             LDY   #$001E
             LDA   [$1E],Y
             PHA
             LDY   #$001C
             LDA   [$1E],Y
             PHA
             _LEKey
             LDA   #$000B
             STA   $22
             BRL   L0303C1
L030331      PLX
             PLX
L030333      STZ   $36
             STZ   $22
             BRL   L030156
L03033A      LDA   $16
             PHA
             LDA   $14
             PHA
             _BeginUpdate
             LDA   $16
             PHA
             LDA   $14
             PHA
             _DrawDialog
             LDA   $16
             PHA
             LDA   $14
             PHA
             _EndUpdate
             STZ   $36
             STZ   $22
             BRL   L030156
L030368      LDY   #$0114
             LDA   [$14],Y
             BEQ   L0303B6
             TAX
             PHA
             PHA
             LDA   $16
             PHA
             LDA   $14
             PHA
             PHX
             _GetControlDItem
             BCS   L0303BD
             PLA
             STA   $1A
             PLA
             STA   $1C
             LDA   [$1A]
             STA   $1E
             LDY   #$0002
             LDA   [$1A],Y
             STA   $20
             LDY   #$001E
             LDA   [$1E],Y
             PHA
             LDY   #$001C
             LDA   [$1E],Y
             PHA
             LDA   $0E
             AND   #$0001
             BNE   L0303AF
             _LEDeactivate
             BRA   L0303B6
L0303AF      _LEActivate
L0303B6      STZ   $36
             STZ   $22
             BRL   L030156
L0303BD      PLX
             PLX
             BRA   L0303B6
L0303C1      LDA   [$1A]
             STA   $1E
             LDY   #$0002
             LDA   [$1A],Y
             STA   $20
             LDY   #$0022
             LDA   [$1E],Y
             AND   #$8000
             BNE   L0303DF
             LDY   #$0020
             LDA   [$1E],Y
             STA   $36
             BRA   L0303E3
L0303DF      STZ   $36
             STZ   $22
L0303E3      BRL   L030156
L0303E6      ADRL  $0000003B
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  ModalDialog-1
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
             ADRL  $00000000
L0304D2      TSC
             SEC
             SBC   #$0004
             TCS
             PHD
             INC
             TCD
L0304DB      LDA   [$07]
             STA   $00
             LDY   #$0002
             LDA   [$07],Y
             STA   $02
             LDY   #$0000
             LDA   [$00],Y
             STA   $07
             LDY   #$0002
             LDA   [$00],Y
             STA   $09
             LDA   $07
             BNE   L0304FC
             LDA   $09
             BEQ   L030533
L0304FC      LDA   [$07]
             STA   $00
             LDY   #$0002
             LDA   [$07],Y
             STA   $02
             LDY   #$0022
             LDA   [$00],Y
             AND   #$7FFF
             CMP   #$0011
             BNE   L0304DB
             LDY   #$0020
             LDA   [$00],Y
             STA   $0F
             LDA   #$0000
             PLD
             TAY
             LDA   $06,S
             STA   $0E,S
             LDA   $05,S
             STA   $0D,S
             TSC
             CLC
             ADC   #$000C
             TCS
             TYA
             CMP   #$0001
             RTL

L030533      LDY   #$00C6
             LDA   [$0B],Y
             STA   $07
             LDY   #$00C8
             LDA   [$0B],Y
             STA   $09
             BRA   L0304FC
L030543      PHX
             PHB
             DEC
             STA   $01,S
             RTL

L030549      NOP
             TSC
             SEC
             SBC   #$0008
             TCS
             PHD
             INC
             TCD
             LDA   [$0B]
             STA   $00
             LDY   #$0002
             LDA   [$0B],Y
             STA   $02
             LDY   #$0038
             LDA   [$00],Y
             STA   $04
             LDY   #$003A
             LDA   [$00],Y
             STA   $06
             LDA   $04
             BNE   L030574
             LDA   $06
             BEQ   L0305D4
L030574      PHA
             LDA   $0F
             CMP   #$0005
             BNE   L030581
             LDA   #$0004
             BRA   L0305AC
L030581      CMP   #$0006
             BNE   L03058B
             LDA   #$0005
             BRA   L0305AC
L03058B      CMP   #$0007
             BNE   L030595
             LDA   #$0006
             BRA   L0305AC
L030595      CMP   #$0008
             BNE   L03059F
             LDA   #$0007
             BRA   L0305AC
L03059F      CMP   #$0081
             BNE   L0305A9
             LDA   #$0008
             BRA   L0305AC
L0305A9      PLA
             BRA   L0305D4
L0305AC      PHA
             LDY   #$0006
             LDA   [$00],Y
             PHA
             LDY   #$0004
             LDA   [$00],Y
             PHA
             LDY   #$0020
             LDA   [$00],Y
             PHA
             LDA   $04
             LDX   $05
             JSL   L030543
             LDA   $0D
             PHA
             LDA   $0B
             PHA
             _SetCtlValue
L0305D4      PLD
             TAY
             LDA   $0A,S
             STA   $10,S
             LDA   $09,S
             STA   $0F,S
             TSC
             CLC
             ADC   #$000E
             TCS
             TYA
             CMP   #$0001
             RTL

L0305E9      JSR   L030804
             LDA   $05,S
             STA   $09,S
             LDA   $03,S
             STA   $07,S
             LDA   $01,S
             STA   $05,S
             PLA
             PLA
             TYA
             CMP   #$0001
             RTL

L0305FF      TSC
             SEC
             SBC   #$0008
             TCS
             PHD
             INC
             TCD
             STZ   $17
             LDY   #$0000
             LDA   [$0F],Y
             CMP   #$0003
             BEQ   L03061C
             CMP   #$0005
             BEQ   L03061C
             BRL   L030716
L03061C      LDY   #$000E
             LDA   [$0F],Y
             AND   #$0100
             BEQ   L030670
             LDY   #$0002
             LDA   [$0F],Y
             AND   #$00FF
             ORA   #$0020
             CMP   #$0078
             BNE   L030646
             LDA   $15
             PHA
             LDA   $13
             PHA
             _DlgCut
             BRL   L030716
L030646      CMP   #$0063
             BNE   L03065B
             LDA   $15
             PHA
             LDA   $13
             PHA
             _DlgCopy
             BRL   L030716
L03065B      CMP   #$0076
             BNE   L030670
             LDA   $15
             PHA
             LDA   $13
             PHA
             _DlgPaste
             BRL   L030716
L030670      LDY   #$0002
             LDA   [$0F],Y
             AND   #$00FF
             CMP   #$000D
             BEQ   L030680
             BRL   L030716
L030680      PHA
             PHA
             LDA   $15
             PHA
             LDA   $13
             PHA
             LDY   #$0116
             LDA   [$13],Y
             PHA
             _GetControlDItem
             BCC   L03069A
             BRL   L03072B
L03069A      PLA
             STA   $00
             PLA
             STA   $02
             LDA   [$00]
             STA   $04
             LDY   #$0002
             LDA   [$00],Y
             STA   $06
             LDY   #$0022
             LDA   [$04],Y
             AND   #$7FFF
             CMP   #$000A
             BEQ   L0306C0
             CMP   #$0015
             BEQ   L0306C0
             BRL   L030716
L0306C0      LDY   #$0010
             LDA   [$04],Y
             TAX
             AND   #$0080
             BNE   L030716
             TXA
             AND   #$FF00
             XBA
             CMP   #$00FF
             BEQ   L030716
             PEA   $0002
             LDA   $02
             PHA
             LDA   $00
             PHA
             _HiliteControl
             PEA   $0000
             LDA   $02
             PHA
             LDA   $00
             PHA
             _HiliteControl
             LDA   [$00]
             STA   $04
             LDY   #$0002
             LDA   [$00],Y
             STA   $06
             LDY   #$0022
             LDA   [$04],Y
             AND   #$8000
             BNE   L030716
             LDY   #$0116
             LDA   [$13],Y
             STA   [$0B]
             LDA   #$0001
             STA   $17
L030716      PLD
             TAY
             LDA   $0A,S
             STA   $16,S
             LDA   $09,S
             STA   $15,S
             TSC
             CLC
             ADC   #$0014
             TCS
             TYA
             CMP   #$0001
             RTL

L03072B      PLX
             PLX
             BRA   L030716
L03072F      TSC
             SEC
             SBC   #$0008
             TCS
             PHD
             INC
             TCD
             LDY   #$0114
             LDA   [$0B],Y
             BEQ   L030776
             TAX
             PHA
             PHA
             LDA   $0D
             PHA
             LDA   $0B
             PHA
             PHX
             _GetControlDItem
             BCS   L03078B
             PLA
             STA   $00
             PLA
             STA   $02
             LDA   [$00]
             STA   $04
             LDY   #$0002
             LDA   [$00],Y
             STA   $06
             LDY   #$001E
             LDA   [$04],Y
             PHA
             LDY   #$001C
             LDA   [$04],Y
             PHA
             _LEIdle
L030776      PLD
             TAY
             LDA   $0A,S
             STA   $0E,S
             LDA   $09,S
             STA   $0D,S
             TSC
             CLC
             ADC   #$000C
             TCS
             TYA
             CMP   #$0001
             RTL

L03078B      PLX
             PLX
             BRA   L030776
L03078F      TSC
             SEC
             SBC   #$0004
             TCS
             PHD
             INC
             TCD
             LDA   $09
             LDY   $0B
             JSR   L0307EB
             CMP   #$0000
             BNE   L0307AE
             CPY   #$0000
             BNE   L0307AE
             LDA   #$0001
             BRA   L0307D6
L0307AE      PHA
             PHA
             PHY
             PHA
             _GetHandleSize
             PLA
             PLY
             CMP   #$011C
             BNE   L0307C5
             CPY   #$0000
             BEQ   L0307CA
L0307C5      LDA   #$0001
             BRA   L0307D6
L0307CA      LDY   #$0112
             LDA   [$09],Y
             CMP   $07
             BNE   L0307C5
             LDA   #$0000
L0307D6      PLD
             TAY
             LDA   $06,S
             STA   $0C,S
             LDA   $05,S
             STA   $0B,S
             TSC
             CLC
             ADC   #$000A
             TCS
             TYA
             CMP   #$0001
             RTL

L0307EB      SEC
             SBC   #$0004
             BCS   L0307F2
             DEY
L0307F2      PEA   $0000
             PEA   $0000
             PHY
             PHA
             _FindHandle
             PLA
             PLY
             RTS

L030804      TAY
             PLA
             PLD
             CPX   #$0000
             BEQ   L030813
L03080C      STA   $01,S
             PLA
             DEX
             DEX
             BNE   L03080C
L030813      PHA
             RTS



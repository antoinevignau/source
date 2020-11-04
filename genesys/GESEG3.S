*
* Genesys v1.2.4
* Main program: segment 3
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
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

	 use   GESEG3.X.S
	
*----------------------------

L030000  ENT
         CMP   #$0000
         BEQ   L030032
         PHB
         PHX
         PHY
         PHK
         PLB
         STA   L030033
         _InitCursor
         PEA   $0000
         PEA   $0001
         PEA   ^L030035
         PEA   L030035
         LDA   L030033
         PHA
         _ErrorWindow
         PLA
         PLY
         PLX
         LDA   L030033
         PLB
L030032  RTL

L030033  DW    $0000
L030035  STR   'GENESYS internal error'
         PEA   $0000
         PEA   $0004
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0002
         _AlertWindow
         PLA
         RTL

L030067  ENT
         PHB
         PHD
         PHK
         PLB
         PHA
         PHA
         TSC
         TCD
         LDA   [$0B]
         STA   $01
         LDY   #$0002
         LDA   [$0B],Y
         STA   $03
         LDY   #$000A
         LDA   [$01],Y
         STA   $0B
         INY
         INY
         LDA   [$01],Y
         STA   $0D
         LDA   $0B
         STA   $01
         LDA   $0D
         STA   $03
         LDA   [$0F]
         STA   $0B
         LDY   #$0002
         LDA   [$0F],Y
         STA   $0D
         LDY   #$000A
         LDA   [$0B],Y
         STA   $0F
         INY
         INY
         LDA   [$0B],Y
         STA   $11
         LDA   $05
         STA   $0D
         LDA   $07
         STA   $0B
         LDA   $0F
         STA   $05
         LDA   $11
         STA   $07
         LDA   $09
         STA   $11
         LDA   $0B
         STA   $0F
         JSL   L02BD95
         PLY
         PLY
         PLD
         PLB
         RTL

L0300C8  ENT
         PHD
         PHB
         PHK
         PLB
         TSC
         TCD
         LDA   $0B
         STA   [$07]
         INC   $07
         INC   $07
         LDA   $0D
         STA   [$07]
         INC   $07
         INC   $07
         LDA   $07
         STA   $0B
         LDA   $09
         STA   $0D
         LDA   [$0F]
         AND   #$00FF
         TAY
L0300EC  LDA   [$0F],Y
         STA   [$0B],Y
         INC   $07
         BNE   L0300F6
         INC   $09
L0300F6  DEY
         BPL   L0300EC
         PLA
         STA   $0B,S
         PLA
         STA   $0B,S
         PLA
         STA   $0B,S
         PLA
         PLX
         PLY
         PLB
         PLD
         RTL

L030108  ENT
         PHB
         PHD
         PHK
         PLB
         TSC
         TCD
         LDY   #$0002
         LDA   [$07],Y
         CLC
         ADC   #$0002
         TAY
L030118  LDA   [$07],Y
         PHA
         DEY
         DEY
         CPY   #$0002
         BNE   L030118
         LDA   [$07]
         ASL
         ASL
         TAX
         PHK
         PEA   L030137
         SEP   #$20
         LDA   L030143+2,X
         PHA
         REP   #$20
         LDA   L030143,X
         PHA
L030137  RTL

         TAY
         PLD
         PLA
         STA   $03,S
         PLA
         STA   $03,S
         TYA
         PLB
         RTL

L030143  ADRL  $00000000
         ADRL  L0276F0
         ADRL  L02A8F0
         ADRL  L029CFD
         ADRL  L027DF7
         DW    $0000

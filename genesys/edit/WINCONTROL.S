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
         use   4/Mem.Macs
         use   4/QD.Macs
         use   4/Resource.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*----------------------------

         EXT   L014B1E
         EXT   L014E87
         EXT   L020000
         EXT   L020E29
         EXT   L0206AF
         EXT   L0103D4
         EXT   L0208DC
         EXT   L0153AF
         EXT   L0146C2
         EXT   L0146C0
         EXT   L0146B4
         EXT   L0146B8
         EXT   L0146B6
         EXT   L0146BE
         EXT   L0146BA
         EXT   L0146BC
         EXT   L0153FB

*----------------------------

L040000  ENT
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDX   $1B
         LDA   $19
         STX   L0146C2
         STA   L0146C0
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

L040023  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHB
         PHB
         PLA
         STA   $06
         PEA   >L0146B4
         PLB
         PLB
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   ^L0146B8
         PEA   L0146B8
         PEA   $0008
         JSL   L014B1E
         LDX   L0146B6
         LDA   L0146B4
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
         BNE   L04006F
         BRL   L040082
L04006F  LDA   $16
         SEC
         SBC   #$0006
         STA   $16
         LDA   $18
         SEC
         SBC   #$000E
         STA   $18
         BRL   L040108
L040082  LDX   L0146B6
         LDA   L0146B4
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
         BNE   L0400A5
         BRL   L0400AD
L0400A5  LDA   $16
         SEC
         SBC   #$000C
         STA   $16
L0400AD  LDX   L0146B6
         LDA   L0146B4
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
         BNE   L0400D0
         BRL   L0400F8
L0400D0  LDX   L0146B6
         LDA   L0146B4
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
         LDA   $16
         SEC
         SBC   $01,S
         PLX
         CLC
         ADC   #$0001
         STA   $16
L0400F8  LDA   $16
         SEC
         SBC   #$0002
         STA   $16
         LDA   $18
         SEC
         SBC   #$0004
         STA   $18
L040108  LDA   $18
         PHA
         LDA   $16
         PHA
         LDX   L0146C2
         LDA   L0146C0
         PHX
         PHA
         JSL   L0103D4
         LDA   $06
         PHA
         PLB
         PLB
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L040127  TSC
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
         PEA   >L0146B4
         PLB
         PLB
         LDA   L0146BE
         SEC
         SBC   L0146BA
         PHA
         LDA   L0146BC
         SEC
         SBC   L0146B8
         PHA
         LDX   L0146C2
         LDA   L0146C0
         PHX
         PHA
         JSL   L0103D4
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

L040163  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHB
         PHB
         PLA
         STA   $06
         PEA   >L0146B4
         PLB
         PLB
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   ^L0146B8
         PEA   L0146B8
         PEA   $0008
         JSL   L014B1E
         LDX   L0146B6
         LDA   L0146B4
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
         BNE   L0401AF
         BRL   L0401CD
L0401AF  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$000E
         PHA
         LDA   #$0006
         PHA
         _InsetRect
         STA   L014E87
         BRL   L04025E
L0401CD  PEA   $0000
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
         LDX   L0146B6
         LDA   L0146B4
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
         BNE   L04020B
         BRL   L040213
L04020B  LDA   $16
         CLC
         ADC   #$000D
         STA   $16
L040213  LDX   L0146B6
         LDA   L0146B4
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
         BNE   L040236
         BRL   L04025E
L040236  LDA   #$0001
         PHA
         LDX   L0146B6
         LDA   L0146B4
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
L04025E  LDA   $18
         PHA
         LDA   $16
         PHA
         LDX   L0146C2
         LDA   L0146C0
         PHX
         PHA
         JSL   L0103D4
         LDA   $06
         PHA
         PLB
         PLB
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L04027D  TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHB
         PHB
         PLA
         STA   $06
         PEA   >L0146B4
         PLB
         PLB
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEA   ^L0146B8
         PEA   L0146B8
         PEA   $0008
         JSL   L014B1E
         LDX   L0146B6
         LDA   L0146B4
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
         BNE   L0402C9
         BRL   L0402E7
L0402C9  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$000E
         PHA
         LDA   #$0006
         PHA
         _InsetRect
         STA   L014E87
         BRL   L040378
L0402E7  PEA   $0000
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
         LDX   L0146B6
         LDA   L0146B4
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
         BNE   L040325
         BRL   L04032D
L040325  LDA   $16
         CLC
         ADC   #$000D
         STA   $16
L04032D  LDX   L0146B6
         LDA   L0146B4
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
         BNE   L040350
         BRL   L040378
L040350  LDA   #$0001
         PHA
         LDX   L0146B6
         LDA   L0146B4
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
L040378  LDA   $1C
         SEC
         SBC   $18
         STA   $18
         LDA   $1A
         SEC
         SBC   $16
         STA   $16
         LDA   $18
         PHA
         LDA   $16
         PHA
         LDX   L0146C2
         LDA   L0146C0
         PHX
         PHA
         JSL   L0103D4
         LDA   $06
         PHA
         PLB
         PLB
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L0403A5  ENT
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
         PEI   $59
         PEI   $57
         PEA   $0004
         JSL   L014B1E
         LDX   $51
         LDA   $4F
         STX   L0146B6
         STA   L0146B4
         PHA
         PHA
         _GetPort
         PLA
         STA   $46
         PLA
         STA   $48
         LDx   #$0000
*         TAX
*         SEP   #$20
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0001
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0002
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0003
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0004
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0005
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0006
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0007
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0008
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0009
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$000A
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$000B
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$000C
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$000D
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$000E
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$000F
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0010
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0011
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0012
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0013
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0014
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0015
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0016
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0017
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0018
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0019
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$001A
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$001B
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$001C
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$001D
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$001E
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$001F
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
*         LDA   #$7D00
*         EOR   #$FFFF	; 82FF
*         INC		; 8300
*         PHA
	 pea   $8300
*         LDA   #$7D00
*         EOR   #$FFFF
*         INC
*         PHA
	 pea   $8300
         pea   $7D00
         pea   $7D00
         _SetRect
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         _GetPortRect
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         _LocalToGlobal
         LDX   #^L0146BC
         LDA   #L0146BC
         PHX
         PHA
         _LocalToGlobal
         PHA
         PHA
         _GetWMgrPort
         _SetPort
         PHA
         _GetArcRot
         PLA
         STA   $4A
         ORA   #$8000
         PHA
         _SetArcRot
         PHA
         PHA
         LDX   #^L040163
         LDA   #L040163
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         pei   $18
         pei   $16
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         pea   $0220
         _DragRect
         PLA
         STA   $42
         PLA
         STA   $44
         pei   $4A
         _SetArcRot
         pei   $48
         pei   $46
         _SetPort
         LDA   L0146BA
         PHA
         LDA   L0146B8
         PHA
         pei   $55
         pei   $53
         _MoveWindow
         LDA   $4D
         STA   $59
         LDA   $4C
         STA   $58
         PLD
         TSC
         CLC
         ADC   #$0058
         TCS
         RTL

L04067F  ENT
         TSC
         SEC
         SBC   #$0054
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $61
         PEI   $5F
         PEA   $0004
         JSL   L014B1E
         LDX   $59
         LDA   $57
         STX   L0146B6
         STA   L0146B4
         PHA
         PHA
         _GetPort
*         STA   L014E87
         PLA
         STA   $4E
         PLA
         STA   $50
         LDx   #$0000
*         TAX
         SEP   #$20
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0001
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0002
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0003
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0004
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0005
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0006
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0007
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0008
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0009
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$000A
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$000B
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$000C
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$000D
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$000E
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$000F
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0010
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0011
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0012
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$0013
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0014
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0015
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0016
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$0017
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$0018
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$0019
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$001A
*         TAX
*         SEP   #$20
	inx
         LDA   #$00
         STA   $1A,X
*         REP   #$20
*         LDA   #$001B
*         TAX
*         SEP   #$20
	inx
         LDA   #$BB
         STA   $1A,X
*         REP   #$20
*         LDA   #$001C
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$001D
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
*         REP   #$20
*         LDA   #$001E
*         TAX
*         SEP   #$20
	inx
         LDA   #$0B
         STA   $1A,X
*         REP   #$20
*         LDA   #$001F
*         TAX
*         SEP   #$20
	inx
         LDA   #$B0
         STA   $1A,X
         REP   #$20
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         _GetPortRect
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         _LocalToGlobal
         LDX   #^L0146BC
         LDA   #L0146BC
         PHX
         PHA
         _LocalToGlobal
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
*         LDA   #$7530
*        EOR   #$FFFF	; 8ACF
*         INC		; 8AD0
*         PHA
	 pea   $8ad0
*         LDA   #$7530
*         EOR   #$FFFF
*         INC
*         PHA
	 pea   $8ad0
         pea   $7530
         pea   $7530
         _SetRect
         PHA
         PHA
         _GetWMgrPort
         _SetPort
         PHA
         _GetArcRot
         PLA
         STA   $52
         ORA   #$8000
         PHA
         _SetArcRot
         PHA
         PHA
         LDX   #^L04027D
         LDA   #L04027D
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         pei   $18
         pei   $16
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$003A
         PHA
         pea   $0234
         _DragRect
         PLA
         STA   $4A
         PLA
         STA   $4C
         pei   $52
         _SetArcRot
         pei   $50
         pei   $4E
         _SetPort
         LDA   L0146BE
         SEC
         SBC   L0146BA
         PHA
         LDA   #$0020
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L04094A
         BVS   L040948
         EOR   #$8000
L040948  BMI   L04094D
L04094A  BRL   L040957
L04094D  LDA   L0146BA
         CLC
         ADC   #$0020
         STA   L0146BE
L040957  LDA   L0146BC
         SEC
         SBC   L0146B8
         PHA
         LDA   #$000E
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L040970
         BVS   L04096E
         EOR   #$8000
L04096E  BMI   L040973
L040970  BRL   L04097D
L040973  LDA   L0146B8
         CLC
         ADC   #$000E
         STA   L0146BC
L04097D  LDA   L0146BE
         SEC
         SBC   L0146BA
         PHA
         LDA   L0146BC
         SEC
         SBC   L0146B8
         PHA
         pei   $5D
         pei   $5B
         _SizeWindow
         LDA   $55
         STA   $61
         LDA   $54
         STA   $60
         PLD
         TSC
         CLC
         ADC   #$0060
         TCS
         RTL

*--- Move control

L0409AD  ENT
         TSC
         SEC
         SBC   #$0024
         TCS
         PHD
         INC
         TCD
*         LDA   #$0000
         stz   $16
*         LDA   #$0000
         stz   $18
         LDY   #$0002
         LDA   [$27],Y
         TAX
         LDA   [$27]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
*         BNE   L0409D9
*         BRL   L0409E6
	 beq   L0409E6
L0409D9  LDA   #$000E
         STA   $18
         LDA   #$0006
         STA   $16
         bra   L040A48
L0409E6  LDA   #$0004
         STA   $18
         LDA   #$0002
         STA   $16
*         LDY   #$0002
*         LDA   [$27],Y
*         TAX
*         LDA   [$27]
*         STA   $00
*         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
*         BNE   L040A09
*         BRL   L040A11
	 beq   L040A11
L040A09  LDA   $16
         CLC
         ADC   #$000C
         STA   $16
L040A11
*         LDY   #$0002
*         LDA   [$27],Y
*         TAX
*         LDA   [$27]
*         STA   $00
*         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
*         BNE   L040A2A
*         BRL   L040A48
	 beq   L040A48
L040A2A
*         LDA   #$0001
*         PHA
*         LDY   #$0002
*         LDA   [$27],Y
*         TAX
*         LDA   [$27]
*         STA   $00
*         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $16
         SEC
*         SBC   $01,S
	 sbc   #$0001
*         PLX
         STA   $16
L040A48  PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDY   #$0002
         LDA   [$2B],Y
         PHA
         LDA   [$2B]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         PEA   $0008
         JSL   L014B1E
         PHA
         _GetArcRot
*         STA   L014E87
         PLA
         STA   $22
*         LDA   $22
         AND   #$8000
*         BNE   L040A7F
*         BRL   L040A8F
	 beq   L040A8F
L040A7F  LDA   $22
         EOR   #$8000
         PHA
         _SetArcRot
*         STA   L014E87
L040A8F  LDY   #$0002
         LDA   [$2B],Y
         TAX
         LDA   [$2B]
         STA   $00
         STX   $02

         LDY   #$000A
         LDA   [$00],Y
         CLC
         ADC   $18
         PHA

*         LDY   #$0002
*         LDA   [$2B],Y
*         TAX
*         LDA   [$2B]
*         STA   $00
*         STX   $02

	 ldal	$e12000
	 inc
	 stal	$e12000
	 
         LDY   #$0008
         LDA   [$00],Y
         CLC
         ADC   $16
         PHA
         pei   $2D
         pei   $2B
*         PHX
*         PHA
         _MoveControl
*         STA   L014E87
         PHA
*         LDY   #$0002
*         LDA   [$2B],Y
*         TAX
*         LDA   [$2B]
*         STA   $00
*         STX   $02
         LDY   #$0016
         LDA   [$00],Y
*         TAX
	 pha
         LDY   #$0014
         LDA   [$00],Y
*         PHX
         PHA
         _HiWord
*         STA   L014E87
         PLA
         CMP   #$8900
*         BEQ   L040AF6
*         BRL   L040B45
	 bne   L040B45
*L040AF6  LDA   #$0002
*         PHA
*         LDY   #$0002
*         LDA   [$2B],Y
*         TAX
*         LDA   [$2B]
*         STA   $00
*         STX   $02
         LDY   #$000E
         LDA   [$00],Y
*         SEC
*         SBC   $01,S
	 sbc   #$0002
*         PLX
         PHA
*         LDY   #$0002
*         LDA   [$2B],Y
*         TAX
*         LDA   [$2B]
*         STA   $00
*         STX   $02
         LDY   #$0008
         LDA   [$00],Y
         PHA
*         LDY   #$0002
*         LDA   [$2B],Y
*         TAX
*         LDA   [$2B]
*         STA   $00
*         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         TAX
	 pha
         LDY   #$0034
         LDA   [$00],Y
*         PHX
         PHA
         _MoveControl
*         STA   L014E87
L040B45  pei   $2D
         pei   $2B
*         PHX
*         PHA
         _ShowControl
*         STA   L014E87
         pei   $22
*         PHA
         _SetArcRot
*         STA   L014E87
         LDA   $25
         STA   $2D
         LDA   $24
         STA   $2C
         PLD
         TSC
         CLC
         ADC   #$002C
         TCS
         RTL

L040B72  ENT
         TSC
         SEC
         SBC   #$0040
         TCS
         PHD
         INC
         TCD
         PHA
         _GetArcRot
         STA   L014E87
         PLA
         STA   $24
         LDA   $24
         AND   #$8000
         BNE   L040B93
         BRL   L040BA3
L040B93  LDA   $24
         EOR   #$8000
         PHA
         _SetArcRot
         STA   L014E87
L040BA3  PEA   $0000
         TDC
         CLC
         ADC   #$0030
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _GetPortRect
         STA   L014E87
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L040BE2
         BRL   L040C00
L040BE2  PEA   $0000
         TDC
         CLC
         ADC   #$0030
         PHA
         LDA   #$000E
         PHA
         LDA   #$0006
         PHA
         _InsetRect
         STA   L014E87
         BRL   L040C7B
L040C00  PEA   $0000
         TDC
         CLC
         ADC   #$0030
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L040C34
         BRL   L040C44
L040C34  LDA   #$0001
         PHA
         LDA   $30
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $30
L040C44  LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L040C5D
         BRL   L040C7B
L040C5D  LDA   #$0001
         PHA
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $30
         SEC
         SBC   $01,S
         PLX
         STA   $30
L040C7B  PEA   $0000
         TDC
         CLC
         ADC   #$0030
         PHA
         _SetPortRect
         STA   L014E87
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         LDX   #$0000
         CMP   #$0000
         BNE   L040CAB
         INX
L040CAB  TXA
         PHA
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0002
         LDX   #$0000
         CMP   #$0000
         BNE   L040CCA
         INX
L040CCA  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L040CD4
         BRL   L040CD7
L040CD4  BRL   L04113F
L040CD7  LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0002
         BNE   L040CF0
         BRL   L040E7E
L040CF0  PHA
         PHA
         LDA   #$8004
         PHA
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $3C
         PLA
         STA   $3E
         LDA   #$8004
         PHA
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _DetachResource
         STA   L014E87
         LDY   #$0002
         LDA   [$3C],Y
         TAX
         LDA   [$3C]
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
         BEQ   L040D6C
         DEY
L040D6C  TXA
         CMP   $03,S
         BEQ   L040D74
         LDY   #$0000
L040D74  PLA
         PLA
         TYA
         BNE   L040D7C
         BRL   L040E04
L040D7C  LDY   #$0002
         LDA   [$3C],Y
         TAX
         LDA   [$3C]
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
         BPL   L040DAA
         DEX
L040DAA  LDY   #$0001
         CMP   $01,S
         BEQ   L040DB2
         DEY
L040DB2  TXA
         CMP   $03,S
         BEQ   L040DBA
         LDY   #$0000
L040DBA  PLA
         PLA
         TYA
         BNE   L040DC2
         BRL   L040E04
L040DC2  LDY   #$0002
         LDA   [$3C],Y
         TAX
         LDA   [$3C]
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
         LDA   [$3C],Y
         PHA
         LDA   [$3C]
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
L040E04  PHA
         PHA
         LDX   $49
         LDA   $47
         PHX
         PHA
         LDA   #$0001
         PHA
         LDX   $3E
         LDA   $3C
         PHX
         PHA
         _NewControl2
         STA   L014E87
         PLA
         STA   $20
         PLA
         STA   $22
         LDA   L014E87
         PHA
         LDA   #$1003
         PHA
         JSL   L020000
         LDX   $22
         LDA   $20
         PHX
         PHA
         _HideControl
         STA   L014E87
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         LDX   $22
         LDA   $20
         PHX
         PHA
         _SetCtlRefCon
         STA   L014E87
         LDX   $22
         LDA   $20
         PHX
         PHA
         LDX   $45
         LDA   $43
         PHX
         PHA

	 ldal	$e120c0
	 inc
	 stal	$e120c0
	 
         JSL   L0409AD
         BRL   L04113F
L040E7E  LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         BNE   L040E97
         BRL   L04113F
L040E97  PHA
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L014E87
         PHA
         LDA   #$1006
         PHA
         JSL   L020000
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1007
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetHandleSize
         STA   L014E87
         PLA
         STA   $1A
         PLA
         STA   $1C
         LDA   L014E87
         PHA
         LDA   #$1008
         PHA
         JSL   L020000
         LDA   #$0001
         PHA
         PHA
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0004
         JSL   L0153AF
         SEC
         SBC   $01,S
         PLX
         STA   $1E
         LDA   $1E
         STA   $06
         LDA   #$0001
         STA   $26
         LDA   $06
         SEC
         SBC   $26
         BVS   L040F48
         EOR   #$8000
L040F48  BMI   L040F4D
         BRL   L041104
L040F4D  PHA
         PHA
         LDA   #$8004
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDA   $26
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
         _LoadResource
         STA   L014E87
         PLA
         STA   $3C
         PLA
         STA   $3E
         LDA   #$8004
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDA   $26
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
         _DetachResource
         STA   L014E87
         LDY   #$0002
         LDA   [$3C],Y
         TAX
         LDA   [$3C]
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
         BEQ   L040FDD
         DEY
L040FDD  TXA
         CMP   $03,S
         BEQ   L040FE5
         LDY   #$0000
L040FE5  PLA
         PLA
         TYA
         BNE   L040FED
         BRL   L041075
L040FED  LDY   #$0002
         LDA   [$3C],Y
         TAX
         LDA   [$3C]
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
         BPL   L04101B
         DEX
L04101B  LDY   #$0001
         CMP   $01,S
         BEQ   L041023
         DEY
L041023  TXA
         CMP   $03,S
         BEQ   L04102B
         LDY   #$0000
L04102B  PLA
         PLA
         TYA
         BNE   L041033
         BRL   L041075
L041033  LDY   #$0002
         LDA   [$3C],Y
         TAX
         LDA   [$3C]
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
         LDA   [$3C],Y
         PHA
         LDA   [$3C]
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
L041075  PHA
         PHA
         LDX   $49
         LDA   $47
         PHX
         PHA
         LDA   #$0001
         PHA
         LDX   $3E
         LDA   $3C
         PHX
         PHA
         _NewControl2
         STA   L014E87
         PLA
         STA   $20
         PLA
         STA   $22
         LDA   L014E87
         PHA
         LDA   #$1009
         PHA
         JSL   L020000
         LDX   $22
         LDA   $20
         PHX
         PHA
         _HideControl
         STA   L014E87
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDA   $26
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
         LDX   $22
         LDA   $20
         PHX
         PHA
         _SetCtlRefCon
         STA   L014E87
         LDX   $22
         LDA   $20
         PHX
         PHA
         LDX   $45
         LDA   $43
         PHX
         PHA

	 ldal	$e120e0
	 inc
	 stal	$e120e0
	 
         JSL   L0409AD
         LDA   $06
         CMP   $26
         BNE   L0410FF
         BRL   L041104
L0410FF  INC   $26
         BRL   L040F4D
L041104  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$43],Y
         TAX
         LDA   [$43]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$100A
         PHA
         JSL   L020000
L04113F  PEA   $0000
         TDC
         CLC
         ADC   #$0028
         PHA
         _SetPortRect
         STA   L014E87
         LDA   $24
         PHA
         _SetArcRot
         STA   L014E87
         LDA   $41
         STA   $49
         LDA   $40
         STA   $48
         PLD
         TSC
         CLC
         ADC   #$0048
         TCS
         RTL

L04116F  ENT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         LDX   #$0000
         CMP   #$0000
         BNE   L041195
         INX
L041195  TXA
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0002
         LDX   #$0000
         CMP   #$0000
         BNE   L0411B4
         INX
L0411B4  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L0411BE
         BRL   L04120C
L0411BE  LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         PLA
         CLC
         ADC   #$0056
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   $29
         STA   [$00]
         LDY   #$0002
         LDA   $2B
         STA   [$00],Y
         BRL   L0416BB
L04120C  LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0002
         BNE   L041225
         BRL   L041482
L041225  LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         EOR   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         ORA   #$0009
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         STX   $18
         STA   $16
         PHA
         PHA
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L0412A2
         DEX
L0412A2  PHX
         PHA
         LDA   $27
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0412B5
         DEX
L0412B5  PHX
         PHA
         _NewHandle
         STA   L014E87
         PLA
         STA   $1A
         PLA
         STA   $1C
         LDA   L014E87
         PHA
         LDA   #$1013
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
         LDA   #$1014
         PHA
         JSL   L020000
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         PHA
         LDA   [$1A]
         PHA
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L041316
         DEX
L041316  PHX
         PHA
         _BlockMove
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0029
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         PHA
         LDA   [$1A]
         PHA
         LDA   #$0002
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L041349
         DEX
L041349  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L04135F
         DEX
L04135F  STX   $18
         STA   $16
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         PHA
         LDA   [$1A]
         PHA
         LDA   #$0003
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L04138A
         DEX
L04138A  PHX
         PHA
         _BlockMove
         STA   L014E87
         PHA
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$8003
         PHA
         _UniqueResourceID
         STA   L014E87
         LDY   #$0002
         LDA   [$23],Y
         PHA
         LDA   [$23]
         PHA
         PLA
         CLC
         ADC   #$0056
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
         LDA   #$1018
         PHA
         JSL   L020000
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         LDA   #$0000
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _AddResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1019
         PHA
         JSL   L020000
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1020
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1021
         PHA
         JSL   L020000
         BRL   L0416BB
L041482  LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         BNE   L04149B
         BRL   L0416BB
L04149B  PHA
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $1A
         PLA
         STA   $1C
         LDA   L014E87
         PHA
         LDA   #$1022
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
         LDA   #$1023
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _GetHandleSize
         STA   L014E87
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L014E87
         PHA
         LDA   #$1024
         PHA
         JSL   L020000
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0004
         JSL   L0153AF
         STA   $1E
         PEA   $0000
         TDC
         CLC
         ADC   #$0029
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         PHA
         LDA   [$1A]
         PHA
         LDA   $1E
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L041557
         DEX
L041557  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _HUnlock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1026
         PHA
         JSL   L020000
         PEI   $18
         PEI   $16
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L04158D
         DEX
L04158D  PHX
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _SetHandleSize
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1027
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
         LDA   #$1028
         PHA
         JSL   L020000
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0415DC
         DEX
L0415DC  STX   $18
         STA   $16
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDY   #$0002
         LDA   [$1A],Y
         PHA
         LDA   [$1A]
         PHA
         LDA   $1E
         CLC
         ADC   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L04160A
         DEX
L04160A  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDA   #$0001
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _MarkResourceChange
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1030
         PHA
         JSL   L020000
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1031
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$23],Y
         TAX
         LDA   [$23]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1032
         PHA
         JSL   L020000
L0416BB  LDA   $21
         STA   $2B
         LDA   $20
         STA   $2A
         PLD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L0416CB  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDA   #$0001
         EOR   #$FFFF
         INC
         STA   $16
         LDA   $23
         CMP   #$000A
         BEQ   L0416E7
         BRL   L0416EF
L0416E7  LDA   #$0000
         STA   $16
         BRL   L0417B6
L0416EF  LDA   $23
         CMP   #$0008
         BEQ   L0416F9
         BRL   L041701
L0416F9  LDA   #$0000
         STA   $16
         BRL   L0417B6
L041701  LDA   $23
         CMP   #$0012
         BEQ   L04170B
         BRL   L041713
L04170B  LDA   #$0000
         STA   $16
         BRL   L0417B6
L041713  LDA   $23
         CMP   #$0009
         BEQ   L04171D
         BRL   L041725
L04171D  LDA   #$0000
         STA   $16
         BRL   L0417B6
L041725  LDA   $23
         CMP   #$000B
         BEQ   L04172F
         BRL   L041737
L04172F  LDA   #$0000
         STA   $16
         BRL   L0417B6
L041737  LDA   $23
         CMP   #$000F
         BEQ   L041741
         BRL   L041749
L041741  LDA   #$0000
         STA   $16
         BRL   L0417B6
L041749  LDA   $23
         CMP   #$0013
         BEQ   L041753
         BRL   L04175B
L041753  LDA   #$0000
         STA   $16
         BRL   L0417B6
L04175B  LDA   $23
         CMP   #$0010
         BEQ   L041765
         BRL   L04176D
L041765  LDA   #$0000
         STA   $16
         BRL   L0417B6
L04176D  LDA   $23
         CMP   #$000E
         BEQ   L041777
         BRL   L041783
L041777  LDA   #$0001
         EOR   #$FFFF
         INC
         STA   $16
         BRL   L0417B6
L041783  LDA   $23
         CMP   #$0011
         BEQ   L04178D
         BRL   L041795
L04178D  LDA   #$0000
         STA   $16
         BRL   L0417B6
L041795  LDA   $23
         CMP   #$000C
         BEQ   L04179F
         BRL   L0417A7
L04179F  LDA   #$0000
         STA   $16
         BRL   L0417B6
L0417A7  LDA   $23
         CMP   #$000D
         BEQ   L0417B1
         BRL   L0417B6
L0417B1  LDA   #$0000
         STA   $16
L0417B6  LDA   $21
         STA   $23
         LDA   $20
         STA   $22
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0022
         TCS
         TXA
         RTL

L0417C9  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         STA   $16
         LDA   $23
         LDX   #$0000
         CMP   #$07FF
         BNE   L0417E2
         INX
L0417E2  TXA
         PHA
         LDA   $23
         LDX   #$0000
         CMP   #$87FF
         BNE   L0417EF
         INX
L0417EF  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L0417F9
         BRL   L041801
L0417F9  LDA   #$000A
         STA   $16
         BRL   L0418C4
L041801  LDA   $23
         CMP   #$8000
         BEQ   L04180B
         BRL   L041813
L04180B  LDA   #$0008
         STA   $16
         BRL   L0418C4
L041813  LDA   $23
         CMP   #$8100
         BEQ   L04181D
         BRL   L041825
L04181D  LDA   #$0012
         STA   $16
         BRL   L0418C4
L041825  LDA   $23
         CMP   #$8200
         BEQ   L04182F
         BRL   L041837
L04182F  LDA   #$0009
         STA   $16
         BRL   L0418C4
L041837  LDA   $23
         CMP   #$8300
         BEQ   L041841
         BRL   L041849
L041841  LDA   #$000B
         STA   $16
         BRL   L0418C4
L041849  LDA   $23
         CMP   #$8400
         BEQ   L041853
         BRL   L04185B
L041853  LDA   #$000F
         STA   $16
         BRL   L0418C4
L04185B  LDA   $23
         CMP   #$8500
         BEQ   L041865
         BRL   L04186D
L041865  LDA   #$0013
         STA   $16
         BRL   L0418C4
L04186D  LDA   $23
         CMP   #$8600
         BEQ   L041877
         BRL   L04187F
L041877  LDA   #$0010
         STA   $16
         BRL   L0418C4
L04187F  LDA   $23
         CMP   #$8700
         BEQ   L041889
         BRL   L041891
L041889  LDA   #$000E
         STA   $16
         BRL   L0418C4
L041891  LDA   $23
         CMP   #$8800
         BEQ   L04189B
         BRL   L0418A3
L04189B  LDA   #$0011
         STA   $16
         BRL   L0418C4
L0418A3  LDA   $23
         CMP   #$8900
         BEQ   L0418AD
         BRL   L0418B5
L0418AD  LDA   #$000C
         STA   $16
         BRL   L0418C4
L0418B5  LDA   $23
         CMP   #$8D00
         BEQ   L0418BF
         BRL   L0418C4
L0418BF  LDA   #$000D
         STA   $16
L0418C4  LDA   $21
         STA   $23
         LDA   $20
         STA   $22
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0022
         TCS
         TXA
         RTL

L0418D7  TSC
         SEC
         SBC   #$0032
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
         PEA   $0008
         JSL   L014B1E
         PHA
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $3B
         LDA   $39
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _LoadResource
         STA   L014E87
         PLA
         STA   $26
         PLA
         STA   $28
         LDX   $28
         LDA   $26
         PHX
         PHA
         _HLock
         STA   L014E87
         PHA
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$07FF
         BEQ   L041959
         BRL   L041AE0
L041959  PHA
         PHA
         LDA   #$8001
         PHA
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $2E
         PLA
         STA   $30
         LDA   #$0000
         STA   $1E
         LDY   #$0002
         LDA   [$2E],Y
         TAX
         LDA   [$2E]
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         CLC
         ADC   #$0004
         STA   $22
         LDA   #$0000
         STA   $20
         LDY   #$0002
         LDA   [$2E],Y
         TAX
         LDA   [$2E]
         STA   $00
         STX   $02
         LDY   #$0006
         LDA   [$00],Y
         LDX   #$0002
         JSL   L0153FB
         CLC
         ADC   #$0008
         STA   $24
         PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         TAX
         LDY   #$001E
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $2A
         PLA
         STA   $2C
         LDA   L014E87
         BEQ   L0419FE
         BRL   L041A63
L0419FE  LDX   $2C
         LDA   $2A
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   $22
         CLC
         ADC   #$000C
         STA   $22
         PHA
         LDY   #$0002
         LDA   [$2A],Y
         PHA
         LDA   [$2A]
         PHA
         _StringWidth
         STA   L014E87
         PLA
         CLC
         ADC   $24
         CLC
         ADC   #$0008
         STA   $24
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         TAX
         LDY   #$001E
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
L041A63  LDA   $1C
         SEC
         SBC   $18
         LDX   #$0002
         JSL   L0153AF
         CLC
         ADC   $18
         STA   $18
         LDA   $24
         LDX   #$0002
         JSL   L0153AF
         PHA
         LDA   $18
         SEC
         SBC   $01,S
         PLX
         STA   $18
         LDA   $18
         CLC
         ADC   $24
         STA   $1C
         LDA   $1A
         SEC
         SBC   $16
         LDX   #$0002
         JSL   L0153AF
         CLC
         ADC   $16
         STA   $16
         LDA   $22
         LDX   #$0002
         JSL   L0153AF
         PHA
         LDA   $16
         SEC
         SBC   $01,S
         PLX
         STA   $16
         LDA   $16
         CLC
         ADC   $22
         STA   $1A
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
         BRL   L041BCA
L041AE0  PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $2A
         PLA
         STA   $2C
         LDA   L014E87
         BEQ   L041B17
         BRL   L041BCA
L041B17  LDX   $2C
         LDA   $2A
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   $1C
         SEC
         SBC   $18
         PHA
         PHA
         LDY   #$0002
         LDA   [$2A],Y
         PHA
         LDA   [$2A]
         PHA
         _StringWidth
         STA   L014E87
         PLA
         CLC
         ADC   #$001E
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L041B54
         BVS   L041B52
         EOR   #$8000
L041B52  BMI   L041B57
L041B54  BRL   L041B9B
L041B57  PHA
         LDY   #$0002
         LDA   [$2A],Y
         PHA
         LDA   [$2A]
         PHA
         _StringWidth
         STA   L014E87
         PLA
         CLC
         ADC   $18
         CLC
         ADC   #$001E
         STA   $1C
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
L041B9B  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$26],Y
         TAX
         LDA   [$26]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
L041BCA  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $3B
         LDA   $39
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _ReleaseResource
         STA   L014E87
         LDA   $33
         STA   $3B
         LDA   $32
         STA   $3A
         PLD
         TSC
         CLC
         ADC   #$003A
         TCS
         RTL

L041C02  ENT
         TSC
         SEC
         SBC   #$0066
         TCS
         PHD
         INC
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $73
         PEI   $71
         PEA   $0004
         JSL   L014B1E
         LDX   $77
         LDA   $75
         STX   L0146B6
         STA   L0146B4
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$0060
         LDA   [$00],Y
         PHA
         JSL   L0416CB
         STA   $5A
         LDX   $6D
         LDA   $6B
         PHX
         PHA
         JSL   L0206AF
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         JSL   L020E29
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _GlobalToLocal
         STA   L014E87
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L041C84
         BRL   L041C90
L041C84  LDA   #$000D
         SEC
         SBC   #$0001
         CLC
         ADC   $1A
         STA   $1A
L041C90  LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L041CA9
         BRL   L041CC7
L041CA9  LDA   #$0001
         PHA
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $1A
         SEC
         SBC   $01,S
         PLX
         STA   $1A
L041CC7  LDA   #$0000
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$0001
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$0002
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$0003
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$0004
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         LDA   #$0005
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$0006
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         LDA   #$0007
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$0008
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$0009
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$000A
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$000B
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$000C
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$000D
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         LDA   #$000E
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$000F
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         LDA   #$0010
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$0011
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$0012
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$0013
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$0014
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         LDA   #$0015
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$0016
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         LDA   #$0017
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$0018
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$0019
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$001A
         TAX
         SEP   #$20
         LDA   #$00
         STA   $32,X
         REP   #$20
         LDA   #$001B
         TAX
         SEP   #$20
         LDA   #$BB
         STA   $32,X
         REP   #$20
         LDA   #$001C
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$001D
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         LDA   #$001E
         TAX
         SEP   #$20
         LDA   #$0B
         STA   $32,X
         REP   #$20
         LDA   #$001F
         TAX
         SEP   #$20
         LDA   #$B0
         STA   $32,X
         REP   #$20
         PEA   ^L0146B8
         PEA   L0146B8
         LDY   #$0002
         LDA   [$79],Y
         PHA
         LDA   [$79]
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
         ADC   #$002A
         PHA
         PEA   ^L0146B8
         PEA   L0146B8
         PEA   $0008
         JSL   L014B1E
         PHA
         LDY   #$0002
         LDA   [$79],Y
         TAX
         LDA   [$79]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$8900
         BEQ   L041EA6
         BRL   L041EB0
L041EA6  LDA   L0146BE
         CLC
         ADC   #$0018
         STA   L0146BE
L041EB0  LDA   $69
         CMP   #$0001
         BEQ   L041EBA
         BRL   L041F3C
L041EBA  PEA   $0000
         TDC
         CLC
         ADC   #$0022
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         PEA   $0008
         JSL   L014B1E
         LDA   $22
         SEC
         SBC   $16
         STA   $22
         LDA   $24
         SEC
         SBC   $18
         STA   $24
         LDA   $26
         SEC
         SBC   $16
         STA   $26
         LDA   $28
         SEC
         SBC   $18
         STA   $28
         PHA
         PHA
         LDX   #^L040127
         LDA   #L040127
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0032
         PHA
         LDA   $18
         PHA
         LDA   $16
         PHA
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0022
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0234
         CLC
         ADC   $5A
         PHA
         _DragRect
         STA   L014E87
         PLA
         STA   $52
         PLA
         STA   $54
         BRL   L041F83
L041F3C  PHA
         PHA
         LDX   #^L040023
         LDA   #L040023
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0032
         PHA
         LDA   $18
         PHA
         LDA   $16
         PHA
         LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0220
         PHA
         _DragRect
         STA   L014E87
         PLA
         STA   $52
         PLA
         STA   $54
L041F83  PHA
         LDY   #$0002
         LDA   [$79],Y
         TAX
         LDA   [$79]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$8900
         BEQ   L041FB0
         BRL   L041FBA
L041FB0  LDA   L0146BE
         SEC
         SBC   #$0018
         STA   L0146BE
L041FBA  PHA
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _LoadResource
         STA   L014E87
         PLA
         STA   $56
         PLA
         STA   $58
         LDA   L014E87
         PHA
         LDA   #$1035
         PHA
         JSL   L020000
         LDX   $58
         LDA   $56
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1036
         PHA
         JSL   L020000
         LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         PEA   ^L0146B8
         PEA   L0146B8
         PEA   $0008
         JSL   L014B1E
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L04203F
         BRL   L04206B
L04203F  LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$000E
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0006
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L042204
L04206B  LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L042084
         BRL   L042125
L042084  LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDA   #$000D
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0420C2
         BRL   L0420F9
L0420C2  LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         EOR   #$FFFF
         INC
         CLC
         ADC   #$0001
         PHA
         _OffsetRect
         STA   L014E87
L0420F9  LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0004
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L042204
L042125  LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L04213E
         BRL   L0421DB
L04213E  LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L042157
         BRL   L04217C
L042157  LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDA   #$000D
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
L04217C  LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0004
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L042204
L0421DB  LDY   #$0002
         LDA   [$56],Y
         PHA
         LDA   [$56]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0004
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
L042204  PHA
         LDY   #$0002
         LDA   [$79],Y
         TAX
         LDA   [$79]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$8700
         BEQ   L042231
         BRL   L04225B
L042231  LDY   #$0002
         LDA   [$56],Y
         TAX
         LDA   [$56]
         CLC
         ADC   #$000C
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         LDY   #$0002
         LDA   [$56],Y
         TAX
         LDA   [$56]
         CLC
         ADC   #$000A
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L04225B  LDA   #$0001
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _MarkResourceChange
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1037
         PHA
         JSL   L020000
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1038
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1039
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         PLA
         STA   $52
         PLA
         STA   $54
         PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         _GetPortRect
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0022
         PHA
         _GetPortRect
         STA   L014E87
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L042342
         BRL   L042360
L042342  PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$000E
         PHA
         LDA   #$0006
         PHA
         _InsetRect
         STA   L014E87
         BRL   L0423DB
L042360  PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         LDA   #$0004
         PHA
         LDA   #$0002
         PHA
         _InsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L042394
         BRL   L0423A4
L042394  LDA   #$0001
         PHA
         LDA   $1A
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $1A
L0423A4  LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0423BD
         BRL   L0423DB
L0423BD  LDA   #$0001
         PHA
         LDY   #$0002
         LDA   [$75],Y
         TAX
         LDA   [$75]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         CLC
         ADC   $1A
         SEC
         SBC   $01,S
         PLX
         STA   $1A
L0423DB  PEA   $0000
         TDC
         CLC
         ADC   #$001A
         PHA
         _SetPortRect
         STA   L014E87
         PHA
         _GetArcRot
         STA   L014E87
         PLA
         STA   $5C
         LDA   $5C
         AND   #$8000
         BNE   L042406
         BRL   L042416
L042406  LDA   $5C
         EOR   #$8000
         PHA
         _SetArcRot
         STA   L014E87
L042416  LDX   $7B
         LDA   $79
         PHX
         PHA
         _HideControl
         STA   L014E87
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _DisposeControl
         STA   L014E87
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $54
         LDA   $52
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $62
         PLA
         STA   $64
         LDA   #$8004
         PHA
         LDX   $54
         LDA   $52
         PHX
         PHA
         _DetachResource
         STA   L014E87
         LDY   #$0002
         LDA   [$62],Y
         TAX
         LDA   [$62]
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
         BEQ   L04248C
         DEY
L04248C  TXA
         CMP   $03,S
         BEQ   L042494
         LDY   #$0000
L042494  PLA
         PLA
         TYA
         BNE   L04249C
         BRL   L042524
L04249C  LDY   #$0002
         LDA   [$62],Y
         TAX
         LDA   [$62]
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
         BPL   L0424CA
         DEX
L0424CA  LDY   #$0001
         CMP   $01,S
         BEQ   L0424D2
         DEY
L0424D2  TXA
         CMP   $03,S
         BEQ   L0424DA
         LDY   #$0000
L0424DA  PLA
         PLA
         TYA
         BNE   L0424E2
         BRL   L042524
L0424E2  LDY   #$0002
         LDA   [$62],Y
         TAX
         LDA   [$62]
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
         LDA   [$62],Y
         PHA
         LDA   [$62]
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
L042524  PHA
         PHA
         LDX   $6D
         LDA   $6B
         PHX
         PHA
         LDA   #$0001
         PHA
         LDX   $64
         LDA   $62
         PHX
         PHA
         _NewControl2
         STA   L014E87
         PLA
         STA   $79
         PLA
         STA   $7B
         LDY   #$0002
         LDA   [$75],Y
         PHA
         LDA   [$75]
         PHA
         PLA
         CLC
         ADC   #$0072
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   $52
         STA   [$00]
         LDY   #$0002
         LDA   $54
         STA   [$00],Y
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _HideControl
         STA   L014E87
         LDX   $54
         LDA   $52
         PHX
         PHA
         LDX   $7B
         LDA   $79
         PHX
         PHA
         _SetCtlRefCon
         STA   L014E87
         LDX   $7B
         LDA   $79
         PHX
         PHA
         LDX   $77
         LDA   $75
         PHX
         PHA

	 ldal	$e12100
	 inc
	 stal	$e12100
	 
         JSL   L0409AD
         LDA   $5C
         PHA
         _SetArcRot
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$0022
         PHA
         _SetPortRect
         STA   L014E87
         PHA
         LDY   #$0002
         LDA   [$79],Y
         TAX
         LDA   [$79]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         PHA
         JSL   L0417C9
         STA   $5A
         LDA   $5A
         LDX   #$0000
         CMP   #$000A
         BNE   L0425F3
         INX
L0425F3  TXA
         PHA
         LDA   $5A
         LDX   #$0000
         CMP   #$000F
         BNE   L042600
         INX
L042600  TXA
         ORA   $01,S
         PLX
         PHA
         LDA   $5A
         LDX   #$0000
         CMP   #$0009
         BNE   L042610
         INX
L042610  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L04261A
         BRL   L04262D
L04261A  LDX   $7B
         LDA   $79
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$002A
         PHA
         JSL   L0418D7
L04262D  PHA
         LDY   #$0002
         LDA   [$79],Y
         TAX
         LDA   [$79]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$8900
         BEQ   L04265A
         BRL   L042664
L04265A  LDA   L0146BE
         CLC
         ADC   #$0018
         STA   L0146BE
L042664  LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         LDA   $5A
         PHA
         JSL   L0208DC
         LDA   $67
         STA   $7B
         LDA   $66
         STA   $7A
         PLD
         TSC
         CLC
         ADC   #$007A
         TCS
         RTL

L042683  ENT
         TSC
         SEC
         SBC   #$0046
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDX   $4D
         LDA   $4B
         PHX
         PHA
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$0074
         LDA   [$00],Y
         TAX
         LDY   #$0072
         LDA   [$00],Y
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $38
         PLA
         STA   $3A
         LDA   L014E87
         PHA
         LDA   #$1F34
         PHA
         JSL   L020000
         LDX   $4D
         LDA   $4B
         PHX
         PHA
         JSL   L0206AF
         PEA   ^L0146B8
         PEA   L0146B8
         LDY   #$0002
         LDA   [$38],Y
         PHA
         LDA   [$38]
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
         ADC   #$0026
         PHA
         PEA   ^L0146B8
         PEA   L0146B8
         PEA   $0008
         JSL   L014B1E
         LDA   $49
         CMP   #$0008
         BEQ   L04270F
         BRL   L042730
L04270F  LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0000
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L0427A6
L042730  LDA   $49
         CMP   #$000A
         BEQ   L04273A
         BRL   L042757
L04273A  LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         LDA   #$0000
         PHA
         LDA   #$0001
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L0427A6
L042757  LDA   $49
         CMP   #$000B
         BEQ   L042761
         BRL   L042782
L042761  LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         LDA   #$0000
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L0427A6
L042782  LDA   $49
         CMP   #$0015
         BEQ   L04278C
         BRL   L0427A6
L04278C  LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         LDA   #$0002
         PHA
         LDA   #$0000
         PHA
         _OffsetRect
         STA   L014E87
L0427A6  PHA
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _LoadResource
         STA   L014E87
         PLA
         STA   $32
         PLA
         STA   $34
         LDA   L014E87
         PHA
         LDA   #$1F35
         PHA
         JSL   L020000
         LDX   $34
         LDA   $32
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1F36
         PHA
         JSL   L020000
         LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         PEA   ^L0146B8
         PEA   L0146B8
         PEA   $0008
         JSL   L014B1E
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L04282B
         BRL   L042857
L04282B  LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$000E
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0006
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L0429F0
L042857  LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L042870
         BRL   L042911
L042870  LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDA   #$000D
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L0428AE
         BRL   L0428E5
L0428AE  LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         EOR   #$FFFF
         INC
         CLC
         ADC   #$0001
         PHA
         _OffsetRect
         STA   L014E87
L0428E5  LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0004
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L0429F0
L042911  LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L04292A
         BRL   L0429C7
L04292A  LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L042943
         BRL   L042968
L042943  LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDA   #$000D
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
L042968  LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0000
         PHA
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0004
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
         BRL   L0429F0
L0429C7  LDY   #$0002
         LDA   [$32],Y
         PHA
         LDA   [$32]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         LDA   #$0004
         EOR   #$FFFF
         INC
         PHA
         LDA   #$0002
         EOR   #$FFFF
         INC
         PHA
         _OffsetRect
         STA   L014E87
L0429F0  PHA
         LDY   #$0002
         LDA   [$38],Y
         TAX
         LDA   [$38]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$8700
         BEQ   L042A1D
         BRL   L042A47
L042A1D  LDY   #$0002
         LDA   [$32],Y
         TAX
         LDA   [$32]
         CLC
         ADC   #$000C
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         LDY   #$0002
         LDA   [$32],Y
         TAX
         LDA   [$32]
         CLC
         ADC   #$000A
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L042A47  LDA   #$0001
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _MarkResourceChange
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1F37
         PHA
         JSL   L020000
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1F38
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         PHA
         PHA
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1F39
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _GetCtlRefCon
         STA   L014E87
         PLA
         STA   $2E
         PLA
         STA   $30
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
         ADC   #$001E
         PHA
         _GetPortRect
         STA   L014E87
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$2000
         BNE   L042B2E
         BRL   L042B4C
L042B2E  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         LDA   #$000E
         PHA
         LDA   #$0006
         PHA
         _InsetRect
         STA   L014E87
         BRL   L042BC7
L042B4C  PEA   $0000
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
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$8000
         BNE   L042B80
         BRL   L042B90
L042B80  LDA   #$0001
         PHA
         LDA   $16
         CLC
         ADC   #$000D
         SEC
         SBC   $01,S
         PLX
         STA   $16
L042B90  LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0010
         BNE   L042BA9
         BRL   L042BC7
L042BA9  LDA   #$0001
         PHA
         LDY   #$0002
         LDA   [$4F],Y
         TAX
         LDA   [$4F]
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
L042BC7  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         _SetPortRect
         STA   L014E87
         PHA
         _GetArcRot
         STA   L014E87
         PLA
         STA   $3C
         LDA   $3C
         AND   #$8000
         BNE   L042BF2
         BRL   L042C02
L042BF2  LDA   $3C
         EOR   #$8000
         PHA
         _SetArcRot
         STA   L014E87
L042C02  LDX   $3A
         LDA   $38
         PHX
         PHA
         _HideControl
         STA   L014E87
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _DisposeControl
         STA   L014E87
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $30
         LDA   $2E
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $42
         PLA
         STA   $44
         LDA   #$8004
         PHA
         LDX   $30
         LDA   $2E
         PHX
         PHA
         _DetachResource
         STA   L014E87
         LDY   #$0002
         LDA   [$42],Y
         TAX
         LDA   [$42]
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
         BEQ   L042C78
         DEY
L042C78  TXA
         CMP   $03,S
         BEQ   L042C80
         LDY   #$0000
L042C80  PLA
         PLA
         TYA
         BNE   L042C88
         BRL   L042D10
L042C88  LDY   #$0002
         LDA   [$42],Y
         TAX
         LDA   [$42]
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
         BPL   L042CB6
         DEX
L042CB6  LDY   #$0001
         CMP   $01,S
         BEQ   L042CBE
         DEY
L042CBE  TXA
         CMP   $03,S
         BEQ   L042CC6
         LDY   #$0000
L042CC6  PLA
         PLA
         TYA
         BNE   L042CCE
         BRL   L042D10
L042CCE  LDY   #$0002
         LDA   [$42],Y
         TAX
         LDA   [$42]
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
         LDA   [$42],Y
         PHA
         LDA   [$42]
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
L042D10  PHA
         PHA
         LDX   $4D
         LDA   $4B
         PHX
         PHA
         LDA   #$0001
         PHA
         LDX   $44
         LDA   $42
         PHX
         PHA
         _NewControl2
         STA   L014E87
         PLA
         STA   $38
         PLA
         STA   $3A
         LDY   #$0002
         LDA   [$4F],Y
         PHA
         LDA   [$4F]
         PHA
         PLA
         CLC
         ADC   #$0072
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   $2E
         STA   [$00]
         LDY   #$0002
         LDA   $30
         STA   [$00],Y
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _HideControl
         STA   L014E87
         LDX   $30
         LDA   $2E
         PHX
         PHA
         LDX   $3A
         LDA   $38
         PHX
         PHA
         _SetCtlRefCon
         STA   L014E87
         LDX   $3A
         LDA   $38
         PHX
         PHA
         LDX   $51
         LDA   $4F
         PHX
         PHA

	 ldal	$e12120
	 inc
	 stal	$e12120
	 
         JSL   L0409AD
         LDA   $3C
         PHA
         _SetArcRot
         STA   L014E87
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         _SetPortRect
         STA   L014E87
         PHA
         LDY   #$0002
         LDA   [$38],Y
         TAX
         LDA   [$38]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         PHA
         JSL   L0417C9
         STA   $36
         LDA   $36
         LDX   #$0000
         CMP   #$000A
         BNE   L042DDF
         INX
L042DDF  TXA
         PHA
         LDA   $36
         LDX   #$0000
         CMP   #$000F
         BNE   L042DEC
         INX
L042DEC  TXA
         ORA   $01,S
         PLX
         PHA
         LDA   $36
         LDX   #$0000
         CMP   #$0009
         BNE   L042DFC
         INX
L042DFC  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L042E06
         BRL   L042E19
L042E06  LDX   $3A
         LDA   $38
         PHX
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0026
         PHA
         JSL   L0418D7
L042E19  PHA
         LDY   #$0002
         LDA   [$38],Y
         TAX
         LDA   [$38]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         CMP   #$8900
         BEQ   L042E46
         BRL   L042E50
L042E46  LDA   L0146BE
         CLC
         ADC   #$0018
         STA   L0146BE
L042E50  LDX   #^L0146B8
         LDA   #L0146B8
         PHX
         PHA
         LDA   $36
         PHA
         JSL   L0208DC
         LDA   $47
         STA   $51
         LDA   $46
         STA   $50
         PLD
         TSC
         CLC
         ADC   #$0050
         TCS
         RTL

L042E6F  ENT
         TSC
         SEC
         SBC   #$0036
         TCS
         PHD
         INC
         TCD
         PHA
         LDX   $3F
         LDA   $3D
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L042E93
         INX
L042E93  TXA
         PHA
         PHA
         LDX   $3F
         LDA   $3D
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0000
         CMP   #$0000
         BNE   L042EB0
         INX
L042EB0  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L042EBA
         BRL   L042EBD
L042EBA  BRL   L0434D2
L042EBD  LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0002
         BNE   L042ED6
         BRL   L042FED
L042ED6  LDY   #$0002
         LDA   [$39],Y
         PHA
         LDA   [$39]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         EOR   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L042F0B
         DEX
L042F0B  PHX
         PHA
         LDY   #$0002
         LDA   [$39],Y
         PHA
         LDA   [$39]
         PHA
         PLA
         CLC
         ADC   #$0056
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
         PEA   $0000
         PEA   $0000
         LDX   $3F
         LDA   $3D
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $2E
         PLA
         STA   $30
         PHA
         LDY   #$0002
         LDA   [$2E],Y
         TAX
         LDA   [$2E]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         PHA
         JSL   L0417C9
         LDX   #$0000
         TAY
         BPL   L042F7A
         DEX
L042F7A  STX   $34
         STA   $32
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L042F88
         DEX
L042F88  LDY   #$0000
         CMP   $32
         BNE   L042F91
         CPX   $34
L042F91  BNE   L042F94
         INY
L042F94  TYA
         PHA
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L042FA0
         DEX
L042FA0  LDY   #$0000
         CMP   $32
         BNE   L042FA9
         CPX   $34
L042FA9  BNE   L042FAC
         INY
L042FAC  TYA
         ORA   $01,S
         PLX
         PHA
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L042FBB
         DEX
L042FBB  LDY   #$0000
         CMP   $32
         BNE   L042FC4
         CPX   $34
L042FC4  BNE   L042FC7
         INY
L042FC7  TYA
         ORA   $01,S
         PLX
         TAX
         BNE   L042FD1
         BRL   L042FEA
L042FD1  LDX   $30
         LDA   $2E
         PHX
         PHA
         LDY   #$0002
         LDA   [$2E],Y
         PHA
         LDA   [$2E]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         JSL   L0418D7
L042FEA  BRL   L04348E
L042FED  LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         BNE   L043006
         BRL   L04348E
L043006  PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDX   $3F
         LDA   $3D
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         PLA
         STA   $2E
         PLA
         STA   $30
         PHA
         LDY   #$0002
         LDA   [$2E],Y
         TAX
         LDA   [$2E]
         STA   $00
         STX   $02
         LDY   #$0016
         LDA   [$00],Y
         TAX
         LDY   #$0014
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         PHA
         JSL   L0417C9
         LDX   #$0000
         TAY
         BPL   L043055
         DEX
L043055  STX   $34
         STA   $32
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L043063
         DEX
L043063  LDY   #$0000
         CMP   $32
         BNE   L04306C
         CPX   $34
L04306C  BNE   L04306F
         INY
L04306F  TYA
         PHA
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L04307B
         DEX
L04307B  LDY   #$0000
         CMP   $32
         BNE   L043084
         CPX   $34
L043084  BNE   L043087
         INY
L043087  TYA
         ORA   $01,S
         PLX
         PHA
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L043096
         DEX
L043096  LDY   #$0000
         CMP   $32
         BNE   L04309F
         CPX   $34
L04309F  BNE   L0430A2
         INY
L0430A2  TYA
         ORA   $01,S
         PLX
         TAX
         BNE   L0430AC
         BRL   L0430C5
L0430AC  LDX   $30
         LDA   $2E
         PHX
         PHA
         LDY   #$0002
         LDA   [$2E],Y
         PHA
         LDA   [$2E]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         JSL   L0418D7
L0430C5  PHA
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $1E
         PLA
         STA   $20
         LDA   L014E87
         PHA
         LDA   #$1043
         PHA
         JSL   L020000
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1044
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _GetHandleSize
         STA   L014E87
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L014E87
         PHA
         LDA   #$1045
         PHA
         JSL   L020000
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0004
         JSL   L0153AF
         STA   $22
         LDA   $22
         SEC
         SBC   #$0001
         STA   $24
L043163  LDA   $24
         BMI   L04316A
         DEC
         BPL   L04316D
L04316A  BRL   L04320E
L04316D  LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDA   $24
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
         STX   $1C
         STA   $1A
         PHA
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         PHA
         PHA
         LDX   $3F
         LDA   $3D
         PHX
         PHA
         _HiWord
         STA   L014E87
         PLA
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L0431C1
         LDA   #$0001
L0431C1  EOR   #$0001
         PHA
         PHA
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         PHA
         PHA
         LDX   $3F
         LDA   $3D
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L0431F4
         LDA   #$0001
L0431F4  EOR   #$0001
         AND   $01,S
         PLX
         TAX
         BNE   L043200
         BRL   L043203
L043200  BRL   L043211
L043203  LDA   $24
         SEC
         SBC   #$0001
         STA   $24
         BRL   L043163
L04320E  BRL   L0434D2
L043211  LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDA   $24
         CLC
         ADC   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
         PHA
         LDA   $24
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   $24
         LDX   #$0004
         JSL   L0153FB
         PHA
         LDA   $22
         LDX   #$0004
         JSL   L0153FB
         SEC
         SBC   $01,S
         PLX
         LDX   #$0000
         TAY
         BPL   L043259
         DEX
L043259  PHX
         PHA
         _BlockMove
         STA   L014E87
         LDY   #$0002
         LDA   [$1E],Y
         PHA
         LDA   [$1E]
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
         STX   $1C
         STA   $1A
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _HUnlock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1047
         PHA
         JSL   L020000
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L0432B1
         DEX
L0432B1  PHX
         PHA
         PEI   $18
         PEI   $16
         SEC
         PLA
         SBC   $03,S
         STA   $03,S
         PLA
         SBC   $03,S
         STA   $03,S
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _SetHandleSize
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1048
         PHA
         JSL   L020000
         LDX   $20
         LDA   $1E
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1049
         PHA
         JSL   L020000
         LDA   #$0001
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _MarkResourceChange
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1050
         PHA
         JSL   L020000
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1051
         PHA
         JSL   L020000
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1052
         PHA
         JSL   L020000
         LDA   #$0004
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         SEC
         SBC   $01,S
         PLX
         PHA
         LDA   #$0008
         SEC
         SBC   $01,S
         PLY
         TAY
         BVS   L0433C7
         EOR   #$8000
L0433C7  BMI   L0433CC
         BRL   L04348E
L0433CC  LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _RemoveResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1053
         PHA
         JSL   L020000
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         BNE   L043418
         BRL   L043443
L043418  LDY   #$0002
         LDA   [$39],Y
         PHA
         LDA   [$39]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         EOR   #$0009
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L043443  LDY   #$0002
         LDA   [$39],Y
         PHA
         LDA   [$39]
         PHA
         PLA
         CLC
         ADC   #$005A
         PHA
         LDY   #$0002
         LDA   [$39],Y
         TAX
         LDA   [$39]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         ORA   #$0002
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDY   #$0002
         LDA   [$39],Y
         PHA
         LDA   [$39]
         PHA
         PLA
         CLC
         ADC   #$0056
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   $1A
         STA   [$00]
         LDY   #$0002
         LDA   $1C
         STA   [$00],Y
L04348E  PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDX   $3F
         LDA   $3D
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
         LDX   $3F
         LDA   $3D
         PHX
         PHA
         _GetCtlHandleFromID
         STA   L014E87
         _DisposeControl
         STA   L014E87
L0434D2  LDA   $37
         STA   $3F
         LDA   $36
         STA   $3E
         PLD
         TSC
         CLC
         ADC   #$003E
         TCS
         RTL

L0434E2  ENT
         TSC
         SEC
         SBC   #$0022
         TCS
         PHD
         INC
         TCD
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         LDX   #$0000
         CMP   #$0000
         BNE   L043508
         INX
L043508  TXA
         PHA
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0002
         LDX   #$0000
         CMP   #$0000
         BNE   L043527
         INX
L043527  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L043531
         BRL   L043534
L043531  BRL   L0436E8
L043534  LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0002
         BNE   L04354D
         BRL   L04358B
L04354D  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1056
         PHA
         JSL   L020000
         BRL   L0436E8
L04358B  LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $00
         STX   $02
         LDY   #$005A
         LDA   [$00],Y
         AND   #$0009
         BNE   L0435A4
         BRL   L0436E8
L0435A4  PHA
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L014E87
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L014E87
         PHA
         LDA   #$1057
         PHA
         JSL   L020000
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1058
         PHA
         JSL   L020000
         PHA
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _GetHandleSize
         STA   L014E87
         PLA
         STA   $1A
         PLA
         STA   $1C
         LDA   L014E87
         PHA
         LDA   #$1059
         PHA
         JSL   L020000
         LDA   #$0001
         PHA
         PHA
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _LoWord
         STA   L014E87
         PLA
         LDX   #$0004
         JSL   L0153AF
         SEC
         SBC   $01,S
         PLX
         STA   $1E
         LDA   $1E
         STA   $06
         LDA   #$0001
         STA   $20
         LDA   $06
         SEC
         SBC   $20
         BVS   L043655
         EOR   #$8000
L043655  BMI   L04365A
         BRL   L0436AD
L04365A  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         LDA   $20
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
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1060
         PHA
         JSL   L020000
         LDA   $06
         CMP   $20
         BNE   L0436A8
         BRL   L0436AD
L0436A8  INC   $20
         BRL   L04365A
L0436AD  LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8003
         PHA
         LDY   #$0002
         LDA   [$25],Y
         TAX
         LDA   [$25]
         STA   $00
         STX   $02
         LDY   #$0058
         LDA   [$00],Y
         TAX
         LDY   #$0056
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L014E87
         LDA   L014E87
         PHA
         LDA   #$1061
         PHA
         JSL   L020000
L0436E8  LDA   $23
         STA   $27
         LDA   $22
         STA   $26
         PLD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL


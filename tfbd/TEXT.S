
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

	mx	%00
	rel
	lst	off

*-----------------------

	use	4/Event.Macs
	use	4/Misc.Macs
	use	4/Util.Macs

	use	TEXT.E
	
*-----------------------

L030000  DW    $0000
L030002  DW    $0000
L030004  DW    $0000

L030006  ENT
         PHB
         PEA   $0000
         PLB
         PLB
         PHP
         SEP   #$30
         LDA   #$80
         TRB   $C029
         STA   $C001
         STA   $C054
         STA   $C051
         STA   $C00D
         JSL   L030035
         DB    $00
         DB    $17
         DB    $00
         DB    $4F
         JSL   L0300D1
         LDA   #$DF
         STAL  L030000
         PLP
         PLB
         RTL

L030035  ENT
         PHP
         REP   #$30
         LDA   $03,S
         STA   $01
         LDA   $02,S
         INC
         STA   $00
         SEP   #$30
         LDY   #$01
         LDA   [$00]
         STA   $20
         LDA   [$00],Y
         INC
         STA   $21
         SEC
         SBC   $20
         STA   $24
         INY
         LDA   [$00],Y
         STA   $22
         INY
         LDA   [$00],Y
         INC
         STA   $23
         SEC
         SBC   $22
         STA   $25
         REP   #$30
         LDA   $00
         CLC
         ADC   #$0003
         STA   $02,S
         PLP
         RTL

L03006F  ENT
         PHP
         SEP   #$20
         REP   #$10
         STA   $26
         REP   #$30
         AND   #$00FF
         PHA
         AND   #$0007
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         ASL
         STA   $2E
         PLA
         LSR
         LSR
         LSR
         TAX
         LDA   #$0000
         CLC
L030091  DEX
         BMI   L030099
         ADC   #$0028
         BCC   L030091
L030099  ADC   $2E
         ADC   #$0400
         LDX   #$0000	; AV 20XX - was #$00E0 originally
         STX   $29
         STA   $28
         PLP
L0300A6  RTL

L0300A7  PHP
         SEP   #$30
         PEI   $27
         LDA   $20
         STA   $26
         LDA   $22
         STA   $27
         LDX   $24
L0300B6  PHX
         LDA   $26
         JSL   L03006F
         JSL   L0300F7
         INC   $26
         PLX
         DEX
         BNE   L0300B6
         PLA
         STA   $27
         PLA
         JSL   L03006F
         PLP
         RTL

L0300D1  ENT
         PHP
         SEP   #$30
         JSL   L0300A7
         LDX   $22
         LDY   $20
         JSL   L0300E2
         PLP
         RTL

L0300E2  ENT
         PHP
         SEP   #$30
         STX   $27
         TYA
         JSL   L03006F
         PLP
         RTL

L0300EE  ENT
         PHP
         SEP   #$30
         LDX   $27
         LDY   $26
         PLP
         RTL

L0300F7  ENT
         PHP
         SEP   #$30
         LDY   $27
         LDA   #$A0
L0300FE  JSL   L030109
         INY
         CPY   $23
         BCC   L0300FE
         PLP
         RTL

L030109  PHP
         SEP   #$30
         PHY
         PHA
         TYA
         STAL  $E0C054
         LSR
         BCS   L03011A
         STAL  $E0C055
L03011A  TAY
         LDAL  L030591
         BEQ   L03012F
         PLA
         AND   #$7F
         CMP   #$40
         BCC   L030130
         CMP   #$60
         BCS   L030130
         AND   #$1F
         PHA
L03012F  PLA
L030130  STA   [$28],Y
         STAL  $E0C054
         PLY
         PLP
         RTL

L030139  ENT
         PHP
         SEP   #$30
         PEI   $26
         LDA   $20
L030140  STA   $26
         JSL   L03006F
         LDA   $28
         STA   $2B
         LDA   $29
         STA   $2C
         LDA   $2A
         STA   $2D
         LDA   $26
         INC
         JSL   L03006F
         LDY   $22
L03015B  PHY
         TYA
         LSR
         TAY
         STAL  $E0C054
         BCS   L030169
         STAL  $E0C055
L030169  LDA   [$28],Y
         STA   [$2B],Y
         STAL  $E0C054
         PLY
         INY
         CPY   $23
         BCC   L03015B
         LDA   $26
         INC
         CMP   $21
         PHP
         DEC
         PLP
         BCC   L030140
         LDA   $22
         STA   $27
         JSL   L0300F7
         PLA
         JSL   L03006F
         PLA
         STA   $27
         PLP
         RTL

L030193  ENT
         PHP
         SEP   #$30
         PEI   $26
         LDA   $20
         STA   $26
         LDA   $21
         DEC
         BPL   L0301A4
         BRL   L0301E7
L0301A4  STA   $26
         JSL   L03006F
         LDA   $28
         STA   $2B
         LDA   $29
         STA   $2C
         LDA   $2A
         STA   $2D
         LDA   $26
         DEC
         JSL   L03006F
         LDY   $22
L0301BF  PHY
         TYA
         LSR
         TAY
         STAL  $E0C054
         BCS   L0301CD
         STAL  $E0C055
L0301CD  LDA   [$28],Y
         STA   [$2B],Y
         STAL  $E0C054
         PLY
         INY
         CPY   $23
         BCC   L0301BF
         LDA   $26
         DEC
         BMI   L0301E7
         CMP   $20
         PHP
         INC
         PLP
         BCS   L0301A4
L0301E7  LDA   $22
         STA   $27
         JSL   L0300F7
         PLA
         JSL   L03006F
         PLA
         STA   $27
         PLP
         RTL

L0301F9  ENT
         PHP
         SEP   #$30
         LDY   $27
         JSL   L030109
         PLP
L030203  PHP
         SEP   #$30
         LDY   $27
         INY
         STY   $27
         CPY   $23
         BCS   L030211
         PLP
         RTL

L030211  LDA   $22
         STA   $27
L030215  PLP
L030216  PHP
         SEP   #$30
         LDA   $26
         INC
         CMP   $21
         BCC   L030227
         DEC
         PHA
         JSL   L030139
         PLA
L030227  JSL   L03006F
         PLP
         RTL

L03022D  ENT
         PHB
         PHK
         PLB
         PHP
         SEP   #$30
         TAX
         AND   #$7F
         CMP   #$20
         BCS   L030248
         LDX   #$07
L03023C  CMPL  L030261,X
         BEQ   L030250
         DEX
         BPL   L03023C
         PLP
         PLB
         RTL

L030248  TXA
         JSL   L0301F9
L03024D  PLP
         PLB
         RTL

L030250  TXA
         ASL
         TAX
         PHK
         PER   L03024D-1
         PHK
         LDA   L030269+1,X
         PHA
         LDA   L030269,X
         PHA
         RTL

L030261  DB    $07
         DB    $08
         DB    $0A
         DB    $0B
         DB    $0C
         DB    $0D
         DB    $15
         DB    $18
L030269  DA    L030279-1
         DA    L030294-1
         DA    L030216-1
         DA    L0302AD-1
         DA    L0300A7-1
         DA    L0302C3-1
         DA    L030203-1
         DA    L030285-1

L030279  PHP
         REP   #$30
         _SysBeep
         PLP
         RTL

L030285  PHP
         SEP   #$30
         LDA   #$DC
         JSL   L03022D
         JSL   L0302C3
         PLP
         RTL

L030294  PHP
         SEP   #$30
         LDA   $27
         CMP   $22
         BEQ   L0302A2
         DEC
         STA   $27
         PLP
         RTL

L0302A2  LDA   $23
         DEC
         STA   $27
         JSL   L0302AD
         PLP
         RTL

L0302AD  PHP
         SEP   #$30
         LDA   $26
         CMP   $20
         BEQ   L0302BD
         DEC
         JSL   L03006F
         PLP
         RTL

L0302BD  JSL   L030193
         PLP
         RTL

L0302C3  ENT
         PHP
         SEP   #$30
         JSL   L0300F7
         JSL   L030216
         LDA   $22
         STA   $27
         PLP
         RTL

L0302D4  ENT
         PHP
         SEP   #$30
         JSL   L030216
         LDA   $22
         STA   $27
         PLP
         RTL

L0302E1  ENT
         PHP
         REP   #$30
         LDA   $03,S
         STA   $01
         LDA   $02,S
         STA   $00
         SEP   #$30
         LDY   #$01
         LDA   [$00],Y
         BEQ   L030303
         TAX
L0302F5  INY
         LDA   [$00],Y
         PHY
         PHX
         JSL   L03022D
         PLX
         PLY
         DEX
         BNE   L0302F5
L030303  LDY   #$01
         LDA   [$00],Y
         REP   #$20
         AND   #$00FF
         INC
         CLC
         ADC   $00
         STA   $02,S
         PLP
         RTL

L030314  ENT
         PHP
         REP   #$30
         LDA   $03,S
         STA   $01
         LDA   $02,S
         STA   $00
         CLC
         ADC   #$0003
         STA   $02,S
         LDY   #$0002
         LDA   [$00],Y
         TAX
         DEY
         LDA   [$00],Y
         STX   $01
         STA   $00
         SEP   #$30
         DEY
         LDA   [$00]
         BEQ   L030348
         TAX
L03033A  INY
         LDA   [$00],Y
         PHY
         PHX
         JSL   L03022D
         PLX
         PLY
         DEX
         BNE   L03033A
L030348  PLP
         RTL

L03034A  ENT
         PHP
         SEP   #$30
         PEI   $2E
         LDA   $27
         STAL  $E0C054
         LSR
         BCS   L03035C
         STAL  $E0C055
L03035C  TAY
         LDA   [$28],Y
         REP   #$10
         STA   $2E
L030363  LDAL  L030000
         STA   [$28],Y
         LDX   #$0014
L03036C  PHX
         PHY
         JSL   L03059F
         PLY
         PLX
         BCC   L030395
         JSR   L0303AA
         DEX
         BNE   L03036C
         LDA   $2E
         STA   [$28],Y
         LDX   #$0014
L030383  PHX
         PHY
         JSL   L03059F
         PLY
         PLX
         BCC   L030395
         JSR   L0303AA
         DEX
         BNE   L030383
         BRA   L030363
L030395  PHA
         LDA   $2E
         STA   [$28],Y
         PLA
         STAL  $E0C010
         STAL  $E0C054
         REP   #$30
         PLX
         STX   $2E
         PLP
         RTL

L0303AA  LDAL  $E0C019
         BMI   L0303AA
L0303B0  LDAL  $E0C019
         BPL   L0303B0
         RTS

         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STZ   L030002
         STZ   L030004
L0303C3  STA   $2B
         SEP   #$30
         STY   $2D
         LDA   #$01
         STA   $2E
         DEC
         STA   [$2B]
         STX   L030418
         LDY   #$00
         STY   $27
         INC   $27
         JSR   L0304F9
L0303DC  JSR   L03041A
         JSL   L03034A
         CMP   #$8D
         BEQ   L03040B
         JSR   L030445
         BCS   L0303DC
         TAX
         LDY   $27
         CPY   $2E
         BCS   L030402
         LDY   $2E
         DEY
L0303F6  LDA   [$2B],Y
         INY
         STA   [$2B],Y
         DEY
         DEY
         CPY   $27
         BCS   L0303F6
         INY
L030402  TXA
         STA   [$2B],Y
         INC   $2E
         INC   $27
         BRA   L0303DC
L03040B  LDA   $2E
         TAY
         DEC
         STA   [$2B]
         LDA   #$00
         STA   [$2B],Y
         PLP
         PLB
         RTL

L030418  DW    $0000

L03041A  LDY   #$01
         STY   $2F
         INY
         STAL  $E0C055
         LDA   L030418
         STA   [$28]
         LDX   #$01
L03042A  LDA   [$2B],Y
         PHY
         TXY
         STA   [$28],Y
         PLY
         INY
         INY
         INX
         CPY   #$4F
         BCC   L03042A
         LDY   #$01
         LDX   #$00
         STAL  $E0C054
         DEC   $2F
         BPL   L03042A
         RTS

L030445  XBA
         PHA
         AND   #$10
         TAX
         PLA
         XBA
         CPX   #$10
         BEQ   L030468
         LDX   #$04
L030452  CMP   L0304B0,X
         BEQ   L0304AA
         DEX
         BPL   L030452
         CMP   #$A0
         BCC   L030468
         LDX   $2E
         CPX   #$4F
         BCS   L030466
         CLC
         RTS

L030466  SEC
         RTS

L030468  REP   #$30
         PHA
         JSL   L03053D
         PLA
         PHB
         TAY
         LDA   L030002
         ORA   L030004
         BEQ   L030491
         PHK
         PER   L030491-1
         TYA
         AND   #$FF7F
         PHA
         SEP   #$10
         LDX   L030004
         PHX
         REP   #$10
         LDA   L030002
         DEC
         PHA
         RTL

L030491  SEP   #$30
         PLB
         JSL   L030553
         LDA   [$2B]
         BEQ   L0304A8
         INC
         STA   $2E
         STA   $27
         LDA   #$00
         STA   [$2B]
         JSR   L0304F9
L0304A8  SEC
         RTS

L0304AA  TXA
         ASL
         TAX
         JMP   (L0304B5,X)

L0304B0  DB    $88
         DB    $95
         DB    $98
         DB    $FF
         DB    $99

L0304B5  DA    L0304BF
         DA    L0304C8
         DA    L0304D3
         DA    L0304DC
         DA    L0304F9

L0304BF  LDA   $27
         DEC
         BEQ   L0304C6
         STA   $27
L0304C6  SEC
         RTS

L0304C8  LDA   $27
         CMP   $2E
         BEQ   L0304D1
         INC
         STA   $27
L0304D1  SEC
         RTS

L0304D3  LDA   #$01
         STA   $27
         STA   $2E
         JMP   L0304F9

L0304DC  LDY   $27
         CPY   #$01
         BEQ   L0304D1
L0304E2  LDA   [$2B],Y
         DEY
         STA   [$2B],Y
         INY
         INY
         CPY   $2E
         BCC   L0304E2
         BEQ   L0304E2
         DEY
         LDA   #$A0
         STA   [$2B],Y
         DEC   $2E
         JMP   L0304BF

L0304F9  LDY   $27
         LDA   #$A0
L0304FD  STA   [$2B],Y
         INY
         CPY   #$4F
         BCC   L0304FD
         LDY   $27
         STY   $2E
         SEC
         RTS

L03050A  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $0C,S
         STA   L030002
         LDA   $0E,S
         STA   L030004
         LDA   $0A,S
         TAY
         LDA   $06,S
         TAX
         LDA   $08,S
         PHA
         LDA   $06,S
         STA   $10,S
         LDA   $04,S
         STA   $0E,S
         LDA   $02,S
         STA   $0C,S
         LDA   $01,S
         STA   $0B,S
         TSC
         CLC
         ADC   #$000A
         TCS
         PLA
         JMP   L0303C3

L03053D  PHB
         PHK
         PLB
         PHP
         REP   #$20
         SEP   #$10
         LDX   #$0E
L030547  LDA   $20,X
         STA   L030569,X
         DEX
         DEX
         BPL   L030547
         PLP
         PLB
         RTL

L030553  PHB
         PHK
         PLB
         PHP
         REP   #$20
         SEP   #$10
         LDX   #$0E
L03055D  LDA   L030569,X
         STA   $20,X
         DEX
         DEX
         BPL   L03055D
         PLP
         PLB
         RTL

L030569  DB    $00
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
L030579  ENT
         PHP
         REP   #$30
         LDA   #$FFFF
         STAL  L030591
         PLP
         RTL

L030585  ENT
         PHP
         REP   #$30
         LDA   #$0000
         STAL  L030591
         PLP
         RTL

L030591  DW    $0000
L030593  ENT
         PHP
         REP   #$30
         AND   #$00FF
         STAL  L030000
         PLP
         RTL

L03059F  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         PHA
         _EMStatus
         PLA
         BEQ   L0305E2
         PHA
         PEA   $FFFF
         PEA   ^L030624
         PEA   L030624
         _GetNextEvent
         PLA
         LDA   L030624
         CMP   #$0003
         BEQ   L0305CF
         CMP   #$0005
         BNE   L0305DE
L0305CF  SEP   #$20
         LDA   L030632+1
         XBA
         LDA   L030626
         ORA   #$80
         PLP
         PLB
         CLC
         RTL

L0305DE  PLP
         PLB
         SEC
         RTL

L0305E2  SEP   #$30
         LDAL  $E0C000
         BPL   L0305DE
         STAL  $E0C010
         PHA
         LDAL  $E0C025
         STZ   L030632+1
         LDX   #$07
L0305F8  PHA
         AND   L030614,X
         BEQ   L030607
         LDA   L03061C,X
         ORA   L030632+1
         STA   L030632+1
L030607  PLA
         DEX
         BPL   L0305F8
         LDA   L030632+1
         XBA
         PLA
         PLP
         PLB
         CLC
         RTL

L030614  DB    $01
         DB    $02
         DB    $04
         DB    $08
         DB    $10
         DB    $20
         DB    $40
         DB    $80
L03061C  DB    $02
         DB    $10
         DB    $04
         DB    $00
         DB    $20
         DB    $00
         DB    $08
         DB    $01
L030624  DW    $0000      ; event code
L030626  ADRL  $00000000  ; event message
         ADRL  $00000000  ; tick count
         DW    $0000      ; mouse location
         DW    $0000
L030632  DW    $0000      ; modifiers
L030634  PHP
         REP   #$30
         LDA   $05,S
         AND   #$000F
         CLC
         ADC   #$00B0
         CMP   #$00BA
         BCC   L030648
         ADC   #$0006
L030648  JSL   L03022D
L03064C  LDA   $03,S
         STA   $05,S
         LDA   $01,S
         STA   $03,S
         TSC
         INC
         INC
         TCS
         PLP
         RTL

L03065A  ENT
         PHP
         REP   #$30
         LDA   $05,S
         PHA
         LSR
         LSR
         LSR
         LSR
         PHA
         JSL   L030634
         JSL   L030634
         JMP   L03064C

L030670  ENT
         PHP
         REP   #$30
         LDA   $05,S
         PHA
         XBA
         PHA
         JSL   L03065A
         JSL   L03065A
         JMP   L03064C

L030683  PHP
         REP   #$30
         PHD
         TSC
         CLC
         ADC   #$0007
         TCD
         LDA   [$00]
         AND   #$007F
         CMP   #$0030
         BCC   L0306A6
         CMP   #$0047
         BCS   L0306A6
         CMP   #$003A
         BCC   L0306AD
         CMP   #$0041
         BCS   L0306B3
L0306A6  LDA   #$0000
         PLD
         PLP
         SEC
         RTL

L0306AD  SEC
         SBC   #$0030
         BRA   L0306B7
L0306B3  SEC
         SBC   #$0037
L0306B7  INC   $00
         PLD
         PLP
         CLC
         RTL

L0306BD  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $08,S
         PHA
         LDA   $08,S
         PHA
         STZ   L030715
         STZ   L030717
         STX   $2E
         JSL   L030683
         LDX   $2E
         BCS   L0306FB
         BCC   L0306E3
L0306DB  STX   $2E
         JSL   L030683
         BCS   L0306FA
L0306E3  LDX   #$0004
L0306E6  ASL   L030715
         ROL   L030717
         DEX
         BNE   L0306E6
         ORA   L030715
         STA   L030715
         LDX   $2E
         DEX
         BNE   L0306DB
L0306FA  CLC
L0306FB  PLA
         STA   $08,S
         PLA
         STA   $08,S
         BCS   L03070D
         LDY   L030717
         LDA   L030715
         PLP
         CLC
         PLB
         RTL

L03070D  LDA   #$0000
         TAY
         PLP
         SEC
         PLB
         RTL

L030715  DW    $0000
L030717  DW    $0000
L030719  ENT
         PHP
         REP   #$30
         LDA   $03,S
         STA   $01
         LDA   $02,S
         STA   $00
         CLC
         ADC   #$0003
         STA   $02,S
         LDY   #$0002
         LDA   [$00],Y
         TAX
         DEY
         LDA   [$00],Y
         STX   $01
         STA   $00
         LDA   [$00]
         BEQ   L03074C
         TAX
         SEP   #$20
L03073E  INY
         LDA   [$00],Y
         PHY
         PHX
         JSL   L03022D
         PLX
         PLY
         DEX
         BNE   L03073E
L03074C  PLP
         RTL

L03074E  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $04,S
         STA   $01
         LDA   $03,S
         INC
         STA   $00
         CLC
         ADC   #$0003
         STA   $03,S
         LDA   [$00]
         STA   L0307D0
         LDY   #$0002
         LDA   [$00],Y
         STA   L0307D2
         SEP   #$30
         INC   L0307D1
         JSR   L0307CC
         LDX   $25
L03077A  LDA   #$DF
         PHX
         JSL   L03022D
         PLX
         DEX
         BNE   L03077A
         LDX   $24
         DEX
         DEX
         DEX
L03078A  PHX
         LDA   #$5F
         JSL   L03022D
         LDX   $25
         DEX
         DEX
L030795  LDA   #$A0
         PHX
         JSL   L03022D
         PLX
         DEX
         BNE   L030795
         LDA   #$5A
         JSL   L03022D
         PLX
         DEX
         BNE   L03078A
         LDX   $25
L0307AC  LDA   #$4C
         PHX
         JSL   L03022D
         PLX
         DEX
         BNE   L0307AC
         INC   L0307D0
         DEC   L0307D1
         DEC   L0307D1
         INC   L0307D2
         DEC   L0307D3
         JSR   L0307CC
         PLP
         PLB
         RTL

L0307CC  JSL   L030035
L0307D0  DB    $00
L0307D1  DB    $00
L0307D2  DB    $00
L0307D3  DB    $00
         LDX   $22
         LDY   $20
         JSL   L0300E2
         RTS

L0307DD  ENT
         PHP
         REP   #$30
         LDA   $09,S
         STA   $00
         LDA   $0B,S
         STA   $02
         LDA   $05,S
         STA   $04
         LDA   $07,S
         STA   $06
         LDA   $03,S
         STA   $0B,S
         LDA   $01,S
         STA   $09,S
         TSC
         CLC
         ADC   #$0008
         TCS
         LDA   #$0000
         SEP   #$30
         LDA   [$00]
         STA   $08
         BEQ   L030820
         LDA   [$04]
         INC
         TAY
         LDX   #$01
L03080F  PHY
         TXY
         LDA   [$00],Y
         PLY
         INX
         STA   [$04],Y
         INY
         DEC   $08
         BNE   L03080F
         DEY
         TYA
         STA   [$04]
L030820  PLP
         CLC
         RTL

L030823  ENT
         PHP
         REP   #$30
         AND   #$000F
         CLC
         ADC   #$00B0
         CMP   #$00BA
         BCC   L030835
         ADC   #$0006
L030835  PLP
         RTL

L030837  ENT
         PHP
         REP   #$30
         PHA
         JSL   L030823
         TAY
         PLA
         PHY
         LSR
         LSR
         LSR
         LSR
         JSL   L030823
         SEP   #$30
         XBA
         PLA
         XBA
         PLY
         PLP
         RTL

L030852  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         TSC
         PHD
         CLC
         ADC   #$0006
         TCD
         LDA   [$04]
         STA   L0308AD
         BEQ   L030887
         LDA   [$00]
         TAX
         CLC
         ADC   L0308AD
         BCS   L03088A
         STA   [$00]
         LDY   #$0001
         INX
L030875  SEP   #$20
         INY
         INX
         LDA   [$04],Y
         PHY
         TXY
         STA   [$00],Y
         PLY
         REP   #$20
         DEC   L0308AD
         BNE   L030875
L030887  CLV
         BRA   L03088C
L03088A  SEP   #$40
L03088C  PLD
         LDA   $04,S
         STA   $0C,S
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         TSC
         CLC
         BVC   L0308A5
         ADC   #$0008
         TCS
         PLP
         SEC
         PLB
         RTL

L0308A5  ADC   #$0008
         TCS
         PLP
         CLC
         PLB
         RTL

L0308AD  DW    $0000
L0308AF  ENT
         PHP
         REP   #$30
         PHD
         PHY
         PHX
         TAX
         TSC
         TCD
         TXA
         JSL   L030837
         JSR   L0308C5
         PLX
         PLY
         PLD
         PLP
         RTL

L0308C5  PHA
         LDA   [$01]
         INC
         INC
         TAY
         STA   [$01]
         PLA
         STA   [$01],Y
         RTS

L0308D1  ENT
         PHP
         REP   #$30
         PHD
         PHA
         PHY
         PHX
         TSC
         TCD
         LDA   $05
         XBA
         JSL   L030837
         JSR   L0308C5
         LDA   $05
         JSL   L030837
         JSR   L0308C5
         PLX
         PLY
         PLA
         PLD
         PLP
         RTL

L0308F3  ENT
         PHP
         REP   #$30
         LDA   $04,S
         XBA
         PHA
         PLB
         PLB
         LDY   #$0001
         LDA   ($02,S),Y
         STAL  L030914
         INY
         INY
         LDA   ($02,S),Y
         STAL  L030916
         PHB
         PHK
         PLB
         JSL   L03074E
L030914  DB    $00
L030915  DB    $00
L030916  DB    $00
L030917  DB    $00
         JSL   L030035
         DB    $00
         DB    $17
         DB    $00
         DB    $4F
         LDA   $03,S
         STA   $10
         LDA   $04,S
         STA   $11
         LDY   #$0005
         LDA   [$10],Y
         STA   $14
         INY
         INY
         LDA   [$10],Y
         STA   $16
         CLC
         LDA   $10
         ADC   #$0008
         STA   $03,S
         LDY   #$0000
         STZ   L03095B
         STZ   L030959
L030946  LDA   [$14],Y
         AND   #$00FF
         BEQ   L0309BD
         INC   L03095B
         PHA
         TYA
         SEC
         ADC   $01,S
         TAY
         PLA
         BRA   L030946
L030959  DB    $00
         DB    $00
L03095B  DB    $00
         DB    $00
L03095D  DB    $00
         DB    $00
L03095F  DB    $00
         DB    $00
L030961  DB    $00
         DB    $00
L030963  DB    $00
         DB    $00
L030965  DB    $00
         DB    $00
L030967  DB    $00
         DB    $00
L030969  DB    $00
         DB    $00
L03096B  DB    $00
L03096C  ASC   "                                        "
         ASC   "                                        "
         ASC   " "
L0309BD  DEC   L03095B
         SEP   #$20
         SEC
         LDA   L030915
         SBC   L030914
         DEC
         STA   L03095D
         DEC
         STA   L030961
         STZ   L03095F
         SEC
         LDA   L030917
         SBC   L030916
         DEC
         STA   L03096B
         DEC
         DEC
         STA   L030969
         REP   #$20
         LDA   L03095B
         STA   L030965
         STA   L030967
         LDA   L03095D
         CMP   L03095B
         BEQ   L0309F9
         BCS   L030A10
L0309F9  LSR
         BCC   L0309FD
         INC
L0309FD  DEC
         STA   L030965
         LDA   L03095B
         SEC
         SBC   L03095D
         INC
         CLC
         ADC   L030965
         STA   L030967
L030A10  STZ   L030963
L030A13  JSR   L030A88
L030A16  SEP   #$20
L030A18  JSL   L03059F
         BCS   L030A18
         REP   #$20
         AND   #$007F
         CMP   #$000B
         BEQ   L030A3B
         CMP   #$000A
         BEQ   L030A5C
         CMP   #$000D
         BEQ   L030A81
         CMP   #$001B
         BNE   L030A16
         PLB
         PLP
         SEC
         RTL

L030A3B  LDA   L030959
         BEQ   L030A16
         DEC   L030959
         LDX   L03095F
         BEQ   L030A57
         CMP   L030967
         BEQ   L030A4F
         BCS   L030A57
L030A4F  DEC   L03095F
         DEC   L030961
         BRA   L030A13
L030A57  DEC   L030963
         BRA   L030A13
L030A5C  LDA   L030959
         CMP   L03095B
         BEQ   L030A16
         INC   L030959
         LDX   L030961
         CPX   L03095B
         BEQ   L030A7C
         CMP   L030965
         BCC   L030A7C
         INC   L03095F
         INC   L030961
         BRA   L030A13
L030A7C  INC   L030963
         BRA   L030A13
L030A81  LDA   L030959
         PLB
         PLP
         CLC
         RTL

L030A88  LDY   #$0000
         LDX   #$0000
L030A8E  CPX   L03095F
         BEQ   L030AA7
         LDA   [$14],Y
         AND   #$00FF
         PHA
         TYA
         CLC
         ADC   $01,S
         INC
         TAY
         PLA
         INX
         BRA   L030A8E
L030AA3  DW    $0000
L030AA5  DW    $0000
L030AA7  TYA
         CLC
         ADC   $14
         STA   $18
         LDA   $16
         STA   $1A
         STZ   L030AA5
L030AB4  LDA   [$18]
         AND   #$00FF
         BNE   L030ABC
         RTS

L030ABC  PHA
         CMP   L030969
         BCC   L030AC5
         LDA   L030969
L030AC5  STA   L030AA3
         LDY   #$0000
L030ACB  INY
         LDA   [$18],Y
         STA   L03096C,Y
         CPY   L030AA3
         BNE   L030ACB
         LDA   #$00A0
L030AD9  INY
         STA   L03096C,Y
         CPY   L030969
         BCC   L030AD9
         STA   L03096C+1,Y
         LDA   L030914
         AND   #$00FF
         INC
         CLC
         ADC   L030AA5
         TAY
         LDA   L030916
         AND   #$00FF
         INC
         TAX
         JSL   L0300E2
         LDA   L030AA5
         CMP   L030963
         BNE   L030B09
         JSL   L030579
L030B09  JSL   L030314
         ADR   L03096B
         JSL   L030585
         PLA
         INC
         CLC
         ADC   $18
         STA   $18
         INC   L030AA5
         LDA   L030AA5
         CMP   L03095D
         BCC   L030AB4
         RTS

L030B27  ENT
         PHP
         REP   #$30
         LDA   $04,S
         XBA
         PHA
         PLB
         PLB
         LDY   #$0001
         LDA   ($02,S),Y
         STAL  L030B67
         INY
         INY
         LDA   ($02,S),Y
         STAL  L030B69
         LDX   #$0000
         SEP   #$20
         INY
L030B47  INY
         INX
         LDA   ($02,S),Y
         STAL  L030BE1,X
         CPY   #$000B
         BCC   L030B47
         LDA   #$5C
         STAL  L030BE1
         STAL  L030BE5
         REP   #$20
         PHB
         PHK
         PLB
         JSL   L03074E
L030B67  DB    $00
L030B68  DB    $00
L030B69  DB    $00
L030B6A  DB    $00
         JSL   L030035
         DB    $00
         DB    $17
         DB    $00
         DB    $4F
         CLC
         LDA   $03,S
         ADC   #$000C
         STA   $03,S
         BRA   L030BE9
L030B7D  DB    $00
         DB    $00
L030B7F  DB    $00
         DB    $00
L030B81  DB    $00
         DB    $00
L030B83  DB    $00
         DB    $00
L030B85  DB    $00
         DB    $00
L030B87  DB    $00
         DB    $00
L030B89  DB    $00
         DB    $00
L030B8B  DB    $00
         DB    $00
L030B8D  DB    $00
         DB    $00
L030B8F  DB    $00
L030B90  ASC   "                                        "
         ASC   "                                        "
         ASC   " "
L030BE1  DB    $00
         DB    $00
         DB    $00
         DB    $00
L030BE5  DB    $00
L030BE6  DB    $00
L030BE7  DB    $00
         DB    $00
L030BE9  SEP   #$20
         SEC
         LDA   L030B68
         SBC   L030B67
         DEC
         STA   L030B81
         SEC
         LDA   L030B6A
         SBC   L030B69
         DEC
         STA   L030B8F
         DEC
         DEC
         STA   L030B8D
L030C06  REP   #$20
         LDA   #$0000
         PHA
         PHA
         DEC
         PHA
         JSL   L030BE1
         PLA
         PLA
         PLX
         STX   L030B7D
         DEC
         STA   L030B7F
         STA   L030B89
         STA   L030B8B
         LDA   L030B81
         CMP   L030B7F
         BEQ   L030C2D
         BCS   L030C44
L030C2D  LSR
         BCC   L030C31
         INC
L030C31  DEC
         STA   L030B89
         LDA   L030B7F
         SEC
         SBC   L030B81
         INC
         CLC
         ADC   L030B89
         STA   L030B8B
L030C44  STZ   L030B87
         STZ   L030B83
         LDA   L030B81
         DEC
         STA   L030B85
         LDA   L030B7D
         CMP   L030B7F
         BEQ   L030C5E
         BCC   L030C5E
         STZ   L030B7D
L030C5E  JSR   L030D16
L030C61  JSR   L030D70
L030C64  SEP   #$20
L030C66  JSL   L03059F
         BCS   L030C66
         REP   #$20
         AND   #$007F
         CMP   #$000B
         BEQ   L030C8C
         CMP   #$000A
         BEQ   L030CAD
         CMP   #$000D
         BEQ   L030CE1
         CMP   #$001B
         BEQ   L030C88
         BRL   L030CE8
L030C88  PLB
         PLP
         SEC
         RTL

L030C8C  LDA   L030B7D
         BEQ   L030C64
         DEC   L030B7D
         LDX   L030B83
         BEQ   L030CA8
         CMP   L030B8B
         BEQ   L030CA0
         BCS   L030CA8
L030CA0  DEC   L030B83
         DEC   L030B85
         BRA   L030C61
L030CA8  DEC   L030B87
         BRA   L030C61
L030CAD  LDA   L030B7D
         CMP   L030B7F
         BEQ   L030C64
         INC   L030B7D
         LDX   L030B85
         CPX   L030B7F
         BEQ   L030CCD
         CMP   L030B89
         BCC   L030CCD
         INC   L030B83
         INC   L030B85
         BRA   L030C61
L030CCD  INC   L030B87
         BRA   L030C61
L030CD2  CMP   L030B7F
         BEQ   L030CD9
         BCS   L030C64
L030CD9  STA   L030B7D
         JSR   L030D16
         BRA   L030C61
L030CE1  LDA   L030B7D
         PLB
         PLP
         CLC
         RTL

L030CE8  TAY
         LDA   L030BE6
         ORA   L030BE7
         BEQ   L030D03
         LDA   #$0000
         PHA
         PHA
         PHY
         JSL   L030BE5
         PLA
         PLY
         PLA
         CMP   #$0005
         BCC   L030D06
L030D03  BRL   L030C64
L030D06  ASL
         TAX
         TYA
         JMP   (L030D0C,X)

L030D0C  DA    L030C64
         DA    L030C06
         DA    L030CD2
         DA    L030C88
         DA    L030CE1

L030D16  STZ   L030B83
         LDA   L030B81
         DEC
         STA   L030B85
         LDA   L030B7D
         STA   L030B87
         CMP   L030B89
         BEQ   L030D6B
         BCC   L030D6B
         LDA   L030B81
         DEC
         LSR
         STA   L030B87
         SEC
         SBC   L030B7D
         EOR   #$FFFF
         INC
         STA   L030B83
         CLC
         ADC   L030B81
         DEC
         STA   L030B85
         LDA   L030B7D
         CMP   L030B8B
         BEQ   L030D6B
         BCC   L030D6B
         LDA   L030B7F
         STA   L030B85
         SEC
         SBC   L030B81
         INC
         STA   L030B83
         SEC
         SBC   L030B7D
         EOR   #$FFFF
         INC
         STA   L030B87
L030D6B  RTS

L030D6C  DW    $0000
L030D6E  DW    $0000
L030D70  LDA   #$0000
         STA   L030D6E
L030D76  CLC
         ADC   L030B83
         PHA
         PHA
         PHA
         JSL   L030BE1
         PLA
         PLA
         STA   $18
         PLA
         STA   $1A
         LDA   [$18]
         AND   #$00FF
         CMP   L030B8D
         BCC   L030D95
         LDA   L030B8D
L030D95  STA   L030D6C
         LDY   #$0000
L030D9B  INY
         LDA   [$18],Y
         STA   L030B90,Y
         CPY   L030D6C
         BCC   L030D9B
         LDY   L030D6C
         LDA   #$00A0
L030DAC  INY
         STA   L030B90,Y
         CPY   L030B8D
         BCC   L030DAC
         STA   L030B90+1,Y
         LDA   L030B67
         AND   #$00FF
         INC
         CLC
         ADC   L030D6E
         TAY
         LDA   L030B69
         AND   #$00FF
         INC
         TAX
         JSL   L0300E2
         LDA   L030D6E
         CMP   L030B87
         BNE   L030DDC
         JSL   L030579
L030DDC  JSL   L030314
         ADR   L030B8F
         JSL   L030585
         INC   L030D6E
         LDA   L030D6E
         CMP   L030B81
         BCC   L030D76
         RTS


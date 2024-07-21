*
* Crystal Castles
* by John Stouffer
*
* (c) 1983, Atari
* (s) 2024, Brutal Deluxe Software
*

            TYP   BIN
            ORG   $000800
            MX    %11
	LST   OFF

*-----------------------------------
* EQUATES
*-----------------------------------

SOFTEV      EQU   $03F2
PWREDUP     EQU   $03F4
KBD         EQU   $C000
KBDSTROBE   EQU   $C010
SPKR        EQU   $C030
TXTCLR      EQU   $C050
TXTSET      EQU   $C051
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
HIRES       EQU   $C057
BUTN0       EQU   $C061
BUTN1       EQU   $C062
PADDL0      EQU   $C064
PADDL1      EQU   $C065
PTRIG       EQU   $C070
BASCALC     EQU   $FBC1
HOME        EQU   $FC58
WAIT        EQU   $FCA8

L0800       =	$0800
L0801	=	L0800+$01
L0808	=	L0800+$08
L0809	=	L0800+$09
L0810	=	L0800+$10
L0811	=	L0800+$11
L0820	=	L0800+$20
L0830	=	L0800+$30
L0838	=	L0800+$38
L0840	=	L0800+$40
L0848	=	L0800+$48
L0849	=	L0800+$49
L0850	=	L0800+$50
L0868	=	L0800+$68
L0869	=	L0800+$69
L0870	=	L0800+$70
L0871	=	L0800+$71
L0878	=	L0800+$78
L0880	=	L0800+$80
L08A0	=	L0800+$A0

L6200	=	$6200
L6300	=	L6200+$100
L6400	=	L6300+$100
L6500	=	L6400+$100
L6600	=	L6500+$100
L6700	=	L6600+$100

NBLIVES	=	2

*-----------------------------------
* ZERO PAGE
*-----------------------------------

nbPLAYER	=	19	; 0: one player, 1: two players
thePLAYER	=	1A
theLASTGEM	=	46	; 0: player had the last gem, <>0: enemies had it
p1SCORE	=	4A
p2SCORE	=	4D
p1LIVES	=	54
p2LIVES	=	55
joyX	=	60
joyY	=	61
theLEVEL	=	79

*-----------------------------------
* IT RELOCATES CODE AND DATA
*-----------------------------------

	LDY   #$00
]lp	LDA   $2000,Y
	STA   $9500,Y
	LDA   $2100,Y
	STA   $9600,Y
	LDA   $2200,Y
	STA   $9700,Y
	LDA   $2300,Y
	STA   $9900,Y
	LDA   $2400,Y
	STA   $9C00,Y
	INY
	BNE   ]lp

* Copy $2500..$2fff to $a500..$afff

	LDX   #$0A
L0825	LDA   $2500,Y
L0828	STA   $A500,Y
	INY
	BNE   L0825
	INC   L0825+2
	INC   L0828+2
	DEX
	BNE   L0825
	JMP   L1F20
	
	DS	\
	
*-----------------------------------
* ENTRY POINT
*-----------------------------------

L0900       JSR   moveDATA	; move font + unrle data
            LDA   #$04
            STA   $F0+1
            LDY   #$00
            STY   $F0
            LDA   #$A0
L090D       STA   ($F0),Y
            INY
            BNE   L090D
            INC   $F0+1
            LDX   $F0+1
            CPX   #$08
            BNE   L090D
            LDA   #<L0927
            STA   SOFTEV
            LDA   #>L0927
            STA   SOFTEV+1
            STA   PWREDUP
L0927       LDA   #$00
            STA   $F6
            STA   $F7
            STA   $79
            STA   $EC
            STA   $19
            BEQ   L093D

            DB    $02
            DB    $BB
            DB    $5A
            DB    $30
            DB    $5F
            DB    $EE
            DB    $05
            DB    $A8

*-----------------------------------
* MAIN LOOP
*-----------------------------------

L093D       JSR   LAE00	; show title
L0940       LDA   #$19	; start game
            STA   L8000+$58
            LDA   $F7
            STA   $F6
            BEQ   L0950
            LDA   #$99
            STA   L8000+$58
L0950       LDA   #$00
            STA   $79		; level
            STA   $4A		; score P1
            STA   $4B
            STA   $4C
            STA   $4D		; score P2
            STA   $4E
            STA   $4F
            STA   $1A
            STA   $F7
            LDA   #NBLIVES
            STA   $54		; nb lives P1
            STA   $55		; nb lives P2
            LDA   #$FF
            STA   $58
L096E       LDA   #$0F
            STA   $E2
            LDA   #$A8
            STA   $E3
            LDA   $79
            BEQ   L0985
            SEC
            SBC   #$01
            LSR
            LSR
            CMP   $F7
            BCC   L0985
            STA   $F7
L0985       LDY   #$00
            STY   L0800
            STY   $D4	; low level pointer
            STY   $F2
            STY   $7A
            STY   $7B
            STY   $C4
            STY   $C5
            STY   $EC
            STY   $ED
            STY   $EE
            STY   $1F
            LDX   #$07
L09A0       TYA
            STA   L0808,X
            STA   L0850,X
            STA   L0830,X
            STA   L0838,X
            TXA
            STA   L0868,X
            STA   L0870,X
            LDA   #$C0
            STA   L0848,X
            DEX
            BPL   L09A0
            LDA   #$02
            STA   $15
            STY   $14
            STY   $59
            STY   $13
            STY   $D2
            STY   L0848
            STY   $CB
            STY   $23
            STY   $25
            STY   $67
            STY   $7C
            STY   $16
            STY   $5F
            STY   $7E
            LDA   #$80
            STA   $7D
            LDA   #$70
            STA   $FF
            STA   $E1
            LDA   $58
            BNE   L0A13
            LDA   $19
            BEQ   L0A13
            LDX   $1A
            LDA   LAD6C,X
            STA   $F2+1
            LDY   #$00
            LDA   LAD6E,X
            TAX
L09FA       LDA   L08A0,X
            STA   |$0070,Y
            INX
            INY
            CPY   #$10
            BNE   L09FA
            LDY   #$00
L0A08       LDA   ($F2),Y
            STA   L6500,Y
            INY
            BNE   L0A08
            JMP   L0A6D

L0A13       LDX   $79
            LDA   LAC78,X
            STA   $E6
            LDY   #$07
            LDA   #>L6880
            STA   $F0+1
            LDA   $E6
            ASL
            ASL
            ASL
            ORA   #<L6880
            STA   $F0
L0A29       LDA   ($F0),Y
            STA   |$0070,Y
            DEY
            BPL   L0A29
            LDX   $79
            LDA   LAC78,X
            TAX
            LDA   LAC9D,X	; level data
            STA   $D4+1
            LDA   $79
            LSR   $00
            ROL
            ASL
            TAX
            LDA   L9360,X
            STA   $F0
            LDA   L9360+1,X
            STA   $F0+1
            LDX   #$00
            LDY   #$00
L0A51       LDA   ($F0,X)
            STA   $DA
            LDX   #$08
L0A57       LDA   ($D4),Y
            ASL   $DA
            BCS   L0A5F
            LDA   #$00
L0A5F       STA   L6500,Y
            INY
            BEQ   L0A6D
            DEX
            BNE   L0A57
            INC   $F0
            JMP   L0A51

L0A6D       LDX   $79
            LDA   LAC78,X
            STA   $E6
            TAX
            LDA   LAC9D,X
            CLC
            ADC   #$30
            STA   $F2+1
            LDY   #$00
L0A7F       LDA   ($F2),Y
            STA   L6700,Y
            INY
            BNE   L0A7F
            LDA   #$01
            CPX   #$09
            BNE   L0A8F
            LDA   #$07
L0A8F       STA   $C7
            LDA   $58
            CMP   #$FF
            BNE   L0AD1
            LDA   #$01
            STA   $1A
            JSR   L0AA5
            LDA   #$00
            STA   $1A
            JMP   L0AD1

L0AA5       LDX   $1A
            LDA   LAD6C,X
            STA   $F2+1
            LDY   #$00
            STY   $F2
            LDA   LAD6E,X
            TAX
L0AB4       LDA   |$0070,Y
            STA   L08A0,X
            INX
            INY
            CPY   #$10
            BNE   L0AB4
            LDY   #$00
L0AC2       LDA   L6500,Y
            STA   ($F2),Y
            INY
            BNE   L0AC2
            LDA   $1A
            EOR   #$01
            STA   $1A
            RTS

L0AD1       LDA   TXTPAGE1
            JSR   clearHGR1
            LDA   #$00	; FRAME UPPER LEFT
            JSR   printSTRING
            LDA   #$01	; FRAME UPPER RIGHT
            JSR   printSTRING
            JSR   L9551
            LDA   $19	; nb players?
            BEQ   L0AF7	; only 1
            LDA   $1A	; exchange player index
            EOR   #$01
            STA   $1A
            JSR   L9589	; print 
            LDA   $1A	; exchange again
            EOR   #$01
            STA   $1A
L0AF7       LDA   $E6
            BNE   L0B17
            LDX   $F6
            BEQ   L0B17
            TXA
            ASL
            ASL
            CMP   #$1F
            BCC   L0B08
            LDA   #$1C	; niveau 26
L0B08       STA   $79
            LDA   #$12	; BERTHILDAS DUNGEON
            JSR   printSTRING
            LDA   #$00	; niveau 0
            STA   $79
            STA   $56
            BEQ   L0B1D
L0B17       CLC
            ADC   #$02
            JSR   printSTRING
L0B1D       LDY   L0800
            LDA   #$00
            STA   L6400,Y
            LDA   $E2
            STA   $F4
            STA   L6200,Y
            LDA   L6500,Y
            AND   #$3F
            STA   $E4
            LDA   $E3
            STA   $F5
            SEC
            SBC   $E4
            SBC   $E4
            SBC   #$14
            STA   L6300,Y
            LDA   $E4
            CMP   #$3F
            BEQ   L0B56
L0B47       ASL   $E4
            BNE   L0BA1
            LDA   $C4
            CLC
            ADC   #$03
            STA   $C4
            TAX
            JMP   L0C43

L0B56       LDA   $C5
            ASL
            ASL
            ASL
            TAX
            LDA   $C4
            STA   $80,X
            LDA   L0800
            STA   $81,X
            LDA   #$04
            STA   $87,X
            LDA   $F4
            STA   $86,X
            DEY
            LDA   L6300,Y
            CLC
            ADC   #$17
            STA   $84,X
            STA   $82,X
            INY
            INY
            LDA   L6500,Y
            AND   #$3F
            STA   $E4
            LDA   $E3
            SEC
            SBC   $E4
            SBC   $E4
            SBC   #$04
            STA   $85,X
            LDA   #$FF
            STA   $83,X
            DEY
            DEY
            INC   $C5
            LDA   L6500,Y
            INY
            AND   #$3F
            STA   L6500,Y
            STA   $E4
            BNE   L0B47
L0BA1       LDY   L0800
            LDA   L6500,Y
            BPL   L0BAC
            JSR   L0DC6
L0BAC       LDX   $C4
            LDA   LACBB,X
            STA   $FE
            LDX   #$06
            JSR   L0D8B
            LDA   $F5
            SEC
            SBC   #$04
            STA   $F5
            LDA   L0800
            AND   #$01
            BEQ   L0BFC
L0BC6       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            STA   $F0+1
            LDX   $C4
            LDY   $F4
            LDA   ($F0),Y
            AND   #$8F
            ORA   LACAD,X
            STA   ($F0),Y
            INY
            INX
            LDA   LACAD,X
            STA   ($F0),Y
            INY
            INX
            LDA   LACAD,X
            STA   ($F0),Y
            DEC   $F5
            DEC   $E4
            BNE   L0BC6
            INX
            STX   $C4
            LDA   #$40
            STA   $FE
            BNE   L0C30
L0BFC       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            STA   $F0+1
            LDX   $C4
            LDY   $F4
            LDA   LACAD,X
            STA   ($F0),Y
            INY
            INX
            LDA   LACAD,X
            STA   ($F0),Y
            INY
            INX
            LDA   ($F0),Y
            AND   #$F8
            ORA   LACAD,X
            STA   ($F0),Y
            DEC   $F5
            DEC   $E4
            BNE   L0BFC
            INX
            STX   $C4
            LDA   #$60
            STA   $FE
L0C30       LDX   $C4
            LDA   LACB9,X
            STA   $FE
            LDA   $F5
            SEC
            SBC   #$02
            STA   $F5
            LDX   #$06
            JSR   L0D8B
L0C43       LDX   $C4
            CPX   #$0B
            BCC   L0C4D
            LDX   #$00
            STX   $C4
L0C4D       INC   L0800
            BEQ   L0C82
            LDA   L0800
            AND   #$01
            BNE   L0C5B
            INC   $E2
L0C5B       INC   $E2
            LDA   $E3
            CLC
            ADC   #$02
            STA   $E3
            LDA   L0800
            AND   #$0F
            BNE   L0C7F
            LDA   $C4
            EOR   #$06
            STA   $C4
            LDA   $E2
            SEC
            SBC   #$19
            STA   $E2
            LDA   $E3
            SEC
            SBC   #$1D
            STA   $E3
L0C7F       JMP   L0B1D

L0C82       DEC   $C5
            LDY   #$00
            STY   L0800
            STY   $C4
            JMP   L0CAA

L0C8E       LDA   L6300,Y
            CLC
            ADC   #$16
            TAX
            LDA   L6000,X
            STA   $F0
            LDA   L6100,X
            STA   $F0+1
            LDA   L6000+1,X
            STA   $F2
            LDA   L6100+1,X
            STA   $F2+1
            RTS

L0CAA       LDY   L0800
            JSR   L0C8E
            LDA   L0800
            AND   #$0F
            BNE   L0CBB
            INC   $C4
            INC   $C4
L0CBB       CLC
            ADC   $C4
            AND   #$03
            TAX
            LDY   L0800
            LDA   L6500,Y
            AND   #$40
            BEQ   L0CD9
            LDA   L6200,Y
            TAY
            INY
            LDA   LACC7,X
            STA   ($F0),Y
            STA   ($F2),Y
            INC   $25
L0CD9       LDX   #$03
            LDY   L0800
            LDA   #$00
            STA   L6600,Y
            LDA   #$00
            STA   $C9
            LDA   L6500,Y
            AND   #$3F
            BEQ   L0D34
            STA   $DE
L0CF0       LDA   L0800
            CLC
            ADC   LACCB,X
            TAY
            LDA   L6500,Y
            BPL   L0CFF
            INC   $C9
L0CFF       AND   #$3F
            BEQ   L0D1C
            SEC
            SBC   $DE
            BEQ   L0D10
            CMP   #$FF
            BEQ   L0D10
            CMP   #$01
            BNE   L0D1C
L0D10       LDY   L0800
            LDA   L6600,Y
            ORA   LACCF,X
            STA   L6600,Y
L0D1C       LDY   L0800
            LDA   L6500,Y
            AND   #$3F
            CMP   $C7
            BNE   L0D31
            LDA   $C9
            BEQ   L0D31
            LDA   #$01
            STA   L6400,Y
L0D31       DEX
            BPL   L0CF0
L0D34       INC   L0800
            BEQ   L0D3C
            JMP   L0CAA

L0D3C       LDA   #$F0
            STA   $DB
L0D40       LDY   $DB
            LDA   L6600,Y
            AND   #$F7
            STA   L6600,Y
            LDA   $DB
            SEC
            SBC   #$10
            STA   $DB
            BCS   L0D40
            LDY   #$00
L0D55       LDA   L6600,Y
            AND   #$FE
            STA   L6600,Y
            INY
            CPY   #$10
            BNE   L0D55
            LDY   #$0F
            STY   $DB
L0D66       LDY   $DB
            LDA   L6600,Y
            AND   #$FB
            STA   L6600,Y
            LDA   $DB
            CLC
            ADC   #$10
            STA   $DB
            BCC   L0D66
            LDY   #$FF
L0D7B       LDA   L6600,Y
            AND   #$FD
            STA   L6600,Y
            DEY
            CPY   #$EF
            BNE   L0D7B
            JMP   L0FE7

L0D8B       STX   $E7
            LDA   L0800
L0D90       AND   #$01
            TAY
            LDA   LACB9,Y
            STA   $E0
            LDX   #$00
L0D9A       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            EOR   $ED
            STA   $F0+1
            LDA   #$03
            STA   $E8
            LDY   $F4
L0DAE       LDA   ($F0),Y
            AND   ($E0,X)
            ORA   ($FE,X)
            STA   ($F0),Y
            INY
            INC   $E0
            INC   $FE
            DEC   $E8
            BNE   L0DAE
            INC   $F5
            DEC   $E7
            BNE   L0D9A
            RTS

L0DC6       LDA   $F5
            SEC
            SBC   #$19
            LDY   L0800
            STA   L6400,Y
            LDA   $E4
            SEC
            SBC   $C7
            SBC   #$19
            STA   $C8
            INC   $F5
            INC   $F5
            INC   $E4
            INC   $E4
L0DE2       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            STA   $F0+1
            LDY   $F4
            LDA   L0800
            AND   #$01
            BNE   L0E08
            LDA   #$80
            STA   ($F0),Y
            INY
            STA   ($F0),Y
            INY
            LDA   ($F0),Y
            AND   #$F8
            STA   ($F0),Y
            JMP   L0E16

L0E08       LDA   ($F0),Y
            AND   #$8F
            STA   ($F0),Y
            INY
            LDA   #$80
            STA   ($F0),Y
            INY
            STA   ($F0),Y
L0E16       DEC   $F5
            DEC   $E4
            LDA   $E4
            CMP   $C8
            BNE   L0DE2
            RTS

L0E21       LDA   #$01
            STA   $16
            LDX   $E6
            LDY   L0EDC,X
            STY   $5A
            LDA   L0ECC,X
            BNE   L0E32
            RTS

L0E32       LDA   L6600,Y
            ORA   #$80
            STA   L6600,Y
            LDA   #$03
            STA   $DA
            LDA   #<L7D90
            STA   $FE
            LDA   #>L7D90
            STA   $FE+1
            LDA   #<L7E60
            STA   $E0
            LDA   #>L7E60
            STA   $E0+1
            JMP   L0E8C
L0E51       RTS

L0E52       ADC   L7D30,X
L0E55       LDA   $7B
            BNE   L0ECB
            LDA   #$01
            STA   $7C
            LDX   $E6
            LDY   L0EFC,X
            LDA   L0EEC,X
            BEQ   L0ECB
            LDA   L6600,Y
            ORA   #$80
            STA   L6600,Y
            LDA   #$02
            STA   $DA
            LDA   L6200,Y
            AND   #$01
            ASL
            TAX
            LDA   L0E51,X
            STA   $FE
            LDA   L0E52,X
            STA   $FF
            LDA   #<L7E00
            STA   $E0
            LDA   #>L7E00
            STA   $E1
L0E8C       LDA   L6200,Y
            STA   $F4
            LDA   L6300,Y
            CLC
            ADC   #$0B
            STA   $F5
            LDY   #$00
            LDA   #$0C
            STA   $E7
L0E9F       LDX   $F5
            LDA   L6000,X
            CLC
            ADC   $F4
            STA   $F0
            LDA   L6100,X
            EOR   $ED
            STA   $F0+1
            LDA   $DA
            STA   $E8
            LDX   #$00
L0EB6       LDA   ($F0,X)
            AND   ($E0),Y
            ORA   ($FE),Y
            STA   ($F0,X)
            INY
            INC   $F0
            DEC   $E8
            BNE   L0EB6
            INC   $F5
            DEC   $E7
            BNE   L0E9F
L0ECB       RTS

L0ECC       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
L0EDC       DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $84
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $88
L0EEC       DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01

L0EFC       DB    $5C
            DB    $00
            DB    $88
            DB    $90
            DB    $88
            DB    $BE
            DB    $7F
            DB    $69
            DB    $E4
            DB    $80
            DB    $18
            DB    $10
            DB    $11
            DB    $70
            DB    $16
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L0F0C       LDX   $E6
            LDY   L0EFC,X
            STY   $5B
            LDA   L6200,Y
            STA   $F4
            LDA   L6300,Y
            CLC
            ADC   #$0B
            STA   $F5
            LDX   #$00
            LDA   #$0C
            STA   $E7
            RTS

*-----------------------------------
* 
*-----------------------------------

L0F27       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            EOR   $ED
            STA   $F0+1
            LDY   $F4
            RTS

*-----------------------------------
* 
*-----------------------------------

L0F38       INC   $7B
            JSR   L0F0C
            LDA   L6600,Y
            AND   #$7F
            STA   L6600,Y
L0F45       LDY   $56
            LDA   LAD42,Y
            ASL
            ASL
            STA   $49
            JSR   L0F27
            LDA   $A400,X
            STA   ($F0),Y
            INY
            INX
            LDA   $A400,X
            STA   ($F0),Y
            INX
            INC   $F5
            DEC   $E7
            BNE   L0F45
            RTS

L0F65       LDA   #$00
            STA   $7B
            STA   $49
            JSR   L0F0C
            LDA   #$00
            STA   $7A
L0F72       JSR   L0F27
            LDA   ($F0),Y
            STA   $A400,X
            INY
            INX
            LDA   ($F0),Y
            STA   $A400,X
            INX
            INC   $F5
            DEC   $E7
            BNE   L0F72
            RTS

*-----------------------------------
* COPY HGR1 TO HGR2
*-----------------------------------

copyHGR1TOHGR2
            LDA   #$20
            STA   $FA+1
            ASL
            STA   $FC+1
            LDA   #$00
            STA   $FA
            STA   $FC
L0F96       LDY   #$00
L0F98       LDA   ($FA),Y
            STA   ($FC),Y
            INY
            CPY   #$78
            BNE   L0F98
            TYA
            ADC   $FA
            ADC   #$07
            STA   $FA
            STA   $FC
            BNE   L0F96
            INC   $FC+1
            INC   $FA+1
            LDA   $FA+1
            AND   #$1F
            BNE   L0F96
            RTS

*-----------------------------------
* CLEAR AND SHOW HGR1
*-----------------------------------

clearHGR1   LDA   TXTPAGE1
            LDA   #$20
            STA   $FA+1
            LDA   #$00
            STA   $FA
            TAX
L0FC3       TXA
            TAY
L0FC5       STA   ($FA),Y
            INY
            CPY   #$78
            BNE   L0FC5
            TYA
            ADC   $FA
            ADC   #$07
            STA   $FA
            BNE   L0FC3
            INC   $FA+1
            LDA   $FA+1
            AND   #$1F
            BNE   L0FC3
            LDA   TXTCLR
            LDA   MIXCLR
            LDA   HIRES
            RTS

*-----------------------------------
* 
*-----------------------------------

L0FE7       JSR   L0E21
            LDA   $7B
            BNE   L0FF4
            JSR   L0F65
            JSR   L0E55
L0FF4       JSR   copyHGR1TOHGR2
            LDY   $79
            LDA   LACE3,Y
            STA   $6E
            CLC
            ADC   #$01
            ASL
            STA   $D6
            LDY   $56
            LDA   LAD38,Y
            STA   $1E
            ASL
            ASL
            ADC   LAD38,Y
            ASL
            STA   $57
            INY
            TYA
            ASL
            ASL
            STA   $CE
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $CF
            LDA   $79
            BNE   L102D
            LDY   $1A
            LDA   |$0054,Y
            CMP   #$02
            BEQ   L1035
L102D       LDA   $58
            BEQ   L1046
            LDA   $79
            BNE   L1039
L1035       LDA   #$05
            BNE   L1043
L1039       AND   #$03
            BNE   L1041
            LDA   #$02
            BNE   L1043
L1041       LDA   #$06
L1043       JSR   playMUSIC
L1046       LDA   #$00
            STA   $58
            JMP   L149B

L104D       LDA   $C5
            STA   $C6
L1051       LDY   $C6
            BMI   L10C5
            LDX   LACD3,Y
            LDA   $82,X
            LDY   $EC
            CMP   $84,X
            BEQ   L1064
            CMP   $85,X
            BNE   L108E
L1064       LDY   $C6
            LDA   $87,X
            CMP   LACD8,Y
            BNE   L1070
            JSR   L10C6
L1070       DEC   $87,X
            BNE   L1095
            LDY   $C6
            LDA   LACD8,Y
            STA   $87,X
            LDY   $81,X
            LDA   L6600,Y
            AND   #$F0
            STA   L6600,Y
            LDA   $83,X
            EOR   #$FE
            STA   $83,X
            JSR   L1111
L108E       LDA   $82,X
            CLC
            ADC   $83,X
            STA   $82,X
L1095       LDY   $81,X
            LDA   #$3F
            STA   L6500,Y
            LDA   $82,X
            STA   $F5
            SEC
            SBC   #$17
            STA   L6300,Y
            LDA   #$71
            STA   $FF
            STA   $E1
            DEC   $C6
            LDA   $86,X
            STA   $F4
            LDY   $80,X
            LDA   LACBD,Y
            STA   $FE
            LDA   #$09
            STA   $E7
            LDA   $81,X
            JSR   L0D90
            JMP   L1051
L10C5       RTS

L10C6       JSR   L1111
            LDY   $81,X
            LDA   $83,X
            BPL   L10F0
            LDA   L6600,Y
            AND   #$F0
            ORA   #$09
            STA   L6600,Y
            DEY
            LDA   L6600,Y
            ORA   #$04
            STA   L6600,Y
            TYA
            SEC
            SBC   #$0F
            TAY
            LDA   L6600,Y
            ORA   #$02
            STA   L6600,Y
            RTS

L10F0       LDA   L6600,Y
            AND   #$F0
            ORA   #$06
            STA   L6600,Y
            INY
            LDA   L6600,Y
            ORA   #$08
            STA   L6600,Y
            TYA
            CLC
            ADC   #$0F
            TAY
            LDA   L6600,Y
            ORA   #$01
            STA   L6600,Y
            RTS

L1111       LDY   $81,X
            DEY
            LDA   L6600,Y
            AND   #$FB
            STA   L6600,Y
            INY
            INY
            LDA   L6600,Y
            AND   #$F7
            STA   L6600,Y
            TYA
            CLC
            ADC   #$0F
            TAY
            LDA   L6600,Y
            AND   #$FE
            STA   L6600,Y
            TYA
            SEC
            SBC   #$20
            TAY
            LDA   L6600,Y
            AND   #$FD
            STA   L6600,Y
            RTS

L1141       LDY   $6F
            LDA   L0800,Y
            AND   #$0F
            STA   $DA
            LDA   L0800,Y
            LSR
            LSR
            LSR
            LSR
            STA   $DB
            LDX   #$00
            LDA   L0800
            AND   #$0F
            SEC
            SBC   $DA
            STA   $D8
            BEQ   L1195
            BCC   L1164
            INX
L1164       LDA   L1206,X
            CLC
            ADC   L0830,Y
            STA   L0830,Y
            EOR   $D8
            BMI   L117C
            LDA   L1206,X
            CLC
            ADC   L0830,Y
            STA   L0830,Y
L117C       LDA   L0830,Y
            BPL   L118C
            CMP   $CF
            BCS   L1195
            LDA   $CF
            STA   L0830,Y
            BNE   L1195
L118C       CMP   $CE
            BCC   L1195
            LDA   $CE
            STA   L0830,Y
L1195       LDX   #$00
            LDA   L0800
            LSR
            LSR
            LSR
            LSR
            SEC
            SBC   $DB
            STA   $D9
            BEQ   L11D9
            BCC   L11A8
            INX
L11A8       LDA   L1206,X
            CLC
            ADC   L0838,Y
            STA   L0838,Y
            EOR   $D9
            BMI   L11C0
            LDA   L1206,X
            CLC
            ADC   L0838,Y
            STA   L0838,Y
L11C0       LDA   L0838,Y
            BPL   L11D0
            CMP   $CF
            BCS   L11D9
            LDA   $CF
            STA   L0838,Y
            BNE   L11D9
L11D0       CMP   $CE
            BCC   L11D9
            LDA   $CE
            STA   L0838,Y
L11D9       LDA   L0838,Y
            STA   $DB
            LDX   #$00
            LDA   L0830,Y
            BEQ   L11EB
            BPL   L11E8
            INX
L11E8       LDA   L1208,X
L11EB       LDY   $1F
            STA   |$0065,Y
            TYA
            EOR   #$01
            TAY
            LDX   #$00
            LDA   $DB
            BEQ   L1200
            BPL   L11FD
            INX
L11FD       LDA   L120A,X
L1200       STA   |$0065,Y
            JMP   L1612

L1206       DB    $01
            DB    $FF
L1208       DB    $88
            DB    $95
L120A       DB    $8B
            DB    $8A
L120C       LDX   $6F
            LDA   L0880,X
            BEQ   L1216
L1213       JMP   L1933

L1216       DEC   L0868,X
            BNE   L1213
            LDY   $56
            LDA   LAD38,Y
            STA   L0868,X
            LDY   $6F
            LDX   L0840,Y
            LDA   L0808,Y
            BEQ   L1237
            INC   $00
            LDY   $00
            LDA   $F000,Y
            JMP   L129B

L1237       LDA   L0800,Y
            STA   $DA
            TAY
            LDA   L6600,Y
            STA   $DB
            AND   L12B1,X
            BNE   L1255
            LDA   $DA
            CLC
            ADC   L12BA,X
            TAY
            LDA   L6400,Y
            CMP   #$02
            BCC   L1273
L1255       LDA   $DB
            AND   L12B4,X
            BEQ   L1273
            LDA   $DA
            CLC
            ADC   L12B9,X
            TAY
            LDA   L6600,Y
            AND   L12B1,X
            BEQ   L128D
            LDA   $DB
            AND   L12B2,X
            BNE   L1273
            DEX
L1273       INX
            LDA   $DB
            AND   L12B1,X
            BNE   L128D
            LDA   $DA
            CLC
            ADC   L12BA,Y
            TAY
            LDA   L6400,Y
            CMP   #$02
            BCS   L128D
            CPX   #$07
            BNE   L1273
L128D       DEX
            TXA
            INC   $00
            LDY   $00
            LDX   $F000,Y
            CPX   #$10
            BCS   L129B
            TXA
L129B       AND   #$03
            LDY   $6F
            STA   L0840,Y
            TAX
            LDA   L12AD,X
            STA   $65
            STA   $66
            JMP   L163D

L12AD       DB    $8B
            DB    $95
            DB    $8A
            DB    $88
L12B1       DB    $08
L12B2       DB    $01
            DB    $04
L12B4       DB    $02
            DB    $08
            DB    $01
            DB    $04
            DB    $02
L12B9       DB    $10
L12BA       DB    $FF
            DB    $F0
            DB    $01
            DB    $10
            DB    $FF
            DB    $F0
            DB    $01

*-----------------------------------
* 
*-----------------------------------

L12C1       LDA   $48
            BNE   L1311
            LDA   $5E
            BNE   L131E
            LDA   #$00
            STA   $45
            LDA   L0849
            CLC
            ADC   $5D
            STA   L0849
            BEQ   L12DE
            CMP   #$F0
            BNE   L12E7
            DEC   $45
L12DE       LDY   $56
            LDA   LAD42,Y
            STA   $5E
            BNE   L1311
L12E7       CMP   #$08
            BEQ   L1306
            CMP   #$E8
            BNE   L1311
            LDA   $78
            BEQ   L1300
            DEC   $78
            LDX   $E6
            LDA   L0EFC,X
            STA   L0801
            JMP   L1311

L1300       LDA   L0800
            STA   L0801
L1306       LDY   L0801
            LDA   L6600,Y
            AND   #$7F
            STA   L6600,Y
L1311       LDY   #$00
            LDX   #$08
L1315       DEY
            BNE   L1315
            DEX
            BNE   L1315
            JMP   L1933

L131E       DEC   L0869
            BNE   L1311
            LDY   $56
            LDA   LAD38,Y
            STA   L0869
            LDA   $7E
            BNE   L133E
            LDA   L0849
            BEQ   L133E
            LDA   $49
            BEQ   L133E
            STA   $5E
            LDA   #$00
            STA   $49
L133E       DEC   $5E
            BNE   L1355
            LDA   $5D
            EOR   #$F0
            STA   $5D
            BPL   L1351
            LDY   #$00
            STY   L0809
            BEQ   L1355
L1351       LDY   #$01
            STY   $7E
L1355       LDY   $6F
            LDA   L0800,Y
            AND   #$0F
            STA   $DA
            LDA   L0800,Y
            LSR
            LSR
            LSR
            LSR
            STA   $DB
            LDX   #$00
            LDA   L0800
            AND   #$0F
            SEC
            SBC   $DA
            BEQ   L1379
            BCC   L1376
            INX
L1376       LDA   L1208,X
L1379       LDY   $1F
            STA   |$0065,Y
            TYA
            EOR   #$01
            TAY
            LDX   #$00
            LDA   L0800
            LSR
            LSR
            LSR
            LSR
            SEC
            SBC   $DB
            BEQ   L1396
            BCC   L1393
            INX
L1393       LDA   L120A,X
L1396       STA   |$0065,Y
            JMP   L1612

L139C       LDA   #$04
            STA   $DB
            LDX   $6F
            LDA   $70,X
            CMP   #$07
            BNE   L13BB
            CPX   $59
            BEQ   L13FE
            LDA   $56
            CMP   #$03
            BCC   L13FE
            LDA   $CA
            BNE   L13FE
            LDA   $14
            STA   L0848,X
L13BB       LDA   L0800,X
            TAY
            LDA   L6600,Y
            STA   $DA
            LDA   L0830,X
            BNE   L13F8
            INC   $00
            LDY   $00
            LDA   $F000,Y
            AND   #$03
            LDY   $70,X
            CLC
            ADC   L1405,Y
            STA   L0830,X
            INC   $00
            LDY   $00
            LDA   $F000,Y
L13E2       AND   #$03
            TAY
            LDA   L140D,Y
            STA   L0840,X
            LDA   $DA
            AND   L1411,Y
            BNE   L13F8
            DEY
            TYA
            DEC   $DB
            BNE   L13E2
L13F8       DEC   L0830,X
            LDA   L0840,X
L13FE       STA   $65
            STA   $66
            JMP   L1612

L1405       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $02
            DB    $02
L140D       DB    $88
            DB    $95
            DB    $8A
            DB    $8B
L1411       DB    $08
            DB    $04
            DB    $02
            DB    $01

*-----------------------------------
* READ JOYSTICK
*-----------------------------------

readJOYSTICK
            LDX   #$00
            STX   $60
            STX   $61
            LDA   PTRIG
L141E       LDA   PADDL0
            BPL   L1431
            STX   $60
L1425       LDA   PADDL1
            BPL   L1433
            STX   $61
L142C       INX
            BNE   L141E
            BEQ   L1435
L1431       BPL   L1425
L1433       BPL   L142C
L1435       LDA   #$FF
            CMP   $60
            BEQ   L143F
            CMP   $61
            BNE   L1446
L143F       LDA   #$00
            STA   $65
            STA   $66
            RTS

L1446       LDX   #$95
            LDA   $60
            SEC
            SBC   #$40
            BCS   L1456
            LDX   #$88
            EOR   #$FF
            CLC
            ADC   #$01
L1456       LSR
            LSR
            LSR
            CMP   #$05
            BCS   L1461
            LDX   #$00
            LDA   #$00
L1461       STA   $62
            STX   $65
            LDX   #$8A
            LDA   $61
            SEC
            SBC   #$40
            BCS   L1475
            LDX   #$8B
            EOR   #$FF
            CLC
            ADC   #$01
L1475       LSR
            LSR
            LSR
            CMP   #$05
            BCS   L1480
            LDX   #$00
            LDA   #$00
L1480       STX   $66
            CMP   $62
            BCC   L1488
            STA   $62
L1488       LDA   $62
            STA   $64
            LDA   #$00
            LDY   BUTN1
            BMI   L1498
            LDY   BUTN0
            BPL   L149A
L1498       LDA   #$A0
L149A       RTS

L149B       LDA   KBDSTROBE
            LDA   #$C3
            STA   $CA
            LDA   #$FB
            STA   $48
            STA   $DA
            LDA   $6E
            STA   $6F
L14AC       LDX   $6F
            LDY   L0800,X
            LDA   L6600,Y
            AND   #$7F
            STA   L6600,Y
            LDA   #$00
            STA   L0808,X
            STA   L0830,X
            STA   L0838,X
            STA   L0880,X
            STA   L0878,X
            LDA   $CA
            STA   L0848,X
            JSR   L1729
            DEC   $6F
            BNE   L14AC
            LDA   #$FC
            STA   L0800
            LDA   #$08
            STA   $5D
            LDA   #$FF
            STA   $45
            LDA   #$F0
            STA   L0849
            LDA   $56
            LSR
            TAY
            LDA   LACDD,Y
            STA   $78
            LDA   #$00
            STA   L0878
            STA   $CB
            STA   L0848
            STA   $47
            STA   L0808
            JSR   L9604
            LDY   $56
            LDA   LAD42,Y
            LDY   $E6
            LDX   L0EEC,Y
            BNE   L1515
            STA   $DC
            ASL
            ADC   $DC
            ASL
L1515       STA   $5E
L1517       LDY   $45
            LDA   $C030,Y
            LDA   $6E
            STA   $6F
L1520       LDX   $6F
            CPX   #$02
            BCC   L1540
            LDY   $70,X
            CPY   #$02
            BEQ   L1540
            DEC   L0868,X
            BNE   L1551
            CPY   #$09
            BCC   L1538
            JSR   L1825
L1538       LDY   $56
            LDA   LAD38,Y
            STA   L0868,X
L1540       LDA   $70,X
            ASL
            TAX
            LDA   LAD08,X
            STA   $F0
            LDA   LAD08+1,X
            STA   $F0+1
            JMP   ($00F0)
L1551       JMP   L1933

L1554       LDA   $69
            CMP   #$9B
            BNE   L155C
            LDA   #$00
L155C       STA   $65
            STA   $66
            LDA   #$08
            STA   $62
            STA   $64
L1566       LDA   L0808
            BEQ   L15A3
            LDX   $79
            BEQ   L1572
            JMP   L1933

L1572       LDX   $F6
            BNE   L1579
            JMP   L1933

L1579       LDA   LAD22,X
            STA   $79
            LDA   #$04
            LDY   $1A
            STA   |$0054,Y
            LDA   L95FD,Y
            TAY
            LDA   #$00
            STA   |$004A,Y
            STA   |$004B,Y
            LDA   LAD2D,X
            STA   |$004C,Y
            LDA   #$09
            JSR   playMUSIC
            LDA   #$01
            STA   $58
            JMP   L096E

L15A3       LDX   $79
            LDA   L0800
            BNE   L15BA
            CPX   #$00
            BNE   L15B2
            LDX   #$02
            BNE   L1579
L15B2       CPX   #$12
            BNE   L15CA
            LDX   #$06
            BNE   L1579
L15BA       CMP   #$22
            BNE   L15CA
            CPX   #$08
            BNE   L15CA
            LDA   $59
            BEQ   L15CA
            LDX   #$04
            BNE   L1579
L15CA       LDA   $CB
            BNE   L15D2
            LDA   #$04
            STA   $CB
L15D2       LDA   $65
            STA   $CC
            LDA   $66
            STA   $CD
L15DA       JMP   L1933

L15DD       LDA   $25
            BEQ   L15DA
            INC   $00
            LDA   L0848
            BEQ   L15F3
            LDA   $CC
            STA   $65
            LDA   $CD
            STA   $66
            JMP   L1612

*-----------------------------------
* 
*-----------------------------------

L15F3       LDA   KBD
            BMI   L1602
            JSR   readJOYSTICK
            CMP   #$A0
            BNE   L1612
            JMP   L1566

L1602       STA   KBDSTROBE
            CMP   #" "
            BNE   L160C
            JMP   L1554

L160C       STA   $69
            STA   $65
            STA   $66
L1612       LDX   $67
            TXA
            EOR   #$01
            TAY
            LDA   $65,X
            STA   $2A
            LDA   |$0065,Y
            BNE   L1625
            STA   $2A
            LDA   $65,X
L1625       LDY   $6F
            BNE   L163D
            LDY   L0848
            BEQ   L163D
            INC   $64
            LDY   $64
            CPY   #$07
            BCS   L1639
            JMP   L1933

L1639       LDY   $62
            STY   $64
L163D       LDX   $47
            BMI   L1678
            LDX   $6F
            LDY   L0800,X
            STY   $D1
            LDY   L0808,X
            STY   $2C
            CMP   #$88	; LEFT ARROW
            BEQ   L1681
            CMP   #$95	; RIGHT ARROW
            BEQ   L169C
            CMP   #$8A	; DOWN ARROW
            BEQ   L16B4
            CMP   #$8B	; UP ARROW
            BEQ   L16D1
            CMP   #$DA	; Z
            BEQ   L16B4
            CMP   #$C1	; A
            BEQ   L16D1
            CMP   #$91	; CTRL-Q - restart level
            BEQ   L167B
            CMP   #$8F	; CTRL-O - restart game
            BEQ   L167E
            CMP   #$9B	; ESCAPE
            BNE   L1678
L1671       JSR   L9703	; handle PAUSE
            CMP   #$9B
            BNE   L1671
L1678       JMP   L1933
L167B       JMP   L0940
L167E       JMP   L093D

L1681       LDY   #$02
            STY   $EA
            DEC   $D1
            LDY   L0808,X
            BEQ   L168F
            JMP   L1717

L168F       LDY   L0800,X
            LDA   L6600,Y
            AND   #$08
            BEQ   L16EE
            JMP   L176A

L169C       LDY   #$01
            STY   $EA
            INC   $D1
            LDY   L0808,X
            BNE   L1717
            LDY   L0800,X
            LDA   L6600,Y
            AND   #$04
            BEQ   L16EE
            JMP   L176A

L16B4       LDY   #$03
            STY   $EA
            LDA   $D1
            CLC
            ADC   #$10
            STA   $D1
            LDY   L0808,X
            BNE   L1717
            LDY   L0800,X
            LDA   L6600,Y
            AND   #$02
            BEQ   L16EE
            JMP   L176A

L16D1       LDY   #$00
            STY   $EA
            LDA   $D1
            SEC
            SBC   #$10
            STA   $D1
            LDY   L0808,X
            BNE   L1717
            LDY   L0800,X
            LDA   L6600,Y
            AND   #$01
            BEQ   L16EE
            JMP   L176A

L16EE       LDY   $D1
            LDA   L6400,Y
            CMP   #$02
            BCC   L1709
            LDY   L0800,X
            LDA   L6500,Y
            AND   #$3F
            CMP   $C7
            BNE   L1709
            LDA   #$01
            STA   $2C
            BNE   L176A
L1709       LDA   $2A
            BEQ   L1714
            LDY   #$00
            STY   $2A
            JMP   L1625
L1714       JMP   L1933

L1717       LDY   $D1
            LDA   L6400,Y
            BMI   L176A
            BNE   L1723
            JMP   L1933

L1723       LDA   #$00
            STA   $2C
            BEQ   L176A
L1729       LDA   $E6
            ASL
            ASL
            ASL
            STA   $F0
            LDA   #>L6800
            STA   $F0+1
            LDA   $6F
            TAY
            ASL
            TAX
            LDA   ($F0),Y
            STA   L0800,Y
            BIT   $DA
            BMI   L1748
            STA   L0810,X
            STA   L0811,X
L1748       TAY
            LDX   $6F
            CPX   #$02
            BCC   L175D
            LDA   $70,X
            CMP   #$0C
            BEQ   L175D
            LDA   L6600,Y
            ORA   #$80
            STA   L6600,Y
L175D       RTS

L175E       DEC   $D6
            LDX   #$00
            STX   $DA
            JSR   L1729
            JMP   L1986

L176A       LDA   $D6
            BNE   L175E
            LDA   $CA
            BEQ   L1779
            LDX   $6F
            BEQ   L1779
            JMP   L1933

L1779       LDA   $EA
            LDX   $6F
            STA   L0878,X
            BEQ   L1785
            JMP   L1874

L1785       LDY   $E6
            LDX   $6E
            LDA   L0ECC,Y
            BEQ   L1798
            LDA   $D1
            CMP   L0EDC,Y
            BNE   L1798
            JMP   L18C8

L1798       LDA   L0EEC,Y
            BEQ   L17B5
            LDA   $D1
            CMP   L0EFC,Y
            BNE   L17B5
            LDA   $7B
            BNE   L17B5
            LDA   #$01
            STA   $7B
            SED
            LDA   #$10
            CLC
            JSR   L9562
            LDX   #$01
L17B5       LDA   $D1
L17B7       LDY   L0808,X
            CPY   $2C
            BNE   L17D2
            LDY   $70,X
            CPY   #$07
            BEQ   L17CD
            CPY   #$09
            BCS   L17D2
            LDY   L0848,X
            BNE   L17D2
L17CD       CMP   L0800,X
            BEQ   L17D8
L17D2       DEX
            BNE   L17B7
            JMP   L18F8

L17D8       LDA   $70,X
            CMP   #$06
            BEQ   L185D
            CMP   #$07
            BEQ   L1835
            CMP   #$09
            BCC   L17E9
L17E6       JMP   L18F8

L17E9       LDY   $59
            BNE   L17E6
            LDY   L0848,X
            BNE   L17E6
            CMP   #$02
            BEQ   L17F9
            JMP   L18B8

L17F9       LDY   L0800,X
            LDA   L6500,Y
            AND   #$40
            BNE   L1808
            LDA   L0880,X
            BEQ   L1820
L1808       LDA   L0848
            BNE   L181D
            LDA   #$09
            STA   $70,X
            LDA   #$30
            STA   L0868,X
            SED
            LDA   #$05
            CLC
            JSR   L9562
L181D       JMP   L18F8

L1820       LDA   #$02
            JMP   L18C8

L1825       LDY   L0800,X
            LDA   L6600,Y
            AND   #$7F
            STA   L6600,Y
            LDA   #$0C
            STA   $70,X
            RTS

L1835       JSR   L183B
            JMP   L18F8

L183B       LDA   $48
            BNE   L185C
            LDA   #$60
            STA   $13
            STX   $59
            LDA   #$0D
            STA   L0848,X
            LDY   L0800,X
            LDA   L6600,Y
            AND   #$7F
            STA   L6600,Y
            SED
            LDA   #$05
            CLC
            JSR   L9562
L185C       RTS

L185D       LDA   $59
            BEQ   L18C8
            LDA   #$0B
            STA   $70,X
            LDA   #$30
            STA   L0868,X
            SED
            LDA   #$30
            CLC
            JSR   L9562
            JMP   L18F8

L1874       LDA   $47
            BEQ   L187B
            JMP   L1933

L187B       LDY   $D1
            LDA   L6600,Y
            BPL   L18A8
            LDY   $E6
            LDA   L0ECC,Y
            BEQ   L1890
            LDA   $D1
            CMP   L0EDC,Y
            BEQ   L18D8
L1890       LDA   $D1
            LDY   $6E
            INY
L1895       DEY
            BEQ   L18A8
            CMP   L0800,Y
            BNE   L1895
            LDA   L0808,Y
            CMP   $2C
            BEQ   L18D8
            LDA   $D1
            BNE   L1895
L18A8       LDY   $D1
            CPY   L0800
            BNE   L18F8
            LDA   L0808
            CMP   $2C
            BNE   L18F8
            LDA   $70,X
L18B8       CMP   #$07
            BNE   L18BF
            JMP   L1835

L18BF       LDY   L0848,X
            BNE   L18F8
            CMP   #$06
            BEQ   L185D
L18C8       LDY   $59
            BNE   L18F8
            LDY   L0848
            BNE   L18E8
            LDA   #$FF
            STA   $47
            JMP   L18F8

L18D8       LDA   $70,X
            CMP   #$02
            BNE   L1933
            CLC
            ADC   L0840,X
            STA   L0840,X
            JMP   L1933


L18E8       CMP   #$03
            BEQ   L18F0
            CMP   #$02
            BNE   L18F8
L18F0       LDA   $57
            STA   L0868,X
            JMP   L18F8

L18F8       LDX   $6F
            LDA   $2C
            STA   L0808,X
            CPX   #$00
            BNE   L190B
            LDA   $D1
            STA   L0800
            JMP   L1933

L190B       LDA   $70,X
            CMP   #$0C
            BEQ   L1933
            CMP   #$07
            BEQ   L191A
            LDA   L0848,X
            BNE   L1933
L191A       LDY   L0800,X
            LDA   L6600,Y
            AND   #$7F
            STA   L6600,Y
            LDA   $D1
            STA   L0800,X
            TAY
            LDA   L6600,Y
            ORA   #$80
            STA   L6600,Y
L1933       LDA   $D6
            BEQ   L193A
            JMP   L175E

L193A       LDA   $6F
            ASL
            CLC
            ADC   $EC
            TAX
            LDY   L0810,X
            LDA   L6200,Y
            STA   $F4
            LDA   L0820,X
            STA   $F5
            LDA   L0820,X
            STA   $F5
            LDA   LAD4C,X
            STA   $EE
            LDA   LAD5C,X
            STA   $EF
            LDX   #$17
            STX   $E7
            LDX   #$00
L1963       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            EOR   $ED
            STA   $F0+1
            LDY   $F4
            LDA   ($EE,X)
            STA   ($F0),Y
            INY
            INC   $EE
            LDA   ($EE,X)
            STA   ($F0),Y
            INC   $EE
            INC   $F5
            DEC   $E7
            BNE   L1963
L1986       DEC   $6F
            BMI   L198D
            JMP   L1520

L198D       LDA   $7B
            BEQ   L1998
            CMP   #$03
            BCS   L1998
            JSR   L0F38
L1998       LDA   $6E
            STA   $6F
            JSR   L104D
            LDX   $59
            BEQ   L19B8
            LDA   L0800
            STA   L0800,X
            LDA   L0848
            CLC
            ADC   #$0D
            STA   L0848,X
            LDA   L0808
            STA   L0808,X
L19B8       LDX   $6F
            LDY   L0800,X
            TXA
            ASL
            CLC
            ADC   $EC
            TAX
            STA   $DA
            TYA
            STA   L0810,X
            LDY   $6F
            BEQ   L19D1
            LDA   $48
            BMI   L1A35
L19D1       LDA   L0850,Y
            BEQ   L19E6
            LDA   #$00
            STA   L0850,Y
            LDA   $DA
            EOR   #$01
            TAX
            LDY   L0810,X
            JSR   L1AC5
L19E6       LDA   |$0070,Y
            CMP   #$04
            BCS   L1A35
            LDX   $6F
            LDA   L0808,X
            BNE   L1A35
            LDA   L0848,X
            BNE   L1A35
            LDX   $DA
            LDY   L0810,X
            LDA   L6500,Y
            AND   #$40
            BEQ   L1A35
            LDA   #$01
            LDX   $6F
            STA   L0850,X
            LDA   L6500,Y
            AND   #$BF
            STA   L6500,Y
            JSR   L1AC5
            LDA   $6F
            BNE   L1A1E
            JSR   L9551
L1A1E       LDY   $6F
            LDA   |$0070,Y
            CMP   #$02
            BNE   L1A31
            LDA   #$01
            STA   L0868,Y
            LDA   #$05
            STA   L0880,Y
L1A31       DEC   $25
            BEQ   L1A3F
L1A35       DEC   $6F
            BMI   L1A3C
            JMP   L19B8
L1A3C       JMP   L1B2B

L1A3F       LDA   $6F
            STA   $46
            LDA   #$05
            STA   $48
            LDY   $CA
            BNE   L1A4D
            STA   $CA
L1A4D       JMP   L1A35

*-----------------------------------
* WHO HAS THE LAST GEM?
*-----------------------------------

L1A50       LDA   $46
            BNE   L1A60
            LDA   #$1A	; YOU GOT THE LAST GEM
            JSR   printSTRING
            JSR   showBONUS
            LDA   #$00
            BEQ   L1A67

L1A60       LDA   #$19	; THEY GOT THE LAST GEM
            JSR   printSTRING
            LDA   #$01
L1A67       JSR   playMUSIC

            INC   $79	; next level
            LDA   $79
            CMP   #$25	; 18x2 + 1 ?
            BEQ   L1A79
            LDA   #$01
            STA   $58
            JMP   L096E

L1A79       LDA   TXTPAGE1
            JSR   clearHGR1
            LDA   #$18	; I GIVE UP
            JSR   printSTRING
            LDA   #$3B
            STA   $F0
            STA   $F2
            LDA   #$22
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            LDY   $1A
            LDX   $54,Y
            LDA   L95F3,X
            JSR   printCHARACTER
            LDX   #$04
L1A9E       LDA   L95F2
            JSR   printCHARACTER
            DEX
            BNE   L1A9E
            LDY   $1A
            LDX   L95FD,Y
            SED
            LDA   |$0054,Y
            SEC
            ADC   $4C,X
            STA   $4C,X
            LDA   #$FF
            STA   |$0054,Y
            JSR   L9589
            LDA   #$08
            JSR   playMUSIC
            JMP   L965B

L1AC5       LDA   L6500,Y
            EOR   #$FF
            AND   #$1F
            STA   $DB
            LDA   L6300,Y
            CLC
            ADC   #$16
            TAX
            LDA   L6000,X
            STA   $F0
            LDA   L6100,X
            EOR   $ED
            STA   $F0+1
            LDA   L6000+1,X
            STA   $F2
            LDA   L6100+1,X
            EOR   $ED
            STA   $F2+1
            LDA   L6200,Y
            TAY
            INY
            LDA   #$FF
            STA   ($F0),Y
            STA   ($F2),Y
            LDA   $F0+1
            EOR   #$60
            STA   $F0+1
            LDA   $F2+1
            EOR   #$60
            STA   $F2+1
            LDA   #$FF
            STA   ($F0),Y
            STA   ($F2),Y
            INC   $00
            LDY   $EC
            BEQ   L1B2A
            LDA   $DB
            LDX   $6F
            BEQ   L1B23
            LDX   $01
            BNE   L1B2A
            STY   $01
            LDX   $00
            ADC   $F000,X
            AND   #$1F
L1B23       STY   $0F
            LDY   #$00
            JSR   L6931
L1B2A       RTS

L1B2B       LDA   $6E
            STA   $6F
L1B2F       LDA   #$63
            STA   $D3
            LDA   #$00
            STA   $DA
            LDX   $6F
            LDA   L0808,X
            BEQ   L1B44
            INC   $D3
            LDA   $C7
            STA   $DA
L1B44       LDA   $6F
            ASL
            CLC
            ADC   $EC
            TAX
            LDA   LAD4C,X
            STA   $EE
            LDA   LAD5C,X
            STA   $EF
            LDY   L0810,X
            LDA   L6200,Y
            STA   $F4
            LDA   ($D2),Y
            SEC
            SBC   $DA
            LDY   $6F
            SBC   L0848,Y
            STA   $DC
            BCS   L1B6F
            LDA   #$00
            STA   $DC
L1B6F       LDY   $6F
            LDA   L0800,Y
            TAY
            LDA   L6500,Y
            CMP   #$3F
            BNE   L1B82
            INC   $DC
            INC   $DC
            INC   $DC
L1B82       LDA   $DC
            STA   $F5
            STA   L0820,X
            LDX   #$17
            STX   $E7
            LDX   #$00
L1B8F       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            EOR   $ED
            STA   $F0+1
            LDY   $F4
            LDA   ($F0),Y
            STA   ($EE,X)
            INY
            INC   $EE
            LDA   ($F0),Y
            STA   ($EE,X)
            INC   $EE
            INC   $F5
            DEC   $E7
            BNE   L1B8F
            DEC   $6F
            BMI   L1BB9
            JMP   L1B2F

L1BB9       LDX   #$00
L1BBB       LDY   L0870,X
            STY   $DB
            LDY   L0871,X
            STY   $DA
            LDA   L0800,Y
            LDY   $DB
            CMP   L0800,Y
            BCC   L1BE7
            BNE   L1BD6
            LDA   |$0070,Y
            BNE   L1BE7
L1BD6       LDA   $DB
            STA   L0871,X
            LDA   $DA
            STA   L0870,X
            DEX
            BPL   L1BBB
            LDX   #$01
            BNE   L1BBB
L1BE7       INX
            CPX   $6E
            BNE   L1BBB
            LDA   $6E
            STA   $DF
L1BF0       LDX   $DF
            LDY   L0870,X
            STY   $6F
            LDA   L0800,Y
            STA   $DC
            CMP   $5B
            BCC   L1C07
            LDA   $7C
            BNE   L1C07
            JSR   L0E55
L1C07       LDA   $DC
            CMP   $5A
            BCC   L1C14
            LDA   $16
            BNE   L1C14
            JSR   L0E21
L1C14       LDX   $6F
            LDY   L0800,X
            LDA   L6700,Y
            STA   $5C
            LDA   L6200,Y
            STA   $F4
            LDA   L0808,X
            BEQ   L1C2C
            LDA   #$00
            STA   $5C
L1C2C       LDA   $6F
            ASL
            CLC
            ADC   $EC
            TAY
            LDA   L0820,Y
            STA   $F5
            LDA   $70,X
            CMP   #$09
            BCC   L1C45
            CMP   #$0C
            BNE   L1C72
            JMP   L1CD4

L1C45       LDX   $6F
            LDY   L0800,X
            LDA   L6200,Y
            AND   #$01
            STA   $DC
            LDA   $70,X
            ASL
            ASL
            CLC
            ADC   L0878,X
            ASL
            CLC
            ADC   $DC
            ASL
            TAY
            LDA   $9C00,Y
            STA   $FE
            STA   $E0
            LDA   $9C01,Y
            STA   $FE+1
            CLC
            ADC   #$06
            STA   $E0+1
            BNE   L1C88
L1C72       SEC
            SBC   #$09
            TAX
            LDA   $9C90,X
            STA   $FE
            LDA   $9C93,X
            STA   $FE+1
            LDA   #<L7F60
            STA   $E0
            LDA   #>L7F60
            STA   $E0+1
L1C88       LDX   #$17
            STX   $E7
            LDX   #$00
L1C8E       LDY   $F5
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            EOR   $ED
            STA   $F0+1
            LDA   #$02
            STA   $E8
            LDY   $F4
L1CA2       LDA   $5C
            BNE   L1CBB
            LDA   ($F0),Y
            ORA   ($FE,X)
            STA   ($F0),Y
            INY
            INC   $FE
            DEC   $E8
            BNE   L1CA2
            INC   $F5
            DEC   $E7
            BNE   L1C8E
            BEQ   L1CD4
L1CBB       DEC   $5C
L1CBD       LDA   ($F0),Y
            AND   ($E0,X)
            ORA   ($FE,X)
            STA   ($F0),Y
            INY
            INC   $E0
            INC   $FE
            DEC   $E8
            BNE   L1CBD
            INC   $F5
            DEC   $E7
            BNE   L1C8E
L1CD4       LDX   $6F
            LDY   $70,X
            CPY   #$02
            BNE   L1D2B
            LDA   L0880,X
            BEQ   L1D2B
            DEC   L0868,X
            BNE   L1CF4
            LDY   $56
            LDA   LAD38,Y
            LSR
            STA   L0868,X
            DEC   L0880,X
            BEQ   L1D2B
L1CF4       LDY   L0880,X
            LDA   $F5
            SEC
            SBC   LAD70,Y
            TAY
            LDA   L6000,Y
            STA   $F0
            LDA   L6000+1,Y
            STA   $F2
            LDA   L6100,Y
            EOR   $ED
            STA   $F0+1
            LDA   L6100+1,Y
            EOR   $ED
            STA   $F2+1
            LDA   $F4
            AND   #$01
            TAY
            LDA   LAD75,Y
            LDY   $F4
            STA   ($F0),Y
            STA   ($F2),Y
            EOR   #$7F
            INY
            STA   ($F0),Y
            STA   ($F2),Y
L1D2B       DEC   $DF
            BMI   L1D32
            JMP   L1BF0

L1D32       LDA   $7C
            BNE   L1D39
            JSR   L0E55
L1D39       LDA   $16
            BNE   L1D40
            JSR   L0E21
L1D40       LDX   $EC
            STA   $C054,X
            LDA   $ED
            EOR   #$60
            STA   $ED
            LDA   $EC
            EOR   #$01
            STA   $EC
            LDA   $67
            EOR   #$01
            STA   $67
            JSR   L9589
            DEC   $1E
            BNE   L1D6E
            LDY   $56
            LDA   LAD38,Y
            STA   $1E
            LSR
            BCS   L1D6E
            LDA   $1F
            EOR   #$01
            STA   $1F
L1D6E       LDX   $47
            BMI   L1DAD
            LDX   $6E
            STX   $6F
L1D76       LDY   $59
            BNE   L1DEF
            LDY   L0848
            BNE   L1DEF
            LDY   L0800,X
            CPY   L0800
            BNE   L1DD8
            LDY   L0848,X
            BNE   L1DD8
            LDY   L0808,X
            CPY   L0808
            BNE   L1DD8
            LDY   L0880,X
            BNE   L1DD8
            LDY   $70,X
            CPY   #$09
            BCS   L1DD8
            CPY   #$07
            BNE   L1DA9
            JSR   L183B
            JMP   L1DD8

*-----------------------------------
* IS PLAYER DEAD?
*-----------------------------------
 
L1DA9       LDA   $47
            BNE   L1DD5
L1DAD       LDA   $25
            BEQ   L1DD5

            LDA   #$07	; player is dead
            JSR   playMUSIC
            LDA   #$01
            STA   $47
            LDA   #$00
            STA   $CC
            STA   $CD
            LDY   $6E
L1DC2       LDA   L6600,Y
            AND   #$7F
            STA   L6600,Y
            DEY
            BNE   L1DC2
            LDX   $1A
            DEC   $54,X	; NOP to get infinite lives (opcode is D6)
            LDA   #$05
            STA   $CB
L1DD5       JMP   L1DEF

L1DD8       DEC   $6F
            BEQ   L1DE0
            LDX   $6F
            BNE   L1D76
L1DE0       LDY   $E6
            LDA   L0ECC,Y
            BEQ   L1DEF
            LDA   L0EDC,Y
            CMP   L0800
            BEQ   L1DA9

L1DEF       LDA   $CB
            BEQ   L1E5A
            CLC
            ADC   L0848
            STA   L0848
            BEQ   L1E58
            CMP   #$D0
            BCC   L1E3C
            LDA   $19
            BNE   L1E07
            JMP   L149B

L1E07       LDY   $1A	; player index
            LDA   |$0054,Y ; is player alive?
            BPL   L1E11	; yes
            JMP   L9635	; no, player is dead

L1E11       TYA
            EOR   #$01
            TAY
            LDA   |$0054,Y
            BPL   L1E1D
            JMP   L149B

L1E1D       JSR   clearHGR1
            LDA   #$1D	; GET READY
            JSR   printSTRING
            LDA   $1A
            EOR   #$01
            CLC
            ADC   #$1E	; PLAYER 1/2
            JSR   printSTRING
            JSR   L96A0
            JSR   L0AA5
            LDA   #$00
            STA   $58
            JMP   L096E

L1E3C       CMP   #$18
            BNE   L1E44
            LDA   #$FC
            STA   $CB
L1E44       LDX   $47
            BNE   L1E5A
            SEC
            LDA   #$20
            STA   $0F
            SBC   L0848
            LDY   #$00
            JSR   L6931
            JMP   L1E5A

L1E58       STA   $CB
L1E5A       LDA   $CA
            BNE   L1E62
            STA   $48
            BEQ   L1E90
L1E62       CMP   #$CD
            BNE   L1E69
            JMP   L1A50

L1E69       CLC
            ADC   $48
            STA   $CA
            LDX   $6E
L1E70       LDA   $CA
            STA   L0848,X
            TXA
            CLC
            ADC   #$02
            STA   L0868,X
            DEX
            CPX   #$01
            BNE   L1E70
            LDA   $48
            BMI   L1E90
            BEQ   L1E90
            CLC
            ADC   L0849
            BCS   L1E90
            STA   L0849
L1E90       LDA   $CA
            BNE   L1EAA
            LDA   $14
            CLC
            ADC   $15
            STA   $14
            BEQ   L1EA1
            CMP   #$10
            BNE   L1EAA
L1EA1       LDA   $15
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $15
L1EAA       LDA   $13
            BEQ   L1ECF
            LDA   #$60
            SEC
            SBC   $13
            LSR
            TAY
            LDA   L6AB4,Y
            STA   $0F
            LDY   #$00
            JSR   L6931
            DEC   $13
            BNE   L1ECF
            LDX   $59
            BEQ   L1ECF
            LDA   #$0C
            STA   $70,X
            LDA   #$00
            STA   $59
L1ECF       LDA   #$00
            STA   $16
            STA   $7C
            LDA   $7B
            CMP   #$01
            BNE   L1EDE
            JSR   L0F38
L1EDE       LDA   $56
            CMP   #$08
            BNE   L1F06
            LDA   $7D
            CMP   #$FF
            BEQ   L1F06
            DEC   $7D
            BNE   L1F06
            LDX   $6E
L1EF0       LDA   $70,X
            CMP   #$07
            BNE   L1F03
            CPX   $59
            BEQ   L1F03
            LDA   #$01
            STA   $70,X
            LDA   #$00
            STA   L0848,X
L1F03       DEX
            BNE   L1EF0
L1F06       INC   $00
            LDA   $6E
            STA   $6F
            JMP   L1517

            NOP
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

*-----------------------------------
* INTERIM ENTRY POINT
*-----------------------------------

L1F20       JSR   showTITLE	; show title screen
            JSR   HOME
            STA   KBDSTROBE
L1F29       LDA   KBD	; wait
            BPL   L1F29
            STA   KBDSTROBE
            BIT   TXTSET
            JMP   L0900	; to game

	DS    \

*-----------------------------------
* SHOW BONUS
*-----------------------------------

            ORG   $009500

showBONUS   LDA   #$40
            STA   $F0
            STA   $F2
            LDA   #$22
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            LDA   $79
            CLC
            ADC   #$0A
            STA   $DB
            LDX   #$08
            LDA   #$00
            STA   $24
            SED
L951C       ASL   $DB
            LDA   $24
            ADC   $24
            STA   $24
            DEX
            BNE   L951C
            CLD
            LSR
            LSR
            LSR
            LSR
            TAX
            LDA   L95F2,X
            JSR   printCHARACTER
            LDA   $24
            AND   #$0F
            TAX
            LDA   L95F2,X
            JSR   printCHARACTER
            LDA   L95F2
            JSR   printCHARACTER
            LDA   L95F2
            JSR   printCHARACTER
            SED
            LDA   $24
            CLC
            JMP   L9562
L9551       LDY   $1A
            LDX   L95FD,Y
            SED
            LDA   $23
            CLC
            ADC   $4A,X
            STA   $4A,X
            BCC   L957E
            LDA   #$00
L9562       LDY   $1A
            LDX   L95FD,Y
            ADC   $4B,X
            STA   $4B,X
            BCC   L957E
            LDA   #$00
            ADC   $4C,X
            STA   $4C,X
            SEC
L9574       SBC   #$07
            BMI   L957E
            BNE   L9574
            LDA   #$01
            STA   $5F
L957E       LDA   $23
            CMP   #$99
            BEQ   L9589
            CLC
            ADC   #$01
            STA   $23
L9589       CLD
            LDY   $1A
            LDX   L95FD,Y
            TXA
            CLC
            ADC   #$02
            TAY
            LDA   #$00
            STA   $2B
            LDA   L95FF,X
            STA   $F0
            STA   $F2
            LDA   L9600,X
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            LDA   #$02
            STA   $DC
L95AC       LDA   |$004A,Y
            LSR
            LSR
            LSR
            LSR
            TAX
            BNE   L95BA
            LDA   $2B
            BEQ   L95C2
L95BA       INC   $2B
            LDA   L95F2,X
            JSR   printCHARACTER
L95C2       LDA   |$004A,Y
            AND   #$0F
            TAX
            BNE   L95CE
            LDA   $2B
            BEQ   L95D6
L95CE       INC   $2B
            LDA   L95F2,X
            JSR   printCHARACTER
L95D6       DEY
            DEC   $DC
            BPL   L95AC
            LDA   $5F
            BNE   L95E0
            RTS

L95E0       LDA   #$00	; nb lives++
            STA   $5F
            LDX   $1A
            LDA   $54,X
            CMP   #$06
            BCS   L95F1
            INC   $54,X
            JSR   L9604
L95F1       RTS

L95F2       DB    $4F
L95F3       DB    $31
            DB    $32
            DB    $33
            DB    $34
            DB    $35
            DB    $36
            DB    $37
            DB    $38
            DB    $39
            DB    $4F
L95FD       DB    $00	; index in score $4A..$4C / $4D..$4F
            DB    $03
L95FF       DB    $82
L9600       DB    $20
            DB    $00
            DB    $02
            DB    $21

L9604       LDA   #$50
            STA   $F0
            STA   $F2
            LDA   #$23
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            LDX   $1A
            LDY   $54,X
            BMI   L9635	; dead?
            CPY   #$06	; more than 6 lives
            BCC   L9620	; make it 5 max
            LDY   #$05
            STY   $54,X
L9620       DEY
            BMI   L962F
            LDA   #$23
            JSR   printCHARACTER
            INC   $F0
            INC   $F2
            JMP   L9620

L962F       LDA   #$20	; space
            JSR   printCHARACTER
            RTS

*-----------------------------------
* GAME OVER
*-----------------------------------

L9635       PLA
            PLA
            LDA   #$1C	; GAME OVER
            JSR   printSTRING
            LDA   $19
            BEQ   L9648
            LDA   $1A
            CLC
            ADC   #$1E	; PLAYER 1/2
            JSR   printSTRING
L9648       LDA   #$04
            JSR   playMUSIC
            JSR   L96A0
            CMP   #$9B
            BNE   L965B
L9654       JSR   L9703
            CMP   #$9B
            BNE   L9654
L965B       LDA   KBDSTROBE
            LDA   $19
            BEQ   L9671
            LDA   $1A
            EOR   #$01
            TAY
            LDA   |$0054,Y
            BMI   L9671
            STY   $1A
            JMP   L096E

L9671       LDA   $79
            CMP   #$09
            BCC   L969D
            LDA   TXTPAGE1
            JSR   clearHGR1
            LDA   #$15	; ?
            JSR   printSTRING
            LDA   $79
            CMP   #$11
            BCC   L9698
            LDA   #$16	; ?
            JSR   printSTRING
            LDA   $79
            CMP   #$19
            BCC   L9698
            LDA   #$17	; USE SECRET WARP
            JSR   printSTRING
L9698       LDX   #$20
            JSR   L96A2
L969D       JMP   L093D

L96A0       LDX   #$08
L96A2       LDY   #$FF
            STY   $DB
            STA   KBDSTROBE
L96A9       LDA   KBD
            BMI   L96B8
            DEY
            BNE   L96A9
            DEC   $DB
            BNE   L96A9
            DEX
            BNE   L96A9
L96B8       STA   KBDSTROBE
            RTS

*-----------------------------------
* PRINT CHARACTER
*-----------------------------------
* The font is hidden in
* the HGR screen holes!

printCHARACTER
            STX   $DA
            STY   $DB
            SEC
            SBC   #$20
            LSR
            BCS   L96CC
            LDY   #$78
            STY   $1B
            BCC   L96D1
L96CC       LDY   #$F8
            STY   $1B
            CLC
L96D1       ADC   #$20
            STA   $1C
            LDY   #$00
            LDX   #$00
L96D9       LDA   ($1B),Y
            STA   ($F0,X)
            STA   ($F2,X)
            LDA   #$04
            CLC
            ADC   $F0+1
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            INY
            CPY   #$08
            BNE   L96D9
            LDA   $F0+1
            SEC
            SBC   #$20
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            INC   $F0
            INC   $F2
            LDY   $DB
            LDX   $DA
            RTS

L9703       LDA   KBDSTROBE
            LDA   #$09
            STA   $DA
L970A       LDA   #$60
            STA   $DC
L970E       LDX   #$A5
            LDY   #$E1
L9712       LDA   KBD
            BMI   L972E
            DEX
            BNE   L9712
            DEY
            BNE   L9712
            DEC   $DC
            BNE   L970E
            DEC   $DA
            BNE   L970A
            LDA   TXTPAGE1
            LDA   TXTSET
            JMP   L9703

L972E       STA   KBDSTROBE
            STA   $DC
            LDA   $EC
            EOR   #$01
            TAX
            LDA   TXTCLR
            LDA   $C054,X
            LDA   $DC
            RTS

L9741       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000097970000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   000000000000000000000000000000
L9800       HEX   5AF05AF05BE50FA50FA5A5AF05AF0550
            HEX   FA50FA5AFA5AF05AF00FA50FA5AF0FA5
            HEX   AF05AFFA50FA5AF050FA5AF05AA50FA5
            HEX   AF05A503A9A3095CF656FC56F65CF656
            HEX   FC03A9A309A303A903A9A3F656FC56FC
            HEX   5CF65CF656A9A309A309A903A903A956
            HEX   FC56FC56F65CF65CF6A305AF05AF4FA5
            HEX   0FA50FF056FC56FD43A903A903FC56FC
            HEX   56FDF65CF65CF6A309A309A3A903A903
            HEX   A956FC56FC565CF65CF656A9A309A309
            HEX   03A50FA5AFFA5AF05AF0FA50FA5AF00F
            HEX   A5AF05AFA50FA5AF0550FA5AF05A50FA
            HEX   5AF05AA50FA5AF050FA5AF05AFFA50FA
            HEX   5AF0FA5AF05AF00FA50FA5AFA5AF05AF
            HEX   0550FA50FA5A5AF05AF05BE50FA50FA5
            HEX   5050505050505050D0D0D0D0D0D0D0D0
L9900       HEX   0072307260729072C072007330736073
            HEX   9073C0739073C0739073C0739073C073
            HEX   00743074007430740074307400743074
            HEX   60749074607490746074907460749074
            HEX   C0740075C0740075C0740075C0740075
            HEX   30756075307560753075607530756075
            HEX   90750076907500763076C0753076C075
            HEX   60769076607690766076907660769076
            HEX   C0760077C0760077C0760077C0760077
            HEX   C000307E7F7FCB4981428C508C498C42
            HEX   9050904990428750875052A3429A509A
            HEX   499A42944C4953D443414CCC42855085
            HEX   498542555A5A4F46C600000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00A69CA69BA69A809A00000000000000

            ORG   $00A500

*-----------------------------------
* PRINT STRING
*-----------------------------------

printSTRING ASL
            TAY
            LDA   LA603,Y
            STA   $50
            LDA   LA603+1,Y
            STA   $50+1
            CPY   #$26
            BCC   LA526
            LDY   #$00
            LDA   ($50),Y
            STA   $52
            INC   $50
            BNE   LA51C
            INC   $50+1
LA51C       LDA   ($50),Y
            INC   $50
            BNE   LA537
            INC   $50+1
            BNE   LA537
LA526       CPY   #$04
            BCC   LA52C
            LDY   #$04
LA52C       LDA   LA5E1,Y
            STA   $52
            INY
            LDA   LA5E1,Y
            LDY   #$00
LA537       STA   $53
            TAX
            LDA   L6100,X
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            LDA   L6000,X
            CLC
            ADC   $52
            STA   $F0
            STA   $F2
LA54D       LDA   ($50),Y
            INY
            CMP   #$28
            BEQ   LA58D
            CMP   #$5B
            BEQ   LA572
            CMP   #$21
            BEQ   LA5A4
            CMP   #$5D
            BEQ   LA595
            CMP   #$29
            BEQ   LA583
            CMP   #$60
            BEQ   LA57F
            CMP   #$7E
            BEQ   LA573
            JSR   printCHARACTER
            JMP   LA54D
LA572       RTS

LA573       LDA   $F0
            CLC
            ADC   #$05
            STA   $F0
            STA   $F2
            JMP   LA54D

LA57F       LDX   #$19
            BNE   LA585
LA583       LDX   #$0C
LA585       LDA   #$20
            JSR   printCHARACTER
            DEX
            BNE   LA585
LA58D       LDA   $53
            CLC
            ADC   #$08
            JMP   LA537

LA595       LDX   #$00
LA597       LDA   LA5E7,X
            JSR   printCHARACTER
            INX
            CPX   #$10
            BNE   LA597
            BEQ   LA58D
LA5A4       LDX   #$00
LA5A6       LDA   LA5F7,X
            JSR   printCHARACTER
            INX
            CPX   #$0C
            BNE   LA5A6
            LDA   #$A3
            STA   $F0
            STA   $F2
            LDA   #$22
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            LDA   $79
            LSR
            LSR
            STA   $56
            TAX
            LDA   L95F3,X
            JSR   printCHARACTER
            LDA   $56
            CMP   #$09
            BNE   LA572
            LDA   $F0
            SEC
            SBC   #$02
            STA   $F0
            STA   $F2
            LDA   #$31
            JSR   printCHARACTER
            RTS

*-----------------------------------
* 
*-----------------------------------

LA5E1       HEX   0040
            HEX   1840
            HEX   1A48
LA5E7       HEX   24242524252425242524252425242525
LA5F7       ASC   '  LEVEL     '
LA603       DA    LA643	; 0	UPPER LEFT FRAME
            DA    LA66F	; 1	UPPER RIGHT FRAME
            DA    LA696	; 2	GET THE GEMS BENTLEY BER
            DA    LA6E8	; 3	TREE WAVE
            DA    LA6F9	; 4	DOOMSDOME
            DA    LA70A	; 5	BERTHILDAS CASTLE
            DA    LA727	; 6	HIDDEN RAMP
            DA    LA738	; 7	EXTRA LIVES EVERY 70000
            DA    LA755	; 8	CROSSROADS
            DA    LA766	; 9	BERTHILDAS FORTRESS
            DA    LA783	; 10  A	NASTY TREE
            DA    LA794	; 11  B	HIDDEN SPIRAL
            DA    LA7B1	; 12  C	BERTHILDAS DUNGEON
            DA    LA7CE	; 13  D	PYRAMID
            DA    LA7DF	; 14  E	CROSS MAZE
            DA    LA7F0	; 15  F	BERTHILDAS PALACE
            DA    LA80D	; 16 10	IMPOSSIBLE STAIRCASE
            DA    LA82A	; 17 11	THE END
            DA    LA6B3	; 18 12	ENTER TUNNEL AND PRESS...
            DA    LA83B	; 19 13	HINTS
            DA    LA8C4	; 20 14	HINTS
            DA    LA972	; 21 15	HINTS
            DA    LA9BA	; 22 16	HINTS
            DA    LAA11	; 23 17	USE SECRET WARP
            DA    LAA5D	; 24 18	I GIVE UP
            DA    LAA9A	; 25 19	THEY GOT THE LAST GEM
            DA    LAAD4	; 26 1A	YOU GOT THE LAST GEM
            DA    LAB0E	; 27 1B	(C) ATARI
            DA    LABDF	; 28 1C	GAME OVER
            DA    LABFE	; 29 1D	GET READY
            DA    LAC1D	; 30 1E	PLAYER 1
            DA    LAC3B	; 31 1F	PLAYER 2

LA643       HEX   2427262726272627262528
	HEX   2424252425242524252528
	HEX   2424252425242524252528
	HEX   242627262726272627255B
LA66F       HEX   2427262726272627262726272627262528
            HEX   5D5D5D5D5D
	HEX   242627262726272627262726272627255B

LA696       ASC   'GET THE GEMS()BENTLEY BEAR()!'
LA6B3       ASC   'ENTER TUNNEL('
	ASC   'AND PRESS   ('
	ASC   'JUMP BUTTON ('
	ASC   'TO WARP TO  (!'
LA6E8       ASC   'TREE WAVE   ()))!'
LA6F9       ASC   'DOOMSDOME   ()))!'
LA70A       ASC   'BERTHILDAS  (CASTLE      ())!'
LA727       ASC   'HIDDEN RAMP ()))!'
LA738       ASC   'EXTRA LIVES (EVERY 7OOOO ())!'
LA755       ASC   'CROSSROADS  ()))!'
LA766       ASC   'BERTHILDAS  (FORTRESS    ())!'
LA783       ASC   'NASTY TREE  ()))!'
LA794       ASC   'HIDDEN      (SPIRAL      ())!'
LA7B1       ASC   'BERTHILDAS  (DUNGEON     ())!'
LA7CE       ASC   'PYRAMID     ()))!'
LA7DF       ASC   'CROSS MAZE  ()))!'
LA7F0       ASC   'BERTHILDAS  (PALACE      ())!'
LA80D       ASC   'IMPOSSIBLE  (STAIRCASE   ())!'
LA82A       ASC   'THE END     ()))!'

LA83B       DB    $00
            DB    $40
            ASC   '~~~  HINTS((('
	ASC   '~  MAGIC HAT MAKES YOU INVINCIBLE(('
	ASC   '~  WEAR IT(~  AND YOU CAN KILL BERTHILDA(('
	ASC   '   CATCH GEM EATERS('
	ASC   '   WHEN THEY ARE EATING(['
LA8C4       DB    $00
            DB    $98
            ASC   '   STAY AWAY WHEN THEY ARE('
	ASC   '   MOVING FROM GEM TO GEM(('
	ASC   '~  TAKE TOO MUCH TIME AND('
            ASC   '~  THE SWARM RETURNS(('
	ASC   '   JUMP OVER TREES TO STUN THEM((((('
	ASC   '   PRESS RETURN FOR OPTION SCREEN['
LA972       DB    $03
            DB    $70
            ASC   '~USE SECRET WARP NUMBER 1(('
	ASC   '~JUMP AT BACK CORNER OF('
	ASC   '~~MAZE 1('
	ASC   '~~LEVEL 1['
LA9BA       DB    $03
            DB    $A8
            ASC   '~USE SECRET WARP NUMBER 2(('
	ASC   '~WEAR HAT AND('
	ASC   '~JUMP AT BOTTOM OF HIDDEN RAMP('
	ASC   '~~ON LEVEL 3['
LAA11       DB    $03
            DB    $E0
            ASC   '~USE SECRET WARP NUMBER 3(('
	ASC   '~JUMP AT BACK CORNER('
	ASC   '~OF CROSSROADS ON LEVEL 5['
LAA5D       DB    $00
            DB    $80
            ASC   '~I GIVE UP : YOU WIN(('
	ASC   '~YOU MUST BE VERY GOOD(('
	ASC   '~LIVES BONUS['
LAA9A       DB    $08
            DB    $88
            ASC   '`  THEY GOT THE LAST GEM  ('
	ASC   '`        NO BONUS         (`['
LAAD4       DB    $08
            DB    $88
            ASC   '`  YOU GOT THE LAST GEM   ('
	ASC   '`       BONUS             (`['
LAB0E       DB    $05
            DB    $48
            ASC   '~ATARISOFT  PRESENTS((('
	ASC   '~ CRYSTAL   CASTLES(((('
	ASC   'PRESS 1 FOR ONE PLAYER(('
	ASC   'PRESS 2 FOR TWO PLAYER(('
	ASC   'PRESS SPACE BAR TO START(('
            ASC   'PRESS RETURN FOR HINT SCREEN(('
	ASC   '~~PLAYERS((((('
	ASC   '~COPYRIGHT 1983 ATARI(~'
	ASC   'ALL RIGHTS RESERVED['
LABDF	DB    $08
	DB    $88
            ASC   '`        GAME OVER        (`['
LABFE       DB    $08
            DB    $88
            ASC   '`        GET READY        (`['
LAC1D       DB    $08
            DB    $A0
            ASC   '        PLAYER  1        (`['
LAC3B       DB    $08
            DB    $A0
            ASC   '        PLAYER  2        (`['

            ASC   'WRITTEN BY JOHN STOUFFER 6/1/84'

*--- Index in levels

LAC78       HEX   00010203040506070408090A0B0C040D
            HEX   050806030C01010D050B090A050C0407
            HEX   0E08090A0F

LAC9D	DFB   >L8000	; Level data high pointer
	DFB   >L8100
	DFB   >L8200
	DFB   >L8300
	DFB   >L8400
	DFB   >L8500
	DFB   >L8600
	DFB   >L8700
	DFB   >L8800
	DFB   >L8900
	DFB   >L8A00
	DFB   >L8B00
	DFB   >L8C00
	DFB   >L8D00
	DFB   >L8E00
	DFB   >L8F00
	
LACAD       DB    $AA
            DB    $A5
            DB    $85
            DB    $D0
            DB    $AA
            DB    $AA
            DB    $D5
            DB    $D2
            DB    $8A
            DB    $A8
            DB    $D5
            DB    $D5
LACB9       DB    $00
            DB    $20
LACBB       DB    $80
            DB    $40
LACBD       DB    $40
            DB    $A0
            DB    $60
            DB    $60
            DB    $C0
            DB    $40
            DB    $80
            DB    $E0
            DB    $60
            DB    $A0
LACC7       DB    $7A
            DB    $57
            DB    $75
            DB    $2F
LACCB       DB    $FF
            DB    $01
            DB    $10
            DB    $F0
LACCF       DB    $08
            DB    $04
            DB    $02
            DB    $01
LACD3       DB    $00
            DB    $08
            DB    $10
            DB    $18
            DB    $20
LACD8       DB    $0A
            DB    $0C
            DB    $0E
            DB    $10
            DB    $12
LACDD       DB    $0A
            DB    $08
            DB    $06
            DB    $06
            DB    $06
            DB    $06
LACE3	HEX   07050705060606060607070707070707
	HEX   07070707070707070707070707070707
	HEX   0707070707

LAD08       DA    L15DD
            DA    L1141
            DA    L120C
            DA    L1355
            DA    L139C
            DA    L139C
            DA    L139C
            DA    L139C
            DA    L12C1
            DA    L1933
            DA    L1933
            DA    L1933
            DA    L1311
LAD22       HEX   0004080C1014181C1C1C1C
LAD2D       HEX   0007142128354249494949
LAD38       HEX   09070504040303020202
LAD42       HEX   07080C0F0F14141E1E1E
LAD4C       HEX   004080C0004080C0004080C0004080C0
LAD5C       HEX   A0A0A0A0A1A1A1A1A2A2A2A2A3A3A3A3
LAD6C       HEX   9D9E
LAD6E       HEX   0020
LAD70       HEX   000E0B0805
LAD75       HEX   552A

	HEX   ADD3B5ACD4B52089AD38B0D120FBAF4C
	HEX   7FB33820DDB2A900A2059DF0B5CA10FA
	HEX   6020DCABA9FFADADB520F7AFA9168D9D
	HEX   B3202FAE202FAEA20CBDAEB320C59FCA
	HEX   D0F78646ADF6B785442042AE20DFBC20
	HEX   2FAE182011B0B05DA2008E9CB3BDC6B4
	HEX   F053304AA0A0BDC8B41002A0AA9820ED
	HEX   FDBDC8B4297FA0070A0AB00388D0FAB9
	HEX   A7B320EDFDA9A020ED

*-----------------------------------
* SHOW TITLE PAGE AND OPTIONS
*-----------------------------------

LAE00       JSR   clearHGR1
            LDA   #$1B	; show (c) string
            JSR   printSTRING
            JSR   LAE53
            JSR   copyHGR1TOHGR2
LAE0E       JSR   showNBPLAYERS
            JSR   L9703
            STA   TXTPAGE1
            CMP   #"1"
            BNE   LAE22
            LDA   #$00
            STA   $19
            JMP   LAE0E

LAE22       CMP   #"2"
            BNE   LAE2D
            LDA   #$01
            STA   $19
            JMP   LAE0E

LAE2D       CMP   #$8D	; return to show hints
            BEQ   LAE36
            CMP   #" "	; space to play
            BNE   LAE0E
            RTS

*-----------------------------------
* SHOW HINTS
*-----------------------------------

LAE36       JSR   clearHGR1
            LDA   #$13	; HINTS 1
            JSR   printSTRING
            LDA   #$14	; HINTS 2
            JSR   printSTRING
            JSR   LAE53	; show sprites
            JSR   copyHGR1TOHGR2
LAE49       JSR   L9703
            CMP   #$8D
            BNE   LAE49
            JMP   LAE00

LAE53       LDA   #$00	; index is 0
            STA   $DB
LAE57       LDY   $DB
            LDA   LAEB7,Y
            STA   $F4	; get x
            LDA   LAEC1,Y
            STA   $F5	; get y
            LDA   LAECB,Y
            CMP   #$FF	; end of data?
            BEQ   LAE7E	; yes
            INC   $DB	; next counter
            ASL
            TAY
            LDA   LAED6,Y
            STA   $FE	; get sprite data pointer
            LDA   LAED6+1,Y
            STA   $FE+1
            JSR   LAE8F	; output sprite
            JMP   LAE57	; loop

LAE7E       LDA   #$55	; fixes display
            STA   $28C6
            STA   $2CC6
            LDA   #$2A
            STA   $28C7
            STA   $2CC7
            RTS

LAE8F       LDX   #$00	; output sprite
            LDA   #$17
            STA   $E7
LAE95       LDY   $F5	; two cols wide
            LDA   L6000,Y
            STA   $F0
            LDA   L6100,Y
            STA   $F0+1
            LDY   $F4
            LDA   ($FE,X)
            STA   ($F0),Y
            INY
            INC   $FE
            LDA   ($FE,X)
            STA   ($F0),Y
            INC   $FE
            INC   $F5
            DEC   $E7
            BNE   LAE95
            RTS

LAEB7       DB    $00	; X
            DB    $02
            DB    $24
            DB    $1E
            DB    $21
            DB    $00
            DB    $08
            DB    $10
            DB    $18
            DB    $20
LAEC1       DB    $44	; Y
            DB    $5C
            DB    $64
            DB    $7E
            DB    $96
            DB    $AC
            DB    $CF
            DB    $CF
            DB    $CF
            DB    $CF
LAECB       DB    $00	; sprite index
            DB    $01
            DB    $02
            DB    $03
            DB    $04
            DB    $05
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $FF
LAED6       DA    L7660	; sprite data
            DA    L7200
            DA    L7590
            DA    L7400
            DA    L7430
            DA    L76C0
            DA    L7460

*-----------------------------------
* SHOW NB PLAYERS
*-----------------------------------

showNBPLAYERS
            LDA   #$68
            STA   $F0
            STA   $F2
            LDA   #$20
            STA   $F0+1
            EOR   #$60
            STA   $F2+1
            LDY   $19
            LDA   L95F3,Y
            JSR   printCHARACTER
            RTS

	DB    $EC
	DS    \	; $AE00
	DS    $100	; $AF00
LB000       DS    $1000	; $B000

*-----------------------------------
* TITLE PICTURE
*-----------------------------------

            ORG   $004000
	PUT   TITLE.S
	
*-----------------------------------
* 
*-----------------------------------

L6000       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
L6100       HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F

*-----------------------------------
* MOVE FONT AND UNPACK
*-----------------------------------

moveDATA    LDA   #$78	; move font to the HGR screen holes
            STA   $FA
            LDA   #$20
            STA   $FA+1
            LDA   #>L63F9
            STA   $F0+1
            LDA   #<L63F9
            STA   $F0
L6210       LDX   #$00
            LDY   #$00
L6214       LDA   ($F0,X)
            INC   $F0
            BNE   L621C
            INC   $F0+1
L621C       STA   ($FA),Y
            INY
            CPY   #$08
            BNE   L6214
            LDA   $FA
            EOR   #$80
            STA   $FA
            BMI   L622D
            INC   $FA+1
L622D       LDA   $FA+1
            CMP   #$4E
            BNE   L6210

            LDA   #<L628C
            STA   $F0
            LDA   #>L628C
            STA   $F0+1
            LDA   #<LB000
            STA   $F2
            LDA   #>LB000
            STA   $F2+1

            LDY   #$00
L6245       LDA   ($F0),Y
            BEQ   L6256	;  0 outputs source++ #$00 bytes
            BMI   L626C	; FF outputs source++ #$FF bytes
            STA   ($F2),Y ; simple output
            JSR   L627E	; source++
            JSR   L6285	; dest++
            JMP   L6245

L6256       JSR   L627E	; source++
            LDA   ($F0),Y ; get counter
            JSR   L627E	; source++
            TAX
            LDA   #$00	; output counter #$00
L6261       STA   ($F2),Y
            JSR   L6285	; dest++
            DEX
            BNE   L6261
            JMP   L6245	; loop

L626C       CMP   #$80	; exit if $80
            BNE   L6271
            RTS

L6271       JSR   L627E	; source++
            LDA   ($F0),Y ; get counter
            JSR   L627E	; source++
            TAX
            LDA   #$FF	; output counter #$FF
            BMI   L6261
	
L627E       INC   $F0	; source++
            BNE   L6284
            INC   $F0+1
L6284       RTS

L6285       INC   $F2	; dest++
            BNE   L628B
            INC   $F2+1
L628B       RTS

*-----------------------------------
* SOMETHING IN RLE
*-----------------------------------

L628C	HEX   000FFF010001FF0F0001FF0F0001FF0F
	HEX   0001FF0F0001FF0F0001FF0F0001FF0F
	HEX   0001FF0F0001FF0F0001FF0F0001FF0F
	HEX   0001FF0F0001FF2FFFFFFF01000BFF05
	HEX   000CFF04000CFF04000CFF040001FF0F
	HEX   0001FF0F0001FF0F0001FF0F0001FF0F
	HEX   0001FF6FFFFFFF01FF22000405080E0E
	HEX   13FF070001FF0F03FF0F06FF0F08FF0F
	HEX   0DFF011010FF0C13FF0F13FF6DFFFFFF
	HEX   01FFFFFF01FF090003FF0D0003FF0D00
	HEX   04FF0C0001FF0F0001FF4E0CFF0F0CFF
	HEX   0F0CFF47FFFFFF01FF610006090C1012
	HEX   FF06000AFF8500060909090909090909
	HEX   FF020001FF0F0001FF0F0001FF0F0001
	HEX   FFBFFF8000030608FF0B06FF0F08FF0F
	HEX   0CFF0F11FF0F11FF2F0004FF0C0001FF
	HEX   0F0001FF270CFFB70F0D0B080002FF0A
	HEX   0C0A08070002FF0A0907040003FF0A07
	HEX   0005FF0A0006FF0A0006FFAAFF1E10FF
	HEX   0F13FF0F13FF0111FF0F0CFF0F06FF0F
	HEX   03FF0F0001FF0F0001FF0F0001FF0F00
	HEX   01FF4FFF79110E0B070003FF1713FF0F
	HEX   12FF0F0FFF0F0AFF0F04FF2880

*-----------------------------------
* FONT DATA
*-----------------------------------

L63F9	HEX   00000000000000001818181818001800
	HEX   000000000000000000E39CEBFFBE0000
	HEX   D5D5D5D5D5D5D5D5AAAAAAAAAAAAAAAA
	HEX   D5D5D5D5AAAAAAAAAAAAAAAAD5D5D5D5
	HEX   180C0606060C18001830606060301800
	HEX   187E3C183C7E18000018187E18180000
	HEX   00000000001C180C0000007E00000000
	HEX   0000000000000000006030180C060000
	HEX   1C36666666361C00181C181818183C00
	HEX   3C6660300C067E007E30303860663C00
	HEX   30383C367E3030007E023E6060663C00
	HEX   380C063E66663C007E303018180C0C00
	HEX   3C66663C66663C003C66667C30301C00
	HEX   000C0C00000C0C00001C1C00001C180C
	HEX   30180C060C18300000007E007E000000
	HEX   0C18306030180C003C66301818001800
	HEX   3C46565636063C00183C66667E666600
	HEX   3E66663E66663E003C66060606663C00
	HEX   3E66666666663E007E06063E06067E00
	HEX   7E06063E060606007C06060676667C00
	HEX   6666667E666666003C18181818183C00
	HEX   6060606060663C0066361E0E1E366600
	HEX   0606060606067E00667E7E6666666600
	HEX   62666E7E766646003C66666666663C00
	HEX   3E66663E060606003C6666666E366C00
	HEX   3E66663E1E3666003C66063C60663C00
	HEX   7E181818181818006666666666663C00
	HEX   666666663C181800666666667E7E6600
	HEX   66363C183C36660066663C1818181800
	HEX   7E3030180C067E007E0E0E0E0E0E7E00
	HEX   00060C18306000003E30303030303E00
	HEX   0000183C660000000000000000000000
	HEX   000000000000000000003C607C667C00
	HEX   06067C6666667C0000007C0606067C00
	HEX   60607C6666667C0000003C667E067C00
	HEX   386C0C3E0C0C0C0000003C66667C603C
	HEX   06063E666666660018001C1818183C00
	HEX   300038303030361C060666361E366600
	HEX   1C18181818183C000000667E7E666600
	HEX   00003E666666660000003C6666663C00
	HEX   00003E66663E060600007C66667C6060
	HEX   00007E0E0606060000007C063C603E00
	HEX   0C0C3E0C0C6C38000000666666766C00
	HEX   000066363C1C1800000066667E7E6600
	HEX   0000663C183C6600000066363C1C180E
	HEX   00007E30180C7E00380C0C060C0C3800
	HEX   00000000000000000E18183018180E00
	HEX   2C1A0000000000000000000000000000
	HEX   00000000000000

*-----------------------------------
* SHOW THE ANIMATED TITLE SCREEN
*-----------------------------------

showTITLE   JSR   L67CA
            LDA   #$20
            STA   $E6
            LDA   #$FF
            STA   $1C
            JSR   $F3F6
            BIT   TXTPAGE1
            BIT   MIXCLR
            BIT   HIRES
            BIT   TXTCLR
            LDX   #$00
            STX   $51
            STX   $52
            LDX   #$03
            STX   $50
            LDX   #$18
            STX   $53
L6728       DEC   $53
            BMI   L6754
            LDA   $53
            JSR   BASCALC
            LDY   #$27
L6733       LDX   $51
            LDA   L9900,X
            LDX   $50
L673A       DEX
            BMI   L6741
            LSR
            LSR
            BNE   L673A
L6741       AND   #$03
            DEC   $50
            BPL   L674D
            LDX   #$03
            STX   $50
            INC   $51
L674D       STA   ($28),Y
            DEY
            BPL   L6733
            BMI   L6728
L6754       LDA   #$01
            STA   $54
L6758       LDA   #$00
            STA   $55
L675C       LDA   $55
            ASL
            ASL
            ASL
            STA   $56
            LDX   #$0F
L6765       STX   $50
            JSR   L67DC
            LDX   $50
            LDA   $27
            STA   $60,X
            CLC
            ADC   #$20
            STA   $70,X
            DEX
            LDA   $26
            STA   $60,X
            STA   $70,X
            INC   $56
            DEX
            BPL   L6765
            LDA   $55
            JSR   BASCALC
            LDY   #$27
L6788       LDA   ($28),Y
            CMP   $54
            BNE   L67AA
L678E       LDA   ($70),Y
L6790       STA   ($60),Y
            INC   L6790+1
            INC   L6790+1
            INC   L678E+1
            INC   L678E+1
            BPL   L678E
            LDA   #$60
            STA   L6790+1
            LDA   #$70
            STA   L678E+1
L67AA       DEY
            BPL   L6788
            JSR   L67E5
            INC   $55
            LDY   $55
            CPY   #$18
            BNE   L675C
            INC   $54
            LDA   $54
            CMP   #$01
            BEQ   L67CA
            CMP   #$04
            BNE   L6758
            LDA   #$00
            STA   $54
            BEQ   L6758

L67CA       LDX   #$2F
L67CC       LDA   $50,X
            PHA
            LDA   $02D0,X
            STA   $50,X
            PLA
            STA   $02D0,X
            DEX
            BPL   L67CC
            RTS

L67DC       LDX   #$00
            LDY   #$00
            LDA   $56
            JMP   $F411

L67E5       LDX   #$30
L67E7       LDY   #$01
            BIT   SPKR
L67EC       DEY
            BNE   L67EC
            DEX
            BNE   L67E7
            LDA   #$08
            JMP   WAIT

            DB    $41
            DB    $01
            DB    $2C
            DB    $30
            DB    $C0
            DB    $88
            DB    $D0
            DB    $FD
            DB    $CA

L6800       HEX   FC5C3F4F5F000000FC00020406080A0C
            HEX   FC882F3F5F880F00FC90FFEF1F6FDFCF
            HEX   FC88CFBF9F8FDFAFFCBE6F7F8FF0F2CC
            HEX   FC7F1F2F3F4F5F01FC69AFCFDF0CBF9F
            HEX   FCE45F4F3F2F1F0FFC800F1FF1119167
            HEX   FC163F2F0F11211FFC107F6F5F4F3F2F
            HEX   FC117F6F5F4F003FFC8000102030FF46
            HEX   FC167F6F5F4F3F2FFC007F6F880076F1
L6880       HEX   00080101010C0C0C0008030303030303
            HEX   000802020205070C0008020206070202
            HEX   00080202070302030008020202020702
            HEX   00080207020202030008020107060103
            HEX   00080202020307020008020201040702
            HEX   00080202010607070008020202030702
            HEX   00080202020307020008020206040703
            HEX   00080301020207030008010101030502

*-----------------------------------
* PLAY MUSIC
*-----------------------------------

playMUSIC   ASL
            TAX
            LDA   L6A71,X
            STA   $06
            LDA   L6A71+1,X
            STA   $06+1
            LDY   #$00
            LDA   ($06),Y
            STA   $0C
            STA   $0D
L6914       INC   $06
            BNE   L691A
            INC   $06+1
L691A       LDY   #$00
            STY   $0F
            STY   $0E
            LDA   ($06),Y
            CMP   #$FF
            BEQ   L6989
            TAX
            AND   #$03
            TAY
            TXA
            LSR
            LSR
            BNE   L6931
            DEC   $0E
L6931       TAX
            LDA   #>L6969
            STA   $10+1
            LDA   L69D3,X
            CLC
            ADC   #<L6969
            STA   $10
            LDA   L699F,X
            STA   $02
            STA   $03
            LDA   L6A08,X
            STA   $04
            STA   $05
            LDA   L6A3C,X
            CPY   #$00
            BEQ   L6957
L6953       ASL
            DEY
            BNE   L6953
L6957       LDX   $0F
            BEQ   L695D
            LSR
            LSR
L695D       STA   $0A
            STA   $0B
            LDY   $0E
L6963       LDA   $C030,Y
            JMP   ($0010)

L6969       NOP
            NOP
            NOP
            NOP
            NOP
            NOP
L696F       NOP
            NOP
            DEC   $03
            BNE   L696F
            LDA   $02
            STA   $03
            DEC   $05
            BNE   L6963
            LDA   $04
            STA   $05
            DEC   $0B
            BNE   L6963
            LDA   $0F
            BEQ   L6990
L6989       LDA   #$00
            STA   $0F
            STA   $01
            RTS

L6990       LDA   $0A
            STA   $0B
            DEC   $0D
            BNE   L6963
            LDA   $0C
            STA   $0D
            JMP   L6914

L699F       HEX   10111213141617181A1B1D1F20222427
            HEX   292B2E3133373A3D4145494D52575D62
            HEX   686E757B838A949CA5AEB8C4D0DCE2EB
            HEX   EEF4FAFF
L69D3       HEX   05060805040808030804080802020208
            HEX   08020808080808030808080804080808
            HEX   08080808080808080802080808080808
            HEX   0808080808
L6A08       HEX   0F0F0E0D0C0B0B0A0909080807070706
            HEX   06050505040404040303030303020202
            HEX   02020202010101010101010101010101
            HEX   01010101
L6A3C       HEX   08080808080908080908090809090809
            HEX   090A09080A0A09090B0A0A0A090C0C0B
            HEX   0A0A0A081010100E0E0D0C0C0A0A0A09
            HEX   0909090908

L6A71       DA    L6A85	; 0
            DA    L6A90	; 1
            DA    L6A9B	; 2
            DA    L6AB4	; 3
            DA    L6AE4	; 4
            DA    L6AF3	; 5
            DA    L6B0E	; 6
            DA    L6B22	; 7
            DA    L6B3F	; 8
            DA    L6B74	; 9

L6A85       HEX   03626161615A5A52625BFF
L6A90       HEX   034E4D4D4D5E6A7A86AFFF
L6A9B       HEX   035A6E7A01898D898179756D655D5A6E
            HEX   7A01898D8981898EFF
L6AB4       HEX   19141018130F19141018130F16110D15
            HEX   100C16110D15100C130E0A120D09130E
            HEX   0A120D09100B070F0A06100B070F0A06
L6AE4       HEX   0382868E969EA2AAB2827A827A83FF
L6AF3       HEX   03817152555C545D655D645C656D706C
            HEX   79717981028D85817981FF
L6B0E       HEX   03B1A99D958D858179717981858D959D
            HEX   A1A9B1FF
L6B22       HEX   03908C8884807C7874706C6864605C58
            HEX   54504C4844403C3834302C28FF
L6B3F       HEX   0369554D454D554D4501550157016955
            HEX   4D454D554D450155015701614D454D61
            HEX   4D454D614D454F0169554D5569554D55
            HEX   69554557FF
L6B74       HEX   03B0A8A09C94A09C948C84948C848078
            HEX   8078706C64706C645C54645C54504850
            HEX   48403C34403C342C24342C242018FF

*----------

	DS    \
	DS    $400

*-----------------------------------
* SPRITES ?
*-----------------------------------

L7000	HEX   BFF8FF8FFFFF8380F08080FC8F80FFFF
	HEX   E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   FFC3FFFF80F89F80808780E0FF80FFFF
	HEX   8FFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   C08780F0FF80FCFF8FFFFF83F0FF8080
	HEX   9E800000000000000000000000000000
	HEX   80BC8080FF87E0FFFFF8FF9F80FF8780
	HEX   F0810000000000000000000000000000
	HEX   A0A581AAA581AAA581AAA581A0A58080
	HEX   84800000000000000000000000000000
	HEX   D0AA8AD0AA8AD0AA8AD0AA8A80AA8280
	HEX   A0800000000000000000000000000000
	HEX   D0D282D5D282D5D282D5D282D0D28080
	HEX   92800000000000000000000000000000
	HEX   A8D595A8D595A8D595A8D59580D58580
	HEX   D0810000000000000000000000000000
L7100	HEX   BFF8FF8F80FFC387F0F0FFF0FCFFF3F0
	HEX   FFF0809EFC8F80FFFFE1FF0000000000
	HEX   FFC3FFFF80F89FBC8087FF87E7FF9F87
	HEX   FF8787F0E1FF80F8FF8FFE0000000000
	HEX   C08480D0D480D4D78AF5FF8AFDFF87FA
	HEX   FF85AABF81A0AD8080AD800000000000
	HEX   80A48080A585A0BDD5A8FFD7E8FFBFD0
	HEX   FFAFD0FA8B80EA8280E0800000000000
	HEX   808380A0AB80E8AF85FAFF85FEFF8BF5
	HEX   FF8AD5DE82D0D2808092800000000000
	HEX   80988080DA82C0FEAAD0FFAFF0FFDFA8
	HEX   FFD7A8F5958095858090810000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
L7200	HEX   000000000000A084A085A085A09DA09D
	HEX   A085A085A89EA89EABFE577A542AA895
	HEX   A895A885748774870487002A000A0000
	HEX   0000000000009082D082D082D08ED08E
	HEX   D082D086D49ED49FD4872A9F2A3ED48A
	HEX   D48AD48A78877A8F1A8E021400140000
	HEX   000000000000A091A095A084A09EA09E
	HEX   8085A095F095E8B574B5742F549FA8BD
	HEX   A095A095708F748F748E042800080000
	HEX   000000000000D088D08A9082D09EC09E
	HEX   C082D08AF08BF49AB4FA7A7D7A19D48A
	HEX   D08AD08E6A8F6A8F6A83220120050000
	HEX   000000000000A084A085A085B885B885
	HEX   A085B085BC95FC95F095FC2A3E2AA895
	HEX   A885F087F087FC2FBC2F152014200000
	HEX   00000000000000000000000000000000
L7300	HEX   0000000000009082D082D082DC82DC82
	HEX   D082D082BC8ABC8ABFEA2B752815D48A
	HEX   D48AD082F807F807E01F281400050000
	HEX   0000000000008885A8858885BC85BC85
	HEX   A081A885E887AC9FAF9C5F3F4C3FAC95
	HEX   A895A885FC0FF00FF803540054000000
	HEX   000000000000C482D4829082FC82FC82
	HEX   D080D482D487D68BD68B7A17FC15D48A
	HEX   D48AD482FC17FC171C100A000A000000
	HEX   00000000000000000000000000000000
	HEX   0000000000000000000000000080D082
	HEX   D48AD48A9482D48A9480D08200800000
	HEX   00000000000000000000000000000000
	HEX   0000000000000000000000008000A085
	HEX   A895A895A094A8958094A08580000000
	HEX   00000000000000000000000000000000
L7400	HEX   55285528A084D482F48BB4AE94AED08A
	HEX   C082D08AD482C082D08AD482C082D08A
	HEX   D482C082D08AD482C082D08A94A80000
L7430	HEX   0A550A559082A095E897BA96BA94A885
	HEX   A081A885A095A081A885A095A081A885
	HEX   A095A081A885A095A081A8858A940000
L7460	HEX   000000000000201408512A1522452854
	HEX   2A55224528152A452890A0948085A885
	HEX   888588858085A085A894889088900000
	HEX   00000000000014024508542A5122150A
	HEX   552A5122540A512A840A9482D080D08A
	HEX   D088D088D080D082948A848884880000
	HEX   00000000000000000000000000000000
	HEX   0000E0B1F3B7B7F3FFBFFEBEF8BEF8BF
	HEX   F09FC09FC08FC087E083F0009E800000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
L7500	HEX   0000E699F7B7EEB6FEBFDC8FDC8FFC87
	HEX   F887F083F081F083E087809F80B80000
	HEX   F083F887D886B083F083C080ECB68361
	HEX   E6668661E6268331BBB7FBB7F6379886
	HEX   8C8C8C9884908C988C8C8C838F8F0000
	HEX   F083F887D886B083F083C080ECB68421
	HEX   E6668361B3638121BBB7FBB7F6379886
	HEX   8C8C868C84848C8C988CE08CF8BC0000
L7590	HEX   000000000000A081A085A8958AD5A0B5
	HEX   A8E3A0BFA0BFA8B5888588F5A8F5A881
	HEX   A09550950A8528FC2ABF2A8622000000
	HEX   000000000000C082D082D48AD5A8D682
	HEX   E38AFE82FE82D68AD088D788D78AC08A
	HEX   D482D405D0289F0AFE2AB02A00220000
	HEX   00000000000000000000000000000000
L7600	HEX   000000000000D080D082D48A95AAD09A
	HEX   F4B1D09FD09FD49AD482D4BAD4BAD480
	HEX   908A148A058214FC15BF158611000000
	HEX   0000000000008081A085A885AA94AC95
	HEX   C695FC85FC85AC95A095AE95AE948095
	HEX   A885A8D0A0149F50FE54B05400440000
L7660	HEX   00000000000000000000000000000000
	HEX   000000008000A081E885888D88858085
	HEX   A097A095E895F895E89DE89D80000000
	HEX   00000000000000000000000000000000
	HEX   000000000080C082D08BD888D088D080
	HEX   F482D482D48BF48FDC8BD08200800000
L76C0	HEX   808080808080C0808080809880809886
	HEX   C6988CEC838BC0E0B683CCBCE6DBD8C0
	HEX   98B6C383D88CE0808080EC8086800000
	HEX   00000000000000000000000000000000
L7700	HEX   80808080808080808080808C8CB18098
	HEX   B0E08C819BB6E89983B3E0E69E8CEDE1
	HEX   818BB683E080989B80B0808080800000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
L7800	HEX   FFFFFFFFFFFF83F083F083F083C083C0
	HEX   83F083C080C080C080E000C000C080C0
	HEX   80C080C081E0000000000000FC000000
	HEX   FFFFFFFFFFFF87F087F087F087C087C0
	HEX   87C087F081F000800080000000008100
	HEX   810000F000F000F000F0BF40BF400000
	HEX   FFFFFFFFFFFF83C083C083F083C087C0
	HEX   87F083C083C080C080C0008000808080
	HEX   83C083E000E000F000F0000000000000
	HEX   FFFFFFFFFFFF87808700870087008700
	HEX   9F608700870081000000000000008100
	HEX   870087008740004000400000FF000000
	HEX   FFFFFFFFFFFF81F081F080F080F080F0
	HEX   83F083F080C080C08080008080008000
	HEX   80C083C083F083F08000000000000000
	HEX   00000000000000000000000000000000
L7900	HEX   FFFFFFFFFFFF87E087E087E081E081E0
	HEX   87E08700800080008300800080008100
	HEX   81E083E083F080F08000000000000000
	HEX   FFFFFFFFFFFF80F080F080F080F080F0
	HEX   83F880F080E080C000C08000800080C0
	HEX   80C080F080008000000060FF60FF0000
	HEX   FFFFFFFFFFFF81E081E081E081E081E0
	HEX   83F881E081E080808080808080808080
	HEX   8180818081E083E08FE000FC00FC0000
	HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   FFFFFFFFFFFFFFFFFFFFFFFF87F881F0
	HEX   00C000C000C00080008081E087F00000
	HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   FFFFFFFFFFFFFFFFFFFFFFFF8FF087C0
	HEX   8100810081008000800083C087F00000
	HEX   00000000000000000000000000000000
L7A00	HEX   0000000087E000F000C00080008083C0
	HEX   8FF083C081F08FF083C081F08FF087C0
	HEX   81F08FF087C081F08FF083E080800000
	HEX   0000000083F0870081008000800081E0
	HEX   87F881E087C087F881E087C087F881F0
	HEX   87C087F881F087C087F883E080800000
	HEX   FFFFFFFFFFFF00000000000000000000
	HEX   0000000000000082870000E081E081E0
	HEX   81E000E087E0810081808183E1C70000
	HEX   FFFFFFFFFFFF00000000000000000000
	HEX   000000000000A00080F0830083C083C0
	HEX   83C0830083F080C080C0E0C0F1C30000
	HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   FFFF8F00808080808080808083808380
	HEX   87809FC09FC09FC08FF083F8FFFF0000
	HEX   00000000000000000000000000000000
L7B00	HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   FFFF808080808080808081C081C081F0
	HEX   83F087F887FC87F88FF0BFC0FF810000
	HEX   87F083E083E087F087F08FFC81808080
	HEX   808080808080808080808080808083F0
	HEX   E1C0E1C3E1C3E1C3E1E0A1E080800000
	HEX   87F083E083E087F087F08FFC81808180
	HEX   808080808080808080808080808083E0
	HEX   E1E0F0E0F0E0E1E0C3E08FE083000000
	HEX   FFFFFFFFFFFF83F081E0808080808080
	HEX   808087808380818081C08180818081C0
	HEX   8380838000C00080008000E000FF0000
	HEX   FFFFFFFFFFFF87E083C0808080808080
	HEX   808080F080E080C081C080C080C081C0
	HEX   80E080E08100800080008300FF000000
	HEX   00000000000000000000000000000000
L7C00	HEX   FFFFFFFF87F883F081E0808080808080
	HEX   808083C08180808080E08080808080F0
	HEX   81C081C000800080008000E000FF0000
	HEX   FFFFFFFFFFFF87F883E080C080808080
	HEX   8080808080C080808300800080008300
	HEX   80C080008000800080008300FF000000
	HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   FFFFFFFF8FFC87F880E080E080E080E0
	HEX   83008300800080008000800083C00000
	HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX   FFFFFFFF9FF88FF08380838083808380
	HEX   00E000E0008000800080008081E00000
	HEX   FFFFFFFFFFFF9FFFFFFFFFFCFFFFCFF8
	HEX   98CFF989F8F89F8F88F8998988888F9F
	HEX   CF8898F88FF98FFFFFFF89FFF8FF0000
	HEX   00000000000000000000000000000000
L7D00	HEX   FFFFFFFFFFFFFFFFFFFFFFF9F98CFFFC
	HEX   8F8FF9FCC8888FCCF8888F88C8F9888C
	HEX   FCF888F88FFFCFCBFF8FFFFFFFFF0000
L7D30	HEX   0000D48AFDAFD48BF5AA9DA29DA29DA0
	HEX   95A295A2D5AAD48A0000000000000000
	HEX   00000000000000000000000000000000
	HEX   0000A895FADFE895AAD7A2DCA2DC82DC
	HEX   A2D4A2D4AAD5A8950000000000000000
	HEX   00000000000000000000000000000000
L7D90	HEX   00000000800000AA00D0AA8500AA0000
	HEX   000000A00000A20090AA84D0A8850000
	HEX   00000000000000000000000000000000
	HEX   FFFFFFFF80FF8FAAF8D3AAE59FAAFC9F
	HEX   00FC8F82F887A2F097AAF4D78AF59FFF
	HEX   FCFFFFFF000000000000000000000000
	HEX   00000000000000000000000000000000
L7E00	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
L7E60	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
L7F00	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
L7F60	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000
	HEX   00000000000000000000000000000000

*-----------------------------------
* LEVEL DATA
*-----------------------------------
* Tiles
* 00	empty
* 01-3F	height
* 40:	gum
* 
* Level is 16x16 
* From back to front / from left to right

L8000	HEX   01010101010101010101010101010101
	HEX   0123232823231E1E1E1E141414141401
	HEX   0123282328231E19191E0F0F140F0F01
	HEX   0128232323281E1E1E1E0F0F140F0F01
	HEX   0128282828281E191E190F0F140F0F01
	HEX   0128232323281E19991E141414141401
	HEX   011E1E1E1E1E41414141414141414141
	HEX   0119191E191941004100410000410041
	HEX   0119191E191941414100414141410041
	HEX   0119191E191941000000410000000041
	HEX   010F0F140F0F41414141414141414141
	HEX   010F140F140F41004100410000410041
	HEX   01140F0F0F1441004100410000410041
	HEX   01141414141441414100414141410041
	HEX   01140F0F0F1441000000410000000041
	HEX   01010101010141414141414141414141
L8100	HEX   1251504F4E4D4C4B4A49484746454443
	HEX   52000000004D00000000480000000043
	HEX   52000000004D00000000480000000043
	HEX   5251504F4E4D4C4B4A49484746454443
	HEX   5200004F0000004B4A00000046000043
	HEX   5200004F0000004B4A00000046000043
	HEX   5200004F0000004B4A00000046000043
	HEX   5251504F4E4D4C4B4A49484746454443
	HEX   52005000004D00010000480000450043
	HEX   52005000004D00010000480000450043
	HEX   52005000004D00010000480000450043
	HEX   5251504F4E4D4C4B4A49484746454443
	HEX   520000000000004B4A00000000000043
	HEX   520000000000004B4A00000000000043
	HEX   520000000000004B4A00000000000043
	HEX   5251504F4E4D4C4B4A49484746454443
L8200	HEX   01010101010101010101010101010101
	HEX   0100000010189A9A1810000100000041
	HEX   010000101820A2A22018100101410041
	HEX   010010182024A6A62420181000410041
	HEX   011018202426A8A82624201810410041
	HEX   011820242629A9A92926242018414141
	HEX   019AA2A6A8A9A0A0A9A8A6A29A410041
	HEX   019AA2A6A8A9A0A0292826221A410041
	HEX   011820242629A9294A4A4A4A4A414141
	HEX   011018202426A8284A4A4A4A4A410041
	HEX   010010182024A6264A4A004A4A410041
	HEX   010101101820A2224A4A4A4A4A410041
	HEX   0100010010189A1A4A4A4A4A3F410041
	HEX   01004141414141414141414141410041
	HEX   01000000004100004100000000000041
	HEX   01414141414141414141414141414141
L8300	HEX   2D282D1414142D282D45464748484841
	HEX   28282814141428282844000048004841
	HEX   2D282D1B201B2D282D43410048004841
	HEX   14141B1414141B141442410048483F41
	HEX   14142014A0A0A0949441410000484141
	HEX   14141B14A0141B141400410000480041
	HEX   2D282D1BA01B6D6D2D41414100470041
	HEX   2828281494146D6D2D41414100470041
	HEX   2D282D1494142D2D3F41414100464641
	HEX   19594141410000004141000000004641
	HEX   593F4100000000000000000000004641
	HEX   41410000000000000000000000004641
	HEX   41414141414142434343434445463F41
	HEX   41000000000000414141414141414141
	HEX   41000000000000410000000000000041
	HEX   41414141414141414141414141414141
L8400	HEX   595959595857565554535251504F4F41
	HEX   595959590000000000000000CFCFCF41
	HEX   595905060708090A0B0C0D0ECF4F4F41
	HEX   59590654545454535251504FCF4F3F41
	HEX   580007548FD4D4410000004E41414141
	HEX   57000854D45454410000004D41414141
	HEX   56000954D4543F010000004C00414141
	HEX   55000A53010101020300004B00004141
	HEX   54000B52000000030405004A00000141
	HEX   53000C51000000000506070949064541
	HEX   52000D50000000000007080949074441
	HEX   51000E4F4E4D4C4B4A09090949084341
	HEX   50CFCFCF41410000004949493F424241
	HEX   4FCF4F4F414141000006070842424141
	HEX   4FCF4F3F414141410145444342414141
	HEX   41414141414141414141414141414141
L8500	HEX   5D5D1C1B1A5958575655545352515041
	HEX   5D5D5D5D5D5656565655545352515041
	HEX   1C5D00005D5600564D4D4D4D0E0F5041
	HEX   1B5D005D5D5600564D4D4D4D4D4D4D41
	HEX   1A5D5D5D3F56563F4D4D4D4D4D4D3F41
	HEX   5956565656564D4D4D00004443424141
	HEX   58560000564D4D004C00004541414141
	HEX   575656563F4D00004B00004641414141
	HEX   56564D4D4D4D4C4B4A49484741414141
	HEX   55554D4D4D0000004900004600004141
	HEX   54544D4D4D0000004800004500004141
	HEX   53534D4D4D4445464746454443424141
	HEX   52520E4D4D4341414100004341414141
	HEX   51510F4D4D4241414100004241414141
	HEX   5050504D3F4141414141414141414141
	HEX   41414141414141414141414141414141
L8600	HEX   595A5B5C5D5E5F606162636465666600
	HEX   595A5B5C5D5E5F606162636465663F4C
	HEX   580000000000000000000000004C4C4C
	HEX   575757565656555555545454004B004B
	HEX   000000000000000000000053004A004A
	HEX   50505051515152525253533F48490049
	HEX   4F000000000000000000484848480848
	HEX   4E4E4E4D4D4D4C4C4B00004700470007
	HEX   00000000000000004A00004600460046
	HEX   4848484949494A4A3F44004500450045
	HEX   47000000000000444444444444444444
	HEX   46464645454500430043004300430043
	HEX   00000000004400424242424242424242
	HEX   44444444444441410041004100410041
	HEX   43434342424141000041004100410041
	HEX   42424242414141414141414141414141
L8700	HEX   141414141E141414140A0A0A4A414141
	HEX   141919191E191919140A0A0A0A410041
	HEX   141919191E191919140A0A0A0A410041
	HEX   1419192623261919140A191919410041
	HEX   1E1E1E2323231E1E1E0A191919410041
	HEX   1419192623261919140A191919410041
	HEX   141919191E191919140A191919410041
	HEX   141919191E191919144A4A4A4A410041
	HEX   141414141E141414144A4A4A4A410041
	HEX   4141414141410101014A4A4A4A410041
	HEX   4141414141414101014A4A4A4A414141
	HEX   4141414141414141014A4A4A4A414141
	HEX   4141414141414141014A4A4A3F410041
	HEX   41414141414141414141414141410041
	HEX   41414141414141414141414141410041
	HEX   41414141414141414141414141414141
L8800	HEX   5E5D5C5B5A59584B4B4A494848474641
	HEX   5D5A5A5A5A583F4B4B48484846464641
	HEX   5C5A5A5A58584B4B4B48484845464641
	HEX   5B5A5A58584B4B004B00004744414141
	HEX   5A5A5858584B00004B00004643414141
	HEX   5958584B4B4B4B4B3F01004542414141
	HEX   583F4B4B004B4B000101004441414141
	HEX   4B4B4B00004B00000141004341414141
	HEX   4B4B4B4B4B3F01010041004241414141
	HEX   4A484800000101414141414141414141
	HEX   49484800000000000041414141414141
	HEX   48484847464544434241414141414141
	HEX   48464545444342414141414141414141
	HEX   47464601414141414141414141414141
	HEX   46464641014141414141414141414141
	HEX   41414141414141414141414141414141
L8900	HEX   5F5E5D5C5B5A59585756555453525150
	HEX   5F5B5B5B00005555555500505050504F
	HEX   5F5B005B5B005555000000505000004E
	HEX   5F5B005B5B005555550000505050504D
	HEX   5F5B005B5B005555000000000050504C
	HEX   5F5B5B5B00005555555500505050504B
	HEX   5F08090A0B0C0D0E0F1011124B4B4B4A
	HEX   5F07070707070707070707134B4B4B49
	HEX   1F9E1D1C1B1A1918171615144B4B4B48
	HEX   5F474747474747474747474747474747
	HEX   5F464646460046464646004600004646
	HEX   5F460046460046004646004646464645
	HEX   5F464646000046464600004646464644
	HEX   5F460046460046004646004600004643
	HEX   5F464646460046464646004600004642
	HEX   5F414141414141414141414141414141
L8A00	HEX   0E0E0E0E0E0E0E0E0E0E0E0E0E0E4E41
	HEX   0E626262616057571757575757574E41
	HEX   0E626060605F57000000000057574D41
	HEX   0E626000605E5757575757573F4F4C41
	HEX   0E616060605E57565554534F4F4F4B41
	HEX   0E605F5E5E3F4F4F5051524F09084A41
	HEX   0D4F4F4F4F4F4F4F4F4F4F4F0A074941
	HEX   0C4F3F4B4C4D4E4F4E4D4C4B4B064841
	HEX   4B4B4B4B4A49484848494A4B3F064741
	HEX   4A004B06454647484746450146464641
	HEX   49004A07440000470000440145454541
	HEX   48004948434445464544430144444441
	HEX   4746483F420000450000420143434341
	HEX   00454442414243444342414142424241
	HEX   00004342004141414141414141414141
	HEX   00000041414141414141414141414141
L8B00	HEX   00001A1A1A1A1A585853535353535341
	HEX   18581A1C1C1C1A583F53535353533F41
	HEX   58581A1C1E1C1A58533F4E4E00414141
	HEX   58001A1C1C1C1A58004E000000410041
	HEX   58001A1A1A1A1A580000000000410041
	HEX   58585858585858580000000000410041
	HEX   5857565554535251504F4F4F4F414141
	HEX   0000000000000000000000004F414141
	HEX   0708090A0B4C4D4E4F4F4F4F4F414141
	HEX   085555555548494A4B4C4D4E3F414141
	HEX   09540055554800000000000041414141
	HEX   0A530055554847464544434241000041
	HEX   0B520055554141414141414141414141
	HEX   0C5100553F4100004100000041000041
	HEX   0D500000410000004100000041000041
	HEX   0E4F0000414141414141414141414141
L8C00	HEX   08080808484848484847464544434241
	HEX   08266666484800484141410041414141
	HEX   08666666480000000041000000410041
	HEX   0866663F484800484141410041410041
	HEX   48484848484848480141414141410041
	HEX   48480048484800484841410041410041
	HEX   48000000480000004841000000410041
	HEX   48480048484800484841410041410041
	HEX   48410041014848484841414141410041
	HEX   47414141414141414141414141410041
	HEX   46410041414100414141410041410041
	HEX   45000000410000004141000000410041
	HEX   44410041414100414141410041410041
	HEX   43414141414141414141414141410041
	HEX   42410000000000000000000000000041
	HEX   41414141414141414141414141414141
L8D00	HEX   01010101010153535353535251504F4E
	HEX   0101010101015353535348494A4B4C4D
	HEX   01010101010153535353474645444342
	HEX   010101010101D3D3D3D3414141414141
	HEX   010101010101D3D3D3D3410041410041
	HEX   010101010101D3D3D353410000410041
	HEX   4E4F50515253D3D3D353410000414141
	HEX   0D4C4B4A494841414141414100000041
	HEX   42434445464741414141000041414141
	HEX   41414141414141414141000041414141
	HEX   41414141414141414141004141414141
	HEX   41000000000000000041000000000041
	HEX   41000000000000000041000100004141
	HEX   41000000000000000041000100414141
	HEX   41000000000000000041000000000041
	HEX   41414141414141414141414141414141
L8E00	HEX   0C0D0E0F101151504F4E4D4C4B4A4908
	HEX   0B000000001106454443424141410107
	HEX   0A000000001107004141414141410106
	HEX   09000000001208004141414141410105
	HEX   08000000001209004141414141410104
	HEX   0700000000120A004141414141410103
	HEX   0600000000130B004100000000000002
	HEX   0500000000130C004100000000000041
	HEX   0452525454540D414100000000000041
	HEX   0352520000000E414141414141414141
	HEX   0252520000000F414141414141414141
	HEX   01525252515010414141414141414141
	HEX   0152525251503F414100000000000041
	HEX   41410000000041414100000000000041
	HEX   41410000000041414100000000000041
	HEX   41414141414141414141414141414141
L8F00	HEX   2261605F5E5D5C5B4C4B4A4948474645
	HEX   6100005E5D00005A0D00000A09000006
	HEX   6000005D5C0000590E00000B0A000007
	HEX   5F5E5D5C5B5A59580F0E0D0C0B0A0908
	HEX   5E5D5C5B5A595857100F0E0D0C0B0A09
	HEX   5D00005A590000561100000E0D00000A
	HEX   5C000059580000551200000F0E00000B
	HEX   5B5A595857565514131211100F0E0D0C
	HEX   4C0D0E0F101112131454555556565757
	HEX   4B00000E0F0000125400005556000057
	HEX   4A00000D0E0000115500005657000058
	HEX   490A0B0C0D0E0F105555565657575858
	HEX   48090A0B0C0D0E0F5656575758585959
	HEX   4700000A0B00000E5600005758000059
	HEX   460000090A00000D570000585900005A
	HEX   45060708090A0B0C5757585859595A5A

*-----------------------------------
*
*-----------------------------------

L9000	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
L9020	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7F
	HEX	FE7FFFFFFFFFFFE3FFE3FFE3FFFFFFFF
L9040	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3
	HEX	FFE3FFFFFFFFFE7FFE7FFE7FFFFFFFFF
L9060	HEX	FFFFFFFFFFFFFFFFEFF7EFF7EFF7FFFF
	HEX	FBDFFBDFFBDFFFFFFFFFFFFFFFFFFFFF
L9080	HEX	FFFFFFFFFFFFFFFFFE7FFE7FFE7FFFFF
	HEX	DFFBDFFBDFFBFFFFFFFFFFFFFFFFFFFF
L90A0	HEX	FFFFFFFFFFFFFFFFFFEFFFEFFFEFFFEF
	HEX	FFEFFFFFFFFFF07FFFFFFFFFFFFFFFFF
L90C0	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFEFFFEFFFFFFFEFFFEFFFFFFFFF
L90E0	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFFFFFFF93FFFFFFFFFFFFFFFF
L9100	HEX	FF0FFF0FFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	3FFF3FEF3FEF3FFFFFEFFFEFFFFFFFFF
L9120	HEX	FF0FFF0FFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	3FFF3FFF3FFF3F93FFFFFFFFFFFFFFFF
L9140	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
	HEX	FFFBFFFBFFFFFEFBFFFFFFFFFFFFFFFF
L9160	HEX	FFFFFFFFFFFFFFFFFFFDFFFDFFFFFFFF
	HEX	FFFFFFFF8FFF8FFF8FFF8FFF8FFFFFFF
L9180	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFF1FDF1FDF1FFF1FFF1FFFFFF
L91A0	HEX	FFFFFF8FFF8FFFEFFFEFFFEFFFEFFFEF
	HEX	FFCF9FCF9F3F803FFFF1FFF1FFF1FFFF
L91C0	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFFFFFFFFFFFF1FFF1FFF1FFFF
L91E0	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFD
	HEX	FFFDFFFDFFFFFFFFFFFFFFFFFC3FFFFF
L9200	HEX	FFFFFC3FFC3FFC3FFC3FFC3FFFFFFFFF
	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
L9220	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFF1FFF1
	HEX	FFF1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
L9240	HEX	FFFF7C3F7C3F7C3F7C3F7C3F7FFF7FFF
	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
L9260	HEX	FFFF7FFF7FFF7FFF7FFF7FFF7FF17FF1
	HEX	FFF1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
L9280	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFFEFFFFFFFEFFFFFFFFFFFFFF
L92A0	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFFFFFF93FFFFFFFFFFFFFFFFF
L92C0	HEX	FFFFFFFFFFFFFFFFFFFFFF97FFBFFF97
	HEX	FF87F87FFA7FFF7FFA7FFFFFFFFFFFFF
L92E0	HEX	FFFFFF17FFBFFF17FF07FFFFFFFFFFFF
	HEX	A7FF87FFA7FFF7FFA7FFFFFFFFFFFFFF
L9300	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFFFFF807F807F807F807FFFFF
L9320	HEX	FFFFFFFFFFFFFFFFFFE1FFE1FFE1FFE1
	HEX	FFE1FFE1FFE1FFE1FFE1FFE1FFE1FFFF
L9340	HEX	FFFFFFFFFFC0FFFFFFFFFFFFFFFFFFFF
	HEX	FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF

L9360       DA    L9020
            DA    L9040
            DA    L9060
            DA    L9080
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9140
            DA    L9000
            DA    L9160
            DA    L9180
            DA    L90A0
            DA    L90A0
            DA    L91A0
            DA    L91A0
            DA    L9200
            DA    L9220
            DA    L9280
            DA    L92A0
            DA    L9000
            DA    L9000
            DA    L92C0
            DA    L92E0
            DA    L90A0
            DA    L90A0
            DA    L9300
            DA    L9320
            DA    L90C0
            DA    L90E0
            DA    L91C0
            DA    L91E0
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L92C0
            DA    L92E0
            DA    L9080
            DA    L9060
            DA    L9000
            DA    L9000
            DA    L9340
            DA    L9340
            DA    L9100
            DA    L9120
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9120
            DA    L9100
            DA    L9000
            DA    L9000
            DA    L90A0
            DA    L90A0
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9000
            DA    L9240
            DA    L9260
            DA    L92A0
            DA    L9280
            DA    L9000
            DA    L9000

	DS    \
	
*--- We are at $9500 here
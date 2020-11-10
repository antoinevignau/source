*
* Apple II diagnostics code
*
* (c) 1983, Apple Computer, Inc.
* (s) 2018, Brutal Deluxe Software
*

         mx	%11
         org	$d000
         lst	off

         use   EQUATES.S
         
*---------------------------------------------------------
* EPROM18B.BIN
* Code and data at $D000..$DFFF
* First bank
*---------------------------------------------------------

FNDSLOT  LDA   #>LC000
         STA   SETSLOTCXROM
         STA   SETSLOTC3ROM
         STA   SCRATCH+1
         STA   ROMCTRL+1
         LDA   #<LC000	; $C000
         STA   SCRATCH
         LDA   #<RDBANK2	; $C080
         STA   ROMCTRL
FIND     LDY   #$00
FIND1    INC   SCRATCH+1
         CLC
         LDA   ROMCTRL
         ADC   #$10
         STA   ROMCTRL
         LDA   IDENT,Y
         STA   (SCRATCH),Y
         CMP   (SCRATCH),Y
         BNE   FIND1
         INY
         LDA   IDENT,Y
         STA   (SCRATCH),Y
         CMP   (SCRATCH),Y
         BNE   FIND
         INY
         LDA   IDENT,Y
         STA   (SCRATCH),Y
         CMP   (SCRATCH),Y
         BEQ   INI
         JSR   HOME
         LDX   #$00
NOCARD   LDA   NOCARDMSG,X
         BEQ   QUIT
         JSR   COUT
         INX
         BNE   NOCARD
QUIT     JMP   MONZ

*
* Command list and entry point
*

MENUTBL  ASC   "PRMCKVLS"84

MODTBL   DA    CPUTST	; P - Processor test
         DA    ROMTST	; R - Read only memory test
         DA    RAMTST	; M - Random access memory test
         DA    CHRTST	; C - Character set test
         DA    KBDTST	; K - Keyboard test
         DA    VIDTST	; V - Video tests
         DA    LPMODE	; L - Loop ROM RAM and processor tests
         DA    SNDTST	; S - Speaker test
         DA    MONITR	; ctrl-D - Quit to monitor

*---------------------------------------------------------
*
* Command: L - Loop ROM RAM and processor tests
*
*---------------------------------------------------------

LPMODE   LDA   #$01	; flag for loop
         STA   LOOPFLG
         JSR   HOME
         JMP   CPUTST

*---------------------------------------------------------
*
* Command: ctrl-D - Quit to monitor
*
*---------------------------------------------------------

MONITR   JMP   MONZ

*---------------------------------------------------------
*
* Initialize all tests
*
*---------------------------------------------------------

INI      LDA   #$00
         STA   LOOPFLG
         STA   $0C
         STA   $0A
         STA   $0B
         STA   CPUFLG
         STA   ROMFLG
         STA   RAMFLG
         STA   $02
         STA   $03
         LDA   #$01
         STA   $0A
         STA   SETSLOTCXROM
         STA   SETSLOTC3ROM
         JMP   CPUTST
TST0     JMP   ROMTST	; was DOCX (do CX)

TSTS     JSR   HOME
         LDX   #$00
PRMSG    LDA   HELLO,X
         BEQ   PR2
         JSR   COUT
         INX
         BNE   PRMSG
PR2      LDX   #$00
PRMSG2   LDA   HELLO2,X
         BEQ   LOOPS
         JSR   COUT
         INX
         BNE   PRMSG2

LOOPS    LDA   $0C
         BEQ   RMOK
         LDX   #$00
LOERS    LDA   BADRAM,X
         BEQ   RMOK
         JSR   COUT
         INX
         BNE   LOERS

RMOK     LDA   CPUFLG
         BEQ   ROMP
         LDX   #$00
YCPU     LDA   CPUOK,X
         BEQ   ROMP
         JSR   COUT
         INX
         BNE   YCPU

ROMP     LDA   ROMFLG
         BEQ   RAMP
         LDX   #$00
ROMP1    LDA   CXOKMSG,X
         BEQ   FXNXT
         JSR   COUT
         INX
         BNE   ROMP1
FXNXT    LDX   #$00
FXNXT1   LDA   FXOKMSG,X
         BEQ   RAMP
         JSR   COUT
         INX
         BNE   FXNXT1

RAMP     LDA   RAMFLG
         BEQ   TSTA
         LDX   #$00
NOERS    LDA   RAMOK,X
         BEQ   TSTA
         JSR   COUT
         INX
         BNE   NOERS

TSTA     LDA   KBD
         AND   #$DF
         BIT   KBDSTROBE
         LDY   #$00
CMPRE    CMP   MENUTBL,Y
         BEQ   GETADR
         INY
         CPY   #$09
         BNE   CMPRE
         JMP   TSTA

GETADR   TYA
         ASL
         TAY
         LDA   MODTBL,Y
         STA   POINTER
         INY
         LDA   MODTBL,Y
         STA   POINTER+1
         JMP   (POINTER)

IDENT    HEX   E4F7E3

*---------------------------------------------------------
*
* Command: M - Random access memory test
*
*---------------------------------------------------------

RAMTST   LDY   #$00
LD136    LDA   |L0000,Y
         STA   L0800,Y
         INY
         BNE   LD136
         LDA   #$00
LD141    STA   |L0000,Y
         INY
         BNE   LD141
LD147    LDA   |L0000,Y
         CMP   #$00
         BEQ   LD151
         JMP   LD2EE

LD151    INY
         BNE   LD147
         LDA   #$AA
LD156    STA   |L0000,Y
         INY
         BNE   LD156
LD15C    LDA   |L0000,Y
         CMP   #$AA
         BEQ   LD166
         JMP   LD2EE

LD166    INY
         BNE   LD15C
         LDA   #$55
LD16B    STA   |L0000,Y
         INY
         BNE   LD16B
LD171    LDA   |L0000,Y
         CMP   #$55
         BEQ   LD17B
         JMP   LD2EE

LD17B    INY
         BNE   LD171
LD17E    LDA   L0800,Y
         STA   |L0000,Y
         INY
         BNE   LD17E
LD187    LDA   L0100,Y
         STA   (SCRATCH),Y
         INY
         BNE   LD187
         LDA   #$00
LD191    STA   L0100,Y
         INY
         BNE   LD191
LD197    LDA   L0100,Y
         CMP   #$00
         BEQ   LD1A1
         JMP   LD2FF

LD1A1    INY
         BNE   LD197
         LDA   #$AA
LD1A6    STA   L0100,Y
         INY
         BNE   LD1A6
LD1AC    LDA   L0100,Y
         CMP   #$AA
         BEQ   LD1B6
         JMP   LD2FF

LD1B6    INY
         BNE   LD1AC
         LDA   #$55
LD1BB    STA   L0100,Y
         INY
         BNE   LD1BB
LD1C1    LDA   L0100,Y
         CMP   #$55
         BEQ   LD1CB
         JMP   LD2FF

LD1CB    INY
         BNE   LD1C1
LD1CE    LDA   (SCRATCH),Y
         STA   L0100,Y
         INY
         BNE   LD1CE
         BIT   HIRES
         BIT   MIXCLR
         BIT   TXTCLR
         SED
         LDA   $0A
         CLC
         ADC   #$01
         STA   $0A
         LDA   $0B
         ADC   #$00
         STA   $0B
         CLD
         LDA   #>L0200	; 02
         STA   $0D
         LDA   #>LC000-1	; BF
         STA   $67
         JSR   LD27A
         JSR   HOME
         BIT   TXTSET
         BIT   MIXCLR
         BIT   LORES
         LDX   #$00
LD207    LDA   CTAMSG,X
         BEQ   LD212
         JSR   COUT
         INX
         BNE   LD207
LD212    LDA   #<L7237
         STA   $02
         LDA   #>L7237
         STA   $03
         LDA   #>LD237
         STA   $05
         LDA   #<LD237
         STA   $04
         LDX   #$02
         LDY   #$00
LD226    LDA   ($04),Y
         STA   ($02),Y
         INY
         BNE   LD226
         INC   $03
         INC   $05
         DEX
         BNE   LD226
         JMP   L7237

*
* Code is relocated at $7237
*

LD237    =	*
         org	$7237
         
         LDA   #>LD000
         STA   $0D
         LDA   #>LE000-1
         STA   $67
         LDY   #$00
         LDA   #$10
         STA   (ROMCTRL),Y
         BIT   LCBANK1
         BIT   LCBANK1
         JSR   LD27A
         BIT   LCBANK2
         BIT   LCBANK2
         LDA   #>LD000
         STA   $0D
         LDA   #>LFE00
         STA   $67
         JSR   LD27A
         BIT   ROMIN2
         BIT   ROMIN2
         LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         LDA   LOOPFLG
         BEQ   LD275
         JSR   HOME
         JMP   CPUTST

LD275    INC   RAMFLG
         JMP   TSTS

LD27A    LDA   #$00
         STA   $0C
         TAY
         STA   $02
LD281    STA   $65
         LDX   #$02
         STX   $07
LD287    LDA   $0D
         STA   $03
         LDX   $67
         LDA   $65
         EOR   #$FF
         STA   $08
LD293    STA   ($02),Y
         INY
         BNE   LD293
         INC   $03
         CPX   $03
         BCS   LD293
         LDX   $07
         LDA   $0D
         STA   $03
LD2A4    LDA   $65
LD2A6    DEX
         BPL   LD2AD
         LDX   #$02
         STA   ($02),Y
LD2AD    INY
         BNE   LD2A6
         INC   $03
         LDA   $67
         CMP   $03
         BCS   LD2A4
         LDA   #$00
         CMP   $07
         BNE   LD2C5
         LDA   $65
         CMP   #$80
         BNE   LD2C5
         RTS

LD2C5    LDA   $0D
         STA   $03
         LDX   $07
LD2CB    LDA   $08
         DEX
         BPL   LD2D4
         LDX   #$02
         LDA   $65
LD2D4    CMP   ($02),Y
         BNE   LD2FF
         INY
         BNE   LD2CB
         INC   $03
         LDA   $67
         CMP   $03
         BCS   LD2CB
         DEC   $07
         BPL   LD287
         LDA   $65
         EOR   #$FF
         BMI   LD281
         RTS

LD2EE    STA   L0800+$E
         LDY   #$00
LD2F3    LDA   L0800,Y
         STA   |L0000,Y
         INY
         BNE   LD2F3
         JMP   ERROR

LD2FF    STA   $0E
         STY   $09
         LDA   ($02),Y
         STA   $07
         BIT   ROMIN2
         BIT   ROMIN2
         LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         STA   $0C
         STY   RAMFLG
         BIT   TXTSET
         BIT   MIXCLR
         BIT   LORES
         JMP   ERROR

*
* End of relocated code
*

*---------------------------------------------------------
*
* The main error routine
*
*---------------------------------------------------------

         org	$D323

ERROR    JSR   HOME
         JSR   BELL
         LDY   #$00
PSPF     LDA   SPFMSG,Y
         BEQ   SPF2
         JSR   COUT
         INY
         BNE   PSPF
SPF2     LDA   $07
         EOR   $0E
         LDX   #$00
         CLC
BITS     INX
         ROR
         BCC   BITS
         LDA   BITMAP,X
         JSR   PRBYTE
         JSR   BELL
         LDY   $09
         LDX   #$00
PERRWT   LDA   ESPACE,X
         BEQ   WHOA
         JSR   COUT
         INX
         BNE   PERRWT
WHOA     LDA   KBD
         CMP   #$A0
         BNE   WHOA
         JMP   INI

*---------------------------------------------------------
*
* Command: S - Speaker test
*
*---------------------------------------------------------

SNDTST   JSR   HOME
         LDA   #$05
         STA   $08
         LDA   #$FF
         STA   $07
         LDA   #$09
         STA   CV
         LDX   #$00
TO1      LDA   TMSG,X
         BEQ   PIT1
         JSR   COUT
         INX
         BNE   TO1

PIT1     JSR   PAUSE
PITCH    LDY   #$30
LOW1     JSR   TONE
         LDX   $07
         JSR   DLY
         DEY
         BNE   LOW1
         LDY   #$50
         JSR   DELAY
         LDA   $07
         SBC   #$20
         STA   $07
         DEC   $08
         BNE   PITCH
         BIT   KBDSTROBE
         JMP   TSTS

TONE     STA   SPKR
         LDA   SPKR
         STA   SPKR
         RTS

*---------------------------------------------------------
*
* Command: V - Video tests
*
*---------------------------------------------------------

VIDTST   JSR   SETGR
         BIT   LORES
         LDA   #>L0400
         STA   $11
         LDA   #<L0400
         STA   $10
         BIT   KBDSTROBE
LD3BF    LDA   #$02
         STA   $0E
LD3C3    LDY   #$00
LD3C5    TYA
         CMP   #$28
         BEQ   LD3CF
         STA   ($10),Y
         INY
         BNE   LD3C5
LD3CF    LDA   #$80
         STA   $10
         DEC   $0E
         BNE   LD3C3
         LDA   #$00
         STA   $10
         INC   $11
         LDA   $11
         CMP   #>L0800
         BNE   LD3BF
         JSR   HOME
         LDA   #>L0400
         STA   $11
         LDA   #>L0800
         STA   $03
         LDA   #<L0400
         STA   $10
         STA   $02
         LDY   #$00
LD3F6    LDA   ($10),Y
         STA   ($02),Y
         INY
         BNE   LD3F6
         INC   $11
         INC   $03
         LDA   $03
         CMP   #>L0C00
         BNE   LD3F6
         LDY   #$00
LD409    LDA   LRP2,Y	; low-res page 2
         BEQ   LD414
         STA   L0AD0,Y
         INY
         BNE   LD409
LD414    LDX   #$00
LD416    LDA   LRMSG,X
         BEQ   LD421
         JSR   COUT
         INX
         BNE   LD416
LD421    BIT   TXTPAGE2
         JSR   PAUSE
         BIT   TXTPAGE1
         JSR   PAUSE
         LDA   KBD
         CMP   #$A0
         BNE   LD421
         BIT   KBDSTROBE
         JSR   SETTXT
         LDA   #>L0C00
         STA   $08
         LDA   #>L0800
         STA   $07
         LDA   #<L0800
         STA   $06
         STA   $09
         JSR   LEE2A
         LDA   #$7F
         STA   $E4
         JSR   LD4E8
LD452    JSR   LD512
         DEC   $08
         BNE   LD452
         LDA   #$1F
         STA   $08
LD45D    JSR   LD544
         DEC   $08
         BNE   LD45D
         LDA   #$00
         STA   $06
         INC   $09
         JSR   LD544
         JSR   LD544
         LDA   #>L4000
         STA   $03
         LDA   #>L2000
         STA   $05
         LDA   #<L4000
         STA   $02
         STA   $04
         LDY   #$00
LD480    LDA   ($02),Y
         STA   ($04),Y
         INY
         BNE   LD480
         INC   $03
         INC   $05
         LDA   $03
         CMP   #>L6000
         BNE   LD480

         LDA   #$11
         STA   $2800
         LDA   #$19
         STA   $2C00
         LDA   #$11
         STA   $3000
         STA   $3400
         STA   $3800
         LDA   #$7D
         STA   $3C00
         LDA   #$31
         STA   $4800
         LDA   #$49
         STA   $4C00
         LDA   #$41
         STA   $5000
         LDA   #$21
         STA   $5400
         LDA   #$11
         STA   $5800
         LDA   #$79
         STA   $5C00
LD4C9    BIT   TXTPAGE2
         JSR   PAUSE
         BIT   TXTPAGE1
         LDA   KBD
         CMP   #$A0
         BEQ   LD4DF
         JSR   PAUSE
         JMP   LD4C9

LD4DF    JSR   SETTXT
         BIT   LORES
         JMP   TSTS

LD4E8    LDY   #$00
         LDX   #$00
         LDA   #$00
         JSR   LEEA9
         LDX   #$01
         LDA   #$17
         JSR   LEF8C
         LDY   #$BF
         LDX   #$01
         LDA   #$17
         JSR   LEF8C
         LDY   #$BF
         LDA   #$00
         JSR   LEF8C
         LDY   #$00
         LDX   #$00
         LDA   #$00
         JSR   LEF8C
         RTS

LD512    LDA   #$00
         LDY   $07
         JSR   LEF8C
         LDA   $07
         TAY
         ADC   #$07
         STA   $07
         LDX   #$01
         LDA   #$18
         JSR   LEF8C
         LDX   #$01
         LDA   #$18
         LDY   $07
         JSR   LEF8C
         LDA   #$00
         LDY   $07
         JSR   LEF8C
         LDA   $07
         ADC   #$07
         TAY
         STA   $07
         LDA   #$00
         JSR   LEF8C
         RTS

LD544    LDY   #$BF
         LDX   $09
         LDA   $06
         JSR   LEF8C
         LDY   #$00
         LDX   $09
         LDA   $06
         JSR   LEF8C
         LDY   #$00
         LDX   $09
         LDA   $06
         ADC   #$08
         STA   $06
         JSR   LEF8C
         LDY   #$BF
         LDX   $09
         LDA   $06
         JSR   LEF8C
         RTS

*---------------------------------------------------------
*
* Command: K - Keyboard test
*
*---------------------------------------------------------

KBDTST   JSR   HOME
         LDA   #$14
         STA   CV
         LDX   #$00
LD576    LDA   KMSG,X
         BEQ   LD581
         JSR   COUT
         INX
         BNE   LD576
LD581    LDA   #$01
         STA   $69
         LDA   #$02
         STA   $66
         STA   $68
         LDA   #$0D
         STA   $09
         LDA   #$0D
         STA   $67
         LDA   #$7F
         STA   $E4
         JSR   LEE34
         BIT   MIXSET
         JSR   LD773
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         LDA   #$1B
         STA   $67
         LDA   $68
         STA   $66
         JSR   LD788
         LDA   #$01
         STA   $69
         LDA   #$15
         STA   $68
         STA   $66
         LDA   #$0D
         STA   $09
         LDA   #$1B
         STA   $67
         JSR   LD788
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         LDA   #$0D
         STA   $67
         LDA   $68
         STA   $66
         JSR   LD773
         LDA   #$28
         STA   $68
         STA   $66
         LDA   #$1D
         STA   $67
         LDA   #$01
         STA   $69
         JSR   LD788
         LDA   #$0D
         STA   $67
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         LDA   #$0B
         STA   $09
         LDA   $68
         STA   $66
         JSR   LD773
         LDA   $68
         STA   $66
         LDA   #$1C
         STA   $67
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         JSR   LD788
         LDA   #$01
         STA   $69
         LDA   #$25
         STA   $67
         LDA   #$3B
         STA   $68
         STA   $66
         JSR   LD788
         LDA   #$0D
         STA   $67
         LDA   $68
         STA   $66
         LDA   #$0A
         STA   $09
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         JSR   LD773
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         LDA   #$25
         STA   $67
         LDA   $68
         STA   $66
         JSR   LD788
         LDA   #$01
         STA   $69
         LDA   #$0D
         STA   $67
         LDA   #$02
         STA   $09
         LDA   #$4E
         STA   $68
         STA   $66
         JSR   LD773
         LDA   $6A
         ADC   #$17
         STA   $69
         LDA   $68
         STA   $66
         JSR   LD788
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         LDA   $68
         STA   $66
         LDA   #$5A
         STA   $67
         JSR   LD788
         INC   $6A
         INC   $6A
         LDA   $6A
         STA   $69
         LDA   #$0D
         STA   $67
         LDA   $68
         STA   $66
         LDA   #$05
         STA   $09
         JSR   LD773
         LDY   #$00
         STY   $63
         STY   $68
         STY   $66
         STY   $67
         STY   $62
         LDA   #$3F
         STA   $64
LD6AD    JSR   LD83F
         DEC   $64
         BNE   LD6AD
         LDA   #$FF
         STA   $0E
LD6B8    LDA   #$00
         STA   $E4
         LDA   $0E
         CMP   #$FF
         BEQ   LD6C5
         JSR   LD806
LD6C5    LDA   BUTN0
         BPL   LD6CF
         LDY   #$38
         JMP   LD739

LD6CF    LDA   BUTN1
         BPL   LD6D9
         LDY   #$39
         JMP   LD739

LD6D9    LDA   KBD
         BPL   LD6B8
         STA   $65
         CMP   #$FB
         BCS   LD6E8
         CMP   #$E1
         BCS   LD74D
LD6E8    CMP   #$83
         BEQ   LD743
         BIT   KBDSTROBE
         LDA   #$00
         STA   KBD
         LDA   #$80
         JSR   WAIT
         LDA   KBD
         CMP   $65
         BNE   LD728
         JSR   BELL
         JSR   BELL
         LDA   #$00
         STA   $0E
         LDA   $65
         LDY   #$00
LD70E    CMP   LE2A5,Y
         BEQ   LD71B
         INY
         CPY   #LE2DD-LE2A5	; $38
         BNE   LD70E
         JMP   LD6B8

LD71B    TYA
         ASL
         LDY   $68
         STA   |$006B,Y
         INY
         STY   $68
         JMP   LD6B8

LD728    LDA   $65
         LDY   #$00
LD72C    CMP   LE2A5,Y
         BEQ   LD739
         INY
         CPY   #LE2DD-LE2A5	; $38
         BNE   LD72C
         JMP   LD6B8

LD739    TYA
         ASL
         STA   $63
         JSR   LD83F
         JMP   LD6B8

LD743    JSR   SETTXT
         LDA   #$00
         STA   $0C
         JMP   TSTS

LD74D    LDA   #$3C
         ASL
         STA   $63
         JSR   LD83F
         LDA   #$FF
         JSR   WAIT
         LDA   #$FF
         JSR   WAIT
         LDA   #$7F
         STA   $E4
         LDA   #$3C
         ASL
         STA   $63
         JSR   LD83F
         LDA   #$FF
         JSR   WAIT
         JMP   LD6B8

LD773    JSR   LD788
         DEC   $09
         BEQ   LD787
         LDA   $69
         ADC   #$0F
         STA   $69
         LDA   $68
         STA   $66
         JMP   LD773
LD787    RTS

LD788    LDY   #$00
         LDX   $69
         LDA   $66
         JSR   LEEA9
         DEC   $69
         INC   $66
         LDA   $69
         LDY   $66
         LDX   #$00
         JSR   LEF8C
         LDA   $66
         CLC
         ADC   #$0F
         STA   $66
         TAY
         LDA   $69
         LDX   #$00
         JSR   LEF8C
         INC   $69
         INC   $66
         LDA   $69
         LDY   $66
         LDX   #$00
         JSR   LEF8C
         LDA   $69
         ADC   $67
         STA   $69
         LDY   $66
         LDX   #$00
         JSR   LEF8C
         DEC   $66
         DEC   $66
         INC   $69
         LDA   $69
         STA   $6A
         LDY   $66
         LDX   #$00
         JSR   LEF8C
         LDA   $66
         SEC
         SBC   #$0F
         STA   $66
         LDA   $69
         LDY   $66
         LDX   #$00
         JSR   LEF8C
         DEC   $69
         DEC   $66
         LDA   $69
         LDY   $66
         LDX   #$00
         JSR   LEF8C
         LDA   $69
         SEC
         SBC   $67
         STA   $69
         LDA   $69
         LDY   $66
         LDX   #$00
         JSR   LEF8C
         RTS

LD806    LDY   #$00
         LDA   #$7F
         STA   $E4
LD80C    LDA   |$006B,Y
         STA   $63
         STY   $66
         JSR   LD83F
         LDY   $66
         INY
         CPY   $68
         BNE   LD80C
         LDA   #$40
         JSR   WAIT
         LDA   #$00
         STA   $E4
         LDY   #$00
LD828    LDA   |$006B,Y
         STA   $63
         STY   $66
         JSR   LD83F
         LDY   $66
         INY
         CPY   $68
         BNE   LD828
         LDA   #$40
         JSR   WAIT
         RTS

LD83F    LDY   $63
         LDA   LE2DD,Y
         STA   POINTER
         INY
         LDA   LE2DD,Y
         STA   POINTER+1
         INY
         STY   $63
         LDY   #$00
         LDA   (POINTER),Y
         STA   $62
         INC   POINTER
         JSR   LD85B
         RTS

LD85B    LDY   #$00
         LDA   (POINTER),Y
         TAX
         INC   POINTER
         BNE   LD866
         INC   POINTER+1
LD866    LDA   (POINTER),Y
         INC   POINTER
         BNE   LD86E
         INC   POINTER+1
LD86E    JSR   LEEA9
         DEC   $62
         BNE   LD85B
         RTS

LD876    DB    $1E
         DB    $03
         DB    $09
         DB    $04
         DB    $09
         DB    $05
         DB    $09
         DB    $07
         DB    $09
         DB    $08
         DB    $09
         DB    $09
         DB    $09
         DB    $0B
         DB    $09
         DB    $0C
         DB    $09
         DB    $0D
         DB    $09
         DB    $03
         DB    $0A
         DB    $07
         DB    $0A
         DB    $0B
         DB    $0A
         DB    $03
         DB    $0B
         DB    $04
         DB    $0B
         DB    $07
         DB    $0B
         DB    $08
         DB    $0B
         DB    $09
         DB    $0B
         DB    $0B
         DB    $0B
         DB    $03
         DB    $0C
         DB    $09
         DB    $0C
         DB    $0B
         DB    $0C
         DB    $03
         DB    $0D
         DB    $04
         DB    $0D
         DB    $05
         DB    $0D
         DB    $07
         DB    $0D
         DB    $08
         DB    $0D
         DB    $09
         DB    $0D
         DB    $0B
         DB    $0D
         DB    $0C
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0C
         DB    $19
         DB    $0B
         DB    $18
         DB    $0C
         DB    $19
         DB    $0C
         DB    $19
         DB    $0D
         DB    $19
         DB    $0E
         DB    $19
         DB    $0F
         DB    $19
         DB    $10
         DB    $17
         DB    $11
         DB    $18
         DB    $11
         DB    $19
         DB    $11
         DB    $1A
         DB    $11
         DB    $1B
         DB    $11
         DB    $0C
         DB    $29
         DB    $0B
         DB    $2A
         DB    $0B
         DB    $28
         DB    $0C
         DB    $2B
         DB    $0C
         DB    $2B
         DB    $0D
         DB    $2A
         DB    $0E
         DB    $29
         DB    $0F
         DB    $28
         DB    $10
         DB    $28
         DB    $11
         DB    $29
         DB    $11
         DB    $2A
         DB    $11
         DB    $2B
         DB    $11
         DB    $0D
         DB    $3A
         DB    $0B
         DB    $3B
         DB    $0B
         DB    $3C
         DB    $0B
         DB    $3D
         DB    $0B
         DB    $3D
         DB    $0C
         DB    $3C
         DB    $0D
         DB    $3B
         DB    $0E
         DB    $3C
         DB    $0E
         DB    $3D
         DB    $0F
         DB    $3D
         DB    $10
         DB    $3C
         DB    $11
         DB    $3B
         DB    $11
         DB    $3A
         DB    $10
         DB    $0E
         DB    $4C
         DB    $0B
         DB    $4B
         DB    $0C
         DB    $4C
         DB    $0C
         DB    $4A
         DB    $0D
         DB    $4C
         DB    $0D
         DB    $49
         DB    $0E
         DB    $4C
         DB    $0E
         DB    $49
         DB    $0F
         DB    $4A
         DB    $0F
         DB    $4B
         DB    $0F
         DB    $4C
         DB    $0F
         DB    $4D
         DB    $0F
         DB    $4C
         DB    $10
         DB    $4C
         DB    $11
         DB    $0F
         DB    $5B
         DB    $0B
         DB    $5C
         DB    $0B
         DB    $5D
         DB    $0B
         DB    $5E
         DB    $0B
         DB    $5B
         DB    $0C
         DB    $5B
         DB    $0C
         DB    $5B
         DB    $0D
         DB    $5C
         DB    $0D
         DB    $5D
         DB    $0D
         DB    $5E
         DB    $0E
         DB    $5E
         DB    $0F
         DB    $5E
         DB    $10
         DB    $5D
         DB    $11
         DB    $5C
         DB    $11
         DB    $5B
         DB    $10
         DB    $11
         DB    $6F
         DB    $0B
         DB    $6E
         DB    $0B
         DB    $6D
         DB    $0B
         DB    $6C
         DB    $0C
         DB    $6B
         DB    $0D
         DB    $6B
         DB    $0E
         DB    $6C
         DB    $0E
         DB    $6D
         DB    $0E
         DB    $6E
         DB    $0E
         DB    $6F
         DB    $0F
         DB    $6B
         DB    $0F
         DB    $6F
         DB    $0F
         DB    $6B
         DB    $10
         DB    $6F
         DB    $10
         DB    $6C
         DB    $11
         DB    $6D
         DB    $11
         DB    $6E
         DB    $11
         DB    $0B
         DB    $7E
         DB    $0B
         DB    $7F
         DB    $0B
         DB    $80
         DB    $0B
         DB    $81
         DB    $0B
         DB    $81
         DB    $0C
         DB    $80
         DB    $0D
         DB    $7F
         DB    $0E
         DB    $7E
         DB    $0F
         DB    $7E
         DB    $10
         DB    $7E
         DB    $11
         DB    $7D
         DB    $0B
         DB    $11
         DB    $8F
         DB    $0B
         DB    $90
         DB    $0B
         DB    $91
         DB    $0B
         DB    $8E
         DB    $0C
         DB    $92
         DB    $0C
         DB    $8E
         DB    $0D
         DB    $92
         DB    $0D
         DB    $8F
         DB    $0E
         DB    $90
         DB    $0E
         DB    $91
         DB    $0E
         DB    $8E
         DB    $0F
         DB    $92
         DB    $0F
         DB    $8E
         DB    $10
         DB    $92
         DB    $10
         DB    $8F
         DB    $11
         DB    $90
         DB    $11
         DB    $91
         DB    $11
         DB    $0F
         DB    $A0
         DB    $0B
         DB    $A1
         DB    $0B
         DB    $A2
         DB    $0B
         DB    $9F
         DB    $0C
         DB    $A3
         DB    $0C
         DB    $9F
         DB    $0D
         DB    $A3
         DB    $0D
         DB    $A0
         DB    $0E
         DB    $A1
         DB    $0E
         DB    $A2
         DB    $0E
         DB    $A3
         DB    $0E
         DB    $A3
         DB    $0F
         DB    $A2
         DB    $10
         DB    $A1
         DB    $11
         DB    $A0
         DB    $11
         DB    $12
         DB    $B0
         DB    $0B
         DB    $B1
         DB    $0B
         DB    $B2
         DB    $0B
         DB    $AF
         DB    $0C
         DB    $B3
         DB    $0C
         DB    $AF
         DB    $0D
         DB    $B3
         DB    $0D
         DB    $AF
         DB    $0E
         DB    $B3
         DB    $0E
         DB    $AF
         DB    $0E
         DB    $B3
         DB    $0E
         DB    $AF
         DB    $0F
         DB    $B3
         DB    $0F
         DB    $AF
         DB    $10
         DB    $B3
         DB    $10
         DB    $B0
         DB    $11
         DB    $B1
         DB    $11
         DB    $B2
         DB    $11
         DB    $07
         DB    $C0
         DB    $0D
         DB    $C1
         DB    $0D
         DB    $C2
         DB    $0D
         DB    $C3
         DB    $0D
         DB    $C4
         DB    $0D
         DB    $C5
         DB    $0D
         DB    $C6
         DB    $0D
         DB    $0C
         DB    $D2
         DB    $0C
         DB    $D3
         DB    $0C
         DB    $D4
         DB    $0C
         DB    $D5
         DB    $0C
         DB    $D6
         DB    $0C
         DB    $D7
         DB    $0C
         DB    $D2
         DB    $0E
         DB    $D3
         DB    $0E
         DB    $D4
         DB    $0E
         DB    $D5
         DB    $0E
         DB    $D6
         DB    $0E
         DB    $D7
         DB    $0E
         DB    $38
         DB    $E1
         DB    $09
         DB    $E1
         DB    $0A
         DB    $E1
         DB    $0B
         DB    $E1
         DB    $0B
         DB    $E1
         DB    $0C
         DB    $E1
         DB    $0D
         DB    $E2
         DB    $09
         DB    $E3
         DB    $0A
         DB    $E3
         DB    $0B
         DB    $E3
         DB    $0C
         DB    $E2
         DB    $0D
         DB    $E5
         DB    $09
         DB    $E6
         DB    $09
         DB    $E7
         DB    $09
         DB    $E5
         DB    $0A
         DB    $E5
         DB    $0B
         DB    $E6
         DB    $0B
         DB    $E7
         DB    $0B
         DB    $E5
         DB    $0C
         DB    $E5
         DB    $0D
         DB    $E6
         DB    $0D
         DB    $E7
         DB    $0D
         DB    $E9
         DB    $09
         DB    $E9
         DB    $0A
         DB    $E9
         DB    $0B
         DB    $E9
         DB    $0C
         DB    $E9
         DB    $0D
         DB    $EA
         DB    $0D
         DB    $EB
         DB    $0D
         DB    $ED
         DB    $09
         DB    $EE
         DB    $09
         DB    $EF
         DB    $09
         DB    $ED
         DB    $0A
         DB    $ED
         DB    $0B
         DB    $EE
         DB    $0B
         DB    $ED
         DB    $0C
         DB    $ED
         DB    $0D
         DB    $EE
         DB    $0D
         DB    $EF
         DB    $0D
         DB    $F1
         DB    $09
         DB    $F2
         DB    $09
         DB    $F3
         DB    $09
         DB    $F2
         DB    $0A
         DB    $F2
         DB    $0B
         DB    $F2
         DB    $0C
         DB    $F2
         DB    $0D
         DB    $F5
         DB    $09
         DB    $F6
         DB    $09
         DB    $F7
         DB    $09
         DB    $F5
         DB    $0A
         DB    $F5
         DB    $0B
         DB    $F6
         DB    $0B
         DB    $F5
         DB    $0C
         DB    $F5
         DB    $0D
         DB    $F6
         DB    $0D
         DB    $F7
         DB    $0D
         DB    $1B
         DB    $0A
         DB    $1C
         DB    $0B
         DB    $1C
         DB    $0C
         DB    $1C
         DB    $0B
         DB    $1D
         DB    $0B
         DB    $1E
         DB    $0B
         DB    $1F
         DB    $0B
         DB    $20
         DB    $0F
         DB    $1C
         DB    $0E
         DB    $1D
         DB    $10
         DB    $1D
         DB    $0E
         DB    $1E
         DB    $0F
         DB    $1E
         DB    $10
         DB    $1E
         DB    $0E
         DB    $1F
         DB    $10
         DB    $1F
         DB    $0E
         DB    $20
         DB    $10
         DB    $20
         DB    $12
         DB    $1C
         DB    $13
         DB    $1C
         DB    $12
         DB    $1D
         DB    $14
         DB    $1D
         DB    $12
         DB    $1E
         DB    $13
         DB    $1E
         DB    $12
         DB    $1F
         DB    $14
         DB    $1F
         DB    $12
         DB    $20
         DB    $13
         DB    $20
         DB    $11
         DB    $26
         DB    $1E
         DB    $27
         DB    $1E
         DB    $28
         DB    $1E
         DB    $25
         DB    $1F
         DB    $29
         DB    $1F
         DB    $25
         DB    $20
         DB    $29
         DB    $20
         DB    $25
         DB    $21
         DB    $29
         DB    $21
         DB    $25
         DB    $22
         DB    $27
         DB    $22
         DB    $29
         DB    $22
         DB    $25
         DB    $23
         DB    $28
         DB    $23
         DB    $26
         DB    $24
         DB    $27
         DB    $24
         DB    $29
         DB    $24
         DB    $12
         DB    $36
         DB    $1E
         DB    $36
         DB    $1F
         DB    $36
         DB    $20
         DB    $36
         DB    $21
         DB    $36
         DB    $22
         DB    $36
         DB    $23
         DB    $36
         DB    $24
         DB    $37
         DB    $23
         DB    $38
         DB    $22
         DB    $38
         DB    $21
         DB    $39
         DB    $23
         DB    $3A
         DB    $24
         DB    $3A
         DB    $23
         DB    $3A
         DB    $22
         DB    $3A
         DB    $21
         DB    $3A
         DB    $20
         DB    $3A
         DB    $1F
         DB    $3A
         DB    $1E
         DB    $0F
         DB    $48
         DB    $1E
         DB    $49
         DB    $1E
         DB    $4A
         DB    $1E
         DB    $4B
         DB    $1E
         DB    $48
         DB    $1F
         DB    $48
         DB    $20
         DB    $48
         DB    $21
         DB    $49
         DB    $21
         DB    $4A
         DB    $21
         DB    $48
         DB    $22
         DB    $48
         DB    $23
         DB    $48
         DB    $24
         DB    $49
         DB    $24
         DB    $4A
         DB    $24
         DB    $4B
         DB    $24
         DB    $12
         DB    $59
         DB    $1E
         DB    $5A
         DB    $1E
         DB    $5B
         DB    $1E
         DB    $5C
         DB    $1E
         DB    $59
         DB    $1F
         DB    $5D
         DB    $1F
         DB    $59
         DB    $20
         DB    $5D
         DB    $20
         DB    $59
         DB    $21
         DB    $5A
         DB    $21
         DB    $5B
         DB    $21
         DB    $5C
         DB    $21
         DB    $59
         DB    $22
         DB    $5B
         DB    $22
         DB    $59
         DB    $23
         DB    $5C
         DB    $23
         DB    $59
         DB    $24
         DB    $5D
         DB    $24
         DB    $0B
         DB    $69
         DB    $1E
         DB    $6A
         DB    $1E
         DB    $6B
         DB    $1E
         DB    $6C
         DB    $1E
         DB    $6D
         DB    $1E
         DB    $6B
         DB    $1F
         DB    $6B
         DB    $20
         DB    $6B
         DB    $21
         DB    $6B
         DB    $22
         DB    $6B
         DB    $23
         DB    $6B
         DB    $24
         DB    $0A
         DB    $7B
         DB    $1E
         DB    $7F
         DB    $1E
         DB    $7B
         DB    $1F
         DB    $7F
         DB    $1F
         DB    $7C
         DB    $20
         DB    $7E
         DB    $20
         DB    $7D
         DB    $21
         DB    $7D
         DB    $22
         DB    $7D
         DB    $23
         DB    $7D
         DB    $24
         DB    $0F
         DB    $8C
         DB    $1E
         DB    $90
         DB    $1E
         DB    $8C
         DB    $1F
         DB    $90
         DB    $1F
         DB    $8C
         DB    $20
         DB    $90
         DB    $20
         DB    $8C
         DB    $21
         DB    $90
         DB    $21
         DB    $8C
         DB    $22
         DB    $90
         DB    $22
         DB    $8C
         DB    $23
         DB    $90
         DB    $23
         DB    $8D
         DB    $24
         DB    $8E
         DB    $24
         DB    $8F
         DB    $24
         DB    $07
         DB    $9E
         DB    $1E
         DB    $9E
         DB    $1F
         DB    $9E
         DB    $20
         DB    $9E
         DB    $21
         DB    $9E
         DB    $22
         DB    $9E
         DB    $23
         DB    $9E
         DB    $24
         DB    $12
         DB    $AE
         DB    $1E
         DB    $AF
         DB    $1E
         DB    $B0
         DB    $1E
         DB    $B1
         DB    $1E
         DB    $AD
         DB    $1F
         DB    $B2
         DB    $1F
         DB    $AD
         DB    $20
         DB    $B2
         DB    $20
         DB    $AD
         DB    $21
         DB    $B2
         DB    $21
         DB    $AD
         DB    $22
         DB    $B2
         DB    $22
         DB    $AD
         DB    $23
         DB    $B2
         DB    $23
         DB    $AE
         DB    $24
         DB    $AF
         DB    $24
         DB    $B0
         DB    $24
         DB    $B1
         DB    $24
         DB    $0D
         DB    $BF
         DB    $1E
         DB    $C0
         DB    $1E
         DB    $C1
         DB    $1E
         DB    $BF
         DB    $1F
         DB    $C2
         DB    $1F
         DB    $BF
         DB    $20
         DB    $C2
         DB    $20
         DB    $BF
         DB    $21
         DB    $C0
         DB    $21
         DB    $C1
         DB    $21
         DB    $BF
         DB    $22
         DB    $BF
         DB    $23
         DB    $BF
         DB    $24
         DB    $0B
         DB    $D0
         DB    $1E
         DB    $D1
         DB    $1E
         DB    $D2
         DB    $1E
         DB    $D0
         DB    $1F
         DB    $D0
         DB    $20
         DB    $D0
         DB    $21
         DB    $D0
         DB    $22
         DB    $D0
         DB    $23
         DB    $D0
         DB    $24
         DB    $D1
         DB    $24
         DB    $D2
         DB    $24
         DB    $0B
         DB    $E1
         DB    $1E
         DB    $E2
         DB    $1E
         DB    $E3
         DB    $1E
         DB    $E3
         DB    $1F
         DB    $E3
         DB    $20
         DB    $E3
         DB    $21
         DB    $E3
         DB    $22
         DB    $E3
         DB    $23
         DB    $E3
         DB    $24
         DB    $E2
         DB    $24
         DB    $E1
         DB    $24
         DB    $06
         DB    $F0
         DB    $1E
         DB    $F1
         DB    $1F
         DB    $F2
         DB    $20
         DB    $F3
         DB    $21
         DB    $F4
         DB    $22
         DB    $F5
         DB    $23
         DB    $3F
         DB    $02
         DB    $2E
         DB    $03
         DB    $2E
         DB    $04
         DB    $2E
         DB    $02
         DB    $2F
         DB    $02
         DB    $30
         DB    $02
         DB    $31
         DB    $02
         DB    $32
         DB    $03
         DB    $32
         DB    $04
         DB    $32
         DB    $07
         DB    $2E
         DB    $08
         DB    $2E
         DB    $06
         DB    $2F
         DB    $09
         DB    $2F
         DB    $06
         DB    $30
         DB    $09
         DB    $30
         DB    $06
         DB    $31
         DB    $09
         DB    $31
         DB    $07
         DB    $32
         DB    $08
         DB    $32
         DB    $0B
         DB    $2F
         DB    $0B
         DB    $2F
         DB    $0B
         DB    $30
         DB    $0B
         DB    $31
         DB    $0B
         DB    $32
         DB    $0C
         DB    $2E
         DB    $0D
         DB    $2E
         DB    $0E
         DB    $2F
         DB    $0E
         DB    $30
         DB    $0E
         DB    $31
         DB    $0E
         DB    $32
         DB    $10
         DB    $2E
         DB    $11
         DB    $2E
         DB    $12
         DB    $2E
         DB    $11
         DB    $2F
         DB    $11
         DB    $30
         DB    $11
         DB    $31
         DB    $11
         DB    $32
         DB    $14
         DB    $2E
         DB    $15
         DB    $2E
         DB    $14
         DB    $2F
         DB    $16
         DB    $2F
         DB    $14
         DB    $30
         DB    $15
         DB    $30
         DB    $14
         DB    $31
         DB    $16
         DB    $31
         DB    $14
         DB    $32
         DB    $16
         DB    $32
         DB    $19
         DB    $2E
         DB    $1A
         DB    $2E
         DB    $18
         DB    $2F
         DB    $18
         DB    $30
         DB    $18
         DB    $31
         DB    $19
         DB    $32
         DB    $1A
         DB    $32
         DB    $1B
         DB    $2F
         DB    $1B
         DB    $30
         DB    $1B
         DB    $31
         DB    $1D
         DB    $2E
         DB    $1D
         DB    $2F
         DB    $1D
         DB    $30
         DB    $1D
         DB    $31
         DB    $1D
         DB    $32
         DB    $1E
         DB    $32
         DB    $10
         DB    $29
         DB    $31
         DB    $28
         DB    $32
         DB    $2A
         DB    $32
         DB    $27
         DB    $33
         DB    $2B
         DB    $33
         DB    $27
         DB    $34
         DB    $2B
         DB    $34
         DB    $27
         DB    $35
         DB    $28
         DB    $35
         DB    $29
         DB    $35
         DB    $2A
         DB    $35
         DB    $2B
         DB    $35
         DB    $27
         DB    $36
         DB    $2B
         DB    $36
         DB    $27
         DB    $37
         DB    $2B
         DB    $37
         DB    $0F
         DB    $39
         DB    $31
         DB    $3A
         DB    $31
         DB    $3B
         DB    $31
         DB    $38
         DB    $32
         DB    $3C
         DB    $32
         DB    $38
         DB    $33
         DB    $39
         DB    $34
         DB    $3A
         DB    $34
         DB    $3B
         DB    $34
         DB    $3C
         DB    $35
         DB    $3C
         DB    $36
         DB    $3B
         DB    $37
         DB    $3A
         DB    $37
         DB    $39
         DB    $37
         DB    $38
         DB    $36
         DB    $14
         DB    $49
         DB    $31
         DB    $4A
         DB    $31
         DB    $4B
         DB    $31
         DB    $4C
         DB    $31
         DB    $49
         DB    $32
         DB    $4D
         DB    $32
         DB    $49
         DB    $32
         DB    $4D
         DB    $32
         DB    $49
         DB    $33
         DB    $4D
         DB    $33
         DB    $49
         DB    $34
         DB    $4D
         DB    $34
         DB    $49
         DB    $35
         DB    $4D
         DB    $35
         DB    $49
         DB    $36
         DB    $4D
         DB    $36
         DB    $49
         DB    $37
         DB    $4A
         DB    $37
         DB    $4B
         DB    $37
         DB    $4C
         DB    $37
         DB    $0C
         DB    $5A
         DB    $31
         DB    $5B
         DB    $31
         DB    $5C
         DB    $31
         DB    $5D
         DB    $31
         DB    $5A
         DB    $32
         DB    $5A
         DB    $33
         DB    $5A
         DB    $34
         DB    $5B
         DB    $34
         DB    $5C
         DB    $34
         DB    $5A
         DB    $35
         DB    $5A
         DB    $36
         DB    $5A
         DB    $37
         DB    $0D
         DB    $6C
         DB    $31
         DB    $6D
         DB    $31
         DB    $6E
         DB    $31
         DB    $6B
         DB    $32
         DB    $6B
         DB    $33
         DB    $6B
         DB    $34
         DB    $6B
         DB    $35
         DB    $6D
         DB    $35
         DB    $6E
         DB    $35
         DB    $6B
         DB    $36
         DB    $6E
         DB    $36
         DB    $6C
         DB    $37
         DB    $6D
         DB    $37
         DB    $11
         DB    $7D
         DB    $31
         DB    $80
         DB    $31
         DB    $7D
         DB    $32
         DB    $7D
         DB    $32
         DB    $80
         DB    $32
         DB    $7D
         DB    $33
         DB    $80
         DB    $33
         DB    $7D
         DB    $34
         DB    $7E
         DB    $34
         DB    $7F
         DB    $34
         DB    $80
         DB    $34
         DB    $7D
         DB    $35
         DB    $80
         DB    $35
         DB    $7D
         DB    $36
         DB    $80
         DB    $36
         DB    $7D
         DB    $37
         DB    $80
         DB    $37
         DB    $0A
         DB    $92
         DB    $31
         DB    $92
         DB    $32
         DB    $92
         DB    $33
         DB    $92
         DB    $34
         DB    $92
         DB    $35
         DB    $92
         DB    $36
         DB    $91
         DB    $37
         DB    $90
         DB    $37
         DB    $8F
         DB    $37
         DB    $8E
         DB    $36
         DB    $0E
         DB    $9E
         DB    $31
         DB    $A2
         DB    $31
         DB    $9E
         DB    $32
         DB    $A1
         DB    $32
         DB    $9E
         DB    $33
         DB    $A0
         DB    $33
         DB    $9E
         DB    $34
         DB    $9F
         DB    $34
         DB    $9E
         DB    $35
         DB    $A0
         DB    $35
         DB    $9E
         DB    $36
         DB    $A1
         DB    $36
         DB    $9E
         DB    $37
         DB    $A2
         DB    $37
         DB    $0B
         DB    $AF
         DB    $31
         DB    $AF
         DB    $32
         DB    $AF
         DB    $33
         DB    $AF
         DB    $34
         DB    $AF
         DB    $35
         DB    $AF
         DB    $36
         DB    $AF
         DB    $37
         DB    $B0
         DB    $37
         DB    $B1
         DB    $37
         DB    $B2
         DB    $37
         DB    $B3
         DB    $37
         DB    $04
         DB    $C2
         DB    $33
         DB    $C2
         DB    $35
         DB    $C2
         DB    $36
         DB    $C1
         DB    $37
         DB    $03
         DB    $D3
         DB    $33
         DB    $D3
         DB    $34
         DB    $D3
         DB    $35
         DB    $37
         DB    $E0
         DB    $2E
         DB    $E0
         DB    $2F
         DB    $E0
         DB    $30
         DB    $E0
         DB    $31
         DB    $E0
         DB    $32
         DB    $E1
         DB    $2E
         DB    $E2
         DB    $2F
         DB    $E1
         DB    $30
         DB    $E2
         DB    $31
         DB    $E2
         DB    $32
         DB    $E4
         DB    $2E
         DB    $E4
         DB    $2F
         DB    $E4
         DB    $30
         DB    $E4
         DB    $31
         DB    $E4
         DB    $32
         DB    $E5
         DB    $2E
         DB    $E6
         DB    $2E
         DB    $E5
         DB    $30
         DB    $E5
         DB    $32
         DB    $E6
         DB    $32
         DB    $E8
         DB    $2E
         DB    $E9
         DB    $2E
         DB    $EA
         DB    $2E
         DB    $E9
         DB    $2F
         DB    $E9
         DB    $30
         DB    $E9
         DB    $31
         DB    $E9
         DB    $32
         DB    $EC
         DB    $2E
         DB    $EE
         DB    $2E
         DB    $EC
         DB    $2F
         DB    $EE
         DB    $2F
         DB    $EC
         DB    $30
         DB    $EE
         DB    $30
         DB    $EC
         DB    $31
         DB    $EE
         DB    $31
         DB    $ED
         DB    $32
         DB    $F0
         DB    $2E
         DB    $F1
         DB    $2E
         DB    $F0
         DB    $2F
         DB    $F2
         DB    $2F
         DB    $F0
         DB    $30
         DB    $F1
         DB    $30
         DB    $F0
         DB    $31
         DB    $F2
         DB    $31
         DB    $F0
         DB    $32
         DB    $F2
         DB    $32
         DB    $F4
         DB    $2F
         DB    $F4
         DB    $30
         DB    $F4
         DB    $31
         DB    $F4
         DB    $32
         DB    $F5
         DB    $2E
         DB    $F6
         DB    $2F
         DB    $F6
         DB    $30
         DB    $F6
         DB    $31
         DB    $F6
         DB    $32
         DB    $2A
         DB    $0C
         DB    $41
         DB    $0D
         DB    $41
         DB    $0E
         DB    $41
         DB    $0C
         DB    $42
         DB    $0C
         DB    $43
         DB    $0D
         DB    $43
         DB    $0E
         DB    $43
         DB    $0E
         DB    $44
         DB    $0E
         DB    $45
         DB    $0D
         DB    $45
         DB    $0C
         DB    $45
         DB    $10
         DB    $41
         DB    $12
         DB    $41
         DB    $10
         DB    $42
         DB    $12
         DB    $42
         DB    $10
         DB    $43
         DB    $11
         DB    $43
         DB    $12
         DB    $43
         DB    $10
         DB    $44
         DB    $12
         DB    $44
         DB    $10
         DB    $45
         DB    $12
         DB    $45
         DB    $15
         DB    $41
         DB    $15
         DB    $42
         DB    $15
         DB    $43
         DB    $15
         DB    $44
         DB    $15
         DB    $45
         DB    $18
         DB    $41
         DB    $19
         DB    $41
         DB    $1A
         DB    $41
         DB    $18
         DB    $42
         DB    $18
         DB    $43
         DB    $19
         DB    $43
         DB    $18
         DB    $44
         DB    $18
         DB    $45
         DB    $1C
         DB    $41
         DB    $1D
         DB    $41
         DB    $1E
         DB    $41
         DB    $1D
         DB    $42
         DB    $1D
         DB    $43
         DB    $1D
         DB    $44
         DB    $1D
         DB    $45
         DB    $0F
         DB    $2F
         DB    $44
         DB    $30
         DB    $44
         DB    $31
         DB    $44
         DB    $32
         DB    $44
         DB    $33
         DB    $44
         DB    $33
         DB    $45
         DB    $32
         DB    $46
         DB    $31
         DB    $47
         DB    $30
         DB    $48
         DB    $2F
         DB    $49
         DB    $2F
         DB    $4A
         DB    $30
         DB    $4A
         DB    $31
         DB    $4A
         DB    $32
         DB    $4A
         DB    $33
         DB    $4A
         DB    $0D
         DB    $40
         DB    $44
         DB    $44
         DB    $44
         DB    $40
         DB    $45
         DB    $44
         DB    $45
         DB    $41
         DB    $46
         DB    $43
         DB    $46
         DB    $42
         DB    $47
         DB    $41
         DB    $48
         DB    $43
         DB    $48
         DB    $40
         DB    $49
         DB    $44
         DB    $49
         DB    $40
         DB    $4A
         DB    $44
         DB    $4A
         DB    $0D
         DB    $52
         DB    $44
         DB    $53
         DB    $44
         DB    $54
         DB    $44
         DB    $51
         DB    $45
         DB    $55
         DB    $45
         DB    $51
         DB    $46
         DB    $51
         DB    $47
         DB    $51
         DB    $48
         DB    $51
         DB    $49
         DB    $52
         DB    $4A
         DB    $53
         DB    $4A
         DB    $54
         DB    $4A
         DB    $55
         DB    $49
         DB    $0E
         DB    $62
         DB    $44
         DB    $66
         DB    $44
         DB    $62
         DB    $45
         DB    $62
         DB    $45
         DB    $66
         DB    $45
         DB    $62
         DB    $46
         DB    $66
         DB    $46
         DB    $62
         DB    $47
         DB    $66
         DB    $47
         DB    $62
         DB    $48
         DB    $66
         DB    $48
         DB    $63
         DB    $49
         DB    $65
         DB    $49
         DB    $64
         DB    $4A
         DB    $14
         DB    $74
         DB    $44
         DB    $75
         DB    $44
         DB    $76
         DB    $44
         DB    $77
         DB    $44
         DB    $74
         DB    $45
         DB    $78
         DB    $45
         DB    $74
         DB    $46
         DB    $78
         DB    $46
         DB    $74
         DB    $47
         DB    $75
         DB    $47
         DB    $76
         DB    $47
         DB    $77
         DB    $47
         DB    $74
         DB    $48
         DB    $78
         DB    $48
         DB    $74
         DB    $49
         DB    $78
         DB    $49
         DB    $74
         DB    $4A
         DB    $75
         DB    $4A
         DB    $76
         DB    $4A
         DB    $77
         DB    $4A
         DB    $11
         DB    $84
         DB    $44
         DB    $84
         DB    $45
         DB    $84
         DB    $46
         DB    $84
         DB    $47
         DB    $84
         DB    $48
         DB    $84
         DB    $49
         DB    $84
         DB    $4A
         DB    $85
         DB    $46
         DB    $86
         DB    $47
         DB    $87
         DB    $48
         DB    $88
         DB    $48
         DB    $88
         DB    $49
         DB    $88
         DB    $4A
         DB    $88
         DB    $44
         DB    $88
         DB    $45
         DB    $88
         DB    $46
         DB    $88
         DB    $47
         DB    $12
         DB    $95
         DB    $44
         DB    $95
         DB    $45
         DB    $95
         DB    $46
         DB    $95
         DB    $47
         DB    $95
         DB    $48
         DB    $95
         DB    $49
         DB    $95
         DB    $4A
         DB    $96
         DB    $45
         DB    $97
         DB    $46
         DB    $97
         DB    $47
         DB    $98
         DB    $45
         DB    $99
         DB    $44
         DB    $99
         DB    $45
         DB    $99
         DB    $46
         DB    $99
         DB    $47
         DB    $99
         DB    $48
         DB    $99
         DB    $49
         DB    $99
         DB    $4A
         DB    $03
         DB    $A8
         DB    $47
         DB    $A8
         DB    $48
         DB    $A7
         DB    $49
         DB    $01
         DB    $B9
         DB    $47
         DB    $09
         DB    $C8
         DB    $3E
         DB    $C9
         DB    $3D
         DB    $CA
         DB    $3D
         DB    $CB
         DB    $3D
         DB    $CC
         DB    $3E
         DB    $CB
         DB    $3F
         DB    $CA
         DB    $40
         DB    $CA
         DB    $41
         DB    $CA
         DB    $43
         DB    $2B
         DB    $DE
         DB    $41
         DB    $DF
         DB    $41
         DB    $E0
         DB    $41
         DB    $DE
         DB    $42
         DB    $DE
         DB    $43
         DB    $DF
         DB    $43
         DB    $E0
         DB    $43
         DB    $E0
         DB    $44
         DB    $E0
         DB    $45
         DB    $DF
         DB    $45
         DB    $DE
         DB    $45
         DB    $E2
         DB    $41
         DB    $E2
         DB    $42
         DB    $E2
         DB    $43
         DB    $E2
         DB    $44
         DB    $E2
         DB    $45
         DB    $E3
         DB    $43
         DB    $E4
         DB    $43
         DB    $E4
         DB    $41
         DB    $E4
         DB    $42
         DB    $E4
         DB    $43
         DB    $E4
         DB    $44
         DB    $E4
         DB    $45
         DB    $E7
         DB    $41
         DB    $E7
         DB    $42
         DB    $E7
         DB    $43
         DB    $E7
         DB    $44
         DB    $E7
         DB    $45
         DB    $EA
         DB    $41
         DB    $EB
         DB    $41
         DB    $EC
         DB    $41
         DB    $EA
         DB    $42
         DB    $EA
         DB    $43
         DB    $EA
         DB    $44
         DB    $EA
         DB    $45
         DB    $EB
         DB    $43
         DB    $EE
         DB    $41
         DB    $EF
         DB    $41
         DB    $F0
         DB    $41
         DB    $EF
         DB    $42
         DB    $EF
         DB    $43
         DB    $EF
         DB    $44
         DB    $EF
         DB    $45
         DB    $3F
         DB    $02
         DB    $51
         DB    $03
         DB    $51
         DB    $02
         DB    $52
         DB    $02
         DB    $53
         DB    $02
         DB    $54
         DB    $02
         DB    $55
         DB    $03
         DB    $55
         DB    $06
         DB    $51
         DB    $05
         DB    $52
         DB    $07
         DB    $52
         DB    $05
         DB    $53
         DB    $06
         DB    $53
         DB    $07
         DB    $53
         DB    $05
         DB    $54
         DB    $07
         DB    $54
         DB    $05
         DB    $55
         DB    $07
         DB    $55
         DB    $09
         DB    $51
         DB    $0A
         DB    $51
         DB    $09
         DB    $52
         DB    $09
         DB    $53
         DB    $09
         DB    $54
         DB    $09
         DB    $55
         DB    $0A
         DB    $53
         DB    $0B
         DB    $52
         DB    $0D
         DB    $51
         DB    $0E
         DB    $51
         DB    $0D
         DB    $52
         DB    $0D
         DB    $53
         DB    $0E
         DB    $53
         DB    $0E
         DB    $54

*--- End of code

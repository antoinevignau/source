*
* Apple II diagnostics code
*
* (c) 1983, Apple Computer, Inc.
* (s) 2018, Brutal Deluxe Software
*

*---------------------------------------------------------
* EPROM189.BIN
* Code and data at $E000..$E7FF
*---------------------------------------------------------

LE000    DB    $0E
         DB    $55
         DB    $0D
LE003    DB    $55
         DB    $02
         DB    $57
         DB    $02
         DB    $58
         DB    $02
         DB    $59
         DB    $02
         DB    $5A
         DB    $02
         DB    $5B
         DB    $03
         DB    $5B
         DB    $06
         DB    $57
         DB    $05
         DB    $58
         DB    $07
         DB    $58
         DB    $05
         DB    $59
         DB    $07
         DB    $59
         DB    $05
         DB    $5A
         DB    $07
         DB    $5A
         DB    $06
         DB    $5B
         DB    $09
         DB    $57
         DB    $0A
         DB    $57
         DB    $09
         DB    $58
         DB    $09
         DB    $59
         DB    $09
         DB    $5A
         DB    $09
         DB    $5B
         DB    $0A
         DB    $5B
         DB    $0C
         DB    $57
         DB    $0C
         DB    $58
         DB    $0C
         DB    $59
         DB    $0C
         DB    $5A
         DB    $0C
         DB    $5B
         DB    $0E
         DB    $58
         DB    $0D
         DB    $59
         DB    $0E
         DB    $5A
         DB    $0E
         DB    $5B
         DB    $09
         DB    $15
         DB    $53
         DB    $16
         DB    $52
         DB    $17
         DB    $51
         DB    $18
         DB    $51
         DB    $19
         DB    $52
         DB    $1A
         DB    $53
         DB    $1B
         DB    $53
         DB    $1C
         DB    $52
         DB    $1D
         DB    $51
         DB    $1E
         DB    $51
         DB    $0D
         DB    $BB
         DB    $56
         DB    $BC
         DB    $56
         DB    $BD
         DB    $56
         DB    $BE
         DB    $56
         DB    $BF
         DB    $56
         DB    $C0
         DB    $56
         DB    $C1
         DB    $56
         DB    $C2
         DB    $56
         DB    $C3
         DB    $56
         DB    $C4
         DB    $56
         DB    $C5
         DB    $56
         DB    $BC
         DB    $55
         DB    $BC
         DB    $57
         DB    $0D
         DB    $CC
         DB    $56
         DB    $CD
         DB    $56
         DB    $CE
         DB    $56
         DB    $CF
         DB    $56
         DB    $D0
         DB    $56
         DB    $D1
         DB    $56
         DB    $D2
         DB    $56
         DB    $D3
         DB    $56
         DB    $D4
         DB    $56
         DB    $D5
         DB    $56
         DB    $D6
         DB    $56
         DB    $D5
         DB    $55
         DB    $D5
         DB    $57
         DB    $0D
         DB    $E2
         DB    $51
         DB    $E2
         DB    $52
         DB    $E2
         DB    $53
         DB    $E2
         DB    $54
         DB    $E2
         DB    $55
         DB    $E2
         DB    $56
         DB    $E2
         DB    $57
         DB    $E2
         DB    $58
         DB    $E2
         DB    $59
         DB    $E2
         DB    $5A
         DB    $E2
         DB    $5B
         DB    $E3
         DB    $5A
         DB    $E1
         DB    $5A
         DB    $0D
         DB    $F3
         DB    $5B
         DB    $F3
         DB    $5A
         DB    $F3
         DB    $59
         DB    $F3
         DB    $58
         DB    $F3
         DB    $57
         DB    $F3
         DB    $56
         DB    $F3
         DB    $55
         DB    $F3
         DB    $54
         DB    $F3
         DB    $53
         DB    $F3
         DB    $52
         DB    $F3
         DB    $51
         DB    $F4
         DB    $52
         DB    $F2
         DB    $52
         DB    $26
         DB    $2B
         DB    $55
         DB    $2D
         DB    $55
         DB    $2F
         DB    $55
         DB    $2C
         DB    $56
         DB    $2E
         DB    $56
         DB    $2B
         DB    $57
         DB    $2D
         DB    $57
         DB    $2F
         DB    $57
         DB    $2A
         DB    $58
         DB    $2C
         DB    $58
         DB    $2E
         DB    $58
         DB    $2B
         DB    $59
         DB    $2D
         DB    $59
         DB    $2F
         DB    $59
         DB    $2A
         DB    $54
         DB    $2B
         DB    $54
         DB    $2C
         DB    $54
         DB    $2D
         DB    $54
         DB    $2E
         DB    $54
         DB    $2F
         DB    $54
         DB    $30
         DB    $54
         DB    $2A
         DB    $55
         DB    $2A
         DB    $56
         DB    $2A
         DB    $57
         DB    $2A
         DB    $58
         DB    $2A
         DB    $59
         DB    $2A
         DB    $5A
         DB    $2B
         DB    $5A
         DB    $2C
         DB    $5A
         DB    $2D
         DB    $5A
         DB    $2E
         DB    $5A
         DB    $2F
         DB    $5A
         DB    $30
         DB    $5A
         DB    $30
         DB    $59
         DB    $30
         DB    $58
         DB    $30
         DB    $57
         DB    $30
         DB    $56
         DB    $30
         DB    $55
         DB    $27
         DB    $40
         DB    $52
         DB    $41
         DB    $52
         DB    $40
         DB    $51
         DB    $42
         DB    $51
         DB    $41
         DB    $50
         DB    $43
         DB    $50
         DB    $42
         DB    $4F
         DB    $43
         DB    $4F
         DB    $3D
         DB    $53
         DB    $3E
         DB    $53
         DB    $3F
         DB    $53
         DB    $40
         DB    $53
         DB    $41
         DB    $53
         DB    $42
         DB    $53
         DB    $3C
         DB    $54
         DB    $3B
         DB    $55
         DB    $3B
         DB    $56
         DB    $3B
         DB    $57
         DB    $3B
         DB    $58
         DB    $3B
         DB    $59
         DB    $3B
         DB    $5A
         DB    $3C
         DB    $5B
         DB    $3D
         DB    $5C
         DB    $3E
         DB    $5C
         DB    $3F
         DB    $5C
         DB    $40
         DB    $5C
         DB    $41
         DB    $5C
         DB    $42
         DB    $5C
         DB    $43
         DB    $5B
         DB    $44
         DB    $5A
         DB    $44
         DB    $59
         DB    $44
         DB    $58
         DB    $43
         DB    $58
         DB    $42
         DB    $57
         DB    $42
         DB    $56
         DB    $42
         DB    $55
         DB    $43
         DB    $55
         DB    $43
         DB    $54
         DB    $5B
         DB    $AF
         DB    $52
         DB    $B0
         DB    $52
         DB    $AF
         DB    $51
         DB    $B1
         DB    $51
         DB    $B0
         DB    $50
         DB    $B2
         DB    $50
         DB    $B1
         DB    $4F
         DB    $B2
         DB    $4F
         DB    $AC
         DB    $53
         DB    $AD
         DB    $53
         DB    $AE
         DB    $53
         DB    $AF
         DB    $53
         DB    $B0
         DB    $53
         DB    $B1
         DB    $53
         DB    $AB
         DB    $54
         DB    $AC
         DB    $54
         DB    $AD
         DB    $54
         DB    $AE
         DB    $54
         DB    $AF
         DB    $54
         DB    $B0
         DB    $54
         DB    $B1
         DB    $54
         DB    $B2
         DB    $54
         DB    $AA
         DB    $55
         DB    $AB
         DB    $55
         DB    $AC
         DB    $55
         DB    $AD
         DB    $55
         DB    $AE
         DB    $55
         DB    $AF
         DB    $55
         DB    $B0
         DB    $55
         DB    $B1
         DB    $55
         DB    $B2
         DB    $55
         DB    $AA
         DB    $56
         DB    $AB
         DB    $56
         DB    $AC
         DB    $56
         DB    $AD
         DB    $56
         DB    $AE
         DB    $56
         DB    $AF
         DB    $56
         DB    $B0
         DB    $56
         DB    $B1
         DB    $56
         DB    $AA
         DB    $57
         DB    $AB
         DB    $57
         DB    $AC
         DB    $57
         DB    $AD
         DB    $57
         DB    $AE
         DB    $57
         DB    $AF
         DB    $57
         DB    $B0
         DB    $57
         DB    $B1
         DB    $57
         DB    $AA
         DB    $58
         DB    $AB
         DB    $58
         DB    $AC
         DB    $58
         DB    $AD
         DB    $58
         DB    $AE
         DB    $58
         DB    $AF
         DB    $58
         DB    $B0
         DB    $58
         DB    $B1
         DB    $58
         DB    $B2
         DB    $58
         DB    $B3
         DB    $58
         DB    $AA
         DB    $59
         DB    $AB
         DB    $59
         DB    $AC
         DB    $59
         DB    $AD
         DB    $59
         DB    $AE
         DB    $59
         DB    $AF
         DB    $59
         DB    $B0
         DB    $59
         DB    $B1
         DB    $59
         DB    $B2
         DB    $59
         DB    $B3
         DB    $59
         DB    $AA
         DB    $5A
         DB    $AB
         DB    $5A
         DB    $AC
         DB    $5A
         DB    $AD
         DB    $5A
         DB    $AE
         DB    $5A
         DB    $AF
         DB    $5A
         DB    $B0
         DB    $5A
         DB    $B1
         DB    $5A
         DB    $B2
         DB    $5A
         DB    $B3
         DB    $5A
         DB    $AB
         DB    $5B
         DB    $AC
         DB    $5B
         DB    $AD
         DB    $5B
         DB    $AE
         DB    $5B
         DB    $AF
         DB    $5B
         DB    $B0
         DB    $5B
         DB    $B1
         DB    $5B
         DB    $B2
         DB    $5B
         DB    $AC
         DB    $5C
         DB    $AD
         DB    $5C
         DB    $AE
         DB    $5C
         DB    $AF
         DB    $5C
         DB    $B0
         DB    $5C
         DB    $B1
         DB    $5C
         DB    $49
         DB    $68
         DB    $54
         DB    $69
         DB    $53
         DB    $6A
         DB    $53
         DB    $6B
         DB    $53
         DB    $6C
         DB    $54
         DB    $68
         DB    $55
         DB    $69
         DB    $56
         DB    $6A
         DB    $56
         DB    $6B
         DB    $56
         DB    $6C
         DB    $57
         DB    $6C
         DB    $58
         DB    $6B
         DB    $59
         DB    $6A
         DB    $59
         DB    $69
         DB    $59
         DB    $68
         DB    $58
         DB    $6F
         DB    $53
         DB    $70
         DB    $53
         DB    $71
         DB    $53
         DB    $72
         DB    $54
         DB    $72
         DB    $55
         DB    $71
         DB    $56
         DB    $70
         DB    $56
         DB    $6F
         DB    $56
         DB    $6F
         DB    $54
         DB    $6F
         DB    $55
         DB    $6F
         DB    $56
         DB    $6F
         DB    $57
         DB    $6F
         DB    $58
         DB    $6F
         DB    $59
         DB    $77
         DB    $53
         DB    $76
         DB    $54
         DB    $78
         DB    $54
         DB    $75
         DB    $55
         DB    $79
         DB    $55
         DB    $75
         DB    $56
         DB    $79
         DB    $56
         DB    $75
         DB    $57
         DB    $76
         DB    $57
         DB    $77
         DB    $57
         DB    $78
         DB    $57
         DB    $79
         DB    $57
         DB    $75
         DB    $58
         DB    $79
         DB    $58
         DB    $75
         DB    $59
         DB    $79
         DB    $59
         DB    $7C
         DB    $54
         DB    $7D
         DB    $53
         DB    $7E
         DB    $53
         DB    $7F
         DB    $53
         DB    $80
         DB    $54
         DB    $7C
         DB    $55
         DB    $7C
         DB    $56
         DB    $7C
         DB    $57
         DB    $7C
         DB    $58
         DB    $7D
         DB    $59
         DB    $7E
         DB    $59
         DB    $7F
         DB    $59
         DB    $80
         DB    $58
         DB    $83
         DB    $53
         DB    $83
         DB    $54
         DB    $83
         DB    $55
         DB    $83
         DB    $56
         DB    $83
         DB    $57
         DB    $83
         DB    $58
         DB    $83
         DB    $59
         DB    $84
         DB    $53
         DB    $85
         DB    $53
         DB    $86
         DB    $53
         DB    $84
         DB    $56
         DB    $85
         DB    $56
         DB    $84
         DB    $59
         DB    $85
         DB    $59
         DB    $86
         DB    $59
LE2A5    DB    $9B
         DB    $B1
         DB    $B2
         DB    $B3
         DB    $B4
         DB    $B5
         DB    $B6
         DB    $B7
         DB    $B8
         DB    $B9
         DB    $B0
         DB    $AD
         DB    $BD
         DB    $FF
         DB    $89
         DB    $D1
         DB    $D7
         DB    $C5
         DB    $D2
         DB    $D4
         DB    $D9
         DB    $D5
         DB    $C9
         DB    $CF
         DB    $D0
         DB    $DB
         DB    $DD
         DB    $DC
         DB    $C1
         DB    $D3
         DB    $C4
         DB    $C6
         DB    $C7
         DB    $C8
         DB    $CA
         DB    $CB
         DB    $CC
         DB    $BB
         DB    $A7
         DB    $8D
         DB    $DA
         DB    $D8
         DB    $C3
         DB    $D6
         DB    $C2
         DB    $CE
         DB    $CD
         DB    $AC
         DB    $AE
         DB    $BF
         DB    $FE
         DB    $88
         DB    $95
         DB    $8A
         DB    $8B
         DB    $A0
LE2DD    DB    $76
         DB    $D8
         DB    $B3
         DB    $D8
         DB    $CC
         DB    $D8
         DB    $E5
         DB    $D8
         DB    $00
         DB    $D9
         DB    $1D
         DB    $D9
         DB    $3C
         DB    $D9
         DB    $5F
         DB    $D9
         DB    $76
         DB    $D9
         DB    $99
         DB    $D9
         DB    $B8
         DB    $D9
         DB    $DD
         DB    $D9
         DB    $EC
         DB    $D9
         DB    $05
         DB    $DA
         DB    $76
         DB    $DA
         DB    $AD
         DB    $DA
         DB    $D0
         DB    $DA
         DB    $F5
         DB    $DA
         DB    $14
         DB    $DB
         DB    $39
         DB    $DB
         DB    $50
         DB    $DB
         DB    $65
         DB    $DB
         DB    $84
         DB    $DB
         DB    $93
         DB    $DB
         DB    $B8
         DB    $DB
         DB    $D3
         DB    $DB
         DB    $EA
         DB    $DB
         DB    $01
         DB    $DC
         DB    $8D
         DB    $DC
         DB    $AE
         DB    $DC
         DB    $CD
         DB    $DC
         DB    $F6
         DB    $DC
         DB    $0F
         DB    $DD
         DB    $2A
         DB    $DD
         DB    $4D
         DB    $DD
         DB    $62
         DB    $DD
         DB    $7F
         DB    $DD
         DB    $96
         DB    $DD
         DB    $9F
         DB    $DD
         DB    $A6
         DB    $DD
         DB    $6A
         DB    $DE
         DB    $89
         DB    $DE
         DB    $A4
         DB    $DE
         DB    $BF
         DB    $DE
         DB    $DC
         DB    $DE
         DB    $05
         DB    $DF
         DB    $28
         DB    $DF
         DB    $4D
         DB    $DF
         DB    $54
         DB    $DF
         DB    $57
         DB    $DF
         DB    $40
         DB    $E0
         DB    $55
         DB    $E0
         DB    $70
         DB    $E0
         DB    $8B
         DB    $E0
         DB    $A6
         DB    $E0
         DB    $12
         DB    $E2
         DB    $0E
         DB    $E1
         DB    $5B
         DB    $E1
         DB    $15
         DB    $DE
         DB    $6A
         DB    $DF
         DB    $C1
         DB    $DF
         DB    $C1
         DB    $E0
         DB    $0E
         DB    $DC

*---------------------------------------------------------
*
* Command: C - Character set test
*
*---------------------------------------------------------

CHRTST   JSR   HOME
         LDA   #$28
         STA   $08
         LDA   #$41
         STA   $07
         LDX   #$00
PL1      LDA   L1MSG,X
         BEQ   CL1
         JSR   COUT
         INX
         BNE   PL1
CL1      JSR   CROUT
         LDX   #$00
CHR      TXA
         JSR   COUT
         INX
         DEC   $07
         BEQ   LE389
         DEC   $08
         BNE   CHR
         DEC   $07
         BNE   CHR
LE389    JSR   CROUT
         LDA   #$28
         STA   $08
         LDA   #$41
         STA   $07
         LDX   #$00
LE396    LDA   L2MSG,X
         BEQ   LE3A1
         JSR   COUT
         INX
         BNE   LE396
LE3A1    JSR   CROUT
         LDX   #$40
LE3A6    TXA
         JSR   COUT
         INX
         DEC   $07
         BEQ   LE3B7
         DEC   $08
         BNE   LE3A6
         DEC   $07
         BNE   LE3A6
LE3B7    JSR   CROUT
         LDA   #$28
         STA   $08
         LDA   #$20
         STA   $07
         LDX   #$00
LE3C4    LDA   L3MSG,X
         BEQ   LE3CF
         JSR   COUT
         INX
         BNE   LE3C4
LE3CF    JSR   CROUT
         LDX   #$C0
LE3D4    TXA
         JSR   COUT
         INX
         DEC   $07
         BEQ   LE3E5
         DEC   $08
         BNE   LE3D4
         DEC   $07
         BNE   LE3D4
LE3E5    LDA   #$20
         STA   $07
         LDX   #$A0
LE3EB    TXA
         JSR   COUT
         INX
         DEC   $07
         BNE   LE3EB
         JSR   CROUT
         LDA   #$28
         STA   $08
         LDA   #$40
         STA   $07
         LDX   #$00
LE401    LDA   L4MSG,X
         BEQ   LE40C
         JSR   COUT
         INX
         BNE   LE401
LE40C    JSR   CROUT
         LDA   #$A0
         JSR   COUT
         JSR   COUT
         JSR   COUT
         JSR   COUT
         LDX   #$E1
LE41F    TXA
         JSR   COUT
         INX
         BEQ   LE431
         DEC   $08
         BNE   LE41F
         DEC   $07
         BNE   LE41F
         JMP   LE41F

LE431    LDX   #$00
LE433    LDA   PRESSSPC,X
         BEQ   LE43E
         JSR   COUT
         INX
         BNE   LE433
LE43E    LDA   KBD
         CMP   #$A0
         BNE   LE43E
         BIT   KBDSTROBE
         JMP   TSTS

LE44B    LDA   KBD
         CMP   #$A0
         BNE   LE45B
         LDY   #$00
         LDA   #$08
         STA   (ROMCTRL),Y
         JMP   INI
LE45B    RTS

DELAY    DEX
         BNE   DELAY
         DEY
         BNE   DELAY
DLY      DEX
         BNE   DLY
         RTS

PAUSE    JSR   DELAY
         JSR   DELAY
         JSR   DELAY
         JSR   DELAY
         JSR   DELAY
         RTS

*---------------------------------------------------------
*
* Command: R - Read only memory test (aka DO CX)
*
*---------------------------------------------------------

ROMTST   LDA   #<L849B
         STA   $02
         LDA   #>L849B
         STA   $03
         LDA   #>LE49B
         STA   $05
         LDA   #<LE49B
         STA   $04
         LDX   #$02
         LDY   #$00
LE48A    LDA   ($04),Y
         STA   ($02),Y
         INY
         BNE   LE48A
         INC   $05
         INC   $03
         DEX
         BNE   LE48A
         JMP   L849B

*
* Code is relocated at $849B
*

LE49B    =	*
         org   L849B
         
         LDA   #$10
         LDY   #$00
         STA   (ROMCTRL),Y
         STA   SETINTCXROM
         LDA   #>LC100
         STA   $03
         LDA   #<LC100
         STA   $02
         TAY
LE4AD    CLC
         ADC   ($02),Y
         INY
         BNE   LE4AD
         INC   $03
         LDX   $03
         CPX   #>CXCHKSUM
         BNE   LE4BE
         INY
         BNE   LE4AD
LE4BE    CPX   #>LE000
         BEQ   LE4C4
         BNE   LE4AD
LE4C4    CMP   CXCHKSUM
         BEQ   LE4E5
         LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         LDX   #$00
LE4D1    LDA   CXBADMSG,X
         BEQ   LE4DC
         JSR   COUT
         INX
         BNE   LE4D1
LE4DC    JSR   BELL
         JSR   BELL
LE4E2    JMP   LE4E2

LE4E5    LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         LDA   LOOPFLG
         BEQ   LE4FC
         LDX   #$00
LE4F1    LDA   CXOKMSG,X
         BEQ   LE4FC
         JSR   COUT
         INX
         BNE   LE4F1
LE4FC    LDA   #$10
         LDY   #$00
         STA   (ROMCTRL),Y
         LDY   #$00
         TYA
LE505    CLC
         ADC   ($02),Y
         INY
         BEQ   LE516
         CPY   #$FF
         BNE   LE505
         LDX   $03
         CPX   #>LF800-1
         BNE   LE505
         INY
LE516    INC   $03
         BNE   LE505
         CMP   LF7FF
         BEQ   LE53B
         LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         LDX   #$00
LE527    LDA   FXBADMSG,X
         BEQ   LE532
         JSR   COUT
         INX
         BNE   LE527
LE532    JSR   BELL
         JSR   BELL
LE538    JMP   LE538

LE53B    STA   SETSLOTCXROM
         LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         LDA   #$01
         STA   ROMFLG
         LDA   LOOPFLG
         BEQ   LE57D
         LDX   #$00
LE54E    LDA   FXOKMSG,X
         BEQ   LE559
         JSR   COUT
         INX
         BNE   LE54E

LE559    LDA   LOOPFLG
         BEQ   LE574
         LDX   #$00
LE55F    LDA   LPMSG,X
         BEQ   LE56A
         JSR   COUT
         INX
         BNE   LE55F
LE56A    LDA   $0B
         JSR   PRBYTE
         LDA   $0A
         JSR   PRBYTE
LE574    JSR   PAUSE
         JSR   LE44B
         JMP   RAMTST
LE57D    JMP   TSTS

*
* End of relocated code
*

*---------------------------------------------------------
*
* Command: P - Processor test
*
*---------------------------------------------------------

         org	$E580

CPUTST   LDX   #$00
         TXA
         CMP   #$00
         BEQ   LE58A
         JMP   LE877

LE58A    LDA   #$00
         ADC   #$80
         ADC   #$80
         CMP   #$01
         BEQ   LE597
         JMP   LE877

LE597    LDY   #$FF
         TYA
         CMP   #$FF
         BEQ   LE5A1
         JMP   LE877

LE5A1    LDA   |L0000,Y
         STA   |L0000,Y
         CMP   |L0000,Y
         BEQ   LE5AF
         JMP   LE877

LE5AF    LDA   #$00
         SBC   #$80
         CMP   #$80
         BEQ   LE5BA
         JMP   LE877

LE5BA    LDA   #$00
         ROL
         CMP   #$01
         BEQ   LE5C4
         JMP   LE877

LE5C4    LDA   #$00
         STA   $00
         INC   $00
         LDA   $00
         CMP   #$01
         BEQ   LE5D3
         JMP   LE877

LE5D3    LDA   #$00
         ROR
         CMP   #$80
         BEQ   LE5DD
         JMP   LE877

LE5DD    LDA   #$00
         CLC
         ADC   #$80
         ADC   #$80
         CMP   #$00
         BEQ   LE5EB
         JMP   LE877

LE5EB    LDA   #$01
         ASL
         CMP   #$02
         BEQ   LE5F5
         JMP   LE877

LE5F5    LDA   #$02
         LSR
         CMP   #$01
         BEQ   LE5FF
         JMP   LE877

LE5FF    LDA   #$01
         BNE   LE606
         JMP   LE877

LE606    LDA   #$00
         PHP
         LDA   #$80
         PLP
         BEQ   LE611
         JMP   LE877

LE611    LDA   #$FF
         AND   #$08
         CMP   #$08
         BEQ   LE61C
         JMP   LE877

LE61C    LDA   #$08
         STA   $00
         LDA   #$FF
         AND   $00
         CMP   #$08
         BEQ   LE62B
         JMP   LE877

LE62B    SEC
         BCS   LE631
         JMP   LE877

LE631    CLC
         BCC   LE637
         JMP   LE877

LE637    LDX   #$00
         INX
         CPX   #$01
         BEQ   LE641
         JMP   LE877

LE641    LDY   #$00
         INY
         CPY   #$01
         BEQ   LE64B
         JMP   LE877

LE64B    LDA   #$10
         TAY
         CPY   #$10
         BEQ   LE655
         JMP   LE877

LE655    LDA   #$20
         TAX
         CPX   #$20
         BEQ   LE65F
         JMP   LE877

LE65F    LDY   #$00
         STY   $00
         LDX   $00
         CPX   #$00
         BEQ   LE66C
         JMP   LE877

LE66C    LDX   #$01
         STX   $00
         LDY   $00
         CPY   #$01
         BEQ   LE679
         JMP   LE877

LE679    LDA   #$22
         STA   $00
         LDX   #$23
         DEX
         CPX   $00
         BEQ   LE687
         JMP   LE877

LE687    LDA   #$23
         STA   $00
         LDY   #$24
         DEY
         CMP   $00
         BEQ   LE695
         JMP   LE877

LE695    LDA   #$09
         STA   $07
         SED
         CLC
         LDA   $07
         ADC   #$01
         STA   $07
         CLD
         LDA   $07
         CMP   #$10
         BEQ   LE6AB
         JMP   LE877

LE6AB    LDA   #$55
         STA   $07
         LDA   #$AA
         EOR   $07
         CMP   #$FF
         BEQ   LE6BA
         JMP   LE877

LE6BA    LDA   #$00
         ORA   #$F0
         CMP   #$F0
         BEQ   LE6C5
         JMP   LE877

LE6C5    LDA   #$00
         CLC
         SBC   #$01
         BMI   LE6CF
         JMP   LE877

LE6CF    LDX   #$40
         STX   $07
         BIT   $07
         BVS   LE6DA
         JMP   LE877

LE6DA    LDX   #$40
         STX   $07
         ASL   $07
         BIT   $07
         BVC   LE6E7
         JMP   LE877

LE6E7    SEI
         PHP
         PLA
         AND   #$04
         BNE   LE6F1
         JMP   LE877

LE6F1    CLI
         PHP
         PLA
         AND   #$04
         BEQ   LE6FB
         JMP   LE877

LE6FB    LDA   #<L8720
         STA   $02
         LDA   #>L8720
         STA   $03
         LDA   #<LE720
         STA   $05
         LDA   #>LE720
         STA   $04
         LDX   #$02
         LDY   #$00
LE70F    LDA   ($04),Y
         STA   ($02),Y
         INY
         BNE   LE70F
         INC   $05
         INC   $03
         DEX
         BNE   LE70F
         JMP   L8720

*
* Code is relocated at $8720
*

LE720    =	*
         org	L8720
         
         LDX   #$00
         STA   SETSLOTCXROM
         STA   SETINTC3ROM
LE728    LDA   MMUADR,X
         EOR   LE88D,X
         BPL   LE732
         BMI   LE78A
LE732    INX
         CPX   #$08
         BNE   LE728
         STA   LCBANK1
         BIT   RDLCBNK2
         STA   ROMIN2
         BPL   LE744
         BMI   LE78A
LE744    INX
         STA   RDBANK2
         BIT   RDLCRAM
         STA   RDROM2
         BMI   LE752
         BPL   LE78A
LE752    INX
         STA   WRCARDRAM
         BIT   RDRAMWRT
         STA   WRMAINRAM
         BMI   LE760
         BPL   LE78A
LE760    INX
         STA   SETALTZP
         BIT   RDALTZP
         STA   SETSTDZP
         BMI   LE76E
         BPL   LE78A
LE76E    INX
         STA   SETSLOTC3ROM
         BIT   RDC3ROM
         STA   SETINTC3ROM
         BMI   LE77C
         BPL   LE78A
LE77C    INX
         STA   SET80COL
         BIT   RD80COL
         STA   KBD
         BMI   LE7A9
         BPL   LE78A
LE78A    LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         STA   SETSLOTCXROM
         JSR   BELL
         JSR   BELL
         LDX   #$00
LE79B    LDA   MMUBAD,X
         BEQ   LE7A6
         JSR   COUT
         INX
         BNE   LE79B
LE7A6    JMP   LE7A6

LE7A9    LDX   #$00
LE7AB    LDA   IOUADDR,X
         EOR   LE896,X
         BPL   LE7B5
         BMI   LE80B
LE7B5    INX
         CPX   #$06
         BNE   LE7AB
         STA   SET80VID
         BIT   RD80VID
         STA   CLR80VID
         BMI   LE7C7
         BPL   LE80B
LE7C7    INX
         STA   SETALTCHAR
         BIT   ALTCHARSET
         STA   CLRALTCHAR
         BMI   LE7D5
         BPL   LE80B
LE7D5    INX
         STA   TXTCLR
         BIT   RDTEXT
         STA   TXTSET
         BPL   LE7E3
         BMI   LE80B
LE7E3    INX
         STA   TXTPAGE2
         BIT   RDPAGE2
         STA   TXTPAGE1
         BMI   LE7F1
         BPL   LE80B
LE7F1    INX
         STA   MIXSET
         BIT   RDMIX
         STA   MIXCLR
         BMI   LE7FF
         BPL   LE80B
LE7FF    INX
         STA   HIRES
         BIT   RDHIRES
         STA   LORES
         BMI   LE82A
         
LE80B    LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         STA   SETSLOTCXROM
         JSR   BELL
         JSR   BELL
         LDX   #$00
LE81C    LDA   IOUBAD,X
         BEQ   LE827
         JSR   COUT
         INX
         BNE   LE81C
LE827    JMP   LE827	; Infinite loop

LE82A    LDA   #$08
         STA   SETSLOTCXROM
         LDY   #$00
         STA   (ROMCTRL),Y
         LDA   #$01
         STA   CPUFLG
         LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y

         LDA   LOOPFLG
         BEQ   LE874
         JSR   HOME
         LDX   #$00
LE846    LDA   CPUOK,X
         BEQ   LE851
         JSR   COUT
         INX
         BNE   LE846
LE851    LDX   #$00
LE853    LDA   MMUOK,X
         BEQ   LE85E
         JSR   COUT
         INX
         BNE   LE853
LE85E    LDX   #$00
LE860    LDA   IOUOK,X
         BEQ   LE86B
         JSR   COUT
         INX
         BNE   LE860
LE86B    LDA   #$08
         LDY   #$00
         STA   (ROMCTRL),Y
         STA   SETSLOTCXROM
LE874    JMP   TST0

LE877    JSR   BELL
         JSR   BELL
         LDX   #$00
LE87F    LDA   CPUBAD,X
         BEQ   LE88A
         JSR   COUT
         INX
         BNE   LE87F
LE88A    JMP   LE88A	; Infinite loop

*
* End of relocated code
*

*---------------------------------------------------------
*
* All data for the program
*
*---------------------------------------------------------

         org	$E88D

LE88D    DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $80
LE896    DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

CXBADMSG ASC   8D8D
         ASC   "ROM AT MOTHER BOARD LOCATION D8 IS BAD"8D
         ASC   00
FXBADMSG ASC   8D8D
         ASC   "ROM AT MOTHER BOARD LOCATION D10 IS BAD"8D
         ASC   00
CXOKMSG  ASC   8D8D
         ASC   " ROM AT MOTHER BOARD LOCATION D8 IS OK"00
FXOKMSG  ASC   8D8D
         ASC   " ROM AT MOTHER BOARD LOCATION D10 IS OK"00
L1MSG    ASC   8D
         ASC   "   THESE TWO LINES SHOULD BE INVERSE"00
L2MSG    ASC   8D8D
         ASC   "   THESE TWO LINES SHOULD BE FLASHING"00
L3MSG    ASC   8D8D
         ASC   "   THESE TWO LINES SHOULD BE NORMAL"00
L4MSG    ASC   8D8D
         ASC   "     THIS LINE SHOULD BE LOWER CASE"00
PRESSSPC ASC   8D8D8D
         ASC   "     PRESS SPACE BAR TO CONTINUE"8D
         ASC   00
KMSG     ASC   8D
         ASC   "** APPLE ][e KEYBOARD TEST PROGRAM **"8D
         ASC   " ALARM WILL SOUND AND CORRESPONDING"8D
         ASC   "CHARACTER WILL FLICKER IF KEY BOUNCES"8D
         ASC   "   CONTROL 'C' WILL EXIT THIS TEST"00
LRMSG    ASC   8D
         ASC   "  MATCH LOW RESOLUTION CHARACTERS"8D
         ASC   "  WITH THOSE ON LORES SYMBOL TABLES"8D
         ASC   "     PRESS SPACE BAR TO CONTINUE"8D
         ASC   00
CTAMSG   ASC   "CURRENTLY TESTING MEMORY AT $D000-$FFFF"00
LPMSG    ASC   8D8D
         ASC   " LOOP #"00
SPFMSG   ASC   8D
         ASC   "SUSPECTED FAILURE AT LOCATION F"00
HELLO    ASC   "   APPLE ][e DIAGNOSTICS"8D
         ASC   "   1983 APPLE COMPUTER INC"8D8D
         ASC   "   Enter the Letter of"8D
         ASC   "    the Desired Test"8D8D
         ASC   "<P>  PROCESSOR TEST"8D
         ASC   "<R>  READ ONLY MEMORY TEST"8D
         ASC   "<M>  RANDOM ACCESS MEMORY TEST"8D
         ASC   "<C>  CHARACTER SET TEST"8D
         ASC   "<K>  KEYBOARD TEST"8D
         ASC   "<V>  VIDEO TESTS"00
HELLO2   ASC   8D
         ASC   "<L>  LOOP ROM RAM AND PROCESSOR TESTS"8D
         ASC   "<S>  SPEAKER TEST"
ESPACE   ASC   8D8D
         ASC   "SPACE BAR TO RETURN TO MENU"8D
         ASC   00
TMSG     ASC   8D
         ASC   "      SPEAKER TEST PLAYS 5 TONES"8D
         ASC   "          INCREMENTING FROM"8D
         ASC   "          LOW TO HIGH PITCH"00
CPUOK    ASC   8D
         ASC   " MICROPROCESSOR IS OK"00
CPUBAD   ASC   8D8D
         ASC   "   >MICROPROCESSOR IS BAD<"00
IOUBAD   ASC   8D
         ASC   "   >INPUT/OUTPUT UNIT ERROR<"00
MMUBAD   ASC   8D
         ASC   "   >MEMORY MANAGEMENT UNIT ERROR<"00
MMUOK    ASC   8D
         ASC   " MEMORY MANAGEMENT UNIT IS OK"00
IOUOK    ASC   8D
         ASC   " INPUT/OUTPUT UNIT IS OK"00
RAMOK    ASC   8D8D
         ASC   " RANDOM ACCESS MEMORY IS OK"00
BADRAM   ASC   8D
         ASC   ">RANDOM ACCESS MEMORY FAILED TESTS<"8D00
LRP2     ASC   "  LOW RESOLUTION GRAPHICS-PAGE TWO"00

*
* This is the place of the RAM chips on the mother board
*

BITMAP   DB    $00
         DB    $06
         DB    $07
         DB    $08
         DB    $09
         DB    $10
         DB    $11
         DB    $12
         DB    $13

NOCARDMSG    ASC   " CAN'T FIND THE ROM CARD !"8D00

*---------------------------------------------------------
*
* Some code
*
*---------------------------------------------------------

LEE2A    BIT   TXTPAGE2
         BIT   MIXCLR
         LDA   #$40
         BNE   LEE3C
LEE34    LDA   #$20
         BIT   TXTPAGE1
         BIT   MIXSET
LEE3C    STA   $E6
         LDA   HIRES
         LDA   TXTCLR
         LDA   #$00
         STA   $1C
         LDA   $E6
         STA   $1B
         LDY   #$00
         STY   $1A
LEE50    LDA   $1C
         STA   ($1A),Y
         JSR   LEED0
         INY
         BNE   LEE50
         INC   $1B
         LDA   $1B
         AND   #$1F
         BNE   LEE50
         RTS

LEE63    STA   $E2
         STX   $E0
         STY   $E1
         PHA
         AND   #$C0
         STA   $26
         LSR
         LSR
         ORA   $26
         STA   $26
         PLA
         STA   $27
         ASL
         ASL
         ASL
         ROL   $27
         ASL
         ROL   $27
         ASL
         ROR   $26
         LDA   $27
         AND   #$1F
         ORA   $E6
         STA   $27
         TXA
         CPY   #$00
         BEQ   LEE94
         LDY   #$23
         ADC   #$04
LEE93    INY
LEE94    SBC   #$07
         BCS   LEE93
         STY   $E5
         TAX
         LDA   LF004-$F9,X	; Probably $F004 - TBV
         STA   $30
         TYA
         LSR
         LDA   $E4
         STA   $1C
         BCS   LEED0
         RTS

LEEA9    JSR   LEE63
         LDA   $1C
         EOR   ($26),Y
         AND   $30
         EOR   ($26),Y
         STA   ($26),Y
         RTS

LEEB7    BPL   LEEDC
         LDA   $30
         LSR
         BCS   LEEC3
         EOR   #$C0
LEEC0    STA   $30
         RTS

LEEC3    DEY
         BPL   LEEC8
         LDY   #$27
LEEC8    LDA   #$C0
LEECA    STA   $30
         STY   $E5
         LDA   $1C
LEED0    ASL
         CMP   #$C0
         BPL   LEEDB
         LDA   $1C
         EOR   #$7F
         STA   $1C
LEEDB    RTS

LEEDC    LDA   $30
         ASL
         EOR   #$80
         BMI   LEEC0
         LDA   #$81
         INY
         CPY   #$28
         BCC   LEECA
         LDY   #$00
         BCS   LEECA
         CLC
         LDA   $D1
         AND   #$04
         BEQ   LEF1A
         LDA   #$7F
         AND   $30
         AND   ($26),Y
         BNE   LEF16
         INC   $EA
         LDA   #$7F
         AND   $30
         BPL   LEF16
         CLC
         LDA   $D1
         AND   #$04
LEF0A    BEQ   LEF1A
         LDA   ($26),Y
         EOR   $1C
         AND   $30
         BNE   LEF16
         INC   $EA
LEF16    EOR   ($26),Y
         STA   ($26),Y
LEF1A    LDA   $D1
         ADC   $D3
LEF1E    AND   #$03
         CMP   #$02
         ROR
         BCS   LEEB7
LEF25    BMI   LEF57
         CLC
         LDA   $27
         BIT   LF00B
         BNE   LEF51
         ASL   $26
         BCS   LEF4D
         BIT   LEF1E+1	; in ROM?
         BEQ   LEF3D
         ADC   #$1F
         SEC
         BCS   LEF4F
LEF3D    ADC   #$23
         PHA
         LDA   $26
         ADC   #$B0
         BCS   LEF48
         ADC   #$F0
LEF48    STA   $26
         PLA
         BCS   LEF4F
LEF4D    ADC   #$1F
LEF4F    ROR   $26
LEF51    ADC   #$FC
LEF53    STA   $27
         RTS

LEF56    CLC
LEF57    LDA   $27
LEF59    ADC   #$04
         BIT   LF00B
         BNE   LEF53
         ASL   $26
         BCC   LEF7C
         ADC   #$E0
         CLC
         BIT   LEF59+1	; in ROM?
         BEQ   LEF7E
         LDA   $26
         ADC   #$50
         EOR   #$F0
         BEQ   LEF76
         EOR   #$F0
LEF76    STA   $26
         LDA   $E6
         BCC   LEF7E
LEF7C    ADC   #$E0
LEF7E    ROR   $26
         BCC   LEF53
         PHA
         LDA   #$00
         STA   $E0
         STA   $E1
         STA   $E2
         PLA
LEF8C    PHA
         SEC
         SBC   $E0
         PHA
         TXA
         SBC   $E1
         STA   $D3
         BCS   LEFA2
         PLA
         EOR   #$FF
         ADC   #$01
         PHA
         LDA   #$00
         SBC   $D3
LEFA2    STA   $D1
         STA   $D5
         PLA
         STA   $D0
         STA   $D4
         PLA
         STA   $E0
         STX   $E1
         TYA
         CLC
         SBC   $E2
         BCC   LEFBA
         EOR   #$FF
         ADC   #$FE
LEFBA    STA   $D2
         STY   $E2
         ROR   $D3
         SEC
         SBC   $D0
         TAX
         LDA   #$FF
         SBC   $D1
         STA   $1D
         LDY   $E5
         BCS   LEFD3
LEFCE    ASL
         JSR   LEEB7
         SEC
LEFD3    LDA   $D4
         ADC   $D2
         STA   $D4
         LDA   $D5
         SBC   #$00
LEFDD    STA   $D5
         LDA   ($26),Y
         EOR   $1C
         AND   $30
         EOR   ($26),Y
         STA   ($26),Y
         INX
         BNE   LEFF0
         INC   $1D
         BEQ   LF052
LEFF0    LDA   $D3
         BCS   LEFCE
         JSR   LEF25
         CLC
         LDA   $D4
         ADC   $D0
         STA   $D4
         LDA   $D5
         ADC   $D1
         BVC   LEFDD

LF004    DB    $81
         DB    $82
         DB    $84
         DB    $88
         DB    $90
         DB    $A0
         DB    $C0
LF00B    DB    $1C
         DB    $FF
         DB    $FE
         DB    $4C
         DB    $EF
         DB    $EC
         DB    $E1
         DB    $D4
         DB    $C5
         DB    $B4
         DB    $A1
         DB    $8D
         DB    $78
         DB    $61
         DB    $49
         DB    $31
         DB    $18
         DB    $FF

LF01D    LDA   $26
         ASL
         LDA   $27
         AND   #$03
         ROL
         ORA   $26
         ASL
         ASL
         ASL
         STA   $E2
         LDA   $27
         LSR
         LSR
         AND   #$07
         ORA   $E2
         STA   $E2
         LDA   $E5
         ASL
         ADC   $E5
         ASL
         TAX
         DEX
         LDA   $30
         AND   #$7F
LF042    INX
         LSR
         BNE   LF042
         STA   $E1
         TXA
         CLC
         ADC   $E5
         BCC   LF050
         INC   $E1
LF050    STA   $E0
LF052    RTS

*---------------------------------------------------------
*
* Fill until $F7FE (because there's a byte at $F7FF)
*
*---------------------------------------------------------

         ds    \	; ..$F0FF
         ds	256	; ..$F1FF
         ds	256	; ..$F2FF
         ds	256	; ..$F3FF
         ds	256	; ..$F4FF
         ds	256	; ..$F5FF
         ds	256	; ..$6FFF
         ds	255	; ..$F7FE

LF7FF    DB    $C3

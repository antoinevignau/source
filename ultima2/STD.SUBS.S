*
* Ultima II: The Revenge of the Enchanteress
*
* (c) 1982, Sierra On-Line
* (s) 2020, John Disam
*

         TYP   BIN
         ORG   $4000
         MX    %11
         LST   OFF

*----------------------------

SPKR     EQU   $C030
PRNTAX   EQU   $F941
VTAB     EQU   $FC22
RDKEY    EQU   $FD0C
COUT     EQU   $FDED
SETINV   EQU   $FE80
SETNORM  EQU   $FE84

*----------------------------

L4000    SEC
         LDA   $00
         SBC   $4D00,X
         ASL
         ASL
         JSR   L44BD
         STA   $17
         SEC
         LDA   $01
         SBC   $4D20,X
         ASL
         ASL
         JSR   L44BD
         STA   $18
         RTS

L401B    SEC
         LDA   $00
         SBC   $4D00,X
         STA   $17
         SEC
         LDA   $01
         SBC   $4D20,X
         STA   $18
         RTS

L402C    PLA
         STA   $FE
         PLA
         STA   $FF
         LDY   #$00
L4034    INC   $FE
         BNE   L403A
         INC   $FF
L403A    LDA   ($FE),Y
         BEQ   L4046
         ORA   #$80
         JSR   COUT
         JMP   L4034

L4046    LDA   $FF
         PHA
         LDA   $FE
         PHA
         RTS

L404D    LDA   #$20
         STA   $FD
         LDA   #$00
         STA   $FC
L4055    LDY   #$00
L4057    LDA   ($FC),Y
         EOR   #$FF
         STA   ($FC),Y
         DEY
         BNE   L4057
         INC   $FD
         LDA   $FD
         CMP   #$40
         BCC   L4055
         RTS

L4069    LDA   $4E10
         CMP   #$CD
         BNE   L4079
         JSR   L402C
         ASC   "MALE"00
         RTS

L4079    JSR   L402C
         ASC   "FEMALE"00
         RTS

L4084    LDA   #$00
         STA   $FC
         LDA   #$4E
         STA   $FD
         LDX   #$00
L408E    LDA   ($FC,X)
         BEQ   L409B
         JSR   COUT
         JSR   L40C5
         JMP   L408E
L409B    RTS

L409C    TAY
         LDA   #<L40D3
         STA   $FC
         LDA   #>L40D3
         STA   $FD
         LDX   #$00
L40A7    LDA   ($FC,X)
         BEQ   L40B1
L40AB    JSR   L40C5
         JMP   L40A7

L40B1    DEY
         BEQ   L40B7
         JMP   L40AB

L40B7    JSR   L40C5
         LDA   ($FC,X)
         BEQ   L40C4
         JSR   COUT
         JMP   L40B7
L40C4    RTS

L40C5    LDA   $FC
         CLC
         ADC   #$01
         STA   $FC
         LDA   $FD
         ADC   #$00
         STA   $FD
         RTS

L40D3    ASC   00
         ASC   "IN THE WATER."00
         ASC   "IN A MARSH."00
         ASC   "ON GRASS."00
         ASC   "IN WOODS."00
         ASC   "IN THE MTS."00
         ASC   "NEAR A VILLAGE."00
         ASC   "NEAR A TOWNE."00
         ASC   "NEAR A TOWER."00
         ASC   "NEAR A CASTLE."00
         ASC   "NEAR A DUNGEON."00
         ASC   "NEAR A SIGN."00
         ASC   "NEAR A HORSE."00
         ASC   "NEAR A FRIGATE."00
         ASC   "NEAR A PLANE."00
         ASC   "NEAR A ROCKET."00
         ASC   "NEAR ARMOUR."00
         ASC   "NEAR A HOLE."00
         ASC   "ON COBBLE."00
         ASC   "HANDS"00
         ASC   "DAGGER"00
         ASC   "MACE"00
         ASC   "AXE"00
         ASC   "BOW"00
         ASC   "SWORD"00
         ASC   "GREAT SWORD"00
         ASC   "LIGHT SWORD"00
         ASC   "PHASER"00
         ASC   "QUICK SWORD"00
         ASC   "SKIN"00
         ASC   "CLOTH"00
         ASC   "LEATHER"00
         ASC   "CHAIN"00
         ASC   "PLATE"00
         ASC   "REFLECT"00
         ASC   "POWER"00
         ASC   "NONE"00
         ASC   "LIGHT"00
         ASC   "DOWN LADDER"00
         ASC   "UP LADDER"00
         ASC   "PASSWALL"00
         ASC   "SURFACE"00
         ASC   "PRAYER"00
         ASC   "MAGIC MISSILE"00
         ASC   "BLINK"00
         ASC   "KILL"00
         ASC   "RING"00
         ASC   "WAND"00
         ASC   "STAFF"00
         ASC   "BOOT"8000
         ASC   "CLOAK"00
         ASC   "HELM"00
         ASC   "GEM"00
         ASC   "ANKH"00
         ASC   "RED GEM"00
         ASC   "SKULL KEY"00
         ASC   "GREEN GEM"00
         ASC   "BRASS BUTTON"00
         ASC   "BLUE TASSLE"00
         ASC   "STRANGE COIN"00
         ASC   "GREEN IDOL"00
         ASC   "TRI-LITHIUM"00
         ASC   "STRENGTH"00
         ASC   "AGILITY"00
         ASC   "STAMINA"00
         ASC   "CHARISMA"00
         ASC   "WISDOM"00
         ASC   "     INTEL."00
         ASC   "HUMAN"00
         ASC   "ELF"00
         ASC   "DWARF"00
         ASC   "HOBBIT"00
         ASC   "FIGHTER"00
         ASC   "CLERIC"00
         ASC   "WIZARD"00
         ASC   "THIEF"00
         MX    %11
L437B    LDY   #$00
         LDA   $F5
         STA   $07
         LDA   #$00
         TAY
         LSR   $07
         ROR
         LSR   $07
         ROR
         ADC   $F4
         STA   $06
         CLC
         LDA   $07
         ADC   #$10
         STA   $07
         LDA   ($06),Y
         RTS

L4398    HEX   FF
L4399    LDA   L4398
         BNE   L439F
         RTS

L439F    LDX   #$A0
         TXA
         TAY
L43A3    DEX
         BNE   L43A3
         BIT   SPKR
         DEY
         TYA
         TAX
         BNE   L43A3
         RTS

L43AF    LDA   L4398
         BNE   L43B5
         RTS

L43B5    LDA   #$40
         STA   $FC
         LDA   #$E0
         STA   $FD
L43BD    JSR   L4592
         ORA   $FD
         TAX
L43C3    DEX
         BNE   L43C3
         BIT   SPKR
         DEC   $FD
         LDA   $FD
         CMP   $FC
         BCS   L43BD
         RTS

L43D2    LDA   L4398
         BNE   L43D8
         RTS

L43D8    LDX   #$00
         STA   $FC
L43DC    INX
         BNE   L43DC
         BIT   SPKR
         DEC   $FC
         LDX   $FC
         BNE   L43DC
         RTS

L43E9    LDA   L4398
         BNE   L43EF
         RTS

L43EF    LDA   #$08
         STA   $FC
         LDA   #$00
         STA   $FD
L43F7    JSR   L4592
         ORA   $FD
         TAX
L43FD    DEX
         BNE   L43FD
         BIT   SPKR
         DEC   $FC
         BNE   L43F7
         RTS

L4408    LDA   L4398
         BNE   L440E
         RTS

L440E    LDA   #$FF
         STA   $FC
         LDA   #$00
         STA   $FD
         JMP   L43F7

L4419    LDA   L4398
         BNE   L441F
         RTS

L441F    LDA   #$FF
         STA   $FC
         LDA   #$C0
         STA   $FD
         JMP   L43F7

L442A    LDA   #$80
         STA   $FC
         LDA   #$40
         STA   $FD
         JMP   L4435

L4435    LDA   L4398
         BNE   L443B
         RTS

L443B    LDA   |$00FC     ; NOT ZP
         STA   $44A5
         LDA   #$01
         STA   L44A4
L4446    LDA   |$00FD
L4449    PHA
         LDX   $44A5
L444D    DEX
         BNE   L444D
         BIT   SPKR
         LDX   L44A4
L4456    DEX
         BNE   L4456
         BIT   SPKR
         PLA
         TAX
         DEX
         TXA
         BNE   L4449
         LDA   L44A4
         CLC
         ADC   #$01
         CMP   #$1B
         BEQ   L4475
         STA   L44A4
         DEC   $44A5
         JMP   L4446

L4475    LDA   |$00FD
L4478    PHA
         LDX   $44A5
L447C    DEX
         BNE   L447C
         BIT   SPKR
         LDX   L44A4
L4485    DEX
         BNE   L4485
         BIT   SPKR
         PLA
         TAX
         DEX
         TXA
         BNE   L4478
         LDA   L44A4
         SEC
         SBC   #$01
         CMP   #$01
         BEQ   $44A6
         STA   L44A4
         INC   $44A5
         JMP   L4475

L44A4    HEX   20
         HEX   31
         RTS

L44A7    LDA   #$C0
         STA   $FC
         LDA   #$18
         STA   $FD
         JMP   L4435

         LDA   #$FF
         STA   $FC
         LDA   #$06
         STA   $FD
         JMP   L4435

L44BD    CMP   #$00
         BEQ   L44C8
         BPL   L44C6
         LDA   #$FF
         RTS

L44C6    LDA   #$01
L44C8    RTS

L44C9    CMP   #$00
         BEQ   L44C8
         CMP   #$20
         BCC   L44C6
         LDA   #$FF
         RTS

L44D4    CMP   #$80
         BCC   L44C8
         EOR   #$FF
         CLC
         ADC   #$01
         RTS

L44DE    LDA   #$28
         STA   $21
         LDA   #$1E
         STA   $24
         LDA   #$13
         STA   $25
         JSR   L402C
         ASC   0A
         ASC   "H.P.="00
         LDX   $4E1C
         LDA   $4E1B
         BNE   L44FF
         JSR   SETINV
L44FF    JSR   PRNTAX
         JSR   SETNORM
         LDA   #$1E
         STA   $24
         JSR   L402C
         ASC   0A
         ASC   "FOOD="00
         LDX   $4E1E
         LDA   $4E1D
         BNE   L451E
         JSR   SETINV
L451E    JSR   PRNTAX
         JSR   SETNORM
         LDA   #$1E
         STA   $24
         JSR   L402C
         ASC   0A
         ASC   "EXP.="00
         LDA   $4E20
         LDX   $4E21
         JSR   PRNTAX
         LDA   #$1E
         STA   $24
         JSR   L402C
         ASC   0A
         ASC   "GOLD="00
         LDA   $4E22
         LDX   $4E23
         JSR   PRNTAX
         LDA   #$1E
         STA   $21
         LDX   #$00
         LDY   #$17
         JSR   L458A
         RTS

L455E    JSR   RDKEY
         CMP   #$B0
         BCC   L455E
         CMP   #$BA
         BCS   L455E
         JSR   COUT
         SEC
         SBC   #$B0
         ASL
         ASL
         ASL
         ASL
         STA   $FC
L4575    JSR   RDKEY
         CMP   #$B0
         BCC   L4575
         CMP   #$BA
         BCS   L4575
         JSR   COUT
         SEC
         SBC   #$B0
         CLC
         ADC   $FC
         RTS

L458A    STX   $24
         STY   $25
         JSR   VTAB
         RTS

L4592    LDA   $4E
         ADC   $4F
         LDX   $4F
         STX   $4E
         STA   $4F
         RTS

L459D    LDA   #$6F
         STA   $A2
         LDA   #$7E
         STA   $A0
         LDA   #$00
         STA   $A1
         LDA   $18
         CMP   #$01
         BEQ   L45C1
         CMP   #$FF
         BEQ   L45C9
         LDA   $17
         CMP   #$01
         BEQ   L45D1
         CMP   #$FF
         BEQ   L45D9
         JSR   L45E1
         RTS

L45C1    LDA   #$5F
         STA   $A2
         JSR   L45E1
         RTS

L45C9    LDA   #$7F
         STA   $A2
         JSR   L45E1
         RTS

L45D1    LDA   #$8C
         STA   $A0
         JSR   L45E1
         RTS

L45D9    LDA   #$70
         STA   $A0
         JSR   L45E1
         RTS

L45E1    STA   $AB
         STX   $AC
         STY   $AD
         LDA   $A2
         PHA
         LDX   $A0
         LDY   $9154,X
         STY   $AA
         LDA   $93FD,X
         ASL
         TAX
         LDA   L463B,X
         STA   $A5
         LDA   L463B+1,X
         STA   $A6
         LDX   #$10
         STX   $A8
L4604    LDY   $A2
         LDA   $927D,Y
         STA   $A3
         LDA   $933D,Y
         STA   $A4
         LDX   #$02
         STX   $A9
         LDX   #$00
         LDY   $AA
L4618    LDA   ($A5,X)
         BEQ   L4620
         EOR   ($A3),Y
         STA   ($A3),Y
L4620    INY
         INC   $A5
         BNE   L4627
         INC   $A6
L4627    DEC   $A9
         BPL   L4618
         DEC   $A2
         DEC   $A8
         BNE   L4604
         PLA
         STA   $A2
         LDA   $AB
         LDX   $AC
         LDY   $AD
         RTS

L463B    DA    L4649
         DA    L4649
         DA    L4649
         DA    L4649
         DA    L4649
         DA    L4649
         DA    L4649

L4649    HEX   600300780F007C1F007E3F007E3F007F
         HEX   7F007F7F007F7F007F7F007F7F007F7F
         HEX   007E3F007E3F007C1F00780F00600300

L4679    EOR   #$FF
         STA   $F6
         INC   $F6
         LDA   #$38
         LDA   $F4
         SBC   $F2
         STA   $F6
         BCS   L4696

L4689    EOR   #$FF
         STA   $F6
         INC   $F6
         LDA   #$FF
         STA   $F8
         JMP   L469A

L4696    LDA   #$01
         STA   $F8
L469A    SEC
         LDA   $F5
         SBC   $F3
         STA   $F7
         BCS   L46B0
         EOR   #$FF
         STA   $F7
         INC   $F7
         LDA   #$FF
         STA   $F9
         JMP   L46B4

L46B0    LDA   #$01
         STA   $F9
L46B4    LDA   $F6
         CMP   $F7
         BCS   L46BD
         JMP   L46E8

L46BD    LDA   $F6
         STA   $FA
         LSR
         STA   $FB
L46C4    CLC
         LDA   $FB
         ADC   $F7
         STA   $FB
         SEC
         SBC   $F6
         BCC   L46D9
         STA   $FB
         CLC
         LDA   $F3
         ADC   $F9
         STA   $F3
L46D9    CLC
         LDA   $F2
         ADC   $F8
         STA   $F2
         JSR   L4713
         DEC   $FA
         BNE   L46C4
         RTS

L46E8    LDA   $F7
         STA   $FA
         LSR
         STA   $FB
L46EF    CLC
         LDA   $FB
         ADC   $F6
         STA   $FB
         SEC
         SBC   $F7
         BCC   L4704
         STA   $FB
         CLC
         LDA   $F2
         ADC   $F8
         STA   $F2
L4704    CLC
         LDA   $F3
         ADC   $F9
         STA   $F3
         JSR   L4713
         DEC   $FA
         BNE   L46EF
         RTS

L4713    LDY   $F1
         LDA   L472C,Y
         STA   $FE
         LDA   L47EC,Y
         STA   $FF
         LDX   $F0
         LDY   L48AC,X
         LDA   L49CB,X
         ORA   ($FE),Y
         STA   ($FE),Y
         RTS

* HGR table

L472C    HEX   00000000000000008080808080808080
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

L47EC    HEX   2024282C3034383C2024282C3034383C
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

* Pointer tables of more than 256 entries...

L48AC    HEX   00000000000000010101010101010202
         HEX   02020202020303030303030304040404
         HEX   04040405050505050505060606060606
         HEX   06070707070707070808080808080809
         HEX   0909090909090A0A0A0A0A0A0A0B0B0B
         HEX   0B0B0B0B0C0C0C0C0C0C0C0D0D0D0D0D
         HEX   0D0D0E0E0E0E0E0E0E0F0F0F0F0F0F0F
         HEX   10101010101010111111111111111212
         HEX   12121212121313131313131314141414
         HEX   14141415151515151515161616161616
         HEX   16171717171717171818181818181819
         HEX   1919191919191A1A1A1A1A1A1A1B1B1B
         HEX   1B1B1B1B1C1C1C1C1C1C1C1D1D1D1D1D
         HEX   1D1D1E1E1E1E1E1E1E1F1F1F1F1F1F1F
         HEX   20202020202020212121212121212222
         HEX   22222222222323232323232324242424
         HEX   24242425252525252525262626262626
         HEX   262727272727272728282828282828

L49CB    HEX   01020408102040010204081020400102
         HEX   04081020400102040810204001020408
         HEX   10204001020408102040010204081020
         HEX   40010204081020400102040810204001
         HEX   02040810204001020408102040010204
         HEX   08102040010204081020400102040810
         HEX   20400102040810204001020408102040
         HEX   01020408102040010204081020400102
         HEX   04081020400102040810204001020408
         HEX   10204001020408102040010204081020
         HEX   40010204081020400102040810204001
         HEX   02040810204001020408102040010204
         HEX   08102040010204081020400102040810
         HEX   20400102040810204001020408102040
         HEX   01020408102040010204081020400102
         HEX   04081020400102040810204001020408
         HEX   10204001020408102040010204081020
         HEX   4001020408102040

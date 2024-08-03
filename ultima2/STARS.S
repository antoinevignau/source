*
* Ultima II: The Revenge of the Enchanteress
*
* (c) 1982, Sierra On-Line
* (s) 2020, John Disam
*

         TYP   BIN
         ORG   $8900
         MX    %11
         LST   OFF

*----------------------------

KBD      EQU   $C000
KBDSTROBE EQU  $C010
SPKR     EQU   $C030
TXTCLR   EQU   $C050
HIRES    EQU   $C057
WAIT     EQU   $FCA8
PRBYTE   EQU   $FDDA
COUT     EQU   $FDED

L1F00    EQU   $1F00
L402C    EQU   $402C	; PRINTSTRING
L458A    EQU   $458A	; GOTOXY
L472C    EQU   $472C
L47EC    EQU   $47EC
L48AC    EQU   $48AC
L49CB    EQU   $49CB
L4E00    EQU   $4E00

*----------------------------

L8900    JSR   L8C01
         LDA   HIRES
         LDA   TXTCLR
         LDA   #$80
         STA   L1F00+$80
         LDA   #$40
         STA   L1F00+$81
         LDX   L4E00+$37
         LDA   L8E28,X
         STA   L1F00+$89
         LDA   L8E32,X
         STA   L1F00+$8A
         LDA   L8E3C,X
         STA   L1F00+$8B
         SED
         LDA   L4E00+$AF
         SEC
         SBC   #$01
         STA   L4E00+$AF
         CLD
         LDA   #$28
         STA   $21
         LDX   #$1E
         LDY   #$14
         JSR   L458A
         JSR   L402C
         ASC   "  FUEL="00
         LDX   #$1E
         LDY   #$15
         JSR   L458A
         JSR   L402C
         ASC   "  XENO="00
         LDX   #$1E
         LDY   #$16
         JSR   L458A
         JSR   L402C
         ASC   "  YAKO="00
         LDX   #$1E
         LDY   #$17
         JSR   L458A
         JSR   L402C
         ASC   "  ZABO="00
         LDA   #$20
         STA   $21
         JSR   L8DE4
         JSR   L8C18
         JSR   L8C92
         LDA   L4E00+$2C
         CMP   #$05
         BCS   L89AF
         JSR   L402C
         ASC   8D
         ASC   "YOU HAVE EXPLODED!"8D8D00
L89AC    JMP   L89AC

L89AF    JSR   L8DE4
         JSR   L402C
         ASC   "CMD: "00
L89BB    JSR   L8A66
         LDA   KBD
         BPL   L89BB
         BIT   KBDSTROBE
         CMP   #$88
         BNE   L89CD
         JMP   L8A00

L89CD    CMP   #$95
         BNE   L89D4
         JMP   L8A19

L89D4    CMP   #$8D
         BNE   L89DB
         JMP   L8A33

L89DB    CMP   #$AF       ; /
         BNE   L89E2
         JMP   L8A4D

L89E2    CMP   #$C8       ; H
         BNE   L89E9
         JMP   L8D20

L89E9    CMP   #$CC       ; L
         BNE   L89F0
         JMP   L8F8B

L89F0    JSR   L8BA7
         LDA   #$80
         STA   L1F00+$80
         LDA   #$40
         STA   L1F00+$81
         JMP   L89BB

L8A00    JSR   L402C
         ASC   "LEFT"8D00
         JSR   L8BA7
         LDA   #$20
         STA   L1F00+$80
         LDA   #$40
         STA   L1F00+$81
         JMP   L89AF

L8A19    JSR   L402C
         ASC   "RIGHT"8D00
         JSR   L8BA7
         LDA   #$DF
         STA   L1F00+$80
         LDA   #$40
         STA   L1F00+$81
         JMP   L89AF

L8A33    JSR   L402C
         ASC   "CLIMB"8D00
         JSR   L8BA7
         LDA   #$10
         STA   L1F00+$81
         LDA   #$80
         STA   L1F00+$80
         JMP   L89AF

L8A4D    JSR   L402C
         ASC   "DIVE"8D00
         JSR   L8BA7
         LDA   #$6F
         STA   L1F00+$81
         LDA   #$80
         STA   L1F00+$80
         JMP   L89AF

L8A66    JSR   L8C38
         LDY   #$00
L8A6B    LDA   L1F00+$00,Y
         STA   L1F00+$82
         SEC
         SBC   L1F00+$80
         BCS   L8A90
         EOR   #$FF
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L1F00+$82
         SEC
         SBC   L8B51,X
         BCS   L8A8A
         JMP   L8B20

L8A8A    STA   L1F00+$84
         JMP   L8AA4

L8A90    LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L1F00+$82
         CLC
         ADC   L8B51,X
         STA   L1F00+$84
         BCC   L8AA4
         JMP   L8B20

L8AA4    LDA   L1F00+$40,Y
         STA   L1F00+$83
         SEC
         SBC   L1F00+$81
         BCS   L8AC6
         EOR   #$FF
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L1F00+$83
         SEC
         SBC   L8B61,X
         STA   L1F00+$85
         BPL   L8AD7
         JMP   L8B20

L8AC6    LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L1F00+$83
         CLC
         ADC   L8B61,X
         BMI   L8B20
         STA   L1F00+$85
L8AD7    STY   L1F00+$88
         LDA   L1F00+$86
         BEQ   L8AEC
         LDA   L1F00+$82
         STA   $60
         LDA   L1F00+$83
         STA   $61
         JSR   L8B87
L8AEC    LDY   L1F00+$88
         LDA   L1F00+$84
         STA   $60
         STA   L1F00+$00,Y
         LDA   L1F00+$85
         STA   $61
         STA   L1F00+$40,Y
         JSR   L8B69
         LDY   L1F00+$88
         INY
         CPY   #$40
         BEQ   L8B17
         LDA   L1F00+$86
         CMP   #$02
         BCS   L8B14
         BIT   SPKR
L8B14    JMP   L8A6B

L8B17    LDA   L1F00+$86
         BEQ   L8B1F
         JSR   WAIT
L8B1F    RTS

L8B20    BIT   SPKR
         LDA   L1F00+$00,Y
         STA   L1F00+$82
         LDA   L1F00+$40,Y
         STA   L1F00+$83
         JSR   L8B43
         STA   L1F00+$84
         JSR   L8B43
         AND   #$7F
         STA   L1F00+$85
         BIT   SPKR
         JMP   L8AD7

L8B43    CLC
         LDA   $4E
         ADC   #$09
         ADC   $4F
         LDX   $4E
         STA   $4E
         STX   $4F
         RTS

L8B51    HEX   0102030405060708090A0B0C0D0E0F10
L8B61    HEX   0102030405060708

L8B69    LDA   $61
         CLC
         ADC   #$10
         TAY
         LDA   L472C,Y
         STA   $FE
         LDA   L47EC,Y
         STA   $FF
         LDX   $60
         LDY   L48AC,X
         INY
         LDA   L49CB,X
         ORA   ($FE),Y
         STA   ($FE),Y
         RTS

L8B87    LDA   $61
         CLC
         ADC   #$10
         TAY
         LDA   L472C,Y
         STA   $FE
         LDA   L47EC,Y
         STA   $FF
         LDX   $60
         LDY   L48AC,X
         INY
         LDA   L49CB,X
         EOR   #$FF
         AND   ($FE),Y
         STA   ($FE),Y
         RTS

L8BA7    LDA   L1F00+$80
         STA   $60
         LDA   L1F00+$81
         SEC
         SBC   #$03
         STA   $61
         JSR   L8B87
         INC   $61
         JSR   L8B87
         INC   $61
         JSR   L8B87
         INC   $61
         JSR   L8B87
         INC   $61
         JSR   L8B87
         INC   $61
         JSR   L8B87
         INC   $61
         JSR   L8B87
         LDA   L1F00+$80
         SEC
         SBC   #$03
         STA   $60
         LDA   L1F00+$81
         STA   $61
         JSR   L8B87
         INC   $60
         JSR   L8B87
         INC   $60
         JSR   L8B87
         INC   $60
         INC   $60
         JSR   L8B87
         INC   $60
         JSR   L8B87
         INC   $60
         JSR   L8B87
         RTS

L8C01    LDA   #$20
         STA   $FD
         LDA   #$00
         TAY
         STA   $FC
L8C0A    STA   ($FC),Y
         INY
         BNE   L8C0A
         INC   $FD
         LDX   $FD
         CPX   #$40
         BCC   L8C0A
         RTS

L8C18    JSR   L8C2F
         LDY   #$3F
L8C1D    JSR   L8B43
         STA   L1F00+$00,Y
         JSR   L8B43
         AND   #$7F
         STA   L1F00+$40,Y
         DEY
         BPL   L8C1D
         RTS

L8C2F    LDA   #$3B
         STA   L4E00+$
         LDA   #$67
         STA   $4F
         RTS

L8C38    LDA   L1F00+$80
         STA   $60
         LDA   L1F00+$81
         SEC
         SBC   #$03
         STA   $61
         JSR   L8B69
         INC   $61
         JSR   L8B69
         INC   $61
         JSR   L8B69
         INC   $61
         JSR   L8B69
         INC   $61
         JSR   L8B69
         INC   $61
         JSR   L8B69
         INC   $61
         JSR   L8B69
         LDA   L1F00+$80
         SEC
         SBC   #$03
         STA   $60
         LDA   L1F00+$81
         STA   $61
         JSR   L8B69
         INC   $60
         JSR   L8B69
         INC   $60
         JSR   L8B69
         INC   $60
         INC   $60
         JSR   L8B69
         INC   $60
         JSR   L8B69
         INC   $60
         JSR   L8B69
         RTS

L8C92    JSR   L402C
         ASC   "HYPERWARP ENGAGED!"8D00
         LDA   #$80
         STA   L1F00+$87
         LDA   #$00
         STA   L1F00+$86
         JSR   L8C2F
L8CB6    JSR   L8A66
         DEC   L1F00+$87
         BNE   L8CB6
         LDA   #$80
         STA   L1F00+$87
         LDA   #$01
         STA   L1F00+$86
         JSR   L8DE4
         JSR   L8C2F
L8CCE    JSR   L8A66
         DEC   L1F00+$87
         BNE   L8CCE
         INC   L1F00+$86
L8CD9    JSR   L8A66
         INC   L1F00+$86
         INC   L1F00+$86
         BPL   L8CD9
         LDA   L4E00+$AF
         LSR
         BCC   L8D1C
         LSR
         BCC   L8D1C
         STA   $4F
         JSR   L402C
         ASC   "SHIP OFF COURSE!"8D00
         JSR   L8B43
         AND   #$07
         STA   L1F00+$89
         JSR   L8B43
         AND   #$07
         STA   L1F00+$8A
         JSR   L8B43
         AND   #$07
         STA   L1F00+$8B
L8D1C    JSR   L8E46
         RTS

L8D20    LDA   L4E00+$AF
         BNE   L8D36
         JSR   L402C
         ASC   "NO FUEL!"878D00
         JMP   L89AF

L8D36    SED
         SEC
         SBC   #$01
         STA   L4E00+$AF
         CLD
         JSR   L8BA7
         LDA   #$80
         STA   L1F00+$80
         LDA   #$40
         STA   L1F00+$81
         JSR   L402C
         ASC   "HYPERWARP TO:"8D
         ASC   "XENO="00
         JSR   L8DCA
         STA   L1F00+$89
         JSR   L402C
         ASC   " YAKO="00
         JSR   L8DCA
         STA   L1F00+$8A
         JSR   L402C
         ASC   " ZABO="00
         JSR   L8DCA
         STA   L1F00+$8B
         JSR   L402C
         ASC   8D
         ASC   "PREPARE FOR HYPERWARP!"8D00
         JSR   L8C2F
L8DA7    JSR   L8A66
         DEC   L1F00+$86
         LDA   L1F00+$86
         CMP   #$02
         BNE   L8DA7
         LDA   #$40
         STA   L1F00+$87
         JSR   L8C2F
L8DBC    JSR   L8A66
         DEC   L1F00+$87
         BNE   L8DBC
         JSR   L8C92
         JMP   L89AF

L8DCA    JSR   L8A66
         LDA   KBD
         CMP   #$B0
         BCC   L8DCA
         CMP   #$BA
         BCS   L8DCA
         BIT   KBDSTROBE
         PHA
         JSR   COUT
         PLA
         SEC
         SBC   #$B0
         RTS

L8DE4    LDA   #$28
         STA   $21
         LDX   #$25
         LDY   #$14
         JSR   L458A
         LDA   L4E00+$AF
         JSR   PRBYTE
         LDX   #$25
         LDY   #$15
         JSR   L458A
         LDA   L1F00+$89
         JSR   PRBYTE
         LDX   #$25
         LDY   #$16
         JSR   L458A
         LDA   L1F00+$8A
         JSR   PRBYTE
         LDX   #$25
         LDY   #$17
         JSR   L458A
         LDA   L1F00+$8B
         JSR   PRBYTE
         LDA   #$20
         STA   $21
         LDX   #$00
         LDY   #$17
         JSR   L458A
         RTS

* PLANET COORDINATES

L8E28    HEX   06050306010209040009
L8E32    HEX   06040302030804000109
L8E3C    HEX   06050403040506050409

L8E46    LDA   L1F00+$89
         CMP   #$04
         BNE   L8E78
         LDA   L1F00+$8A
         CMP   #$04
         BNE   L8E78
         LDA   L1F00+$8B
         CMP   #$04
         BNE   L8E78
         JSR   L402C
         ASC   8D8D
         ASC   "YOU HIT THE SUN!"8D00
         JSR   L8C01
L8E75    JMP   L8E75

L8E78    LDX   #$09
L8E7A    LDA   L8E28,X
         CMP   L1F00+$89
         BNE   L8E92
         LDA   L8E32,X
         CMP   L1F00+$8A
         BNE   L8E92
         LDA   L8E3C,X
         CMP   L1F00+$8B
         BEQ   L8EB8
L8E92    DEX
         BPL   L8E7A
         JSR   L402C
         ASC   "YOU ARE IN DEEP SPACE."8D00
         LDA   #$0A
         STA   L4E00+$37
         JMP   L8F8A

L8EB8    TXA
         STA   L4E00+$37
         JSR   L402C
         ASC   "YOU ARE ORBITING "00
         LDA   L4E00+$37
         CMP   #$00
         BEQ   L8EFB
         CMP   #$01
         BEQ   L8F09
         CMP   #$02
         BEQ   L8F19
         CMP   #$03
         BEQ   L8F27
         CMP   #$04
         BEQ   L8F34
         CMP   #$05
         BEQ   L8F44
         CMP   #$06
         BEQ   L8F53
         CMP   #$07
         BEQ   L8F62
         CMP   #$08
         BEQ   L8F72
         JMP   L8F80

L8EFB    JSR   L402C
         ASC   "EARTH."8D00
         JMP   L8F8A

L8F09    JSR   L402C
         ASC   "MERCURY."8D00
         JMP   L8F8A

L8F19    JSR   L402C
         ASC   "VENUS."8D00
         JMP   L8F8A

L8F27    JSR   L402C
         ASC   "MARS."8D00
         JMP   L8F8A

L8F34    JSR   L402C
         ASC   "JUPITER."8D00
         JMP   L8F8A

L8F44    JSR   L402C
         ASC   "SATURN."8D00
         JMP   L8F8A

L8F53    JSR   L402C
         ASC   "URANUS."8D00
         JMP   L8F8A

L8F62    JSR   L402C
         ASC   "NEPTUNE."8D00
         JMP   L8F8A

L8F72    JSR   L402C
         ASC   "PLUTO."8D00
         JMP   L8F8A

L8F80    JSR   L402C
         ASC   "X."8D00
         JMP   L8F8A
L8F8A    RTS

L8F8B    JSR   L8BA7
         LDA   #$80
         STA   L1F00+$80
         LDA   #$40
         STA   L1F00+$81
         JSR   L402C
         ASC   "LANDING REQUESTED!"8D00
         JSR   L8E46
         LDA   L4E00+$37
         CMP   #$0A
         BNE   L8FD0
         JSR   L402C
         ASC   "REQUEST DENIED!"8D00
         JMP   L89AF

L8FD0    CMP   #$00
         BNE   L9002
         JSR   L402C
         ASC   "(INSERT PLAYER DISK)"8D00
L8FED    JSR   L8A66
         LDA   KBD
         CMP   #$9B
         BNE   L8FED
         LDA   #$00
         STA   L4E00+$14
         LDA   #$04
         STA   L4E00+$13
         RTS

L9002    JSR   L402C
         ASC   "(INSERT GALACTIC DISK)"8D00
L901D    JSR   L8A66
         LDA   KBD
         CMP   #$9B
         BNE   L901D
         LDA   #$00
         STA   L4E00+$14
         LDA   L4E00+$37
         STA   L4E00+$13
         RTS

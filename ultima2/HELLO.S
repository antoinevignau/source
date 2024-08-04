*
* Ultima II: The Revenge of the Enchanteress
*
* (c) 1982, Sierra On-Line
* (s) 2020, John Disam
*

         TYP   BIN
         ORG   $6000
         MX    %11
         LST   OFF

*----------------------------

L0800    =     $0800
L1000    =     $1000      ; UL
L1A00    =     $1A00      ; II - Pointer at $1A00, file at $1A40?
L7800    =     $7800
L8000    =     $8000      ; FL
L8C00    =     $8C00      ; WII

SOFTEV   EQU   $03F2
PWREDUP  EQU   $03F4
KBD      EQU   $C000
KBDSTROBE EQU  $C010
SPKR     EQU   $C030
TXTCLR   EQU   $C050
TXTSET   EQU   $C051
MIXCLR   EQU   $C052
MIXSET   EQU   $C053
HIRES    EQU   $C057
VTAB     EQU   $FC22
HOME     EQU   $FC58
WAIT     EQU   $FCA8
RDKEY    EQU   $FD0C
COUT     EQU   $FDED
RESETV   EQU   $FFFC

*----------------------------

         JSR   HOME
         JSR   L7280      ; PROTECTION
         ASC   04
         ASC   "NOMON I,O,C"8D00
         JSR   HOME
         LDX   #$0F
         LDY   #$0C
         JSR   L678A
         JSR   L66F8
         ASC   "ULTIMA ]["0D00
         JSR   L7280      ; PROTECTION
         ASC   04
         ASC   "BLOAD UPDATE.OBJ"0D
         ASC   04
         ASC   "BLOAD SHAPES"0D
         ASC   04
         ASC   "BLOAD TABLES.903C.OBJ"0D00
         LDA   KBD
         CMP   #$D0       ; P
         BNE   L608B
         LDX   #$0D
         LDY   #$0C
         JSR   L678A
         JSR   L73F7      ; PROTECTION
         ASC   "PLAY ULTIMA ]["0D00
         JMP   L63D4

L608B    JSR   L7280      ; PROTECTION
         ASC   04
         ASC   "BLOAD UL,A$1000"0D
         ASC   04
         ASC   "BLOAD II,A$1A40"0D
         ASC   04
         ASC   "BLOAD FL,A$8000"0D
         ASC   04
         ASC   "BLOAD WII,A$8C00"0D00
         LDA   #$00
         STA   $EF
L60D8    JSR   HOME
         BIT   TXTSET
         LDA   KBD
         CMP   #$9B
         BNE   L60E8
         JMP   L627F

L60E8    LDA   #$11
         STA   $4E
         LDA   #$27
         STA   $4F
         LDX   #$0C
         LDY   #$0A
         JSR   L678A
         JSR   L73F7
         ASC   "ON-LINE  SYSTEMS"00
         LDX   #$0C
         LDY   #$0C
         JSR   L678A
         JSR   L66F8
         ASC   "PROUDLY PRESENTS"0D00
         LDA   #$EF
         STA   $FC
         LDA   #$50
         STA   $FD
         JSR   L679D
         LDA   KBD
         CMP   #$9B
         BNE   L613C
         JMP   L627F

L613C    JSR   HOME
         LDX   #$10
         LDY   #$08
         JSR   L678A
         JSR   L66F8
         ASC   "PART "
         ASC   ']['00
         LDX   #$09
         LDY   #$0A
         JSR   L678A
         JSR   L73F7
         ASC   "OF THE #1 BEST SELLING"00
         LDX   #$07
         LDY   #$0C
         JSR   L678A
         JSR   L66F8
         ASC   "FANTASY ROLE-PLAYING GAME"00
         LDX   #$0C
         LDY   #$0E
         JSR   L678A
         JSR   L66F8
         ASC   "BY LORD BRITISH"0D00
         LDA   #$DF
         STA   $FC
         LDA   #$58
         STA   $FD
         JSR   L679D
         LDA   KBD
         CMP   #$9B
         BNE   L61C6
         JMP   L627F

L61C6    JSR   L6719
         JSR   L71AB
         LDA   HIRES
         LDA   MIXCLR
         LDA   TXTCLR
         LDA   #$CF
         STA   $FC
         LDA   #$60
         STA   $FD
         JSR   L679D
         LDA   KBD
         CMP   #$9B
         BNE   L61EA
         JMP   L627F

L61EA    LDA   #$20
         STA   $FD
         LDA   #$40
         STA   $FB
         LDA   #$00
         STA   $FC
         STA   $FA
         LDY   #$00
L61FA    LDA   ($FC),Y
         STA   ($FA),Y
         INC   $FC
         INC   $FA
         BNE   L61FA
         INC   $FD
         INC   $FB
         LDA   $FD
         CMP   #$40
         BCC   L61FA
         LDA   HIRES
         LDA   MIXCLR
         LDA   TXTCLR
         JSR   L6806
         LDA   KBD
         CMP   #$9B
         BNE   L6224
         JMP   L627F

L6224    JSR   L71D1
         LDY   #$FF
L6229    LDX   #$FF
L622B    STX   $F0
         JSR   L6792
         CMP   #$20
         BCS   L6237
         BIT   SPKR
L6237    LDX   $F0
         DEX
         BNE   L622B
         DEY
         BNE   L6229
         JSR   L71BD
         JSR   L71D1
         LDA   #$0A
         STA   $F0
L6249    LDA   #$FF
         JSR   WAIT
         LDA   #$FF
         JSR   WAIT
         LDA   #$FF
         JSR   WAIT
         LDA   #$FF
         JSR   WAIT
         LDA   #$FF
         JSR   WAIT
         JSR   L71E3
         LDA   #$40
         JSR   WAIT
         JSR   L71E3
         DEC   $F0
         BNE   L6249
         LDA   $EF
         BEQ   L627F
         LDA   KBD
         CMP   #$9B
         BEQ   L627F
         JMP   L6414

L627F    JSR   HOME
         BIT   KBDSTROBE
         LDA   #$0F
         STA   $24
         JSR   L73F7
         ASC   "ULTIMA ]["0A0A00
         LDA   #$10
         STA   $24
         JSR   L66F8
         ASC   "REVENGE"0A0A00
         LDA   #$10
         STA   $24
         JSR   L66F8
         ASC   "OF  THE"0A0A00
         LDA   #$0E
         STA   $24
         JSR   L66F8
         ASC   "ENCHANTRESS"00
         LDA   #$15
         STA   $25
         LDA   #$08
         STA   $24
         JSR   L66F8
         ASC   0A
         ASC   "(C)-1982 BY LORD BRITISH"00
         LDA   #$0B
         STA   $24
         JSR   L66F8
         ASC   0A
         ASC   "AND ON-LINE SYSTEMS"00
         LDA   #$0A
         STA   $25
         LDA   #$05
         STA   $24
         JSR   L66F8
         ASC   0A
         ASC   "TYPE -"00
         LDA   #$06
         STA   $24
         JSR   L66F8
         ASC   0A0A
         ASC   "'D' - FOR A DEMONSTRATION"00
         LDA   #$06
         STA   $24
         JSR   L66F8
         ASC   0A0A
         ASC   "'P' - PLAY A GAME OF ULTIMA ]["00
         LDA   #$06
         STA   $24
         JSR   L66F8
         ASC   0A0A
         ASC   "'C' - CREATE A NEW CHARACTER"00
         BIT   TXTSET
         LDA   #$05
         STA   $24
         JSR   L73F7
         ASC   0A0A
         ASC   "CHOICE:"00
         LDX   #$30
L63A8    LDA   KBD
         BPL   L63A8
         JSR   COUT
         CMP   #$C4       ; D
         BNE   L63B7
         JMP   L6414

L63B7    CMP   #$D0       ; P
         BEQ   L63D4
         CMP   #$C3       ; C
         BEQ   L63C2
         JMP   L627F

L63C2    JSR   L7280      ; PROTECTION
         ASC   0D
         ASC   04
         ASC   "BRUN CREATE"0D00
L63D4    JSR   L66F8
         ASC   0D
         ASC   04
         ASC   "BLOAD STD SUBS.OBJ"0D
         ASC   04
         ASC   "BLOAD DNGDRAW.OBJ"0D
         ASC   04
         ASC   "BRUN ULTIMA II.OBJ"0D00
L6414    JSR   HOME
         LDA   #$01
         STA   $EF
         LDX   #$0F
         LDY   #$0C
         JSR   L678A
         JSR   L66F8
         ASC   "ULTIMA ]["8D00
         BIT   TXTSET
         JSR   L66F8
         ASC   04
         ASC   "BLOAD PIC.OUT"8D00
         BIT   MIXSET
         BIT   HIRES
         BIT   TXTCLR
         JSR   L66F8
         ASC   8D8D8D8D8D8D8D8D8D8D8D8D
         ASC   "        BATTLE STRANGE CREATURES"8D
         ASC   "      ACROSS THE FACE OF THE EARTH"8D00
         LDA   KBD
         CMP   #$9B
         BNE   L64AD
         JMP   L627F

L64AD    JSR   L66F8
         ASC   04
         ASC   "BLOAD PIC.TWN,A$4000"8D8D8D
         ASC   "   SEARCH FOR CLUES IN CARELESS WORDS"8D
         ASC   "        SPOKEN AT THE LOCAL PUB"8D00
         JSR   L66D6
         LDA   KBD
         CMP   #$9B
         BNE   L651C
         JMP   L627F

L651C    JSR   L66F8
         ASC   04
         ASC   "BLOAD PIC.CAS,A$4000"8D8D8D
         ASC   "        PLEAD WITH MEDIEVAL KINGS"8D
         ASC   "             FOR ASSISTANCE"8D00
         JSR   L66D6
         LDA   KBD
         CMP   #$9B
         BNE   L6583
         JMP   L627F

L6583    JSR   L66F8
         ASC   04
         ASC   "BLOAD PIC.DNG,A$4000"8D8D8D
         ASC   "   TRAVERSE DEEP DARK DEADLY DUNGEONS"8D
         ASC   "       AND TALL TERRIFYING TOWERS"8D00
         JSR   L66D6
         LDA   KBD
         CMP   #$9B
         BNE   L65F4
         JMP   L627F

L65F4    JSR   L66F8
         ASC   04
         ASC   "BLOAD PIC.SPA,A$4000"8D8D8D
         ASC   "      TRAVEL THROUGHOUT THE GALAXY"8D
         ASC   "   TO THE PLANETS OF OUR SOLAR SYSTEM"8D00
         JSR   L66D6
         LDA   KBD
         CMP   #$9B
         BNE   L6666
         JMP   L627F

L6666    JSR   L66F8
         ASC   04
         ASC   "BLOAD PIC.MIN,A$4000"8D8D8D
         ASC   "   AND CONQUER TIME ITSELF TO BATTLE"8D
         ASC   "         MINAX THE ENCHANTRESS"8D00
         JSR   L66D6
         LDY   #$20
L66CB    LDA   #$FF
         JSR   WAIT
         DEY
         BNE   L66CB
         JMP   L60D8

L66D6    LDA   #$5F
         STA   $FD
         LDA   #$3F
         STA   $FF
         LDA   #$00
         STA   $FC
         STA   $FE
         LDY   #$00
L66E6    LDA   ($FC),Y
         STA   ($FE),Y
         DEY
         BNE   L66E6
         DEC   $FF
         DEC   $FD
         LDA   $FD
         CMP   #$40
         BCS   L66E6
         RTS

L66F8    PLA
         STA   $FE
         PLA
         STA   $FF
         LDY   #$00
L6700    INC   $FE
         BNE   L6706
         INC   $FF
L6706    LDA   ($FE),Y
         BEQ   L6712
         ORA   #$80
         JSR   COUT
         JMP   L6700

L6712    LDA   $FF
         PHA
         LDA   $FE
         PHA
         RTS

L6719    LDA   #$20
         STA   $FD
         LDA   #$00
         STA   $FC
         TAY
L6722    STA   ($FC),Y
         INY
         BNE   L6722
         INC   $FD
         LDX   $FD
         CPX   #$40
         BCC   L6722
         RTS

         CMP   #$00
         BEQ   L673B
         BPL   L6739
         LDA   #$FF
         RTS

L6739    LDA   #$01
L673B    RTS

L673C    JSR   RDKEY
         CMP   #$B0
         BCC   L673C
         CMP   #$BA
         BCS   L673C
         JSR   COUT
         SEC
         SBC   #$B0
         ASL
         ASL
         ASL
         ASL
         STA   $FC
L6753    JSR   RDKEY
         CMP   #$88
         BNE   L6760
         JSR   COUT
         JMP   L673C

L6760    CMP   #$B0
         BCC   L6753
         CMP   #$BA
         BCS   L6753
         JSR   COUT
         SEC
         SBC   #$B0
         CLC
         ADC   $FC
         STA   $FC
L6773    JSR   RDKEY
         CMP   #$88
         BNE   L6783
         JSR   COUT
         JSR   COUT
         JMP   L673C

L6783    CMP   #$8D
         BNE   L6773
         LDA   $FC
         RTS

L678A    STX   $24
         STY   $25
         JSR   VTAB
         RTS

L6792    LDA   $4E
         ADC   $4F
         LDX   $4F
         STX   $4E
         STA   $4F
         RTS

L679D    LDA   $FC
         STA   L6804
         LDA   #$01
         STA   L6803
L67A7    LDA   $FD
L67A9    PHA
         LDX   L6804
L67AD    DEX
         BNE   L67AD
         BIT   SPKR
         LDX   L6803
L67B6    DEX
         BNE   L67B6
         BIT   SPKR
         PLA
         TAX
         DEX
         TXA
         BNE   L67A9
         LDA   L6803
         CLC
         ADC   #$01
         CMP   #$1B
         BEQ   L67D5
         STA   L6803
         DEC   L6804
         JMP   L67A7

L67D5    LDA   $FD
L67D7    PHA
         LDX   L6804
L67DB    DEX
         BNE   L67DB
         BIT   SPKR
         LDX   L6803
L67E4    DEX
         BNE   L67E4
         BIT   SPKR
         PLA
         TAX
         DEX
         TXA
         BNE   L67D7
         LDA   L6803
         SEC
         SBC   #$01
         CMP   #$01
         BEQ   L6805
         STA   L6803
         INC   L6804
         JMP   L67D5

L6803    HEX   35
L6804    HEX   32
L6805    RTS

L6806    LDA   #$00
         STA   $0F
         LDA   #$00
         STA   $00
         LDA   #$00
         STA   $01
         LDA   #$01
         STA   $02
         STA   $10
         JSR   L6854
         LDA   $0F
         EOR   #$01
         STA   $0F
         LDA   $10
         CLC
         ADC   #$02
         STA   $11
L6828    LDA   $11
         STA   $02
         JSR   L6854
         LDX   $0F
         LDA   $C054,X
         LDA   $0F
         EOR   #$01
         STA   $0F
         LDA   $10
         STA   $02
         LDA   $11
         STA   $10
         JSR   L6854
         LDA   $02
         CLC
         ADC   #$02
         CMP   #$6C
         BCC   L684F
         RTS

L684F    STA   $11
         JMP   L6828

L6854    STA   $0B
         STX   $0C
         STY   $0D
         LDA   $02
         PHA
         LDY   #$00
         STY   $0A
         LDA   #<L68CD
         STA   $05
         LDA   #>L68CD
         STA   $06
         LDX   #$6C
         STX   $08
L686D    LDY   $02
         CPY   #$FF
         BEQ   L68C3
         LDA   $927D,Y
         STA   $03
         LDA   $933D,Y
         STA   $04
         LDA   $0F
         BEQ   L6887
         LDA   $04
         EOR   #$60
         STA   $04
L6887    LDX   #$13
         STX   $09
         LDX   #$00
         LDY   $0A
L688F    LDA   ($05,X)
         BEQ   L68B2
         BMI   L68AC
         EOR   ($03),Y
         AND   #$7F
         STA   ($03),Y
         STX   $F0
         JSR   L6792
         CMP   #$04
         BCS   L68A7
         BIT   SPKR
L68A7    LDX   $F0
         JMP   L68B2

L68AC    EOR   ($03),Y
         ORA   #$80
         STA   ($03),Y
L68B2    INY
         INC   $05
         BNE   L68B9
         INC   $06
L68B9    DEC   $09
         BPL   L688F
         DEC   $02
         DEC   $08
         BNE   L686D
L68C3    PLA
         STA   $02
         LDA   $0B
         LDX   $0C
         LDY   $0D
         RTS

L68CD    HEX   000000000000000020552A0500000000
         HEX   0000000000000000000000402A552A55
         HEX   0A000000000000000000000000502A51
         HEX   2A552A552A552A010000000000000000
         HEX   2A552A542A552A552A552A1500000000
         HEX   000000502A550A552A552A552A552A55
         HEX   00000000000020552A5522550A000000
         HEX   000020550000000000402A552A552801
         HEX   20552A552A5502540200000000542A55
         HEX   2A1500542A552A552A552A010A000000
         HEX   20552A552A452A552A552A552A552A15
         HEX   0A00000028552A552A512A552A552A55
         HEX   2A552A55280000002A552A0500542A55
         HEX   2A552A552A552A55280000002A550200
         HEX   00552A552A552A552A552A5522010000
         HEX   2A01000000552A552A552A552A552A40
         HEX   220100000200000020552A0500552A55
         HEX   2A552A40220500000000000028552A41
         HEX   03502A1500502A000A05000000000000
         HEX   2A552A78434302402A452A010A050000
         HEX   000000002A552A7843432A552A152A15
         HEX   2A040000000000402A052A7843432A55
         HEX   2A552A1528040000000000502A452879
         HEX   43512A552A552A552805000000000000
         HEX   0040226103542A552A552A5528050000
         HEX   000028552A450A0500552A552A552A55
         HEX   2805000000502A552A452A542A552A55
         HEX   2A552A152801000000552A552A452A55
         HEX   2A552A552A552A010000000028552A55
         HEX   2A012A552A552A150000000000000000
         HEX   2A552A552A5428552A552A0100000000
         HEX   000000002A552A552A5428552A550A00
         HEX   00000000000000002A552A550A552855
         HEX   2A55000000000000000000002A552A55
         HEX   085528552A1500000000000000000000
         HEX   000000000A5528552A00000000000000
         HEX   0000000000002A150A55285500000000
         HEX   000000000000000000002A450A552855
         HEX   00000000000000000000000000402A45
         HEX   0A552805000000000000000000000000
         HEX   00402A450A5528010000000000000000
         HEX   0000000000502A450A150A0100000000
         HEX   000000000000000000502A552A440204
         HEX   00000000000000000000000000542A55
         HEX   2A400004000000000000000000000000
         HEX   00542A552A5500100000000000000000
         HEX   0000000000552A552A55541000000000
         HEX   000000000000000000552A552A55502A
         HEX   05000000000000000000000020552A55
         HEX   2A55522A550000000000000000000000
         HEX   20552A552A55522A5502000000000000
         HEX   0000000028552A552A554A2A552A0000
         HEX   000000000000000028552A552A554A2A
         HEX   552A050000000000000000002A552A55
         HEX   2A552A2A552A55000000000000000000
         HEX   2A552A550A552A2A552A550200000000
         HEX   000000002A552A552A542A29552A550A
         HEX   00000000000000002A552A552A542A21
         HEX   552A552A00000000000000002A552A55
         HEX   2A512A25552A552A0100000000000000
         HEX   2A552A552A512A05552A552A05000000
         HEX   000000002A552A552A452A15542A552A
         HEX   15000000000000002A552A552A452A55
         HEX   002A552A55000000000000002A552A55
         HEX   2A152A550000552A5502000000000000
         HEX   2A552A552A1528550200522A550A0000
         HEX   000000002A552A552A5520550A00082A
         HEX   552A0000000000002A552A552A550255
         HEX   2A002028552A0100000000002A552A55
         HEX   2A550A542A012001552A050000000000
         HEX   2A552A552A552A542A050001542A1500
         HEX   000000002A552A552A552A502A150004
         HEX   402A5500000000002A552A552A552A41
         HEX   2A550010002A5502000000002A552A55
         HEX   2A552A012A5502500028550A00000000
         HEX   2A552A552A552A0028550A400000552A
         HEX   000000002A552A552A552A0020552A00
         HEX   0200542A050000002A552A552A552A00
         HEX   00552A010800402A550000002A552A55
         HEX   2A552A0000542A0528000028552A0100
         HEX   2A552A552A552A0000502A1520000000
         HEX   552A15002A552A552A550A0000402A55
         HEX   00010000000000002A552A552A550A00
         HEX   00002A5502040000000000002A552A55
         HEX   2A550A00000028550A50000000000000
         HEX   2A552A552A550A00000020552A000200
         HEX   000000002A552A552A550A0000000055
         HEX   2A410200000000002A552A552A550200
         HEX   000000542A550000000000002A552A55
         HEX   2A550200000000542A55000000000000
         HEX   2A552A552A550200000000502A150000
         HEX   000000002A552A552A55020000000040
         HEX   2A050000000000002A552A552A550200
         HEX   0000000028010000000000002A552A55
         HEX   2A550200000000000000000000000000
         HEX   2A552A552A5500000000000000000000
         HEX   000000002A552A552A55000000000000
         HEX   00000000000000002A552A552A550000
         HEX   0000000000000000000000002A552A55
         HEX   2A550000000000000000000000000000
         HEX   2A552A552A5500000000000000000000
         HEX   000000002A552A552A15000000000000
         HEX   00000000000000002A552A552A150000
         HEX   0000000000000000000000002A552A55
         HEX   2A150000000000000000000000000000
         HEX   2A552A552A1500000000000000000000
         HEX   000000002A552A552A15000000000000
         HEX   00000000000000002A552A552A150000
         HEX   0000000000000000000000002A552A55
         HEX   2A050000000000000000000000000000
         HEX   2A552A552A0500000000000000000000
         HEX   000000002A552A552A05000000000000
         HEX   00000000000000002A552A552A050000
         HEX   0000000000000000000000002A552A55
         HEX   2A050000000000000000000000000000
         HEX   2A552A552A0500000000000000000000
         HEX   000000002A552A552A01000000000000
         HEX   00000000000000002A552A552A010000
         HEX   0000000000000000000000002A552A55
         HEX   2A010000000000000000000000000000
         HEX   2A552A552A0100000000000000000000
         HEX   000000002A552A552A01000000000000
         HEX   00000000000000002A552A552A010000
         HEX   0000000000000000000000002A552A55
         HEX   2A000000000000000000000000000000
         HEX   2A552A552A0000000000000000000000
         HEX   000000002A552A552A00000000000000
         HEX   00000000000000002A552A552A000000
         HEX   0000000000000000000000002A552A55
         HEX   2A000000000000000000000000000000
         HEX   2A552A552A0000000000000000000000
         HEX   000000002A552A550A00000000000000
         HEX   00000000000000002A552A550A000000
         HEX   0000000000000000000000002A552A55
         HEX   0A000000000000000000000000000000

L713D    LDA   #<L0800
         STA   $00
         LDA   #>L0800
         STA   $01
         JMP   L7150

L7148    LDA   #<L7800
         STA   $00
         LDA   #>L7800
         STA   $01

L7150    LDY   #$00
L7152    LDA   ($00),Y
         JSR   L71A5
         CMP   #$00
         BEQ   L7188
         CMP   #$FF
         BEQ   L716D
         STA   L719F+1
         LDA   ($00),Y
         JSR   L71A5
         STA   L719F+2
         JMP   L719D

L716D    LDA   ($00),Y
         JSR   L71A5
         CMP   #$FF
         BNE   L7180
         LDA   ($00),Y
         JSR   L71A5
         STA   $02
         JMP   L7152

L7180    STA   L719F+2
         LDA   #$FF
         STA   L719F+1
L7188    LDA   ($00),Y
         JSR   L71A5
         CMP   #$00
         BNE   L7192
         RTS

L7192    STA   L719F+2
         LDA   #$00
         STA   L719F+1
         JMP   L7152

L719D    LDA   $02
L719F    STA   $4132
         JMP   L7152

L71A5    INY
         BNE   L71AA
         INC   $01
L71AA    RTS

L71AB    LDA   #$20       ; UL
         STA   $08
         LDA   #>L1000
         STA   $06
         LDA   #<L1000
         STA   $07
         STA   $05
         TAY
         JMP   L722B

L71BD    LDA   #$20       ; II
         STA   $08
         LDA   #>L1A00
         STA   $06
         LDA   #<L1A00
         STA   $07
         TAY
         LDA   #$40       ; offset
         STA   $05
         JMP   L722B

L71D1    LDA   #$20       ; FL
         STA   $08
         LDA   #>L8000
         STA   $06
         LDA   #<L8000
         STA   $07
         STA   $05
         TAY
         JMP   L722B

L71E3    LDA   #$20       ; WII
         STA   $08
         LDA   #>L8C00
         STA   $06
         LDA   #<L8C00
         STA   $07
         STA   $05
         TAY
         JMP   L722B

L71F5    INC   $07
         BNE   L7214
         INC   $08
         LDA   $08
         CMP   #$40
         BNE   L7214
         PLA
         PLA
         LDA   #$00
         STA   ($05),Y
         JSR   L7215
         STA   ($05),Y
         JSR   L7215
         STA   ($05),Y
         JSR   L7215
L7214    RTS

L7215    INC   $05
         BNE   L7214
         INC   $06
         RTS

         LDA   #$20
         STA   $08
         LDA   #$40
         STA   $06
         LDA   #$00
         STA   $07
         STA   $05
         TAY

L722B    LDA   ($05),Y
         STA   $07
         JSR   L7215
         LDA   ($05),Y
         STA   $08
         BEQ   L7214
         JSR   L7215
L723B    LDA   ($05),Y
         JSR   L7215
         CMP   #$00
         BEQ   L722B
         EOR   ($07),Y
         STA   ($07),Y
         JSR   L71F5
         JMP   L723B

*----------------------------
* THE FOLLOWING CODE
* HIDES THE USUAL SIERRA ON-LINE
* ON-DISK PROTECTION DISK CHECK
*

         ASC   "P' - PLAY A GAME OF ULTIMA ]["00
         LDA   #$06
         STA   $24
         JSR   L66F8
         ASC   0A0A
         ASC   "'C' - CREAP"

L7280    JSR   L72E0      ; PROTECTION PART
         JMP   L66F8

         HEX   20

L7287    LDY   #$00
         TYA
         BPL   L728D
         HEX   20
L728D    EOR   L72F7,Y
         INY
         BNE   L728D
         BPL   L7296
         HEX   A9
L7296    CMP   #$22
         BNE   L729C
         RTS

         HEX   20
L729C    LDA   SOFTEV+1
         STA   PWREDUP
         CMP   #$00
         BCS   L72A7
         HEX   20
L72A7    JMP   (RESETV)

         PLA
         STA   $FE
         PLA
         STA   $FF
         LDY   #$00
         INC   $FE
         BNE   L72B8
         INC   $FF
L72B8    LDA   ($FE),Y
         BEQ   L72C4
         ORA   #$80
         JSR   COUT
         JMP   L6700

L72C4    LDA   $FF
         PHA
         LDA   $FE
         PHA
         RTS

         LDA   #$20
         STA   $FD
         LDA   #$00
         STA   $FC
         TAY
L72D4    STA   ($FC),Y
         INY
         BNE   L72D4
         INC   $FD
         LDX   $FD
         CPX   #$40
         HEX   90

L72E0    LDA   SOFTEV+1
         STA   PWREDUP
         JMP   L72F7

         HEX   FF
         RTS

         LDA   #$01
         RTS

L72EE    JSR   RDKEY
         CMP   #$B0
         BCC   L72EE
         CMP   #$BA
L72F7    DEC   L72FA
L72FA    HEX   EF	; EF -> EE (INC)
         DA    $72FA
         LDA   L731F
         EOR   #$8A
         BNE   L7305
         HEX   20
L7305    STA   L731F
         CLC
         BNE   L730C
         HEX   4C
L730C    LDY   #$29
L730E    TYA
         BCC   L7312
         HEX   20
L7312    EOR   L72F7,Y
         STA   L72F7,Y
         INY
         BNE   L730E
         DEY
         BMI   L731F
         HEX   4C
L731F    RTS

         HEX   E1A6DF9BA1C298998692DB14358B8AB1
         HEX   F9933EB13D851FC7325242648D860CD8
         HEX   B2BA4A00F0C28F405B9B9A8458EBDF98
         HEX   15AD29B6B7E3D3A0518DAD64DEB6B0CA
         HEX   76F0D6021EF36F71BB6284387577DE6A
         HEX   E47A7994AD849184802E87854546777E
         HEX   498B5B60E17270398D1F912F28185725
         HEX   155A8B67544B754A51AD6DA51E765766
         HEX   AB117B47C5C6E3EAC20F3F74A54D7E12
         HEX   6958F3D400327FD03A0B55143466C2E8
         HEX   25B902661D07725C11C2281D7F061790
         HEX   B167571CCD251635311509596926F713
         HEX   20403B1E074EEFD01D8153AF487A37E8
         HEX   02B293742D089F

L73F7    JSR   L7287      ; CALLED
         JMP   L66F8

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
         DB    $00
         DB    $00
         DB    $00

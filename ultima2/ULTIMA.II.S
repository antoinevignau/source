*
* Ultima II: The Revenge of the Enchanteress
*
* (c) 1982, Sierra On-Line
* (s) 2020, John Disam
*

         TYP   BIN
         ORG   $5000
         MX    %11
         LST   OFF

*----------------------------

KBD      EQU   $C000
KBDSTROBE EQU  $C010
SPKR     EQU   $C030
TXTCLR   EQU   $C050
TXTSET   EQU   $C051
MIXSET   EQU   $C053
HIRES    EQU   $C057
PRNTAX   EQU   $F941
HOME     EQU   $FC58
PRBYTE   EQU   $FDDA
COUT     EQU   $FDED

L0240    EQU   $0240      ; CALL L0240
L4000    EQU   $4000
L401B    EQU   $401B
L402C    EQU   $402C      ; PRINT C STRING
L404D    EQU   $404D
L4069    EQU   $4069
L4084    EQU   $4084
L409C    EQU   $409C
L437B    EQU   $437B
L4399    EQU   $4399
L43AF    EQU   $43AF
L43E9    EQU   $43E9
L4408    EQU   $4408
L4419    EQU   $4419
L442A    EQU   $442A
L44B2    EQU   $44B2
L44BD    EQU   $44BD
L44A7    EQU   $44A7
L44D4    EQU   $44D4
L44DA    EQU   $44DA
L44DE    EQU   $44DE
L458A    EQU   $458A
L4592    EQU   $4592
L459D    EQU   $459D
L45E1    EQU   $45E1
L4713    EQU   $4713
L4B00    EQU   $4B00
L4C00    EQU   $4C00
L4D00    EQU   $4D00
L4E00    EQU   $4E00
L8900    EQU   $8900

*----------------------------

L5000    JSR   HOME
         LDY   #$0C
         LDX   #$0A
         JSR   L458A
         JSR   L402C
         ASC   "(INSERT PLAYER DISK)"00
         BIT   KBDSTROBE
L5025    LDA   KBD
         CMP   #$9B
         BNE   L5025
         BIT   KBDSTROBE
         JSR   L402C
         ASC   0D
         ASC   04
         ASC   "BLOAD PLAYER"0D00
         LDA   L4E00
         BNE   L5076
         JSR   HOME
         LDY   #$0C
         LDX   #$0A
         JSR   L458A
         JSR   L402C
         ASC   "NO CHARACTER ON DISK"00
L5069    LDA   KBD
         CMP   #$9B
         BNE   L5069
         BIT   KBDSTROBE
         JMP   L5000

L5076    JSR   L6706
         BIT   KBDSTROBE
         LDA   L4E00+$11
         ASL
         CLC
         ADC   #$78
         STA   $11
         LDA   #$00
         STA   $D9
         STA   $DA
         STA   $DB
         STA   $DC
         LDA   L4E00+$24
         STA   $00
         LDA   L4E00+$25
         STA   $01
         LDA   L4E00+$33
         BEQ   L50AF
         LDA   L4E00+$34
         STA   $F4
         LDA   L4E00+$35
         STA   $F5
         JSR   L437B
         LDA   #$50
         STA   ($06),Y
L50AF    LDX   #$FF
         LDA   #$FF
L50B3    DEX
         STA   L4B00,X
         STA   L4C00,X
         BNE   L50B3
         JSR   L0240
         LDA   MIXSET
         LDA   HIRES
         LDA   TXTCLR
         JSR   HOME
         LDA   #$FF
         STA   $10
         JSR   L44DE
L50D2    LDA   L4E00+$14
         CMP   #$04
         BCC   L50DC
         JMP   L6CCE

L50DC    JSR   L402C
         ASC   "CMD: "00
         JSR   L6900
         JSR   L6900
         JSR   L6900
         JSR   L6900
         JSR   L6855
         LDA   #$00
         STA   $F2
         LDA   #$E8
         STA   $F3
         LDA   $DC
         BEQ   L511A
         LDA   #$14
         STA   $FC
L5104    JSR   L402C
         ASC   "Z"00
         LDX   #$FF
L510B    DEX
         NOP
         NOP
         NOP
         NOP
         NOP
         BNE   L510B
         DEC   $FC
         BNE   L5104
         JMP   L528B

L511A    LDA   KBD
         BMI   L5175
         INC   $F2
         BNE   L511A
         LDA   $11
         CMP   #$26
         BNE   L512C
         JSR   L43E9
L512C    JSR   L0240
         JSR   L6900
         JSR   L6900
         JSR   L6900
         JSR   L6900
         JSR   L6855
         INC   $4E
         INC   $F3
         BNE   L511A
         INC   $4F
         LDA   #$00
         STA   $FB
         JSR   L402C
         ASC   "PASS"00
L5152    SED
         SEC
         LDA   L4E00+$1F
         SBC   #$0A
         STA   L4E00+$1F
         LDA   L4E00+$1E
         SBC   #$00
         STA   L4E00+$1E
         LDA   L4E00+$1D
         SBC   #$00
         STA   L4E00+$1D
         CLD
         BCS   L5172
         JMP   L6703
L5172    JMP   L528B

L5175    STA   L4E00+$27
         STA   KBDSTROBE
         LDA   L4E00+$27
         CMP   #$A0
         BNE   L5191
         LDA   #$00
         STA   $FB
         JSR   L402C
         ASC   "PASS"00
         JMP   L5152

L5191    CMP   #$8D
         BNE   L51B1
         DEC   $01
         JSR   L402C
         ASC   "NORTH"00
         LDA   $13
         JSR   L69D3
         CMP   #$00
         BEQ   L51AE
         INC   $01
         JMP   L5225
L51AE    JMP   L520F

L51B1    CMP   #$AF       ; /
         BNE   L51D1
         INC   $01
         JSR   L402C
         ASC   "SOUTH"00
         LDA   $14
         JSR   L69D3
         CMP   #$00
         BEQ   L51CE
         DEC   $01
         JMP   L5225
L51CE    JMP   L520F

L51D1    CMP   #$88
         BNE   L51F0
         DEC   $00
         JSR   L402C
         ASC   "WEST"00
         LDA   $16
         JSR   L69D3
         CMP   #$00
         BEQ   L51ED
         INC   $00
         JMP   L5225
L51ED    JMP   L520F

L51F0    CMP   #$95
         BNE   L5218
         INC   $00
         JSR   L402C
         ASC   "EAST"00
         LDA   $15
         JSR   L69D3
         CMP   #$00
         BEQ   L520C
         DEC   $00
         JMP   L5225
L520C    JMP   L520F

L520F    LDA   $FB
         EOR   #$FF
         STA   $FB
         JMP   L528B

L5218    PHA
         LDA   #$00
         STA   $FB
         PLA
L521E    CMP   #$C1
         BCS   L523C
         JMP   L66EA

L5225    JSR   L402C
         ASC   "--INVALID MOVE!"8700
         JMP   L528B

L523C    CMP   #$DB
         BCC   L5243
         JMP   L66EA

L5243    SEC
         SBC   #$C1
         ASL
         TAY
         LDA   L5257,Y
         STA   L5254+1
         LDA   L5257+1,Y
         STA   L5254+2
L5254    JMP   $FFFF

L5257    DA    L6F8B      ; A
         DA    L729D      ; B
         DA    L7407      ; C
         DA    L75B5      ; D
         DA    L75EE      ; E
         DA    L7816      ; F
         DA    L7884      ; G
         DA    L79A1      ; H
         DA    L79B3      ; I
         DA    L79F8      ; J
         DA    L7A0D      ; K
         DA    L7ACE      ; L
         DA    L7D75      ; M
         DA    L7DB1      ; N
         DA    L7E0D      ; O
         DA    L7F69      ; P
         DA    L7F74      ; Q
         DA    L7FFB      ; R
         DA    L80BE      ; S
         DA    L81C7      ; T
         DA    L8426      ; U
         DA    L849F      ; V
         DA    L850C      ; W
         DA    L85D8      ; X
         DA    L8634      ; Y
         DA    L865E      ; Z

L528B    LDA   #$8D
         JSR   COUT
         LDA   #$00
         STA   $F3
         STA   $F1
         STA   $F2
         LDA   L4E00+$14
         BEQ   L52C0
         CMP   #$01
         BNE   L52A4
         JMP   L5723

L52A4    CMP   #$02
         BNE   L52AB
         JMP   L5723

L52AB    CMP   #$03
         BNE   L52B2
         JMP   L5723

L52B2    CMP   #$04
         BNE   L52B9
         JMP   L5809

L52B9    CMP   #$05
         BNE   L52C0
         JMP   L5809

L52C0    LDX   #$1F
L52C2    LDA   L4D00+$60,X
         BEQ   L52E6
         LDA   $11
         CMP   #$22
         BNE   L52EC
         LDA   $FB
         BPL   L52EC
         LDA   L4D00+$60,X
         CMP   #$48
         BEQ   L52EC
         CMP   #$3C
         BEQ   L52EC
         CMP   #$2C
         BEQ   L52EC
         LDA   $11
         CMP   #$22
         BNE   L52EC
L52E6    DEX
         BNE   L52C2
         JMP   L5472

L52EC    JSR   L401B
         STX   $FA
         LDA   $17
         JSR   L44D4
         CMP   #$03
         BCS   L5334
         LDA   $18
         JSR   L44D4
         CMP   #$03
         BCS   L5334
         JSR   L4592
         LDX   $FA
         CMP   #$20
         BCS   L5334
         LDA   L4D00+$60,X
         CMP   #$34
         BNE   L5319
         JSR   L55A1
         JMP   L5334

L5319    CMP   #$38
         BNE   L5323
         JSR   L55EF
         JMP   L5334

L5323    CMP   #$F8
         BNE   L532D
         JSR   L563C
         JMP   L5334

L532D    CMP   #$3C
         BNE   L5334
         JSR   L5668
L5334    LDX   $FA
         JSR   L4000
         LDA   L4D00+$40,X
         CMP   #$0F
         BCS   L534E
         SEC
         LDA   #$00
         SBC   $17
         STA   $17
         SEC
         LDA   #$00
         SBC   $18
         STA   $18
L534E    CLC
         LDA   L4D00+$00,X
         ADC   $17
         AND   #$3F
         CMP   $00
         BEQ   L535D
         JMP   L65E9

L535D    CLC
         LDA   L4D00+$20,X
         ADC   $18
         AND   #$3F
         CMP   $01
         BEQ   L536C
         JMP   L65E9

L536C    INC   $F1
         STX   $FC
         LDA   L4D00+$60,X
         CMP   #$FC
         BNE   L537A
         JSR   L56E7
L537A    JSR   L4592
         LDX   $FC
         CMP   #$00
         BMI   L539D
         AND   #$07
         CMP   L4E00+$2C
         BCC   L539D
         INC   $F2
         LDA   L4D00+$40,X
         LSR
         LSR
         SEC
         ADC   $F3
         LDY   $12
         CPY   #$06
         BNE   L539B
         ASL
L539B    STA   $F3
L539D    LDA   L4E00+$14
         BEQ   L53A5
         JMP   L573E
L53A5    JMP   L52E6

L53A8    JSR   L0240
L53AB    LDA   $F1
         BEQ   L53D0
         LDA   #$7E
         STA   $A0
         LDA   #$00
         STA   $A1
         LDA   #$6F
         STA   $A2
         JSR   L43AF
         DEC   $F1
         DEC   $F2
         BMI   L53AB
         JSR   L45E1
         JSR   L4419
         JSR   L45E1
         JMP   L53AB

L53D0    LDA   $F3
         BEQ   L5409
         JSR   L4592
         AND   $F3
         AND   #$77
         CLC
         ADC   #$01
         STA   $F3
         SED
         SEC
         LDA   L4E00+$1C
         SBC   $F3
         STA   L4E00+$1C
         LDA   L4E00+$1B
         SBC   #$00
         STA   L4E00+$1B
         CLD
         BCC   L5437
         LDA   L4E00+$14
         BEQ   L5409
         STA   $F3
         SED
         SEC
         LDA   L4E00+$1B
         SBC   $F3
         STA   L4E00+$1B
         CLD
         BCC   L5437
L5409    JSR   L44DE
         LDA   #$04
         STA   $10
         LDA   L4E00+$14
         BNE   L541C
         LDA   #$FF
         STA   $10
         JSR   L6C3C
L541C    LDA   $DA
         BEQ   L5422
         DEC   $DA
L5422    LDA   $DB
         BEQ   L5428
         DEC   $DB
L5428    LDA   $DC
         BEQ   L542E
         DEC   $DC
L542E    LDA   $D9
         BEQ   L5434
         DEC   $D9
L5434    JMP   L50D2

L5437    LDA   #$00
         STA   L4E00+$1B
         STA   L4E00+$1C
         STA   L4E00+$1D
         STA   L4E00+$1E
         STA   L4E00+$1F
         STA   L4E00+$20
         STA   L4E00+$21
         STA   L4E00+$22
         STA   L4E00+$23
         JSR   L44DE
         JSR   L402C
         ASC   8D8D8D00
         JSR   L4084
         JSR   L402C
         ASC   " IS DEAD!"8D00
L546F    JMP   L546F

L5472    LDX   #$1F
L5474    LDA   L4D00+$60,X
         BEQ   L547F
         DEX
         BNE   L5474
         JMP   L53A8

L547F    STX   $F0
         JSR   L4592
         CMP   #$3F
         BCC   L548B
         JMP   L53A8

L548B    LDX   $F0
         STA   L4D00+$00,X
         STA   $F4
         JSR   L4592
         AND   #$3F
         BCC   L549C
         JMP   L53A8

L549C    LDX   $F0
         STA   L4D00+$20,X
         STA   $F5
         JSR   L437B
         LDX   $F0
         STA   L4D00+$80,X
         INC   L4E00+$2A
         LDA   L4E00+$2A
         LSR
         BCS   L54CC
         LSR
         BCS   L54E2
         LSR
         BCS   L54F8
         LSR
         BCS   L550E
         LSR
         BCS   L5533
         LSR
         BCS   L552A
         LSR
         BCS   L552D
         LSR
         BCS   L5530
         JMP   L558B

L54CC    LDA   L4D00+$80,X
         CMP   #$08
         BNE   L5524
         LDA   #$30
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$10
         STA   L4D00+$40,X
         JMP   L53A8

L54E2    LDA   L4D00+$80,X
         CMP   #$08
         BNE   L5524
         LDA   #$FC
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$20
         STA   L4D00+$40,X
         JMP   L53A8

L54F8    LDA   L4D00+$80,X
         CMP   #$08
         BNE   L5524
         LDA   #$34
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$40
         STA   L4D00+$40,X
         JMP   L53A8

L550E    LDA   L4D00+$80,X
         CMP   #$00
         BNE   L5524
         LDA   #$2C
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$40
         STA   L4D00+$40,X
         JMP   L53A8

L5524    DEC   L4E00+$2A
         JMP   L53A8
L552A    JMP   L5549
L552D    JMP   L555F
L5530    JMP   L5575

L5533    LDA   L4D00+$80,X
         CMP   #$08
         BNE   L5524
         LDA   #$F0
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$80
         STA   L4D00+$40,X
         JMP   L53A8

L5549    LDA   L4D00+$80,X
         CMP   #$00
         BNE   L5524
         LDA   #$48
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$A0
         STA   L4D00+$40,X
         JMP   L53A8

L555F    LDA   L4D00+$80,X
         CMP   #$08
         BNE   L5524
         LDA   #$38
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$C0
         STA   L4D00+$40,X
         JMP   L53A8

L5575    LDA   L4D00+$80,X
         CMP   #$08
         BNE   L5524
         LDA   #$F8
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$E0
         STA   L4D00+$40,X
         JMP   L53A8

L558B    LDA   L4D00+$80,X
         CMP   #$08
         BNE   L5524
         LDA   #$3C
         STA   ($06),Y
         STA   L4D00+$60,X
         LDA   #$FF
         STA   L4D00+$40,X
         JMP   L53A8

L55A1    JSR   L402C
         ASC   "LEGS PARALIZED!"0D00
         JSR   L404D
         JSR   L44A7
         JSR   L404D
         LDA   L4E00+$A3
         BEQ   L55E7
         JSR   L4592
         CMP   #$40
         BCC   L55E7
         JSR   L402C
         ASC   "SAVED BY MAGICAL BOOTS!"8D00
         RTS

L55E7    JSR   L4592
         AND   #$0F
         STA   $DA
         RTS

L55EF    JSR   L402C
         ASC   "ARMS PARALIZED!"0D00
         JSR   L404D
         JSR   L44A7
         JSR   L404D
         LDA   L4E00+$A4
         BEQ   L5634
         JSR   L4592
         CMP   #$40
         BCC   L5634
         JSR   L402C
         ASC   "SAVED BY MAGICAL CLOAK"8D00
         RTS

L5634    JSR   L4592
         AND   #$0F
         STA   $DB
         RTS

L563C    JSR   L402C
         ASC   "MAGIC MISSILE!"0D00
         JSR   L404D
         JSR   L44A7
         JSR   L404D
         INC   $F1
         INC   $F1
         INC   $F2
         INC   $F2
         CLC
         LDA   $F3
         ADC   #$40
         STA   $F3
         RTS

L5668    JSR   L402C
         ASC   "SLEEP SPELL!"0D00
         JSR   L404D
         JSR   L44A7
         JSR   L404D
         LDA   L4E00+$AE
         BEQ   L56A2
         JSR   L4592
         CMP   #$40
         BCC   L56A2
         JSR   L402C
         ASC   "SAVED BY IDOL!"8D00
         RTS

L56A2    JSR   L4592
         AND   #$0F
         STA   $DC
         RTS

L56AA    JSR   L402C
         ASC   "MINAX CRIES: DIE FOOL!"8D00
         LDA   #$00
         STA   $17
         STA   $18
         JSR   L459D
         JSR   L4419
         JSR   L459D
         SED
         SEC
         LDA   L4E00+$1B
         SBC   #$01
         STA   L4E00+$1B
         CLD
         BCS   L56E6
         BCS   L56E6
         JMP   L5437
L56E6    RTS

L56E7    JSR   L4592
         CMP   #$40
         BCC   L56EF
         RTS

L56EF    JSR   L4592
         AND   #$0F
         TAX
         LDA   L4E00+$A0,X
         BEQ   L5722
         SED
         SEC
         LDA   L4E00+$A0,X
         SBC   #$01
         STA   L4E00+$A0,X
         CLD
         JSR   L402C
         ASC   "A THIEF STOLE SOMETHING!"8D00
L5722    RTS

L5723    LDX   #$1F
L5725    STX   $F6
         LDA   L4D00+$60,X
         BEQ   L573E
         LDA   L4D00+$A0,X
         BEQ   L573E
         BMI   L573E
         CMP   #$03
         BCS   L5773
         CMP   #$02
         BEQ   L576A
         JMP   L5770

L573E    LDA   L4D00+$60,X
         CMP   #$40
         BNE   L5762
         LDA   L4D00+$00,X
         SEC
         SBC   $00
         JSR   L44D4
         CMP   #$04
         BCS   L5762
         LDA   L4D00+$20,X
         SEC
         SBC   $01
         JSR   L44D4
         CMP   #$04
         BCS   L5762
         JSR   L56AA
L5762    LDX   $F6
         DEX
         BPL   L5725
         JMP   L53A8

L576A    JSR   L4000
         JMP   L65E9
L5770    JMP   L52EC

L5773    LDX   $F6
         LDA   L4D00+$C0,X
         STA   $17
         LDA   L4D00+$E0,X
         STA   $18
         JSR   L4592
         CMP   #$40
         BCS   L57A0
         JSR   L4592
         JSR   L44BD
         LDX   $F6
         STA   L4D00+$C0,X
         STA   $17
         JSR   L4592
         JSR   L44BD
         LDX   $F6
         STA   L4D00+$E0,X
         STA   $18
L57A0    LDX   $F6
         CLC
         LDA   L4D00+$00,X
         ADC   $17
         AND   #$3F
         STA   $F4
         CMP   #$04
         BCS   L57B3
         JMP   L573E

L57B3    CMP   #$3C
         BCC   L57BA
         JMP   L573E

L57BA    CMP   $00
         BNE   L57C1
         JMP   L573E

L57C1    CLC
         LDA   L4D00+$20,X
         ADC   $18
         AND   #$3F
         STA   $F5
         CMP   #$04
         BCS   L57D2
         JMP   L573E

L57D2    CMP   #$3C
         BCC   L57D9
         JMP   L573E

L57D9    CMP   $01
         BNE   L57E0
         JMP   L573E

L57E0    JSR   L437B
         CMP   #$70
         BEQ   L57EE
         CMP   #$08
         BEQ   L57EE
         JMP   L573E

L57EE    LDX   $F6
         JMP   L669B

L57F3    LDA   L4E00+$14
         BNE   L57F9
         RTS

L57F9    LDX   #$07
         LDA   #$01
L57FD    STA   L4D00+$A0,X
         DEX
         BPL   L57FD
         LDX   $F1
         STA   L4D00+$A0,X
         RTS

L5809    JSR   L5A74
         LDX   #$1F
         STX   $F0
L5810    LDA   L4D00+$60,X
         BNE   L581E
L5815    DEC   $F0
         LDX   $F0
         BNE   L5810
         JMP   L58D5

L581E    LDX   $F0
         JSR   L5AE0
         LDA   L4D00+$40,X
         CMP   #$0F
         BCS   L5838
         SEC
         LDA   #$00
         SBC   $17
         STA   $17
         SEC
         LDA   #$00
         SBC   $18
         STA   $18
L5838    LDA   $17
         BEQ   L5863
         CLC
         ADC   L4D00+$00,X
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         LDA   $F4
         CMP   $00
         BNE   L5856
         LDA   $F5
         CMP   $01
         BNE   L5856
         JMP   L5951

L5856    JSR   L5A53
         BEQ   L5891
         CMP   #$FF
         BEQ   L5863
         AND   #$7F
         BNE   L5891
L5863    LDA   $18
         BEQ   L588E
         CLC
         ADC   L4D00+$20,X
         STA   $F5
         LDA   L4D00+$00,X
         STA   $F4
         LDA   $F4
         CMP   $00
         BNE   L5881
         LDA   $F5
         CMP   $01
         BNE   L5881
         JMP   L5951

L5881    JSR   L5A53
         BEQ   L5891
         CMP   #$FF
         BEQ   L588E
         AND   #$7F
         BNE   L5891
L588E    JMP   L5815

L5891    JSR   L5A5D
         AND   #$07
         BEQ   L589B
         JMP   L5815

L589B    LDA   $F4
         STA   L4D00+$C0,X
         LDA   $F5
         STA   L4D00+$E0,X
         LDA   L4D00+$00,X
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         JSR   L5A5D
         LDA   ($06),Y
         AND   #$F0
         STA   ($06),Y
         LDA   L4D00+$C0,X
         STA   $F4
         STA   L4D00+$00,X
         LDA   L4D00+$E0,X
         STA   $F5
         STA   L4D00+$20,X
         JSR   L5A5D
         LDA   ($06),Y
         ORA   L4D00+$60,X
         STA   ($06),Y
         JMP   L5815

L58D5    LDA   $FB
         BNE   L58EE
         JSR   L5917
         JSR   L402C
         ASC   "IT'S DARK!"8D00
         JMP   L5909

L58EE    DEC   $FB
         BNE   L5909
         JSR   L402C
         ASC   "TORCH BURNED OUT!"878D00
L5909    JSR   L8900
         LDA   #$10
         JSR   L592E
         JSR   L44DE
         JMP   L50D2

L5917    LDA   #$3F       ; DARKNESS
         STA   $07
         LDA   #$00
         STA   $06
         TAY
L5920    STA   ($06),Y
         DEY
         BNE   L5920
         DEC   $07
         LDX   $07
         CPX   #$20
         BCS   L5920
         RTS

L592E    STA   $F1
         SED
         SEC
         LDA   L4E00+$1F
         SBC   $F1
         STA   L4E00+$1F
         LDA   L4E00+$1E
         SBC   #$00
         STA   L4E00+$1E
         LDA   L4E00+$1D
         SBC   #$00
         STA   L4E00+$1D
         CLD
         BCS   L5950
         JMP   L5437
L5950    RTS

L5951    JSR   L4592
         CMP   #$40
         BCS   L597C
         LDX   $F0
         LDA   $F6
         CMP   L4D00+$80,X
         BEQ   L5964
         JMP   L5815

L5964    LDA   L4D00+$60,X
         CMP   #$02
         BNE   L596E
         JMP   L59CF

L596E    CMP   #$05
         BNE   L5975
         JMP   L59F8

L5975    CMP   #$07
         BNE   L597C
         JMP   L5A2B

L597C    LDX   $F0
         LDA   $F6
         CMP   L4D00+$80,X
         BEQ   L5988
         JMP   L5815

L5988    JSR   L43AF
         JSR   L4592
         BMI   L5997
         AND   #$07
         CMP   L4E00+$2C
         BCS   L599A
L5997    JMP   L5815

L599A    JSR   L404D
         JSR   L4419
         JSR   L404D
         JSR   L4592
         AND   #$77
         STA   $F1
         LDA   $F6
         ASL
         ASL
         AND   #$77
         SED
         ADC   $F1
         STA   $F1
         SEC
         LDA   L4E00+$1C
         SBC   $F1
         STA   L4E00+$1C
         LDA   L4E00+$1B
         SBC   #$00
         STA   L4E00+$1B
         CLD
         BCS   L59CC
         JMP   L5437
L59CC    JMP   L5815

L59CF    LDA   $FB
         BEQ   L59F5
         JSR   L402C
         ASC   "YOUR TORCH IS BLOWN OUT!"878D00
         LDA   #$00
         STA   $FB
L59F5    JMP   L5815

L59F8    JSR   L402C
         ASC   "A GREMLIN STOLE SOME FOOD!"878D00
         SED
         SEC
         LDA   L4E00+$1D
         SBC   #$01
         STA   L4E00+$1D
         CLD
         BCC   L5A28
         JMP   L5815
L5A28    JMP   L5437

L5A2B    JSR   L402C
         ASC   "YOU FEEL A STRONG MAGIC!"878D00
         JSR   L4592
         AND   #$07
         STA   $DC
         JMP   L5815

L5A53    LDA   $F6
         CMP   L4D00+$80,X
         BEQ   L5A5D
         LDA   #$FF
         RTS

L5A5D    LDA   L4D00+$80,X
L5A60    CLC
         ADC   #$10
         STA   $07
         LDA   $F5
         ASL
         ASL
         ASL
         ASL
         ADC   $F4
         STA   $06
         LDY   #$00
         LDA   ($06),Y
         RTS

L5A74    LDX   #$1F
L5A76    STX   $F0
         LDA   L4D00+$60,X
         BEQ   L5A83
L5A7D    LDX   $F0
         DEX
         BNE   L5A76
         RTS

L5A83    JSR   L4592
         LDX   $F0
         AND   #$07
         ASL
         ORA   #$01
         STA   L4D00+$00,X
         STA   $F4
         JSR   L4592
         LDX   $F0
         AND   #$07
         ASL
         ORA   #$01
         STA   L4D00+$20,X
         STA   $F5
         TXA
         LSR
         STA   L4D00+$80,X
         JSR   L5A5D
         BNE   L5A7D
         JSR   L4592
         LDX   $F0
         AND   #$07
         CMP   #$07
         BEQ   L5ABE
         ASL
         CMP   L4D00+$80,X
         BEQ   L5AC1
         BCC   L5AC1
L5ABE    JMP   L5A7D

L5AC1    LSR
         ADC   #$01
         STA   L4D00+$60,X
         ASL
         ADC   L4D00+$80,X
         ASL
         ASL
         ASL
         ORA   #$10
         STA   L4D00+$40,X
         JSR   L5A5D
         LDA   ($06),Y
         ORA   L4D00+$60,X
         STA   ($06),Y
         JMP   L5A7D

L5AE0    LDA   $00
         SEC
         SBC   L4D00+$00,X
         JSR   L44BD
         STA   $17
         LDA   $01
         SEC
         SBC   L4D00+$20,X
         JSR   L44BD
         STA   $18
         RTS

L5AF7    TAY
         LDA   #$00
         STA   $FC
         LDA   #$4F
         STA   $FD
         LDX   #$00
L5B02    LDA   ($FC,X)
         BEQ   L5B0C
L5B06    JSR   L5B20
         JMP   L5B02

L5B0C    DEY
         BEQ   L5B12
         JMP   L5B06

L5B12    JSR   L5B20
         LDA   ($FC,X)
         BEQ   L5B1F
         JSR   COUT
         JMP   L5B12
L5B1F    RTS

L5B20    LDA   $FC
         CLC
         ADC   #$01
         STA   $FC
         LDA   $FD
         ADC   #$00
         STA   $FD
         RTS

L5B2E    LDA   $00
         CMP   #$20
         BCC   L5B3D
         LDA   $01
         CMP   #$20
         BCC   L5B46
         JMP   L5B60

L5B3D    LDA   $01
         CMP   #$20
         BCC   L5B53
         JMP   L5B6D

L5B46    LDA   L4E00+$14
         CMP   #$02
         BNE   L5B50
         JMP   L6268
L5B50    JMP   L5D1B

L5B53    LDA   L4E00+$14
         CMP   #$02
         BNE   L5B5D
         JMP   L6384
L5B5D    JMP   L6036

L5B60    LDA   L4E00+$14
         CMP   #$02
         BNE   L5B6A
         JMP   L6495
L5B6A    JMP   L5DBC

L5B6D    LDA   L4E00+$14
         CMP   #$02
         BNE   L5B77
         JMP   L5B7A
L5B77    JMP   L5F17

L5B7A    JSR   L402C
         ASC   "WELCOME TO THE PUB!"0D
         ASC   "1-BUY, 2-TIP --- "00
         JSR   L653E
         CMP   #$01
         BEQ   L5BB1
         CMP   #$02
         BEQ   L5BE3
         JMP   L528B

L5BB1    LDA   #$05
         STA   $FD
         LDA   #$00
         STA   $FC
         JSR   L655D
         JSR   L402C
         ASC   "HERE, HAVE A STRONG ONE!"0D00
         JSR   L4592
         AND   #$03
         LDA   #$01
         JMP   L5C12

L5BE3    JSR   L402C
         ASC   "TIP HOW MUCH? "00
         JSR   L653E
         STA   $F6
         STA   $FD
         LDA   #$00
         STA   $FC
         JSR   L655D
         JSR   L4592
         JSR   L44BD
         CLC
         ADC   $F6
         CMP   #$0A
         BCC   L5C12
         LDA   #$00
L5C12    STA   $F6
         JSR   L402C
         ASC   "THE BARKEEP SAYS:"0D00
         LDA   $F6
         TAY
         INY
         LDA   #<L5C3E
         STA   $FC
         LDA   #>L5C3E
         STA   $FD
         LDX   #$00
         JSR   L5B02
         JMP   L528B

L5C3E    ASC   00
         ASC   "CAUGH..."00
         ASC   "ISN'T THIS A GREAT GAME?"00
         ASC   "HHMMM..."00
         ASC   "SOME FIGHTERS WEAR MAGIC HELMS!"00
         ASC   "AVIATORS USE SKULL KEYS!"00
         ASC   "SAYLORS WEAR BLUE TASSLES!"00
         ASC   "MAGES CARRY WANDS OR STAFFS!"00
         ASC   "GUARDS CARRY KEYS!"00
         ASC   "ANKHS OPEN SPACE!"00
         ASC   "PLANES NEED BRASS BUTTONS!"00
L5D1B    JSR   L402C
         ASC   "THE FOOD HERE COSTS "00
         LDA   #$03
         JSR   L65A9
         LDA   $FC
         LDX   $FD
         JSR   PRNTAX
         JSR   L402C
         ASC   8D
         ASC   "PER 100, WANT ONE? "00
L5D57    LDA   KBD
         BPL   L5D57
         BIT   KBDSTROBE
         CMP   #$D9
         BEQ   L5D6C
         JSR   L402C
         ASC   "NO"00
         JMP   L528B

L5D6C    JSR   L402C
         ASC   "YES,"8D
         ASC   "NO ONIONS AND TO GO PLEASE!"8D00
         JSR   L655D
         SED
         CLC
         LDA   L4E00+$1D
         ADC   #$01
         STA   L4E00+$1D
         CLD
         JSR   L402C
         ASC   "THANK YOU, COME AGAIN!"00
         JMP   L528B

L5DBC    LDA   L4E00+$11
         CMP   #$01
         BEQ   L5DE3
         JSR   L4084
         JSR   L402C
         ASC   " YOU ARE NOT A CLERIC!"00
         JMP   L528B

L5DE3    JSR   L402C
         ASC   "WELCOME "00
         LDA   L4E00+$10
         CMP   #$01
         BEQ   L5E05
         JSR   L402C
         ASC   "BROTHER "00
         JMP   L5E10

L5E05    JSR   L402C
         ASC   "SISTER "00
L5E10    JSR   L4084
         JSR   L402C
         ASC   8D
         ASC   "1-LIGHT, 2-L.D., 3-L.U.,"8D
         ASC   "4-PASS 5-SURFACE, 6-PRAYER."8D
         ASC   "YOUR INTEREST? "00
         JSR   L653E
         BEQ   L5E68
         CMP   #$07
         BCS   L5E68
         JMP   L5E88

L5E68    JSR   L402C
         ASC   "FOLLOW THE LIGHT, FRIEND!"00
         JMP   L528B

L5E88    STA   $F0
         JSR   L402C
         ASC   "FIVE "00
         LDA   $F0
         CLC
         ADC   #$24
         JSR   L409C
         JSR   L402C
         ASC   "S FOR "00
         LDA   $F0
         JSR   L65A9
         LDA   $FC
         LDX   $FD
         JSR   PRNTAX
         JSR   L402C
         ASC   8D
         ASC   "YES, FRIEND? "00
L5EC3    LDA   KBD
         BPL   L5EC3
         BIT   KBDSTROBE
         CMP   #$D9
         BEQ   L5EED
         JSR   L402C
         ASC   "NO"8D
         ASC   "I'M SORRY, GOOD DAY."00
         JMP   L528B

L5EED    JSR   L402C
         ASC   "YES,"8D
         ASC   "I WILL TAKE 5!"00
         JSR   L655D
         LDX   $F0
         LDA   L4E00+$80,X
         CLC
         SED
         ADC   #$05
         CLD
         STA   L4E00+$80,X
         JMP   L528B

L5F17    JSR   L4084
         LDA   L4E00+$11
         CMP   #$02
         BEQ   L5F3E
         JSR   L402C
         ASC   " YOU ARE NOT A WIZARD!"00
         JMP   L528B

L5F3E    JSR   L402C
         ASC   " MUSERREF OLDUM!"8D
         ASC   "1-LIGHT, 2-L.D., 3-L.U.,"8D
         ASC   "4-M.M., 5-BLINK, 6-KILL,"8D
         ASC   "BIR IKI UC...? "00
         JSR   L653E
         BEQ   L5FA0
         CMP   #$07
         BCS   L5FA0
         JMP   L5FB5

L5FA0    JSR   L402C
         ASC   8D
         ASC   "UGURLA OLSUN!"00
         JMP   L528B

L5FB5    CMP   #$04
         BCC   L5FBC
         CLC
         ADC   #$03
L5FBC    STA   $F0
         JSR   L402C
         ASC   "FIVE "00
         LDA   $F0
         CLC
         ADC   #$24
         JSR   L409C
         JSR   L402C
         ASC   "S FOR "00
         LDA   $F0
         JSR   L65A9
         LDA   $FC
         LDX   $FD
         JSR   PRNTAX
         JSR   L402C
         ASC   8D
         ASC   "LUTFEN EVET? "00
L5FF7    LDA   KBD
         BPL   L5FF7
         BIT   KBDSTROBE
         CMP   #$D9       ; Y
         BEQ   L600D
         JSR   L402C
         ASC   "NO!"00
         JMP   L5FA0

L600D    JSR   L402C
         ASC   "YES"8D00
         JSR   L655D
         SED
         CLC
         LDX   $F0
         LDA   L4E00+$80,X
         ADC   #$05
         STA   L4E00+$80,X
         CLD
         JSR   L402C
         ASC   "GULE GULE!"00
         JMP   L528B

L6036    JSR   L402C
         ASC   "TIME AND TRAVEL MADE ME WISE,"0D
         ASC   "PRECIOUS GOLD, A CLUE IT BUYS!HOW MUCH "
         ASC   "WILL YOU PAY *100?"00
         JSR   L653E
         STA   $F0
         STA   $FC
         LDA   #$00
         STA   $FD
         JSR   L655D
         LDY   $F0
         INY
         LDA   #<L60B5
         STA   $FC
         LDA   #>L60B5
         STA   $FD
         LDX   #$00
         JSR   L5B02
         JMP   L528B
         JMP   L528B

L60B5    ASC   00
         ASC   "ASK ME NO QUESTIONS,"8D
         ASC   "I'LL TELL YOU NO LIES."00
         ASC   "THE QUEEN IS THE KING"8D
         ASC   "AND THE KING IS A SPY."00
         ASC   "THE EVIL MEN DO"8D
         ASC   "IS A HORRABLE THING."00
         ASC   "BUT DISPELLING MEANS"8D
         ASC   "THAT YOU MUST HAVE THE RING."00
         ASC   "JUST WHERE IT IS,"8D
         ASC   "I CANNOT SAY."00
         ASC   "BUT I'LL TELL YOU RIGHT NOW,"8D
         ASC   "THERE IS NO OTHER WAY."00
         ASC   "I HEAR IN A TOWN"8D
         ASC   "WHERE THE WATER RUNS FREE."00
         ASC   "THERE IS AN OLD MAN"8D
         ASC   "LIVING UNDER A TREE."00
         ASC   "HE HAS NOT A NAME"8D
         ASC   "BUT HE DOES HAVE A CLUE"00
         ASC   "MAYHAPS IF YOU FIND HIM,"8D
         ASC   "HE'LL TELL IT TO YOU!"00
L6268    JSR   L402C
         ASC   "     THE ARMOUR SHOPPE:"0D
         ASC   "1-CLOTH, 2-LEATHER, 3-CHAIN,"0D
         ASC   "4-PLATE, 5-REFLECT, 6-POWER,"0D
         ASC   "YOUR INTEREST? "00
         JSR   L653E
         BEQ   L62D9
         CMP   #$07
         BCS   L62D9
         JMP   L62F7

L62D9    JSR   L402C
         ASC   "THANKS FOR COMING BY..."00
         JMP   L528B

L62F7    STA   $F0
         JSR   L402C
         ASC   "AH! YES! "00
         LDA   $F0
         CLC
         ADC   #$1D
         JSR   L409C
         JSR   L402C
         ASC   0D
         ASC   "FOR YOU ONLY "00
         LDA   $F0
         ASL
         JSR   L65A9
         LDA   $FC
         LDX   $FD
         JSR   PRNTAX
         JSR   L402C
         ASC   0D
         ASC   "HOW 'BOUT IT? "00
L6340    LDA   KBD
         BPL   L6340
         BIT   KBDSTROBE
         STA   $F2
         JSR   COUT
         LDA   #$8D
         JSR   COUT
         LDA   $F2
         CMP   #$D9
         BEQ   L6368
         JSR   L402C
         ASC   "OH, WELL."00
         JMP   L528B

L6368    JSR   L655D
         JSR   L402C
         ASC   "SOLD!"00
         LDX   $F0
         LDA   L4E00+$60,X
         SED
         CLC
         ADC   #$01
         CLD
         STA   L4E00+$60,X
         JMP   L528B

L6384    JSR   L402C
         ASC   "  THE WEAPONS SHOPPE:"0D
         ASC   "1-DA, 2-MA, 3-AX, 4-BO,"0D
         ASC   "5-SW, 6-GR, 7-LI, 8-PH."0D
         ASC   "YOUR INTEREST? "00
         JSR   L653E
         BEQ   L63E9
         CMP   #$09
         BEQ   L63E9
         JMP   L6407

L63E9    JSR   L402C
         ASC   "THANKS FOR COMING BY..."00
         JMP   L528B

L6407    STA   $F0
         JSR   L402C
         ASC   "AH! YES! A "00
         LDA   $F0
         CLC
         ADC   #$13
         JSR   L409C
         JSR   L402C
         ASC   0D
         ASC   "FOR YOU ONLY "00
         LDA   $F0
         JSR   L65A9
         LDA   $FC
         LDX   $FD
         JSR   PRNTAX
         JSR   L402C
         ASC   0D
         ASC   "HOW 'BOUT IT? "00
L6451    LDA   KBD
         BPL   L6451
         BIT   KBDSTROBE
         STA   $F2
         JSR   COUT
         LDA   #$8D
         JSR   COUT
         LDA   $F2
         CMP   #$D9       ; Y
         BEQ   L6479
         JSR   L402C
         ASC   "OH, WELL."00
         JMP   L528B

L6479    JSR   L655D
         JSR   L402C
         ASC   "SOLD!"00
         LDX   $F0
         LDA   L4E00+$40,X
         SED
         CLC
         ADC   #$01
         CLD
         STA   L4E00+$40,X
         JMP   L528B

L6495    JSR   L402C
         ASC   "WELCOME, TO THE TRANSPORT"0D
         ASC   "SHOPPE. I SELL YOU HORSE "00
         LDA   #$04
         JSR   L65A9
         LDA   $FC
         LDX   $FD
         JSR   PRNTAX
         JSR   L402C
         ASC   0D
         ASC   "GOLD, DEAL, OK? --- "00
L64F1    LDA   KBD
         BPL   L64F1
         PHA
         JSR   COUT
         LDA   #$8D
         JSR   COUT
         PLA
         BIT   KBDSTROBE
         CMP   #$D9       ; Y
         BEQ   L651F
         JSR   L402C
         ASC   0D
         ASC   "O.K. BYE THEN..."00
         JMP   L528B

L651F    JSR   L655D
         JSR   L402C
         ASC   8D
         ASC   "RIDE SWIFTLY!"00
         LDA   #$22
         STA   $11
         JMP   L528B
         JMP   L528B

L653E    LDA   KBD
         CMP   #$B0
         BCC   L653E
         CMP   #$BA
         BCS   L653E
         SEC
         SBC   #$B0
         TAX
         CLC
         ADC   #$B0
         JSR   COUT
         LDA   #$8D
         JSR   COUT
         BIT   KBDSTROBE
         TXA
         RTS

L655D    SED
         SEC
         LDA   L4E00+$23
         SBC   $FD
         STA   L4E00+$23
         LDA   L4E00+$22
         SBC   $FC
         STA   L4E00+$22
         BCS   L65A5
         CLC
         LDA   L4E00+$23
         ADC   $FD
         STA   L4E00+$23
         LDA   L4E00+$22
         ADC   $FC
         STA   L4E00+$22
         CLD
         PLA
         PLA
         JSR   L402C
         ASC   "YOU DONT HAVE THAT MUCH!"8700
         JMP   L528B

L65A5    CLD
         LDA   #$00
         RTS

L65A9    CLC
         ADC   #$08
         STA   $F1
         LDA   #$00
         STA   $FC
         STA   $FA
         LDA   #$04
         STA   $FD
         STA   $FB
         LDA   L4E00+$1A
         ADC   L4E00+$18
         LDY   #$00
L65C2    INY
         LSR
         BNE   L65C2
         LDA   $F1
         STY   $F1
         SEC
         SBC   $F1
         TAX
         SED
L65CF    CLC
         LDA   $FB
         ADC   $FD
         LDY   $FD
         STY   $FB
         STA   $FD
         LDA   $FA
         ADC   $FC
         LDY   $FC
         STY   $FA
         STA   $FC
         DEX
         BNE   L65CF
         CLD
         RTS

L65E9    LDA   L4D00+$40,X
         CMP   #$10
         BCS   L65F3
         INC   L4D00+$40,X
L65F3    CLC
         LDA   L4D00+$00,X
         ADC   $17
         AND   #$3F
         STA   $F4
         CLC
         LDA   L4D00+$20,X
         ADC   $18
         AND   #$3F
         STA   $F5
         JSR   L437B
         JSR   L6648
         BNE   L6612
         JMP   L669B

L6612    LDA   $18
         BEQ   L6626
         LDA   L4D00+$00,X
         STA   $F4
         JSR   L437B
         JSR   L6648
         BNE   L6626
         JMP   L669B

L6626    CLC
         LDA   L4D00+$00,X
         ADC   $17
         AND   #$3F
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         JSR   L437B
         JSR   L6648
         BEQ   L669B
L663D    LDA   L4E00+$14
         BEQ   L6645
         JMP   L573E
L6645    JMP   L52E6

L6648    STA   $F0
         LDA   $D9
         BEQ   L6651
         JMP   L6698

L6651    LDA   L4D00+$60,X
         CMP   #$2C
         BEQ   L667F
         CMP   #$48
         BEQ   L667F
         CMP   #$78
         BCS   L6666
         LDA   $F0
         CMP   #$5C
         BEQ   L6688
L6666    LDA   $F0
         CMP   #$10
         BEQ   L6698
         CMP   #$04
         BEQ   L6698
         CMP   #$00
         BEQ   L6698
         CMP   #$14
         BCC   L6688
         CMP   #$70
         BEQ   L6688
         JMP   L6698

L667F    LDA   $F0
         CMP   #$00
         BNE   L6698
         JMP   L6688

L6688    LDA   L4E00+$14
         BEQ   L6695
         LDA   $F4
         BEQ   L6698
         LDA   $F5
         BEQ   L6698
L6695    LDA   #$00
         RTS

L6698    LDA   #$FF
         RTS

L669B    LDA   $00
         CMP   $F4
         BNE   L66AA
         LDA   $01
         CMP   $F5
         BNE   L66AA
         JMP   L663D

L66AA    LDA   $F4
         STA   $FC
         LDA   $F5
         STA   $FD
         LDA   L4D00+$00,X
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         JSR   L437B
         LDA   L4D00+$80,X
         LDY   #$00
         STA   ($06),Y
         LDA   $FC
         STA   $F4
         STA   L4D00+$00,X
         LDA   $FD
         STA   $F5
         STA   L4D00+$20,X
         JSR   L437B
         STA   L4D00+$80,X
         LDA   L4D00+$60,X
         STA   ($06),Y
         LDA   L4E00+$14
         BEQ   L66E7
         JMP   L573E
L66E7    JMP   L52E6

L66EA    JSR   L402C
         ASC   87
         ASC   "-ILLEGAL COMMAND!"00
         JMP   L528B
L6703    JMP   L5437

L6706    CLC
         LDA   L4E00+$13
         ADC   #$B0
         STA   L6721+$B
         STA   L672F+$B
         LDA   L4E00+$14
         ADC   #$B0
         STA   L6721+$C
         STA   L672F+$C
         JSR   L402C
         ASC   0D
L6721    ASC   04
         ASC   "BLOAD MAP FF"0D
L672F    ASC   04
         ASC   "BLOAD MON FF"0D00
         RTS

L673F    CLC
         LDA   L4E00+$13
         ADC   #$B0
         STA   L6754+$B
         LDA   L4E00+$14
         ADC   #$B0
         STA   L6754+$C
         JSR   L402C
         ASC   0D
L6754    ASC   04
         ASC   "BLOAD TLK FF"0D00
         RTS

L6764    LDA   L4E00+$37
         BEQ   L676A
         RTS

L676A    CLC
         LDA   L4E00+$13
         ADC   #$B0
         STA   L678F+$B
         STA   L67AB+$B
         LDA   L4E00+$14
         ADC   #$B0
         STA   L678F+$C
         STA   L67AB+$C
         LDA   $00
         STA   L4E00+$24
         LDA   $01
         STA   L4E00+$25
         JSR   L402C
         ASC   0D
L678F    ASC   04
         ASC   "BSAVE MAP FF,A$1000,L$1000"0D
L67AB    ASC   04
         ASC   "BSAVE MON FF,A$4D00,L$100"0D00
         JSR   L402C
         ASC   04
         ASC   "BSAVE PLAYER,A$4E00,L$100"0D00
         RTS

L67E7    LDA   #$00
         STA   $F0
         STA   $F1
         STA   $17
         STA   $18
L67F1    LDA   KBD
         BMI   L6811
         NOP
         NOP
         NOP
         NOP
         NOP
         INC   $F0
         BNE   L67F1
         INC   $F1
         BNE   L67F1
         PLA
         PLA
         JSR   L402C
         ASC   87
         ASC   "PASS"00
         JMP   L528B

L6811    BIT   KBDSTROBE
         CMP   #$8D
         BEQ   L6827
         CMP   #$AF
         BEQ   L6833
         CMP   #$95
         BEQ   L683F
         CMP   #$88
         BEQ   L684A
         JMP   L67F1

L6827    JSR   L402C
         ASC   "NORTH"00
         DEC   $18
         RTS

L6833    JSR   L402C
         ASC   "SOUTH"00
         INC   $18
         RTS

L683F    JSR   L402C
         ASC   "EAST"00
         INC   $17
         RTS

L684A    JSR   L402C
         ASC   "WEST"00
         DEC   $17
         RTS

L6855    LDX   #$2E
L6857    LDA   $0800,X
         STA   $F1
         LDA   $0880,X
         STA   $F0
         LDA   $F1
         STA   $0880,X
         LDA   $0900,X
         STA   $F1
         LDA   $F0
         STA   $0900,X
         LDA   $0980,X
         STA   $F0
         LDA   $F1
         STA   $0980,X
         LDA   $0A00,X
         STA   $F1
         LDA   $F0
         STA   $0A00,X
         LDA   $0A80,X
         STA   $F0
         LDA   $F1
         STA   $0A80,X
         LDA   $0B00,X
         STA   $F1
         LDA   $F0
         STA   $0B00,X
         LDA   $0B80,X
         STA   $F0
         LDA   $F1
         STA   $0B80,X
         LDA   $0C00,X
         STA   $F1
         LDA   $F0
         STA   $0C00,X
         LDA   $0C80,X
         STA   $F0
         LDA   $F1
         STA   $0C80,X
         LDA   $0D00,X
         STA   $F1
         LDA   $F0
         STA   $0D00,X
         LDA   $0D80,X
         STA   $F0
         LDA   $F1
         STA   $0D80,X
         LDA   $0E00,X
         STA   $F1
         LDA   $F0
         STA   $0E00,X
         LDA   $0E80,X
         STA   $F0
         LDA   $F1
         STA   $0E80,X
         LDA   $0F00,X
         STA   $F1
         LDA   $F0
         STA   $0F00,X
         LDA   $0F80,X
         STA   $F0
         LDA   $F1
         STA   $0F80,X
         LDA   $F0
         STA   $0800,X
         INX
         CPX   #$30
         BCS   L68FF
         JMP   L6857
L68FF    RTS

L6900    LDX   #$00
L6902    LDA   $0800,X
         STA   $F1
         LDA   $0880,X
         STA   $F0
         LDA   $F1
         STA   $0880,X
         LDA   $0900,X
         STA   $F1
         LDA   $F0
         STA   $0900,X
         LDA   $0980,X
         STA   $F0
         LDA   $F1
         STA   $0980,X
         LDA   $0A00,X
         STA   $F1
         LDA   $F0
         STA   $0A00,X
         LDA   $0A80,X
         STA   $F0
         LDA   $F1
         STA   $0A80,X
         LDA   $0B00,X
         STA   $F1
         LDA   $F0
         STA   $0B00,X
         LDA   $0B80,X
         STA   $F0
         LDA   $F1
         STA   $0B80,X
         LDA   $0C00,X
         STA   $F1
         LDA   $F0
         STA   $0C00,X
         LDA   $0C80,X
         STA   $F0
         LDA   $F1
         STA   $0C80,X
         LDA   $0D00,X
         STA   $F1
         LDA   $F0
         STA   $0D00,X
         LDA   $0D80,X
         STA   $F0
         LDA   $F1
         STA   $0D80,X
         LDA   $0E00,X
         STA   $F1
         LDA   $F0
         STA   $0E00,X
         LDA   $0E80,X
         STA   $F0
         LDA   $F1
         STA   $0E80,X
         LDA   $0F00,X
         STA   $F1
         LDA   $F0
         STA   $0F00,X
         LDA   $0F80,X
         STA   $F0
         LDA   $F1
         STA   $0F80,X
         LDA   $F0
         STA   $0800,X
         INX
         CPX   #$02
         BCS   L69AA
         JMP   L6902
L69AA    RTS

L69AB    CLC
         LDA   $00
         ADC   $17
         STA   $F4
         CLC
         LDA   $01
         ADC   $18
         STA   $F5
         LDX   #$1F
L69BB    LDA   L4D00+$60,X
         BEQ   L69CF
         LDA   L4D00+$00,X
         CMP   $F4
         BNE   L69CF
         LDA   L4D00+$20,X
         CMP   $F5
         BNE   L69CF
         RTS

L69CF    DEX
         BNE   L69BB
         RTS

L69D3    STA   $FA
         LDA   L4E00+$14
         BEQ   L6A36
         LDA   $00
         CMP   #$40
         BCS   L69E9
         LDA   $01
         CMP   #$40
         BCS   L69E9
         JMP   L6A36

L69E9    LDA   L4E00+$24
         STA   $00
         LDA   L4E00+$25
         STA   $01
         LDA   #$00
         STA   L4E00+$14
         JSR   L6706
         LDA   L4E00+$37
         BEQ   L6A14
         LDA   L4E00+$34
         STA   $F4
         LDA   L4E00+$35
         STA   $F5
         JSR   L437B
         LDA   #$50
         STA   ($06),Y
         JMP   L528B

L6A14    JSR   L402C
         ASC   04
         ASC   "BSAVE PLAYER,A$4E00,L$100"8D00
         JMP   L528B

L6A36    LDA   $FA
         AND   #$7F
         CMP   #$02
         BNE   L6A56
         SED
         SEC
         LDA   L4E00+$1C
         SBC   #$05
         STA   L4E00+$1C
         LDA   L4E00+$1B
         SBC   #$00
         STA   L4E00+$1B
         CLD
         BCS   L6A56
         JMP   L5437

L6A56    CMP   #$2E
         BNE   L6ABF
         LDA   L4E00+$A0
         BEQ   L6A83
         JSR   L402C
         ASC   8D
         ASC   "RING PROTECTS FROM FIELD!"00
         JSR   L4419
         JMP   L6ABF

L6A83    JSR   L402C
         ASC   8D
         ASC   "FIELD CAUSES 1000 DAMAGE!"00
         LDA   #$00
         STA   $17
         STA   $18
         JSR   L459D
         JSR   L4419
         JSR   L459D
         SED
         LDA   L4E00+$1B
         SBC   #$10
         STA   L4E00+$1B
         CLD
         BCS   L6ABF
         JMP   L5437

L6ABF    LDA   $DA
         BEQ   L6AD7
         JSR   L402C
         ASC   "--PARALIZED!"0D00
         LDA   #$FF
         RTS

L6AD7    LDA   $11
         CMP   #$28
         BNE   L6AE0
         JMP   L6B6C

L6AE0    CMP   #$26
         BNE   L6AE7
         JMP   L6B76

L6AE7    CMP   #$24
         BNE   L6AEE
         JMP   L6B88

L6AEE    CMP   #$22
         BNE   L6B02
         JSR   L43E9
         LDX   #$FF
L6AF7    LDY   #$20
L6AF9    DEY
         BNE   L6AF9
         DEX
         BNE   L6AF7
         JMP   L6B95

L6B02    JSR   L43E9
         LDX   #$FF
L6B07    LDY   #$20
L6B09    DEY
         BNE   L6B09
         DEX
         BNE   L6B07
         JSR   L43E9
         SED
         SEC
         LDA   L4E00+$1F
         SBC   #$19
         STA   L4E00+$1F
         LDA   L4E00+$1E
         SBC   #$00
         STA   L4E00+$1E
         LDA   L4E00+$1D
         SBC   #$00
         STA   L4E00+$1D
         CLD
         BCS   L6B32
         JMP   L6703

L6B32    LDA   $FA
         AND   #$7F
         CMP   #$60
         BNE   L6B3D
         JMP   L6BDA

L6B3D    CMP   #$00
         BEQ   L6B70
         CMP   #$08
         BEQ   L6B70
         CMP   #$22
         BEQ   L6B73
         CMP   #$24
         BEQ   L6B73
         CMP   #$26
         BEQ   L6B73
         CMP   #$28
         BEQ   L6B73
         CMP   #$2A
         BEQ   L6B73
         CMP   #$2C
         BEQ   L6B73
         CMP   #$2E
         BEQ   L6B73
         CMP   #$38
         BEQ   L6B73
         CMP   #$16
         BCS   L6B70
         JMP   L6B73

L6B6C    JSR   L6B70
         RTS

L6B70    LDA   #$FF
         RTS
L6B73    JMP   L6BCB

L6B76    JSR   L6B95
         CMP   #$FF
         BEQ   L6B70
         LDA   $FA
         AND   #$7F
         CMP   #$06
         BEQ   L6B70
         JMP   L6B73

L6B88    LDA   $FA
         CMP   #$00
         BEQ   L6B73
         CMP   #$80
         BEQ   L6B73
         JMP   L6B70

L6B95    SED
         SEC
         LDA   L4E00+$1F
         SBC   #$19
         STA   L4E00+$1F
         LDA   L4E00+$1E
         SBC   #$00
         STA   L4E00+$1E
         LDA   L4E00+$1D
         SBC   #$00
         STA   L4E00+$1D
         CLD
         BCS   L6BB5
         JMP   L6703

L6BB5    JSR   L6B02
         CMP   #$FF
         BEQ   L6B70
         LDA   $FA
         AND   #$7F
         CMP   #$02
         BEQ   L6B70
         CMP   #$60
         BEQ   L6B70
         JMP   L6B73

L6BCB    LDA   $00
         AND   #$3F
         STA   $00
         LDA   $01
         AND   #$3F
         STA   $01
         LDA   #$00
         RTS

L6BDA    LDA   $11
         STA   $F0
         LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         JSR   L437B
         LDA   L4E00+$3A
         STA   ($06),Y
         CLC
         LSR
         STA   $11
         JSR   L0240
         LDA   $F0
         STA   $11
         JSR   L442A
         LDA   $00
         STA   L4E00+$24
         LDA   $01
         STA   L4E00+$25
         JSR   L6764
         LDA   L4E00+$38
         LSR
         CMP   L4E00+$13
         BCC   L6C15
         CLC
         ADC   #$01
L6C15    STA   L4E00+$13
         JSR   L6706
         CLC
         LDA   L4E00+$13
         ASL
         ASL
         ASL
         ADC   L4E00+$38
         TAX
         LDA   L6CA6,X
         STA   $00
         INX
         LDA   L6CA6,X
         STA   $01
         JSR   L0240
         JSR   L442A
         PLA
         PLA
         JMP   L528B

L6C3C    LDA   L4E00+$37
         BEQ   L6C42
         RTS

L6C42    DEC   L4E00+$39
         BEQ   L6C48
         RTS

L6C48    CLC
         LDA   L4E00+$13
         ASL
         ASL
         ASL
         STA   $F0
         ADC   L4E00+$38
         TAX
         LDA   L6CA6,X
         STA   $F4
         INX
         LDA   L6CA6,X
         STA   $F5
         JSR   L437B
         CMP   #$C0
         BNE   L6C6E
         LDY   #$00
         LDA   L4E00+$3A
         STA   ($06),Y
L6C6E    LDA   #$08
         STA   L4E00+$39
         INC   L4E00+$38
         INC   L4E00+$38
         LDA   L4E00+$38
         AND   #$07
         STA   L4E00+$38
         CLC
         ADC   $F0
         TAX
         LDA   L6CA6,X
         STA   $F4
         INX
         LDA   L6CA6,X
         STA   $F5
         JSR   L437B
         CMP   #$14
         BCC   L6C98
         RTS

L6C98    STA   L4E00+$3A
         LDY   #$00
         LDA   #$C0
         STA   ($06),Y
         LDA   $F4
         LDX   $F5
         RTS

L6CA6    DA    $381D
         DA    $381F
         DA    $3821
         DA    $3823
         DA    $0822
         DA    $1C2F
         DA    $3824
         DA    $2514
         DA    $1010
         DA    $1830
         DA    $182A
         DA    $3413
         DA    $3438
         DA    $0C1C
         DA    $1721
         DA    $3414
         DA    $1712
         DA    $2232
         DA    $1834
         DA    $0B08
L6CCE    LDA   $DC
         BEQ   L6CF2
         JSR   L402C
         ASC   "CMD: "00
         LDA   #$14
         STA   $FC
L6CDF    JSR   L402C
         ASC   "Z"00
         LDX   #$FF
L6CE6    DEX
         BNE   L6CE6
         DEC   $FC
         BNE   L6CDF
         DEC   $DC
         JMP   L528B

L6CF2    JSR   L402C
         ASC   "CMD: "00
         LDX   #$FF
         LDY   #$FF
L6CFF    LDA   KBD
         BMI   L6D21
         PHA
         PLA
         PHA
         PLA
         PHA
         PLA
         PHA
         PLA
         PHA
         PLA
         PHA
         PLA
         DEX
         BNE   L6CFF
         DEY
         BNE   L6CFF
         JSR   L402C
         ASC   "PASS"00
         JMP   L528B

L6D21    BIT   KBDSTROBE
         CMP   #$8D
         BNE   L6D2B
         JMP   L6D4A

L6D2B    CMP   #$88
         BNE   L6D32
         JMP   L6DFC

L6D32    CMP   #$95
         BNE   L6D39
         JMP   L6E22

L6D39    CMP   #$AF
         BNE   L6D40
         JMP   L6E49

L6D40    CMP   #$A0
         BNE   L6D47
         JMP   L6E80
L6D47    JMP   L521E

L6D4A    JSR   L402C
         ASC   "ADVANCE"00
         LDA   $13
         AND   #$0F
         BEQ   L6D6C
L6D5B    JSR   L402C
         ASC   "-BLOCKED!"8700
         JMP   L528B

L6D6C    LDA   $13
         CMP   #$80
         BEQ   L6D5B
         CLC
         LDA   $00
         ADC   $02
         AND   #$3F
         STA   $00
         CLC
         LDA   $01
         ADC   $03
         AND   #$3F
         STA   $01
         JSR   L4592
         CMP   $F6
         BCC   L6D8E
         JMP   L528B

L6D8E    JSR   L5917
         LDA   #$00
         STA   $FB
         JSR   L402C
         ASC   8D
         ASC   "ARGH! A TRAP!"8D00
         LDA   #$10
         STA   $F0
L6DAC    LDY   #$10
L6DAE    BIT   SPKR
         LDX   $F0
L6DB3    DEX
         BNE   L6DB3
         DEY
         BNE   L6DAE
         INC   $F0
         BNE   L6DAC
         JSR   L4419
         JSR   L4419
         JSR   L4419
         JSR   L4419
         LDA   L4E00+$30
         BNE   L6DD1
         JMP   L5437

L6DD1    JSR   L402C
         ASC   "ESCAPED! BY USE OF TOOLS!"00
         SED
         SEC
         LDA   L4E00+$30
         SBC   #$01
         STA   L4E00+$30
         CLD
         JMP   L528B

L6DFC    JSR   L402C
         ASC   "TURN LEFT"00
         LDA   $03
         BEQ   L6E16
         STA   $02
         LDA   #$00
         STA   $03
         JMP   L528B

L6E16    SEC
         SBC   $02
         STA   $03
         LDA   #$00
         STA   $02
         JMP   L528B

L6E22    JSR   L402C
         ASC   "TURN RIGHT"00
         LDA   $02
         BEQ   L6E3D
         STA   $03
         LDA   #$00
         STA   $02
         JMP   L528B

L6E3D    SEC
         SBC   $03
         STA   $02
         LDA   #$00
         STA   $03
         JMP   L528B

L6E49    JSR   L402C
         ASC   "RETREAT"00
         LDA   $14
         AND   #$8F
         BEQ   L6E6B
         JSR   L402C
         ASC   "-BLOCKED!"8700
         JMP   L528B

L6E6B    LDA   $00
         SEC
         SBC   $02
         AND   #$3F
         STA   $00
         LDA   $01
         SEC
         SBC   $03
         AND   #$3F
         STA   $01
         JMP   L528B

L6E80    JSR   L402C
         ASC   "PASS"00
         JMP   L528B

L6E8B    LDA   #$00
         STA   L6F89
         STA   L6F8A
         STA   $17
         STA   $18
         JSR   L5917
L6E9A    LDA   L6F89
         CLC
         ADC   $17
         AND   #$3F
         STA   $F4
         LDA   L6F8A
         CLC
         ADC   $18
         AND   #$3F
         STA   $F5
         JSR   L437B
         BNE   L6EB6
         JMP   L6F5C

L6EB6    CMP   #$10
         BEQ   L6ED5
         CMP   #$78
         BCC   L6EC2
         CMP   #$F0
         BCC   L6ED5
L6EC2    CMP   #$08
         BEQ   L6EFF
         CMP   #$0C
         BEQ   L6EF1
         CMP   #$04
         BEQ   L6F10
         CMP   #$70
         BEQ   L6F21
         JMP   L6F40

L6ED5    LDX   #$00
         LDY   #$00
         JSR   L6F72
         LDX   #$00
         LDY   #$01
         JSR   L6F72
         LDX   #$02
         LDY   #$01
         JSR   L6F72
         LDX   #$02
         LDY   #$00
         JSR   L6F72
L6EF1    LDX   #$01
         LDY   #$01
         JSR   L6F72
         LDX   #$03
         LDY   #$00
         JSR   L6F72
L6EFF    LDX   #$01
         LDY   #$00
         JSR   L6F72
         LDX   #$03
         LDY   #$01
         JSR   L6F72
         JMP   L6F5C

L6F10    LDX   #$01
         LDY   #$00
         JSR   L6F72
         LDX   #$03
         LDY   #$00
         JSR   L6F72
         JMP   L6F5C

L6F21    LDX   #$00
         LDY   #$00
         JSR   L6F72
         LDX   #$00
         LDY   #$01
         JSR   L6F72
         LDX   #$02
         LDY   #$00
         JSR   L6F72
         LDX   #$02
         LDY   #$01
         JSR   L6F72
         JMP   L6F5C

L6F40    LDX   #$01
         LDY   #$00
         JSR   L6F72
         LDX   #$02
         LDY   #$00
         JSR   L6F72
         LDX   #$02
         LDY   #$01
         JSR   L6F72
         LDX   #$01
         LDY   #$01
         JSR   L6F72
L6F5C    INC   $17
         LDA   $17
         AND   #$3F
         STA   $17
         BEQ   L6F69
L6F66    JMP   L6E9A

L6F69    INC   $18
         LDA   $18
         CMP   #$40
         BCC   L6F66
         RTS

L6F72    STX   $02
         STY   $03
         LDA   $17
         ASL
         ASL
         ADC   $02
         STA   $F0
         LDA   $18
         ASL
         ADC   $03
         STA   $F1
         JSR   L4713
         RTS

L6F89    HEX   53
L6F8A    HEX   4E

L6F8B    JSR   L402C
         ASC   "ATTACK--"00
         LDA   L4E00+$14
         CMP   #$04
         BCC   L6FA1
         JMP   L719A

L6FA1    LDA   $DB
         BEQ   L6FB7
         JSR   L402C
         ASC   "PARALIZED!"8700
         JMP   L528B

L6FB7    JSR   L67E7
         JSR   L44B2
         JSR   L69AB
         STX   $F1
         CPX   #$00
         BNE   L6FC9
         JMP   L718D

L6FC9    JSR   L4592
         LSR
         CMP   L4E00+$16
         BCC   L6FD5
         JMP   L718D

L6FD5    JSR   L459D
         JSR   L57F3
         JSR   L402C
         ASC   "--HIT!!!"00
         JSR   L4408
         LDA   L4E00+$2B
         ASL
         ASL
         ASL
         ADC   L4E00+$15
         LSR
         LSR
         STA   $F0
         LDX   $F1
L6FF9    SEC
         LDA   L4D00+$40,X
         SBC   $F0
         BCC   L7061
         STA   L4D00+$40,X
         JSR   L459D
         LDA   L4D00+$60,X
         CMP   #$40
         BEQ   L7011
         JMP   L528B

L7011    JSR   L404D
         JSR   L442A
         JSR   L404D
         LDX   $F1
         LDA   L4D00+$00,X
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         JSR   L437B
         LDA   L4D00+$80,X
         STA   ($06),Y
         LDA   $F4
         STA   L4D00+$20,X
         LDA   $F5
         STA   L4D00+$00,X
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         JSR   L437B
         LDA   L4D00+$60,X
         STA   ($06),Y
         LDA   #$84
         STA   L4D00+$A0,X
         JSR   L402C
         ASC   8D
         ASC   "SHE'S GONE!!!"00
         JMP   L528B

L7061    LDA   L4D00+$00,X
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         JSR   L437B
         LDY   #$00
         LDA   L4D00+$80,X
         STA   ($06),Y
         LDA   L4D00+$60,X
         CMP   #$40
         BNE   L708D
         JSR   L402C
         ASC   8D04
         ASC   "BRUN END"8D
         JMP   L528B

L708D    CMP   #$60
         BNE   L709F
         SED
         CLC
         LDA   L4E00+$2F
         ADC   #$02
         STA   L4E00+$2F
         CLD
         JMP   L711B

L709F    CMP   #$FC
         BNE   L70CF
         STX   $F0
         JSR   L4592
         CMP   #$40
         BCS   L70B7
         SED
         CLC
         LDA   L4E00+$30
         ADC   #$01
         STA   L4E00+$30
         CLD
L70B7    JSR   L4592
         AND   #$0F
         BEQ   L70CA
         TAX
         SED
         CLC
         LDA   L4E00+$A0,X
         ADC   #$01
         STA   L4E00+$A0,X
         CLD
L70CA    LDX   $F0
         JMP   L711B

L70CF    CMP   #$F0
         BNE   L70FE
         STX   $F0
         JSR   L4592
         CMP   #$40
         BCS   L70E7
         SED
         CLC
         LDA   L4E00+$A5
         ADC   #$01
         STA   L4E00+$A5
         CLD
L70E7    LDX   $F0
         JSR   L4592
         AND   #$03
         ADC   #$01
         SED
         CLC
         ADC   L4E00+$2E
         STA   L4E00+$2E
         CLD
         LDX   $F0
         JMP   L711B

L70FE    CMP   #$F8
         BNE   L711B
         STX   $F0
         JSR   L4592
         AND   #$01
         TAX
         INX
         SED
         CLC
         LDA   L4E00+$A0,X
         ADC   #$01
         STA   L4E00+$A0,X
         CLD
         LDX   $F0
         JMP   L711B

L711B    LDA   #$00
         STA   L4D00+$80,X
         STA   L4D00+$40,X
         STA   L4D00+$00,X
         STA   L4D00+$20,X
         STA   L4D00+$60,X
         JSR   L402C
         ASC   0D
         ASC   "KILLED--GOLD+"00
         JSR   L4592
         AND   #$17
         ORA   #$01
         STA   $F0
         JSR   PRBYTE
         SED
         CLC
         LDA   L4E00+$23
         ADC   $F0
         STA   L4E00+$23
         LDA   L4E00+$22
         ADC   #$00
         STA   L4E00+$22
         CLD
         JSR   L402C
         ASC   "--EXP.+"00
         JSR   L4592
         AND   #$03
         ADC   #$01
         STA   $F0
         JSR   PRBYTE
         SED
         CLC
         LDA   L4E00+$21
         ADC   $F0
         STA   L4E00+$21
         LDA   L4E00+$20
         ADC   #$00
         STA   L4E00+$20
         CLD
         JSR   L459D
         JMP   L528B

L718D    JSR   L402C
         ASC   "--MISS"00
         JMP   L528B

L719A    JSR   L44B2
         LDA   $00
         CLC
         ADC   $02
         STA   $F4
         LDA   $01
         CLC
         ADC   $03
         STA   $F5
         LDA   $F6
         JSR   L5A60
         AND   #$07
         BNE   L71B7
         JMP   L7292

L71B7    LDX   #$1F
         STX   $F0
L71BB    LDA   L4D00+$00,X
         CMP   $F4
         BNE   L71D3
         LDA   L4D00+$20,X
         CMP   $F5
         BNE   L71D3
         LDA   L4D00+$80,X
         CMP   $F6
         BNE   L71D3
         JMP   L71DC

L71D3    DEC   $F0
         LDX   $F0
         BNE   L71BB
         JMP   L7292

L71DC    JSR   L4592
         LSR
         CMP   L4E00+$16
         BCC   L71E8
         JMP   L7292

L71E8    JSR   L402C
         ASC   "HIT!"00
         JSR   L459D
         JSR   L4408
         JSR   L459D
         LDA   L4E00+$2B
         ASL
         ASL
         ASL
         ADC   L4E00+$15
         LSR
         LSR
         LDX   $F0
         STA   $F1
         LDA   L4D00+$40,X
         SEC
         SBC   $F1
         BCC   L7216
         STA   L4D00+$40,X
         JMP   L528B

L7216    LDA   #$00
         STA   L4D00+$40,X
         STA   L4D00+$60,X
         STA   L4D00+$80,X
         LDA   L4D00+$00,X
         STA   $F4
         LDA   L4D00+$20,X
         STA   $F5
         LDA   $F6
         JSR   L5A60
         LDA   ($06),Y
         AND   #$F0
         STA   ($06),Y
         JSR   L402C
         ASC   8D
         ASC   "KILLED--GOLD+"00
         JSR   L4592
         AND   #$17
         ORA   #$01
         STA   $F1
         JSR   PRBYTE
         SED
         CLC
         LDA   L4E00+$23
         ADC   $F1
         STA   L4E00+$23
         LDA   L4E00+$22
         ADC   #$00
         STA   L4E00+$22
         CLD
         JSR   L402C
         ASC   "--EXP.+"00
         JSR   L4592
         AND   #$07
         STA   $F1
         JSR   PRBYTE
         SED
         CLC
         LDA   L4E00+$21
         ADC   $F1
         STA   L4E00+$21
         LDA   L4E00+$20
         ADC   #$00
         STA   L4E00+$20
         CLD
         JMP   L528B

L7292    JSR   L402C
         ASC   "MISS"00
         JMP   L528B

L729D    JSR   L402C
         ASC   "BOARD"00
         LDA   L4E00+$14
         CMP   #$04
         BCC   L72C5
L72AD    JSR   L402C
         ASC   8D
         ASC   87
         ASC   "THINK AGAIN "00
         JSR   L4084
         JMP   L528B

L72C5    LDA   $11
         CMP   #$78
         BCC   L72AD
         LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         JSR   L437B
         LDA   $12
         CMP   #$22
         BEQ   L72FF
         CMP   #$24
         BEQ   L72F6
         CMP   #$26
         BEQ   L72F9
         CMP   #$28
         BEQ   L72FC
         JSR   L402C
         ASC   " WHAT?"8700
         JMP   L528B
L72F6    JMP   L7316
L72F9    JMP   L736E
L72FC    JMP   L73B2

L72FF    JSR   L402C
         ASC   " HORSE"00
         LDA   #$08
         LDX   #$00
         STA   ($06,X)
         LDA   #$22
         STA   $11
         JMP   L528B

L7316    LDA   L4E00+$AC
         BNE   L7356
         JSR   L402C
         ASC   " SHIP"8D
         ASC   "THE CREW OF THIS SHIP"8D
         ASC   "WILL NOT LET YOU BOARD!"8700
         JMP   L528B

L7356    JSR   L402C
         ASC   " FRIGATE"00
         LDA   #$00
         TAY
         STA   ($06),Y
         LDA   #$24
         STA   $11
         JMP   L528B

L736E    LDA   L4E00+$A9
         BNE   L739B
         JSR   L402C
         ASC   " PLANE"8D
         ASC   "STRANGE YOU CAN'T GET IN!"8700
         JMP   L528B

L739B    JSR   L402C
         ASC   " PLANE"00
         LDA   #$08
         LDY   #$00
         STA   ($06),Y
         LDA   #$26
         STA   $11
         JMP   L528B

L73B2    JSR   L402C
         ASC   " ROCKET"00
         LDA   L4E00+$A7
         BNE   L73FA
         JSR   L402C
         ASC   "A METALIC VOICE COMMANDS:"8D
         ASC   "YOU MUST HAVE AN ANKH!"8700
         JMP   L528B

L73FA    LDA   #$08
         LDY   #$00
         STA   ($06),Y
         LDA   #$28
         STA   $11
         JMP   L528B

L7407    JSR   L402C
         ASC   "CAST-"00
         LDA   L4E00+$2D
         CLC
         ADC   #$24
         JSR   L409C
         LDA   L4E00+$A1
         CLC
         ADC   L4E00+$A2
         BNE   L7440
         JSR   L402C
         ASC   8D
         ASC   "NEED WAND OR STAFF!"00
         JSR   L4399
         JMP   L528B

L7440    LDA   L4E00+$2D
         BNE   L7448
         JMP   L528B

L7448    TAX
         LDA   L4E00+$80,X
         BNE   L7462
         JSR   L402C
         ASC   8D
         ASC   "NO SPELL!"00
         JSR   L4399
         JMP   L528B

L7462    JSR   L44A7
         LDX   L4E00+$2D
         SED
         SEC
         LDA   L4E00+$80,X
         SBC   #$01
         STA   L4E00+$80,X
         CLD
         LDA   L4E00+$14
         CMP   #$04
         BCS   L748C
         JSR   L402C
         ASC   "-FAILED!"00
         JSR   L4399
         JMP   L528B

L748C    LDA   L4E00+$2D
         BNE   L7494
         JMP   L528B

L7494    CMP   #$01
         BEQ   L74C3
         CMP   #$02
         BEQ   L74CA
         CMP   #$03
         BEQ   L74F6
         CMP   #$04
         BEQ   L750E
         CMP   #$05
         BEQ   L74B7
         CMP   #$06
         BEQ   L74BA
         CMP   #$07
         BEQ   L74BD
         CMP   #$08
         BNE   L74C0
         JMP   L7559
L74B7    JMP   L7531
L74BA    JMP   L7534
L74BD    JMP   L753C
L74C0    JMP   L7580

L74C3    LDA   #$96
         STA   $FB
         JMP   L528B

L74CA    LDA   L4E00+$14
         CMP   #$04
         BEQ   L74FD
L74D1    LDA   $F6
         CMP   #$0F
         BCC   L74E9
L74D7    JSR   L402C
         ASC   "-FAILED!"00
         JSR   L4399
         JMP   L528B

L74E9    CLC
         ADC   #$01
         JSR   L5A60
         BNE   L74D7
         INC   $F6
         JMP   L7A42

L74F6    LDA   L4E00+$14
         CMP   #$04
         BEQ   L74D1
L74FD    LDA   $F6
         BEQ   L7531
         SEC
         SBC   #$01
         JSR   L5A60
         BNE   L74D7
         DEC   $F6
         JMP   L7A42

L750E    CLC
         LDA   $00
         ADC   $02
         AND   #$0F
         BEQ   L74D7
         STA   $F4
         LDA   $01
         ADC   $03
         AND   #$0F
         BEQ   L74D7
         STA   $F5
         LDA   $F6
         JSR   L5A60
         BPL   L74D7
         LDA   #$00
         STA   ($06),Y
         JMP   L528B
L7531    JMP   L7A58

L7534    JSR   L4592
         BMI   L74D7
         JMP   L7580

L753C    JSR   L758B
         BEQ   L74D7
         LDA   L4E00+$20
         ASL
         ADC   #$1E
         STA   $F1
         LDA   L4D00+$40,X
         SBC   $F1
         STA   L4D00+$40,X
         BCS   L7556
         JMP   L7216
L7556    JMP   L528B

L7559    JSR   L4592
         AND   #$0F
         ORA   #$01
         STA   $F4
         JSR   L4592
         AND   #$0F
         ORA   #$01
         STA   $F5
         LDA   $F6
         JSR   L5A60
         BEQ   L7575
         JMP   L74D7

L7575    LDA   $F4
         STA   $00
         LDA   $F5
         STA   $01
         JMP   L528B

L7580    JSR   L758B
         BNE   L7588
         JMP   L74D7
L7588    JMP   L7216

L758B    LDX   #$1F
L758D    LDA   L4D00+$60,X
         BNE   L7598
L7592    DEX
         BNE   L758D
         LDA   #$00
         RTS

L7598    LDA   L4D00+$80,X
         CMP   $F6
         BNE   L7592
         LDA   $00
         CLC
         ADC   $02
         CMP   L4D00+$00,X
         BNE   L7592
         LDA   $01
         CLC
         ADC   $03
         CMP   L4D00+$20,X
         BNE   L7592
         TXA
         RTS

L75B5    JSR   L402C
         ASC   "DESCEND"00
         LDA   L4E00+$14
         CMP   #$05
         BEQ   L75D9
         CMP   #$04
         BEQ   L75D9
L75CB    JSR   L402C
         ASC   "-WHAT?"8700
         JMP   L528B

L75D9    LDA   $12
         AND   #$20
         BEQ   L75CB
         LDA   L4E00+$14
         CMP   #$04
         BNE   L75E9
         JMP   L7A3E

L75E9    INC   $F6
         JMP   L7A42

L75EE    JSR   L402C
         ASC   "ENTER"00
         LDA   L4E00+$14
         BEQ   L7609
         JSR   L402C
         ASC   " WHAT?"00
         JMP   L528B

L7609    LDA   $11
         CMP   #$78
         BCS   L7625
         JSR   L402C
         ASC   "-ONLY ON FOOT!"8700
         JMP   L528B

L7625    LDA   $12
         LSR
         SEC
         SBC   #$05
         BNE   L7630
         JMP   L7660

L7630    SBC   #$01
         BNE   L7637
         JMP   L7693

L7637    SBC   #$01
         BNE   L763E
         JMP   L76C3

L763E    SBC   #$01
         BNE   L7645
         JMP   L7709

L7645    SBC   #$01
         BNE   L764C
         JMP   L773B

L764C    SBC   #$01
         BNE   L7653
         JMP   L7781

L7653    JSR   L402C
         ASC   " WHAT?"00
         JMP   L528B

L7660    JSR   L402C
         ASC   "-VILLAGE"00
         LDA   $00
         STA   L4E00+$24
         LDA   $01
         STA   L4E00+$25
         JSR   L6764
         LDA   #$1F
         STA   $00
         LDA   #$3E
         STA   $01
         LDA   #$01
         STA   L4E00+$14
         JSR   L6706
         JSR   L673F
         LDA   #$04
         STA   $10
         JMP   L528B

L7693    JSR   L402C
         ASC   "-TOWN"00
         LDA   $00
         STA   L4E00+$24
         LDA   $01
         STA   L4E00+$25
         JSR   L6764
         LDA   #$1F
         STA   $00
         LDA   #$3E
         STA   $01
         LDA   #$02
         STA   L4E00+$14
         JSR   L6706
         JSR   L673F
         LDA   #$04
         STA   $10
         JMP   L528B

L76C3    JSR   L402C
         ASC   "-TOWER"00
         LDA   $00
         STA   L4E00+$24
         LDA   $01
         STA   L4E00+$25
         JSR   L6764
         LDA   #$00
         STA   $F6
         STA   $03
         LDA   #$01
         STA   $02
         LDA   #$05
         STA   $00
         STA   $01
         LDA   #$04
         STA   L4E00+$14
         JSR   L6706
         JSR   L402C
         ASC   04
         ASC   "BLOAD MONSTERS!"00
         JMP   L528B

L7709    JSR   L402C
         ASC   "-CASTLE"00
         LDA   $00
         STA   L4E00+$24
         LDA   $01
         STA   L4E00+$25
         JSR   L6764
         LDA   #$1F
         STA   $00
         LDA   #$3E
         STA   $01
         LDA   #$03
         STA   L4E00+$14
         JSR   L6706
         JSR   L673F
         LDA   #$04
         STA   $10
         JMP   L528B

L773B    JSR   L402C
         ASC   "-DUNGEON"00
         LDA   $00
         STA   L4E00+$24
         LDA   $01
         STA   L4E00+$25
         JSR   L6764
         LDA   #$00
         STA   $F6
         STA   $03
         LDA   #$01
         STA   $02
         LDA   #$05
         STA   $00
         STA   $01
         STA   L4E00+$14
         JSR   L6706
         JSR   L402C
         ASC   04
         ASC   "BLOAD MONSTERS!"00
         JMP   L528B

L7781    JSR   L402C
         ASC   "-THE SIGN READS:"0D00
         LDX   L4E00+$13
         BEQ   L77BA
         DEX
         BEQ   L77CF
         DEX
         BEQ   L77EA
         DEX
         BEQ   L7800
         JSR   L402C
         ASC   "ANOS: 2112 A.D."00
         JMP   L528B

L77BA    JSR   L402C
         ASC   "ANOS: LEGENDS!"00
         JMP   L528B

L77CF    JSR   L402C
         ASC   "ANOS: 9,000,000 B.C."00
         JMP   L528B

L77EA    JSR   L402C
         ASC   "ANOS: 1423 B.C."00
         JMP   L528B

L7800    JSR   L402C
         ASC   "ANOS: 1990 A.D."00
         JMP   L528B

L7816    JSR   L402C
         ASC   "FIRE"00
         LDA   $11
         CMP   #$24
         BEQ   L7832
         JSR   L402C
         ASC   " WHAT?"8700
         JMP   L528B

L7832    JSR   L402C
         ASC   " DIRECT-"00
         JSR   L67E7
         JSR   L7862
         JSR   L69AB
         STX   $F1
         CPX   #$00
         BNE   L7850
         JMP   L718D

L7850    JSR   L4592
         ORA   #$20
         STA   $F0
         JSR   L459D
         JSR   L4408
         LDX   $F1
         JMP   L6FF9

L7862    LDX   #$01
L7864    TXA
         TAY
L7866    DEY
         NOP
         NOP
         NOP
         NOP
         BNE   L7866
         BIT   SPKR
         INX
         BNE   L7864
         RTS

L7874    LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         JSR   L437B
         LDA   #$08
         STA   ($06),Y
         RTS

L7884    JSR   L402C
         ASC   "GET"00
         LDA   L4E00+$14
         CMP   #$04
         BCC   L7895
         JMP   L7902

L7895    LDA   $12
         CMP   #$2A
         BEQ   L78DE
         CMP   #$2C
         BEQ   L78AC
         JSR   L402C
         ASC   " WHAT?"00
         JMP   L528B

L78AC    JSR   L402C
         ASC   " WEAPON"00
         JSR   L7874
         JSR   L4592
         AND   #$07
         BEQ   L78D0
         TAX
         SED
         CLC
         LDA   L4E00+$40,X
         ADC   #$01
         STA   L4E00+$40,X
         CLD
         JMP   L528B

L78D0    JSR   L402C
         ASC   " EMPTY!"00
         JMP   L528B

L78DE    JSR   L402C
         ASC   " ARMOUR"00
         JSR   L7874
         JSR   L4592
         AND   #$03
         BEQ   L78D0
         TAX
         SED
         CLC
         LDA   L4E00+$60,X
         ADC   #$01
         STA   L4E00+$60,X
         CLD
         JMP   L528B

L7902    LDA   $12
         CMP   #$40
         BEQ   L7915
         JSR   L402C
         ASC   " WHAT?"00
         JMP   L528B

L7915    JSR   L402C
         ASC   "CHEST!"8D
         ASC   "IT CONTAINS "00
         LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         LDA   $F6
         JSR   L5A60
         LDA   #$00
         STA   ($06),Y
         LDA   $F6
         CMP   #$0F
         BEQ   L7983
         JSR   L4592
         CMP   #$40
         BCC   L7972
         JSR   L402C
         ASC   "GOLD!"00
         JSR   L4592
         AND   #$1F
         ADC   $F6
         ADC   $F6
         AND   #$77
         SED
         CLC
         ADC   L4E00+$23
         STA   L4E00+$23
         LDA   L4E00+$22
         ADC   #$00
         STA   L4E00+$22
         CLD
         JMP   L528B

L7972    LDA   $F6
         LSR
         BCC   L797A
         JMP   L78DE

L797A    JSR   L402C
         ASC   "A "00
         JMP   L78AC

L7983    JSR   L402C
         ASC   "TRI-LITHIUM!"00
         SED
         CLC
         LDA   L4E00+$AF
         ADC   #$01
         STA   L4E00+$AF
         CLD
         JMP   L528B

L79A1    JSR   L402C
         ASC   "HYPER WHAT?"00
         JMP   L528B

L79B3    JSR   L402C
         ASC   "IGNITE TORCH"00
         LDA   L4E00+$14
         CMP   #$04
         BCS   L79CD
         JMP   L528B

L79CD    LDA   L4E00+$2E
         BNE   L79E6
         JSR   L402C
         ASC   8D
         ASC   "NONE OWNED!"8700
         JMP   L528B

L79E6    SED
         SEC
         LDA   L4E00+$2E
         SBC   #$01
         STA   L4E00+$2E
         CLD
         LDA   #$96
         STA   $FB
         JMP   L528B

L79F8    JSR   L402C
         ASC   "JUMP...WHEE..."00
         JMP   L528B

L7A0D    JSR   L402C
         ASC   "KLIMB"00
         LDA   L4E00+$14
         CMP   #$05
         BEQ   L7A2E
         CMP   #$04
         BEQ   L7A2E
L7A21    JSR   L402C
         ASC   "-WHAT?"00
         JMP   L528B

L7A2E    LDA   $12
         AND   #$10
         BEQ   L7A21
         LDA   L4E00+$14
         CMP   #$04
         BNE   L7A3E
         JMP   L75E9

L7A3E    DEC   $F6
         BMI   L7A58
L7A42    JSR   L402C
         ASC   8D
         ASC   "TO LEVEL "00
         LDA   $F6
         JSR   PRBYTE
         JMP   L528B

L7A58    LDA   L4E00+$24
         STA   $00
         LDA   L4E00+$25
         STA   $01
         LDX   #$00
         LDA   #$FF
L7A66    STA   L4B00,X
         STA   L4C00,X
         DEX
         BNE   L7A66
         LDA   #$00
         STA   L4E00+$14
         JSR   L6706
         JSR   L402C
         ASC   04
         ASC   "BLOAD SHAPES"8D00
         LDA   L4E00+$24
         STA   $00
         LDA   L4E00+$25
         STA   $01
         LDA   L4E00+$37
         BEQ   L7AAC
         LDA   L4E00+$34
         STA   $F4
         LDA   L4E00+$35
         STA   $F5
         JSR   L437B
         LDA   #$50
         STA   ($06),Y
         JMP   L528B

L7AAC    JSR   L402C
         ASC   04
         ASC   "BSAVE PLAYER,A$4E00,L$100"8D00
         JMP   L528B

L7ACE    LDA   $11
         CMP   #$26
         BNE   L7AD7
         JMP   L7C1B

L7AD7    CMP   #$28
         BEQ   L7AEE
         JSR   L402C
         ASC   "LAUNCH WHAT?"00
         JMP   L528B

L7AEE    JSR   L402C
         ASC   "LAUNCH--ROCKET"00
         LDA   L4E00+$AF
         BNE   L7B3D
         JSR   L402C
         ASC   8D
         ASC   "A METALLIC VOICE SAYS:"8D
         ASC   "SHIP INCAPABLE OF LAUNCH!"00
         JMP   L528B

L7B3D    JSR   L402C
         ASC   8D
         ASC   "PREPARE FOR LAUNCH!"8D
         ASC   04
         ASC   "BLOAD STARS.OBJ"8D00
         LDA   L4E00+$37
         BNE   L7B83
         LDA   L4E00+$14
         BNE   L7B83
         LDA   $00
         STA   L4E00+$34
         LDA   $01
         STA   L4E00+$35
         LDA   #$01
         STA   L4E00+$33
         JSR   L6764
L7B83    JSR   L8900
         JSR   L6706
         JSR   L402C
         ASC   04
         ASC   "BLOAD DNGDRAW.OBJ"0D00
         LDX   #$00
         LDA   #$FF
L7BA4    STA   L4B00,X
         STA   L4C00,X
         DEX
         BNE   L7BA4
         STX   $00
         STX   $01
         STA   $10
         JSR   L402C
         ASC   "(PRESS ANY KEY)"00
         LDA   KBDSTROBE
L7BC9    LDA   $01
         CLC
         ADC   #$02
         AND   #$3F
         STA   $01
         AND   #$07
         BNE   L7BDD
         LDA   $00
         CLC
         ADC   #$01
         STA   $00
L7BDD    JSR   L0240
         LDA   KBD
         BPL   L7BC9
         BIT   KBDSTROBE
         LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         JSR   L437B
         AND   #$7F
         CMP   #$08
         BEQ   L7BFC
         JMP   L5437

L7BFC    LDA   L4E00+$37
         BNE   L7C09
         LDA   #$00
         STA   L4E00+$33
         JMP   L528B

L7C09    LDA   $00
         STA   L4E00+$34
         LDA   $01
         STA   L4E00+$35
         LDA   #$01
         STA   L4E00+$33
         JMP   L528B

L7C1B    JSR   L402C
         ASC   "LAUNCH--PLANE"00
         LDA   L4E00+$AB
         BNE   L7C65
         JSR   L402C
         ASC   8D
         ASC   "FUNNY THIS PLANE IS"8D
         ASC   "MISSING A BRASS BUTTON!"8700
         JMP   L528B

L7C65    LDA   #$00
         STA   $F2
         LDA   #$FF
         STA   $F3
         JSR   L402C
         ASC   0D
         ASC   "CMD: "00
L7C77    JSR   L43E9
         LDA   KBD
         BIT   KBDSTROBE
         CMP   #$8D
         BNE   L7C87
         JMP   L7CCE

L7C87    CMP   #$AF
         BNE   L7C8E
         JMP   L7CE8

L7C8E    CMP   #$95
         BNE   L7C95
         JMP   L7D02

L7C95    CMP   #$88
         BNE   L7C9C
         JMP   L7D1B

L7C9C    CMP   #$CC       ; L
         BNE   L7CA3
         JMP   L7D34

L7CA3    CLC
         LDA   $00
         ADC   $F2
         AND   #$3F
         STA   $00
         CLC
         LDA   $01
         ADC   $F3
         AND   #$3F
         STA   $01
         LDA   L4E00+$14
         BEQ   L7CC8
         LDA   $00
         BEQ   L7CC5
         LDA   $01
         BEQ   L7CC5
         JMP   L7CC8
L7CC5    JMP   L69E9

L7CC8    JSR   L0240
         JMP   L7C77

L7CCE    LDA   #$00
         STA   $F2
         LDA   #$FF
         STA   $F3
         JSR   L402C
         ASC   "NORTH"0D
         ASC   "CMD: "00
         JMP   L7CA3

L7CE8    LDA   #$00
         STA   $F2
         LDA   #$01
         STA   $F3
         JSR   L402C
         ASC   "SOUTH"0D
         ASC   "CMD: "00
         JMP   L7CA3

L7D02    LDA   #$01
         STA   $F2
         LDA   #$00
         STA   $F3
         JSR   L402C
         ASC   "EAST"0D
         ASC   "CMD: "00
         JMP   L7CA3

L7D1B    LDA   #$FF
         STA   $F2
         LDA   #$00
         STA   $F3
         JSR   L402C
         ASC   "WEST"0D
         ASC   "CMD: "00
         JMP   L7CA3

L7D34    LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         JSR   L437B
         CMP   #$08
         BNE   L7D55
         JSR   L402C
         ASC   "LAND PLANE."00
         JMP   L528B

L7D55    JSR   L402C
         ASC   "LAND--NOT HERE!!!!!"0D
         ASC   "CMD: "00
         JMP   L7CA3

L7D75    JSR   L402C
         ASC   "MAGIC SPELL READY #"00
         JSR   L653E
         STA   L4E00+$2D
         JSR   L402C
         ASC   "SPELL READY => "00
         LDA   L4E00+$2D
         CLC
         ADC   #$24
         JSR   L409C
         JMP   L528B

L7DB1    JSR   L402C
         ASC   "NEGATE TIME"00
         LDA   L4E00+$AD
         BNE   L7DE5
         JSR   L402C
         ASC   " HOW?"8D
         ASC   "YOU'RE NOT EINSTEIN"00
         JMP   L528B

L7DE5    SED
         SEC
         LDA   L4E00+$AD
         SBC   #$01
         STA   L4E00+$AD
         CLD
         JSR   L402C
         ASC   8D
         ASC   "YOU RUB A COIN..."00
         LDA   #$14
         STA   $D9
         JMP   L528B

L7E0D    JSR   L402C
         ASC   "OFFER GOLD DIRECT-"00
         JSR   L67E7
         JSR   L69AB
         STX   $F0
         LDA   #$8D
         JSR   COUT
         CPX   #$00
         BNE   L7E49
         JSR   L402C
         ASC   "OFFER TO WHOM?"00
         JMP   L528B

L7E49    JSR   L402C
         ASC   "HOW MUCH (*100) ? "00
         JSR   L653E
         STA   $FC
         LDA   #$00
         STA   $FD
         JSR   L655D
         LDX   $F0
         LDA   L4D00+$A0,X
         BPL   L7E83
         LDA   L4E00+$14
         CMP   #$02
         BNE   L7E83
         LDA   L4E00+$13
         CMP   #$03
         BNE   L7E83
         JMP   L7E9E

L7E83    JSR   L402C
         ASC   "THANK YOU VERY MUCH!"00
         JMP   L528B

L7E9E    LDX   $F0
         LDA   L4D00+$A0,X
         CMP   #$81
         BEQ   L7EB2
         CMP   #$82
         BEQ   L7ED4
         CMP   #$83
         BEQ   L7F12
         JMP   L7F3A

L7EB2    LDA   $FC
         CMP   #$05
         BCC   L7E83
         JSR   L402C
         ASC   "ENILNO IS YOURS!"00
         LDA   #$01
         STA   L4E00+$49
         JMP   L528B

L7ED4    LDA   $FC
         CMP   #$05
         BCC   L7E83
         LDA   L4E00+$36
         BNE   L7EF4
         JSR   L402C
         ASC   "EARN THE RING!"00
         JMP   L528B

L7EF4    JSR   L402C
         ASC   "THE RING IS YOURS!"00
         LDA   #$01
         STA   L4E00+$A0
         JMP   L528B

L7F12    JSR   L4592
         AND   #$07
         SED
         CLC
         TAX
         INX
         LDA   L4E00+$40,X
         ADC   #$01
         STA   L4E00+$40,X
         CLD
         JSR   L402C
         ASC   "HERE TAKE THIS!"00
         JMP   L528B

L7F3A    JSR   L4592
         AND   #$07
         CMP   #$06
         BCC   L7F46
         JMP   L7E83

L7F46    TAX
         INX
         SED
         CLC
         LDA   L4E00+$15,X
         ADC   $FC
         ADC   $FC
         ADC   $FC
         ADC   $FC
         STA   L4E00+$15,X
         CLD
         JSR   L402C
         ASC   "ALAKAZAM!"00
         JMP   L528B

L7F69    JSR   L402C
         ASC   "PASS"00
         JMP   L528B

L7F74    JSR   L402C
         ASC   "QUIT OR SAVE GAME."00
         LDA   L4E00+$14
         BEQ   L7FA6
         JSR   L402C
         ASC   8D
         ASC   "ONLY OUTDOORS!"8700
         JMP   L528B

L7FA6    LDA   L4E00+$37
         BEQ   L7FC2
         JSR   L402C
         ASC   8D
         ASC   "ONLY ON EARTH!"8700
         JMP   L528B

L7FC2    LDA   $11
         CMP   #$78
         BCS   L7FDE
         JSR   L402C
         ASC   8D
         ASC   "ONLY ON FOOT!"8700
         JMP   L528B

L7FDE    JSR   L402C
         ASC   8D
         ASC   "ONE MOMENT PLEASE!"00
         JSR   L6764
         JMP   L528B

L7FFB    JSR   L402C
         ASC   "READY WEAPON:"0D
         ASC   "1-DA, 2-MA, 3-AX, 4-BO,"0D
         ASC   "5-SW, 6-GR, 7-LI, 8-PH."0D
         ASC   "9-QU, WHICH? "00
         JSR   L653E
         STA   $F0
         CLC
         ADC   #$13
         JSR   L409C
         LDX   $F0
         LDA   L4E00+$40,X
         BNE   L8073
         LDA   $F0
         BEQ   L8073
         JSR   L402C
         ASC   " NOT OWNED!"8700
         JMP   L528B

L8073    LDA   $F0
         ASL
         ASL
         ASL
         CMP   L4E00+$16
         BCC   L80AB
         JSR   L402C
         ASC   " <-THOU ART NOT "8D
         ASC   "AGILE ENOUGH TO WIELD!"00
         JMP   L528B

L80AB    JSR   L402C
         ASC   " READY."00
         LDA   $F0
         STA   L4E00+$2B
         JMP   L528B

L80BE    JSR   L402C
         ASC   "STEAL DIRECT-"00
         JSR   L67E7
         CLC
         LDA   $00
         ADC   $17
         STA   $F4
         CLC
         LDA   $01
         ADC   $18
         STA   $F5
         LDA   #$8D
         JSR   COUT
         JSR   L437B
         BMI   L80EE
         CMP   #$7C
         BNE   L8106
L80EE    CLC
         LDA   $F4
         ADC   $17
         STA   $F4
         CLC
         LDA   $F5
         ADC   $18
         STA   $F5
         JSR   L437B
         CMP   #$68
         BNE   L8106
         JMP   L811F

L8106    JSR   L402C
         ASC   "NO LUCK!"00
         JSR   L4592
         AND   #$07
         BNE   L811C
         JSR   L57F3
L811C    JMP   L528B

L811F    LDA   L4E00+$11
         CMP   #$03
         BEQ   L812B
         JSR   L4592
         BMI   L8106
L812B    JSR   L4592
         BMI   L8106
         LDA   L4D00+$A0
         CMP   #$01
         BEQ   L8106
         LDA   L4E00+$14
         CMP   #$01
         BEQ   L8151
         CMP   #$02
         BNE   L8106
         LDA   $01
         CMP   #$20
         BCS   L8106
         LDA   $00
         CMP   #$20
         BCS   L817A
         JMP   L81A0

L8151    LDA   $01
         CMP   #$20
         BCS   L8106
         LDA   $00
         CMP   #$20
         BCC   L8106
         JSR   L402C
         ASC   "STEAL FOOD!"00
         SED
         CLC
         LDA   L4E00+$1D
         ADC   #$01
         STA   L4E00+$1D
         CLD
         JMP   L528B

L817A    JSR   L402C
         ASC   "STEAL ARMOUR!"00
         JSR   L4592
         AND   #$03
         TAX
         INX
         SED
         CLC
         LDA   L4E00+$60,X
         ADC   #$01
         STA   L4E00+$60,X
         CLD
         JMP   L528B

L81A0    JSR   L402C
         ASC   "STEAL WEAPONS!"00
         JSR   L4592
         AND   #$07
         TAX
         INX
         SED
         CLC
         LDA   L4E00+$40,X
         ADC   #$01
         STA   L4E00+$40,X
         CLD
         JMP   L528B

L81C7    JSR   L402C
         ASC   "TRANSACT-"00
         JSR   L67E7
         JSR   L69AB
         STX   $F1
         LDA   #$8D
         JSR   COUT
         LDA   L4E00+$14
         BEQ   L820B
         CPX   #$00
         BNE   L8225
         JSR   L437B
         BMI   L81F3
         CMP   #$7C
         BNE   L820B
L81F3    CLC
         LDA   $F4
         ADC   $17
         STA   $F4
         CLC
         LDA   $F5
         ADC   $18
         STA   $F5
         JSR   L437B
         CMP   #$68
         BNE   L820B
         JMP   L5B2E

L820B    JSR   L402C
         ASC   "FUNNY, NO RESPONSE!"00
         JMP   L528B

L8225    LDA   L4D00+$A0,X
         CMP   #$80
         BCC   L822F
         JMP   L8369

L822F    LDA   L4D00+$60,X
         CMP   #$6C
         BNE   L8239
         JMP   L839B

L8239    LDA   L4D00+$60,X
         CMP   #$60
         BNE   L8264
         JSR   L402C
         ASC   "A GUARD SAYS:"0D
         ASC   "PAY YOUR TAXES!"00
         JMP   L528B

L8264    CMP   #$64
         BNE   L8288
         JSR   L402C
         ASC   "A JESTER SINGS:"0D
         ASC   "HO HO HO!"00
         JMP   L528B

L8288    CMP   #$68
         BNE   L82BB
         JSR   L402C
         ASC   "A MERCHANT SAYS:"0D
         ASC   "WILL YOU BUY MY APPLES?"00
         JMP   L528B

L82BB    CMP   #$F0
         BNE   L82E4
         JSR   L402C
         ASC   "A FIGHTER SAYS:"0D
         ASC   "UGH, ME TOUGH!"00
         JMP   L528B

L82E4    CMP   #$F4
         BNE   L8306
         JSR   L402C
         ASC   "A CLERIC SAYS:"0D
         ASC   "BELIEVE!"00
         JMP   L528B

L8306    CMP   #$F8
         BNE   L8335
         JSR   L402C
         ASC   "A WIZARD SAYS:"0D
         ASC   "HEX-E-POO-HEX-ON-YOU!"00
         JMP   L528B

L8335    CMP   #$FC
         BNE   L8366
         JSR   L402C
         ASC   "A THIEF SAYS:"0D
         ASC   "PSST, WANNA BUY A WATCH?"00
         JMP   L528B
L8366    JMP   L820B

L8369    SEC
         SBC   #$80
         JSR   L5AF7
         LDY   #$07
L8371    INC   $4E
         BNE   L8371
         INC   $4F
         BNE   L8371
         DEY
         BNE   L8371
         LDX   $F1
         LDA   L4E00+$37
         CMP   #$09
         BNE   L8398
         LDA   L4E00+$14
         CMP   #$03
         BNE   L8398
         LDA   L4D00+$A0,X
         CMP   #$81
         BNE   L8398
         LDA   #$01
         STA   L4E00+$36
L8398    JMP   L528B

L839B    JSR   L402C
         ASC   "WELCOME MY CHILD "00
         JSR   L4084
         JSR   L402C
         ASC   8D
         ASC   "FIRST MY 50 G.P. TRIBUTE!"8D00
         LDA   #$50
         STA   $FD
         LDA   #$00
         STA   $FC
         JSR   L655D
         JSR   L402C
         ASC   "AND FOR IT I RAISE THEE "00
         LDA   L4E00+$1B
         LDX   #$03
         CMP   #$50
         BCC   L8410
         LDX   #$02
         CMP   #$75
         BCC   L8410
         LDX   #$01
         CMP   #$99
         BCC   L8410
         LDX   #$00
L8410    STX   $F0
         TXA
         LDX   #$00
         JSR   PRNTAX
         SED
         CLC
         LDA   L4E00+$1B
         ADC   $F0
         STA   L4E00+$1B
         CLD
         JMP   L528B
L8426    JSR   L402C
         ASC   "UNLOCK DIRECTION-"00
         JSR   L67E7
         LDA   $17
         BNE   L8459
L8442    JSR   L402C
         ASC   8D
         ASC   "NO DOOR THERE!"8700
         JMP   L528B

L8459    LDA   $01
         STA   $F5
         LDA   $00
         CLC
         ADC   $17
         STA   $F4
         JSR   L437B
         CMP   #$A0
         BNE   L8442
         LDA   L4E00+$2F
         BNE   L848A
         JSR   L402C
         ASC   8D
         ASC   "NO KEYS THAT FIT!"8700
         JMP   L528B

L848A    SED
         SEC
         LDA   L4E00+$2F
         SBC   #$01
         STA   L4E00+$2F
         CLD
         LDA   $12
         ASL
         LDX   #$00
         STA   ($06,X)
         JMP   L528B

L849F    LDA   L4E00+$A5
         BNE   L84B5
L84A4    JSR   L402C
         ASC   "VIEW WHAT?"00
         JMP   L528B

L84B5    LDA   L4E00+$14
         CMP   #$04
         BCS   L84A4
         JSR   L402C
         ASC   "VIEW"8D
         ASC   "WITH MAGICAL HELM!"00
         SED
         SEC
         LDA   L4E00+$A5
         SBC   #$01
         STA   L4E00+$A5
         CLD
         LDA   #$20
         STA   $F4
         STA   $F5
         JSR   L6E8B
         BIT   KBDSTROBE
L84EE    LDA   KBD
         BPL   L84EE
         BIT   KBDSTROBE
         LDX   #$FF
         LDA   #$FF
L84FA    STA   L4B00,X
         STA   L4C00+$00,X
         DEX
         BNE   L84FA
         STA   L4B00
         STA   L4C00
         JMP   L528B

L850C    JSR   L402C
         ASC   "WEAR ARMOUR:"0D
         ASC   "1-CLOTH, 2-LEATHER, 3-CHAIN,"0D
         ASC   "4-PLATE, 5-REFLECT, 6-POWER,"0D
         ASC   "WHICH? "00
         JSR   L653E
         STA   $F0
         CMP   #$07
         BCC   L856B
         LDA   #$00
         STA   $F0
L856B    CLC
         ADC   #$1D
         JSR   L409C
         LDX   $F0
         LDA   L4E00+$60,X
         BNE   L858E
         LDA   $F0
         BEQ   L858E
         JSR   L402C
         ASC   " NOT OWNED!"00
         JMP   L528B

L858E    LDA   $F0
         ASL
         ASL
         ASL
         CMP   L4E00+$15
         BCC   L85C5
         JSR   L402C
         ASC   " <-THOU ART NOT"0D
         ASC   "STRONG ENOUGH TO WEAR!"00
         JMP   L528B

L85C5    JSR   L402C
         ASC   " READY."00
         LDA   $F0
         STA   L4E00+$2C
         JMP   L528B

L85D8    JSR   L402C
         ASC   "X-IT"00
         LDA   $11
         CMP   #$78
         BCC   L85F4
         JSR   L402C
         ASC   " WHAT?"8700
         JMP   L528B

L85F4    LDA   $00
         STA   $F4
         LDA   $01
         STA   $F5
         JSR   L437B
         LDA   $12
         CMP   #$04
         BEQ   L8621
         CMP   #$00
         BNE   L860F
         LDA   $11
         CMP   #$24
         BEQ   L8621
L860F    JSR   L402C
         ASC   "-NOT HERE!"8700
         JMP   L528B

L8621    LDA   $11
         ASL
         LDY   #$00
         STA   ($06),Y
         LDA   L4E00+$11
         ASL
         CLC
         ADC   #$78
         STA   $11
         JMP   L528B

L8634    JSR   L402C
         ASC   "YELL WHAT?"8D00
L8643    LDA   KBD
         BPL   L8643
         CMP   #$8D
         BEQ   L8655
         JSR   COUT
         BIT   KBDSTROBE
         JMP   L8643

L8655    JSR   COUT
         BIT   KBDSTROBE
         JMP   L528B

L865E    LDA   #$28
         STA   $21
         JSR   HOME
         LDA   TXTSET
         JSR   L4084
         JSR   L402C
         ASC   8D
         ASC   "A LEVEL "00
         LDA   L4E00+$20
         JSR   PRBYTE
         LDA   #$A0
         JSR   COUT
         LDA   L4E00+$10
         JSR   L4069
         LDA   #$A0
         JSR   COUT
         LDA   L4E00+$12
         CLC
         ADC   #$44
         JSR   L409C
         LDA   #$A0
         JSR   COUT
         LDA   L4E00+$11
         CLC
         ADC   #$48
         JSR   L409C
         LDA   #$8D
         JSR   COUT
         LDA   #$8D
         JSR   COUT
         JSR   L402C
         ASC   "WEAPON: "00
         LDA   L4E00+$2B
         CLC
         ADC   #$13
         JSR   L409C
         LDX   #$1B
         LDY   #$03
         JSR   L458A
         JSR   L402C
         ASC   "TORCHES-"00
         LDA   L4E00+$2E
         JSR   PRBYTE
         LDX   #$00
         LDY   #$04
         JSR   L458A
         JSR   L402C
         ASC   "ARMOUR: "00
         LDA   L4E00+$2C
         CLC
         ADC   #$1D
         JSR   L409C
         LDX   #$1E
         LDY   #$04
         JSR   L458A
         JSR   L402C
         ASC   "KEYS-"00
         LDA   L4E00+$2F
         JSR   PRBYTE
         LDX   #$01
         LDY   #$05
         JSR   L458A
         JSR   L402C
         ASC   "SPELL: "00
         LDA   L4E00+$2D
         CLC
         ADC   #$24
         JSR   L409C
         LDX   #$1D
         LDY   #$05
         JSR   L458A
         JSR   L402C
         ASC   "TOOLS-"00
         LDA   L4E00+$30
         JSR   PRBYTE
         LDX   #$00
         LDY   #$07
         JSR   L458A
         LDA   #$3E
         JSR   L409C
         LDA   #$AD
         JSR   COUT
         LDA   L4E00+$15
         JSR   PRBYTE
         LDX   #$01
         LDY   #$08
         JSR   L458A
         LDA   #$3F
         JSR   L409C
         LDA   #$AD
         JSR   COUT
         LDA   L4E00+$16
         JSR   PRBYTE
         LDX   #$0E
         LDY   #$07
         JSR   L458A
         LDA   #$40
         JSR   L409C
         LDA   #$AD
         JSR   COUT
         LDA   L4E00+$17
         JSR   PRBYTE
         LDX   #$0D
         LDY   #$08
         JSR   L458A
         LDA   #$41
         JSR   L409C
         LDA   #$AD
         JSR   COUT
         LDA   L4E00+$18
         JSR   PRBYTE
         LDX   #$1F
         LDY   #$07
         JSR   L458A
         LDA   #$42
         JSR   L409C
         LDA   #$AD
         JSR   COUT
         LDA   L4E00+$19
         JSR   PRBYTE
         LDX   #$1A
         LDY   #$08
         JSR   L458A
         LDA   #$43
         JSR   L409C
         LDA   #$AD
         JSR   COUT
         LDA   L4E00+$1A
         JSR   PRBYTE
         LDX   #$00
         LDY   #$0A
         JSR   L458A
         JSR   L402C
         ASC   "WEAPONS: "00
         LDX   #$01
L87E1    LDA   L4E00+$40,X
         BEQ   L8802
         STX   $F0
         TXA
         CLC
         ADC   #$13
         JSR   L409C
         JSR   L402C
         ASC   "S-"00
         LDX   $F0
         LDA   L4E00+$40,X
         JSR   PRBYTE
         LDA   #$A0
         JSR   COUT
L8802    INX
         CPX   #$0A
         BCC   L87E1
         LDX   #$00
         LDY   #$0D
         JSR   L458A
         JSR   L402C
         ASC   "ARMOUR: "00
         LDX   #$01
L881C    LDA   L4E00+$60,X
         BEQ   L883C
         STX   $F0
         TXA
         CLC
         ADC   #$1D
         JSR   L409C
         JSR   L402C
         ASC   "-"00
         LDX   $F0
         LDA   L4E00+$60,X
         JSR   PRBYTE
         LDA   #$A0
         JSR   COUT
L883C    INX
         CPX   #$07
         BCC   L881C
         LDX   #$00
         LDY   #$0F
         JSR   L458A
         JSR   L402C
         ASC   "SPELLS: "00
         LDX   #$01
L8856    LDA   L4E00+$80,X
         BEQ   L8877
         STX   $F0
         TXA
         CLC
         ADC   #$24
         JSR   L409C
         JSR   L402C
         ASC   "S-"00
         LDX   $F0
         LDA   L4E00+$80,X
         JSR   PRBYTE
         LDA   #$A0
         JSR   COUT
L8877    INX
         CPX   #$0A
         BCC   L8856
         LDX   #$00
         LDY   #$11
         JSR   L458A
         JSR   L402C
         ASC   "ITEMS: "00
         LDX   #$00
L8890    LDA   L4E00+$A0,X
         BEQ   L88B1
         STX   $F0
         TXA
         CLC
         ADC   #$2E
         JSR   L409C
         JSR   L402C
         ASC   "S-"00
         LDX   $F0
         LDA   L4E00+$A0,X
         JSR   PRBYTE
         LDA   #$A0
         JSR   COUT
L88B1    INX
         CPX   #$10
         BCC   L8890
         LDX   #$00
L88B8    LDA   KBD
         BPL   L88B8
         BIT   KBDSTROBE
         JSR   HOME
         LDA   TXTCLR
         LDA   HIRES
         JSR   L44DE
         JMP   L528B

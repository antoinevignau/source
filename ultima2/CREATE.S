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

KBD      EQU   $C000
KBDSTROBE EQU  $C010
VTAB     EQU   $FC22
HOME     EQU   $FC58
RDKEY    EQU   $FD0C
PRBYTE   EQU   $FDDA
COUT     EQU   $FDED
SETINV   EQU   $FE80
SETNORM  EQU   $FE84

*----------------------------

         JSR   HOME
         LDX   #$06
         LDY   #$0C
         JSR   L6665
         JSR   L65BA
         ASC   "(INSERT A BLANK PLAYER DISK)"0D00
L602B    LDA   KBD
         CMP   #$9B
         BNE   L602B
         BIT   KBDSTROBE
         JSR   L65BA
         ASC   0D
         ASC   04
         ASC   "NOMONIOC"0D
         ASC   04
         ASC   "BLOAD PLAYER"0D00
         LDA   $4E00
         BEQ   L6089
         JSR   HOME
         LDY   #$0B
         LDX   #$0E
         JSR   L6665
         JSR   L65BA
         ASC   "NOT A BLANK"00
         LDY   #$0D
         LDX   #$0E
         JSR   L6665
         JSR   L65BA
         ASC   "PLAYER DISK"00
         JMP   L65B7

L6089    JSR   HOME
         JSR   L65BA
         ASC   "          PLAYER GENERATION :"00
         JSR   L65BA
         ASC   0D0A
         ASC   "     POINTS LEFT TO DISTRIBUTE : "00
         JSR   SETINV
         LDA   #$90
         STA   $FA
         JSR   PRBYTE
         JSR   SETNORM
         JSR   L65BA
         ASC   0D0A
         ASC   "           STRENGTH......."0D
         ASC   "           AGILITY........"0D
         ASC   "           STAMINA........"0D
         ASC   "           CHARISMA......."0D
         ASC   "           WISDOM........."0D
         ASC   "           INTELLIGENCE..."0D0A
         ASC   "                M/F-"0D
         ASC   "               RACE-"0D
         ASC   "               TYPE-"0D
         ASC   "               NAME-"0D0A
         ASC   "          SATISFACTORY (Y/N)-"0D0A
         ASC   "        RACES:         TYPES:"0D
         ASC   "         1-HUMAN        1-FIGHTER"0D
         ASC   "         2-ELF          2-CLERIC"0D
         ASC   "         3-DWARF        3-WIZARD"0D
         ASC   "         4-HOBBIT       4-THIEF"00
         LDY   #$04
         LDX   #$1A
         JSR   L6665
         JSR   L65E7
         STA   $4E15
         JSR   L6635
         LDY   #$05
         LDX   #$1A
         JSR   L6665
         JSR   L65E7
         STA   $4E16
         JSR   L6635
         LDX   #$1A
         LDY   #$06
         JSR   L6665
         JSR   L65E7
         STA   $4E17
         JSR   L6635
         LDY   #$07
         LDX   #$1A
         JSR   L6665
         JSR   L65E7
         STA   $4E18
         JSR   L6635
         LDX   #$1A
         LDY   #$08
         JSR   L6665
         JSR   L65E7
         STA   $4E19
         JSR   L6635
         LDX   #$1A
         LDY   #$09
         JSR   L6665
         JSR   L65E7
         STA   $4E1A
         JSR   L6635
         LDX   #$14
         LDY   #$0B
         JSR   L6665
L6306    JSR   RDKEY
         STA   $4E10
         CMP   #$CD       ; M
         BNE   L6333
         JSR   L65BA
         ASC   "MALE"00
         LDA   $4E15
         SED
         CLC
         ADC   #$05
         CLD
         STA   $4E15
         LDX   #$1A
         LDY   #$04
         JSR   L6665
         LDA   $4E15
         JSR   PRBYTE
         JMP   L6359

L6333    CMP   #$C6       ; F
         BNE   L6306
         JSR   L65BA
         ASC   "FEMALE"00
         LDA   $4E18
         SED
         CLC
         ADC   #$10
         CLD
         STA   $4E18
         LDX   #$1A
         LDY   #$07
         JSR   L6665
         LDA   $4E18
         JSR   PRBYTE
L6359    LDX   #$14
         LDY   #$0C
         JSR   L6665
         JSR   RDKEY
         STA   $4E12
         CMP   #$B1
         BNE   L638E
         JSR   L65BA
         ASC   "HUMAN"00
         LDA   $4E1A
         SED
         CLC
         ADC   #$05
         CLD
         STA   $4E1A
         LDX   #$1A
         LDY   #$09
         JSR   L6665
         LDA   $4E1A
         JSR   PRBYTE
         JMP   L6405

L638E    CMP   #$B2
         BNE   L63B4
         JSR   L65BA
         ASC   "ELF"00
         LDA   $4E16
         SED
         CLC
         ADC   #$05
         CLD
         STA   $4E16
         LDX   #$1A
         LDY   #$05
         JSR   L6665
         LDA   $4E16
         JSR   PRBYTE
         JMP   L6405

L63B4    CMP   #$B3
         BNE   L63DC
         JSR   L65BA
         ASC   "DWARF"00
         LDA   $4E15
         SED
         CLC
         ADC   #$05
         CLD
         STA   $4E15
         LDX   #$1A
         LDY   #$04
         JSR   L6665
         LDA   $4E15
         JSR   PRBYTE
         JMP   L6405

L63DC    CMP   #$B4
         BEQ   L63E3
         JMP   L6359

L63E3    JSR   L65BA
         ASC   "HOBBIT"00
         LDA   $4E19
         SED
         CLC
         ADC   #$10
         CLD
         STA   $4E19
         LDX   #$1A
         LDY   #$08
         JSR   L6665
         LDA   $4E19
         JSR   PRBYTE
L6405    CLC
         LDA   $4E12
         SBC   #$B0
         STA   $4E12
         LDY   #$0D
         LDX   #$14
         JSR   L6665
         JSR   RDKEY
         STA   $4E11
         CMP   #$B1
         BNE   L6445
         JSR   L65BA
         ASC   "FIGHTER"00
         LDA   $4E15
         SED
         CLC
         ADC   #$15
         CLD
         STA   $4E15
         LDX   #$1A
         LDY   #$04
         JSR   L6665
         LDA   $4E15
         JSR   PRBYTE
         JMP   L64BF

L6445    CMP   #$B2
         BNE   L646E
         JSR   L65BA
         ASC   "CLERIC"00
         LDA   $4E19
         SED
         CLC
         ADC   #$10
         CLD
         STA   $4E19
         LDX   #$1A
         LDY   #$08
         JSR   L6665
         LDA   $4E19
         JSR   PRBYTE
         JMP   L64BF

L646E    CMP   #$B3
         BNE   L6497
         JSR   L65BA
         ASC   "WIZARD"00
         LDA   $4E1A
         SED
         CLC
         ADC   #$10
         CLD
         STA   $4E1A
         LDX   #$1A
         LDY   #$09
         JSR   L6665
         LDA   $4E1A
         JSR   PRBYTE
         JMP   L64BF

L6497    CMP   #$B4
         BEQ   L649E
         JMP   L6405

L649E    JSR   L65BA
         ASC   "THIEF"00
         LDA   $4E16
         SED
         CLC
         ADC   #$10
         CLD
         STA   $4E16
         LDX   #$1A
         LDY   #$05
         JSR   L6665
         LDA   $4E16
         JSR   PRBYTE
L64BF    CLC
         LDA   $4E11
         SBC   #$B0
         STA   $4E11
L64C8    LDY   #$0E
         LDX   #$14
         JSR   L6665
         JSR   L65BA
         ASC   "               "00
         LDX   #$14
         LDY   #$0E
         JSR   L6665
         LDX   #$0E
         LDA   #$00
L64ED    STA   $4E00,X
         DEX
         BNE   L64ED
         LDX   #$00
L64F5    JSR   RDKEY
         CMP   #$88
         BEQ   L64C8
         CMP   #$8D
         BEQ   L650B
         JSR   COUT
         STA   $4E00,X
         INX
         CPX   #$0C
         BCC   L64F5
L650B    LDY   #$10
         LDX   #$1D
         JSR   L6665
         JSR   RDKEY
         JSR   COUT
         CMP   #$CE       ; N
         BNE   L651F
         JMP   L6089

L651F    CMP   #$D9       ; Y
         BNE   L650B
         LDA   #$14
         STA   $4E24
         LDA   #$14
         STA   $4E25
         LDA   #$02
         STA   $4E13
         LDA   #$04
         STA   $4E1B
         STA   $4E1D
         STA   $4E22
         JSR   L65BA
         ASC   0D
         ASC   04
         ASC   "BSAVE PLAYER,A$4E00,L$100"0D00
         JSR   HOME
         LDY   #$0B
         LDX   #$0B
         JSR   L6665
         JSR   L65BA
         ASC   "TO PLAY ULTIMA ]["00
         LDY   #$0D
         LDX   #$09
         JSR   L6665
         JSR   L65BA
         ASC   "INSERT PROGRAM MASTER"00
L659C    LDA   KBD
         CMP   #$9B
         BNE   L659C
         BIT   KBDSTROBE
         JSR   L65BA
         ASC   8D
         ASC   04
         ASC   "BRUN HELLO"8D00
L65B7    JMP   L65B7

L65BA    PLA
         STA   $FE
         PLA
         STA   $FF
         LDY   #$00
L65C2    INC   $FE
         BNE   L65C8
         INC   $FF
L65C8    LDA   ($FE),Y
         BEQ   L65D4
         ORA   #$80
         JSR   COUT
         JMP   L65C2

L65D4    LDA   $FF
         PHA
         LDA   $FE
         PHA
         RTS

         CMP   #$00
         BEQ   L65E6
         BPL   L65E4
         LDA   #$FF
         RTS

L65E4    LDA   #$01
L65E6    RTS

L65E7    JSR   RDKEY
         CMP   #$B0
         BCC   L65E7
         CMP   #$BA
         BCS   L65E7
         JSR   COUT
         SEC
         SBC   #$B0
         ASL
         ASL
         ASL
         ASL
         STA   $FC
L65FE    JSR   RDKEY
         CMP   #$88
         BNE   L660B
         JSR   COUT
         JMP   L65E7

L660B    CMP   #$B0
         BCC   L65FE
         CMP   #$BA
         BCS   L65FE
         JSR   COUT
         SEC
         SBC   #$B0
         CLC
         ADC   $FC
         STA   $FC
L661E    JSR   RDKEY
         CMP   #$88
         BNE   L662E
         JSR   COUT
         JSR   COUT
         JMP   L65E7

L662E    CMP   #$8D
         BNE   L661E
         LDA   $FC
         RTS

L6635    STA   $FB
         CMP   #$0A
         BCC   L6659
         LDA   $FA
         SEC
         SED
         SBC   $FB
         CLD
         BCC   L6659
         JSR   SETINV
         STA   $FA
         LDY   #$02
         LDX   #$21
         JSR   L6665
         LDA   $FA
         JSR   PRBYTE
         JSR   SETNORM
         RTS

L6659    JSR   L65BA
         ASC   07070700
         PLA
         PLA
         JMP   L6089

L6665    STX   $24
         STY   $25
         JSR   VTAB
         RTS

         LDA   $4E
         ADC   $4F
         LDX   $4F
         STX   $4E
         STA   $4F
         RTS

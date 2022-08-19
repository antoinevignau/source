*
* Sword of Sodan: the game
*
* (c) 1989, Discovery Software
* (s) 2018, Brutal Deluxe Software
*

         mx    %11
         TYP   SYS
         ORG   $002000
         lst   off
         dsk   Startup.System

*----------------------------

         use   STARTUP.E

*----------------------------

         JMP   L2125

L2003    DW    $1400
L2005    DW    $0000
L2007    DW    $0000
L2009    DW    $0000
L200B    DW    $0000

*----------------------------

L200D    PHB
         PHK
         PLB
         STA   L20D8
         STY   L2007
         STX   L2009
         SEP   #$30
         LDA   #$C8
         STA   L20CC
         REP   #$30
         LDA   #$0003
         STA   L20DA
         LDA   L20D8
         STA   L20DB
         LDA   #$1000
         STA   L20DD
         JSR   L20C7
         LDA   L20DF
         STA   L20EA
         SEP   #$20
         LDA   #$D1
         STA   L20CC
         REP   #$30
         LDA   #$0002
         STA   L20DA
         LDA   L20EA
         STA   L20DB
         JSR   L20C7
         LDA   L20DC
         STA   L20EC
         LDA   L20DE
         AND   #$00FF
         STA   L20EE
L2064    LDA   L20EC
         CMP   #$1800
         BCC   L2074
         LDA   #$1800
         STA   L200B
         BRA   L207A
L2074    LDA   L20EC
         STA   L200B
L207A    SEP   #$30
         LDA   #$CA
         STA   L20CC
         REP   #$30
         LDA   #$0004
         STA   L20DA
         LDA   L20EA
         STA   L20DB
         LDA   #$1400
         STA   L20DC
         LDA   L200B
         STA   L20DE
         JSR   L20C7
         JSR   L20F2
         LDA   L20EC
         SEC
         SBC   L200B
         STA   L20EC
         BNE   L2064
         SEP   #$30
         LDA   #$CC
         STA   L20CC
         REP   #$30
         LDA   #$0001
         STA   L20DA
         LDA   L20EA
         STA   L20DB
         JSR   L20C7
         PLB
         RTL

L20C7    SEC
         XCE
         JSR   PRODOS8
L20CC    DB    $00
         DA    L20DA

         PHP
         CLC
         XCE
         PLP
         REP   #$30
         BCS   L20C7
         RTS

L20D8    DB    $00
         DB    $00
L20DA    DB    $00
L20DB    DB    $00
L20DC    DB    $00
L20DD    DB    $00
L20DE    DB    $00
L20DF    DB    $00
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
L20EA    DB    $00
         DB    $00
L20EC    DB    $00
         DB    $00
L20EE    DB    $00
         DB    $00
         DB    $00
         DB    $00

*----------------------------

L20F2    SEP   #$30
         LDA   L2005
         STA   L210C+2
         LDA   L2009
         STA   L210C+1
         REP   #$30
         LDA   L200B
         DEC
         LDX   L2003
         LDY   L2007
L210C    MVN   $000000,$000000
         PHK
         PLB
         LDA   L2007
         CLC
         ADC   L200B
         STA   L2007
         LDA   L2009
         ADC   #$0000
         STA   L2009
         RTS

L2125    SEC
         XCE
         JSR   HOME
         CLC
         XCE
         SEI
         REP   #$30
         PHK
         PLB
         LDA   #L214E
         LDX   #$0000
         LDY   #$A000
         JSL   L200D
         LDA   #L215B
         LDX   #$0000
         LDY   #$0800
         JSL   L200D
         JMP   $0800

*----------------------------

*L214E STR '/S1/FILEDATA'
*L215B STR '/S1/START'

L214E    STR   'S1/FILEDATA'
L215B    STR   'S1/START'

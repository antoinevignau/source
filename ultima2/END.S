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

UPDATE   =     $0240
PRINTSTR =     $402C

*----------------------------

L8900    JSR   PRINTSTR
         ASC   8D8D
         ASC   "     MINAX IS DEAD!!"8D
         ASC   "ALL HER WORKS SHALL DIE!"8D00
         LDA   #$40
         STA   $F0
L8938    JSR   $4408
         LDA   #$40
         STA   $F1
L893F    JSR   $4592
         AND   #$3F
         STA   $F4
         JSR   $4592
         AND   #$3F
         STA   $F5
         JSR   $437B
         LDA   #$74
         STA   ($06),Y
         INC   $4E
         INC   $4E
         INC   $4E
         DEC   $F1
         BNE   L893F
         JSR   UPDATE
         LDA   $4F
         ADC   #$09
         STA   $4F
         DEC   $F0
         BNE   L8938
         JSR   PRINTSTR
         ASC   8D
         ASC   "YOU FEEL A STRANGE FORCE!"00
         JSR   $442A
         JSR   PRINTSTR
         ASC   8D
         ASC   04
         ASC   "BLOAD MAP 30"8D00
         JSR   $442A
         JSR   PRINTSTR
         ASC   8D8D
         ASC   "YOU HAVE SAVED THE UNIVERSE,"8D
         ASC   "AND COMPLETED ULTIMA ][! SEEK"8D
         ASC   "NOW TO CONQUER WICKED EXODUS,"8D00
         JSR   PRINTSTR
         ASC   "FOUND IN ULTIMA ]I[-D ]II[-P!"00
         LDA   #$FF
         STA   $10
         LDA   #$28
         STA   $11
         LDA   #$00
         STA   $00
         STA   $01
L8A30    CLC
         LDA   $01
         ADC   #$01
         AND   #$3F
         STA   $01
         LSR
         BCS   L8A47
         LSR
         BCS   L8A47
         LDA   $00
         ADC   #$01
         AND   #$3F
         STA   $00
L8A47    JSR   UPDATE
         JMP   L8A30

*
* Swashbuckler
* (c) Stephenson
* (s) 2018, Brutal Deluxe Software
*
* This is the $4000..$40FF area
* It handles the high score and
* stores it onto disk at T3/SC
*

         mx    %11
         lst   off

*----------------------------

L4000    LDA   TXTPAGE1
         LDA   TXTSET
         JSR   HOME
         JSR   CROUT
         JSR   CROUT
         LDA   #<L40D8    ; YOUR SCORE
         LDY   #>L40D8
         JSR   $DB3A      ; PRINT STRING
         JSR   L4035
         JSR   L4055      ; new high?
         LDA   #<L40E8    ; HIGH SCORE
         LDY   #>L40E8
         JSR   $DB3A      ; PRINT STRING

         LDA   L40D0      ; put high score
         STA   theSCORE
         LDA   L40D0+1
         STA   theSCORE+1
         JSR   L4035
         JMP   L4090

L4035    LDA   theSCORE   ; PRINT VALUE
         STA   $9F
         LDA   theSCORE+1
         STA   $9E
         LDA   #$90
         STA   $9D
         LDA   #$00
         STA   $A0
         STA   $A1
         STA   $A2
         JSR   $ED2E      ; PRINTFAC
         JSR   CROUT
         jmp   CROUT

*---------- New high score?

L4055    LDA   L40D0+1    ; NEW HIGH SCORE?
         CMP   theSCORE+1
         BCC   L4068
         BNE   L4067
         LDA   L40D0
         CMP   theSCORE
         BCC   L4068
L4067    RTS

*--- Yes!

L4068    LDA   theSCORE+1 ; YES
         STA   L40D0+1    ; SAVE SCORE
         LDA   theSCORE
         STA   L40D0
         LDA   #$03       ; T3
         STA   L031D
         LDA   #$0C       ; SC
         STA   L031E
         LDA   #<L4000
         STA   L0328
         LDA   #>L4000
         STA   L0328+1
         LDA   #$02       ; write
         JSR   L033F      ; call RWTS
         JMP   L4067      ; return

L4090    BIT   KBD
         BPL   L4090
         LDA   #$00
         STA   KBDSTROBE
         JMP   L1B34      ; NEXT STAGE

*----------

L40D0    HEX   B100       ; HIGH SCORE
L40D8    ASC   "YOUR SCORE = "00
L40E8    ASC   "HIGH SCORE TO DATE = "00

*---------- End of code

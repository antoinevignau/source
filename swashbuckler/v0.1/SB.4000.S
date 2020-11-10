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
         STA   $09C0
         LDA   L40D1
         STA   $09C1
         JSR   L4035
         JMP   L4090

L4035    LDA   $09C0      ; PRINT VALUE
         STA   $9F
         LDA   $09C1
         STA   $9E
         LDA   #$90
         STA   $9D
         LDA   #$00
         STA   $A0
         STA   $A1
         STA   $A2
         JSR   $ED2E      ; PRINTFAC
         JSR   CROUT
         JSR   CROUT
         RTS

*---------- New high score?

L4055    LDA   L40D1      ; NEW HIGH SCORE?
         CMP   $09C1
         BCC   L4068
         BNE   L4067
         LDA   L40D0
         CMP   $09C0
         BCC   L4068
L4067    RTS

*--- Yes!

L4068    LDA   $09C1      ; YES
         STA   L40D1      ; SAVE SCORE
         LDA   $09C0
         STA   L40D0
         LDA   #$03       ; T3
         STA   $031D
         LDA   #$0C       ; SC
         STA   $031E
         LDA   #<L4000
         STA   $0328
         LDA   #>L4000
         STA   $0329
         LDA   #$02       ; write
         JSR   $033F      ; call RWTS
         JMP   L4067      ; return

L4090    BIT   KBD
         BPL   L4090
         LDA   #$00
         STA   KBDSTROBE
         JMP   L1B34      ; NEXT STAGE

*----------

         DB    $00
         DB    $1C
         DB    $08
         DB    $07
         DB    $60
         DB    $00
         DB    $C8
         DB    $AE
         DB    $D5
         DB    $AA
         DB    $D4
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
         DB    $10
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

L40D0    DB    $B1        ; HIGH SCORE
L40D1    DB    $00        ; HIGH SCORE
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40D8    ASC   "YOUR SCORE = "00
         DB    $00
         DB    $00
L40E8    ASC   "HIGH SCORE TO DATE = "00
         DB    $00
         DB    $00

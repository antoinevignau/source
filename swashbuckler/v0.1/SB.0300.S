*
* Swashbuckler
* (c) Stephenson
* (s) 2018, Brutal Deluxe Software
*
* This is FIRSTFILE
* Launched by HELLO
*

         mx    %11
         lst   off

*----------------------------

L03D9    =     $03D9      ; call RWTS

*----------------------------

L0300    JSR   $E746
L0303    STX   $51
         LDY   $50
L0307    TYA
         TAX
L0309    DEX
         BNE   L0309
         BIT   SPKR
         EOR   $51
         TAX
L0312    DEX
         BNE   L0312
         BIT   SPKR
         DEY
         BNE   L0307
         RTS

*----------

L031C    DB    $00        ; NB SEC
L031D    DB    $10        ; T
L031E    DB    $10        ; S
L031F    DB    $00

*---------- The IOB table

L0320    DB    $01
         DB    $60
         DB    $01
         DB    $FE
L0324    DB    $10
L0325    DB    $0F
         DA    L0331
L0328    DA    $1400
         DB    $00
         DB    $00
L032C    DB    $01        ; command
         DB    $D6
         DB    $FE
         DB    $60
         DB    $01
L0331    HEX   0001EFD8

*----------

L0335    LDA   #>L0320    ; call RWTS
         LDY   #<L0320
         JSR   L03D9
         RTS

*---------- Read one T/S

L033D    LDA   #$01       ; READ
         STA   L032C
         LDA   L031E      ; S
         STA   L0325
         LDA   L031D      ; T
         STA   L0324
         JSR   L0335
         RTS

*---------- Read a track

L0352    LDA   #$10       ; NB SEC
         STA   L031C
L0357    JSR   L033D      ; READ TS
         INC   L031E      ; S++
         INC   L0328+1    ; PTR HIGH++
         DEC   L031C      ; NB SEC--
         BNE   L0357
         RTS

*---------- Read 2 consecutive tracks (S0/F,T++)

L0366    STA   L031D      ; TRACK
         STX   L0328      ; PTR LOW
         STY   L0328+1    ; PTR HIGH
         LDA   #$00
         STA   L031E      ; S=0
         JSR   L0352      ; READ TRACK
         INC   L031D      ; T++
         LDA   #$00
         STA   L031E      ; S=0
         JSR   L0352      ; READ TRACK
         RTS

*---------- The entry point

L0383    LDA   #$07       ; ENTRY POINT
         LDX   #$00       ; T7..8
         LDY   #$40       ; $4000..$5FFF
         JSR   L0366

         LDA   HIRES
         LDA   TXTPAGE2
         LDA   TXTCLR
         LDA   MIXCLR
         LDA   #<L1000    ; $1000
         STA   L0328
         STA   L031E
         LDA   #$04       ; T=4
         STA   L031D
         LDA   #>L1000
         STA   L0328+1
         JSR   L0352      ; READ TRACK
         JMP   L1B00      ; NEXT STAGE

*---------- End of code

         DB    $1E
         DB    $03
         DB    $20
         DB    $67
         DB    $03
         DB    $EE
         DB    $1D
         DB    $03
         DB    $A9
         DB    $00
         DB    $8D
         DB    $1E
         DB    $03
         DB    $20
         DB    $67
         DB    $03
         DB    $60
         DB    $A9
         DB    $07
         DB    $A2
         DB    $00
         DB    $A0
         DB    $40
         DB    $4C
         DB    $A4
         DB    $03
         DB    $35
         DB    $36
         DB    $37
         DB    $38
         DB    $FF
         DB    $39
         DS    $30

*
* SpeechLab 20A RAM code
* (c) 1978, Heuristics
* (c) 2019, Brutal Deluxe Software
* Visit http://www.brutaldeluxe.fr/
*
* Thank you, Jeremy Apple
*

         org   $6000
         mx    %11
         lst   off

*---------------------------------------------------------
* Version
*
* v1.0 - 20190120 - Antoine Vignau
*       After a couple of tries, it is now working
*       Thank you for your help, Jeremy Apple
*       It would be cool to have a new version of the card!
*

*--- Equates

numWORDS        =       32      ; number of words one can record (variable)
wordSIZE        =       64      ; length of a spoken word (fixed)

*--- Zero page equates

CSWL    =       $36             ; for output
CSWH    =       CSWL+1
KSWL    =       CSWH+1          ; for input
KSWH    =       KSWL+1

A5H     =       $45             ; ACC
XREG    =       A5H+1           ; $46
YREG    =       XREG+1          ; $47
STATUS  =       YREG+1          ; $48

zpF0    =       $fc             ; Zero page addresses I use
zpF1    =       zpF0+1          ; $FC..$FF
zpPTR   =       zpF1+1

*--- Firmware/ROM equates

BELL1   =       $FBDD           ; Beep
COUT1   =       $FDF0           ; Output a char
RESTORE =       $FF3F           ; Restore A/X/Y/P
SAVE    =       $FF4A           ; Save A/X/Y/P/S
IORTS   =       $FF58           ; The official RTS

*---------------------------------------------------------
* How to use
*
* Installation of the driver
*  10 PRINT CHR$(4);"BLOAD SPEECHLAB20A RAM DRIVER"
*  20 DP = 24576 : REM $6000 FOR PR#
*  30 DI = DP + 3 : REM $6003 FOR IN#
*  40 POKE DP + 8, 5 : REM SLOT OF THE CARD
*  REM NO NEED FOR LOMEM ANYMORE
*
* Init the card
*  10 CALL DP : PRINT : CALL DP
*  ==> simulates PR#slot : PRINT : PR#0
*
* Get the buffer address
*  10 BU = PEEK(DP + 7) * 256 + PEEK(DP + 6)
*
* Record a word
*  10 CALL DP : PRINT "WORD" : CALL DP
*  ==> simulates PR#slot : PRINT "WORD" : PR#0
*
* Get a word
*  10 CALL DI : INPUT V$ : CALL DI
*  ==> simulates IN#slot : INPUT V$ : IN#0
*  ==> If V$ is an empty string, no word was recognized
* 

*---------------------------------------------------------
* Room for improvement
*
* Make buffers movable
*  The buffers follow the code. One could add pointers
*  to put them in other areas of memory
*
* Change the number of words
*  That one is easy, change numWORDS to the value you want
*
* PR# and IN#
*  One could keep the doPR and doIN to simulate the PR#
*  and IN# BASIC calls. PR#0 and IN#0 could be kept
*  That would save one page of code
*

*---------------------------------------------------------
* Entry point

        jmp     doPR            ; CALL $6000
        jmp     doIN            ; CALL $6003
        da      ptrBUFFER       ; PEEK($6007)*256 + PEEK($6006)
L12F2   ds      1               ; POKE($6008),slot
                                ; later transformed to slot*16

*---------------------------------------------------------
* The card runs with the INT ROM on
* If the "modern" ROMs are called,
* then calls to SAVE/RESTORE will be useless

LC809                   ; our new entry point
        lda     L12F2   ; is slot already 
        cmp     #7+1    ; set to slot*16?
        bcs     LC817   ; yes
        asl
        asl
        asl
        asl
        sta     L12F2   ; no, do slot*16
        
LC817    JSR   SAVE     ; save all parms

         LDA   CSWH     ; output is already set to our card?
         CMP   #>LC900  ; L12F1
         BEQ   LC878    ; yes
        
         LDA   #LC84B
         STA   KSWH
         LDA   #IORTS
         STA   CSWH

         LDY   #$00     ; string index is 0
         STY   L12F4
         JSR   LC956    ; DO MAGIC
         CMP   #numWORDS
         BPL   LC875
         TAX            ; index
         LDA   L12F6,X  ; pointer
         STA   zpPTR
         LDA   L1317,X
         STA   zpPTR+1
         JSR   RESTORE  ; restore

LC84B    JSR   SAVE     ; save
         LDY   L12F4    ; get index
         LDA   (zpPTR),Y        ; get char
         INC   L12F4    ; y++
         CMP   #$8D     ; end of string?
         BNE   LC864    ; no

LC85A    LDA   #LC817
         STA   KSWH
         LDA   #$8D     ; exit with a RET
LC864    PHA            ; save
         JSR   RESTORE  ; restore
         PLA            ; pull A
         RTS            ; return

LC86A    LDA   #COUT1
         STA   CSWH
         rts            ; exit to RANGE ERR (modified)

LC875    JMP   LC85A

*--- Card is already init'ed

LC878    LDA   A5H      ; get a char
         CMP   #$8D     ; 8D means reset list of words
         BEQ   LC8D8

         LDA   #LC89F
         STA   CSWH

         LDY   #$00     ; Y as a counter
         STY   L12F4
         LDX   L12F3    ; word index
         CPX   #numWORDS
         BPL   LC86A    ; we're full!
         LDA   L12F6,X  ; get its pointer
         STA   zpPTR
         LDA   L1317,X
         STA   zpPTR+1
         JSR   RESTORE  ; restore registers

LC89F    JSR   SAVE     ; save registers
         LDA   A5H      ; get A
         LDY   L12F4    ; get Y
         STA   (zpPTR),Y        ; save char
         INC   L12F4    ; y++
         CMP   #$8D
         BNE   LC8D4

         LDA   L12F3    ; we're done, get word index
         JSR   LC909    ; DO MAGIC
         INC   L12F3    ; next index
         LDX   L12F3    ; get it again
         LDA   zpPTR    ; ptr to char
         CLC
         ADC   L12F4    ; +index in string
         STA   L12F6,X  ; save pointer low
         LDA   zpPTR+1
         ADC   #$00
         STA   L1317,X  ; save pointer high

         LDA   #LC817
         STA   CSWH
LC8D4    jmp   RESTORE  ; restore and exit (JMP)

LC8D8    LDA   #$00     ; word index
         STA   L12F3
         LDA   #L1339
         STA   L1317
         LDA   #$00     ; init table of words
         LDX   #numWORDS-1
LC8EB    STA   L0820,X
         DEX
         BPL   LC8EB
         jmp   RESTORE  ; restore all and return (JMP)

*---------------------------------------------------------
*--- Buffers and friends

L081F   ds      1               ; a value
L12F3   ds      1               ; index in list of words, see L12F6
L12F4   ds      1               ; Y as an index
L12F5   ds      1               ; A as an index
        
        ds      \
        
*---------------------------------------------------------
* The $Cs00 page

LC900    JSR   LC809

LC909    STA   L081F
         TAX
         LDA   #$01
         STA   L0820,X

LC912    JSR   LC973
         BEQ   LC96D
         JSR   LCB2D
         LDA   #L0AF1
         STA   L0808+2
         LDA   #$00
         LSR   L081F
         BCC   LC92D
         LDA   #wordSIZE
LC92D    LSR   L081F
         BCC   LC934
         ORA   #$80
LC934    CLC
         ADC   L0808+1
         STA   L0808+1
         LDA   L0808+2
         ADC   L081F
         STA   L0808+2
         LDA   #L0AB1
         STA   L0805+2
         LDA   #wordSIZE-1
         JSR   L0804
         LDA   #$00
         RTS

LC956    JSR   LC973
         CMP   #$00
         BEQ   LC967
         JSR   LCB2D
         JSR   LCA94
         LDA   L0840
         RTS

LC967    JSR   BELL1
         JMP   LC956

LC96D    JSR   BELL1
         JMP   LC912

*--- CALLED BY $Cs00

LC973    LDA   #$00
         STA   L0840+$1
         STA   L0840+$2
LC97B    LDA   #L0859
         STA   L080F+2
         JSR   LC9E9
         BEQ   LC97B
         LDA   #$08
         STA   L0840+$7
LC98F    JSR   LC9E9
         BEQ   LC973
         DEC   L0840+$7
         BNE   LC98F
         LDA   #$0A
         STA   L0840+$8
LC99E    JSR   LC9E9
         BEQ   LC9B9
         LDA   #$0A
         STA   L0840+$8
LC9A8    LDA   L080F+2  ; end of buffer?
         CMP   #>L0AB1
         BNE   LC99E
         LDA   L080F+1
         CMP   #L0859
         ROR
         ROR   L0840+$15
         ROR
         ROR   L0840+$15
         LDA   L0840+$15
         RTS

*---------------------------------------------------------
                
LC9E9    LDY   #$00
         LDX   L12F2
         STY   L0840+$9
         LDA   $C080,X
         EOR   #$FF
         AND   #$01
         BEQ   LCA0B
         STA   L0840+$9
         JMP   LCA09

         ds    \

*---------------------------------------------------------

LCA09    LDA   #$08
LCA0B    JSR   L080F
         LDA   $C080,X
         EOR   #$FF
         AND   #$10
         BEQ   LCA1A
         STA   L0840+$9
LCA1A    LDA   #$08
         JSR   L080F
         JSR   LCA26
         LDA   L0840+$9
         RTS

LCA26    LDA   #$C8             ; counter
         STA   L0840+$A
         LDA   #$00
         STA   L0840+$4
         STA   L0840+$5
         LDA   L0840+$1
         STA   L0840+$B
         LDA   L0840+$2
         STA   L0840+$C
LCA3F    LDA   $C080,X
         AND   #$08
         CMP   L0840+$B
         BEQ   LCA52
         STA   L0840+$B
         INC   L0840+$4
LCA4F    JMP   LCA5B

LCA52    LDA   L0840+$4
         JMP   LCA58
LCA58    JMP   LCA4F

LCA5B    LDA   $C080,X
         AND   #$80
         CMP   L0840+$C
         BEQ   LCA6E
         STA   L0840+$C
         INC   L0840+$5
LCA6B    JMP   LCA77

LCA6E    LDA   L0840+$5
         JMP   LCA74
LCA74    JMP   LCA6B

LCA77    DEC   L0840+$A
         BNE   LCA3F
         LDA   L0840+$4
         CMP   #$20
         BCC   LCA86
         STA   L0840+$9
LCA86    JSR   L080F
         LDA   L0840+$5
         CMP   #$50
         BCC   LCA90
LCA90    JSR   L080F
         RTS

LCA94    LDA   #L0AF1
         SBC   #$00
         STA   L0800+2
         LDA   #$F4
         STA   L0840+$D
         LDA   #$01
         STA   L0840+$E
         LDA   #$20
         STA   L0840
         LDY   #$FF
LCAB4    INY
         CPY   #numWORDS
         BMI   LCABA
         RTS

LCABA    LDA   #wordSIZE        ; next
         CLC
         ADC   L0800+1
         STA   L0800+1
         LDA   #$00
         ADC   L0800+2
         STA   L0800+2
         LDA   L0820,Y
         BEQ   LCAB4
         LDA   #$00
         STA   L0840+$F
         STA   L0840+$10
         LDX   #wordSIZE-1
LCADA    JSR   L0800
         SEC
         SBC   L0AB1,X
         BCS   LCAE7
         EOR   #$FF
         ADC   #$01
LCAE7    CLC
         ADC   L0840+$10
         STA   L0840+$10
         LDA   #$00
         ADC   L0840+$F
         STA   L0840+$F
         CMP   L0840+$D
         JMP   LCB09
         
         ds    \
         
*---------------------------------------------------------

LCB09    BCC   LCB15
         BNE   LCAB4
         LDA   L0840+$10
         CMP   L0840+$E
         BCS   LCAB4
LCB15    DEX
         BMI   LCB1B
         JMP   LCADA

LCB1B    LDA   L0840+$F
         STA   L0840+$D
         LDA   L0840+$10
         STA   L0840+$E
         STY   L0840
         JMP   LCAB4

*--- CALLED BY $Cs00

LCB2D    LDA   #L0AB1
         STA   L080F+2
         LDA   L0840+$15
         STA   L0840+$13
         LDA   #$00
         STA   L0840+$11
         LDA   #$10
         STA   L0840+$12
         JSR   LCBA3
         STA   zpF0
         STA   zpF1
         LDA   L0840+$13
         ASL
         ASL
         STA   L0840+$16
         BEQ   LCB5B
         SEC
         SBC   #$04
LCB5B    CLC
         ADC   #L0859
         ADC   #$00
         STA   L081B+2
         LDA   #$10
         STA   L12F5
LCB6D    LDY   #$00
LCB6F    JSR   L081B
         JSR   L080F
         INY
         CPY   #$04
         BNE   LCB6F
         LDA   zpF0
         CLC
         ADC   zpF1
         STA   zpF0
         SEC
         SBC   #$10
         BMI   LCB8C
         STA   zpF0
         LDA   #$04
         BPL   LCB8E
LCB8C    LDA   #$00
LCB8E    CLC
         ADC   L0840+$16
         ADC   L081B+1
         STA   L081B+1
         BCC   LCB9D
         INC   L081B+2
LCB9D    DEC   L12F5
         BNE   LCB6D
         RTS

LCBA3    CLC
         LDX   #$F7
         LDA   L0840+$11
LCBA9    ROL   L0840+$13
         INX
         BMI   LCBB2
         JMP   LCBC7

LCBB2    ROL
         BCC   LCBBB
         SBC   L0840+$12
         SEC
         BCS   LCBA9
LCBBB    SEC
         SBC   L0840+$12
         BCS   LCBA9
         ADC   L0840+$12
         CLC
         BCC   LCBA9
LCBC7    STA   L0840+$11
         RTS

*---------------------------------------------------------

L0800    LDA   |$0000,X   ; CODE AT $0800
         RTS

L0804    TAX
L0805    LDA   |$0000,X
L0808    STA   |$0000,X
         DEX
         BPL   L0805
         RTS

L080F    STA   |$0000
         INC   L080F+1
         BNE   L081A
         INC   L080F+2
L081A    RTS

L081B    LDA   |$0000,Y
         RTS

        ds      \

*---------------------------------------------------------
* doPR
* We simulate PR#slot and here

doPR    lda     #0
        bne     doPRR   ; restore

        ldx     CSWL    ; put our hook routine
        stx     oldCSWL
        ldy     CSWH
        sty     oldCSWH
        ldx     #LC900
        tya             ; A is not 0

doPRE   stx     CSWL    ; save values
        sty     CSWH
        sta     doPR+1  ; flip/flop
        rts

doPRR   ldx     oldCSWL ; restore old values
        ldy     oldCSWH
        lda     #0
        beq     doPRE

oldCSWL ds      1
oldCSWH ds      1

*---------------------------------------------------------
* doIN
* We simulate IN#slot and here

doIN    lda     #0
        bne     doINR   ; restore

        ldx     KSWL    ; put our hook routine
        stx     oldKSWL
        ldy     KSWH
        sty     oldKSWH
        ldx     #LC900
        tya             ; A is not 0
        
doINE   stx     KSWL    ; save values
        sty     KSWH
        sta     doIN+1  ; flip/flop
        rts

doINR   ldx     oldKSWL ; restore old values
        ldy     oldKSWH
        lda     #0
        beq     doINE

oldKSWL ds      1
oldKSWH ds      1

*---------------------------------------------------------
*--- Buffers and friends

ptrBUFFER                               ; address of the buffer
L0840   ds      $19                     ; variables
L0859   ds      600                     ; read buffer
                                        ; the buffer is $258 (600d) bytes long
L0AB1   ds      wordSIZE                ; a buffer ($40 bytes)
L0AF1   ds      numWORDS*wordSIZE       ; a buffer ($800 bytes)

L0820   ds      numWORDS                ; a table of numWORDS bytes (0: no word, 1: a word)
L12F6   ds      numWORDS+1              ; table of pointers low ($21 bytes)
L1317   ds      numWORDS+1              ; table of pointers high ($21 bytes)
L1339   ds      numWORDS*numWORDS       ; a buffer for words (the words)
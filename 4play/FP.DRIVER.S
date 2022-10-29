*
* Alex Lukazi's 4play routines
* http://lukazi.blogspot.com/
*
* (c) 2016, Brutal Deluxe Software
* http://www.brutaldeluxe.fr/
*
* Use them at your own risk ;-)
*

                        mx    %11
                        org   $1000
                        lst   off

*---------- Entry point

                        jmp   FPInitAll                          ; Clear tables and variables
                        jmp   FPFindAll                          ; Find all 4play cards
                        jmp   FPFindIt                           ; Return 1st 4play card found (if any)
                        jmp   FPLoopIt                           ; ...and you can continue looping
                        jmp   FPReadDigital                      ; Read the joystick the new way
                        jmp   FPSetAnalogClampValues             ; Set the values for the old way
                        jmp   FPReadAnalog                       ; Read the joystick the old way
                        jmp   FPReadTrigger                      ; Read buttons
                        jmp   FPReadTrigger1                     ; Read buttons
                        jmp   FPReadTrigger2                     ; Read buttons
                        jmp   FPReadTrigger3                     ; Read buttons
                        jmp   FPSetSlot                          ; Force 4play slot for...
                        jmp   FPDirectRead                       ; ...a direct read of a joystick

*---------- Information

                        asc   8d
                        asc   "6502 4play routines v1.0"8d
                        asc   "(c) 2016, Brutal Deluxe Software"
                        asc   8d

*---------- Equates

*--- Mask bits

fpUP                    =     %00000001                          ; active high
fpDOWN                  =     %00000010                          ; active high
fpLEFT                  =     %00000100                          ; active high
fpRIGHT                 =     %00001000                          ; active high
fpNOTUSED               =     %00010000
fpTRIGGER3              =     %00100000                          ; active low
fpTRIGGER2              =     %01000000                          ; active high
fpTRIGGER1              =     %10000000                          ; active high

maskBIT0                =     %11111110                          ; #$FE masks bit 0
maskBIT1                =     %11111101                          ; #$FD masks bit 1
maskBIT2                =     %11111011                          ; #$FB masks bit 2
maskBIT3                =     %11110111                          ; #$F7 masks bit 3
maskBIT4                =     %11101111                          ; #$EF masks bit 4
maskBIT5                =     %11011111                          ; #$DF masks bit 5
maskBIT6                =     %10111111                          ; #$BF masks bit 6
maskBIT7                =     %01111111                          ; #$7F masks bit 7

*--- Values

fpDFTVALUE              =     $20                                ; dft value for Rev. B

*--- Softswitches

KBD                     =     $c000                              ; the first softswitch
swSLOT0                 =     $80                                ; as in $C080...
swSLOT7                 =     $F0                                ; as in $C0F0...
swSLOT8                 =     $00                                ; as in $C100... ahem...

*--- Zero page

dpF0                    =     $F0                                ; For indirect access to a card
; $F2 for slot 1
; $FE for slot 7

*---------- Tables

curINDEX                ds    1
fpTABLE                 ds    7                                  ; We can have up to 7 cards
fpTABLE2                ds    7                                  ; One entry per slot

*--- This table serves in digital to analog read

fpCLAMPTBL              dfb   $80                                ; no movement
                        dfb   $00                                ; min up or left
                        dfb   $ff                                ; max down or right
                        dfb   $80                                ; no movement

*---------------------------
* FPInitAll
*  Do what is necessary
*  to clear all data
*

FPInitAll               =     *

                        ldx   #fpTABLE2-fpTABLE
                        lda   #0
                        sta   curINDEX                           ; reset index
]lp                     sta   fpTABLE,x                          ; and the
                        sta   fpTABLE2,x                         ; two tables
                        sta   |dpF0,x                            ; beware on the IIgs
                        sta   |dpF0+1,x                          ; beware on the IIgs
                        dex
                        bpl   ]lp
                        rts

*---------------------------
* FPFindAll
*  Find all the 4play cards
*  in your Apple II computer
*  by looking through the slots
*
* On exit:
*  A: number of cards found
*  Carry clear: we have 1+ card(s)
*          set: no card found
*

FPFindAll               =     *

                        jsr   FPFindIt                           ; try to find a 4play card
                        bcc   FPLoopAll                          ; we have found one
                        lda   curINDEX                           ; it is normally zero
                        rts                                      ; no card found tell it

FPLoopAll               ldy   curINDEX                           ; when one found
                        sta   fpTABLE,y                          ; save its slot
                        inc   curINDEX

                        pha                                      ; slot becomes index
                        asl                                      ; 1=>2, 2=>4
                        tay                                      ; the index
                        txa                                      ; slot*16
                        sta   |dpF0,y                            ; is stored in DP
                        lda   #>KBD                              ; and the high value
                        sta   |dpF0+1,y                          ; also

                        pla                                      ; restore slot
                        tay                                      ; slot becomes index
                        dey                                      ; minus 1 (because table is 7b)
                        txa                                      ; slot*16 in A
                        sta   fpTABLE2,y                         ; save slot*16 in fpTABLE2,A

                        jsr   FPLoopIt                           ; loop again (X is preserved)
                        bcc   FPLoopAll                          ; another one found
                        lda   curINDEX                           ; tell the number of cards found
                        clc                                      ; tell we've found one at least
                        rts

*---------------------------
* FPFindIt
*  Loop through the softswitches
*  $C0s0..$C0s3 for 4 consecutive
*  default value (see above)
*
*  On exit:
*   A: slot
*   X: slot*16
*   Carry clear: card found
*           set: card not found
*

FPFindIt                =     *

                        ldx   #swSLOT8

FPLoopIt                =     *                                  ; Search for the default value

                        txa                                      ; previous slot
                        sec
                        sbc   #$10
                        tax
                        cpx   #swSLOT0                           ; until slot 0
                        bne   FPLoopIt1                          ; see if there is a card
                        sec                                      ; no 4play card
                        rts

FPLoopIt1               lda   KBD,x                              ; $C0s0
                        cmp   #fpDFTVALUE
                        bne   FPLoopIt
                        lda   KBD+1,x                            ; $C0s1
                        cmp   #fpDFTVALUE
                        bne   FPLoopIt
                        lda   KBD+2,x                            ; $C0s2
                        cmp   #fpDFTVALUE
                        bne   FPLoopIt
                        lda   KBD+3,x                            ; $C0s3
                        cmp   #fpDFTVALUE
                        bne   FPLoopIt                           ; card not found

                        txa                                      ; 4play card found
                        and   #maskBIT7                          ; mask bit 7 (= -#$80)
                        lsr
                        lsr
                        lsr
                        lsr                                      ; X= slot*16
                        clc                                      ; A= slot
                        rts                                      ; done

*---------------------------
* FPSetSlot
*
* Set the slot of the 4play card
* to allow the FPDirectRead to
* read joystick values rapidly
*
* On entry:
*  X: slot (1..7) of the 4play card
*

FPSetSlot               =     *

                        lda   fpTABLE2-1,x                       ; coz slot 1 is offset 0
                        beq   FPSetSlot1                         ; no card, exit
                        sta   FPDRPatch+1
                        clc                                      ; with success
                        rts
FPSetSlot1              sec                                      ; with error
                        rts

*---------------------------
* FPDirectRead
*
* This routine reads the
* indexed joystick data
*
* On entry:
*  X: player's joystick (1..4)
*

FPDirectRead            =     *

                        dex                                      ; from 1..4 to 0..3
FPDRPatch               lda   KBD,x                              ; $C090 for S1 .. $C0F0 for S7
                        inx                                      ; from 0..3 to 1..4
                        rts

*---------------------------
* FPReadDigital
*
* On entry:
*  X: joystick to read (1..4)
*

FPReadDigital           =     *

                        jmp   FPDirectRead

*---------------------------
* FPSetAnalogClampValues
*
* This routine sets the clamp values
* used in the analog mode
*
* On entry:
*  A: no movement value
*  X: minimal value (up or left)
*  Y: maximal value (down or right)
*

FPSetAnalogClampValues  =     *

                        sta   fpCLAMPTBL
                        sta   fpCLAMPTBL+3
                        stx   fpCLAMPTBL+1
                        sty   fpCLAMPTBL+2
                        rts

*---------------------------
* FPReadAnalog
*
* This routine returns analog values
* from a digital read. It is not similar
* to PREAD, the routine in ROM
*
* On entry:
*  X: joystick to read (1..4)
*
* On exit:
*  X: analog value for left/right
*  Y: analog value for up/down
*

FPReadAnalog            =     *

                        jsr   FPDirectRead

                        pha                                      ; save joystick value
                        and   #fpUP+fpDOWN                       ; keep up/down
                        tax                                      ; get it in our table
                        lda   fpCLAMPTBL,x
                        tay                                      ; return in Y

                        pla                                      ; restore joystick value
                        and   #fpLEFT+fpRIGHT                    ; keep left/right
                        lsr                                      ; /2
                        lsr                                      ; /2
                        tax                                      ; get it in our table
                        lda   fpCLAMPTBL,x
                        tax                                      ; return in X
                        rts

*---------------------------
* FPReadTrigger
*
* A set of routines to read the triggers
* (or buttons)
* Note that we read /TRIGGER3 (active low)
* whereas we read TRIGGER1 and TRIGGER2 (active high)
*
* The routines must be adapted according to your needs
*
* On entry:
*  X: joystick to read (1..4)
*

FPReadTrigger           =     *

                        jsr   FPDirectRead
                        and   #fpTRIGGER1+fpTRIGGER2+fpTRIGGER3
                        clc                                      ; <= if useless, remove
                        rts

FPReadTrigger1          =     *

                        jsr   FPDirectRead
                        and   #fpTRIGGER1                        ; because it is TRIGGER1
                        rts

FPReadTrigger2          =     *

                        jsr   FPDirectRead
                        and   #fpTRIGGER2                        ; because it is TRIGGER2
                        asl                                      ; bit 6 > bit 7
                        rts

FPReadTrigger3          =     *

                        jsr   FPDirectRead
                        and   #fpTRIGGER3
                        eor   #fpTRIGGER3                        ; because we read /TRIGGER3
                        asl                                      ; bit 5 > bit 6
                        asl                                      ; bit 6 > bit 7
                        rts

                        ds    \


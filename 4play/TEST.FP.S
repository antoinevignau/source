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
                        org   $300
                        lst   off

*---------- Entry point

KBD                     =     $C000
KBDSTROBE               =     $C010
PRBYTE                  =     $FDDA
COUT                    =     $FDED

*---------- Driver equates

FPInitAll               =     $1000                     ; Clear tables and variables
FPFindAll               =     FPInitAll+3               ; Find all 4play cards
FPFindIt                =     FPFindAll+3               ; Return 1st 4play card found (if any)
FPLoopIt                =     FPFindIt+3                ; ...and you can continue looping
FPReadDigital           =     FPLoopIt+3                ; Read the joystick the new way
FPSetAnalogClampValues  =     FPReadDigital+3           ; Set the values for the old way
FPReadAnalog            =     FPSetAnalogClampValues+3  ; Read the joystick the old way
FPReadTrigger           =     FPReadAnalog+3            ; Read buttons
FPReadTrigger1          =     FPReadTrigger+3           ; Read buttons
FPReadTrigger2          =     FPReadTrigger1+3          ; Read buttons
FPReadTrigger3          =     FPReadTrigger2+3          ; Read buttons
FPSetSlot               =     FPReadTrigger3+3          ; Force 4play slot for...
FPDirectRead            =     FPSetSlot+3               ; ...a direct read of a joystick

*---------- The code

                        jsr   FPInitAll                 ; Clear all
                        jsr   FPFindAll                 ; Find all 4play cards

                        lda   $F9                       ; Get slot high
                        jsr   PRBYTE
                        lda   $F8                       ; Get slot low
                        jsr   PRBYTE

                        ldx   #$04                      ; Force slot 4
                        jsr   FPSetSlot

*---

]lp                     lda   #$8D
                        jsr   COUT
                        ldx   #$01                      ; Read first joystick
                        jsr   FPDirectRead
                        jsr   PRBYTE                    ; display its value

                        lda   #$A0
                        jsr   COUT

                        ldx   #$02                      ; Read second joystick
                        jsr   FPDirectRead
                        jsr   PRBYTE                    ; display its value

                        lda   KBD                       ; loop until a
                        bpl   ]lp                       ; key is pressed

                        bit   KBDSTROBE                 ; exit
                        rts


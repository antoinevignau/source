*
* Targui
*
* (c) 1990, Antoine Vignau
*

            mx    %11
            org   $a900
            lst   off

*----------------------------

KBD         EQU   $C000
SET80COL    EQU   $C001
CLR80VID    EQU   $C00C
SET80VID    EQU   $C00D
KBDSTROBE   EQU   $C010
TXTCLR      EQU   $C050
TXTSET      EQU   $C051
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
HIRES       EQU   $C057
SETAN3      EQU   $C05E
PWRUP       EQU   $FAA6
HOME        EQU   $FC58
MOVE        EQU   $FE2C

*----------------------------

LA900       sta   CLR80VID
            sta   TXTSET
            sta   TXTPAGE1
            sta   KBD
            jsr   HOME

            lda   #$00        ; move $4000..$5fff
            sta   $3C         ; to $2000..$3fff aux
            lda   #$40
            sta   $3D
            lda   #$FF
            sta   $3E
            lda   #$5F
            sta   $3F
            lda   #$00
            sta   $42
            lda   #$20
            sta   $43
            sec
            jsr   $C311

            lda   #$00        ; move $6000..$7fff
            sta   $3C         ; to $2000..$3fff main
            lda   #$60
            sta   $3D
            lda   #$FF
            sta   $3E
            lda   #$7F
            sta   $3F
            lda   #$00
            sta   $42
            lda   #$20
            sta   $43
            ldy   #$00
            jsr   MOVE

            sta   SET80COL
            sta   SET80VID
            sta   TXTCLR
            sta   MIXCLR
            sta   TXTPAGE1
            sta   HIRES
            sta   SETAN3
            rts

            ds    $12

*--- No more DHGR and reboot

LA980       sta   CLR80VID
            sta   TXTSET
            sta   TXTPAGE1
            sta   KBD
            jmp   PWRUP

            db    $00

*--- Show DHGR and wait

LA980       jsr   LA900
]lp         lda   KBD
            bpl   ]lp
            bit   KBDSTROBE
            sta   CLR80VID
            sta   TXTPAGE1
            sta   TXTSET
            sta   KBD
            rts

            ds    \


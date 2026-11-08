*
* Pourcentage
*
* (c) 1995, Brutal Deluxe
*

* SETpercentage: 90 cycles
* GETpercentage: 100 cycles

               org   $1000
               lst   off

               use   4/Int.Macs
               use   4/Util.Macs

*---

               clc
               xce
               rep   #$30

               ldx   #1280          ; nombre de pixels avant reduction
               ldy   #50            ; pourcentage de reduction desire
               jsr   SETpercentage
               sty   resultX        ; nombre de pixels apres reduction
                                    ; on ne garde que Y
                                    ; bien que X soit aussi valide
               ldx   #768
               ldy   #50
               jsr   SETpercentage
               sty   resultY

               ldx   #1280          ; nombre de pixels avant reduction
               ldy   resultX        ; nombre de pixels apres reduction
               jsr   GETpercentage
               sty   resultA        ; on ne garde que Y
                                    ; bien que X soit aussi valide
               ldx   #768
               ldy   #50
               jsr   GETpercentage
               sty   resultB

               sec
               xce
               sep   #$30
               rts

               mx    %00

SETpercentage  pha                  ; space for the remainder
               pha
               pha                  ; space for the quotient
               pha
               pha                  ; space for result
               pha
               phx                  ; pixels
               phy                  ; % de reduction
               _Multiply
               pea   $0000
               pea   $0064          ; =100%
               _LongDivide
               ply
               plx
               pla
               pla
               rts

GETpercentage  stx   resultA
               pha                  ; space for the remainder
               pha
               pha                  ; space for the quotient
               pha
               pha                  ; space for result
               pha
               phy                  ; previous percentage
               pea   $0064          ; 100%
               _Multiply
               pea   $0000
               lda   resultA
               pha                  ; pixels
               _LongDivide
               ply
               plx
               pla
               pla
               rts

resultX        ds    2
resultY        ds    2
resultA        ds    2
resultB        ds    2


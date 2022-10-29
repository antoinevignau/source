*--------------------------------------*
*                                      *
*  Tinies Contruction Kit: About Menu  *
*                                      *
*     (c) 10/1994 by Brutal Deluxe     *
*                                      *
*--------------------------------------*

aboutMENU lda  ptrABOUT
         clc
         adc   #$7d00
         sta   Debut
         sta   Third
         lda   ptrABOUT+2
         sta   Debut+2
         sta   Third+2

         ldy   #$2fe
]lp      lda   [Debut],y
         tyx
         stal  $019d00,x
         dey
         dey
         bpl   ]lp

         ldx   #0
         txa
]lp      stal  $019d00,x
         inx
         inx
         cpx   #$100
         bne   ]lp

*---

         lda   ptrABOUT
         clc
         adc   #$7c60
         sta   Debut
         lda   ptrABOUT+2
         sta   Debut+2

         lda   #$0001
         sta   Arrivee+2

         stz   abNBLINE

aboutMENU1 lda #199
         sec
         sbc   abNBLINE
         sta   abLASTLINE

         stz   abCURRLINE

aboutMENU2 lda abCURRLINE
         asl
         tax
         lda   Ligne,x
         clc
         adc   #$2000
         sta   Arrivee

         ldy   #160-2
]lp      lda   [Debut],y
         sta   [Arrivee],y
         dey
         dey
         bpl   ]lp

         sep   #$20       ; Et les palettes
         ldy   abLASTLINE
         lda   [Third],y
         ldx   abCURRLINE
         stal  $019d00,x
         rep   #$20

         lda   abCURRLINE
         cmp   abLASTLINE
         beq   aboutMENU3
         inc   abCURRLINE
         bra   aboutMENU2

aboutMENU3 lda Debut
         sec
         sbc   #160
         sta   Debut
         cmp   #$2000
         bcc   aboutMENU4

         jsr   nextVBL
         jsr   nextVBL
         jsr   nextVBL

         lda   abNBLINE
         cmp   #199
         beq   aboutMENU4
         inc   abNBLINE
         bra   aboutMENU1

aboutMENU4 rts

*-------------------------------------- About Datas

abNBLINE ds    2
abCURRLINE ds  2
abLASTLINE ds  2

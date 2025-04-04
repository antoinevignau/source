;...............................................................
;
; FILE : SHOWSLIDE.S                    - APPARITIONS -
;        -----------
;...............................................................
               List Off
               Gen Off
               Symbol Off
               Keep DoSlide
               65816 On

               longa on
               longi on
;...............................................................
;
;        DoSlideR
;
;...............................................................
DoSlideR       START

               brl Slide

               END
;...............................................................
;
;        Slide
;
;...............................................................
Slide          START
               USING variables

*
*              on arrive avec sur la pile :
*              SrcBitPtr, DstBitPtr
*              SrcRectPtr, DstRectPtr
*              Mode
*

leRtl          gequ     0
Mode           gequ     4
DstRectPtr     gequ     mode+2
SrcRectPtr     gequ     DstRectPtr+4
DstBitPtr      gequ     SrcRectPtr+4
SrcBitPtr      gequ     DstBitPtr+4
NewRtl         gequ     SrcBitPtr

nbrmode        gequ     12

*
*              mode 0 = lateral gauche
*              mode 1 = vertical haut
*              mode 2 = schrink
*              mode 3 = lateral droit
*              mode 4 = vertical bas
*              mode 5 = biais bas droite
*              mode 6 = biais haut gauche
*              mode 7 = biais bas gauche
*              mode 8 = biais haut droite
*              mode 9 = Fondu au noir
*              mode 10 = Fondu au blanc

y1             gequ     0
x1             gequ     2
y2             gequ     4
x2             gequ     6

largsch        gequ     20
hautsch        gequ     20

*
*              le programme
*

Debut          phb                      ; sauve registres
               phd
               php

               rep      #$30

               phk
               plb                      ; met Data Bank

               tsc
               clc
               adc      #4              ; pour passer B, D, P
               tcd                      ; met direct bank = pile

*
*              tests de validite restent a faire
*              rectangles egaux, mode.
*

               ldy      #x2
               lda      [SrcRectPtr],y
               ldy      #x1
               sec
               sbc      [SrcRectPtr],y
               bmi      Erreur

               dec      a               ; rectangle inclus
               lsr      a
               sta      SlLargeur         ; en octets

               ldy      #y2
               lda      [SrcRectPtr],y
               ldy      #y1
               sec
               sbc      [SrcRectPtr],y
               bmi      Erreur

               sta      SlHauteur

               ldy      #x1
               lda      [SrcRectPtr],y
               lsr      a
               sta      SrcOx
               lda      [DstRectPtr],y
               lsr      a
               sta      SlDestOx          ; en octets

               ldy      #y1
               lda      [SrcRectPtr],y
               sta      SrcOy
               lda      [DstRectPtr],y
               sta      SlDestOy

               lda      mode            ; direct page
               cmp      #nbrmode
               bcs      erreur
               asl      a
               tax

               jsr      (lesmodes,x)    ; va sous-programme correspondant

               stz      exerror         ; pas d'erreur

Exit           plp
               pld                      ; remet a jour direct bank
               plb                      ; data bank

               lda      leRtl,s
               sta      NewRtl,s
               lda      leRtl+2,s
               sta      NewRtl+2,s

               tsc
               clc
               adc      #18
               tcs

               lda      exerror
               bne      seterr

               clc
               rtl

seterr         sec
               rtl


Erreur         lda      #$FFFF
               sta      exerror         ; une erreur
               bra      Exit

exerror        ds 2


lesmodes       anop

               dc       i'lateralG'
               dc       i'verticalH'
               dc       i'schrink'
               dc       i'lateralD'
               dc       i'verticalB'
               dc       i'biaisBD'
               dc       i'biaisHG'
               dc       i'biaisBG'
               dc       i'biaisHD'
               dc       i'FonduAuNoir'
               dc       i'FonduAuBlanc'

               END

*
*              variables
*
variables      DATA

srcx           ds 2
srcy           ds 2
SlDestx        ds 2
SlDesty        ds 2

debutx         ds 2
debuty         ds 2

SlLargeur      ds 2
SlHauteur      ds 2

SrcOx          ds 2
SrcOy          ds 2
SlDestOx       ds 2
SlDestOy       ds 2

TempPalette    ds 32

mask           ds 2

               END


LateralG       START
               USING variables

               lda      #0

latcopy        jsr      copycol

tireligne      lda      SlDestx
               cmp      SlLargeur
               bcs      latexit
               inc      a

               bra      latcopy

latexit        rts

               END

LateralD       START
               USING variables

               lda      SlLargeur

latcopy        jsr      copycol

tireligne      lda      SlDestx
               bmi      latexit
               dec      a

               bra      latcopy

latexit        rts

               END

copycol        START
               USING    variables

               sta      SlDestx
               sta      srcx
               stz      SlDesty
               stz      srcy

transf         jsr      transfert

               lda      SlDesty
               cmp      SlHauteur
               bcs      copylexit

               inc      a
               sta      SlDesty
               sta      srcy           ; on affiche la suite de la ligne y

               bra      transf

copylexit      rts

               END

VerticalH      START
               USING variables

               lda      #0

vercopy        jsr      SlCopyLigne

tirecol        lda      SlDesty
               cmp      SlHauteur
               bcs      verexit
               inc      a

               bra      vercopy

verexit        rts

               END

VerticalB      START
               USING variables

               lda      SlHauteur

vercopy        jsr      SlCopyLigne

tirecol        lda      SlDesty
               bmi      verexit
               dec      a

               bra      vercopy

verexit        rts

               END

SlCopyLigne      START
               USING    variables

               sta      SlDesty
               sta      srcy
               stz      SlDestx
               stz      srcx

transf         jsr      transfert

               lda      SlDestx
               cmp      SlLargeur
               bcs      copylexit

               inc      a
               sta      SlDestx
               sta      srcx           ; on affiche la suite de la col x

               bra      transf

copylexit      rts

               END

Schrink        START
               USING variables

               ldy      #0

startsch       sty      numrand
               stz      Srcx
               stz      Srcy

               lda      RandomPtr,y
               sta      depxy
               xba
               and      #$00FF          ; dy
testYinRect    clc
               adc      Srcy
               cmp      SlHauteur
               bcs      nextpoint

               sta      Srcy
               sta      SlDesty

               lda      depxy
               and      #$00FF          ; dx
testXinRect    clc
               adc      Srcx
               cmp      SlLargeur
               beq      SetLastPt
               bcs      nextYrect

SetLastPt      sta      Srcx
               sta      SlDestx

               jsr      transfert

               lda      #largsch

               bra      testXinrect

nextYrect      stz      srcx
               lda      #hautsch

               bra      testYinRect

nextPoint      ldy      numrand
               cpy      #799
               bcs      schrexit
               iny
               iny
               bra      startsch

schrexit       rts

numrand        ds 2
depxy          ds 2

               END

biaisBD        START
               USING    variables

               lda      SlHauteur
               ldy      SlLargeur
               sta      debuty
               sty      debutx

biaiscopy      jsr      copyligcol                

tirecol        lda      debuty
               beq      decol

               dec      a
               sta      debuty

               ldy      debutx

               bra      biaiscopy

decol          ldy      debutx
               beq      biaixit
               dey
               sty      debutx

               lda      debuty

               bra      biaiscopy

biaixit        rts

               END

biaisHG        START
               USING    variables

               lda      #0
               ldy      #0
               sta      debuty
               sty      debutx

biaiscopy      jsr      copyligcol                

tirecol        ldy      debutx
               cpy      SlLargeur
               beq      decol

               iny
               sty      debutx

               lda      debuty

               bra      biaiscopy

decol          lda      debuty
               cmp      SlHauteur
               bcs      biaixit
               inc      a
               sta      debuty

               ldy      debutx

               bra      biaiscopy

biaixit        rts

               END

copyligcol     START
               USING    variables

               sta      SlDesty
               sta      srcy
               sty      SlDestx
               sty      srcx

               jsr      transfert

               lda      SlDestx
               bmi      copyexit
               lda      SlDesty
               cmp      SlHauteur                 
               bcs      copyexit

               inc      a

               ldy      SlDestx
               dey

               bra      copyligcol
               
copyexit       rts

               END

biaisBG        START
               USING    variables

               lda      SlHauteur
               ldy      #0
               sta      debuty
               sty      debutx

biaiscopy      jsr      copycollig                

tirecol        lda      debuty
               beq      decol

               dec      a
               sta      debuty

               ldy      debutx

               bra      biaiscopy

decol          ldy      debutx
               cpy      SlLargeur
               bcs      biaixit
               iny
               sty      debutx

               lda      debuty

               bra      biaiscopy

biaixit        rts

               END

biaisHD        START
               USING    variables

               lda      #0
               ldy      SlLargeur
               sta      debuty
               sty      debutx

biaiscopy      jsr      copycollig                

tirecol        ldy      debutx
               beq      decol

               dey
               sty      debutx

               lda      debuty

               bra      biaiscopy

decol          lda      debuty
               cmp      SlHauteur
               bcs      biaixit
               inc      a
               sta      debuty

               ldy      debutx

               bra      biaiscopy

biaixit        rts

               END

copycollig     START
               USING    variables

               sta      SlDesty
               sta      srcy
               sty      SlDestx
               sty      srcx

               jsr      transfert

               lda      SlDestx
               cmp      SlLargeur
               bcs      copyexit

               lda      SlDesty
               cmp      SlHauteur                 
               bcs      copyexit

               inc      a

               ldy      SlDestx
               iny

               bra      copycollig
               
copyexit       rts

               END

FonduAuNoir    START
               USING variables

               ldx      #$1E
FonduN1        lda      $E19E00,x
               sta      TempPalette,x
               dex
               dex
               bpl      FonduN1

               lda      #1
FonduN3        sta      Mask

               ldx      #$1E
FonduN2        lda      TempPalette,x

               ldy      mask

FonduN21       jsr      DecPalette

               dey
               bne      FonduN21

               sta      $E19E00,x
               dex
               dex
               bpl      FonduN2

               jsr      Pause

               lda      Mask
               inc      a
               cmp      #16
               bcc      FonduN3

               jsr      CopyScreen

               lda      #15
               sta      Mask

FonduN5        ldx      #$1E

FonduN4        lda      TempPalette,x
               ldy      mask
               beq      FonduN7

FonduN6        jsr      DecPalette
               dey
               bpl      FonduN6

FonduN7        sta      $E19E00,x
               dex
               dex
               bpl      FonduN4

               jsr      Pause

               dec      mask
               bpl      FonduN5

               rts

DecPalette     anop
               sep      #$20
               longa    off
               cmp      #$10
               bcc      Fondu200
               sbc      #$10
Fondu200       cmp      #0
               beq      Fondu201
               dec      a
Fondu201       xba
               cmp      #0
               beq      Fondu202
               dec      a
Fondu202       xba
               rep      #$20
               longa    on

               rts

               END
;--------------------------------------
FonduAuBlanc   START
               USING variables

               ldx      #$1E
FonduB1        lda      $E19E00,x
               sta      TempPalette,x
               dex
               dex
               bpl      FonduB1

               lda      #1
FonduB3        sta      Mask

               ldx      #$1E
FonduB2        lda      TempPalette,x

               ldy      mask

FonduB21       jsr      IncPalette

               dey
               bne      FonduB21

               sta      $E19E00,x
               dex
               dex
               bpl      FonduB2

               jsr      Pause

               lda      Mask
               inc      a
               cmp      #16
               bcc      FonduB3

               jsr      CopyScreen

               lda      #15
               sta      Mask

FonduB5        ldx      #$1E

FonduB4        lda      TempPalette,x
               ldy      mask
               beq      FonduB7

FonduB6        jsr      IncPalette
               dey
               bpl      FonduB6

FonduB7        sta      $E19E00,x
               dex
               dex
               bpl      FonduB4

               jsr      Pause

               dec      mask
               bpl      FonduB5

               rts

IncPalette     anop
               sep      #$20
               longa    off
               cmp      #$F0
               bcs      Fondu200
               adc      #$10
Fondu200       pha
               and      #$F
               cmp      #15
               beq      Fondu203
               pla
               inc      a
               bra      Fondu201
Fondu203       pla
Fondu201       xba
               cmp      #15
               beq      Fondu202
               inc      a
Fondu202       xba
               rep      #$20
               longa    on

               rts

               END
;--------------------------------------
Pause          START

               ldy      #$6000
Pause1         dey
               bpl      Pause1
               rts

               END
;--------------------------------------
CopyScreen     START
               USING variables

               ldy      #$7CFE
CopyScreen1    lda      [SrcBitPtr],y
               sta      [DstBitPtr],y
               dey
               dey
               bpl      CopyScreen1

               rts

               END

transfert      START
               USING variables

               lda      SrcOy
               clc
               adc      Srcy
               jsr      mult160
               clc
               adc      SrcOx
               adc      Srcx
               tay

               lda      [SrcBitPtr],y
               sta      stocke

               lda      SlDestOy
               clc
               adc      SlDesty
               cmp      #200
               bcs      transexit

               jsr      mult160
               sta      tempadr

               lda      SlDestOx
               clc
               adc      SlDestx
               cmp      #160
               bcs      transexit
               adc      tempadr

               tay

               sep      #$20
               lda      stocke
               sta      [DstBitPtr],y
               rep      #$20
               
transexit      rts

stocke         ds 2
tempadr        ds 2

               END

Mult160        START

               asl      a
               asl      a
               asl      a
               asl      a
               asl      a
               sta      temp32
               asl      a
               asl      a
               clc
               adc      temp32

               rts

temp32         ds 2

               END
;--------------------------------------
RandomPtr      START

        dc i1'1,11,6,6,13,1,0'
        dc i1'9,14,14,4,6,11,15,3'
        dc i1'11,7,5,19,3,2,3,0'
        dc i1'6,16,4,4,10,6,13,6'
        dc i1'9,14,6,8,1,15,18,11'
        dc i1'13,6,1,13,14,3,15,0'
        dc i1'2,11,0,9,10,13,3,2'
        dc i1'12,10,12,2,18,4,17,17'
        dc i1'5,10,18,8,5,6,12,17'
        dc i1'4,11,17,17,6,10,1,6'
        dc i1'19,8,10,16,10,10,14,19'
        dc i1'1,7,9,19,17,2,11,19'
        dc i1'12,18,11,12,6,7,6,9'
        dc i1'7,15,7,3,17,1,12,16'
        dc i1'3,3,4,2,15,3,16,13'
        dc i1'10,13,18,1,2,12,15,11'
        dc i1'6,12,9,7,11,16,2,16'
        dc i1'16,11,4,7,4,0,13,0'
        dc i1'12,10,17,19,19,5,13,15'
        dc i1'13,13,12,6,18,11,14,11'
        dc i1'1,5,4,8,0,17,0,5'
        dc i1'16,8,6,10,0,4,4,13'
        dc i1'9,5,19,12,12,8,14,4'
        dc i1'8,19,10,3,14,11,9,19'
        dc i1'11,1,6,10,16,7,19,10'
        dc i1'7,4,14,8,16,1,10,10'
        dc i1'3,9,5,7,17,12,17,14'
        dc i1'17,18,17,14,8,5,7,15'
        dc i1'19,1,17,17,15,3,8,9'
        dc i1'3,5,3,1,14,9,18,14'
        dc i1'3,2,4,13,11,10,5,7'
        dc i1'15,1,13,3,3,18,2,9'
        dc i1'14,14,18,14,1,7,2,15'
        dc i1'3,14,15,9,15,5,14,8'
        dc i1'19,3,10,14,4,0,15,16'
        dc i1'7,4,2,7,1,2,5,11'
        dc i1'18,10,4,16,9,8,7,15'
        dc i1'14,15,11,12,11,11,19,7'
        dc i1'8,6,14,17,2,17,11,15'
        dc i1'6,16,14,15,8,12,18,4'
        dc i1'13,14,19,15,15,5,9,8'
        dc i1'13,8,17,7,10,0,10,0'
        dc i1'19,9,0,15,5,19,9,6'
        dc i1'0,0,17,3,9,5,8,16'
        dc i1'15,16,0,5,17,2,17,1'
        dc i1'8,5,12,1,9,18,3,6'
        dc i1'5,15,4,18,8,12,14,19'
        dc i1'16,2,10,6,4,0,18,16'
        dc i1'6,6,8,7,0,11,10,1'
        dc i1'5,12,2,9,13,13,4,1'
        dc i1'0,18,7,5,0,0,8,18'
        dc i1'15,18,5,7,13,19,2,11'
        dc i1'5,12,0,12,16,19,15,4'
        dc i1'19,18,19,18,4,14,10,7'
        dc i1'12,18,1,14,5,19,13,13'
        dc i1'13,9,8,13,16,10,13,1'
        dc i1'3,19,4,17,1,9,1,13'
        dc i1'2,11,16,1,16,19,18,13'
        dc i1'19,10,19,19,14,3,6,13'
        dc i1'0,11,7,0,7,6,3,12'
        dc i1'3,18,18,2,6,9,4,4'
        dc i1'16,5,2,2,19,8,4,17'
        dc i1'19,18,6,7,16,13,7,12'
        dc i1'5,13,17,14,7,18,9,2'
        dc i1'9,0,14,15,12,4,3,14'
        dc i1'12,9,17,10,2,5,11,3'
        dc i1'19,12,10,8,15,2,1,12'
        dc i1'13,11,2,3,7,17,16,4'
        dc i1'18,8,8,1,19,16,18,9'
        dc i1'6,0,1,4,1,5,15,4'
        dc i1'11,8,18,4,7,13,6,10'
        dc i1'11,4,5,6,7,3,0,14'
        dc i1'0,11,3,5,6,17,3,15'
        dc i1'16,2,2,15,2,4,9,5'
        dc i1'5,9,19,16,8,6,2,18'
        dc i1'16,17,7,3,13,10,9,4'
        dc i1'0,12,7,5,10,15,17,4'
        dc i1'15,10,8,8,11,2,14,16'
        dc i1'12,10,6,9,9,3,1,18'
        dc i1'10,14,9,17,12,2,8,19'
        dc i1'7,0,16,17,8,1,15,3'
        dc i1'12,0,11,5,1,11,12,1'
        dc i1'1,10,15,16,1,4,12,3'
        dc i1'5,9,12,18,12,0,5,7'
        dc i1'7,2,16,17,17,19,6,1'
        dc i1'18,17,18,19,5,2,0,6'
        dc i1'10,3,18,16,11,14,11,13'
        dc i1'15,16,13,7,14,9,16,8'
        dc i1'9,17,13,7,18,0,3,12'
        dc i1'4,1,7,3,2,12,19,6'
        dc i1'11,18,13,0,4,6,15,13'
        dc i1'5,17,14,14,2,9,2,13'
        dc i1'8,14,13,12,1,16,19,9'
        dc i1'11,11,11,11,8,14,16,0'
        dc i1'0,15,0,18,0,19,0,15'
        dc i1'1,8,2,7,3,8,3,1'
        dc i1'4,16,5,2,7,12,8,19'
        dc i1'8,15,9,17,9,10,10,15'
        dc i1'10,17,10,8,12,2,13,18'
        dc i1'14,6,16,6,17,16,17,5'
        dc i1'18'
 
               END

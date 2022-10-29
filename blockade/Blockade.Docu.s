*
* Blockade: Documentation
*

*--------------------------------------

printIT  sta   printIT2+1

printIT1 sty   Arrivee
         stx   Arrivee+2

printIT2 lda   $ffff
         and   #$ff
         bne   printIT3
         rts

printIT3 pha
         inc   printIT2+1

         ldy   #0
]lp      lda   tblFNT8,y
         and   #$00ff
         beq   printIT4
         cmp   1,s
         beq   printIT5
         iny
         bra   ]lp
printIT4 ldy   #0

printIT5 pla
         tya
         asl
         tay
         lda   adrFNT8,y
         sta   Debut
         lda   #^adrSP
         sta   Debut+2

         ldy   #0         ; Partie gauche du caractere
         lda   [Debut],y
         sta   [Arrivee],y

         ldy   #2
         lda   [Debut],y
         ldy   #160
         sta   [Arrivee],y

         ldy   #4
         lda   [Debut],y
         ldy   #320
         sta   [Arrivee],y

         ldy   #6
         lda   [Debut],y
         ldy   #480
         sta   [Arrivee],y

         ldy   #8
         lda   [Debut],y
         ldy   #640
         sta   [Arrivee],y

         ldy   #10        ; Partie droite du sprite
         lda   [Debut],y
         ldy   #2
         sta   [Arrivee],y

         ldy   #12
         lda   [Debut],y
         ldy   #162
         sta   [Arrivee],y

         ldy   #14
         lda   [Debut],y
         ldy   #322
         sta   [Arrivee],y

         ldy   #16
         lda   [Debut],y
         ldy   #482
         sta   [Arrivee],y

         ldy   #18
         lda   [Debut],y
         ldy   #642
         sta   [Arrivee],y

         lda   Arrivee
         clc
         adc   #3
         sta   Arrivee

         brl   printIT2

*--- Adresses caracteres

tblFNT8  asc   ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'
         asc   '0123456789'
         asc   '_:',27,'?'
         dfb   00

adrFNT8  da    adrSP,adrA,adrB,adrC,adrD,adrE,adrF
         da    adrG,adrH,adrI,adrJ,adrK,adrL,adrM
         da    adrN,adrO,adrP,adrQ,adrR,adrS,adrT
         da    adrU,adrV,adrW,adrX,adrY,adrZ
         da    adr0,adr1,adr2,adr3,adr4
         da    adr5,adr6,adr7,adr8,adr9
         da    adrTR,adrDP,adrAP,adrQM

adrSP    hex   0000000000000000000000000000000000000000 ; SPACE
adrA     hex   00FF0F000FFF0F000F00F0000F00FF000F000F00 ; A
adrB     hex   0FFF0F000FFF0F000FFFF0000F00F0000F00F000 ; B
adrC     hex   00FF0F000F000F0000FFF0000F0000000F00F000 ; C
adrD     hex   0FFF0F000F000F000FFFF0000F000F000F00F000 ; D
adrE     hex   0FFF0F000FFF0F000FFFFF00000000000000FF00 ; E
adrF     hex   0FFF0F000FFF0F000F00FF000000000000000000 ; F
adrG     hex   00FF0F000F000F0000FFF0000000FF000F00F000 ; G
adrH     hex   0F000F000FFF0F000F000F000F00FF000F000F00 ; H
adrI     hex   0FFF000F000F000F0FFFFF00000000000000FF00 ; I
adrJ     hex   000F000000000F0000FFFF00F000F000F0000000 ; J
adrK     hex   0F000F000FFF0F000F000F00F0000000F0000F00 ; K
adrL     hex   0F000F000F000F000FFF0000000000000000FF00 ; L
adrM     hex   0F000FF00F0F0F000F000F00FF000F000F000F00 ; M
adrN     hex   0F000FF00F0F0F000F000F000F000F00FF000F00 ; N
adrO     hex   00FF0F000F000F0000FFF0000F000F000F00F000 ; O
adrP     hex   0FFF0F000FFF0F000F00F0000F00F00000000000 ; P
adrQ     hex   00FF0F000F000F0000FFF0000F000F00F0000F00 ; Q
adrR     hex   0FFF0F000FFF0F000F00F0000F00F000F0000F00 ; R
adrS     hex   00FF0F0000FF00000FFFFF000000F0000F00F000 ; S
adrT     hex   0FFF000F000F000F000FFF000000000000000000 ; T
adrU     hex   0F000F000F000F0000FF0F000F000F000F00F000 ; U
adrV     hex   0F000F0000F000F0000F0F000F00F000F0000000 ; V
adrW     hex   0F000F000F0F0FF00F000F000F000F00FF000F00 ; W
adrX     hex   0F0000F0000F00F00F000F00F0000000F0000F00 ; X
adrY     hex   0F000F0000F0000F000F0F000F00F00000000000 ; Y
adrZ     hex   0FFF0000000F00F00FFFFF00F00000000000FF00 ; Z
adr0     hex   00FF0F000F000F0000FFF0000F000F000F00F000 ; 0
adr1     hex   000F00FF000F000F0FFF0000000000000000FF00 ; 1
adr2     hex   0FFF000000FF0F000FFFF0000F00F0000000FF00 ; 2
adr3     hex   0FFF0000000F00000FFFF0000F00F0000F00F000 ; 3
adr4     hex   0F000F000F000FFF00000000F000F000FF00F000 ; 4
adr5     hex   0FFF0F000FFF00000FFFFF000000F0000F00F000 ; 5
adr6     hex   00FF0F000FFF0F0000FFFF000000F0000F00F000 ; 6
adr7     hex   0FFF0000000F00F000F0FF00F000000000000000 ; 7
adr8     hex   00FF0F0000FF0F0000FFF0000F00F0000F00F000 ; 8
adr9     hex   00FF0F0000FF00000FFFF0000F00FF000F00F000 ; 9
adrTR    hex   00000000000000000FFF0000000000000000FFF0 ; _
adrDP    hex   0000000F0000000F00000000F0000000F0000000 ; :
adrAP    hex   000F000F000000000000F000F000000000000000 ; '
adrQM    hex   000F00F0000000000000F0000F000F00F000F000 ; ?

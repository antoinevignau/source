
             LST   OFF

CONVERTINIT  NOP

             LDA   $0106             ; DATA2 : IMAGE COMPR + ZONE DECOMPRESSION
             AND   #$FF00
             STA   PICT02+1          ; LDX
             ORA   #$0080
             STA   PICT0+2
             STA   UNPACK13+2
             STA   UNPACK21+2
             STA   UNPACK35+2
             STA   UNPACK36+2
             STA   UNPACK42+2
             STA   UNPACK43+2
             AND   #$FF00
             ORA   #$00FE
             STA   IN3+2
             STA   IN5+2
             STA   IN7+2
****

             LDA   $0104             ; DATA1 : IMAGES COMPRESSEES
             AND   #$FF00
             STA   PICT01+1          ; LDX
****

             LDA   $0102             ; TEXTE : DOCUMENTATION
             AND   #$FF00
             STA   ECRDOCU2+2
             STA   AFTDEB4+2
             STA   AFTAM+2
             STA   AFTART0+2
****

             LDA   $0112             ; TRAVAIL : PRECALCUL
             AND   #$FF00
             STA   PRECALCUL0+2      ; PRECALCUL
             STA   PUTDIFF2+2
             STA   PUTDIFF3+2
             STA   PUTDIFF4+2
             STA   LINEBRNEW3+2
****

             LDA   $0108             ; SPRITE1 & SPRTE2
             AND   #$FF00
             STA   AFFSPR4+2
             STA   CLNAFF3+2
             STA   EASTER3+2
****

             LDA   $010C             ; IMAGE 16 GREY + 16 COUL
             AND   #$FF00
             STA   SELAFFI70+2
             STA   SELAFFIBLCK3+2
             STA   SELAFFIBLCK6+2
             STA   SELAFFA1+2
             STA   CONVIR1+2
             STA   AFFGCHPT1+2
             STA   CONVGREY4+2
             STA   CONVUR5+2
             STA   SCBCHOIX2+2
             ORA   #$007E
             STA   SELAFFI71+2
             STA   CONVUR9+2
             AND   #$FF00
             ORA   #$0080
             STA   CONVORF13+2
             STA   AFFOCHPT1+2
             AND   #$FF00
             ORA   #$00FD
             STA   CONVORF14+2
             STA   AFFOCHPA1+2
             AND   #$FF00
             ORA   #$00FE
             STA   CONVORF16+2
             AND   #$FF00
             ORA   #$007D
             STA   AFFGCHPA1+2       ;
             STA   CONVUR8+2
****
             LDA   $010E             ; IMAGE 256 + 3200
             AND   #$FF00
             STA   AFFUCHPT1+2
             STA   CONVRED4+2
             STA   CONVGREY5+2
             STA   CONVZONEFIN13+2
             STA   CONVZONEFIN17+2
             STA   CONVZONEFIN16+2
             STA   SCBCHOIX00+2
             STA   SCBCHOIX11+2
             ORA   #$007D
             STA   CONVERFIN2+2
             STA   CONVERAUTOFIN2+2
             STA   AFFUCHPA1+2
             AND   #$FF00
             ORA   #$0080
             STA   CONVLINEFIN13+2
             STA   CONVLINEFIN17+2
             STA   AFFICH4+2

****
             LDA   $0110             ; IMAGE 320*200 8 BIT
             AND   #$FF00
             STA   SELAFFI703+2
             STA   SELAFFI77+2
             STA   TRUE7+2
             STA   CONVLINEFIN10+2
             STA   CONVLINEFIN11+2
             STA   CONVORF10+2
             STA   CONVORF11+2
             STA   CONVIRCAPTURE1+2
             STA   LINERMP03+2
             STA   LINESUB1+2
             STA   LINESUB2+2
             STA   CONVUR4+2
             STA   CONVZONEFIN10+2
             STA   CONVZONEFIN11+2
             STA   ZONERMP03+2
             STA   MEMECOULEUR12+2
             STA   MEMECOULEUR21+2
             ORA   #$0001
             STA   MEMECOULEUR11+2
             STA   MEMECOULEUR22+2
             AND   #$FF00
             ORA   #$00FB            ; CODE SOUS L'IMAGE
             STA   ECR131101+2
****

             LDA   $010A             ; DATA 3 : FENETRE ALERTE
             AND   #$FF00
             ORA   #$0080
             STA   WORKING1+2
             STA   ALERT1+2
             STA   PLEASE1+2

             LDA   $010A             ; IMAGE PRINTSHOP
             AND   #$FF00
             ORA   #$003A
             STA   CONVIRCONV2+2
             STA   CONVIRCONV4+2
             STA   CONVIRCAPTURE2+2
             STA   AFFPCHPT2+2
             AND   #$FF00
             ORA   #$004E
             STA   CONVIRFORMAT5+2
             STA   CONVIRFORMAT1+2
             STA   CONVIRFORMAT6+2
             AND   #$FF00
             ORA   #$0050
             STA   CONVIRFORMAT2+2
             STA   CONVIRFORMAT7+2
             ORA   #$0002
             STA   CONVIRFORMAT3+2
             STA   CONVIRFORMAT8+2

             LDA   $010A             ; BUFFER AFFICHAGE ABOUT
             AND   #$FF00
             ORA   #$00EA
             STA   ECRABOU1+2
             STA   ABOUTR2+2
             STA   ABOUTR4+2
             AND   #$FF00
             ORA   #$0001
             STA   ABOUTRC1+1        ; MVN

             LDA   $010A             ; PALETTES 3200
             AND   #$FF00
             ORA   #$00C3
             STA   AFFICH2+2
             STA   CONVLINEFIN16+2
             STA   CONVRED2+2
             STA   CONVGREY3+2

             LDA   $010A             ; CODE ANNEXE
             AND   #$FF00
             ORA   #$0001
             STA   ECR131110+2
             STA   ECR131111+2
             STA   ECR131112+2
             STA   ECR131113+2
             STA   ECR131114+2
             STA   ECR131120+2
             STA   STAT2+2
             STA   STAT3+2
             STA   STAT4+2
             STA   STAT5+2
             STA   STAT6+2
             STA   STAT7+2
             STA   ECR090900+2
             STA   ECR090901+2
             STA   ECR090902+2
             STA   ECR090903+2
             STA   ECR090904+2
             STA   INIT1+2

             LDA   $0100             ; LES MVN
             AND   #$FF00
             STA   INIT2+1
             LDA   $0110
             AND   #$FF00
             XBA
INIT2        ORA   #$A0A0
             STA   ECR131100+1

****
             LDA   #$0000            ; COPIE DU CODE SOUS L'IMAGE + INIT MEM
             LDY   $0100             ; BANC CODE
INIT1        JSL   $040100
             PHK
             PLB
****
             LDA   $0130             ; GS ACCELERE ?
             BNE   INIT4

             LDA   #$5000            ; GS LENT : SOURIS RAPIDE
             STA   BTEMPO
             RTS
INIT4        LDA   #$FFF0            ; GS RAPIDE : SOURIS LENT
             STA   BTEMPO
             RTS

*********************************************


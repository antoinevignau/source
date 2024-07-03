;...............................................................
;
;       Bput.s      : affichage d'une shape a partir d'un buffer plat
;...............................................................
;
;        passage en pile
;                                     octets
;        source   :
;                 ptr bitmap            4
;                 ptr rect              4
;
;        destination :
;                 ptr bitmap            4
;                 ptr rect              4
;
;        mode     :                     2
;                 0    copie/xor
;                 1    trans
;                 2    swap
;                 3    ..
;                 4    ..
;                 5    ..
;                 6    rot horizontale
;                 7    rot verticale
;
;                 8    |
;                 9    |_   couleur transparente
;                 A    |
;                 B    |
;                 C    ..
;                 D    ..
;                 E    ..
;                 F    ..
;


;--------------------------------------
;        PROGRAMME GENERAL
;--------------------------------------

put            START
               Using putData

;
;        data in stack
;
Bmode          gequ 6

Bptr_rectD     gequ Bmode+2
Bptr_bitmapD   gequ Bptr_rectD+4

Bptr_rectS     gequ Bptr_bitmapD+4
Bptr_bitmapS   gequ Bptr_rectS+4

;--------------------------------------
;-------- init routine ----------------
;--------------------------------------
               phd                      |sauve direct page

               tsc                      |direct page = stack
               tcd
;--------------------------------------
;-------- traitement ------------------
;--------------------------------------
               jsr trt_shape            |on affiche
;--------------------------------------
;-------- sortons proprement ----------
;--------------------------------------
               ply                      |par ici le data bank

               lda 2,s                  |adr de retour propre
               sta 20,s
               lda 0,s
               sta 18,s

               tsc                      |ptr de pile sur adr de retour
               clc
               adc #18
               tcs

               tya                      |restaure data bank
               tcd

               rtl

               END
;...............................................................
;
;        trt_shape : affiche de la shape
;
;...............................................................
trt_shape      START
               Using putData

               jsr cal_var              |calcul des variables de calcul

               jsr cal_octetot          |octet par lignes max

               jsr affiche              |put1 du clip

               rts

               END
;...............................................................
;
;        cal_var : calcul des lignes octets pointeurs ...
;
;...............................................................
cal_var        START
               Using putData
;--------------------------------------
;        sur la source
;--------------------------------------
               ldy #recty1              |nombre de ligne de la shape
               lda [Bptr_rectS],y
               dec a                    |rect
               sec
               ldy #recty0
               sbc [Bptr_rectS],y
               sta nb_ligneS
               inc nb_ligneS

               ldy #rectx0              |octet du 1er point
               lda [Bptr_rectS],y
               lsr a
               sta doctetS

               ldy #rectx1              |octet du dernier point
               lda [Bptr_rectS],y
               dec a                    |!!! rect
               lsr a
               sta foctetS

               lda foctetS              |nombre d'octet par ligne
               sec
               sbc DoctetS
               inc a
               sta nb_octetS
               sta tot_octetS
;--------------------------------------
cal_varS       lda Bmode                 |une rotation verticale ?
               and #mode_rv
               beq norot_v

rot_v          PushLong #0              |et oui depart en bas de la source
               ldy #recty1
               lda [Bptr_rectS],y
               dec a                    |rect
               bra scal_varS

norot_v        PushLong #0              |position du ptr source sur
               lda [Bptr_rectS]          |la premiere ligne de la shape
scal_varS      pha
               PushWord nb_octetS       |* par nombre d'octets / lignes
               _Multiply
               pla                      |ret pf
               plx                      |ret pF
               clc
               adc Bptr_bitmapS
               sta Bptr_bitmapS
               lda Bptr_bitmapS+2
               adc #0
               sta Bptr_bitmapS+2
;--------------------------------------
               stz top_debutS           |objet cadre sur un octet gauche
               ldy #rectx0
               lda [Bptr_rectS],y
               and #$0001
               beq s0
               inc top_debutS           |et non

s0             stz top_finS             |objet cadre sur un octet droit
               ldy #rectx1
               lda [Bptr_rectS],y
               dec a                    |!!! rect
               and #$0001
               bne cal_varD
               inc top_finS             |et non
;--------------------------------------
;        sur la destination
;--------------------------------------
cal_varD       PushLong #0              |position du ptr dest sur
               lda [Bptr_rectD]         |la premiere ligne de la shape
               sta ligne_courante       |pour tester si ptinrect
               cmp #200
               bcc okline
               lda #0
okline         pha
               PushWord #160
               _Multiply
               pla                      |ret pf
               plx                      |ret pF
               clc
               adc Bptr_bitmapD
               sta Bptr_bitmapD
               lda Bptr_bitmapD+2
               adc #0
               sta Bptr_bitmapD+2

               ldy #recty1              |nombre de ligne de la shape
               lda [Bptr_rectD],y
               dec a                    |rect
               sec
               ldy #recty0
               sbc [Bptr_rectD],y
               sta nb_ligneD
               inc nb_ligneD

               ldy #rectx0              |octet du 1er point
               lda [Bptr_rectD],y
               lsr a
               sta doctetD

               ldy #rectx1              |octet du dernier point
               lda [Bptr_rectD],y
               dec a                    |!!! rect
               lsr a
               sta foctetD

               lda foctetD              |nombre d'octet par ligne
               sec
               sbc DoctetD
               inc a
               sta nb_octetD
               sta tot_octetD

               stz top_debutD           |objet cadre sur un octet gauche
               ldy #rectx0
               lda [Bptr_rectD],y
               and #$0001
               beq s1
               inc top_debutD           |et non

s1             stz top_finD             |objet cadre sur un octet droit
               ldy #rectx1
               lda [Bptr_rectD],y
               dec a                    |!! rect
               and #$0001
               bne fin
               inc top_finD             |et non

fin            rts

               END
;...............................................................
;
;        cal_octetot : max d'octets par ligne si decalage
;
;...............................................................
cal_octetot    START
               Using putData

               lda top_debutS           |si decalage alors +- 1
               cmp top_debutD
               beq rien

               cmp #1
               bne ega_0

ega_1          lda top_finS
               beq rien
               dec tot_octetS
               rts

ega_0          lda top_finS
               bne rien
               inc tot_octetS

rien           rts

               END
;...............................................................
;
;        affiche : put du clip donne
;
;...............................................................
affiche        START
               Using putData

               stz ligne

raffiche       lda ligne_courante
               cmp #200
               bcc saffiche

               jsr plus_ptr1            |incremente uniquement la source
               bra s0affiche

saffiche       jsr charge_ligne         |in the buffer

               jsr cadre_ligne          |cadrage du buffer

               jsr put_ligne            |put de la ligne

               jsr plus_ptr             |bouge les pointeurs

s0affiche      inc ligne_courante

               inc ligne                |encore une ligne

               lda ligne                |on arrete ?
               cmp nb_ligneS
               bcc raffiche

               rts

               END
;...............................................................
;
;        charge_ligne : ligne source in buffer
;
;...............................................................
charge_ligne   START
               Using putData

               ldx nb_octetS            |octets par ligne
               ldy foctetS              |in bitmap

               stz tampon_ligne-1,x     |dernier octet a zero

               sep #$20
               longa off

rcharge_ligne  lda [Bptr_bitmapS],y      |de bitmap
               sta tampon_ligne-1,x     |vers buffer

               dey                      |encore
               dex
               bne rcharge_ligne

               rep #$20
               longa on

               jsr trt_rotH             |peut etre une rotation horizontale

               rts

               END
;...............................................................
;
;        cadre_ligne : a gauche ou a droite
;
;...............................................................
cadre_ligne    START
               Using putData

               lda top_debutS
               cmp top_debutD
               beq no_cadre

               cmp #0
               beq cad_droite

               cmp #1
               beq cad_gauche

no_cadre       rts

cad_droite     jsr rot_droite

               rts

cad_gauche     jsr rot_gauche

               rts

               END
;...............................................................
;
;        rot_droite : d'un nibble svp
;
;...............................................................
rot_droite     START
               Using putData

               lda #4                   |4 fois
               sta nb_rot

               sep #$20
               longa off

r0rot_dr       ldx #0
               ldy nb_octetS

               clc
rrot_dr        ror tampon_ligne,x       |decale right

               inx                      |tous les octets buffer
               dey
               bpl rrot_dr

               dec nb_rot

               bne r0rot_dr

               rep #$20
               longa on

               rts

               END
;...............................................................
;
;        rot_gauche : d'un nibble svp
;
;...............................................................
rot_gauche     START
               Using putData

               lda #4                   |4 fois
               sta nb_rot

               sep #$20
               longa off

r0rot_ga       ldx nb_octetS
               clc

rrot_ga        rol tampon_ligne-1,x     |decale left

               dex                      |tous les octets buffer
               bne rrot_ga

               dec nb_rot

               bne r0rot_ga

               rep #$20
               longa on

               rts

               END
;...............................................................
;
;        trt_rotH : si rotation horizontal
;
;...............................................................
trt_rotH       START
               Using putData

               lda Bmode
               and #mode_rh
               bne oui

non            rts                      |ouf pas de rotation

oui            sep #$20
               longa off

               ldx #0
               ldy nb_octetS
               dey

rtourne        lda tampon_ligne,y
               jsr tourne_octet
               pha
               lda tampon_ligne,x
               jsr tourne_octet
               sta tampon_ligne,y
               pla
               sta tampon_ligne,x
               inx
               dey

               txa
               sta op1

               cpy op1
               bcs rtourne

               rep #$20
               longa on

cadre_rot      lda top_debutS
               cmp top_finS
               beq rien

               cmp #0
               beq cad_rot_ga
               cmp #1
               beq cad_rot_dr

rien           rts

cad_rot_dr     jsr rot_droite

               rts

cad_rot_ga     jsr rot_gauche

               rts

               END
;...............................................................
;
;        tourne_octet : n0n1 -> n1n0
;
;...............................................................
tourne_octet   START
               Using putData

               stz op2                  |init a zero

               asl a                    |et on tourne
               rol op2
               asl a
               rol op2
               asl a
               rol op2
               asl a
               rol op2
               
               ora op2                  |et le resultat final

               rts

               END
;...............................................................
;
;        put_ligne : put d'une ligne du buffer
;
;...............................................................
put_ligne      START
               Using putData

               ldy FoctetD
               ldx tot_octetS

               sep #$20
               longa off

rput_ligne     cpy #160
               bcs sput_ligne

               lda tampon_ligne-1,x

               jsr transparence                |couleur transparente

               jsr manipule                    |transparent borne G et D

               sta [Bptr_bitmapD],y

sput_ligne     dey
               dex
               bne rput_ligne

               rep #$20
               longa on

               rts

               END
;...............................................................
;
;        plus_ptr : passage a la ligne suivante
;
;...............................................................
plus_ptr       START
               Using putData

               lda Bptr_bitmapD
               clc
               adc #160
               sta Bptr_bitmapD
               lda Bptr_bitmapD+2
               adc #0
               sta Bptr_bitmapD+2

plus_ptr1      ENTRY

               lda Bmode                 |rot verticale
               and #mode_rv
               beq no_rotV

rotV           lda Bptr_bitmapS          |et oui donc dec l'adresse
               sec
               sbc nb_octetS
               sta Bptr_bitmapS
               lda Bptr_bitmapS+2
               sbc #0
               sta Bptr_bitmapS+2
               bra fplus_ptr

no_rotV        lda Bptr_bitmapS
               clc
               adc nb_octetS
               sta Bptr_bitmapS
               lda Bptr_bitmapS+2
               adc #0
               sta Bptr_bitmapS+2

fplus_ptr      rts

               END
;...............................................................
;
;        transparence :
;
;...............................................................
transparence   START
               Using putData

               longa off                |et oui

               sta op0                  |octet shape
               lda [Bptr_bitmapD],y
               sta op1                  |octet fond

               lda Bmode                 |transparence requise
               and #mode_trans
               bne oui                  |et m....

non            lda op0                  |chic
               rts

oui            stz op4                  |le resultat

               lda Bmode+1               |pour une comparaison pF
               jsr tourne_octet
               sta op3

               lda op0                  |la shape
               and #$0F                 |point droit
               cmp Bmode+1               |= transp
               bne s0

               lda op1                  |= donc du fond
               and #$0F
               sta op4
               bra s1

s0             sta op4                  |!= donc de la shape

s1             lda op0                  |la shape
               and #$F0                 |point gauche
               cmp op3                  |= trans
               bne s2

               lda op1                  |du fond
               and #$F0
               ora op4
               rts

s2             ora op4
               rts

               longa on

               END
;...............................................................
;
;        manipule : gere transparent borne
;
;...............................................................
manipule       START
               Using putData

               longa off

               sta op0
               lda [Bptr_bitmapD],y
               sta op1

               cpx tot_octetS
               beq droit_1
               cpx #1
               beq gauche_1

no             lda op0

               rts

droit_1        lda top_finD
               beq no

               lda op1
               and #$0F
               sta op1
               lda op0
               and #$f0
               ora op1
               rts

gauche_1       lda top_debutD
               beq no

               lda op1
               and #$F0
               sta op1
               lda op0
               and #$0f
               ora op1
               rts

               longa on

               END
;...............................................................
;
;        Shape Data
;
;...............................................................
putData        DATA

recty0         equ 0                   |struct rect
rectx0         equ recty0+2
recty1         equ rectx0+2
rectx1         equ recty1+2

mode_copie     equ $0001                |mode d'affichage
mode_trans     equ $0002
mode_swap      equ $0003
mode_rh        equ $0040
mode_rv        equ $0080

nb_ligneS      ds 2                     |nombre de ligne shape source
nb_octetS      ds 2                     |..........octet.............
tot_octetS     ds 2                     |............................
doctetS        ds 2                     |octet du 1er point
foctetS        ds 2                     |octet du dernier point
top_debutS     ds 2                     |1 er point cadre
top_finS       ds 2                     |dernier point cadre

nb_ligneD      ds 2                     |nombre de ligne shape dest
nb_octetD      ds 2                     |..........octet...........
tot_octetD     ds 2                     |..........................
doctetD        ds 2                     |octet du 1er point
foctetD        ds 2                     |octet du dernier point
top_debutD     ds 2                     |1 er point cadre
top_finD       ds 2                     |dernier point cadre

op0            ds 2                     |zone de travail
op1            ds 2                     |...............
op2            ds 2                     |...............
op3            ds 2                     |...............
op4            ds 2                     |...............

ligne          ds 2                     |ligne sur shape
nb_rot         ds 2                     |nombre de rotation

ligne_courante ds 2                     |ligne affichage

tampon_ligne   ds 160                   |buffer d'une ligne

               END

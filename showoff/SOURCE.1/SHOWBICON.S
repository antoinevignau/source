;...............................................................
;
; FILE : SHOWBICON.S                    - ICONS -
;        -----------
;...............................................................
;...............................................................
;
;        Redraw_Icon : Reaffichage des Icones
;
;...............................................................
Redraw_Icon    START
               Using GlobalData

               lda Frame_Icon
               bne ok
               rts
;--
ok             lda #1                   |la 1er
               sta ZFrame_Icon

               jsr D_Hdl_BIcon          |le Buffer

               lda Ptr_BIcon
               sta Ptr_PZero
               lda Ptr_BIcon+2
               sta Ptr_PZero+2
;--
Loop           jsr Put_Icon             |Affiche l'icone de Ptr_PZero
;--
               lda Ptr_PZero            |deplace le Pointeur
               clc
               adc Lg_IconRecord
               sta Ptr_PZero
               lda Ptr_PZero+2
               adc #0
               sta Ptr_Pzero+2
;--
               inc ZFrame_Icon

               lda ZFrame_Icon
               cmp Frame_Icon
               bcc Loop
               beq Loop
;--
               jsr U_Hdl_BIcon          |Libere le Buffer

               rts
;--------------------------------------
;        Put_Icon : Affiche l'icone
;--------------------------------------
Put_Icon       ENTRY

               lda [Ptr_PZero]
               sta Rect_IconeY0
               clc
               adc #Haut_Icone
               sta Rect_IconeY1

               ldy #2
               lda [Ptr_Pzero],y
               sta Rect_IconeX0
               clc
               adc #Larg_Icone
               sta Rect_IconeX1

               lda Ptr_Pzero            |Pointeur +6 (bitmap)
               clc
               adc #6
               tax
               lda Ptr_Pzero+2
               adc #0
               pha
               txa
               pha
               PushLong #RectIconeStd   |Rectangle d'une Icone
               PushLong FondPtr         |bitmap d'arrive
               PushLong #Rect_Icone
               ldy #4
               lda [Ptr_Pzero],y
               pha                      |Mode
               jsl Put

               rts

ZFrame_Icon    ds 2

               END
;...............................................................
;
;        Test_In_Icon : Test si Selection d'une Icone
;
;...............................................................
Test_In_Icon   START
               Using globalData

               lda Frame_Icon           |DES ICONS ?
               bne oui
               clc
               rts

oui            lda Frame_Icon           |LA Neme Icon

LOOP           pha                      |Met la Shape dans RECORD
;--
               jsr Rest_Icon1           |va chercher ptr_BIcon garni data
;--
               jsr Test_In_Icon1
               bcs Inside
;--
               pla
               dec a
               bne LOOP
               clc                      |not INSIDE ICON
               rts
;--
Inside         pla                      |Icon Selectionnee
               sec
               rts
;--------------------------------------
;        Test_In_Icon1
;--------------------------------------
Test_In_Icon1  ENTRY

               jsr Cal_RectIcon         |rect de la courante
;--
               PushWord #0              |Inside
               PushLong #EventWhere
               PushLong #Rect_Icone
               _PtInRect
               pla
               bne InSide1
               clc
               rts
;--
Inside1        sec
               rts

               END
;...............................................................
;
;        Cal_RectIcon : cadre de selection d'une icone
;
;...............................................................
Cal_RectIcon   START
               Using GlobalData

               lda Icon_Y               |COMPUTE RECT
               sta Rect_IconeY0
               clc
               adc #Haut_Icone
               sta Rect_IconeY1

               lda Icon_X
               sta Rect_IconeX0
               clc
               adc #Larg_Icone
               sta Rect_IconeX1

               rts

               END
;...............................................................
;
;        Rest_Icon : va chercher l'icone du buffer
;
;...............................................................
Rest_Icon      START
               Using GlobalData

               pha                      |numero dans Acc
               jsr D_Hdl_BIcon          |coince
               pla

               PushLong #0
               pha                      |n% Icone
               PushWord lg_IconRecord   |lg d'un Record
               _Multiply
               pla
               plx
               dec a
               dec a
               tay

               ldx lg_IconRecord
               dex
               dex
;--
LOOP           lda [Ptr_BIcon],y
               sta IconRecord,x
               dey
               dey
               dex
               dex
               bpl LOOP
;--
               jsr U_Hdl_BIcon          |libere

               rts
;-------
Rest_Icon1     ENTRY

               pha                      |numero dans Acc
               jsr D_Hdl_BIcon          |coince
               pla

               PushLong #0
               dec a
               pha                      |n% Icone
               PushWord lg_IconRecord   |lg d'un Record
               _Multiply
               pla
               plx
               tay

               ldx #0
;--
LOOP1          lda [Ptr_BIcon],y
               sta IconRecord,x
               iny
               iny
               inx
               inx
               cpx #6
               bcc LOOP1
;--
               jsr U_Hdl_BIcon          |libere

               rts

               END
;...............................................................
;
;        Icon_Last : l' ICON  Select passe en dernier
;
;...............................................................
Icon_Last      START
               Using GlobalData
;--
               sta tempmove
               lda Frame_Icon
               cmp tempmove             |pas la derniere
               bne oui
               brl fini
;--
oui            lda tempmove
               jsr Rest_Icon            |sauve l'Icon

               lda tempmove
               dec a
               PushLong #0
               pha
               PushWord lg_IconRecord
               _Multiply
               ply
               plx
               sty offsetmove

               lda tempmove             |calcul du move
               PushLong #0
               pha
               PushWord lg_IconRecord
               _Multiply
               pla
               plx
               sta source_adr

               lda Frame_Icon
               sec
               sbc tempmove
               PushLong #0
               pha
               PushWord lg_IconRecord
               _Multiply
               pla
               plx
               sta nbre_byte

               jsr D_Hdl_BIcon          |Deref

loop           ldy source_adr           |move de droite a gauche
               ldx offsetmove
rloop          lda [Ptr_BIcon],y
               phy
               txy
               sta [Ptr_BIcon],y
               ply
               inx
               inx
               iny
               iny
               dec nbre_byte
               dec nbre_byte
               bne rloop

               jsr U_Hdl_BIcon          |Unlock

               lda Frame_ICon
               jsr Copie_Icon

fini           lda Frame_Icon           |la select = la derniere
               sta Icon_Select

               rts

tempmove       ds 2
offsetmove     ds 2
source_adr     ds 2
nbre_byte      ds 2

               END
;...............................................................
;
;        Copie_Icon  : Copie Icon_Record -> Buffer Icon
;                      ACC=N% de Icon
;...............................................................
Copie_Icon     START
               Using GlobalData

               pha
               jsr D_Hdl_BIcon          |Deref
               pla

               PushLong #0
               Pha                      |n% de Shape
               PushWord lg_IconRecord   |taille d'1 Shape
               _Multiply
               pla
               plx
               dec a
               dec a
               tay

               ldx lg_IconRecord
               dex
               dex

LOOP           lda IconRecord,x
               sta [Ptr_BIcon],y
               dey
               dey
               dex
               dex
               bpl LOOP
;--
               jsr U_Hdl_BIcon          |UnLock

               rts
;--------
Copie_Icon1    ENTRY

               pha
               jsr D_Hdl_BIcon          |Deref
               pla

               PushLong #0
               dec a
               Pha                      |n% de Shape
               PushWord lg_IconRecord   |taille d'1 Shape
               _Multiply
               pla
               plx
               tay

               ldx #0

LOOP1          lda IconRecord,x
               sta [Ptr_BIcon],y
               iny
               iny
               inx
               inx
               cpx #6
               bcc LOOP1
;--
               jsr U_Hdl_BIcon          |UnLock

               rts

               END
;...............................................................
;
;        draw_RectIcon : affiche la selection Icon eor
;
;...............................................................
draw_RectIcon  START
               Using GlobalData

               PushWord #0              |sauve mode
               _GetPenMode

               PushWord #15
               _SetSolidPenPat

               PushWord #2              |eor
               _SetPenMode

               PushLong #Rect_Icone
               _FrameRect

               _SetPenMode

               rts

               END
;...............................................................
;
;        DoFlipVert : Flip Vertical sur Icon
;
;...............................................................
DoFlipVert     START
               Using GlobalData

               lda FlipOnOff
               bne ok
               rts
;--
ok             lda #$0005
               sta Ch_Group

               jsr Change_Groupe

               rts

               END
;...............................................................
;
;        DoFlipHori : Flip Horizontal sur Icon
;
;...............................................................
DoFlipHori     START
               Using GlobalData

               lda FlipOnOff
               bne ok
               rts
;--
ok             lda #$0004
               sta Ch_Group

               jsr Change_Groupe

               rts

               END
;---------------------------------------------------------------
;
; ReDraw_Border : Draw the Border
;
;---------------------------------------------------------------
ReDraw_Border  START
               Using GlobalData
;--
               lda Mode_ShowOff
               cmp #Mode_Label
               beq Ok0
               cmp #Mode_Template
               beq Ok0
;--
               lda Sequ_Template
               beq ok0
               lda Frame_Template
               beq ok0
               lda Sequ_TemplateB
               beq ok0
               rts
;--
ok0            lda Frame_Border
               bne ok
               rts
;--
ok             jsr D_Hdl_Border         |bloque
;--
               lda FondPtr
               sta Ptr_PZero
               lda FondPtr+2
               sta Ptr_PZero+2
;--------------------------------------
;        coin haut gauche
;--------------------------------------
               PushLong Ptr_Border      |buffer de bordure
               PushLong #rectBstd       |rectangle standard
               PushLong FondPtr         |bitmap destination
;--
               lda Mode_ShowOff
               cmp #Mode_Label
               bne RB_BHG0
               PushLong #RectBHGL
               bra RB_BHG
;--
RB_BHG0        PushLong #rectBHG        |rect Haut Gauche
RB_BHG         lda #$0E02               |mode normal
               pha
               jsl put
;--------------------------------------
;        coin haut droit
;--------------------------------------
               PushLong Ptr_Border
               PushLong #rectBstd
               PushLong FondPtr
;--
               lda Mode_ShowOff
               cmp #Mode_Label
               bne RB_BHD0
               PushLong #RectBHDL
               bra RB_BHD
;--
RB_BHD0        PushLong #rectBHD
RB_BHD         lda #$0E42
               pha
               jsl put
;--------------------------------------
;        coin bas gauche
;--------------------------------------
               PushLong Ptr_Border
               PushLong #rectBstd
               PushLong FondPtr
;--
               lda Mode_ShowOff
               cmp #Mode_Label
               bne RB_BBG0
               PushLong #RectBBGL
               bra RB_BBG
;--
RB_BBG0        PushLong #rectBBG
RB_BBG         lda #$0E82
               pha
               jsl put
;--------------------------------------
;        coin bas droit
;--------------------------------------
               PushLong Ptr_Border
               PushLong #rectBstd
               PushLong FondPtr
;--
               lda Mode_ShowOff
               cmp #Mode_Label
               bne RB_BBD0
               PushLong #RectBBDL
               bra RB_BBD
;--
RB_BBD0        PushLong #rectBBD
RB_BBD         lda #$0EC2
               pha
               jsl put
;--------------------------------------
               lda Mode_ShowOff
               cmp #Mode_Label
               beq Param_Label
;--
Param_Normal   ANOP
               lda #20
               sta Val_CptH
               lda #$8C
               sta Val_BorB
               lda #36
               sta Val_CptV
               lda #$1180
               sta Val_YLg
               lda #$120C
               sta Val_YLd
               lda #$7C60
               sta Val_Yp
               bra Suite
;--
Param_Label    ANOP
               lda #$138C               |31*160+44 |24*160+44
               sta Val_CptH
               lda #$13D5               |val_Cpth+(rectDroit/2)
               sta Val_BorB
               lda #24                  |ligne vert (recty1-recty0)/4
               sta Val_CptV
               lda #$24FA               |52*160+24 24=(48/2)
               sta Val_YLg
               lda #$2555               |val_ylg+(234/2)
               sta Val_YLd
               lda #$5E60               |(192-24-1)*160
               sta Val_Yp
;----- bord haut et bas -----------------
Suite          jsr cop_bufh

               lda Val_CptH
               sta cpt

rbh            lda cpt
               sta ybord
               clc
               adc Val_Yp
               sta ypic
               ldx #0

rbh0           lda bufoct,x

               pha
               pha
               ldy ybord
               lda [Ptr_Pzero],y
               pha
               jsr TRANSPARENT
               sta [Ptr_Pzero],y

               ldy ypic
               lda [Ptr_Pzero],y
               pha
               jsr TRANSPARENT
               sta [Ptr_Pzero],y

               lda ybord
               clc
               adc #160
               sta ybord

               lda ypic
               sec
               sbc #160
               sta ypic

               inx
               inx
               cpx #56
               bcc rbh0

               inc cpt
               inc cpt
               lda cpt
               cmp Val_Borb
               bcc rbh
;----- ligne gauche----------------------
               jsr cop_bufv

               lda Val_CptV
               sta cpt
               ldy val_Ylg
rlg            ldx #0
               lda #4
               sta cpt1
rlg0           lda #10
               sta cpt2

rlg1           lda bufoct,x
               pha
               lda [Ptr_Pzero],y
               pha
               jsr TRANSPARENT
               sta [Ptr_Pzero],y

               inx
               inx
               iny
               iny
               dec cpt2
               bne rlg1
               tya
               clc
               adc #140
               tay
               dec cpt1
               bne rlg0
               dec cpt
               bne rlg
;---- ligne vert droite------------------
               jsr cop_bufvd

               lda Val_Cptv
               sta cpt
               ldy Val_Yld
rld            ldx #0
               lda #4
               sta cpt1
rld0           lda #10
               sta cpt2

rld1           lda bufoct,x
               pha
               lda [Ptr_Pzero],y
               pha
               jsr TRANSPARENT
               sta [Ptr_Pzero],y

               inx
               inx
               iny
               iny
               dec cpt2
               bne rld1
               tya
               clc
               adc #140
               tay
               dec cpt1
               bne rld0
               dec cpt
               bne rld
;--
               jsr U_Hdl_Border

               rts
;----------------------------------------
cop_bufh       ldx #00                  |27 lignes
               ldy #18
rcop_bufh      lda [Ptr_Border],y
               sta bufoct,x
               tya
               clc
               adc #20
               tay
               inx
               inx
               cpx #56
               bcc rcop_bufh
               rts
;----------------------------------------
cop_bufv       ldx #00                  | 4 lignes
               ldy #$01E0               | ligne 24

rcop_bufv      stz cpt

rcop_bufv0     lda [Ptr_Border],y
               sta bufoct,x
               iny
               iny
               inx
               inx
               inc cpt
               lda cpt
               cmp #10
               bcc rcop_bufv0

               cpx #80
               bcc rcop_bufv
               rts
;----------------------------------------
cop_bufvd      ldx #00                  | 4 lignes
               ldy #$01F2               | ligne 24

rcop_bufvd     stz cpt

rcop_bufvd0    lda [Ptr_Border],y
               jsr ROT_WORD
               sta bufoct,x
               dey
               dey
               inx
               inx
               inc cpt
               lda cpt
               cmp #10
               bcc rcop_bufvd0

               tya
               clc
               adc #40
               tay

               cpx #80
               bcc rcop_bufvd
               rts
;---- data ------------------------------
ybord          ds 2
ypic           ds 2

bufoct         dc 40i2'0'               |40 mots

cpt            ds 2
cpt1           ds 2
cpt2           ds 2
;--
Val_CptH       ds 2
Val_BorB       ds 2
Val_CptV       ds 2
Val_YLg        ds 2
Val_YLd        ds 2
Val_Yp         ds 2

               END
;...............................................................
;
;        DoNoBorder : Supprime la Bordure Courante
;
;...............................................................
DoNoBorder     START
               Using GlobalData
               Using WindowData

               lda #1
               sta Top_Action

               lda #0                   |plus de bordure
               sta Frame_Border

               jsr Dealloc_Border       |Libere la place

               jsr Recal_Menu

               jsl Maj_FrameW

               rts

               END

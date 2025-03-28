;------------------------------------------------------------------
;
; FILE : SHOWBACKG.S                    - DoBackGround -
;        -----------
;                                       RELOGEABLE
;------------------------------------------------------------------
               List Off
               Gen Off
               Symbol Off
               Keep DoBackG
               65816 On

               MCopy ShowBackg.MAC

               longa on
               longi on
;...............................................................
;
;        DoBackgroundR : CHOIX D'UNE COULEUR DE FOND
;
;...............................................................
DoBackGroundR  START
               Using GlobalData

               brl DoBackGround

               END
;...............................................................
;
;        DoBackGround : code
;
;...............................................................
DoBackGround   START
               Using GlobalData
               Using WindowData

               phb
               phk
               plb

               PushLong #0              |une dialog box
               PushLong #BackgroundDialog
               _GetNewModalDialog
               pla                      |son pointeur
               sta >MDialogPtr
               pla
               sta >MDialogPtr+2
;--
               lda >EventWhen
               sec
               sbc #100
               sta Back2Click
;--
again          PushWord #0              | on click
               PushLong #0
               _ModalDialog
               pla
               beq again

               cmp #1
               beq OkItem
               cmp #2
               beq CancelItem
               cmp #3
               beq PaletteItem
               bra again
;--
OkItem         jsl Eff_BitMap           |Desalloue le buffer BitMap

               lda Couleur_Fond         |ok on change la couleur de fond
               sta >Frame_BackG

               lda #1
               sta >Top_Action

               PushLong >Ptr_FrameW     |Refresh sur toute la fenetre
               _SetPort

               PushLong #FullRect
               _invalRect
;--
CancelItem     bra Finish
;--
PaletteItem    jsr Choix_color
               bcs OkItem
               bra again

Finish         PushLong >MDialogPtr     |on ferme
               _CloseDialog
;--
               lda #DoBackGround
               sta <Ptr_PZero
               lda #^DoBackGround
               sta <Ptr_PZero+2
               plb

               rtl
;...............................................................
;
; Draw_Palette : Dessine le palette de couleur de background
;
;...............................................................
Draw_palette   ENTRY
;--
               phb                      |init bank ETC
               phd

               phk
               plb

               tsc
               clc
               adc #3
               tcd
;--
               lda #45                  |Dessine la 1ere Ligne
               sta Rcolorx0
               lda #23
               sta Rcolory0
               lda #0
               sta coul
               jsr des_rect

               lda #45                  |Dessine la 2eme Ligne
               sta Rcolorx0
               lda #33
               sta Rcolory0
               lda #8
               sta coul
               jsr des_rect
;--
Draw_PaletteT  ENTRY

               lda >Frame_BackG         |Rectangle Temoin
               and #$000F
               sta Couleur_Fond
               pha
               _SetSolidPenPat

               PushLong #RectColorT
               _PaintRect

               PushWord #0
               _SetSolidPenPat

               PushLong #RectColorT
               _FrameRect
;--
               pld                      |restaure Bank
               plb

               lda 0,s                  |Adresse de retour
               sta 6,s
               lda 2,s
               sta 8,s

               tsc                      |retour Pile
               clc
               adc #6
               tcs

               rtl
;---------------------------------------------------------------
;
; choix_color : choisir une couleur
;
;---------------------------------------------------------------
Choix_color    ENTRY

               PushLong >MdialogPtr
               _SetPort

               PushLong #EventWhere
               _GetMouse

               lda #45                  |Dans la 1ere rangee ?
               sta Rcolorx0
               lda #23
               sta Rcolory0
               lda #0
               sta coul
               jsr TinRect

               bcc s0_outside

               sta NCouleur_Fond         |ok trouve

               bra maj_col
;--
s0_outside     lda #45                  |Dans la 2eme rangee ?
               sta Rcolorx0
               lda #33
               sta Rcolory0
               lda #8
               sta coul
               jsr TinRect

               bcc outside

               clc
               adc #8
               sta NCouleur_Fond
;--
maj_col        lda NCouleur_Fond         |Maj du TEMOIN
               and #$0f
               pha
               _SetSolidPenPat

               PushLong #RectColorT
               _PaintRect

               PushWord #0
               _SetSolidPenPat

               PushLong #RectColorT
               _FrameRect

outside        ANOP
;--
               PushLong #0
               _TickCount
               pla
               plx
               sta Tick2Click
;--
               lda NCouleur_Fond
               cmp Couleur_Fond
               bne OutSide1
;--
               lda Tick2Click
               sec
               sbc Back2Click
               cmp #30
               bcs OutSide1
;--
               lda NCouleur_Fond
               sta Couleur_Fond
               sec
               rts
;--
OutSide1       lda NCouleur_Fond
               sta Couleur_Fond
               lda Tick2Click
               sta Back2Click
               clc
               rts
;--------------------------------------
;  Dessine Petit Rectangle de Couleur
;--------------------------------------
Des_Rect       ENTRY

               lda #7
               sta nb_rect

rDes_Rect      PushWord coul
               _SetSolidPenpat

               lda Rcolory0
               clc
               adc #11
               sta Rcolory1

               lda Rcolorx0
               clc
               adc #11
               sta Rcolorx1

               PushLong #Rcolor
               _PaintRect

               PushWord #0
               _SetSolidPenPat

               PushLong #Rcolor
               _FrameRect

               lda Rcolorx1
               dec a
               sta Rcolorx0

               inc coul

               dec nb_rect
               bpl rdes_rect

               rts
;--------------------------------------
;  Test Le Click Dans Les Couleurs (carry on / Acc = couleur)
;--------------------------------------
TinRect        ENTRY

               stz nb_rect

rtinrect       lda Rcolory0
               clc
               adc #11
               sta Rcolory1

               lda Rcolorx0
               clc
               adc #11
               sta Rcolorx1

               PushWord #0
               PushLong #EventWhere
               PushLong #Rcolor
               _PtInRect
               pla
               bne oui

non            lda Rcolorx1
               dec a
               sta Rcolorx0

               inc nb_rect

               lda nb_rect
               cmp #8
               bcc rtinrect

               clc
               rts

oui            lda nb_rect
               sec
               rts
;--------------------------------------
;        DATA POUR DIALOG BOX
;--------------------------------------
;--------------------------------------
;        BACKGROUND DIALOG
;--------------------------------------
BackgroundDialog anop
               dc i'65,50,135,270'
               dc i2'1'
               dc i4'0'
               dc i4'BackgD1'           |Text
               dc i4'BackgD2'           |UserItem
               dc i4'BackgD3'           |ok
               dc i4'BackgD4'           |Cancel
               dc i4'0'
;--
BackgD1        anop                     |BackGround color
               dc i'0'
               dc i'1,60,14,219'
               dc i'StatText+ItemDisable'
               dc i4'BackgTx1'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
BackgD2        anop                     |Palette de Couleur
               dc i'3'
               dc i'20,42,45,128'
               dc i'UserItem'
               dc i4'Draw_Palette'      |Dessin de la Palette
               dc i'0'
               dc i'0'
               dc i4'0'
;--
BackgD3        anop                     |ok
               dc i'1'
               dc i'50,30,65,80'
               dc i'ButtonItem'
               dc i4'Str_ok'
               dc i'0'
               dc i'1'
               dc i4'0'
;--
BackgD4        anop                     |Cancel
               dc i'2'
               dc i'50,140,65,190'
               dc i'ButtonItem'
               dc i4'Str_Cancel'
               dc i'0'
               dc i'0'
               dc i4'0'

BackgTx1       str 'Background color'
;--------------------------------------
Coul           ds 2                     |Variable de Travail

nb_rect        ds 2                     |Variable de boucle

Couleur_Fond   ds 2                     |Couleur Selectionne
NCouleur_Fond  ds 2

Rcolor         anop                     |Rectangle de travail
Rcolory0       ds 2
Rcolorx0       ds 2
Rcolory1       ds 2
Rcolorx1       ds 2

RectColorT     dc i'23,141,45,181'      |Rect Temoin de Couleur
;--------------------------------------
Back2Click     ds 4
Tick2Click     ds 4

               END

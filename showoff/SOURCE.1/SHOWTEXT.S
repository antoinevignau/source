;---------------------------------------------------------------
;
; FILE : SHOWTEXT.S                     - Ligne de TEXTE -
;        ----------
;---------------------------------------------------------------
;---------------------------------------------------------------
;
; Click_Line  : Saisie de Texte -> init valeur , flash , click xy
;
;---------------------------------------------------------------
Click_Line     START
               Using GlobalData
               Using WindowData
               Using FontData
;--
               PushLong Ptr_FrameW      |port FRAME
               _SetPort

               stz MaxRx                |pour un refresh PROPRE
               stz MaxRy
;--
               jsr Un_Select            |UnSelect the object SET

               jsr Menu_On_Off

               jsr Eff_Cursor           |Efface le Curseur >|<

               lda Top_Sauvegarde
               pha
               jsr Sauve_Buffer         |sauve la ligne Courante
               pla
               beq SClick_Line

               lda cou_ligne            |DEBUG +++++
               sta zligne

               lda #1                   |REFRESH que le texte
               sta only_text
               jsr cal_Rect2
               jsr Copy_RectL
               jsr Cop_Rgn1_Shape
               jsr aff_shapeS

SClick_Line    jsr test_rect            |maj si click dans un old buffer
               bcc new_texte

               jsr in_rect
               bcc new_texte
;--
old_texte      lda #1                   |Modif
               sta Top_Action

               jsr Copy_RectL           |pour le refresh
               jsr Cop_rgn0_shape

               jsr calcul_pos           |recalcul mousex mousey du curseur

               jsr first_plan           |phrase en avant plan

               jsr position

               jsr Select_Drag          |Select Text with Mouse

               lda #1
               sta top_font
               sta top_color

               rts
;--
new_texte      stz top_font
               stz top_color

               inc Frame_Line
               jsr Resize_Line
               bcc oui
;--
               dec Frame_Line                  |plus de place +++
               jsr Alert_CCP
;--
non            stz dutexte
               rts
;--
oui            dec Frame_Line
               jsr position
               jsr init_buffer
               jsr Del_Undo
;--
               lda #0                   |idem
               sta Rect2
               sta Rect2+2
               sta Rect2+4
               sta Rect2+6
               jsr Copy_RectL
               jsr Cop_rgn0_shape
               rts

               END
;---------------------------------------------------------------
;
; positionne le curseur en mouse xy et indique le texte
;
;---------------------------------------------------------------
position       START
               Using GlobalData

               lda mousex
               sta click_x
               lda mousey
               sta click_y

               PushWord mousex
               PushWord mousey
               _MoveTo

               lda #1
               sta dutexte

               rts

               END
;...............................................................
;
;        first_plan : phrase en 1er plan pour edition
;
;...............................................................
first_plan     START
               Using GlobalData

               lda line_x
               sec
               sbc line_rectx0
               sta SrcRectx0

               jsr eff_dg1              |efface la phrase

               PushWord line_x           |print la phrase
               PushWord line_y
               _MoveTo
               stz indice
               jsr aff_phrase

               lda cou_ligne
               jsr ligne_move

               lda Frame_line
               dec a
               sta zligne
               sta cou_ligne

               lda #$ffff
               sta Line_Select

               rts

               END
;---------------------------------------------------------------
;
; DoText  : ecrire du texte
;
;---------------------------------------------------------------
DoText         START
               Using GlobalData

               lda #fonct_texte
               sta fonction
               stz dutexte

               rts

               END
;---------------------------------------------------------------
;
; trt_flash : gere le cursor flash
;
;---------------------------------------------------------------
trt_flash      START
               Using globaldata

               lda fonction
               cmp #fonct_texte
               beq oui
Non            rts

oui            lda dutexte              |du texte + no drag
               beq Non
               lda Top_Select_D
               bne Non

ouioui         dec timing_flash
               bmi trt
               rts

trt            lda #50
               sta timing_flash

               jsl Eor_Flash

               rts

               END
;---------------------------------------------------------------
;
; Eor_Flash : curseur flash
;
;---------------------------------------------------------------
Eor_Flash      START
               Using globaldata
               Using WindowData

               PushLong Ptr_FrameW
               _SetPort

               lda top_cursor
               eor #$01
               sta top_cursor
;--
Eor_Flash1     ENTRY

               phb
               phk
               plb

               PushWord #0
               _GetPenMode

               PushLong #Penloc
               _GetPen

               PushWord #15
               _SetSolidPenPat

               PushWord #2              |eor
               _SetPenMode

               PushWord #0              |curseur ajuste
               PushWord Descent
               _Move

               PushWord penloch
               lda penlocv
               sec
               sbc hauteur
               pha
               _LineTo

               Pushword penloch
               PushWord penlocv
               _MoveTo

               _SetPenMode              |restore pen mode

               plb
               rtl

               END
;---------------------------------------------------------------
;
; eff_cursor : enleve le curseur
;
;---------------------------------------------------------------
eff_cursor     START
               Using GlobalData

               lda top_cursor
               beq fin

               jsl eor_flash

fin            rts

               END
;...............................................................
;
; Hit_Line : SAISIE D'UNE LIGNE
;
;...............................................................
Hit_Line       START
               Using GlobalData
               Using WindowData

               lda dutexte              |Caret On ?
               bne oui
               rts
;--
oui            PushLong Ptr_FrameW
               _SetPort

               lda EventMessage

               cmp #key_return          |si return alors ligne suivante
               beq saut_de_ligne

               cmp #key_delete          |del caractere
               beq del_caract

               cmp #key_fg              |fleche gauche
               beq dep_gauche

               cmp #key_fd              |fleche droite
               beq dep_droite

               bne ins_caract           |un caractere de +
;----------------------------------------
saut_de_ligne  ANOP
               lda #0                   |mode MOVE avec Selection
               sta Choix_Option
               sta Top_Select_D
               jsr In_Option1
               rts
;----------------------------------------
del_caract     jsr backspace
               rts
;----------------------------------------
dep_gauche     jsr depgauche
               rts
;----------------------------------------
dep_droite     jsr depdroite
               rts
;----------------------------------------
ins_caract     jsr insertion
               rts

               END
;---------------------------------------------------------------
;
; depgauche : deplace curseur a gauche
;
;---------------------------------------------------------------
depgauche      START
               Using GlobalData

               jsr Eff_Drag

               lda pos_lettre
               beq rien
               jsr eff_cursor
               dec pos_lettre
               jsr place_cursor
rien           rts
               END
;---------------------------------------------------------------
;
; depdroite : deplace curseur a droite
;
;---------------------------------------------------------------
depdroite      START
               Using GlobalData

               jsr Eff_Drag

               lda pos_lettre
               cmp line_lg
               beq rien
               jsr eff_cursor
               inc pos_lettre
               jsr place_cursor
rien           rts
               END
;---------------------------------------------------------------
;
; insertion : un nouveau caractere
;
;---------------------------------------------------------------
insertion      START
               Using GlobalData
;--
               lda Line_Lg
               cmp #60
               bcc OkIST
               rts
;--
OkIST          lda #1
               sta Top_Action
;--
               lda Top_Select_D
               beq SInsertion

               jsr IN_Drag              |insert Drag

               rts
;--
SInsertion     jsr eff_cursor           |efface curseur

               jsr ins_buffer           |insere caractere

               jsr calcul_rect          |rect circonscrit

               jsr eff_droite           |efface caractere a droite

               lda pos_lettre
               sta indice

               jsr aff_phrase           |affiche le caractere et suivant

               inc pos_lettre

               jsr place_cursor         |maj de la pos du curseur

               jsr Max_Rect             |+ grand Rectangle

               rts
;--------------------------------------
;        In_Drag : insertion avec drag
;--------------------------------------
In_Drag        ANOP

               jsr BS_DRAG              |Delete

               jsr ins_buffer           |insere caractere

               jsr calcul_rect          |rect circonscrit

               lda pos_lettre
               pha
               beq SIn_Drag
               dec a
SIn_Drag       sta indice
               sta pos_lettre
               jsr Place_cursor
               jsr aff_phrase           |affiche le caractere et suivant
;-
               pla
               sta pos_Lettre
               inc pos_lettre

               jsr place_cursor         |maj de la pos du curseur

               rts

               END
;...............................................................
;
;        Max_Rect : plus grand rectangle de refresh
;
;...............................................................
Max_Rect       START
               Using GlobalData
;--
max_x          lda Line_RectX0
               clc
               adc Line_RectX1
               cmp MaxRX
               bcc max_y
               sta MaxRX

               lda Line_X
               sec
               sbc Line_RectX0
               sta LeRectMax+2

               lda Line_X
               clc
               adc Line_RectX1
               sta LeRectMax+6
;--
max_y          lda Line_RectY0
               clc
               adc Line_RectY1
               cmp MaxRY
               bcc smax_y

               lda Line_Y
               sec
               sbc Line_RectY0
               sta LeRectMax

               lda Line_Y
               clc
               adc Line_RectY1
               sta LeRectMax+4
;--
smax_y         ANOP

               ldy #6
rsmax_y        lda LeRectMax,y
               sta Rect2,y
               dey
               dey
               bpl rsmax_y

               jsr copy_rectL
               jsr cop_Rgn0_Shape

               rts
;--
LeRectMax      ds 8
;--
               END
;---------------------------------------------------------------
;
; crt_Caract : nouvelle ligne
;
;---------------------------------------------------------------
crt_Caract     START
               Using GlobalData
               Using Fontdata

               lda line_lg
               bne normal

particulier    lda line_y                |return sans avoir frappe un caractere
               clc
               adc hauteur
               cmp #200
               bcs assez

               sta newposy
               lda line_x
               sta newposx

               jsr Test_In_Line
               bcs non

               lda newposy
               sta line_y
               sta mousey
               lda line_x
               sta mousex

               jsr eff_cursor

               jsr position

               stz top_font
               stz top_color

non            rts

normal         lda Frame_line
               cmp #maxligne
               bcs non

               lda line_recty1
               asl a
               clc
               adc line_recty0
               adc off_recty0
               adc off_recty1

               inc a
               adc line_y
               cmp #200
               bcs assez

               sta mousey
               lda line_x
               sta mousex

               jsr eff_cursor

               jsr position

               jsr init_buffer

assez          rts

               END
;---------------------------------------------------------------
;
; init_buffer : initialisation du buffer
;
;---------------------------------------------------------------
init_buffer    START
               Using Globaldata

;--
               inc Frame_line           |une Ligne de PLUS
               lda Frame_line
               dec a
               sta cou_ligne
               stz top_sauvegarde       |new buffer

               jsr Resize_Line          |Retaille la longueur du Buffer
;--
               lda click_x              | position
               sta line_x
               lda click_y
               sta line_y
;--
init_buffer1   ENTRY

               stz line_rectx0          | rectangle
               stz line_recty0
               stz line_rectx1
               stz line_recty1

               lda #8                   | couleur des bord et fond
               sta line_colbord
               lda #13
               sta line_colfond

               lda #0                   | bord et fond present
               sta line_bord
               sta line_fond

               stz line_lg               | zero caracteres
               stz pos_lettre           | curseur en 1er lettre

               rts

               END
;---------------------------------------------------------------
;
; ins_buffer : mise a jour du buffer
;
;---------------------------------------------------------------
ins_buffer     START
               Using Globaldata
               Using FontData

               sep #$20
               longa off

               ldx line_lg
               cpx pos_lettre
               beq suite

               txy
               dey

encore         lda line_texte,y
               sta line_texte,x

               lda line_ctexte,y
               sta line_ctexte,x

               lda line_fhtexte,y
               sta line_fhtexte,x

               lda line_fltexte,y
               sta line_fltexte,x

               lda line_ttexte,y
               sta line_ttexte,x

               lda line_stexte,y
               sta line_stexte,x

               dex
               dey

               bmi suite                |si negatif stop !!!
               cpy pos_lettre
               bcs encore

suite          ldx pos_lettre

               lda EventMessage
               sta line_texte,x

               jsr met_couleur          |avec test precedent

               jsr met_font             |avec test precedent

fin_ins        inc line_lg               | +1 caractere

               rep #$20
               longa on

               lda #1
               sta top_sauvegarde

               rts
;--------------------------------------
;-------- met la couleur --------------
;--------------------------------------
               longa off

met_couleur    cpx #0
               beq colencour
               lda top_color
               beq colencour

colpreced      txy
               dey

               lda line_ctexte,y
               sta line_ctexte,x

               rts

colencour      lda Couleur_Text
               sta line_ctexte,x
               rts
;--------------------------------------
;-------- met la font -----------------
;--------------------------------------
met_font       cpx #0
               beq fontencour
               lda top_font
               beq fontencour

fontpreced     txy
               dey

               lda line_fhtexte,y
               sta line_fhtexte,x

               lda line_fltexte,y
               sta line_fltexte,x

               lda line_ttexte,y
               sta line_ttexte,x

               lda line_stexte,y
               sta line_stexte,x

               rts

fontencour     lda Fontnumber
               sta line_fltexte,x
               lda Fontnumber+1
               sta line_fhtexte,x

               lda Fontstyle
               sta line_stexte,x
               lda Fontsize
               sta line_ttexte,x

               rts

               longa on

               END
;---------------------------------------------------------------
;
; calcul du rectangle phrase
;
;---------------------------------------------------------------
calcul_rect    START
               Using GlobalData

               lda line_lg
               bne oui

non            rts

oui            stz indice

               stz line_rectx0
               stz line_recty0
               stz line_rectx1
               stz line_recty1

encore         ldx indice
               jsr InsFont              |mise en place de la font

               ldx indice
               lda line_texte,x
               and #$00ff
               Pha
               PushLong #char_rect
               _CharBounds

               jsr calcul_brect         |new borne rect

               inc indice

               lda indice
               cmp line_lg
               bcc encore

               rts

               END
;---------------------------------------------------------------
;
; calcul_brect : calcul pure du rect phrase
;
;---------------------------------------------------------------
calcul_brect   START
               Using GlobalData

               lda line_y
               sec
               sbc char_v1
               cmp line_recty0
               bcc s1
               sta line_recty0

s1             lda char_v2
               sec
               sbc line_y
               cmp line_recty1
               bcc s2
               sta line_recty1

s2             lda char_h2
               sec
               sbc char_h1
               clc
               adc line_rectx1
               sta line_rectx1

               rts

               END
;---------------------------------------------------------------
;
; del_buffer : mise a jour du buffer
;
;---------------------------------------------------------------
del_buffer     START
               Using Globaldata

               sep #$20
               longa off

               ldx pos_lettre

               txy
               dey

encore         lda line_texte,x
               sta line_texte,y

               lda line_ctexte,x
               sta line_ctexte,y

               lda line_fhtexte,x
               sta line_fhtexte,y

               lda line_fltexte,x
               sta line_fltexte,y

               lda line_ttexte,x
               sta line_ttexte,y

               lda line_stexte,x
               sta line_stexte,y

               inx
               iny
               cpx line_lg
               bcc encore

               dec line_lg

               rep #$20
               longa on

               lda #1
               sta top_sauvegarde
         
               rts

               END
;---------------------------------------------------------------
;
; copie : redessine la phrase en line_x y
;
;---------------------------------------------------------------
copie          START
               Using globalData

               lda line_lg
               bne oui
               rts
;
; calcul du rectangle
;
oui            lda line_x
               sec
               sbc line_rectx0
               sbc off_rectx0
               sta rectx0

               lda line_x
               clc
               adc line_rectx1
               adc off_rectx1
               sta rectx1

               lda line_y
               sec
               sbc line_recty0
               sbc off_recty0
               sta recty0

               lda line_y
               clc
               adc line_recty1
               adc off_recty1
               sta recty1
;
; dessin du rectangle : perimetre et interieur
;
               lda line_fond
               beq s0

               PushWord line_colfond
               _SetSolidPenPat

               PushLong #rectcopie
               _PaintRect

s0             lda line_bord
               beq s1

               PushWord line_colbord
               _SetSolidPenPat

               PushLong #rectcopie
               _FrameRect
;
; print la phrase
;
s1             PushWord line_x
               PushWord line_y
               _MoveTo

               stz indice

               jsr aff_phrase

               rts

rectcopie      anop
recty0         ds 2
rectx0         ds 2
recty1         ds 2
rectx1         ds 2

nb_lettre      ds 2
znb_lettre     ds 2

               END
;---------------------------------------------------------------
;
; aff_phrase : affiche une phrase a partir de indice
;
;---------------------------------------------------------------
aff_phrase     START
               Using GlobalData
               Using WindowData

               lda Top_Bitmap
               beq suite

               PushLong #PortFond
               _SetPort
               bra suite1
;--
suite          PushLong Ptr_FrameW
               _SetPort
;--
Suite1         PushWord #$4
               _SetTextMode

               PushWord #0
               _SetPenMode

               lda line_lg              |pas de caractere
               beq non
               lda indice               |idem fin de phrase
               cmp line_lg
               bcc retour

non            rts

retour         ldx indice
               lda line_ctexte,x
               and #$00ff
               pha
               _SetForeColor

               ldx indice
               jsr InsFont
                  
               ldx indice
               lda line_texte,x
               and #$00ff
               pha
               _DrawChar
;
; lettre suivante ?
;
               inc indice
               lda indice
               cmp line_lg
               bcc retour

               rts

               END
;---------------------------------------------------------------
;
; backspace : efface par backspace
;
;---------------------------------------------------------------
backspace      START
               Using globaldata

               lda line_lg              |qq chose dans le buffer ?
               beq non
;--
               lda Top_Select_D
               beq Sbackspace

               lda #1
               sta Top_Action

               jsr BS_Drag              |delete Drag

               bra Rbackspace
;--
Sbackspace     lda pos_lettre           |curseur en 1er caract ?
               bne oui

non            rts

oui            lda #1
               sta Top_Action

               jsr eff_cursor

               lda line_rectx1           |pour refresh dessous
               sta zline_rectx1

               jsr eff_dg

               jsr del_buffer

               dec pos_lettre
;--
Rbackspace     ANOP
               lda pos_lettre
               sta indice

;---si italique - 1 caractere -----------

               lda npenloch
               sta penloch

               lda pos_lettre
               sta indice
               beq suite

               dec indice               |cas d'un italique

suite          PushWord penloch
               Pushword penlocv
               _MoveTo

               jsr aff_phrase

               jsr calcul_rect

               lda line_x
               clc
               adc line_rectx1
               sta SrcRectx0

               lda line_x
               clc
               adc Zline_rectx1
               sta SrcRectx1

               lda line_y
               sec
               sbc line_recty0
               sta SrcRecty0

               lda line_y
               clc
               adc line_recty1
               sta SrcRecty1

;              jsr Init_Rgn             |creation des regions TEMPORAIRE
;
;              PushLong Rgn0            |sur les regions SVP
;              PushLong #SrcRect
;              _RectRgn
;
;              PushLong ZRgn
;              _GetClip
;
;              PushLong Rgn0
;              _SetClip
;
;              jsr test_etat
;
;              lda #$ffff
;              sta Line_Select
;
;              jsr Redraw_Text
;
;              jsr Re_Select
;
;              PushLong ZRgn
;              _SetClip

               jsr place_cursor

;              jsr Fini_Rgn             |Dispose Les Regions TEMPORAIRE

               rts

Zline_rectx1    ds 2

               END
;...............................................................
;
;        BS_DRAG : Delete Selection
;
;...............................................................
BS_Drag        START
               Using GlobalData

               jsr Eff_BSDg

               jsr Del_DRAG

               jsr Place_Cursor

               stz Top_select_D

               lda #1
               sta Top_sauvegarde

               rts
;--------------------------------------
;        Eff_BSDG
;--------------------------------------
Eff_BSDG       ANOP

               lda Pos_lettre
               pha
               beq SEff_BSDG
               dec a
SEff_BSDG      sta Pos_lettre
               jsr Place_Cursor
               sta NpenLoch
               sty penlocv
               pla
               sta Pos_Lettre

               lda npenloch
               sta SrcRectX0
               sta DestX

               lda Line_Y
               sec
               sbc Line_RectY0
               sta SrcRectY0
               sta DestY

               lda Line_X
               clc
               adc Line_RectX1
               sta SrcRectX1

               lda Line_Y
               clc
               adc Line_RectY1
               sta SrcRectY1

               jsr PaintPic

               rts
;--------------------------------------
;        Del_Drag
;--------------------------------------
Del_Drag       ENTRY

               lda SelectDragF
               sec
               sbc SelectDragD
               sta Z

               lda Z                    |TOUT ?
               cmp Line_Lg
               bne Suite
               brl SDel_Drag
;--
Suite          sep #$20
               longa off

               ldy SelectDragD
               ldx SelectDragF

RDel_Drag      ANOP
               lda line_texte,x
               sta line_texte,y

               lda line_ctexte,x
               sta line_ctexte,y

               lda line_fhtexte,x
               sta line_fhtexte,y

               lda line_fltexte,x
               sta line_fltexte,y

               lda line_ttexte,x
               sta line_ttexte,y

               lda line_stexte,x
               sta line_stexte,y

               inx
               iny
               cpy line_lg
               bcc Rdel_Drag

               rep #$20
               longa on
;--
SDel_Drag      lda Line_lg
               sec
               sbc Z
               sta Line_Lg

               rts

Cur_x          ds 2
Z              ds 2

               END
;---------------------------------------------------------------
;
; eff_dg : efface avant cursor et fin phrase
;
;---------------------------------------------------------------
eff_dg         START
               Using GlobalData

               PushLong #PenLoc
               _GetPen

               ldx pos_lettre
               dex

               stx index
               jsr cal_width
               sta largeur
;
; calcul du rect undo avec italique
;
               ldx index
               cpx #1
               bcc suite0

               dex

               jsr cal_width

               clc
               adc largeur
               sta largeur
;
; nouvelle position du curseur  avec italique
;
suite0         lda penloch
               sec
               sbc largeur
               sta npenloch
      
               lda npenloch
               sta SrcRectx0

eff_dg1        ENTRY

               lda line_y
               sec
               sbc line_recty0
               sta SrcRecty0

               lda line_x
               clc
               adc line_rectx1
               sta SrcRectx1

               lda line_y
               clc
               adc line_recty1
               sta SrcRecty1

               lda SrcRectx0
               sta destX

               lda SrcRecty0
               sta destY

               jsr PaintPic

               rts

               END
;---------------------------------------------------------------
;
; domove : deplacer une ligne
;
;---------------------------------------------------------------
domove         START
               Using GlobalData

               jsr eff_cursor

               lda #$ffff
               sta top_anc

               rts

               END
;---------------------------------------------------------------
;
; move_rect : dessine le rect
;
;---------------------------------------------------------------
move_rect      START
               Using GlobalData

               lda mousex             |bouge ??
               cmp anc_x
               bne oui
               lda mousey
               cmp anc_y
               bne oui

non            rts

oui            lda top_anc
               bmi affrect

effrect        lda anew_bufx
               sta new_bufx
               lda anew_bufy
               sta new_bufy

               jsr draw_rect

affrect        lda mousex
               sec
               sbc delta_x
               sta new_bufx
               sta anew_bufx

               lda mousey
               sec
               sbc delta_y
               sta new_bufy
               sta anew_bufy

               jsr draw_rect

               lda mousex
               sta anc_x
               lda mousey
               sta anc_y

               stz top_anc

               rts

               END
;---------------------------------------------------------------
;
; draw_rect : trace rect en new_bufx,y
;
;---------------------------------------------------------------
draw_rect      START
               Using GlobalData

               PushWord #0              |sauve mode
               _GetPenMode

               PushWord #15
               _SetSolidPenPat

               PushWord #2              |eor
               _SetPenMode

               lda new_bufx
               sec
               sbc line_rectx0
               sbc off_rectx0
               sta char_h1

               lda new_bufx
               clc
               adc line_rectx1
               adc off_rectx1
               sta char_h2

               lda new_bufy
               sec
               sbc line_recty0
               sbc off_recty0
               sta char_v1

               lda new_bufy
               clc
               adc line_recty1
               adc off_recty1
               sta char_v2

               PushLong #char_rect
               _FrameRect

               _SetPenMode

               rts

               END
;---------------------------------------------------------------
;
; undo_line : efface la ligne bougee
;
;---------------------------------------------------------------
undo_line      START
               Using GlobalData

               lda line_x
               sec
               sbc line_rectx0
               sbc off_rectx0
               sta SrcRectx0
               sta destX

               lda line_y
               sec
               sbc line_recty0
               sbc off_recty0
               sta SrcRecty0
               sta destY

               lda line_x
               clc
               adc line_rectx1
               adc off_rectx1
               sta SrcRectx1

               lda line_y
               clc
               adc line_recty1
               adc off_recty1
               sta SrcRecty1

               jsr PaintPic

               rts

               END
;---------------------------------------------------------------
;
; avons nous clicke dans un rectangle
;
;---------------------------------------------------------------
in_rect        START
               Using globalData

               lda mousex
               sta in_x
               lda mousey
               sta in_y
;
; calcul du rectangle
;
               lda line_x
               sec
               sbc line_rectx0
               sbc off_rectx0
               sta char_h1

               lda line_x
               clc
               adc line_rectx1
               adc off_rectx1
               sta char_h2

               lda line_y
               sec
               sbc line_recty0
               sbc off_recty0
               sta char_v1

               lda line_y
               clc
               adc line_recty1
               adc off_recty1
               sta char_v2
;
; test if inside the rect
;
               PushWord #0
               PushLong #EventWhere
               PushLong #Char_rect
               _PtInRect
               pla
               bne oui

non            clc
               rts

oui            sec
               rts

               END
;---------------------------------------------------------------
;
; calcul de la position du curseur si click dans une phrase
;
;---------------------------------------------------------------
calcul_pos     START
               Using Globaldata

               lda line_lg
               bne s0
               rts

s0             stz indice
               lda line_x
               sta cur_x
               sta zcur_x

encore         ldx indice
               jsr cal_width
               clc
               adc zcur_x
               sta zcur_x

               lda zcur_x
               cmp mousex
               bcs trouve

               lda zcur_x
               sta cur_x

               inc indice

               lda indice
               cmp line_lg
               bcc encore
               bra gauche

trouve         lda mousex
               sec
               sbc cur_x
               sta dif
               lda zcur_x
               sec
               sbc mousex
               cmp dif
               bcc droite

gauche         lda cur_x
               sta mousex
               bra fin

droite         lda zcur_x
               sta mousex
               inc indice

fin            lda line_y
               sta mousey

               lda indice
               sta pos_lettre

               rts

cur_x          ds 2
zcur_x         ds 2
dif            ds 2

               END
;---------------------------------------------------------------
;
; eff_droite : efface les caracteres a droite du curseur
;
;---------------------------------------------------------------
eff_droite     START
               Using GlobalData

               PushLong #penloc
               _GetPen

suite          lda penloch
               sta SrcRectx0

               lda line_x
               clc
               adc line_rectx1
               sta SrcRectx1

               lda line_y
               sec
               sbc line_recty0
               sta SrcRecty0

               lda line_y
               clc
               adc line_recty1
               sta SrcRecty1

               lda SrcRectx0
               sta DestX

               lda SrcRecty0
               sta DestY

               jsr PaintPic

               rts

               END
;---------------------------------------------------------------
;
; place_cursor : curseur flash positionne
;
;---------------------------------------------------------------
place_cursor   START
               Using GlobalData

               lda line_x
               sta cur_x

               stz index

encore         ldx index
               cpx pos_lettre
               bcs assez

               jsr cal_width
               clc
               adc cur_x
               sta cur_x

               inc index
               bra encore

assez          PushWord cur_x
               PushWord line_y
               _MoveTo

               lda Cur_x
               ldy Line_Y

               rts

cur_x          ds 2

               END
;---------------------------------------------------------------
;
; cal_width : calculons la largeur d'un caract avec x position
;           : resultat dans acc
;---------------------------------------------------------------
cal_width      START
               Using GlobalData

               phx
               jsr InsFont

               plx
               lda line_texte,x
               and #$00ff
               pha
               pha
               _CharWidth
               pla

               rts

               END
;---------------------------------------------------------------
;
; cal_rect2 : calcul des bornes du rectangle
;
;---------------------------------------------------------------
cal_rect2      START
               Using GlobalData

               jsr D_Hdl_Line           |Deref

               PushLong #0
               PushWord zligne
               PushWord #i1
               _Multiply
               pla
               tay
               pla

               lda [Ptr_Line],y
               sta zline_x
               iny
               iny
               lda [Ptr_Line],y
               sta zline_y

               iny
               iny
               lda [Ptr_Line],y
               sta zr_x0
               iny
               iny
               lda [Ptr_Line],y
               sta zr_y0
               iny
               iny
               lda [Ptr_Line],y
               sta zr_x1
               iny
               iny
               lda [Ptr_Line],y
               sta zr_y1

calrect2       lda zline_x             |calcul rect2 ligne
               sec
               sbc zr_x0
               sbc off_rectx0
               sta rect2_x0

               lda zline_x
               clc
               adc zr_x1
               adc off_rectx1
               sta rect2_x1

               lda zline_y
               sec
               sbc zr_y0
               sbc off_recty0
               sta rect2_y0

               lda zline_y
               clc
               adc zr_y1
               adc off_recty1
               sta rect2_y1

               jsr U_Hdl_Line           |Unlock

               rts

               END
;---------------------------------------------------------------
;
; test_rect : avons nous clicker dans un des buffers
;
;---------------------------------------------------------------
test_rect      START
               Using GlobalData

               jsr Test_In_Line              |in line ?
               bcs old

new            clc
               rts

old            lda zligne
               sta cou_ligne

               jsr rest_buffer
               stz top_sauvegarde

               sec
               rts

               END
;---------------------------------------------------------------
;
; sauve_buffer : sauvegarde du buffer courant
;
;---------------------------------------------------------------
sauve_buffer   START
               Using GlobalData

               jsr test_etat            |Y a T'il une ligne VIDE

               lda top_sauvegarde       |Modif ligne ?
               bne oui
               lda mode_vide            |Ligne PARTICULIERE
               beq non
               brl Retaille
non            rts
;--
oui            ANOP
               lda cou_ligne
               cmp Frame_line
               bcs non

               jsr D_Hdl_Line           |deref Hdl

               PushLong #0
               PushWord cou_ligne
               PushWord #i1
               _Multiply
               pla
               tay
               pla

               tya
               clc
               adc #i2
               tay

               ldx #i2

encore         lda LineRecord,x
               sta [Ptr_Line],y
               dey
               dey
               dex
               dex
               bpl encore

               stz top_sauvegarde

;              bra ok
;--
retaille       lda line_lg              |si ligne vide compacte
               bne ok

               dec Frame_Line
               jsr Resize_Line
;--
ok             jsr U_Hdl_Line           |Unlock

               rts

               END
;---------------------------------------------------------------
;
; rest_buffer : restaure du buffer courant
;
;---------------------------------------------------------------
rest_buffer    START
               Using GlobalData

               lda cou_ligne            |ligne EXISTE ?
               cmp Frame_line
               bcc oui

non            rts

oui            jsr D_Hdl_Line           |Deref

               PushLong #0
               PushWord cou_ligne
               PushWord #i1
               _Multiply
               pla
               tay
               pla

               tya
               clc
               adc #i2
               tay

               ldx #i2

encore         lda [Ptr_Line],y
               sta LineRecord,x
               dey
               dey
               dex
               dex
               bpl encore

               jsr U_Hdl_Line           |Unlock

               rts

               END
;---------------------------------------------------------------
;
; Redraw_Text: redessine les phrases
;
;---------------------------------------------------------------
Redraw_Text    START
               Using GlobalData
;--
               lda Frame_line
               bne s0
               rts
;--
s0             lda Top_Bitmap
               bne s1

               jsr eff_cursor
               bra s2
;--
s1             PushLong #FullRect
               _ClipRect
;--
s2             PushLong #penloc
               _GetPen

               jsr test_etat            |CAS PARTICULIER LIGNE VIDE

               jsr sauve_buffer         |SAUVE LIGNE COURANTE

               lda cou_ligne
               pha

               stz cou_ligne

               lda cou_ligne
               cmp Frame_Line
               bcs nonon

encore         jsr rest_buffer

               PushWord line_x
               PushWord line_y
               _MoveTo

               stz indice

               jsr aff_phrase

               inc cou_ligne
               lda cou_ligne
               cmp Frame_line
               bcc encore

nonon          pla
               sta cou_ligne

               jsr rest_buffer

               PushWord penloch
               PushWord penlocv
               _MoveTo
;--
               lda mode_vide
               beq saute

               jsr init_buffer          |RECREATION DE LA LIGNE VIDE

               lda penloch              | position
               sta line_x
               lda penlocv
               sta line_y

               stz mode_vide

saute          rts

               END
;---------------------------------------------------------------
;
; Test_In_Line : test pour une new position
;
;---------------------------------------------------------------
Test_In_Line   START
               Using GlobalData

               lda mousey               |coord souris
               sta newposy
               lda mousex
               sta newposx

               lda Frame_line             |pas de ligne
               beq fin
               dec a
               sta zligne

s0             jsr Cal_rect2

               PushWord #0
               PushLong #NewPos
               PushLong #rect2
               _PtInRect
               pla
               bne dedans

dehors         dec zligne
               bpl s0

fin            clc
               rts

dedans         ANOP
               jsr cop_rgn0_lig         |pour clip region
               sec
               rts

               END
;...............................................................
;
;        draw_rect2 : affiche le rectangle rect2 eor
;
;...............................................................
draw_rect2     START
               Using GlobalData

               PushWord #0              |sauve mode
               _GetPenMode

               PushWord #15
               _SetSolidPenPat

               PushWord #2              |eor
               _SetPenMode

               PushLong #rect2
               _FrameRect

               _SetPenMode

               rts

               END
;...............................................................
;
;        trt_Paintphra   : rafraichie phrases
;
;...............................................................
trt_Paintphra  START
               Using GlobalData
               Using WindowData

               jsr Init_rgn             |Creation des regions TEMPORAIRE

               PushLong Rgn0            |sur les regions SVP
               PushLong #rectRgn0
               _RectRgn

               PushLong Rgn1
               PushLong #rectRgn1
               _RectRgn

               PushLong Rgn0
               PushLong Rgn1
               PushLong Rgn2
               _UnionRgn

               PushLong ZRgn
               _GetClip

               PushLong Rgn2
               _SetClip

               jsl Maj_FrameW           |refresh window

               PushLong ZRgn
               _SetClip

               jsr Fini_Rgn             |Dispose regions TEMPORAIRE

               rts

               END
;...............................................................
;
;        ligne_move : la ligne select passe en dernier
;
;...............................................................
ligne_move     START
               Using GlobalData

               sta tempmove
               lda Frame_line
               dec a
               cmp tempmove             |pas la derniere
               bne oui
               brl fini

oui            lda cou_ligne
               pha
               lda tempmove
               sta cou_ligne
               jsr rest_buffer          |sauve la ligne
               pla
               sta cou_ligne

               lda tempmove
               PushLong #0
               pha
               PushWord #i1
               _Multiply
               ply
               plx
               sty offsetmove

               lda tempmove             |calcul du move
               inc a
               PushLong #0
               pha
               PushWord #i1
               _Multiply
               pla
               plx
               sta source_adr

               lda Frame_line
               sec
               sbc tempmove
               dec a
               PushLong #0
               pha
               PushWord #i1
               _Multiply
               pla
               plx
               sta nbre_byte

               jsr D_Hdl_Line           |Deref

loop           ldy source_adr           |move de droite a gauche
               ldx offsetmove
rloop          lda [Ptr_Line],y
               phy
               txy
               sta [Ptr_Line],y
               ply
               inx
               inx
               iny
               iny
               dec nbre_byte
               dec nbre_byte
               bne rloop

               lda Frame_line
               dec a
               PushLong #0
               pha
               PushWord #i1
               _Multiply
               ply
               plx
               sty offsetmove

               ldx #0                   |restaure l'icone en fin de buffer
r1             lda LineRecord,x
               sta [Ptr_Line],y
               iny
               iny
               inx
               inx

               cpx #i1
               bcc r1

fini           lda Frame_line             |la select = la derniere
               dec a
               sta Line_Select

               jsr U_Hdl_Line           |Unlock

               rts

tempmove       ds 2
offsetmove     ds 2
source_adr     ds 2
nbre_byte      ds 2

               END
;...............................................................
;
;        Resize_Line : Ajuste La Taille Du Buffer des LIGNES
;
;...............................................................
Resize_Line    START
               Using GlobalData

               jsr U_Hdl_Line           |Unlock Handle
;--
               lda Frame_line           |des Lignes de TEXTE ?
               bpl oui

               stz Frame_line           |alors zero

oui            PushLong #0
               PushWord Frame_Line      |nb de ligne
               PushWord lg_LineRecord   |taille d'1 ligne
               _Multiply
               pla
               plx
               cmp #0
               bne Size

               lda #1                   |au moins 1 octet
;--
Size           Pea $0000
               pha
               PushLong Hdl_Line
               _SetHandleSize
;--
               rts

               END
;...............................................................
;
;        test_etat : si ligne vide mode_vide = 1
;
;...............................................................
test_etat      START
               Using GlobalData

               lda fonction
               cmp #fonct_texte
               bne non
               lda Line_lg
               bne non
               lda dutexte
               cmp #1
               beq oui

non            stz mode_vide
               rts

oui            lda #1
               sta mode_vide
               rts

               END
;...............................................................
;
;        PaintPic
;
;...............................................................
PaintPic       START
               Using GlobalData
               Using WindowData

               PushLong Ptr_FrameW      |port = fenetre FRAME
               _SetPort

               PushWord Frame_BackG     |Couleur Du Fond
               _SetSolidPenPat

               PushWord #0              |copie
               _SetPenMode
         
               PushLong #SrcRect        |Rect AJUSTE AU REFRESH
               _PaintRect

               rts

               END
;...............................................................
;
;        cop_Rgn0 : rectdest in rectrgn0
;
;...............................................................
cop_Rgn0       START
               Using GlobalData

               ldy #6
r0             lda rectDest,y
               sta rectrgn0,y           |1 er cadre
               sta rectrgn1,y           |2 em cadre
               dey
               dey
               bpl r0
               rts
;----
cop_Rgn0_lig   ENTRY

               ldy #6
r1             lda rect2,y
               sta rectrgn0,y           |1 er cadre
               sta rectrgn1,y           |2 em cadre
               dey
               dey
               bpl r1
               rts
;----
Cop_Rgn0_Shape ENTRY
               ldy #6
r2             lda Rect_SelectF,y
               sta rectrgn0,y           |1 er cadre
               sta rectrgn1,y           |2 em cadre
               dey
               dey
               bpl r2
;-                                      |Clip region OBJECT
Pad_Rect       ENTRY

               dec RectRgn0
               dec RectRgn0
               dec RectRgn0+2
               dec RectRgn0+2
               inc RectRgn0+4
               inc RectRgn0+4
               inc RectRgn0+6
               inc RectRgn0+6

               rts
;----
Cop_Rgn1_Shape ENTRY
               ldy #6
r3             lda Rect_SelectF,y
               sta rectrgn1,y           |2 em cadre
               dey
               dey
               bpl r3

               dec RectRgn1
               dec RectRgn1
               dec RectRgn1+2
               dec RectRgn1+2
               inc RectRgn1+4
               inc RectRgn1+4
               inc RectRgn1+6
               inc Rectrgn1+6

               rts

               END
;...............................................................
;
;        cop_Rgn1 : rect in rectrgn1
;
;...............................................................
cop_Rgn1       START
               Using GlobalData

               ldy #6
r0             lda char_rect,y
               sta rectrgn1,y
               dey
               dey
               bpl r0
               rts

               END
;...............................................................
;
;        CH_ColorLine : Change la Couleur du texte
;
;...............................................................
CH_ColorLine   START
               Using GlobalData
               Using windowData

               ldx Line_lg
               dex

               sep #$20
               longa off
again          lda Couleur_Text
               sta Line_CTexte,x
               dex
               bpl again

               rep #$20
               longa on

               rts

               END
;...............................................................
;
;        Select_Drag : Selection with Mouse
;
;...............................................................
Select_drag    START
               Using GlobalData
;=-
               stz Top_Select_D         |pas de Select Drag
;-
               lda Line_Y               |Init Rectangle
               sec
               sbc Line_RectY0
               sta RectSelect_DY0
               lda MouseX
               sta RectSelect_DX0
               sta ZRectSelect_DX0
               lda Line_Y
               clc
               adc Line_RectY1
               sta RectSelect_DY1
;-
               lda Pos_lettre           |1 er lettre
               sta SelectDragD
;=-
               lda MouseX               |CLICK ICI
               sta Anc_X
               lda MouseY
               sta Anc_Y
;--
               stz Top_Draw             |pour voir si on a bouge
;--
Loop           PushLong #0
               _StillDown
               pla
               beq Relache

               PushLong #EventWhere     |Quel Position ?
               _GetMouse

               lda MouseY               |BOUGER ?
               cmp Anc_Y
               bne Bouge
               lda MouseX
               cmp Anc_X
               beq Loop
;--
Bouge          ANOP
               jsr Compute_DragX        |Compute Drag

               lda Top_Draw
               bne CaBouge
               inc Top_Draw
               bra Suite

Cabouge        lda NewDragX             |rect Identique
               cmp OldDragX
               beq Loop                 |alors rien
               sta OldDragX
;--
               jsr Draw_DragE           |Efface le Drag
;--
SUITE          lda MouseX
               sta Anc_X
               lda MouseY
               sta Anc_Y

               jsr Compute_DRect
               jsr Draw_DragE

               bra Loop
;--
Relache        ANOP
               lda Top_draw             |a t'on BOUGE ?
               beq FinDrag
;--
Fin            ANOP
;--
               lda Click_X              |retrouve la position
               sta MouseX
               pha
               lda Click_Y
               sta MouseY
               pha
               _MoveTo
;--
               lda SelectDragD          |une Selection ?
               eor SelectDragF
               beq FinDrag
;--
               lda SelectDragD          |NEW POSITION
               sta Pos_lettre

               lda RectSelect_DX0
               sta Click_X
               sta penloch

               Pha
               lda Click_Y
               pha
               _MoveTo
               inc Top_select_D
;--
FinDrag        rts
;--------------------------------------
;        Draw_Drag
;--------------------------------------
Compute_DragX  ANOP
               lda MouseX               |Sauve MouseXY
               pha
               lda MouseY
               pha
               lda Pos_Lettre
               pha
;--
               lda Line_X
               cmp MouseX
               bcc SDrag
               sta MouseX
SDrag          jsr Calcul_pos           |Selection
               lda MouseX
               sta NewDragX
               lda pos_lettre
               sta New_PLettre
;--
               pla
               sta Pos_lettre
               pla
               sta MouseY
               pla
               sta MouseX               |Restaure MouseXY

               rts
;--
Compute_DRect  ANOP

               lda ZRectSelect_DX0      |TJS la meme Origine
               sta RectSelect_DX0
               lda Pos_lettre
               sta SelectDragD

               lda NewDragX             |New X Position
               sta RectSelect_DX1

               lda New_PLettre          |Lettre final
               sta SelectDragF

               lda RectSelect_DX1       |Rectangle PROPRE ?
               cmp RectSelect_DX0
               bcs FCompute_DRect

               ldx RectSelect_DX0
               sta RectSelect_DX0
               stx RectSelect_DX1

               lda SelectDragD
               ldx SelectDragF
               stx SelectDragD
               sta SelectDragF

FCompute_DRect rts
;--
Draw_DragE     ENTRY                    |INVERT THE DRAG RECT

               PushWord #2
               _SetPenMode

               PushWord #15
               _SetSolidPenPat

               PushLong #RectSelect_D
               _PaintRect

               PushWord #0
               _SetPenMode

               rts
;--
ZRectSelect_DX0 ds 2                    |sauve l'origine
New_Plettre    ds 2
NewDragX       ds 2
OldDRagX       dc i'$FFFF'
;--
               END
;...............................................................
;
;        Eff_drag : efface la selection
;
;...............................................................
Eff_Drag       START
               Using GlobalData

               lda Top_Select_D
               bne ok
               rts
;--
ok             jsr draw_dragE

               stz Top_Select_D

               rts

               END

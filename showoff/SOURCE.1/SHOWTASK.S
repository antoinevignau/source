;...............................................................
;
; FILE : SHOWTASK.S                     - aiguillage EVENT -
;        ----------
;...............................................................
;...............................................................
;
;        DoKey : FRAPPE D'UNE TOUCHE =AIGUILLAGE=
;
;...............................................................
DoKey          START
               Using GlobalData
;--
               lda ShowOnOff            |si mode show alors trt des keys
               beq SDK
               jsr Key_In_Show
               rts
;--
SDK            lda Fonction             |Pleine Page ??
               cmp #Fonct_Texte
               bne Voir_Page

               lda DuTexte              |Frappe en cours ?
               beq Voir_Page            |non alors FlipFlop

               lda EventMessage         |ESPACE+OPTION
               cmp #' '
               bne DuText
               lda EventModifiers       |option ON
               and #$0800
               bne Voir_Page

DuText         jsr Hit_line             |Saisie de Texte

Adieu          rts

;--
Voir_Page      lda EventMessage         |est_ce un ESPACE
               cmp #' '
               bne adieu

               jsr Flip_FullPage        |PLEINE PAGE flip_flop

               rts

               END
;...............................................................
;
;        Flip_Full_Page :
;
;...............................................................
Flip_FullPage  START
               Using GlobalData
               Using WindowData

               lda Status_Ecran
               bmi Pas_de_frame
               bne HalfPage
;--------------------------------------
;        PAGE PLEINE ECRAN
;--------------------------------------
FullPage       ANOP

               jsr Eff_Cursor

               jsl Pleine_page

               PushLong Ptr_FrameW
               _BringToFront

               PushLong #MenuRect
               _RefreshDeskTop

               inc Status_Ecran

               lda #1                   |NEW ++++++
               sta Bloque_Flip          |NEW ++++++

Pas_de_frame   rts
;--------------------------------------
;        RETABLIR MENUBAR ETC
;--------------------------------------
HalfPage       ANOP

               stz Bloque_Flip          |NEW ++++++

               jsl Demi_Page

               stz Status_Ecran

               rts

               END
;...............................................................
;
;        Trt_Cursor : Gere la Fleche ou Caret ETC..
;
;...............................................................
Trt_Cursor     START
               Using GlobalData
               Using Cursors

               PushLong #EventWhere     |ou est la SOURIS
               _GetMouse

               PushLong #EventWhere     |EN GLOBAL SIOUPLAIT
               _LocalToGlobal

               PushWord #0
               PushLong #TaskData
               PushLong EventWhere
               _FindWindow
               pla
               cmp #$0013
               bne LaFleche

               PushLong #0
               PushLong TaskData
               _GetWRefCon              |ALREADY IN STACK
               pla
               plx
;--
               cmp #2                   |Si Dans Frame un CURSEUR
               beq UnCurseur
;--
LaFleche       lda Type_Cursor
               beq fin

               _InitCursor              |la Fleche
               stz Type_cursor

               rts
;--
UnCurseur      lda Fonction
               cmp #Fonct_Texte
               beq LeCaret
               cmp #Fonct_Line
               beq LaCroix
               cmp #Fonct_Rect
               bcc LaFleche
               cmp #Fonct_OvalF
               bcc LaCroix
               beq LaCroix
               bra LaFleche
;--
LeCaret        lda Type_Cursor
               cmp #Cursor_Texte
               beq fin

               PushLong #Caret
               _SetCursor

               lda #Cursor_Texte
               sta Type_cursor
               bra fin
;--
LaCroix        lda Type_cursor
               cmp #Cursor_Croix
               beq fin

               PushLong #Croix
               _SetCursor

               lda #Cursor_Croix
               sta Type_Cursor
               bra fin
;--
fin            rts

               END
;...............................................................
;
;        DoClick : Click in Content Window
;
;...............................................................
DoClick        START
               Using GlobalData
               Using WindowData
;--
               lda ShowOnOff            |si show previous or next
               beq SDC                  |sinon comme d'habitude movesize object
               jsr Click_In_Show
               bcc SDC
               rts
;--
SDC            jsr Set_Shift_Key        |top si shift key
;--
               PushLong #0              |Quelle Fenetre est Demandee
               PushLong TaskData
               _GetWRefCon
               pla
               sta RefConW              |stocke la reference fenetre
               plx
;--
               cmp #2                   |Si Dans Frame No SELECT
               beq in_content
;--
OutSide_Frame  PushLong TaskData        |Selection de la Fenetre
               _SelectWindow

InContent      jsr In_Content           |aiguillage

               rts

               END
;...............................................................
;
;        In_Content : AIGUILLAGE SUIVANT LE CLICK IN CONTENT
;
;...............................................................
In_Content     START
               Using GlobalData
               Using WindowData

               lda RefConW              |QUELLE FENETRE
               cmp #1
               beq InOption
               cmp #2
               beq InFrame
               rts

InOption       jsr In_Option            |FENETRE DES OPTIONS
               rts

InFrame        jsr In_Frame             |FENETRE FRAME
               rts

               END
;...............................................................
;
;        In_Frame : ACTION SUR FENETRE FRAME
;
;...............................................................
In_Frame       START
               Using GlobalData
               Using WindowData

               PushLong Ptr_frameW
               _SetPort

               lda Fonction
               cmp #Fonct_Move
               beq ClickObject

               cmp #Fonct_Texte
               beq ClickLine

               cmp #Fonct_line
               beq DrawObject

               cmp #Fonct_Rect
               bcc RIEN

               cmp #Fonct_OvalF+1
               bcc DrawObject

RIEN           rts

ClickObject    ANOP                     |Click POUR SELECT OBJECT
               jsr Click_Select
               rts

ClickLine      ANOP                     |Click POUR LE TEXTE
               jsr Click_Line
               rts

DrawObject     ANOP                     |Draw a OBJECT
               jsr DrawShape
               rts

               END
;...............................................................
;
;        In_Option : CHOIX D'UNE FONCTION DU CARTOUCHE
;
;...............................................................
In_Option      START
               Using GlobalData
               Using WindowData

               PushLong Ptr_OptionW     |Coordonnees en LOCAL
               _SetPort

               PushLong #EventWhere
               _GlobalToLocal

               jsr Find_Option          |cherche l'option
               bcc In_Option1

NoThing        rts                      |rien alors adieu

In_Option1     ENTRY
;--
               ldx Mode_ShowOff
               cpx #Mode_Rien
               bne SSF
               ldx Choix_Option
               cpx #15
               bcs SSF
               rts
;--
SSF            pha
               PushLong Ptr_OptionW     |Another One FOR ENTRY
               _SetPort
               pla

               jsr Invert_Option        |Fonction On + Disable Last one

               jsr Set_Fonction         |Active les Flags

               rts

               END
;...............................................................
;
;        Find_Option : Cherche la Fonction Demandee
;
;...............................................................
Find_Option    START
               Using GlobalData
               Using WindowData

               ldx #0

               lda #Rect_option         |debut table Rectangle d'option
               sta Adr_RectOption
               lda #^Rect_option
               sta Adr_RectOption+2
;--
again          phx

               PushWord #0
               PushLong #EventWhere     |souris
               PushLong Adr_RectOption  |Rectangle
               _PtInRect
               pla
               bne oui

               plx
               inx
               cpx #Nb_Option
               bcs non

               lda Adr_RectOption
               clc
               adc #8
               sta Adr_RectOption
               bcc again
               inc Adr_RectOption+2
               bra again
;--
non            sec
               rts
;--
oui            pla                      |Option Choisie
               sta Choix_Option
               clc
               rts

               END
;...............................................................
;
;        Invert_Option : Check la Fonction de ACC
;
;...............................................................
Invert_Option  START
               Using GlobalData
               Using WindowData

;--
;              cmp #2                   |INACTIF PAS DE HILITE
;              bcc Actif
;              cmp #4
;              beq Actif
;              cmp #8
;              bcc No_ACTIF
;--
               cmp #5                   |si cut test pour hilite
               bne S1S2
               ldx Nb_List_Select
               beq No_Actif
;--
S1S2           ANOP
               cmp #6
               beq No_Actif
               cmp #7
               beq No_Actif
               cmp #14
               bcc ACTIF
               bra NO_ACTIF
;--
ACTIF          pha                      |Save Set Fonction

               lda Fonction             |Disable the old one
               jsr Option_Off

               pla                      |Enable Fonction On SI PRINCIPALE
               tax
               cmp #14                  |SI PARAMETRE FONCTION TOUJOURS ON
               bcs Enable
;--
               pha                      |Fonction DEMANDER

               jsr Maj_Text_Line        |Retablir une ligne de texte

noMaj          pla
               sta Fonction
               tax
;--
Enable         txa
               jsr Option_On

NO_ACTIF       rts
;--------------------------------------
; FONCTION in ACC Disable
;--------------------------------------
Option_Off     ENTRY

               bmi ko_off               |depasse ?
               cmp #Nb_Option
               beq ko_off
               bcc ok_off
ko_off         rts

ok_off         jsr Cal_Adr_Rect         |Adresse du Rectangle a inverser
               PushLong Adr_RectOption
               _InvertRect

               rts
;--------------------------------------
; FONCTION in ACC Enable
;--------------------------------------
Option_On      ENTRY

               bmi ko_on                |depasse ?
               cmp #Nb_Option
               beq ko_on
               bcc ok_on
ko_on          rts

ok_on          jsr Cal_Adr_Rect         |Adresse du Rectangle a inverser
               PushLong Adr_RectOption
               _InvertRect

               rts
;--------------------------------------
;  COMPUTE l'ADRESSE DU RECTANGLE
;--------------------------------------
Cal_Adr_Rect   ENTRY

               asl a
               asl a
               asl a

               clc
               adc #Rect_Option
               sta Adr_RectOption
               lda #^Rect_Option
               adc #0
               sta Adr_RectOption+2

               rts

               END
;...............................................................
;
;        Check_Text : si choix menu et phrase on
;
;...............................................................
Check_Text     START
               Using GlobalData
               Using WindowData

               ldx Fonction
               cpx #Fonct_Texte
               beq ok
ko             rts
;--
ok             lda TaskData             |CHARACTERS
               cmp #288
               beq ko

               lda #0
               sta Choix_Option
               sta Top_select_D
               jsr In_option1

               rts

               END
;...............................................................
;
;        Maj_Text_Line : rafraichir une Ligne
;
;...............................................................
Maj_Text_Line  START
               Using GlobalData
               Using WindowData

               lda Status_ecran
               bmi FIN1

               ldx Fonction             |on Etait en Texte ?
               cpx #Fonct_Texte
               bne FIN1

               lda DuTexte
               beq Fin1

               PushLong Ptr_FrameW
               _SetPort

               stz Top_Select_D         |pas de select Drag

               jsr Eff_Cursor           |enlever le curseur

Suite          jsr Sauve_buffer

               lda Line_Lg
               bne Suite0
               stz Nb_List_Select
               lda #$FFFF
               sta Line_Select
               jsr Menu_on_off
               bra fin
;--
Suite0         lda Frame_line           |la ligne est selectionnee
               dec a
               sta Line_Select
               sta cou_ligne
               sta zligne

               lda Line_Select
               jsr Put_In_List

               jsr Menu_on_off

               jsr Cal_Rect2
               jsr Copy_RectL
               jsr Cop_Rgn1_Shape

fin            jsr Aff_ShapeS
;--
fin01          PushLong Ptr_OptionW     |Le  PORT = OPTION WINDOW
               _SetPort
                   
FIN1           rts

               END
;...............................................................
;
;        Set_fonction : Position des flags Pour Fonction
;
;...............................................................
Set_fonction   START
               Using GlobalData
               Using WindowData
;--
SSF            lda Choix_Option         |quelle initialisation ?
               asl a
               tax
               jsr (Fonction_table,x)
               rts

Fonction_table ANOP
               dc i2'Domove'            |Move OBJECT
               dc i2'DoText'            |Enter Ligne
               dc i2'DoSticker1'        |Stickers
               dc i2'DoIconAppel'       |Icons
               dc i2'DoLine'            |Lines
               dc i2'DoCut'             |Cut
               dc i2'DoFlipVert'        |Flip Horizontal
               dc i2'DoFlipHori'        |Flip Vertical
               dc i2'DoRect'            |Rect
               dc i2'DoRectF'           |Rect Fill
               dc i2'DoRectO'           |RectOval
               dc i2'DoRectOF'          |RectOval Fill
               dc i2'DoOval'            |Oval
               dc i2'DoOvalF'           |Oval Fill
               dc i2'DoOutLine'         |No border
               dc i2'DoOutLine'         |1 lines
               dc i2'DoOutLine'         |2 lines
               dc i2'DoOutLine'         |3 lines
               dc i2'DoOutLine'         |4 lines
               dc i2'DoArrow1'          |Arrows
               dc i2'DoArrow2'          |2 Arrows

               dc i2'DocolorT'          |Color TEXT or OULINE
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'
               dc i2'DocolorT'

               dc i2'DoPreviousF'       |Previous Frame
               dc i2'DoNextF'           |Next Frame

               rts

               END

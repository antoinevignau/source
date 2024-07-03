;...............................................................
;
; FILE : SHOWSELECT.S                   - SELECTION D'UN OBJET -
;        ------------
;...............................................................
;...............................................................
;
;        Click_Select : Select OBJET
;
;...............................................................
Click_Select   START
               Using GlobalData

               jsr sauve_buffer         |et oui

               jsr Selection            |Selection d'une Shape, Ligne ETC...
               bcs ok

               jsr Un_Select            |UnSelect Object

               jsr Select_Group         |Selection Groupee

ok             jsr Menu_On_Off          |change les Menus si selection

               rts

               END
;...............................................................
;
;        un_select : efface cadre de selection
;
;...............................................................
Un_Select      START
               Using GlobalData
;--
               lda Top_Select_D         |une Drag
               beq S0
               jsr Draw_DragE           |efface la selection
               stz Top_Select_D
;--
S0             lda Nb_List_Select
               bne Loop
               rts
;--
Loop           pha
               asl a
               tay
               lda List_Record,y
               jsr DeSelection
               pla
               dec a
               bne Loop
;--
               stz Nb_List_Select

               rts
;----------
DeSelection    pha
               and #$FF00
               xba
               beq DeSelect_Line
               cmp #1
               beq DeSelect_Shape
               cmp #2
               beq Deselect_Icon
               cmp #3
               beq Deselect_Number
               cmp #4
               beq Deselect_Graph
               cmp #5
               beq Deselect_Sticker
               pla
               rts
;--
DeSelect_Line  ANOP
               pla
               and #$00FF
               sta zligne
               jsr cal_rect2            |taille du rect
               jsr draw_rect2           |effacons
               bra FIN
;--
DeSelect_Shape ANOP
               pla
               and #$00FF
               jsr Eor_poignees         |Selection
               bra FIN
;--
Deselect_Icon  ANOP
               pla
               and #$00FF
               jsr Rest_Icon
               jsr Cal_RectIcon
               jsr Draw_RectIcon                              
               bra Fin
;--
Deselect_Sticker ANOP
               pla
               and #$00FF
               jsr Rest_Sticker
               jsr Cal_RectSticker
               jsr Draw_RectSticker                           
               bra Fin
;--
Deselect_Number ANOP
               pla
               bra Fin
;--
Deselect_Graph ANOP
               pla
               and #$00FF
               jsr Rest_graph
               jsr Draw_RectGraph
               bra fin
;--
FIN            lda #$ffff               |raz
               sta Line_Select
               sta Shape_Select
               sta Icon_Select
               sta Graph_Select
               sta Sticker_Select

               rts

               END
;...............................................................
;
;        Select : affiche cadre de selection d'un OBJET
;
;...............................................................
Select_Line    START
               Using GlobalData

               lda zligne               |Un_Select si besoin
               sta Line_Select
               sta cou_ligne
               jsr rest_buffer

               jsr cal_rect2

               jsr draw_rect2

no             rts

               END
;...............................................................
;
;        Re_Select : affiche cadre de selection en cas de refresh
;
;...............................................................
Re_Select      START
               Using GlobalData

               jsr Select_groupe

               lda Top_select_D
               beq no
               jsr Draw_DragE
;--
no             rts

               END
;...............................................................
;
;        Select_Group : Selection de plusieurs ELEMENTS
;
;...............................................................
Select_Group   START
               Using GlobalData
;--
               stz Nb_List_Select       |pas de groupe
;--
               lda MouseX               |CLICK ICI
               sta X_ORG
               sta Anc_X
               lda MouseY
               sta Y_ORG
               sta Anc_Y
;--
               stz Top_Draw             |Efface ou Non
;--
Loop           PushLong #0
               _StillDown
               pla
               beq Relache

               PushLong #EventWhere     |Quel Position ?
               _GetMouse

               lda Mousey               |BOUGER ?
               cmp Anc_Y
               bne Bouge
               lda Mousex
               cmp Anc_X
               beq Loop
;--
Bouge          lda Top_Draw
               bne CaBouge
               inc Top_Draw
               bra SUITE

Cabouge        jsr XOR_RectGroup        |EffACE en XOR
;--
SUITE          lda MouseX
               sta Anc_X
               lda MouseY
               sta Anc_Y

               jsr XOR_RectGroup        |AFFICHE en XOR

               bra Loop
;--
Relache        lda Top_draw             |a t'on BOUGE ?
               beq fin

               jsr Xor_RectGroup        |Efface Forme

               jsr Object_Select        |liste des objets select

fin            jsr Select_Groupe        |Selection de GROUPE
;--
               rts

               END
;...............................................................
;
;        Xor_RectGroup : Dessine Cadre SELECTION GROUPEE
;
;...............................................................
Xor_RectGroup  START
               Using GlobalData

               lda X_ORG
               sta Rect_SelectX0
               lda Anc_X
               sta Rect_SelectX1

               lda Y_ORG
               sta Rect_SelectY0
               lda Anc_Y
               sta Rect_SelectY1
;--                                     |CADRAGE
               lda Rect_SelectX0
               cmp Rect_SelectX1
               bcc ok

               ldx Rect_SelectX1
               sta Rect_SelectX1
               stx Rect_SelectX0

ok             lda Rect_SelectY0
               cmp Rect_SelectY1
               bcc okok

               ldx Rect_SelectY1
               sta Rect_selectY1
               stx Rect_selectY0
;--
okok           PushLong #Pat1           |Pattern
               _SetPenPat

               PushWord #2              |Xor
               _SetPenMode

               PushLong #Rect_Select
               _FrameRect

               PushWord #0              |Retablir MODE COPY
               _SetPenMode

               rts

               END
;...............................................................
;
;        Object_Select : Determine les objets SELECTIONNES
;
;...............................................................
Object_select  START
               Using GlobalData

               stz Top_Draw             |Flag
               stz Nb_List_Select       |raz compteur

               jsr Group_Number         |Frame Number

               jsr Group_Text           |Les Lignes de TEXTE

               jsr Group_Icon           |Les Icons

               jsr Group_Sticker        |Les Stickers

               jsr Group_Graph          |les Graphs

               jsr Group_Shape          |Les Shapes

               rts
;--------------------------------------
;        Group_Number
;--------------------------------------
Group_Number   ENTRY

               lda Status_Number
               bne ok
               rts
;--
ok             PushWord #0              |Inside
               PushLong #Rect_Select
               PushLong #NumberRect
               PushLong #Rect_Result
               _SectRect
               pla
               beq LasuiteN
;--
               PushWord #0
               PushLong #NumberRect
               PushLong #Rect_Result
               _EqualRect
               pla
               bne InsideN
;--
LaSuiteN       rts
;--
InsideN        ANOP
               jsr Plus_One_Select      |inc Nb_List_Select
               bcs LasuiteN
;--
               lda #$0300
               tax
               lda Nb_List_Select       |et on stocke
               asl a
               tay
               txa
               sta List_record,y
;--
               inc Top_Draw
;--
               PushLong #Rect_SelectF
               PushLong #NumberRect
               PushLong #Rect_SelectF
               _UnionRect
;--
               rts
;--------------------------------------
;        Group_Text
;--------------------------------------
Group_Text     ENTRY

               lda Frame_Line
               bne ouiL
               rts
;--
ouiL           lda Frame_Line           |LA Neme Line texte
               dec a

LOOPL          pha                      |Met la Shape dans RECORD
               sta cou_ligne
               sta zligne
               jsr Rest_buffer
;--
               jsr cal_Rect2
;--
               PushWord #0              |Inside
               PushLong #Rect_Select
               PushLong #Rect2
               PushLong #Rect_Result
               _SectRect
               pla
               beq Lasuitel
;--
               PushWord #0
               PushLong #Rect2
               PushLong #Rect_Result
               _EqualRect
               pla
               bne InsideL
;--
LaSuiteL       pla                      |SUIVANT
               dec a
               bpl LOOPL
               rts
;--
InsideL        jsr Plus_One_Select      |inc Nb_List_Select
               bcs LasuiteL
               lda 1,s                  |shape select
               and #$00FF               |c'est une shape
               tax
               lda Nb_List_Select       |et on stocke
               asl a
               tay
               txa
               sta List_record,y
;--
               lda Top_Draw             |rectangle de TOUR
               bne SauteL

               inc Top_Draw

               PushLong #Rect2
               bra Saute1L
;--
SauteL         PushLong #Rect_SelectF
Saute1L        PushLong #Rect2
               PushLong #Rect_SelectF
               _UnionRect
;--
               brl LaSuiteL

               rts
;--------------------------------------
;        Group_Shape
;--------------------------------------
Group_Shape    ENTRY

               lda Frame_Shape          |DES SHAPES ?
               bne ouiS
               rts
;--
ouiS           lda Frame_Shape          |LA Neme SHAPE GEO

LOOPS          pha                      |Met la Shape dans RECORD
               jsr Rest_Shape
;--
               lda Shape_Type           |si Ligne -13
               bne LOOPS0
;--
               PushLong #Shape_Rect
               PushWord #12
               PushWord #12
               _InSetRect
;--
LOOPS0         PushWord #0              |Inside
               PushLong #Rect_Select
               PushLong #Shape_Rect
               PushLong #Rect_Result
               _SectRect
               pla
               beq LaSuiteS
;--
               PushWord #0
               PushLong #Shape_Rect
               PushLong #Rect_Result
               _EqualRect
               pla
               bne InsideS
;--
LaSuiteS       pla                      |SUIVANT
               dec a
               bne LOOPS
               rts
;--
InsideS        jsr Plus_One_Select      |inc Nb_List_Select
               bcs LaSuiteS
               lda 1,s                  |shape select
               and #$00FF               |c'est une shape
               ora #$0100
               tax
               lda Nb_List_Select       |et on stocke
               asl a
               tay
               txa
               sta List_record,y
;--
               lda Shape_Type
               bne InsideS0
               PushLong #Shape_Rect
               PushWord #-12
               PushWord #-12
               _InSetRect
;--
InsideS0       lda Top_Draw             |rectangle de TOUR
               bne SauteS

               inc Top_Draw

               PushLong #Shape_Rect
               bra Saute1S
;--
SauteS         PushLong #Rect_SelectF
Saute1S        PushLong #Shape_Rect
               PushLong #Rect_SelectF
               _UnionRect
;--
               brl LaSuiteS

               rts
;--------------------------------------
;        Group_Graph
;--------------------------------------
Group_Graph    ENTRY

               lda Frame_Graph          |DES GraphS ?
               bne ouiG
               rts
;--
ouiG           lda Frame_Graph          |LE Neme Graph

LOOPG          pha                      |Met la Graph dans RECORD
               jsr Rest_Graph
;--
               PushWord #0              |Inside
               PushLong #Rect_Select
               PushLong #GraphRect
               PushLong #Rect_Result
               _SectRect
               pla
               beq LaSuiteG
;--
               PushWord #0
               PushLong #GraphRect
               PushLong #Rect_Result
               _EqualRect
               pla
               bne InsideG
;--
LaSuiteG       pla                      |SUIVANT
               dec a
               bne LOOPG
               rts
;--
InsideG        jsr Plus_One_Select      |inc Nb_List_Select
               bcs LaSuiteG
               lda 1,s                  |Graph select
               and #$00FF               |c'est un Graph
               ora #$0400
               tax
               lda Nb_List_Select       |et on stocke
               asl a
               tay
               txa
               sta List_record,y
;--
               lda Top_Draw             |rectangle de TOUR
               bne SauteG

               inc Top_Draw

               PushLong #GraphRect
               bra Saute1G
;--
SauteG         PushLong #Rect_SelectF
Saute1G        PushLong #GraphRect
               PushLong #Rect_SelectF
               _UnionRect
;--
               brl LaSuiteG

               rts
;--------------------------------------
;        Group_Icon
;--------------------------------------
Group_Icon     ENTRY

               lda Frame_Icon          |DES SHAPES ?
               bne ouiI
               rts
;--
ouiI           lda Frame_Icon          |LA Neme SHAPE GEO

LOOPI          pha                      |Met la Shape dans RECORD
               jsr Rest_Icon
               jsr Cal_RectIcon
;--
               PushWord #0              |Inside
               PushLong #Rect_Select
               PushLong #Rect_Icone
               PushLong #Rect_Result
               _SectRect
               pla
               beq LaSuiteI
;--
               PushWord #0
               PushLong #Rect_Icone
               PushLong #Rect_Result
               _EqualRect
               pla
               bne InsideI
;--
LaSuiteI       pla                      |SUIVANT
               dec a
               bne LOOPI
               rts
;--
InsideI        jsr Plus_One_Select      |inc Nb_List_Select
               bcs LasuiteI
               lda 1,s                  |shape select
               and #$00FF               |c'est une shape
               ora #$0200
               tax
               lda Nb_List_Select       |et on stocke
               asl a
               tay
               txa
               sta List_record,y
;--
               lda Top_Draw             |rectangle de TOUR
               bne SauteI

               inc Top_Draw

               PushLong #Rect_Icone
               bra Saute1I
;--
SauteI         PushLong #Rect_SelectF
Saute1I        PushLong #Rect_Icone
               PushLong #Rect_SelectF
               _UnionRect
;--
               brl LaSuiteI

               rts
;--------------------------------------
;        Group_Sticker
;--------------------------------------
Group_Sticker  ENTRY

               lda Frame_Sticker       |DES Stickers ?
               bne ouiK
               rts
;--
ouiK           lda Frame_Sticker       |LA Neme SHAPE GEO

LOOPK          pha                      |Met la Shape dans RECORD
               jsr Rest_Sticker
               jsr Cal_RectSticker
;--
               PushWord #0              |Inside
               PushLong #Rect_Select
               PushLong #Rect_Stick
               PushLong #Rect_Result
               _SectRect
               pla
               beq LaSuiteK
;--
               PushWord #0
               PushLong #Rect_Stick
               PushLong #Rect_Result
               _EqualRect
               pla
               bne InsideK
;--
LaSuiteK       pla                      |SUIVANT
               dec a
               bne LOOPK
               rts
;--
InsideK        jsr Plus_One_Select      |inc Nb_List_Select
               bcs LaSuiteK
               lda 1,s                  |shape select
               and #$00FF               |c'est une shape
               ora #$0500
               tax
               lda Nb_List_Select       |et on stocke
               asl a
               tay
               txa
               sta List_record,y
;--
               lda Top_Draw             |rectangle de TOUR
               bne SauteK

               inc Top_Draw

               PushLong #Rect_Stick
               bra Saute1K
;--
SauteK         PushLong #Rect_SelectF
Saute1K        PushLong #Rect_Stick
               PushLong #Rect_SelectF
               _UnionRect
;--
               brl LaSuiteK

               rts
;--------------------------------------
;        Plus_One_Select
;--------------------------------------
Plus_One_Select ENTRY

               lda Nb_List_Select
               cmp #100
               bcs FP_O_S
               inc Nb_List_Select
FP_O_S         rts

               END
;...............................................................
;
;        Select_Groupe : PLUSIEURS OBJET ON
;
;...............................................................
Select_Groupe  START
               Using GlobalData

               lda Nb_List_Select
               bne ok
               rts

ok             lda Nb_List_Select
;--
Loop           Pha
               asl a
               tay
;--
               lda List_Record,y
               pha
               and #$FF00
               xba
               beq LineOn
               cmp #1
               beq ShapeOn
               cmp #2
               beq IconOn
               cmp #4
               beq GraphOn
               cmp #5
               beq StickerOn
               pla
               bra suite
;--
LineOn         pla
               and #$00FF
               sta zligne
               jsr Cal_Rect2
               jsr Draw_Rect2
               bra suite
;--
ShapeOn        pla
               and #$00FF
               jsr Eor_poignees         |Selection
               bra suite
;--
IconOn         pla
               and #$00FF
               jsr Rest_Icon
               jsr Cal_RectIcon
               jsr Draw_RectIcon                              
               bra suite
;--
GraphOn        pla
               and #$00FF
               jsr Rest_Graph
               jsr Draw_RectGraph
               bra suite
;--
StickerOn      pla
               and #$00FF
               jsr Rest_Sticker
               jsr Cal_RectSticker
               jsr Draw_RectSticker                           
;--
suite          pla
               dec a
               bne Loop

               rts

               END
;...............................................................
;
;        Move_Object: DEPLACE UN OBJET et GROUPE SELECT
;
;...............................................................
Move_OBJECT    START
               Using GlobalData
;--
               jsr Set_Rect_Move        |Rectangle de l'objet
;--
               jsr Cop_rgn0_Shape
               jsr Copy_rect_Undo       |pour le undo
;--
               lda MouseX               |ORIGINE DU CLICK
               sta Anc_X
               sta X_ORG
               lda MouseY
               sta Anc_Y
               sta Y_ORG
;--
               jsr INV_FANTOME          |inverse Fantome

               stz Top_draw
;--
Loop           PushLong #0
               _StillDown
               pla
               bne Appuie
               brl relache
;--
Appuie         PushLong #EventWhere     |Quel Position ?
               _GetMouse

               lda MouseY               |BOUGER ?
               cmp Anc_Y
               bne Bouge
               lda MouseX
               cmp Anc_X
               beq Loop
;--
Bouge          lda #1
               sta Top_draw
;--
               lda MouseY
               sec
               sbc Anc_Y
               sta Delta_Y

               lda MouseX
               sec
               sbc Anc_X
               sta Delta_X
;--
               jsr Out_Page             |test si Cadre selection Inside Page
;--
               lda MouseY               |BOUGER ?
               cmp Anc_Y
               bne Bouge1
               lda MouseX
               cmp Anc_X
               beq Loop
;--
Bouge1         jsr INV_FANTOME          |EFFACE
;--
               lda MouseX
               sta Anc_X
               lda MouseY
               sta Anc_Y
;--
               PushLong #Rect_SelectF
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
;--
               PushLong #Shape_Debut
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect

               PushLong #RectShape
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
;--
               jsr INV_FANTOME          |AFFICHE en XOR

               brl Loop
;--
Relache        ANOP
               jsr INV_FANTOME          |efface cadre selection

               lda Top_draw             |a t'on BOUGE ?
               bne fin01
;--
               jsr Del_Undo
               bra fin
;--
fin01          jsr MAJ_MOVE             |REPERCUTE LE DEPLACEMENT
;--
fin            jsr Cop_rgn1_Shape
               jsr Aff_shapeS           |REFRESH FENETRE
;--
               rts
;--
               END
;...............................................................
;
;        Out_Page : Test if Rect in PAGE For Selection
;
;...............................................................
Out_Page       START
               Using GlobalData
;--
               lda Nb_List_Select       |Plus d'un Objet ?
               cmp #2
               bcs ok
               rts
;--
ok             Ldy #6

ROut_Page      lda Rect_SelectF,y
               sta Rect_Travail,y
               dey
               dey
               bpl ROut_Page
;--
               PushLong #Rect_Travail
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
;--
               PushWord #0
               PushLong #Rect_Travail
               PushLong #FullRect
               PushLong #Rect_Result
               _SectRect
               pla
               beq Out_Cadre
;--
               PushWord #0
               PushLong #Rect_Result
               PushLong #Rect_Travail
               _EqualRect
               pla
               bne EgalOk
;--
Out_cadre      ANOP

Trt_X0         lda Rect_Travail+2
               bpl Trt_X1
               Eor #$FFFF
               inc a
               clc
               adc MouseX
               sta MouseX
               bra Trt_Y0
;-
Trt_X1         lda Rect_Travail+6
               cmp #321
               bcc Trt_Y0
               sec
               sbc #320
               sta Variable
               lda MouseX
               sec
               sbc Variable
               sta MouseX
;--
Trt_Y0         lda Rect_Travail
               bpl Trt_Y1
               eor #$FFFF
               inc a
               clc
               adc MouseY
               sta MouseY
               bra DiffKo
;-
Trt_Y1         lda Rect_Travail+4
               cmp #201
               bcc DiffKo
               sec
               sbc #200
               sta Variable
               lda MouseY
               sec
               sbc Variable
               sta MouseY
;--
DiffKo         ANOP
               lda MouseY
               sec
               sbc Anc_Y
               sta Delta_Y

               lda MouseX
               sec
               sbc Anc_X
               sta Delta_X
;--
EgalOk         clc
               rts

variable       ds 2

               END
;...............................................................
;
;        MAJ_MOVE : Repercute les Modifications sur les objets
;
;...............................................................
MAJ_MOVE       START
               Using GlobalData
;--
               jsr Save_Undo0
;--
               lda Nb_List_Select
               bne ok
               rts
;--
ok             ANOP

               lda #1                   |Refresh plus rapide que les phrases
               sta Only_Text
;--
               lda MouseX               |DEPLACEMENT
               sec
               sbc X_ORG
               sta Delta_X

               lda MouseY
               sec
               sbc Y_ORG
               sta Delta_Y
;--
               lda Nb_List_Select
;--
Loop           Pha
               asl a
               tay

               lda List_Record,y
               jsr Maj_OBJECT           |ON MODIFIE

               pla
               dec a
               bne Loop

               rts
;--
Maj_Object     ENTRY
               pha
               and #$FF00
               xba
               beq Maj_ObjectL          |Text
               cmp #1
               beq Maj_ObjectS          |shape
               cmp #2
               bne ko
               brl Maj_ObjectI          |icon
ko             cmp #3
               bne ko1
               brl Maj_ObjectN          |frame number
ko1            cmp #4
               bne ko2
               brl Maj_ObjectG          |Graph
ko2            cmp #5
               bne ko3
               brl Maj_ObjectK          |Sticker
;--
ko3            pla
               rts
;--
Maj_ObjectS    lda 1,s
               and #$00FF
               jsr Rest_Shape
;--
               PushLong #Shape_Debut
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
;--
               PushLong #Shape_Rect
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
;--
               pla
               and #$00FF
               jsr Copie_Shape

               stz Only_Text

               rts
;--------------------------------------
Maj_ObjectL    lda 1,s
               sta Cou_ligne
               jsr Rest_buffer
;--
               inc top_sauvegarde
;--
               lda Line_Y
               clc
               adc Delta_Y
               sta Line_Y

               lda Line_X
               clc
               adc Delta_X
               sta Line_X
;--
               PushLong #Shape_Rect
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
;--
               pla
               and #$00FF
               sta cou_ligne
               jsr Sauve_buffer

               rts
;--
Maj_ObjectN    ANOP

               PushLong #NumberRect
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
               pla
               stz Only_Text
               rts
;--
Maj_ObjectI    lda 1,s
               and #$00FF
               jsr Rest_Icon
;--
               lda Icon_Y
               clc
               adc Delta_Y
               sta Icon_Y

               lda Icon_X
               clc
               adc Delta_X
               sta Icon_X
;--
               pla
               and #$00FF
               jsr Copie_Icon

               stz Only_text

               rts
;--
Maj_ObjectK    lda 1,s
               and #$00FF
               jsr Rest_Sticker
;--
               ldy #Sticker_Y
               lda [Ptr_BufStick],y
               clc
               adc Delta_Y
               sta [Ptr_BufStick],y

               ldy #Sticker_X
               lda [Ptr_BufStick],y
               clc
               adc Delta_X
               sta [Ptr_BufStick],y
;--
               pla
               and #$00FF
               jsr Copie_Sticker

               stz Only_Text

               rts
;--
Maj_ObjectG    lda 1,s
               and #$00FF
               jsr Rest_Graph
;--
               PushLong #GraphRect
               PushWord Delta_X
               PushWord Delta_Y
               _OffSetRect
;--
               pla
               and #$00FF
               jsr Copie_Graph

               stz Only_Text

               rts

               END
;...............................................................
;
;        INV_FANTOME : INVERSE SELECTION
;
;...............................................................
INV_FANTOME    START
               Using GlobalData

               PushWord #15             |Couleur Blanche
               _SetSolidPenPat

               PushWord #2              |en Xor
               _SetPenMode
;--
               lda Nb_List_Select       |CADRE DE GROUPE SELECT
               cmp #1
               beq saute

               PushLong #Pat1           |Pattern
               _SetPenPat

               PushLong #Rect_SelectF
               _FrameRect
;--
Saute          jsr Xor_Shape11          |Fantome de l'objet

               rts

               END
;...............................................................
;
;        Set_Rect_move : Rectangle objet Pointe
;
;...............................................................
Set_Rect_Move  START
               Using GlobalData

               lda Which_Select
               cmp #1
               beq LineR                /** une ligne **/
               cmp #2
               beq ShapeR               /** une shape **/
               cmp #3
               beq IconR                /** une icone **/
               cmp #4
               beq NumberR              /** frame number **/
               cmp #5
               beq GraphR               /** un graph **/
               cmp #6
               beq StickerR             /** un sticker **/
               rts
;--
ShapeR         ldy #6
Loop1          lda Shape_Rect,y
               sta RectShape,y
               dey
               dey
               bpl Loop1
               rts
;--
LineR          ldy #6
Loop2          lda Rect2,y
               sta RectShape,y
               dey
               dey
               bpl Loop2

Shapetype1     lda #1
               sta Shape_Type
               rts
;--
IconR          ldy #6
Loop3          lda Rect_Icone,y
               sta RectShape,y
               dey
               dey
               bpl Loop3

               bra Shapetype1
;--
NumberR        ldy #6
Loop4          lda NumberRect,y
               sta RectShape,y
               dey
               dey
               bpl Loop4
               bra Shapetype1
;--
GraphR         ldy #6
Loop5          lda GraphRect,y
               sta RectShape,y
               dey
               dey
               bpl Loop5
               bra ShapeType1
;--
StickerR       ldy #6
Loop6          lda Rect_Stick,y
               sta RectShape,y
               dey
               dey
               bpl Loop6
               bra Shapetype1

               END
;...............................................................
;
;        Selection : Selection d'un OBJET QUELCONQUE
;
;...............................................................
Selection      START
               Using GlobalData

               stz Which_select

               stz Top_size             |pas de sizing par option
;--
               stz Top_Objet_S
               jsr Already_Select       |si select alors priorite
;--
               lda Top_Objet_S
               beq NoAlready

               lda Type_Objet_s
               asl a
               tax

               lda Number_Objet_S
               jsr (tableAlready,x)
               rts
;--
NoAlready      jsr Test_In_Number       |in Frame Number
               bcc S0selection
               brl Ok_Number

S0selection    jsr Test_In_Line         |in ligne ? -> zligne
               bcc S1selection
               brl Ok_Line

S1selection    jsr Test_In_Icon         |in icon ?
               bcc S2selection
               brl Ok_Icon

S2selection    jsr Test_In_Sticker      |in Sticker ?
               bcc S3selection
               brl Ok_Sticker

S3selection    jsr Test_In_Graph        |In Graph
               bcc S4selection
               brl Ok_Graph

S4selection    jsr Test_In_Shape        |in Shape ?
               bcs Ok_Shape

               clc
               rts
;--
TableAlready   ANOP
               dc i'Ok_Number'
               dc i'Ok_Line'
               dc i'Ok_Icon'
               dc i'Ok_Graph'
               dc i'Ok_Shape'
               dc i'Ok_Sticker'
;--
               _Sysbeep
;------------------------------------------------------------------
;        ------------ select a OBJECT -----------------
;------------------------------------------------------------------
Ok_Shape       ANOP

               ora #$0100
               pha
               jsr In_List              |dans la selection groupe
               bcs S_Yes_In_List
;--
S_Not_In_List  jsr Un_Select            |Deselection des anciens

               lda 1,s                  |en derniere position
               and #$00FF
               jsr Shape_Last

               pla                      |valeur devenue inutile
               lda Frame_Shape
               sta Shape_Select
               ora #$0100
               jsr Put_In_List          |Selection dans la liste
;--
               lda Frame_Shape
               jsr Rest_shape
;--
               lda #1                   |SIZING
               sta Top_size
               jsr Copy_RectS
               bra Ssuite
;--
S_Yes_In_List  pla
               and #$00FF
               jsr Rest_shape
               lda #2
               sta Which_select
;--
               lda Nb_List_Select
               cmp #2
               bcs Ssuite
               lda List_Select
               and #$00FF
               sta Shape_Select
               lda #1
               sta Top_size
;--
Ssuite         jsr MoveSize_Shape       |et on Bouge OU on Size

               sec
               rts
;------------------------------------------------------------------
;        ------------ select a Graph  -----------------
;------------------------------------------------------------------
Ok_Graph       ANOP

               ora #$0400
               pha
               jsr In_List              |dans la selection groupe
               bcs G_Yes_In_List
;--
G_Not_In_List  jsr Un_Select            |Deselection des anciens

               lda 1,s                  |en derniere position
               and #$00FF
               jsr Graph_Last

               pla                      |valeur devenue inutile
               lda Frame_Graph
               sta Graph_Select
               ora #$0400
               jsr Put_In_List          |Selection dans la liste
;--
               lda Frame_Graph
               jsr Rest_Graph
;--
               lda #1                   |SIZING
               sta Top_size
               jsr Copy_RectG
               bra Gsuite
;--
G_Yes_In_List  pla
               and #$00FF
               jsr Rest_Graph
;--
               lda Nb_List_Select
               cmp #2
               bcs Gsuite
               lda List_Select
               and #$00FF
               sta Graph_Select
               lda #1
               sta Top_size
               jsr Copy_rectG
;--
Gsuite         lda #5
               sta Which_select
               jsr MoveSize_Shape       |et on Bouge OU on Size

               sec
               rts
;------------------------------------------------------------------
;   ------------- select d'une ligne de texte -----------------
;------------------------------------------------------------------
Ok_Line        ANOP
               lda zligne
               pha
               jsr In_List              |Deja Dans une Selection Groupe
               bcs L_Yes_In_list
;--
L_Not_In_List  jsr Un_Select            |Deselection des ANCIENS

               lda 1,s                  |ligne en derniere position
               sta zligne
               jsr Ligne_move

               pla
               lda Frame_line
               dec a
               sta Line_Select
               sta cou_ligne
               sta zligne
               jsr Rest_buffer

               inc top_sauvegarde

               lda Line_Select
               jsr Put_In_List
               jsr cal_Rect2
               jsr Copy_RectL
               bra Lsuite
;--
L_Yes_In_list  pla
               sta Cou_ligne
               jsr Rest_buffer
               jsr Cal_Rect2
               lda List_Select
               and #$00FF
               sta Line_Select
;--
Lsuite         lda #1
               sta Which_select
               jsr MoveSize_Shape       |Deplacement

               sec
               rts
;------------------------------------------------------------------
;        ------------ selection d'une Icone ---------------
;------------------------------------------------------------------
Ok_Icon        ENTRY

               ora #$0200               |une icone
               pha
               jsr In_List              |dans la selection groupe
               bcs I_Yes_In_List
;--
I_Not_In_List  jsr Un_Select            |Deselection des anciens

               lda 1,s                  |en derniere position
               and #$00FF
               jsr Icon_Last

               pla                      |valeur devenue inutile
               lda Frame_Icon
               sta Icon_Select
               ora #$0200
               jsr Put_In_List          |Selection dans la liste
;--
               lda Frame_Icon
               jsr Rest_Icon
               jsr Cal_RectIcon
               jsr Copy_RectI
;--
               bra Isuite
;--
I_Yes_In_List  pla
               and #$00FF
               jsr Rest_Icon
               jsr Cal_RectIcon
               lda List_Select
               and #$00FF
               sta Icon_Select
;--
Isuite         ANOP
               lda #3
               sta Which_select

               jsr MoveSize_Shape       |et on Bouge OU on Size

               sec
               rts
;------------------------------------------------------------------
;        ------------ selection d'un Sticker --------------
;------------------------------------------------------------------
Ok_Sticker     ENTRY

               ora #$0500               |un sticker
               pha
               jsr In_List              |dans la selection groupe
               bcs K_Yes_In_List
;--
K_Not_In_List  jsr Un_Select            |Deselection des anciens

               lda 1,s                  |en derniere position
               and #$00FF
               jsr Sticker_Last

               pla                      |valeur devenue inutile
               lda Frame_Sticker
               sta Sticker_Select
               ora #$0500
               jsr Put_In_List          |Selection dans la liste
;--
               lda Frame_Sticker
               jsr Rest_Sticker
               jsr Cal_RectSticker
               jsr Copy_RectK
;--
               bra Ksuite
;--
K_Yes_In_List  pla
               and #$00FF
               jsr Rest_Sticker
               jsr Cal_RectSticker
               lda List_Select
               and #$00FF
               sta Sticker_Select
;--
Ksuite         ANOP
               lda #6
               sta Which_select

               jsr MoveSize_Shape       |et on Bouge OU on Size

               sec
               rts
;------------------------------------------------------------------
;   ------------- select du Frame Number      -----------------
;------------------------------------------------------------------
Ok_Number      ANOP
               ora #$0300
               pha
               jsr In_List              |Deja Dans une Selection Groupe
               bcs N_Yes_In_list
;--
N_Not_In_List  jsr Un_Select            |Deselection des ANCIENS

               pla
               jsr Put_In_List
               jsr Copy_RectN
               bra Nsuite
;--
N_Yes_In_list  pla
;--
Nsuite         lda #4
               sta Which_select
               jsr MoveSize_Shape       |Deplacement

               sec
               rts

               END
;...............................................................
;
;        Already_Select : si Select alors click PRIORITAIRE
;
;...............................................................
Already_Select START
               Using GlobalData

               lda #8
               sta Ch_Group
               jsr Change_Groupe

               rts

               END
;...............................................................
;
;        Put_In_List : Selection dans la liste
;
;...............................................................
Put_In_list    START
               Using GlobalData

               ldy #2
               sta List_Record,y

               lda #1
               sta Nb_List_Select

               rts

               END
;...............................................................
;
;        In_List : selection deja dans une selection de groupe ?
;
;...............................................................
In_List        START
               Using GlobalData

               ldx Nb_List_Select
               bne ok
non            clc
               rts
;--
ok             sta TempoData

Loop           txa
               asl a
               tay
               lda List_Record,y
               cmp TempoData
               beq trouve

               dex
               bne Loop
               bra non
;--
trouve         sec
               rts

TempoData      ds 2

               END
;...............................................................
;
;        Copy_Rect : rectangle selection dans rectangle globale
;
;...............................................................
Copy_Rect      START
               Using GlobalData
;--
Copy_RectL     ENTRY

               ldy #6
RCopy_RectL    lda Rect2,y
               sta Rect_SelectF,y
               dey
               dey
               bpl RCopy_RectL
;--
ShapeType1     lda #1
               sta Shape_Type
               rts
;--
Copy_RectI     ENTRY

               ldy #6
RCopy_RectI    lda Rect_Icone,y
               sta Rect_SelectF,y
               dey
               dey
               bpl RCopy_RectI
               bra ShapeType1
;--
Copy_RectK     ENTRY

               ldy #6
RCopy_RectK    lda Rect_Stick,y
               sta Rect_SelectF,y
               dey
               dey
               bpl RCopy_RectK
               bra ShapeType1
;--
Copy_RectS     ENTRY

               ldy #6
RCopy_RectS    lda Shape_Rect,y
               sta Rect_SelectF,y
               dey
               dey
               bpl RCopy_rectS
               rts
;--
Copy_RectN     ENTRY

               ldy #6
RCopy_RectN    lda NumberRect,y
               sta Rect_SelectF,y
               dey
               dey
               bpl RCopy_RectN

               bra ShapeType1
;--
Copy_RectG     ENTRY

               ldy #6
RCopy_RectG    lda GraphRect,y
               sta Rect_SelectF,y
               sta Shape_Rect,y         |pour les poignees
               dey
               dey
               bpl RCopy_RectG

               bra ShapeType1

               END
;...............................................................
;
;        Set_Shift_Key : top si shift
;
;...............................................................
Set_Shift_Key  START
               Using GlobalData

               stz Top_shift

               lda EventModifiers       |si SHIFT Set top_shift
               and #$0100
               beq Fin

               inc Top_shift

fin            rts

               END
;...............................................................
;
;        TRT_SHIFT_KEY : SI SHIFT KEY FORME SYMETRIQUE
;
;...............................................................
TRT_SHIFT_KEY  START
               Using GlobalData

               lda Top_Shift
               bne ok
               rts
;--
ok             ANOP
               lda MouseX
               sec
               sbc X_Org
               sta zdep_x
               sta dep_x
               bpl s
               eor #$FFFF
               inc a
               sta dep_x

s              lda MouseY
               sec
               sbc Y_org
               sta zdep_y
               sta dep_Y
               bpl s1
               eor #$FFFF
               inc a
               sta dep_y
;--
s1             PushLong #0              |applique le ratio 10/9
               PushWord dep_Y
               PushWord #21
               _Multiply
               pla
               plx

               PushLong #0
               Pha
               PushWord #17
               _UDivide
               pla
               plx
               sta z1dep_y
;--
               PushLong #0              |applique le ratio 10/9
               PushWord dep_X
               PushWord #17
               _Multiply
               pla
               plx

               PushLong #0
               Pha
               PushWord #21
               _UDivide
               pla
               plx
               sta z1dep_x
;---------
               lda Shape_type
               bne s2
;--
               lda dep_y
               sta z1dep_y
               lda dep_x
               sta z1dep_x
;--
               lda dep_x
               cmp #10
               bcs s11
               lda X_Org
               sta MouseX
               bra fin
s11            lda dep_y
               cmp #10
               bcs s2
               lda Y_org
               sta MouseY
               bra fin
;--
s2             lda dep_x
               cmp z1dep_y
               bcc Xinf
;--
Yinf           lda zdep_x
               bpl sYinf

               lda X_org
               sec
               sbc z1dep_y
               sta MouseX
               rts

SYinf          lda X_org
               clc
               adc z1dep_y
               sta MouseX
fin            rts
;--
Xinf           lda zdep_y
               bpl sXinf

               lda Y_org
               sec
               sbc z1dep_x
               sta MouseY
               rts

SXinf          lda Y_org
               clc
               adc z1dep_x
               sta MouseY
               rts
;--
dep_y          ds 2
dep_x          ds 2
zdep_y         ds 2
zdep_x         ds 2
z1dep_y        ds 2                     |avec ratio
z1dep_x        ds 2                     |avec ratio

               END
;...............................................................
;
;        Menu_On_Off : if object ON or OFF-> MENU Change
;
;...............................................................
Menu_On_Off    START
               Using GlobalData
               Using WindowData
;--
               stz FlipOnOff
               stz Cut_actif

               PushWord #267            |cut
               _DisableMItem

               PushWord #268            |copy
               _DisableMItem

               PushWord #275            |Flip V
               _DisableMItem

               PushWord #276            |Flip H
               _DisableMItem

               PushWord #280            |shadow
               _DisableMItem
;--
               jsr Paste_On_Off         |paste ok ou non
;--
               lda Nb_List_Select
               bne ok
               jsr Set_Option_Flip
               jsr Set_Option_Cut
               rts

ok             lda Nb_List_Select
;--
Loop           Pha
               asl a
               tay
;--
               lda List_Record,y
               pha
               and #$FF00
               xba
               beq MenuOn1              |text
               cmp #1
               beq MenuOn0              |shape
               cmp #2
               beq MenuOn               |icon
               cmp #4
               beq MenuOn0              |graph
               cmp #5
               beq MenuOn
               pla
               bra suite
;--
MenuOn0        PushWord #280            |Shadow for graph shape
               _EnableMItem
;--
MenuOn         pla
               PushWord #275            |Flip V
               _EnableMItem

               PushWord #276            |Flip H
               _EnableMItem

               lda #1
               sta FlipOnOff
               bra MenuOn11
;--
MenuOn1        pla
;--
MenuOn11       PushWord #267            |cut
               _EnableMItem

               PushWord #268            |copy
               _EnableMItem

               lda #1
               sta Cut_Actif
;--
suite          pla
               dec a
               bne Loop

               jsr Set_Option_Flip

               jsr Set_Option_Cut

               rts
;--------------------------------------
;        Paste_on_off
;--------------------------------------
Paste_on_off   ANOP
               lda Top_Paste
               beq koPaste
;--------------------------------------
OkPaste        PushWord #269
               _EnableMItem
               rts
KoPaste        PushWord #269
               _DisableMItem
               rts
;--------------------------------------
;        Set_Option_Cut
;--------------------------------------
Set_Option_Cut ENTRY

               lda Cut_actif
               beq SOC_Off
;--------------------------------------
SOC_ON         PushLong #0              |ok dans le cartouche
               _GetPort

               PushLong Ptr_OptionW
               _SetPort

               jsr D_Hdl_PPI_Opt        |Deref Hdl

               lda #27
               sta SrcRecty0
               lda #19
               sta SrcRectx0
               lda #39
               sta SrcRecty1
               lda #36
               sta SrcRectx1

               PushLong #LocInfo_Option |Bitmap Option
               PushLong #SrcRect        |rectangle a copier
               PushWord #20             |destX
               PushWord #28             |destY
               PushWord #0
               _PPtoPort

               jsr U_Hdl_PPI_OPT        |Unlock Hdl

               _SetPort

               rts
;--------------------------------------
SOC_OFF        PushLong #0              |griser dans le cartouche
               _GetPort

               Pushlong Ptr_OptionW
               _SetPort

               PushLong #Patgrise
               _SetPenPat

               PushWord #$0001          |notBIC
               _SetPenMode

               PushLong #RectCut
               _PaintRect

               _PenNormal

               _SetPort

               rts

Cut_actif      dc i'0'

               END

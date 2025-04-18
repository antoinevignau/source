;------------------------------------------------------------------
;
; FILE : SHOWCCP.S                      -Cut/Copy/Paste-
;        ---------
;
;------------------------------------------------------------------
;...............................................................
;
;        DoCCP : Segment De Cut Copy Paste
;
;...............................................................
DoCCP          START
               Using GlobalData
               Using Windowdata
;...............................................................
;
;        DoCut : Couper la Selection
;
;...............................................................
DoCut          ENTRY
;--
               lda Nb_List_Select
               bne OkSDoCut
               rts
;--
OkSDoCut       PushLong #0
               _GetPort

;              jsr InvCut

               jsr Taille_CCP
               bcs NoCut

               lda #1
               sta Mode_CCP

               lda #0
               sta Deplace_XY

               jsr Put_In_CCP
               bcc NoCut

               jsr Del_To_Cut           |oter de la liste

               lda #1                   |Paste On
               sta Top_Paste
               PushWord #269
               _EnableMItem

               jsr Copy_CCP_Rect        |copy le rect de select
               jsr InvCut
               jsr Raz_Select           |enleve les objets
               jsr Menu_on_Off
               jsr Del_Undo
               jsr Cop_rgn1_shape
               jsr Aff_ShapeS

               lda  #1
               sta Top_Action
               _SetPort
               rts

NoCut          ANOP
               jsr InvCut
               _SetPort
               rts
;--------------------------------------
InvCut         ANOP
               PushLong #0
               _GetPort

               lda #0
               sta Choix_Option
               jsr In_Option1

;              PushLong Ptr_OptionW
;              _SetPort
;
;              PushLong #RectCut
;              _InvertRect
;
               _SetPort

               rts
;...............................................................
;
;        DoCopy : Copier la Selection
;
;...............................................................
DoCopy         ENTRY
               jsr Taille_CCP
               bcs NoCopy

               lda #2
               sta Mode_CCP

               lda #0
               sta Deplace_XY

               jsr Put_In_CCP
               bcc NoCopy

               jsr Copy_CCP_Rect        |copy le rect de select

               lda #1                   |Paste On
               sta Top_Paste
               PushWord #269
               _EnableMItem

               jsr Del_Undo

NoCopy         rts
;...............................................................
;
;        DoPaste : Coller la Selection Coupee
;
;...............................................................
DoPaste        ENTRY
               lda #0
               sta Mode_CCP

               jsr Un_Select

               lda #0
               sta Nb_List_select
;--
               jsr Chg_CCP_Rect         |decalage bas droit
;--
               jsr Put_In_CCP
               bcc FDoPaste
               jsr Swap_List_Select     |pour un autre cut correct

               ldy #6
RDoPaste       lda RectF_CCP,y
               sta Rect_SelectF,y
               dey
               dey
               bpl RDoPaste

               jsr Cop_rgn1_shape
               jsr Aff_ShapeS
               lda  #1
               sta Top_Action

FDoPaste       ANOP
               jsr Menu_on_Off
               jsr Del_Undo
               rts
;...............................................................
;
;   Taille_CCP : test buffer de ccp possible ou non
;
;...............................................................
Taille_CCP     ENTRY
;--
               lda Taille_B_CCP         |Sauvegarde
               sta Sauve_TB_CCP
;--
               lda #0
               sta Taille_B_CCP
;--
               lda Nb_List_Select
               bne okTCCP
               jsr Del_CCP              |Reduit a rien donc no paste
               sec                      |il y a comme un defaut la
               rts
;--
okTCCP         ANOP

LoopTCCP       pha
               asl a
               tay
               lda List_Record,y
               jsr Taille_Elt_CCP
               pla
               dec a
               bne LoopTCCP
;--
               lda Taille_B_CCP
               jsr Resize_CCP
               bcc well
;--
PbCCP          jsr Alert_CCP
               lda Sauve_TB_CCP         |garde l'ancien buffer de CCP
               jsr Resize_CCP
               sec
               rts
;--
well           jsr Copy_List_CCP        |copier liste dans CCP liste
               clc
               rts
;--------------------------------------
;        Taille_Elt_CCP
;--------------------------------------
Taille_Elt_CCP ANOP
               and #$FF00
               xba
               asl a
               tax
               jsr (Taille_CCP_Elt,x)
               clc
               adc Taille_B_CCP
               sta Taille_B_CCP
               rts
;--
T_CCP_texte    ANOP
               lda #T_C_Texte
               rts
T_CCP_Shape    ANOP
               lda #T_C_Shape
               rts
T_CCP_Icon     ANOP
               lda #T_C_Icon
               rts
T_CCP_Number   ANOP
               lda #0                   |#T_C_Number
               rts
T_CCP_Graph    ANOP
               lda #T_C_Graph
               rts
T_CCP_Sticker  ANOP
               lda #T_C_Sticker
               rts
;...............................................................
;
;   Put_In_CCP : Copy element
;
;...............................................................
Put_In_CCP     ENTRY
;--
SPIL           lda Nb_Elt_CCP
               bne OkPIL
               clc
               rts
;--
OkPIL          ANOP
               lda #0                   |debut du buffer
               sta Indice_CCP

               lda Nb_Elt_CCP
LoopPIL        pha
               asl a
               tay
               lda CCP_Record,y
               jsr PIL_Elt
               bcs Arg_Room
               pla
               dec a
               bne LoopPIL
               sec
               rts
Arg_room       pla
               clc
               rts
;--------------------------------------
;        Copy_Elt
;--------------------------------------
PIL_Elt        ENTRY
               pha
               and #$FF00
               xba
               asl a
               tax
               pla
               jsr (Table_CCP_Elt,x)
               rts
;--------------------------------------
CCP_texte      ANOP
               ldx Mode_CCP
               bne SCCP_texte
               inc Frame_Line           |paste +1
               jsr Resize_Line
               bcs NCCP_texte
               lda Frame_Line
               dec a
SCCP_texte     jsr Swap_C_texte
               rts
NCCP_texte     dec Frame_Line           |enleve si impossible
               jsr Resize_Line
               jsr Alert_CCP            |not enough memory
               sec
               rts
;--------------------------------------
CCP_Shape      ANOP
               ldx Mode_CCP
               bne SCCP_Shape
               inc Frame_Shape          |paste +1
               jsr Resize_Shape
               bcs NCCP_Shape
               lda Frame_Shape
SCCP_Shape     jsr Swap_C_Shape
               rts
NCCP_Shape     dec Frame_Shape          |enleve si impossible
               jsr Resize_shape
               jsr Alert_CCP            |not enough memory
               sec
               rts
;--------------------------------------
CCP_Icon       ANOP
               ldx Mode_CCP
               bne SCCP_Icon
               inc Frame_Icon           |paste +1
               jsr Resize_Icon
               bcs NCCP_Icon
               lda Frame_Icon
SCCP_Icon      jsr Swap_C_Icon
               rts
NCCP_Icon      dec Frame_Icon           |enleve si impossible
               jsr Resize_Icon
               jsr Alert_CCP            |not enough memory
               sec
               rts
;--------------------------------------
CCP_Sticker    ANOP
               ldx Mode_CCP
               bne SCCP_Sticker
               inc Frame_Sticker        |paste +1
               jsr Resize_Sticker
               bcs NCCP_Sticker
               lda Frame_Sticker
SCCP_Sticker   jsr Swap_C_Sticker
               rts
NCCP_Sticker   dec Frame_Sticker        |enleve si impossible
               jsr Resize_Sticker
               jsr Alert_CCP            |not enough memory
               sec
               rts
;--------------------------------------
CCP_Number     ANOP
               rts
;--------------------------------------
CCP_Graph      ANOP
               ldx Mode_CCP
               bne SCCP_Graph
               inc Frame_Graph          |paste +1
               jsr Resize_Graph
               bcs NCCP_Graph
               lda Frame_Graph
SCCP_Graph     jsr Swap_C_Graph
               rts
NCCP_Graph     dec Frame_Graph          |enleve si impossible
               jsr Resize_Graph
               jsr Alert_CCP            |not enough memory
               sec
               rts
;...............................................................
;
;    Swap_C_texte:
;
;...............................................................
Swap_C_texte  ENTRY
;--
               pha
               jsr D_Hdl_Line           |Deref
               jsr D_Hdl_CCP
               pla
               and #$00FF
               sta Num_CCP_elt

               PushLong #0
               Pha                      |n% de line
               PushWord lg_LineRecord   |taille d'1 line
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_CCP
               sta Pt_CCP

               ldx #T_C_Texte
               dex
               dex
;--
               lda Mode_CCP
               beq Loop_SCT1
;--
LOOP_SCT0      ldy Pt_Buffer            |Cut Copy
               lda [Ptr_Line],y
               ldy Pt_CCP
               sta [Ptr_CCP],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCT0
               brl S_SCT
;--
LOOP_SCT1      ANOP
;--
               lda OkDeplace
               beq LOOP_SCT10
;--
               ldy Pt_CCP               |decalage
               lda [Ptr_CCP],y          |line_x + 2
               clc
               adc #2
               sta [Ptr_CCP],y
               iny
               iny
               lda [Ptr_CCP],y          |line_y + 2
               clc
               adc #2
               sta [Ptr_CCP],y
;--
LOOP_SCT10     ldy Pt_CCP               |Paste
               lda [Ptr_CCP],y
               ldy Pt_Buffer
               sta [Ptr_Line],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCT10

               inc Nb_List_Select
               lda Nb_List_Select
               asl a
               tax
               lda Frame_Line
               dec a
               sta Nb_List_select,x
;--
S_SCT          lda Indice_CCP
               clc
               adc #T_C_Texte
               sta Indice_CCP

               jsr U_Hdl_Line           |libere
               jsr U_Hdl_CCP            |libere

               rts
;...............................................................
;
;    Swap_C_Shape :
;
;...............................................................
Swap_C_Shape   ENTRY
;--
               pha
               jsr D_Hdl_Shape          |Deref
               jsr D_Hdl_CCP
               pla
               and #$00FF
               sta Num_CCP_elt
               dec a

               PushLong #0
               Pha                      |n% de Shape
               PushWord lg_ShapeRecord  |taille d'1 Shape
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_CCP
               sta Pt_CCP

               ldx #T_C_Shape
               dex
               dex
;--
               lda Mode_CCP
               beq Loop_SUS1
;--
LOOP_SUS0      ldy Pt_Buffer            |Cut Copy
               lda [Ptr_Shape],y
               ldy Pt_CCP
               sta [Ptr_CCP],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SUS0
               brl S_SUS
;--
LOOP_SUS1      ANOP
               lda OkDeplace
               bne SLP_SUS1
               brl LOOP_SUS10
;--
SLP_SUS1       phx

               lda Pt_CCP               |decalage
               clc
               adc #10
               tay
;-
               lda [Ptr_CCP],y          |debuty + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
               iny
               iny
               lda [Ptr_CCP],y          |debutx + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
               iny
               iny
               lda [Ptr_CCP],y          |finy   + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
               iny
               iny
               lda [Ptr_CCP],y          |finx   + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
;--
               stz PlusDeplace
               stz PlusDeplace+2
               lda Pt_CCP               |adresse du rectangle shape
               clc
               adc #2
               sta PlusDeplace
               lda PlusDeplace+2
               adc #0
               sta PlusDeplace+2
;
               lda Ptr_CCP
               clc
               adc PlusDeplace
               tay
               lda Ptr_CCP+2
               adc PlusDeplace+2
               pha
               phy
;--
               PushWord #2
               PushWord #2
               _OffSetRect

               plx
;--
LOOP_SUS10     ldy Pt_CCP               |Paste
               lda [Ptr_CCP],y
               ldy Pt_Buffer
               sta [Ptr_Shape],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SUS10

               inc Nb_List_Select
               lda Nb_List_Select
               asl a
               tax
               lda Frame_Shape
               ora #$0100
               sta Nb_List_select,x
;--
S_SUS          lda Indice_CCP
               clc
               adc #T_C_Shape
               sta Indice_CCP

               jsr U_Hdl_Shape          |libere
               jsr U_Hdl_CCP            |libere

               rts
;...............................................................
;
;    Swap_C_Icon :
;
;...............................................................
Swap_C_Icon   ENTRY
;--
               pha
               jsr D_Hdl_BIcon          |Deref
               jsr D_Hdl_CCP
               pla
               and #$00FF
               sta Num_CCP_elt
               dec a

               PushLong #0
               Pha                      |n% de Icon
               PushWord lg_IconRecord   |taille d'1 Icon
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_CCP
               sta Pt_CCP

               ldx #T_C_Icon
               dex
               dex
;--
               lda Mode_CCP
               beq Loop_SCI1
;--
LOOP_SCI0      ldy Pt_Buffer            |Cut Copy
               lda [Ptr_BIcon],y
               ldy Pt_CCP
               sta [Ptr_CCP],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCI0
               brl S_SCI
;--
LOOP_SCI1      ANOP
;--
               lda OkDeplace
               beq LOOP_SCI10
;--
               ldy Pt_CCP               |decalage
               lda [Ptr_CCP],y          |line_x + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
               iny
               iny
               lda [Ptr_CCP],y          |line_y + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
;--
LOOP_SCI10     ldy Pt_CCP               |Paste
               lda [Ptr_CCP],y
               ldy Pt_Buffer
               sta [Ptr_BIcon],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCI10

               inc Nb_List_Select
               lda Nb_List_Select
               asl a
               tax
               lda Frame_Icon
               ora #$0200
               sta Nb_List_select,x
;--
S_SCI          lda Indice_CCP
               clc
               adc #T_C_Icon
               sta Indice_CCP

               jsr U_Hdl_BIcon          |libere
               jsr U_Hdl_CCP            |libere

               rts
;...............................................................
;
;    Swap_C_Sticker :
;
;...............................................................
Swap_C_Sticker ENTRY
;--
               pha
               jsr D_Hdl_Sticker        |Deref
               jsr D_Hdl_CCP
               pla
               and #$00FF
               sta Num_CCP_elt
               dec a

               PushLong #0
               Pha                         |n% de Sticker
               PushWord lg_StickerRecord   |taille d'1 Sticker
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_CCP
               sta Pt_CCP

               ldx #T_C_Sticker
               dex
               dex
;--
               lda Mode_CCP
               beq Loop_SCK1
;--
LOOP_SCK0      ldy Pt_Buffer            |Cut Copy
               lda [Ptr_Sticker],y
               ldy Pt_CCP
               sta [Ptr_CCP],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCK0
               brl S_SCK
;--
LOOP_SCK1      ANOP
;--
               lda OkDeplace
               beq LOOP_SCK10
;--
               ldy Pt_CCP               |decalage
               lda [Ptr_CCP],y          |line_x + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
               iny
               iny
               lda [Ptr_CCP],y          |line_y + deplace
               clc
               adc #2
               sta [Ptr_CCP],y
;--
LOOP_SCK10     ldy Pt_CCP               |Paste
               lda [Ptr_CCP],y
               ldy Pt_Buffer
               sta [Ptr_Sticker],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCK10

               inc Nb_List_Select
               lda Nb_List_Select
               asl a
               tax
               lda Frame_Sticker
               ora #$0500
               sta Nb_List_select,x
;--
S_SCK          lda Indice_CCP
               clc
               adc #T_C_Sticker
               sta Indice_CCP

               jsr U_Hdl_Sticker        |libere
               jsr U_Hdl_CCP            |libere

               rts
;...............................................................
;
;    Swap_C_Graph :
;
;...............................................................
Swap_C_Graph   ENTRY
;--
               pha
               jsr D_Hdl_Graph          |Deref
               jsr D_Hdl_CCP
               pla
               and #$00FF
               sta Num_CCP_elt
               dec a

               PushLong #0
               Pha                      |n% de Graph
               PushWord lg_GraphRecord  |taille d'1 Graph
               _Multiply
               pla
               plx
               sta Pt_buffer

               lda Indice_CCP
               sta Pt_CCP

               ldx #T_C_Graph
               dex
               dex
;--
               lda Mode_CCP
               beq Loop_SCG1
;--
LOOP_SCG0      ldy Pt_Buffer            |Cut Copy
               lda [Ptr_Graph],y
               ldy Pt_CCP
               sta [Ptr_CCP],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCG0
               bra S_SCG
;--
LOOP_SCG1      ANOP
;--
               lda OkDeplace
               beq LOOP_SCG10
;--                                     |PASTE AVEC DECALAGE
               phx

               lda Pt_CCP               |adresse du rectangle graph
               clc
               adc Ptr_CCP
               tay
               lda Ptr_CCP+2
               adc #0
               pha
               phy
               PushWord #2
               PushWord #2
               _OffSetRect

               plx
;--
LOOP_SCG10     ldy Pt_CCP               |Paste
               lda [Ptr_CCP],y
               ldy Pt_Buffer
               sta [Ptr_Graph],y
               inc Pt_Buffer
               inc Pt_Buffer
               inc Pt_CCP
               inc Pt_CCP
               dex
               dex
               bpl LOOP_SCG10

               inc Nb_List_Select
               lda Nb_List_Select
               asl a
               tax
               lda Frame_Graph
               ora #$0400
               sta Nb_List_select,x
;--
S_SCG          lda Indice_CCP
               clc
               adc #T_C_Graph
               sta Indice_CCP

               jsr U_Hdl_Graph          |libere
               jsr U_Hdl_CCP            |libere

               rts
;...............................................................
;
;        Alert_CCP : pb sur le copy ou paste
;
;...............................................................
Alert_CCP      ENTRY

               lda #Txt_CCP             |Can't Copy Paste
               sta ItemAp2tx
               lda #^Txt_CCP
               sta ItemAp2tx+2

               lda #Txt_CCP1
               sta ItemAp3tx
               lda #^Txt_CCP1
               sta ItemAp3tx+2

               jsr Ok_Alert
               _InitCursor

               rts
;--
Resize_CCP     ENTRY
               Pea $0000
               pha
               PushLong Hdl_CCP
               _SetHandleSize
               rts
;--
Del_CCP        ENTRY
               lda #0
               sta Taille_B_CCP
               lda #1
               jsr Resize_CCP
               PushWord #269            |No Paste
               _DisableMItem
               rts
;--
Copy_List_CCP  ENTRY

               lda Nb_List_Select
               asl a
               tax
RCLC           lda List_record,x
               sta CCP_Record,x
               dex
               dex
               bpl RCLC
;--
Copy_CCP_Rect  ENTRY
               ldy #6
RCCR           lda Rect_SelectF,y
               sta RectF_CCP,y
               dey
               dey
               bpl RCCR
               rts
;--
Del_To_Cut     ENTRY                    |delete les elements On
;--
               lda Nb_List_Select
               bne okDTC
               rts
;-
okDTC          ANOP
               lda Nb_List_Select
LoopDTC        pha
               asl a
               tay
               lda List_Record,y
               jsr Del_Cut
               pla
               dec a
               bne LoopDTC
               rts
;--
Del_Cut        ANOP
               pha
               and #$FF00
               xba
               asl a
               tax
               pla
               pha
               jsr (tab_del_Cut,x)
               pla
               bcs NoMCS
               jsr Maj_Cut_Select
NoMCS          rts
;--
DC_Texte       ANOP
               and #$00FF
               pha
               sta zligne
               jsr Ligne_move
               dec Frame_Line
               jsr Resize_Line
;--
               pla
               cmp Frame_Line
               rts
;--
DC_Shape       ANOP
               and #$00FF
               pha
               jsr Shape_Last
               dec Frame_Shape
               jsr Resize_Shape
;--
               pla
               dec a
               cmp Frame_Shape
               rts
;--
DC_Icon        ANOP
               and #$00FF
               pha
               jsr Icon_Last
               dec Frame_Icon
               jsr Resize_Icon
;--
               pla
               dec a
               cmp Frame_Icon
               rts
;--
DC_Sticker     ANOP
               and #$00FF
               pha
               jsr Sticker_Last
               dec Frame_Sticker
               jsr Resize_Sticker
;--
               pla
               dec a
               cmp Frame_Sticker
               rts
;--
DC_Number      ANOP
               rts
;--
DC_Graph       ANOP
               and #$00FF
               pha
               jsr Graph_Last
               dec Frame_Graph
               jsr Resize_Graph
;--
               pla
               dec a
               cmp Frame_Graph
               rts
;--------------------------------------
;        CHG_CCP_RECT
;--------------------------------------
CHG_CCP_RECT   ENTRY
;--
               lda #0
               sta OkDeplace
;--
               ldy #6                   |copy rectF dans rect de travail
r0_CCR         lda RectF_CCP,y
               sta RectF_CCP2,y
               dey
               dey
               bpl r0_CCR
;--
               PushLong #RectF_CCP2     |deplace d'un offset
               PushWord #2
               PushWord #2
               _OffSetRect
;--
               PushWord #0              |toujours dans l'ecran ?
               PushLong #RectF_CCP2
               PushLong #FullRect
               PushLong #RectF_CCP3
               _SectRect
               pla
               beq NotInScreen
;--
               PushWord #0              |pas en dehors ?
               PushLong #RectF_CCP2
               PushLong #RectF_CCP3
               _EqualRect
               pla
               beq NotInScreen
;--
               ldy #6                   |alors deplacement
r1_CCR         lda RectF_CCP2,y
               sta RectF_CCP,y
               dey
               dey
               bpl r1_CCR
;--
               lda #1
               sta OkDeplace
;--
               lda Deplace_XY           |decalage +2 pour le contenu du CUT
               clc                      |and COPY
               adc #2
               sta Deplace_XY
;--
NotInScreen    rts
;--------------------------------------
;        MAJ_CUT_SELECT
;--------------------------------------
Maj_Cut_Select ENTRY
               and #$FF00
               sta Type_Cut

               lda Nb_List_Select
RMAJ_CS        pha
               asl a
               tax
               lda List_Record,x
               and #$FF00
               cmp Type_Cut
               bne SMAJ_Cs
               dec List_Record,x
               bpl SMAJ_CS
               lda Type_Cut             |++++ ATTENTION
               sta List_Record,x
SMAJ_CS        pla
               dec a
               bne RMAJ_CS
               rts
;--------------------------------------
;        Swap_List_Select
;--------------------------------------
Swap_List_Select ENTRY                  |pour le paste revert les postes

               lda Nb_List_Select
               cmp #2
               bcs S_SLS
               rts
;--
S_SLS          Anop
               asl a                    |dernier poste
               tax
               ldy #2                   |1 er poste
               lsr a
               lsr a
               sta Zcpt_Ls              |nb poste / 2
;--
RS_SLS         lda Nb_List_Select,x
               pha
               lda Nb_List_Select,y
               sta Nb_List_Select,x
               pla
               sta Nb_List_Select,y
;--
               dex
               dex
               iny
               iny

               dec ZCpt_Ls
               bne RS_SLS
;--
               rts
;--------------------------------------
;        Des Data
;--------------------------------------
ZCpt_LS        ds 2
;--
Mode_CCP       ds 2                     |0 Cut 1 Copy 2 Paste
;--
Indice_CCP     ds 2                     |rang sur Ptr_CCP
Pt_CCP         ds 2
;--
Taille_B_CCP   dc i'0'                  |taille du buffer CCP
Sauve_TB_CCP   ds 2                     |sauve la taille
Num_CCP_Elt    ds 2                     |numero de l'elt a cut
Type_Cut       ds 2                     |pour delete du cut
;--
Taille_CCP_Elt ANOP
               dc i'T_CCP_texte'
               dc i'T_CCP_shape'
               dc i'T_CCP_Icon'
               dc i'T_CCP_Number'
               dc i'T_CCP_Graph'
               dc i'T_CCP_Sticker'
;--
Table_CCP_Elt  ANOP
               dc i'CCP_texte'
               dc i'CCP_shape'
               dc i'CCP_Icon'
               dc i'CCP_Number'
               dc i'CCP_Graph'
               dc i'CCP_Sticker'
;--
Tab_Del_Cut    ANOP
               dc i'DC_texte'
               dc i'DC_shape'
               dc i'DC_Icon'
               dc i'DC_Number'
               dc i'DC_Graph'
               dc i'DC_Sticker'
;--
T_C_Texte      equ 382
T_C_Shape      equ 26
T_C_Icon       equ 754
T_C_Number     equ 8
T_C_Graph      equ 90
T_C_Sticker    equ 2294
;--
CCP_Record     ANOP                     |100 elements
Nb_Elt_CCP     ds 2
List_CCP       ds 100*2
;--
RectF_CCP      ds 8                     |rect de selection
RectF_CCP2     ds 8
RectF_CCP3     ds 8
OkDeplace      ds 2
Deplace_XY     ds 2
PlusDeplace    ds 4
;--
Txt_CCP        str 'Sorry, not enough memory'
Txt_CCP1       str '   for this operation.'

               END

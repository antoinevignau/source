;...............................................................
;
; FILE : SHOWFENETRE.S                  - Fenetre de SHOWOFF
;        -------------
;...............................................................
;---------------------------------------------------------------
;
; doGoAway : Ferme la fenetre demandee par le TaskManager
;
;---------------------------------------------------------------
DoGoAway       START
               using GlobalDATA

               PushLong TaskData
               _HideWindow

               rts

               END
;---------------------------------------------------------------
;
; DoAbout : Boite de Presentation de SHOWOFF
;
;---------------------------------------------------------------
DoAboutAPP     START
               using GlobalDATA
               using WindowDATA
;--
               jsr Eff_Cursor
;--
               lda #12
               sta SegNumber
               jsr Disk_Present
;--
               JSL DoAbout
               PushWord MyID
               pea 1
               pea 12
               _UnLoadSegNum

               rts

               END
;...............................................................
;
;        DoCallBG
;
;...............................................................
DoCallBG       START
               Using GlobalData
;--
               lda #2
               sta SegNumber
               jsr Disk_Present
;--
               JSL DobackGround
               PushWord MyID
               pea 1
               pea 2
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               rts

               END
;...............................................................
;
;        DoCallCP   : Choose printer
;
;...............................................................
DoCallCP       START
               Using GlobalData
;--
               lda #4
               sta SegNumber
               jsr Disk_Present
;--
               JSL DoChooser
               PushWord MyID
               pea 1
               pea 4
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               rts

               END
;...............................................................
;
;        DoCallPS       : Page Setup
;
;...............................................................
DoCallPS       START
               Using GlobalData
;--
               lda #4
               sta SegNumber
               jsr Disk_Present
;--
               JSL DoDlgSetup
               PushWord MyID
               pea 1
               pea 4
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               rts

               END
;...............................................................
;
;        DoPrint
;
;...............................................................
DoPrint        START
               Using GlobalData

               lda      Mode_Showoff
               cmp      #Mode_Frame
               bne      DoPrint1
               lda      Top_action
               beq      DoPrint1
               jsr      SaveCurFrame
               bcs      DoPrintExit

DoPrint1       ANOP
;--
               lda #4
               sta SegNumber
               jsr Disk_Present
;--
               JSL DoPrintAction
               PushWord MyID
               pea 1
               pea 4
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               lda      Mode_Showoff
               cmp      #Mode_Frame
               bne      DoPrintExit

taratata       jsr      LoadCurFrame
               bcs taratata

DoPrintExit    rts

               END
;...............................................................
;
;        DoCallTS       : Transition
;
;...............................................................
DoCallTS       START
               Using GlobalData
;--
               lda #5
               sta SegNumber
               jsr Disk_Present
;--
               JSL DoTransit
               PushWord MyID
               pea 1
               pea 5
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               rts

               END
;...............................................................
;
;        DoOrders       : Ordres Serie
;
;...............................................................
DoOrders       START
               Using GlobalData
;--
               lda #6
               sta SegNumber
               jsr Disk_Present
;--
               JSL DoSerialSetUp
               PushWord MyID
               pea 1
               pea 6
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               rts

               END
;...............................................................
;
;        DoCallSU : init port serie
;
;...............................................................
DoCallSU       START
               Using GlobalData
;--
               lda #7
               sta SegNumber
               jsr Disk_Present
;--
               JSL DoSetUp
               PushWord MyID
               pea 1
               pea 7
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               rts

               END
;...............................................................
;
;        DoLoad_Picture : Charge une Bitmap en Fond d'Image
;
;...............................................................
DoLoad_Picture START
               Using GlobalData
               Using ProdosData
               Using WindowData
;--
               jsr Eff_Cursor
;--
               PushWord #20
               PushWord #20
               PushLong #TxLoadPic
               PushLong #0
               PushLong #TypeListBM
               PushLong #Reply
               _SFGetFile

               lda Reply_Good
               bne ok
               brl finnew
;--
ok             jsr Make_BitMap          |Creation du Buffer
               bcc okok
               brl FinNew
;--
okok           lda Reply_FType          |sorte d'image ?
               cmp #$C1                 |screen format
               beq screen_format
;-----
paint_format   ANOP
               lda #reply_fullname
               sta nameptr
               lda #^reply_fullname
               sta nameptr+2

               jsr D_Hdl_BitMap
               sta adptr
               stx adptr+2

               jsr load_pak1
               bcc okPF
;-----
               jsr Alert_LoadBM
               jsr Trt_ErrLoadBm
               bra Fin1
;-----
okPF           jsr U_Hdl_BitMap

               bra fin
;-----
screen_format  lda #reply_fullname
               sta nameptr
               lda #^reply_fullname
               sta nameptr+2

               lda #$7D00
               sta ReadLg
               lda #0
               sta ReadLg+2

               jsr D_Hdl_BitMap

               sta ReadDest
               stx ReadDest+2

               jsl Simple_Load
               bcc Ok_Sf
;---
               jsr Alert_LoadBM
               jsr Trt_ErrLoadBm
               bra Fin1
;---
Ok_Sf          jsr U_Hdl_BitMap         |unlock
;-----
Fin            lda #$FFFF               |une bitmap
               sta Frame_BackG

               lda #1                   |modif
               sta top_Action

Fin1           PushLong Ptr_FrameW      |Refresh sur toute la fenetre
               _SetPort

               PushLong #FullRect
               _InvalRect
;--
finnew         rts
;--------------------------------------
;        Trt_ErrLoadBM
;--------------------------------------
Trt_ErrLoadBM  ANOP

               _InitCursor

               lda Frame_BackG
               bpl Stay_Color
               rts
;-
Stay_Color     jsr Dealloc_Bitmap       |enleve la bitmap cree

               rts

               END
;...............................................................
;
; MAJ_OptionW  : Mise a Jour Fenetre des OPTIONS
;
;...............................................................
MAJ_OptionW    START
               Using GlobalData
               Using WindowDATA

               phb

               phk
               plb

               phd

               lda MyZP
               tcd

               PushLong #0
               _GetPort

               PushLong Ptr_OptionW     |port = fenetre
               _SetPort

               jsr D_Hdl_PPI_Opt        |Deref Hdl

               stz SrcRecty0
               stz SrcRectx0
               lda #169
               sta SrcRecty1
               lda #48
               sta SrcRectx1

               PushLong #LocInfo_Option |Bitmap Option
               PushLong #SrcRect        |rectangle a copier
               PushWord #1              |destX
               PushWord #1              |destY
               PushWord #0
               _PPtoPort

               jsr U_Hdl_PPI_OPT        |Unlock Hdl

               lda Fonction             |Fonction Active
               jsr Option_on

               lda #15                  |Couleur Text Active
               sec
               sbc Couleur_Text
               jsr Set_OptionColor

               jsr Set_OutLine          |Epaisseur des Lignes BORDERS
               jsr Set_OutLineColor     |Couleurs des Lignes

               jsr Set_Arrows           |Fleche Active

               jsr Set_Number           |Frame Number

               jsr Set_Option_Flip      |grise ou pas
               jsr Set_Option_Cut

               jsr Set_NPFrame          |fleche next previous frame

               jsr GriseBox
;--
               _SetPort

               pld
               plb

               rtl

               END
;...............................................................
;
;        OkNew : Creation de la Fenetre FRAME
;
;...............................................................
okNew          START
               Using GlobalData
               Using WindowData
               Using MenuData

               lda Status_Ecran
               bmi Vrai_New
               brl Faux_New
;--
Vrai_New       PushLong #0              |Fenetre FRAME
               PushLong #FrameWindow
               _NewWindow
               pla
               sta Ptr_FrameW
               pla
               sta Ptr_FrameW+2
;--
               jsr MenuItemOn           |Item On
;--
               stz Status_Ecran         |Half Page
;--
               jsl Maj_OptionW

               lda #0                   |mode MOVE
               sta Choix_Option
               jsr In_Option1

               rts
;--
Faux_New       ANOP

OkClearFrame   ENTRY                    |Clear Frame
               jsr OkClearFrame1
;-
OkClearframe2  ENTRY

               PushLong #0
               _RefreshDeskTop
;-
               lda #0                   |mode MOVE
               sta Choix_Option
               jsr In_Option1

               rts
;--
OkClearFrame1  ENTRY                    |Nettoyage de la FRAME

               jsl Eff_BitMap           |kill le buffer BitMap

               jsr Eff_Border           |kill le buffer Border

               lda #15                  |et installe un fond BLANC
               sta Frame_BackG

               stz Frame_Border
               stz Frame_Shape
               stz Frame_line
               stz Frame_Icon
               stz Frame_Graph
               stz Frame_Sticker
;--
               stz Frame_Serie
               ldy #28
               lda #0
ROCF1          sta Frame_Transit,y
               dey
               dey
               bpl ROCF1
;-
               jsr Resize_Frame         |Retaille buffer
;--
               jsr Raz_Select           |raz des selection

               stz Status_Ecran
;--
               jsr Recal_Menu           |Set des Menus On/Off
;--
               PushLong #0              |NETTOYAGE DU PORTFOND
               _GetPort

               PushLong #PortFond
               _SetPort

               PushLong #FullRect
               _ClipRect

               jsr Redraw_Fond

               jsr Redraw_Template

               _SetPort

               jsr Del_Undo

               rts
;--------------------------------------
;        Retaille Buffer
;--------------------------------------
Resize_Frame   ENTRY

               jsr Resize_Line          |taille les buffers
               jsr Resize_Shape
               jsr Resize_Icon
               jsr Resize_Graph
               jsr Resize_Sticker

               rts
;--------------------------------------
;        Raz des Selections
;--------------------------------------
Raz_Select     ENTRY

               lda #$FFFF
               sta Line_Select
               sta Shape_Select
               sta Icon_Select
               sta Graph_Select

               stz Nb_List_Select       |no select

               stz FlipOnOff            |no Flip

               jsr Del_Undo

               rts
;--------------------------------------
;        Recal_Menu
;--------------------------------------
Recal_Menu     ENTRY

               jsr Menu_On_Off          |Flip On Off Cut Copy Paste
;--
               lda Frame_Border         |Border / no Border
               beq NoMenuB

okMenuB        PushWord #285            |border
               _EnableMItem
               PushWord #286            |no border
               _EnableMItem
               bra SRecal_Menu

NoMenuB        PushWord #285            |border
               _EnableMItem
               PushWord #286            |no border
               _DisableMItem
;--
SRecal_Menu    lda Mode_Showoff         |si Frame Possible
               cmp #Mode_Frame          |sinon inactif
               bne NoMenuT

               lda Sequ_Template
               beq NoMenuT

okMenuT        PushWord #287
               _EnableMItem

               lda Frame_Template
               beq Show_MenuT

Hide_MenuT     PushLong #HideTemplate
               PushWord #287
               _SetMItem

               PushWord #259            |no load bitmap
               _DisableMItem

               PushWord #282            |no backg
               _DisableMItem

               bra S0Recal_Menu

Show_MenuT     PushLong #ShowTemplate
               PushWord #287
               _SetMItem

               PushWord #259
               _EnableMItem

               PushWord #282
               _EnableMItem

               bra S0Recal_Menu

NoMenuT        PushWord #287            |No Template show/hide
               _DisableMItem

S0Recal_Menu   ANOP

               lda Mode_Showoff
               cmp #Mode_Frame
               bne NInFrameMode
;--
InFrameMode    lda Sequ_Template
               beq NInFrameMode

               lda Frame_Template
               beq NInFrameMode

               lda Sequ_TemplateB
               beq NInFrameMode

               PushWord #285
               _DisableMItem

               PushWord #286
               _DisableMItem
               bra Frecal_Menu
;--
NInFrameMode   ANOP
;--
FRecal_Menu    rts

               END
;...............................................................
;
; MAJ_FrameW  : Mise a Jour Fenetre FRAME
;
;...............................................................
MAJ_FrameW     START
               Using GlobalData
               Using WindowDATA
               Using Cursors

               phb
               phk
               plb

               phd
               lda MyZP
               tcd
;--
               _WaitCursor
;--
               lda Force_Bitmap
               bne Ofbm
;--
Nfbm           lda Top_BitMap           |si save as bitmap saute
               bne suite0
;--
               jsr Copy_ClipRgn         |meme clip region

               lda Only_Text            |rapide ?
               bne SMaj_FrameW
               bra Ofbm1
;--
Ofbm           PushLong #PortFond
               _SetPort

               PushLong #FullRect
               _ClipRect
               bra Ofbm2
;--
Ofbm1          PushLong #PortFond       |Port de Travail
               _SetPort
;--
Ofbm2          jsr Redraw_Template      |Fond Template

               jsr Redraw_Fond          |Fond d'image bitmap ou Couleur

               jsr Redraw_Border        |Redessine la bordure

               jsr Redraw_Shape         |Redessine les Shapes Geometriques

               jsr Redraw_Graph         |Redessine les Bars Graphs

               jsr Redraw_Sticker       |Redessine les Stickers

               jsr Redraw_Icon          |Redessine les Icones

               jsr Redraw_Number        |Redessine le Frame Number

               lda Top_BitMap
               bne suite10

               bra Smaj_frameW
;--
suite0         PushLong #PortFond       |si save as bitmap saute
               _SetPort
;--
Smaj_FrameW    PushLong Ptr_FrameW      |port = fenetre FRAME
               _SetPort

suite1         jsr Copie_Port           |Port de travail dans Port Frame

suite10        lda NoTextShow           |si mode show
               bne suite2
;--
               jsr Redraw_Text          |Redessine les PHRASES

               jsr Redraw_Tour          |Cadre du LABEL
;--
               lda Top_BitMap
               bne suite2
;--
               jsr Re_select            |Select OBJECT
;--
suite2         lda #0
               sta Only_Text
               sta Top_Bitmap
               sta Force_Bitmap
;--
               _InitCursor

               lda #Cursor_Fleche
               sta Type_Cursor

               pld
               plb

               rtl

               END
;...............................................................
;
;        Redraw_Fond : Place de la bitmap ou de la couleur
;
;...............................................................
Redraw_Fond    START
               Using GlobalData
               Using WindowData
;--
               lda Mode_ShowOff
               cmp #Mode_Label
               beq ok
               cmp #Mode_Template
               beq ok
;--
               lda Sequ_Template
               beq ok
               lda Frame_Template
               beq ok
               rts
;--
ok             PushLong #PortFond
               _SetPort
;--
               lda Frame_BackG
               bpl Fond_Color
;--
Fond_BitMap    lda #0
               sta >DestY
               lda #0
               sta >DestX

               lda Hdl_BitMap
               ldx Hdl_BitMap+2
               jsr PaintPixelF
               bra Fin
;--
Fond_Color     PushWord Frame_BackG     |Couleur Du Fond
               _SetSolidPenPat

               PushWord #0              |Mode COPY
               _SetPenMode

               PushLong #FullRect       |Rect 0,0,200,320
               _PaintRect

Fin            rts

               END
;...............................................................
;
;        Redraw_Tour : Tour du label
;
;...............................................................
Redraw_Tour    START
               Using GlobalData

               lda Mode_ShowOff
               cmp #Mode_Label
               beq ok
               rts
;--
ok             lda Force_Bitmap
               bne Ko
               lda Top_Bitmap
               beq ok1
ko             rts
;--
ok1            PushLong #0
               _SetSolidPenPat
               _SetPenMode

               PushLong #RectLabel
               PushWord #15
               PushWord #15
               _FrameRRect
;--
               PushLong #0
               _NewRgn
               pla
               sta RgnLabel
               pla
               sta RgnLabel+2

               PushLong #0
               _NewRgn
               pla
               sta RgnLabel1
               pla
               sta RgnLabel1+2

               PushLong #0
               _NewRgn
               pla
               sta ZRgnLabel
               pla
               sta ZRgnLabel+2
;--
               _OpenRgn

               PushLong #RectLabel
               PushWord #15
               PushWord #15
               _FrameRRect

               PushLong RgnLabel
               _CloseRgn
;--
               _OpenRgn

               PushLong #FullRect
               _FrameRect

               PushLong RgnLabel1
               _CloseRgn
;--
               PushLong RgnLabel1
               PushLong RgnLabel
               PushLong RgnLabel
               _DiffRgn

               PushLong ZRgnLabel
               _GetClip

               PushLong RgnLabel
               _SetClip
;--
               PushLong #Patgrise       |1/2
               _SetPenPat

               PushWord #1              |Mode or
               _SetPenMode

               PushLong #FullRect
               _PaintRect
;--
               PushLong ZRgnLabel
               _SetClip

               PushLong RgnLabel
               _DisposeRgn

               PushLong RgnLabel1
               _DisposeRgn

               PushLong ZRgnLabel
               _DisposeRgn

               rts

ZRgnLabel      ds 4
RgnLabel       ds 4
RgnLabel1      ds 4

               END
;...............................................................
;
;        Copie_port : travail dans Frame
;
;...............................................................
Copie_Port     START
               Using GlobalData
               Using WindowData

               lda #0
               sta >DestY
               lda #0
               sta >DestX

               lda Hdl_Fond
               ldx Hdl_Fond+2
               jsr PaintPixelF1

               rts

               END
;...............................................................
;
;        DoColorT : Choix D'une Couleur de TEXT+EPAISSEUR
;
;...............................................................
DocolorT       START
               Using GlobalData
               Using WindowData

               lda Choix_Option         |Pad a Zero
               sec
               sbc #21
               sta Choix_Option
;--
               lda EventModifiers       |SI COMMAND KEY
               and #$0100               |CHANGE COULEUR EPAISSEUR
               bne Change_OutLine
               brl Suite
;--
Change_OutLine lda #15                  |Change COULEUR EPAISSEURS
               sec
               sbc Choix_Option
               sta OutLine_Color

               jsr Set_OutLineColor     |Dessine les LIGNES en COULEURS

               jsr Set_Arrows           |les Fleches

               jsr CH_ColorOutLine      |Modifie Si Objet Select

               brl fin
;--
Suite          lda #15                  |Efface L'ancien
               sec
               sbc Couleur_Text
               jsr Set_OptionColor

               lda #15
               sec
               sbc Choix_Option
               sta Couleur_Text         |Set la Nouvelle Couleur

               lda Choix_Option
               jsr Set_OptionColor      |La Positionne

               jsr CH_ColorObject       |Modifie si Object Select

               jsr CH_ColorDrag         |modifie si Drag Select

               stz Top_color            |force la couleur Courante in Line
;--
fin            rts

               END
;...............................................................
;
;        Set_Number : Frame Number in Option Window
;
;...............................................................
Set_Number     START
               Using GlobalData
               Using FontData

               PushLong #RectNumber
               _EraseRect

               PushWord #12
               PushWord #167
               _MoveTo

               PushWord #4              |que la lettre
               _SetTextMode

               PushWord #0              |Copie
               _SetPenMode

               PushWord #0              |Noir
               _SetForeColor

               PushWord Sequ_NbFrame
               PushLong #Str_Frame1
               PushWord #2
               PushWord #0
               _Int2Dec

               PushLong #Str_Frame
               _DrawString

               rts

               END
;...............................................................
;
;        Set_OptionColor : Encadre La Couleur DE TEXT
;
;...............................................................
Set_OptionColor START
               Using WindowData

               asl a                    |ACC = n% RECTANGLE * 8
               asl a
               asl a

               clc
               adc #Rect_Couleur
               sta Adr_RectOption
               lda #^Rect_Couleur
               adc #0
               sta Adr_RectOption+2

               PushWord #15             |Couleur Blanche
               _SetSolidPenPat

               PushWord #2              |Mode Xor
               _SetPenMode

               PushLong Adr_RectOption
               _FrameRect

               rts

               END
;...............................................................
;
;        Set_OutLine : CHOIX DE L'EPAISSEUR
;
;...............................................................
Set_OutLine    START
               Using GlobalData
               Using WindowData

               jsr ReSet_OutLine        |Efface Le CHECK

               lda OutLine              |Ou est le Check MARK
               asl a
               tax
               lda Table_CheckOutLine,x

               Pea $0003                |PLACE CHECK MARK
               Pha
               _MoveTo

               PushWord #00             |Couleur Noire
               _SetSolidPenPat

               PushWord #$12            |Check Mark
               _DrawChar

FIN            rts
;--
ReSet_Outline  ENTRY

               PushWord #15             |Couleur Blanche
               _SetSolidPenPat

               PushWord #0              |Mode Copie
               _SetPenMode

               PushLong #Rect_OutLine   |efface le CHECK MARK
               _PaintRect

               rts

               END
;...............................................................
;
;        DoOutLine : CHOIX EPAISSEUR
;
;...............................................................
DoOutLine      START
               Using GlobalData
               Using WindowData

               lda Choix_Option         |EPAISSEUR CHOISIE
               sec
               sbc #14
               sta OutLine

               jsr Set_OutLine

               jsr CH_SizeOutLine       |Modifie l'epaisseur des selectionnes

               rts

               END
;...............................................................
;
;        Set_OutLineColor : COULEUR DES EPAISSEURS
;
;...............................................................
Set_OutLineColor START
               Using GlobalData
               Using WindowData

               PushWord OutLine_Color   |Couleur des LIGNES
               _SetSolidPenPat

               PushWord #0              |Mode COPY
               _SetPenMode

               PushWord #11             |Ligne 1
               PushWord #103
               _MoveTo

               PushWord #12
               PushWord #0
               _Line

               PushLong #Rect_OutLine2  |ligne 2
               _PaintRect

               PushLong #Rect_OutLine3  |ligne 3
               _PaintRect

               PushLong #Rect_OutLine4  |ligne 4
               _PaintRect

               rts

               END
;...............................................................
;
;        DoArrow1 : choix fleche 1
;
;...............................................................
DoArrow1       START
               Using GlobalData

               lda Arrows_On
               and #$0001
               eor #$0001
               sta Arrows_On

               jsr Set_Arrows

               jsr CH_Arrows            |si line select

               rts
;--
DoArrow2       ENTRY

               lda Arrows_On
               and #$0002
               eor #$0002
               sta Arrows_On

               jsr Set_Arrows

               jsr CH_Arrows            |si line select

               rts

               END
;...............................................................
;
;        CH_Arrows : si Line SELECT MODIFIER l'attribut
;
;...............................................................
CH_Arrows      START
               Using GlobalData

               PushLong #0
               _GetPort

               lda #$0006
               sta Ch_Group

               jsr Change_Groupe

               _SetPort

               rts

               END
;...............................................................
;
;        Set_Arrows : fleche active
;
;...............................................................
Set_Arrows     START
               Using GlobalData
               Using WindowData
               Using Cursors
;--
               PushLong #Rect_arr1
               _EraseRect
               PushLong #Rect_arr2
               _EraseRect
;--                                     |Fleche 1 ON ou OFF
Fleche1        lda Arrows_On
               and #$0001
               bne Fleche1_On
;--
Fleche1_Off    PushLong #Icon_Arrow1
               PushWord #0
               PushWord #28
               PushWord #98
               _DrawIcon
               bra Fleche2
;--
Fleche1_On     PushLong #Icon_Arrow1
               jsr Mode_Icon
               Pha
               PushWord #28
               PushWord #98
               _DrawIcon
;--                                     |Fleche 2 ON ou OFF
Fleche2        lda Arrows_On
               and #$0002
               bne Fleche2_On
;--
Fleche2_Off    PushLong #Icon_Arrow2
               PushWord #0
               PushWord #28
               PushWord #111
               _DrawIcon
               bra FSet_Arrows
;--
Fleche2_On     PushLong #Icon_Arrow2
               jsr Mode_Icon
               Pha
               PushWord #28
               PushWord #111
               _DrawIcon
;--
FSet_Arrows    rts
;--------------------------------------
;        Mode Dessin Icone
;--------------------------------------
Mode_ICon      ANOP

               lda OutLine_Color
               bne SMode_Icon

               lda #1
               bra FMode_Icon

SMode_ICon     lda OutLine_Color
               asl a
               asl a
               asl a
               asl a
               ora #$000F
               xba

FMode_Icon     rts

               END
;...............................................................
;
;        Set_Option_Flip : actif ou pas (grise)
;
;...............................................................
Set_Option_Flip START
               Using GlobalData
               Using WindowData

               lda FlipOnOff
               beq OFF
;--
ON             PushLong #0
               _GetPort

               PushLong Ptr_OptionW
               _SetPort

               jsr D_Hdl_PPI_Opt        |Deref Hdl

               lda #40
               sta SrcRecty0
               lda #1
               sta SrcRectx0
               lda #52
               sta SrcRecty1
               lda #36
               sta SrcRectx1

               PushLong #LocInfo_Option |Bitmap Option
               PushLong #SrcRect        |rectangle a copier
               PushWord #2              |destX
               PushWord #41             |destY
               PushWord #0
               _PPtoPort

               jsr U_Hdl_PPI_OPT        |Unlock Hdl

               _SetPort

               rts
;--
OFF            PushLong #0
               _GetPort

               Pushlong Ptr_OptionW
               _SetPort

               PushLong #Patgrise
               _SetPenPat

               PushWord #$0001          |notBIC
               _SetPenMode

               PushLong #RectFlipH
               _PaintRect

               PushLong #RectFlipV
               _PaintRect

               _PenNormal

               _SetPort

               rts

               END
;...............................................................
;
;        Set_NPFrame : fleche Next Previous actif ou pas (grise)
;
;...............................................................
Set_NPFrame     START
               Using GlobalData
               Using WindowData

               lda Mode_Showoff
               cmp #Mode_Rien
               beq OFF
               cmp #Mode_Template
               bcs OFF
               rts
;--
OFF            PushLong #0
               _GetPort

               Pushlong Ptr_OptionW
               _SetPort

               PushLong #Patgrise
               _SetPenPat

               PushWord #$0001          |notBIC
               _SetPenMode

               PushLong #RectNPFrame
               _PaintRect

               _PenNormal

               _SetPort

               rts
;--
GriseBox       ENTRY

               lda Mode_ShowOff
               cmp #Mode_Rien
               bne FGriseBox

               PushLong #Patgrise
               _SetPenPat

               PushWord #$0001          |notBIC
               _SetPenMode

               PushLong #R_GriseBox
               _PaintRect

               _PenNormal

FGriseBox      rts

RectNPFrame    dc i'160,2,169,37'
R_GriseBox     dc i'2,2,92,37'

               END
;...............................................................
;
;        CH_COLOROBJECT : MODIFICATION Couleur line ou objet
;
;...............................................................
CH_ColorObject START
               Using GlobalData

               lda #$0001               |modifie de la couleur interieure
               sta Ch_Group

               jsr Change_Groupe

               rts

               END
;...............................................................
;
;        CH_ SIZEOUTLINE : modifications des tailles de bord
;
;...............................................................
CH_SizeOutLine START
               Using GlobalData

               PushLong #0
               _GetPort

               lda #$0002
               sta Ch_Group

               jsr Change_Groupe

               _SetPort

               rts

               END
;...............................................................
;
;        CH_COLOROUTLINE : modifications de la couleur des bords
;
;...............................................................
CH_ColorOutLine START
               Using GlobalData

               lda #$0003
               sta Ch_Group

               jsr Change_Groupe

               rts

               END
;...............................................................
;
;        CH_ColorDrag : Couleur d'une Drag Selection
;
;...............................................................
CH_ColorDrag   START
               Using GlobalData
               Using Windowdata

               lda Top_select_D
               bne ok
               rts
;--
ok             sep #$20
               longa off

               ldy SelectDragD
               lda Couleur_Text
LOOP           sta Line_CTexte,y
               iny
               cpy SelectDragF
               bcc LOOP

               rep #$20
               longa on

               lda #1
               sta Top_sauvegarde
;--
               PushLong #0
               _GetPort

               PushLong Ptr_FrameW
               _SetPort

               jsr Draw_DragE           |efface

               lda Pos_lettre           |print text
               sta Indice
               jsr Aff_Phrase

               jsr Draw_DragE           |inverse

               jsr Place_cursor

               _SetPort
;--
               rts

               END
;...............................................................
;
;        Change_Groupe : modifie les attributs des selections
;
;...............................................................
Change_groupe  START
               Using GlobalData
               Using WindowData

               stz top_draw
;--
               lda Nb_List_Select
               bne okLoop
               rts
;--
OkLoop         pha
               jsr Save_Undo            |backup
               pla
;--
Loop           pha
               asl a
               tay
               lda List_Record,y
               jsr Modif_Attribut
               pla
               dec a
               bne Loop
;--
               lda top_Draw
               beq FChange_Groupe

               lda #1
               sta Top_Action

               jsr Aff_Shape

FChange_Groupe rts
;--
Modif_Attribut pha
               and #$FF00
               xba
               beq Modif_text           |c'est du text
               cmp #1
               bne testI
               brl Modif_Shape          |c'est une forme
TestI          cmp #2
               bne TestG
               brl Modif_Icon           |c'est une icone
TestG          cmp #4
               bne TestK
               brl Modif_Graph          |c'est un Graph
TestK          cmp #5
               bne unknow
               brl Modif_Sticker        |c'est un sticker
unknow         pla
               rts
;--
Modif_text     pla
               ldx Ch_Group
               cpx #1
               beq Modif_TextC
               cpx #7
               beq Modif_TextF
               brl FModif_text
;--
Modif_TextC    sta cou_ligne
               jsr Rest_Buffer

               jsr CH_ColorLine         |CHANGE COULEUR DU TEXT

               lda #1
               sta top_sauvegarde

               jsr Sauve_Buffer

               inc top_draw

Fmodif_text    rts
;--
Modif_TextF    ANOP

               sta cou_Ligne
               jsr Rest_Buffer

               jsr CH_FontLine

               PushLong #0
               _GetPort

               PushLong Ptr_FrameW
               _SetPort

               PushWord Line_X
               PushWord Line_Y
               _MoveTo

               jsr calcul_rect

               _SetPort

               lda #1
               sta Top_sauvegarde

               jsr Sauve_buffer

               rts
;--
Modif_Shape    lda 1,s
               and #$00FF
               jsr Rest_shape
;--
               lda Ch_Group
               cmp #1
               beq Modif_S1             |Couleur
               cmp #2
               beq Modif_S2             |epaisseur
               cmp #3
               beq Modif_S3             |couleur epaisseur
               cmp #4
               beq Modif_S4             |Flip Vert
               cmp #5
               beq Modif_S5             |Flip Hori
               cmp #6
               beq Modif_S6             |Fleche ARROWS
               cmp #8
               beq Modif_S8             |test objet
               cmp #9
               beq Modif_S9             |shadow
               pla
               rts
;=-
Modif_S6       lda Shape_TailleB
               and #$00FF
               sta Shape_TailleB
               lda Arrows_On
               xba
               ora Shape_TailleB
               sta Shape_TailleB
               bra SModif_Shape
;=-
Modif_S4       jsr FlipVShape
               bra SModif_Shape
;=-
Modif_S5       jsr FlipHShape
               bra Smodif_Shape
;=-
Modif_S2       jsr Test_Epaisseur       |si mince
               bcc ok_Modif_S2
               pla
               bra FModif_shape
;=
ok_Modif_S2    lda Shape_TailleB
               and #$FF00
               ora OutLine
               sta Shape_TailleB
               bra SModif_Shape
;=-
Modif_S3       lda OutLine_Color
               sta Shape_ColorB
               bra SModif_Shape
;=
Modif_S1       lda Couleur_Text         |++++
               sta Shape_ColorI
               lda Shape_type
               beq OkModif_S1
               jsr Test_shape           |si forme vide couleur directe
               bcc SModif_Shape
OkModif_S1     lda Couleur_Text
               sta Shape_ColorB
               bra SModif_Shape
;=-
Modif_S9       jsr Test_Shape           |only Full Shape
               bcs SModif_Shape
               lda Shape_Shadow
               eor #$0001
               sta Shape_Shadow
               bra SModif_Shape
;=-
Modif_S8       jsr Test_In_Shape1
               bcc F0Modif_Shape
               lda 1,s
               and #$00FF
               sta Number_Objet_S       |le numero de la shape
               lda #1                   |on a trouve
               sta Top_Objet_S
               lda #4                   |c'est une shape
               sta Type_Objet_S

F0Modif_Shape  pla
               rts
;--
SModif_Shape   pla
               and #$00FF
               jsr Copie_Shape

               inc top_draw

FModif_Shape   rts
;--
Modif_Icon     lda 1,s
               and #$00FF
               ldx Ch_Group             |Quel modif only Flip 4 vert 5 hori
               cpx #4
               beq Modif_IconV
               cpx #5
               beq Modif_IconH
               cpx #8
               beq Modif_IconS
               pla
               rts
;--
Modif_IconV    ANOP
               jsr Rest_Icon1
               lda Icon_Mode
               eor #$0080
               sta Icon_Mode
               bra SModif_Icon
;-
Modif_IconH    ANOP
               jsr Rest_Icon1
               lda Icon_Mode
               eor #$0040
               sta Icon_Mode
               bra SModif_Icon
;-
Modif_IconS    ANOP
               jsr Rest_Icon1
               jsr Test_In_Icon1
               bcc FModif_IconS
               lda 1,s
               and #$00FF
               sta Number_Objet_S
               lda #1
               sta Top_Objet_S
               lda #2
               sta Type_Objet_S
               sec

FModif_IconS   pla
               rts
;-
SModif_Icon    ANOP
               pla
               and #$00FF
               jsr Copie_Icon1

               inc top_draw

FModif_Icon    rts
;--
Modif_Sticker  lda 1,s
               and #$00FF
               ldx Ch_Group             |Quel modif only Flip 4 vert 5 hori
               cpx #4
               beq Modif_StickV
               cpx #5
               beq Modif_StickH
               cpx #8
               beq Modif_StickS
               pla
               rts
;--
Modif_StickV   ANOP
               jsr Rest_Sticker1
               ldy #Sticker_Mode
               lda [Ptr_BufStick],y
               eor #$0080
               sta [Ptr_BufStick],y
               bra SModif_Stick
;-
Modif_StickH   ANOP
               jsr Rest_Sticker1
               ldy #Sticker_Mode
               lda [Ptr_BufStick],y
               eor #$0040
               sta [Ptr_BufStick],y
               bra SModif_Stick
;-
Modif_StickS   ANOP
               jsr Rest_Sticker1
               jsr Test_In_Sticker1
               bcc FModif_StickS
               lda 1,s
               and #$00FF
               sta Number_Objet_S
               lda #1
               sta Top_Objet_S
               lda #5
               sta Type_Objet_S
               sec

FModif_StickS  pla
               rts
;-
SModif_Stick   ANOP
               pla
               and #$00FF
               jsr Copie_Sticker1

               inc top_draw

FModif_Stick   rts
;--
Modif_Graph    lda 1,s
               and #$00FF
               ldx Ch_Group
               cpx #2                   |size outline
               beq Modif_GraphS
               cpx #3
               beq Modif_GraphC         |color outline
               cpx #4
               beq Modif_GraphV         |flip V
               cpx #5
               beq Modif_GraphH         |flip h
               cpx #8
               beq Modif_GraphSe        |select
               cpx #9
               beq Modif_GraphSh        |shadow
               pla
               rts
;--
Modif_GraphS   ANOP
               jsr Rest_Graph
               lda Outline
               sta GraphLineSize
               bra SModif_Graph
;--
Modif_GraphC   ANOP
               jsr Rest_Graph
               lda OutLine_Color
               sta GraphlineCol
               bra SModif_Graph
;--
Modif_GraphV   ANOP
               jsr Rest_Graph
               lda GraphFlipType
               eor #$0100
               sta GraphFlipType
               bra SModif_Graph
;-
Modif_GraphH   ANOP
               jsr Rest_Graph
               lda GraphFlipType
               eor #$0200
               sta GraphFlipType
               bra SModif_Graph
;-
Modif_GraphSh  ANOP
               jsr Rest_Graph
               lda GraphShadow
               eor #$0001
               sta GraphShadow
               bra SModif_Graph
;-
Modif_GraphSe  ANOP
               jsr Rest_Graph
               jsr Test_In_Graph1
               bcc FModif_GraphSe
               lda 1,s
               and #$00FF
               sta Number_Objet_S
               lda #1
               sta Top_Objet_S
               lda #3
               sta Type_Objet_S
               sec
FModif_GraphSe pla
               rts
;-
SModif_Graph   ANOP
               pla
               and #$00FF
               jsr Copie_Graph

               inc top_draw

FModif_Graph   rts

               END
;...............................................................
;
;        FlipVShape : retourne Verticalement (UNE LIGNE)
;
;...............................................................
FlipVShape     START
               Using GlobalData

               lda Shape_Type
               beq ok
               rts

ok             lda Shape_DebutY
               ldx Shape_FinY
               sta Shape_FinY
               stx Shape_DebutY

               rts

               END
;...............................................................
;
;        FlipHShape : retourne Horizontalement (UNE LIGNE)
;
;...............................................................
FlipHShape     START
               Using GlobalData

               lda Shape_Type
               beq ok
               rts

ok             lda Shape_DebutX
               ldx Shape_FinX
               sta Shape_FinX
               stx Shape_DebutX

               rts

               END
;...............................................................
;
;        AFFICHAGE : Routines tempo
;
;...............................................................
AFFICHAGE      START
               Using GlobalData
               Using WindowData
;--
GAff_Shape     jsr Aff_Shape

               PushLong Ptr_OptionW     |Port OPTION
               _SetPort

               rts
;--
Aff_shape      ENTRY                    |REFRESH ???

               jsr Cop_Rgn0_Shape       |l'installe

Aff_ShapeS     ENTRY

               PushLong Ptr_FrameW      |Frame Window
               _SetPort

               jsr trt_paintphra        |redessine

               rts

               END
;...............................................................
;
;        Copy_ClipRgn : la clip de frame -> clip de fond
;
;...............................................................
Copy_ClipRgn   START
               Using GlobalData
               Using WindowData

               PushLong #0              |Sauver le PORT
               _GetPort
;--------------------------------------
               PushLong #0
               _NewRgn
               pla
               sta RgnClip
               pla
               sta RgnClip+2
         
               PushLong Ptr_FrameW
               _SetPort

               PushLong RgnClip
               _GetClip

               PushLong #PortFond
               _SetPort

               PushLong RgnClip
               _SetClip

               PushLong RgnClip
               _DisposeRgn
;--------------------------------------
               _SetPort                 |remettre le PORT

               rts

RgnClip        ds 4                     |une region temporaire

               END
;...............................................................
;
;        MenuItemOn : item On si New Or Open
;
;...............................................................
MenuItemOn     START

               lda #NbMenu-1
rMenuItemOn    pha
               asl a
               tax
               lda TableMenu,x
               pha
               _EnableMItem
               pla
               dec a
               bpl rMenuItemOn

               rts
;--
MenuItemOff    ENTRY

               lda #NbMenu-1
rMenuItemOff   pha
               asl a
               tax
               lda TableMenu,x
               pha
               _DisableMItem
               pla
               dec a
               bpl rMenuItemOff

               rts

NbMenu         equ 22

TableMenu      dc i'258,259,260,261,262,263,266,270,273,274,277,278'
               dc i'279,281,282,283,284,285,288,289,290,293'

               END

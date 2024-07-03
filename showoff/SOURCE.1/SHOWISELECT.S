;-----------------------------------------------------------------
;
; FILE : SHOWISELECT.S                  - Choix d'une Icones -
;        -------------
;-----------------------------------------------------------------
;...............................................................
;
;        Creation du MODELESSDIALOG
;
;...............................................................
DoIcon         START
               Using SelectIData
               Using GlobalData
               Using WindowData

               phb
               phk
               plb
;--
               PushLong Ptr_OptionW
               _SetPort

;              PushLong #RectIcons
;              _InvertRect
;--
               stz Cx_IconBorder        |DES ICONES
               stz Top_ItemIcon
               stz Cx_SaveIcon

               lda #Haut_Icone
               sta Val_Hauteur
               inc a
               sta Val_Hauteur1

               lda #Larg_Icone
               sta Val_Largeur

               lda First_PageI
               sta First_Page

               brl SDoIcon
;--
DoIconAppel    ENTRY

               lda Mode_Showoff
               cmp #Mode_rien
               beq FDoIconAppel

               jsl DoIcon
FDoIconAppel   rts
;--
LoadIcon       ENTRY

               phb
               phk
               plb

               lda #0
               sta Cx_IconBorder
               sta Cx_SaveIcon
               lda #2
               sta Top_ItemIcon

               lda #Haut_Icone
               sta Val_Hauteur
               inc a
               sta Val_Hauteur1

               lda #Larg_Icone
               sta Val_Largeur

               lda #mode_Paint
               sta Mode_Load

               lda First_PageI
               sta First_Page

               bra SDoIcon
;--                                     | INIT
DoBorderAppel  ENTRY
               jsl DoBorder
               rts
;--
DoBorder       ENTRY

               phb
               phk
               plb

               lda #1                   |DES BORDURES
               sta Cx_IconBorder
               sta Top_ItemIcon

               lda #0
               sta Cx_SaveIcon

               lda #Haut_Bordure
               sta Val_Hauteur
               inc a
               sta Val_Hauteur1

               lda #Larg_Bordure
               sta Val_Largeur

               lda First_PageB
               sta First_Page

               bra SDoIcon
;--
SaveIcon       ENTRY                    |Sauver une Icon
               phb
               phk
               plb

               lda #0
               sta Cx_IconBorder
               sta Cx_SaveIcon          |a t'on Sauve
               lda #3
               sta Top_ItemIcon

               lda #Haut_Icone
               sta Val_Hauteur
               inc a
               sta Val_Hauteur1

               lda #Larg_Icone
               sta Val_Largeur

               lda First_PageI
               sta First_Page
;--
SDoIcon        lda #0
               sta >EndSIcon
               sta >Top_Cadre
               sta >First_Cadre
               sta >Flag_cadre

               lda #$FFFF
               sta Old_FIcon
               sta OldX_2C
               sta OldY_2C

               jsr alloc_FIcon          |ou mettre la bitmap
               bcc Ok00
               jsr Alert_CCP
               bra ko01

Ok00           jsr How_IconBorder       |NBER ICON/BORDER FILE IN DIRECTORY
               bcc ok0
;--
Ko0            jsr Dealloc_FIcon
Ko01           ANOP
               PushLong Ptr_OptionW
               _SetPort
               lda #0
               sta Choix_Option
               jsr In_Option1
;              PushLong #RectIcons
;              _InvertRect
               plb
               rtl
;--
ok0            lda First_page
               jsr Load_IconBorder
               bcs Ko0
;--
               PushLong #0
               _GetPort
;--
               lda Top_ItemIcon         |Deja en pleine page
               cmp #2
               bcs ok1

               jsl Pleine_Page          |en plein ecran

ok1            jsr Create_DialogS       |Creation du Dialog
;--
               lda EventWhen
               sec
               sbc #100
               sta Double_Click
;--------------------------------------
;        LOOP
;--------------------------------------
NextEvent      PushWord #0
               PushWord #$1FFF
               PushLong #EventRecord
               _GetNextEvent
               pla
               bne HdlEvent
               jsr Cadre_Tournant
               bra NextEvent
;--
;HdlEvent       lda Cx_IconBorder
;               bne SHdlEvent
;               jsr Trt_Thumb            |suit l'ascenseur pour Icon
;               bcc SHdlEvent
;               bra NextEvent
;--
HdlEvent       ANOP
               PushWord #0
               PushLong #EventRecord
               PushLong #Ptr_SIconW
               PushLong #SItemHit
               _DialogSelect
               pla
               beq NextEvent

               lda SItemHit
               sec
               sbc #20
               asl a
               tax
               jsr (CHXSICON,x)

               lda EndSIcon
               beq NextEvent

               jsr Menu_On_Off

;--------------------------------------
;        On Ferme
;--------------------------------------
               PushLong Ptr_SIconW
               _CloseDialog

               jsr dealloc_FIcon
;--
               lda #0                   |option fleche en retour
               sta Choix_Option
               jsr In_Option1

               _SetPort
;--
               lda Top_ItemIcon         |Deja en pleine page
               cmp #2
               bcs ok2

               jsl Demi_Page

ok2            plb
               rtl
;--------------------------------------
;   TABLES DES COMMANDES
;--------------------------------------
CHXSICON       ANOP
               dc i'PSI_Select'         |20 Select
               dc i'PSI_Cancel'         |21 Cancel
               dc i'PSI_ADD'            |22 Add
               dc i'PSI_Remove'         |23 Remove
               dc i'PSI_OKS'            |24 OK Save
               dc i'PSI_CancelS'        |25 Cancel Save
               dc i'PSI_AddS'           |26 Add Save
               dc i'PSI_RemoveS'        |27 Remove Save
               dc i'PSI_NewPageS'       |28 New Page Save
               dc i'PSI_Ignore'         |29 Scroll bar
               dc i'PSI_Icone'          |30 Click in Icone

               END
;...............................................................
;
;        Create_DialogS
;
;...............................................................
Create_DialogS START
               Using SelectIData
               Using GlobalData

               PushLong #0              | dialogPtr
               PushLong #FullRect       | content rectangle
               PushLong #0              | no title
               PushLong #$FFFFFFFF      | bring to front
               PushWord #$0020          | frame
               PushLong #20             | Refcon
               PushLong #FullRect       | full size
               _NewModelessDialog
               pla
               sta >Ptr_SIconW
               pla
               sta >Ptr_SIconW+2
;--
               PushLong Ptr_SIconW
               _SetPort
;--
               lda Top_ItemIcon
               asl a
               tax
               jsr (TabCreateD,x)
;--
               PushLong Ptr_SIconW
               PushLong #IScrollBar
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #IPage
               _GetNewDItem

               jsr ShowFicon
               jsr Print_Txt            |affiche les complements de texte

               rts
;--------------------------------------
;        Table Create Dialog
;--------------------------------------
TabCreateD     ANOP
               dc i'CreateDIcon'        |Choose Icon
               dc i'CreateDBorder'      |Choose Border
               dc i'CreateDIcon'        |Load Icon Edit
               dc i'CreateDSave'        |Save Icon Edit
;--------------------------------------
;  CreateDIcon : Choose Icon
;--------------------------------------
CreateDIcon    ANOP
               PushLong Ptr_SIconW      |5 Controls Pour ICON
               PushLong #ISelect
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #IAdd
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #ICancel
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #IRemove
               _GetNewDItem

               jsr Test_Item

               rts
;--------------------------------------
;  CreateDBorder : Choose Border
;--------------------------------------
CreateDBorder  ANOP
               PushLong Ptr_SIconW      |2 Controls Pour BORDER
               PushLong #ISelectB
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #ICancelB
               _GetNewDItem

               rts
;--------------------------------------
;  CreateDSave : Save an Icon
;--------------------------------------
CreateDSave    ANOP
               PushLong Ptr_SIconW
               PushLong #IOkS
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #ICancelS
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #IAddS
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #INewPageS
               _GetNewDItem

               PushLong Ptr_SIconW
               PushLong #IRemoveS
               _GetNewDItem

               jsr Test_Item

               rts

               END
;...............................................................
;
;        Test_Item : set des remove et add
;
;...............................................................
Test_item      START
               Using GlobalData
               Using SelectIData

               lda Top_ItemIcon         |Save or Load ?
               cmp #3
               beq Test_ItemS
;--------------------------------------
               lda Nb_FileIcon
               cmp #1
               beq Remove_Off
Remove_On      jsr OkRemove
               bra Stest_item
Remove_Off     jsr NoRemove

Stest_item     lda Nb_FileIcon
               cmp #Max_FileIcon
               bcs Add_Off
Add_On         jsr OkAdd
               rts
Add_Off        jsr NoAdd
               rts
;--
NoAdd          PushWord #255
               bra chg_add
okAdd          PushWord #0
chg_add        PushLong #0
               PushLong Ptr_SiconW
               PushWord IAdd
               _GetControlDItem
               _HiliteControl
               rts
;-
NoRemove       PushWord #255
               bra chg_remove
okremove       PushWord #0
chg_remove     PushLong #0
               PushLong Ptr_SiconW
               PushWord IRemove
               _GetControlDItem
               _HiliteControl

ftest_item     rts
;--------------------------------------
Test_ItemS     ANOP
               lda Nb_FileIcon
               cmp #1
               beq Remove_OffS
Remove_OnS     jsr OkRemoveS
               bra Stest_itemS
Remove_OffS    jsr NoRemoveS

Stest_itemS    lda Nb_FileIcon
               cmp #Max_FileIcon
               bcs Add_OffS
Add_OnS        jsr OkAddS
               rts
Add_OffS       jsr NoAddS
               rts
;--
NoAddS         PushWord #255
               PushWord #255
               bra chg_addS
okAddS         PushWord #0
               PushWord #0

chg_addS       PushLong #0
               PushLong Ptr_SiconW
               PushWord IAddS
               _GetControlDItem
               _HiliteControl

               PushLong #0
               PushLong Ptr_SIconW
               PushWord INewPageS
               _GetControlDItem
               _HiliteControl

               rts
;-
NoRemoveS      PushWord #255
               bra chg_removeS
okremoveS      PushWord #0
chg_removeS    PushLong #0
               PushLong Ptr_SiconW
               PushWord IRemoveS
               _GetControlDItem
               _HiliteControl

               rts

               END
;...............................................................
;
;        Item_Inactif : Control inactif au Debut
;
;...............................................................
Item_Inactif   START
               Using SelectIData

;              lda Cx_IconBorder
;              beq Item_OffI
;--
;Item_OffB      PushWord #255
;              PushLong #0              | Output handle
;              PushLong Ptr_SIconW
;              PushWord >ISelectB       | ID ISelect
;              _GetControlDItem
;
;              _HiliteControl           | les parametres arrivent de _Get...
;
;              rts
;-----
;Item_OffI      PushWord #255
;              PushLong #0              | Output handle
;              PushLong Ptr_SIconW
;              PushWord >ISelect        | ID ISelect
;              _GetControlDItem
;
;              _HiliteControl           | les parametres arrivent de _Get...
;
               rts

               END
;...............................................................
;
; PSI_Ignore : Procedure Select Icon Ignore
;
;...............................................................
PSI_Ignore     START
               Using SelectIData

               rts

               END
;...............................................................
;
; PSI_Cancel : Procedure Select Icon Cancel
;
;...............................................................
PSI_Cancel     START
               Using SelectIData

               inc EndSIcon

               lda Cx_IconBorder
               cmp #1
               beq ItsBorder

ItsIcon        lda First_Page
               sta First_PageI
               rts

ItsBorder      lda First_Page
               sta First_PageB
               rts

               END
;...............................................................
;
; PSI_Create : Procedure Create NEW FILE ICON
;
;...............................................................
PSI_Create     START

               rts

               END
;...............................................................
;
;        Is_ScrollBar : traite la Scroll Bar
;
;...............................................................
Is_ScrollBar   START
               Using GlobalData
               Using SelectIData
;--
               phb                      | sauve registres
               phd

               phk
               plb                      | met Data Bank
;--
               lda 13,s                 |Command
               asl a
               tax
               jsr (TabScrollCmd,x)
;--
               pld                      | remet a jour direct bank
               plb                      | data bank

               lda 0,s
               sta 8,s
               lda 2,s
               sta 10,s

               tsc
               clc
               adc #8
               tcs

               rtl
;--------------------------------------
TabScrollCmd   ANOP
               dc i'0'
               dc i'InitView'
               dc i'initTotal'
               dc i'InitValue'
               dc i'LineUp'
               dc i'LineDown'
               dc i'PageUp'
               dc i'PageDown'
               dc i'Thumb'
;--
InitView       ANOP
               lda #1
               sta 17,s
               rts
;--
InitTotal      ANOP
               lda Nb_FileIcon
               sta 17,s
               rts
;--
InitValue      ANOP
               lda First_page
               sta 17,s
               rts
;--
LineUp         ANOP

PageUP         ANOP

               PushWord #0
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _GetDItemValue
               pla
               beq SlineUp
;--
               pha
               stz Cx_SaveIcon
;--
;              phd                      |SAUVEGARDE AUTOMATIQUE
;              lda MyZp
;              tcd
;              jsr SaveAnIcon
;              pld
;              bcc SpageUp
;              pla
;              bra SlineUp
;--
SPageUp        pla
               dec a
               sta 17,s
               sta First_page
               tax
;-
               phd
               lda MyZP
               tcd
;
               txa
               jsr Load_IconBorder
               jsr ShowFIcon
               jsr Edit_Off
               stz Top_cadre
;
               pld
               rts
SLineUp        sta 17,s
               rts
;--
LineDown       ANOP

PageDown       ANOP

               PushWord #0
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _GetDItemValue
               pla
               inc a
               cmp Nb_FileIcon
               bcs SlineDown
;--
               pha
               stz Cx_SaveIcon
;--
;              phd                      |SAUVEGARDE AUTOMATIQUE
;              lda MyZp
;              tcd
;              jsr SaveAnIcon
;              pld
;
;              bcc SpageDown
;              pla
;              bra SlineDown
;--
SpageDown      pla
               sta 17,s
               sta First_page
               tax
;-
               phd
               lda MyZP
               tcd
;-
               txa
               jsr Load_IconBorder
               jsr ShowFIcon
               jsr Edit_Off
               stz top_cadre
;-
               pld
               rts
;-
SLineDown      dec a
               sta 17,s
               rts
;--
Thumb          ANOP

               PushWord #0
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _GetDItemValue           |reste dans la pile
;--
               stz Cx_SaveIcon
;--
;              phd                      |SAUVEGARDE AUTOMATIQUE
;              lda MyZp
;              tcd
;              jsr SaveAnIcon
;              pld
;--
               bcc Sthumb
               pla
               lda First_page
               bra Sthumb1

sthumb         pla
sthumb1        sta 17,s
               sta First_page
               tax
;-
               phd
               lda MyZP
               tcd
;-
               txa
               jsr Load_IconBorder
               jsr ShowFIcon
               jsr Edit_Off
               stz Top_cadre
;-
               pld
               rts

               END
;...............................................................
;
;        ShowFIcon : EFFECTUE LE PAINTPIXEL
;
;...............................................................
ShowFIcon      START
               Using GlobalData
               Using SelectIData

               PushLong Ptr_SIconW
               _SetPort

               jsr Eff_Cadre

               lda #26
               sta >DestY
               lda #0
               sta >DestX

               lda Hdl_FIcon            |Affichage buffer icone
               ldx Hdl_FIcon+2
               jsr PaintPixel

               rts

               END
;...............................................................
;
;        Print_Txt : dessine et affiche
;
;...............................................................
Print_Txt      START
               Using GlobalData
               Using ProdosData
               Using SelectIData

               PushLong #0              |Draw line
               _SetSolidPenPat
               _SetPenMode

               PushWord #0
               PushWord #25
               _MoveTo

               PushWord #320
               PushWord #25
               _LineTo

               lda Cx_IconBorder
               bne Print_Border
;--
Print_Icon     ENTRY

               PushLong #RectNameTxt1
               _EraseRect

               PushWord #0
               PushLong #NameTxt1
               _StringWidth
               pla
               sec
               sbc #315
               eor #$FFFF
               inc a

               Pha
               PushWord #9
               _MoveTo
               PushLong #NameTxt1       |nom du fichier
               _DrawString
;--
               PushWord #4
               PushWord #9
               _MoveTo

               lda Top_ItemIcon
               cmp #3
               beq Save
               PushLong #IconTxt
               _DrawString
               rts

save           PushLong #IconTxtS
               _DrawString
               rts
;--
Print_Border   PushWord #4
               PushWord #17
               _MoveTo

               PushLong #BorderTxt
               _DrawString

               rts

               END
;...............................................................
;
;        Edit_Off : Bouton Edit Off
;
;...............................................................
Edit_Off       START
               Using SelectIData

               jsr Print_Txt
;--
               lda Top_ItemIcon
               beq Edit_OffI
               cmp #2
               beq Edit_OffI
               cmp #1
               beq Edit_OffB
               cmp #3
               beq Edit_OffS
               brl NoEdit
;-       
Edit_OffI      PushWord #255            |SELECT OFF
               PushLong #0
               PushLong Ptr_SIconW
               PushWord >ISelect
               _GetControlDItem
               _HiliteControl
               rts
;-
Edit_OffB      PushWord #255            |SELECTB OFF
               PushLong #0
               PushLong Ptr_SIconW
               PushWord >ISelectB
               _GetControlDItem
               _HiliteControl
               rts
;-
Edit_OffS      PushWord #255            |ok Off
               PushLong #0
               PushLong Ptr_SIconW
               PushWord >IOks
               _GetControlDItem
               _HiliteControl
               rts
;--
Edit_On        ENTRY

               lda Top_ItemIcon
               beq Edit_OnI
               cmp #3
               beq Edit_OnS
               cmp #2
               beq Edit_OnI
               cmp #1
               beq Edit_OnB
               bra NoEdit
;-
Edit_OnI       PushWord #0              |SELECT ON
               PushLong #0
               PushLong Ptr_SIconW
               PushWord >ISelect
               _GetControlDItem
               _HiliteControl

NoEdit         rts
;-
Edit_OnB       PushWord #0              |SELECTB ON
               PushLong #0
               PushLong Ptr_SIconW
               PushWord >ISelectB
               _GetControlDItem
               _HiliteControl
               rts
;-
Edit_OnS       PushWord #0              |Ok On
               PushLong #0
               PushLong Ptr_SIconW
               PushWord >IOks
               _GetControlDItem
               _HiliteControl
               rts

               END
;...............................................................
;
;        PSI_Icone : Cherche l'icone CLIQUEE
;
;...............................................................
PSI_Icone      START
               Using GlobalData
               Using SelectIData

               jsr Eff_Cadre            |Effacons l'ancien
;--
               jsr Edit_On
;--                                     |Alors Chargons l'icone
InSide         lda MouseY
               sec
               sbc Rect_Ficone
               ldx Val_Hauteur1
               jsr Pad_Coord
               pha
               sta NewY_2C
               sta Rect_Icone1Y0
               clc
               adc Val_Hauteur
               sta Rect_Icone1Y1
               pla
               clc
               adc Rect_FIcone
               sta Rect_IconeY0
               clc
               adc Val_Hauteur
               sta Rect_IconeY1

               lda MouseX
               ldx Val_Largeur
               jsr Pad_Coord
               sta NewX_2C
               sta Rect_Icone1X0
               sta Rect_IconeX0
               clc
               adc Val_Largeur
               sta Rect_IconeX1
               sta Rect_Icone1X1

               lda #1
               sta Top_Cadre
;--
               lda Top_ItemIcon         |POUR SAVE ICON
               cmp #3
               bne FPSI_Icone

               jsr Copy_ISelectR
               jsr ShowFIcon
               lda #1                   |si ok alors save
               sta Cx_saveIcon
               rts

FPSI_Icone     ANOP
;--
               lda NewY_2C
               cmp OldY_2C
               bne F0PSI_Icone
               lda NewX_2C
               cmp OldX_2C
               bne F0PSI_Icone
;--
               lda EventWhen            |DOUBLE CLICK
               sec
               sbc Double_Click
               cmp #30
               bcs F0PSI_Icone

               jsr Psi_Select

F0PSI_Icone    lda EventWhen
               sta Double_Click

               lda NewY_2C
               sta OldY_2C
               lda NewX_2C
               sta OldX_2C
               rts
;--
Copy_IselectR  ENTRY
               lda #1
               pha
               bra SCopy_Iselect

Copy_Iselect   ENTRY
               lda #0
               pha

SCopy_Iselect  lda UndoBufHdl           |Prepare les Buffers
               ldx UndoBufHdl+2
               jsr Deref
               sta Ptr_Pzero
               stx Ptr_Pzero+2

               jsr D_Hdl_Ficon
;--
;                                       |Mode Deja en Pile
               PushLong Ptr_FIcon       |Copie le Rectangle
               PushLong #Rect_Icone1
               PushLong Ptr_Pzero
               jsl CopyBuf
;--
Scopy_IS       jsr U_Hdl_FIcon          |on libere les buffers

               lda UndoBufHdl
               ldx UndoBufHdl+2
               jsr Unlock

               rts

               END
;...............................................................
;
;        Cadre_Tournant
;
;...............................................................
Cadre_Tournant START
               Using GlobalData
               Using SelectIdata

               lda Top_cadre
               bne ok
ko             rts
;--
ok             dec Time_Cadre
               bpl ko

               lda #50
               sta Time_Cadre
;--
Tourne_Cadre   ENTRY

               PushWord #15             |blanc
               _SetSolidPenPat

               PushWord #2              |eor
               _SetPenMode
;--
               lda Flag_Cadre
               bne Cadre2
;--
Cadre1         lda First_cadre
               beq SCadre1

               PushLong #Pat2
               _SetPenPat

               PushLong #Rect_Icone
               _FrameRect

SCadre1        PushLong #Pat1
               _SetPenPat

               PushLong #Rect_Icone
               _FrameRect

               inc Flag_Cadre

               lda #1
               sta First_Cadre

               rts
;--
Cadre2         lda First_Cadre
               beq SCadre2

               PushLong #Pat1
               _SetPenPat

               PushLong #Rect_Icone
               _FrameRect

SCadre2        PushLong #Pat2
               _SetPenPat

               PushLong #Rect_Icone
               _FrameRect

               stz Flag_Cadre

               lda #1
               sta First_Cadre

               rts
;--------------------------------------
Eff_Cadre      ENTRY

               lda Top_Cadre
               bne SEff_Cadre
               rts

SEff_Cadre     PushWord #15
               _SetSolidPenPat

               lda Flag_Cadre
               beq Eff_Cadre2

Eff_Cadre1     PushLong #Pat1
               _SetPenPat
               bra S0Eff_Cadre

Eff_Cadre2     PushLong #Pat2
               _SetPenPat

S0Eff_Cadre    PushWord #2              |eor
               _SetPenMode

               PushLong #Rect_Icone
               _FrameRect

               PushWord #0              |copie
               _SetPenMode

               stz Flag_Cadre
               stz Time_Cadre
               stz First_Cadre

               rts
;--
               END
;...............................................................
;
;        Ipage_Proc : Affiche le Fond Page BitMap
;
;...............................................................
IPageProc      START
               Using GlobalData
               Using SelectIData

               lda      0,s
               sta      6,s
               lda      2,s
               sta      8,s

               tsc
               clc
               adc      #6
               tcs

               rtl

               END
;...............................................................
;
;        SetClipIS : REDIMENSIONNE LA CLIP REGION
;
;...............................................................
SetClipIS      START
               Using GlobalData
               Using SelectIData

               PushLong #0
               _NewRgn
               pla
               sta ISHdl
               pla
               sta ISHdl+2

               PushLong ISHdl
               _GetClip

               PushLong #FullRect
               _ClipRect

               rts
;--------------------------------------
;-------- Reset -----------------------
;--------------------------------------
ReSetClipIS    ENTRY
               PushLong ISHdl
               _SetClip

               PushLong ISHdl
               _DisposeRgn

               rts

               END
;...............................................................
;
;        Resize_Icon : Ajuste La Taille Du Buffer des ICONS
;
;...............................................................
Resize_Icon    START
               Using GlobalData

               jsr U_Hdl_BIcon          |Unlock Handle
;--
               lda Frame_Icon           |des Icons
               bpl oui

               stz Frame_Icon           |alors zero

oui            PushLong #0
               PushWord Frame_Icon      |nb d'icon
               PushWord Lg_IconRecord   |taille d'1 Icone
               _Multiply
               pla
               plx
               cmp #0
               bne Size

               lda #1                   |au moins 1 octet
;--
Size           Pea $0000
               pha
               PushLong Hdl_BIcon
               _SetHandleSize
;--
               rts

               END
;...............................................................
;
;        PSI_Select : Ajoute une Icone a la Liste
;
;...............................................................
PSI_Select     START
               Using GlobalData
               Using SelectIData
;--
;              lda #1                   |attention pas de Top_Action
;              sta Top_Action           |BUG 16/05/88
;--
               lda Cx_IconBorder        |Border ou Icon
               beq SPSI_Select
;--
Select_Border  jsr Make_Border          |deja une
               jsr D_Hdl_Ficon          |La Page D'icone bordure
               jsr D_Hdl_Border         |le buffer d'icone
;--
               lda Rect_Icone1X1        |-4 pour PAD
               sec
               sbc #4
               sta Rect_Icone1X1
;--
               PushWord #0              |Copie de la Page vers le Buffer
               PushLong Ptr_FIcon       |Copie le Rectangle
               PushLong #Rect_Icone1
               PushLong Ptr_Border
               jsl CopyBuf
;--
               jsr U_Hdl_FIcon          |on libere les buffers
               jsr U_Hdl_Border
               jsr Psi_Cancel
;--
               lda #1
               sta Top_Action
               jsr Recal_Menu           |no Border On

               rts
;--
SPSI_Select    lda Top_ItemIcon
               beq New_Icon
               cmp #2
               beq GotoEditIcon
               rts
;--
GotoEditIcon   jsr Copy_Iselect         |Copy in Undo Pour Load EDIT
               jsr Psi_cancel           |Au revoir
               rts
;--
New_Icon       jsr Eff_Cadre            |Pour ne pas le Copier
;--
               inc Frame_Icon           |et une de plus
               jsr Resize_Icon          |retaille le buffer
;--
               bcc OkNI                 |Pas de place +++
               dec Frame_Icon
               jsr Alert_CCP
               brl FinAI
;--
OkNI           jsr D_Hdl_BIcon          |Buffer des Icones

               PushLong #0              |Ou Placer L'icone
               lda Frame_Icon
               dec a
               pha
               PushWord Lg_IconRecord
               _Multiply
               pla
               plx
               clc
               adc Ptr_BIcon
               sta Ptr_PZero
               lda Ptr_BIcon+2
               adc #0
               sta Ptr_PZero+2
;-
               lda #83                  |Org Y
               sta [Ptr_PZero]
               ldy #2
               lda #138                 |Org X
               sta [Ptr_PZero],y
               ldy #4
               lda #$0E02               |Mode Copie et transparence
               sta [Ptr_Pzero],y
;-
               lda Ptr_PZero            |Pointeur en debut de BitMap
               clc
               adc #6
               sta Ptr_PZero
               bcc SAdd_Icon
               inc Ptr_Pzero+2
;--
SAdd_Icon      jsr D_Hdl_Ficon          |La Page D'icone
;--
               PushWord #0              |Copie de la Page vers le Buffer
               PushLong Ptr_FIcon       |Copie le Rectangle
               PushLong #Rect_Icone1
               PushLong Ptr_Pzero
               jsl CopyBuf
;--
               jsr U_Hdl_FIcon          |on libere les buffers
               jsr U_Hdl_BIcon
;--
               lda Frame_Icon           |icon select
               sta Icon_select
               ora #$0200
               jsr Put_In_List          |Selection dans la liste
               lda Frame_Icon
               jsr Rest_Icon
               jsr Cal_RectIcon
               jsr Copy_RectI
               lda #1
               sta Top_Action
;--
FinAI          jsr Del_Undo
               jsr Psi_Cancel           |Et On Quitte la Fonction

               rts

               END
;...............................................................
;
;        Load_IconBorder : Charge une page ICON ou BORDER (Acc=N%)
;
;...............................................................
Load_IconBorder START
               Using SelectIData

               ldx Cx_IconBorder
               beq LoadIcon
               cpx #1
               beq LoadBorder
               rts
;--
LoadIcon       jsr Load_FileIcon
               rts
;--
LoadBorder     jsr Load_FileBorder
               rts

               END
;...............................................................
;
;        How_IconBorder : combien de fichiers
;
;...............................................................
How_IconBorder START
               Using SelectIData
               Using GlobalData

               ldx Cx_IconBorder
               beq HowIcon
               cpx #1
               beq HowBorder
               rts
;--
HowIcon        lda Nb_NameIcon
               sta Nb_FileIcon
               clc
               rts
;--
HowBorder      lda #3
               sta Nb_FileIcon
               clc
               rts

               END
;...............................................................
;
;        DoEditIcon : passage a l'icone editeur si select icone
;                     passe l'icone
;...............................................................
DoEditIcon     START
               Using GlobalData
               Using SelectIData
;--
               lda Nb_List_Select      |une icone select ?
               cmp #1
               bne NoIcon
               lda List_Select
               xba
               and #$00FF
               cmp #2
               beq OkIcon
;--
NoIcon         ANOP
;--
               lda #3
               sta SegNumber
               jsr Disk_Present
;--
               jsl DoIconEdit
;--
               PushWord MyID
               pea 1
               pea 3
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               rts               
;--
OkIcon         PushLong #0              | space for handle
               PushLong #748            | 748 octets
               PushWord MyID
               PushWord #$0010          | No cross bank boundaries
               PushLong #$0
               _NewHandle
               pla
               sta UndoBufHdl
               pla
               sta UndoBufHdl+2

               jsr Copy_InUndo          |copier l'icone dans buffer Edit

               jsl Pleine_Page          |en plein ecran
;--
               lda #3
               sta SegNumber
               jsr Disk_Present
;--
               jsl DoIconEdit1
;--
               PushWord MyID
               pea 1
               pea 3
               _UnLoadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_Pzero
;              _FindHandle
;              _PurgeHandle
;--
               jsr Copy_InUndoR         |Copier buffer edit dand l'icone page

               PushLong UndoBufHdl      |efface le buffer intermediaire
               _DisposeHandle
               
               jsl Demi_Page

               rts
               
               END
;...............................................................
;
;        AddEditIcon : creation d'une icone par l'editeur
;
;...............................................................
AddEditIcon    START
               Using GlobalData
               Using IconVar

               phb
               phk
               plb
;--
               lda #1
               sta Top_Action
;--
               inc Frame_Icon           |+1 icone
               jsr Resize_Icon
;--
               bcc AddEI                |plus de place
               dec Frame_Icon
               jsr Alert_CCP
               bra FINEI
;--
AddEI          lda Frame_Icon           |icon select
               sta Icon_select
               ora #$0200
               jsr Put_In_List          |Selection dans la liste
               jsr Copy_InUndoR1        |undo dans Icon Buffer
;--
               lda Frame_Icon
               jsr Rest_Icon
               jsr Cal_RectIcon
               jsr Copy_RectI
;--
FINEI          plb

               rtl

               END
;...............................................................
;
;        Psi_Add : choix d'une autre Page
;
;...............................................................
Psi_Add        START
               Using Globaldata
               Using SelectIdata
               Using ProdosData
;--
Ok_Doit        jsr Eff_cadre            |efface le cadre
;--
               PushWord #20
               PushWord #35
               PushLong #TxLoadOther
               PushLong #0
               PushLong #TypeListBM
               PushLong #Reply
               _SFGetFile

               lda Reply_Good
               bne ok
               brl Fin1
;--
ok             ANOP
;--
paint_format   lda Reply_FType
               sta Mode_Load
               sta TypeOfIcon

               lda #reply_fullname
               sta nameptr
               lda #^reply_fullname
               sta nameptr+2

               jsr D_Hdl_FIcon          |le Coince

Rpaint_Format  lda Ptr_FIcon
               ldx Ptr_FIcon+2
               sta adptr
               stx adptr+2

               jsr load_pak
               bcc FIN
               jsr Err_Ressource
               bcc RPaint_Format
               jsr U_Hdl_FIcon
               brl Fin1
;-----
Fin            ANOP
               jsr U_Hdl_FIcon

               jsr Make_NewPage
;-
               stz Cx_SaveIcon          |No Save new page
;--
               jsr Edit_Off             |Off Select Edit
               stz Top_cadre
Fin1           jsr ShowFIcon            |Montre la page
               rts
;--------------------------------------
;        Make_NewPage
;--------------------------------------
Make_NewPage   ENTRY

               jsr Make_NameIcon        |ajoute a la liste

               jsr CH_ScrollBar         |modifie la scrollbar
;-
               ldy #14
LOOP           lda reply_filename,y
               sta NameTxt1,y
               dey
               dey
               bpl LOOP

               rts
;--------------------------------------
;        Make_NameIcon
;--------------------------------------
Make_NameIcon  ANOP

               ldy #128                 |le Full Name
RMNI           lda reply_fullname,y
               sta NameFIcon,y
               dey
               dey
               bpl RMNI

               lda #1
               sta DiskPos
               lda reply_filename
               and #$00FF
               sta FileLg

               lda NameFIcon
               and #$00FF
               sec
               sbc FileLg
               inc a
               sta FilePos

               sep #$20
               longa off

               ldy #2
RFindPfx       lda NameFIcon,y
               cmp #'/'
               beq Find
               iny
               cpy NameFIcon
               bcc RFindPfx
Find           dey
               tya
               sta Disklg
;--
               rep #$20
               longa on
;--
               PushWord #0
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _GetDItemValue
               pla
               sta Poste_Icon

               jsr Insert_Poste

               jsr Copy_Poste
;--
               inc Nb_NameIcon          |+1
               inc Nb_FileIcon

               jsr Test_Item

FinMake        rts
;--------------------------------------
;        Insert_Poste
;--------------------------------------
Insert_Poste   ANOP

               lda Poste_Icon
               inc a
               cmp Nb_NameIcon
               bne okIP
               rts
;--
okIP           lda Nb_NameIcon          |lg du move
               sec
               sbc Poste_icon
               dec a
               PushLong #0
               pha
               PushWord #140
               _Multiply
               pla
               plx
               dec a
               dec a
               sta LgPoste

               PushLong #0              |org
               PushWord Nb_NameIcon
               PushWord #140
               _Multiply
               pla
               plx
               tay

               clc                      |dest
               adc #138
               tax
               dey
               dey

RLIP           lda TableNameIcon,y
               sta TableNameIcon,x
               dey
               dey
               dex
               dex
               dec LgPoste
               dec LgPoste
               bpl RLIP

               rts
;--------------------------------------
;        Copy_Poste
;--------------------------------------
Copy_Poste     ANOP

               lda Poste_Icon
               inc a
               inc a
               PushLong #0
               Pha
               PushWord #140
               _Multiply
               ply
               plx
               ldx #138
               dey
               dey
RCP            lda NameFicon,x
               sta TableNameIcon,y
               dey
               dey
               dex
               dex
               bpl RCP

               rts
;--------------------------------------
;        CH_ScrollBar
;--------------------------------------
CH_ScrollBar   ANOP

               PushWord Nb_FileIcon
               PushWord #-1

               PushLong #0
               PushLong Ptr_SIconW
               PushWord >IScrollBar
               _GetControlDItem

               _SetCtlParams

               PushWord #0
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _GetDItemValue
               pla
               inc a
               sta First_page
               pha
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _SetDItemValue

               rts
;--
LgPoste        ds 2

               END
;...............................................................
;
;        Copy_InUndo : Copie Buffer Shape -> Buffer UNDO ICONEDIT
;                     
;...............................................................
Copy_InUndo    START
               Using GlobalData
               Using SelectIData
;--               
               lda #0                   |de shape vers UndoBuffer  
               sta Mode_Copie 
               bra SCopy_InUndo
;--
Copy_InUndoR   ENTRY
               lda #1                   |de UndoBuffer vers Shape  
               sta Mode_Copie                          
               bra SCopy_InUndo
;--
Copy_InUndoR1  ENTRY
               lda #2
               sta Mode_Copie
;--
SCopy_InUndo   lda UndoBufHdl           |coince le undo buffer
               ldx UndoBufHdl+2
               jsr Deref
               sta Ptr_Pzero
               stx Ptr_Pzero+2
;--
               jsr D_Hdl_BIcon          |Deref la liste des icones
;--
               PushLong #0
               lda List_Select
               and #$00FF
               Pha                      |n% de Shape
               PushWord lg_IconRecord   |taille d'1 Shape
               _Multiply
               pla
               plx
               dec a
               dec a
               tay
;--
               lda Lg_IconRecord
               sec
               sbc #8
               tax
;--
               lda Mode_Copie
               bne Loop1
;--               
LOOP           lda [Ptr_BIcon],y
               phy
               txy
               sta [Ptr_PZero],y
               ply
               dey
               dey
               dex
               dex
               bpl LOOP
               bra SCopie
;--               
LOOP1          phy
               txy
               lda [Ptr_PZero],y
               ply
               sta [Ptr_BIcon],y
               dey
               dey
               dex
               dex
               bpl LOOP1
;-
               lda Mode_Copie           |Si Creation (Y,X,Mode)
               cmp #2
               bne SCopie

               lda #$0E02               |Mode Copie et transparence
               sta [Ptr_BIcon],y
               dey
               dey
               lda #160                 |Org X
               sta [Ptr_BIcon],y
               dey
               dey
               lda #100                 |Org Y
               sta [Ptr_BIcon],y
;--
SCopie         jsr U_Hdl_BIcon          |UnLock les buffers
               lda UndoBufHdl
               ldx UndoBufHdl+2
               jsr Unlock

               rts
               
Mode_Copie     ds 2               

               END
;...............................................................
;
;        Psi_OkS :
;
;...............................................................
Psi_OkS        START
               Using SelectIData
               Using GlobalData
               Using ProdosData
               Using IconVar
;--
               jsr SaveAnIcon
               bcc GOOD
               rts
;--
GOOD           jsr Psi_CancelS
               rts

               END
;...............................................................
;
;        Psi_CancelS
;
;...............................................................
Psi_CancelS    START

               jsr Psi_Cancel           |idem

               rts

               END
;...............................................................
;
;        Psi_AddS
;
;...............................................................
Psi_AddS       START

               jsr SaveAnIcon           |sauve si pb DEHORS
               bcc ok
               rts

ok             jsr Psi_Add              |Idem

               rts

               END
;...............................................................
;
;        SaveAnIcon : sauve l'icone si modif
;
;...............................................................
SaveAnIcon     START
               Using SelectIData
               Using GlobalData

               lda Cx_saveIcon
               bne ok
FSaveIcon      clc
               rts
;--
ok             jsr Eff_Cadre
               jsr Call_SPakIcon
               bcc good
               jsr ShowFIcon
               sec
               rts
;--
good           lda #0
               sta IcModified
               stz Cx_SaveIcon
               bra FSaveIcon
;--
               rts

               END
;...............................................................
;
;        Call_SPakIcon
;
;...............................................................
Call_SPakIcon  START
               Using ProdosData
;--
               ldy #128                 |copie le full name
RCRFN          lda Reply_FullName,y
               sta ZRFN,y
               dey
               dey
               bpl RCRFN
;--
               lda #0

               sep #$30
               longa off
               longi off

               lda Reply_Fullname
               tay
RSearch        lda Reply_Fullname,y
               cmp #'/'
               beq FindSlash
               dey
               bne RSearch
;--
FindSlash      tya
               clc
               adc TNamePIcon
               sta Reply_FullName
;--
               iny
               ldx #1
;--
RMetNom        lda TnamePIcon,x
               sta Reply_FullName,y
               iny
               inx
               cpx TnamePIcon
               bcc RMetNom
               beq RMetNom

               rep #$30
               longa on
               longi on
;--
               jsr Save_PakIcon         |le nom est change on sauve
               bcc ok                   |probleme
ko             rts
;--
ok             lda #ZRFN                |delete l'ancien
               sta DestroyNamePtr
               sta New_ReNamePtr
               lda #^ZRFN
               sta DestroyNamePtr+2
               sta New_ReNamePtr+2
               _Destroy DestroyParams
               bcs ko
;--
               lda #Reply_FullName
               sta RenamePtr
               lda #^Reply_FullName
               sta RenamePtr+2
               _ChangePath RenameParams
               bcs ko
;--
               ldy #128                 |copie le full name
RCRFN1         lda ZRFN,y
               sta Reply_FullName,y
               dey
               dey
               bpl RCRFN1
;--
               clc
               rts

ZRFN           ds 130
TNamePIcon     str 'SHSHBH'

               END
;...............................................................
;
;        Psi_NewPageS
;
;...............................................................
Psi_NewPageS   START
               Using selectIdata
               Using GlobalData
               Using ProdosData
;--
               jsr SaveAnIcon
               bcc Ok_Doit
               rts
;--
Ok_Doit        jsr Eff_Cadre
;--
               PushWord #20
               PushWord #35
               PushLong #TxSaveIcon
               PushLong #TxUntitled
               PushWord #15
               PushLong #Reply
               _SFPutFile

               lda reply_good
               bne OkSave
               jsr ShowFIcon
               rts
;--
OkSave         jsr D_Hdl_FIcon          |Coince

               ldy #$7CFE
               lda #$EEEE
Loop           sta [Ptr_FIcon],y
               dey
               dey
               bpl Loop

               jsr U_Hdl_FIcon          |libere
;--
               jsr Save_PakIcon         |save File
               bcc Good
;--
NoGood         ANOP
               lda First_page           |Retrouver la page
               jsr Load_FileIcon        |precedente
               jsr ShowFIcon
               rts
;--
Good           ANOP
               stz Top_cadre            |no cadre
               jsr Make_NewPage
               jsr ShowFIcon
               jsr Print_Txt
;--
               stz Cx_SaveIcon          |si ok no save

               rts

               END
;...............................................................
;
;        Psi_Remove : supprime de la liste
;
;...............................................................
Psi_Remove     START
               Using globaldata
               Using SelectIData

ok_Doit        jsr Delete_Name

               dec Nb_FileIcon
               dec Nb_NameIcon

               jsr Ch_ScrollBar_R
               jsr Load_FileIcon        |code dans Acc
               jsr ShowFicon
               jsr Print_Txt

               jsr Test_Item

               stz Cx_SaveIcon

               rts
;--------------------------------------
;        Delete_Name
;--------------------------------------
Delete_Name    ANOP

               lda First_Page
               inc a
               cmp Nb_NameIcon
               bne ok
               rts
;--
ok             lda Nb_NameIcon
               sec
               sbc first_page
               dec a
               PushLong #0
               pha
               PushWord #140
               _Multiply
               pla
               plx
               dec a
               dec a
               sta lg_poste

               PushLong #0
               PushWord First_Page
               PushWord #140
               _Multiply
               ply
               plx

               tya
               clc
               adc #140
               tax
;--
RDNI           lda TableNameIcon,x
               sta TableNameIcon,y
               inx
               inx
               iny
               iny
               dec lg_Poste
               dec lg_Poste
               bpl RDNI

               rts
;--------------------------------------
;        CH_ScrollBar_R
;--------------------------------------
CH_ScrollBar_R ANOP
;--
               PushWord #0
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _GetDItemValue
               pla

               cmp Nb_FileIcon
               bcc SCHSBR
               dec a
               sta First_page
               Pha
               PushLong Ptr_SIconW
               PushWord IScrollBar
               _SetDItemValue
               bra S0CHSBR

SCHSBR         sta First_page
;--
S0CHSBR        PushWord Nb_FileIcon
               PushWord #-1

               PushLong #0
               PushLong Ptr_SIconW
               PushWord >IScrollBar
               _GetControlDItem

               _SetCtlParams

               lda First_page

               rts

lg_poste       ds 2

               END
;...............................................................
;
;        Psi_RemoveS : Supprime de la liste
;
;...............................................................
Psi_RemoveS    START
;--
               jsr SaveAnIcon
               bcc Ok_Doit
               rts
;--
Ok_Doit        jsr Psi_Remove

               rts

               END
;...............................................................
;
;        DATA DE SELECTION DES ICONES
;
;...............................................................
SelectIData    DATA

Mode_Load      ds 2
Mode_Paint     gequ $00C0
Mode_Screen    gequ $00C1

Top_ItemIcon   ds 2                     |0 Icon 1 Border 2 load 3 Save Icon
First_Page     dc i'0'
First_PageI    dc i'0'
First_PageB    dc i'0'

Poste_Icon     ds 2                     |rang de l'icone file

Cx_IconBorder  ds 2                     |Select Icons(0) Or Borders(1)
Cx_SaveIcon    ds 2                     |0 No Save 1 Save

Ptr_SIconW     ds 4

EndSIcon       ds 2                     |fin de fonction
SItemHit       ds 2                     |Item Selectionne

Old_FIcon      ds 2                     |ne pas charger une precedente
;--
ISelect        anop
               dc i'20'                 | identification number
               dc i'13,8,24,78'         | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'SelectTxt'         | item descriptor
               dc i'0'                  | item value
               dc i'$FF00'              | bit vector flag
               dc i4'0'                 | color table pointer

ICancel        anop
               dc i'21'                 | identification number
               dc i'13,86,24,156'       | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'CancelTxt'         | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

IAdd           anop
               dc i'22'                 | identification number
               dc i'13,164,24,234'      | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'AddTxt'            | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

IRemove        anop
               dc i'23'                 | identification number
               dc i'13,242,24,312'      | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'RemoveTxt'         | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer
;--------------
IOkS           anop
               dc i'24'                 | identification number
               dc i'13,00,24,60'        | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'OkTxtS'            | item descriptor
               dc i'0'                  | item value
               dc i'$FF00'              | bit vector flag
               dc i4'0'                 | color table pointer

ICancelS       anop
               dc i'25'                 | identification number
               dc i'13,65,24,125'       | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'CancelTxt'         | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

IAddS          anop
               dc i'26'                 | identification number
               dc i'13,130,24,190'      | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'AddTxt'            | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

IRemoveS       anop
               dc i'27'                 | identification number
               dc i'13,195,24,255'      | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'RemoveTxt'         | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

INewPageS      anop
               dc i'28'                 | identification number
               dc i'13,260,24,320'      | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'NewPageTxt'        | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer
;--
IScrollBar     anop
               dc i'29'                 | identification number
               dc i'26,308,200,320'     | display rectangle
               dc i'ScrollBarItem'      | item type
               dc i4'IS_ScrollBar'      | item descriptor
               dc i'0'                  | item value 0
               dc i'3'                  | bit vector flag
               dc i4'0'                 | color table pointer

IPage          anop
               dc i'30'                 ; identification number
IPageRect      dc i'26,0,200,308'       ; display rectangle
               dc i'UserItem'           ; item type
               dc i4'IPageProc'         ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer
;--
ISelectB       anop
               dc i'20'                 | identification number
               dc i'5,136,20,191'       | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'SelectTxt'         | item descriptor
               dc i'0'                  | item value
               dc i'$FF00'              | bit vector flag
               dc i4'0'                 | color table pointer

ICancelB       anop
               dc i'21'                 | identification number
               dc i'5,227,20,282'       | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'CancelTxt'         | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

SelectTxt      str 'Select'
AddTxt         str 'Add'
RemoveTxt      str 'Remove'
EditTxt        str 'Edit'
CancelTxt      str 'Cancel'
OkTxtS         str 'Ok'
NewPageTxt     str 'New'

NameTxt1       ds 17

TxUntitled     str 'Untitled'

RectNameTxt1   dc i'00,130,13,320'

IconTxt        str 'Select an Icon'
IconTxtS       str 'Save an Icon'
BorderTxt      str 'Select a Border'

               END

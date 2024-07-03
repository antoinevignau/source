;-----------------------------------------------------------------
;
; FILE : SHOWSTICKER.S                  - Choix d'un Sticker -
;        -------------
;-----------------------------------------------------------------
;...............................................................
;
;        Creation du MODELESSDIALOG
;
;...............................................................
DoSticker      START
               Using GlobalData
               Using WindowData
               Using ProdosData
;--
DoSticker1     ENTRY                    |par Cartouche
;--
               lda Mode_ShowOff
               cmp #Mode_Rien
               bne Sticker_Go
               rts
;--
Sticker_Go     ANOP
;              PushLong Ptr_OptionW
;              _SetPort
;
;              PushLong #RectStickers   |cadre dans Cartouche
;              _InvertRect
;--
SDoSticker     lda #Haut_Sticker        |init cadre sticker
               sta Val_Hauteur
               inc a
               sta Val_Hauteur1

               lda #Larg_Sticker
               sta Val_Largeur

               lda #0
               sta EndSticker           |fin dialog
               sta Top_cadre
               sta First_cadre
               sta Flag_cadre
               sta Time_cadre
;--
               lda #1
               sta Top_rect9
;--
               lda #$FFFF
               sta OldX_2C
               sta OldY_2C
;--
               PushLong #0              |sauve le port
               _GetPort
;--
               jsr Alloc_FIcon          |y mettre les Stickers
               bcc ok000
               jsr Alert_CCP
Ko010          ANOP
               lda #0                   |remettre la fleche
               sta Choix_option
               jsr In_Option1
;              PushLong Ptr_OptionW
;              _SetPort
;              PushLong #RectStickers
;              _InvertRect
               _SetPort
               rts
;--
ok000          jsr Alloc_IoStk          |y loader les Stickers 1 par 1 (1716)
               jsr Loadpagestick
               bcc ok00
               jsr Dealloc_FIcon
               jsr Dealloc_IoStk
               bra ko010
;--
ok00           jsl Pleine_Page          |en plein ecran

ok1            jsr Make_StickerW        |Creation du Dialog
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
               jsr Cadre_Tournant       |procedure de showiselect
               bra NextEvent
;--
HdlEvent       ANOP
               PushWord #0
               PushLong #EventRecord
               PushLong #Ptr_SStickerW
               PushLong #SkItemHit
               _DialogSelect
               pla
               beq NextEvent

               lda SkItemHit
               sec
               sbc #20
               asl a
               tax
               jsr (CHXSTICKER,x)

               lda EndSticker
               beq NextEvent

               jsr Menu_On_Off
;--------------------------------------
;        On Ferme
;--------------------------------------
FDoSticker     PushLong Ptr_SstickerW
               _CloseDialog

F0DoSticker    ANOP
               lda #0                   |remettre la fleche
               sta Choix_option
               jsr In_Option1
               _SetPort
;--
               jsr Dealloc_Ficon
               jsr Dealloc_IoStk
;--
               jsl Demi_Page

               rts
;--------------------------------------
;   TABLES DES COMMANDES
;--------------------------------------
CHXSTICKER     ANOP
               dc i'STK_Select'         |20 Select
               dc i'STK_Cancel'         |21 Cancel
               dc i'STK_SMC'            |22 See More Choices
               dc i'STK_FPSD'           |23 From Print Shop Disk
               dc i'STK_Sticker'        |24 click in Sticker
;--------------------------------------
;        Make_StickerW
;--------------------------------------
Make_StickerW  ENTRY
               PushLong #0              | dialogPtr
               PushLong #FullRect       | content rectangle
               PushLong #0              | no title
               PushLong #$FFFFFFFF      | bring to front
               PushWord #$0020          | frame
               PushLong #20             | Refcon
               PushLong #FullRect       | full size
               _NewModelessDialog
               pla
               sta Ptr_SStickerW
               pla
               sta Ptr_SStickerW+2
;--
               PushLong Ptr_SStickerW
               _SetPort
;--
               PushLong Ptr_SstickerW   |4 Controls Pour STICKERS
               PushLong #ISelectK
               _GetNewDItem

               PushLong Ptr_SstickerW
               PushLong #ICancelK
               _GetNewDItem

               PushLong Ptr_SstickerW
               PushLong #ISMCK
               _GetNewDItem

               PushLong Ptr_SstickerW
               PushLong #IFPSDK
               _GetNewDItem

               PushLong Ptr_SstickerW
               PushLong #SPage
               _GetNewDItem

               PushWord #0
               PushWord #14
               _MoveTo

               PushWord #320
               PushWord #14
               _LineTo

               PushWord #4
               PushWord #11
               _MoveTo

               PushLong #StickerTxt
               _DrawString

               jsr ShowFSticker
               rts
;--------------------------------------
;        SpageProc
;--------------------------------------
SpageProc      ANOP
               lda 0,s
               sta 6,s
               lda 2,s
               sta 8,s
               tsc
               clc
               adc #6
               tcs
               rtl
;--------------------------------------
;        STK_Select
;--------------------------------------
STK_Select     ANOP
               inc EndSticker
               jsr New_Sticker
               rts
;--------------------------------------
;        STK_Cancel
;--------------------------------------
STK_Cancel     ANOP
               inc EndSticker
               rts
;--------------------------------------
;        STK_SMC
;--------------------------------------
STK_SMC        ANOP
;--
               stz Load_What
               jsr Eff_cadre
;--
               PushWord #20
               PushWord #35
               PushLong #SmcTxtK
               PushLong #Filtre_Sticker
               PushLong #TypeListSMC
               PushLong #Reply
               _SFGetFile

               jsr ShowFSticker

               lda Reply_Good
               beq FSTK_SMC
;--
               jsr D_Hdl_FIcon
               jsr D_Hdl_IoStk

               lda #0
               sta Num_Sticker
               jsr Load_Sticker
               bcs SSTK_SMC
;--
               lda #8
               sta Num_Sticker
               jsr Create_Sticker
               lda #0
               sta Top_Cadre
               lda #1
               sta Top_Rect9
               jsr Select_K_Off
;--
SSTK_SMC       jsr U_Hdl_Ficon
               jsr U_Hdl_IoStk
               jsr ShowFSticker

FSTK_SMC       rts
;--------------------------------------
;        STK_FPSD
;--------------------------------------
STK_FPSD       ANOP
;--
               lda #1
               sta Load_What
               jsr Eff_Cadre
;--
               PushWord #20
               PushWord #35
               PushLong #FPSDTxtK
               PushLong #Filtre_Sticker
               PushLong #TypeListFPSD
               PushLong #Reply
               _SFGetFile

               jsr ShowFSticker

               lda Reply_Good
               beq FPSTK_FPSD
;--
               jsr Create_PageSTK       |charger + mise en forme
               lda #0
               sta Top_Cadre
               sta Top_Rect9
               jsr Select_K_Off
               jsr ShowFSticker

FPSTK_FPSD     rts
;--------------------------------------
;        Create_PageStk
;--------------------------------------
Create_PageSTK ANOP
               _WaitCursor

               jsr D_Hdl_FIcon
               jsr D_Hdl_IoStk
;--
               ldy #$7CFE               |init a blanc
               lda #$FFFF
RLoop          sta [Ptr_FIcon],y
               dey
               dey
               bpl RLoop
;--
SCPSTK         lda #0
               sta Num_Sticker

RCPSTK         ANOP
               jsr Load_Sticker         |load dans buffer
               bcs S0CPSTK
;--
               jsr Create_Sticker       |fabrique l'image

               inc Num_Sticker          |suivante

               lda Num_Sticker
               cmp #8
               bcc RCPSTK

S0CPSTK        jsr U_Hdl_FIcon
               jsr U_Hdl_IoStk

               _InitCursor

               rts
;--------------------------------------
;        Load_Sticker
;--------------------------------------
Load_Sticker   ANOP

               lda #Reply_FullName
               sta NamePtr
               lda #^Reply_FullName
               sta NamePtr+2

               _Open OpenParams
               bcc SMarkStk
               rts
;--
SMarkStk       ANOP
               Lda OpenId
               sta ReadId
               sta CloseId
               sta SetMarkId

               PushLong #0
               PushWord Num_Sticker
               PushWord #1716
               _Multiply
               pla
               plx

               sta SetMarkPos
               stz SetMarkPos+2

               _SetMark SetMarkParams
               bcc ReadStk
               bra Err1_LdSTK
;--
ReadStk        lda Ptr_IoStk
               sta ReadDest
               lda Ptr_IoStk+2
               sta ReadDest+2

               lda #1716
               sta ReadLg
               stz ReadLg+2

               _Read ReadParams
               bcc CloseStk
               bra Err1_LdStk
;--
CloseStk       _Close CloseParams
               bcs Err1_LdStk
               rts
;--
Err1_LdStk     _Close CloseParams
               sec
               rts
;--------------------------------------
;        Create_Sticker
;--------------------------------------
Create_Sticker ANOP

               lda #0                   |init variable
               sta Plan_sticker
               sta Index_BStk
               sta Index_BPlan
               sta Poids_Stk
               lda #7
               sta Bit_Stk

               lda Num_Sticker          |position a l'ecran
               asl a
               tay
               lda Tab_DestStkX,y
               sta Dest_StkX
               lda Tab_DestStkY,y
               sta Dest_StkY
;--
               lda Ptr_IoStk            |pointeur sticker
               sta Ptr_PK0
               lda Ptr_IoStk+2
               sta Ptr_PK0+2

               lda Ptr_PK0              |plan 1
               clc
               adc #572
               sta Ptr_PK1
               lda Ptr_PK0+2
               adc #0
               sta Ptr_PK1+2

               lda Ptr_PK1              |plan 2
               clc
               adc #572
               sta Ptr_PK2
               lda Ptr_PK1+2
               adc #0
               sta Ptr_PK2+2
;--
               lda Ptr_FIcon            |calcul a l'ecran
               sta Ptr_PZero
               lda Ptr_FIcon+2
               sta Ptr_PZero+2
;--
               lda Dest_StkX
               lsr a
               clc
               adc Ptr_PZero
               sta Ptr_Pzero

               PushLong #0
               PushWord Dest_StkY
               PushWord #160
               _Multiply
               pla
               plx
               clc
               adc Ptr_PZero
               sta Ptr_PZero
;--
               lda #$0000
;--
Ret            sep #$20
               longa off
;-------
trtPlan0       ldy index_BStk           |plan 0
               lda [Ptr_PK0],y
               ldx Bit_Stk
               and Tab_Bit_Stk,x
               bne plan0set
;-
plan0clear     lda Poids_Stk            |init a zero
               bne trtPlan1
               ldy Index_Bplan
               sta [Ptr_PZero],y
               bra trtPlan1
;-
plan0set       lda Poids_Stk
               beq plan0SetH
;
plan0SetL      ldy Index_BPlan
               lda [Ptr_Pzero],y
               ora #$01
               sta [Ptr_Pzero],y
               bra trtPlan1
;
plan0SetH      ldy Index_BPlan
               lda #$10
               sta [Ptr_Pzero],y
;-------
trtPlan1       ldy index_BStk           |plan 1
               lda [Ptr_PK1],y
               ldx Bit_Stk
               and Tab_Bit_Stk,x
               beq trtPlan2
;-
plan1set       lda Poids_Stk
               beq plan1SetH
;
plan1SetL      ldy Index_BPlan
               lda [Ptr_Pzero],y
               ora #$02
               sta [Ptr_Pzero],y
               bra trtPlan2
;
plan1SetH      ldy Index_BPlan
               lda [Ptr_Pzero],y
               ora #$20
               sta [Ptr_Pzero],y
;-------
trtPlan2       ldy index_BStk           |plan 2
               lda [Ptr_PK2],y
               ldx Bit_Stk
               and Tab_Bit_Stk,x
               beq ColorPlan
;-
plan2set       lda Poids_Stk
               beq plan2SetH
;
plan2SetL      ldy Index_BPlan
               lda [Ptr_Pzero],y
               ora #$04
               sta [Ptr_Pzero],y
               bra ColorPlan
;
plan2SetH      ldy Index_BPlan
               lda [Ptr_Pzero],y
               ora #$40
               sta [Ptr_Pzero],y
;--
ColorPlan      lda Poids_Stk
               beq ColorH
;--
ColorL         ldy Index_BPlan
               lda [Ptr_Pzero],y
               tax
               and #$F0
               sta [Ptr_Pzero],y
               txa
               and #$0F
               tax
               lda TabColK,x
               ora [Ptr_Pzero],y
               sta [Ptr_Pzero],y
               bra suitek
;--
ColorH         ldy Index_BPlan
               lda [Ptr_Pzero],y
               tax
               and #$0F
               sta [Ptr_Pzero],y
               txa
               and #$F0
               lsr a
               lsr a
               lsr a
               lsr a
               tax
               lda TabColK,x
               asl a
               asl a
               asl a
               asl a
               ora [Ptr_Pzero],y
               sta [Ptr_Pzero],y
;--
suiteK         rep #$20
               longa on
;--
               inc Poids_Stk
               lda Poids_Stk
               cmp #2
               bcc suitek2
               stz Poids_Stk
;--
suitek1        inc Index_BPlan
               lda Index_BPlan
               cmp #44
               bcc Suitek2
               stz index_BPlan
               lda Ptr_Pzero
               clc
               adc #160
               sta Ptr_Pzero
;--
Suitek2        dec Bit_Stk
               bpl Suitek3
               lda #7
               sta Bit_Stk
               inc Index_BStk
               lda Index_BStk
               cmp #572
               beq Stop_Stk
;--
Suitek3        lda #0
               brl Ret
;--
Stop_Stk       rts
;--------------------------------------
;        ShowFSticker
;--------------------------------------
ShowFSticker   ANOP
;--
               PushLong Ptr_SstickerW
               _SetPort

               jsr D_Hdl_FIcon
               sta aPicPtr
               stx aPicPtr+2

               PushLong #aLocInfo              |ptr param block dest
               PushLong #SrcRectK              |source rect
               PushWord #14                    |destX
               PushWord #17                    |destY
               PushWord #0                     |mode
               _PPToPort

               jsr U_Hdl_FIcon

               rts
;--------------------------------------
;        LoadPageStick
;--------------------------------------
LoadPageStick  ANOP
               lda #NamePageStick
               sta NamePtr
               lda #^NamePageStick
               sta NamePtr+2
               lda #$c0
               sta TypeOfIcon
               jsr Sload_FileIcon
               rts
;--------------------------------------
;        Filtre_Sticker
;--------------------------------------
Filtre_Sticker ANOP
;--
               phb
               phd

               phk
               plb

               lda MyZp
               tcd
;--
               lda 7,s
               sta Ptr_Pzero
               lda 9,s
               sta Ptr_Pzero+2
;--
               ldy #$10
               lda [Ptr_Pzero],y
               and #$00FF
               cmp #$06                 |bin
               beq filtre_s
               cmp #$F8                 |stickers page
               beq filtre_1
               cmp #$0F                 |directory
               beq okfiltre
;--
kofiltre       lda #0
               sta 11,s
               bra FFiltre_Sticker
;--
filtre_1       lda Load_What            |1 sticker seul
               bne kofiltre

               ldy #$1F                 |aux type = $C323
               lda [Ptr_Pzero],y
               cmp #$C323
               bne kofiltre

               bra okfiltre
;--
filtre_s       lda Load_What
               beq kofiltre

               ldy #$1F
               lda [Ptr_Pzero],y
               cmp #$2000
               bne kofiltre

               ldy #$13
               lda [Ptr_Pzero],y
               cmp #$001C
               bne kofiltre
;--
okfiltre       lda #2
               sta 11,s
;--
FFiltre_Sticker ANOP

               pld
               plb

               lda 0,s
               sta 4,s
               lda 2,s
               sta 6,s

               tsc
               clc
               adc #4
               tcs

               rtl
;--------------------------------------
;        Stk_Sticker
;--------------------------------------
Stk_Sticker    ANOP
;--
               lda #0
               sta Rect_Stick_On
;--
RTst_Sticker   pha
               PushWord #0
               PushLong #EventWhere
               asl a
               asl a
               tax
               lda TabRectStk+2,x
               pha
               lda TabRectStk,x
               pha
               _PtInRect
               pla
               bne Inside
;--
outside        pla
               inc a
               cmp #9
               bcc RTst_Sticker
NoInside       rts
;--
Inside         pla
               cmp #8
               bne SInside

               tax
               lda Top_Rect9
               beq NoInside
               txa

SInside        sta Rect_Stick_On
;--
               jsr Eff_Cadre

               lda Rect_Stick_On
               asl a
               asl a
               asl a
               tay
               ldx #0

RCP_Stk        lda RectStk1,y
               sta Rect_Icone1,x
               sta Rect_Icone,x
               inx
               inx
               iny
               iny
               cpx #8
               bcc RCP_Stk
;--
               jsr Select_K_On
;--
               lda #1
               sta Top_cadre
;--
               lda MouseX
               sta NewX_2C
               lda MouseY
               sta NewY_2C
;--
               lda NewY_2C
               cmp OldY_2C
               bne FStk_sticker
               lda NewX_2C
               cmp OldX_2C
               bne FStk_sticker
;--
               lda EventWhen            |DOUBLE CLICK
               sec
               sbc Double_Click
               cmp #30
               bcs FStk_sticker
;--
               jsr Stk_Select

FStk_sticker   lda EventWhen
               sta Double_Click

               lda NewY_2C
               sta OldY_2C
               lda NewX_2C
               sta OldX_2C
               rts
;--------------------------------------
;          Select On Off
;--------------------------------------
Select_K_Off   ANOP
               PushWord #$FF
               bra SSKOffOn

Select_K_On    ANOP
               PushWord #0
SSKOffOn       PushLong #0
               PushLong Ptr_SStickerW
               PushWord ISelectK
               _GetControlDItem
               _HiliteControl

               rts
;--------------------------------------
;        New_Sticker
;--------------------------------------
New_Sticker    ANOP
;--
               jsr Eff_Cadre            |Pour ne pas le Copier
;--
               inc Frame_Sticker        |et une de plus
               jsr Resize_Sticker       |retaille le buffer
;--
               bcc OkNS                 |Pas de place +++
               dec Frame_Sticker
               jsr Alert_CCP
               brl FinNS
;--
OkNS           jsr D_Hdl_Sticker        |Buffer des Stickers

               PushLong #0              |Ou Placer L'icone
               lda Frame_Sticker
               dec a
               pha
               PushWord Lg_StickerRecord
               _Multiply
               pla
               plx
               clc
               adc Ptr_Sticker
               sta Ptr_PZero
               lda Ptr_Sticker+2
               adc #0
               sta Ptr_PZero+2
;-
               lda #74                  |Org Y
               sta [Ptr_PZero]
               ldy #2
               lda #116                 |Org X
               sta [Ptr_PZero],y
               ldy #4
               lda #$0F02               |Mode Copie et transparence
               sta [Ptr_Pzero],y
;-
               lda Ptr_PZero            |Pointeur en debut de BitMap
               clc
               adc #6
               sta Ptr_PZero
               bcc SAdd_Sticker
               inc Ptr_Pzero+2
;--
SAdd_Sticker   jsr D_Hdl_Ficon          |La Page D'icone
;--
               PushWord #0              |Copie de la Page vers le Buffer
               PushLong Ptr_FIcon       |Copie le Rectangle
               PushLong #Rect_Icone1
               PushLong Ptr_Pzero
               jsl CopyBuf
;--
               jsr U_Hdl_FIcon          |on libere les buffers
               jsr U_Hdl_Sticker
;--
               lda Frame_Sticker        |icon select
               sta Sticker_Select
               ora #$0500               |+++ sticker
               jsr Put_In_List          |Selection dans la liste
               lda Frame_Sticker
               jsr Rest_Sticker
               jsr Cal_RectSticker
               jsr Copy_RectK

               lda #1
               sta >Top_Action
;--
FinNS          jsr Del_Undo

               rts
;--------------------------------------
;        DATA STICKER
;--------------------------------------
Load_What      ds 2                     |0 1 sticker :: 1 des stickers

NameSticker    str 'Graphic.CGT'
NamePageStick  str '1/Sticker/Sticker'
Num_sticker    ds 2

Top_Rect9      ds 2
Rect_Stick_On  ds 2

Tab_DestStkX   dc i'14,116,218,14,116,218,14,116,218'
Tab_DestStkY   dc i'17,17,17,72,72,72,127,127,127'

Dest_StkX      ds 2
Dest_StkY      ds 2

Plan_Sticker   ds 2
Index_BStk     ds 2
Index_BPlan    ds 2
Bit_Stk        ds 2
Poids_Stk      ds 2

Tab_Bit_Stk    dc i1'%00000001'
               dc i1'%00000010'
               dc i1'%00000100'
               dc i1'%00001000'
               dc i1'%00010000'
               dc i1'%00100000'
               dc i1'%01000000'
               dc i1'%10000000'

Tab_Plan       dc i1'%0001000,%00000001'
               dc i1'%0010000,%00000010'
               dc i1'%0100000,%00000100'

TabColK        dc i1'$0f,$09,$07,$06,$04,$0A,$03,$0'
SrcRectK       dc i'17,14,179,306'
;--------------------------------------
EndSticker     ds 2
Ptr_SstickerW  ds 4                     |Ptr Fenetre
SKItemHit      ds 2                     |Item Selectionne
;--------------------------------------
ISelectK       anop
               dc i'20'                 | identification number
               dc i'1,136,13,191'       | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'SelectTxtK'        | item descriptor
               dc i'0'                  | item value
               dc i'$FF00'              | bit vector flag
               dc i4'0'                 | color table pointer

ICancelK       anop
               dc i'21'                 | identification number
               dc i'1,227,13,282'       | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'CancelTxtK'        | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

ISMCK          anop
               dc i'22'                 | identification number
               dc i'180,8,195,156'      | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'SMCTxtK'           | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

IFPSDK         anop
               dc i'23'                 | identification number
               dc i'180,164,195,312'    | display rectangle
               dc i'ButtonItem'         | item type
               dc i4'FPSDTxtK'          | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

SPage          anop
               dc i'24'                 | identification number
               dc i'17,14,179,306'      | display rectangle
               dc i'UserItem'           | item type
               dc i4'SpageProc'         | item descriptor
               dc i'0'                  | item value
               dc i'0'                  | bit vector flag
               dc i4'0'                 | color table pointer

SelectTxtK     str 'Select'
CancelTxtK     str 'Cancel'
SMCTxtK        str 'See more choices'
FPSDTxtK       str 'From Print Shop Disk'

TypeListFPSD   dc i1'01,06'
TypeListSMC    dc i1'01,$F8'

StickerTxt     str 'Select a Sticker'

RectStk1       dc i'17,14,69,102'
RectStk2       dc i'17,116,69,204'
RectStk3       dc i'17,218,69,306'

RectStk4       dc i'72,14,124,102'
RectStk5       dc i'72,116,124,204'
RectStk6       dc i'72,218,124,306'

RectStk7       dc i'127,14,179,102'
RectStk8       dc i'127,116,179,204'
RectStk9       dc i'127,218,179,306'

TabRectStk     ANOP
               dc i4'RectStk1'
               dc i4'RectStk2'
               dc i4'RectStk3'
               dc i4'RectStk4'
               dc i4'RectStk5'
               dc i4'RectStk6'
               dc i4'RectStk7'
               dc i4'RectStk8'
               dc i4'RectStk9'

               END
;...............................................................
;
;        Redraw_Sticker : Reaffichage des Stickers
;
;...............................................................
Redraw_Sticker START
               Using GlobalData
;--
               lda Frame_Sticker
               bne ok
               rts
;--
ok             lda #1                   |la 1er
               sta ZFrame_Sticker

               jsr D_Hdl_Sticker        |le Buffer

               lda Ptr_Sticker
               sta Ptr_PZero
               lda Ptr_Sticker+2
               sta Ptr_PZero+2
;--
Loop           jsr Put_Sticker          |Affiche l'icone de Ptr_PZero
;--
               lda Ptr_PZero            |deplace le Pointeur
               clc
               adc Lg_StickerRecord
               sta Ptr_PZero
               lda Ptr_PZero+2
               adc #0
               sta Ptr_Pzero+2
;--
               inc ZFrame_Sticker

               lda ZFrame_Sticker
               cmp Frame_Sticker
               bcc Loop
               beq Loop
;--
               jsr U_Hdl_Sticker        |Libere le Buffer

               rts
;--------------------------------------
;        Put_Sticker : Affiche le sticker
;--------------------------------------
Put_Sticker    ENTRY

               lda [Ptr_PZero]
               sta Rect_StickY0
               clc
               adc #Haut_Sticker
               sta Rect_StickY1

               ldy #2
               lda [Ptr_Pzero],y
               sta Rect_StickX0
               clc
               adc #Larg_Sticker
               sta Rect_StickX1

               lda Ptr_Pzero            |Pointeur +6 (bitmap)
               clc
               adc #6
               tax
               lda Ptr_Pzero+2
               adc #0
               pha
               txa
               pha
               PushLong #RectStickStd   |Rectangle d'1 sticker
               PushLong FondPtr         |bitmap d'arrive
               PushLong #Rect_Stick
               ldy #4
               lda [Ptr_Pzero],y
               pha                      |Mode
               jsl Put

               rts

ZFrame_Sticker ds 2

               END
;...............................................................
;
;        Test_In_Sticker : Test si Selection d'1 sticker
;
;...............................................................
Test_In_Sticker START
               Using globalData

               lda Frame_Sticker        |Sticker ?
               bne oui
               clc
               rts

oui            lda Frame_Sticker        |Le Neme Sticker

LOOP           pha                      |Met le Sticker dans RECORD
;--
               jsr Rest_Sticker1        |va chercher ptr_Sticker garni data
;--
               jsr Test_In_Sticker1
               bcs Inside
;--
               pla
               dec a
               bne LOOP
               clc                      |not INSIDE sticker
               rts
;--
Inside         pla                      |sticker Selectionnee
               sec
               rts
;--------------------------------------
;        Test_In_Sticker1
;--------------------------------------
Test_In_Sticker1 ENTRY
               jsr Cal_RectSticker      |rect de la courante
;--
               PushWord #0              |Inside
               PushLong #EventWhere
               PushLong #Rect_Stick
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
;        Cal_RectSticker : cadre de selection d'un sticker
;
;...............................................................
Cal_RectSticker START
               Using GlobalData

               ldy #Sticker_Y           |COMPUTE RECT
               lda [Ptr_BufStick],y
               sta Rect_StickY0
               clc
               adc #Haut_Sticker
               sta Rect_StickY1

               ldy #Sticker_X
               lda [Ptr_BufStick],y
               sta Rect_StickX0
               clc
               adc #Larg_Sticker
               sta Rect_StickX1

               rts

               END
;...............................................................
;
;        Rest_Sticker : va chercher le stick du buffer
;
;...............................................................
Rest_Sticker   START
               Using GlobalData

               pha                      |numero dans Acc
               jsr D_Hdl_Sticker        |coince
               pla

               PushLong #0
               pha                         |n% sticker
               PushWord lg_StickerRecord   |lg d'un Record
               _Multiply
               pla
               plx
               dec a
               dec a
               tay

               ldx lg_StickerRecord
               dex
               dex
;--
LOOP           lda [Ptr_Sticker],y
               phy
               txy
               sta [Ptr_BufStick],y
               ply

               dey
               dey
               dex
               dex
               bpl LOOP
;--
               jsr U_Hdl_Sticker        |libere

               rts
;-----
Rest_Sticker1  ENTRY

               pha                      |numero dans Acc
               jsr D_Hdl_Sticker        |coince
               pla

               PushLong #0
               dec a
               pha                         |n% sticker
               PushWord lg_StickerRecord   |lg d'un Record
               _Multiply
               pla
               plx
               tay

               ldx #0
;--
LOOP1          lda [Ptr_Sticker],y
               phy
               txy
               sta [Ptr_BufStick],y
               ply

               iny
               iny
               inx
               inx
               cpx #6
               bcc LOOP1
;--
               jsr U_Hdl_Sticker        |libere

               rts

               END
;...............................................................
;
;       Sticker_Last : l'Sticker Select passe en dernier
;
;...............................................................
Sticker_Last   START
               Using GlobalData
;--
               sta tempmove
               lda Frame_Sticker
               cmp tempmove             |pas la derniere
               bne oui
               brl fini
;--
oui            lda tempmove
               jsr Rest_Sticker         |sauve l'sticker

               lda tempmove
               dec a
               PushLong #0
               pha
               PushWord lg_StickerRecord
               _Multiply
               ply
               plx
               sty offsetmove

               lda tempmove             |calcul du move
               PushLong #0
               pha
               PushWord lg_StickerRecord
               _Multiply
               pla
               plx
               sta source_adr

               lda Frame_Sticker
               sec
               sbc tempmove
               PushLong #0
               pha
               PushWord lg_StickerRecord
               _Multiply
               pla
               plx
               sta nbre_byte

               jsr D_Hdl_Sticker        |Deref

loop           ldy source_adr           |move de droite a gauche
               ldx offsetmove
rloop          lda [Ptr_Sticker],y
               phy
               txy
               sta [Ptr_Sticker],y
               ply
               inx
               inx
               iny
               iny
               dec nbre_byte
               dec nbre_byte
               bne rloop

               jsr U_Hdl_Sticker        |Unlock

               lda Frame_Sticker
               jsr Copie_Sticker

fini           lda Frame_Sticker        |la select = la derniere
               sta Sticker_Select

               rts

tempmove       ds 2
offsetmove     ds 2
source_adr     ds 2
nbre_byte      ds 2

               END
;...............................................................
;
;        Copie_Sticker : Copie Sticker_Record -> Buffer Sticker
;                      ACC=N% de STICKER
;...............................................................
Copie_Sticker  START
               Using GlobalData

               pha
               jsr D_Hdl_Sticker        |Deref
               pla

               PushLong #0
               Pha                         |n% de Shape
               PushWord lg_StickerRecord   |taille d'1 Shape
               _Multiply
               pla
               plx
               dec a
               dec a
               tay

               ldx lg_StickerRecord
               dex
               dex

LOOP           phy
               txy
               lda [Ptr_BufStick],y
               ply
               sta [Ptr_Sticker],y
               dey
               dey
               dex
               dex
               bpl LOOP
;--
               jsr U_Hdl_Sticker        |UnLock

               rts
;--------
Copie_sticker1 ENTRY

               pha
               jsr D_Hdl_Sticker        |Deref
               pla

               PushLong #0
               dec a
               Pha                         |n% de Shape
               PushWord lg_StickerRecord   |taille d'1 Shape
               _Multiply
               pla
               plx
               tay

               ldx #0

LOOP1          phy
               txy
               lda [Ptr_BufStick],y
               ply
               sta [Ptr_Sticker],y
               iny
               iny
               inx
               inx
               cpx #6
               bcc LOOP1
;--
               jsr U_Hdl_Sticker        |UnLock

               rts

               END
;...............................................................
;
;        draw_RectSticker : affiche la selection sticker eor
;
;...............................................................
Draw_RectSticker START
               Using GlobalData

               PushWord #0              |sauve mode
               _GetPenMode

               PushWord #15
               _SetSolidPenPat

               PushWord #2              |eor
               _SetPenMode

               PushLong #Rect_Stick
               _FrameRect

               _SetPenMode

               rts

               END
;...............................................................
;
;        Resize_Sticker : Ajuste La Taille Du Buffer des stickers
;
;...............................................................
Resize_Sticker START
               Using GlobalData

               lda Frame_Sticker        |des stickers
               bpl oui

               stz Frame_Sticker        |alors zero

oui            PushLong #0
               PushWord Frame_Sticker     |nb de Shape
               PushWord lg_StickerRecord  |taille d'1 Shape
               _Multiply
               pla
               plx
               cmp #0
               bne Size

               lda #1                   |au moins 1 octet
;--
Size           Pea $0000
               pha
               PushLong Hdl_sticker
               _SetHandleSize
;--
EndAs          rts

               END

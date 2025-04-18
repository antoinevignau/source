;---------------------------------------------------------------
;
; FILE : SHOWDATA1                      Donnees generales
;        ---------
;
;---------------------------------------------------------------
;...............................................................
;
; window Data :
;
;...............................................................
WindowDATA     DATA

RefConW        ds 4                     |Refcon des Fenetres

MDialogPtr     ds 4                     |pointeur des dialog port

new_color      dc i'$0000,$0F00,$020F,$F0F0,$00F0' |frame color
;--------------------------------------
;--OPTION Variables + Rectangles ------
;--------------------------------------
Nb_Option      equ 39                   |nombre de rectangles
Choix_Option   ds 2                     |Option Choisie
Adr_RectOption ds 4                     |adresse des rectangles option

Table_CheckOutLine ANOP
               dc i'103,106,111,118,125' |Position CHECK MARK

Rect_OutLine   dc i'96,2,127,11'        |Rectangle EFFACE CHECK MARK

Rect_OutLine2  dc i'108,11,110,24'      |Rectangles Lignes Epaisseur
Rect_OutLine3  dc i'114,11,117,24'
Rect_OutLine4  dc i'121,11,125,24'

Rect_Option    ANOP
               dc i'2,2,14,19'          |Fleche
               dc i'2,20,14,37'         |Texte
RectStickers   dc i'15,2,27,19'         |Stickers
RectIcons      dc i'15,20,27,37'        |Icons
               dc i'28,2,40,19'         |Lines
RectCut        dc i'28,20,40,37'        |Cut
RectFlipH      dc i'41,2,53,19'         |Flip H
RectFlipV      dc i'41,20,53,37'        |Flip V
               dc i'54,2,66,19'         |Rect
               dc i'54,20,66,37'        |Rect Fill
               dc i'67,2,79,19'         |RectOval
               dc i'67,20,79,37'        |RectOval Fill
               dc i'80,2,92,19'         |Oval
               dc i'80,20,92,37'        |Oval Fill

               dc i'96,2,101,25'        |no borders
               dc i'102,2,107,25'       |1 borders
               dc i'108,2,113,25'       |2 borders
               dc i'114,2,120,25'       |3 borders
               dc i'121,2,127,25'       |4 borders

Rect_arr1      dc i'96,26,110,37'       |Arrows
Rect_arr2      dc i'111,26,127,37'      |2 Arrows

Rect_Couleur   ANOP                     |Couleur de TEXTE
               dc i'130,1,138,11'
               dc i'130,10,138,20'
               dc i'130,19,138,29'
               dc i'130,28,138,38'
               dc i'137,1,145,11'
               dc i'137,10,145,20'
               dc i'137,19,145,29'
               dc i'137,28,145,38'
               dc i'144,1,152,11'
               dc i'144,10,152,20'
               dc i'144,19,152,29'
               dc i'144,28,152,38'
               dc i'151,1,159,11'
               dc i'151,10,159,20'
               dc i'151,19,159,29'
               dc i'151,28,159,38'

RectPF         dc i'161,2,169,11'       |Previous Frame
RectNF         dc i'161,27,169,37'      |Next Frame
;--------------------------------------
;-------- Port Pour Travail Fond ------
;--------------------------------------
PortFond       ds 170
;----------------------------------------
;----- WINDOWDATA ANGLAIS ---------------
;----------------------------------------
TxLoadPic      str 'Load Picture'

tit_itemr1     str 'ok'
str_BS1        str 'Save changes before'
str_BS11       str '     closing ?'
str_BS2        str 'Yes'
str_BS3        str 'No'
str_ok         str 'Ok'
str_cancel     str 'Cancel'
str_bl         str ' '                  |du blanc de blanc
Str_Show       str 'Show'
Str_Auto       str 'Automatic'
Str_Manuel     str 'Manual'
Str_Time       str 'Time:'
Str_SFrame     str 'Frame'
Str_JTF        str 'Jump to frame'

TxNew          str 'Do you really want to'
TxNew1         str ' clear all the work ?'
TxClearFrame   str '  clear the frame ?'
TxClearTempl   str ' clear the template ?'
TxClearLabel   str '  clear the label ?'

TxBeware       str 'Caution, update frames '
TXBeware1      str '   with new template ? '

Txt_FNE        dc i1'24',c'This frame doesn',h'27',c't exist'
TxInsShow      str 'Insert ShowOff Disk'
TxInsDiskF     str 'Insert System Disk'
;----------------------------------------
;----- item types -----------------------
;----------------------------------------
ButtonItem     gequ   10
CheckItem      gequ   11
RadioItem      gequ   12
ScrollBarItem  gequ   13
UserCtlItem    gequ   14
StatText       gequ   15
EditText       gequ   16
EditLine       gequ   17
IconItem       gequ   18
PicItem        gequ   19
UserItem       gequ   20
ItemDisable    gequ   $8000
;--------------------------------------
;        Alert de dialog
;--------------------------------------
Alert_dialog   anop
               dc i'50,45,110,275'
               dc i'1'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'ItemAP4'           |ok
               dc i4'ItemAP5'           |cancel
               dc i4'ItemAP2'           |texte
               dc i4'ItemAP3'           |texte
               dc i4'0'
;--------------------------------------
;        Alert_Ok
;--------------------------------------
Alert_Ok       anop
               dc i'50,45,110,275'
               dc i'1'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'ItemAP41'          |ok
               dc i4'ItemAP2'           |texte
               dc i4'ItemAP3'           |texte
               dc i4'0'
;--------------------------------------
;        SaveBefore
;--------------------------------------
SaveBefore     anop
               dc i'40,45,120,275'
               dc i'1'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'ItemSB1'           |texte
               dc i4'ItemSB11'          |texte 1
               dc i4'ItemSB2'           |yes
               dc i4'ItemSB3'           |no
               dc i4'ItemSB4'           |cancel
               dc i4'0'
;--
ItemSB1        anop                     |Save changes before
               dc i'4'
               dc i'5,55,17,225'
               dc i'StatText+ItemDisable'
               dc i4'str_BS1'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemSB11       anop                     |closing ?
               dc i'5'
               dc i'20,55,32,225'
               dc i'StatText+ItemDisable'
               dc i4'str_BS11'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemSB2        anop                     |yes
               dc i'1'
               dc i'40,34,55,79'
               dc i'ButtonItem'
               dc i4'str_bs2'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemSB3        anop                     |no
               dc i'2'
               dc i'60,34,75,79'
               dc i'ButtonItem'
               dc i4'str_bs3'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemSB4        anop                     |cancel
               dc i'3'
               dc i'60,149,75,204'
               dc i'ButtonItem'
               dc i4'str_cancel'
               dc i'0'
               dc i'0'
               dc i4'0'
;--------------------------------------
;        ALERT PRODOS ERROR
;--------------------------------------
Alert_Prodos   anop
               dc i'50,45,110,275'
               dc i'1'
               dc i1'$81'
               dc i1'$81'
               dc i1'$81'
               dc i1'$81'
               dc i4'ItemAP1'           |ok
               dc i4'ItemAP2'           |texte
               dc i4'0'
;--
Alert_Res      anop
               dc i'50,45,110,275'
               dc i'1'
               dc i1'$81'
               dc i1'$81'
               dc i1'$81'
               dc i1'$81'
               dc i4'ItemAP4'           |ok
               dc i4'ItemAP5'           |cancel
               dc i4'ItemAP2'           |texte
               dc i4'0'
;--
ItemAP1        anop                     |Ok
               dc i'1'
               dc i'40,92,55,137'
               dc i'ButtonItem'
               dc i4'str_ok'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemAP4        anop                     |Ok (ok-cancel)
               dc i'1'
               dc i'40,30,55,85'
               dc i'ButtonItem'
               dc i4'str_ok'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemAP41       anop                     |Ok (uniquement)
               dc i'1'
               dc i'40,93,55,138'
               dc i'ButtonItem'
               dc i4'str_ok'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemAP5        anop                     |Cancel (ok_cancel)
               dc i'2'
               dc i'40,145,55,200'
               dc i'ButtonItem'
               dc i4'str_cancel'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemAP2        anop                     |non
               dc i'3'
               dc i'5,50,17,225'
               dc i'StatText+ItemDisable'
ItemAp2tx      dc i4'0'                 |texte 2
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemAP3        anop                     |stat texte
               dc i'3'
               dc i'20,47,32,225'
               dc i'StatText+ItemDisable'
ItemAP3tx      dc i4'str_bl'            |texte 3
               dc i'0'
               dc i'0'
               dc i4'0'
;--------------------------------------
;        LES FENETRES DE SHOWOFF
;--------------------------------------
;--------------------------------------
;        FENETRE D'OPTION
;--------------------------------------
Ptr_OptionW    ds 4                     |pointeur de fenetre OPTION
Titre_OptionW  str ' * '

OptionWindow     anop
           dc    i'EndOptionWindow-OptionWindow'
           dc    i2'%1000000011100000'
           dc    i4'Titre_OptionW'
           dc    i4'1'                  |REFCON
           dc    i2'0,0,0,0'
           dc    i4'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i4'0'
           dc    i2'0'
           dc    i4'0'
           dc    i4'0'
           dc    i4'MAJ_OptionW'
           dc    i'27,6,198,45'
           dc    i4'$FFFFFFFF'
           dc    i4'0'

EndOptionWindow ANOP

LocInfo_Option  ANOP
               dc i2'0'                 |320
PPI_Option     ds 4                     |pointeur sur bitmap
               dc i'24'                 |24 octets ou 48 pixels
               dc i'0,0,169,47'         |rect

;--------------------------------------
;        FENETRE DE FRAME
;--------------------------------------
Ptr_FrameW    ds 4                      |pointeur de fenetre Frame

FrameWindow    anop
           dc    i'EndFrameWindow-FrameWindow'
           dc    i2'%0000000001100000'
           dc    i4'0'
           dc    i4'2'                  |REFCON
           dc    i2'0,0,0,0'
           dc    i4'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i2'0'
           dc    i4'0'
           dc    i2'0'
           dc    i4'0'
           dc    i4'0'
           dc    i4'MAJ_FrameW'
           dc    i'0,0,200,320'
           dc    i4'$FFFFFFFE'          |Behind
           dc    i4'0'

EndFrameWindow ANOP

               END
;---------------------------------------------------------------
;
; les controles des fenetres
;
;---------------------------------------------------------------
CtrlData       Data

               END
;======================================================;
;                                                      |
;              C U R S O R S                           |
;                                                      |
;======================================================;
Cursors        Data

Type_Cursor    dc i'0'

Cursor_Fleche  equ 0
Cursor_Texte   equ 1
Cursor_Croix   equ 2
;--------------------------------------
;-------- CARET -----------------------
;--------------------------------------
Caret          dc   i'9'
               dc   i'2'
               dc   H'FF0FF000'
               dc   H'00F00000'
               dc   H'00F00000'
               dc   H'00F00000'
               dc   H'00F00000'
               dc   H'00F00000'
               dc   H'00F00000'
               dc   H'00F00000'
               dc   H'FF0FF000'

               dc   H'FF0FF000'
               dc   H'00000000'
               dc   H'00000000'
               dc   H'00000000'
               dc   H'00000000'
               dc   H'00000000'
               dc   H'00000000'
               dc   H'00000000'
               dc   H'FF0FF000'
               dc   i'7,2'
;--------------------------------------
;-------- ETOILE ----------------------
;--------------------------------------
Croix          dc   i'9'
               dc   i'4'

               dc   H'0000000000000000'
               dc   H'00000F0000000000'
               dc   H'00000F0000000000'
               dc   H'00000F0000000000'
               dc   H'0FFFF0FFFF000000'
               dc   H'00000F0000000000'
               dc   H'00000F0000000000'
               dc   H'00000F0000000000'
               dc   H'0000000000000000'

               dc   H'0000fff000000000'
               dc   H'0000fFf000000000'
               dc   H'0000fFf000000000'
               dc   H'fffffFfffff00000'
               dc   H'fFFFF0FFFFf00000'
               dc   H'fffffFfffff00000'
               dc   H'0000fFf000000000'
               dc   H'0000fFf000000000'
               dc   H'0000fff000000000'
                                
               dc   i'4,5'
;--------------------------------------
;        Icon_Arrow1
;--------------------------------------
Icon_Arrow1    ANOP

               dc i'$0000'              |IconType
               dc i'52'                 |IconSize
               dc i'13'                 |IconHeight
               dc i'8'                  |IconWidth

               dc h'00000000'           |IconImage
               dc h'000F0000'
               dc h'00FFF000'
               dc h'0FFFFF00'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'00000000'

               dc h'000f0000'           |IconMask
               dc h'00fFf000'
               dc h'0fFFFf00'
               dc h'fFFFFFf0'
               dc h'0ffFff00'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fff000'
;--------------------------------------
;        Icon_Arrow2
;--------------------------------------
Icon_Arrow2    ANOP

               dc i'$0000'              |IconType
               dc i'64'                 |IconSize
               dc i'16'                 |IconHeight
               dc i'8'                  |IconWidth

               dc h'00000000'           |IconImage
               dc h'000F0000'
               dc h'00FFF000'
               dc h'0FFFFF00'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'000F0000'
               dc h'0FFFFF00'
               dc h'00FFF000'
               dc h'000F0000'
               dc h'00000000'

               dc h'000f0000'           |IconMask
               dc h'00fFf000'
               dc h'0fFFFf00'
               dc h'fFFFFFf0'
               dc h'0ffFff00'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'00fFf000'
               dc h'0ffFff00'
               dc h'fFFFFFf0'
               dc h'0fFFFf00'
               dc h'00fFf000'
               dc h'000f0000'
;--------------------------------------
;        Icon_Arrow3
;--------------------------------------
Icon_Arrow3    ANOP

               dc i'$0000'              |IconType
               dc i'35'                 |IconSize
               dc i'7'                  |IconHeight
               dc i'10'                 |IconWidth

               dc h'0000000000'         |IconImage
               dc h'000F000000'
               dc h'00FFFFFF00'
               dc h'0FFFFFFF00'
               dc h'00FFFFFF00'
               dc h'000F000000'
               dc h'0000000000'

               dc h'000f000000'         |IconMask
               dc h'00fFfffff0'
               dc h'0fFFFFFFf0'
               dc h'fFFFFFFFf0'
               dc h'0fFFFFFFf0'
               dc h'00fFfffff0'
               dc h'000f000000'
;--------------------------------------
;        Icon_Arrow4
;--------------------------------------
Icon_Arrow4    ANOP

               dc i'$0000'              |IconType
               dc i'35'                 |IconSize
               dc i'7'                  |IconHeight
               dc i'10'                 |IconWidth

               dc h'0000000000'         |IconImage
               dc h'000000F000'
               dc h'00FFFFFF00'
               dc h'00FFFFFFF0'
               dc h'00FFFFFF00'
               dc h'000000F000'
               dc h'0000000000'

               dc h'000000f000'         |IconImage
               dc h'0fffffFf00'
               dc h'0fFFFFFFf0'
               dc h'0fFFFFFFFf'
               dc h'0fFFFFFFf0'
               dc h'0fffffFf00'
               dc h'000000f000'

               End
;--------------------------------------
;
;        LeDATA Line EDIT
;
;--------------------------------------
LeData         DATA

               END

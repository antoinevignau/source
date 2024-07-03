;---------------------------------------------------------------
;
; FILE : SHOWDATA                       Donnees generales
;        --------
;
;---------------------------------------------------------------
GlobalData     DATA
;--------------------------------------
;-------- SHOW ------------------------
;--------------------------------------
Time_Show      ds 2                     |Elapse Time
ShowOnOff      ds 2                     |Mode
Show_Present   ds 2                     |init si 0 rien si 1
Zcount         ds 4
Timing_out     ds 4
;--------------------------------------
;-------- IMPRESSION ------------------
;--------------------------------------
PrintOn        dc i'0'
PrintRecord    dc i4'0'
;--------------------------------------
;-------- FONCTION --------------------
;--------------------------------------
Fonction       dc i'$FFFF'              |Fonction Courante
Old_fonction   ds 2                     |Fonction Precedente
No_Fonct       equ $FFFF                |NoThing
Fonct_Move     equ 0                    |move Object
Fonct_Texte    equ 1                    |Hit Text
Fonct_Sticker  equ 2                    |Stickers
Fonct_Icon     equ 3                    |Icon
Fonct_Line     equ 4                    |Line
Fonct_Cut      equ 5                    |Cut
Fonct_Rect     equ 8                    |RECTANGLE
Fonct_RectF    equ 9                    |RECTANGLE FULL
Fonct_RectO    equ 10                   |RECTANGLE ROUND
Fonct_RectOF   equ 11                   |RECTANGLE ROUND FULL
Fonct_Oval     equ 12                   |Oval
Fonct_OvalF    equ 13                   |Oval    FULL
;--------------------------------------
;-------- hdle memoire ----------------
;--------------------------------------
Hdl_Upro3      ds 4                     |code upro3
Hdl_PPI_Option ds 4                     |BITMAP Option Inside
Hdl_Line       ds 4                     |Buffer des Lignes de Texte
Hdl_Shape      ds 4                     |Buffer des shapes geometriques
Hdl_Pbuffer    ds 4                     |Buffer decompactage
Hdl_FIcon      ds 4                     |Buffer des Files Icon
Hdl_BitMap     ds 4                     |Buffer du Fond BitMap
Hdl_BIcon      ds 4                     |Buffer des Icons
Hdl_Fond       ds 4                     |Buffer du Fond Ecran
Hdl_Border     ds 4                     |Buffer de la bordure
Hdl_Graph      ds 4                     |Buffer des Graphs
Hdl_Template   ds 4                     |Buffer bitmap template
Hdl_Undo       ds 4                     |Buffer du Undo
Hdl_CCP        ds 4                     |buffer du Cut/Copy/Paste
Hdl_Sticker    ds 4                     |buffer des sickers
Hdl_IoStk      ds 4                     |buffer du load d'1 sticker
Hdl_BufStick   ds 4
Hdl_Orders     ds 4
;--
hdle_command   ds 4
hdle_lit       ds 4                     |petit port graphique
;--
UndoBufHdl     ds 4                     |pour jcl sur editeur icon
IcModified     ds 2
;--------------------------------------
;- Status/Region Desktop/Palette ------ |Variable pour Plein Ecran
;--------------------------------------
MenuRect       dc i'0,0,13,320'         |Rectangle RefreshDeskTop
Status_ecran   dc i'$FFFF'              |0 Half 1 Full Screen $FFFF no Frame
Status_Number  dc i'0'                  |0 No Frame Number 1 Yes
Rgn_DeskFull   ds 4                     |contient le plein ecran
Rgn_DeskHalf   ds 4                     |contient idem - MenuBar
Menupalette    dc 10i1'0'               |buffer Menu Palette
ColorTable     ds 32                    |Palette de couleurs
;--------------------------------------
;---- Region Pour REFRESH RAPIDE ------
;--------------------------------------
Rgn0           ds 4
Rgn1           ds 4
Rgn2           ds 4
ZRgn           ds 4
rectrgn0       ds 8
rectrgn1       ds 8
Rgn_Fantome    ds 4
;--------------------------------------
;-------- BORDER ----------------------
;--------------------------------------
Val_Hauteur    ds 2
Val_Hauteur1   ds 2
Val_Largeur    ds 2

Larg_Bordure   gequ 44
Haut_Bordure   gequ 28

rectBstd       dc i'0,0,28,40'          |rect source standard bordure
rectBHG        dc i'0,0,28,40'          |rect haut gauche
rectBHD        dc i'0,280,28,320'       |rect haut droit
rectBBG        dc i'172,0,200,40'       |rect bas gauche
rectBBD        dc i'172,280,200,320'    |rect bas droit
;--
rectBHGL       dc i'31,52,59,92'        |rect haut gauche
rectBHDL       dc i'31,234,59,274'      |rect haut droit
rectBBGL       dc i'155,52,183,92'      |rect bas gauche
rectBBDL       dc i'155,234,183,274'    |rect bas droit
;--------------------------------------
;-------- ICON ------------------------
;--------------------------------------
Nb_FileIcon    ds 2                     |nombre de fichier dans library

Larg_Icone     gequ 44                  |Largeur et Hauteur d'une icone
Haut_Icone     gequ 34

RectIconeStd   dc i'0,0,34,44'          |rectangle d'une Icone

Rect_FIcone    dc i'26,0,200,305'       |Cadre Picture Icone

Rect_Icone     ANOP                     |Rect de selection dans fenetre
Rect_IconeY0   ds 2
Rect_IconeX0   ds 2
Rect_IconeY1   ds 2
Rect_IconeX1   ds 2

Rect_Icone1    ANOP                     |Rect de selection dans buffer
Rect_Icone1Y0  ds 2
Rect_Icone1X0  ds 2
Rect_Icone1Y1  ds 2
Rect_Icone1X1  ds 2

Top_Cadre      ds 2                     |Cadre Tournant Flip flop
;--------------------------------------
;-------- STICKER ---------------------
;--------------------------------------
Larg_Sticker   gequ 88                  |Largeur et Hauteur d'un sticker
Haut_Sticker   gequ 52
RectStickStd   dc i'0,0,52,88'          |rectangle d'1 sticker

lg_StickerRecord dc i'2294'             |longueur = 2+2+2+2288

Sticker_Y      equ 0                    |offset de deplacement
Sticker_X      equ 2
Sticker_Mode   equ 4
Sticker_BM     equ 6

Rect_Stick     ANOP                     |Rect de selection dans fenetre
Rect_StickY0   ds 2
Rect_StickX0   ds 2
Rect_StickY1   ds 2
Rect_StickX1   ds 2

Rect_Stick1    ANOP                     |Rect de selection dans buffer
Rect_Stick1Y0  ds 2
Rect_Stick1X0  ds 2
Rect_Stick1Y1  ds 2
Rect_Stick1X1  ds 2
;--------------------------------------
;-------- Top AIGUILLAGE + Selection---
;--------------------------------------
Pt_Buffer      ds 2                     |pointeur undo CCP
Top_Paste      dc i'0'                  |No Paste
Top_Ligne_size ds 2                     |1 swap Shape_debut shape_fin si ligne+F
Top_Bitmap     dc i'0'                  |1 si save as bitmap
Force_Bitmap   dc i'0'                  |1 pour bitmap calcule forcer
NoTextShow     dc i'0'
Top_IconEdit   ds 2                     |Flag 0 IconEdit 1 IconSelect
Top_shift      ds 2                     |pour shift key 1 on 0 off
Top_Draw       ds 2                     |0 ne pas faire Xor SHAPE 1 ok
Top_Size       ds 2                     |0 pas de Sizing 1 ok Sizing
top_sauvegarde ds 2                     |0 rien 1 modif
Line_Select    dc i'$ffff'              |Line  Select
Shape_Select   dc i'$ffff'              |Shape Select
Icon_Select    dc i'$ffff'              |Icon Select
Graph_Select   dc i'$ffff'              |Graph Select
Sticker_Select dc i'$ffff'              |Sticker Select
cou_ligne      ds 2                     |ligne courante
Num_Poigne     ds 2                     |Poignee Saisie pour SIZING
Mode_Draw      ds 2                     |Mode de Refresh si NEW ou SIZE Shape
Ch_Group       ds 2                     |Modifie les attributs d'un Groupe
Which_select   ds 2                     |selection objet 1 text 2 shape
;--------------------------------------
;-------- Liste Selection -------------
;--------------------------------------
List_Record    ANOP                     |Selection Groupee
nb_List_select ds 2                     |nombre d'objet select
List_Select    ds 100*2                 |100 maximum
;--------------------------------------
;-------- Sequence Record -------------
;--------------------------------------
Sequ_NTemplate ds 132                   |nom du template EN DEHORS CAR COMPUTE

LG_SequRecord  dc i'EndSequRecord-SequRecord'

SequRecord     ANOP

Sequ_Template  dc i'0'                  |0 no Templ 1 template
Sequ_TemplateB dc i'0'                  |0 no border 1 border in Template
Sequ_NbFrame   dc i'0'                  |number of Current FRAME
Sequ_HMFrame   dc i'1'                  |How Many Frame
Sequ_Reserve   dc i'1'                  |1 generation

Sequ_FileNum   ds 100                   |number of page

EndSequRecord  ANOP
;--------------------------------------
;-------- Number Record ---------------
;--------------------------------------
LG_NumberRecord dc i'EndNumberRecord-NumberRecord'

Str_Frame      dc i1'2'                 |traduit en ASCII
Str_Frame1     dc c'00'

NumberRecord   ANOP

NumberRect     ANOP                     |rect
NumberRectY0   ds 2
NumberRectX0   ds 2
NumberRectY1   ds 2
NumberRectX1   ds 2

EndNumberRecord ANOP
;--------------------------------------
;-------- Frame Record ----------------
;--------------------------------------
LG_FrameRecord dc i'EndFrameRecord-FrameRecord'

FrameRecord    ANOP

Frame_BackG    dc i'15'                 |couleur 0->15 ou FFFF Bitmap
Frame_Border   dc i'0'                  |0 no Border 1 Border
Frame_Shape    dc i'0'                  |number of Shapes
Frame_Graph    dc i'0'                  |number of Graphs
Frame_Icon     dc i'0'                  |number of Icons
Frame_Line     dc i'0'                  |number of Lines
Frame_Sticker  dc i'0'                  |number of Stickers
Frame_Template dc i'0'                  |0 no template 1 template
Frame_Transit  dc 30i'0'                |0 pas de transit 1 transit
Frame_Serie    dc i'0'                  |0 pas de serie |1 des series
Frame_Reserve  dc i'1'                  |generation 1
ParamSerie     dc i'4,0,0,0,0,1,0,0,0,0'

EndFrameRecord ANOP
;--------------------------------------
;-------- Icon Record -----------------
;--------------------------------------
Lg_IconRecord dc i'EndIconRecord-IconRecord'

IconRecord     ANOP

Icon_Y         ds 2
Icon_X         ds 2
Icon_Mode      ds 2
Icon_BitMap    ds 748                   |748 octets

EndIconRecord  ANOP
;--------------------------------------
;-------- Graph Record ----------------
;--------------------------------------
Lg_GraphRecord dc i'EndGraphRecord-GraphRecord'

GraphRecord    ANOP

GraphRect      ANOP                     |le Rectangle
GraphRectY0    ds 2
GraphRectX0    ds 2
GraphRectY1    ds 2
GraphRectX1    ds 2

GraphFlipType  ds 2                     |Flip HV + type (Bar/Sale/Pie)

GraphLineCol   ds 2                     |couleur trait
GraphLineSize  ds 2                     |epaisseur trait
GraphShadow    ds 2                     |shadow

GraphNbVal     ds 2                     |Combien de valeurs

GraphVal       ds 72                    |les Valeurs

EndGraphRecord ANOP
;----------------------------------------
;----- Ligne Record ---------------------
;----------------------------------------
lg_LineRecord  dc i'EndLineRecord-LineRecord'

taille   equ 60                         |60 caracteres par lignes
maxligne equ 20                         |20 lignes maximum
i1       equ taille*6+22                |382
i2       equ i1-2                       |380
i3       equ i1*maxligne                |7640
;--
LineRecord     anop

Line_x         ds 2                     |Origine de la Ligne
Line_y         ds 2

Line_rectx0    ds 2                     |Rectangle Perimetre
Line_recty0    ds 2                     |
Line_rectx1    ds 2                     |
Line_recty1    ds 2                     |

Line_colbord   ds 2                     |couleur bord
Line_colfond   ds 2                     |couleur fond

Line_bord      ds 2                     |bord oui:non
Line_fond      ds 2                     |fond oui:non

Line_lg        ds 2                     |nbre de lettre dans la ligne

Line_texte     dc 60i1'0'               |60 caracteres
Line_ctexte    dc 60i1'0'               |couleur des lettres
Line_ttexte    dc 60i1'0'               |taille des lettres
Line_stexte    dc 60i1'0'               |style des lettres
Line_fhtexte   dc 60i1'0'               |font des lettres
Line_fltexte   dc 60i1'0'               |font des lettres

EndLineRecord  ANOP
;--------------------------------------
;-------- SHAPE RECORD ----------------
;--------------------------------------
lg_ShapeRecord dc i'EndShapeRecord-ShapeRecord'

i2_Shape       equ lg_ShapeRecord-2

ShapeRecord    ANOP

Shape_Type     ds 2                     |0 Ligne 1 Rect ETC ..

Shape_Rect     ANOP                     |Rectangle Perimetre
Shape_Recty0   ds 2
Shape_Rectx0   ds 2
Shape_Recty1   ds 2
Shape_Rectx1   ds 2

Shape_Debut    ANOP                     |debut Forme x y
Shape_Debuty   ds 2
Shape_Debutx   ds 2

Shape_Fin      ANOP                     |fin Forme x y
Shape_Finy     ds 2
Shape_Finx     ds 2

Shape_ColorI   ds 2                     |Couleur Interieur

Shape_ColorB   ds 2                     |Couleur Border

Shape_TailleB  ds 2                     |Epaisseur Border

Shape_Shadow   ds 2                     |Shadow 0 off 1 on

EndShapeRecord ANOP
;--------------------------------------
;-------- NameIconRecord --------------
;--------------------------------------
Lg_NameIRecord dc i'EndNameIRecord-NameIRecord'

Max_FileIcon   equ 20

NameIRecord    ANOP

Nb_NameIcon    dc i'11'

NameFIcon      dc i1'0',128c' '         |nom du fichier complet

DiskPos        ds 2                     |place du nom disk
DiskLg         ds 2                     |la longueur

FilePos        ds 2                     |nom de l'icon
FileLg         ds 2                     |place de l'icon nom

TypeOfIcon     ds 3

EndNameIRecord ANOP

TableNameIcon  ANOP
             dc i1'15',c'1/icon/Alphabet',113c' ',i'1,1,8,8',i'$C0',i1'0'
             dc i1'14',c'1/icon/Animals',114c' ',i'1,1,8,7',i'$C0',i1'0'
             dc i1'17',c'1/icon/Activities',111c' ',i'1,1,8,10',i'$C0',i1'0'
             dc i1'16',c'1/icon/Buildings',112c' ',i'1,1,8,9',i'$C0',i1'0'
             dc i1'15',c'1/icon/Computer',113c' ',i'1,1,8,8',i'$C0',i1'0'
             dc i1'12',c'1/icon/Flags',116c' ',i'1,1,8,5',i'$C0',i1'0'
             dc i1'11',c'1/icon/Maps',117c' ',i'1,1,8,4',i'$C0',i1'0'
             dc i1'16',c'1/icon/Nutrition',112c' ',i'1,1,8,9',i'$C0',i1'0'
             dc i1'13',c'1/icon/People',115c' ',i'1,1,8,6',i'$C0',i1'0'
             dc i1'13',c'1/icon/Sports',115c' ',i'1,1,8,6',i'$C0',i1'0'
             dc i1'21',c'1/icon/Transportation',107c' ',i'1,1,8,14',i'$C0',i1'0'
               ds 140
               ds 140
               ds 140
               ds 140
               ds 140
               ds 140
               ds 140
               ds 140
               ds 140
;--------------------------------------
;-Point + Rectangles Particulier ------
;--------------------------------------
FullRect       dc i'0,0,200,320'        |Plein ecran
RectLabel      dc i'31,52,183,274'      |24,48,192,274'      |Cadre Label
Rect_Sauve     ds 8                     |sauve rect_selectF (frame number)

RectNumber     dc i'159,11,168,28'      |efface le frame number

RectShape      ANOP                     |Rect de Forme Geometrique
RectShapeY0    ds 2
RectShapeX0    ds 2
RectShapeY1    ds 2
RectShapeX1    ds 2

RectPoigne     ANOP                     |Rect de Poignees Objet
RectPoigneY0   ds 2
RectPoigneX0   ds 2
RectPoigneY1   ds 2
RectPoigneX1   ds 2

PositionYX     ANOP                     |Point Forme Geometrique
PositionY      ds 2
PositionX      ds 2

Rect_Select    ANOP                     |RECT SELECTION GROUPE
Rect_SelectY0  ds 2
Rect_SelectX0  ds 2
Rect_SelectY1  ds 2
Rect_SelectX1  ds 2

Rect_SelectF   ds 8                     |Rect Selection SERRE

Rect_result    ds 8                     |Pour Les Selections groupees

Rect_Travail   ds 8                     |Rectangle de travail
;--------------------------------------
;---- PARAMETRE TEXT + OBJECT ---------
;--------------------------------------
Couleur_Text   dc i2'00'                |couleur 00 noire
OutLine        dc i2'00'                |NO OutLine
OutLine_Color  dc i2'00'                |OutLine NOIRE
Arrows_On      dc i2'00'                |pas de fleche
;----------------------------------------
;----- touche clavier -------------------
;----------------------------------------
key_return     equ $0D
key_delete     equ $7F
key_fg         equ $08
key_fd         equ $15
;--------------------------------------
;-------- Table -----------------------
;--------------------------------------
Tab_DRect      dc i'10,10,15,20,25'     |Rect des Pointes de ligne
;----------------------------------------
;----- divers ---------------------------
;----------------------------------------
Result_Upro3   dc i'0'
;--
Bloque_Flip    dc i'0'
Top_Debug_Sas  dc i'0'                  |pour save as avec volume full
Top_debug_NBF  dc i'0'                  |la frame courante pour saveas
SegNumber      ds 2
CduQuit        dc i'0'

NewY_2C        ds 2
NewX_2C        ds 2
OldX_2C        ds 2
OldY_2C        ds 2

ISHdl          ds 4                     |Clip REgion

First_cadre    ds 2                     |top si premier cadre
Flag_Cadre     ds 2
Time_Cadre     dc i'0'
;--
Mode_Showoff   dc i'0'                  |0 rien 1 frame 2 template 3 label
Mode_Rien      equ 0
Mode_Frame     equ 1
Mode_Template  equ 2
Mode_Label     equ 3
;---- Top_clearW     dc i'0'                  |message alert
SequenceOn     dc i'0'                  |pour JCL
FrameOn        dc i'0'                  |1 Frame Existe 0 no Frame
Top_Action     dc i'0'                  |0 no modif 1 modif
Top_ActionG    dc i'0'                  |idem general
FrameType      dc i'0'                  |type frame ou template
Ya1Nom         dc i'0'                  |0 pas de Nom 1 il y a
BrkYes         dc i'0'
Only_Text      dc i'0'                  |refresh que du text si 1
okline         dc i'0'                  |top line edit
top_color      dc i'0'                  |top color precedente
mode_vide      dc i'0'                  |pour buffer vide
indice         ds 2                     |compteur
index          ds 2                     |sauve x register
dx             ds 2                     |delta x
dy             ds 2                     |delta y

MaxRY          ds 2                     |rect max pour hit texte
MaxRX          ds 2

FlipOnOff      dc i'0'                  |flip h et v on ou off

Zshape_Debut   ANOP                     |Pour les lignes avec FLECHES
ZShape_DebutY  ds 2
ZShape_DebutX  ds 2
Zshape_Fin     ANOP
ZShape_FinY    ds 2
ZShape_FinX    ds 2

ZSequ_Template ds 2                     |Pour Template Change
Beware_Change  ds 2

Number_Objet_S ds 2
Type_Objet_S   ds 2
Top_Objet_S    ds 2
Fonct_Graph    ds 2
;--------------------------------------
;-------- Select Drag Line ------------
;--------------------------------------
RectSelect_D   ANOP                     |rect d'inversion
RectSelect_DY0 ds 2
RectSelect_DX0 ds 2
RectSelect_DY1 ds 2
RectSelect_DX1 ds 2

SelectDragD    ds 2                     |1 er lettre
SelectDragF    ds 2                     |n eme lettre

Top_Select_D   dc i'0'                  |0 pas de selection drag
;--------------------------------------
;        pattern cadre tournant + data
;--------------------------------------
Pat1           dc h'ffff0000'
               dc h'ffff0000'
Pat2           dc h'0000ffff'
               dc h'0000ffff'
               dc h'ffff0000'
               dc h'ffff0000'
               dc h'0000ffff'
               dc h'0000ffff'
               dc h'ffff0000'
               dc h'ffff0000'
Patgrise       dc h'F0F0F0F0'
               dc h'0F0F0F0F'
               dc h'F0F0F0F0'
               dc h'0F0F0F0F'
               dc h'F0F0F0F0'
               dc h'0F0F0F0F'
               dc h'F0F0F0F0'
               dc h'0F0F0F0F'
;--------------------------------------
;-------- Data CURSOR FLASH -----------
;--------------------------------------
limitey        equ 14
timing_flash   ds 2
top_cursor     ds 2                     |1 present 0 efface
dutexte        ds 2
;----------------------------------------
textface       dc i2'0'                 |mode plain
fontnumber     dc i2'0'                 |system font
fontstylsiz    anop                     |style et size font
fontstyle      dc i1'0'
fontsize       dc i1'0'
largeur        ds 2                     |largeur d'une lettre
;----------------------------------------
souris         anop
souris_y       ds 2
souris_x       ds 2
ZmouseY        ds 2
ZmouseX        ds 2
;----------------------------------------
click_x        ds 2
click_y        ds 2
;----------------------------------------
MyZP           ds 2
QuitFlag       ds 2
ZpHandle       ds 4
QuitParams     dc i4'0'
               dc i4'0'
MyID           ds 2
;----------------------------------------
;----- insertion ------------------------
;----------------------------------------
pos_lettre     ds 2                     |ou inserer du texte
;----------------------------------------
;----- data move line -------------------
;----------------------------------------
X_ORG          ds 2
Y_ORG          ds 2
in_x           ds 2                     |click ici
in_y           ds 2
delta_x        ds 2                     |dist / a buf_x,y
delta_y        ds 2
Anc_Y          ds 2                     |pos mouse
Anc_X          ds 2
top_anc        dc i'$ffff'              |bouge ou pas
new_bufx       ds 2
new_bufy       ds 2
anew_bufx      ds 2
anew_bufy      ds 2
newpos         anop
newposy        ds 2
newposx        ds 2
;----------------------------------------
FontInfoRecord anop
Ascent         ds 2
Descent        ds 2
WidMax         ds 2
leading        ds 2
hauteur        ds 2
;
Penloc         anop
Penlocv        ds 2
Penloch        ds 2
;
nPenloch       ds 2
;----------------------------------------
;----- offset rectangle -----------------
;----------------------------------------
off_rectx0     dc i'3'
off_recty0     dc i'3'
off_rectx1     dc i'3'
off_recty1     dc i'3'
;----------------------------------------
;----- data des test rect des buffer ----
;----------------------------------------
rect1          anop
rect1_y0       ds 2
rect1_x0       ds 2
rect1_y1       ds 2
rect1_x1       ds 2

rect2          anop
rect2_y0       ds 2
rect2_x0       ds 2
rect2_y1       ds 2
rect2_x1       ds 2

rect3          ds 8

zligne         ds 2

zLine_x        ds 2                     |Zone travail buffer Ligne
zLine_y        ds 2

zr_y0          ds 2
zr_x0          ds 2
zr_y1          ds 2
zr_x1          ds 2

rectdest       dc i'81,150,119,194'     |cadre de depart
;----------------------------------------
;----------------------------------------
;----------------------------------------
char_rect      anop
char_v1        ds 2
char_h1        ds 2
char_v2        ds 2
char_h2        ds 2
;----------------------------------------
;----- PPtoPort -------------------------
;----------------------------------------
destX          ds 2                     |ou placer la COPIE
destY          ds 2
;--
FondLocInfo    dc i2'0'                 |LocInfo du Fond Frame
FondPtr        ds 4
               dc i'160'
               dc i'0,0,200,320'
;--
aLocInfo       dc i2'0'                 |LocInfo Standard
aPicPtr        ds 4
               dc i'160'
               dc i'0,0,200,320'

aSrcRect       dc i'0,0,175,308'        |petit pour Icons Borders
;--
SrcLocInfo     dc i1'$00'
               dc i1'0'
PicPtr         ds 4
               dc i'160'                       |multiple de 8
               dc i'0,0,200,320'
;--
PaintParams    anop
               dc i4'LitLocinfo'
               dc i4'DestLocinfo'
               dc i4'SrcRect'
               dc i4'DestRect'
               dc i2'0'
               dc i4'0'

PaintParams2   anop
               dc i4'Ppage_LocInfo'
               dc i4'LitLocInfo'
               dc i4'SrcRect'
               dc i4'DestRect'
               dc i2'0'
               dc i4'0'

Ppage_LocInfo  dc i1'0'                 |loc info du port
               dc i1'0'
Ppage_ptr      ds 4
               dc i'160'                |multiple de 8
               dc i'0,0,200,320'

LitLocInfo     dc i1'0'                        |petit port d'image
               dc i1'0'
PtrLit         ds 4
               dc i'128'                       |multiple de 8
               dc i'0,0,69,256'

DestLocInfo    ds 16

SrcRect        anop
SrcRecty0      ds 2
SrcRectx0      ds 2
SrcRecty1      ds 2
SrcRectx1      ds 2

DestRect       anop
DestRecty0     ds 2
DestRectx0     ds 2
DestRecty1     ds 2
DestRectx1     ds 2

temphdle       ds 4
;----------------------------------------
;----- Tools ----------------------------
;----------------------------------------
ToolTable      dc i'10'
               dc i'5,$0100'            | desk manager
               dc i'6,$0100'            | event manager
               dc i'14,$0103'           | window manager from disk!
               dc i'15,$0103'           | menu manager from Disk!
               dc i'16,$0103'           | control manager form disk!
;              dc i'19,$0000'           | printer manager
               dc i'20,$0100'           | line edit
               dc i'21,$0100'           | dialog manager from disk!
               dc i'23,$0100'           | standard file
               dc i'27,$0100'           | font manager
               dc i'28,$0000'           | list manager
ToolTable1     dc i'2'
               dc i'4,$0101'            | quickdraw
               dc i'18,$0000'           | quickdraw aux
;----------------------------------------
;----- EVENT RECORD TASKMASTER ----------
;----------------------------------------
EventRecord    anop

EventWhat      ds 2
EventMessage   ds 4
EventWhen      ds 4

EventWhere     anop
mousey         ds 2
mousex         ds 2

EventModifiers ds 2
TaskDATA       ds 4
TaskMask       dc i4'$1F7F'             |SELECT WINDOW FAIT PAR APPLICATION

Double_Click   ds 2

               END
;----------------------------------------
;----- data prodos ----------------------
;----------------------------------------
ProdosData     DATA

;----------------------------------------
NameBroder     str '1/Broder.presents'
NameShowOff    str '1/Showoff.title'
BMOptionName   str '1/BmOption'
;namepic        str '1/picture'
namebor        str '1/border/border..'
;nameico        str '1/icon/icon..'
;Dnamebor       str '1/border'
;Dnameico       str '1/icon'
NameIcon       ds 16
;----------------------------------------
OpenParams     anop
OpenID         ds 2
NamePtr        ds 4
               ds 4

RenameParams   anop
ReNamePtr      ds 4
New_RenamePtr  ds 4

ReadParams     anop
ReadID         ds 2
ReadDest       ds 4
Readlg         dc i4'$7D00'             | this many bytes
               ds 4                     | how many xfered

CloseParams    anop
CloseID        ds 2

SetMarkParams  anop
SetMarkId      ds 2
SetMarkpos     ds 4

SetEofParams   anop
SetEofId       ds 2
SetEofpos      ds 4

GetEofParams   anop
GetEofId       ds 2
GetEofpos      ds 4

CreateParams   anop
createnameptr  ds 4
createaccess   dc i2'$C3'
createfiletype dc i2'0'
createauxtype  dc i4'0'
createstorage  dc i2'0'
createdate     dc i2'0'
createtime     dc i2'0'                     


WriteParams    anop
WriteID        ds 2
Writedest      ds 4
Writelg        dc i4'$7D00'             | this many bytes
WriteByte      ds 4                     | how many xfered

DestroyParams  anop
destroynameptr ds 4

PicSize        ds 2
adptr          ds 4
;--------------------------------------
;        PRODOS ERROR
;--------------------------------------
IoError        gequ $27
WriteProtect   gequ $2B
PathNotFound   gequ $44
VolNotFound    gequ $45
FileNotFound   gequ $46
DuplicatePN    gequ $47
VolumeFull     gequ $48
VolumeDirFull  gequ $49
;--------------------------------------
;        PRODOS ERROR STRING
;--------------------------------------
TX_ERRIO       str 'I/O error'
TX_ERRWP       str 'Disk write protected'
TX_ERRFNF      str 'File not found'
TX_ERRVF       str 'Volume full'
TX_ERRVDF      str 'Volume directory full'
TX_ERRGL       str 'ERROR PRODOS = XXXX'
TX_ERRRES      str 'Insert ShowOff disk'
TX_ERRLBM      str 'Sorry file damaged'
;--
AltVolTxt      str 'Insert'
VolumeTxt      dc c' 2345678901234567890'
;--
initpfxParams  dc i'0'
               dc i4'InitStr'
;--
GetPrefixParams dc i'7'
               dc i4'VolStr'

SetPrefixParams dc i'7'
               dc i4'BootStr'

BootStr        str '*/'
VolStr         ds 16
InitStr        dc i1'2',c'1/'           |position sur directory
;--
reply          anop

reply_good     ds 2
reply_ftype    ds 2
reply_aftype   ds 2
reply_filename dc i1'0',15c' '
reply_fullname dc i1'0',128c' '

prodos_err     ds 2

TypeListBM     dc i1'02,$C0,$C1'
TypeListBMP    dc i1'01,$C0'
TypeListTempl  dc i1'01,$F3'
TypeListLabel  dc i1'01,$F4'
;----------------------------------------
;      PRODOS MESSAGE
;----------------------------------------
TxLoadOther    str 'Load an icon file'
TxSaveIcon     str 'Save an icon file'
TXSaveBitmap   str 'Save as Bitmap'
TxLoadTempl    str 'Load a Template'
TxSaveTempl    str 'Save a Template'
TxLoadLabel    str 'Load a Label'
TxSaveLabel    str 'Save a Label'
PromptStr      str 'Please insert the disk'
OkStr          str 'ok'
CancelStr      str 'Shutdown'

               END
;...............................................................
;
; Menu Data
;
;...............................................................
MenuData       DATA

LabelMenu      dc c'  Label',i1'0'
FrameMenu      dc c'  Frame',i1'0'
TemplateMenu   dc c'  Template',i1'0'
ClearTemplate  dc c'  Clear Template',i1'0'
ClearFrame     dc c'  Clear Frame',i1'0'
ClearLabel     dc c'  Clear Label',i1'0'
ShowTemplate   dc c'  Show Template',i1'0'
HideTemplate   dc c'  Hide Template',i1'0'

Return         equ 13

;--------------------------------------
;        BARRE DE MENU
;--------------------------------------
Menu1          dc c'>L@\XN1',i1'RETURN'
               dc c' LAbout ...\N256V',i1'RETURN'
               dc c'.'

Menu2          dc c'>L File \N2',i1'RETURN'
               dc c' LNew\N257*Nn',i1'return'
               dc c' LOpen\N258*Oo',i1'RETURN'
               dc c' LLoad Picture\DN259V',i1'return'
               dc c' LSave\DN260*Ss',i1'return'
               dc c' LSave As\DN261',i1'return'
               dc c' LSave as Bitmap\DN262V',i1'return'
               dc c' LChoose Printer\N291',i1'return'
               dc c' LPage Setup\N292',i1'return'
               dc c' LPrint\DN263*PpV',i1'return'
               dc c' LFormat a Disk\N294',i1'return'
               dc c' LQuit\N264*Qq',i1'RETURN'
               dc c'.'

menu3          dc c'>L Edit \N3',i1'return'
               dc c' LUndo\DN265V*Zz',i1'return'
               dc c' LClear Frame\DN266',i1'return'
               dc c' LCut\DN267*Xx',i1'return'
               dc c' LCopy\DN268*Cc',i1'return'
               dc c' LPaste\DN269V*Vv',i1'return'
               dc c' LIcon\N270',i1'return'
               dc c' LLabel\N271',i1'return'
               dc c' LTemplate\N272',i1'return'
               dc c' LSequence\DN273V',i1'return'
               dc c' LNext Frame\DN274',i1'return'
               dc c'.'

Menu4          dc c'>L Goodies \N4',i1'return'
               dc c' LFlip Vertical\DN275',i1'return'
               dc c' LFlip Horizontal\DN276V',i1'return'
               dc c' LBar Graph\DN277',i1'return'
               dc c' LSale Graph\DN278',i1'return'
               dc c' LPie Chart\DN279',i1'return'
               dc c' LShadow\DN280V',i1'return'
               dc c' LAuto Numbering\DN281',i1'return'
               dc c'.'

Menu5          dc c'>L Graphics \N5',i1'return'
               dc c' LBackground\DN282*Gg',i1'return'
               dc c' LSticker\DN283',i1'return'
               dc c' LIcon\DN284V*Ii',i1'return'
               dc c' LBorder\DN285*Bb',i1'return'
               dc c' LNo Border\DN286V',i1'return'
               dc c' LShow Template\DN287V',i1'return'
               dc c' LFonts\DN288*Ff',i1'return'
               dc c'.'

Menu6          dc c'>L Special\N6',i1'return'
               dc c' LSerial Setup\DN289',i1'return'
               dc c' LSerial Orders\DN290V',i1'return'
               dc c' LTransition\DN293',i1'return'
               dc c'.'

               END

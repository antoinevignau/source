*
*              Data de DoIconEdit
*

IconVar        DATA

RefConIcon     equ $0

Actif          equ 0
Inactif        equ 255
Disabled       equ 0
Enabled        equ $FFFF
BlancCol       equ 14                   ; c'est un gris

CrayonMode     equ 0
SelectMode     equ 1
LigneMode      equ 2
LettreMode     equ 3
FlipVMode      equ 4
FlipHMode      equ 5
RectMode       equ 6
PlanMode       equ 7
RRectMode      equ 8
RPlanMode      equ 9
CercleMode     equ 10
DisqueMode     equ 11

NbrCmds        equ 32
TailleX        equ 44
TailleY        equ 34

PauseInvert    equ 20
PauseCurret    equ 70

IcTitre        anop
IcTitOmbreX    equ 111
IcTitOmbreY    equ 17
IcTitleX       equ 110
IcTitleY       equ 16
IcTitRect      dc i'4,98,23,204'
IcOmbreRect    dc i'6,100,25,206'
IcLiseRect     dc i'1,1,199,319'

DessPat        anop
               dc h'FFFFFFFF'
               dc h'F000F000'
               dc h'F000F000'
               dc h'F000F000'
               dc h'FFFFFFFF'
               dc h'F000F000'
               dc h'F000F000'
               dc h'F000F000'

DialFull       dc i'0,0,200,320'        ; Dialog Bounds Rectangle

IQuit          anop
               dc i'2'                  ; identification number
               dc i'172,160,192,220'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'QuitTxt'           ; item descriptor
               dc i'0'                  ; item value
               dc i'3'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

IRevert        anop
               dc i'3'                  ; identification number
               dc i'146,260,161,315'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'RevertTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

IClear         anop
               dc i'4'                  ; identification number
               dc i'163,260,178,315'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'ClearTxt'          ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

ISave          anop
               dc i'5'                  ; identification number
               dc i'129,260,144,315'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SaveTxt'           ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

ILoad          anop
               dc i'6'                  ; identification number
               dc i'112,260,127,315'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'LoadTxt'           ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

ICut           anop
               dc i'7'                  ; identification number
               dc i'5,260,20,315'       ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'CutTxt'            ; item descriptor
               dc i'0'                  ; item value
               dc i'$FF00'              ; bit vector flag
               dc i4'0'                 ; color table pointer

ICopy          anop
               dc i'8'                  ; identification number
               dc i'22,260,37,315'      ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'CopyTxt'           ; item descriptor
               dc i'0'                  ; item value
               dc i'$FF00'              ; bit vector flag
               dc i4'0'                 ; color table pointer

IPaste         anop
               dc i'9'                  ; identification number
               dc i'39,260,54,315'      ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'PasteTxt'          ; item descriptor
               dc i'0'                  ; item value
               dc i'$FF00'              ; bit vector flag
               dc i4'0'                 ; color table pointer

BitMapRect     dc i'64,263,100,309'     ; display rectangle
BMDessRect     dc i'65,264,99,308'      ; Content rectangle

BitMapAdr      dc i'$4924,$49C4,$4A64,$4B04,$4BA4,$4C44,$4CE4,$4D84'
               dc i'$4E24,$4EC4,$4F64,$5004,$50A4,$5144,$51E4,$5284'
               dc i'$5324,$53C4,$5464,$5504,$55A4,$5644,$56E4,$5784'
               dc i'$5824,$58C4,$5964,$5A04,$5AA4,$5B44,$5BE4,$5C84'
               dc i'$5D24,$5DC4,$5E64,$5F04,$5FA4,$6044,$60E4,$6184'

ILeDessin      anop
               dc i'10'                 ; identification number
DessRect       dc i'27,61,166,240'      ; display rectangle
               dc i'UserItem'           ; item type
               dc i4'DessProc'          ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

DDessRect      dc i'29,62,165,239'      ; Content rectangle

LoupeAdr       dc i'$323F,$34BF,$373F,$39BF,$3C3F,$3EBF,$413F,$43BF'
               dc i'$463F,$48BF,$4B3F,$4DBF,$503F,$52BF,$553F,$57BF'
               dc i'$5A3F,$5CBF,$5F3F,$61BF,$643F,$66BF,$693F,$6BBF'
               dc i'$6E3F,$70BF,$733F,$75BF,$783F,$7ABF,$7D3F,$7FBF'
               dc i'$823F,$84BF,$873F,$89BF,$8C3F,$8EBF,$913F,$93BF'

CoulToPat      dc i'$00F0,$11F1,$22F2,$33F3,$44F4,$55F5,$66F6,$77F7'
               dc i'$88F8,$99F9,$AAFA,$BBFB,$CCFC,$DDFD,$EEFE,$FFFF'

ILesCmds       anop
               dc i'11'                 ; identification number
CmdsDisp       dc i'19,6,171,43'        ; display rectangle
               dc i'UserItem'           ; item type
               dc i4'CmdsProc'          ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

IUndo          anop
               dc i'12'                 ; identification number
               dc i'180,260,195,315'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'UndoTxt'           ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

ISelIcon       anop
               dc i'13'                 ; identification number
               dc i'172,80,192,140'     ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'SelIconTxt'        ; item descriptor
               dc i'0'                  ; item value
               dc i'3'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltLoseOk      anop
LoseIDOk       dc i'2'                  ; identification number
               dc i'47,19,59,93'        ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'OkTxt'             ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltLoseCancel  anop
               dc i'1'                  ; identification number
               dc i'47,112,59,186'      ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'CancelText'        ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltLoseText1   anop
               dc i'4'                  ; identification number
               dc i'29,3,41,200'       ; display rectangle
               dc i'StatText+ItemDisable'
               dc i4'LoseTxt1'          ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltLoseText2   anop
               dc i'5'                  ; identification number
               dc i'9,75,21,200'        ; display rectangle
               dc i'StatText+ItemDisable'
               dc i4'LoseTxt2'          ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

LoseAlert      anop
               dc i'68,57,132,251'
               dc i'1'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'AltLoseOk'
               dc i4'AltLoseCancel'
               dc i4'AltLoseText1'
               dc i4'AltLoseText2'
               dc i4'0'

CmdsRect       anop

CrayRect       dc i'23,9,35,26'
SeleRect       dc i'23,27,35,44'
LignRect       dc i'36,9,48,26'
LettreRect     dc i'36,27,48,44'
FlipVRect      dc i'49,9,61,26'
FlipHRect      dc i'49,27,61,44'
RectRect       dc i'62,9,74,26'
PlanRect       dc i'62,27,74,44'
RectRRect      dc i'75,9,87,26'
PlanRRect      dc i'75,27,87,44'
CercleRect     dc i'88,9,100,26'
DisqueRect     dc i'88,27,100,44'


FleHRect       dc i'103,23,111,30'
FleGRect       dc i'111,9,118,22'
FleDRect       dc i'111,31,118,43'
FleBRect       dc i'118,23,126,30'

Col1Rect       dc i'129,8,137,18'
Col2Rect       dc i'129,17,137,27'
Col3Rect       dc i'129,26,137,36'
Col4Rect       dc i'129,35,137,45'
Col5Rect       dc i'136,8,144,18'
Col6Rect       dc i'136,17,144,27'
Col7Rect       dc i'136,26,144,36'
Col8Rect       dc i'136,35,144,45'
Col9Rect       dc i'143,8,151,18'
Col10Rect      dc i'143,17,151,27'
Col11Rect      dc i'143,26,151,36'
Col12Rect      dc i'143,35,151,45'
Col13Rect      dc i'150,8,158,18'
Col14Rect      dc i'150,17,158,27'
Col15Rect      dc i'150,26,158,36'
Col16Rect      dc i'150,35,158,45'

LastCmds       dc i'0,0,0,0'
LastColor      dc i'0,0,0,0'
SelectionRect  dc i'0,0,0,0'
SelecDessRect  dc i'0,0,0,0'

IconBlock      dc i1'0'
               dc i1'0'
CmdsIcon       ds 4
               dc i'24'
IconCRect      dc i'0,0,152,48'


ScrapBlock     dc i1'0'
               dc i1'0'
ScrapIcon      ds 4
               dc i'24'
               dc i'0,0,34,48'

ScrapCRect     dc i'0,0,0,0'

Flag_loupe     ds 2                     |dessine la loupe si 1 FORCER

NbrCar         ds 2
LeMot          ds 10
LettreColor    ds 10

CmdsIconHdl    ds 4
DessClipHdl    ds 4
CmdsClipHdl    ds 4
ClipRHdl       ds 4
AllSHdl        ds 4

ScrapBufHdl    ds 4
RevertBufHdl   ds 4
MvSelectHdl    ds 4

DessBitMap     ds 4
DlgIconPtr     ds 4
LePort         ds 4

PatColK1       ds 2
PatColK2       ds 2
SelecPat       ds 2                     ; 0 = pat1 , 1 = pat2

Coul1          ds 2
Coul2          ds 2
Coul3          ds 2
Coul4          ds 2

InvertPPause   ds 2
CurretPPause   ds 2
TopCurret      ds 2
QuitIcon       ds 2
CutEnab        ds 2
LettreEnab     ds 2
ItemHit        ds 2
RectNum        ds 2
CmdsMode       ds 2
ColorNum       ds 2
LePenMode      ds 2
OldTextMode    ds 2
IcSelect       ds 2

CoordX         ds 2
TempX          ds 2
KMouseX        ds 2
OrigineX       ds 2
BitMCX         ds 2               
DeltaX         ds 2
ODiagX         ds 2
EDiagX         ds 2

CoordY         ds 2
TempY          ds 2
KMouseY        ds 2
OrigineY       ds 2
BitMCY         ds 2
DeltaY         ds 2
ODiagY         ds 2
EDiagY         ds 2

CouleurDuPt    ds 2
CoordCouleur   ds 2
FillColor      ds 2
MouseNotMv     ds 2

QuitTxt        str 'Quit'
SelIconTxt     str 'Select'
OkTxt          str 'Ok'
CancelText     str 'Cancel'
RevertTxt      str 'Revert'
ClearTxt       str 'Clear'
SaveTxt        str 'Save'
LoadTxt        str 'Load'
CutTxt         str 'Cut'
CopyTxt        str 'Copy'
PasteTxt       str 'Paste'
UndoTxt        str 'Undo'
IconTitle      str 'Icon Editor'

LoseTxt1       str 'Changes will not be saved'
LoseTxt2       str 'Caution !'

BMCmdsName     str '1/BMCmds'

               END

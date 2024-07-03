;------------------------------------------------------------------
;
; FILE : CHARTDATA.S                    - Data des Bar Sale Pie -
;        -----------
;
;------------------------------------------------------------------
GraphData      DATA

GrActif        equ 0
GrInactif      equ 255

FirstEdit      gequ 12
TypeBar        gequ 0
TypeSale       gequ 1
TypePChart     gequ 2
RefConChart    gequ 33

GrTitre        anop
GrTitOmbreX    equ 113
GrTitOmbreY    equ 15
GrTitleX       equ 112
GrTitleY       equ 14
GrTitRect      dc i'4,87,18,223'
GrOmbreRect    dc i'6,89,20,225'

ChOmbreRect    dc i'0,0,0,0'

OkPressed      ds 2

DlgGraphPtr    ds 4
GrLePort       ds 4
SauveSize      ds 4                     ; point

MaxPositif     ds 4                     ; ce sont des longs
MaxNegatif     ds 4
GrDblLong1     ds 8
GrLong1        ds 4
GrLong2        ds 6                     ; 48 bits pour %
GrLongMul      ds 4
GrResLong      ds 4
SommeValeur    ds 6
GrMaximum      ds 4

ChTemp0        ds 2
ChTemp1        ds 2
ChTemp2        ds 2
ChTempX        ds 2
ChTempY        ds 2
QuitGraph      ds 2
ExitType       ds 2
ExitLineCol    ds 2
ExitLineSize   ds 2
ExitShadow     ds 2
GrModifActif   ds 2
GrItemHit      ds 2
GrRectNum      ds 2
GrEditActif    ds 2
RectLargeur    ds 2
RectHauteur    ds 2
FoundNegatif   ds 2
CstHautMax     ds 2
CstHautMin     ds 2
GrStartAngle   ds 2
GrEndAngle     ds 2
GrArcAngle     ds 2
GrHauteurMax   ds 2
GrLargeurMax   ds 4
GrMidLine      ds 2
GrDeltaX       ds 2
GrBarAbsX      ds 2
GrSaleX        ds 2
GrSaleY        ds 2
LastSaleCol    ds 2

GrRecord       anop                     ; en entree de computation
ChartRect      dc i'0,0,0,0'
GraphType      ds 2
GrLineCol      ds 2
GrLineSize     ds 2
GrShadow       ds 2
NbrValeur      ds 2
EditCouleur    ds 24
EditValeur     ds 48

EditRCouleur   ds 24
GrTheString    ds 20                    ; 20 caracteres maximum

NbrValidCar    gequ 46                  ; 23 x 2
ValidCar       dc i'$30,$31,$32,$33,$34,$35,$36,$37,$38,$39'
               dc i'$2B,$2D,$7F,$8,$15,$D,$158,$178,$143,$156,$163,$176'
               dc i'$9'

GrCompute      anop
               dc i'1'                  ; identification number
               dc i'149,240,162,305'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'GrCompTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrCancel       anop
               dc i'2'                  ; identification number
               dc i'167,240,180,305'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'GrCancelTxt'       ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrQuit         anop
               dc i'3'                  ; identification number
               dc i'183,240,196,305'    ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'GrQuitTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrTheChart     anop
               dc i'4'                  ; identification number
ExChartRect    dc i'22,157,144,305'     ; display rectangle, en entree de comp.
               dc i'UserItem'           ; item type
               dc i4'ChartProc'         ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer
InsChartRect   dc i'23,158,143,304'

GrSelBar       anop
               dc i'5'                  ; identification number
               dc i'166,110,177,200'    ; display rectangle
               dc i'RadioItem'          ; item type
               dc i4'GrBarTxt'          ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrSelSale      anop
               dc i'6'                  ; identification number
               dc i'176,110,187,200'    ; display rectangle
               dc i'RadioItem'          ; item type
               dc i4'GrSaleTxt'         ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrSelPie       anop
               dc i'7'                  ; identification number
               dc i'186,110,197,200'    ; display rectangle
               dc i'RadioItem'          ; item type
               dc i4'GrPieTxt'          ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

PremierEdit    anop

GrEdit12       anop
               dc i'8'                  ; identification number
               dc i'22,20,33,110'       ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit11       anop
               dc i'9'                  ; identification number
               dc i'34,20,45,110'       ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit10       anop
               dc i'10'                 ; identification number
               dc i'46,20,57,110'       ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit9        anop
               dc i'11'                 ; identification number
               dc i'58,20,69,110'       ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit8        anop
               dc i'12'                 ; identification number
               dc i'70,20,81,110'       ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit7        anop
               dc i'13'                 ; identification number
               dc i'82,20,93,110'       ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit6        anop
               dc i'14'                 ; identification number
               dc i'94,20,105,110'      ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit5        anop
               dc i'15'                 ; identification number
               dc i'106,20,117,110'     ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit4        anop
               dc i'16'                 ; identification number
               dc i'118,20,129,110'     ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit3        anop
               dc i'17'                 ; identification number
               dc i'130,20,141,110'     ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit2        anop
               dc i'18'                 ; identification number
               dc i'142,20,153,110'     ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrEdit1        anop
               dc i'19'                 ; identification number
               dc i'154,20,165,110'     ; display rectangle
               dc i'EditLine'
               dc i4'0'                 ; item descriptor
               dc i'10'                 ; max number of car
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

GrPalette      anop
               dc i'20'                 ; identification number
               dc i'167,8,196,45'       ; display rectangle
               dc i'UserItem'
               dc i4'GrDrawThePal'
               dc i'0'
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

StatPercRect   dc i'22,112,165,155'
PremierStat    anop
GrStat12       dc i'137,31'
GrStat11       dc i'137,43'
GrStat10       dc i'137,55'
GrStat9        dc i'137,67'
GrStat8        dc i'137,79'
GrStat7        dc i'137,91'
GrStat6        dc i'137,103'
GrStat5        dc i'137,115'
GrStat4        dc i'137,127'
GrStat3        dc i'137,139'
GrStat2        dc i'137,151'
GrStat1        dc i'137,163'

GrRondCouleur  anop
RondCol12      dc i'22,8,33,18'
RondCol11      dc i'34,8,45,18'
RondCol10      dc i'46,8,57,18'
RondCol9       dc i'58,8,69,18'
RondCol8       dc i'70,8,81,18'
RondCol7       dc i'82,8,93,18'
RondCol6       dc i'94,8,105,18'
RondCol5       dc i'106,8,117,18'
RondCol4       dc i'118,8,129,18'
RondCol3       dc i'130,8,141,18'
RondCol2       dc i'142,8,153,18'
RondCol1       dc i'154,8,165,18'

GrPalRect      anop
GrCol1Rect     dc i'167,8,175,18'
GrCol2Rect     dc i'167,17,175,27'
GrCol3Rect     dc i'167,26,175,36'
GrCol4Rect     dc i'167,35,175,45'
GrCol5Rect     dc i'174,8,182,18'
GrCol6Rect     dc i'174,17,182,27'
GrCol7Rect     dc i'174,26,182,36'
GrCol8Rect     dc i'174,35,182,45'
GrCol9Rect     dc i'181,8,189,18'
GrCol10Rect    dc i'181,17,189,27'
GrCol11Rect    dc i'181,26,189,36'
GrCol12Rect    dc i'181,35,189,45'
GrCol13Rect    dc i'188,8,196,18'
GrCol14Rect    dc i'188,17,196,27'
GrCol15Rect    dc i'188,26,196,36'
GrCol16Rect    dc i'188,35,196,45'
GrEndColRect   anop

GrDialFull     dc i'0,0,200,320'
GrLiseRect     dc i'1,1,199,319'
GrBarRect      dc i'0,0,0,0'
GrLastRect     dc i'0,0,0,0'
GrExitRect     dc i'0,0,0,0'

AltNegaCancel  anop
               dc i'1'                  ; identification number
               dc i'47,85,59,155'       ; display rectangle
               dc i'ButtonItem'         ; item type
               dc i4'GrCancelTxt'       ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltNegaText1   anop
               dc i'2'                  ; identification number
               dc i'29,21,41,230'       ; display rectangle
               dc i'StatText+ItemDisable'
               dc i4'GrTxt1'            ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltNegaText2   anop
               dc i'3'                  ; identification number
               dc i'12,70,24,230'       ; display rectangle
               dc i'StatText+ItemDisable'
               dc i4'GrTxt2'            ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltLargText1   anop
               dc i'2'                  ; identification number
               dc i'29,11,41,230'       ; display rectangle
               dc i'StatText+ItemDisable'
               dc i4'GrTxt3'            ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

AltLargText2   anop
               dc i'3'                  ; identification number
               dc i'12,70,24,230'       ; display rectangle
               dc i'StatText+ItemDisable'
               dc i4'GrTxt4'            ; item descriptor
               dc i'0'                  ; item value
               dc i'0'                  ; bit vector flag
               dc i4'0'                 ; color table pointer

StopNegaAlert  anop
               dc i'68,40,132,280'
               dc i'1'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'AltNegaCancel'
               dc i4'AltNegaText1'
               dc i4'AltNegaText2'
               dc i4'0'

StopLargAlert  anop
               dc i'68,40,132,280'
               dc i'1'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'AltNegaCancel'
               dc i4'AltLargText1'
               dc i4'AltLargText2'
               dc i4'0'

GrQuitTxt      str      'Ok'
GrCompTxt      str      'Compute'
GrBarTxt       str      'Bar Graph'
GrSaleTxt      str      'Sale Graph'
GrPieTxt       str      'Pie Chart'
GrCancelTxt    str      'Cancel'
GrTxt2         str      'Negative values'
GrTxt1         str      'are not valid for pie chart'
GrTxt4         str      'Numbers greater than'
GrTxt3         str      '2,147,483,647 are not allowed'
ChartTitle     str      'Graph Editor'
               END

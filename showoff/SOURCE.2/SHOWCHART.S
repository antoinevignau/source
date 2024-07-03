;------------------------------------------------------------------
;
; FILE : SHOWCHART.S                    - Bar Sale Pie -
;        -----------
;
;------------------------------------------------------------------
               List Off
               Gen Off
               Symbol Off
               Keep DoCallGH
               65816 On

               MCopy ShowChart.mac

               longa on
               longi on
;...............................................................
;
;        DoCallGHR
;
;...............................................................
DoCallGHR      START

               brl DoCallGH

               END
;...............................................................
;
;        DoCallGH
;
;...............................................................
DoCallGH       START
               Using GlobalData
               Using GraphData

               phb
               phk
               plb

               lda >Fonct_Graph
               asl a
               tax
               jsr (Table_PGraph,x)
;--
               lda #DoCallGH
               sta <Ptr_PZero
               lda #^DoCallGH
               sta <Ptr_PZero+2
               plb

               rtl
;--
Table_PGraph   ANOP
               dc i'Proc_F0'
               dc i'Proc_F1'
               dc i'Proc_F2'
               dc i'Proc_F3'
               dc i'Proc_F4'
;--------------------------------------
;        Proc_F0
;--------------------------------------
Proc_F0        ENTRY
               jsr Graph2Edit
               jsr Computation
               rts
;--------------------------------------
;        Proc_F1
;--------------------------------------
Proc_F1        ENTRY
               jsr Graph2Edit
               jsr ModifGraph

               lda >OkPressed
               beq FProc_F1

               jsr Edit2Graph
               sec
               rts
;--
FProc_F1       clc
               rts
;--------------------------------------
;        Proc_F2
;--------------------------------------
Proc_F2        ENTRY
               jsr DoBarGraph
               lda >OkPressed
               beq FProc_F2
               jsr Edit2Graph
               sec
               rts
;--
FProc_F2       clc
               rts
;--------------------------------------
;        Proc_F3
;--------------------------------------
Proc_F3        ENTRY
               jsr DoSaleGraph
               lda >OkPressed
               beq FProc_F3
               jsr Edit2Graph
               sec
               rts
;--
FProc_F3       clc
               rts
;--------------------------------------
;        Proc_F4
;--------------------------------------
Proc_F4        ENTRY
               jsr DoPieChart
               lda >OkPressed
               beq FProc_F4
               jsr Edit2Graph
               sec
               rts
;--
FProc_F4       clc
               rts
;--------------------------------------
;        Graph2Edit
;--------------------------------------
Graph2Edit     ENTRY

               lda >Lg_GraphRecord
               tax
               dex
               dex
LOOP           lda >GraphRecord,x
               sta GRRecord,x
               dex
               dex
               bpl LOOP

               rts
;--------------------------------------
;        Edit2Graph
;--------------------------------------
Edit2Graph     ENTRY

               lda >Lg_GraphRecord
               tax
               dex
               dex
LOOP1          lda GRRecord,x
               sta >GraphRecord,x
               dex
               dex
               bpl LOOP1

               rts

               END
;...............................................................
;
;        DoBar ETC...
;
;...............................................................

DoBarGraph     START
               USING    GraphData
               USING    GlobalData
               USING    ProdosData

               lda      #TypeBar
               bra      StartGraph

DoSaleGraph    ENTRY

               lda      #TypeSale
               bra      StartGraph

DoPieChart     ENTRY

               lda      #TypePChart
               bra      StartGraph

ModifGraph     ENTRY

               lda      #$FFFF
               sta      GrModifActif

               lda      GrLineCol
               sta      ExitLineCol
               lda      GrLineSize
               sta      ExitLineSize
               lda      GrShadow
               sta      ExitShadow

               lda      GraphType
               sta      ExitType
               and      #$00FF
               sta      GraphType

               lda      ChartRect
               sta      GrExitRect
               lda      ChartRect+2
               sta      GrExitRect+2
               lda      ChartRect+4
               sta      GrExitRect+4
               lda      ChartRect+6
               sta      GrExitRect+6

               bra      ModifStart


StartGraph     sta      GraphType
               sta      ExitType
               stz      GrModifActif

               lda      >Outline
               sta      ExitLineSize
               lda      >OutLine_Color
               sta      ExitLineCol
               stz      ExitShadow

               lda      #77
               sta      GrExitRect
               lda      #128
               sta      GrExitRect+2
               lda      #122
               sta      GrExitRect+4
               lda      #193
               sta      GrExitRect+6

ModifStart     stz      QuitGraph
;--
               stz WorkOk_Status        | ++++ bug 04 mai 1988 ++++
;--
               stz      GrLineCol
               stz      GrShadow
               lda      #1
               sta      GrLineSize

               lda      ExChartRect
               sta      ChartRect
               lda      ExChartRect+2
               sta      ChartRect+2
               lda      ExChartRect+4
               sta      ChartRect+4
               lda      ExChartRect+6
               sta      ChartRect+6
               jsr      MkInsChartR

               jsl      Pleine_Page

               Pushlong #0
               _GetPort

               pla
               sta      GrLePort
               pla
               sta      GrLePort+2

               PushLong #0              ; dialogPtr
               PushLong #GrDialFull     ; content rectangle
               PushLong #0              ; no title
               PushLong #$FFFFFFFF      ; bring to front
               PushWord #$0020          ; frame
               PushLong #RefConChart
               PushLong #GrDialFull     ; full size
               _NewModelessDialog

               pla
               sta      DlgGraphPtr
               pla
               sta      DlgGraphPtr+2

               PushLong DlgGraphPtr
               PushLong #GrCompute
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrCancel
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrQuit
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrTheChart
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrSelBar
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrSelSale
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrSelPie
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit1
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit2
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit3
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit4
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit5
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit6
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit7
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit8
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit9
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit10
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrEdit11
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #PremierEdit
               _GetNewDItem

               PushLong DlgGraphPtr
               PushLong #GrPalette
               _GetNewDItem

               PushLong DlgGraphPtr
               _SetPort

               jsr      DrawGrTitre

*
*              Dessine les cercles de couleur des edit line
*

               ldx      #0
NextRondEdit   stx      GrEditActif

               lda      GrModifActif
               beq      RondEdit0

               txa
               asl      a
               tay
               lda      EditCouleur,y
               sta      GrRectNum
               bra      RondEdit1

RondEdit0      txa
               clc
               adc      #4
               sta      GrRectNum

RondEdit1      jsr      SetRondCouleur
               inx
               cpx      #FirstEdit
               bcc      NextRondEdit

               dex
               stx      GrEditActif

               jsr      SetCheckItem
               jsr      SetInitEditL
               jsr      SetPercents

               PushWord #0
               PushWord #3              ; key down
               PushLong #9              ; tab key
               _PostEvent
               pla


*
*              Boucle de programme
*

NextEvent      PushWord #0
               PushWord #$1FFF
               PushLong #EventRecord
               _GetNextEvent

               pla
               bne      HdlEvent

*                       WithNoEvent

               bra      HdlEvent

HdlEvent       anop

               PushWord #4
               _SetForeColor

               lda      >EventWhat
               cmp      #3
               beq      itsaKeyDown
               cmp      #5
               beq      itsaKeyDown

               bra      IsItACarExit

ItsAKeyDown    lda      >EventModifiers
               and      #$0100
               ora      >EventMessage
               ldx      #0

TestNextChar   cmp      ValidCar,x
               beq      IsItACarExit    ; caractere accepte

               inx
               inx
               cpx      #NbrValidCar
               bcc      TestNextChar

               bra      NextEvent

IsItACarExit   cmp      #9              ;tab key
               bne      TDialSel

               lda      GrEditActif
               inc      a
               cmp      #12             |BUG ++
               bcc      ReStorEdAct
               lda      #0
ReStorEdAct    sta      GrEditActif

TDialSel       PushWord #0
               PushLong #EventRecord
               PushLong #DlgGraphPtr
               PushLong #GrItemHit
               _DialogSelect

               pla
               bne      IndirEvent
               brl      NextEvent

IndirEvent     lda      GrItemHit
               asl      a
               tax

               jsr      (LesGrIndir,x)

               lda      QuitGraph
               bne      CloseDial
               brl      NextEvent

CloseDial      PushLong DlgGraphPtr
               _CloseDialog

*
*              Exit
*
               lda      ExitLineCol
               sta      GrLineCol
               lda      ExitLineSize
               sta      GrLineSize
               lda      ExitShadow
               sta      GrShadow

               lda      GrExitRect
               sta      ChartRect
               lda      GrExitRect+2
               sta      ChartRect+2
               lda      GrExitRect+4
               sta      ChartRect+4
               lda      GrExitRect+6
               sta      ChartRect+6

               lda      ExitType
               sta      GraphType

               Pushlong GrLeport
               _SetPort

               jsl      Demi_Page

               rts

*              2eme partie

LesGrIndir     anop

               dc i'GrIgnore'

               dc i'GrComputAct'
               dc i'GrCancelAct'
               dc i'GrQuitAct'
               dc i'GrIgnore'
               dc i'GrSelChkAct'
               dc i'GrSelChkAct'
               dc i'GrSelChkAct'

               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'
               dc i'GrEditAct'

               dc i'GrPaletAct'

*
*              Ignore
*
GrIgnore       anop

               rts

*
*              Compute : calcule puis dessine les histo...
*
GrComputAct    anop

               stz      ChTemp0
               stz      NbrValeur

NextInitCol    lda      ChTemp0
               asl      a
               tay                      ; initialise
               lda      EditRCouleur,y
               sta      EditCouleur,y
               lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      #FirstEdit
               bcc      NextInitCol

               stz      ChTemp0

TestComputAble PushLong DlgGraphPtr     ; on recupere le texte
               lda      ChTemp0
               clc
               adc      PremierEdit
               pha
               PushLong #GrTheString
               _GetIText

               lda      GrTheString
               and      #$00FF
               bne      TestComput2
               brl      NextCompuTest

TestComput2    PushLong #0              ; on convertit le string en long
               Pushlong #GrTheString+1  ; pointeur vers les lettres
               lda      GrTheString
               and      #$00FF
               pha                      ; longeur
               PushWord #$FFFF          ; nombre signe
               _Dec2Long
               bcc      NoConvertErr
               cmp      #$0B03
               bne      NoConvertErr

               pla
               pla

               PushWord #0
               PushLong #StopLargAlert
               PushLong #0
               _StopAlert
               pla

               PushWord #15
               _SetSolidPenPat
               PushLong #InsChartRect
               _PaintRect

               lda      #1
               sta      FoundNegatif    ; en fait found greater than ...

               brl      TestFNeg

NoConvertErr   lda      NbrValeur
               asl      a
               sta      ChTemp2
               asl      a
               tax
               inc      NbrValeur

               pla                      ; on stocke la valeur
               ply
               phy
               pha

               sta      EditValeur,x
               tya
               sta      EditValeur+2,x

               lda      ChTemp0
               asl      a
               tay
               lda      EditRCouleur,y
               ldy      ChTemp2
               sta      EditCouleur,y

               lda      #10
               sta      GrTheString

               PushLong #GrTheString+1
               PushWord #10             ; longueur de 10 char
               PushWord #$FFFF          ; nombre signe
               _Long2Dec

               PushLong DlgGraphPtr
               lda      ChTemp0
               clc
               adc      PremierEdit
               pha

               ldx      #10
               ldy      #0

TestCharSuiv   lda      GrTheString+1,y
               and      #$00FF
               cmp      #$20
               bne      DebMotTrouve
               iny
               dex
               bra      TestCharSuiv

DebMotTrouve   lda      GrTheString,y
               and      #$FF00
               sta      ChTemp1
               txa
               ora      ChTemp1
               sta      GrTheString,y
               sty      ChTemp1

               lda      #^GrTheString
               pha
               lda      #GrTheString
               clc
               adc      ChTemp1
               pha
               _SetIText

NextCompuTest  lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      #FirstEdit
               bcs      ComputExit
               brl      TestComputAble

ComputExit     PushWord #15
               _SetSolidPenPat
               PushLong #InsChartRect
               _PaintRect

               jsr      Computation

               lda      GraphType
               and      #$00FF
               cmp      #TypePChart
               beq      TestFNeg

               PushWord #GrActif
               PushLong #0              ; Output handle
               PushLong DlgGraphPtr
               PushWord GrQuit
               _GetControlDItem
               _HiliteControl           ; les parametres arrivent de _Get...

               brl      ComputExit2
;-------------------------------------- ++++++ Bug 04 mai 1988 +++++
TestFNeg       lda      FoundNegatif
               beq      camembertposi

               PushWord #GrInactif
               PushLong #0              ; Output handle
               PushLong DlgGraphPtr
               PushWord GrQuit
               _GetControlDItem
               _HiliteControl           ; les parametres arrivent de _Get...

               lda #1
               sta WorkOk_Status
               bra ComputExit2          | si positif alors ok ON
;--
camembertposi  ANOP

               lda WorkOk_Status
               beq ComputExit2

               PushWord #GrActif
               PushLong #0              ; Output handle
               PushLong DlgGraphPtr
               PushWord GrQuit
               _GetControlDItem
               _HiliteControl           ; les parametres arrivent de _Get...

               lda #0
               sta WorkOk_Status
;--------------------------------------
ComputExit2    jsr      SetPercents

               lda      ExitType
               and      #$FF00
               sta      ExitType
               lda      GraphType
               and      #$00FF
               ora      ExitType
               sta      ExitType

               rts
;--
WorkOk_Status  ds 2                     |+++++ Modif BUG 04 mai 1988 +++++
;--
*
*              Routine de trace des differents graphiques
*
Computation    ENTRY

               PushLong #SauveSize
               _GetPenSize

               lda      NbrValeur
               beq      CompJmpExit
               cmp      #FirstEdit+1
               bcc      CompNextTest
CompJmpExit    brl      ComputatExit

CompNextTest   lda      ChartRect+4     ; y2
               sec
               sbc      ChartRect       ; y1
               bmi      CompJmpExit
               sta      RectHauteur
               lda      ChartRect+6     ; x2
               sec
               sbc      ChartRect+2     ; x1
               bmi      CompJmpExit
               sta      RectLargeur

StartCompComp  jsr      SetFlipValues
               stz      ChTemp0
               stz      FoundNegatif
               stz      MaxPositif
               stz      MaxPositif+2
               lda      #$FFFF
               sta      MaxNegatif
               sta      MaxNegatif+2
               stz      SommeValeur
               stz      SommeValeur+2
               stz      SommeValeur+4

CompCompBcl    lda      ChTemp0
               asl      a
               asl      a
               tax

               lda      EditValeur,x
               clc
               adc      SommeValeur
               sta      SommeValeur
               lda      EditValeur+2,x
               adc      SommeValeur+2
               sta      SommeValeur+2
               lda      SommeValeur+4
               adc      #0              ; traite l'overflow
               sta      SommeValeur+4

               lda      EditValeur+2,x
               bmi      CompNbNegatif
               cmp      MaxPositif+2
               bcc      CompNextValue
               beq      ContCompValP
               bra      StocNewPos

ContCompValP   lda      EditValeur,x
               cmp      MaxPositif
               bcc      CompNextValue

StocNewPos     lda      EditValeur+2,x
               sta      MaxPositif+2
               lda      EditValeur,x
               sta      MaxPositif
               bra      CompNextValue

CompNbNegatif  cmp      MaxNegatif+2
               bcc      StocNewNeg
               beq      ContCompValN
               bra      CompNextValue

ContCompValN   lda      EditValeur,x
               cmp      MaxNegatif
               beq      StocNewNeg
               bcs      CompNextValue

StocNewNeg     lda      #$FFFF
               sta      FoundNegatif

               lda      EditValeur+2,x
               sta      MaxNegatif+2
               lda      EditValeur,x
               sta      MaxNegatif

CompNextValue  lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      NbrValeur
               bcc      CompCompBcl

               lda      MaxNegatif+2
               eor      #$FFFF
               sta      MaxNegatif+2
               lda      MaxNegatif
               eor      #$FFFF
               clc
               adc      #1
               sta      MaxNegatif
               lda      MaxNegatif+2
               adc      #0
               sta      MaxNegatif+2           ; prend l'oppose

               lda      FoundNegatif
               bne      CompIndirect

               stz      MaxNegatif
               stz      MaxNegatif+2

CompIndirect   lda      GraphType
               and      #$00FF
               asl      a
               tax
               jmp      (TypeRout,x)

TypeRout       dc       i'MkBarGraph'
               dc       i'MkSaleGraph'
               dc       i'MkPieChart'

*
*              Histogramme : bar graph
*
MkBarGraph     anop
               lda      #5
               sta      CstHautMax
               lda      #1
               sta      CstHautMin

               jsr      SetMidLine

               lda      InsChartRect+2
               sta      GrBarAbsX
               stz      ChTemp0

NextBarGraph   lda      GrBarAbsX
               clc
               adc      GrDeltaX
               sta      GrBarAbsX
               lda      GrDeltaX
               lsr      a
               sta      ChTemp1
               clc
               adc      GrBarAbsX
               dec      a
               sta      GrBarRect+6     ; x2
               lda      GrBarAbsX
               sec
               sbc      ChTemp1
               inc      a
               sta      GrBarRect+2     ; x1

               lda      ChTemp0
               asl      a
               asl      a
               tax
               lda      EditValeur+2,x
               bmi      BarValeurNeg
               lda      GrMidLine
               inc      a
               sta      GrBarRect+4     ; y2
               bra      BarCalcHaut
BarValeurNeg   lda      GrMidLine
               sta      GrBarRect       ; y1

BarCalcHaut    lda      GrHauteurMax
               sta      GrLongMul
               stz      GrLongMul+2

               lda      GrMaximum
               sta      GrLong2
               lda      GrMaximum+2
               sta      GrLong2+2

               lda      EditValeur,x
               sta      GrLong1
               lda      EditValeur+2,x
               sta      GrLong1+2

               jsr      RegleDeTrois

               lda      ChTemp0
               asl      a
               asl      a
               tax
               lda      EditValeur+2,x
               bmi      BarResultNeg

               lda      GrMidLine
               sec
               sbc      GrResLong
               sta      GrBarRect       ; y1
               bra      BarSetCol
BarResultNeg   lda      GrMidLine
               clc
               adc      GrResLong
               sta      GrBarRect+4     ; y2

BarSetCol      anop

               lda      GrShadow
               beq      BarSetCol2

               PushWord #0
               _SetSolidPenPat

               lda      GrBarRect
               inc      a
               inc      a
               sta      ChOmbreRect
               lda      GrBarRect+2
               inc      a
               inc      a
               sta      ChOmbreRect+2
               lda      GrBarRect+4
               inc      a
               inc      a
               sta      ChOmbreRect+4
               lda      GrBarRect+6
               inc      a
               inc      a
               sta      ChOmbreRect+6

               PushLong #ChOmbreRect
               _PaintRect

BarSetCol2     lda      ChTemp0
               asl      a
               tax
               lda      EditCouleur,x
               pha
               _SetSolidPenPat

               PushLong #GrBarRect
               _PaintRect

               lda      GrLineSize
               asl      a
               clc
               adc      #3
               cmp      GrDeltaX
               bcs      NotDrawFrame

               PushWord GrLineCol
               _SetSolidPenPat

               PushWord GrLineSize
               PushWord GrLineSize
               _SetPenSize

               PushLong #GrBarRect
               _FrameRect

NotDrawFrame   lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      NbrValeur
               bcs      DrawBarExit
               brl      NextBarGraph

DrawBarExit    PushWord InsChartRect+2
               PushWord GrMidLine       ; ordonnee ecran de l'axe des X
               _MoveTo
               PushWord #1
               PushWord #1
               _SetPenSize
               PushWord GrLineCol
               _SetSolidPenPat
               PushWord GrLargeurMax
               PushWord #0
               _Line

DrawBarExit2   brl      ComputatExit

*
*              Courbe des ventes : sale graph
*
MkSaleGraph    anop
               lda      #7
               sta      CstHautMax
               lda      #2
               sta      CstHautMin

               jsr      SetMidLine

               lda      InsChartRect+2
               sta      GrBarAbsX
               lda      EditCouleur
               sta      LastSaleCol

               stz      ChTemp0
               stz      GrLastRect
               stz      GrLastRect+2
               stz      GrLastRect+4
               stz      GrLastRect+6

NextSaleGraph  lda      GrBarAbsX
               clc
               adc      GrDeltaX
               sta      GrBarAbsX
               sta      GrSaleX

               dec      a
               sta      GrBarRect+2     ; x1
               inc      a
               inc      a
               inc      a
               sta      GrBarRect+6     ; x2

               lda      GrLineSize
               cmp      #2
               bne      TestXSize1
               inc      GrBarRect+6
               bra      SaleCalcHaut
TestXSize1     cmp      #3
               bne      TestXSize2
               inc      GrBarRect+2
               inc      GrBarRect+6
               bra      SaleCalcHaut
TestXSize2     cmp      #4
               bne      SaleCalcHaut
               inc      GrBarRect+2
               inc      GrBarRect+6
               inc      GrBarRect+6

SaleCalcHaut   lda      ChTemp0
               asl      a
               asl      a
               tax
               lda      GrHauteurMax
               sta      GrLongMul
               stz      GrLongMul+2

               lda      GrMaximum
               sta      GrLong2
               lda      GrMaximum+2
               sta      GrLong2+2

               lda      EditValeur,x
               sta      GrLong1
               lda      EditValeur+2,x
               sta      GrLong1+2

               jsr      RegleDeTrois

               lda      ChTemp0
               asl      a
               asl      a
               tax
               lda      EditValeur+2,x
               bmi      SaleResultNeg

               lda      GrMidLine
               sec
               sbc      GrResLong
               sta      GrSaleY         ; y1
               bra      SaleSetCol
SaleResultNeg  lda      GrMidLine
               clc
               adc      GrResLong
               sta      GrSaleY         ; y2


SaleSetCol     lda      GrSaleY
               dec      a
               sta      GrBarRect
               inc      a
               inc      a
               inc      a
               sta      GrBarRect+4

               lda      GrLineSize
               cmp      #2
               bne      TestYSize1
               inc      GrBarRect+4
               bra      SaleDrawHaut
TestYSize1     cmp      #3
               bne      TestYSize2
               inc      GrBarRect
               inc      GrBarRect+4
               bra      SaleDrawHaut
TestYSize2     cmp      #4
               bne      SaleDrawHaut
               inc      GrBarRect
               inc      GrBarRect+4
               inc      GrBarRect+4

SaleDrawHaut   PushWord GrLineCol
               _SetSolidPenPat

               PushWord GrLineSize
               PushWord GrLineSize
               _SetPenSize

               lda      ChTemp0
               bne      DrawSaleLine

               PushWord GrSaleX
               PushWord GrSaleY
               _MoveTo
               bra      DrawSaleRect

DrawSaleLine   PushWord GrSaleX
               PushWord GrSaleY
               _LineTo

DrawSaleRect   PushWord LastSaleCol
               _SetSolidPenPat

               PushLong #GrLastRect
               _PaintRect

               lda      ChTemp0
               asl      a
               tax
               lda      EditCouleur,x
               sta      LastSaleCol

               lda      GrBarRect
               sta      GrLastRect
               lda      GrBarRect+2
               sta      GrLastRect+2
               lda      GrBarRect+4
               sta      GrLastRect+4
               lda      GrBarRect+6
               sta      GrLastRect+6

               lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      NbrValeur
               bcs      DrawSaleExit
               brl      NextSaleGraph

DrawSaleExit   PushWord LastSaleCol
               _SetSolidPenPat
               PushLong #GrBarRect
               _PaintRect

               brl      ComputatExit

*
*              Camemberts : pie charts
*
MkPieChart     lda      FoundNegatif
               beq      StartPieChart

               PushWord #0
               PushLong #StopNegaAlert
               PushLong #0
               _StopAlert
               pla

               brl      ComputatExit

StartPieChart  anop

               jsr      MkInsChartR

               lda      GrShadow
               beq      StartSecteur

               lda      InsChartRect
               inc      a
               inc      a
               sta      ChOmbreRect
               lda      InsChartRect+2
               inc      a
               inc      a
               sta      ChOmbreRect+2
               lda      InsChartRect+4
               inc      a
               inc      a
               sta      ChOmbreRect+4
               lda      InsChartRect+6
               inc      a
               inc      a
               sta      ChOmbreRect+6

               PushWord #0
               _SetSolidPenPat

               PushLong #ChOmbreRect
               _PaintOval

StartSecteur   stz      ChTemp0

*  GrStartAngle et GrEndAngle sont initialisees par SetFlipValues

NextSecteur    lda      ChTemp0
               asl      a
               asl      a
               tax
               lda      EditValeur+2,x
               sta      GrLong1+2
               lda      EditValeur,x
               sta      GrLong1
               lda      #360
               sta      GrLongMul
               stz      GrLongMul+2
               lda      SommeValeur
               sta      GrLong2
               lda      SommeValeur+2
               sta      GrLong2+2
               lda      SommeValeur+4   ; 48 bits
               sta      GrLong2+4

               jsr      Filtre48Bits

               jsr      RegleDeTrois

               lda      GrResLong
               sta      GrArcAngle

DrawSecteur    lda      ChTemp0
               asl      a
               tax
               lda      EditCouleur,x
               pha
               _SetSolidPenPat
               PushLong #InsChartRect
               PushWord GrStartAngle
               PushWord GrArcAngle
               _PaintArc

               PushWord GrLineCol
               _SetSolidPenPat

               PushWord GrLineSize
               PushWord GrLineSize
               _SetPenSize

               PushLong #InsChartRect
               PushWord GrStartAngle
               PushWord GrArcAngle
               _FrameArc

               lda      GrStartAngle
               clc
               adc      GrArcAngle
               sta      GrStartAngle

               lda      NbrValeur
               dec      a
               dec      a
               cmp      ChTemp0
               bne      CompuTestBcl

               lda      GrEndAngle
               sec
               sbc      GrStartAngle
               sta      GrArcAngle
               inc      ChTemp0
               bra      DrawSecteur

CompuTestBcl   lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      NbrValeur
               bcs      ComputatExit
               brl      NextSecteur

ComputatExit   PushWord SauveSize
               PushWord SauveSize
               _SetPenSize

               rts

*
*              Click dans quit
*
GrQuitAct      anop
               lda      NbrValeur
               beq      GrCancelAct

               lda      #$ffff
               sta      QuitGraph
               sta      >OkPressed
               rts
*
*              Click dans cancel
*
GrCancelAct    anop
               lda      #$ffff
               sta      QuitGraph
               lda      #0000
               sta      >OkPressed
               rts
*
*              Click dans un check box
*
GrSelChkAct    anop
               jsr      ReSetCheckItem
               lda      GraphType
               and      #$FF00
               sta      GraphType

               lda      GrItemHit
               sec
               sbc      GrSelBar
               ora      GraphType
               sta      GraphType

               jsr      SetCheckItem
               rts

*
*              Click dans un edit line
*
GrEditAct      anop
               lda      GrItemHit
               sec
               sbc      PremierEdit
               sta      GrEditActif
               rts

*
*              Click dans la palette
*
GrPaletAct     anop
               stz      GrRectNum

TryPalRect     PushWord #0
               PushLong #EventWhere
               lda      #^GrPalRect
               pha
               lda      GrRectNum
               asl      a
               asl      a
               asl      a
               clc
               adc      #GrPalRect
               pha
               _PtInRect
               pla
               bne      GrColFound

               lda      GrRectNum
               cmp      #16
               bcs      GrPalExit

               inc      a
               sta      GrRectNum
               bra      TryPalRect

GrColFound     lda      #15
               sec
               sbc      GrRectNum
               sta      GrRectNum

               jsr      SetRondCouleur

GrPalExit      rts

***************************************************************
*
*              Sous-Programmes
*
***************************************************************

SetFlipValues  anop

               lda      GraphType
               and      #$00FF
               cmp      #TypePChart
               beq      SetFPChart

               lda      GraphType
               and      #$0100
               beq      TestIfHFlip

               stz      ChTemp0

NextGrFlipV    lda      ChTemp0
               asl      a
               asl      a
               tax
               lda      EditValeur,x
               eor      #$FFFF
               clc
               adc      #1
               sta      EditValeur,x
               lda      EditValeur+2,x
               eor      #$FFFF
               adc      #0
               sta      EditValeur+2,x

               lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      NbrValeur
               bcc      NextGrFlipV

TestIfHFlip    lda      GraphType
               and      #$0200
               beq      SetFlipVExit

               jsr      InvOrdreVal

               bra      SetFlipVExit

SetFPChart     stz      GrStartAngle
               lda      #360
               sta      GrEndAngle

               lda      GraphType
               and      #$0100
               beq      TestIfPCFlipH

               lda      #180
               sta      GrStartAngle
               lda      #540
               sta      GrEndAngle
               lda      GraphType
               and      #$0200
               bne      SetFlipVExit
               jsr      InvOrdreVal
               bra      SetFlipVExit

TestIfPCFlipH  lda      GraphType
               and      #$0200
               beq      SetFlipVExit
               jsr      InvOrdreVal

SetFlipVExit   rts

*******************************************************************
*
*              Inverse l'ordre des valeurs dans EditValeur
*
*******************************************************************
InvOrdreVal    anop

               lda      NbrValeur
               lsr      a
               sta      ChTemp0
               lda      NbrValeur
               dec      a
               sta      ChTempX
               stz      ChTempY

NextInversVal  lda      ChTempX
               asl      a
               asl      a
               tax
               lda      ChTempY
               asl      a
               asl      a
               tay

               lda      EditValeur,y
               sta      ChTemp1
               lda      EditValeur+2,y
               sta      ChTemp2
               lda      EditValeur,x
               sta      EditValeur,y
               lda      EditValeur+2,x
               sta      EditValeur+2,y
               lda      ChTemp1
               sta      EditValeur,x
               lda      ChTemp2
               sta      Editvaleur+2,x

               tya
               lsr      a
               tay
               txa
               lsr      a
               tax

               lda      EditCouleur,y
               sta      ChTemp1
               lda      EditCouleur,x
               sta      EditCouleur,y
               lda      ChTemp1
               sta      EditCouleur,x

               ldy      ChTempy
               iny
               sty      ChTempy
               dec      ChTempX
               cpy      ChTemp0
               bcc      NextInversVal

               rts

*******************************************************************
*
*              Copie les nombres dans les editline et compute
*
*******************************************************************
SetInitEditL   anop

               lda      GrModifActif
               bne      SetInitEdSt
BraSIEExit     brl      SetInitExit

SetInitEdSt    lda      NbrValeur
               beq      BraSIEExit
               stz      ChTemp0

NextSetInitEL  lda      ChTemp0
               asl      a
               asl      a
               tax

               lda      EditValeur+2,x
               pha
               lda      EditValeur,x
               pha

               lda      #10
               sta      GrTheString

               PushLong #GrTheString+1
               PushWord #10             ; longueur de 10 char
               PushWord #$FFFF          ; nombre signe
               _Long2Dec

               PushLong DlgGraphPtr
               lda      ChTemp0
               clc
               adc      PremierEdit
               pha

               ldx      #10
               ldy      #0

TestCharSuiv2  lda      GrTheString+1,y
               and      #$00FF
               cmp      #$20
               bne      DebMotTrouve2
               iny
               dex
               bra      TestCharSuiv2

DebMotTrouve2  lda      GrTheString,y
               and      #$FF00
               sta      ChTemp1
               txa
               ora      ChTemp1
               sta      GrTheString,y
               sty      ChTemp1

               lda      #^GrTheString
               pha
               lda      #GrTheString
               clc
               adc      ChTemp1
               pha
               _SetIText

               lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      NbrValeur
               bcc      NextSetInitEL

               jsr      Computation

SetInitExit    rts

*********************************************************************
*
*              Regle de trois non signee
*
*********************************************************************
RegleDeTrois   anop

               lda      GrLong1+2
               bpl      StartRdT

               eor      #$FFFF
               sta      GrLong1+2
               lda      GrLong1
               eor      #$FFFF
               clc
               adc      #1
               sta      GrLong1
               lda      GrLong1+2
               adc      #0
               sta      GrLong1+2

StartRdT       PushLong #0
               PushLong #0
               PushLong GrLong1
               PushLong GrLongMul
               _LongMul

               pla
               sta      GrDblLong1
               pla
               sta      GrDblLong1+2
               pla
               sta      GrDblLong1+4
               pla
               sta      GrDblLong1+6


TestDbl6       lda      GrDblLong1+6
               beq      TestDbl4
               jsr      LsrDblLong
               bra      TestDbl6
TestDbl4       lda      GrDblLong1+4
               beq      Ok32Bits
               jsr      LsrDblLong
               bra      TestDbl4

Ok32Bits       PushLong #0
               PushLong #0
               PushLong GrDblLong1
               PushLong GrLong2
               _LongDivide
               pla
               sta      GrResLong
               pla
               sta      GrResLong+2
               pla
               pla

               rts

*****************************************************************
*
*              Calcule hauteur de l'axe des abscisses
*
*****************************************************************
SetMidLine     anop

               jsr      MkInsChartR

               lda      RectHauteur
               sec
               sbc      CstHautMax
               sta      GrHauteurMax
               sta      GrLongMul
               stz      GrLongMul+2

               lda      MaxPositif
               clc
               adc      MaxNegatif
               sta      GrMaximum
               sta      GrLong2
               lda      MaxPositif+2
               adc      MaxNegatif+2
               sta      GrMaximum+2
               sta      GrLong2+2

               lda      MaxNegatif
               sta      GrLong1
               lda      MaxNegatif+2
               sta      GrLong1+2

               jsr      RegleDeTrois

               lda      GrResLong
               beq      GrLda1Mid
               clc
               adc      CstHautMin
               bra      GrStaMid
GrLda1Mid      lda      CstHautMin      ; pour laisser 1 ligne d'ecart
GrStaMid       sta      GrMidLine

CalcGrDeltaX   PushWord #0
               PushWord #0
               lda      RectLargeur
               sec
               sbc      CstHautMax
               sta      GrLargeurMax
               pha
               lda      NbrValeur
               inc      a
               pha
               _UDivide
               pla
               sta      GrDeltaX
               pla

               lda      InsChartRect+4
               sec
               sbc      GrMidLine
               sta      GrMidLine       ; ordonnee ecran de l'axe des X

               PushWord InsChartRect+2
               PushWord GrMidLine       ; ordonnee ecran de l'axe des X
               _MoveTo
               PushWord #1
               PushWord #1
               _SetPenSize
               PushWord GrLineCol
               _SetSolidPenPat
               PushWord GrLargeurMax
               PushWord #0
               _Line

               lda      GraphType
               and      #$0200
               beq      SetVMLine

               lda      InsChartRect+6
               dec      a
               pha
               PushWord InsChartRect
               _MoveTo
               PushWord GrLineCol
               _SetSolidPenPat
               PushWord #1
               PushWord #1
               _SetPenSize
               PushWord #0
               PushWord GrHauteurMax
               _Line

               bra      SetMidLExit

SetVMLine      PushWord InsChartRect+2
               PushWord InsChartRect
               _MoveTo
               PushWord GrLineCol
               _SetSolidPenPat
               PushWord #1
               PushWord #1
               _SetPenSize

               PushWord #0
               PushWord GrHauteurMax
               _Line

SetMidLExit    rts

************************************************************
*
*              Cree rectangle interieur
*
*************************************************************
MkInsChartR    anop
               lda      ChartRect
               inc      a
               inc      a
               sta      InsChartRect
               lda      ChartRect+2
               inc      a
               inc      a
               sta      InsChartRect+2
               lda      ChartRect+4
               dec      a
               dec      a
               sta      InsChartRect+4
               lda      ChartRect+6
               dec      a
               dec      a
               sta      InsChartRect+6

               rts

****************************************
*
*       Filtre les 64 ou 48 bits
*
****************************************
LsrDblLong     anop
               lda      GrDblLong1+6
               lsr      a               ; nombres positifs
               sta      GrDblLong1+6
               lda      GrDblLong1+4
               ror      a
               sta      GrDblLong1+4
               lda      GrDblLong1+2
               ror      a
               sta      GrDblLong1+2
               lda      GrDblLong1
               ror      a
               sta      GrDblLong1

               lda      GrLong2+2
               lsr      a
               sta      GrLong2+2
               lda      GrLong2
               ror      a
               sta      GrLong2

               rts

Filtre48Bits   anop                     ; nombres positifs

               lda      GrLong2+4
               beq      Filtre48Exit

               lsr      a
               sta      GrLong2+4
               lda      GrLong2+2
               ror      a
               sta      GrLong2+2
               lda      GrLong2
               ror      a
               sta      GrLong2

               lda      GrLong1+2
               lsr      a               ; nombre positifs
               sta      GrLong1+2
               lda      GrLong1
               ror      a
               sta      GrLong1

               bra      Filtre48Bits

Filtre48Exit   rts

************************************************************
*
*              Dessine cadre et titre
*
************************************************************
DrawGrTitre    anop

               PushWord #0
               _SetPenMode

               PushWord #0              ; couleur 0 = noir
               _SetSolidPenPat

               PushLong #GrLiseRect
               _FrameRect

*              cadre

               PushWord #0              ; couleur 0 = noir
               _SetSolidPenPat

               PushLong #GrOmbreRect
               _PaintRect

               PushWord #1              ; couleur 1 = gris
               _SetSolidPenPat

               PushLong #GrTitRect
               _PaintRect

               PushWord #0              ; couleur 0 = noir
               _SetSolidPenPat

               PushLong #GrTitRect
               _FrameRect

               PushWord #4              ; mode transparent
               _SetTextMode

               PushWord #GrTitOmbreX
               PushWord #GrTitOmbreY
               _MoveTo

               PushWord #0             ; couleur 0 = noir
               _SetForeColor

               PushLong #ChartTitle
               _DrawString

               PushWord #GrTitleX
               PushWord #GrTitleY
               _MoveTo

               PushWord #9              ; couleur 9 = jaune
               _SetForeColor

               PushLong #ChartTitle
               _DrawString

               PushWord #0              ; couleur 0 = noir
               _SetForeColor

               rts

******************************************************************
*
*              Dessine un rectangle de couleur GrRectNum
*                       en face de l'edit line GrEditActif
*
******************************************************************
SetRondCouleur anop

               phx

               PushWord GrRectNum       ; No de la couleur
               _SetSolidPenPat          ; dessine l'interrieur

               lda      GrEditActif
               asl      a
               asl      a
               asl      a
               clc
               adc      #GrRondCouleur
               sta      ChTemp0

               lda      #^GrRondCouleur
               pha
               PushWord ChTemp0
               _PaintRect

               PushWord #0                     ; dessine le contour
               _SetSolidPenPat

               lda      #^GrRondCouleur
               pha
               PushWord ChTemp0
               _FrameRect

               lda      GrEditActif            ; enregistre l'info : couleur
               asl      a                      ; de l'edit line correspondant
               tax
               lda      GrRectNum
               sta      EditRCouleur,x

               plx
               rts

******************************************************************
*
*              Ecris en gris le pourcentage correspondant
*                       en face de l'edit line GrEditActif
*
******************************************************************
SetPercents    anop

               phx

               PushWord #15
               _SetSolidPenPat

               PushLong #StatPercRect
               _PaintRect

               lda      FoundNegatif
               beq      SetPerStart

               brl      Computsetex

SetPerStart    PushWord #1              ; gris = 1
               _SetForeColor

               stz      ChTemp0

SetPComputAble PushLong DlgGraphPtr     ; on recupere le texte
               lda      ChTemp0
               clc
               adc      PremierEdit
               pha
               PushLong #GrTheString
               _GetIText

               lda      GrTheString
               and      #$00FF
               bne      SetPComput2
               brl      NextCompuSetP

SetPComput2    PushLong #0              ; on convertit le string en long
               Pushlong #GrTheString+1  ; pointeur vers les lettres
               lda      GrTheString
               and      #$00FF
               pha                      ; longeur
               PushWord #$FFFF
               _Dec2Long
               pla
               sta      GrLong1
               pla
               sta      GrLong1+2
               lda      #100
               sta      GrLongMul
               stz      GrLongMul+2
               lda      SommeValeur
               sta      GrLong2
               lda      SommeValeur+2
               sta      GrLong2+2
               lda      SommeValeur+4
               sta      GrLong2+4

               jsr      Filtre48Bits

               jsr      RegleDeTrois

               lda      GrResLong
               pha
               cmp      #100
               bcc      SetPerc1
               lda      #3
               bra      SetPerc0
SetPerc1       cmp      #10
               bcc      SetPerc2
               lda      #2
               bra      SetPerc0
SetPerc2       lda      #1
SetPerc0       sta      GrTheString

               PushLong #GrTheString+1
               PushWord GrTheString
               PushWord #0              ; non signe
               _Int2Dec                 ; cree string pourcentage

               lda      GrTheString
               and      #$00FF
               asl      a
               asl      a
               asl      a
               sta      ChTemp1         ; largeur du string

               lda      GrTheString
               and      #$00FF
               inc      a
               tax
               lda      #'% '
               sta      GrTheString,x
               inc      GrTheString
               inc      GrTheString     ; ajoute deux lettres

               lda      ChTemp0
               asl      a
               asl      a
               tax
               lda      PremierStat,x
               sec
               sbc      ChTemp1
               pha
               lda      PremierStat+2,x
               pha
               _MoveTo

               PushLong #GrTheString
               _DrawString

NextCompuSetP  lda      ChTemp0
               inc      a
               sta      ChTemp0
               cmp      #FirstEdit
               bcs      ComputSetEx
               brl      SetPComputAble

ComputSetEx    plx
               rts

***************************************************************
*
*              Set et ReSet Check Item
*
***************************************************************
SetCheckItem   anop

               PushWord #1
               PushLong DlgGraphPtr
               lda      GraphType
               and      #$00FF
               clc
               adc      GrSelBar
               pha
               _SetDItemValue

               rts

ReSetCheckItem anop

               PushWord #0
               PushLong DlgGraphPtr
               lda      GraphType
               and      #$00FF
               clc
               adc      GrSelBar
               pha
               _SetDItemValue

               rts

*****************************************************************
*
*              procedure de definition de l'item chart
*
*****************************************************************

ChartProc      ENTRY

               phb                      ; sauve registres
               phd

               phk
               plb                      ; met Data Bank

               PushWord #0
               _SetSolidPenPat

               PushLong #ExChartRect
               _FrameRect

               pld                      ; remet a jour direct bank
               plb                      ; data bank

               lda      0,s
               sta      6,s
               lda      2,s
               sta      8,s

               tsc
               clc
               adc      #6
               tcs

               rtl

**************************************************************
*
*              Procedure de definition de l'item palette
*
**************************************************************
GrDrawThePal   ENTRY

               phb                      ; sauve registres
               phd

               phk
               plb                      ; met Data Bank

               ldx      #15             ; Blanc

               ldy      #^GrCol1Rect
               lda      #GrCol1Rect

DrawNextColR   phx

               phy
               pha

               phx
               _SetSolidPenPat

               pla
               ply
               phy
               pha

               phy
               pha
               _PaintRect

               PushWord #0
               _SetSolidPenPat

               pla
               ply
               phy
               pha

               phy
               pha
               _FrameRect

               pla
               ply

               plx
               dex

               clc
               adc      #8
               cmp      #GrEndColRect
               bcc      DrawNextColR

               pld                      ; remet a jour direct bank
               plb                      ; data bank

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

               Copy ChartData.s

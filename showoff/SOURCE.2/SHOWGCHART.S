;------------------------------------------------------------------
;
; FILE : SHOWGCHART.S                   - la gestion des camemberts -
;        ------------
;------------------------------------------------------------------
;...............................................................
;
;        Redraw_Graph : Reaffichage des GRAPH
;
;...............................................................
Redraw_Graph   START
               Using GlobalData

               lda Frame_Graph          |un Graph ?
               bne ok
               rts
;--
ok             lda #1                   |la 1er

LOOP           pha
               jsr Rest_Graph

               jsr Draw_Graph

               pla
               inc a
               cmp Frame_Graph
               bcc LOOP
               beq LOOP

               rts

               END
;...............................................................
;
;        Rest_Graph : Va Chercher le Graph Demander et put in Buffer
;
;...............................................................
Rest_Graph     START
               Using GlobalData

               pha
               jsr D_Hdl_Graph                 |Coince buffer
               pla

               PushLong #0                     |se positionne
               pha
               PushWord Lg_GraphRecord
               _Multiply
               pla
               plx
               dec a
               dec a
               tay

               ldx Lg_GraphRecord              |copie
               dex
               dex

LOOP           lda [Ptr_Graph],y
               sta GraphRecord,x
               dey
               dey
               dex
               dex
               bpl LOOP

               jsr U_Hdl_Graph                 |Libere

               rts

               END
;...............................................................
;
;        Test_In_Graph : Test si Selection d'une Graphe
;
;...............................................................
Test_In_Graph   START
               Using globalData

               lda Frame_Graph           |DES GraphS ?
               bne oui
               clc
               rts

oui            lda Frame_Graph          |LA Neme Graph

LOOP           pha                      |Met la Shape dans RECORD
;--
               jsr Rest_Graph
;--
               jsr Test_In_Graph1
               bcs Inside
;--
               pla
               dec a
               bne LOOP
               clc                      |not INSIDE Graph
               rts
;--
Inside         pla                      |Graph Selectionnee
               sec
               rts
;--------------------------------------
;        Test_In_Graph1
;--------------------------------------
Test_In_Graph1 ENTRY
               dec GraphRectY0
               dec GraphRectX0
               inc GraphRectY1
               inc GraphRectY1
               inc GraphRectX1
               inc GraphRectX1
;--
               PushWord #0              |Inside
               PushLong #EventWhere
               PushLong #GraphRect
               _PtInRect
               pla
               bne InSide1
               clc
               rts
Inside1        sec
               rts

               END
;...............................................................
;
;        Graph_Last : le Graph Select passe en dernier
;
;...............................................................
Graph_Last     START
               Using GlobalData
;--
               sta tempmove
               lda Frame_Graph
               cmp tempmove             |pas la derniere
               bne oui
               brl fini
;--
oui            lda tempmove
               jsr Rest_Graph            |sauve l'Graph

               lda tempmove
               dec a
               PushLong #0
               pha
               PushWord lg_GraphRecord
               _Multiply
               ply
               plx
               sty offsetmove

               lda tempmove             |calcul du move
               PushLong #0
               pha
               PushWord lg_GraphRecord
               _Multiply
               pla
               plx
               sta source_adr

               lda Frame_Graph
               sec
               sbc tempmove
               PushLong #0
               pha
               PushWord lg_GraphRecord
               _Multiply
               pla
               plx
               sta nbre_byte

               jsr D_Hdl_Graph          |Deref

loop           ldy source_adr           |move de droite a gauche
               ldx offsetmove
rloop          lda [Ptr_Graph],y
               phy
               txy
               sta [Ptr_Graph],y
               ply
               inx
               inx
               iny
               iny
               dec nbre_byte
               dec nbre_byte
               bne rloop

               jsr U_Hdl_Graph          |Unlock

               lda Frame_Graph
               jsr Copie_Graph

fini           lda Frame_Graph          |la select = la derniere
               sta Graph_Select

               rts

tempmove       ds 2
offsetmove     ds 2
source_adr     ds 2
nbre_byte      ds 2

               END
;...............................................................
;
;        Copie_Graph  : Copie Graph_Record -> Buffer Graph
;                      ACC=N% de Graph
;...............................................................
Copie_Graph    START
               Using GlobalData

               pha
               jsr D_Hdl_Graph          |Deref
               pla

               PushLong #0
               Pha                      |n% de graph
               PushWord lg_GraphRecord  |taille d'1 graph
               _Multiply
               pla
               plx
               dec a
               dec a
               tay

               ldx lg_GraphRecord
               dex
               dex

LOOP           lda GraphRecord,x
               sta [Ptr_Graph],y
               dey
               dey
               dex
               dex
               bpl LOOP
;--
               jsr U_Hdl_Graph          |UnLock

               rts

               END
;...............................................................
;
;        Draw_RectGraph : affiche la selection Graph eor
;
;...............................................................
Draw_RectGraph START
               Using GlobalData

               ldy #6
LOOP           lda GraphRect,y
               sta Shape_Rect,y
               dey
               dey
               bpl LOOP

               jsr Eor_PoigneesR

               rts

               END
;...............................................................
;
;        Maj_SizeGraph : Sizing of Graph
;
;...............................................................
Maj_SizeGraph  START
               Using GlobalData
;--
               lda GraphRectY0
               clc
               adc #40
               sta GraphRectY1

               lda GraphRectX0
               clc
               adc #60
               sta GraphRectX1
;--
MinY           lda Shape_RectY1
               sec
               sbc Shape_RectY0
               cmp #40
               bcc MinX

               lda Shape_RectY0
               sta GraphRectY0
               lda Shape_RectY1
               sta GraphRectY1
;--
MinX           lda Shape_RectX1
               sec
               sbc Shape_RectX0
               cmp #60
               bcc Fin

               lda Shape_RectX0
               sta GraphRectX0
               lda Shape_RectX1
               sta GraphRectX1
;--
Fin            lda Graph_Select         |ReCopie la mise a jour
               jsr Copie_Graph

               rts

               END
;...............................................................
;
;        Create_Graph : Creation d'un Graph
;
;...............................................................
Create_Graph   START
               Using GlobalData
;--
               Inc Frame_Graph          |+1 Graph
               jsr Resize_Graph         |retaille Buffer
;--
               bcc OKCG                 |plus de place +++
               jsr Alert_CCP
               dec Frame_Graph
               bra FINCG
;--
OKCG           lda Frame_Graph          |le copie
               sta Graph_select
               jsr Copie_Graph

               lda Graph_Select         |le selectionne
               ora  #$0400
               jsr Put_In_List

               jsr Copy_RectG

FinCG          jsr Del_Undo

               rts

               END
;...............................................................
;
;        DoGraph : Passage dans graph editor
;
;...............................................................
DoGraph        START
               Using GlobalData
               Using GraphData
;--------------------------------------
;        BAR GRAPH
;--------------------------------------
DoBar          ENTRY
               jsr GraphSelect
               bcc NoBar
;--
ABar           lda List_Select
               and #$00FF
               jsr Rest_Graph
               lda GraphFlipType
               and #$FF00
               ora #$0000
               sta GraphFlipType
;--
               lda #1
               sta Fonct_Graph
               jsr Call_Graph
               bcc FDoBar
;--
               lda List_Select
               and #$00FF
               jsr Copie_Graph
               bra FDoBar
;--
NoBar          jsr Place_For_Graph
               bcs FDoBar
;--
               lda #2
               sta Fonct_graph
               jsr Call_Graph
               bcc FDoBar
;--
               jsr Create_Graph         |+1
;--
FDoBar         jsr Menu_On_Off
               rts
;--------------------------------------
;        SALE GRAPH
;--------------------------------------
DoSale         ENTRY
;--
               jsr GraphSelect
               bcc NoSale
;--
ASale          lda List_Select
               and #$00FF
               jsr Rest_Graph
               lda GraphFlipType
               and #$FF00
               ora #$0001
               sta GraphFlipType
;--
               lda #1
               sta Fonct_Graph
               jsr Call_Graph
               bcc FDoBar
;--
               lda List_Select
               and #$00FF
               jsr Copie_Graph
               bra FDoSale
;--
NoSale         jsr Place_For_Graph
               bcs FDoSale
;--
               lda #3
               sta Fonct_Graph
               jsr Call_Graph
               bcc FDoSale
;--
               jsr Create_Graph         |+1
;--
FDoSale        jsr Menu_On_Off
               rts
;--------------------------------------
;        Pie GRAPH
;--------------------------------------
DoPie          ENTRY
               jsr GraphSelect
               bcc NoPie
;--
APie           lda List_Select
               and #$00FF
               jsr Rest_Graph
               lda GraphFlipType
               and #$FF00
               ora #$0002
               sta GraphFlipType
;--
               lda #1
               sta Fonct_Graph
               jsr Call_Graph
               bcc FDoBar
;--
               lda List_Select
               and #$00FF
               jsr Copie_Graph
               bra FDoPie
;--
NoPie          jsr Place_For_Graph
               bcs FDoPie
;--
               lda #4
               sta Fonct_Graph
               jsr Call_Graph
               bcc FDoPie
;--
               jsr Create_Graph         |+1
;--
FDoPie         jsr Menu_On_Off
               rts
;--------------------------------------
;        une selection de Graph ?
;--------------------------------------
GraphSelect    ANOP

               lda Nb_List_Select
               cmp #1
               bne koGraph
               lda List_Select
               xba
               and #$00FF
               cmp #4
               beq okGraph
;--
KoGraph        clc                      |non
               rts
;--
OkGraph        sec                      |oui attention
               rts
;--------------------------------------
;        Place_for_Graph
;--------------------------------------
Place_for_Graph ANOP

               inc Frame_Graph
               jsr Resize_Graph
               bcc okPFG
               jsr Alert_CCP
KoPFG          dec Frame_Graph
               sec
               rts
OkPFG          dec Frame_Graph
               clc
               rts

               END
;...............................................................
;
;        Resize_Graph: Ajuste La Taille Du Buffer des GRAPHS
;
;...............................................................
Resize_Graph   START
               Using GlobalData

               jsr U_Hdl_Graph          |Unlock Handle
;--
               lda Frame_Graph          |des Graphs
               bpl oui

               stz Frame_Graph          |alors zero

oui            PushLong #0
               PushWord Frame_Graph     |nb de Graph
               PushWord Lg_GraphRecord  |taille d'1 Icone
               _Multiply
               pla
               plx
               cmp #0
               bne Size

               lda #1                   |au moins 1 octet
;--
Size           Pea $0000
               pha
               PushLong Hdl_Graph
               _SetHandleSize
;--
               rts

               END
;...............................................................
;
;        Draw_Graph : Dessine le Graph
;
;...............................................................
Draw_Graph     START
               Using GlobalData

               lda #0
               sta Fonct_Graph
               jsr Call_Graph

               rts

               END
;...............................................................
;
;        Call_Graph : appel du relogeable
;
;...............................................................
Call_Graph     START
               Using GlobalData
;--
               lda #8
               sta SegNumber
               jsr Disk_Present
;--
               jsl DoCallGH
               php
;--
               PushWord MyId
               pea 1
               pea 8
               _UnloadSegNum
;--
;              pha
;              pha
;              PushLong Ptr_PZero
;              _FindHandle
;              _PurgeHandle
;--
               plp
               rts

               END

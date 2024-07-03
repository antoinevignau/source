;------------------------------------------------------------------
;
; FILE : SHOWTRANSIT.S                  - DoTransit -
;        -------------
;                                       RELOGEABLE
;------------------------------------------------------------------
               List Off
               Gen Off
               Symbol Off
               Keep DoTransit
               65816 On

               MCopy Showoff.mac

               longa on
               longi on
;...............................................................
;
;        DoTransitR : CHOIX DES BRANCHEMENTS
;
;...............................................................
DoTransitR     START
               Using GlobalData

               brl DoTransit

               END
;...............................................................
;
;        DoTransit : code
;
;...............................................................
DoTransit      START
               Using GlobalData
               Using WindowData

               phb
               phk
               plb
;--
               PushLong #0
               _GetPort
;+
               jsr Copy_FtoT            |travaille dans sauvegarde
;+
               jsr Init_ValTK           |zone editable
;--
               PushLong #0              |une dialog box
               PushLong #TransitDialog
               _GetNewModalDialog
               pla                      |son pointeur
               sta >MDialogPtr
               pla
               sta >MDialogPtr+2
;--
               PushLong >MDialogPtr
               _SetPort
;--
;+
               PushWord >Sequ_NbFrame
               PushLong #Tx_Frame+9
               PushWord #2
               PushWord #0
               _Int2Dec
;+
               lda >Sequ_NbFrame
               inc a
               pha
               PushLong #Tx_Framet+1
               PushWord #2
               PushWord #0
               _Int2Dec
;+
               PushWord #70
               PushWord #13
               _MoveTo
               PushLong #Tx_Transition
               _DrawString
;+
               PushWord #10
               PushWord #28
               _MoveTo
               PushLong #Tx_Frame
               _DrawString
;+
               PushWord #30
               PushWord #43
               _MoveTo
               PushLong #Tx_To
               _DrawString

               PushWord #30
               PushWord #57
               _MoveTo
               PushLong #Tx_framet
               _DrawString
;+
               PushWord #70
               PushWord #43
               _MoveTo
               PushLong #Tx_Key
               _DrawString

               PushWord #70
               PushWord #57
               _MoveTo
               PushLong #Tx_ANY
               _DrawString
;+
               PushWord #140
               PushWord #43
               _MoveTo
               PushLong #Tx_Effect
               _DrawString
;+
               jsr Etat_Any             |positionne actif ON ou OFF
;--
               jsr Init_Icon_TS         |Icone de transit

               lda #13                  |le treizieme
               sta ItemIt

               stz Fin_Transit
;--
again          PushWord #0              | on click
;--
               lda #^Filtre_Transit
               ora #$8000               |with standard filter proc
               pha
               lda #Filtre_Transit
               pha
;--
               _ModalDialog
               pla
               beq again
;--
               asl a
               tax
               jsr (table_transit,x)
;--
               lda Fin_Transit
               beq again
               bra Finish
;--------------------------------------
;        Table indirection
;--------------------------------------
Table_Transit  ANOP
               dc i'transit_Ignore'     |0
               dc i'transit_Ok'         |1
               dc i'transit_Cancel'     |2
               dc i'G_1'                |3
               dc i'D_1'                |4

               dc i'G_1'                |5
               dc i'D_1'                |6
               dc i'G_1'                |7
               dc i'D_1'                |8

               dc i'G_1'                |9
               dc i'D_1'                |10
               dc i'G_1'                |11
               dc i'D_1'                |12

               dc i'ET_2'               |13
               dc i'ET_2'               |14
               dc i'ET_2'               |15
               dc i'ET_2'               |16

               dc i'ET_2'               |17
               dc i'ET_2'               |18
               dc i'ET_2'               |19
               dc i'ET_2'               |20
;--
Finish         PushLong >MDialogPtr     |on ferme
               _CloseDialog
;--
               _SetPort
;--
               lda #DoTransit
               sta <Ptr_PZero
               lda #^DoTransit
               sta <Ptr_PZero+2
               plb

               rtl
;--------------------------------------
;        Etat_Any
;--------------------------------------
Etat_Any       ANOP

               lda Any_On_Off
               beq Any_Actif
;--
Any_Inactif    ANOP

               PushLong #PatGrise
               _SetPenPat

               PushWord #1
               _SetPenMode

               PushLong #RectAny
               _PaintRect

               _PenNormal
;-
               PushWord #255
               PushWord #255
;-
               PushLong #0
               PushLong >MDialogPtr
               PushWord TransitD3
               _GetControlDItem
               _HiliteControl
;-
               PushLong #0
               PushLong >MDialogPtr
               PushWord TransitD4
               _GetControlDItem
               _HiliteControl

               rts
;--
Any_Actif      ANOP
;--
               PushWord #30
               PushWord #57
               _MoveTo
               PushLong #Tx_framet
               _DrawString
;-
               PushWord #70
               PushWord #57
               _MoveTo
               PushLong #Tx_ANY
               _DrawString
;-
               PushWord #0
               PushWord #0
;-
               PushLong #0
               PushLong >MDialogPtr
               PushWord TransitD3
               _GetControlDItem
               _HiliteControl
;-
               PushLong #0
               PushLong >MDialogPtr
               PushWord TransitD4
               _GetControlDItem
               _HiliteControl

               rts
;--------------------------------------
;        Transit_Ignore
;--------------------------------------
Transit_Ignore ANOP
               rts
;--------------------------------------
;        Transit_Ok
;--------------------------------------
Transit_Ok     ANOP
               jsr Cal_TK
               jsr Copy_TtoF
               lda #1
               sta >Top_Action
Transit_Cancel ANOP
               lda #1
               sta Fin_Transit
               rts
;--------------------------------------
;        ET_2 Edit Line to et key
;--------------------------------------
ET_2           ANOP
               lsr a
               sta ItemIt
               rts
;--------------------------------------
;        G_1
;--------------------------------------
G_1            ANOP
               lsr a
               sec
               sbc #3
               asl a                    |a= 0 2 4 6 8 10 12 14 16 18
               tax

               lda TableTSGD,X
               tay

               lda RecordTransit,y
               dec a
               bmi FG_1
               sta RecordTransit,y
               tay

               txa
               lsr a
               lsr a
               tax

               tya

               jsr Draw_Effect
FG_1           rts
;--------------------------------------
;        D_1
;--------------------------------------
D_1            ANOP
               lsr a
               sec
               sbc #3
               asl a                    |a= 0 2 4 6 8 10 12 14 16 18
               tax

               lda TableTSGD,X
               tay

               lda RecordTransit,y
               inc a
               cmp #Nb_Max_Effect
               bcs FD_1
               sta RecordTransit,y
               tay

               txa
               lsr a
               lsr a
               tax
               tya

               jsr Draw_Effect
FD_1           rts
;--------------------------------------
;        Swap_Transit
;--------------------------------------
Copy_FtoT      ANOP
               ldx #28
RCFT           lda >Frame_Transit,x
               sta RecordTransit,x
               dex
               dex
               bpl RCFT
               rts
;--
Copy_TtoF      ANOP
               ldx #28
RCTF           lda RecordTransit,x
               sta >Frame_Transit,x
               dex
               dex
               bpl RCTF
               rts
;--------------------------------------
;        Init_Icon_TS
;--------------------------------------
Init_Icon_TS   ANOP

               ldx #0                   |num ligne
               ldy #0

RIITS          lda RecordTransit+4,y

               jsr Draw_Effect
               tya
               clc
               adc #6
               tay
               inx
               cpx #Nb_Lig_Transit
               bcc RIITS
               rts
;--
Draw_Effect    ANOP

               phy
               phx
               pha

               asl a
               asl a
               tay
               lda Table_Icone+2,y
               pha
               lda Table_Icone,y
               pha
               PushWord #0
               PushWord #156

               txa
               asl a
               tax
               lda YIcon_TS,x
               Pha
               _DrawIcon
               
               pla
               plx
               ply

               rts
;--------------------------------------
;        Init_ValTK
;--------------------------------------
Init_ValTK     ANOP
;--
               stz Any_On_Off           |any actif
;--
ivT2           lda #0
               sta Val_T2
               lda #$2020
               sta Val_T2+1

               lda RecordTransit+6
               beq ivT3

               ldx #2
               stx Val_T2

               Pha
               PushLong #Val_T2+1
               PushWord #2
               PushWord #0
               _Int2Dec
;
               lda #1                   |any INACTIF
               sta Any_On_Off
;--
ivT3           lda #0
               sta Val_T3
               lda #$2020
               sta Val_T3+1

               lda RecordTransit+12
               beq ivT4

               ldx #2
               stx Val_T3

               Pha
               PushLong #Val_T3+1
               PushWord #2
               PushWord #0
               _Int2Dec
;
               lda #1                   |any INACTIF
               sta Any_On_Off
;--
ivT4           lda #0
               sta Val_T4
               lda #$2020
               sta Val_T4+1

               lda RecordTransit+18
               beq ivT5

               ldx #2
               stx Val_T4

               Pha
               PushLong #Val_T4+1
               PushWord #2
               PushWord #0
               _Int2Dec
;
               lda #1                   |any INACTIF
               sta Any_On_Off
;--
ivT5           lda #0
               sta Val_T5
               lda #$2020
               sta Val_T5+1

               lda RecordTransit+24
               beq ivK2

               ldx #2
               stx Val_T5

               Pha
               PushLong #Val_T5+1
               PushWord #2
               PushWord #0
               _Int2Dec
;
               lda #1                   |any INACTIF
               sta Any_On_Off
;--
ivK2           lda #0
               sta Val_K2
               lda #$2020
               sta Val_K2+1

               lda RecordTransit+8
               beq ivK3
               ldx #1
               stx Val_K2
               xba
               sta Val_K2+1
;--
ivK3           lda #0
               sta Val_K3
               lda #$2020
               sta Val_K3+1

               lda RecordTransit+14
               beq ivK4
               ldx #1
               stx Val_K3
               xba
               sta Val_K3+1
;--
ivK4           lda #0
               sta Val_K4
               lda #$2020
               sta Val_K4+1

               lda RecordTransit+20
               beq ivK5
               ldx #1
               stx Val_K4
               xba
               sta Val_K4+1
;--
ivK5           lda #0
               sta Val_K5
               lda #$2020
               sta Val_K5+1

               lda RecordTransit+26
               beq FIVK
               ldx #1
               stx Val_K5
               xba
               sta Val_K5+1

FIVK           rts
;--------------------------------------
;        Cal_Tk
;--------------------------------------
Cal_TK         ANOP
;--------------------------------------
               PushLong >MDialogPtr
               PushWord #13
               PushLong #V_T2
               _GetIText
;-
               PushLong >MDialogPtr
               PushWord #14
               PushLong #V_K2
               _GetIText
;-
               PushLong >MDialogPtr
               PushWord #15
               PushLong #V_T3
               _GetIText
;-
               PushLong >MDialogPtr
               PushWord #16
               PushLong #V_K3
               _GetIText
;-
               PushLong >MDialogPtr
               PushWord #17
               PushLong #V_T4
               _GetIText
;-
               PushLong >MDialogPtr
               PushWord #18
               PushLong #V_K4
               _GetIText
;-
               PushLong >MDialogPtr
               PushWord #19
               PushLong #V_T5
               _GetIText
;-
               PushLong >MDialogPtr
               PushWord #20
               PushLong #V_K5
               _GetIText
;--------------------------------------
CT2            stz RecordTransit+6
               lda V_T2
               and #$00FF
               beq CT3

               PushWord #0
               PushLong #V_t2+1
               lda V_t2
               and #$00FF
               pha
               PushWord #0
               _Dec2Int
               pla
               sta RecordTransit+6
;--
CT3            stz RecordTransit+12
               lda V_T3
               and #$00FF
               beq CT4

               PushWord #0
               PushLong #V_t3+1
               lda V_t3
               and #$00FF
               pha
               PushWord #0
               _Dec2Int
               pla
               sta RecordTransit+12
;--
CT4            stz RecordTransit+18
               lda V_T4
               and #$00FF
               beq CT5

               PushWord #0
               PushLong #V_t4+1
               lda V_t4
               and #$00FF
               pha
               PushWord #0
               _Dec2Int
               pla
               sta RecordTransit+18
;--
CT5            stz RecordTransit+24
               lda V_T5
               and #$00FF
               beq CK2

               PushWord #0
               PushLong #V_t5+1
               lda V_t5
               and #$00FF
               pha
               PushWord #0
               _Dec2Int
               pla
               sta RecordTransit+24
;--
CK2            stz RecordTransit+8
               lda V_K2
               and #$00FF
               beq CK3

               lda V_K2
               and #$FF00
               sta RecordTransit+8
;--
CK3            stz RecordTransit+14
               lda V_K3
               and #$00FF
               beq CK4

               lda V_K3
               and #$FF00
               sta RecordTransit+14
;--
CK4            stz RecordTransit+20
               lda V_K4
               and #$00FF
               beq CK5

               lda V_K4
               and #$FF00
               sta RecordTransit+20
;--
CK5            stz RecordTransit+26
               lda V_K5
               and #$00FF
               beq FCT

               lda V_K5
               and #$FF00
               sta RecordTransit+26
;--
FCT            rts
;--------------------------------------
;        Filtre_Transit
;--------------------------------------
Filtre_Transit ENTRY
               phb
               phd

               phk
               plb

               lda >MyZp
               tcd
;--------------------------------------
               jsr Ctrl_Touche          |ctrl touche

               jsr SbrFiltreT           |touche filter
;--------------------------------------
               pld
               plb

               lda Accepter             |Accepter             |toujours vrai
               sta 16,s

               lda 0,s
               sta 12,s
               lda 2,s
               sta 14,s

               tsc
               clc
               adc #12
               tcs

               rtl
;--------------------------------------
;        SbrFiltreT
;--------------------------------------
SbrFiltreT     ANOP
;--
               PushLong >MDialogPtr
               PushWord #13
               PushLong #V_T2
               _GetIText
               bcs Filtre_fin
               PushLong >MDialogPtr
               PushWord #15
               PushLong #V_T3
               _GetIText
               bcs Filtre_fin
               PushLong >MDialogPtr
               PushWord #17
               PushLong #V_T4
               _GetIText
               bcs Filtre_fin
               PushLong >MDialogPtr
               PushWord #19
               PushLong #V_T5
               _GetIText
               bcs Filtre_Fin
;--
               lda V_T2
               and #$00FF
               bne Filtre_Off
               lda V_T3
               and #$00FF
               bne Filtre_Off
               lda V_T4
               and #$00FF
               bne Filtre_Off
               lda V_T5
               and #$00FF
               bne Filtre_Off
;--
Filtre_On      lda Any_On_Off
               beq Filtre_Fin

               stz Any_On_Off
               jsr Etat_Any
Filtre_Fin     rts
;--
Filtre_Off     lda Any_On_Off
               bne Filtre_Fin

               lda #1
               sta Any_On_Off
               jsr Etat_Any
               rts
;--------------------------------------
;        Ctrl_Touche
;--------------------------------------
Ctrl_Touche    ANOP
;--
               stz Accepter
;--
               lda ItemIt
               cmp #13
               bcc Fctrl_touche
               cmp #21
               bcc Sctrl_touche
Fctrl_touche   rts
;--
Sctrl_touche   ANOP
               lda 15,s
               sta <ptr_pzero+2
               lda 13,s
               sta <ptr_pzero

               lda [<ptr_pzero]          |event what
               cmp #3
               beq kD
               cmp #5
               beq kD
               rts
;--
kD             ANOP
               ldy #2
               lda [<Ptr_Pzero],y
               cmp #$09                 |tab
               bne SKD
;--
               lda ItemIt               |si tab -1 sur itemit de 13 a 20
               cmp #13
               bne FKD
               lda #21
               sta ItemIt
FKD            dec ItemIt
               rts
;--
SKD            lda ItemIt
               and #$0001
               beq TestMajus
;--
OnlyNumber     ldx #44
;+
               ldy #14
               lda [<ptr_pzero],y
               and #$0100
               ldy #2
               ora [<ptr_pzero],y
;+
RON            cmp TabOkTransit,x
               beq bon
               dex
               dex
               bpl RON
               bra Faux
bon            rts
;--
TestMajus      ldy #2
               lda [<ptr_pzero],y
               cmp #$61                 |compris entre a et z
               bcc FUC
               cmp #$7B
               bcs FUC
               and #$DF
               sta [<ptr_pzero],y
FUC            rts
;--
Faux           lda #1
               sta Accepter
               rts
;--------------------------------------
;        DATA POUR DIALOG BOX
;--------------------------------------
TabOkTransit   dc i'$30,$31,$32,$33,$34,$35,$36,$37,$38,$39'
               dc i'$7F,$8,$15,$D,$158,$178,$143,$156,$163,$176'
               dc i'$9,$18'
;--
Any_On_Off     dc i'0'
Accepter       dc i'0'
ItemIt         ds 2
RectAny        dc i'45,18,59,107'
Nb_Lig_Transit equ 5
Nb_Max_Effect  equ 11
YIcon_TS       dc i'47,63,79,95,111'
Fin_Transit    dc i'0'
TableTSGD      dc i'4,4,10,10,16,16,22,22,28,28'
;--------------------------------------
;        TransitDIALOG
;--------------------------------------
TransitDialog  ANOP
               dc i'25,50,180,270'
               dc i2'1'
               dc i4'0'
               dc i4'TransitD1'
               dc i4'TransitD2'
               dc i4'TransitD3'
               dc i4'TransitD4'
               dc i4'TransitD5'
               dc i4'TransitD6'
               dc i4'TransitD7'
               dc i4'TransitD8'
               dc i4'TransitD9'
               dc i4'TransitD10'
               dc i4'TransitD11'
               dc i4'TransitD12'
               dc i4'TransitD13'
               dc i4'TransitD14'
               dc i4'TransitD15'
               dc i4'TransitD16'
               dc i4'TransitD17'
               dc i4'TransitD18'
               dc i4'TransitD19'
               dc i4'TransitD20'
               dc i4'0'
;--
TransitD1      anop                     |ok
               dc i'1'
               dc i'135,32,149,87'
               dc i'ButtonItem'
               dc i4'str_ok'
               dc i'0'
               dc i'1'
               dc i4'0'
;--
TransitD2      anop                     |Cancel
               dc i'2'
               dc i'135,142,149,197'
               dc i'ButtonItem'
               dc i4'Str_Cancel'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD3      ANOP                     |Gauche <
               dc i'3'
               dc i'46,140,60,152'
               dc i'ButtonItem'
               dc i4'TFG'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD4      anop                     |Droite >
               dc i'4'
               dc i'46,176,60,188'
               dc i'ButtonItem'
               dc i4'TFD'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD5      anop                     |edit to 2
               dc i'13'
               dc i'62,24,76,52'
               dc i'EditLine'
               dc i4'Val_T2'
               dc i'2'
               dc i'0'
               dc i4'0'
;--
TransitD6      anop                     |edit key 2
               dc i'14'
               dc i'62,72,76,92'
               dc i'EditLine'
               dc i4'Val_K2'
               dc i'1'
               dc i'0'
               dc i4'0'
;--
TransitD7      anop                     |gauche 2
               dc i'5'
               dc i'62,140,76,152'
               dc i'ButtonItem'
               dc i4'TFG'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD8      anop                     |droite 2
               dc i'6'
               dc i'62,176,76,188'
               dc i'ButtonItem'
               dc i4'TFD'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD9      anop                     |edit to 2
               dc i'15'
               dc i'78,24,92,52'
               dc i'EditLine'
               dc i4'Val_T3'
               dc i'2'
               dc i'0'
               dc i4'0'
;--
TransitD10     anop                     |edit key 2
               dc i'16'
               dc i'78,72,92,92'
               dc i'EditLine'
               dc i4'Val_K3'
               dc i'1'
               dc i'0'
               dc i4'0'
;--
TransitD11     anop                     |gauche 2
               dc i'7'
               dc i'78,140,92,152'
               dc i'ButtonItem'
               dc i4'TFG'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD12     anop                     |droite 2
               dc i'8'
               dc i'78,176,92,188'
               dc i'ButtonItem'
               dc i4'TFD'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD13     anop                     |edit to 2
               dc i'17'
               dc i'94,24,108,52'
               dc i'EditLine'
               dc i4'Val_T4'
               dc i'2'
               dc i'0'
               dc i4'0'
;--
TransitD14     anop                     |edit key 2
               dc i'18'
               dc i'94,72,108,92'
               dc i'EditLine'
               dc i4'Val_K4'
               dc i'1'
               dc i'0'
               dc i4'0'
;--
TransitD15     anop                     |gauche 2
               dc i'9'
               dc i'94,140,108,152'
               dc i'ButtonItem'
               dc i4'TFG'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD16     anop                     |droite 2
               dc i'10'
               dc i'94,176,108,188'
               dc i'ButtonItem'
               dc i4'TFD'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD17     anop                     |edit to 2
               dc i'19'
               dc i'110,24,124,52'
               dc i'EditLine'
               dc i4'Val_T5'
               dc i'2'
               dc i'0'
               dc i4'0'
;--
TransitD18     anop                     |edit key 2
               dc i'20'
               dc i'110,72,124,92'
               dc i'EditLine'
               dc i4'Val_K5'
               dc i'1'
               dc i'0'
               dc i4'0'
;--
TransitD19     anop                     |gauche 2
               dc i'11'
               dc i'110,140,124,152'
               dc i'ButtonItem'
               dc i4'TFG'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
TransitD20     anop                     |droite 2
               dc i'12'
               dc i'110,176,124,188'
               dc i'ButtonItem'
               dc i4'TFD'
               dc i'0'
               dc i'0'
               dc i4'0'
;--------------------------------------
TX_Transition  str 'Transition'
TX_Frame       str 'Frame : 00'
TX_To          str 'To'
TX_Key         str 'Key'
TX_Effect      str 'Effect'
Tx_ANY         str 'Any'

Tx_framet      str '00'

TFG            str '<'
TFD            str '>'

RecordTransit  ds 30

Val_T2         str '  '
Val_K2         dc i1'1',c'  '
Val_T3         str '  '
Val_K3         dc i1'1',c'  '
Val_T4         str '  '
Val_K4         dc i1'1',c'  '
Val_T5         str '  '
Val_K5         dc i1'1',c'  '
;--
V_T2           ds 3
V_T3           ds 3
V_T4           ds 3
V_T5           ds 3

V_K2           ds 3
V_K3           ds 3
V_K4           ds 3
V_K5           ds 3
;--------------------------------------
;        Table Icone
;--------------------------------------
Table_Icone    ANOP
               dc i4'Icon_Effect0'      |Lat G
               dc i4'Icon_Effect1'      |Ver H
               dc i4'Icon_Effect2'      |Shrink
               dc i4'Icon_Effect3'      |Lat D
               dc i4'Icon_Effect4'      |Ver B
               dc i4'Icon_Effect5'      |Dia BD
               dc i4'Icon_Effect6'      |Dia HG
               dc i4'Icon_Effect7'      |Dia BG
               dc i4'Icon_Effect8'      |Dia HD
               dc i4'Icon_Effect9'      |Fondu Noir
               dc i4'Icon_EffectA'      |Fondu Blanc
;--------------------------------------
;        ICONES EFFECTS
;--------------------------------------
Icon_Effect0   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'0000000FFFFFF0'
               dc h'0000000FFFFFF0'
               dc h'0000000F0FFFF0'
               dc h'0000000FF0FFF0'
               dc h'00000000000FF0'
               dc h'00000000000FF0'
               dc h'0000000FF0FFF0'
               dc h'0000000F0FFFF0'
               dc h'0000000FFFFFF0'
               dc h'0000000FFFFFF0'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect1   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'0FFFFF00FFFFF0'
               dc h'0FFFFF00FFFFF0'
               dc h'0FFF0F00F0FFF0'
               dc h'0FFFF0000FFFF0'
               dc h'0FFFFF00FFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect2   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'0000F00000F000'
               dc h'00F00F00F00F00'
               dc h'00000000000000'
               dc h'0F00F00F00F000'
               dc h'00F00000000000'
               dc h'000F0000F00F00'
               dc h'00F000F000F000'
               dc h'00000000000000'
               dc h'000F00F00F0000'
               dc h'00000000F000F0'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect3   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'0FFFFFF0000000'
               dc h'0FFFFFF0000000'
               dc h'0FFFF0F0000000'
               dc h'0FFF0FF0000000'
               dc h'0FF00000000000'
               dc h'0FF00000000000'
               dc h'0FFF0FF0000000'
               dc h'0FFFF0F0000000'
               dc h'0FFFFFF0000000'
               dc h'0FFFFFF0000000'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect4   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFF00FFFFF0'
               dc h'0FFFF0000FFFF0'
               dc h'0FFF0F00F0FFF0'
               dc h'0FFFFF00FFFFF0'
               dc h'0FFFFF00FFFFF0'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect5   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'0FFFFFFFFFF000'
               dc h'0FFFFFFFFF0000'
               dc h'0FF0000FF00000'
               dc h'0FF000FF000000'
               dc h'0FF00000000000'
               dc h'0FF0F000000000'
               dc h'0FFFF000000000'
               dc h'0FFF0000000000'
               dc h'0FF00000000000'
               dc h'0F000000000000'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect6   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'000000000000F0'
               dc h'00000000000FF0'
               dc h'0000000000FFF0'
               dc h'000000000FFFF0'
               dc h'000000000F0FF0'
               dc h'00000000000FF0'
               dc h'000000FF000FF0'
               dc h'00000FF0000FF0'
               dc h'0000FFFFFFFFF0'
               dc h'000FFFFFFFFFF0'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect7   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'000FFFFFFFFFF0'
               dc h'0000FFFFFFFFF0'
               dc h'00000FF0000FF0'
               dc h'000000FF000FF0'
               dc h'00000000000FF0'
               dc h'000000000F0FF0'
               dc h'000000000FFFF0'
               dc h'0000000000FFF0'
               dc h'00000000000FF0'
               dc h'000000000000F0'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect8   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'0F000000000000'
               dc h'0FF00000000000'
               dc h'0FFF0000000000'
               dc h'0FFFF000000000'
               dc h'0FF0F000000000'
               dc h'0FF00000000000'
               dc h'0FF000FF000000'
               dc h'0FF0000FF00000'
               dc h'0FFFFFFFFF0000'
               dc h'0FFFFFFFFFF000'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_Effect9   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc h'00000000000000'
               dc 84i1'$FF'
;--
Icon_EffectA   ANOP
               dc i'$0000'              |IconType
               dc i'84'                 |IconSize
               dc i'12'                 |IconHeight
               dc i'14'                 |IconWidth

               dc h'00000000000000'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'0FFFFFFFFFFFF0'
               dc h'00000000000000'
               dc 84i1'$FF'

               END

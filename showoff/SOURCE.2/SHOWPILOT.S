;------------------------------------------------------------------
;
; FILE : SHOWPILOT.S                    - DoSetUp -
;        -----------
;                                       RELOGEABLE
;------------------------------------------------------------------
               List Off
               Gen Off
               Symbol Off
               Keep DoSetUp
               65816 On

               MCopy Showpilot.mac

               longa on
               longi on
;...............................................................
;
;        DoSetupR : Init Serial
;
;...............................................................
DoSetUpR       START
               Using GlobalData

               brl DoSetUp

               END
;---------------------------------------------------------------
;
; DoSetUp : init des voies series pour la sequence
;
;---------------------------------------------------------------
DoSetUp        START
               Using GlobalData

               Phb
               Phk
               Plb
;--
               PushLong #0
               _GetPort
;--
               PushLong #0              ; output
               PushLong #VRect
               Pushword #True           ; visible
               PushLong #0              ; refcon
               _NewModalDialog

               pla
               sta Ptr_PilotW
               pla
               sta Ptr_PilotW+2

               PushLong Ptr_PilotW
               _SetPort

               PushLong Ptr_PilotW             |ok
               PushWord #1
               PushLong #Rectok
               PushWord #ButtonItem
               PushLong #CFC_Vatit
               PushWord #0
               PushWord #0
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |annule
               PushWord #2
               PushLong #Rectan
               PushWord #ButtonItem
               PushLong #CFC_Catit
               PushWord #0
               PushWord #0
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |titre
               PushWord #0
               PushLong #rectti
               PushWord #StatText+ItemDisable
               PushLong #CDS_tit
               PushWord #0
               PushWord #0
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |Imprimante
               PushWord #3
               PushLong #rectim
               PushWord #RadioItem
               PushLong #CDS_I
               PushWord #1                     |on
               PushWord #1                     |family 1
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |Modem
               PushWord #4
               PushLong #rectmo
               PushWord #RadioItem
               PushLong #CDS_M
               PushWord #0                     |off
               PushWord #1                     |family 1
               PushLong #0
               _NewDItem
;===========
               PushLong Ptr_PilotW             |bauds
               PushWord #0
               PushLong #rectba
               PushWord #StatText+ItemDisable
               PushLong #CDS_B
               PushWord #0
               PushWord #0
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |Parite
               PushWord #0
               PushLong #rectpa
               PushWord #StatText+ItemDisable
               PushLong #CDS_P
               PushWord #0
               PushWord #0
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |donnees
               PushWord #0
               PushLong #rectdo
               PushWord #StatText+ItemDisable
               PushLong #CDS_D
               PushWord #0
               PushWord #0
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |stop
               PushWord #0
               PushLong #rectst
               PushWord #StatText+ItemDisable
               PushLong #CDS_S
               PushWord #0
               PushWord #0
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |300
               PushWord #5
               PushLong #rect300
               PushWord #RadioItem
               PushLong #CDS_300
               PushWord #1                     |on
               PushWord #2                     |family 2
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |1200
               PushWord #6
               PushLong #rect1200
               PushWord #RadioItem
               PushLong #CDS_1200
               PushWord #0                     |off
               PushWord #2                     |family 2
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |2400
               PushWord #7
               PushLong #rect2400
               PushWord #RadioItem
               PushLong #CDS_2400
               PushWord #0                     |off
               PushWord #2                     |family 2
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |4800
               PushWord #8
               PushLong #rect4800
               PushWord #RadioItem
               PushLong #CDS_4800
               PushWord #0                     |off
               PushWord #2                     |family 2
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |9600
               PushWord #9
               PushLong #rect9600
               PushWord #RadioItem
               PushLong #CDS_9600
               PushWord #0                     |off
               PushWord #2                     |family 2
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |19200
               PushWord #10
               PushLong #rect19200
               PushWord #RadioItem
               PushLong #CDS_19200
               PushWord #0                     |off
               PushWord #2                     |family 2
               PushLong #0
               _NewDItem
;==========
               PushLong Ptr_PilotW             |8 bits
               PushWord #11
               PushLong #rect8b
               PushWord #RadioItem
               PushLong #CDS_8
               PushWord #1                     |on
               PushWord #3                     |family 3
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |7 bits
               PushWord #12
               PushLong #rect7b
               PushWord #RadioItem
               PushLong #CDS_7
               PushWord #0                     |off
               PushWord #3                     |family 3
               PushLong #0
               _NewDItem
;===========
               PushLong Ptr_PilotW             |aucune
               PushWord #13
               PushLong #rectaucune
               PushWord #RadioItem
               PushLong #CDS_aucune
               PushWord #1                     |on
               PushWord #4                     |family 4
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |paire
               PushWord #14
               PushLong #rectpaire
               PushWord #RadioItem
               PushLong #CDS_paire
               PushWord #0                     |off
               PushWord #4                     |family 4
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |impaire
               PushWord #15
               PushLong #rectimpaire
               PushWord #RadioItem
               PushLong #CDS_impaire
               PushWord #0                     |off
               PushWord #4                     |family 4
               PushLong #0
               _NewDItem
;===========
               PushLong Ptr_PilotW             |aucune
               PushWord #16
               PushLong #rects1
               PushWord #RadioItem
               PushLong #CDS_1
               PushWord #1                     |on
               PushWord #5                     |family 5
               PushLong #0
               _NewDItem

               PushLong Ptr_PilotW             |aucune
               PushWord #17
               PushLong #rects2
               PushWord #RadioItem
               PushLong #CDS_2
               PushWord #0                     |off
               PushWord #5                     |family 5
               PushLong #0
               _NewDItem
;-------------------------------------
;-------------------------------------
               PushLong Ptr_PilotW             |cr
               PushWord #18
               PushLong #rectcr
               PushWord #RadioItem
               PushLong #CDS_cr
               PushWord #0                     |off
               PushWord #6                     |family 6
               PushLong #0
               _NewDItem
;--------------------------------------
               ldx #18
loopsauve      lda >ParamSerie,x
               sta portImp,x
               dex
               dex
               bpl loopsauve
;--------------------------------------
again0         jsr SetSerie                    |init des boutons
;--------------------------------------
again          PushWord #0              ; result
               PushLong #0
               _ModalDialog
               plx
               stx numID
               cpx #1                          |ok
               beq valider
               cpx #2                          |cancel
               beq annuler
               cpx #18                         |CR
               beq pluscr
               bra suite
;-- cr
pluscr         PushWord #0
               PushLong Ptr_PilotW
               PushWord #18
               _GetDItemValue
               pla
               eor #$0001
               Pha
               PushLong Ptr_PilotW
               PushWord #18
               _SetDItemValue
               bra lasuite
;--
suite          phx                      |sauve ID
               PushWord #1              |on
               PushLong Ptr_PilotW
               phx                      |ID
               _SetDItemValue
;---
               plx                      |recup le numero ID
               cpx #3                   |imprima
               beq chport
               cpx #4                   |modem
               bne lasuite
               
chport         brl again0

lasuite        jsr pos_port             |set parametre

               brl again
;--------------------------------------
valider        ANOP
               ldx #18
looprest       lda PortImp,x
               sta >ParamSerie,x
               dex
               dex
               bpl looprest
;--------------------------------------
annuler        ANOP
;--------------------------------------
fin            PushLong Ptr_PilotW
               _CloseDialog

               _SetPort
;--
               lda #DoSetUp
               sta <Ptr_PZero
               lda #^DoSetUp
               sta <Ptr_PZero+2
               plb

               rtl
;--------------------------------------
;        SetSerie : init des boutons
;--------------------------------------
SetSerie       PushWord #0
               PushLong Ptr_PilotW
               PushWord #3
               _GetDItemValue
               pla
               bne setPrinter

setModem       lda #PortMod
               sta <Ptr_Pzero
               lda #^PortMod
               sta <Ptr_Pzero+2

               bra suite1

setPrinter     lda #PortImp
               sta <Ptr_Pzero
               lda #^PortImp
               sta <Ptr_Pzero+2

;-- BAUDS
suite1         lda [<Ptr_Pzero]
               clc
               adc #5
               tax
               PushWord #1              |on
               PushLong Ptr_PilotW
               phx                      |ID
               _SetDItemValue
;-- DONNEES
               ldy #2
               lda [<Ptr_Pzero],y
               clc
               adc #11
               tax
               PushWord #1              |on
               PushLong Ptr_PilotW
               phx                      |ID
               _SetDItemValue
;-- PARITE
               ldy #4
               lda [<Ptr_Pzero],y
               clc
               adc #13
               tax
               PushWord #1              |on
               PushLong Ptr_PilotW
               phx                      |ID
               _SetDItemValue
;-- STOP
               ldy #6
               lda [<Ptr_Pzero],y
               clc
               adc #16
               tax
               PushWord #1              |on
               PushLong Ptr_PilotW
               phx                      |ID
               _SetDItemValue
;-- + CR
               ldy #8
               lda [<Ptr_Pzero],y
               pha                      |on ou off
               PushLong Ptr_PilotW
               PushWord #18             |ID
               _SetDItemValue

               rts
;--------------------------------------
;-------- pos_port --------------------
;--------------------------------------
pos_port       lda numID
               cmp #5
               bcs ouioui

               rts

ouioui         cmp #18                  |plusCR
               beq plCR
               cmp #11
               bcc setBaud
               cmp #13
               bcc setdonne
               cmp #16
               bcc setParite
               cmp #18
               bcc setstop

               rts

;--
plcr           PushWord #0
               PushLong Ptr_PilotW
               PushWord #18
               _GetDItemValue
               pla
               ldy #8
               sta [<Ptr_Pzero],y
               rts
;--
setBaud        sec
               sbc #5
               sta [<Ptr_Pzero]
               rts
;--
setDonne       sec
               sbc #11
               ldy #2
               sta [<Ptr_Pzero],y
               rts
;--
setParite      sec
               sbc #13
               ldy #4
               sta [<Ptr_Pzero],y
               rts
;--
setStop        sec
               sbc #16
               ldy #6
               sta [<Ptr_Pzero],y
               rts

;--------------------------------------
;-------- data du dialogue-------------
;--------------------------------------
VRect          dc i'20,10,190,310'

rectok         dc i'151,52,0,0'
rectan         dc i'151,170,0,0'

rectti         dc i'10,87,23,218'

rectse         dc i'15,2,27,84'
rectno         dc i'15,85,27,190'

rectim         dc i'30,42,0,0'
rectmo         dc i'30,199,0,0'

rectba         dc i'45,10,58,70'
rectdo         dc i'45,76,58,170'
rectpa         dc i'45,170,58,227'
rectst         dc i'45,230,58,300'

rect300        dc i'60,5,0,0'
rect1200       dc i'75,5,0,0'
rect2400       dc i'90,5,0,0'
rect4800       dc i'105,5,0,0'
rect9600       dc i'120,5,0,0'
rect19200      dc i'135,5,0,0'

rect8b         dc i'60,81,0,0'
rect7b         dc i'75,81,0,0'

rectaucune     dc i'60,165,0,0'
rectpaire      dc i'75,165,0,0'
rectimpaire    dc i'90,165,0,0'

rects1         dc i'60,250,0,0'
rects2         dc i'75,250,0,0'

rectcr         dc i'112,104,0,0'

Ptr_PilotW     ds 4

numID          ds 2
;--
CFC_Vatit      str 'Ok'
CFC_Catit      str 'Cancel'

CDS_tit        str 'Setup serial ports'
CDS_I          str 'Printer'
CDS_M          str 'Modem'
CDS_B          str 'Baud'
CDS_D          str 'Data bits'
CDS_P          str 'Parity'
CDS_S          str 'Stop bits'

CDS_300        str '300'
CDS_1200       str '1200'
CDS_2400       str '2400'
CDS_4800       str '4800'
CDS_9600       str '9600'
CDS_19200      str '19200'

CDS_8          str '8 bits'
CDS_7          str '7 bits'

CDS_aucune     str 'None'
CDS_paire      str 'Even'
CDS_impaire    str 'Odd'

CDS_1          str '1'
CDS_2          str '2'

CDS_cr         str 'Add CR after command'

PortImp        ANOP
PI_bauds       dc i'1'                  |1200
PI_donne       dc i'0'                  |8 bits
PI_parite      dc i'0'                  |aucune
PI_stop        dc i'0'                  |1 stop
PI_cr          dc i'0'                  |+CR

PortMod        ANOP
PM_bauds       dc i'1'                  |1200
PM_donne       dc i'0'                  |8 bits
PM_parite      dc i'0'                  |aucune
PM_stop        dc i'0'                  |1 stop
PM_cr          dc i'0'                  |+CR

               END

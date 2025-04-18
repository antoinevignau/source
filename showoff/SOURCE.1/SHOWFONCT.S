;...............................................................
;
; FILE : SHOWFONCT                      - fonction de showoff -
;        ---------
;...............................................................
;---------------------------------------------------------------
;
; DoActivate : ne fait comme vous le voyez pas grand chose
;
;---------------------------------------------------------------
DoActivate     START

               rts

               END
;...............................................................
;
;        doQuit : ARRET DU PROGRAMME
;
;...............................................................
DoQuit         START
               Using GlobalData

               lda #1
               sta CduQuit

               jsr Save_Before          |attention
               bcs ko

               inc QuitFlag             |positionne le flag de sortie

ko             rts

               END
;...............................................................
;
;        DoNew : New Sequence
;
;...............................................................
DoNew          START
               Using globalData
               Using WindowData
               Using SeqEditData
;--
               jsr GetNewFName          |donner aux pauvres un nom de Sequence
               bcc DoNew1
               rts
;--
DoNew1         ENTRY

               lda Sequ_Template
               beq SDN1
               jsr Dealloc_Template

SDN1           lda #1                   |init number frame
               sta Sequ_HMFrame
               sta Sequ_NbFrame
               stz Sequ_Template
               stz Sequ_TemplateB

               ldy #98
               lda #$FFFF
Loop           sta Sequ_FileNum,y
               dey
               dey
               bpl Loop

               lda #$01FF
               sta Sequ_FileNum

               lda #Mode_Frame
               sta Mode_Showoff

               jsr OkNew

               lda #1                   |si New Alors le Sauver
               sta Top_Action
               stz Top_ActionG
               clc                      |oui ca marche
               rts

ko             sec
               rts

               END
;...............................................................
;
;        DoClearFrame : Clear the Frame
;
;...............................................................
DoClearFrame   START
               Using GlobalData
               Using WindowData
               Using ProdosData

               lda Mode_ShowOff
               cmp #2
               bcc ClearFr
               beq ClearTe
;--
Clearlabel     lda #TxClearLabel
               sta ItemAp3Tx
               lda #^TxClearLabel
               sta ItemAp3Tx+2
               bra SDoClear
;--
Clearte        lda #TxClearTempl
               sta ItemAp3Tx
               lda #^TxClearTempl
               sta ItemAp3Tx+2
               bra SDoClear
;--
ClearFr        lda #TxClearFrame
               sta ItemAp3Tx
               lda #^TxClearFrame
               sta ItemAp3Tx+2
;--
SDoClear       jsr Really_New
               cmp #1
               bne ko

               jsr OkClearFrame
;--
               lda Mode_Showoff
               cmp #Mode_Template
               bne ko

               lda #0
               sta Top_Action
               sta Ya1Nom

               lda ZSequ_Template       |ALERT
               sta Beware_Change

               lda #0                   |No Template
               sta Sequ_Template
;--
ko             rts

               END
;...............................................................
;
;        Really_New : Do You Really Want to Clear
;
;...............................................................
Really_New     START
               Using WindowData
               Using GlobalData
;--
;              lda Top_ClearW
;              beq ok
;              stz Top_clearW
;              lda #1
;              rts
;--
ok             lda #TxNew
               sta ItemAp2Tx
               lda #^TxNew
               sta ItemAp2Tx+2

               PushWord #0
               PushLong #Alert_Dialog
               PushLong #0
               _NoteAlert
               pla

               rts

               END
;...............................................................
;
;        DoNewG : DoNew General frame/template/label
;
;...............................................................
DoNewG         START
               Using GlobalData
               Using WindowData
;--
               jsr Save_Before          |test si doit sauver
               bcc oui_newg
               rts
;--
oui_newg       lda Mode_ShowOff
               asl a
               tax
               jsr (TableDoNew,x)
               rts
;--
TableDoNew     ANOP
               dc i'DoNewF'
               dc i'DoNewF'
               dc i'DoNewT'
               dc i'DoNewL'
;--------------------------------------
;        DoNewF : New Frame
;--------------------------------------
DoNewF         ANOP

               jsr DoNew                |init Sequence/Frame
               bcs FDoNewF
               lda #Mode_Frame          |Mode Frame
               sta Mode_ShowOff
               lda #1                   |action par principe
               sta Top_Action
               stz Top_ActionG
               lda #1
               sta FrameOn

FDoNewF        rts

               END
;...............................................................
;
;        DoOpenG : DoOpen General frame/template/label
;
;...............................................................
DoOpenG        START
               Using GlobalData
               Using WindowData
;--
               jsr save_Before
               bcc oui_openg
               rts
;--
oui_openg      lda Mode_ShowOff
               asl a
               tax
               jsr (TableDoOpen,x)
               rts
;--
TableDoOpen    ANOP
               dc i'DoOpenF'
               dc i'DoOpenF'
               dc i'DoOpenT'
               dc i'DoOpenL'
;--------------------------------------
;        DoOpenF : New Frame
;--------------------------------------
DoOpenF        ANOP
;--
;              lda #1
;              sta Top_ClearW
;--
               jsr DoOpenSequ           |init Sequence/Frame
               bcc SDoOpenF
;--
               lda #$FFFF               |si probleme raz
               sta Status_Ecran
               stz Top_Action
               stz Top_ActionG
               bra FDoOpenF
;--
SDoOpenF       lda #Mode_Frame          |Mode Frame
               sta Mode_ShowOff
               lda #0                   |Pas d'action
               sta Top_Action

               jsr Recal_Menu

               lda #1
               sta FrameOn
;--
FDoOpenF       rts

               END
;...............................................................
;
;        DoSaveG : DoSave General frame/template/label
;
;...............................................................
DoSaveG        START
               Using GlobalData
               Using WindowData

               lda Mode_ShowOff
               asl a
               tax
               jsr (TableDoSave,x)
               rts
;--
TableDoSave     ANOP
               dc i'DoSaveF'
               dc i'DoSaveF'
               dc i'DoSaveT'
               dc i'DoSaveL'
;--------------------------------------
;        DoSaveF : Save Frame
;--------------------------------------
DoSaveF         ANOP

               lda #1                   |Mode Frame
               sta Mode_ShowOff

               jsr SetFlagFrame

               jsr DoSaveSequ           |init Sequence/Frame
               php

               lda #0                   |Pas d'action
               sta Top_Action

               jsl maj_frameW

               plp
               rts

               END
;...............................................................
;
;        DoSaveAsG : DoSaveAs General frame/template/label
;
;...............................................................
DoSaveAsG      START
               Using GlobalData
               Using WindowData

               lda Mode_ShowOff
               asl a
               tax
               jsr (TableDoSaveAs,x)
               rts
;--
TableDoSaveAs  ANOP
               dc i'DoSaveAsF'
               dc i'DoSaveAsF'
               dc i'DoSaveAsT'
               dc i'DoSaveAsL'
;--------------------------------------
;        DoSaveAsF : SaveAs Frame
;--------------------------------------
DoSaveAsF      ANOP
;--
               lda #1                   |Mode Frame
               sta Mode_ShowOff
;--------------------------------------
               lda Top_action
               beq SDSAF0
               lda #1                   |debug jcl pour save as
               sta Top_Debug_Sas
               lda Sequ_NbFrame
               sta Top_Debug_NBF
SDSAF0         ANOP
;--------------------------------------
               jsr SetFlagFrame

               jsr DoSaveAsSequ         |init Sequence/Frame

               stz Top_debug_Sas

               bcs FDoSaveAsF

               lda #0                   |Pas d'action
               sta Top_Action

FDoSaveAsF     rts

               END
;...............................................................
;
;        Save_Before : Alert si new open quit
;
;...............................................................
Save_Before    START
               Using GlobalData
               Using WindowData

               lda Top_Action
               bne ok
               lda Top_ActionG
               bne ok
               clc
               rts
;--
ok             ANOP

               PushWord #0
               PushLong #SaveBefore
               PushLong #0
               _NoteAlert
               pla
;--
               cmp #1
               beq Answer_Yes
               cmp #2
               beq Answer_No
;--
Answer_Cancel  stz CduQuit
               sec                      |annule l'operation
               rts
;--
Answer_No      stz CduQuit
               clc                      |ne sauve pas
               rts
;--
Answer_Yes     ANOP                     |oui sauve
;--
               jsr DoSaveG              |sauve la courante
               bcs Answer_Cancel
;--
               lda Mode_ShowOff
               cmp #Mode_Frame
               beq FAnswer_Yes
;--
               lda CduQuit
               beq FAnswer_yes
;--
               lda FrameOn
               beq FAnswer_yes
;--
               lda #Mode_Frame
               sta Mode_ShowOff
               jsr DoSaveG              |sauve sequence si oui
;--
FAnswer_yes    stz CduQuit
               clc
               rts

               END
;...............................................................
;
;        Disk_Present
;
;...............................................................
Disk_Present   START
               Using GlobalData
               Using Windowdata
;--
               PushWord MyId            |Demande toujours le segment
               PushWord #1              |a cause des problemes
               PushWord SegNumber       |d'acces disk intempestifs
               PushLong #UserBuffer
               _GetLoadSegInfo
               cmp #0
               bne DP
;--
               lda UserBuffer+2         |si memory_handle
               ldx UserBuffer+4         |= 0 demande du disk
               sta 0                    |on deref et on regarde
               stx 2
               ldy #2
               lda [0],y
               ora [0]
               bne FDP
;--
DP             ANOP
               _GetFileInfo GetInfoParams
               bcc FDP
;--
               lda #TxInsShow
               sta ItemAp2tx
               lda #^TxInsShow
               sta ItemAp2tx+2

               lda #Str_Bl
               sta ItemAp3tx
               lda #^Str_Bl
               sta ItemAp3tx+2

               jsr Ok_Alert
               _InitCursor
               bra DP
;--
FDP            rts

UserBuffer     ds 20
GetInfoParams  dc i4'VolName'
               ds 22
VolName        str '1'

               END
;...............................................................
;
;        Call_Alert_Mem : appel not enough memory from print manager
;
;...............................................................
Call_Alert_Mem START

               phb
               phk
               plb

               jsr Alert_CCP

               plb

               rtl

               END

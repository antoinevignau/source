;...............................................................
;
; FILE : SHOWSEQUENCE.S                 - Sequence -
;        --------------
;...............................................................
;------------------------------------------------------------------
;
;        DoPreviousF : Frame Precedente
;
;------------------------------------------------------------------
DoPreviousF    START
               Using GlobalData
               Using WindowData
               Using Cursors

               lda Mode_ShowOff
               cmp #Mode_Frame
               beq okPF
               rts
;--
okPF           lda Sequ_NbFrame         | de 0 a 99
               dec a
               bne SNextPrevious0
               rts
;--
SNextPrevious0 Pha
;--
               jsr Check_Text           |attention si du text
;--
               PushLong #Icon_Arrow3    |outline
               PushWord #0
               PushWord #2
               PushWord #161
               _DrawIcon
               pla
;--
SNextPrevious  pha
               lda Top_Action
               beq SNP0
               sta Top_ActionG
               jsr SetFlagFrame         |position Bit suivant frame
               jsr SaveCurFrame
               bcc SNP0
;--
               pla
               bra koSNP0
;--
SNP0           pla
               sta Sequ_NbFrame
               jsr LoadCurFrame
               jsr Raz_Select           |No Selection
               jsr recal_menu
               jsr Del_Undo
               lda #0
               sta Top_Action
;--
koSNP0         jsr Set_Number
               jsl Maj_FrameW
;--
               PushLong #0
               _GetPort

               PushLong Ptr_OptionW
               _SetPort

               PushLong #Icon_Arrow3    |Noir
               PushWord #$0F00
               PushWord #2
               PushWord #161
               _DrawIcon

               PushLong #Icon_Arrow4    |Noir
               PushWord #$0F00
               PushWord #27
               PushWord #161
               _DrawIcon

               _SetPort
;--
               rts
;------------------------------------------------------------------
;
;        DoNextF : Frame Suivante
;
;------------------------------------------------------------------
DoNextF        ENTRY

               lda Mode_ShowOff
               cmp #Mode_Frame
               beq OkNF
               rts
;--
OkNF           lda Sequ_NbFrame         | de 1 a 99
               inc a
               cmp Sequ_HMFrame
               bcc ok
               beq ok
               rts
;--
ok             Pha
;--
               jsr Check_Text           |attention si du text
;--
               PushLong #Icon_Arrow4    |outline
               PushWord #0
               PushWord #27
               PushWord #161
               _DrawIcon

               Pla
               Brl SNextPrevious
;--------------------------------------
;        WaitAMinute
;--------------------------------------
WaitAMinute    ENTRY

               phx
               phy
               pha

               ldy #0
               ldx #20
RWAM           lda #$FFFF
               dey
               bne RWAM
               dex
               bne RWAM

               pla
               ply
               plx

               rts

               END
;...............................................................
;
;        DoAutoNumber : Show the Frame Number
;
;...............................................................
DoAutoNumber   START
               Using GlobalData
               Using FontData

               lda Status_Number
               eor #$0001
               sta Status_Number

               beq NumberOff
;--
NumberOn       jsr Compute_RFrame       |calcul rect Frame number
               lda #$12                 |du Chiffre
               bra Number
;--
NumberOff      jsr Un_Select            |+++ DEBUG POUR FRAME NUMBER +++
               jsr Menu_On_Off
               lda #0                   |pas de Chiffre
;--
Number         Pha
               PushWord #281
               _SetMItemMark
;--
               jsr Swap_RectF           |sauve
;--
               ldy #6                   |Clip region
LOOP           lda NumberRect,y
               sta Rect_selectF,y
               dey
               dey
               bpl LOOP
;--
               jsr Aff_Shape            |redessine
;--
               jsr Swap_RectF           |Restaure
;--
FAutoNumber    rts
;--------------------------------------
;        Swap Rect_selectF
;--------------------------------------
Swap_RectF     ANOP

               ldy #6
RSave          lda Rect_SelectF,y
               tax
               lda Rect_Sauve,y
               sta Rect_SelectF,y
               txa
               sta Rect_Sauve,y
               dey
               dey
               bpl RSave

               rts
;--------------------------------------
;        Compute Rect Frame Number
;--------------------------------------
Compute_RFrame ENTRY

               PushWord Sequ_NbFrame    |translate the word
               PushLong #Str_Frame1
               PushWord #2
               PushWord #0
               _Int2Dec

               PushLong #0
               PushWord #0
               _InstallFont

               lda #1
               sta Change_font

               PushLong #Str_Frame      |compute the rect
               PushLong #NumberRect
               _StringBounds

               lda NumberRectX1         |Width
               sec
               sbc NumberRectX0
               sta NumberRectX0

               lda NumberRectY1         |Lenght
               sec
               sbc NumberRectY0
               sta NumberRectY0

               lda #317
               sta NumberRectX1

               lda #197
               sta NumberRectY1

               lda NumberRectY1
               sec
               sbc NumberRectY0
               sec
               sbc #10
               sta NumberRectY0

               lda NumberRectX1
               sec
               sbc NumberRectX0
               sbc #10
               sta NumberRectX0

               rts

               END
;...............................................................
;
;        Redraw_Number : Draw the Number Frame
;
;...............................................................
Redraw_Number  START
               Using GlobalData
               Using FontData

               lda Status_Number
               bne ok
ko             rts
;--
ok             ANOP
;--
               lda Mode_ShowOff
               beq ko
               cmp #Mode_Frame
               bne ko
;--
               lda ShowOnOff            |si show ok
               bne ok1
;--
               lda Force_Bitmap
               bne Ko
               lda Top_Bitmap
               bne ko
;--
ok1            PushLong #NumberRect
               PushWord #2
               PushWord #2
               _OffSetRect

               PushWord #0              |Black
               _SetSolidPenPat

               PushLong #NumberRect
               _PaintRect

               PushLong #NumberRect
               PushWord #-2
               PushWord #-2
               _OffSetRect

               PushWord #15             |White
               _SetSolidPenPat

               PushLong #NumberRect
               _PaintRect

               PushWord #0
               _SetSolidPenPat

               PushLong #NumberRect
               _FrameRect

               lda NumberRectX0
               clc
               adc #5
               pha
               lda NumberRectY1
               sec
               sbc #5
               pha
               _MoveTo

               PushWord #0              |Noir
               _SetForeColor

               PushLong #0
               PushWord #0
               _InstallFont

               lda #1
               sta Change_font

               PushLong #Str_Frame
               _DrawString

               rts

               END
;...............................................................
;
;        Test_In_Number
;
;...............................................................
Test_In_Number START
               Using globalData

               lda Status_Number        |Frame Number
               bne ok
               clc
               rts
;--
ok             PushWord #0              |Inside
               PushLong #EventWhere
               PushLong #NumberRect
               _PtInRect
               pla
               bne InSide

               clc                     |not INSIDE Number
               rts
;--
Inside         lda #$0300
               sec
               rts

               END
;...............................................................
;
;        SetFlagFrame : positionne flag
;
;...............................................................
SetFlagFrame   START
               Using GlobalData
               Using SeqEditData
;--
               lda Top_Action
               bne ok
               rts
;--
SetFlagFrameF  ENTRY                    |force de toute maniere
ok             Sep #$30
               Longa off
               Longi Off

               ldx Sequ_NbFrame
               jsr FindFileNum
               lda #1
               sta BeenModified,x

               Rep #$30
               Longa On
               Longi On
;--
               rts
;--------------------------------------
;        ResetFlagFrame
;--------------------------------------
ResetFlagFrame ENTRY

               Sep #$30
               Longa off
               Longi Off

               ldx Sequ_NbFrame
               jsr FindFileNum
               lda #0
               sta BeenModified,x

               Rep #$30
               Longa On
               Longi On

               rts

               END
;...............................................................
;
;        DoNextFrame : creer une frame
;
;...............................................................
DoNextFrame    START
               Using GlobalData
;--
               lda Top_Action           |modif ?
               beq SDNF
;--------------------------------------
;              jsr SetFlagFrame         |alors on set et on sauve
;--------------------------------------
               jsr SaveCurFrame
               bcc SDNF
               jsr ResetFlagFrame       |annule le Set
               bra PB_DNF               |impossible de sauver ARRET
;--
SDNF           ANOP
               jsr SENewAct1            |une autre
               bcs PB_DNF               |Impossible on reprend l'autre
;--
               jsr OkClearFrame2
;--
FDNF           rts
;--
PB_DNF         ANOP                     |Repart sur l'ancien Frame
               lda #1
               sta Top_Action
               jsl Maj_FrameW
               rts

               END
;...............................................................
;
;        Init_Transit
;
;...............................................................
Init_Transit   START
               Using GlobalData

               rts

               END

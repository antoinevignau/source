;...............................................................
;
; FILE : SHOWFORMAT.S                   - Format routine -
;        ------------
;...............................................................
               Keep DoFormatD
               List Off
               Gen Off
               Symbol Off
               65816 on

               Mcopy Showformat.mac

               longa on
               longi on
;...............................................................
;
;        DoFormatR
;
;...............................................................
DoFormatR      START

               brl DoFormatSbr

               END
;...............................................................
;
;        DoFormatSbr
;
;...............................................................
DoFormatSbr    START
               Using FormatData
;--
               phb
               phk
               plb
;--
;              jsr Init_Config
;--
;              lda #1                   |WHERE smartPort ?
;              sta Command_Config
;              jsl Call_Config
;--
               jsr Search_DeviceName    |New Version 16/05/88
;--
               jsr Set_Radio_Disk
;--
               PushLong #0
               PushLong #FormatDialog
               _GetNewModalDialog
               pla
               sta >FDialogPtr
               pla
               sta >FDialogPtr+2
;--
               PushLong #0
               _GetPort

               PushLong FDialogPtr
               _SetPort
;--
Loop           stz retour_friend
               PushWord #0
               PushLong #0
               _ModalDialog
               pla
               beq Loop
;--
               cmp #1
               beq okFormat
               cmp #2
               beq CancelFormat
               cmp #4
               bcc Loop
               cmp #8
               bcc Drive1Format
               bra Loop
;--
Drive1Format   ANOP
               ANOP
               tax
               PushWord #1
               PushLong >FDialogPtr
               txa
               pha
               sta Drive_Number
               _SetDItemValue
               bra Loop
;--
okFormat       ANOP
               jsr FormatDisk
               bcc CancelFormat
;--
               ldx Retour_Friend        |retour en douceur si no a reallyformat
               beq sretour_friend
               stz Retour_Friend
               bra Loop
sretour_friend ANOP
;--
               jsr ErrFormat
               bra Loop
;--
CancelFormat   ANOP
;--
               _SetPort

               PushLong >FDialogPtr
               _CloseDialog

               plb

               rtl
;--------------------------------------
;        ErrFormat
;--------------------------------------
ErrFormat      ENTRY
;--
               ldx #Nb_Err_Msg
rErrFormat     cmp Tab_Err_Format,x
               beq Error_Msg
               dex
               dex
               bpl rErrFormat
;--
               ldx #3                   |if UnKnow then I/O Error
;--
Error_Msg      txa                      |index * 2
               asl a
               tax
               lda Tab_Tx_Format,x
               sta Adr_Err_Tx
               lda Tab_Tx_Format+2,x
               sta Adr_Err_Tx+2
;--
               PushWord #0
               PushLong #AlertFormatERR
               PushLong #0
               _StopAlert
               jsl Maj_OptionW
               pla

               rts
;--------------------------------------
;        FormatDisk
;--------------------------------------
FormatDisk     ANOP
;--
               PushLong FDialogPtr      |nom du volume
               PushWord FD_ITVolume
               PushLong #VolFParams+1
               _GetIText
               lda VolFParams+1
               and #$00FF
               inc a
               ora #$2F00
               sta VolFParams
;--
               lda Drive_Number         |Device Name
               sec
               sbc #4
               asl a
               tax
               lda Tab_Slot_Drive,x
               ora #$0030
               and #$00FF
               sep #$20
               sta NameFParams+3
               rep #$20
;--
               jsr Really_Format
               bcc okonyva
               cmp #2
               beq okonyva
               lda #1
               sta retour_friend
               sec                      |abandon mais retour a format
               rts
okonyva        ANOP
;--
               PushLong FDialogPtr
               _DrawDialog
;--
               _WaitCursor

               PushLong #RectFormat
               _EraseRect

               PushWord #60
               PushWord #70
               _MoveTo

               PushLong #FormatProgTx
               _DrawString

               sep #$20
               longa off
               lda >$0197C9
               rep #$20
               longa on
               pha

               _Format FormatParams
               tax

               pla
               sep #$20
               longa off
               sta >$0197C9
               rep #$20
               longa on
               phx
               _InitCursor
               PushLong #RectFormat
               _EraseRect
               PushLong FDialogPtr
               _DrawDialog
               plx
               txa
               cmp #1

fFormatDisk    rts
;--------------------------------------
;        Really_Format
;--------------------------------------
Really_Format  ANOP
;--
               _Volume VolumeParams     |nom du volume
               bcc sReally_Format
;--
               cmp #$28
               bne s0RF
               pla                      |depile adr retour
               sec
               lda #$28
               rts

s0RF           clc                      |si error disk vierge ou ?
               rts
;--
sReally_Format PushWord #0
               PushLong #AlertFormat
               PushLong #0
               _NoteAlert
               jsl Maj_OptionW
               pla
               sec
fReally_Format rts
;--------------------------------------
;        Set_Radio_Disk
;--------------------------------------
Set_Radio_Disk ENTRY
;--
               lda #1
               sta OneActif
;--
SRD351         lda Tab_Slot_Drive       |drive 3,5 -1
               beq SRD352
               lda #$0001
               sta FD_ITDrive1S
               lda OneActif
               sta FD_Value1
               stz OneActif
;--
SRD352         lda Tab_Slot_Drive+2     |drive 3,5 -2
               beq SRD541
               lda #$0001
               sta FD_ITDrive2S
               lda OneActif
               sta FD_Value2
               stz OneActif
;--
SRD541         lda Tab_Slot_Drive+4     |drive 5,25 -1
               beq SRD542
               lda #$0001
               sta FD_ITDrive3S
               lda OneActif
               sta FD_Value3
               stz OneActif
;--
SRD542         lda Tab_Slot_Drive+6     |drive 5,25 -2
               beq fSRD
               lda #$0001
               sta FD_ITDrive4S
               lda OneActif
               sta FD_Value4
               stz OneActif

fSRD           rts
;--------------------------------------
;        Format Dialog Box
;--------------------------------------
Retour_Friend  ds 2
FDialogPtr     ds 4

FormatDialog   ANOP
               dc i'30,30,170,290'
               dc i2'5'
               dc i4'0'
               dc i4'FD_ITok'
               dc i4'FD_ITcancel'
               dc i4'FD_ITVolume'
               dc i4'FD_ITDrive1'
               dc i4'FD_ITDrive2'
               dc i4'FD_ITDrive3'
               dc i4'FD_ITDrive4'
               dc i4'FD_ITTx1'          |tx format a disk
               dc i4'FD_ITTx2'          |tx volume name
               dc i4'FD_ITTx3'          |tx disk 3.5
               dc i4'FD_ITTx4'          |tx disk 5 1/4
;--
FD_ITok        ANOP
               dc i'1'
               dc i'121,35,136,95'
               dc i'ButtonItem'
               dc i4'Str_OkTx'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
FD_ITcancel    ANOP
               dc i'2'
               dc i'121,165,136,225'
               dc i'ButtonItem'
               dc i4'Str_CancelTx'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
FD_ITVolume    ANOP
               dc i'3'
               dc i'20,103,35,252'
               dc i'EditLine'
               dc i4'Str_InitVolume'
               dc i'14'
               dc i'0'
               dc i4'0'
;--
FD_ITDrive1    ANOP
               dc i'4'
               dc i'40,130,55,200'
               dc i'RadioItem'
               dc i4'str_Drive1'
FD_Value1      dc i'0'
FD_ITDrive1S   dc i'$FF01'
               dc i4'0'
;--
FD_ITDrive2    ANOP
               dc i'5'
               dc i'55,130,70,200'
               dc i'RadioItem'
               dc i4'str_Drive2'
FD_Value2      dc i'0'
FD_ITDrive2S   dc i'$FF01'
               dc i4'0'
;--
FD_ITDrive3    ANOP
               dc i'6'
               dc i'75,130,90,200'
               dc i'RadioItem'
               dc i4'str_Drive1'
FD_Value3      dc i'0'
FD_ITDrive3S   dc i'$FF01'
               dc i4'0'
;--
FD_ITDrive4    ANOP
               dc i'7'
               dc i'90,130,105,200'
               dc i'RadioItem'
               dc i4'str_Drive2'
FD_Value4      dc i'0'
FD_ITDrive4S   dc i'$FF01'
               dc i4'0'
;--
FD_ITTx1       ANOP                     |format a disk
               dc i'8'
               dc i'1,78,12,182'
               dc i'StatText+ItemDisable'
               dc i4'Str_ItTx1'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
FD_ITTx2       ANOP                     |volume name
               dc i'9'
               dc i'23,4,38,100'
               dc i'StatText+ItemDisable'
               dc i4'Str_ItTx2'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
FD_ITTx3       ANOP                     |disk 3.5
               dc i'10'
               dc i'50,40,65,120'
               dc i'StatText+ItemDisable'
               dc i4'Str_ItTx3'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
FD_ITTx4       ANOP                     |disk 5.1/4
               dc i'11'
               dc i'85,40,100,120'
               dc i'StatText+ItemDisable'
               dc i4'Str_ItTx4'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
Str_Drive1     str 'Drive 1'
Str_Drive2     str 'Drive 2'
Str_ItTx1      str 'Format a Disk'
Str_ItTx2      str 'Volume name :'
Str_ItTx3      str 'Disk 3.5 :'
Str_ItTx4      str 'Disk 5.25  :'
Str_OkTx       str 'Ok'
Str_CancelTx   str 'Cancel'
Str_InitVolume str 'Blank'
;--------------------------------------
;--------------------------------------
AlertFormat    ANOP
               dc i'50,5,110,315'
               dc i'2'
               dc i1'$81'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'AlertF_Yes'        |Yes
               dc i4'AlertF_No'         |No
               dc i4'AlertF_Texte'      |Really Format
               dc i4'AlertF_Volume'     |volume
               dc i4'AlertF_Volume1'    |nom du volume
               dc i4'0'
;--------------------------------------
AlertFormatERR ANOP
               dc i'50,5,110,315'
               dc i'2'
               dc i1'$81'
               dc i1'$80'
               dc i1'$80'
               dc i1'$80'
               dc i4'AlertFERR_Ok'
               dc i4'AlertFERR_Tx'
               dc i4'0'
;------
AlertFERR_Ok   ANOP
               dc i'1'
               dc i'41,125,56,185'
               dc i'ButtonItem'
               dc i4'Str_OkF'
               dc i'0'
               dc i'0'
               dc i4'0'
;-
AlertFERR_Tx   ANOP
               dc i'2'
               dc i'08,60,23,305'
               dc i'StatText'
Adr_Err_Tx     dc i4'0'
               dc i'0'
               dc i'0'
               dc i4'0'
;------
AlertF_Yes     ANOP
               dc i'2'
               dc i'41,48,56,108'
               dc i'ButtonItem'
               dc i4'Str_Yes'
               dc i'0'
               dc i'0'
               dc i4'0'
;-
AlertF_No      ANOP
               dc i'1'
               dc i'41,192,56,252'
               dc i'ButtonItem'
               dc i4'Str_No'
               dc i'0'
               dc i'0'
               dc i4'0'
;-
AlertF_Texte   ANOP
               dc i'3'
               dc i'05,55,20,305'
               dc i'StatText'
               dc i4'ReallyFormatTX'
               dc i'0'
               dc i'0'
               dc i4'0'
;-
AlertF_Volume  ANOP
               dc i'4'
               dc i'23,55,38,127'
               dc i'StatText'
               dc i4'NameVolume'
               dc i'0'
               dc i'0'
               dc i4'0'
;-
AlertF_Volume1 ANOP
               dc i'5'
               dc i'23,130,38,305'
               dc i'StatText'
               dc i4'NameVolumeTx'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
Str_Yes        str 'Yes'
Str_No         str 'No'
Str_OkF        str 'Ok'
;--------------------------------------
;        Erreur Messages
;--------------------------------------
Nb_Err_Msg     equ 8*2                  |9 messages d'erreur -> (9-1)*2
Tab_Err_Format dc i'$7,$10,$11,$27,$5D,$2B,$2F,$40,$28'
Tab_TX_Format  dc i4'Err_Format1'
               dc i4'Err_Format2'
               dc i4'Err_Format3'
               dc i4'Err_Format4'
               dc i4'Err_Format5'
               dc i4'Err_Format6'
               dc i4'Err_Format7'
               dc i4'Err_Format8'
               dc i4'Err_Format9'
Err_Format1    str 'ProDOS is busy.'
Err_Format2    str 'Device not found.'
Err_Format3    str 'Invalid device request.'
Err_Format4    str 'I/O Error.'
Err_Format5    str 'File system not available.'
Err_Format6    str 'Disk write protected.'
Err_Format7    str 'No disk in drive.'
Err_Format8    str 'Invalid Pathname Syntax.'
Err_Format9    str 'No device connected.'
;--------------------------------------
;        Data Format Operation
;--------------------------------------
Drive_Number   dc i'4'
Number_device  ds 2
;--
VolumeParams   ANOP
DevName_VP     dc i4'NameFParams'
VolName_VP     dc i4'NameVolumeTx'
BlockT_VP      ds 4
FreeB_VP       ds 4
FileID_VP      ds 2
;--
FormatParams   ANOP
DevName_FP     dc i4'NameFParams'
VolName_FP     dc i4'VolFParams'
FileID_FP      dc i2'$0001'
;--
NameFParams    dc i1'3',c'.D1'
VolFParams     dc 16i1'0'
;--
ReallyFormatTx str 'Do you really want to format'
NameVolume     str 'volume :                 '
NameVolumeTx   str '                '
;--
RectFormat     dc i'0,0,140,260'
FormatProgTx   str 'Format in Progress ...'

               END
;--------------------------------------
;        FormatData
;--------------------------------------
FormatData     DATA

OneActif       ds 2
Command_Config ds 2
Tab_Slot_Drive dc i'0,0,0,0'

               END

               copy ConfigDisk.s

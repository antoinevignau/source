*
* High-Speed SCSI-2
* for Daniel
*
* (c) 2024, Brutal Deluxe Software
*

               mx        %11
               org       $6000
               lst       off

*--- Zero page usage

zpFIRSTTRACK   =         0
zpLASTTRACK    =         zpFIRSTTRACK+1
zpCURTRACK     =         zpLASTTRACK+1
zpCURSTATUS    =         zpCURTRACK+1
zpERRORCODE    =         zpCURSTATUS+1

*--- Equates

spSTATUS       =         0
spCONTROL      =         4
bufferLEN      =         1024

*--- Macros

_STATUS        mac
               ldx       #>]1
               ldy       #<]1
               lda       #spSTATUS
               jsr       callME
               eom

_CONTROL       mac
               ldx       #>]1
               ldy       #<]1
               lda       #spCONTROL
               jsr       callME
               eom

*----------------------------
* CALL TABLE
*----------------------------

call24576      jmp       doSETSLOT
call24579      jmp       doINSERTEJECT
call24582      jmp       doINSERT
call24585      jmp       doEJECT
call24588      jmp       doPLAYSTOP
call24591      jmp       doPLAY
call24594      jmp       doSTOP
call24597      jmp       doPAUSERESUME
call24600      jmp       doPAUSE
call24603      jmp       doRESUME
call24606      jmp       doGETSTATUS
call24609      jmp       doREADTOC
call24612      jmp       doREWIND
call24615      jmp       doFASTFORWARD

*----------------------------
* SET SLOT AND INIT PLAYER
*----------------------------

doSETSLOT      lda       zpFIRSTTRACK
               and       #%00000111
               ora       #%11000000
               sta       callHS+2

               lda       #0
               sta       zpFIRSTTRACK
               sta       zpLASTTRACK
               sta       zpCURTRACK

               jmp       doGETSTATUS

*----------------------------
* INSERT/EJECT DISK
*----------------------------

doINSERTEJECT
               lda       fgINSERT
               eor       #1
               sta       fgINSERT
               bne       doINSERT

doEJECT        _CONTROL  #scsiEJECT
               lda       #0
               sta       fgINSERT
               rts

doINSERT       _CONTROL  #scsiINSERT
               lda       #1
               sta       fgINSERT
               rts

*----------------------------
* PLAY/STOP PLAY
*----------------------------

doPLAYSTOP
               lda       fgPLAY
               eor       #1
               sta       fgPLAY
               bne       doPLAY

doSTOP         _CONTROL  #scsiSTOP
               lda       #0
               sta       zpCURTRACK
               sta       fgPLAY
               rts

doPLAY         jsr       doREADTOC       ; always read TOC
               bcc       doPLAYOK

               lda       #1              ; on error, se fake values
               sta       bufferPTR+2
               sta       bufferPTR+3

doPLAYOK       lda       bufferPTR+2
               sta       zpFIRSTTRACK
               sta       zpCURTRACK
               sta       scsiPLAY+4
               lda       bufferPTR+3
               sta       zpLASTTRACK
               sta       scsiPLAY+7

doPLAYALL      _CONTROL  #scsiPLAY
               lda       #1
               sta       fgPLAY
               rts

*----------------------------
* PAUSE/RESUME PLAY
*----------------------------

doPAUSERESUME
               lda       fgPAUSE
               eor       #1
               sta       fgPAUSE
               bne       doPAUSE

doRESUME       _CONTROL  #scsiRESUME
               lda       #0
               sta       fgPAUSE
               rts

doPAUSE        _CONTROL  #scsiPAUSE
               lda       #1
               sta       fgPAUSE
               rts

*----------------------------
* GET THE CURRENT STATUS
*----------------------------

doGETSTATUS
               _CONTROL  #scsiSTATUS

               lda       bufferPTR+1
               sta       zpCURSTATUS

               lda       bufferPTR+6
               sta       zpCURTRACK
               rts

*----------------------------
* GET THE TABLE OF CONTENTS
*----------------------------

doREADTOC
               _CONTROL  #scsiTOC

               lda       fgPLAY          ; init current track
               bne       doREADTOC1      ; if we're not playing
               sta       zpCURTRACK

doREADTOC1     lda       bufferPTR+2
               sta       zpFIRSTTRACK
               sta       scsiPLAY+4
               lda       bufferPTR+3
               sta       zpLASTTRACK
               sta       scsiPLAY+7
               rts

*----------------------------
* MOVE TO PREVIOUS TRACK
*----------------------------

doREWIND       lda       fgPLAY
               bne       doREWIND1
               rts

doREWIND1      jsr       doGETSTATUS

               cmp       zpFIRSTTRACK    ; on first track?
               bne       doREWIND2
               rts                       ; do nothing then

doREWIND2      sec
               sbc       #1

doREWFF        sta       scsiPLAY+4
               sta       zpCURTRACK
               jmp       doPLAYALL

*----------------------------
* MOVE TO NEXT TRACK
*----------------------------

doFASTFORWARD
               lda       fgPLAY          ; only while playing
               bne       doFAST1
               rts

doFAST1        jsr       doGETSTATUS

               cmp       zpLASTTRACK     ; on first track?
               bne       doFAST2
               rts                       ; do nothing then

doFAST2        clc                       ; move to next track
               adc       #1
               jmp       doREWFF

*----------------------------
* INTERNAL ROUTINES
*----------------------------

*----------------------------
* EXECUTE A COMMAND
*----------------------------

callME         sta       callHS+3        ; the command
               sty       callLOOP+1
               stx       callLOOP+2

               ldx       #10-1           ; copy the command data
callLOOP       lda       $bdbd,x
               sta       theCOMMAND,x
               dex
               bpl       callLOOP        ; and goes below...

*----------------------------
*
*----------------------------

callHS         jsr       $c710
               dfb       spCONTROL       ; command
               da        spCOMMAND
               sta       zpERRORCODE
               rts

spCOMMAND      dfb       $03
               dfb       $01
               da        ctlLIST
               dfb       $2b             ; generic SCSI call

ctlLIST        dw        $0019           ; parameter.length
               adrl      theCOMMAND      ; CDB pointer
               adrl      DCMOVE          ; DCMove.pointer
               ds        4               ; request sense pointer
               ds        1               ; reserved
               ds        1               ; SCSI.status
               ds        1               ; command.count
               ds        4               ; tranfer.count
               ds        1               ; DMA.mode
               ds        4               ; reserved

DCMOVE         adrl      bufferPTR       ; return buffer
               adrl      bufferLEN       ; transfer length
               ds        4               ; Offset
               ds        4               ; Save pointer

theCOMMAND     ds        16              ; room for a SCSI command
bufferPTR      ds        bufferLEN       ; the return buffer

*--- My variables

fgINSERT       ds        1
fgPAUSE        ds        1
fgPLAY         ds        1

*--- The commands

scsiSTOP       hex       1b,00,00,00,00,00
scsiREADY      hex       1b,00,00,00,01,00
scsiEJECT      hex       1b,00,00,00,02,00
scsiINSERT     hex       1b,00,00,00,03,00
scsiSTATUS     hex       42,00,40,00,00,00,00,04,00,00
scsiTOC        hex       43,02,00,00,00,00,00,04,00,00
scsiPLAY       hex       48,00,00,00,01,00,00,99,00,00
scsiPAUSE      hex       4b,00,00,00,00,00,00,00,00,00
scsiRESUME     hex       4b,00,00,00,00,00,00,00,01,00


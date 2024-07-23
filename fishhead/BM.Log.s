*----------------------------------------
* BatchMan : Log
*----------------------------------------

tePASCAL = $0000
teC = $0001
teC1 = $0002

*--------------

meLOG lda optVDOLOG ; we don't log info
 bne meLOG0
 rts

meLOG0 lda wiLOG
 ora wiLOG+2
 beq meLOG1

 PushLong wiLOG
 _SelectWindow

 bra meLOG2

meLOG1 pha
 pha
 PushLong #0
 PushLong #wLOG
 PushLong #PAINTLOG
 PushLong #0
 PushWord #refIsResource
 PushLong #wLOG
 PushWord #$800e
 _NewWindow2
 PullLong wiLOG

 PushLong wiLOG
 _ShowWindow

meLOG2 = * ; now clear selection
   ; after the Welcome message
 PushLong #0
 PushLong #-1
 PushLong #0
 _TESetSelection

 PushLong #0
 _TEClear
 rts

*--------------

saveLOG = *
 lda optVDOLOG ; no log
 bne saveLOG0
 rts
saveLOG0 lda optVSAVELOG ; don't save log
 bne saveLOG1
 rts
saveLOG1 jsr getLOG

* set pointer to TE text

 PushLong haLOG
 phd
 tsc
 tcd
 lda [3]
 sta logWRITE+$04
 ldy #2
 lda [3],y
 sta logWRITE+$06
 pld
 pla
 pla

* set length of logfile

 PushLong #0
 PushLong haLOG
 _GetHandleSize
 pla
 sta logCREATE+$10
 sta logWRITE+$08
 pla
 sta logCREATE+$12
 sta logWRITE+$0a

*--- Where shall we write to?

* V1.1
 ldx #^pfxSAVE2 ; no, volumename.log
 ldy #pfxSAVE2

 lda optVBATCH ; are we in batch mode?
 beq saveLOG5

 ldx #^logFILE ; yes, BatchMan.log
 ldy #logFILE

saveLOG5 sty logCREATE+2
 sty logOPEN+4
 stx logCREATE+4
 stx logOPEN+6

*--- Move to end of file if log exists

 jsl proDOS
 dw $2001
 adrl logCREATE
 bcc saveLOG6 ; no error

* V1.1
* cmp #$40 ; invalid file name
* bne saveLOG6
*
* If not in batch mode, log filename may
* be too long, try then with BatchMan.log
*
* lda optVBATCH ; are we in batch mode?
* bne saveLOG6 ; Yes, do not retry

 ldx #^logFILE ; yes, BatchMan.log
 ldy #logFILE

 sty logCREATE+2
 sty logOPEN+4
 stx logCREATE+4
 stx logOPEN+6

 jsl proDOS
 dw $2001
 adrl logCREATE

* Hope, it worked!

saveLOG6 jsl proDOS
 dw $2010
 adrl logOPEN

 lda logOPEN+2
 sta logSETMARK+2
 sta logWRITE+2
 sta logCLOSE+2

*--- Move to the end of file if necessary

 lda logOPENeof
 sta logSETMARK+6
 lda logOPENeof+2
 sta logSETMARK+8

 jsl proDOS
 dw $2016
 adrl logSETMARK

*---

 jsl proDOS
 dw $2013
 adrl logWRITE

 jsl proDOS
 dw $2014
 adrl logCLOSE
 rts

*---

logCREATE dw 6 ; 00
 adrl pfxSAVE2 ; 02 pathname
 dw $c3 ; 06 access
 dw $04 ; 08 fileType
 ds 4 ; 0A auxType
 dw $01 ; 0E storageType
 ds 4 ; 10 eof

logOPEN dw 12 ; 00
 ds 2 ; 02 refNum
 adrl pfxSAVE2 ; 04 pathname
 dw 2 ; 08 write
 dw 0 ; 0A data fork
 ds 2 ; 0C access
 ds 2 ; 0E fileType
 ds 4 ; 10 auxType
 ds 2 ; 14 storageType
 ds 8 ; 16 createTime
 ds 8 ;    modifyTime
 ds 4 ;    optionList
logOPENeof ds 4 ;    eof

logSETMARK dw 3 ; 00
 ds 2 ; refNum
 dw 0 ; base
 ds 4 ; displacement

logWRITE dw 4 ; 00
 ds 2 ; 02 refNum
 ds 4 ; 04 dataBuffer
 ds 4 ; 08 requestCount
 ds 4 ; 0C transferCount

logCLOSE dw 1 ; 00
 ds 2 ; 02 refNum

fgNOLOG ds 2 ; 0: log file does not exist
; 1: log file already exists

logFILE strl '8:Fishhead.log'

*--------------

getLOG = *

 PushLong #0
 PushWord #%00000000_00011101
 PushLong #haLOG
 PushLong #0
 PushWord #3
 PushLong #0
 PushLong #0
 _TEGetText
 PullLong lenLOG

 PushLong haLOG
 _HLock
 rts

*--------------

disposeLOG = *

 lda haLOG
 ora haLOG+2
 beq disposeLOG1

 PushLong haLOG
 _HUnlock
 PushLong haLOG
 _DisposeHandle
disposeLOG1 rts

*--------------

closeLOG = *

 lda wiLOG
 ora wiLOG+2
 beq closeLOG1

 PushLong wiLOG
 _CloseWindow
closeLOG1 rts

*--------------

doLOG = *

 pha

* do we log?
 lda optVDOLOG
 bne doLOGok

* no, we don't
 pla
 rts

* yes, we do (A is already pushed onto the stack)
doLOGok phx
 phy

 PushLong #-1
 PushLong #-1
 PushLong #0
 _TESetSelection

 lda #0
 pha  ; l
 pha
 pha  ; w
 pha  ; l
 pha
 pha  ; l
 pha
 _TEInsert
 rts

*--------------

PAINTLOG PushLong wiLOG
 _DrawControls
 rtl

*--------------

wiLOG ds 4

haLOG ds 4
lenLOG ds 4

*--------------

strSEP str ':'
strTAB str 09
strCR str 0d
strSPC str ' '
strCOMMA str ','

strSPROCESS str 'Process started on '
strNBFILE str ' files copied - '
strUCANCEL str 'Cancelled by User'
strBCANCEL str 'Cancelled by Fishhead'
strSUCCESS str 'Success'
strCONCERN str 'With concerns'

*strOK str '[OK]'
*strKO str '[KO]'

* Just the GS/OS error
strPROerr asc '$00'
 ds 2 ; end if with 0

* Just to get time
strTIME ds 20 ; a 20-byte buffer
 ds 2 ; end it with 0

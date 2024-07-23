*----------------------------------------
* BatchMan : RECURSIVE FILE COPY
*----------------------------------------

stdACCESS = $c3
maxSUFFIX = 100 ; can't have more than 99 suffixes
strFROM = $70
strTO = strFROM+2

*----------------------------

doFC = *

 stz errCANCEL ; not cancelled by user
 stz proWERR ; no error on write device

* Wait for device
 jsr GSOSwaitOPEN
 bcs doFCend

* Get the source volume name
* devicename is already set
 jsr GSOSgetVOLopen
 bcs doFCend ; He! I can't recognize the File System

* Copy the source volume name
* to pfxOPEN and set it
 ldx #volNAMEopen
 ldy #pfxOPEN2
 jsr copySTR
 jsr GSOSsetPFXopen

* Compare open/save pathnames
 jsr GSOScomparePATH
 bcc doFC1

 lda #-1 ; return with error
 rts

* Display log if necessary
doFC1 jsr meLOG ; open log window

 jsr GSOSendSession

* Save prefix is already defined

* v1.0b7
 jsr fcSPROCESS ; beginning of process log
 jsr workIT ; recursive copy
 jsr fcPROCESS ; end of process log
 jsr fcSAVELOG ; save log if necessary

 jsr GSOSbeginSession

* Check if the source device can be ejected
* If not, we stop now
 jsr GSOScheckejectOPEN
 bcs doFCend

* Eject source medium
 jsr GSOSejectOPEN
 bcs doFCend ; we cannot eject the boot device
   ; or we pressed Cancel
 lda errCANCEL ; user has cancelled, stop
 bne doFCend

 lda optVBATCH ; asked for batch mode?
 bne doFC

doFCend lda #0 ; end of mode
 rts

*----------------------------
*
*----------------------------

workIT stz proERR
 stz errBP

doPATH jsl proDOS
 dw $2010 ; Open
 adrl proOPEN
 bcc doPATH2
 rts

* Create the main destination folder
* and set the destination path

doPATH2 jsr makeVOLUME
 bcs doCLOSE

 jsr showPATH
 jsr cfLOG

 lda #1 ; consider we have 1 file
 sta nbFILES

 jsr folderIT ; this is a folder

*----------------------------

doCLOSE lda proOPEN+2 ; end of loop
 sta proCLOSE+2

 jsl proDOS
 dw $2014 ; Close
 adrl proCLOSE

* Skip if we asked for a cancel
* lda errCANCEL
* bne doCLOSE1

* We are done in the loop
* We pop both prefixes
 jsr GSOSgetPFXopen
 jsr GSOSgetPFXsave
 jsr cfSETFINFO

 jsr GSOSpopPFXopen
 jsr GSOSpopPFXsave

doCLOSE1 rts

*----------------------------

fcSAVELOG lda optDOLOG ; we log entries?
 bne fcSAVELOG1
 rts

fcSAVELOG1 lda optVSAVELOG ;
 bne fcSAVELOG2
 rts

fcSAVELOG2 jsr GSOSgetPFXsave

 sep #$20 ; Find the next :
 ldx pfxSAVE2
 phx  ; save current length
]lp lda pfxSAVE3,x
 cmp #':'
 beq fcSAVELOG7
 inx
 bra ]lp

fcSAVELOG7 ldy #0 ; Append .log
]lp lda fcSLstr,y
 beq fcSAVELOG9
 sta pfxSAVE3,x
 iny
 inx
 bra ]lp

fcSAVELOG9 stx pfxSAVE2 ; Set the new length

 rep #$20

 jsr saveLOG ; Save the log

 plx
 stx pfxSAVE2 ; probably useful for next disk :-)
 rts

*-----------

fcSLstr asc '.log'00

*----------------------------

fcSPROCESS lda optVDOLOG
 bne fcSPROCESS0
 rts

fcSPROCESS0 lda #teC1 ; volume name
 ldx #^volNAMEopen
 ldy #volNAMEopen
 jsr doLOG

 lda #tePASCAL ; comma
 ldx #^strCOMMA
 ldy #strCOMMA
 jsr doLOG

*-----------

 ldx #^strSPROCESS ; start process
 ldy #strSPROCESS
 lda #tePASCAL
 jsr doLOG

*---

 PushLong #strTIME
 _ReadAsciiTime

 sep #$20 ; now clear bit 7
 ldx #20-1
]lp lda strTIME,x
 and #$7f
 sta strTIME,x
 dex
 bpl ]lp
 rep #$20

 ldx #^strTIME ; display time
 ldy #strTIME
 lda #teC
 jsr doLOG

*-----------

 lda #tePASCAL ; comma
 ldx #^strCOMMA
 ldy #strCOMMA
 jsr doLOG

 ldx #^strCR ; return
 ldy #strCR
 lda #tePASCAL
 jsr doLOG

 rts

*----------------------------

fcPROCESS lda optVDOLOG
 bne fcPROCESS0
 rts

fcPROCESS0 lda #teC1 ; volume name
 ldx #^volNAMEopen
 ldy #volNAMEopen
 jsr doLOG

 lda #tePASCAL ; comma
 ldx #^strCOMMA
 ldy #strCOMMA
 jsr doLOG

*-----------

 PushWord nbFILES
 PushLong #strNBFILES
 PushWord #5
 PushWord #0
 _Int2Dec

 ldx #^strNBFILES ; nb files
 ldy #strNBFILES
 lda #teC
 jsr doLOG

 ldx #^strNBFILE ; nb files string
 ldy #strNBFILE
 lda #tePASCAL
 jsr doLOG

*-----------

 PushLong #strTIME
 _ReadAsciiTime

 sep #$20 ; now clear bit 7
 ldx #20-1
]lp lda strTIME,x
 and #$7f
 sta strTIME,x
 dex
 bpl ]lp
 rep #$20

 ldx #^strTIME ; display time
 ldy #strTIME
 lda #teC
 jsr doLOG

 lda #tePASCAL ; comma
 ldx #^strCOMMA
 ldy #strCOMMA
 jsr doLOG

*-----------

* By default, it is a success
 ldx #^strSUCCESS
 ldy #strSUCCESS

* Unless we had a failure
 lda errBP
 beq workIT80

 ldx #^strCONCERN
 ldy #strCONCERN
* bra workIT90

* Or the user cancelled it
workIT80 lda errCANCEL
 beq workIT90

 ldx #^strUCANCEL
 ldy #strUCANCEL

 lda proWERR ; was it a write device error?
 beq workIT90

 ldx #^strBCANCEL ; BatchMan cancelled!
 ldy #strBCANCEL

workIT90 lda #tePASCAL
 jsr doLOG

*--- Add a trailing CR in batch mode...

 lda optVBATCH
 beq workIT99

 ldx #^strCR
 ldy #strCR
 lda #tePASCAL
 jsr doLOG

workIT99 rts

*-----------

strNBFILES asc '00000'00

*----------------------------
* copySTR
*
* Copy from a class 1 string
* to a class 1 string buffer
*----------------------------

copySTR = *

 stx strFROM
 sty strTO

 lda (strFROM)
 tay
]lp lda (strFROM),y
 sta (strTO),y
 dey
 bpl ]lp
 rts

*----------------------------
* copyPFXsave
*
* Copy a file name to
* to the destination prefix
*----------------------------

copyPFXsave = *

 sep #$20

 ldx #0 ; from volume name to file name
]lp lda gsosPATH2+2,x
 sta pfxSAVE3,x
 sta pathSAVE2,x
 inx
 cpx gsosPATH2
 bne ]lp
 stx pfxSAVE2
 inx
 inx
 stx pathSAVE

 rep #$20
 rts

*----------------------------
* copyPFXopen
*
* Copy the current path
* to the source prefix
*----------------------------

copyPFXopen = *

 sep #$20

 ldx #0 ; from volume name to file name
]lp lda gsosPATH2+2,x
 sta pfxOPEN3,x
 sta pathOPEN2,x
 inx
 cpx gsosPATH2
 bne ]lp
 stx pfxOPEN2
 inx
 inx
 stx pathOPEN

 rep #$20
 rts

*----------------------------
* makeVOLUME
*
* Create the main
* destination folder
*----------------------------

makeVOLUME = *

 ldx #0 ; from volume name to file name
]lp lda volNAMEopen2+1,x
 sta pathSAVE2,x
 inx
 cpx volNAMEopen
 bne ]lp
 inx
 stx pathSAVE

* Create folder and handle error
 jsr createFOLDER
 bcs makeVOLUME1

 ldx #0
]lp lda pathSAVE2,x
 sta pfxSAVE3,x
 inx
 cpx pathSAVE
 bne ]lp
 dex
 dex
 stx pfxSAVE2

 jsr GSOSsetPFXsave

makeVOLUME1 rts

*----------------------------
* makeFOLDER
*
* Create a destination
* folder
*----------------------------

makeFOLDER = *

 jsr copyPFXsave
 jsr createFOLDER
 jsr GSOSsetPFXsave
 rts

*----------------------------
* createFOLDER
*
* Create a subfolder on the
* destination volume
*----------------------------

createFOLDER = *

* access
* lda proOPEN+$0c
 lda #stdACCESS ; AVU
 sta proCRsave+$06
* sta proSIsave+$06

* fileType
 lda proOPEN+$0e
 sta proCRsave+$08
* sta proSIsave+$08

* auxType
 lda proOPEN+$10
 sta proCRsave+$0a
* sta proSIsave+$0a
 lda proOPEN+$12
 sta proCRsave+$0c
* sta proSIsave+$0c

* storageType
 lda #$000D
 sta proCRsave+$0e

* eof
 stz proCRsave+$10
 stz proCRsave+$12

* resourceEof
 stz proCRsave+$14
 stz proCRsave+$16

 jsr nameFOLDER
 rts

*----------------------------
* nameFOLDER
*
* Create a unique folder on
* the destination volume
*----------------------------

nameFOLDER = *

 stz tempSUFFIX

]lp jsl proDOS ; create the main folder
 dw $2001
 adrl proCRsave
 bcc nameFOLDER2 ; no error

 cmp #$47 ; dupPathname
 beq nameFOLDER4

* If we have any error but duplicate
* then we have a problem with the destination
* device, we must cancel the copy

nameFOLDER1 sta proWERR

 lda #1
 sta errCANCEL
 sec

nameFOLDER2 rts

*---

nameFOLDER4 lda tempSUFFIX
 bne nameFOLDER6

 lda pathSAVE ; first pass
 clc  ; add 2 to main folder name
 adc #2
 sta pathSAVE

nameFOLDER6 PushWord tempSUFFIX
 PushLong #strSUFFIX
 PushWord #2
 PushWord #0
 _Int2Dec

 inc tempSUFFIX

* We limit to 100 suffixes

 lda tempSUFFIX
 cmp #maxSUFFIX
 bcs nameFOLDER1

 ldx pathSAVE
 lda strSUFFIX
 ora #'00'
 sta pathSAVE,x
 bra ]lp

tempSUFFIX ds 2
strSUFFIX asc '00'

*----------------------------
* createFILE
*
* Create a file on the
* destination volume
*----------------------------

createFILE = *

 jsl proDOS
 dw $2006
 adrl proGIopen

*---

* access
 lda #$c3 ; most common
 sta proCRsave+$6

* fileType
 lda proGIopen+$8
 sta proCRsave+$8

* auxType
 lda proGIopen+$a
 sta proCRsave+$a
 lda proGIopen+$c
 sta proCRsave+$c

* storageType
 lda proGIopen+$e
 sta proCRsave+$e

* eof
 lda proGIopen+$24
 sta proCRsave+$10
 lda proGIopen+$26
 sta proCRsave+$12

* resourceEOF
 lda proGIopen+$2c
 sta proCRsave+$14
 lda proGIopen+$2e
 sta proCRsave+$16

 jsl proDOS
 dw $2001
 adrl proCRsave
 rts

*----------------------------
*
*----------------------------

folderIT LDA #$0001 ; Set displacement
 STA proGETDIR+8
 LDA proOPEN+2
 STA proGETDIR+2

]lp jsl proDOS
 dw $201C ; GetDirEntry
 adrl proGETDIR
 bcs folderIT5

 jsr checkCANCEL ; check cancel mode...
 bcs folderIT2 ; skip all if yes

 inc nbFILES ; one more file

 lda proGETDIR+16
 cmp #$000F ; Folder
 beq folderIT10

 jsr copyFILE

folderIT2 inc proGETDIR+8 ; next displacement
 bra ]lp

folderIT5 sta proERR
 rts

*----------------------------
* handle folder

folderIT10 lda proOPEN+2 ; save ID
 pha
 lda proGETDIR+8 ; save displacement
 pha

* Get the subfolder name
* and set the new source prefix
* jsr GSOSgetPFXopen
 jsr copyPFXopen
 jsr GSOSsetPFXopen
 jsr GSOSgetPFXopen

* Create a destination subfolder
* and set the destination path
 jsr makeFOLDER
 jsr showPATH
 jsr cfLOG

* v1.0b6
 jsl proDOS ; Open
 dw $2010
 adrl proOPEN
 bcc folderIT19

 jsr GSOSrestartSession

 jsl proDOS
 dw $2010 ; Open
 adrl proOPEN
 bcs folderIT20

*

folderIT19 jsr folderIT ; Recursivity
 jsr doCLOSE

folderIT20 pla
 sta proGETDIR+8
 pla
 sta proOPEN+2
 sta proGETDIR+2

 bra folderIT2 ; and loop back

*----------------------------
* CHECK CANCEL
*----------------------------

escKEYCODE = $1b ; was $9b :-(

checkCANCEL = *
 lda errCANCEL ; already cancelled?
 beq checkC01
 sec  ; yes
 rts

checkC01 PushWord #0 ; space for result
 PushWord #%00000000_00101000 ; keyDownMask
 PushLong #checkEVENT
 _GetNextEvent
 pla
 beq checkC02

 lda checkEVENT
 cmp #3 ; key down event
 bcc checkC02
 cmp #5 ; auto key event
 bne checkC02

 lda checkEVENT+2 ; ESC pressed?
 cmp #escKEYCODE
 bne checkC02

 _SysBeep

 rep #$20 ; yes
 lda #1
 sta errCANCEL
 sec
 rts

checkC02 rep #$20 ; no
 clc
 rts

*-----------

checkEVENT ds 2 ; what
 ds 4 ; message
 ds 4 ; when
 ds 4 ; where
 ds 2 ; modifiers

*----------------------------
* COPY FILE
*----------------------------

copyFILE = *

 stz errFC

 jsr copyPFXopen
 jsr copyPFXsave
 jsr showPATH
 jsr createFILE

* now, check data fork
 lda proCRsave+$10
 ora proCRsave+$12
 beq copyFILE1

 jsr prepDATAFORK
 jsr copyFORK
 jsr cfCLOSE

* now, check resource fork
copyFILE1 lda proCRsave+$14
 ora proCRsave+$16
 beq copyFILE2

 jsr prepRESFORK
 jsr copyFORK

* copy ended
copyFILE2 jsr cfCLOSE ; SETINFO
 jsr cfSETINFO ; CLOSE
 jsr cfLOG
 rts

*----------------------------

prepDATAFORK = *
 lda proCRsave+$10
 sta theEOF
 lda proCRsave+$12
 sta theEOF+2

 lda #0 ; open data fork
 sta proOPENS+$a
 sta proOPEND+$a
 rts

*----------------------------

prepRESFORK = *
 lda proCRsave+$14
 sta theEOF
 lda proCRsave+$16
 sta theEOF+2

 lda #1 ; open resource fork
 sta proOPENS+$a
 sta proOPEND+$a
 rts

*----------------------------

copyFORK = *
 stz theMARK
 stz theMARK+2

 jsr cfOPEN

]lp jsr checkCANCEL
 bcs copyFORK1

 jsr cfSETMARK ; kfest.mov
 bcs copyFORK0

* jsr debug

 jsr cfREAD256
 jsr cfWRITE256
 bcs copyFORK1

 bra ]lp

copyFORK0 rts

copyFORK1 lda #1
 sta errFC
 rts

*---
*
*debug = *
*
* jsr debugCR
*
* lda theMARK+2
* ldx #0
* jsr debugIT
* lda theMARK+1
* ldx #2
* jsr debugIT
* lda theMARK
* ldx #4
* jsr debugIT
* jsr debugHEX
*
* jsr debugCOMMA
*
* lda theEOF+2
* ldx #0
* jsr debugIT
* lda theEOF+1
* ldx #2
* jsr debugIT
* lda theEOF
* ldx #4
* jsr debugIT
* jsr debugHEX
*
* jsr debugCOMMA
*
* rts
*
*debugIT pha
* lsr
* lsr
* lsr
* lsr
* jsr romFDDA
* sep #$20
* sta debugSTR,x
* rep #$20
* inx
* pla
* jsr romFDDA
* sep #$20
* sta debugSTR,x
* rep #$20
* rts
*
*debugCR ldx #^strCR
* ldy #strCR
* lda #tePASCAL
* jsr doLOG
* rts
*
*debugCOMMA ldx #^strCOMMA
* ldy #strCOMMA
* lda #tePASCAL
* jsr doLOG
* rts
*
*debugHEX ldx #^debugSTR
* ldy #debugSTR
* lda #teC
* jsr doLOG
* rts
*
*debugSTR asc '000000'00

*----------------------------

cfOPEN jsl proDOS
 dw $2010
 adrl proOPENS
 bcc cfOPEN0

* v1.0b6
 jsr GSOSrestartSession

 jsl proDOS
 dw $2010
 adrl proOPENS
*

* get refNum for source file
cfOPEN0 lda proOPENS+2
 sta proSETMARK+2
 sta proREAD+2

* set data buffer
 lda #readBUFFER
 sta proREAD+4
 lda #^readBUFFER
 sta proREAD+6

* set request count
 lda #256
 sta proREAD+8
 stz proREAD+10

*---

 jsl proDOS
 dw $2010
 adrl proOPEND
 bcc cfOPEN1

* v1.0b6
 jsr GSOSrestartSession

 jsl proDOS
 dw $2010
 adrl proOPEND
*

* get refNum for destination file
cfOPEN1 lda proOPEND+2
 sta proWRITE+2

* set request count
 lda #256
 sta proWRITE+8
 stz proWRITE+10

 rts

*----------------------------

cfREAD256 jsl proDOS
 dw $2012
 adrl proREAD
 bcs cfREAD257

 ldx #readBUFFER
 ldy #^readBUFFER

cfREAD999 stx proWRITE+4
 sty proWRITE+6
 rts

cfREAD257 ldx errFC ; did we already have
 bne cfREAD258 ; an error?

 sta proERR ; no, then save GS/OS error

 lda #1 ; read-error [KO]
 sta errFC
 sta errBP

cfREAD258 ldx #errBUFFERt
 ldy #^errBUFFERt

* if source file is a text file,
* then copy 256 space chars
* only if we are copying the data fork,
* if we are copying a resource fork,
* force the binary replacement

 lda proOPENS+$a
 bne cfREAD259

 lda proGIopen+8
 cmp #$04 ; text file
 beq cfREAD999
 cmp #$50 ; text
 beq cfREAD999
 cmp #$b0 ; text
 beq cfREAD999

* otherwise, copy 256 zeroes

cfREAD259 ldx #errBUFFERb
 ldy #^errBUFFERb
 bra cfREAD999

*----------------------------

cfWRITE256 = *

* firstly, determine how many bytes were read
* by default, we read/write 256 bytes

 ldx #256

 lda proREAD+$c
 beq cfWRITE260 ; none, I/O error then
 cmp #256
 beq cfWRITE260 ; OK, no read error

 tax  ; assume number of bytes to write

* secondly, write them

cfWRITE260 stx proWRITE+$8

 jsl proDOS
 dw $2013
 adrl proWRITE
 bcc cfWRITE269

* v1.0b6
 jsr GSOSrestartSession
 cmp #$0054 ; memory error
 bne cfWRITE261

 jsl proDOS
 dw $2013
 adrl proWRITE
 bcc cfWRITE269

* check write error

cfWRITE261 sta proWERR

 lda #1 ; write-error [KO]
 sta errBP
 sta errCANCEL
 rts  ; carry is set

* check if EOF reached

cfWRITE269 lda theMARK ; next mark
 clc
 adc #256
 sta theMARK
 lda theMARK+2
 adc #0
 sta theMARK+2
 rts

*----------------------------

cfSETMARK lda theMARK
 sta proSETMARK+6
 lda theMARK+2
 sta proSETMARK+8

 jsl proDOS
 dw $2016
 adrl proSETMARK

 cmp #$4d ; position out of range
 bne cfSETMARK2

cfSETMARK1 sec
 rts

cfSETMARK2 lda theMARK ; now compare EOF with MARK
 cmp theEOF
 bne cfSETMARK3 ; different, OK
 lda theMARK+2
 cmp theEOF+2
 beq cfSETMARK1 ; same, KO

cfSETMARK3 clc
 rts

*----------------------------

cfCLOSE lda proOPENS+2
 jsr cfCLOSE1
 lda proOPEND+2

cfCLOSE1 sta proCLOSE+2
 jsl proDOS
 dw $2014
 adrl proCLOSE
 rts

*----------------------------

cfSETINFO = *

 ldx #6
]lp lda proGIopen,x
 sta proSIsave,x
 inx
 inx
 cpx #$20
 bne ]lp

* v1.0b5
 jsr forceDATES

 jsl proDOS
 dw $2005 ; SetFileInfo call!!
 adrl proSIsave
 rts

*----------------------------

cfSETFINFO = *

 jsr GSOSgetPFXopen
 jsr GSOSgetPFXsave

 jsl proDOS
 dw $2006 ; GetFileInfo call!!
 adrl proGIpopen

 ldx #6
]lp lda proGIpopen,x
 sta proSIpsave,x
 inx
 inx
 cpx #$20
 bne ]lp

* v1.0b5
 jsr forcePDATES

 jsl proDOS
 dw $2005 ; SetFileInfo call!!
 adrl proSIpsave
 rts

*----------------------------
* v1.0b5
*
* forceDATES
*
* A request of S.W.
*
* Update the field dates
* if there is no date set
*
*----------------------------

forceDATES = *

* v1.0b6
 lda optVDATES
 bne fd0
 rts

fd0 lda proSIsave+$10
 ora proSIsave+$12
 ora proSIsave+$14
 ora proSIsave+$16
 sta fgCDT

 lda proSIsave+$18
 ora proSIsave+$1a
 ora proSIsave+$1c
 ora proSIsave+$1e
 sta fgMDT

*----------- We have the flags, what do we do now?
* if either one date is filled in, use it for the other
* if none are set, do nothing

 lda fgCDT
 beq fd2

* CDT ok

 lda fgMDT
 bne fd1 ; and not BEQ

* CDT ok and MDT ko
* move CDT to MDT

 lda proSIsave+$10
 sta proSIsave+$18
 lda proSIsave+$12
 sta proSIsave+$1a
 lda proSIsave+$14
 sta proSIsave+$1c
 lda proSIsave+$16
 sta proSIsave+$1e

fd1 rts ; CDT/MDT ok or CDT/MDT ko

*-----

* CDT ko

fd2 lda fgMDT
 beq fd1 ; no dates at all

* CDT ko and MDT ok
* move MDT to CDT

 lda proSIsave+$18
 sta proSIsave+$10
 lda proSIsave+$1a
 sta proSIsave+$12
 lda proSIsave+$1c
 sta proSIsave+$14
 lda proSIsave+$1e
 sta proSIsave+$16
 rts

*----------------------------

forcePDATES = *

* v1.0b6
 lda optVDATES
 bne fd00
 rts

fd00 lda proSIpsave+$10
 ora proSIpsave+$12
 ora proSIpsave+$14
 ora proSIpsave+$16
 sta fgCDT

 lda proSIpsave+$18
 ora proSIpsave+$1a
 ora proSIpsave+$1c
 ora proSIpsave+$1e
 sta fgMDT

*----------- We have the flags, what do we do now?
* if either one date is filled in, use it for the other
* if none are set, do nothing

 lda fgCDT
 beq fd20

* CDT ok

 lda fgMDT
 bne fd10 ; and not BEQ

* CDT ok and MDT ko
* move CDT to MDT

 lda proSIpsave+$10
 sta proSIpsave+$18
 lda proSIpsave+$12
 sta proSIpsave+$1a
 lda proSIpsave+$14
 sta proSIpsave+$1c
 lda proSIpsave+$16
 sta proSIpsave+$1e

fd10 rts ; CDT/MDT ok or CDT/MDT ko

*-----

* CDT ko

fd20 lda fgMDT
 beq fd10 ; no dates at all

* CDT ko and MDT ok
* move MDT to CDT

 lda proSIpsave+$18
 sta proSIpsave+$10
 lda proSIpsave+$1a
 sta proSIpsave+$12
 lda proSIpsave+$1c
 sta proSIpsave+$14
 lda proSIpsave+$1e
 sta proSIpsave+$16
 rts

*-----------

fgCDT ds 2 ; 0: we have no date
fgMDT ds 2 ; 1: we have  a date

*----------------------------

cfLOG lda optVDOLOG
 bne cfLOG1
 rts

cfLOG1 lda errFC
 bne cfLOG2

* No GS/OS error
 stz proERR

* We had a GS/OS error on the source volume
cfLOG2 lda proERR
 pha
 lsr
 lsr
 lsr
 lsr
 jsr romFDDA ; hack hack
 sta strPROerr+1
 pla
 jsr romFDDA ; hack hack
 sta strPROerr+2

 ldx #^strPROerr ; return/error code
 ldy #strPROerr
 lda #teC
 jsr doLOG

 lda #tePASCAL
 ldx #^strCR
 ldy #strCR
 jsr doLOG
 rts

*-----------

romFDDA and #$000f
 ora #$0030 ; '0'
 cmp #$003a ; '9'+1
 bcc romFDDB
 adc #$0006
romFDDB rts

*----------------------------

nbFILES ds 2

errFC ds 2
errBP ds 2
errCANCEL ds 2

theMARK ds 4
theEOF ds 4

proOPENS dw 4 ; 00 pCount
 ds 2 ; 02 refNum
 adrl pathOPEN ; 04 pathname
 dw 1 ; 06 requestAccess
 ds 2 ; 08 resourceNumber

proOPEND dw 4 ; 00 pCount
 ds 2 ; 02 refNum
 adrl pathSAVE ; 04 pathname
 dw 2 ; 06 requestAccess
 ds 2 ; 08 resourceNumber

readBUFFER ds 256
errBUFFERb ds 256,00
errBUFFERt ds 256,32

*----------------------------
* OTHER ROUTINES
*----------------------------

showPATH = *
 lda optVDOLOG ; save time, do not log
 bne showPATH0 ; if not necessary
 rts

showPATH0 jsr GSOSgetPFXopen
 jsr GSOSgetPFXsave

* original volume name
* ,
* destination path + filename
* ,
* <room for status>

 lda #teC1
 ldx #^volNAMEopen
 ldy #volNAMEopen
 jsr doLOG

 lda #tePASCAL ; return
 ldx #^strCOMMA
 ldy #strCOMMA
 jsr doLOG

 lda #teC1
 ldx #^pfxSAVE2
 ldy #pfxSAVE2
 jsr doLOG

 lda #teC1
 ldx #^gsosPATH2
 ldy #gsosPATH2
 jsr doLOG

 lda #tePASCAL ; return
 ldx #^strCOMMA
 ldy #strCOMMA
 jsr doLOG

 rts

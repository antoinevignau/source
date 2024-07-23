*
* BatchMan : GS/OS Module
*
* (c) 2011, Brutal Deluxe Software

GSOSversion jsl proDOS
 dw $202a
 adrl proVERS

 lda proVERS+2
 and #%01111111_11111111
 cmp #$0402
 rts

*----------------------------------------

GSOSgetPFXopen = *
 jsl proDOS
 dw $200a
 adrl pgetPFXopen
 rts

*-----------

GSOSsetPFXopen = *
 jsl proDOS
 dw $2009
 adrl psetPFXopen
 rts

*-----------

GSOSpopPFXopen = *
 jsr GSOSgetPFXopen

 sep #$20
 ldx pfxOPEN2
]lp dex
 cpx #1
 beq popPFXopen1
 lda pfxOPEN2+1,x
 cmp #':'
 bne ]lp

popPFXopen1 stx pfxOPEN2
 rep #$20

 jsr GSOSsetPFXopen
 rts

*----------------------------------------

GSOSgetPFXsave = *
 jsl proDOS
 dw $200a
 adrl pgetPFXsave
 rts

*-----------

GSOSsetPFXsave = *
 jsl proDOS
 dw $2009
 adrl psetPFXsave
 rts

*-----------

GSOSpopPFXsave = *
 jsr GSOSgetPFXsave

 sep #$20
 ldx pfxSAVE2
]lp dex
 cpx #1
 beq popPFXsave1
 lda pfxSAVE2+1,x
 cmp #':'
 bne ]lp

popPFXsave1 stx pfxSAVE2
 rep #$20

 jsr GSOSsetPFXsave
 rts

*----------------------------------------

GSOSgetVOLopen = *
 jsl proDOS
 dw $2008
 adrl proVOLopen

 cmp #$4a ; bad file format
 bne GSOSgvo1
 sec
 rts
GSOSgvo1 clc
 rts

*-----------

GSOSgetVOLsave = *
 jsl proDOS
 dw $2008
 adrl proVOLsave
 rts

*----------------------------------------

GSOSsetPATHopen = *
 jsl proDOS
 dw $2009
 adrl psetPATHopen
 rts

*-----------

GSOSsetPATHsave = *
 jsl proDOS
 dw $2009
 adrl psetPATHsave
 rts

*----------------------------------------

*GSOSgetName lda replyPTR+$10
* sta Debut
* lda replyPTR+$12
* sta Debut+2
*
* lda [Debut]
* clc
* adc #2
* sta proCRsave+2
* sta proDESTROY+2
* sta proSETINFO+2
* sta proOPEN+4
*
* ldy #2
* lda [Debut],y
* adc #0
* sta proCRsave+4
* sta proDESTROY+4
* sta proSETINFO+4
* sta proOPEN+6
* rts

*GSOSgetName lda #pathPTR1
* sta proCRsave+2
* sta proDESTROY+2
* sta proSETINFO+2
* sta proOPEN+4
*
* lda #^pathPTR1
* sta proCRsave+4
* sta proDESTROY+4
* sta proSETINFO+4
* sta proOPEN+6
*
* rts

*----------------------------------------
* v1.0b6 - All calls dealing with sessions

GSOSbeginSession = *

 jsl proDOS
 dw $201d
 adrl proBEGSESS
 rts

*-----------

GSOSendSession = *

 jsl proDOS
 dw $201e
 adrl proENDSESS
 rts

*-----------

GSOSsessionStatus = *

 jsl proDOS
 dw $201f
 adrl proSESSSTAT
 rts

*-----------

GSOSrestartSession = *

 php
 pha

 cmp #$54 ; memory error
 bne GSOSrese99

 stz proSESSSTAT+2

 jsr GSOSsessionStatus

 lda proSESSSTAT+2
 beq GSOSrese99

 jsr GSOSendSession
 jsr GSOSbeginSession

GSOSrese99 pla
 plp
 rts

*----------------------------------------

GSOSopen jsl proDOS
 dw $2010
 adrl proOPEN
 bcs GSOSopen1

 lda proOPEN+2
 sta proSETMARK+2
 sta proREAD+2
 sta proCLOSE+2

 lda proEOF
 sta proREAD+8
 lda proEOF+2
 sta proREAD+10

 clc
 rts
GSOSopen1 sta proERR
 sec
 rts

*----------------------------------------

GSOSsetread sty proREAD+4
 stx proREAD+6
 rts

GSOSread sty proREAD+8
 stx proREAD+10

 jsl proDOS
 dw $2012
 adrl proREAD
 rts

*----------------------------------------

GSOSsetwrite sty proWRITE+4
 stx proWRITE+6
 rts

GSOSwrite sty proWRITE+8
 stx proWRITE+10

 jsl proDOS
 dw $2013
 adrl proWRITE
 rts

*----------------------------------------

GSOSclose jsl proDOS
 dw $2014
 adrl proCLOSE
 rts

*----------------------------------------

GSOSappend sty proSETMARK+6
 stx proSETMARK+8

 jsl proDOS
 dw $2016
 adrl proSETMARK
 rts

*----------------------------------------

GSOScreate stx proCRsave+18
 sty proCRsave+16
 sta proCRsave+8
* sta proSETINFO+8

* jsl proDOS
* dw $2005
* adrl proSETINFO

 jsl proDOS
 dw $2002
 adrl proDESTROY

 jsl proDOS
 dw $2001
 adrl proCRsave
 bcs GSOSsave1

 jsl proDOS
 dw $2010
 adrl proOPEN
 bcs GSOSsave1

 lda proOPEN+2
 sta proSETMARK+2
 sta proWRITE+2
 sta proCLOSE+2

 clc
 rts
GSOSsave1 sta proERR
 sec
 rts

*----------------------------------------
* Check whether the device contains
* removable media, if not, set the carry

GSOScheckejectOPEN = *

* v1.0b3 - if MountIt disk image, do not eject the disk

 sep #$20
 ldx #0
]lp lda mountitSTR,x
 beq ceo1 ; same device name
 cmp devNAMEopen2,x
 bne ceo0 ; different device name
 inx
 bne ]lp

* v1.0b3 - end of code

ceo0 rep #$20
 lda proDIopen+8
 and #%00000000_00000100
 bne ceo2

ceo1 rep #$20 ; do not eject
 sec
 rts
ceo2 rep #$20 ; eject
 clc
 rts

mountitSTR asc '.DISKIMAGE'00

*----------------------------------------

GSOSejectOPEN = *

 lda proDIopen+2
 cmp #1 ; the boot device
 beq ejectOPENko

 sta proDCopen+2

 jsl proDOS
 dw $202E
 adrl proDCopen

* v1.0b4 - Eject 3"5 disks only
* and ask for others...

 lda proDIopen+$14
 cmp #$3 ; Apple 3"5 drive
 beq ejectOPENok

 PushWord #0 ; Eject and replace
 PushWord #5 ; flags
 PushLong #0
 PushLong #alertEJECT ; reference of alert
 _AlertWindow
 pla
 beq ejectOPENko

ejectOPENok clc
 rts
ejectOPENko sec
 rts

*----------------------------------------

proDCopen dw 5 ;
 ds 2 ; dev_num
 dw 2 ; control_code (eject medium)
 ds 4 ; control_list
 ds 4 ; request_count
 ds 4 ; transfer_count

*----------------------------------------

GSOSwaitOPEN = *

 lda proDIopen+2
 sta proDSopen+2

]lp jsl proDOS ; DeviceStatus
 dw $202D
 adrl proDSopen

 jsr checkCANCEL ; Escape pressed?
 bcs waitOPENko

 lda proDSLopen ; Disk in drive?
 and #%00000000_00010000
 beq ]lp ; waitOPENok

 clc
 rts
waitOPENko sec
 rts

*----------------------------------------
* Compare the open and destination prefixes
*
* Condition of error:
* - same string

GSOScomparePATH = *

 sep #$20

 ldx #0 ; first compare
]lp lda pfxOPEN3,x ; :RAM5
 cmp pfxSAVE3,x ; :RAM5:TOTO
 bne comparePATH7
 inx
 cpx pfxOPEN2
 bne ]lp

* Here, we have the same beginning
* Now, check the next char in destination
* is ':', if so, same volume

 lda pfxSAVE3,x ; :TOTO
 cmp #':'
 beq comparePATH9

* Last check, string lengths are the same

 ldx pfxOPEN2
 cpx pfxSAVE2
 beq comparePATH9

comparePATH7 rep #$20 ; different
 clc
 rts
comparePATH9 rep #$20 ; same
 sec
 rts

*----------------------------------------
* Check that the destination pathname is correct
* which means it exists
* and is of type FOLDER or VOLUME

GSOScheckPFXsave = *
 jsl proDOS
 dw $2006
 adrl pcheckPFXsave
 bcs checkPFXsave1

 lda pcheckPFXsave+8
 cmp #$000f
 beq checkPFXsave2
 cmp #$000d
 beq checkPFXsave2

checkPFXsave1 = *
 sec
 rts

checkPFXsave2 = *
 clc
 rts

*--------------
* Check destination device
*  devicename must be different
*  device must be write enabled
*
* Alert windows:
*  1- source = destination device
*  4- destination device is read-only
*
*checkDEVOUT = *
* stz proDIsave+2
*
* LOGO
* clc
* rts
*
*checkDOUT1 inc proDIsave+2
*
* jsl proDOS ; get device info
* dw $202C
* adrl proDIsave
* bcc checkDOUT2
* cmp #$0011 ; no more devices
* bne checkDOUT1 ; next device
* rts
*
* Get the volume name of the device
*checkDOUT2 jsr GSOSgetVOLsave
*
* Compare the name
* sep #$20
* ldx #1 ; skip the first :
*]lp lda volNAMEsave2,x
* cmp #':' ; end of destination volume name
* beq checkDOUT6 ; compare lengths
* cmp pfxSAVE3,x
*
*checkDOUT6 rep #$20
* dex
* cpx pfxSAVE2 ; same length?
* beq checkDOUT8 ; yes, we have our volume
*
* clc
* rts
*
*checkDOUT8 clc  ; check, it is read-only!
* rts


*----------------------------------------

proERR ds 2 ; GS/OS error on source
proWERR ds 2 ; GS/OS error on destination

*----------------------------------------
* v1.0b6 - Add session management

proBEGSESS dw 0 ; 0 pcount

proENDSESS dw 0 ; 0 pcount

proSESSSTAT dw 1 ; 0 pcount
 ds 2 ; 2 status

*----------------------------------------

proGETDIR dw 17 ;  0 pcount
 ds 2 ;  2 ref_num
 ds 2 ;  4 flags
 dw 0 ;  6 base
 dw 1 ;  8 displacement
 adrl gsosPATH ;  A name_buffer
 ds 2 ;  E entry_num
 ds 2 ; 10 file_type
 ds 4 ; 12 eof
 ds 4 ; 16 block_count
 ds 8 ; 1A create_td
 ds 8 ; 22 modify_td
 ds 2 ; 2A access
 ds 4 ; 2C aux_type
 ds 2 ; 30 file_sys_id
 ds 4 ; 32 option_list
 ds 4 ; 36 res_eof
 ds 4 ; 3A res_block_count

proCRopen dw 7 ; pcount
 adrl pathOPEN ; pathname
 dw $c3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; storage_type
 ds 4 ; eof
 ds 4 ; resource_eof

proCRsave dw 7 ; pcount
 adrl pathSAVE ; pathname
 dw $c3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; storage_type
 ds 4 ; eof
 ds 4 ; resource_eof

proDESTROY dw 1 ; pcount
 ds 4 ; pathname

proGIopen dw 12 ; pcount
 adrl pathOPEN ; pathname
 dw $c3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; reserved
 ds 8 ; create_td
 ds 8 ; modify_td
 ds 4 ; option_list
 ds 4 ; reserved
 ds 4 ; reserved
 ds 4 ; reserved
 ds 4 ; reserved

proGIpopen dw 12 ; pcount
 adrl pfxOPEN2 ; pathname
 dw $c3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; reserved
 ds 8 ; create_td
 ds 8 ; modify_td
 ds 4 ; option_list
 ds 4 ; reserved
 ds 4 ; reserved
 ds 4 ; reserved
 ds 4 ; reserved

proSIsave dw 7 ; pcount
 adrl pathSAVE ; pathname
 dw $c3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; reserved
 ds 8 ; create_td
 ds 8 ; modify_td

proSIpsave dw 7 ; pcount
 adrl pfxSAVE2 ; pathname
 dw $c3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; reserved
 ds 8 ; create_td
 ds 8 ; modify_td

proOPEN dw 15 ; pcount
 ds 2 ; ref_num
 adrl pfxOPEN2 ; pathname
 ds 2 ; request_access
 ds 2 ; resource_num
 ds 2 ; access
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; storage_type
 ds 8 ; create_td
 ds 8 ; modify_td
 ds 4 ; option_list
proEOF ds 4 ; eof
 ds 4 ; blocks_used
 ds 4 ; resource_eof
 ds 4 ; resource_blocks

proREAD dw 5 ; +00 pcount
 ds 2 ; +02 ref_num
 ds 4 ; +04 data_buffer
 ds 4 ; +08 request_count
 ds 4 ; +12 transfer_count
 dw 1 ; +16 cache_priority

proWRITE dw 5 ; pcount
 ds 2 ; ref_num
 ds 4 ; data_buffer
 ds 4 ; request_count
 ds 4 ; transfer_count
 dw 1 ; cache_priority

proCLOSE dw 1 ; pcount
 ds 2 ; ref_num

proSETMARK dw 3 ; pcount
 ds 2 ; ref_num
 ds 2 ; base
 ds 4 ; displacement

proQUIT dw 2 ; pcount
 ds 4 ; pathname
 ds 2 ; flags

proVERS dw 1 ; pcount
 ds 2 ; version

*-----------

proDRopen dw 6 ; Parms for DRead
 ds 2 ;  02 devNum
 ds 4 ;  04 buffer
 ds 4 ;  08 requestCount
 ds 4 ;  0C startingBlock
 ds 2 ;  10 blockSize
 ds 4 ;  12 transferCount

proDIopen dw 8 ; Parms for DInfo
 ds 2 ;  02 device num
 adrl devOPEN ;  04 device name
 ds 2 ;  08 characteristics
 ds 4 ;  0A total blocks
 ds 2 ;  0E slot
 ds 2 ;  10 unit
 ds 2 ;  12 version number
 ds 2 ;  14 device id

proDSopen dw 5 ; Parms for DStatus
 ds 2 ;  device num
 dw 0 ;  device status
 adrl proDSLopen ;  list
 adrl 6 ;  requestCount
 ds 4 ;  transferCount
proDSLopen ds 2 ; statusWord
 ds 4 ; numBlocks

proVOLopen dw 8 ; Parms for Volume
 adrl devNAMEopen ;  device name
 adrl volOPEN ;  volume name
 ds 4 ;  total blocks
 ds 4 ;  free blocks
 ds 2 ;  file_sys_id
 ds 2 ;  block_size
 ds 2 ;  characteristics
 ds 2 ;  deviceId

devOPEN dw $0023 ; buffer size
devNAMEopen db $00 ; length
devNAMEopen1 db $00
devNAMEopen2 ds $21 ; data

volOPEN dw $0023 ; buffer size
volNAMEopen db $00 ; length
volNAMEopen1 db $00
volNAMEopen2 ds $21 ; data

*-----------

proDIsave dw 8 ; Parms for DInfo
 ds 2 ;  device num
 adrl devSAVE ;  device name
 ds 2 ;  characteristics
 ds 4 ;  total blocks
 ds 2 ;  slot
 ds 2 ;  unit
 ds 2 ;  version number
 ds 2 ;  device id

proDSsave dw 5 ; Parms for DStatus
 ds 2 ;  device num
 dw 0 ;  device status
 adrl proDSLsave ;  list
 adrl 6 ;  requestCount
 ds 4 ;  transferCount
proDSLsave ds 2 ; statusWord
 ds 4 ; numBlocks

proVOLsave dw 8 ; Parms for Volume
 adrl devNAMEsave ;  device name
 adrl volSAVE ;  volume name
 ds 4 ;  total blocks
 ds 4 ;  free blocks
 ds 2 ;  file_sys_id
 ds 2 ;  block_size
 ds 2 ;  characteristics
 ds 2 ;  deviceId

devSAVE dw $0023 ; buffer size
devNAMEsave db $00 ; length
devNAMEsave1 db $00
devNAMEsave2 ds $21 ; data

volSAVE dw $0023 ; buffer size
volNAMEsave db $00 ; length
volNAMEsave1 db $00
volNAMEsave2 ds $21 ; data

*----------------------------------------

pgetPFXopen dw 2
 dw 9 ; 8
 adrl pfxOPEN

psetPFXopen dw 2
 dw 9 ; 8
 adrl pfxOPEN2

pfxOPEN dw 516
pfxOPEN2 ds 2
pfxOPEN3 ds 514

*-----------

pgetPFXsave dw 2
 dw 8
 adrl pfxSAVE

psetPFXsave dw 2
 dw 8
 adrl pfxSAVE2

pcheckPFXsave dw 3
 adrl pfxSAVE2
 ds 2
 ds 2

pfxSAVE dw 516
pfxSAVE2 ds 2
pfxSAVE3 ds 514

*-----------

gsosPATH dw 516
gsosPATH2 ds 1
gsosPATH3 ds 515

*-----------

psetPATHopen dw 2
 dw 9
 adrl pathOPEN

pathOPEN dw 516
pathOPEN1 asc '9:'
pathOPEN2 ds 514

*-----------

psetPATHsave dw 2
 dw 8
 adrl pathSAVE

pathSAVE dw 516
pathSAVE1 asc '8:'
pathSAVE2 ds 514

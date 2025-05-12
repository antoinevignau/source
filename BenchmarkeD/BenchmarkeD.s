*
* Time to read a file
*
* (c) 2013-2025, Brutal Deluxe Software
*
* v1.1: - take less text space to see all results on one page
*       - escape is also a key to cancel an action
*


               xc
               xc
               mx        %00

               rel
               dsk       BenchmarkeD.l
               lst       off

*----------

               use       4/Int.Macs
               use       4/Locator.Macs
               use       4/Mem.Macs
               use       4/Misc.Macs
               use       4/Text.Macs
               use       4/Util.Macs

Debut          =         $00
proDOS         =         $e100a8

*----------

               phk
               plb

               tdc
               sta       myDP

               _TLStartUp
               pha
               _MMStartUp
               pla
               sta       appID
               ora       #$0100
               sta       myID

               _MTStartUp
               _TextStartUp

               _IMStartUp

* Get 64KB and make it our read buffer

               pha
               pha
               PushLong  #$010000
               PushWord  myID
               PushWord  #%11000000_00011100
               PushLong  #0
               _NewHandle
               phd
               tsc
               tcd
               lda       [3]
               sta       proREAD+4            ; file buffer
               sta       proDREAD+4           ; block buffer
               ldy       #2
               lda       [3],y
               sta       proREAD+6
               sta       proDREAD+6
               pld
               ply
               sty       haBUFFER
               plx
               stx       haBUFFER+2

*----------

               jsl       proDOS
               dw        $202a
               adrl      proVERSION

               lda       proVERSION+2
               and       #$0fff
               cmp       #$0400               ; System 6.0.1
               bge       versionOK

               jmp       doQUIT               ; Ouch...

*----------

versionOK      =         *
               PushWord  #$00FF
               PushWord  #$0080
               _SetInGlobals
               PushWord  #$00FF
               PushWord  #$0080
               _SetOutGlobals
               PushWord  #$00FF
               PushWord  #$0080
               _SetErrGlobals

               PushWord  #0
               PushLong  #3
               _SetInputDevice
               PushWord  #0
               PushLong  #3
               _SetOutputDevice
               PushWord  #0
               PushLong  #3
               _SetErrorDevice

               PushWord  #0
               _InitTextDev
               PushWord  #1
               _InitTextDev
               PushWord  #2
               _InitTextDev

*----------

mainLOOP       =         *

               stz       fgCANCEL             ; reset cancel flag

               PushWord  #$0c                 ; home
               _WriteChar

               PushLong  #strINTRO
               _WriteCString

               PushWord  #0                   ; wait for key
               PushWord  #1                   ; echo char
               _ReadChar
               pla
               and       #$ff                 ; mask bits 15-8

               cmp       #"1"
               bne       noCREATE

               jmp       doFCREATE

noCREATE       cmp       #"2"
               bne       noFREAD

               jmp       doFREAD

noFREAD        cmp       #"3"
               bne       noBREAD3

               jmp       doBREADtrois

noBREAD3       cmp       #"4"
               bne       noBREAD4

               jmp       doBREADquatre

noBREAD4       cmp       #"q"
               beq       doQUIT
               cmp       #"Q"
               beq       doQUIT

               jmp       mainLOOP

*---------- End of routine, wait for key

mainNEXT       =         *
               PushLong  #strBYE
               _WriteCString

               PushWord  #0
               PushWord  #0
               _ReadChar
               pla
               jmp       mainLOOP

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT         =         *
               _IMShutDown
               _TextShutDown
               _MTShutDown

               PushWord  myID
               _DisposeAll

               PushWord  appID
               _MMShutDown

               _TLShutDown

               jsl       proDOS
               dw        $2029
               adrl      proQUIT

               brk       $bd

*----------------------------
* READ FILE SPEED
*----------------------------

doFREAD        =         *

* Read by chunks of 64KB

* 512K
               lda       #pathname1
               ldy       #512
               jsr       readFILE

               lda       fgCANCEL
               bne       doFREAD1

* 1M
               lda       #pathname2
               ldy       #1024
               jsr       readFILE

               lda       fgCANCEL
               bne       doFREAD1

* 2M
               lda       #pathname3
               ldy       #2048
               jsr       readFILE

               lda       fgCANCEL
               bne       doFREAD1

* 4M
               lda       #pathname4
               ldy       #4096
               jsr       readFILE

               lda       fgCANCEL
               bne       doFREAD1

* 8M
               lda       #pathname5
               ldy       #8192
               jsr       readFILE

               lda       fgCANCEL
               bne       doFREAD1

* 16M
               lda       #pathname6
               ldy       #16384
               jsr       readFILE

doFREAD1       jmp       mainNEXT

*----------

readFILE       =         *

               sta       proOPEN+4            ; file pointer
               sty       filesize             ; filesize in KB

*--- Check if file exists...

               jsl       proDOS               ; open
               dw        $2010
               adrl      proOPEN
               bcc       readFILE1

               rts

*---

readFILE1      =         *                    ; file exists
               PushLong  #strREAD
               _WriteCString

               ldx       proOPEN+6
               ldy       proOPEN+4
               jsr       printC1

               jsr       printDATEFROM

*----------

               lda       proOPEN+2
               sta       proREAD+2
               sta       proCLOSE+2

]lp            jsr       displayWHEEL
               jsr       checkCANCEL
               bcs       readFILE3

               jsl       proDOS               ; read
               dw        $2012
               adrl      proREAD
               bcc       ]lp                  ; until error

               cmp       #$27                 ; I/O error
               bne       readFILE2

*- Fatal I/O error!!

               PushLong  #strRERR
               _WriteCString

               rts

*- Continue

readFILE2      jsr       readFILE3            ; close
               jsr       printDATETO
               jsr       calcSPEED
               rts

readFILE3      jsl       proDOS               ; close
               dw        $2014
               adrl      proCLOSE
               rts

*----------------------------
* FILE CREATION
*----------------------------

* Write 8 banks of 64KB
* starting on bank 2

doFCREATE      =         *

               stz       fgWERR               ; reset flag

* 512K
               lda       #pathname1
               ldy       #512
               jsr       createFILE

               lda       fgWERR               ; why create a file
               ora       fgCANCEL
               bne       doFCREATE9           ; when there is no room?

* 1M
               lda       #pathname2
               ldy       #1024
               jsr       createFILE

               lda       fgWERR
               ora       fgCANCEL
               bne       doFCREATE9

* 2M
               lda       #pathname3
               ldy       #2048
               jsr       createFILE

               lda       fgWERR
               ora       fgCANCEL
               bne       doFCREATE9

* 4M
               lda       #pathname4
               ldy       #4096
               jsr       createFILE

               lda       fgWERR
               ora       fgCANCEL
               bne       doFCREATE9

* 8M
               lda       #pathname5
               ldy       #8192
               jsr       createFILE

               lda       fgWERR
               ora       fgCANCEL
               bne       doFCREATE9

* 16M
               lda       #pathname6
               ldy       #16384
               jsr       createFILE

doFCREATE9     jmp       mainNEXT

*----------

createFILE     =         *

* pathname
               sta       proDESTROY+2
               sta       proCREATE+2
               sta       proOPEN+4

* filesize in KB
               sty       filesize

* number of 64K blocks
               tya                            ; 512K
               xba                            ; divide by 64
               asl                            ; =
               asl                            ; xba * 4, see below...
* lsr  ; /2
* lsr  ; /4
* lsr  ; /8
* lsr ; /16
* lsr ; /32
* lsr ; /64
               sta       maxINDEX

*----------
* First, delete file
* Must not be taken into account
* in the file creation process

               jsl       proDOS               ; destroy
               dw        $2002
               adrl      proDESTROY           ; (hope the file is not locked)

*--- Check if we can create a file

               jsl       proDOS               ; create
               dw        $2001
               adrl      proCREATE
               bcc       createFILE1

               rts                            ; nope, volume full probably...

*---

createFILE1    =         *                    ; yes, we can
               PushLong  #strCREATE
               _WriteCString

               ldx       proOPEN+6
               ldy       proOPEN+4
               jsr       printC1

               jsr       printDATEFROM

*---

               jsl       proDOS
               dw        $2010
               adrl      proOPEN

               lda       proOPEN+2
               sta       proWRITE+2
               sta       proCLOSE+2

               stz       theINDEX

]lp            jsr       displayWHEEL
               jsr       checkCANCEL
               bcs       createFILE2

               jsl       proDOS
               dw        $2013
               adrl      proWRITE
               bcc       createFILE3

               cmp       #$0048
               bne       createFILE3

*--- Special case: we encountered a volume full error
* we will close the file and delete it...

               PushLong  #strWERR
               _WriteCString

               lda       #1                   ; set the error flag
               sta       fgWERR               ; for other file creations

createFILE2    =         *                    ; errrooorrrrrrrr

               jsl       proDOS               ; error #$48...
               dw        $2014
               adrl      proCLOSE

               jsl       proDOS
               dw        $2002
               adrl      proDESTROY

               rts

*---

createFILE3    =         *                    ; let's go on
               inc       theINDEX
               lda       theINDEX
               cmp       maxINDEX             ; 32*8*64 = 16M
               blt       ]lp

               jsl       proDOS
               dw        $2014
               adrl      proCLOSE

               jsr       printDATETO
               jsr       calcSPEED
               rts

*----------------------------
* READ BLOCK SPEED
*----------------------------

*----------------------------
* Entry point for menu 3

doBREADtrois   =         *

               lda       #1                   ; 64KB
               sta       proDREAD+$0a
               stz       proDREAD+$08

               lda       #128                 ; step is 128 blocks
               sta       blockSTEP
               bne       doBREADgo

*----------------------------
* Entry point for menu 4

doBREADquatre  =         *

               lda       #512                 ; 512 bytes
               sta       proDREAD+$08
               stz       proDREAD+$0a

               lda       #1                   ; step is 1 block
               sta       blockSTEP

*----------------------------
* Common routine

doBREADgo      =         *

*--- First, get our prefix

               jsl       proDOS               ; get our prefix
               dw        $200a
               adrl      proGETPREFIX

*--- Make it a volume name

               sep       #$20                 ; make a short one

               dec       pfxNAMEopen          ; remove final ':'

               ldx       #1                   ; find the first :
]lp            lda       pfxNAMEopen2,x
               cmp       #':'
               beq       doBREAD1             ; we'll get a volume name

               inx
               cpx       pfxNAMEopen
               bne       ]lp

doBREAD1       stx       pfxNAMEopen          ; save new length

               rep       #$20

*--- Browse the list of devices and get our devnum

               lda       #1                   ; start with device 1
               sta       proDINFO+2

buildVOL1      jsl       proDOS               ; get device info
               dw        $202C
               adrl      proDINFO
               bcc       buildVOL3

               cmp       #$0011               ; no more devices
               bne       buildVOL9

               jmp       mainNEXT             ; done and not found!

buildVOL9      inc       proDINFO+2
               bra       buildVOL1

*--- Check the block device

buildVOL3      lda       proDINFO+8
               and       #$0080               ; block device + read allowed
               beq       buildVOL9            ; not a block device

               jsl       proDOS
               dw        $2008
               adrl      proVOLUME
               bcs       buildVOL9            ; probably no disk in drive

*--- Is it a ProDOS file system (for v2 ;-))

               lda       proVOLUME+$12
               cmp       #1                   ; ProDOS
               bne       buildVOL9

               lda       proVOLUME+$14
               cmp       #512                 ; blockSize
               bne       buildVOL9

*--- Now compare

buildVOL4      lda       pfxNAMEopen          ; length...
               cmp       volNAMEopen
               bne       buildVOL9

               ldx       #0                   ; string
]lp            lda       pfxNAMEopen,x
               cmp       volNAMEopen,x
               bne       buildVOL9
               inx
               cpx       pfxNAMEopen
               bne       ]lp

*--- Here we have our volume, yeah!

               lda       proDINFO+2           ; Get the device ID
               sta       proDREAD+2

               stz       proDREAD+$0c         ; startingBlock
               stz       proDREAD+$0e

*--- Prepare speed calculation

               lda       proVOLUME+$0a
               lsr
               inc
               sta       filesize

*---

               PushLong  proVOLUME+$0a
               PushLong  #strNBBLOCKS
               PushWord  #5                   ; 65536 blocks max
               PushWord  #0
               _Long2Dec

*--- Now, shome some data

               PushLong  #strREAD
               _WriteCString

               PushLong  #strNBBLOCKS
               _WriteCString

               PushLong  #strBLOCKS
               _WriteCString

               jsr       printDATEFROM

*---

doBREAD2       jsr       displayWHEEL
               jsr       checkCANCEL
               bcs       doBREAD3

               jsl       proDOS
               dw        $202f                ; DRead
               adrl      proDREAD
               bcc       doBREAD4

               cmp       #$2d                 ; end of data
               beq       doBREAD9

               cmp       #$27                 ; I/O error
               bne       doBREAD4

*- Fatal I/O error!!

               PushLong  #strRERR
               _WriteCString

doBREAD3       jmp       mainNEXT

*- Continue

doBREAD4       lda       proDREAD+$0c
               clc
               adc       blockSTEP            ; 128b * 512b = 64K
               sta       proDREAD+$0c
               lda       proDREAD+$0e
               adc       #0
               sta       proDREAD+$0e

*- Did we reach the end?

               lda       proDREAD+$0c
               cmp       proDINFO+$0a
               bcc       doBREAD2
               lda       proDREAD+$0e
               cmp       proDINFO+$0c
               bcc       doBREAD2

*- Yes, we did!

doBREAD9       jsr       printDATETO
               jsr       calcSPEED

               jmp       mainNEXT

*--- Some data

blockSTEP      ds        2                    ; 128 or 1

strNBBLOCKS    ds        10                   ; 8+2 trailer 00

*----------------------------
* SOME MISC ROUTINES
*----------------------------

checkCANCEL	ldal	$bfff	; Did user cancel?
	bpl	check2	; no
	and	#$ff00	; yes, check keys?
	xba
	sep	#$20
	stal	$c010
	rep	#$20

	cmp	#$83	; CTRL-C
	beq	check1
	cmp	#$9b	; escape
	bne	check2

check1	PushLong	#strCANCEL	; we cancel
	_WriteCString

	inc	fgCANCEL
	sec
	rts
check2	clc		; we continue
	rts

*----------------------------

displayWHEEL   =         *                    ; Show there's something...

               sep       #$30
               inc       indexWHEEL
               lda       indexWHEEL
               and       #%0000_0011
               tax
               lda       strWHEEL,x
               stal      $010426              ; last char of text line 0
               rep       #$30
               rts

indexWHEEL     dfb       $ff
strWHEEL       asc       "|/-\"

*----------------------------

printC1        =         *                    ; Print a C1 string

* Pointer
               phx
               stx       Debut+2
               phy
               sty       Debut

* Offset (is 2 because STRL)
               PushWord  #2

* Length
               lda       [Debut]
               pha
               _TextWriteBlock
               rts

*----------------------------

printDATEFROM  =         *
               PushLong  #strFROM
               _WriteCString

               PushLong  #asciitime
               _ReadAsciiTime

               pha                            ; read time in hex format
               pha                            ; for a later conversion
               pha
               pha
               _ReadTimeHex
               pla
               sta       hextime1
               pla
               sta       hextime1+2
               pla
               sta       hextime1+4
               pla
               sta       hextime1+6

               PushLong  #asciitime
               PushWord  #0
               PushWord  #20
               _TextWriteBlock
               rts

*----------------------------

printDATETO    =         *
               PushLong  #strTO
               _WriteCString

               PushLong  #asciitime
               _ReadAsciiTime

               pha                            ; read time in hex format
               pha                            ; for a later conversion
               pha
               pha
               _ReadTimeHex
               pla
               sta       hextime2
               pla
               sta       hextime2+2
               pla
               sta       hextime2+4
               pla
               sta       hextime2+6

               PushLong  #asciitime
               PushWord  #0
               PushWord  #20
               _TextWriteBlock
               rts

*----------------------------

calcSPEED      =         *
               pha
               pha
               PushWord  #1                   ; from readtimehex to seconds
               PushLong  #0                   ; ignore
               PushLong  #hextime1
               _ConvSeconds
               PullLong  seconds1

               pha
               pha
               PushWord  #1                   ; from readtimehex to seconds
               PushLong  #0                   ; ignore
               PushLong  #hextime2
               _ConvSeconds
               PullLong  seconds2

* Now, get the time in seconds
               lda       seconds2             ; take low word only
               sec
               sbc       seconds1
               sta       seconds

* Operation in seconds, now
* calculate the speed
* filesize / speed = nb bytes per second

               pha
               pha
               pha
               pha
               PushLong  filesize
               PushLong  seconds
               _LongDivide
               PullLong  kbs                  ; quotient
               pla                            ; remainder
               pla

               lda       #'00'                ; clear string
               sta       strCALCKBS
               sta       strCALCKBS+2
                                              ; let a trailing x00
               PushWord  kbs
               PushLong  #strCALCKBS
               PushWord  #4
               PushWord  #0
               _Int2Dec

*----------

               PushLong  #strSPEED
               _WriteCString                  ; params set above

               PushLong  #strCALCKBS
               _WriteCString                  ; params set above

               PushLong  #strKBS
               _WriteCString                  ; params set above
               rts

*----------------------------
* DATA
*----------------------------

strINTRO       asc       'BenchmarkeD v1.1'0d
               asc       '(c) 2013-2025, Brutal Deluxe Software'0d0d
               asc       'File options'0d
               asc       ' 1- Write speed'0d
               asc       ' 2- Read speed'0d
               asc       'Block options'0d
               asc       ' 3- Read with 64K buffer'0d
               asc       ' 4- Read block-by-block'0d
               asc       0d
               asc       'Input your choice (Q to quit) >'00

strBYE         asc       0d0d'Thank you. Press a key to continue...'00

strREAD        asc       0d0d'Now reading... '00
strCREATE      asc       0d0d'Now creating... '00
strRERR        asc       0d'=== Read failed! ==='00
strWERR        asc       0d'=== Write failed! ==='00
strCANCEL      asc       0d'=== Cancelled! ==='00

*strFROM        asc       0d' Started at '00
*strTO          asc       0d'   Ended at '00

strFROM        asc       ', started at '00
strTO          asc       0d'Ended at '00
strSPEED       asc       ', for an average speed of '00
strKBS         asc       ' KB/s'00
strBLOCKS      asc       ' blocks'00

*----------

pathname1      strl      '1/File512K'
pathname2      strl      '1/File1M'
pathname3      strl      '1/File2M'
pathname4      strl      '1/File4M'
pathname5      strl      '1/File8M'
pathname6      strl      '1/File16M'

fgWERR         ds        2
fgCANCEL       ds        2

*----------

proCREATE      dw        6                    ; 00 pcount
               adrl      pathname1            ; 02 pathname
               dw        $c3                  ; 06 access
               dw        $06                  ; 08 fileType
               ds        4                    ; 0A auxType
               dw        $01                  ; 0E storageType
               ds        4                    ; 10 eof

proDESTROY     dw        1                    ; 00 pcount
               adrl      pathname1            ; 02 pathname

proOPEN        dw        15                   ; pcount
               ds        2                    ; ref_num
               adrl      pathname1            ; pathname
               ds        2                    ; request_access
               ds        2                    ; resource_num
               ds        2                    ; access
               ds        2                    ; file_type
               ds        4                    ; aux_type
               ds        2                    ; storage_type
               ds        8                    ; create_td
               ds        8                    ; modify_td
               ds        4                    ; option_list
               ds        4                    ; eof
               ds        4                    ; blocks_used
               ds        4                    ; resource_eof
               ds        4                    ; resource_blocks

proREAD        dw        5                    ; +00 pcount
               ds        2                    ; +02 ref_num
               ds        4                    ; +04 data_buffer
               adrl      $00010000            ; +08 request_count
               ds        4                    ; +12 transfer_count
               dw        1                    ; +16 cache_priority

proWRITE       dw        5                    ; pcount
               ds        2                    ; ref_num
               adrl      $00020000            ; data_buffer
               adrl      $00010000            ; request_count
               ds        4                    ; transfer_count
               dw        1                    ; cache_priority

proCLOSE       dw        1                    ; pcount
               ds        2                    ; ref_num

proQUIT        dw        2                    ; pcount
               ds        4                    ; pathname
               ds        2                    ; flags

proVERSION     dw        1                    ; pcount
               ds        2                    ; version

*----------

proGETPREFIX   dw        2                    ; Parms for GetPrefix
               dw        1                    ; 02 prefix num
               adrl      pfxOPEN              ; 04 prefix

proDINFO       dw        4                    ; Parms for DInfo
               ds        2                    ; 02 device num
               adrl      devOPEN              ; 04 device name
               ds        2                    ; 08 characteristics
               ds        4                    ; 0A total blocks

proDREAD       dw        6                    ; Parms for DRead
               ds        2                    ; 02 device num
               ds        4                    ; 04 buffer
               adrl      $00010000            ; 08 request count
               ds        4                    ; 0C starting block
               dw        512                  ; 10 block size
               ds        4                    ; 12 transfer count

proVOLUME      dw        6                    ; Parms for Volume
               adrl      devNAMEopen          ;02  device name
               adrl      volOPEN              ; 06 volume name
               ds        4                    ; 0A total blocks
               ds        4                    ; 0E free blocks
               ds        2                    ; 12 file_sys_id
               ds        2                    ; 14 block_size

devOPEN        dw        $0032                ; buffer size
devNAMEopen    db        $00                  ; length
devNAMEopen1   db        $00
devNAMEopen2   ds        $30                  ; data

pfxOPEN        dw        $00c2                ; buffer size
pfxNAMEopen    db        $00                  ; length
pfxNAMEopen1   db        $00
pfxNAMEopen2   ds        $c0                  ; data

volOPEN        dw        $0032                ; buffer size
volNAMEopen    db        $00                  ; length
volNAMEopen1   db        $00
volNAMEopen2   ds        $30                  ; data

*----------

asciitime      ds        32

hextime1       ds        8
hextime2       ds        8

seconds1       ds        4
seconds2       ds        4
seconds        ds        4

kbs            ds        4
strCALCKBS     ds        8

*----------

theINDEX       ds        2
maxINDEX       ds        2
filesize       ds        4                    ; in KB

*----------

appID          ds        2
myID           ds        2

myDP           ds        2
haBUFFER       ds        4


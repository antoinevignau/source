*--------------------------------------
*
* Mount Disk Images 1.6
*
* (c) Brutal Deluxe, 2011-2024
*

               lst       off
               rel
               typ       PIF
               dsk       MountIt.l

               mx        %00

*--------------------------------------
* v1.6 - AV 202411
*   Really support .PO/.2mg of any size (in RAM)

               use       MI.Equates

               use       4/Locator.Macs
               use       4/Mem.Macs
               use       4/Misc.Macs
               use       4/Qd.Macs
               use       4/QdAux.Macs
               use       4/Util.Macs

*--------------------------------------

               phb
               phk
               plb

               pha
               _MMStartUp
               pla
               sta       myID

               PushLong  #myBRUTAL
               PushWord  myID
               PushLong  #myREQUEST
               _AcceptRequests

               PushLong  #theTITLE
               PushLong  #theICON
               _ShowBootInfo

               plb
               rtl

*-------------------------------------- My Request

myREQUEST      phd
               tsc
               tcd

               stz       $10                   ; v1.4

               lda       $0e
               cmp       #$0100                ; finderSaysHello
               bne       myREQUEST1
               brl       doHELLO
myREQUEST1     cmp       #$0101                ; finderSaysGoodbye
               bne       myREQUEST5
               brl       doBYE
myREQUEST5     cmp       #$0104                ; finderSaysBeforeOpen
               bne       myREQUEST2
               brl       doOPEN
myREQUEST2     cmp       #$0108                ; finderSaysExtrasChosen
               bne       myREQUESTko
               brl       doEXTRAS

myREQUESTok    =         *
               lda       #$8000
               sta       $10

myREQUESTko    =         *
               pld
               lda       $02,s
               sta       $0c,s
               lda       $01,s
               sta       $0b,s
               ply
               ply
               ply
               ply
               ply
               rtl

*--------------------------------------

doHELLO        phb
               phk
               plb

               PushWord  #$800f
               PushWord  #$8001
               PushLong  #myAPPLE
               PushLong  #menuUPDATE
               PushLong  #outMENUUPDATE
               _SendRequest

               PushLong  #0
               PushLong  #$100
               PushWord  myID
               PushWord  #%11000000_00000101
               PushLong  #0
               _NewHandle
               bcs       badHELLO
               phd
               tsc
               tcd
               lda       [3]
               sta       myDP
               pld
               plx
               stx       haDP
               plx
               stx       haDP+2

               plb
               brl       myREQUESTok

badHELLO       pla                             ; v1.5
               pla
               plb
               brl       myREQUESTko

*--------------------------------------

doBYE          phb
               phk
               plb

               PushWord  #$8014                ; Remove me...
               PushWord  #$8001
               PushLong  #myAPPLE
               pea       $0000
               PushWord  menuUPDATEID
               PushLong  #byeMENU
               _SendRequest

               PushLong  haDP
               _DisposeHandle

               plb
               brl       myREQUESTok

*--------------------------------------

doOPEN         ldy       #$0a
               lda       [$0a],y
               beq       doOPEN1               ; UNK file
               cmp       #$04                  ; TXT file
               beq       doOPEN1
               cmp       #$06                  ; BIN file
               beq       doOPEN1
               cmp       #$e0                  ; DSK
               beq       doOPEN1

               brl       myREQUESTko

doOPEN1        ldy       #2                    ; Get pathPtr
               lda       [$0a],y
               stal      proOPEN+4
               iny
               iny
               lda       [$0a],y
               stal      proOPEN+6

               phb                             ; We are in our PIF
               phk
               plb

               phd                             ; save and set the DP
               lda       myDP
               tcd

               jsr       handleFILE
               php                             ; v1.4

               jsl       proDOS
               dw        $202c
               adrl      proDINFO

               plp                             ; v1.4
               pld                             ; restore and exit
               plb

               bcc       doOPEN2               ; v1.4
               brl       myREQUESTko
doOPEN2        brl       myREQUESTok

*--------------------------------------

doEXTRAS       lda       $0a                   ; Is it our menu item?
               cmpl      menuUPDATEID
               beq       doUPDATE

               brl       myREQUESTko

*--------------------------------------

doUPDATE       phb
               phk
               plb

               jsr       findBUSYDIB           ; do we have an image
               bcs       doUPDATE1             ; mounted, NO...

               _WaitCursor

               jsr       updateIT

               _InitCursor

doUPDATE1      plb
               brl       myREQUESTok

*--------------------------------------

updateIT       =         *                     ; Update all RW disk images in RAM

               phd                             ; save and set the DP
               lda       myDP
               tcd
                                               ; do it backwards
; a virtual image of a virtual image
; will therefore be saved ;-)

               lda       #maxIMAGES-1          ; main loop
               sta       theINDEX
]lp            lda       theINDEX
               asl
               tax
               ldy       theDIB,x              ; get one DIB @

               lda       |dchar,y              ; read-only device?
               and       #$0040                ; %0000_0000_0100_0000
               beq       updateIT9             ; read-only, skip

               lda       |ifgDISK,y
               and       #diskModifyBit        ; %0000_0001_0000_0000
               beq       updateIT9             ; no write performed, skip

               jsr       updateFILE

               lda       |ifgDISK,y            ; image updated
               and       #$FFFF-diskModifyBit  ; %0000_0001_0000_0000
               sta       |ifgDISK,y

updateIT9      dec       theINDEX
               lda       theINDEX
               bpl       ]lp

               pld
               rts

*-----------

updateFILE     =         *                     ; write a modified image back to disk

               phy

               lda       |iptrFILE,y           ; set the dataBuffer
               sta       proREAD+4
               lda       |iptrFILE+2,y
               sta       proREAD+6

               lda       |iptrGSOS,y           ; set the pathname @
               sta       proOPEN+4
               lda       |iptrGSOS+2,y
               sta       proOPEN+6

               lda       #$0002                ; request write permission
               sta       proOPEN+8

               jsl       proDOS                ; open
               dw        $2010
               adrl      proOPEN
               bcs       uf9

               lda       proOPEN+2
               sta       proREAD+2
               sta       proCLOSE+2

               lda       proEOF
               sta       proREAD+8
               lda       proEOF+2
               sta       proREAD+10

               stz       proREAD+12
               stz       proREAD+14

               jsl       proDOS
               dw        $2013                 ; WARNING, it is the WRITE call param
               adrl      proREAD               ; re-use of the same parameters

               jsl       proDOS
               dw        $2014
               adrl      proCLOSE

uf9            stz       proOPEN+8             ; re-set RW permission

               ply                             ; restore Y
               rts

*--------------------------------------

handleFILE     jsr       findFREEDIB           ; Can we add an image?
               bcc       haFILE1               ; yes
               rts

haFILE1        lda       proOPEN+4             ; check the file is not
               sta       Arrivee               ; already mounted
               lda       proOPEN+6
               sta       Arrivee+2

               ldx       #0
haFILE2        txa
               asl
               tay
               lda       thePATH,y
               sta       Third                 ; get path ptr

               lda       (Third)
               cmp       [Arrivee]
               bne       haFILEko
               tay

* same path length, check string

]lp            lda       (Third),y             ; compare strings
               cmp       [Arrivee],y
               bne       haFILEko              ; different, next one
               dey
               bpl       ]lp

* same path, check that the one pointed by X is active
* if same path and not active, use it...

               txa
               asl
               tay
               lda       theDIB,y
               tay

               lda       |ihaFILE,y            ; if free, can be used
               ora       |ihaFILE+2,y
               beq       haFILEko

               sec                             ; already mounted
               rts                             ; and active disk, return

haFILEko       inx                             ; next image
               cpx       #maxIMAGES
               bcc       haFILE2               ; not mounted

*-----------

haFILEok       jsl       proDOS                ; go on with the show
               dw        $2010
               adrl      proOPEN
               bcs       handleERR1

               lda       proOPEN+2
               sta       proREAD+2
               sta       proCLOSE+2

               jsr       checkFORMAT
               bcs       handleERR

               jsr       loadIMAGE
               bcs       handleERR

               jsr       buildEXTDIB
               bcs       handleERR

               jsr       findDIB               ; exit with Y = DIB @

               jsr       addDRIVER

handleERR      php
               jsl       proDOS
               dw        $2014
               adrl      proCLOSE
               plp

handleERR1     rts

*--------------------------------------
*
* check we have a format we can handle
*

* X=0: DSK
* X=1: PO
* X=2: 2MG

checkFORMAT	lda	proEOF                ; check we have a valid disk...
	ora	proEOF+2
	bne	cf0
	sec
	rts

cf0	ldx	#cDSK
	ldy	#dftDEV525
	cmp	#$3002	; 140KB - $0002 v $3000 : PO/DSK 0/5.25"
	beq	cf1

	ldx	#cPO
	ldy	#dftDEV35
	cmp	#$800c	; 800KB - $000c v $8000 : PO 1/3.5"
	beq	cf1

	ldx	#c2MG
	cmp	#$804c	; 800KB - $000c v $8040 : 2MG 2/3.5"
	beq	cf1

	ldy	#dftDEV525
	cmp	#$3042	; 140KB - $0002 v $3040 : 2MG 2/5.25"
	beq	cf1

*	ldy	#dftDEV35
*	and	#$0040	; it is a 2MG image
*	bne	cf1	; of 800k size

	jsr	checkSUFFIX	; v1.6 - check suffix of path
	bcs	cf2	; not a .2MG nor .PO

cf1	stx	theFORMAT	; 0-1: PO/DSK image, 2: 2MG image
	sty	theDEVID	; $14 for 5.25, $03 for 3.5 disks, $13 for HDD
	clc
cf2	rts

*--------------------------------------
*
* check suffix of path to disk image
*

checkSUFFIX	lda	[Arrivee]
	tay
	lda	[Arrivee],y
	and	#$5f5f
	cmp	#'MG'
	bne	cs_po
	dey
	dey
	lda	[Arrivee],y
	cmp	#'.2'
	bne	cs_po

	ldx	#c2MG	; set 2mg of any size
	ldy	#dftDEVHDD
	clc
	rts

cs_po	lda	[Arrivee]
	tay
	lda	[Arrivee],y
	and	#$5f5f
	cmp	#'PO'
	bne	cs_ko
	dey
	lda	[Arrivee],y
	and	#$5fff
	cmp	#'.P'
	bne	cs_ko

	ldx	#cPO	; set PO of any size
	ldy	#dftDEVHDD
	clc
	rts

cs_ko	sec
	rts

*--------------------------------------
*
* load a file image into memory
*

loadBAD        pla                             ; v1.5
               pla
               rts

loadIMAGE      =         *

               PushLong  #0                    ; Get a new handle
               PushLong  proEOF
               PushWord  myID
               PushWord  #%11000000_00001100
               PushLong  #0
               _NewHandle
               bcs       loadBAD               ; v1.5
               phd                             ; Dereference handle
               tsc
               tcd
               lda       [3]
               sta       myMEM
               ldy       #2
               lda       [3],y
               sta       myMEM+2
               pld
               pla
               sta       myHA
               pla
               sta       myHA+2

               lda       myMEM                 ; Load file into memory
               sta       proREAD+4
               lda       myMEM+2
               sta       proREAD+6

               lda       proEOF
               sta       proREAD+8
               lda       proEOF+2
               sta       proREAD+10

               jsl       proDOS                ; Read it...
               dw        $2012
               adrl      proREAD

loadERR        rts

*--------------------------------------
*
* build an extended DIB buffer
*

buildEXTDIB    =         *                     ; build an extended DIB

               lda       myMEM                 ; Check file contents
               sta       Arrivee
               sta       ptrFILE
               sta       ptrDISK
               lda       myMEM+2
               sta       Arrivee+2
               sta       ptrFILE+2
               sta       ptrDISK+2

               lda       myHA                  ; copy handle info
               sta       haFILE
               lda       myHA+2
               sta       haFILE+2

*-----------

               lda       #sizePRODOS           ; force ProDOS block
               sta       blockSIZE

               lda       proEOF+1              ; Tricky way to get the
               lsr                             ; number of blocks...
               tax

               lda       theFORMAT
               cmp       #2                    ; <2: not a 2MG image
               bcc       nd5

*----------- For 2MG only

nd2MG          ldy       #8                    ; set block 0 address
               lda       [Arrivee],y
               clc
               adc       ptrFILE
               sta       ptrDISK
               lda       #0
               adc       ptrFILE+2
               sta       ptrDISK+2

               ldy       #$14                  ; set block count
               lda       [Arrivee],y
               tax

*----------- For all

nd5            stx       blockCOUNT
               stz       blockCOUNT+2

               jsr       checkPRODOS           ; check the disk format
               bcc       nd6

               PushLong  myHA                  ; we dunno, let's free RAM
               _DisposeHandle
               sec
               rts

nd6            lda       #diskInDriveBit       ; disk image is OK
               sta       fgDISK

               lda       proOPEN+4             ; set the path
               sta       ptrGSOS               ; useful for update ;-)
               lda       proOPEN+6
               sta       ptrGSOS+2

               clc
               rts

*--------------------------------------
*
* check for a ProDOS signature
*

checkPRODOS    =         *                     ; check for a simili ProDOS signature
               lda       ptrDISK
               sta       Arrivee
               lda       ptrDISK+2
               sta       Arrivee+2

               lda       [Arrivee]
               cmp       #$3801                ; 01 SEC
               bne       check141
               ldy       #2
               lda       [Arrivee],y
               cmp       #$03b0                ; BCS *+03
               bne       check141
               clc                             ; It is a ProDOS disk
               rts

check141       ldy       #$400                 ; check another ProDOS signature
               lda       [Arrivee],y
               bne       check149
               iny
               iny
               lda       [Arrivee],y
               cmp       #$0003
               bne       check149

               ldy       #$421
               lda       [Arrivee],y
               cmp       #$E300
               bne       check149
               iny
               iny
               lda       [Arrivee],y
               cmp       #$0D27
               bne       check149
               clc                             ; It is a ProDOS disk
               rts                             ; useful for games and other disks

check149       sec                             ; It is an unknown disk
               rts

*--------------------------------------
*
* find a free DIB
*

findFREEDIB    =         *                     ; find a free DIB
               ldx       #0
]lp            txa                             ; get the DIB @
               asl
               tay
               lda       theDIB,y
               tay

               lda       |ihaFILE,y
               ora       |ihaFILE+2,y
               bne       freeDIB22
               lda       |ddevnumber,y
               beq       freeDIB99

freeDIB22      inx                             ; found one busy, try the next
               cpx       #maxIMAGES
               bcc       ]lp

               sec                             ; none are free
               rts
freeDIB99      clc                             ; at least, one is free
               rts

*--------------------------------------
*
* find a busy DIB
*

findBUSYDIB    =         *                     ; find a busy DIB
               ldx       #0
]lp            txa                             ; get the DIB @
               asl
               tay
               lda       theDIB,y
               tay

               lda       |ihaFILE,y
               ora       |ihaFILE+2,y
               bne       busyDIB99

               inx                             ; found one free, try the next
               cpx       #maxIMAGES
               bcc       ]lp

               sec                             ; none are busy / all are free
               rts
busyDIB99      clc                             ; at least, one is busy, cool
               rts

*--------------------------------------
*
* find a DIB
*

findDIB        jsr       findFREEDIB           ; find a free DIB
                                               ; we know there is one free
               tya
               pha
               sta       dibLIST+4             ; for INSTALL_DRIVER

               ldx       #0                    ; copy our extended DIB info
]lp            lda       EXTDIB,x
               sta       |ifgDISK,y
               iny
               iny
               inx
               inx
               cpx       #sizeEXTDIB
               bne       ]lp

               ply

               lda       blockCOUNT
               sta       |dblockcount,y
               lda       blockCOUNT+2
               sta       |dblockcount+2,y

*----------- Handle write access

               ldx       #dftCHAR
               lda       proACCESS             ; set write access or not...
               and       #$0002                ; 0000_0000_0000_0010
               bne       ff1

               txa                             ; only read access
               and       #$ffb7                ; 1111_1111_1011_0111
               tax

ff1            txa
               sta       |dchar,y

*----------- Set device ID

               lda       theDEVID              ; Set device ID
               sta       |ddeviceid,y

               tyx                             ; save Y

*----------- Copy GS/OS pathname

               lda       ptrGSOS               ; Get the source GS/OS pathname
               sta       ptrSPATH
               lda       ptrGSOS+2
               sta       ptrSPATH+2

               lda       |iptrGSOS,y
               sta       ptrDPATH

               lda       [ptrSPATH]            ; ...and copy
               tay
]lp            lda       [ptrSPATH],y
               sta       (ptrDPATH),y
               dey
               bpl       ]lp

               txy                             ; restore Y (not useful but nice)
               clc
               rts

*--------------------------------------

addDRIVER      =         *                     ; add the driver to the list

               ldal      GSOSBusy              ; Thank you Window Manager
               bmi       Exit
               ora       #$8000
               stal      GSOSBusy

               phd
               lda       #$bd00
               tcd

               sep       #$20
               ldal      $e0c068
               pha
               ldal      $e0c08b
               ldal      $e0c08b
               rep       #$20

               ldx       #dibLIST
               ldy       #^dibLIST
               jsl       INSTALL_DRIVER

               sep       #$20
               pla
               stal      $e0c068
               rep       #$20

               pld

               ldal      GSOSBusy
               asl
               lsr
               stal      GSOSBusy

Exit           rts

*--------------------------------------

proOPEN        dw        12                    ; +00 pCount
               ds        2                     ; +02 refNum
               ds        4                     ; +04 pathname
               ds        2                     ; +08 requestAccess
               ds        2                     ; +0A resourceNumber
proACCESS      ds        2                     ; +0C access
proTYPE        ds        2                     ; +0E fileType
               ds        4                     ; +10 auxType
               ds        2                     ; +14 storageType
               ds        8                     ; +16 createDateTime
               ds        8                     ; +1E modDateTime
               ds        4                     ; +26 optionList
proEOF         ds        4                     ; +2A eof

proREAD        dw        4
               ds        2
               ds        4
               ds        4
               ds        4

proCLOSE       dw        1
               ds        2

proDINFO       dw        2
               dw        1
               adrl      devName

devName        ds        40                    ; 40 > 2+2+31

*---

menuUPDATE     dw        $8000
               ds        2
               ds        1
               ds        1
               ds        2
               ds        2
               adrl      menuSUPDATE
menuSUPDATE    str       'Update disk images'

outMENUUPDATE  ds        2
               ds        2
menuUPDATEID   ds        2
               ds        2

byeMENU        ds        2
               ds        2

*-----------

theFORMAT      ds        2                     ; 0: PO/DSK 140KB
                                               ; 1: PO 800KB
                                               ; 2: 2MG 140/800KB

theDEVID       ds        2                     ; 0 for 5.25 disks
; 3 for 3.5 disks

theINDEX       ds        2                     ; a simple index

*---

dibLIST        adrl      1
               adrl      DIBA

myMEM          ds        4
myHA           ds        4

myID           ds        2

myDP           ds        2
haDP           ds        4

myAPPLE        str       'Apple~Finder~'
myBRUTAL       str       'BrutalDeluxe~MountIt~'

*---

theTITLE       ASC       'MountIt               v01.50  by Brutal Deluxe'00

theICON        DW        $8000                 ; Icon type
               DW        $00F0                 ; Icon size
               DW        $0014                 ; Icon height
               DW        $0018                 ; Icon width
               HEX       000000000000000000000000  ; Icon image
               HEX       0FF0DFDFDFDFDFDFDFDF0FF0
               HEX       0FF0FDFDFDFDFDFDFDFD0FF0
               HEX       0FF0DFDFDFDFDFDFDFDF0FF0
               HEX       0FF0FDFDFDFDFDFDFDFD0FF0
               HEX       0FF0DFDFDFDFDFDFDFDF0FF0
               HEX       0FF0FDFDFDFDFDFDFDFD0FF0
               HEX       0FF0DFDFDFDFDFDFDFDF0FF0
               HEX       0FF0FDFDFDFDFDFDFDFD0FF0
               HEX       0FF0DFDFDFDFDFDFDFDF0FF0
               HEX       0FF000000000000000000FF0
               HEX       0FFFFFFFFFFFFFFFFFFFFFF0
               HEX       0FFFFF000000000000FFFFF0
               HEX       0FFFFF00FF00000000FFFFF0
               HEX       0FFFFF00FF00000000FFFFF0
               HEX       0FFFFF00FF00000000FFFFF0
               HEX       0FFFFF00FF00000000FFFFF0
               HEX       F0FFFF000000000000FFFFF0
               HEX       FF0000000000000000000000
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF  ; Icon mask
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       FFFFFFFFFFFFFFFFFFFFFFFF
               HEX       0FFFFFFFFFFFFFFFFFFFFFFF
               HEX       00FFFFFFFFFFFFFFFFFFFFFF
               HEX       000000000000000000000000

*--------------------------------------

               put       MI.DRIVER


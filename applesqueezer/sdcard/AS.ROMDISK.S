*
* AppleSqueezer v2
* A ROMDISK driver
*
* E1/0FBD must contain 1
*
* (c) 2026, Brutal Deluxe Software
*

	mx	%11
	org	$F00000
	lst	off
	dsk	AS.ROMDISK
	typ	BIN
	
	use	AS.EQUATES.S
	
*----

*----------------------------

*---------- Blah-blah
*
* A block device must answer to the following calls
* either in standard or extended mode:
*  - $00/$40: Status
*  - $01/$41: ReadBlock
*  - $02/$42: WriteBlock
*  - $03/$43: Format
*  - $04/$44: Control
*  - $05/$45: Init
*
* Memory organization:
*  - $F0/0800: block $  0 (   0)
*  - $F1/0000: block $ 7C ( 124)
*  - $F2/0000: block $ FC ( 252)
*  - $F7/0000: block $37C ( 892)
*  - $F7/FE00: block $3FB (1019)
*
*----------

*---------- Equates

cmdSTATUS      =     $00
cmdREADBLOCK   =     $01
cmdWRITEBLOCK  =     $02
cmdFORMAT      =     $03
cmdCONTROL     =     $04
cmdINIT        =     $05
cmdEXT         =     %01000000          ; extended command
maskEXT        =     %10111111          ; mask for extended command

spBUFFER       =     $42                ; $42 (3)
spCMD          =     spBUFFER+3         ; $45 (1)
spPCOUNT       =     spCMD+1            ; $46 (1)
spBUF24        =     spPCOUNT+1         ; $47 (1) - always 0
spBLOCK        =     spBUF24+1          ; $48 (4)
spSTATUS       =     spBLOCK            ; $48 (1)
spCONTROL      =     spBLOCK            ; $48 (1)
spERROR        =     spBLOCK+8          ; $50 (1)
spLENGTH       =     spERROR+1          ; $51 (2)
fgEXT          =     spLENGTH           ; $51 (1) bit 7 = 1 : extended command

noERR          =     $00                ; no error
badcmdERR      =     $01                ; A nonexistent command was issued
badpcntERR     =     $04                ; A bad call parameter count was given
badctlERR      =     $21                ; The control or status code is not supported
badctlparmERR  =     $22                ; The control list contains invalid information
ioERR          =     $27                ; I/O error
noDEVICE       =     $28                ; No device connected
ibnERR         =     $2D                ; Illegal block number

*----------------------------
*---------- Code (entry in 8-bit)

               asc   "ROMDISK"          ; Signature
               jmp   entryPOINT         ; +7

blockZERO	ds	4	; first block (0 or 8)
realBLOCK	ds	4
nbBLOCKS	ds	4	; number of blocks

	ds	12	; 32-10-10 = 12

*---

               mx    %11

entryPOINT     lda   spCMD              ; Support 0-5 commands
               and   #maskEXT           ; mask ext cmd
               cmp   #cmdINIT+1
               bcc   doCMD
               lda   #badcmdERR         ; unsupported command
               sec
               rtl

doCMD          phb                      ; save bank
               phk                      ; we are in $F0 now
               plb

               lda   spCMD              ; get the command
               tax                      ; save it
               and   #cmdEXT            ; is it an ext cmd?
               asl                      ; put result in bit 7
               sta   fgEXT              ; save it for later use

               txa                      ; restore the command
               and   #maskEXT           ; mask bit 6
               asl                      ; *2
               tax                      ; execute
               jsr   (tblCMD,x)         ; execute it

               sta   spERROR            ; return error code
               stx   spLENGTH           ; set the number of
               sty   spLENGTH+1         ; bytes returned
               plb
               rtl

*--- Table of commands

tblCMD	da	doSTATUS
	da	doREADBLOCK
	da	doWRITEBLOCK
	da	doFORMAT
	da	doCONTROL
	da	doINIT

*----------------------------
*---------- The driver commands

*----------------------------
*---------- Status

               mx    %11

doSTATUS       jsr   checkST            ; Check parms
               bcc   doSTATUS1
               rts
doSTATUS1      asl                      ; execute command
               tax
               jsr   (tblSTATUS,x)
               rts

*--- Table of status pointers

tblSTATUS      da    statcmd00
               da    statcmd01
               da    statcmd02
               da    statcmd03

*---

statcmd00      =     *                  ; Return device status
               jsr   DIBpart1           ; return DIB part one
               lda   #noERR             ; and return
               tay                      ; x is set by DIBpart1
               clc
               rts

*---

statcmd01      =     *                  ; Return device control block
statcmd02      =     *                  ; Return newline status (char devices only)
               lda   #badctlERR
               ldx   #0
               txy
               sec
               rts

*---

statcmd03      =     *                  ; Return device information block
               jsr   DIBpart1           ; return DIB part one
               jsr   DIBpart2           ; return DIB part two

               ldx   #4+21              ; part 1 + part 2
               lda   fgEXT              ; is it an extended call?
               bpl   statcmd0399
               inx
statcmd0399    lda   #noERR             ; and return
               tay
               clc
               rts


*--- DIBpart1 returns status and number of blocks

DIBpart1       =     *                  ; Return DIB part 1
*- bit 7: 1 = block device
*- bit 6: 1 = write allowed
*- bit 5: 1 = read allowed
*- bit 4: 1 = device online or disk in drive
*- bit 3: 1 = format allowed
*- bit 2: 0 = media is write protected
*- bit 1: 0 = device is currently not interrupting
*- bit 0: 0 = device is currently not open (char devices only)

               ldx   #4                 ; number of bytes to return
               lda   #%1111_1000        ; General status byte
               sta   [spBUFFER]
               ldy   #1                 ; Number of blocks
               lda   nbBLOCKS
               sta   [spBUFFER],y
               iny
               lda   nbBLOCKS+1
               sta   [spBUFFER],y
               iny
               lda   nbBLOCKS+2
               sta   [spBUFFER],y

               iny
               lda   fgEXT              ; is it an extended call?
               bpl   DIBpart19
               inx                      ; number of bytes to return
               lda   #0                 ; yes, store another 0
               sta   [spBUFFER],y
DIBpart19      rts

*--- DIBpart2 returns the rest of the DIB

DIBpart2       ldx   #0                 ; return the rest
]lp            lda   DIBdata,x          ; DIB fields
               sta   [spBUFFER],y
               iny
               inx
               cpx   #DIBdata2-DIBdata
               bne   ]lp
               rts

*----------------------------
*---------- ReadBlock (from ROMdisk to memory)

               mx    %11

doREADBLOCK	jsr	checkRW
	bcc	doREAD1
	rts

doREAD1	rep	#$10

	lda	#TRUE
	stal	SD_START_READ
	
	ldy	#0
]lp	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	ldal	SD_ACCESS
	sta	[spBUFFER],y
	iny
	cpy	#blockSIZE
	bcc	]lp
	
doRWEND	sep	#$30	; exit with no error
	lda	#noERR
	ldx	#<blockSIZE
	ldy	#>blockSIZE
	clc
	rts

*----------------------------
*---------- WriteBlock (from memory to ROMdisk)

	mx	%11

doWRITEBLOCK	jsr	checkRW	; Check common parms
	bcc	doWRITE1
	rts

doWRITE1	rep	#$10	; from RAM to ROM

	lda	#TRUE
	stal	SD_START_WRITE
	
	ldy	#0
]lp	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	lda	[spBUFFER],y
	stal	SD_ACCESS
	iny
	cpy	#blockSIZE
	bcc	]lp
	jmp	doRWEND	; exit

*--- CheckRW (check common parms)

	mx	%11

checkRW	lda	spPCOUNT	; Check pcount
	cmp	#3
	beq	checkRW1

	lda	#badpcntERR
checkRWERR	ldx	#0
	txy
	sec
	rts

*- Set block number

checkRW1       	lda	blockZERO
	clc
	adc	spBLOCK
	stal	SD_ADDRESS_SET_MSB_3
       	lda	blockZERO+1
	adc	spBLOCK+1
	stal	SD_ADDRESS_SET_MSB_2
       	lda	blockZERO+2
	adc	spBLOCK+2
	stal	SD_ADDRESS_SET_MSB_1
       	lda	blockZERO+3
	adc	spBLOCK+3
	stal	SD_ADDRESS_SET_MSB
	clc
	rts

*----------------------------
*---------- Control

               mx    %11

doCONTROL      jsr   checkST            ; Check parms
               bcc   doCONTROL1
               rts
doCONTROL1     asl                      ; execute command
               tax
               jsr   (tblCONTROL,x)
               rts

*--- Table of control pointers

tblCONTROL     da    contcmd00
               da    contcmd01
               da    contcmd02
               da    contcmd03

*---

contcmd00      =     *                  ; resets the device
contcmd01      =     *                  ; sets device control block
               lda   #noERR
               tax
               tay
               clc
               rts

contcmd02      =     *                  ; sets newline status (char devices only)
contcmd03      =     *                  ; services device interrupt
               lda   #badctlERR
               bne   checkSTERR

*--- checkST (check common parms)

	mx	%11

checkST	lda	spPCOUNT	; Check pcount
	cmp	#3
	beq	checkST1

	lda	#badpcntERR
checkSTERR	ldx	#0	; zero bytes returned
	txy
	sec
	rts

checkST1	lda	spSTATUS	; Check status/command code
	cmp	#4	; 0-3 supported
	bcc	checkST2	; we're good

	lda	#badctlparmERR
	bne	checkSTERR

checkST2			; jump below...

*----------------------------
*---------- Format & Init

	mx	%11

doFORMAT	lda	#noERR
	ldx	#0
	txy
	clc
	rts

*----------------------------

	mx	%11
	
doINIT	ldal	FL_IDLE
	cmp	#$01
	bne	DStarterr	; no AS found
	
	ldal	FL_VERSION
	cmp	#minVERSION
	bcc	DStarterr	; no minimum version

	ldal	SD_CARD_INSERTED
	beq	DStarterr

	jsr	checkVOLUME
	bcs	DStarterr
	
	lda	#0
	tax
	tay
	clc
	rts

DStarterr	lda	#noDEVICE	; no device connected. Goodbye!
	ldx	#0
	txy
	sec
	rts

*----------------------------
* CHECK VOLUME
*----------------------------

	mx	%10
	
VOL_SIG	=	$aa55
BOOT_SIG1	=	$e9
BOOT_SIG2	=	$eb
GSOS_PART	=	$20	; reserved but unused partition ID
SIZE_PART	=	16
SIZE_DIB	=	64

*---

checkVOLUME	rep	#$10

	lda	#0
	stal	SD_ADDRESS_SET_MSB
	stal	SD_ADDRESS_SET_MSB_1
	stal	SD_ADDRESS_SET_MSB_2
	stal	SD_ADDRESS_SET_MSB_3

	lda	#1
	stal	SD_START_READ

	ldy	#0
]lp	ldal	SD_ACCESS
	sta	firstBLOCK,y
	iny
	cpy	#blockSIZE
	bcc	]lp

*--- Do we have a MBR?

	rep	#$20
	
	stz	blockZERO	; first block is 0
	stz	blockZERO+2
	stz	nbBLOCKS
	lda	#1	; 65536 blocks
	sta	nbBLOCKS+2
	
	lda	firstBLOCK+$1fe
	cmp	#VOL_SIG
	beq	cv_MBR	; yes

cv_STD	sep	#$30
	clc
	rts

*--- Do we really have a MBR?

	mx	%00
	
cv_MBR	lda	firstBLOCK
	and	#$ff
	cmp	#BOOT_SIG1
	beq	cv_STD	; yes
	cmp	#BOOT_SIG2
	beq	cv_STD	; yes
	cmp	#0
	bne	cv_STD	; at least, not a partition map

*--- We believe we have a partition map, let's check it

PART1_OFFSET	=	$1be
NB_PARTITIONS	=	4

	ldx	#PART1_OFFSET
]lp	jsr	checkPARTID	; check partition ID
	bcs	cv_NEXT	; not authorized
	
	lda	firstBLOCK+8,x	; copy 1st LBA sector
	sta	blockZERO
	lda	firstBLOCK+10,x	; of partition
	sta	blockZERO+2
	lda	firstBLOCK+12,x
	sta	nbBLOCKS	; and number of sectors
	lda	firstBLOCK+14,x
	sta	nbBLOCKS+2
	sep	#$30
	clc
	rts

	mx	%00
	
cv_NEXT	txa
	clc
	adc	#SIZE_PART
	tax
	cpx	#$1fe
	bcc	]lp

	sep	#$30
	sec
	rts
	
*--- Check if the partition ID is in my authorized list

	mx	%00

checkPARTID	sep	#$20
	
	ldy	#0
]lp	lda	listPARTID,y
	cmp	#$ff	; end of list
	beq	cpid_KO
	
	cmp	firstBLOCK+4,x	; is it in my list?
	beq	cpid_OK	; yes, authorized
	iny		; next one, please
	bne	]lp

cpid_KO	rep	#$20	; not in my list
	sec
	rts
cpid_OK	rep	#$20	; in my list
	clc
	rts

*---

listPARTID	dfb	$01,$04,$06,$0b,$0c,$0e,$0f
	dfb	$11,$14,$16,$1b,$1c,$1e,$1f
	dfb	GSOS_PART,$af
	dfb	$ff	; end of list and a part ID I do not support

*----------------------------
*--- My DIB

DIBdata        hex   07                 ; ID string length
               asc   'ROMDISK'          ; ID string
               asc   '         '        ; ...on 16 bytes
               hex   00                 ; device type byte
               hex   C0                 ; device subtype byte
               dw    $0100              ; version word
DIBdata2       =     *

*--- Internal signature

*	asc	0d
*	asc	'Antoine Vignau & Olivier Zardini'0d
*	asc	'Brutal Deluxe Software, 2026'
*	asc	0d
	ds	\

*---
	
firstBLOCK	ds	blockSIZE

	
*
* Genesys v1.3.4
* Versions editor
*

         mx    %00
         rel
         lst   off

*----------------------------

         use   4/Ctl.Macs
         use   4/Int.Macs
	 use   4/Line.Macs
         use   4/Mem.Macs
         use   4/QD.Macs
         use   4/Resource.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*----------------------------

GSOS     EQU   $E100A8

*----------------------------
* Process
*
* Command 3 is launched at boot time
* Command 0 is launched at each Add
*

*----------------------------
* Ewen's Versions resource type $DEAD:
*
* +0000 word version must be zero
* +0004 long resource ID of string holding app's display name
* +0008 long resource ID of string holding author's name
* +000c long resource ID of string URL to the downloads folder
* +0010 long resource ID of string for downloadable archive name
* +0014 long resource ID of string for Versions.List data file
*

sizeHEADER	=	$000c	; standard header size
sizeSTDREC	=	$0054	; 12 entries x 4 + header = $54
sizeFULLREC	=	$0084	; 30 entries x 4 + header = $84
resSIZE	=	22	; 2 + 5 x 4
resTYPE	=	$dead	; resource type supported by the editor

rPString	=	$8006

*----------------------------

	lda	#myRESOURCE
	stal	$300
	lda	#^myRESOURCE
	stal	$302
	
         LDA   $04,S
         STA   ptrBUFFER
         LDA   $06,S
         STA   ptrBUFFER+2
         JMPL  entryPOINT

*--- Show my editor window

showWINDOW
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^refreshWINDOW
         PEA   refreshWINDOW
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^myWINDOW
         PEA   myWINDOW
         PEA   $800E
         _NewWindow2
         PLA
         STA   ptrWINDOW
         PLA
         STA   ptrWINDOW+2
         LDA   ptrWINDOW+2
         PHA
         LDA   ptrWINDOW
         PHA
         _SetPort
         PEA   $0000
         PEA   $0000
         LDA   ptrWINDOW+2
         PHA
         LDA   ptrWINDOW
         PHA
         PEA   $0003
         PEA   ^ctlWINDOW
         PEA   ctlWINDOW
         _NewControl2
         PLA
         PLA
         PLB
         PLD
         RTL

ctlWINDOW
	adrl	ctlSTR5
	adrl	ctlSTR4
	adrl	ctlSTR3
	adrl	ctlSTR2
	adrl	ctlSTR1
	adrl	ctlLE5
	adrl	ctlLE4
	adrl	ctlLE3
	adrl	ctlLE2
	adrl	ctlLE1
	adrl	$00000000

ctlSTR5
         DW    $0008      ; pCount - ID text
         ADRL  $00000005  ; ID
         DW    129          ; rect
         DW    10
         DW    138
         DW    230
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSTR5    ; textRef
         DW    23         ; textSize

ctlSTR4
         DW    $0008      ; pCount - ID text
         ADRL  $00000004  ; ID
         DW    99          ; rect
         DW    10
         DW    108
         DW    230
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSTR4    ; textRef
         DW    25         ; textSize

ctlSTR3
         DW    $0008      ; pCount - ID text
         ADRL  $00000003  ; ID
         DW    69          ; rect
         DW    10
         DW    78
         DW    230
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSTR3    ; textRef
         DW    23         ; textSize

ctlSTR2
         DW    $0008      ; pCount - ID text
         ADRL  $00000002  ; ID
         DW    39          ; rect
         DW    10
         DW    48
         DW    230
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSTR2    ; textRef
         DW    13         ; textSize

ctlSTR1
         DW    $0008      ; pCount - ID text
         ADRL  $00000001  ; ID
         DW    9          ; rect
         DW    10
         DW    18
         DW    230
         ADRL  $81000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  strSTR1    ; textRef
         DW    26         ; textSize

ctlLE5
         DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    140      ; rect
         DW    20
         DW    153
         DW    280
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    255        ; maxSize
         ADRL  mySTRING5B  ; defaultRef
	 
ctlLE4
         DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    110      ; rect
         DW    20
         DW    123
         DW    280
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    255        ; maxSize
         ADRL  mySTRING4B  ; defaultRef
	 
ctlLE3
         DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    80      ; rect
         DW    20
         DW    93
         DW    280
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    255        ; maxSize
         ADRL  mySTRING3B  ; defaultRef
	 
ctlLE2
         DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    50      ; rect
         DW    20
         DW    63
         DW    280
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    255        ; maxSize
         ADRL  mySTRING2B  ; defaultRef
	 
ctlLE1
         DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    20      ; rect
         DW    20
         DW    33
         DW    280
         ADRL  $83000000  ; procRef
         DW    $0000      ; flag
         DW    $7000      ; moreFlags
         ADRL  $00000000  ; refCon
         DW    255        ; maxSize
         ADRL  mySTRING1B  ; defaultRef
	 
strSTR5	asc	'Versions.List data file'
strSTR4	asc	'Downloadable archive name'
strSTR3	asc	'URL of downloads folder'
strSTR2	asc	'Author'27's name'
strSTR1	asc	'Application'27's display name'

winTITLE	str	' Versions '

myWINDOW DW    $0050
         DW    $C080      ; frame bits
         ADRL  winTITLE   ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L077E      ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    36         ; content rect
         DW    30
         DW    196
         DW    340
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
         DW    $0000

L077E    DW    $0000
         DW    $0F00
         DW    $020F
         DW    $F0FF
         DW    $00F0

*--- Refresh window

refreshWINDOW
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetCurResourceFile
         LDA   resfileID
         PHA
         _SetCurResourceFile
         PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         _SetCurResourceFile
         PLB
         PLD
         RTL

*--- Write the resource

writeRESOURCE
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $18
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _GetResourceAttr
         STA   L2BCB
         PLA
         STA   $16
         LDA   $16
         AND   #$0020
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   #$0001
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _MarkResourceChange
         STA   L2BCB
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _WriteResource
         STA   L2BCB
         LDA   L2BCB
         BNE   L0859
         BRL   L0896

* Cannot write resource

L0859    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L08E8
         PEA   L08E8
         LDA   #$0044
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0896
         BRL   L0896

* Resource is written

L0896    LDA   $16
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $18
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $18
         LDA   $1B
         STA   $21
         LDA   $1A
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L08E8    ASC   '52~Tool editor: Resource write error. Resource possibly damaged.~^#0'

*--- Load a resource

readRESOURCE
         TSC
         SEC
         SBC   #$0028
         TCS
         PHD
         INC
         TCD
         LDA   #$0000	; no resource is loaded
         STA   $16
         LDA   #$0000
         STA   $18
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $26
         LDA   L2BCB
         BNE   L0959
         BRL   L095C
L0959    BRL   L0A27

* File depth search succeeded

L095C    LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _GetResourceAttr
         STA   L2BCB
         PLA
         STA   $24
         LDA   L2BCB
         BNE   L0996
         BRL   L0999
L0996    BRL   L0A27

* Getting resource attributes succeeded

L0999    LDA   $24
         AND   #$0020
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   L2BCB
         BNE   L09BA
         BRL   L09BD
L09BA    BRL   L0A27

* Setting bit 5 succeeded

L09BD    PHA
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _LoadResource
         STA   L2BCB
         PLA
         STA   $20
         PLA
         STA   $22
         LDA   L2BCB
         BNE   L09E0
         BRL   L09E3
L09E0    BRL   L0A27

* Resource was loaded, it exists

L09E3    LDX   $22
         LDA   $20
         PHX
         PHA
         _HLock
         STA   L2BCB
         LDA   L2BCB
         BNE   L09FB
         BRL   L09FE
L09FB    BRL   L0A27

* memory lock succeeded

L09FE    LDA   $24
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   L2BCB
         BNE   L0A1C
         BRL   L0A1F
L0A1C    BRL   L0A27

* If we're here, our resource is in memory
L0A1F    LDX   $22
         LDA   $20
         STX   $18
         STA   $16

* If we're here, we've suffered a lot

L0A27    PHA
         LDA   $26
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $26
         LDA   $29
         STA   $2F
         LDA   $28
         STA   $2E
         LDX   $18	; return resource
         LDY   $16
         PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         TYA
         RTL

*---

makeSTDRESOURCE
         TSC
         SEC
         SBC   #$0028
         TCS
         PHD
         INC
         TCD
         LDA   #$0001
         STA   $16
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         JSL   readRESOURCE	; load resource in memory
         STX   $22
         STA   $20
         LDA   $20
         ORA   $22
         BEQ   L0A75
         BRL   L0AB5

* Cannot load resource, it does not exist

L0A75    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L0D79
         PEA   L0D79
         LDA   #$003B
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0AB2
         BRL   L0AB2
L0AB2    BRL   L0D66

* Resource is loaded, it exists

L0AB5    LDX   $22
         LDA   $20
         PHX
         PHA
         _HUnlock
         STA   L2BCB
         LDA   #resSIZE	; was sizeSTDREC
         LDX   #$0000
         TAY
         BPL   L0ACF
         DEX
L0ACF    PHX
         PHA
         LDX   $22
         LDA   $20
         PHX
         PHA
         _SetHandleSize
         STA   L2BCB
         LDA   L2BCB
         BNE   L0AE9
         BRL   L0B67

* Cannot resize handle

L0AE9    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L0DB4
         PEA   L0DB4
         LDA   #$003B
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $24
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0B64
         BRL   L0B64
L0B64    BRL   L0D66

* Handle is resized

L0B67    LDX   $22
         LDA   $20
         PHX
         PHA
         _HLock
         STA   L2BCB

* Now, we init a blank resource

         LDY   #$0002	; get the pointer
         LDA   [$20],Y
         TAX
         LDA   [$20]
         STX   $08
         STA   $06

	ldy	#0	; make all zeroes
	tya
]lp	sta	[$06],y
	iny
	iny
	cpy	#resSIZE
	bcc	]lp

*---

L0D54    LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         JSL   writeRESOURCE
         LDA   #$0000
         STA   $16
L0D66    LDA   $29
         STA   $2F
         LDA   $28
         STA   $2E
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         TXA
         RTL

L0D79    ASC   '52~Tool editor: Resource load error. Operation aborted.~^#0'
L0DB4    ASC   '52~Tool editor: Memory resize error. Operation aborted.~^#0'

*--- Update buffer

updateBUFFER
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0048	; flag
         LDA   [$00],Y
         ORA   #$6000	; bits 14-13
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0050
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036	; move resource type
         LDA   [$00],Y	; from offset $36
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]	; to offset $50

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; move resource ID
         LDA   [$00],Y	; from offset $3A
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0052	; to offset $52
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y

         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

*---

L0E80    TSC
         SEC
         SBC   #$0026
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0E93
         DEX
L0E93    PHX
         PHA
         PLA
         STA   $16
         PLA
         STA   $18
         PHA
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L0EA7
         DEX
L0EA7    PHX
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003C	; memID
         LDA   [$00],Y
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0EC7
         DEX
L0EC7    PHX
         PHA
         _NewHandle
         STA   L2BCB
         PLA
         STA   haMEMORY2
         PLA
         STA   haMEMORY2+2
         LDA   L2BCB
         BNE   L0EE3
         BRL   L0F23
L0EE3    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L119F
         PEA   L119F
         LDA   #$003C
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0F20
         BRL   L0F20
L0F20    BRL   L1192
L0F23    PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $20
         LDA   L2BCB
         BNE   L0F3D
         BRL   L0F8F
L0F3D    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L11DB
         PEA   L11DB
         LDA   #$0036
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0F8C
         BRL   L0F8C
L0F8C    BRL   L1192
L0F8F    PHA
         PHA
         LDA   #$FFFF
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         _UniqueResourceID
         STA   L2BCB
         PLA
         STA   $22
         PLA
         STA   $24
         LDA   L2BCB
         BNE   L0FBD
         BRL   L100F
L0FBD    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1211
         PEA   L1211
         LDA   #$0037
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L100C
         BRL   L100C
L100C    BRL   L1141
L100F    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         LDA   #$0000
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         _AddResource
         STA   L2BCB
         LDA   L2BCB
         BNE   L1043
         BRL   L10A3
L1043    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1248
         PEA   L1248
         LDA   #$0043
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1092
         BRL   L1092
L1092    LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L109C
         DEX
L109C    STX   $24
         STA   $22
         BRL   L1141
L10A3    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         _WriteResource
         STA   L2BCB
         LDA   L2BCB
         BNE   L10CB
         BRL   L1119
L10CB    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L128B
         PEA   L128B
         LDA   #$003F
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1108
         BRL   L1108
L1108    LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L1112
         DEX
L1112    STX   $24
         STA   $22
         BRL   L1141
L1119    LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
L1141    PHA
         LDA   $20
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $20
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L115C
         DEX
L115C    CMP   $22
         BNE   L1162
         CPX   $24
L1162    BNE   L1167
         BRL   L1192
L1167    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         JSL   makeSTDRESOURCE
         TAX
         BNE   L1187
         BRL   L118A
L1187    BRL   L1192
L118A    LDX   $24
         LDA   $22
         STX   $18
         STA   $16
L1192    LDX   $18
         LDY   $16
         PLD
         TSC
         CLC
         ADC   #$0026
         TCS
         TYA
         RTL

L119F    ASC   '52~Tool editor: Memory creation error. Creation aborted.~^#0'
L11DB    ASC   '52~Tool editor: Depth get error. Creation aborted.~^#0'
L1211    ASC   '52~Tool editor: Could not get ID. Creation aborted.~^#0'
L1248    ASC   '52~Tool editor: Could not add resource error. Creation aborted.~^#0'
L128B    ASC   '52~Tool editor: Could not write resource. Creation aborted.~^#0'

*---

createRESOURCE
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02

         ldy   #$003C	; memID
         lda   [$00],Y
	 sta   memID

         LDY   #$0048
         LDA   [$00],Y
         AND   #$8000
         BNE   L12EA
         BRL   L1929

L12EA    LDA   $2B
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         JSL   readRESOURCE	; load resource
         STX   $18
         STA   $16
         LDA   $16	; check handle
         ORA   $18
         BEQ   L1304	; empty, error
         BRL   L1344	; not empty, continue

* Resource is not loaded, display error

L1304    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1939	; cannot load resource
         PEA   L1939
         LDA   #$003F
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1341
         BRL   L1341
L1341    BRL   L1929

* Resource is loaded

L1344    LDX   $18
         LDA   $16
         PHX
         PHA
         _HUnlock
         STA   L2BCB
         LDA   #resSIZE	; was sizeFULLREC
         LDX   #$0000
         TAY
         BPL   L135E
         DEX
L135E    PHX
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _SetHandleSize
         STA   L2BCB
         LDA   L2BCB
         BNE   L1378
         BRL   L13F6

* Resource cannot be resized, display error

L1378    PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $2B
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $1E
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1978	; cannot resize resource
         PEA   L1978
         LDA   #$0041
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L13F3
         BRL   L13F3
L13F3    BRL   L1929

* Resource is resized

L13F6    LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L2BCB

* Now, prepare the resource handle LOGO

* 1. We see if we have IDs of 0 or a real ID for each string
*	=> we'll use the myRESOURCE thing
* 2. We ask for an rPString ID if needed
* 3. We build the rUpdate accordingly
* 4. We save or update the five pStrings

* Set depth

*	pha
*	PushWord #1
*	_SetResourceFileDepth
*	PullWord resDepth
	
* Clear my string buffers

	ldx	#256-2
]lp	stz	mySTRING1,x
	stz	mySTRING2,x
	stz	mySTRING3,x
	stz	mySTRING4,x
	stz	mySTRING5,x
	dex
	dex
	bpl	]lp

*----------------------------	
*--- Handle resource string 1

	lda	strID1
	ora	strID1+2
	bne	ID1exists

	pha
	pha
	PushWord #$ffff
	PushWord #rPString
	_UniqueResourceID
	PullLong strID1
	
ID1exists

*-

	PushWord #rPString
	PushLong strID1
	_RemoveResource

*-

	pha
	pha
	PushLong #$100	; maxSize
	PushWord memID
	PushWord #$c018
	PushLong #0
	_NewHandle
	PullLong haID1
	
*-

	pha	; for string 1
	pha
	PushLong ptrWINDOW
	PushLong #6
	_GetCtlHandleFromID
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02
	
	ldy	#$1e
	lda	[$00],y
	sta	theHANDLE+2
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE

	pha
	PushLong theHANDLE
	_LEGetTextLen
	PullWord lenSTRING1

	pha
	pha
	PushLong theHANDLE
	_LEGetTextHand
	PushLong #mySTRING1B
	PushLong lenSTRING1
	_HandToPtr

*-

	sep	#$20
	lda	lenSTRING1
	sta	mySTRING1
	rep	#$20
	
*-

	PushLong #mySTRING1
	PushLong haID1
	PushLong #$100
	_PtrToHand

*-
	
	PushLong haID1	; for string 1
	_HUnlock
	pea	$0000
	lda	lenSTRING1
	inc
	pha
	PushLong haID1
	_SetHandleSize
	PushLong haID1
	_HLock

*-
	
	PushLong haID1
	PushWord #0
	PushWord #rPString
	PushLong strID1
	_AddResource

*-

	PushWord #$ffff
	PushWord #rPString
	PushLong strID1
	_ReleaseResource

*----------------------------	
*--- Handle resource string 2

	lda	strID2
	ora	strID2+2
	bne	ID2exists

	pha
	pha
	PushWord #$ffff
	PushWord #rPString
	_UniqueResourceID
	PullLong strID2
	
ID2exists

*-

	PushWord #rPString
	PushLong strID2
	_RemoveResource

*-

	pha
	pha
	PushLong #$100	; maxSize
	PushWord memID
	PushWord #$c018
	PushLong #0
	_NewHandle
	PullLong haID2
	
*-

	pha	; for string 2
	pha
	PushLong ptrWINDOW
	PushLong #7
	_GetCtlHandleFromID
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02
	
	ldy	#$1e
	lda	[$00],y
	sta	theHANDLE+2
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE

	pha
	PushLong theHANDLE
	_LEGetTextLen
	PullWord lenSTRING2

	pha
	pha
	PushLong theHANDLE
	_LEGetTextHand
	PushLong #mySTRING2B
	PushLong lenSTRING2
	_HandToPtr

*-

	sep	#$20
	lda	lenSTRING2
	sta	mySTRING2
	rep	#$20
	
*-

	PushLong #mySTRING2
	PushLong haID2
	PushLong #$100
	_PtrToHand

*-
	
	PushLong haID2	; for string 2
	_HUnlock
	pea	$0000
	lda	lenSTRING2
	inc
	pha
	PushLong haID2
	_SetHandleSize
	PushLong haID2
	_HLock

*-
	
	PushLong haID2
	PushWord #0
	PushWord #rPString
	PushLong strID2
	_AddResource

*-

	PushWord #$ffff
	PushWord #rPString
	PushLong strID2
	_ReleaseResource

*----------------------------	
*--- Handle resource string 3

	lda	strID3
	ora	strID3+2
	bne	ID3exists

	pha
	pha
	PushWord #$ffff
	PushWord #rPString
	_UniqueResourceID
	PullLong strID3
	
ID3exists

*-

	PushWord #rPString
	PushLong strID3
	_RemoveResource

*-

	pha
	pha
	PushLong #$100	; maxSize
	PushWord memID
	PushWord #$c018
	PushLong #0
	_NewHandle
	PullLong haID3
	
*-

	pha	; for string 3
	pha
	PushLong ptrWINDOW
	PushLong #8
	_GetCtlHandleFromID
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02
	
	ldy	#$1e
	lda	[$00],y
	sta	theHANDLE+2
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE

	pha
	PushLong theHANDLE
	_LEGetTextLen
	PullWord lenSTRING3

	pha
	pha
	PushLong theHANDLE
	_LEGetTextHand
	PushLong #mySTRING3B
	PushLong lenSTRING3
	_HandToPtr

*-

	sep	#$20
	lda	lenSTRING3
	sta	mySTRING3
	rep	#$20
	
*-

	PushLong #mySTRING3
	PushLong haID3
	PushLong #$100
	_PtrToHand

*-
	
	PushLong haID3	; for string 3
	_HUnlock
	pea	$0000
	lda	lenSTRING3
	inc
	pha
	PushLong haID3
	_SetHandleSize
	PushLong haID3
	_HLock

*-
	
	PushLong haID3
	PushWord #0
	PushWord #rPString
	PushLong strID3
	_AddResource

*-

	PushWord #$ffff
	PushWord #rPString
	PushLong strID3
	_ReleaseResource

*----------------------------	
*--- Handle resource string 4

	lda	strID4
	ora	strID4+2
	bne	ID4exists

	pha
	pha
	PushWord #$ffff
	PushWord #rPString
	_UniqueResourceID
	PullLong strID4
	
ID4exists

*-

	PushWord #rPString
	PushLong strID4
	_RemoveResource

*-

	pha
	pha
	PushLong #$100	; maxSize
	PushWord memID
	PushWord #$c018
	PushLong #0
	_NewHandle
	PullLong haID4
	
*-

	pha	; for string 4
	pha
	PushLong ptrWINDOW
	PushLong #9
	_GetCtlHandleFromID
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02
	
	ldy	#$1e
	lda	[$00],y
	sta	theHANDLE+2
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE

	pha
	PushLong theHANDLE
	_LEGetTextLen
	PullWord lenSTRING4

	pha
	pha
	PushLong theHANDLE
	_LEGetTextHand
	PushLong #mySTRING4B
	PushLong lenSTRING4
	_HandToPtr

*-

	sep	#$20
	lda	lenSTRING4
	sta	mySTRING4
	rep	#$20
	
*-

	PushLong #mySTRING4
	PushLong haID4
	PushLong #$100
	_PtrToHand

*-
	
	PushLong haID4	; for string 4
	_HUnlock
	pea	$0000
	lda	lenSTRING4
	inc
	pha
	PushLong haID4
	_SetHandleSize
	PushLong haID4
	_HLock

*-
	
	PushLong haID4
	PushWord #0
	PushWord #rPString
	PushLong strID4
	_AddResource

*-

	PushWord #$ffff
	PushWord #rPString
	PushLong strID4
	_ReleaseResource

*----------------------------	
*--- Handle resource string 5

	lda	strID5
	ora	strID5+2
	bne	ID5exists

	pha
	pha
	PushWord #$ffff
	PushWord #rPString
	_UniqueResourceID
	PullLong strID5
	
ID5exists

*-

	PushWord #rPString
	PushLong strID5
	_RemoveResource

*-

	pha
	pha
	PushLong #$100	; maxSize
	PushWord memID
	PushWord #$c018
	PushLong #0
	_NewHandle
	PullLong haID5
	
*-

	pha	; for string 5
	pha
	PushLong ptrWINDOW
	PushLong #10
	_GetCtlHandleFromID
	pla
	sta	$00
	pla
	sta	$02
	
	ldy	#2
	lda	[$00],y
	tax
	lda	[$00]
	sta	$00
	stx	$02
	
	ldy	#$1e
	lda	[$00],y
	sta	theHANDLE+2
	ldy	#$1c
	lda	[$00],y
	sta	theHANDLE

	pha
	PushLong theHANDLE
	_LEGetTextLen
	PullWord lenSTRING5

	pha
	pha
	PushLong theHANDLE
	_LEGetTextHand
	PushLong #mySTRING5B
	PushLong lenSTRING5
	_HandToPtr

*-

	sep	#$20
	lda	lenSTRING5
	sta	mySTRING5
	rep	#$20
	
*-

	PushLong #mySTRING5
	PushLong haID5
	PushLong #$100
	_PtrToHand

*-
	
	PushLong haID5	; for string 5
	_HUnlock
	pea	$0000
	lda	lenSTRING5
	inc
	pha
	PushLong haID5
	_SetHandleSize
	PushLong haID5
	_HLock

*-
	
	PushLong haID5
	PushWord #0
	PushWord #rPString
	PushLong strID5
	_AddResource

*-

	PushWord #$ffff
	PushWord #rPString
	PushLong strID5
	_ReleaseResource

* The end

	pha
	PushWord resDepth
	_SetResourceFileDepth
	PullWord resDepth

* Copy the updated resource

	PushLong #myRESOURCE
	pei	$18
	pei	$16
	PushLong #resSIZE
	_PtrToHand

* Clear the resource

	ldx	#0
]lp	stz	myRESOURCE,x
	inx
	inx
	cpx	#resSIZE
	bcc	]lp
		
* Resource is formatted, write it

L190C    LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L2BCB

         LDA   $2B
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         JSL   writeRESOURCE

L1929    LDA   $21
         STA   $2B
         LDA   $20
         STA   $2A
         PLD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L1939    ASC   '52~Tool editor: Could not load resource. Changes not saved.~^#0'
L1978    ASC   '52~Tool editor: Could not resize resource. Changes not saved.~^#0'
L19B9    ASC   '52~Tool editor: Could not resize handle. Changes not saved.~^#0'

resDepth	ds	2

*--- Init controls of the editor window

initWINCONTROLS
         TSC
         SEC
         SBC   #$0028
         TCS
         PHD
         INC
         TCD
         LDA   #$0001
         STA   $16
         LDA   #$0001
         STA   $26

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   readRESOURCE
         STX   $22
         STA   $20
         LDA   $20
         ORA   $22
         BEQ   L1BBC
         BRL   L1BFC

* Cannot load resource

L1BBC    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1DCF	; cannot load resource
         PEA   L1DCF
         LDA   #$003D
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1BF9
         BRL   L1BF9
L1BF9    BRL   L1D68

* Resource is now in memory

L1BFC    LDX   $22
         LDA   $20
         PHX
         PHA
         _HLock
         STA   L2BCB

         LDY   #$0002	; set the pointer
         LDA   [$20],Y
         TAX
         LDA   [$20]
         STX   $08
         STA   $06

* Copy the resource

	ldy	#0
]lp	lda	[$06],y
	sta	myRESOURCE,y
	iny
	iny
	cpy	#resSIZE
	bcc	]lp
	
* Init my flags

	stz	lenSTRING1	; 0 means empty string
	stz	lenSTRING2
	stz	lenSTRING3
	stz	lenSTRING4
	stz	lenSTRING5
	
	ldx	#256-2		; clear
]lp	stz	mySTRING1,x
	stz	mySTRING2,x
	stz	mySTRING3,x
	stz	mySTRING4,x
	stz	mySTRING5,x
	dex
	dex
	bpl	]lp

* Now, load the associated 5 rPStrings

	pha
	pha
	PushWord #rPString
	ldy	#4
	lda	[$06],y
	pha
	ldy	#2
	lda	[$06],y
	pha
	_LoadResource
	pla
	plx
	bcs	next2

	phx
	pha
	PushLong #mySTRING1
	PushLong #256
	_HandToPtr

	PushWord #-1
	PushWord #rPString
	ldy	#4
	lda	[$06],y
	pha
	ldy	#2
	lda	[$06],y
	pha
	_ReleaseResource
	
next2	pha		; get handle of control
	pha
	PushLong ptrWINDOW
	PushLong #6
	_GetCtlHandleFromID
	pla
	plx
	bcs	next3
	sta	theHANDLE
	stx	theHANDLE+2

	PushLong #mySTRING1B	; pointer to text
	
	lda	mySTRING1	; length of text
	and	#$00ff
	sta	lenSTRING1
	pha
	
	pha		; get the line edit control from the lineedit control
	pha
	PushLong theHANDLE
	_GetCtlTitle
	_LESetText
	
* Now, load the associated 5 rPStrings

next3	pha
	pha
	PushWord #rPString
	ldy	#8
	lda	[$06],y
	pha
	ldy	#6
	lda	[$06],y
	pha
	_LoadResource
	pla
	plx
	bcs	next4

	phx
	pha
	PushLong #mySTRING2
	PushLong #256
	_HandToPtr

	PushWord #-1
	PushWord #rPString
	ldy	#8
	lda	[$06],y
	pha
	ldy	#6
	lda	[$06],y
	pha
	_ReleaseResource
	
next4	pha		; get handle of control
	pha
	PushLong ptrWINDOW
	PushLong #7
	_GetCtlHandleFromID
	pla
	plx
	bcs	next5
	sta	theHANDLE
	stx	theHANDLE+2

	PushLong #mySTRING2B	; pointer to text
	
	lda	mySTRING2	; length of text
	and	#$00ff
	sta	lenSTRING2
	pha
	
	pha		; get the line edit control from the lineedit control
	pha
	PushLong theHANDLE
	_GetCtlTitle
	_LESetText
	
* Now, load the associated 5 rPStrings

next5	pha
	pha
	PushWord #rPString
	ldy	#12
	lda	[$06],y
	pha
	ldy	#10
	lda	[$06],y
	pha
	_LoadResource
	pla
	plx
	bcs	next6

	phx
	pha
	PushLong #mySTRING3
	PushLong #256
	_HandToPtr

	PushWord #-1
	PushWord #rPString
	ldy	#12
	lda	[$06],y
	pha
	ldy	#10
	lda	[$06],y
	pha
	_ReleaseResource
	
next6	pha		; get handle of control
	pha
	PushLong ptrWINDOW
	PushLong #8
	_GetCtlHandleFromID
	pla
	plx
	bcs	next7
	sta	theHANDLE
	stx	theHANDLE+2

	PushLong #mySTRING3B	; pointer to text
	
	lda	mySTRING3	; length of text
	and	#$00ff
	sta	lenSTRING3
	pha
	
	pha		; get the line edit control from the lineedit control
	pha
	PushLong theHANDLE
	_GetCtlTitle
	_LESetText
	
* Now, load the associated 5 rPStrings

next7	pha
	pha
	PushWord #rPString
	ldy	#16
	lda	[$06],y
	pha
	ldy	#14
	lda	[$06],y
	pha
	_LoadResource
	pla
	plx
	bcs	next8

	phx
	pha
	PushLong #mySTRING4
	PushLong #256
	_HandToPtr

	PushWord #-1
	PushWord #rPString
	ldy	#16
	lda	[$06],y
	pha
	ldy	#14
	lda	[$06],y
	pha
	_ReleaseResource
	
next8	pha		; get handle of control
	pha
	PushLong ptrWINDOW
	PushLong #9
	_GetCtlHandleFromID
	pla
	plx
	bcs	next9
	sta	theHANDLE
	stx	theHANDLE+2

	PushLong #mySTRING4B	; pointer to text
	
	lda	mySTRING4	; length of text
	and	#$00ff
	sta	lenSTRING4
	pha
	
	pha		; get the line edit control from the lineedit control
	pha
	PushLong theHANDLE
	_GetCtlTitle
	_LESetText
	
* Now, load the associated 5 rPStrings

next9	pha
	pha
	PushWord #rPString
	ldy	#20
	lda	[$06],y
	pha
	ldy	#18
	lda	[$06],y
	pha
	_LoadResource
	pla
	plx
	bcs	next10

	phx
	pha
	PushLong #mySTRING5
	PushLong #256
	_HandToPtr

	PushWord #-1
	PushWord #rPString
	ldy	#20
	lda	[$06],y
	pha
	ldy	#18
	lda	[$06],y
	pha
	_ReleaseResource
	
next10	pha		; get handle of control
	pha
	PushLong ptrWINDOW
	PushLong #10
	_GetCtlHandleFromID
	pla
	plx
	bcs	next11
	sta	theHANDLE
	stx	theHANDLE+2

	PushLong #mySTRING5B	; pointer to text
	
	lda	mySTRING5	; length of text
	and	#$00ff
	sta	lenSTRING5
	pha
	
	pha		; get the line edit control from the lineedit control
	pha
	PushLong theHANDLE
	_GetCtlTitle
	_LESetText
	
next11			; end of the funny initialization, ahem...
	
*---

L1D63    LDA   #$0000
         STA   $16
L1D68    PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $24
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0028
         TCS
         TXA
         RTL

L1DCF    ASC   '52~Tool editor: Could not load resource. Setting aborted.~^#0'

*--- Ask for memory

prepareWINDOW
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD

         PHA		; space for result
         PHA
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L1E21
         DEX
L1E21    PHX		; size of block to create
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA		; memory ID
         LDA   #$8000	; locked
         CLC
         ADC   #$4000	; fixed
         PHA		; attributes
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L1E45
         DEX
L1E45    PHX		; locationPtr
         PHA
         _NewHandle
         STA   L2BCB
         PLA
         STA   haMEMORY
         PLA
         STA   haMEMORY+2
         LDA   L2BCB
         BNE   L1E61
         BRL   L1EBC

* Memmory error

L1E61    LDA   busyFLAG
         BEQ   L1E69
         BRL   L1E7C
L1E69    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         CLC
         ADC   #$0036
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L1E7C    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L2054	; cannot open window
         PEA   L2054
         LDA   #$0035
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1EB9
         BRL   L1EB9
L1EB9    BRL   L204C

* Memory is allocated

L1EBC    LDX   haMEMORY+2	; deref
         LDA   haMEMORY
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STX   $08	; save pointer
         STA   $06
         PEI   $08
         PEI   $06
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036	; get supported resource type
         LDA   [$00],Y
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]	; +00 word - save supported resource type to newly allocated buffer

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; +02 long - source window pointer
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDY   #$0002
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y

         LDY   #$0006	; +06 word - zero
         LDA   #$0000
         STA   [$06],Y

         PHA
         PHA
         _FrontWindow
         STA   L2BCB
         LDY   #$0008	; +08 long - front window pointer
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y

         JSL   showWINDOW	; show my new window

         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         _SetPort
         STA   L2BCB

         JSL   initWINCONTROLS
         TAX
         BNE   L1F4D
         BRL   L1F74

* Error at init

L1F4D    LDX   haMEMORY+2
         LDA   haMEMORY
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         _CloseWindow
         STA   L2BCB
         BRL   L204C

* No errors, we're good

L1F74    LDA   YCOORD
         CLC
         ADC   #$000A
         STA   YCOORD
         LDA   xCOORD
         CLC
         ADC   #$001E
         STA   xCOORD
         LDA   #$001E
         LDX   #$0001
         SEC
         SBC   YCOORD
         BEQ   L1F9B
         BVS   L1F99
         EOR   #$8000
L1F99    BMI   L1F9C
L1F9B    DEX
L1F9C    TXA
         PHA
         LDA   YCOORD
         LDX   #$0001
         SEC
         SBC   #$0050
         BEQ   L1FB1
         BVS   L1FAF
         EOR   #$8000
L1FAF    BMI   L1FB2
L1FB1    DEX
L1FB2    TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L1FBC
         BRL   L1FC2
L1FBC    LDA   #$001E
         STA   YCOORD
L1FC2    LDA   #$001E
         LDX   #$0001
         SEC
         SBC   xCOORD
         BEQ   L1FD5
         BVS   L1FD3
         EOR   #$8000
L1FD3    BMI   L1FD6
L1FD5    DEX
L1FD6    TXA
         PHA
         LDA   xCOORD
         LDX   #$0001
         SEC
         SBC   #$00B4
         BEQ   L1FEB
         BVS   L1FE9
         EOR   #$8000
L1FE9    BMI   L1FEC
L1FEB    DEX
L1FEC    TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L1FF6
         BRL   L1FFC
L1FF6    LDA   #$001E
         STA   xCOORD
L1FFC    LDA   xCOORD	; X-coord
         PHA
         LDA   YCOORD	; Y-coord
         PHA
         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         _MoveWindow
         STA   L2BCB
         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         _ShowWindow
         STA   L2BCB

         LDX   haMEMORY+2	; associate the newly allocated buffer
         LDA   haMEMORY		; to the refcon of the window
         PHX
         PHA
         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         _SetWRefCon
         STA   L2BCB

         LDA   busyFLAG		; set the busy flag
         CLC
         ADC   #$0001
         STA   busyFLAG
L204C    PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L2054    ASC   '52~Tool editor: Memory error. Cannot open window.~^#0'

getFRONTWINDOW    TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _FrontWindow
         STA   L2BCB
         PLA
         STA   ptrWINDOW
         PLA
         STA   ptrWINDOW+2
         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         _SetPort
         STA   L2BCB
         PHA
         PHA
         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         _GetWRefCon
         STA   L2BCB
         PLA
         STA   haMEMORY
         PLA
         STA   haMEMORY+2
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

*--- Create a resource and dispose memory

createDISPOSE    TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036	; supported resource type
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         LDX   ptrWINDOW+2
         LDA   ptrWINDOW
         PHX
         PHA
         JSL   createRESOURCE

         LDX   ptrWINDOW+2	; close the window
         LDA   ptrWINDOW
         PHX
         PHA
         _CloseWindow
         STA   L2BCB

         PHA
         PHA
         LDX   haMEMORY+2
         LDA   haMEMORY
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _FindHandle
         STA   L2BCB
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L2BCB
         BNE   L2158
         BRL   L2198

* Handle not found

L2158    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L2213	; memory location error
         PEA   L2213	; ie. cannot find handle
         LDA   #$003F
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L2195
         BRL   L2195
L2195    BRL   L21ED

* Handle found, dispose it

L2198    LDX   $18
         LDA   $16
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDA   L2BCB
         BNE   L21B0
         BRL   L21ED

* Dispose failed

L21B0    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L2252	; memory disposal error
         PEA   L2252
         LDA   #$003E
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L21ED
         BRL   L21ED

* Dispose succeeded

L21ED    LDA   busyFLAG	; busy flag
         SEC
         SBC   #$0001
         STA   busyFLAG
         LDA   YCOORD
         SEC
         SBC   #$000A
         STA   YCOORD
         LDA   xCOORD
         SEC
         SBC   #$001E
         STA   xCOORD
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L2213    ASC   '52~Tool editor: Memory location error. Consider rebooting.~^#0'
L2252    ASC   '52~Tool editor: Memory disposal error. Consider rebooting.~^#0'

L2290    TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _GetWRefCon
         STA   L2BCB
         PLA
         STA   $16
         PLA
         STA   $18
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0001
         BEQ   L22D9
         BRL   L231C
L22D9    LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         TAX
         LDY   #$0002
         LDA   [$00],Y
         PHX
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         JSL   createRESOURCE
L231C    PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

*--- Handle control click

doCONTROL
         TSC
         SEC
         SBC   #$0018
         TCS
         PHD
         INC
         TCD
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0028	; which control ID?
         LDA   [$00],Y
         TAX
         LDY   #$0026
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L2BCB
         PLA
         STA   $16
         LDA   $16
         BNE   L2359
         BRL   L2381

* Control ID exists

L2359    LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

L2381    LDA   $16	; check the preferred button
         CMP   #$1000
         BEQ   L238B
         BRL   L23C9

* OK, make a preferred resource then

L238B    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   makeSTDRESOURCE
         TAX
         BNE   L23BC
         BRL   L23BF
L23BC    BRL   L23C9

* init the controls

L23BF    JSL   initWINCONTROLS
         TAX
         BNE   L23C9
         BRL   L23C9

L23C9    PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

*--- Versions editor: entry point

entryPOINT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$004E	; get resource file ID
         LDA   [$00],Y
         STA   resfileID
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003E	; get command
         LDA   [$00],Y
         BRL   L27E6

*--- Command 0 - Prepare me

doCOMMAND0
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; is window open?
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L241E
         DEX
L241E    LDY   #$0001
         CMP   $01,S	; buffer+$38 = $0000?
         BEQ   L2426	; yes
         DEY		; no
L2426    TXA
         CMP   $03,S	; buffer+$3a = $0000?
         BEQ   L242E	; yes
         LDY   #$0000	; no
L242E    PLA
         PLA
         TYA
         BNE   L2436	; both are zeros, we are here
         BRL   L24DE	; prepare window

* We have a window

L2436    JSL   L0E80	; prepare the resource
         PHX
         PHA
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0038	; save the window/resource handle
         PHA		; at buffer + $38
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; check emptiness of window/resource ID
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L2479
         DEX
L2479    LDY   #$0001
         CMP   $01,S
         BEQ   L2481
         DEY
L2481    TXA
         CMP   $03,S
         BEQ   L2489
         LDY   #$0000
L2489    PLA
         PLA
         TYA
         BNE   L2491
         BRL   L24B2

* we have no window/resource ID

L2491    LDA   busyFLAG	; are we busy?
         BEQ   L2499
         BRL   L24AC	; we are busy

* We're not busy

L2499    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         CLC
         ADC   #$0036	; we have nothing
         STA   $00	; tell no resource type as well
         STX   $02
         LDA   #$0000
         STA   [$00]

L24AC    BRL   L24E2	; exit editor
         BRL   L24DE

* window/resource exists

L24B2    LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         JSL   updateBUFFER
	 
L24DE    JSL   prepareWINDOW	; no active window
L24E2    BRL   exitEDITOR

*--- Command 1 - Return name of the editor

doCOMMAND1
         LDX   #^myBUFFER1	; return the name of the editor
         LDA   #myBUFFER1	; at buffer offset $2E
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^strEDITOR
         PEA   strEDITOR
         LDA   strEDITOR2-strEDITOR	; length of string
         PHA
         JSL   copyDATA	; copy string

         PEA   ^myBUFFER1	; 0
         PEA   myBUFFER1	; 1
         LDA   ptrBUFFER+2
         PHA		; 2
         LDA   ptrBUFFER
         PHA		; 3
         PLA		; 3
         CLC
         ADC   #$002E
         PHA		; 3
         PLA		; 3
         STA   $00
         PLA		; 2
         STA   $02
         PLA		; 1
         STA   [$00]
         LDY   #$0002
         PLA		; 0
         STA   [$00],Y
         BRL   exitEDITOR

*--- Command 2 - Interact with window

doCOMMAND2
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$004A	; TaskMaster result
         LDA   [$00],Y
         CMP   #$0008	; activateEvent
         BEQ   L253C
         BRL   L2543

L253C    JSL   L2290	; get the refcon
         BRL   L259E

L2543    JSL   getFRONTWINDOW
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$004A	; TaskMaster result
         LDA   [$00],Y
         BRL   L256A

* wInGoAway

L2559    JSL   createDISPOSE	; create a resource and dispoes memory
         BRL   L259E	; exit editor

* wInControl

L2560    JSL   doCONTROL
         BRL   L259E	; exit editor
L2567    BRL   L259E	; exit editor

L256A    SEC
         SBC   #$0016
         CMP   #$000C
         BCC   L2576
         LDA   #$000C
L2576    ASL
         TAX
         LDAL  L2584,X
         BEQ   L2580
         PHA
         RTS

L2580    JSL   L2C09

L2584    DA    L2559-1	; 0 16 wInGoAway *
         DA    L2567-1	; 1 17 wInZoom
         DA    L2567-1	; 2 18 wInInfo
         DA    L2567-1	; 3 19 wInSpecial
         DA    L2567-1	; 4 1A wInDeskItem
         DA    L2567-1	; 5 1B wInFrame
         DA    L2567-1	; 6 1C wInactMenu
         DA    L2567-1	; 7 1D wClosedNDA
         DA    L2567-1	; 8 1E wCalledSysEdit
         DA    L2567-1	; 9 1F wTrackZoom
         DA    L2567-1	; A 20 wHitFrame
         DA    L2560-1	; B 21 wInControl * 
         DA    L2567-1	; C 22 wInControlMenu

L259E    BRL   exitEDITOR

*--- Command 3 - The init command

doCOMMAND3
         LDA   #$0000
         STA   YCOORD
         LDA   #$0000
         STA   xCOORD
         LDA   #$0000
         STA   busyFLAG

         LDX   #^myBUFFER1	; copy the name
         LDA   #myBUFFER1	; of the supported resource
         PHX			; returns the address in
         PHA			; the buffer at offset $2E
         LDA   #$FF01
         PHA
         PEA   ^strRESOURCE
         PEA   strRESOURCE
         LDA   #strRESOURCE2-strRESOURCE		; 'Tool table' is 10 chars
         PHA
         JSL   copyDATA
         PEA   ^myBUFFER1
         PEA   myBUFFER1
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$002E	; source pointer of data to be copied
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         CLC
         ADC   #$0036
         STA   $00
         STX   $02

         LDA   #resTYPE	; resource type that the editor handles
         STA   [$00]

* Clear the resource

	ldx	#0
]lp	stz	myRESOURCE,x
	inx
	inx
	cpx	#resSIZE
	bcc	]lp
	
* Init my flags

	stz	lenSTRING1	; 0 means empty string
	stz	lenSTRING2
	stz	lenSTRING3
	stz	lenSTRING4
	stz	lenSTRING5
	
	ldx	#256-2		; clear
]lp	stz	mySTRING1,x
	stz	mySTRING2,x
	stz	mySTRING3,x
	stz	mySTRING4,x
	stz	mySTRING5,x
	dex
	dex
	bpl	]lp

         BRL   exitEDITOR
	 
*--- Command 4

doCOMMAND4
         JSL   getFRONTWINDOW
         JSL   createDISPOSE
         BRL   exitEDITOR

*--- Command 7

doCOMMAND7
         JSL   getFRONTWINDOW
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036		; supported resource type
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A		; window pointer?
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         LDX   ptrWINDOW+2	; GRAFPORT
         LDA   ptrWINDOW
         PHX
         PHA
         JSL   createRESOURCE	; format resource
         BRL   exitEDITOR

*--- Command 5
*--- Command 6
*--- Command 8

unsupCOMMAND    BRL   exitEDITOR

*--- Manages commands

L27E6    CMP   #$0008
         BCC   L27EE
         LDA   #$0008
L27EE    ASL
         TAX
         LDAL  L27FC,X
         BEQ   L27F8
         PHA
         RTS

L27F8    JSL   L2C09

L27FC    DA    doCOMMAND0-1	; 0
         DA    doCOMMAND1-1	; 1
         DA    doCOMMAND2-1	; 2
         DA    doCOMMAND3-1	; 3
         DA    doCOMMAND4-1	; 4
         DA    unsupCOMMAND-1	; 5
         DA    unsupCOMMAND-1	; 6
         DA    doCOMMAND7-1	; 7
         DA    unsupCOMMAND-1	; 8

exitEDITOR
         LDA   #$0000
         STA   $16
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         TXA
         RTL

strEDITOR	ASC   'rUpdateInfo editor v1'
strEDITOR2
strRESOURCE	ASC   'Update Info'
strRESOURCE2

YCOORD    DW    $0000
xCOORD    DW    $0000
ptrBUFFER    ADRL  $00000000	; pointer to the shell buffer
busyFLAG    DW    $0000		; the busy flag
resfileID    DW    $0000
haMEMORY    ADRL  $00000000
haMEMORY2    ADRL  $00000000
ptrWINDOW    ADRL  $00000000
theHANDLE	ds	4
memID	ds	2

*--- Buffers

myRESOURCE
	ds	2	; version = 0
strID1	ds	4	; 0: ID to create, <>0: ID to use
strID2	ds	4
strID3	ds	4
strID4	ds	4
strID5	ds	4

haID1	ds	4	; memory handle of rPString
haID2	ds	4
haID3	ds	4
haID4	ds	4
haID5	ds	4

myBUFFER1    DS    $100
myBUFFER2    DS    $100

mySTRING1	ds	$1
mySTRING1B	ds	$ff
mySTRING2	ds	$1
mySTRING2B	ds	$ff
mySTRING3	ds	$1
mySTRING3B	ds	$ff
mySTRING4	ds	$1
mySTRING4B	ds	$ff
mySTRING5	ds	$1
mySTRING5B	ds	$ff

lenSTRING1	ds	4
lenSTRING2	ds	4
lenSTRING3	ds	4
lenSTRING4	ds	4
lenSTRING5	ds	4

*--- Copy data
*
* long 11..14 - destination buffer
* word 0F..10 - 
* long 0B..0E - source buffer
* word 09..0A - source length

copyDATA    TDC
         TAX
         TSC
         SEC
         SBC   #$0005
         TCD
         DEC
         TCS
         PHX
         LDA   $09
         CMP   $0F
         BNE   L2AC7
         LDA   $13
         PHA
         LDA   $11
         PHA
         LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         BPL   L2AC0
         EOR   #$FFFF
         INC
         INC
L2AC0    PHA
         JSL   L2E77
         BRA   L2B3D

L2AC7    LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         PHA
         JSR   L2B4D
         PLA
         STA   $09
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDA   $13
         STA   $04
         LDA   $11
         STA   $02
         LDA   $0F
         BPL   L2AF2
         EOR   #$FFFF
         INC
         INC   $11
         BNE   L2AF2
         INC   $13
L2AF2    CMP   $09
         BCC   L2AF8
         LDA   $09
L2AF8    TAY
         STA   $00
         BEQ   L2B21
         LSR
         BCC   L2B17
         SEP   #$20
         LDA   [$0B]
         STA   [$11]
         REP   #$20
         INC   $0B
         BNE   L2B0E
         INC   $0D
L2B0E    INC   $11
         BNE   L2B14
         INC   $13
L2B14    DEY
         BEQ   L2B21
L2B17    DEY
         DEY
L2B19    LDA   [$0B],Y
         STA   [$11],Y
         DEY
         DEY
         BPL   L2B19
L2B21    LDY   $0F
         BPL   L2B2F
         SEP   #$20
         LDA   $00
         STA   [$02]
         REP   #$20
         BRA   L2B3D
L2B2F    LDY   $00
         CPY   $0F
         BCS   L2B3D
         SEP   #$20
         LDA   #$00
         STA   [$02],Y
         REP   #$20
L2B3D    LDA   $07
         STA   $13
         LDA   $06
         STA   $12
         CLC
         TDC
         ADC   #$0011
         PLD
         TCS
         RTL

L2B4D    PHD
         TSC
         TCD
         LDA   $05
         BEQ   L2B9D
         BPL   L2B8A
         INC
         BNE   L2B7B
         LDA   $09
         AND   #$00FF
         BNE   L2B64
         STZ   $05
         BRA   L2B9D
L2B64    LDA   #$0001
         STA   $05
         LDA   $09
         STAL  L2B9F
         LDA   #L2B9F
         STA   $07
         LDA   #^L2B9F
         STA   $09
         BRA   L2B9D
L2B7B    LDA   [$07]
         AND   #$00FF
         STA   $05
         INC   $07
         BNE   L2B88
         INC   $09
L2B88    BRA   L2B9D
L2B8A    LDX   $05
         LDY   #$0000
         SEP   #$20
L2B91    LDA   [$07],Y
         BEQ   L2B99
         INY
         DEX
         BNE   L2B91
L2B99    STY   $05
         REP   #$20
L2B9D    PLD
         RTS

L2B9F    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L2BAD
L2BAD    DB    $00
         DB    $00
         ADRL  L2BB3
L2BB3    DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L2BBB
L2BBB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2BCB    DB    $00
         DB    $00
L2BCD    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2BD5    DB    $00
         DB    $00
L2BD7    DB    $00
         DB    $00
L2BD9    DB    $00
L2BDA    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L2BE7    PHA
         JSL   L2E62
         LDAL  L2BCD
         PHA
         _DisposeAll
         PLA
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L2C03

L2C03    ADRL  L2C07      ;  path name
L2C07    DW    $0000      ;  flags

L2C09    PEA   $0008
         JSL   L2C16
         LDA   #$FFFF
         JMP   L2BE7

L2C16    LDA   $04,S
         PHA
         JSL   L2D39
         JMPL  L2C21

L2C21    PHK
         PLB
         LDA   L2BD9
         BNE   L2C2B
         BRL   L2D33
L2C2B    BRA   L2C45
L2C2D    STR   'Error occurred at line '
L2C45    PEA   ^L2C2D
         PEA   L2C2D
         _ErrWriteString
         LDA   L2BD9
         PHA
         PEA   $0001
         PEA   $0000
         PEA   $0001
         JSL   L31B3
         BRA   L2C74
L2C65    STR   ' in procedure '
L2C74    PEA   ^L2C65
         PEA   L2C65
         _ErrWriteString
         PEA   ^L2BDA
         PEA   L2BDA
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L31E3
         JSL   L2EC1
         LDA   L2BD5
         ORA   L2BD7
         BNE   L2CA3
         BRL   L2D33
L2CA3    PEA   $000D
         _ErrWriteChar
         PEA   $000A
         _ErrWriteChar
         BRA   L2CC6
L2CB9    STR   '  Line  Name'
L2CC6    PEA   ^L2CB9
         PEA   L2CB9
         _ErrWriteLine
         BRA   L2CE2
L2CD5    STR   '  ----  ----'
L2CE2    PEA   ^L2CD5
         PEA   L2CD5
         _ErrWriteLine
L2CEF    LDA   L2BD5
         ORA   L2BD7
         BEQ   L2D33
         LDA   L2BD9
         PHA
         PEA   $0006
         PEA   $0000
         PEA   $0001
         JSL   L31B3
         BRA   L2D0D
L2D0A    STR   '  '
L2D0D    PEA   ^L2D0A
         PEA   L2D0A
         _ErrWriteString
         PEA   ^L2BDA
         PEA   L2BDA
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L31E3
         JSL   L2EC1
         BRA   L2CEF
L2D33    LDA   #$FFFF
         BRL   L2BE7

L2D39    PHD
         PEA   ^L2D63
         PEA   L2D63
         TSC
         TCD
         LDX   $0A
L2D44    DEX
         BEQ   L2D53
         SEC
         LDA   [$01]
         AND   #$00FF
         ADC   $01
         STA   $01
         BRA   L2D44
L2D53    _ErrWriteLine
         PLD
         LDA   $02,S
         STA   $04,S
         PLA
         STA   $01,S
         RTL

L2D63    STR   'Subrange exceeded'
         STR   'File is not open'
         STR   'Read while at end of file'
         STR   'I/O error'
         STR   'Out of memory'
         STR   'EOLN while at end of file'
         STR   'Set overflow'
         STR   'Jump to undefined case statement label'
         STR   'Integer math error'
         STR   'Real math error'
         STR   'Underflow'
         STR   'Overflow'
         STR   'Divide by zero'
         STR   'Inexact'
         STR   'Stack overflow'
L2E62    PHB
         PHK
         PLB
         STZ   L2EF2
         STZ   L2EF4
         LDX   #$0026
L2E6E    STZ   L2EF6,X
         DEX
         DEX
         BPL   L2E6E
         PLB
         RTL

L2E77    TDC
         TAX
         TSC
         SEC
         SBC   #$FFFF
         TCD
         DEC
         TCS
         PHX
         LDA   $03
         LSR
         BCC   L2E9D
         SEP   #$20
         LDA   [$05]
         STA   [$09]
         REP   #$20
         INC   $05
         BNE   L2E95
         INC   $07
L2E95    INC   $09
         BNE   L2E9B
         INC   $0B
L2E9B    DEC   $03
L2E9D    LDY   $03
         BEQ   L2EB1
         DEY
         DEY
         BEQ   L2EAD
L2EA5    LDA   [$05],Y
         STA   [$09],Y
         DEY
         DEY
         BNE   L2EA5
L2EAD    LDA   [$05]
         STA   [$09]
L2EB1    LDA   $01
         STA   $0B
         LDA   $00
         STA   $0A
         CLC
         TDC
         ADC   #$0009
         PLD
         TCS
         RTL

L2EC1    PHB
         PHK
         PLB
         LDA   L2BD7
         STA   $02
         LDA   L2BD5
         STA   $00
         LDY   #$0010
L2ED1    LDA   [$00],Y
         STA   L2BD5,Y
         DEY
         DEY
         BPL   L2ED1
         LDA   $02
         PHA
         LDA   $00
         PHA
         JSL   L2F1E
         PLB
         RTL

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2EF2    DB    $00
         DB    $00
L2EF4    DB    $00
         DB    $00
L2EF6    DB    $00
         DB    $00
L2EF8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2F1E    TSC
         PHD
         TCD
         LDY   $04
         LDX   $06
         SEC
         TYA
         SBC   #$0002
         STA   $04
         BCS   L2F30
         DEC   $06
L2F30    LDA   [$04]
         BNE   L2F3B
         TYA
         JSL   L3039
         BRA   L2F40
L2F3B    TYA
         JSL   L2F4C
L2F40    LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

L2F4C    PHA
         PHA
         PHA
         SEC
         SBC   #$0004
         BCS   L2F56
         DEX
L2F56    PHX
         PHA
         TSC
         PHD
         TCD
         LDA   [$01]
         BPL   L2F62
         BRL   L3031
L2F62    LDA   [$01]
         ORA   #$8000
         STA   [$01]
         LDY   #$0002
         LDA   [$01],Y
         STA   $09
         TAY
         LDA   $01
         LDX   $03
         JSL   L30AD
L2F79    LDA   $09
         CMP   #$1000
         BCC   L2F83
         BRL   L301F
L2F83    LDA   [$01]
         AND   $09
         BEQ   L2FDA
         SEC
         LDA   $01
         SBC   $09
         STA   $05
         LDA   $03
         SBC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BEQ   L2FA3
         BRL   L3031
L2FA3    LDA   [$05]
         BMI   L2FAA
         BRL   L3031
L2FAA    LDY   $09
         LDX   $03
         LDA   $01
         JSL   L30D8
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L30D8
         LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         ASL   $09
         LDA   $09
         LDY   #$0002
         STA   [$01],Y
         TAY
         LDA   $01
         LDX   $03
         JSL   L30AD
         BRA   L2F79
L2FDA    CLC
         LDA   $01
         ADC   $09
         STA   $05
         LDA   $03
         ADC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BNE   L3031
         LDA   [$05]
         BPL   L3031
         LDY   $09
         LDX   $03
         LDA   $01
         JSL   L30D8
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L30D8
         ASL   $09
         LDY   #$0002
         LDA   $09
         STA   [$01],Y
         LDY   $09
         LDA   $01
         LDX   $03
         JSL   L30AD
         BRL   L2F79
L301F    LDY   $09
         LDA   $01
         LDX   $03
         JSL   L30D8
         LDA   $01
         LDX   $03
         JSL   L3039
L3031    PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         RTL

L3039    PHA
         PHA
         SEC
         SBC   #$000E
         BCS   L3042
         DEX
L3042    PHX
         PHA
         TSC
         PHD
         TCD
         LDY   #$0002
         LDA   [$01],Y
         ORA   [$01]
         BNE   L3063
         LDY   #$0004
         LDA   [$01],Y
         STAL  L2EF2
         INY
         INY
         LDA   [$01],Y
         STAL  L2EF4
         BRA   L3078
L3063    LDA   [$01]
         STA   $05
         LDA   [$01],Y
         STA   $07
         LDY   #$0004
         LDA   [$01],Y
         STA   [$05],Y
         INY
         INY
         LDA   [$01],Y
         STA   [$05],Y
L3078    LDY   #$0004
         LDA   [$01],Y
         TAX
         INY
         INY
         ORA   [$01],Y
         BEQ   L3095
         LDA   [$01],Y
         STA   $07
         STX   $05
         LDY   #$0002
         LDA   [$01]
         STA   [$05]
         LDA   [$01],Y
         STA   [$05],Y
L3095    LDY   #$000A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         _DisposeHandle
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L30AD    PHX
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L3143
         LDY   #$0004
         LDAL  L2EF6,X
         STA   [$01],Y
         INY
         INY
         LDAL  L2EF8,X
         STA   [$01],Y
         LDA   $01
         STAL  L2EF6,X
         LDA   $03
         STAL  L2EF8,X
         PLD
         PLA
         PLA
         RTL

L30D8    PHX
         PHA
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L3143
         LDAL  L2EF6,X
         STA   $05
         LDAL  L2EF8,X
         STA   $07
L30F5    LDA   $05
         CMP   $09
         BNE   L3101
         LDA   $07
         CMP   $0B
         BEQ   L3118
L3101    LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         LDY   #$0004
         LDA   [$01],Y
         STA   $05
         INY
         INY
         LDA   [$01],Y
         STA   $07
         BRA   L30F5
L3118    LDY   #$0004
         LDA   $01
         ORA   $02
         BNE   L3131
         LDA   [$05],Y
         STAL  L2EF6,X
         INY
         INY
         LDA   [$05],Y
         STAL  L2EF8,X
         BRA   L313B
L3131    LDA   [$05],Y
         STA   [$01],Y
         INY
         INY
         LDA   [$05],Y
         STA   [$01],Y
L313B    PLD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L3143    LDX   #$0000
         DEC
         LSR
         LSR
         LSR
         BEQ   L3153
L314C    INX
         INX
         INX
         INX
         LSR
         BNE   L314C
L3153    RTL

L3154    TAY
         PHD
         TSC
         SEC
         SBC   #$0007
         TCD
         DEC
         TCS
         TYA
         LDY   #$0000
         BIT   #$8000
         BEQ   L316C
         EOR   #$FFFF
         INC
         INY
L316C    STA   $02
         TXA
         BPL   L3176
         DEY
         EOR   #$FFFF
         INC
L3176    STA   $04
         STY   $06
         LDY   #$0010
         LDA   #$0000
L3180    LSR   $02
         BCC   L3187
         CLC
         ADC   $04
L3187    ROR
         ROR   $00
         DEY
         BNE   L3180
         TAX
         BNE   L31A8
         LDA   $00
         BMI   L31A8
         LDY   $06
         BEQ   L319C
         EOR   #$FFFF
         INC
L319C    TAY
         TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         TYA
         CLV
         RTL

L31A8    TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         SEP   #$40
         RTL

L31B3    TSC
         PHD
         TCD
         PEA   ^L323F
         PEA   L323F
         LDA   $0A
         JSL   L3228
         PEA   ^L323F
         PEA   L323F
         LDA   $08
         PHA
         LDA   $06
         PHA
         LDA   $04
         PHA
         JSL   L31E3
         LDA   $02
         STA   $0A
         LDA   $00
         STA   $08
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L31E3    TSC
         PHD
         TCD
         INC   $0A
         BNE   L31EC
         INC   $0C
L31EC    LDA   [$0A]
         AND   #$00FF
         SEC
         SBC   $08
         BPL   L3200
         EOR   #$FFFF
         INC
         LDY   $04
         JSL   L32DE
L3200    LDA   $0C
         PHA
         LDA   $0A
         PHA
         LDA   $06
         EOR   #$0001
         ASL
         ORA   $04
         XBA
         CLC
         ADC   #$1A0C
         TAX
         JSL   $E10000
         LDA   $02
         STA   $0C
         LDA   $00
         STA   $0A
         PLD
         CLC
         TSC
         ADC   #$000A
         TCS
         RTL

L3228    PHA
         PEA   ^L3269
         PEA   L3269
         PEA   $0028
         PEA   $0001
         _Int2Dec
         JMP   L3291

L323F    DB    $28
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L3269    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L3291    PHD
         TSC
         TCD
         SEP   #$20
         LDX   #$0000
         LDA   #$20
L329B    CMPL  L3269,X
         BNE   L32A4
         INX
         BRA   L329B
L32A4    REP   #$20
         TXA
         SEC
         SBC   #$0028
         EOR   #$FFFF
         INC
         SEP   #$20
         CMP   [$06]
         BEQ   L32B7
         BCS   L32CE
L32B7    LDY   #$0001
         STA   [$06],Y
L32BC    LDAL  L3269,X
         INY
         STA   [$06],Y
         INX
         CPX   #$0028
         BCC   L32BC
         REP   #$20
         CLV
         BRA   L32D2
L32CE    REP   #$20
         SEP   #$40
L32D2    LDA   $02,S
         STA   $06,S
         LDA   $04,S
         STA   $08,S
         PLD
         PLA
         PLA
         RTL

L32DE    PHA
         TYA
         XBA
         CLC
         ADC   #$180C
         PHA
         PHD
         TSC
         TCD
L32E9    PEA   $0020
         LDX   $03
         JSL   $E10000
         DEC   $05
         BNE   L32E9
         PLD
         PLA
         PLA
         RTL

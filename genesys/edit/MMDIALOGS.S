*
* Genesys v1.2.4
* Control editor
*

         mx    %00
         rel
         lst   off

*----------------------------

         use   4/Ctl.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/QD.Macs
         use   4/QDAux.Macs
         use   4/Resource.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

	 use   MMDIALOGS.X.S

*----------------------------

GSOS     EQU   $E100A8

*----------------------------

L030000  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PEI   $1B
         PEI   $19
         pea   #$FF01
         PEA   ^L03004F
         PEA   L03004F
         pea   #$0008
         JSL   L02C5F5
         pei   $1F
         pei   $1D
         LDA   #$0001
         CLC
         ADC   $19
         LDX   $1B
         PHX
         PHA
         pea   #$0008
         _Long2Hex
         STA   L02C957
         LDA   $17
         STA   $1F
         LDA   $16
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L03004F  ASC   '00000000'

*--- Icon management (from the resource to the icon management window)

L030057  ENT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         PHA
         pea   #$0001
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         PHA
         PHA
         pea   #$8004
         pei   $25
         pei   $23
         _LoadResource
         STA   L02C957
         PLA
         STA   $16	; return the handle to the resource
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2001
         PHA
         JSL   L020419
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDX   $18	; lock handle
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957

*--- AV 202010 - Add the extra parm

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	[$00]	; check pCount
	cmp	#12	; if already 12
	bcs	icn12P	; we are good

	pha
	pha
	pei	$18
	pei	$16
	_GetHandleSize
	plx
	ply
	cpy	#0
	bne	icn12P	; check size of $30
	cpx	#48	; we have the right size
	bcs	icn12P

	pei	$18	; size is < $30 bytes
	pei	$16
	_HUnlock
	
	pea	$0000	; make it $30 bytes long
	pea	$0030
	pei	$18
	pei	$16
	_SetHandleSize

	pei	$18	; lock it
	pei	$16
	_HLock

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	#12	; 12 parms now
	sta	[$00]
	ldy	#$2e	; init initial value for sticky
	lda	#0
	sta	[$00],y

*---
	
icn12P	
         LDY   #$0004	; get its ID
         LDA   [$00],Y
         TAX
         LDY   #$0002
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000

         LDY   #$0002	; get its pointer again
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018	; get its refcon
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000

         LDY   #$0002	; get its pointer again
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]	; get its pcount
         SEC
         SBC   #$0008
         BVS   L03011C
         EOR   #$8000
L03011C  BMI   L030121	; 8 parms or more
         BRL   L030243	; less than 8 parms

L030121  LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020	; get its titleRef resource
         LDA   [$00],Y
         PHA
         LDY   #$001E
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L030143
         DEX
L030143  LDY   #$0001
         CMP   $01,S
         BEQ   L03014B
         DEY
L03014B  TXA
         CMP   $03,S
         BEQ   L030153
         LDY   #$0000
L030153  PLA
         PLA
         TYA
         BEQ   L03015B
         BRL   L030226
L03015B  PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020	; get its titleRef resource
         LDA   [$00],Y
         TAX
         LDY   #$001E
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   L02B99B
         PLA
         STA   L02B99D
         LDA   L02C957
         PHA
         LDA   #$2003
         PHA
         JSL   L020419
         LDX   L02B99D
         LDA   L02B99B
         PHX
         PHA
         _HLock
         STA   L02C957
         LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L02B99D
         LDA   L02B99B
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L02C5F5
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020	; get its titleRef resource
         LDA   [$00],Y
         TAX
         LDY   #$001E
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         BRL   L030240
L030226  LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L030057
         PEA   L030057
         LDA   #$0000
         PHA
         JSL   L02C5F5
L030240  BRL   L03025D

L030243  LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L030057
         PEA   L030057
         LDA   #$0000
         PHA
         JSL   L02C5F5

L03025D  JSL   L02892D	; show the Icon control window
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB

*--- Handle the invisible flag - bit 7

         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

         LDY   #$0012
         LDA   [$00],Y
         AND   #%00000000_10000000
	 beq   L0302BA

L03028E  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         pea   $0000
	 pea   $0012
         _GetCtlHandleFromID
         _SetCtlValue

*--- AV 202010 Handle the disabled bit 3

L0302BA  LDY   #$0012
         LDA   [$00],Y
         AND   #%00000000_00001000
         beq   L0302BB

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0013
         _GetCtlHandleFromID
         _SetCtlValue

*--- AV 202010 Handle the sticky bit 4

L0302BB  LDY   #$0012
         LDA   [$00],Y
         AND   #%00000000_00010000
         beq   L0302BC

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0014
         _GetCtlHandleFromID
         _SetCtlValue

         LDA   #$0000	; activate the buttons
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0015
         _GetCtlHandleFromID
         _HiliteControl

         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0016
         _GetCtlHandleFromID
         _HiliteControl

*--- Handle the show border bit 2

L0302BC  LDY   #$0012
         LDA   [$00],Y
         AND   #%00000000_00000100
         BEQ   L0302D3
         BRL   L0303C0

L0302D3  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         pea   $0000
	 pea   $000b
         _GetCtlHandleFromID
         _SetCtlValue

*--- Handle the border type

         LDY   #$0012
         LDA   [$00],Y
         AND   #%00000000_00000011
         CMP   #$0001
         bne   L03034E

L03031F  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0009
         _GetCtlHandleFromID
         _SetCtlValue
         bra   L0303BD

L03034E  CMP   #$0002
         bne   L030387

L030358  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0008
         _GetCtlHandleFromID
         _SetCtlValue
         bra   L0303BD

L030387  CMP   #$0003
         bne   L0303BD

L030391  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0007
         _GetCtlHandleFromID
         _SetCtlValue

L0303BD  BRL   L03042C

L0303C0  LDA   #$0007
         STA   $1A
L0303C5  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
         pei   $1a
         _GetCtlHandleFromID
         _HiliteControl

         INC   $1A
         LDA   $1A
         CMP   #$000B
	 bcc   L0303C5

L030400  LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000a
         _GetCtlHandleFromID
         _SetCtlValue

L03042C  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0004
         _GetCtlHandleFromID
         _HiliteControl
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         PLA
         STA   $1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         pea   #$8004
         pei   $25
         pei   $23
         _ReleaseResource
         PHA
         pei   $1E
         _SetResourceFileDepth
         PLA
         STA   $1E
         LDA   $21
         STA   $25
         LDA   $20
         STA   $24
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L0304A7  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _HUnlock
         STA   L02C957
         PHA
         PHA
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _GetHandleSize
         STA   L02C957
         LDA   $1D
         LDX   #$0000
         TAY
         BPL   L0304DB
         DEX
L0304DB  PHX
         PHA
         CLC
         PLA
         ADC   $03,S
         STA   $03,S
         PLA
         ADC   $03,S
         STA   $03,S
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _SetHandleSize
         STA   L02C957
         LDA   L02C957
         PHA
         LDA   #$5202
         PHA
         JSL   L020419
         LDX   $1B
         LDA   $19
         PHX
         PHA
         _HLock
         STA   L02C957
         LDA   $17
         STA   $1D
         LDA   $16
         STA   $1C
         PLD
         TSC
         CLC
         ADC   #$001C
         TCS
         RTL

L030524  ENT
         TSC
         SEC
         SBC   #$002A
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $2F
         LDA   $2D
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$5104
         PHA
         JSL   L020419
         PHA
         LDA   $28
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0008
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0305A8
         BVS   L0305A6
         EOR   #$8000
L0305A6  BMI   L0305AB
L0305A8  BRL   L0305F4
L0305AB  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0305C3
         DEX
L0305C3  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
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
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0008
         STA   [$00]
L0305F4  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0009
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L030614
         BVS   L030612
         EOR   #$8000
L030612  BMI   L030617
L030614  BRL   L030660
L030617  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L03062F
         DEX
L03062F  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0022
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
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0009
         STA   [$00]
L030660  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000A
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L030680
         BVS   L03067E
         EOR   #$8000
L03067E  BMI   L030683
L030680  BRL   L0306B7
L030683  LDA   #$0002
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0026
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$000A
         STA   [$00]
L0306B7  JSL   L028CE3
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   $1A
         PLA
         STA   $1C
         LDX   $1C
         LDA   $1A
         PHX
         PHA
         _SetPort
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0004
         BNE   L0306F6
         BRL   L030722
L0306F6  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L03070C
         DEX
L03070C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L030722  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0002
         BNE   L03073B
         BRL   L030767
L03073B  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L030751
         DEX
L030751  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L030767  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$0001
         BNE   L030780
         BRL   L0307AC
L030780  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L030796
         DEX
L030796  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0307AC  PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0138
         PHA
         LDA   #$0008
         PHA
         LDA   #$015C
         PHA
         LDA   #$0016
         PHA
         _SetRect
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0026
         LDA   [$00],Y
         AND   #$F000
         STA   $26
         PEA   $0000
         TDC
         CLC
         ADC   #$001E
         PHA
         LDA   #$0000
         PHA
         LDA   $26
         PHA
         JSL   L0203E3
         PHA
         _SpecialRect
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $2F
         LDA   $2D
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $28
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $28
         LDA   $2B
         STA   $2F
         LDA   $2A
         STA   $2E
         PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         RTL

L030853  ENT
         TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2101
         PHA
         JSL   L020419
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   L02B99B
         PLA
         STA   L02B99D
         LDA   L02C957
         PHA
         LDA   #$2103
         PHA
         JSL   L020419
         LDX   L02B99D
         LDA   L02B99B
         PHX
         PHA
         _HLock
         STA   L02C957
         LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L02B99D
         LDA   L02B99B
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L02C5F5
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         JSL   L02B5CB
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L0309FA
         BRL   L030A26
L0309FA  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L030A10
         DEX
L030A10  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L030A26  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0003
         STA   $1A
         LDA   $1A
         CMP   #$0001
         BEQ   L030A46
         BRL   L030A75
L030A46  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L030A5C
         DEX
L030A5C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L030AE4
L030A75  LDA   $1A
         CMP   #$0002
         BEQ   L030A7F
         BRL   L030AAE
L030A7F  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L030A95
         DEX
L030A95  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L030AE4
L030AAE  LDA   $1A
         CMP   #$0003
         BEQ   L030AB8
         BRL   L030AE4
L030AB8  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L030ACE
         DEX
L030ACE  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L030AE4  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L030AFA
         DEX
L030AFA  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDA   $1F
         STA   $23
         LDA   $1E
         STA   $22
         PLD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L030B5F  ENT
         TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2201
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         JSL   L029680		; window for Stat Text control
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB

*--- AV 202010

         LDY   #$0002	; get control handle
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00	; set the pointer
         STX   $02

*--- Set bit 7 on control $D - ctlInvis

         LDY   #$0012	; get flag
         LDA   [$00],Y
         AND   #%00000000_10000000	; get bit 7 - invisible
	 beq   L030C6A

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000d
	 _GetCtlHandleFromID
	 sta   L02C957
	 _SetCtlValue
	 sta   L02C957

*--- Set bit 1 on control $C - fSubstituteText

L030C6A
         LDY   #$0012	; get flag
         LDA   [$00],Y
         AND   #%00000000_00000010	; get bit 1 - fSubstituteText
	 beq   L030C6B

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000c
	 _GetCtlHandleFromID
	 sta   L02C957
	 _SetCtlValue
	 sta   L02C957

*--- Set bit 2 on control $10 - fBlastText

L030C6B
         LDY   #$0012	; get flag
         LDA   [$00],Y
         AND   #%00000000_00000100	; get bit 2 - fBlastText
	 beq   L030C6C

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $0010
	 _GetCtlHandleFromID
	 sta   L02C957
	 _SetCtlValue
	 sta   L02C957

*--- Set bit 3 on control $F - fTextCanDim

L030C6C
         LDY   #$0012	; get flag
         LDA   [$00],Y
         AND   #%00000000_00001000	; get bit 3 - fTextCanDim
	 beq   L030C6D

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000f
	 _GetCtlHandleFromID
	 sta   L02C957
	 _SetCtlValue
	 sta   L02C957

*--- Set bit 4 on control $E - fSquishText

L030C6D
         LDY   #$0012	; get flag
         LDA   [$00],Y
         AND   #%00000000_00010000	; get bit 4 - fSquishText
	 beq   L030CAF

         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea   $0000
	 pea   $000e
	 _GetCtlHandleFromID
	 sta   L02C957
	 _SetCtlValue
	 sta   L02C957

*---

L030CAF  LDY   #$0002	; now check justification
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         CMP   #$0009
         BEQ   L030CC5
         BRL   L030DD6
L030CC5  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         CMP   #$0002
         BEQ   L030CDE
         BRL   L030D0D
L030CDE  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L030CF4
         DEX
L030CF4  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L030DD3
L030D0D  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         PHA
         LDA   #$0001
         EOR   #$FFFF
         INC
         SEC
         SBC   $01,S
         PLX
         TAX
         BEQ   L030D30
         BRL   L030D5F
L030D30  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L030D46
         DEX
L030D46  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L030DD3
L030D5F  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0020
         LDA   [$00],Y
         CMP   #$0001
         BEQ   L030D78
         BRL   L030DA7
L030D78  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L030D8E
         DEX
L030D8E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L030DD3
L030DA7  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000B
         LDX   #$0000
         TAY
         BPL   L030DBD
         DEX
L030DBD  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L030DD3  BRL   L030E02
L030DD6  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000B
         LDX   #$0000
         TAY
         BPL   L030DEC
         DEX
L030DEC  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L030E02  PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1D
         STA   $21
         LDA   $1C
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L030E51  ENT
         TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2301
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   L02B99B
         PLA
         STA   L02B99D
         LDA   L02C957
         PHA
         LDA   #$2303
         PHA
         JSL   L020419
         LDX   L02B99D
         LDA   L02B99B
         PHX
         PHA
         _HLock
         STA   L02C957
         LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L02B99D
         LDA   L02B99B
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L02C5F5
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         JSL   L0299A5
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L030FF8
         BRL   L031024
L030FF8  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L03100E
         DEX
L03100E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L031024  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         BNE   L03103A
         BRL   L031066
L03103A  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000B
         LDX   #$0000
         TAY
         BPL   L031050
         DEX
L031050  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L031066  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L03107C
         DEX
L03107C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1D
         STA   $21
         LDA   $1C
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

*--- AV 202010

doRECTANGLE	ENT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         PHA
         pea   #$0001
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         PHA
         PHA
         pea   #$8004
         pei   $25
         pei   $23
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957	; check error
         PHA
         pea   #$2401
         JSL   L020419
         PHA
         pei   $1E
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E

         pei   $18
         pei   $16
         _HLock
         STA   L02C957

* Get the data

         LDY   #$0002	; get the pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

* Get the number of parms (we handle 8 parms max)

	lda	[$00]	
	cmp	#8
	bcs	okRECT	; if >=8, do nothing

	pei	$18
	pei	$16
	_HUnlock

	pea	$0000	; make it $1e bytes long
	pea	$001e
	pei	$18
	pei	$16
	_SetHandleSize

	pei	$18	; lock it
	pei	$16
	_HLock

         LDY   #$0002	; get the pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	#8	; New nb of parms now
	sta	[$00]
	ldy	#$1a	; initial value for penHeight
	lda	#1
	sta	[$00],y
	ldy	#$1c	; initial value for penWidth
	lda	#2
	sta	[$00],y

okRECT
         LDY   #$0004	; get its ID
         LDA   [$00],Y
         pha
         LDY   #$0002
         LDA   [$00],Y
         pha
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000

         LDY   #$0018	; get the refcon
         LDA   [$00],Y
         pha
         LDY   #$0016
         LDA   [$00],Y
         pha
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000

	ldy	#$1a	; get penWidth
	lda	[$00],y
	pha
	PushLong #strRECTD2
	PushWord #5
	PushWord #0
	_Int2Dec

	ldy	#$1c	; get penHeight
	lda	[$00],y
	pha
	PushLong #strRECTF2
	PushWord #5
	PushWord #0
	_Int2Dec

*--- Reset all controls (and we'll change the value afterwards)

        lda   #$0000	; transparent
        pha
        pha
        pha
        pha
        pha
	pha
	pea   $0009
        _GetCtlHandleFromID
        _SetCtlValue

        lda   #$0000	; grey pattern
        pha
        pha
        pha
        pha
        pha
	pha
	pea   $000a
        _GetCtlHandleFromID
        _SetCtlValue

        lda   #$0000	; black pattern
        pha
        pha
        pha
        pha
        pha
	pha
	pea   $000b
        _GetCtlHandleFromID
        _SetCtlValue

*---

         JSL   showRECTANGLE	; do window
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB

*--- Update some flags

         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

*--- Control's visibility

	ldy	#$12
	lda	[$00],y
	and	#%00000000_10000000
	beq	rectVISIBLE

        lda   #$0001
        pha
        pha
        pha
        pea   $0000
        pea   $0000
	pea   $0000
	pea   $0007
        _GetCtlHandleFromID
        _SetCtlValue

rectVISIBLE	

*--- Control's appearance

	ldy	#$12
	lda	[$00],y
	and	#%00000000_00000011
	cmp	#%00000000_00000011
	bcs	rectAPPEAR

	clc
	adc	#9	; because control 9 is radio button transparent
	tax

        lda   #$0001
        pha
        pha
        pha
        pea   $0000
        pea   $0000
	pea   $0000
	phx		; <= the control to activate
        _GetCtlHandleFromID
        _SetCtlValue

rectAPPEAR

*---

         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDA   $21
         STA   $25
         LDA   $20
         STA   $24
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

*--- AV 202010

doTHERMOMETER	ENT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         PHA
         pea   #$0001
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         PHA
         PHA
         pea   #$8004
         pei   $25
         pei   $23
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957	; check error
         PHA
         pea   #$2401
         JSL   L020419
         PHA
         pei   $1E
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E

         pei   $18
         pei   $16
         _HLock
         STA   L02C957

* Get the data

         LDY   #$0002	; get the pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

* Get the number of parms (we handle 8 parms max)

	lda	[$00]	
	cmp	#8
	bcs	okTHERMO	; if >=8, do nothing

	pei	$18
	pei	$16
	_HUnlock

	pea	$0000	; make it $1e bytes long
	pea	$001e
	pei	$18
	pei	$16
	_SetHandleSize

	pei	$18	; lock it
	pei	$16
	_HLock

         LDY   #$0002	; get the pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	#8	; New nb of parms now
	sta	[$00]
	ldy	#$1a	; initial value for position
	lda	#0
	sta	[$00],y
	ldy	#$1c	; initial value for scale
	lda	#100
	sta	[$00],y

okTHERMO
         LDY   #$0004	; get its ID
         LDA   [$00],Y
         pha
         LDY   #$0002
         LDA   [$00],Y
         pha
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000

         LDY   #$0018	; get the refcon
         LDA   [$00],Y
         pha
         LDY   #$0016
         LDA   [$00],Y
         pha
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000

	ldy	#$1a	; get position
	lda	[$00],y
	pha
	PushLong #strTHERMOD2
	PushWord #5
	PushWord #0
	_Int2Dec

	ldy	#$1c	; get scale
	lda	[$00],y
	pha
	PushLong #strTHERMOF2
	PushWord #5
	PushWord #0
	_Int2Dec

*--- Reset all controls (and we'll change the value afterwards)

        lda   #$0000	; vertical
        pha
        pha
        pha
        pha
        pha
	pha
	pea   $0009
        _GetCtlHandleFromID
        _SetCtlValue

        lda   #$0000	; horizontal
        pha
        pha
        pha
        pha
        pha
	pha
	pea   $000a
        _GetCtlHandleFromID
        _SetCtlValue

*---

         JSL   showTHERMOMETER	; do window
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB

*--- Update some flags

         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

*--- Control's visibility

	ldy	#$12
	lda	[$00],y
	and	#%00000000_10000000
	beq	thermoVISIBLE

        lda   #$0001
        pha
        pha
        pha
        pea   $0000
        pea   $0000
	pea   $0000
	pea   $0007
        _GetCtlHandleFromID
        _SetCtlValue

thermoVISIBLE	

*--- Control's appearance

	ldy	#$12
	lda	[$00],y
	and	#%00000000_00000001

	clc
	adc	#9	; because control 9 is radio button vertical
	tax

        lda   #$0001
        pha
        pha
        pha
        pea   $0000
        pea   $0000
	pea   $0000
	phx		; <= the control to activate
        _GetCtlHandleFromID
        _SetCtlValue

*---

         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDA   $21
         STA   $25
         LDA   $20
         STA   $24
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

*--- AV 202010 Line Edit control entry point

L0310E1  ENT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2401
         PHA
         JSL   L020419
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957

*--- AV 202010 - Add the extra parm

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	[$00]	; check pCount
	cmp	#10	; if already 10
	bcs	le10P	; we are good

	pha
	pha
	pei	$18
	pei	$16
	_GetHandleSize
	plx
	ply
	cpy	#0
	bne	le10P	; check size of 32+2+2
	cpx	#$24	; we have the right size
	bcs	le10P

	pei	$18	; size is < $24 bytes
	pei	$16
	_HUnlock
	
	pea	$0000	; make it $24 bytes long
	pea	$0024
	pei	$18
	pei	$16
	_SetHandleSize

	pei	$18	; lock it
	pei	$16
	_HLock

         LDY   #$0002	; get its pointer
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

	lda	[$00]	; if we have 9 parms
	cmp	#9	; add the 10th only
	bcs	le9P
	
	ldy	#$20	; pwChar
	lda	#$ffff	; by default, not a password field
	sta	[$00],y

le9P	ldy	#$22	; keyMask
	lda	#$0001 
	sta	[$00],y

	lda	#10	; 10 parms now
	sta	[$00]

le10P

*---

	ldy	#$20	; now make pwChar a text value
	lda	[$00],y
	pha
	PushLong #pwChar
	PushWord #4
	_Int2Hex

	ldy	#$22	; now make keyMask a text value
	lda	[$00],y
	pha
	PushLong #keyMask
	PushWord #4
	_Int2Hex
	
*--- Back to the original code

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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001A
         LDA   [$00],Y
         STA   $1A
         LDA   $1A
         AND   #$8000
         BNE   L0311AC
         BRL   L0311BB
L0311AC  LDA   #$0001
         STA   $1C
         LDA   $1A
         EOR   #$8000
         STA   $1A
         BRL   L0311C0
L0311BB  LDA   #$0000
         STA   $1C
L0311C0  LDA   $1A
         SEC
         SBC   #$00FF
         BEQ   L0311CF
         BVS   L0311CD
         EOR   #$8000
L0311CD  BMI   L0311D2
L0311CF  BRL   L0311D7
L0311D2  LDA   #$00FF
         STA   $1A
L0311D7  LDA   #$0000
         SEC
         SBC   $1A
         BEQ   L0311E6
         BVS   L0311E4
         EOR   #$8000
L0311E4  BMI   L0311E9
L0311E6  BRL   L0311EE
L0311E9  LDA   #$0000
         STA   $1A
L0311EE  LDX   #^L02BCAD
         LDA   #L02BCAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDA   $1A
         LDX   #$0000
         TAY
         BPL   L031203
         DEX
L031203  PHX
         PHA
         JSL   L02C444
         JSL   L02C5F5
         JSL   L02C4DA
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BEQ   L03123F
         INX
L03123F  TXA
         PHA
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BEQ   L03126F
         INX
L03126F  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L031279
         BRL   L031344
L031279  PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   L02B99B
         PLA
         STA   L02B99D
         LDA   L02C957
         PHA
         LDA   #$2403
         PHA
         JSL   L020419
         LDX   L02B99D
         LDA   L02B99B
         PHX
         PHA
         _HLock
         STA   L02C957
         LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L02B99D
         LDA   L02B99B
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L02C5F5
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         BRL   L03135E
L031344  LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L0310E1
         PEA   L0310E1
         LDA   #$0000
         PHA
         JSL   L02C5F5
L03135E  JSL   L029C59	; do window
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02

*--- AV 202010 - Add new words

	ldy	#$20	; check pwChar
	lda	[$00],y
	cmp	#$ffff	; -1 means not a password
	bne	isAPWD

         LDA   #$0001	; check Not a password box
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea	$0000
	 pea	$000f
         _GetCtlHandleFromID
         _SetCtlValue

isAPWD

*---

         LDY   #$0012	; bit 7 - invisible
         LDA   [$00],Y
         AND   #$0080
         BNE   L03138F
         BRL   L0313BB
L03138F  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea	$0000
	 pea	$000c
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957

L0313BB  LDA   $1C	; password checkbox
         BNE   L0313C2
         BRL   L0313EE
L0313C2  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
	 pea	$0000
	 pea	$0003
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0313EE  PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1E
         LDA   $21
         STA   $25
         LDA   $20
         STA   $24
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L03143D  ENT
         TSC
         SEC
         SBC   #$001E
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2501
         PHA
         JSL   L020419
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         STA   $1A
         LDA   $1A
         SEC
         SBC   #$007F
         BEQ   L03150D
         BVS   L03150B
         EOR   #$8000
L03150B  BMI   L031510
L03150D  BRL   L031517
L031510  LDA   $1A
         EOR   #$0080
         STA   $1A
L031517  LDX   #^L02BCAD
         LDA   #L02BCAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDA   $1A
         LDX   #$0000
         TAY
         BPL   L03152C
         DEX
L03152C  PHX
         PHA
         JSL   L02C444
         JSL   L02C5F5
         JSL   L02C4DA
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         PHA
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   L02B99B
         PLA
         STA   L02B99D
         LDA   L02C957
         PHA
         LDA   #$2503
         PHA
         JSL   L020419
         LDX   L02B99D
         LDA   L02B99B
         PHX
         PHA
         _HLock
         STA   L02C957
         LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDX   L02B99D
         LDA   L02B99B
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         LDA   #$FF01
         PHA
         JSL   L02C5F5
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8006
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         JSL   L029F0F
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L031633
         BRL   L03165F
L031633  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L031649
         DEX
L031649  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03165F  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         BNE   L031675
         BRL   L0316A1
L031675  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L03168B
         DEX
L03168B  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0316A1  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L0316B7
         DEX
L0316B7  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $23
         LDA   $21
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1C
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1C
         LDA   $1F
         STA   $23
         LDA   $1E
         STA   $22
         PLD
         TSC
         CLC
         ADC   #$0022
         TCS
         RTL

L03171C  ENT
         TSC
         SEC
         SBC   #$0022
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2604
         PHA
         JSL   L020419
         PHA
         LDA   $20
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         JSL   L02A20A
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L0317FB
         BRL   L031827
L0317FB  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0015
         LDX   #$0000
         TAY
         BPL   L031811
         DEX
L031811  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L031827  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0008
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031847
         BVS   L031845
         EOR   #$8000
L031845  BMI   L03184A
L031847  BRL   L031881
L03184A  LDA   #$0008
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$FFFF
         PHA
         _SetRect
         STA   L02C957
L031881  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0009
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0318A1
         BVS   L03189F
         EOR   #$8000
L03189F  BMI   L0318A4
L0318A1  BRL   L0318DC
L0318A4  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0318BC
         DEX
L0318BC  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0026
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
L0318DC  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000A
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0318FC
         BVS   L0318FA
         EOR   #$8000
L0318FA  BMI   L0318FF
L0318FC  BRL   L031922
L0318FF  LDA   #$0002
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$002A
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L031922  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000B
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031942
         BVS   L031940
         EOR   #$8000
L031940  BMI   L031945
L031942  BRL   L03197D
L031945  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L03195D
         DEX
L03195D  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$002C
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
L03197D  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000C
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L03199D
         BVS   L03199B
         EOR   #$8000
L03199B  BMI   L0319A0
L03199D  BRL   L0319C3
L0319A0  LDA   #$0002
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0030
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L0319C3  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000D
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0319E3
         BVS   L0319E1
         EOR   #$8000
L0319E1  BMI   L0319E6
L0319E3  BRL   L031A1E
L0319E6  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0319FE
         DEX
L0319FE  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0032
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
L031A1E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000E
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031A3E
         BVS   L031A3C
         EOR   #$8000
L031A3C  BMI   L031A41
L031A3E  BRL   L031A64
L031A41  LDA   #$0002
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0036
         STA   $00
         STX   $02
         LDA   #$0015
         STA   [$00]
L031A64  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000F
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031A84
         BVS   L031A82
         EOR   #$8000
L031A82  BMI   L031A87
L031A84  BRL   L031C04
L031A87  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         PHA
         PHA
         LDA   #$0016
         LDX   #$0000
         TAY
         BPL   L031AA1
         DEX
L031AA1  PHX
         PHA
         LDA   $25
         PHA
         LDA   #$0000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L031AB4
         DEX
L031AB4  PHX
         PHA
         _NewHandle
         STA   L02C957
         PLA
         STA   $1C
         PLA
         STA   $1E
         LDA   L02C957
         PHA
         LDA   #$2606
         PHA
         JSL   L020419
         LDX   $1E
         LDA   $1C
         PHX
         PHA
         _HLock
         STA   L02C957
         LDX   #^L02BCAD
         LDA   #L02BCAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L0322C0
         PEA   L0322C0
         LDA   #$0016
         PHA
         JSL   L02C5F5
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L02BCAD
         PEA   ^L02BCAD
         PHA
         LDY   #$0002
         LDA   [$1C],Y
         PHA
         LDA   [$1C]
         PHA
         LDA   #$0016
         LDX   #$0000
         TAY
         BPL   L031B1C
         DEX
L031B1C  PHX
         PHA
         _BlockMove
         STA   L02C957
         PHA
         PHA
         LDA   #$FFFF
         PHA
         LDA   #$8016
         PHA
         _UniqueResourceID
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0038
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
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
         LDX   $1E
         LDA   $1C
         PHX
         PHA
         LDA   #$0000
         PHA
         LDA   #$8016
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _AddResource
         STA   L02C957
         LDA   #$8016
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _WriteResource
         STA   L02C957
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8016
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
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
         STA   L02C957
         PHA
         LDA   $20
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
L031C04  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0010
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031C24
         BVS   L031C22
         EOR   #$8000
L031C22  BMI   L031C27
L031C24  BRL   L031C5F
L031C27  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L031C3F
         DEX
L031C3F  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$003C
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
L031C5F  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0011
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031C7F
         BVS   L031C7D
         EOR   #$8000
L031C7D  BMI   L031C82
L031C7F  BRL   L031CBA
L031C82  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L031C9A
         DEX
L031C9A  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0040
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
L031CBA  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0012
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031CDA
         BVS   L031CD8
         EOR   #$8000
L031CD8  BMI   L031CDD
L031CDA  BRL   L031D15
L031CDD  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L031CF5
         DEX
L031CF5  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0044
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
L031D15  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0013
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031D35
         BVS   L031D33
         EOR   #$8000
L031D33  BMI   L031D38
L031D35  BRL   L031D5B
L031D38  LDA   #$0002
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0048
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L031D5B  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0014
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031D7B
         BVS   L031D79
         EOR   #$8000
L031D79  BMI   L031D7E
L031D7B  BRL   L031DA1
L031D7E  LDA   #$0002
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$004A
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L031DA1  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0015
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031DC1
         BVS   L031DBF
         EOR   #$8000
L031DBF  BMI   L031DC4
L031DC1  BRL   L031DFC
L031DC4  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L031DDC
         DEX
L031DDC  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$004C
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
L031DFC  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0016
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031E1C
         BVS   L031E1A
         EOR   #$8000
L031E1A  BMI   L031E1F
L031E1C  BRL   L031E42
L031E1F  LDA   #$0002
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0050
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L031E42  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0017
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L031E62
         BVS   L031E60
         EOR   #$8000
L031E60  BMI   L031E65
L031E62  BRL   L031E9D
L031E65  LDA   #$0004
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         JSL   L0304A7
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L031E7D
         DEX
L031E7D  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0052
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
L031E9D  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0017
         STA   [$00]
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
         LDA   #$0001
         PHA
         LDA   #$8004
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         _MarkResourceChange
         STA   L02C957
         LDA   #$8004
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         _WriteResource
         STA   L02C957
         PHA
         LDA   $20
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$0800
         BNE   L031F16
         BRL   L031F6E
L031F16  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L031F2C
         DEX
L031F2C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L031F58
         DEX
L031F58  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L031F6E  PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0028
         LDA   [$00],Y
         TAX
         LDY   #$0026
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BEQ   L031F9C
         INX
L031F9C  TXA
         PHA
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0028
         LDA   [$00],Y
         TAX
         LDY   #$0026
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L02C957
         PLA
         LDX   #$0000
         CMP   #$0000
         BEQ   L031FCC
         INX
L031FCC  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L031FD6
         BRL   L032002
L031FD6  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L031FEC
         DEX
L031FEC  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032002  PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         TAX
         LDY   #$001A
         LDA   [$00],Y
         PHX
         PHA
         _HiWord
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1A
         AND   #$2000
         BNE   L032033
         BRL   L03205F
L032033  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L032049
         DEX
L032049  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03205F  LDA   $1A
         AND   #$1000
         BNE   L032069
         BRL   L032095
L032069  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L03207F
         DEX
L03207F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032095  LDA   $1A
         AND   #$0800
         BNE   L03209F
         BRL   L0320CB
L03209F  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L0320B5
         DEX
L0320B5  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0320CB  LDA   $1A
         AND   #$0400
         BNE   L0320D5
         BRL   L032101
L0320D5  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000B
         LDX   #$0000
         TAY
         BPL   L0320EB
         DEX
L0320EB  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032101  LDA   $1A
         AND   #$0200
         BNE   L03210B
         BRL   L032137
L03210B  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L032121
         DEX
L032121  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032137  LDA   $1A
         AND   #$0100
         BNE   L032141
         BRL   L03216D
L032141  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L032157
         DEX
L032157  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03216D  LDA   $1A
         AND   #$0080
         BNE   L032177
         BRL   L0321A3
L032177  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L03218D
         DEX
L03218D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0321A3  LDA   $1A
         AND   #$0020
         BNE   L0321AD
         BRL   L0321D9
L0321AD  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0007
         LDX   #$0000
         TAY
         BPL   L0321C3
         DEX
L0321C3  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0321D9  LDA   $1A
         AND   #$0010
         BNE   L0321E3
         BRL   L03220F
L0321E3  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0006
         LDX   #$0000
         TAY
         BPL   L0321F9
         DEX
L0321F9  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03220F  LDA   $1A
         AND   #$0008
         BNE   L032219
         BRL   L032245
L032219  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0005
         LDX   #$0000
         TAY
         BPL   L03222F
         DEX
L03222F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032245  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L03225B
         DEX
L03225B  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $20
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $20
         LDA   $23
         STA   $29
         LDA   $22
         STA   $28
         PLD
         TSC
         CLC
         ADC   #$0028
         TCS
         RTL

L0322C0  ASC   'Text Edit text string.'
L0322D6  ENT
         TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2701
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         LDX   #^L02BBAD
         LDA   #L02BBAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L0323A8
         DEX
L0323A8  PHX
         PHA
         JSL   L02C444
         JSL   L02C5F5
         JSL   L02C4DA
         LDX   #^L02BCAD
         LDA   #L02BCAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001C
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L0323DA
         DEX
L0323DA  PHX
         PHA
         JSL   L02C444
         JSL   L02C5F5
         JSL   L02C4DA
         LDX   #^L02B9AD
         LDA   #L02B9AD
         PHX
         PHA
         LDA   #$FF01
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001A
         LDA   [$00],Y
         LDX   #$0000
         TAY
         BPL   L03240C
         DEX
L03240C  PHX
         PHA
         JSL   L02C444
         JSL   L02C5F5
         JSL   L02C4DA
         JSL   L02A6F9
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L03244B
         BRL   L032477
L03244B  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0014
         LDX   #$0000
         TAY
         BPL   L032461
         DEX
L032461  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032477  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L03248D
         DEX
L03248D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L0324B9
         DEX
L0324B9  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L0324E5
         DEX
L0324E5  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L032511
         DEX
L032511  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0010
         BEQ   L032540
         BRL   L032651
L032540  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0012
         LDX   #$0000
         TAY
         BPL   L032556
         DEX
L032556  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L032582
         DEX
L032582  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L0325AE
         DEX
L0325AE  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0002
         BNE   L0325DD
         BRL   L032609
L0325DD  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L0325F3
         DEX
L0325F3  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032609  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0001
         BNE   L032622
         BRL   L03264E
L032622  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L032638
         DEX
L032638  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03264E  BRL   L03275F
L032651  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0013
         LDX   #$0000
         TAY
         BPL   L032667
         DEX
L032667  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L032693
         DEX
L032693  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$0000
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L0326BF
         DEX
L0326BF  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0004
         BNE   L0326EE
         BRL   L03271A
L0326EE  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L032704
         DEX
L032704  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03271A  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0008
         BNE   L032733
         BRL   L03275F
L032733  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L032749
         DEX
L032749  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03275F  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L032775
         DEX
L032775  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1D
         STA   $21
         LDA   $1C
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L0327DA  ENT
         TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2801
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         JSL   L02AB20
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$FF00
         BNE   L0328B9
         BRL   L0328E5
L0328B9  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0010
         LDX   #$0000
         TAY
         BPL   L0328CF
         DEX
L0328CF  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0328E5  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L0328FE
         BRL   L03292A
L0328FE  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         LDX   #$0000
         TAY
         BPL   L032914
         DEX
L032914  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03292A  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0040
         BNE   L032943
         BRL   L03296F
L032943  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000F
         LDX   #$0000
         TAY
         BPL   L032959
         DEX
L032959  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03296F  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0020
         BNE   L032988
         BRL   L0329B4
L032988  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000E
         LDX   #$0000
         TAY
         BPL   L03299E
         DEX
L03299E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0329B4  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0010
         BNE   L0329CD
         BRL   L0329F9
L0329CD  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000D
         LDX   #$0000
         TAY
         BPL   L0329E3
         DEX
L0329E3  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0329F9  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0008
         BNE   L032A12
         BRL   L032A3E
L032A12  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L032A28
         DEX
L032A28  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032A3E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0004
         BNE   L032A57
         BRL   L032A83
L032A57  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000B
         LDX   #$0000
         TAY
         BPL   L032A6D
         DEX
L032A6D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032A83  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0002
         BNE   L032A9C
         BRL   L032AC8
L032A9C  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L032AB2
         DEX
L032AB2  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032AC8  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0001
         BNE   L032AE1
         BRL   L032B0D
L032AE1  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L032AF7
         DEX
L032AF7  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032B0D  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L032B23
         DEX
L032B23  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1D
         STA   $21
         LDA   $1C
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L032B88  ENT
         TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2901
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         JSL   L02AF0F
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L032C67
         BRL   L032C93
L032C67  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L032C7D
         DEX
L032C7D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032C93  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0001
         BNE   L032CAC
         BRL   L032CD8
L032CAC  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L032CC2
         DEX
L032CC2  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032CD8  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L032CEE
         DEX
L032CEE  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1D
         STA   $21
         LDA   $1C
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L032D53  ENT
         TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2A01
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         JSL   L02B155
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L032E32
         BRL   L032E5E
L032E32  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$000A
         LDX   #$0000
         TAY
         BPL   L032E48
         DEX
L032E48  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032E5E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         AND   #$0002
         BEQ   L032E77
         BRL   L032EA3
L032E77  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0009
         LDX   #$0000
         TAY
         BPL   L032E8D
         DEX
L032E8D  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L032EA3  LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0004
         LDX   #$0000
         TAY
         BPL   L032EB9
         DEX
L032EB9  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         LDA   #$00FF
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0003
         LDX   #$0000
         TAY
         BPL   L032EE5
         DEX
L032EE5  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _HiliteControl
         STA   L02C957
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1D
         STA   $21
         LDA   $1C
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L032F4A  ENT
         TSC
         SEC
         SBC   #$001C
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         PHA
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _LoadResource
         STA   L02C957
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L02C957
         PHA
         LDA   #$2B01
         PHA
         JSL   L020419
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L02C957
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
         LDX   #^L02BDAD
         LDA   #L02BDAD
         PHX
         PHA
         JSL   L030000
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0018
         LDA   [$00],Y
         TAX
         LDY   #$0016
         LDA   [$00],Y
         PHX
         PHA
         LDX   #^L02BAAD
         LDA   #L02BAAD
         PHX
         PHA
         JSL   L030000
         JSL   L02B3BD
         PHA
         PHA
         _FrontWindow
         STA   L02C957
         PLA
         STA   L02B9A9
         PLA
         STA   L02B9AB
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         AND   #$0080
         BNE   L033029
         BRL   L033055
L033029  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0008
         LDX   #$0000
         TAY
         BPL   L03303F
         DEX
L03303F  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L033055  PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   #$8004
         PHA
         LDX   $21
         LDA   $1F
         PHX
         PHA
         _ReleaseResource
         STA   L02C957
         PHA
         LDA   $1A
         PHA
         _SetResourceFileDepth
         STA   L02C957
         PLA
         STA   $1A
         LDA   $1D
         STA   $21
         LDA   $1C
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L0330A4  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         STA   [$19]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0100
         LDX   #$0000
         TAY
         BPL   L0330C5
         DEX
L0330C5  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0330E1
         BRL   L0330F2
L0330E1  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0330F2  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0200
         LDX   #$0000
         TAY
         BPL   L033105
         DEX
L033105  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033121
         BRL   L033132
L033121  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033132  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0400
         LDX   #$0000
         TAY
         BPL   L033145
         DEX
L033145  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033161
         BRL   L033172
L033161  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033172  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0800
         LDX   #$0000
         TAY
         BPL   L033185
         DEX
L033185  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0331A1
         BRL   L0331B2
L0331A1  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0331B2  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$1000
         LDX   #$0000
         TAY
         BPL   L0331C5
         DEX
L0331C5  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0331E1
         BRL   L0331F2
L0331E1  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$1000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0331F2  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$2000
         LDX   #$0000
         TAY
         BPL   L033205
         DEX
L033205  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033221
         BRL   L033232
L033221  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$2000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033232  LDA   $17
         STA   $1B
         LDA   $16
         STA   $1A
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L033242  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         STA   [$19]
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0100
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033279
         BRL   L03328A
L033279  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0100
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L03328A  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0200
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0332B3
         BRL   L0332C4
L0332B3  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0200
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0332C4  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0400
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0332ED
         BRL   L0332FE
L0332ED  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0400
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0332FE  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0800
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033327
         BRL   L033338
L033327  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$0800
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033338  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $1000
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033361
         BRL   L033372
L033361  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$1000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033372  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $2000
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L03339B
         BRL   L0333AC
L03339B  PEI   $1B
         PEI   $19
         LDA   [$19]
         ORA   #$2000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0333AC  LDA   $17
         STA   $1B
         LDA   $16
         STA   $1A
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L0333BC  TSC
         SEC
         SBC   #$0018
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         STA   $16
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7013
         LDX   #$0000
         TAY
         BPL   L0333DD
         DEX
L0333DD  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L0333F9
         BRL   L033401
L0333F9  LDA   #$000D
         STA   $16
         BRL   L03346C
L033401  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7012
         LDX   #$0000
         TAY
         BPL   L033414
         DEX
L033414  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033430
         BRL   L033438
L033430  LDA   #$001B
         STA   $16
         BRL   L03346C
L033438  PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7016
         LDX   #$0000
         TAY
         BPL   L03344B
         DEX
L03344B  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _GetCtlValue
         STA   L02C957
         PLA
         BNE   L033467
         BRL   L03346C
L033467  LDA   #$007F
         STA   $16
L03346C  PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $21
         PEI   $1F
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L033483
         DEX
L033483  PHX
         PHA
         _BlockMove
         STA   L02C957
         PEA   $0000
         TDC
         CLC
         ADC   #$0016
         PHA
         PEI   $1D
         PEI   $1B
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L0334A6
         DEX
L0334A6  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDA   $19
         STA   $21
         LDA   $18
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L0334C2  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0008
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0334F3
         BVS   L0334F1
         EOR   #$8000
L0334F1  BMI   L0334F6
L0334F3  BRL   L03353F
L0334F6  LDA   #$0004
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0008
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L03351F
         DEX
L03351F  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
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
L03353F  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0009
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L03355F
         BVS   L03355D
         EOR   #$8000
L03355D  BMI   L033562
L03355F  BRL   L0335AB
L033562  LDA   #$0004
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0009
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L03358B
         DEX
L03358B  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0022
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
L0335AB  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000A
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L0335CB
         BVS   L0335C9
         EOR   #$8000
L0335C9  BMI   L0335CE
L0335CB  BRL   L033602
L0335CE  LDA   #$0002
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$000A
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0026
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L033602  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000B
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L033622
         BVS   L033620
         EOR   #$8000
L033620  BMI   L033625
L033622  BRL   L033644
L033625  LDA   #$0006
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$000B
         STA   [$00]
L033644  PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L033656
         DEX
L033656  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L02B9A7
         STA   L02B9A5
         PHA
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextHand
         STA   L02C957
         PLA
         STA   L02B99F
         PLA
         STA   L02B9A1
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L02B9A3
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0028
         STX   $08
         STA   $06
         LDA   #$0001
         SEC
         SBC   L02B9A3
         BEQ   L0336D8
         BVS   L0336D6
         EOR   #$8000
L0336D6  BMI   L0336DB
L0336D8  BRL   L0336F0
L0336DB  PEI   $08
         PEI   $06
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         JSL   L0333BC
         BRL   L03378F
L0336F0  PEI   $08
         PEI   $06
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   L02B9A3
         BMI   L033724
         DEC
         DEC
         BPL   L033727
L033724  BRL   L03375E
L033727  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0001
         LDA   [$00],Y
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         BRL   L03378F
L03375E  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
L03378F  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0002
         PHA
         JSL   L0330A4
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0004
         PHA
         JSL   L033242
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$2000
         BEQ   L0337C4
         BRL   L0337EF
L0337C4  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         ORA   #$2000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L0337EF  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L0337FF  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0008
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L033830
         BVS   L03382E
         EOR   #$8000
L03382E  BMI   L033833
L033830  BRL   L03387C
L033833  LDA   #$0004
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0008
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L03385C
         DEX
L03385C  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$001E
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
L03387C  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0009
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L03389C
         BVS   L03389A
         EOR   #$8000
L03389A  BMI   L03389F
L03389C  BRL   L0338BE
L03389F  LDA   #$0006
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0009
         STA   [$00]
L0338BE  PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L0338D0
         DEX
L0338D0  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L02B9A7
         STA   L02B9A5
         PHA
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextHand
         STA   L02C957
         PLA
         STA   L02B99F
         PLA
         STA   L02B9A1
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L02B9A3
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0022
         STX   $08
         STA   $06
         LDA   #$0001
         SEC
         SBC   L02B9A3
         BEQ   L033952
         BVS   L033950
         EOR   #$8000
L033950  BMI   L033955
L033952  BRL   L03396A
L033955  PEI   $08
         PEI   $06
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         JSL   L0333BC
         BRL   L033A09
L03396A  PEI   $08
         PEI   $06
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   L02B9A3
         BMI   L03399E
         DEC
         DEC
         BPL   L0339A1
L03399E  BRL   L0339D8
L0339A1  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0001
         LDA   [$00],Y
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         BRL   L033A09
L0339D8  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
L033A09  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0002
         PHA
         JSL   L0330A4
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0004
         PHA
         JSL   L033242
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$2000
         BEQ   L033A3E
         BRL   L033A69
L033A3E  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         ORA   #$2000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033A69  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L033A79  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0009
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L033AAA
         BVS   L033AA8
         EOR   #$8000
L033AA8  BMI   L033AAD
L033AAA  BRL   L033AF6
L033AAD  LDA   #$0004
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0009
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L033AD6
         DEX
L033AD6  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0020
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
L033AF6  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000A
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L033B16
         BVS   L033B14
         EOR   #$8000
L033B14  BMI   L033B19
L033B16  BRL   L033B38
L033B19  LDA   #$0006
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$000A
         STA   [$00]
L033B38  PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L033B4A
         DEX
L033B4A  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L02B9A7
         STA   L02B9A5
         PHA
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextHand
         STA   L02C957
         PLA
         STA   L02B99F
         PLA
         STA   L02B9A1
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L02B9A3
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0024
         STX   $08
         STA   $06
         LDA   #$0001
         SEC
         SBC   L02B9A3
         BEQ   L033BCC
         BVS   L033BCA
         EOR   #$8000
L033BCA  BMI   L033BCF
L033BCC  BRL   L033BE4
L033BCF  PEI   $08
         PEI   $06
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         JSL   L0333BC
         BRL   L033C83
L033BE4  PEI   $08
         PEI   $06
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   L02B9A3
         BMI   L033C18
         DEC
         DEC
         BPL   L033C1B
L033C18  BRL   L033C52
L033C1B  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0001
         LDA   [$00],Y
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         BRL   L033C83
L033C52  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
L033C83  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0002
         PHA
         JSL   L0330A4
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0004
         PHA
         JSL   L033242
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$2000
         BEQ   L033CB8
         BRL   L033CE3
L033CB8  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         ORA   #$2000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033CE3  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L033CF3  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$0009
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L033D24
         BVS   L033D22
         EOR   #$8000
L033D22  BMI   L033D27
L033D24  BRL   L033D70
L033D27  LDA   #$0004
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$0009
         STA   [$00]
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L033D50
         DEX
L033D50  PHX
         PHA
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0020
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
L033D70  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDA   #$000A
         SEC
         SBC   $01,S
         PLY
         TAY
         BEQ   L033D90
         BVS   L033D8E
         EOR   #$8000
L033D8E  BMI   L033D93
L033D90  BRL   L033DB2
L033D93  LDA   #$0006
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         JSL   L0304A7
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   #$000A
         STA   [$00]
L033DB2  PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L033DC4
         DEX
L033DC4  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L02B9A7
         STA   L02B9A5
         PHA
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextHand
         STA   L02C957
         PLA
         STA   L02B99F
         PLA
         STA   L02B9A1
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LEGetTextLen
         STA   L02C957
         PLA
         STA   L02B9A3
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0024
         STX   $08
         STA   $06
         LDA   #$0001
         SEC
         SBC   L02B9A3
         BEQ   L033E46
         BVS   L033E44
         EOR   #$8000
L033E44  BMI   L033E49
L033E46  BRL   L033E5E
L033E49  PEI   $08
         PEI   $06
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         JSL   L0333BC
         BRL   L033EFD
L033E5E  PEI   $08
         PEI   $06
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         LDA   L02B9A3
         BMI   L033E92
         DEC
         DEC
         BPL   L033E95
L033E92  BRL   L033ECC
L033E95  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$0001
         LDA   [$00],Y
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
         BRL   L033EFD
L033ECC  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0001
         PHA
         LDX   L02B9A1
         LDA   L02B99F
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDA   [$00]
         AND   #$00FF
         PLX
         STX   $00
         PLX
         STX   $02
         SEP   #$20
         STA   [$00]
         REP   #$20
L033EFD  PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0002
         PHA
         JSL   L0330A4
         PEI   $08
         PEI   $06
         PLA
         CLC
         ADC   #$0004
         PHA
         JSL   L033242
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         AND   #$2000
         BEQ   L033F32
         BRL   L033F5D
L033F32  LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0014
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0014
         LDA   [$00],Y
         ORA   #$2000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L033F5D  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L033F6D  TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         STA   $16
         LDA   #$0001
         TAX
         SEP   #$20
         LDA   #$00
         STA   L02BEAD,X
         REP   #$20
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L033F9A
         DEX
L033F9A  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STA   $00
         STX   $02
         LDY   #$001E
         LDA   [$00],Y
         TAX
         LDY   #$001C
         LDA   [$00],Y
         STX   L02B9A7
         STA   L02B9A5
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L02BEAD
         PEA   ^L02BEAD
         PHA
         LDA   $16
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LESetText
         STA   L02C957
         LDA   $25
         LDX   #$0000
         CMP   #$000D
         BNE   L033FF6
         INX
L033FF6  TXA
         PHA
         LDA   $23
         LDX   #$0000
         CMP   #$000D
         BNE   L034003
         INX
L034003  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L03400D
         BRL   L03403C
L03400D  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7013
         LDX   #$0000
         TAY
         BPL   L034023
         DEX
L034023  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L034181
L03403C  LDA   $25
         LDX   #$0000
         CMP   #$001B
         BNE   L034047
         INX
L034047  TXA
         PHA
         LDA   $23
         LDX   #$0000
         CMP   #$001B
         BNE   L034054
         INX
L034054  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L03405E
         BRL   L03408D
L03405E  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7012
         LDX   #$0000
         TAY
         BPL   L034074
         DEX
L034074  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L034181
L03408D  LDA   $25
         LDX   #$0000
         CMP   #$007F
         BNE   L034098
         INX
L034098  TXA
         PHA
         LDA   $23
         LDX   #$0000
         CMP   #$007F
         BNE   L0340A5
         INX
L0340A5  TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L0340AF
         BRL   L0340DE
L0340AF  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7016
         LDX   #$0000
         TAY
         BPL   L0340C5
         DEX
L0340C5  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
         BRL   L034181
L0340DE  LDA   $25
         LDX   #$0001
         SEC
         SBC   #$0020
         BVS   L0340EC
         EOR   #$8000
L0340EC  BMI   L0340EF
         DEX
L0340EF  TXA
         PHA
         LDA   #$007E
         LDX   #$0001
         SEC
         SBC   $25
         BVS   L0340FF
         EOR   #$8000
L0340FF  BMI   L034102
         DEX
L034102  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L03410C
         BRL   L03411D
L03410C  LDA   #$0001
         STA   $16
         LDA   $16
         TAX
         SEP   #$20
         LDA   $25
         STA   L02BEAD,X
         REP   #$20
L03411D  LDA   $23
         LDX   #$0001
         SEC
         SBC   #$0020
         BVS   L03412B
         EOR   #$8000
L03412B  BMI   L03412E
         DEX
L03412E  TXA
         PHA
         LDA   #$007E
         LDX   #$0001
         SEC
         SBC   $23
         BVS   L03413E
         EOR   #$8000
L03413E  BMI   L034141
         DEX
L034141  TXA
         AND   $01,S
         PLX
         TAX
         BNE   L03414B
         BRL   L03415F
L03414B  LDA   $16
         CLC
         ADC   #$0001
         STA   $16
         LDA   $16
         TAX
         SEP   #$20
         LDA   $23
         STA   L02BEAD,X
         REP   #$20
L03415F  LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L02BEAD
         PEA   ^L02BEAD
         PHA
         LDA   $16
         PHA
         LDX   L02B9A7
         LDA   L02B9A5
         PHX
         PHA
         _LESetText
         STA   L02C957
L034181  PEA   $0000
         TDC
         CLC
         ADC   #$0018
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$7010
         LDX   #$0000
         TAY
         BPL   L03419C
         DEX
L03419C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         PLA
         STA   $00
         PLA
         STA   $02
         LDY   #$0002
         LDA   [$00],Y
         PHA
         LDA   [$00]
         PHA
         PLA
         CLC
         ADC   #$0008
         PHA
         PEA   $0008
         JSL   L02C5AB
         PEA   $0000
         TDC
         CLC
         ADC   #$0018
         PHA
         _InvalRect
         STA   L02C957
         LDA   $21
         STA   $25
         LDA   $20
         STA   $24
         PLD
         TSC
         CLC
         ADC   #$0024
         TCS
         RTL

L0341E7  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   $19
         AND   #$0100
         BNE   L0341FA
         BRL   L034226
L0341FA  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0100
         LDX   #$0000
         TAY
         BPL   L034210
         DEX
L034210  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L034226  LDA   $19
         AND   #$0200
         BNE   L034230
         BRL   L03425C
L034230  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0200
         LDX   #$0000
         TAY
         BPL   L034246
         DEX
L034246  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03425C  LDA   $19
         AND   #$0400
         BNE   L034266
         BRL   L034292
L034266  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0400
         LDX   #$0000
         TAY
         BPL   L03427C
         DEX
L03427C  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L034292  LDA   $19
         AND   #$0800
         BNE   L03429C
         BRL   L0342C8
L03429C  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$0800
         LDX   #$0000
         TAY
         BPL   L0342B2
         DEX
L0342B2  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0342C8  LDA   $19
         AND   #$1000
         BNE   L0342D2
         BRL   L0342FE
L0342D2  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$1000
         LDX   #$0000
         TAY
         BPL   L0342E8
         DEX
L0342E8  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0342FE  LDA   $19
         AND   #$2000
         BNE   L034308
         BRL   L034334
L034308  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         LDA   #$2000
         LDX   #$0000
         TAY
         BPL   L03431E
         DEX
L03431E  PHX
         PHA
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L034334  LDA   $17
         STA   $19
         LDA   $16
         STA   $18
         PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L034344  TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   $19
         AND   #$0100
         BNE   L034357
         BRL   L03437D
L034357  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0100
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03437D  LDA   $19
         AND   #$0200
         BNE   L034387
         BRL   L0343AD
L034387  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0200
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0343AD  LDA   $19
         AND   #$0400
         BNE   L0343B7
         BRL   L0343DD
L0343B7  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0400
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L0343DD  LDA   $19
         AND   #$0800
         BNE   L0343E7
         BRL   L03440D
L0343E7  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0800
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03440D  LDA   $19
         AND   #$1000
         BNE   L034417
         BRL   L03443D
L034417  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $1000
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03443D  LDA   $19
         AND   #$2000
         BNE   L034447
         BRL   L03446D
L034447  LDA   #$0001
         PHA
         PHA
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $2000
         PEA   $0000
         _GetCtlHandleFromID
         STA   L02C957
         _SetCtlValue
         STA   L02C957
L03446D  LDA   $17
         STA   $19
         LDA   $16
         STA   $18
         PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

L03447D  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDX   #^L02BEAD
         LDA   #L02BEAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L03447D
         PEA   L03447D
         LDA   #$0000
         PHA
         JSL   L02C5F5
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         CMP   #$000B
         BEQ   L0344BE
         BRL   L034533
L0344BE  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0028
         STX   $08
         STA   $06
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   #$02
         STA   L02BEAD,X
         REP   #$20
         PEI   $08
         PEI   $06
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L02BEAD
         PEA   ^L02BEAD
         PHA
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L0344F6
         DEX
L0344F6  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0002
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
         LDY   #$0002
         LDA   [$06],Y
         PHA
         JSL   L0341E7
         LDY   #$0004
         LDA   [$06],Y
         PHA
         JSL   L034344
         BRL   L03454D
L034533  LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
L03454D  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L03455D  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDX   #^L02BEAD
         LDA   #L02BEAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L03455D
         PEA   L03455D
         LDA   #$0000
         PHA
         JSL   L02C5F5
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         CMP   #$0009
         BEQ   L03459E
         BRL   L034613
L03459E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0022
         STX   $08
         STA   $06
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   #$02
         STA   L02BEAD,X
         REP   #$20
         PEI   $08
         PEI   $06
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L02BEAD
         PEA   ^L02BEAD
         PHA
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L0345D6
         DEX
L0345D6  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0002
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
         LDY   #$0002
         LDA   [$06],Y
         PHA
         JSL   L0341E7
         LDY   #$0004
         LDA   [$06],Y
         PHA
         JSL   L034344
         BRL   L03462D
L034613  LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
L03462D  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L03463D  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDX   #^L02BEAD
         LDA   #L02BEAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L03463D
         PEA   L03463D
         LDA   #$0000
         PHA
         JSL   L02C5F5
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         CMP   #$000A
         BEQ   L03467E
         BRL   L0346F3
L03467E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0024
         STX   $08
         STA   $06
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   #$02
         STA   L02BEAD,X
         REP   #$20
         PEI   $08
         PEI   $06
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L02BEAD
         PEA   ^L02BEAD
         PHA
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L0346B6
         DEX
L0346B6  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0002
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
         LDY   #$0002
         LDA   [$06],Y
         PHA
         JSL   L0341E7
         LDY   #$0004
         LDA   [$06],Y
         PHA
         JSL   L034344
         BRL   L03470D
L0346F3  LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
L03470D  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L03471D  ENT
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   $1F
         LDA   $1D
         STX   $18
         STA   $16
         LDX   #^L02BEAD
         LDA   #L02BEAD
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^L03471D
         PEA   L03471D
         LDA   #$0000
         PHA
         JSL   L02C5F5
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         CMP   #$000A
         BEQ   L03475E
         BRL   L0347D3
L03475E  LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0024
         STX   $08
         STA   $06
         LDA   #$0000
         TAX
         SEP   #$20
         LDA   #$02
         STA   L02BEAD,X
         REP   #$20
         PEI   $08
         PEI   $06
         LDA   #$0001
         TAX
         TXA
         CLC
         ADC   #L02BEAD
         PEA   ^L02BEAD
         PHA
         LDA   #$0002
         LDX   #$0000
         TAY
         BPL   L034796
         DEX
L034796  PHX
         PHA
         _BlockMove
         STA   L02C957
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0002
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
         LDY   #$0002
         LDA   [$06],Y
         PHA
         JSL   L0341E7
         LDY   #$0004
         LDA   [$06],Y
         PHA
         JSL   L034344
         BRL   L0347ED
L0347D3  LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         LDA   #$0001
         TAX
         LDA   L02BEAD,X
         AND   #$00FF
         PHA
         JSL   L033F6D
L0347ED  LDA   $1B
         STA   $1F
         LDA   $1A
         STA   $1E
         PLD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL


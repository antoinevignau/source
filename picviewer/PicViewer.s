*
* PicViewer
*
* (c) Brutal Deluxe, 1996-2025
*

	mx	%00
	rel
	typ	PIF
	dsk	PicViewer.l
	lst	off

*--------------------------------------
* Version
*
* 1.07 - AV 202505
*  - anim file bug fix
*
* 1.04 - AV 202009 for Olivier Zardini
*  - Supports LZ4
*  - Supports HGR files
*
* 1.03 - AV 202008 for dwsJason :-)
*  - Supports GSLA, Jason's animation file format
*
* 1.02 - AV 202004 for Fatdog :-)
*  - GS/OS close call did not get the refnum, bad bad bad
*  - SEI removed, useful for 3200-col pics only, not all formats
*  - Anim files (bad format) now play well and support virtual memory
*
* 1.01 - AV 1996 perharps
*  - I do not know the changes from 1.0
*

	use	4/Event.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Qd.Macs
	use	4/Util.Macs
	use	4/Window.Macs

*--------------------------------------

Debut	=	$00
Arrivee	=	Debut+4
Debut2	=	$fc

frameINDEX	=	$10	; index within frame data
fileIN	=	frameINDEX+4	; points to first frame data
fileOUT	=	fileIN+4	; first frame in + EOF

theTICK	=	fileOUT+4	; tick
theTICK2	=	theTICK+2

dataIn	=	$0a

*--------------------------------------

KBD	=	$c000
CLR80COL	=	$c000
SET80COL	=	$c001
CLR80VID	=	$c00c
SET80VID	=	$c00d
KBDSTROBE	=	$c010
VBL	=	$c019
MOUSEDATA	=	$c024
KEYMODREG	=	$c025
KMSTATUS	=	$c027
NEWVIDEO	=	$c029
TXTCLR	=	$c050
MIXCLR	=	$c052
TXTPAGE1	=	$c054
HIRES	=	$c057
SETAN3	=	$c05e
CLRAN3	=	$c05f

GSOS	=	$e100a8

*--------------------------------------

            PHB
            PHK
            PLB
            PHA
            _MMStartUp
            PLA
            STA   myID
            
            PushLong	#myBRUTAL
            PushWord	myID
            PushLong	#myREQUEST
            _AcceptRequests

            PushLong	#bootINFO
            PushLong	#bootICON
            _ShowBootInfo
            PLB
            RTL

*--------------------------------------

myREQUEST   PHD
            TSC
            TCD
            LDA   $0E
            CMP   #$0104
            BNE   L004D
            BRL   L005C
L0048       LDA   #$8000
            STA   $10
L004D       PLD
            LDA   $02,S
            STA   $0C,S
            LDA   $01,S
            STA   $0B,S
            PLY
            PLY
            PLY
            PLY
            PLY
            RTL

*--------------------------------------
* finderSaysBeforeOpen
*--------------------------------------

L005C       LDY   #$0016
            LDA   [$0A],Y
            BEQ   L0066
L0063       BRL   L004D
L0066       LDY   #$000C
            LDA   [$0A],Y
            PHA
            LDY   #$0002
            LDA   [$0A],Y
            STAL  proGETINFO+2
            STAL  proOPEN+4
            INY
            INY
            LDA   [$0A],Y
            STAL  proGETINFO+2+2
            STAL  proOPEN+4+2
            JSL   GSOS
            DW    $2006            ; GetFileInfo
            ADRL  proGETINFO
            LDY   #$000A
            LDA   [$0A],Y
            BNE   L0099
            BRL   L0133
L0099       PLY
            CMP   #$00C0
            BEQ   L00CA
            CMP   #$00F1
            BEQ   L0104
            CMP   #$00C1
            BEQ   L010F
            CMP   #$0006
            BEQ   L0102
            CMP   #$00CA
            BEQ   L00C5
            CMP   #$00C2
            BNE   L0063
            LDX   #$000A
            CPY   #$8005
            BEQ   L0137
            LDX   #$0006
            BRA   L00CD
L00C5       LDX   #$0009
            BRA   L0137
L00CA       LDX   #$0005
L00CD       CPY   #$0000
            BEQ   L0137
            CPY   #$8000
            BEQ   L0137
            LDX   #$0000
            CPY   #$0001
            BEQ   L0137
            LDX   #$0001
            CPY   #$0004
            BEQ   L0137
            LDX   #$0004
            CPY   #$8005
            BEQ   L0137
            LDX   #$0007
            CPY   #$0002
            BEQ   L0137
            LDX   #$000B
            CPY   #$BDBD
            BEQ   L0137
            BRL   L004D
L0102       BRA   L0134
L0104       LDX   #$0001
            CPY   #$0004
            BEQ   L0137
            BRL   L004D
L010F       LDX   #$0002
            CPY   #$0000
            BEQ   L0137
            CPY   #$0101
            BEQ   L0137
            LDX   #$0008
            CPY   #$0002
            BEQ   L0137
            LDX   #$0002
            LDAL  proEOF
            CMP   #$8000
            BEQ   L0137
            BRL   L004D
L0133       PLY
L0134       LDX   #$0003
L0137       TXA
            STAL  theFORMAT
            PHB
            PHK
            PLB
            PHD
            LDAL  $E0C035
            AND   #$0008
            BNE   L0181
            JSR   initMEMORY
            BCS   L017E
            LDA   myDP
            TCD
            LDA   theFORMAT
            CMP   #$000A
            BEQ   L015F
            JSR   loadFILE
            BCS   L017E
L015F       JSR   saveSHR
            LDA   theFORMAT
            ASL
            TAX
            JSR   (tblFORMAT,X)
            BCS   L0177
            JSR   restoreSHR
            JSR   freeMEMORY
            PLD
            PLB
            BRL   L0048
L0177       _ShowCursor
L017E       JSR   freeMEMORY
L0181       PLD
            PLB
            BRL   L004D

*--------------------------------------
* Handle uncompressed picture
*--------------------------------------

doPIC       LDX   ptrFILE+2
            LDY   ptrFILE
            JMP   show256

*--------------------------------------
* Handle PNT
*--------------------------------------

doGSPAINT   LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDA   ptrUNPACK
            CLC
            ADC   #$7D00
            STA   $04
            LDA   ptrUNPACK+2
            ADC   #$0000
            STA   $06
            LDY   #$0000
            TYA
L01AE       STA   [$04],Y
            INY
            INY
            CPY   #$0300
            BNE   L01AE
            LDA   $04
            CLC
            ADC   #$0100
            STA   $04
            LDY   #$0000
L01C2       LDA   [$00],Y
            STA   [$04],Y
            INY
            INY
            CPY   #$0020
            BNE   L01C2
            LDA   ptrFILE
            CLC
            ADC   #$0222
            STA   ptrFILE
            LDA   ptrFILE+2
            ADC   #$0000
            STA   ptrFILE+2
            LDA   theLENGTH
            SEC
            SBC   #$0222
            STA   theLENGTH
            LDA   ptrUNPACK
            LDX   ptrUNPACK+2
            LDY   #$7D00
            JSR   unpackRLE
            LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JMP   show256

*--------------------------------------
* Handle LZ4
*--------------------------------------

doLZ4       LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDA   [$00]
            CMP   #$2103
            BNE   L0236
            LDY   #$0002
            LDA   [$00],Y
            CMP   #$184C
            BNE   L0236
            LDY   #$0006
            LDA   [$00],Y
            BNE   L0236
            LDY   #$000E
            LDA   [$00],Y
            BNE   L0236
            LDX   #$0001
            LDA   #$0000
            LDY   #$C01C
            JSR   getMEMORY
            BCC   L0238
L0236       SEC
            RTS

L0238       LDA   proEOF
            JSR   unpackLZ4
            BCS   L0236
            LDY   #$0004
            LDA   [$00],Y
            CMP   #$8000
            BEQ   L025A
            CMP   #$9600
            BNE   L0263
            LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JSR   show256
            BRA   L0263
L025A       LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JSR   show256
L0263       LDA   theHANDLE+2
            PHA
            LDA   theHANDLE
            PHA
            _DisposeHandle
            CLC
            RTS

*----------------------------
* unpackLZ4
*  Unpacks a LZ4 file
*  Uses the two pointers:
*   - ptrPICTURE: packed img
*   - ptrUNPACK: temp unpack zone
*
* Entry:
*  A: packed data size
*
* Exit:
*  A: unpacked data size
*
*----------------------------

unpackLZ4   STA   L02FF+1
            LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDA   thePOINTER
            STA   $04
            LDA   thePOINTER+2
            STA   $06
            LDY   #$000C
            LDA   [$00],Y
            BNE   L0294
            SEC
            RTS

L0294       STA   L02A0+1
            LDY   #$0000
L029A       TYX
            LDA   [$00],Y
            STA   [$04],Y
            INY
L02A0       CPX   #$BDBD
            BCC   L029A
            SEP   #$20
            LDA   thePOINTER+2
            STA   L02FA+2
            STA   L02DE+3
            STA   L0306+3
            STA   L0333+3
            LDA   ptrUNPACK+2
            STA   L02FA+1
            STA   L0325+1
            STA   L0325+2
            REP   #$20
            LDA   ptrUNPACK
            STA   $04
            LDA   ptrUNPACK+2
            STA   $06
            LDY   #$0000
            TYA
L02D2       STA   [$04],Y
            INY
            INY
            BNE   L02D2
            LDY   #$0000
            LDX   #$0010
L02DE       LDAL  $AA0000,X
            INX
            STA   L030F+1
            AND   #$00F0
            BEQ   L02FF
            CMP   #$00F0
            BNE   L02F5
            JSR   L032D
            BRA   L02F9
L02F5       LSR
            LSR
            LSR
            LSR
L02F9       DEC
L02FA       MVN   $000000,$000000
            PHK
            PLB
L02FF       CPX   #$AAAA
            BCS   L034D
            TYA
            SEC
L0306       SBCL  $AA0000,X
            INX
            INX
            STA   L0322+1
L030F       LDA   #$0000
            AND   #$000F
            CMP   #$000F
            BNE   L031D
            JSR   L0330
L031D       CLC
            ADC   #$0003
            PHX
L0322       LDX   #$AAAA
L0325       MVN   $000000,$000000
            PHK
            PLB
            PLX
            BRA   L02DE
L032D       LDA   #$000F
L0330       STA   L0341+1
L0333       LDAL  $AA0000,X
            INX
            AND   #$00FF
            CMP   #$00FF
            BNE   L0349
            CLC
L0341       ADC   #$000F
            STA   L0341+1
            BRA   L0333
L0349       ADC   L0341+1
            RTS

L034D       TYA
            CLC
            RTS

*--------------------------------------
* Handle GSLA animation format
*--------------------------------------

doGSLA      JSL   GSOS
            DW    $2010            ; Open
            ADRL  proOPEN
            BCS   L0398
            LDA   proOPEN+2
            STA   proREAD+2
            STA   proCLOSE+2
            STA   proSETMARK+2
            STA   proGETEOF+2
            JSL   GSOS
            DW    $2019            ; GetEOF
            ADRL  proGETEOF
            LDA   proGETEOF+4
            STA   theLENGTH
            STA   proREAD+8
            LDX   proGETEOF+4+2
            STX   theLENGTH+2
            STX   proREAD+8+2
            LDX   #$0001
            LDA   #$0000
            LDY   #$C01C
            JSR   getMEMORY
            BCC   L039A
            JSR   closeFILE
L0398       SEC
            RTS

L039A       STX   ptrFILE
            STY   ptrFILE+2
            LDA   theHANDLE
            STA   haFILE
            LDA   theHANDLE+2
            STA   haFILE+2
            LDA   ptrFILE
            STA   proREAD+4
            STA   $FC
            LDA   ptrFILE+2
            STA   proREAD+6
            STA   $FE
            STZ   proREAD+8
            LDA   #$0001
            STA   proREAD+10
            STZ   proSETMARK+6
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            LDA   #$007F
            LDX   #L04CB
            PHD
            PLY
            STY   L0411+1
            STY   L03EA+1
            MVN   L04CB,$000000
            PHK
            PLB
            LDA   $FE
            LDX   #$001C
L03EA       JSL   $00BDBD
            LDA   #$0001
            STA   L0488
            PHA
            PHA
            _TickCount
            PLA
            PLX
            STA   L048A
            STX   L048A+2
L0405       LDY   #$0018
            LDA   [$FC],Y
            CLC
            ADC   #$001C
            TAX
            LDA   $FE
L0411       JSL   $00BDBD
            JSL   GSOS
            DW    $2016            ; SetMark
            ADRL  proSETMARK
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            LDA   L0488
            BNE   L0405
            JSR   closeFILE
            CLC
            RTS

L0433       PHK
            PLB
L0435       PHA
            PEA   $000A
            PEA   ^L0470
            PEA   L0470
            _TaskMaster
            PLA
            BEQ   L0456
            LDA   L0470
            CMP   #$0001
            BEQ   L046B
            CMP   #$0003
            BEQ   L046B
L0456       PHA
            PHA
            _TickCount
            PLA
            PLX
            CMP   L048A
            BEQ   L0435
            STA   L048A
            CLC
            RTL

L046B       STZ   L0488
            SEC
            RTL

L0470       DW    $0000            ; event code
            ADRL  $00000000        ; event message
            ADRL  $00000000        ; tick count
            DW    $0000            ; mouse location
            DW    $0000
            DW    $0000            ; modifiers
            ADRL  $00000000        ; task data
            ADRL  $00001FFF        ; task mask
L0488       DW    $0000
L048A       ADRL  $00000000
            STR   "Written By:  Jason Andersen and Steven Chiang"

L04BC       PHK
            PLB
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            LDA   $FE
            RTL

*--- GSLA player - It goes on direct page

L04CB       PHB
            SEP   #$20
            STA   $44
            STA   $48
            STA   $5A
            REP   #$31
            LDY   #$2000
            STZ   $6F
            BRA   L0510
L04DD       BEQ   L04F2
            LSR
            LSR
            BCS   L04F0
            PHX
            JSL   L0433
            PLX
            BCS   L04F0
            LDY   #$2000
            BRA   L0510
L04F0       PLB
            RTL

L04F2       JSL   L04BC
            NOP
            NOP
            NOP
            SEP   #$20
            STA   $44
            STA   $48
            STA   $5A
            REP   #$31
            LDX   #$0000
            BRA   L0510
L0508       INX
            INX
            LSR
            BCC   L04DD
            MVN   $010000,$010000
L0510       LDAL  $020000,X
            BPL   L0508
            INX
            INX
            AND   #$7FFF
            LSR
            BCS   L0532
            STA   $71
            STX   $58
            LDAL  $020000
            TAX
            LDA   $71
            MVN   $010000,$010000
            LDX   $58
            INX
            INX
            BRA   L0510
L0532       STY   $6A
            ADC   #$0000
            TAY
            BRA   L0510
            DW    $0000
            DW    $0000

*--------------------------------------
* Handle animation format
*--------------------------------------

doANIMATION SEP   #$20
            STAL  KBDSTROBE
            REP   #$20
            LDAL  KEYMODREG
            AND   #$0001
            TAX

* We have shift (fast) and no shift (normal) modes
*  We have two cases to handle
*   1. the animation is fully loaded into memory
*   2. the animation is not loaded at all, use virtual memory

            LDA   haFILE
            ORA   haFILE+2
            BNE   L0561
            CPX   #$0001
            BEQ   L055E
            JMP   virtANIM
L055E       JMP   virtFANIM

*--- The animation is loaded into memory

L0561       CPX   #$0001
            BNE   L0569
            JMP   L064C

L0569       JSR   fadeOUT
            LDX   ptrFILE+2
            LDY   ptrFILE
            JSR   fadeIN
            LDA   ptrFILE
            STA   $04
            CLC
            ADC   #$800C
            STA   fileIN
            LDA   ptrFILE+2
            STA   $06
            ADC   #$0000
            STA   fileIN+2
            LDA   ptrFILE
            CLC
            ADC   proEOF
            STA   fileOUT
            LDA   ptrFILE+2
            ADC   proEOF+2
            STA   fileOUT+2
            LDY   #$8004
            LDA   [$04],Y
            STA   theTICK
            STA   $1E
            PHB
            PEA   $0101
            PLB
            PLB
            BRA   L05B8

*--- Go to first frame

L05AC       LDY   #$7FFE
L05AF       LDA   [$04],Y
            STA   $2000,Y
            DEY
            DEY
            BPL   L05AF
L05B8       LDA   fileIN
            STA   $00
            LDA   fileIN+2
            STA   $02

L05C0       LDA   [$00]
            BEQ   L05FD
            TAX
            LDY   #$0002
            LDA   [$00],Y
            STA   $2000,X

*--- Next data within frame

            LDAL  KBD-1
            BMI   L0612
            LDAL  $E100E7
            AND   #$C000
            CMP   #$C000
            BEQ   L05E2
            ROL
            BCS   L0649

L05E2       lda   #4	; v1.0.7
L05E3       CLC
            ADC   $00
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            CMP   fileOUT+2
            BCC   L05C0
            LDA   $00
            CMP   fileOUT
            BCC   L05C0
            BCS   L05AC

* Frame sync

L05FD       LDX   theTICK
            BEQ   L0608	; v1.0.7
L0601       LDAL  VBL-1
            BMI   L0601
L0607       LDAL  VBL-1
            BPL   L0607
            DEX
            BNE   L0601
            
L0608       lda   #8	; v1.0.7
            bne   L05E3

* User can change speed of animation

L0612       XBA
            AND   #$00FF
            SEP   #$20
            STAL  KBDSTROBE
            REP   #$20
            CMP   #$009B
            BEQ   L0649
            CMP   #$0095
            BEQ   L063B
            CMP   #$00A0
            BEQ   L0643
            CMP   #$00B0
            BEQ   L063F
            CMP   #$0088
            BNE   L05E2
            INC   theTICK
            BRA   L05E2
L063B       DEC   theTICK
            BPL   L05E2
L063F       STZ   theTICK
            BRA   L05E2
L0643       LDA   $1E
            STA   theTICK
            BRA   L05E2
L0649       PLB
            CLC
            RTS

*---------------------------
* RAM animation but fast
*---------------------------

L064C       JSR   fadeOUT
            LDX   ptrFILE+2
            LDY   ptrFILE
            JSR   fadeIN
            LDA   ptrFILE
            STA   $04
            CLC
            ADC   #$800C
            STA   fileIN
            LDA   ptrFILE+2
            STA   $06
            ADC   #$0000
            STA   fileIN+2
            LDA   ptrFILE
            CLC
            ADC   proEOF
            STA   fileOUT
            LDA   ptrFILE+2
            ADC   proEOF+2
            STA   fileOUT+2
            PHB
            PEA   $0101
            PLB
            PLB
            BRA   L0692
L0686       LDY   #$7FFE
L0689       LDA   [$04],Y
            STA   $2000,Y
            DEY
            DEY
            BPL   L0689
L0692       LDA   fileIN
            STA   $00
            LDA   fileIN+2
            STA   $02
L069A       LDA   [$00]
            BEQ   L06A9	; v1.0.7
            TAX
            LDY   #$0002
            LDA   [$00],Y
            STA   $2000,X

*--- Next data within frame

L06A7       LDAL  KBD-1
            BMI   L06C8

            lda   #4
L06A8       CLC
            ADC   $00
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            CMP   fileOUT+2
            BCC   L069A
            LDA   $00
            CMP   fileOUT
            BCC   L069A
            BCS   L0686

L06A9       lda   #8	; v1.0.7
            bne   L06A8
          
L06C8       SEP   #$20
            STAL  KBDSTROBE
            REP   #$20
            PLB
            CLC
            RTS

*---------------------------
* Virtual animation
*---------------------------

virtANIM    LDX   #$0001
            LDA   #$0000
            LDY   #$C01C
            JSR   getMEMORY
            BCC   L06E6
L06E1       JSR   closeFILE
            SEC
            RTS

L06E6       STX   ptrFILE
            STY   ptrFILE+2
            LDA   theHANDLE
            STA   haFILE
            LDA   theHANDLE+2
            STA   haFILE+2
            LDA   ptrUNPACK
            STA   proREAD+4
            LDA   ptrUNPACK+2
            STA   proREAD+4+2
            LDA   #$800C
            STA   proREAD+8
            STZ   proREAD+8+2
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            BCS   L06E1
            JSR   fadeOUT
            LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JSR   fadeIN
            LDA   ptrUNPACK
            STA   $04
            LDA   ptrUNPACK+2
            STA   $06
            LDY   #$8004
            LDA   [$04],Y
            STA   theTICK
            STA   $1E
            LDA   ptrFILE
            STA   proREAD+4
            STA   $00
            LDA   ptrFILE+2
            STA   proREAD+4+2
            STA   $02
            STZ   proREAD+8
            LDA   #$0001
            STA   proREAD+8+2
            LDA   #$800C
            STA   proSETMARK+6
            BRA   L076C
L0759       PHB
            PEA   $0101
            PLB
            PLB
            LDY   #$7FFE
L0762       LDA   [$04],Y
            STA   $2000,Y
            DEY
            DEY
            BPL   L0762
            PLB
L076C       JSL   GSOS
            DW    $2016            ; SetMark
            ADRL  proSETMARK
L0776       PHK
            PLB
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            LDA   proREAD+12
            STA   L07C0+1
            ORA   proREAD+12+2
            BEQ   L0759
            LDY   #$0000
            PEA   $0101
            PLB
            PLB
            LDAL  KBD-1
            BMI   L07DE
L079B       LDA   [$00],Y
            BEQ   L07C7
            TAX
            INY
            INY
            LDA   [$00],Y
            STA   $2000,X
            LDAL  KBD-1
            BMI   L07DE
            LDAL  $E100E7
            AND   #$C000
            CMP   #$C000
            BEQ   L07BC
            ROL
            BCS   L0815
L07BC       INY
            INY
            BEQ   L0776
L07C0       CPY   #$BDBD
            BNE   L079B
            BEQ   L0776
L07C7       INY
            INY

            LDX   theTICK
            BEQ   L07D4
L07CD       LDAL  VBL-1
            BMI   L07CD
L07D3       LDAL  VBL-1
            BPL   L07D3
            DEX
            BNE   L07CD

L07D4       iny		; v1.0.7
            iny
            iny
            iny
            bra   L07BC

L07DE       XBA
            AND   #$00FF
            SEP   #$20
            STAL  KBDSTROBE
            REP   #$20
            CMP   #$009B
            BEQ   L0815
            CMP   #$0095
            BEQ   L0807
            CMP   #$00A0
            BEQ   L080F
            CMP   #$00B0
            BEQ   L080B
            CMP   #$0088
            BNE   L07BC
            INC   theTICK
            BRA   L07BC
L0807       DEC   theTICK
            BPL   L07BC
L080B       STZ   theTICK
            BRA   L07BC
L080F       LDA   $1E
            STA   theTICK
            BRA   L07BC
L0815       PHK
            PLB
            JSR   closeFILE
            CLC
            RTS

*---------------------------
* Virtual fast animation
*---------------------------

virtFANIM   LDX   #$0001
            LDA   #$0000
            LDY   #$C01C
            JSR   getMEMORY
            BCS   L085D
            STX   ptrFILE
            STY   ptrFILE+2
            LDA   theHANDLE
            STA   haFILE
            LDA   theHANDLE+2
            STA   haFILE+2
            LDA   ptrUNPACK
            STA   proREAD+4
            LDA   ptrUNPACK+2
            STA   proREAD+4+2
            LDA   #$800C
            STA   proREAD+8
            STZ   proREAD+8+2
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            BCC   L0862
L085D       JSR   closeFILE
            SEC
            RTS

L0862       JSR   fadeOUT
            LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JSR   fadeIN
            LDA   ptrUNPACK
            STA   $04
            LDA   ptrUNPACK+2
            STA   $06
            LDA   ptrFILE
            STA   proREAD+4
            STA   $00
            LDA   ptrFILE+2
            STA   proREAD+4+2
            STA   $02
            STZ   proREAD+8
            LDA   #$0001
            STA   proREAD+8+2
            BRA   L08A6
L0893       PHB
            PEA   $0101
            PLB
            PLB
            LDY   #$7FFE
L089C       LDA   [$04],Y
            STA   $2000,Y
            DEY
            DEY
            BPL   L089C
            PLB
L08A6       JSL   GSOS
            DW    $2016            ; SetMark
            ADRL  proSETMARK
L08B0       PHK
            PLB
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            LDAL  KBD-1
            BMI   L08F6
            LDA   proREAD+12
            STA   L08EB+1
            ORA   proREAD+12+2
            BEQ   L0893
            LDY   #$0000
            PEA   $0101
            PLB
            PLB
L08D5       LDA   [$00],Y
            BEQ   L08F2
            TAX
            INY
            INY
            LDA   [$00],Y
            STA   $2000,X
            LDAL  KBD-1
            BMI   L08F6
L08E7       INY
            INY
            BEQ   L08B0
L08EB       CPY   #$BDBD
            BNE   L08D5
            BEQ   L08B0
L08F2       INY
            INY
            iny		; v1.0.7
            iny
            iny
            iny
            BRA   L08E7
L08F6       PHK
            PLB
            SEP   #$20
            STAL  KBDSTROBE
            REP   #$30
            JSR   closeFILE
            CLC
            RTS

*--------------------------------------
* APF $C0/0002
*--------------------------------------

doAPF       LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDA   ptrUNPACK
            CLC
            ADC   #$7E00
            STA   $04
            LDA   ptrUNPACK+2
            ADC   #$0000
            STA   $06
            LDY   #$0000
L0923       LDA   [$00],Y
            CMP   #$414D
            BNE   L0935
            INY
            INY
            LDA   [$00],Y
            CMP   #$4E49
            BEQ   L093D
            DEY
            DEY
L0935       INY
            CPY   theLENGTH
            BNE   L0923
            SEC
            RTS

L093D       INY
            INY
            LDA   [$00],Y
            STA   L1A02
            AND   #$000F
            TAX
            LDA   #$0000
L094B       CPX   #$0000
            BEQ   L0957
            CLC
            ADC   #$0020
            DEX
            BRA   L094B
L0957       CLC
            ADC   $04
            STA   $04
            LDA   $06
            ADC   #$0000
            STA   $06
            INY
            INY
            JSR   L0B0E
            LDY   #$0000
            LDA   [$00],Y
            CMP   #$0280
            BCC   L0976
            BEQ   L0976
            SEC
            RTS

L0976       LDY   #$0002
            LDA   [$00],Y
            BNE   L097F
            SEC
            RTS

L097F       STA   L19FE
            INY
            INY
            JSR   L0B0E
            LDY   #$0000
L098A       LDX   #$0000
L098D       LDA   [$00],Y
            STA   [$04],Y
            INY
            INY
            INX
            INX
            CPX   #$0020
            BNE   L098D
            DEC   L19FE
            BNE   L098A
            JSR   L0B0E
            LDY   #$0000
            LDA   [$00],Y
            TAX
            BNE   L09AC
            SEC
            RTS

L09AC       CMP   #$00C8
            BCC   L09B4
            LDA   #$00C8
L09B4       STA   L1A00
            INY
            INY
            JSR   L0B0E
            LDA   #$0000
L09BF       CLC
            ADC   #$0004
            DEX
            BNE   L09BF
            CLC
            ADC   $00
            STA   L19EA
            LDA   $02
            ADC   #$0000
            STA   L19EA+2
            LDA   ptrUNPACK
            STA   L19F0
            LDA   ptrUNPACK+2
            STA   L19F0+2
            LDA   ptrUNPACK
            CLC
            ADC   #$7D00
            STA   $04
            LDA   ptrUNPACK+2
            ADC   #$0000
            STA   $06
            STZ   L19FE
L09F4       LDY   #$0000
            LDA   [$00],Y
            JSR   L0AAF
            LDA   L19FE
            CMP   #$00C8
            BCS   L0A15
            SEP   #$20
            LDY   #$0002
            LDA   [$00],Y
            ORA   L1A02
            LDY   L19FE
            STA   [$04],Y
            REP   #$20
L0A15       LDA   $00
            CLC
            ADC   #$0004
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            INC   L19FE
            LDA   L19FE
            CMP   L1A00
            BNE   L09F4
            LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDY   #$0000
L0A3C       LDA   [$00],Y
            CMP   #$554D
            BNE   L0A60
            INY
            INY
            LDA   [$00],Y
            CMP   #$544C
            BNE   L0A60
            INY
            INY
            LDA   [$00],Y
            CMP   #$5049
            BNE   L0A60
            INY
            INY
            LDA   [$00],Y
            CMP   #$4C41
            BEQ   L0A6F
            DEY
            DEY
L0A60       INY
            CPY   theLENGTH
            BNE   L0A3C
            LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JMP   show256

L0A6F       INY
            INY
            LDA   [$00],Y
            CMP   #$00C8
            BCC   L0A7B
            LDA   #$00C8
L0A7B       STA   L19FE
            INY
            INY
            JSR   L0B0E
            LDY   #$0000
L0A86       LDX   #$0000
L0A89       LDA   [$00],Y
            PHA
            INY
            INY
            INX
            INX
            CPX   #$0020
            BNE   L0A89
            TYA
            SEC
            SBC   #$0020
            TAY
            LDX   #$001E
L0A9E       PLA
            STA   [$04],Y
            INY
            INY
            DEX
            DEX
            BPL   L0A9E
            DEC   L19FE
            BNE   L0A86
            BRL   doSHOW3200
L0AAF       STA   L19EE
            LDA   L19F0
            STA   L19F8
            LDA   L19F0+2
            STA   L19F8+2
            LDA   #$00A0
            STA   L19FC
            PEA   $0000
            LDA   L19EA+2
            PHA
            LDA   L19EA
            PHA
            LDA   L19EE
            PHA
            PEA   ^L19F8
            PEA   L19F8
            PEA   ^L19FC
            PEA   L19FC
            _UnPackBytes
            PLA
            LDA   L19EA
            CLC
            ADC   L19EE
            STA   L19EA
            LDA   L19EA+2
            ADC   #$0000
            STA   L19EA+2
            LDA   L19F0
            CLC
            ADC   #$00A0
            STA   L19F0
            LDA   L19F0+2
            ADC   #$0000
            STA   L19F0+2
            RTS

L0B0E       TYA
            CLC
            ADC   $00
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            RTS

*--------------------------------------
* Handle PNT 256 colors
*--------------------------------------

doPNT256    LDA   ptrUNPACK
            LDX   ptrUNPACK+2
            LDY   #$8000
            JSR   unpackRLE
            LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JMP   show256

*--------------------------------------
* Binary
*--------------------------------------

doBIN       LDA   proEOF
            CMP   #$9600
            BEQ   doPIC3200
            BCC   L0B4B
            SEC
            RTS

*--------------------------------------
* 3200 Pictures
*--------------------------------------

doPIC3200   JSR   fadeOUT
            LDY   ptrFILE
            LDX   ptrFILE+2
            JSR   show3200
            CLC
            RTS

*--------------------------------------
* Check inside binary file
*--------------------------------------

L0B4B       LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            STZ   L19FE
            LDA   [$00]
            CMP   #$D0C1
            BNE   L0B69
            LDY   #$0002
            LDA   [$00],Y
            CMP   #$00D0
            BEQ   L0B96
L0B69       LDA   [$00]
            CMP   #$D9C4
            BNE   L0B82
            LDY   #$0002
            LDA   [$00],Y
            AND   #$00FF
            CMP   #$00C1
            BEQ   L0B7F
L0B7D       SEC
            RTS
L0B7F       BRL   doDYA

L0B82       LDA   [$00]
            CMP   #$D2CE
            BNE   doHGR
            LDY   #$0002
            LDA   [$00],Y
            CMP   #$00CC
            BNE   doHGR
            INC   L19FE
L0B96       BRL   doAPP

*----------------------------
* Check HGR BIN
*----------------------------

doHGR       LDA   proEOF+2
            BNE   L0B7D
            LDA   proEOF
            CMP   #$3FF8
            BCS   L0BC4
            CMP   #$2000
            BEQ   L0BB0
            CMP   #$1FF8
            BCC   L0B7D
L0BB0       LDY   #$1FFE
L0BB3       TYX
            LDA   [$00],Y
            STAL  $E02000,X
            DEY
            DEY
            BPL   L0BB3
            JSR   L0C03
            JMP   L0C37

L0BC4       CMP   #$4000
            BCC   L0BCB
            BNE   L0B7D
L0BCB       LDY   #$1FFE
L0BCE       TYX
            LDA   [$00],Y
            STAL  $E12000,X
            DEY
            DEY
            BPL   L0BCE
            LDY   #$3FFE
            LDX   #$1FFE
L0BDF       LDA   [$00],Y
            STAL  $E02000,X
            DEY
            DEY
            DEX
            DEX
            BPL   L0BDF
            JSR   L0C27
            JSR   L0C37
            SEP   #$20
            STAL  CLRAN3
            STAL  CLR80VID
            STAL  CLR80COL
            REP   #$20
            CLC
            RTS

L0C03       SEP   #$20
            LDAL  NEWVIDEO
            STA   L19FE
            STAL  TXTCLR
            STAL  MIXCLR
            STAL  TXTPAGE1
            STAL  HIRES
            LDAL  NEWVIDEO
            AND   #$21
            STAL  NEWVIDEO
            RTS

L0C27       JSR   L0C03
            STAL  SET80COL
            STAL  SET80VID
            STAL  SETAN3
            RTS

L0C37       SEP   #$20
L0C39       LDAL  KBD
            BMI   L0C57
            LDAL  $E100E8
            AND   #$C0
            CMP   #$C0
            BEQ   L0C39
            ROL
            BCC   L0C39
L0C4C       LDA   L19FE
            STAL  NEWVIDEO
            REP   #$20
            CLC
            RTS

            MX    %11
L0C57       STAL  KBDSTROBE
            CMP   #$9B
            BEQ   L0C4C
            CMP   #$89
            BNE   L0C39
            LDAL  NEWVIDEO
            AND   #$20
            EOR   #$20
            ORA   #$01
            STAL  NEWVIDEO
            BRA   L0C39

            MX    %00

*--------------------------------------
* Handle APP and NRL
*--------------------------------------

doAPP       LDA   $00
            CLC
            ADC   #$0004
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDA   ptrUNPACK
            CLC
            ADC   #$7D00
            STA   $04
            LDA   ptrUNPACK+2
            ADC   #$0000
            STA   $06
            LDY   #$0000
L0C96       LDA   [$00],Y
            STA   [$04],Y
            INY
            INY
            CPY   #$1900
            BNE   L0C96
            LDA   ptrFILE
            CLC
            ADC   #$1904
            STA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            ADC   #$0000
            STA   ptrFILE+2
            STA   $02
            LDA   theLENGTH
            SEC
            SBC   #$1904
            STA   theLENGTH
            LDA   L19FE
            BNE   L0CD6
            LDA   ptrUNPACK
            LDX   ptrUNPACK+2
            LDY   #$7D00
            JSR   unpackRLE
            BRL   doSHOW3200
L0CD6       LDA   ptrUNPACK
            STA   $04
            LDA   ptrUNPACK+2
            STA   $06
            STZ   L19B4
            STZ   L19B6
            LDA   #$7D00
            STA   $08
            STZ   $0A
            JSR   L0CF7
            CLC
            XCE
            REP   #$30
            BRL   doSHOW3200
L0CF7       TSC
            STA   L19B2
            SEP   #$30
L0CFD       JSR   L0D21
            CMP   #$08
            BCC   L0D15
            TAY
            LDX   L19A2,Y
            JSR   L0D21
L0D0B       PHA
            JSR   L0D43
            PLA
            DEX
            BPL   L0D0B
            BRA   L0CFD
L0D15       TAX
L0D16       JSR   L0D21
            JSR   L0D43
            DEX
            BPL   L0D16
            BRA   L0CFD
L0D21       LDA   L19B6
            EOR   #$01
            STA   L19B6
            BNE   L0D3A
            LDA   [$00]
            AND   #$0F
            REP   #$20
            INC   $00
            BNE   L0D37
            INC   $02
L0D37       SEP   #$20
            RTS

L0D3A       LDA   [$00]
            AND   #$F0
            LSR
            LSR
            LSR
            LSR
            RTS

L0D43       PHA
            LDA   L19B4
            EOR   #$01
            STA   L19B4
            BNE   L0D71
            PLA
            ORA   [$04]
            STA   [$04]
            REP   #$20
            INC   $04
            BNE   L0D5B
            INC   $06
L0D5B       LDA   $08
            BNE   L0D61
            DEC   $0A
L0D61       DEC   $08
            LDA   $08
            ORA   $0A
            BEQ   L0D6C
            SEP   #$20
            RTS

            MX    %00
L0D6C       LDA   L19B2
            TCS
            RTS

L0D71       PLA
            ASL
            ASL
            ASL
            ASL
            STA   [$04]
            RTS

*--------------------------------------
* Handle DYA
*--------------------------------------

doDYA       LDX   ptrFILE+2
            LDA   ptrFILE
            STX   $94
            STA   $92
            STZ   L19C0
            LDA   ptrPICTURE
            CLC
            ADC   #$8000
            STA   $10
            LDA   ptrPICTURE+2
            ADC   #$0000
            STA   $12
            LDA   ptrPICTURE
            CLC
            ADC   #$9000
            STA   fileIN
            LDA   ptrPICTURE+2
            ADC   #$0000
            STA   fileIN+2
            LDA   ptrPICTURE
            CLC
            ADC   #$A000
            STA   fileOUT
            LDA   ptrPICTURE+2
            ADC   #$0000
            STA   fileOUT+2
            LDA   [$92]
            CMP   #$D9C4
            BNE   L0E02
            LDY   #$0002
            LDA   [$92],Y
            TAX
            AND   #$00FF
            CMP   #$00C1
            BNE   L0E02
            TXA
            XBA
            AND   #$00FF
            CMP   #$0002
            BCS   L0E02
            TAX
            LDY   #$0006
            LDA   $92
            ADC   [$92],Y
            STA   $82
            LDA   $94
            ADC   #$0000
            STA   $84
            LDA   $92
            ADC   #$0008
            STA   $92
            LDA   $94
            ADC   #$0000
            STA   $94
            TXA
            ASL
            TAX
            JSR   (L19B8,X)
            BCS   L0E02
            BRL   doSHOW3200
L0E02       SEC
            RTS

L0E04       LDA   $82
            STA   L19BE
            LDY   #$0000
L0E0C       LDA   [$92],Y
            STA   $96
            INY
            INY
            LDA   [$92],Y
            STA   $80
            INY
            INY
            LDA   [$92],Y
            CLC
            ADC   L19BE
            STA   L19BE
            INY
            INY
            LDA   [$92],Y
            CMP   #$FFFF
            BEQ   L0E4A
            STA   $86
            INY
            INY
            LDA   [$92],Y
            STA   $88
            INY
            INY
            STY   L19BC
            JSR   L0E87
            LDA   $90
            CMP   $96
            BNE   L0E4C
            LDA   L19BE
            STA   $82
            LDY   L19BC
            BRA   L0E0C
L0E4A       CLC
            RTS

L0E4C       SEC
            RTS

L0E4E       LDA   [$92]
            STA   $96
            LDA   #$7D00
            STA   $80
            LDA   ptrUNPACK
            STA   $86
            LDA   ptrUNPACK+2
            STA   $88
            JSR   L0E87
            LDA   #$1900
            STA   $80
            LDA   ptrUNPACK
            CLC
            ADC   #$7D00
            STA   $86
            LDA   ptrUNPACK+2
            ADC   #$0000
            STA   $88
            JSR   L0F12
            LDA   $90
            CMP   $96
            BNE   L0E85
            CLC
            RTS

L0E85       SEC
            RTS

L0E87       LDA   L19C0
            BNE   L0E8F
            JSR   L0F5B
L0E8F       STZ   $90
            LDY   #$0FEC
            LDA   #$0000
L0E97       STA   [$10],Y
            DEY
            DEY
            BPL   L0E97
            LDA   #$0FEE
            STA   $8C
            STZ   $8E
            SEC
            LDA   #$0000
            SBC   $80
            STA   $80
L0EAC       LSR   $8E
            LDA   $8E
            BIT   #$0100
            BNE   L0EBD
            JSR   L0F4C
            ORA   #$FF00
            STA   $8E
L0EBD       BIT   #$0001
            BEQ   L0ED9
            JSR   L0F4C
            LDY   $8C
            SEP   #$20
            STA   [$10],Y
            REP   #$20
            JSR   L0F24
            INY
            TYA
            AND   #$0FFF
            STA   $8C
            BRA   L0EAC
L0ED9       JSR   L0F54
            TAX
            AND   #$0FFF
            TAY
            TXA
            ROL
            ROL
            ROL
            ROL
            ROL
            AND   #$000F
            INC
            INC
            STA   $8A
            LDX   $8C
L0EF0       LDA   [$10],Y
            SEP   #$20
            PHY
            TXY
            STA   [$10],Y
            PLY
            REP   #$20
            JSR   L0F24
            INX
            TXA
            AND   #$0FFF
            TAX
            INY
            TYA
            AND   #$0FFF
            TAY
            DEC   $8A
            BPL   L0EF0
            STX   $8C
            BRA   L0EAC
L0F12       SEC
            LDA   #$0000
            SBC   $80
            STA   $80
            PEI   $9E
            LDA   $98
            LDY   $9C
            LDX   $9A
            RTS
            RTS

L0F24       AND   #$00FF
            SEP   #$20
            STA   [$86]
            PHY
            EOR   $91
            TAY
            LDA   $90
            EOR   fileOUT,Y
            STA   $91
            LDA   [fileIN],Y
            STA   $90
            PLY
            REP   #$20
            INC   $86
            INC   $80
            BNE   L0F4B
            STA   $98
            STY   $9C
            STX   $9A
            PLA
            STA   $9E
L0F4B       RTS

L0F4C       LDA   [$82]
            AND   #$00FF
            INC   $82
            RTS

L0F54       LDA   [$82]
            INC   $82
            INC   $82
            RTS

*--------------------------------------
* Init tables
*--------------------------------------

L0F5B       LDY   #$00FE
            LDA   #$0000
L0F61       STA   [fileIN],Y
            STA   fileOUT,Y
            DEY
            DEY
            BPL   L0F61
            SEP   #$30
            LDY   #$00
L0F6D       TYA
            EOR   fileOUT,Y
            STA   fileOUT,Y
            LDX   #$08
L0F74       LDA   [fileIN],Y
            ASL
            STA   [fileIN],Y
            LDA   fileOUT,Y
            ROL
            STA   fileOUT,Y
            BCC   L0F8C
            LDA   fileOUT,Y
            EOR   #$10
            STA   fileOUT,Y
            LDA   [fileIN],Y
            EOR   #$21
            STA   [fileIN],Y
L0F8C       DEX
            BNE   L0F74
            INY
            BNE   L0F6D
            REP   #$30
            INC   L19C0
            RTS

*--------------------------------------
* DreamGrafix format
*--------------------------------------

doDG        JSR   unpackDG
            CMP   #$0001
            BEQ   doSHOW3200
            LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JMP   show256

*--------------------------------------
* Packed 3200 picture
*--------------------------------------

doPNT3200   LDA   ptrUNPACK
            LDX   ptrUNPACK+2
            LDY   #$9600
            JSR   unpackRLE

doSHOW3200  JSR   fadeOUT
            LDY   ptrUNPACK
            LDX   ptrUNPACK+2
            JSR   show3200
            CLC
            RTS

*--------------------------------------
* ICON
*--------------------------------------

doICON      JSR   fadeOUT
            LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDY   #$0004
            LDA   [$00],Y
            CMP   #$0001
            BEQ   L0FDC
            SEC
            RTS

L0FDC       LDY   #$001A
            JSR   L1131
            LDA   ptrUNPACK
            STA   $08
            LDA   ptrUNPACK+2
            STA   $0A
            LDY   #$7CFE
            LDA   #$FFFF
L0FF2       STA   [$08],Y
            DEY
            DEY
            BPL   L0FF2
            LDY   #$7DFE
            LDA   #$8080
L0FFE       STA   [$08],Y
            DEY
            DEY
            CPY   #$7CFE
            BNE   L0FFE
            LDX   #$001E
            LDY   #$7E1E
L100D       LDA   thePALETTE,X
            STA   [$08],Y
            DEY
            DEY
            DEX
            DEX
            BPL   L100D
            STZ   L19E6
            STZ   L19E8
            STZ   L19E4
L1021       LDY   #$0056
            JSR   L1049
            LDY   #$0000
            LDA   [$00],Y
            BEQ   L1039
            TAY
            JSR   L1131
            LDY   #$0000
            LDA   [$00],Y
            BNE   L1021
L1039       LDX   ptrUNPACK+2
            LDY   ptrUNPACK
            JSR   fadeIN
L1042       JSR   getMOUSE
            BCS   L1042
            CLC
            RTS

L1049       JSR   L1123
            LDY   #$0002
            LDA   [$04],Y
            PHA
            LDY   #$0004
            LDA   [$04],Y
            TAX
            LDY   #$0006
            LDA   [$04],Y
            DEC
            LSR
            INC
            STA   L19E2
            LDY   #$0008
            JSR   L1123
            LDA   $04
            CLC
            ADC   $01,S
            STA   $0C
            LDA   $06
            ADC   #$0000
            STA   $0E
            PLA
            JSR   L10B6
            BCC   L107E
            RTS

L107E       SEP   #$20
            LDY   #$0000
L1083       LDA   [$04],Y
            EOR   [$08],Y
            AND   [$0C],Y
            EOR   [$08],Y
            STA   [$08],Y
            INY
            CPY   L19E2
            BNE   L1083
            REP   #$20
            LDY   L19E2
            JSR   L1123
            LDA   $0C
            CLC
            ADC   L19E2
            STA   $0C
            LDA   $0E
            ADC   #$0000
            STA   $0E
            LDA   $08
            CLC
            ADC   #$00A0
            STA   $08
            DEX
            BNE   L107E
            RTS

L10B6       LDA   L19E4
            BEQ   L10E5
            LDA   L19E2
            CLC
            ADC   L19E6
            INC
            INC
            STA   L19E6
            CMP   #$0096
            BCC   L10E5
            STZ   L19E6
            LDA   L19E4
            CLC
            ADC   L19E8
            INC
            INC
            STA   L19E8
            STZ   L19E4
            CMP   #$00B4
            BCC   L10E5
            SEC
            RTS

L10E5       TXA
            CMP   L19E4
            BCC   L10EE
            STA   L19E4
L10EE       CLC
            ADC   L19E8
            CMP   #$00B4
            BCC   L10F9
            SEC
            RTS

L10F9       LDY   L19E8
            LDA   #$0000
L10FF       CPY   #$0000
            BEQ   L110B
            CLC
            ADC   #$00A0
            DEY
            BNE   L10FF
L110B       PHA
            LDA   L19E6
            CLC
            ADC   $01,S
            CLC
            ADC   ptrUNPACK
            STA   $08
            LDA   ptrUNPACK+2
            ADC   #$0000
            STA   $0A
            PLA
            CLC
            RTS

L1123       TYA
            CLC
            ADC   $04
            STA   $04
            LDA   $06
            ADC   #$0000
            STA   $06
            RTS

L1131       TYA
            CLC
            ADC   $00
            STA   $00
            STA   $04
            LDA   $02
            ADC   #$0000
            STA   $02
            STA   $06
            RTS

*--------------------------------------
* Save SHR screen
*--------------------------------------

saveSHR     _HideCursor
            LDA   ptrPICTURE
            STA   $00
            LDA   ptrPICTURE+2
            STA   $02
            LDX   #$7FFE
L1157       TXY
            LDAL  $E12000,X
            STA   [$00],Y
            DEX
            DEX
            BPL   L1157
            LDA   ptrUNPACK
            STA   $00
            LDA   ptrUNPACK+2
            STA   $02
            LDY   #$0000
            TYA
L1170       STA   [$00],Y
            INY
            INY
            BNE   L1170
            RTS

*--------------------------------------
* restore SHR screen
*--------------------------------------

restoreSHR  LDX   #$7FFE
            LDA   #$0000
L117D       STAL  $E12000,X
            DEX
            DEX
            BPL   L117D
            LDX   ptrPICTURE+2
            LDY   ptrPICTURE
            JSR   fadeIN
            LDX   #$7FFE
L1191       LDAL  $E12000,X
            STAL  $012000,X
            DEX
            DEX
            BPL   L1191
            PEA   $00E1
            PEA   $9E00
            _InitColorTable
            _ShowCursor
            RTS

*--------------------------------------
* Reserve memory
*--------------------------------------

initMEMORY  LDX   #$0001
            LDA   #$0000
            LDY   #$C01C
            JSR   getMEMORY
            STX   ptrUNPACK
            STY   ptrUNPACK+2
            LDA   theHANDLE
            STA   haUNPACK
            LDA   theHANDLE+2
            STA   haUNPACK+2
            LDX   #$0001
            LDA   #$0000
            LDY   #$C01C
            JSR   getMEMORY
            STX   ptrPICTURE
            STY   ptrPICTURE+2
            LDA   theHANDLE
            STA   haPICTURE
            LDA   theHANDLE+2
            STA   haPICTURE+2
            LDX   #$0000
            LDA   #$0100
            LDY   #$C005
            JSR   getMEMORY
            STX   myDP
            LDA   theHANDLE
            STA   haDP
            LDA   theHANDLE+2
            STA   haDP+2
            RTS

*--------------------------------------
* Free memory
*--------------------------------------

freeMEMORY  LDA   haDP+2
            PHA
            LDA   haDP
            PHA
            _DisposeHandle
            LDA   haPICTURE+2
            PHA
            LDA   haPICTURE
            PHA
            _DisposeHandle
            LDA   haUNPACK+2
            PHA
            LDA   haUNPACK
            PHA
            _DisposeHandle
            LDA   haFILE+2
            PHA
            LDA   haFILE
            PHA
            _DisposeHandle
            RTS

*--------------------------------------
* Get memory
*--------------------------------------

getMEMORY   PEA   $0000
            PEA   $0000
            PHX
            PHA
            LDA   myID
            PHA
            PHY
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCS   L1278
            PHD
            TSC
            TCD
            LDA   [$03]
            TAX
            STAL  thePOINTER
            LDY   #$0002
            LDA   [$03],Y
            TAY
            STAL  thePOINTER+2
            PLD
L1278       PLA
            STAL  theHANDLE
            PLA
            STAL  theHANDLE+2
            RTS

*--------------------------------------
* Read mouse
*--------------------------------------

getMOUSE    LDAL  KMSTATUS-1
            BPL   L129D
            AND   #$0200
            BNE   L129D
            LDAL  MOUSEDATA-1
            LDAL  MOUSEDATA-1
            AND   #$8000
            BEQ   L12A3
            SEC
            RTS

L129D       LDAL  KMSTATUS-1
            SEC
            RTS

L12A3       CLC
            RTS

*--------------------------------------
* Show a 256-col picture
*--------------------------------------

show256     PHX
            PHY
            JSR   fadeOUT
            PLY
            PLX
            JSR   fadeIN
            STZ   L19FE
L12B2       LDAL  KBD-1
            BMI   L12C2
            JSR   getMOUSE
            BCS   L12B2
L12BD       JSR   fadeOUT
            CLC
            RTS

L12C2       XBA
            AND   #$00FF
            SEP   #$20
            STAL  $E0C010
            REP   #$20
            CMP   #$009B
            BEQ   L12BD
            CMP   #$0089
            BNE   L12B2
            LDA   L19FE
            EOR   #$0001
            STA   L19FE
            BEQ   L1301
            LDX   #$00C6
            LDA   #$8080
L12E9       STAL  $019D00,X
            DEX
            DEX
            BPL   L12E9
            LDX   #$001E
L12F4       LDA   thePALETTE,X
            STAL  $019E00,X
            DEX
            DEX
            BPL   L12F4
            BRA   L12B2
L1301       LDA   theFORMAT
            CMP   #$0002
            BNE   L1311
            LDA   ptrFILE
            LDX   ptrFILE+2
            BRA   L1317
L1311       LDA   ptrUNPACK
            LDX   ptrUNPACK+2
L1317       CLC
            ADC   #$7D00
            STA   $00
            TXA
            ADC   #$0000
            STA   $02
            LDY   #$0000
L1326       LDA   [$00],Y
            TYX
            STAL  $019D00,X
            DEY
            DEY
            BPL   L1326
            BRL   L12B2

*----------------------------
* Show 3200 colors
*----------------------------

show3200    STY   $00
            STX   $02
            PHP
            SEI
            LDAL  $E0C035
            STA   mySHADOW
            AND   #$FFF7
            ORA   #$0008
            STAL  $E0C035
            LDY   #$7D00
            LDX   #$0000
L1351       LDA   [$00],Y
            STAL  $012000,X
            INY
            INY
            INX
            INX
            CPX   #$1900
            BNE   L1351
            SEP   #$20
            LDX   #$0000
L1365       LDA   #$0F
L1367       STAL  $019D00,X
            STAL  $E19D00,X
            INX
            CPX   #$00C8
            BEQ   L137A
            DEC
            BPL   L1367
            BRA   L1365
L137A       REP   #$20
            LDAL  $E0C035
            AND   #$FFF7
            STAL  $E0C035
            LDY   #$7CFE
L138A       TYX
            LDA   [$00],Y
            STAL  $E12000,X
            DEY
            DEY
            BPL   L138A
            PHD
            TSC
            STA   mySTACK
            LDAL  $E0C068
            STA   mySTATEREG
            ORA   #$0030
            STAL  $E0C068
L13A8       LDY   #$0000
            LDA   #$1F00
            TCD
L13AF       LDAL  $E0C02E
            AND   #$00FF
            CMP   L1A72,Y
            BNE   L13AF
            INY
            INY
            LDA   #$9FFF
            TCS
            TDC
            CLC
            ADC   #$0100
            TCD
            PEI   $00
            PEI   $02
            PEI   $04
            PEI   $06
            PEI   $08
            PEI   $0A
            PEI   $0C
            PEI   $0E
            PEI   $10
            PEI   $12
            PEI   fileIN
            PEI   fileIN+2
            PEI   fileOUT
            PEI   fileOUT+2
            PEI   theTICK
            PEI   $1E
            PEI   $20
            PEI   $22
            PEI   $24
            PEI   $26
            PEI   $28
            PEI   $2A
            PEI   $2C
            PEI   $2E
            PEI   $30
            PEI   $32
            PEI   $34
            PEI   $36
            PEI   $38
            PEI   $3A
            PEI   $3C
            PEI   $3E
            PEI   $40
            PEI   $42
            PEI   $44
            PEI   $46
            PEI   $48
            PEI   $4A
            PEI   $4C
            PEI   $4E
            PEI   $50
            PEI   $52
            PEI   $54
            PEI   $56
            PEI   $58
            PEI   $5A
            PEI   $5C
            PEI   $5E
            PEI   $60
            PEI   $62
            PEI   $64
            PEI   $66
            PEI   $68
            PEI   $6A
            PEI   $6C
            PEI   $6E
            PEI   $70
            PEI   $72
            PEI   $74
            PEI   $76
            PEI   $78
            PEI   $7A
            PEI   $7C
            PEI   $7E
            PEI   $80
            PEI   $82
            PEI   $84
            PEI   $86
            PEI   $88
            PEI   $8A
            PEI   $8C
            PEI   $8E
            PEI   $90
            PEI   $92
            PEI   $94
            PEI   $96
            PEI   $98
            PEI   $9A
            PEI   $9C
            PEI   $9E
            PEI   $A0
            PEI   $A2
            PEI   $A4
            PEI   $A6
            PEI   $A8
            PEI   $AA
            PEI   $AC
            PEI   $AE
            PEI   $B0
            PEI   $B2
            PEI   $B4
            PEI   $B6
            PEI   $B8
            PEI   $BA
            PEI   $BC
            PEI   $BE
            PEI   $C0
            PEI   $C2
            PEI   $C4
            PEI   $C6
            PEI   $C8
            PEI   $CA
            PEI   $CC
            PEI   $CE
            PEI   $D0
            PEI   $D2
            PEI   $D4
            PEI   $D6
            PEI   $D8
            PEI   $DA
            PEI   $DC
            PEI   $DE
            PEI   $E0
            PEI   $E2
            PEI   $E4
            PEI   $E6
            PEI   $E8
            PEI   $EA
            PEI   $EC
            PEI   $EE
            PEI   $F0
            PEI   $F2
            PEI   $F4
            PEI   $F6
            PEI   $F8
            PEI   $FA
            PEI   $FC
            PEI   $FE
            TDC
            CLC
            ADC   #$0100
            TCD
            PEI   $00
            PEI   $02
            PEI   $04
            PEI   $06
            PEI   $08
            PEI   $0A
            PEI   $0C
            PEI   $0E
            PEI   $10
            PEI   $12
            PEI   fileIN
            PEI   fileIN+2
            PEI   fileOUT
            PEI   fileOUT+2
            PEI   theTICK
            PEI   $1E
            PEI   $20
            PEI   $22
            PEI   $24
            PEI   $26
            PEI   $28
            PEI   $2A
            PEI   $2C
            PEI   $2E
            PEI   $30
            PEI   $32
            PEI   $34
            PEI   $36
            PEI   $38
            PEI   $3A
            PEI   $3C
            PEI   $3E
            PEI   $40
            PEI   $42
            PEI   $44
            PEI   $46
            PEI   $48
            PEI   $4A
            PEI   $4C
            PEI   $4E
            PEI   $50
            PEI   $52
            PEI   $54
            PEI   $56
            PEI   $58
            PEI   $5A
            PEI   $5C
            PEI   $5E
            PEI   $60
            PEI   $62
            PEI   $64
            PEI   $66
            PEI   $68
            PEI   $6A
            PEI   $6C
            PEI   $6E
            PEI   $70
            PEI   $72
            PEI   $74
            PEI   $76
            PEI   $78
            PEI   $7A
            PEI   $7C
            PEI   $7E
            PEI   $80
            PEI   $82
            PEI   $84
            PEI   $86
            PEI   $88
            PEI   $8A
            PEI   $8C
            PEI   $8E
            PEI   $90
            PEI   $92
            PEI   $94
            PEI   $96
            PEI   $98
            PEI   $9A
            PEI   $9C
            PEI   $9E
            PEI   $A0
            PEI   $A2
            PEI   $A4
            PEI   $A6
            PEI   $A8
            PEI   $AA
            PEI   $AC
            PEI   $AE
            PEI   $B0
            PEI   $B2
            PEI   $B4
            PEI   $B6
            PEI   $B8
            PEI   $BA
            PEI   $BC
            PEI   $BE
            PEI   $C0
            PEI   $C2
            PEI   $C4
            PEI   $C6
            PEI   $C8
            PEI   $CA
            PEI   $CC
            PEI   $CE
            PEI   $D0
            PEI   $D2
            PEI   $D4
            PEI   $D6
            PEI   $D8
            PEI   $DA
            PEI   $DC
            PEI   $DE
            PEI   $E0
            PEI   $E2
            PEI   $E4
            PEI   $E6
            PEI   $E8
            PEI   $EA
            PEI   $EC
            PEI   $EE
            PEI   $F0
            PEI   $F2
            PEI   $F4
            PEI   $F6
            PEI   $F8
            PEI   $FA
            PEI   $FC
            PEI   $FE
            CPY   #$001A
            BEQ   L15D5
            BRL   L13AF
L15D5       LDAL  $E0C026
            BPL   L15F0
            AND   #$0200
            BNE   L15F0
            LDAL  $E0C023
            LDAL  $E0C023
            AND   #$8000
            BEQ   L15F7
            BRL   L13A8
L15F0       LDAL  $E0C026
            BRL   L13A8
L15F7       LDA   mySTATEREG
            STAL  $E0C068
            LDA   mySTACK
            TCS
            PLD
            LDA   mySHADOW
            STAL  $E0C035
            PLP
            RTS

*----------------------------
* Unpack RLE
*----------------------------

unpackRLE   STA   L19F8
            STX   L19F8+2
            STY   L19FC
            LDA   ptrFILE
            STA   L19F4
            LDA   ptrFILE+2
            STA   L19F4+2
            PEA   $0000
            LDA   L19F4+2
            PHA
            LDA   L19F4
            PHA
            LDA   theLENGTH
            PHA
            PEA   ^L19F8
            PEA   L19F8
            PEA   L19FC
            _UnPackBytes
            PLA
            RTS

*----------------------------
* Unpack DreamGrafix
*----------------------------

unpackDG    LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDA   ptrUNPACK
            STA   $04
            LDA   ptrUNPACK+2
            STA   $06
            LDA   ptrPICTURE
            CLC
            ADC   #$8000
            LDX   ptrPICTURE+2
            STA   $1E
            STX   $20
            ADC   #$2000
            STA   $22
            STX   $24
            LDY   #$0000
            TYA
L166F       STA   [$1E],Y
            INY
            INY
            CPY   #$4000
            BNE   L166F
            STZ   L19FE
            LDA   #$0009
            STA   L179B+1
            LDA   #$01FF
            STA   L17A2+1
            STZ   theTICK
            PEA   $FFFF
L168C       JSR   L1765
            CMP   #$0101
            BNE   L1697
            BRL   L1726
L1697       CMP   #$0100
            BEQ   L1706
            STA   $12
            CMP   fileIN
            BCC   L16A6
            LDA   $10
            PEI   $0E
L16A6       CMP   #$0100
            BCC   L16B8
            ASL
L16AC       TAY
            LDA   [$22],Y
            PHA
            LDA   [$1E],Y
            CMP   #$0200
            BCS   L16AC
            LSR
L16B8       AND   #$00FF
            STA   $0E
            STA   fileOUT+2
            LDY   #$0000
L16C2       STA   [$04],Y
            INC   L19FE
            INY
            PLA
            BPL   L16C2
            PHA
            TYA
            CLC
            ADC   $04
            STA   $04
            LDA   $06
            ADC   #$0000
            STA   $06
            LDA   L19FE
            CMP   #$9600
            BCS   L1726
            JSR   L1755
            LDA   $12
            STA   $10
            LDA   fileIN
            CMP   fileOUT
            BCC   L1704
            LDA   L179B+1
            CMP   #$000C
            BEQ   L1704
            INC
            STA   L179B+1
            ASL
            TAX
            LDA   L19F4,X
            STA   L17A2+1
            ASL   fileOUT
L1704       BRA   L168C
L1706       JSR   L173E
            JSR   L1765
            STA   $10
            STA   fileOUT+2
            STA   $0E
            STA   [$04]
            LDA   $04
            CLC
            ADC   #$0001
            STA   $04
            LDA   $06
            ADC   #$0000
            STA   $06
            JMP   L168C

L1726       PLA
            PHK
            PLB
            LDA   ptrFILE
            STA   $00
            LDA   ptrFILE+2
            STA   $02
            LDA   theLENGTH
            SEC
            SBC   #$0011
            TAY
            LDA   [$00],Y
            RTS

L173E       LDA   #$0009
            STA   L179B+1
            LDA   #$01FF
            STA   L17A2+1
            LDA   #$0200
            STA   fileOUT
            LDA   #$0102
            STA   fileIN
            RTS

L1755       LDA   fileIN
            ASL
            TAY
            LDA   fileOUT+2
            STA   [$22],Y
            LDA   $10
            ASL
            STA   [$1E],Y
            INC   fileIN
            RTS

L1765       LDA   theTICK
            AND   #$0007
            TAX
            LDA   theTICK
            LSR
            LSR
            LSR
            CMP   #$03FD
            BCC   L1786
            CLC
            ADC   $00
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            STX   theTICK
            LDA   #$0000
L1786       TAY
            LDA   [$00],Y
            STA   $08
            INY
            INY
            LDA   [$00],Y
            TXY
            BEQ   L1798
L1792       LSR
            ROR   $08
            DEX
            BNE   L1792
L1798       LDA   theTICK
            CLC
L179B       ADC   #$FFFF
            STA   theTICK
            LDA   $08
L17A2       AND   #$FFFF
            RTS

*--------------------------------------
* Fade in (to palette)
*--------------------------------------

fadeIN      STY   $00
            STX   $02
            LDA   #$2000
            STA   $04
            LDA   #$00E1
            STA   $06
            LDY   #$7DFE
L17B7       LDA   [$00],Y
            STA   [$04],Y
            DEY
            DEY
            BPL   L17B7
            LDA   $00
            CLC
            ADC   #$7E00
            STA   $00
            LDA   $02
            ADC   #$0000
            STA   $02
            LDA   $04
            CLC
            ADC   #$7E00
            STA   $04
            LDA   $06
            ADC   #$0000
            STA   $06
            LDX   #$000F
L17E0       LDY   #$01FE
L17E3       LDA   [$04],Y
            AND   #$000F
            STA   L19FE
            LDA   [$00],Y
            AND   #$000F
            CMP   L19FE
            BEQ   L17FD
            LDA   [$04],Y
            CLC
            ADC   #$0001
            STA   [$04],Y
L17FD       LDA   [$04],Y
            AND   #$00F0
            STA   L19FE
            LDA   [$00],Y
            AND   #$00F0
            CMP   L19FE
            BEQ   L1817
            LDA   [$04],Y
            CLC
            ADC   #$0010
            STA   [$04],Y
L1817       LDA   [$04],Y
            AND   #$0F00
            STA   L19FE
            LDA   [$00],Y
            AND   #$0F00
            CMP   L19FE
            BEQ   L1831
            LDA   [$04],Y
            CLC
            ADC   #$0100
            STA   [$04],Y
L1831       DEY
            DEY
            BPL   L17E3
            JSR   L1892
            DEX
            BPL   L17E0
            RTS

*----------------------------
* Fade out (to black)
*----------------------------

fadeOUT     LDA   #$9E00
            STA   $00
            LDA   #$00E1
            STA   $02
            LDX   #$000F
L1849       LDY   #$01FE
L184C       LDA   [$00],Y
            AND   #$000F
            BEQ   L185B
            LDA   [$00],Y
            SEC
            SBC   #$0001
            STA   [$00],Y
L185B       LDA   [$00],Y
            AND   #$00F0
            BEQ   L186A
            LDA   [$00],Y
            SEC
            SBC   #$0010
            STA   [$00],Y
L186A       LDA   [$00],Y
            AND   #$0F00
            BEQ   L1879
            LDA   [$00],Y
            SEC
            SBC   #$0100
            STA   [$00],Y
L1879       DEY
            DEY
            BPL   L184C
            JSR   L1892
            DEX
            BPL   L1849
            LDX   #$7FFE
            LDA   #$0000
L1889       STAL  $E12000,X
            DEX
            DEX
            BPL   L1889
            RTS

*----------------------------
* Wait for VBL
*----------------------------

L1892       SEP   #$20
            LDA   #$4B
            PHA
L1897       LDAL  $E0C02F
            AND   #$7F
            CMP   $01,S
            BCC   L1897
            CMP   #$64
            BCS   L1897
            PLA
L18A6       LDAL  $E0C019
            BMI   L18A6
            REP   #$20
            RTS

*----------------------------
* Load a file (max mem)
*----------------------------

loadFILE    STZ   L19A0
            STZ   haFILE
            STZ   haFILE+2
            JSL   GSOS
            DW    $2010            ; Open
            ADRL  proOPEN
            BCS   closeFILE
            LDA   proOPEN+2
            STA   proREAD+2
            STA   proCLOSE+2
            STA   proSETMARK+2
            STA   proGETEOF+2
            JSL   GSOS
            DW    $2019            ; GetEOF
            ADRL  proGETEOF
L18DD       LDA   proGETEOF+4
            STA   theLENGTH
            STA   proREAD+8
            LDX   proGETEOF+4+2
            STX   theLENGTH+2
            STX   proREAD+8+2
            LDY   #$C00C
            JSR   getMEMORY
            BCS   L192C
            STX   ptrFILE
            STX   proREAD+4
            STY   ptrFILE+2
            STY   proREAD+4+2
            LDA   theHANDLE
            STA   haFILE
            LDA   theHANDLE+2
            STA   haFILE+2
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  proREAD
            BCS   L1927

closeFILE   JSL   GSOS
            DW    $2014            ; Close
            ADRL  proCLOSE
L1925       CLC
            RTS

L1927       JSR   closeFILE
            SEC
            RTS

*----------------------------
* Get max memory block
*----------------------------

L192C       LDA   L19A0
            BNE   L1927
            LDA   theFORMAT
            CMP   #$0006
            BEQ   L1925
            CMP   #$000A
            BEQ   L1925
            PEA   $0000
            PEA   $0000
            _MaxBlock
            PLA
            STA   proGETEOF+4
            PLA
            STA   proGETEOF+4+2
            INC   L19A0
            BRA   L18DD

*--------------------------------------

tblFORMAT   DA    doPNT256
            DA    doPNT3200
            DA    doPIC
            DA    doBIN
            DA    doDG
            DA    doGSPAINT
            DA    doANIMATION
            DA    doAPF
            DA    doPIC3200
            DA    doICON
            DA    doGSLA
            DA    doLZ4

*--------------------------------------

theFORMAT	DW    $0000
myID	DW    $0000
mySTACK	DW    $0000
myDP	DW    $0000
mySHADOW	DW    $0000
mySTATEREG	DW    $0000
ptrPICTURE	ADRL  $00000000
ptrFILE	ADRL  $00000000
ptrUNPACK	ADRL  $00000000
haDP	ADRL  $00000000
haPICTURE	ADRL  $00000000
haFILE	ADRL  $00000000
haUNPACK	ADRL  $00000000
thePOINTER	ADRL  $00000000
theHANDLE	ADRL  $00000000
L19A0       DW    $0000
L19A2       HEX   0000000000000000
            HEX   0807060504030201
L19B2       DW    $0000
L19B4       DW    $0000
L19B6       DW    $0000
L19B8       DA    L0E04
            DA    L0E4E
L19BC       DW    $0000
L19BE       DW    $0000
L19C0       DW    $0000
thePALETTE	HEX   0000000FF000FF0F00000F00F00FFF0F
	HEX   0000000FF000FF0F00000F00F00FFF0F
L19E2       DW    $0000
L19E4       DW    $0000
L19E6       DW    $0000
L19E8       DW    $0000
L19EA       ADRL  $00000000
L19EE       DW    $0000
L19F0       ADRL  $00000000
L19F4       ADRL  $00000000
L19F8       ADRL  $00000000
L19FC       DW    $0000
L19FE       DW    $0000
L1A00       DW    $0000
L1A02       DW    $0000
            DW    $0000
            DW    $01FF
            DW    $03FF
            DW    $07FF
            DW    $0FFF
            DW    $0000

*--------------------------------------

proGETINFO	DW    $0009            ; Parms for GetFileInfo
	ADRL  $00000000        ;  file name
	DW    $0000            ;  access
	DW    $0000            ;  file type
	ADRL  $00000000        ;  aux type
	DW    $0000            ;  storage
	DS    8                ;  creation date
	DS    8                ;  modification date
	ADRL  $00000000        ;  option list
proEOF	ADRL  $00000000        ;  end of file

proOPEN	DW    $0006            ; Parms for Open
	DW    $0000            ;  ref num
	ADRL  $00000000        ;  path name
	DW    $0000            ;  req access
	DW    $0000            ;  res num
	DW    $0000            ;  access
	DW    $0000            ;  file type

proREAD	DW    $0004            ; Parms for Read
	DW    $0000            ;  ref num
	ADRL  $00000000        ;  buffer ptr
	ADRL  $00000000        ;  request count
	ADRL  $00000000        ;  transfer count

proCLOSE	DW    $0001            ; Parms for Close
	DW    $0000            ;  ref num
proSETMARK	DW    $0003            ; Parms for SetMark
	DW    $0000            ;  ref num
	DW    $0000            ;  base
	ADRL  $0000800C        ;  displacement

proGETEOF	DW    $0002            ; Parms for GetEOF
	DW    $0000            ;  ref num
	ADRL  $00000000        ;  end of file

theLENGTH       ADRL  $00000000

*--------------------------------------

L1A72       DW    $00E4
            DW    $0084
            DW    $008C
            DW    $0094
            DW    $009C
            DW    $00A4
            DW    $00AC
            DW    $00B4
            DW    $00BC
            DW    $00C4
            DW    $00CC
            DW    $00D4
            DW    $00DC

*--------------------------------------

myBRUTAL    STR   'BrutalDeluxe~PicViewer~'

bootINFO    ASC   'PicViewer             v01.07  by Brutal Deluxe'00

bootICON    DW    $0080            ; Icon type
            DW    $00C8            ; Icon size
            DW    $0014            ; Icon height
            DW    $0014            ; Icon width
            HEX   33333333333333333333  ; Icon image
            HEX   3AAAAAAAAAAAAAAAAA83
            HEX   3A88888888888888A883
            HEX   3A8888888888888AA883
            HEX   3A8811111111111AA883
            HEX   3A88111111111FFAA883
            HEX   3A8811FFFF11111AA883
            HEX   3A88111111111FFAA883
            HEX   3A881FFFF111FFFAA883
            HEX   3A8811111111111AA883
            HEX   3A88EE1111EE111AA883
            HEX   3A886EEEEE6EEEEAA883
            HEX   3A8864EE666666EAA883
            HEX   3A88644EEEEE644AA883
            HEX   3A886646EE64466AA883
            HEX   3A88AAAAAAAAAAAAA883
            HEX   3A8AAAAAAAAAAAAAA883
            HEX   3AA88888888888888883
            HEX   3A888888888888888883
            HEX   33333333333333333333
            HEX   FFFFFFFFFFFFFFFFFFFF  ; Icon mask
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF


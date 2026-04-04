*
* SerialIntrMgr
* by ?
* published by ?
* date ?
* purpose ?
*

	mx	%00
	rel
	lst	off
	typ	PIF
	dsk	sim

*-------------------------------
* EQUATES
*-------------------------------

INTMGRV	=	$E10010
IRQ_APTALK	=	$E10020
GSOS	=	$E100A8

*-------------------------------
* CODE
*-------------------------------

            PHB
            PHK
            PLB
            LDA   #$0000
            STA   L0409
            STA   L040B
            STA   L040D
            STA   L040F
            STA   L0405
            PHP
            SEI
            JSR   L033A	; get ROM version
            CMP   #$0000
            BEQ   L0034
            CMP   #$0001
            BEQ   L0034
            LDA   L006D	; patch for ROM 3
            STAL  INTMGRV
            LDA   L006D+2
            STAL  INTMGRV+2
            BRA   L0042
L0034       LDA   L0069	; patch for ROM 00/01
            STAL  INTMGRV
            LDA   L0069+2
            STAL  INTMGRV+2
L0042       PLP
            PEA   ^L03EE
            PEA   L03EE
            PHA
            _MMStartUp
            PLA
            STA   L0407
            PHA
            PEA   ^L01F8
            PEA   L01F8
            _AcceptRequests
            JSL   L0354	; get AppleTalk port
            PLB
            RTL

L0069       JMPL  L0140
L006D       JMPL  L0071

*-------------------------------
* INT MGR ROM 3
*-------------------------------

L0071       CLC
            XCE
            REP   #$30
            PHP
            PHB
            PEA   $E1E1
            PLB
            STA   $0108
            LDA   $C035
            STA   $0119
            ORA   #$8000
            AND   #$9F3E
            STA   $C035
            STX   $010A
            STY   $010C
            TDC
            STA   $0110
            LDA   #$0000
            TCD
            SEP   #$30
            BCC   L00A5
            LDA   $04,S
            AND   #$10
            ADC   #$70
L00A5       BVC   L00AB
            JMPL  $FFBD16

L00AB       LDA   #$03
            STA   $C039
            LDA   $C039
            BIT   $0103
            BEQ   L00EF
            PHA
            AND   #$07
            BNE   L00CF
            LDA   $C03B
            STA   $0105
            LDA   $C03B
            STA   $0106
            JSL   IRQ_APTALK
            BRA   L00DF
L00CF       LDA   $C03A
            STA   $0105
            LDA   $C03A
            STA   $0106
            JSL   IRQ_APTALK
L00DF       LDAL  $010101
            STA   $011C
            LDA   #$00
            ROR
            STA   $0101
            PLA
            BRA   L0102
L00EF       PHA
            LDAL  $010101
            STA   $011C
            STZ   $0101
            JSL   $E1021C
            PLA
            BCC   L0139
            CLC
L0102       PHA
            ANDL  L0405
            BEQ   L0133
            LDA   $01,S
            BIT   #$07
            BEQ   L0116
            JSL   L040D
            ROL   $0101
L0116       LDA   $01,S
            ANDL  L0405
            BEQ   L0129
            BIT   #$38
            BEQ   L0129
            JSL   L0409
            ROL   $0101
L0129       PLA
            LDA   $0101
            BEQ   L0139
            JMPL  $FFBD15

L0133       LDA   $01,S
            JMPL  $FFBCFA

L0139       REP   #$30
            PLB
            JMPL  $FFBF58

*-------------------------------
* INT MGR ROM 00 / 01
*-------------------------------

L0140       CLC
            XCE
            REP   #$30
            PHP
            PHB
            PEA   $E1E1
            PLB
            STA   $0108
            LDA   $C035
            STA   $0119
            ORA   #$8000
            AND   #$9F1E
            STA   $C035
            STX   $010A
            STY   $010C
            TDC
            STA   $0110
            LDA   #$0000
            TCD
            SEP   #$30
            BCC   L0174
            LDA   $04,S
            AND   #$10
            ADC   #$70
L0174       BVC   L017A
            JMPL  $FFB85F

L017A       LDA   #$03
            STA   $C039
            LDA   $C039
            BIT   $0103
            BEQ   L01B7
            PHA
            AND   #$07
            BNE   L019E
            LDA   $C03B
            STA   $0105
            LDA   $C03B
            STA   $0106
            JSL   IRQ_APTALK
            BRA   L01AE
L019E       LDA   $C03A
            STA   $0105
            LDA   $C03A
            STA   $0106
            JSL   IRQ_APTALK
L01AE       LDA   #$00
            ROR
            STA   $0101
            PLA
            BRA   L01BA
L01B7       STZ   $0101
L01BA       PHA
            ANDL  L0405
            BEQ   L01F2
            LDA   $01,S
            BIT   #$07
            BEQ   L01CE
            JSL   L040D
            ROL   $0101
L01CE       LDA   $01,S
            ANDL  L0405
            BEQ   L01E1
            BIT   #$38
            BEQ   L01E1
            JSL   L0409
            ROL   $0101
L01E1       PLA
            LDA   $0101
            BEQ   L01EB
            JMPL  $FFB85E

L01EB       REP   #$30
            PLB
            JMPL  $FFBA86

L01F2       LDA   $01,S
            JMPL  $FFB843

*-------------------------------
* ACCEPT REQUESTS
*-------------------------------
*
* $8000: 
* $8001: 
* $8002: 

L01F8       PHB
            PHK
            PLB
            PHD
            TSC
            TCD
            LDA   $0F
            CMP   #$8003
            BCC   L0208
            JMP   L0310

L0208       CMP   #$8000
            BCS   L0210
            JMP   L0310

L0210       AND   #$00FF
            ASL
            TAX
            JMP   (L0218,X)

L0218       DA    L021E	; $8000
            DA    L029C	; $8001
            DA    L02FE	; $8002

*-----------------
* $8000
*-----------------

L021E       LDY   #$0000
            LDA   [$0B],Y
            JSR   L032C	; check port 1 or 2
            BCS   L028C
            CMP   thePORT
            BEQ   L0287
            DEC
            ASL
            ASL
            TAX
            LDA   L0409,X
            ORA   L040B,X
            BNE   L0291
            PHP
            SEI
            LDA   #$005C
            STA   L0409,X
            LDY   #$0002
            LDA   [$0B],Y
            STA   L0409+1,X
            LDY   #$0003
            LDA   [$0B],Y
            STA   L040B,X
            LDX   #$0007
            LDY   #$0000
            LDA   [$0B],Y
            CMP   #$0002
            BEQ   L0261
            LDX   #$0038
L0261       TXA
            ORA   L0405
            STA   L0405
            LDX   #$00F8
            LDY   #$0000
            LDA   [$0B],Y
            CMP   #$0002
            BEQ   L0278
            LDX   #$00C7
L0278       TXA
            ANDL  $E10104	; SERFLAG - Ser int msk-$07=chanB-$38=chanA-$3F=both
            STAL  $E10104	; SERFLAG - Ser int msk-$07=chanB-$38=chanA-$3F=both
            PLP
            LDA   #$0000
            BRA   L0294
L0287       LDA   #$0003
            BRA   L0294
L028C       LDA   #$0005
            BRA   L0294
L0291       LDA   #$0001
L0294       LDY   #$0002
            STA   [$07],Y
            JMP   L0317

*-----------------
* $8001
*-----------------

L029C       LDY   #$0000
            LDA   [$0B],Y
            JSR   L032C	; check port 1 or 2
            BCS   L028C
            DEC
            ASL
            ASL
            TAX
            LDA   L0409,X
            ORA   L040B,X
            BEQ   L02F3
            LDA   L0409+1,X
            LDY   #$0002
            CMP   [$0B],Y
            BNE   L02EE
            LDA   L040B,X
            LDY   #$0003
            CMP   [$0B],Y
            BNE   L02EE
            PHP
            SEI
            LDA   #$0000
            STA   L0409,X
            STA   L040B,X
            LDX   #$00F8
            LDY   #$0000
            LDA   [$0B],Y
            CMP   #$0002
            BEQ   L02E1
            LDX   #$00C7
L02E1       TXA
            AND   L0405
            STA   L0405
            PLP
            LDA   #$0000
            BRA   L02F6
L02EE       LDA   #$0002
            BRA   L0294
L02F3       LDA   #$0004
L02F6       LDY   #$0002
            STA   [$07],Y
            JMP   L0317

*-----------------
* $8002
*-----------------

L02FE       LDA   #$0100
            LDY   #$0004
            STA   [$07],Y
            LDA   #$0000
            LDY   #$0002
            STA   [$07],Y
            BRA   L0317

*-----------------
* EXIT
*-----------------

L0310       LDA   #$0000	; request was not handled
            STA   $11
            BRA   L031C

L0317       LDA   #$8000	; request was handled
            STA   $11

L031C       PLD
            PLB
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

*-------------------------------
* CHECK VALID PORT (1 OR 2)
*-------------------------------

L032C       CMP   #$0001
            BEQ   L0338
            CMP   #$0002
            BEQ   L0338
            SEC
            RTS
L0338       CLC
            RTS

*-------------------------------
* GET ROM VERSION
*-------------------------------

L033A       PHA
            PHA
            PHA
            PHA
            LDA   #$0000
            PHA
            PHA
            PHA
            PEA   $FE1F
            _FWEntry
            PLY
            PLA
            PLA
            PLA
            TYA
            RTS

*-------------------------------
* GET APPLETALK PORT
*-------------------------------

L0354       PHB
            PHK
            PLB
            LDA   #$0001	; device 1
            STA   L03A1
L035D       JSL   GSOS
            DW    $202C       ; DInfo
            ADRL  L039F
            BCS   L038E
            LDA   L03B3
            CMP   #$001D	; AppleTalk main driver?
            BEQ   L0376
            INC   L03A1	; no, next device, pleae
            BRA   L035D
L0376       LDA   L03A1	; yes, get the AppleTalk port
            STA   L03DA
            JSL   GSOS
            DW    $202D       ; DStatus
            ADRL  L03D8
            LDA   L03EA	; get the port
            STA   thePORT	; save it
            BRA   L0398
L038E       CMP   #$0011	; no more device?
            BEQ   L0393	; yup, exit
L0393       STZ   thePORT	; tell not found
            BRA   L0398
L0398       LDA   thePORT	; return the port
            PLB
            RTL

thePORT     DW    $0000	; AppleTalk port: 0: none, 1: port 1, 2: port 2

L039F       DW    $0008       ; Parms for DInfo
L03A1       DW    $0001       ;  device num
            ADRL  L03B5       ;  device name
            DW    $0000       ;  characteristics
            ADRL  $00000000   ;  total blocks
            DW    $0000       ;  slot
            DW    $0000       ;  unit
            DW    $0000       ;  version number
L03B3       DW    $0000       ;  device id
L03B5       DW    $001F
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

L03D8       DW    $0005       ; Parms for DStatus
L03DA       DW    $0000       ;  device num
            DW    $8001       ;  status code = Get Port
            ADRL  L03EA       ;  status list
            ADRL  $00000002   ;  request count
            ADRL  $00000000   ;  transfer count
L03EA       DW    $0000
            DW    $0000

L03EE       STR   'SerialIntrMgr~Entry~'
            DB    $00
            DB    $00
L0405       DW    $0000
L0407       DW    $0000
L0409       DW    $0000
L040B       DW    $0000
L040D       DW    $0000
L040F       DW    $0000


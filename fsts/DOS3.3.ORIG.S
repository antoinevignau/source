*
* DOS 3.3 FST
*

                lst   off
                rel
                typ   $BD
                dsk   DOS3.4.FST.L

                mx    %00

*
* EQUATES
*

FST_DOS33       =     2

DEV_DISPATCHER  EQU   $01FC00
ALLOC_SEG       EQU   $01FC1C
RELEASE_SEG     EQU   $01FC20
ALLOC_VCR       EQU   $01FC24
RELEASE_VCR     EQU   $01FC28
ALLOC_FCR       EQU   $01FC2C
RELEASE_FCR     EQU   $01FC30
DEREF           EQU   $01FC38
GET_SYS_GBUF    EQU   $01FC3C
SYS_EXIT        EQU   $01FC40
FIND_VCR        EQU   $01FC48
GET_FCR         EQU   $01FC64
LOCK_MEM        EQU   $01FC68
UNLOCK_MEM      EQU   $01FC6C
MOVE_INFO       EQU   $01FC70

deviceNum       =     $00
callNum         =     $02
bufferPtr       =     $04
requestCount    =     $08
blockNum        =     $10
blockSize       =     $14
FSTNum          =     $16
cachePointer    =     $1A
dibPointer      =     $20

ptrParamBlock   =     $32
ptrSegment      =     $80
ptrVCR          =     $88
ptrFCR          =     $90

*
* FST CODE
*

                ASC   'FST '             ; FST signature
                ADRL  L098C              ; call handler entry point
                ADRL  L0ABC              ; GS/OS entry point
                DW    $0002              ; file system ID
* 0001_1000_0000_0011
                DW    $1803              ; attributes
                DW    $0103              ; version
                DW    $0100              ; block size
                ADRL  $00000230          ; max volume size (blocks)
                ADRL  $00000020
                ADRL  $FFFFFFFF          ; max file size (bytes)
                ADRL  $00000000
                STR   'Apple II DOS 3.3'  ; FST name
                STR   'DOS 3.3 FST           v01.03'
                DW    $0000
                ASC   'DOS 3.3 FST. Written by Monte Benaresh, '
                ASC   'maintained by Cary Farrier and Jack Valois.  '
                ASC   'Tested by Linda Pan.  Copyright 1992 Apple Computer'

haSEGMENT       ADRL  $00000000
L00E0           DW    $0000
L00E2           DW    $0000
                DB    $00
                DB    $00
L00E6           DW    $0000
L00E8           DW    $0000
L00EA           DW    $0000
L00EC           DW    $0000
L00EE           DW    $0000
L00F0           DW    $0000

fgCLASS         DW    $0000
fgNBPARAMS      DW    $0000
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L00FC           DW    $0000
L00FE           DW    $0000
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L0104           DW    $0000
L0106           DW    $0000
L0108           DW    $0000
L010A           DW    $0000
                DB    $00
                DB    $00
L010E           DW    $0000
L0110           DW    $0000
L0112           DW    $0000
L0114           DW    $0000
L0116           DW    $0000
L0118           DW    $0000
L011A           ADRL  $00000000
L011E           ADRL  $00000000
L0122           DW    $0000
L0124           DW    $0000
L0126           DW    $0000
L0128           DW    $0000
L012A           DW    $0000
                DB    $00
                DB    $00
L012E           DW    $0000
L0130           DW    $0000
L0132           DW    $0000
L0134           DW    $0000
L0136           DW    $0000
L0138           DW    $0000
L013A           DW    $0000
                DB    $00
                DB    $00
                DB    $00
                DB    $00

L0140           DW    $0000
L0142           DW    $0000
L0144           DW    $0000
L0146           DS    $32                ; 146
L0178           DS    $32                ; 178
L01AA           DS    $32                ; 1AA
L01DC           DS    $32                ; 1DC
L020E           DW    $0000
L0210           DW    $0000
L0212           DW    $0000
L0214           DW    $0000
L0216           DW    $0000
L0218           DW    $0000
L021A           DW    $0000
L021C           DW    $0000
L021E           DW    $0000
L0220           DW    $0001
                DW    $0002
                DB    $00
                DB    $00

*
* OPEN
*

OPEN            STZ   L0256
                JSL   LOCK_MEM
                JSR   L1DCC
                STA   L0256
                LDA   haSEGMENT
                TAX
                ORA   haSEGMENT+2
                BEQ   L0243
                LDY   haSEGMENT+2
                JSL   RELEASE_SEG
L0243           JSL   UNLOCK_MEM
                LDA   L0256
                CMP   #$0001
                BCC   L0252
                ORA   L0140
L0252           JMPL  SYS_EXIT

L0256           DW    $0000

*
* VOLUME
*

VOLUME          STZ   L013A
                JSL   LOCK_MEM
                JSR   getDeviceID
                BCS   L02D5
                BEQ   L026B
                LDA   #$0052
                BRA   L02D5

L026B           LDA   fgCLASS
                BEQ   L0294

                LDY   #$0006             ; volName
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
                LDA   #$0018             ; length of GSOS output string
                CMP   [$B4]
                BCC   L0292
                LDA   #$0015             ; the length it must be!
                LDY   #$0002
                STA   [$B4],Y
                LDA   #$004F             ; bufferTooSmall
                BRL   L043F
L0292           BRA   L02A1

L0294           LDY   #$0004             ; do the same for class 0 calls
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6

*

L02A1           LDA   #L01AA             ; Get memory for volume info
                STA   $B8
                LDA   #$1000
                JSL   ALLOC_SEG
                BCC   L02B5
                LDA   #$0054
                BRL   L043F
L02B5           STX   haSEGMENT
                STY   haSEGMENT+2
                JSL   DEREF
                STX   ptrSegment
                STY   ptrSegment+2
                JSR   GetVolumeName
                BCC   L02D9
                CMP   #$0022
                BEQ   L02D2
                CMP   #$002C
                BNE   L02D5
L02D2           LDA   #$0052
L02D5           SEC
                BRL   L043F

*

L02D9           LDA   #L01AA
                STA   $84
                LDA   #^L01AA
                STA   $86
                LDA   deviceNum
                STA   L00E0
                JSR   L0E30
                BCC   L0354
                CMP   #$0057
                BNE   L02D5
                LDA   $42
                AND   #$4000
                BEQ   L02FE
L02F9           LDA   #$0057
                BRA   L02D5
L02FE           LDA   fgCLASS
                BEQ   L031C
                LDA   ($B8)
                INC
                LDY   #$0002
                STA   [$B4],Y
                LDA   $B4
                CLC
                ADC   #$0003
                STA   $B4
                BCC   L0317
                INC   $B6
L0317           LDY   #$0002
                BRA   L0321
L031C           LDA   ($B8)
                INC
                STA   [$B4]
L0321           SEP   #$20
                LDY   #$0002
L0326           LDA   ($B8),Y
                BEQ   L032F
                STA   [$B4],Y
                INY
                BPL   L0326
L032F           REP   #$20
                LDA   fgCLASS
                BNE   L0345
                LDY   #$0001
                LDA   [$B4],Y
                AND   #$FF00
                ORA   #$002F
                STA   [$B4],Y
                BRA   L02F9
L0345           LDY   #$0001
                LDA   [$B4],Y
                AND   #$FF00
                ORA   #$003A
                STA   [$B4],Y
                BRA   L02F9

*

L0354           LDA   fgCLASS
                BEQ   L0372
                LDA   ($B8)
                INC
                LDY   #$0002
                STA   [$B4],Y
                LDA   $B4
                CLC
                ADC   #$0003
                STA   $B4
                BCC   L036D
                INC   $B6
L036D           LDY   #$0002
                BRA   L0377
L0372           LDA   ($B8)
                INC
                STA   [$B4]
L0377           SEP   #$20
                LDY   #$0002
L037C           LDA   ($B8),Y
                BEQ   L0385
                STA   [$B4],Y
                INY
                BPL   L037C

L0385           REP   #$20
                LDA   fgCLASS
                BNE   L03D1

                LDY   #$0001
                LDA   [$B4],Y
                AND   #$FF00
                ORA   #$002F
                STA   [$B4],Y
                LDY   #$0035
                LDA   [$8C],Y
                AND   #$0020
                BNE   L03A8
                LDA   #$0230             ; 560
                BRA   L03AB
L03A8           LDA   #$0640             ; 1600
L03AB           LDY   #$0008             ; totalBlocks
                STA   [ptrParamBlock],Y
                INY
                INY
                LDA   #$0000
                STA   [ptrParamBlock],Y
                JSR   L0476
                LDY   #$000C             ;  freeBlocks
                STA   [ptrParamBlock],Y
                INY
                INY
                LDA   #$0000
                STA   [ptrParamBlock],Y
                LDA   #$0002
                LDY   #$0010             ; fileSysID
                STA   [ptrParamBlock],Y
                CLC
                BRA   L043F

L03D1           LDY   #$0001             ; class 1 calls
                LDA   [$B4],Y
                AND   #$FF00
                ORA   #$003A
                STA   [$B4],Y
                LDA   fgNBPARAMS
                STA   L0474
                DEC   L0474
                DEC   L0474
                DEC   L0474
                BMI   L043F
                LDY   #$0035
                LDA   [$8C],Y
                AND   #$0020
                BNE   L03FE
                LDA   #$0230             ; 560
                BRA   L0401
L03FE           LDA   #$0640             ; 1600
L0401           LDY   #$000A
                STA   [ptrParamBlock],Y
                INY
                INY
                LDA   #$0000
                STA   [ptrParamBlock],Y
                DEC   L0474
                BMI   L043F
                JSR   L0476
                LDY   #$000E
                STA   [ptrParamBlock],Y
                INY
                INY
                LDA   #$0000
                STA   [ptrParamBlock],Y
                DEC   L0474
                BMI   L043F
                LDA   #$0002
                LDY   #$0012
                STA   [ptrParamBlock],Y
                DEC   L0474
                BMI   L043F
                LDA   #$0100
                LDY   #$0014
                STA   [ptrParamBlock],Y
                CLC
                LDA   #$0000

*

L043F           PHA
                PHP
                BCC   L0459
                BIT   L013A
                BPL   L0459
                LDY   #$0008
                LDA   #$0000
                STA   [ptrVCR],Y
                LDY   #$0000
                LDA   [ptrVCR],Y
                JSL   RELEASE_VCR
L0459           LDA   haSEGMENT
                TAX
                ORA   haSEGMENT+2
                BEQ   L0469
                LDY   haSEGMENT+2
                JSL   RELEASE_SEG
L0469           PLP
                PLA
                BCC   L0470
                ORA   L0140
L0470           JMPL  SYS_EXIT

L0474           DW    $0000

L0476           LDY   #$0035
                LDA   [$8C],Y
                AND   #$00FF
                LSR
                LSR
                LSR
                LSR
                STA   L04CC
                STZ   L04CE
                LDY   #$0034
                LDA   [$8C],Y
                AND   #$00FF
                STA   L04D0
L0493           LDA   L04CC
                STA   L04D2
                LDA   L04D0
                DEC
                BMI   L04C8
                STA   L04D0
                ASL
                ASL
                ADC   #$0038
                TAY
L04A8           LDA   [$8C],Y
                STA   L04D4
                LDA   L04CE
                LDX   #$0010
L04B3           ASL   L04D4
                ADC   #$0000
                DEX
                BNE   L04B3
                STA   L04CE
                DEC   L04D2
                BEQ   L0493
                INY
                INY
                BRA   L04A8
L04C8           LDA   L04CE
                RTS

L04CC           DW    $0000
L04CE           DW    $0000
L04D0           DW    $0000
L04D2           DW    $0000
L04D4           DW    $0000

*
* GET FILE INFO
*

GETFILEINFO     STZ   L0130
                STZ   L0132
                JSL   LOCK_MEM
                JSR   L0B7E
                BCC   L04E8
                BRL   L05E6

L04E8           STZ   L0608
                LDY   #$000E
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $8C
                STY   $8E
                LDY   #$0012
                LDA   [ptrVCR],Y
                STA   L00EA
                LDA   ($B2)
                BNE   L0534
                STZ   L0216
                STZ   L021A
                STZ   L021C
                LDA   L00EA
                INC
                LDX   fgCLASS
                BNE   L051F
                STA   L021C
L051F           XBA
                STA   L0218
                LDA   #$000F
                STA   L0212
                STA   L0220
                LDA   #$00C3
                STA   L0214
                BRA   L056C
L0534           LDY   #$0008
                LDA   [ptrVCR],Y
                BEQ   L0540
                JSR   L113F
                BCC   L05B4
L0540           JSR   L14A7
                BCC   L054B
                LDA   #$0051
                BRL   L05E6
L054B           LDA   L00F0
                BPL   L0556
                LDA   #$0046
                BRL   L05E6
L0556           LDA   L0134
                STA   $98
                LDA   L0136
                STA   $9A
                LDA   #$0002
                STA   callNum
                JSR   L1580              ; Driver_Read
                BCC   L056C
                BRA   L05E5

L056C           LDA   fgCLASS
                BNE   L0592

                LDA   #$0001
                STA   fgNBPARAMS
                LDA   L0212
                CMP   #$000F
                BNE   L0585
                LDA   #$0230
                STA   L0216
L0585           LDA   #L0CD0
                STA   $C2
                JSR   L0CB2
                LDA   #$0000
                BRA   L05E6

L0592           LDA   #L0CEA
                STA   $C2
                JSR   L0CB2
                LDA   fgNBPARAMS
                CMP   #$0008
                BCC   L05AF
                LDY   #$0020
                JSR   L151F
                BCC   L05AF
                LDA   #$004F
                BRA   L05E6
L05AF           LDA   #$0000
                BRA   L05E6
L05B4           LDY   #$0014
                LDA   [$94],Y
                STA   L0214
                LDY   #$001A
                LDA   [$94],Y
                STA   L0218
                INY
                INY
                LDA   [$94],Y
                STA   L021A
                LDY   #$001E
                LDA   [$94],Y
                STA   L0216
                LDY   #$0024
                LDA   [$94],Y
                STA   L0212
                LDY   #$0028
                LDA   [$94],Y
                STA   L021C
                BRA   L056C
L05E5           SEC

L05E6           PHA
                LDA   haSEGMENT
                TAX
                ORA   haSEGMENT+2
                BEQ   L05F7
                LDY   haSEGMENT+2
                JSL   RELEASE_SEG
L05F7           JSL   UNLOCK_MEM
                PLA
                CMP   #$0001
                BCC   L0604
                ORA   L0140
L0604           JMPL  SYS_EXIT

L0608           DW    $0000

*
* GETDIRENTRY
*

GETDIRENTRY     JSL   LOCK_MEM
                LDX   $3A
                LDY   $3C
                JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2
                LDX   $3E
                LDY   $40
                JSL   DEREF
                STX   ptrVCR
                STY   ptrVCR+2
                LDA   #$1000
                JSL   ALLOC_SEG
                BCC   L0633
                LDA   #$0054
                RTS

L0633           STX   haSEGMENT
                STY   haSEGMENT+2
                JSL   DEREF
                STX   ptrSegment
                STY   ptrSegment+2
                LDA   L0134
                STA   $98
                LDA   L0136
                STA   $9A
                LDA   fgCLASS
                JSR   L1607
                PHA
                LDA   haSEGMENT
                TAX
                ORA   haSEGMENT+2
                BEQ   L0662
                LDY   haSEGMENT+2
                JSL   RELEASE_SEG
L0662           JSL   UNLOCK_MEM
                PLA
                CMP   #$0001
                BCC   L066F
                ORA   L0140
L066F           JMPL  SYS_EXIT

*
* READ
*

READ            JSL   LOCK_MEM
                LDX   $3A
                LDY   $3C
                JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2
                LDX   $3E
                LDY   $40
                JSL   DEREF
                STX   ptrVCR
                STY   ptrVCR+2
                LDY   #$000E
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $8C
                STY   $8E
                LDY   #$002E
                LDA   [ptrFCR],Y
                TAX
                LDY   #$002C
                LDA   [ptrFCR],Y
                JSR   L0DBB
                JSR   L18E6
                PHA
                PHP
                JSL   UNLOCK_MEM
                PLP
                PLA
                BCC   L06C0
                ORA   L0140
L06C0           JMPL  SYS_EXIT

*
* CLOSE
*

CLOSE           JSL   LOCK_MEM
                LDX   $3A
                LDY   $3C
                JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2
                LDX   $3E
                LDY   $40
                JSL   DEREF
                STX   ptrVCR
                STY   ptrVCR+2
                LDY   #$0024
                LDA   [ptrFCR],Y
                CMP   #$000F
                BEQ   L06F9
                LDY   #$0016
                LDA   [ptrFCR],Y
                TAX
                INY
                INY
                LDA   [ptrFCR],Y
                TAY
                JSL   RELEASE_SEG
L06F9           LDY   #$0000
                LDA   [ptrFCR],Y
                JSL   RELEASE_FCR
                BCC   L0709
                LDA   #$8043
                BRA   L071C
L0709           LDY   #$0008
                LDA   [ptrVCR],Y
                BNE   L0715
                LDA   #$1F40
                BRA   L071C
L0715           DEC
                STA   [ptrVCR],Y
                CLC
                LDA   #$0000
L071C           PHA
                PHP
                JSL   UNLOCK_MEM
                PLP
                PLA
                BCC   L0729
                ORA   L0140
L0729           JMPL  SYS_EXIT

*
* GETDEVNUMBER
*

GETDEVNUMBER    JSL   LOCK_MEM
                LDA   $36                ; do we have a device number?
                BEQ   L0744              ; no, get one!

L0735           LDY   #$0006             ; class 1
                LDX   fgCLASS
                BNE   L0740
                LDY   #$0004             ; class 0
L0740           STA   [ptrParamBlock],Y
                BRA   L075B

L0744           JSR   L0B7E
                BCC   L0754
                CMP   #$0057
                BNE   L0751
                LDA   #$0052
L0751           SEC
                BRA   L075F

L0754           LDY   #$000C
                LDA   [ptrVCR],Y
                BRA   L0735

L075B           CLC
                LDA   #$0000
L075F           PHA
                PHP
                LDA   haSEGMENT
                TAX
                ORA   haSEGMENT+2
                BEQ   L0771
                LDY   haSEGMENT+2
                JSL   RELEASE_SEG
L0771           JSL   UNLOCK_MEM
                PLP
                PLA
                BCC   L077C
                ORA   L0140
L077C           JMPL  SYS_EXIT

*
* GETEOF
*

GETEOF          JSL   LOCK_MEM
                LDX   $3A
                LDY   $3C
                JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2
                LDY   #$001A
                LDA   [ptrFCR],Y
                TAX
                INY
                INY
                LDA   [ptrFCR],Y
                PHA
                LDA   fgCLASS
                BEQ   L07AD
                PLA
                LDY   #$0006
                STA   [ptrParamBlock],Y
                TXA
                DEY
                DEY
                STA   [ptrParamBlock],Y
                BRA   L07B8
L07AD           PLA
                LDY   #$0004
                STA   [ptrParamBlock],Y
                TXA
                DEY
                DEY
                STA   [ptrParamBlock],Y
L07B8           CLC
                LDA   #$0000
                PHA
                PHP
                JSL   UNLOCK_MEM
                PLP
                PLA
                BCC   L07C9
                ORA   L0140
L07C9           JMPL  SYS_EXIT

*
* GETMARK
*

GETMARK         JSL   LOCK_MEM
                LDX   $3A
                LDY   $3C
                JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2
                LDY   #$0020
                LDA   [ptrFCR],Y
                TAX
                INY
                INY
                LDA   [ptrFCR],Y
                PHA
                LDA   fgCLASS
                BEQ   L07FA
                PLA
                LDY   #$0006
                STA   [ptrParamBlock],Y
                TXA
                DEY
                DEY
                STA   [ptrParamBlock],Y
                BRA   L0805
L07FA           PLA
                LDY   #$0004
                STA   [ptrParamBlock],Y
                TXA
                DEY
                DEY
                STA   [ptrParamBlock],Y
L0805           CLC
                LDA   #$0000
                PHA
                PHP
                JSL   UNLOCK_MEM
                PLP
                PLA
                BCC   L0816
                ORA   L0140
L0816           JMPL  SYS_EXIT

*
* SETMARK
*

SETMARK         JSL   LOCK_MEM
                LDX   $3A
                LDY   $3C
                JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2

                LDA   fgCLASS
                BEQ   L0840

                LDY   #$0006
                LDA   [ptrParamBlock],Y
                STA   L090F
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   L090F+2
                BRA   L0851

L0840           LDY   #$0002
                LDA   [ptrParamBlock],Y
                STA   L090F
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   L090F+2
                BRA   L0867

L0851           LDY   #$0004
                LDA   [ptrParamBlock],Y
                BEQ   L0867
                DEC
                BEQ   L0875
                DEC
                BEQ   L08B3
                DEC
                BEQ   L0894
                LDA   #$0053
                BRL   L08FD

L0867           LDA   L090F
                STA   L0913
                LDA   L090F+2
                STA   L0913+2
                BRA   L08D0

L0875           LDY   #$001A
                LDA   [ptrFCR],Y
                SEC
                SBC   L090F
                STA   L0913
                INY
                INY
                LDA   [ptrFCR],Y
                SBC   L090F+2
                BCS   L088F
                LDA   #$004D
                BRA   L08FD
L088F           STA   L0913+2
                BRA   L08EA

L0894           LDY   #$0020
                LDA   [ptrFCR],Y
                SEC
                SBC   L090F
                STA   L0913
                INY
                INY
                LDA   [ptrFCR],Y
                SBC   L090F+2
                BCS   L08AE
                LDA   #$004D
                BRA   L08FD
L08AE           STA   L0913+2
                BRA   L08EA

L08B3           LDY   #$0020
                LDA   [ptrFCR],Y
                CLC
                ADC   L090F
                STA   L0913
                INY
                INY
                LDA   [ptrFCR],Y
                ADC   L090F+2
                BCC   L08CD
                LDA   #$004D
                BRA   L08FD
L08CD           STA   L0913+2

L08D0           LDA   L0913+2
                LDY   #$001C
                CMP   [ptrFCR],Y
                BCC   L08EA
                BNE   L08E5
                DEY
                DEY
                LDA   [ptrFCR],Y
                CMP   L0913
                BCS   L08EA
L08E5           LDA   #$004D
                BRA   L08FD
L08EA           LDA   L0913
                LDY   #$0020
                STA   [ptrFCR],Y
                LDA   L0913+2
                INY
                INY
                STA   [ptrFCR],Y
                CLC
                LDA   #$0000
L08FD           PHA
                JSL   UNLOCK_MEM
                PLA
                CMP   #$0001
                BCC   L090B
                ORA   L0140
L090B           JMPL  SYS_EXIT

L090F           ADRL  $00000000
L0913           ADRL  $00000000

*
* FLUSH
*

FLUSH           LDA   fgCLASS
                BEQ   L092A

                LDA   fgNBPARAMS
                CMP   #$0003
                BCC   L092A
                LDA   #$0004
                SEC
                BRA   L092E
L092A           CLC
                LDA   #$0000
L092E           BCC   L0933
                ORA   L0140
L0933           JMPL  SYS_EXIT

*
* FSTSPECIFIC
*

FSTSPECIFIC     LDY   #$0004
                LDA   [ptrParamBlock],Y
                BEQ   L094E
                DEC
                BNE   L0946
                JSR   L1542
                BRA   L0952
L0946           DEC
                BNE   L094E
                JSR   L1566
                BRA   L0952

L094E           LDA   #$0065
                SEC
L0952           CMP   #$0001
                BCC   L095A
                ORA   L0140
L095A           JMPL  SYS_EXIT

*
*
*

L095E           JSL   LOCK_MEM
                JSR   L0B7E
                BCS   L096A
                LDA   #$002B
L096A           PHA
                LDA   haSEGMENT
                TAX
                ORA   haSEGMENT+2
                BEQ   L097B
                LDY   haSEGMENT+2
                JSL   RELEASE_SEG
L097B           JSL   UNLOCK_MEM
                PLA
                CMP   #$0001
                BCC   L0988
                ORA   L0140
L0988           JMPL  SYS_EXIT

*
* FST INTERNAL ENTRY POINT
*
* A: UNDEFINED
* X: CALL NUMBER
* Y: CLASS TYPE
*

L098C           STAL  $FF0500            ; ?
                PHK
                PLB
                REP   #$30
                STZ   fgNBPARAMS
                STZ   L0140

                STY   fgCLASS            ; class 0 or 1 call?
                CPY   #$0000
                BEQ   L09C2

                LDA   [ptrParamBlock]    ; class 1
                STA   fgNBPARAMS
                LDA   L0A56-2,X          ; how many parameters
                SEP   #$20               ; do we have?
                STA   L0142
                XBA
                STA   L0144
                LDA   fgNBPARAMS
                CMP   L0142
                BCS   L09D0
                CMP   L0144
                BCC   L09D0
                REP   #$20

L09C2           STZ   haSEGMENT          ; jump to call
                STZ   haSEGMENT+2
                CPX   #$0069
                BCS   L09D7
                JMP   (L09EC,X)

L09D0           REP   #$20
                LDA   #$0004
                BRA   L09DA
L09D7           LDA   #$0001
L09DA           SEC
                ORA   L0140
                JMPL  SYS_EXIT

L09E2           LDA   #$002B
                BRA   L09DA

L09E7           LDA   #$0065
                BRA   L09DA

* GS/OS CALL NUMBERS

L09EC           DA    L09D7              ; 00
                DA    L095E              ; 01 Create
                DA    L095E              ; 02 Destroy
                DA    L09D7              ; 03 OSShutdown
                DA    L095E              ; 04 ChangePath
                DA    L095E              ; 05 SetFileInfo
                DA    GETFILEINFO        ; 06 GetFileInfo
                DA    L09E7              ; 07 JudgeName
                DA    VOLUME             ; 08 Volume
                DA    L09D7              ; 09 SetPrefix
                DA    L09D7              ; 0A GetPrefix
                DA    L095E              ; 0B ClearBackupBit
                DA    L09D7              ; 0C SetSysPrefs
                DA    L09D7              ; 0D Null
                DA    L09D7              ; 0E ExpandPath
                DA    L09D7              ; 0F GetSysPrefs
                DA    OPEN               ; 10 Open
                DA    L09D7              ; 11 NewLine
                DA    READ               ; 12 Read
                DA    L09E2              ; 13 Write
                DA    CLOSE              ; 14 Close
                DA    FLUSH              ; 15 Flush
                DA    SETMARK            ; 16 SetMark
                DA    GETMARK            ; 17 GetMark
                DA    L09E2              ; 18 SetEOF
                DA    GETEOF             ; 19 GetEOF
                DA    L09D7              ; 1A SetLevel
                DA    L09D7              ; 1B GetLevel
                DA    GETDIRENTRY        ; 1C GetDirEntry
                DA    L09D7              ; 1D BeginSession
                DA    L09D7              ; 1E EndSession
                DA    L09D7              ; 1F SessionStatus
                DA    GETDEVNUMBER       ; 20 GetDevNumber
                DA    L09D7              ; 21
                DA    L09D7              ; 22
                DA    L09D7              ; 23
                DA    L09E2              ; 24 Format
                DA    L09E2              ; 25 EraseDisk
                DA    L09D7              ; 26 ResetCache
                DA    L09D7              ; 27 GetName
                DA    L09D7              ; 28 GetBootVol
                DA    L09D7              ; 29 Quit
                DA    L09D7              ; 2A GetVersion
                DA    L09D7              ; 2B GetFSTInfo
                DA    L09D7              ; 2C DInfo
                DA    L09D7              ; 2D DStatus
                DA    L09D7              ; 2E DControl
                DA    L09D7              ; 2F DRead
                DA    L09D7              ; 30 DWrite
                DA    L09D7              ; 31 BindInt
                DA    L09D7              ; 32 UnbindInt
                DA    FSTSPECIFIC        ; 33 FSTSpecific
                DA    L09D7              ; 34 AddNotifyProc

*
* PARAMETERS: MIN & MAX
*

L0A56           DW    $0108
                DW    $0102
                DW    $0102
                DW    $0204
                DW    $020D
                DW    $010D
                DW    $0107
                DW    $0207
                DW    $0203
                DW    $0203
                DW    $0102
                DW    $0102
                DW    $0001
                DW    $0204
                DW    $0102
                DW    $0210
                DW    $0405
                DW    $0406
                DW    $0406
                DW    $0102
                DW    $0102
                DW    $0304
                DW    $0203
                DW    $0304
                DW    $0203
                DW    $0102
                DW    $0102
                DW    $0512
                DW    $0001
                DW    $0001
                DW    $0102
                DW    $0203
                DW    $0001
                DW    $0001
                DW    $0001
                DW    $0305
                DW    $0305
                DW    $0001
                DW    $0102
                DW    $0102
                DW    $0003
                DW    $0102
                DW    $0209
                DW    $020C
                DW    $0506
                DW    $0506
                DW    $0607
                DW    $0607
                DW    $0001
                DW    $0001
                DW    $0112

*
* GS/OS INTERNAL CALL
*

L0ABC           STAL  $FF0510
                PHK
                PLB
                CPX   #$000B
                BCS   L0ACA
                JMP   (L0B05,X)

L0ACA           LDA   #$0001
                RTL

L0ACE           JSL   GET_SYS_GBUF
                STX   L0134
                STY   L0136
                LDA   #$0001
                STA   L0138
                BRA   L0AE0

L0AE0           LDA   #$0000
                CLC
                RTL

L0AE5           STAL  $FE0358
                LDX   $3E
                LDY   $40
                STX   ptrVCR
                STY   ptrVCR+2
                LDY   #$000E
                LDA   [$3E],Y
                TAX
                INY
                INY
                ORA   [$3E],Y
                BEQ   L0B04
                LDA   [$3E],Y
                TAY
                JSL   RELEASE_SEG
L0B04           RTL

L0B05           DA    L0ACA              ; 0
                DA    L0ACE              ; 1
                DA    L0AE0              ; 2
                DA    L0AE5              ; 3
                DA    L0AE0              ; 4

L0B0F           LDX   $84
                LDY   $86
                LDA   #$0000
                JSL   FIND_VCR
                BCC   L0B21
L0B1C           LDA   #$0000
                CLC
                RTS

L0B21           JSL   DEREF
                STX   ptrVCR
                STY   ptrVCR+2
                LDY   #$000A
                LDA   [ptrVCR],Y
                CMP   #$0002
                BEQ   L0B3D
                JSR   L105D
                BCC   L0B1C
L0B38           LDA   #$0057
                SEC
                RTS

L0B3D           LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
                LDA   $36
                BNE   L0B63
                LDY   #$000C
                LDA   [ptrVCR],Y
                STA   L00E0
                JSR   L10B0
                BCC   L0B63
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                LDA   #$0045
                SEC
                RTS

L0B63           LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                JSR   L1071
                BCS   L0B77
                LDY   #$0000
                LDA   [ptrVCR],Y
                CLC
                RTS

L0B77           JSR   L105D
                BCS   L0B38
                BRA   L0B1C
L0B7E           STZ   L00E0
                STZ   L00E2
                STZ   haSEGMENT
                STZ   haSEGMENT+2
                LDA   #$1000
                JSL   ALLOC_SEG
                BCC   L0B97
                LDA   #$0054
                RTS

L0B97           STX   haSEGMENT
                STY   haSEGMENT+2
                JSL   DEREF
                STX   ptrSegment
                STY   ptrSegment+2
                LDA   #L0146
                STA   $84
                LDA   #^L0146
                STA   $86
                LDA   #L0178
                STA   $B2
                LDA   #^L0178
                STA   $B4
                LDA   #L01AA
                STA   $B8
                LDA   #^L01AA
                STA   $BA
                JSR   L11CC
                BCC   L0BCC
                LDA   #$0040
                RTS

L0BCC           LDA   $36
                BEQ   L0BED
                STA   deviceNum
                JSR   getDeviceID
                BCS   L0BDE
                BNE   L0BDE
                JSR   GetVolumeName
                BCC   L0BE3
L0BDE           SEC
                LDA   #$0052
                RTS

L0BE3           LDA   #L01AA
                STA   $84
                LDA   #^L01AA
                STA   $86

L0BED           LDX   $84
                LDY   $86
                LDA   #$0000
                JSL   FIND_VCR
                BCS   L0C55
                JSL   DEREF
                STX   ptrVCR
                STY   ptrVCR+2
                LDY   #$000A
                LDA   [ptrVCR],Y
                CMP   #$0002
                BEQ   L0C27
L0C0C           LDY   #$0008
                LDA   [ptrVCR],Y
                BEQ   L0C55
                STZ   L00E0
                JSR   L10B0
                LDA   #$0045
                BCC   L0C21
                BRL   L0CAF
L0C21           LDA   #$0057
                BRL   L0CAF
L0C27           LDY   #$000E
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $8C
                STY   $8E
                JSR   L1071
                BCS   L0C53
                LDY   #$0006
                LDA   [ptrVCR],Y
                AND   #$4000
                BEQ   L0CA7
                LDY   #$000C
                LDA   [ptrVCR],Y
                STA   L00E0
                BRA   L0C5C
L0C53           BRA   L0C0C
L0C55           STZ   ptrVCR
                STZ   ptrVCR+2
                STZ   L00E0
L0C5C           STZ   L0CB0
                LDA   ptrVCR
                ORA   ptrVCR+2
                BEQ   L0C70
                INC   L0CB0
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
L0C70           JSR   L10B0
                PHP
                PHA
                LDA   L0CB0
                BEQ   L0C85
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                STZ   L0CB0
L0C85           PLA
                PLP
                BCS   L0CAF
                LDA   ptrVCR
                ORA   ptrVCR+2
                BEQ   L0CA2
                LDY   #$000C
                LDA   deviceNum
                STA   [ptrVCR],Y
                LDY   #$0006
                LDA   [ptrVCR],Y
                AND   #$BFFF
                STA   [ptrVCR],Y
                BRA   L0CA7
L0CA2           JSR   L0E30
                BCS   L0CAF
L0CA7           LDY   #$000C
                LDA   [ptrVCR],Y
                STA   deviceNum
                CLC
L0CAF           RTS

L0CB0           DW    $0000

L0CB2           LDY   #$FFFE
                LDX   fgNBPARAMS
L0CB8           INY
                INY
                LDA   ($C2),Y
                ASL
                PHP
                BMI   L0CC9
                LSR
                PHY
                TAY
                LDA   L020E,Y
                PLY
                STA   [ptrParamBlock],Y
L0CC9           PLP
                BCC   L0CB8
                DEX
                BNE   L0CB8
                RTS

L0CD0           DW    $4000
                DW    $4000
                DW    $0006
                DW    $0004
                DW    $0008
                DW    $0016
                DW    $0012
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $000E
                DW    $8016
L0CEA           DW    $4000
                DW    $4000
                DW    $C000
                DW    $8006
                DW    $8004
                DW    $0008
                DW    $8016
                DW    $8012
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $8016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $8016
                DW    $4000
                DW    $C000
                DW    $000A
                DW    $800C
                DW    $000E
                DW    $8016
                DW    $0016
                DW    $8016
                DW    $0016
                DW    $8016
L0D1E           DW    $4000
                DW    $4000
                DW    $4000
                DW    $4000
                DW    $4000
                DW    $4000
                DW    $0010
                DW    $0004
                DW    $000A
                DW    $000C
                DW    $000E
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $0006
                DW    $0008
                DW    $0016
                DW    $8014
L0D4E           DW    $4000
                DW    $C000
                DW    $C000
                DW    $C000
                DW    $C000
                DW    $4000
                DW    $C000
                DW    $8010
                DW    $8004
                DW    $000A
                DW    $800C
                DW    $000E
                DW    $8016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $8016
                DW    $0016
                DW    $0016
                DW    $0016
                DW    $8016
                DW    $8006
                DW    $0008
                DW    $8016
                DW    $8014
                DW    $4000
                DW    $C000
                DW    $0016
                DW    $8016
                DW    $0016
                DW    $8016

*
* TRACK/SECTOR TO BLOCK
*

TS2BLOCK        XBA
                SEP   #$20
                ASL
                ASL
                ASL
                ASL
                REP   #$20
                LSR
                LSR
                LSR
                LSR
                STA   blockNum
                STZ   $12
                LDA   #$0100
                STA   blockSize
                STA   requestCount
                STZ   requestCount+2
                LDA   #FST_DOS33
                STA   FSTNum
                STZ   cachePointer
L0DAD           JSL   DEV_DISPATCHER
                BCS   L0DB4
                RTS

L0DB4           CMP   #$002E
                BEQ   L0DAD
                SEC
                RTS

L0DBB           CMP   #$0010
                BCS   L0DE0
                XBA
                ADC   #$0100
                ADC   #$000B
                CPX   #$0008
                BCS   L0DE0
L0DCC           DEX
                BMI   L0DD4
                ADC   #$0023
                BRA   L0DCC
L0DD4           ADC   $8C
                STA   $A8
                LDA   $8E
                ADC   #$0000
                STA   $AA
                RTS
L0DE0           RTS

L0DE1           LDA   [$A8]
                AND   #$00FF
                BEQ   L0E0A              ; Points to T0
                CMP   #$00FF             ; File is deleted
                BEQ   L0E0A
                PHY
                PHX
                LDX   #$000F
                LDY   #$0003
L0DF5           LDA   [$A8],Y
                CMP   #$A0A0             ; Empty file name ?
                BNE   L0E06
                INY
                INY
                DEX
                BNE   L0DF5
                LDA   #$00FF
                BRA   L0E08
L0E06           LDA   [$A8]              ; Get TS
L0E08           PLX
                PLY
L0E0A           AND   #$00FF
                RTS

L0E0E           LDA   [$A0]
                CMP   [$A4]
                BNE   L0E2C
                TAY
                BPL   L0E1A
                LDY   #$7FFF
L0E1A           INY
                SEP   #$20
L0E1D           LDA   [$A4],Y
                AND   L00EC
                CMP   [$A0],Y
                BNE   L0E2C
                DEY
                BPL   L0E1D
                REP   #$21
                RTS

L0E2C           SEC
                REP   #$20
                RTS

L0E30           JSR   L0B0F
                BCC   L0E39
                LDA   #$0057
                RTS

L0E39           BEQ   L0E3E
                BRL   L0EF6
L0E3E           JSR   L10B0
                BCC   L0E47
                LDA   #$0045
                RTS

L0E47           LDA   #$0014
                LDX   $84
                LDY   $86
                JSL   ALLOC_VCR
                BCC   L0E58
                LDA   #$0054
                RTS

L0E58           JSL   DEREF
                STX   ptrVCR
                STY   ptrVCR+2
                LDA   #$8000
                TSB   L013A
                LDA   haSEGMENT
                ORA   haSEGMENT+2
                BNE   L0E82
                LDA   #$1000
                JSL   ALLOC_SEG
                BCC   L0E7C
                LDA   #$0054
                BRA   L0ED1
L0E7C           STX   haSEGMENT
                STY   haSEGMENT+2
L0E82           LDY   #$000A
                LDA   #$0002
                STA   [ptrVCR],Y
                LDY   #$0008
                LDA   #$0000
                STA   [ptrVCR],Y
                LDY   #$000C
                LDA   deviceNum
                STA   [ptrVCR],Y
                LDY   #$000E
                LDA   haSEGMENT
                TAX
                STA   [ptrVCR],Y
                INY
                INY
                LDA   haSEGMENT+2
                STA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $8C
                STY   $8E
                STZ   haSEGMENT
                STZ   haSEGMENT+2
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
                JSR   L145D
                PHP
                PHA
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                PLA
                PLP
                BCC   L0EEC
L0ED1           PHA
                LDY   #$0008
                LDA   #$0000
                STA   [ptrVCR],Y
                LDY   #$0000
                LDA   [ptrVCR],Y
                JSL   RELEASE_VCR
                LDA   #$8000
                TRB   L013A
                PLA
                SEC
                RTS

L0EEC           LDA   L00EA
                LDY   #$0012
                STA   [ptrVCR],Y
                BRA   L0F10
L0EF6           LDY   #$000E
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $8C
                STY   $8E
                LDY   #$000C
                LDA   deviceNum
                STA   [ptrVCR],Y
L0F10           CLC
                RTS

*
* GetVolumeName
*

GetVolumeName   LDA   ptrSegment
                STA   bufferPtr
                LDA   ptrSegment+2
                STA   bufferPtr+2
                LDA   #$0002
                STA   callNum
                LDA   #$0011
                JSR   TS2BLOCK           ; Read T11/S0
                BCC   L0F28
                RTS

L0F28           SEP   #$30               ;
                LDX   #$09
L0F2C           LDA   L1041,X
                TAY
L0F30           LDA   [bufferPtr],Y
                CMP   L104B,X
                BNE   L0F42
L0F37           DEX
                BMI   L0F52
                TYA
                CMP   L1041,X
                BEQ   L0F37
                BRA   L0F2C
L0F42           DEX
                BMI   L0F4B
                TYA
                CMP   L1041,X
                BEQ   L0F30
L0F4B           SEC
                REP   #$30
                LDA   #$0052
                RTS

L0F52           REP   #$31
                LDY   #$0001             ; Get TS of 1st directory
                LDA   [bufferPtr],Y
                BNE   L0F5F
                LDA   #$0051
                RTS

L0F5F           PHA                      ; load T11/SF
                LDA   bufferPtr
                STA   ptrSegment
                CLC
                ADC   #$0100
                STA   bufferPtr
                LDA   bufferPtr+2
                STA   ptrSegment+2
                ADC   #$0000
                STA   bufferPtr+2
                LDA   #$0002
                STA   callNum
                PLA
                JSR   TS2BLOCK
                BCC   L0F7F
                RTS

* Handle T11/SF

L0F7F           LDY   #$01FE             ; clear high-bit
                LDA   #$0000
                CLC
L0F86           EOR   [ptrSegment],Y
                ROR
                BPL   L0F8E
                EOR   #$7FFF
L0F8E           DEY
                DEY
                BPL   L0F86
                STA   L1055              ; -> the magic number!

                LDX   #$0000             ; Copy volume name
                LDA   L1035,X
                STA   $AC
                SEP   #$20
                LDY   #$0002
L0FA2           LDA   ($AC),Y
                BEQ   L0FAE
                STA   ($B8),Y
                INY
                CPY   #$000F
                BNE   L0FA2

* MANAGE VOLUME VERSION

L0FAE           REP   #$20
                STZ   L1059
                STZ   L105B
                LDA   L1055
                AND   #$07FF
                STA   L1057
L0FBF           SEC
                SBC   #$03E8             ; 1000
                BCC   L0FD6
                STA   L1057
                LDA   L1059
                ADC   #$0000
                STA   L1059
                LDA   L1057
                BRA   L0FBF
L0FD6           LDA   L1057
                SEC
                SBC   #$0064             ; 100
                BCC   L0FED
                STA   L1057
                LDA   L1059
                ADC   #$00FF
                STA   L1059
                BRA   L0FD6
L0FED           LDA   L1057
                SEC
                SBC   #$000A             ; 10
                BCC   L1004
                STA   L1057
                LDA   L105B
                ADC   #$0000
                STA   L105B
                BRA   L0FED
L1004           LDA   L1057
                XBA
                ADC   L105B
                STA   L105B
                LDA   L1059
                ADC   #$3030
                STA   ($B8),Y
                INY
                INY
                LDA   L105B
                ADC   #$3030
                STA   ($B8),Y
                INY
                INY
                LDA   #$0000
                STA   ($B8),Y
                DEY
                DEY
                TYA
                STA   ($B8)
                REP   #$31
                LDA   #$8000
                STA   L0140
                RTS                      ; Now we have a beautiful version!

L1035           DA    L1035
                ASC   'DOS 3.3 v'00

L1041           HEX   03273637313134343535
L104B           HEX   037A000101FF23321020

L1055           DW    $0000
L1057           DW    $0000
L1059           DW    $0000
L105B           DW    $0000

*
*
*

L105D           LDY   #$0008
                LDA   [ptrVCR],Y
                BEQ   L1066
                SEC
                RTS

L1066           LDY   #$0000
                LDA   [ptrVCR],Y
                JSL   RELEASE_VCR
                CLC
                RTS

L1071           LDY   #$000E
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $AE
                STY   $B0
                LDY   #$01FE
L1087           LDA   [$8C],Y
                CMP   [$AE],Y
                BNE   L1093
                DEY
                DEY
                BPL   L1087
                CLC
                RTS

L1093           SEC
                RTS

*
* getDeviceID
*

getDeviceID     LDA   deviceNum
                PHA
                STA   bufferPtr
                STZ   deviceNum
                LDA   #$0001
                STA   callNum
                JSL   DEV_DISPATCHER
                PLY
                STY   deviceNum
                BCS   L10AF
                LDY   #$0034
                LDA   [dibPointer],Y     ; deviceID
L10AF           RTS

L10B0           LDX   L00E0
                BNE   L10E7
L10B5           INX
                STX   deviceNum
                JSR   GetVolumeName
                BCC   L10C6
                CMP   #$0011
                BEQ   L1138
L10C2           LDX   deviceNum
                BRA   L10B5
L10C6           LDA   $84
                STA   $A0
                LDA   $86
                STA   $A2
                LDA   $B8
                STA   $A4
                LDA   #^L01AA
                STA   $A6
                LDA   #$00FF
                STA   L00EC
                JSR   L0E0E
                BCC   L1136
                STZ   L0140
                BRA   L10C2
L10E7           STX   deviceNum
                JSR   getDeviceID
                BCC   L10EF
                RTS

L10EF           STA   L113D
L10F2           JSR   GetVolumeName
                BCC   L111A
                CMP   #$0011
                BNE   L10FE
L10FC           STZ   deviceNum
L10FE           LDX   deviceNum
                INX
                CPX   L00E0
                BEQ   L1138
                STX   deviceNum
                JSR   getDeviceID
                BCC   L1113
                CMP   #$0011
                BEQ   L10FC
                RTS

L1113           CMP   L113D
                BEQ   L10F2
                BRA   L10FE
L111A           LDA   $84
                STA   $A0
                LDA   $86
                STA   $A2
                LDA   $B8
                STA   $A4
                LDA   #^L01AA
                STA   $A6
                LDA   #$00FF
                STA   L00EC
                JSR   L0E0E
                BCS   L10FE
L1136           CLC
                RTS

L1138           LDA   #$0045
                SEC
                RTS

L113D           DW    $0000

L113F           STZ   L00E6
                STZ   L00E8
L1145           INC   L00E8
                LDA   L00E8
                JSL   GET_FCR
                BCS   L11CB
                JSL   DEREF
                STX   $94
                STY   $96
                LDY   #$0006
                LDA   [$94],Y
                CMP   #$0002
                BNE   L1145
                LDY   #$0008
                LDA   [$94],Y
                LDY   #$0000
                CMP   [ptrVCR],Y
                BNE   L1145
                LDY   #$0024
                LDA   [$94],Y
                CMP   #$000F
                BEQ   L1145
                LDY   #$0002
                LDA   [$94],Y
                TAX
                INY
                INY
                LDA   [$94],Y
                TAY
                JSL   DEREF
                STX   $AE
                STY   $B0
                SEP   #$20
                LDY   #$0003
L1191           INY
                LDA   [$AE],Y
                CMP   #$3A
                BNE   L1191
                LDX   #$0001
L119B           INY
                INX
                LDA   [$AE],Y
                STA   L01DC,X
                BNE   L119B
                REP   #$30
                TXA
                DEC
                DEC
                STA   L01DC
                LDX   #L01DC
                LDY   #^L01DC
                STX   $A4
                STY   $A6
                LDA   $B2
                STA   $A0
                LDA   #^L0178
                STA   $A2
                JSR   L0E0E
                BCS   L1145
                LDA   L00E8
                STA   L00E6
                CLC
L11CB           RTS

L11CC           LDA   $42
                AND   #$4000
                BNE   L11E5
L11D3           REP   #$30
                LDA   #$0000
                LDY   #$0001
                STA   [$84],Y
                STA   ($B2),Y
                STA   [$84]
                STA   ($B2)
                CLC
                RTS

L11E5           SEP   #$20
                LDY   #$0002
                LDA   [$3A],Y
                BEQ   L11D3
                CMP   #$3A
                BNE   L1236
L11F2           INY
                LDA   [$3A],Y
                BEQ   L1204
                CMP   #$3A
                BEQ   L1204
                DEY
                STA   [$84],Y
                INY
                CPY   #$0017
                BCC   L11F2
L1204           DEY
                LDA   #$00
                STA   [$84],Y
                REP   #$21
                TYA
                SBC   #$0001
                STA   [$84]
                INY
                LDA   [$3A],Y
                AND   #$00FF
                BNE   L1237
                LDA   #$0000
                LDY   #$0001
                STA   ($B2),Y
                STA   ($B2)
L1223           LDA   $42
                AND   #$0040
                BNE   L122E
                CLC
                RTS

L122C           SEC
                RTS

L122E           LDA   $46
                BEQ   L122C
                CMP   #$001F
                RTS

L1236           DEY
L1237           LDX   #$0002
                STX   L1272
                SEP   #$20
L123F           INY
                LDA   [$3A],Y
                BEQ   L1260
                CMP   #$3A
                BEQ   L126E
                TYX
                LDY   L1272
                CMP   #$2C
                BNE   L1252
                LDA   #$3A
L1252           STA   ($B2),Y
                INY
                CPY   #$0022
                BCS   L126E
                STY   L1272
                TXY
                BRA   L123F
L1260           LDY   L1272
                STA   ($B2),Y
                REP   #$20
                TYA
                DEC
                DEC
                STA   ($B2)
                BRA   L1223
L126E           REP   #$20
                SEC
                RTS

L1272           DW    $0000

L1274           LDX   $98
                STX   bufferPtr
                LDX   $9A
                STX   bufferPtr+2
                STZ   L1459
                STZ   L145B
                STZ   L1455
                STZ   L1457
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
                PLY
                PLA
                JSR   TS2BLOCK
                PHP
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                PLY
                PLA
                PLP
                BCC   L12A8
                RTS

L12A8           LDA   L0210
                BEQ   L1311
                AND   #$0017
                BEQ   L12B5
                BRL   L13DF
L12B5           LDY   #$000C
                INC   L145B
L12BB           LDA   [bufferPtr],Y
                BEQ   L12F5
                INC   L1459
                INY
                INY
                CPY   #$0100
                BNE   L12BB
                LDA   #$0002
                STA   callNum
                LDY   #$0001
                LDA   [$98],Y
                BEQ   L12F5
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
                PLY
                PLA
                JSR   TS2BLOCK
                PHP
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                PLY
                PLA
                PLP
                BCC   L12B5
                RTS

L12F5           LDA   L1459
                XBA
                TAX
                AND   #$FF00
                STA   L1455
                TXA
                AND   #$00FF
                STA   L1457
                LDA   L1459
                CLC
                ADC   L145B
                BRL   L144D
L1311           LDX   #$000C
                LDY   #$000C
                INC   L145B
L131A           LDA   [bufferPtr],Y
                BEQ   L1322
                TYX
                INC   L1459
L1322           INY
                INY
                CPY   #$0100
                BNE   L131A
                LDA   #$0002
                STA   callNum
                LDY   #$0001
                LDA   [$98],Y
                BEQ   L1355
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
                PLY
                PLA
                JSR   TS2BLOCK
                PHP
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                PLY
                PLA
                PLP
                BCC   L1311
                RTS

L1355           TXA
                SEC
                SBC   #$000C
                LSR
                XBA
                STA   L1455
                LDA   bufferPtr
                ADC   #$0100
                STA   bufferPtr
                BCC   L136A
                INC   bufferPtr+2
L136A           LDA   #$0002
                STA   callNum
                TXY
                LDA   [$98],Y
                STA   L012E
                BNE   L137C
                LDY   #$FFFF
                BRA   L13A8
L137C           PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
                PLY
                PLA
                JSR   TS2BLOCK
                PHP
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                PLY
                PLA
                PLP
                BCC   L139C
                RTS

L139C           LDY   #$00FF
                SEP   #$20
L13A1           LDA   [bufferPtr],Y
                BNE   L13A8
                DEY
                BPL   L13A1
L13A8           REP   #$21
                INY
                TYX
                LDY   #$0005
                LDA   [$98],Y
                XBA
                TAY
                AND   #$FF00
                ADC   L1455
                STA   L1455
                TYA
                AND   #$00FF
                ADC   L1457
                STA   L1457
                TXA
                ADC   L1455
                STA   L1455
                LDA   L1457
                ADC   #$0000
                STA   L1457
                LDA   L1459
                CLC
                ADC   L145B
                BRA   L144D
L13DF           LDA   bufferPtr
                CLC
                ADC   #$0100
                STA   bufferPtr
                LDA   bufferPtr+2
                ADC   #$0000
                STA   bufferPtr+2
                LDA   #$0002
                STA   callNum
                LDY   #$000C
                LDA   [$98],Y
                STA   L012E
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                STA   [ptrVCR],Y
                PLY
                PLA
                JSR   TS2BLOCK
                PHP
                PHA
                PHY
                LDY   #$0008
                LDA   [ptrVCR],Y
                DEC
                STA   [ptrVCR],Y
                PLY
                PLA
                PLP
                BCC   L141B
                RTS

L141B           LDA   L0210
                LDY   #$0000
                AND   #$007C
                BEQ   L1429
                LDY   #$0002
L1429           LDA   [bufferPtr],Y
                STA   L1455
                LDA   #$0000
                STA   L1457
                LDA   L0210
                AND   #$007B
                BEQ   L144B
                CMP   #$0001
                BNE   L1446
                LDA   #$0C00
                BRA   L144D
L1446           LDA   #$0801
                BRA   L144D
L144B           LDA   [bufferPtr]
L144D           LDX   L1455
                LDY   L1457
                CLC
                RTS

L1455           DW    $0000
L1457           DW    $0000
L1459           DW    $0000
L145B           DW    $0000

L145D           LDA   $8C
                CLC
                ADC   #$0100
                STA   bufferPtr
                LDA   $8E
                ADC   #$0000
                STA   bufferPtr+2
                LDX   #$000E
                STX   L14A5
L1472           LDY   #$0001
                LDA   [bufferPtr],Y
                BEQ   L1499
                PHA
                LDA   bufferPtr
                ADC   #$0100
                STA   bufferPtr
                LDA   bufferPtr+2
                ADC   #$0000
                STA   bufferPtr+2
                LDA   #$0002
                STA   callNum
                PLA
                JSR   TS2BLOCK
                BCC   L1494
                RTS

L1494           DEC   L14A5
                BNE   L1472
L1499           LDA   #$000F
                SEC
                SBC   L14A5
                STA   L00EA
                CLC
                RTS

L14A5           DW    $0000

L14A7           LDA   $B2
                STA   $A0
                LDA   #^L0178
                STA   $A2
                LDA   #$0000
L14B3           LDX   #$0000
L14B6           STA   L00EE
                STX   L00F0
                JSR   L0DBB
                BCC   L14C2
                RTS

L14C2           JSR   L0DE1
                BEQ   L1515
                CMP   #$00FF
                BEQ   L1503
                LDA   $A8
                ADC   #$0001
                STA   $A4
                LDA   $AA
                ADC   #$0000
                STA   $A6
                LDY   #$001F
                LDA   [$A4]
                PHA
                SEP   #$20
L14E2           LDA   [$A4],Y
                CMP   #$A0
                BNE   L14F0
                DEY
                BPL   L14E2
                PLX
                REP   #$30
                SEC
                RTS

                MX    %10
L14F0           DEY
                LDA   #$7F
                STA   L00EC
                REP   #$20
                TYA
                STA   [$A4]
                JSR   L0E0E
                PLA
                STA   [$A4]
                BCC   L151D
L1503           LDX   L00F0
                LDA   L00EE
                INX
                CPX   #$0007
                BCC   L14B6
                INC
                CMP   L00EA
                BCC   L14B3
L1515           LDA   #$FFFF
                STA   L00F0
                CLC
                RTS

L151D           CLC
                RTS

L151F           LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
                ORA   $B4
                BEQ   L1540
                LDA   [$B4]
                CMP   #$0006
                BCS   L1536
                SEC
                RTS

L1536           LDA   #$0002
                TAY
                STA   [$B4],Y
                INY
                INY
                STA   [$B4],Y
L1540           CLC
                RTS

*
* FSTSPECIFIC: OPTION 1
*

L1542           LDA   fgNBPARAMS
                CMP   #$0003
                BEQ   L154F
                LDA   #$0004
                SEC
                RTS

L154F           LDY   #$0006
                LDA   [ptrParamBlock],Y
                CMP   #$0002
                BCC   L155E
                LDA   #$0053
                SEC
                RTS

L155E           STA   L0138
                LDA   #$0000
                CLC
                RTS

*
* FSTSPECIFIC: OPTION 2
*

L1566           LDA   fgNBPARAMS
                CMP   #$0003
                BEQ   L1573
                LDA   #$0004
                SEC
                RTS

L1573           LDA   L0138
                LDY   #$0006
                STA   [ptrParamBlock],Y
                LDA   #$0000
                CLC
                RTS

*
*
*

L1580           LDA   #$0001
                STA   L0220
                LDY   #$0002
                LDA   [$A8],Y
                TAX
                AND   #$0080
                BNE   L1596
                LDA   #$00C3
                BRA   L1599
L1596           LDA   #$0001
L1599           STA   L0214
                TXA
                AND   #$007F
                STA   L0210
                LDX   #$0008
L15A6           LSR
                BCS   L15AC
                DEX
                BNE   L15A6
L15AC           TXA
                ASL
                TAX
                LDA   L15F3,X
                STA   L0212
                LDA   L0210
                AND   #$0017
                BEQ   L15DB
                LDY   #$0000
                LDA   [$A8],Y
                JSR   L1274
                BCC   L15C8
                RTS

L15C8           STA   L0216
                STX   L0218
                STY   L021A
                LDY   #$0021
                LDA   [$A8],Y
                STA   L021C
                CLC
                RTS

L15DB           LDY   #$0000
                LDA   [$A8],Y
                JSR   L1274
                BCC   L15E6
                RTS

L15E6           STA   L021C
                STX   L0218
                STY   L021A
                STZ   L0216
                RTS

L15F3           DW    $0004
                DW    $000F
                DW    $0000
                DW    $0000
                DW    $00FE
                DW    $0000
                DW    $0006
                DW    $00FC
                DW    $00FA
                DW    $00EE

L1607           LDY   #$000C
                LDA   [ptrVCR],Y
                STA   deviceNum
                STZ   L1831
                LDY   #$0024
                LDA   [ptrFCR],Y
                CMP   #$000F
                BEQ   L1620
                LDA   #$804A
                SEC
                RTS

L1620           LDA   fgCLASS
                BEQ   L1644
                LDY   #$0006
                LDA   [ptrParamBlock],Y
                STA   L1833
                LDY   #$0008
                LDA   [ptrParamBlock],Y
                STA   L1835
                LDY   #$000A
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
                BRA   L166A
L1644           LDY   #$0004
                LDA   [ptrParamBlock],Y
                STA   L1833
                LDY   #$0006
                LDA   [ptrParamBlock],Y
                STA   L1835
                LDY   #$0028
                LDA   [ptrFCR],Y
                DEC
                STA   L00EA
                LDY   #$0008
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
L166A           LDA   L1833
                TAX
                ORA   L1835
                BEQ   L1680
                TXA
                BEQ   L1693
                DEC
                BEQ   L16AA
                DEC
                BEQ   L16C5
                LDA   #$0053
                RTS

L1680           LDY   #$0030
                LDA   [ptrFCR],Y
                STA   L021E
                LDA   #$0000
                LDY   #$002C
                STA   [ptrFCR],Y
                BRL   L17E3
L1693           LDY   #$0030
                LDA   [ptrFCR],Y
                CMP   L1835
                BCS   L16A2
                LDA   #$0061
                SEC
                RTS

L16A2           LDA   L1835
                STA   L021E
                BRA   L16E7
L16AA           LDY   #$002C
                LDA   [ptrFCR],Y
                CLC
                ADC   L1835
                STA   L021E
                LDY   #$0030
                LDA   [ptrFCR],Y
                CMP   L021E
                BCS   L16E7
                LDA   #$0061
                SEC
                RTS

L16C5           LDY   #$002C
                LDA   [ptrFCR],Y
                DEC
                CMP   L1835
                BCC   L16E2
                INC
                SEC
                SBC   L1835
                STA   L021E
                LDY   #$0030
                LDA   [ptrFCR],Y
                CMP   L021E
                BCS   L16E7
L16E2           LDA   #$0061
                SEC
                RTS

L16E7           LDA   L021E
                LDY   #$002C
                STA   [ptrFCR],Y
                STA   L1837
                LDY   #$000E
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $8C
                STY   $8E
                LDA   #$0000
L1708           LDX   #$0000
L170B           STA   L00EE
                STX   L00F0
                JSR   L0DBB
                BCC   L1717
                RTS

L1717           JSR   L0DE1
                BNE   L1721
                LDA   #$8061
                SEC
                RTS

L1721           CMP   #$00FF
                BEQ   L172B
                DEC   L1837
                BEQ   L173D
L172B           LDX   L00F0
                LDA   L00EE
                INX
                CPX   #$0007
                BCC   L170B
                INC
                CMP   L00EA
                BCC   L1708
L173D           LDY   #$0002
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                TAY
                JSL   DEREF
                STX   $84
                STY   $86
                LDY   #$000C
                LDA   [ptrVCR],Y
                STA   L00E0
                JSR   L10B0
                BCC   L1761
                LDA   #$0045
                RTS

L1761           LDY   #$000C
                LDA   [ptrVCR],Y
                CMP   deviceNum
                BEQ   L1771
                LDY   #$000C
                LDA   deviceNum
                STA   [ptrVCR],Y
L1771           JSR   L1580
                BCC   L177A
                LDA   #$0051
                RTS

L177A           SEP   #$20
                LDY   #$0020
L177F           LDA   [$A8],Y
                CMP   #$A0
                BNE   L1788
                DEY
                BNE   L177F
L1788           REP   #$21
                INY
                STY   L182D
                TYA
                SBC   #$0002
                STA   L1839
                INC
                INC
                INC
                TAY
                LDA   [$B4]
                STA   L183B
                CPY   L183B
                BCC   L17A9
                LDA   #$004F
                STA   L1831
L17A9           LDY   #$0002
                LDA   #$0003
                STA   L182F
                SEP   #$20
L17B4           INY
                CPY   L182D
                BEQ   L17D9
                LDX   L182F
                INX
                CPX   L183B
                BEQ   L17D9
                STX   L182F
                LDA   [$A8],Y
                TYX
                LDY   L182F
                AND   #$7F
                CMP   #$3A
                BNE   L17D4
                LDA   #$2C
L17D4           STA   [$B4],Y
                TXY
                BRA   L17B4
L17D9           REP   #$21
                LDA   L1839
                LDY   #$0002
                STA   [$B4],Y
L17E3           LDA   fgCLASS
                BNE   L1800
                LDA   #$0000
                LDY   #$0002
                STA   [ptrParamBlock],Y
                LDA   #$0001
                STA   fgNBPARAMS
                LDA   #L0D1E
                STA   $C2
                JSR   L0CB2
                BRA   L1826
L1800           LDA   #$0000
                LDY   #$0004
                STA   [ptrParamBlock],Y
                LDA   #L0D4E
                STA   $C2
                JSR   L0CB2
                LDA   fgNBPARAMS
                CMP   #$000F
                BCC   L1826
                LDY   #$0032
                JSR   L151F
                BCC   L1826
                LDA   #$004F
                STA   L1831
L1826           LDA   L1831
                CMP   #$0001
                RTS

L182D           DW    $0000
L182F           DW    $0000
L1831           DW    $0000
L1833           DW    $0000
L1835           DW    $0000
L1837           DW    $0000
L1839           DW    $0000
L183B           DW    $0000

L183D           LDY   #$000C
                LDA   [ptrFCR],Y
                TAX
                INY
                INY
                LDA   [ptrFCR],Y
                TAY
                JSL   DEREF
                STX   $BA
                STY   $BC
                LDY   #$0012
                LDA   [ptrFCR],Y
                STA   $BE
                LDA   L00FE
                DEC
                BNE   L18A5
                LDA   [$BA]
                AND   #$00FF
                STA   $C0
                LDY   L0116
                BEQ   L18E5
                LDY   #$0000
                SEP   #$30
L186E           PHY
                REP   #$30
                LDY   #$0026
                LDA   [ptrFCR],Y
                SEP   #$30
                BNE   L1883
                PLY
                LDA   [$AE],Y
                STA   [$B4],Y
                AND   #$7F
                BRA   L1888
L1883           PLY
                LDA   [$AE],Y
                STA   [$B4],Y
L1888           INC   L0118
                AND   $BE
                CMP   $C0
                BEQ   L18A0
                REP   #$30
                INY
                CPY   L0116
                SEP   #$30
                BCC   L186E
                REP   #$30
                CLC
                BRA   L18E3
L18A0           REP   #$30
                SEC
                BRA   L18E3
L18A5           LDY   #$0000
                SEP   #$20
L18AA           PHY
                REP   #$20
                LDY   #$0026
                LDA   [ptrFCR],Y
                SEP   #$20
                BNE   L18BF
                PLY
                LDA   [$AE],Y
                STA   [$B4],Y
                AND   #$7F
                BRA   L18C4
L18BF           PLY
                LDA   [$AE],Y
                STA   [$B4],Y
L18C4           INC   L0118
                AND   $BE
                TYX
                LDY   L00FE
L18CD           DEY
                BMI   L18D6
                CMP   [$BA],Y
                BNE   L18CD
                BRA   L18E2
L18D6           TXY
                INY
                CPY   L0116
                BNE   L18AA
                REP   #$20
                CLC
                BRA   L18E3
L18E2           SEC
L18E3           REP   #$30
L18E5           RTS

L18E6           STZ   L1D8E
                STZ   L0128
                STZ   L012A
                STZ   L0118
                LDY   #$0026
                LDA   [ptrFCR],Y
                BEQ   L1913
                AND   #$FFFC
                BNE   L1906
                LDA   #$0002
                STA   L00FC
                BRA   L1916
L1906           AND   #$FFEB
                BNE   L1913
                LDA   #$0004
                STA   L00FC
                BRA   L1916
L1913           STZ   L00FC
L1916           LDY   #$0012
                LDA   [ptrFCR],Y
                STA   $BE
                LDY   #$0010
                LDA   [ptrFCR],Y
                STA   L00FE
                LDY   #$001A
                LDA   [ptrFCR],Y
                STA   L0218
                INY
                INY
                LDA   [ptrFCR],Y
                STA   L021A
                LDY   #$0020
                LDA   [ptrFCR],Y
                STA   L011A
                INY
                INY
                LDA   [ptrFCR],Y
                STA   L011A+2
                LDY   #$0016
                LDA   [ptrFCR],Y
                TAX
                INY
                INY
                LDA   [ptrFCR],Y
                TAY
                JSL   DEREF
                STX   $98
                STY   $9A
                LDA   fgCLASS
                BEQ   L1979
                LDY   #$0008
                LDA   [ptrParamBlock],Y
                STA   L011E
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   L011E+2
                LDY   #$0004
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
                BRA   L1995
L1979           LDY   #$0006
                LDA   [ptrParamBlock],Y
                STA   L011E
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   L011E+2
                LDY   #$0002
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
L1995           LDA   L011A
                CMP   L0218
                BNE   L19AE
                LDA   L011A+2
                CMP   L021A
                BNE   L19AE
                LDA   #$004C
                STA   L1D8E
                BRL   L1D6E
L19AE           LDA   L011A
                CLC
                ADC   L011E
                STA   L0104
                LDA   L011A+2
                ADC   L011E+2
                BCS   L19D2
                STA   L0106
                CMP   L021A
                BCC   L19DE
                BNE   L19D2
                LDA   L0218
                CMP   L0104
                BCS   L19DE
L19D2           LDA   L021A
                STA   L0106
                LDA   L0218
                STA   L0104
L19DE           LDA   L0104
                SEC
                SBC   L011A
                STA   L0110
                LDA   L0106
                SBC   L011A+2
                STA   L0112
                LDA   L011A
                CLC
                ADC   L00FC
                STA   L0108
                LDA   L011A+2
                ADC   #$0000
                STA   L010A
                LDY   #$0024
                LDA   [ptrFCR],Y
                CMP   #$000F
                BNE   L1A11
                BRL   L1C91
L1A11           LDY   #$000C
                LDA   [ptrVCR],Y
                STA   deviceNum
                LDA   #$0002
                STA   callNum
L1A1D           LDA   L0108
                XBA
                AND   #$00FF
                STA   L0122
                LDA   L010A
                XBA
                TAX
                AND   #$FF00
                ORA   L0122
                STA   L0122
                TXA
                AND   #$00FF
                STA   L0124
L1A3C           LDA   $98
                STA   bufferPtr
                LDA   $9A
                STA   bufferPtr+2
                LDA   L0122
                LDY   #$0005
                SEC
                SBC   [$98],Y
                BCC   L1A65
                CMP   #$007A
                BCC   L1A72
                LDY   #$0001
                LDA   [$98],Y
                BNE   L1A60
                LDA   #$0051
                SEC
                RTS

L1A60           JSR   TS2BLOCK
                BRA   L1A3C
L1A65           LDY   #$0000
                LDA   [$A8],Y
                JSR   TS2BLOCK
                BCC   L1A70
                RTS

L1A70           BRA   L1A3C
L1A72           ASL
                ADC   #$000C
                TAY
                LDA   [$98],Y
                BNE   L1A7E
                BRL   L1C12
L1A7E           STA   L010E
                LDY   #$0030
                CMP   [ptrFCR],Y
                BEQ   L1AD6
                LDA   $BE
                BNE   L1AB6
                LDA   L0108
                AND   #$00FF
                BNE   L1AB6
                LDA   L0110
                CMP   #$0101
                BCC   L1AB6
                LDA   $B4
                STA   bufferPtr
                LDA   $B6
                STA   bufferPtr+2
                LDA   L010E
                JSR   TS2BLOCK
                BCC   L1AAD
                RTS

L1AAD           LDA   #$0100
                STA   L0118
                BRL   L1B9F
L1AB6           LDA   $98
                CLC
                ADC   #$0100
                STA   bufferPtr
                LDA   $9A
                ADC   #$0000
                STA   bufferPtr+2
                LDA   L010E
                JSR   TS2BLOCK
                BCC   L1ACE
                RTS

L1ACE           LDY   #$0030
                LDA   L010E
                STA   [ptrFCR],Y
L1AD6           LDA   L0108
                AND   #$00FF
                STA   L0114
                LDY   L0112
                BNE   L1AED
                CLC
                ADC   L0110
                CMP   #$0101
                BCC   L1AF0
L1AED           LDA   #$0100
L1AF0           STA   L0126
                SEC
                SBC   L0114
                STA   L0116
                LDA   L0114
                CLC
                ADC   #$0100
                ADC   $98
                STA   $AE
                LDA   $9A
                ADC   #$0000
                STA   $B0
                LDX   $BE
                BNE   L1B75
                LDA   L0116
                CMP   #$0064
                BCS   L1B51
                LSR
                TAX
                BCC   L1B30
                SEP   #$20
                LDA   [$AE]
                STA   [$B4]
                REP   #$21
                INC   $AE
                BNE   L1B2A
                INC   $B0
L1B2A           INC   $B4
                BNE   L1B30
                INC   $B6
L1B30           TXA
                DEC
                BMI   L1B3E
                ASL
                TAY
L1B36           LDA   [$AE],Y
                STA   [$B4],Y
                DEY
                DEY
                BPL   L1B36
L1B3E           LDA   L0116
                STA   L0118
                LSR
                BCC   L1B9F
                LDA   $B4
                BNE   L1B4D
                DEC   $B6
L1B4D           DEC   $B4
                BRA   L1B9F
L1B51           PEI   $B0
                PEI   $AE
                PEI   $B6
                PEI   $B4
                PEA   $0000
                LDA   L0116
                PHA
                PEA   $0805
                JSL   MOVE_INFO
                BCC   L1B6D
                LDA   #$8000
                RTS

L1B6D           LDA   L0116
                STA   L0118
                BRA   L1B9F
L1B75           JSR   L183D
                BCC   L1B9F
                LDA   L0118
                CLC
                ADC   L0128
                STA   L0128
                BCC   L1B89
                INC   L012A
L1B89           CLC
                LDA   L0128
                ADC   L00FC
                STA   L0128
                LDA   L012A
                ADC   #$0000
                STA   L012A
                BRL   L1CEF
L1B9F           LDA   L0118
                CLC
                ADC   L0128
                STA   L0128
                BCC   L1BAE
                INC   L012A
L1BAE           LDA   L0110
                SEC
                SBC   L0118
                STA   L0110
                BCS   L1BBD
                DEC   L0112
L1BBD           LDA   L0110
                ORA   L0112
                BNE   L1BDB
                CLC
                LDA   L0128
                ADC   L00FC
                STA   L0128
                LDA   L012A
                ADC   #$0000
                STA   L012A
                BRL   L1CEF
L1BDB           LDA   L0110
                CLC
                ADC   L00FC
                STA   L1BF3
                LDA   L0112
                ADC   #$0000
                ORA   L1BF3
                BNE   L1BF5
                BRL   L1CEF

L1BF3           DW    $0000

L1BF5           LDA   L0118
                TAX
                CLC
                ADC   L0108
                STA   L0108
                BCC   L1C05
                INC   L010A
L1C05           TXA
                CLC
                ADC   $B4
                STA   $B4
                BCC   L1C0F
                INC   $B6
L1C0F           BRL   L1A1D
L1C12           LDA   $BE
                BEQ   L1C40
                LDY   L00FE
                SEP   #$20
L1C1B           DEY
                BMI   L1C40
                LDA   [$BA],Y
                BNE   L1C1B
                STA   [$B4]
                REP   #$31
                INC   L0128
                BNE   L1C2E
                INC   L012A
L1C2E           LDA   L0110
                SEC
                SBC   #$0001
                STA   L0110
                BCS   L1C3D
                DEC   L0112
L1C3D           BRL   L1CEF
L1C40           REP   #$31
                LDA   L0108
                AND   #$00FF
                STA   L0114
                LDY   L0112
                BNE   L1C59
                CLC
                ADC   L0110
                CMP   #$0101
                BCC   L1C5C
L1C59           LDA   #$0100
L1C5C           STA   L0126
                SEC
                SBC   L0114
                STA   L0116
                LSR
                TAX
                LDA   #$0000
                BCC   L1C79
                SEP   #$20
                STA   [$B4]
                REP   #$21
                INC   $B4
                BNE   L1C79
                INC   $B6
L1C79           TXA
                DEC
                BMI   L1C88
                ASL
                TAY
                LDA   #$0000
L1C82           STA   [$B4],Y
                DEY
                DEY
                BPL   L1C82
L1C88           LDA   L0116
                STA   L0118
                BRL   L1B9F
L1C91           LDA   $BE
                BEQ   L1CBB
                LDA   L0110
                STA   L0116
                STZ   L0118
                LDA   L011A
                CLC
                ADC   $98
                STA   $AE
                LDA   L011A+2
                ADC   $9A
                STA   $B0
                JSR   L183D
                LDA   L0118
                STA   L0128
                STZ   L012A
                BRA   L1CEF
L1CBB           LDA   L011A
                CLC
                ADC   $98
                TAX
                LDA   L011A+2
                ADC   $9A
                PHA
                PHX
                PEI   $B6
                PEI   $B4
                PEA   $0000
                LDA   L0110
                PHA
                PEA   $0805
                JSL   MOVE_INFO
                BCC   L1CE1
                LDA   #$8000
                RTS

L1CE1           LDA   L0110
                STA   L0128
                LDA   L0112
                STA   L012A
                BRA   L1D5A
L1CEF           SEC
                LDA   L0128
                SBC   L00FC
                STA   L0128
                LDA   L012A
                SBC   #$0000
                STA   L012A
                LDY   #$0026
                LDA   [ptrFCR],Y
                BNE   L1D5A
                LDA   L0138
                BEQ   L1D5A
                LDA   fgCLASS
                BEQ   L1D22
                LDY   #$0004
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
                BRA   L1D2F
L1D22           LDY   #$0002
                LDA   [ptrParamBlock],Y
                STA   $B4
                INY
                INY
                LDA   [ptrParamBlock],Y
                STA   $B6
L1D2F           LDY   L012A
                INY
                LDX   L0128
                BNE   L1D3F
                DEY
                TXA
                ORA   L012A
                BEQ   L1D58
L1D3F           STY   $C4
                LDY   #$0000
                SEP   #$20
L1D46           LDA   [$B4],Y
                AND   #$7F
                STA   [$B4],Y
                INY
                BNE   L1D51
                INC   $B6
L1D51           DEX
                BNE   L1D46
                DEC   $C4
                BNE   L1D46
L1D58           REP   #$20
L1D5A           LDY   #$0020
                LDA   [ptrFCR],Y
                CLC
                ADC   L0128
                STA   [ptrFCR],Y
                INY
                INY
                LDA   [ptrFCR],Y
                ADC   L012A
                STA   [ptrFCR],Y
L1D6E           LDA   fgCLASS
                BNE   L1D78
                LDY   #$000A
                BRA   L1D7B
L1D78           LDY   #$000C
L1D7B           LDA   L0128
                STA   [ptrParamBlock],Y
                LDA   L012A
                INY
                INY
                STA   [ptrParamBlock],Y
                LDA   L1D8E
                CMP   #$0001
                RTS

L1D8E           DW    $0000

L1D90           LDA   fgCLASS
                BEQ   L1DCB

                LDA   fgNBPARAMS
                CMP   #$0004
                BCC   L1DCB
                CLC
                LDY   #$0008
                LDA   [ptrParamBlock],Y
                AND   #$0002
                BEQ   L1DAD
                LDA   #$004E
                BRA   L1DCA
L1DAD           LDA   fgNBPARAMS
                CMP   #$0005
                BCC   L1DCB
                CLC
                LDY   #$000A
                LDA   [ptrParamBlock],Y
                BEQ   L1DCB
                CMP   #$0001
                BEQ   L1DC7
                LDA   #$0053
                BRA   L1DCA
L1DC7           LDA   #$0063
L1DCA           SEC
L1DCB           RTS

L1DCC           STZ   L013A
                JSR   L0B7E
                BCC   L1DD7
                BRL   L20FA
L1DD7           LDA   ($B2)
                BEQ   L1DDE
                BRL   L1ED4
L1DDE           JSR   L1D90
                BCC   L1DE6
                BRL   L20FA
L1DE6           LDA   L01AA
                INC
                STA   L01DC
                SEP   #$20
                LDA   #$3A
                LDY   #$0002
                STA   L01DC,Y
L1DF7           LDA   L01AA,Y
                CMP   #$01
                INY
                STA   L01DC,Y
                BCS   L1DF7
                REP   #$20
                LDX   #L01DC
                LDY   #^L01DC
                LDA   #$0032
                JSL   ALLOC_FCR
                BCC   L1E16
                BRL   L20FA
L1E16           JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2
                LDA   #$4000
                TSB   L013A
                LDY   #$0006
                LDA   #$0002
                STA   [ptrFCR],Y
                LDY   #$0000
                LDA   [ptrVCR],Y
                LDY   #$0008
                STA   [ptrFCR],Y
                LDY   #$000E
                LDA   [ptrVCR],Y
                TAX
                INY
                INY
                LDA   [ptrVCR],Y
                LDY   #$0018
                STA   [ptrFCR],Y
                TXA
                DEY
                DEY
                STA   [ptrFCR],Y
                LDY   #$0020
                LDA   #$0000
                STA   [ptrFCR],Y
                INY
                INY
                STA   [ptrFCR],Y
                LDY   #$001C
                STA   [ptrFCR],Y
                LDY   #$001E
                STA   [ptrFCR],Y
                INY
                INY
                STA   [ptrFCR],Y
                LDY   #$002C
                STA   [ptrFCR],Y
                LDY   #$002A
                STA   [ptrFCR],Y
                DEY
                DEY
                STA   [ptrFCR],Y
                XBA
                LDY   #$001A
                STA   [ptrFCR],Y
                LDY   #$0024
                LDA   #$000F
                STA   [ptrFCR],Y
                LDY   #$0014
                LDA   #$00C3
                STA   [ptrFCR],Y
                STZ   L020E
                LDA   #$0000
L1E8E           LDX   #$0000
L1E91           STA   L00EE
                STX   L00F0
                JSR   L0DBB
                BCC   L1E9F
                BRL   L20FA
L1E9F           JSR   L0DE1
                BEQ   L1EBE
                CMP   #$00FF
                BEQ   L1EAC
                INC   L020E
L1EAC           LDX   L00F0
                LDA   L00EE
                INX
                CPX   #$0007
                BCC   L1E91
                INC
                CMP   L00EA
                BCC   L1E8E
L1EBE           LDA   L020E
                LDY   #$0030
                STA   [ptrFCR],Y
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                BNE   L1ECF
                INC
L1ECF           STA   [ptrVCR],Y
                BRL   L2033
L1ED4           JSR   L14A7
                BCC   L1EDF
                LDA   #$0051
                BRL   L20FA
L1EDF           LDA   L00F0
                BPL   L1EEA
                LDA   #$0046
                BRL   L20FA
L1EEA           JSR   L1D90
                BCC   L1EF2
                BRL   L20FA
L1EF2           LDA   L01AA
                INC
                STA   L01DC
                SEP   #$20
                LDA   #$3A
                LDY   #$0002
                STA   L01DC,Y
L1F03           LDA   L01AA,Y
                CMP   #$01
                INY
                STA   L01DC,Y
                BCS   L1F03
                REP   #$20
                LDX   #L01DC
                LDY   #^L01DC
                LDA   #$0032
                JSL   ALLOC_FCR
                BCC   L1F25
                LDA   #$0054
                BRL   L20FA
L1F25           JSL   DEREF
                STX   ptrFCR
                STY   ptrFCR+2
                LDA   #$4000
                TSB   L013A
                LDA   #$0200
                JSL   ALLOC_SEG
                BCC   L1F42
                LDA   #$0054
                BRL   L20FA
L1F42           TYA
                LDY   #$0018
                STA   [ptrFCR],Y
                TXA
                DEY
                DEY
                STA   [ptrFCR],Y
                LDY   #$0008
                LDA   [ptrVCR],Y
                INC
                BNE   L1F56
                INC
L1F56           STA   [ptrVCR],Y
                LDA   #$0000
                LDY   #$0020
                STA   [ptrFCR],Y
                INY
                INY
                STA   [ptrFCR],Y
                LDY   #$002E
                LDA   L00F0
                STA   [ptrFCR],Y
                LDY   #$002C
                LDA   L00EE
                STA   [ptrFCR],Y
                LDY   #$0006
                LDA   #$0002
                STA   [ptrFCR],Y
                LDY   #$0000
                LDA   [ptrVCR],Y
                LDY   #$0008
                STA   [ptrFCR],Y
                LDY   #$0002
                LDA   [$A8],Y
                AND   #$007F
                LDY   #$0026
                STA   [ptrFCR],Y
                BRA   L1FC3
                STZ   L218A
                LDY   #$0000
L1F9B           LDA   L218A
                LSR
                TAX
                LDA   L214C,X
                STA   L2188
                LDX   #$0010
L1FA9           ASL   L2188
                BCC   L1FB2
                LDA   [$94],Y
                STA   [ptrFCR],Y
L1FB2           INY
                INY
                DEX
                BNE   L1FA9
                LDA   L218A
                BNE   L1FC1
                INC   L218A
                BRA   L1F9B
L1FC1           BRA   L2033
L1FC3           LDY   #$0016
                LDA   [ptrFCR],Y
                TAX
                INY
                INY
                LDA   [ptrFCR],Y
                TAY
                JSL   DEREF
                STX   bufferPtr
                STX   $98
                STY   bufferPtr+2
                STY   $9A
                LDA   #$0002
                STA   callNum
                LDY   #$002E
                LDA   [ptrFCR],Y
                TAX
                LDY   #$002C
                LDA   [ptrFCR],Y
                JSR   L0DBB
                JSR   L1580
                BCC   L1FF5
                BRL   L20FA
L1FF5           LDY   #$0030
                LDA   L012E
                STA   [ptrFCR],Y
                LDY   #$0014
                LDA   L0214
                STA   [ptrFCR],Y
                LDY   #$001A
                LDA   L0218
                STA   [ptrFCR],Y
                LDA   L021A
                INY
                INY
                STA   [ptrFCR],Y
                LDY   #$001E
                LDA   L0216
                STA   [ptrFCR],Y
                LDY   #$0024
                LDA   L0212
                STA   [ptrFCR],Y
                LDY   #$0028
                LDA   L021C
                STA   [ptrFCR],Y
                LDA   #$0000
                INY
                INY
                STA   [ptrFCR],Y
L2033           LDA   fgCLASS
                BNE   L203B
                BRL   L20C3
L203B           LDA   fgNBPARAMS
                TAX
                LDY   #$FFFE
L2042           INY
                INY
                LDA   L2150,Y
                ASL
                BCC   L204D
                DEX
                BMI   L205B
L204D           ASL
                BCS   L2042
                LSR
                LSR
                PHY
                TAY
                LDA   [ptrFCR],Y
                PLY
                STA   [ptrParamBlock],Y
                BRA   L2042
L205B           LDX   fgNBPARAMS
                CPX   #$0008
                BCC   L20CD
                LDY   #$0012
                LDA   #$0000
                STA   [ptrParamBlock],Y
                CPX   #$0009
                BCC   L20CD
                LDY   #$0024
                LDA   [ptrFCR],Y
                CMP   #$000F
                BEQ   L207D
                LDA   #$0001
L207D           LDY   #$0014
                STA   [ptrParamBlock],Y
                CPX   #$000A
                BCC   L20CD
                LDA   #$0000
                LDY   #$0016
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
                CPX   #$000B
                BCC   L20CD
                LDY   #$001E
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
                CPX   #$000C
                BCC   L20CD
                LDY   #$0026
                JSR   L151F
                BCC   L20CD
                LDA   #$004F
                BRA   L20FA
L20C3           LDY   #$0000
                LDA   [ptrFCR],Y
                LDY   #$0000
                STA   [ptrParamBlock],Y
L20CD           LDA   fgNBPARAMS
                CMP   #$000E
                BCC   L20F5
                LDY   #$0032
                LDA   #$0000
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
                LDA   fgNBPARAMS
                CMP   #$000F
                BCC   L20F5
                LDY   #$0036
                LDA   #$0000
                STA   [ptrParamBlock],Y
                INY
                INY
                STA   [ptrParamBlock],Y
L20F5           CLC
                LDA   #$0000
                RTS

L20FA           PHA
                BIT   L013A
                PHP
                BVC   L2135
                LDY   #$0024
                LDA   [ptrFCR],Y
                CMP   #$000F
                BEQ   L211E
                LDY   #$0016
                LDA   [ptrFCR],Y
                TAX
                INY
                INY
                ORA   [ptrFCR],Y
                BEQ   L211E
                LDA   [ptrFCR],Y
                TAY
                JSL   RELEASE_SEG
L211E           LDY   #$0000
                LDA   [ptrFCR],Y
                JSL   RELEASE_FCR
                LDY   #$0008
                LDA   [ptrVCR],Y
                BEQ   L2135
                INC
                BEQ   L2133
                DEC
                DEC
L2133           STA   [ptrVCR],Y
L2135           PLP
                BPL   L2149
                LDY   #$0008
                LDA   #$0000
                STA   [ptrVCR],Y
                LDY   #$0000
                LDA   [ptrVCR],Y
                JSL   RELEASE_VCR
L2149           PLA
                SEC
                RTS

L214C           HEX   18E4FC00
L2150           DW    $4000
                DW    $8000
                DW    $C000
                DW    $4000
                DW    $C000
                DW    $C000
                DW    $8014
                DW    $8024
                DW    $801E
                DW    $4000
                DW    $C000
                DW    $C000
                DW    $4000
                DW    $4000
                DW    $4000
                DW    $C000
                DW    $4000
                DW    $4000
                DW    $4000
                DW    $C000
                DW    $4000
                DW    $801A
                DW    $001C
                DW    $8028
                DW    $4002
                DW    $C000
                DW    $C000
                DW    $C000
L2188           DW    $0000
L218A           DW    $0000


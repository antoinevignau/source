*
* FILL
*

	org	$1000
	lst	off
	typ	BIN
	dsk	fill
	
*-------------------------------

HPOSN       =     $F411
SETHCOL     =     $F6EC

LIST        EQU   $00         ;2 BYTES, LOC IN LIST
VALUE       EQU   $02         ;FILL/WAIT ONLY
LS          EQU   $03         ;FILL ONLY
LOWY        =     $03         ;UNPACK ONLY
TAIL        =     $04         ;FILL ONLY
COLORP      EQU   $05         ;BYTE COLOR; MUST SAVE
COLORE      EQU   $08         ;EVEN COLOR REG.; MUST SAVE
COLORO      EQU   $09         ;ODD COLOR REG.; MUST SAVE
YPOS        EQU   $0A         ;Y LOC. MUST SAVE
BYTEN       EQU   $0B         ;X BYTE
BITN        EQU   $0C         ;X BIT
MASK        =     $0D         ;FILL ONLY
BYTEL       =     $0E         ;FILL ONLY
HEAD        =     $0F         ;FILL ONLY
XMIN        =     $10         ;KEEP
XMAX        =     $11         ;KEEP
YMIN        =     $12         ;KEEP
YMAX        =     $13         ;KEEP
PZ2         EQU   $14         ;INDEX TO GRAPHICS SCREEN -- 2 BYTES
XLO         =     $16         ;X COMPUTED
XHI         =     $17         ;X COMPUTED
CLPY        =     $27
HPAG        =     $e6
MAX         EQU   $1F

*-------------------------------

START       JSR   MAXREG      ;DEFAULT TO MAX REGION

            LDX   #$04
*            LDX   #$07
            JSR   SETHCOL     ;BUT USUALLY LINECOLOR 4 = BLACK

            LDY   #$00
            LDX   #$00
            LDA   #0
            JSR   HPOSN       ;START LINE AT 0,0

            LDA   #53         ;IF SO, BACKGROUND/FILL = BLACK
*            LDA   #77
            STA   CNO
            JSR   SETCR

            bit   CLREG

            JSR   GETXY       ;GET COORDS
            JSR   NEWFILLR
            RTS

* SET REGION SIZE TO MAXIMUM
MAXREG      LDA   #0
            STA   YMIN
            STA   XMIN
            LDA   #191
            STA   YMAX
            LDA   #$27
            STA   XMAX
            
            lda	#0	; HGR1
            sta	PZ2
            lda	#$20
            sta	PZ2+1
            sta HPAG
            RTS

* CLEAR REGION TO FILL COLOR

CLREG       LDA   YMIN
            STA   LOWY
CLOOP1      LDY   LOWY
            JSR   PBASER
            LDY   XMIN
CLOOP2      TYA
            AND   #3
            ORA   COLORP
            TAX
            LDA   BASECB,X
            STA   (PZ2),Y
            CPY   XMAX
            BEQ   ENDCL2
            INY
            BNE   CLOOP2      ;ALWAYS
ENDCL2      LDY   LOWY
            CPY   YMAX
            BEQ   CLDONE
            INY
            STY   LOWY
            BNE   CLOOP1      ;ALWAYS
CLDONE      RTS

*THIS IS THE GET BYTE SUBROUTINE
*FOR ALL COMMANDS AND DATA
*ALL YOU HAVE TO DO IS SEND NEXT
*VALUE IN THE ACCUMULATOR!

GETBYTE
GET1BYTE    LDY   #0
            LDA   (LIST),Y
            INC   LIST
            BNE   INCRET
            INC   LIST+1
INCRET      RTS

GETXY       lda	  #0
            STA   XHI
            lda	  #139
            STA   XLO
            lda	  #96
            STA   YPOS
            RTS

*SET COLOR IN BYTE, MASK IN ACC

SETC        STA   MASK
            EOR   VALUE
            AND   #$7F
            STA   VALUE
            TYA
            AND   #3
            ORA   COLORP
            TAX
            LDA   BASECB,X
            AND   MASK
            ORA   VALUE
            STA   (PZ2),Y
            RTS

*SET COLOR REGISTERS, GIVEN CNO

SETCR       LDA   CNO
            ASL
            TAY
            LDA   BASEC,Y
            STA   COLORE
            INY
            LDA   BASEC,Y
            STA   COLORO
            RTS

*SEARCH LEFT FOR 0 BIT

LBITS       AND   #$7F
            CMP   #$7F
            BNE   LOOKL
            LDA   #$FF
            RTS
LOOKL       LDX   #7
            ASL
LOOPL       DEX
            ASL
            BCS   LOOPL
            STX   LS
            LDA   LMASK,X
            RTS

*SEARCH RIGHT FOR 0 BIT

RBITS       AND   #$7F
            CMP   #$7F
            BNE   LOOKR
            LDA   #$FF
            RTS
LOOKR       LDX   #$FF
LOOPR       INX
            LSR
            BCS   LOOPR
            STX   BITN
            LDA   RMASK,X
            RTS

*FILL ROUTINE

NEWFILLR    JSR   SETX        ;XHI/LO TO BYTE/BIT
            JSR   BASER       ;INIT LINE
            JSR   CHECK       ;OKAY TO FILL HERE?
            BEQ   ENDFILL     ;NO, YOU DUMMY...
            JSR   ONELINE     ;FILL THIS LINE
            LDX   #0          ;START QUEUE
            STX   TAIL
            STX   HEAD
            LDY   #0
            JSR   STORE       ;UP FROM LINE
            INY
            JSR   STORE       ;DOWN FROM LINE

*GO ONE LINE AND FILL, KICKING
*TAIL OFF QUEUE

UPIT        LDX   TAIL        ;CHECK IF TAIL=HEAD
            CPX   HEAD
            BNE   UPCONT
ENDFILL     RTS               ;DONE
UPCONT      LDA   YLINE,X     ;GET OLD Y
            TAY
            LDA   DIR,X       ;GET DIRECTION
            BEQ   GOUP        ;IF 0 WE GO UP
            BMI   UPEND
            INY
            BNE   GOCONT      ;ALWAYS
GOUP        DEY
GOCONT      STY   YPOS
            LDA   LEFTXH,X    ;GET OLD LEFT X
            STA   BYTEN
            LDA   LEFTXL,X
            STA   BITN
            JSR   BASER       ;INIT LINE

*THIS LOOP CHECKS RIGHT UNTIL DOT FOUND OR EOL

ULOOP       JSR   CHECK       ;CHECK IF DOT SET
            BNE   DCOLCHK     ;IF SO, GO FILL
ULOOPC      LDA   BYTEN       ;SEE IF AT RIGHT EDGE
            LDX   TAIL        ;OF PREVIOUS LINE
            CMP   RIGHTXH,X
            BNE   UPINC       ;IF NOT, INC X
            LDA   BITN
            CMP   RIGHTXL,X
            BEQ   UPEND       ;HIT END OF LINE
UPINC       INC   BITN        ;NEXT X
            LDA   BITN
            CMP   #7          ;SEE IF NEXT BYTE
            BNE   ULOOP       ;NOPE
            LDA   #0          ;ELSE INC BYTE
            STA   BITN
            INC   BYTEN
            BNE   ULOOP       ;ALWAYS
UPEND       LDX   TAIL        ;DROP TAIL
            INX
            TXA
            AND   #MAX
            STA   TAIL
            JMP   UPIT        ;ALWAYS

*NOW WE CHECK IF AN UP IS CRASHING INTO A DOWN

DCOLCHK     LDX   TAIL        ;SEE IF WE RUN INTO AN OPPOSITE
UDLOOP      INX               ;NEXT IN QUEUE
            TXA
            AND   #MAX
            CMP   HEAD        ;IF UP TO HEAD, DONE
            BNE   CHKNEXT
            JMP   UPOK
CHKNEXT     TAX
            LDA   YPOS
            CMP   YLINE,X
            BNE   UDLOOP      ;IF Y'S<>GO ON
            LDY   TAIL        ;CHECK DIRECTIONS
            LDA   DIR,Y
            CMP   DIR,X
            BEQ   UDLOOP      ;IF =, NO CRASH
            LDA   BYTEN       ;IS X BETWEEN OLD ENDS?
            CMP   RIGHTXH,X
            BMI   CHKLE       ;LESS THAN RIGHT
            BNE   UDLOOP
            LDA   RIGHTXL,X   ;BIT LEVEL
            CMP   BITN
            BMI   UDLOOP
            LDA   BYTEN
CHKLE       CMP   LEFTXH,X    ;HERE IF BYTEN/BITN <= RIGHTX
            BMI   UDLOOP
            BNE   CRASH       ;CRASH, BYTE IN MIDDLE
            LDA   BITN
            CMP   LEFTXL,X
            BMI   UDLOOP
            BEQ   CRASHE      ;LEFT EDGE MATCHES
CRASH       LDA   LEFTXL,Y
            STA   BITN
            LDA   LEFTXH,Y
            STA   BYTEN
            JSR   DECBB
            LDA   BYTEN
            CMP   LEFTXH,X
            BMI   CRASHE
            BNE   MOLEFT
            LDA   LEFTXL,X
            CMP   BITN
            BPL   CRASHE
MOLEFT      LDA   LEFTXH,X    ;MORE OPP DIR ON THE LEFT
            STA   BYTEL
            LDA   LEFTXL,X
            STA   LS
            JSR   DECBB
            LDY   DIR,X
            STX   MASK
            JSR   STORE       ;ADD LEFT EDGE OF OLD
            LDX   MASK
            LDY   TAIL
CRASHE      LDA   RIGHTXH,X   ;NO XTRA ON LEFT,TRY RIGHT
            STA   BYTEN
            CMP   RIGHTXH,Y
            BMI   NONE
            BNE   MORIGHT
            LDA   RIGHTXL,Y
            CMP   RIGHTXL,X
            BMI   MORIGHT
NONE        LDA   #$FF        ;OVERLAPS OLD LINE
            STA   DIR,X       ;DELETE, THEN CONTINUE
            LDA   RIGHTXL,X
            STA   BITN
            JMP   ULOOPC
MORIGHT     LDA   RIGHTXH,Y   ;KEEP SOME RIGHT, THEN UPEND
            STA   LEFTXH,X
            LDA   RIGHTXL,Y
            TAY
            INY
            CPY   #7
            BNE   MOOK
            LDY   #0
            INC   LEFTXH,X
MOOK        TYA
            STA   LEFTXL,X
            JMP   UPEND

*GO FILL A LINE

UPOK        JSR   ONELINE

*THEN ADD TO QUEUE, CHECK COORDS,
*MAYBE PUT ENDS IN QUEUE FOR OPPOSITE
*DIRECTIONS, SEE IF AT RIGHT EDGE TO
*CONTINUE OR FINISH THIS LINE.

            LDX   TAIL        ;GET DIR
            LDA   DIR,X
            TAY
            JSR   STORE       ;STORE LINE IN QUEUE
            LDA   BYTEN
            STA   VALUE
            LDA   BITN
            STA   MASK
            LDX   TAIL        ;CHECK LEFT EDGE
            LDA   LEFTXH,X
            STA   BYTEN
            LDA   LEFTXL,X
            STA   BITN
            JSR   DECBB
            LDA   BYTEN
            CMP   BYTEL
            BMI   CHKRITE     ;NO FURTHER LEFT
            BNE   ADLEFT      ;ADD TO QUEUE
            LDA   LS          ;BIT LEVEL
            CMP   BITN
            BPL   CHKRITE     ;NO FURTHER LEFT
ADLEFT      JSR   DECBB       ;SUBTRACTING 1
            LDA   DIR,X
            EOR   #1
            TAY               ;OPP DIRECTION
            JSR   STORE
CHKRITE     LDA   MASK
            STA   BITN
            LDA   VALUE
            STA   BYTEN
            LDX   TAIL        ;CHECK RIGHT EDGE
            LDA   RIGHTXH,X
            STA   BYTEL
            LDY   RIGHTXL,X
            INY
            CPY   #7
            BNE   SAM
            INC   BYTEL
            LDY   #0
SAM         STY   LS
            LDA   BYTEL
            CMP   BYTEN
            BMI   ADRITE      ;ADD TO QUEUE
            BNE   CNTLINE     ;CONTINUE LINE
            LDA   BITN        ;BIT LEVEL
            CMP   LS
            BEQ   JMPUP       ;MATCHES
            BMI   CNTLINE     ;CONTINUE LINE
ADRITE      INY
            CPY   #7
            BNE   SAM2
            INC   BYTEL
            LDY   #0
SAM2        STY   LS
            LDA   DIR,X
            EOR   #1
            TAY
            JSR   STORE
JMPUP       JMP   UPEND
CNTLINE     JMP   ULOOPC

*STORE LINE COORDS IN QUEUE
*Y-REG 1=DOWN, 0=UP

STORE       CPY   #0
            BEQ   UPDIR       ;STORE UP LINE
            LDA   YPOS        ;DOWN LINE, ONLY IF
            CMP   YMAX        ;NOT BOTTOM OF SCREEN
            BNE   OKLINE
            RTS
UPDIR       LDA   YPOS
            CMP   YMIN
            BEQ   USRET       ;UP ONLY IF NOT TOP
OKLINE      LDX   HEAD        ;STORE AT HEAD
            STA   YLINE,X
            LDA   BYTEL       ;LEFT EDGE
            STA   LEFTXH,X
            LDA   LS
            STA   LEFTXL,X
            LDA   BITN        ;RIGHT EDGE
            STA   RIGHTXL,X
            LDA   BYTEN
            STA   RIGHTXH,X
            TYA
            STA   DIR,X
            LDX   HEAD        ;BUMP HEAD, IF OKAY
            INX
            TXA
            AND   #MAX
            CMP   TAIL
            BNE   STHEAD
            PLA               ;OVERFLOW, QUIT
            PLA
STHEAD      STA   HEAD
USRET       RTS

*DECREMENT BYTEN/BITN

DECBB       DEC   BITN
            BPL   DECRET
            LDA   #6
            STA   BITN
            DEC   BYTEN
DECRET      RTS

*ONELINE FILLS ONE HORIZONTAL LINE
*AT YPOS,BYTEN,BITN
*AND RETURNS YPOS,BYTEL,LS,BYTEN,BITN

ONELINE     LDY   BYTEN       ;FILL ONE LINE
MIDDLE      LDA   #$FF
            STA   LS
            LDA   (PZ2),Y
            STA   VALUE
            LDX   BITN
            ORA   LMASK,X
            JSR   LBITS
            STA   MASK
            LDX   BITN
            LDA   RMASK,X
            ORA   VALUE
            LDX   #7
            STX   BITN
            JSR   RBITS
            AND   MASK
LEFT        JSR   SETC
            LDA   LS
            CMP   #$FF
            BNE   RIGHT
            DEY
            CPY   XMIN
            BMI   RIGHT1
            LDA   (PZ2),Y
            STA   VALUE
            JSR   LBITS
            JMP   LEFT
RIGHT1      INY
            LDA   #$FF
RIGHT       TAX               ;LS
            INX
            CPX   #7
            BNE   RIGHTON
            LDX   #0
            INY
RIGHTON     STY   BYTEL
            STX   LS
            LDY   BYTEN
RLOOP       LDA   BITN
            CMP   #7
            BNE   DOWN
            CPY   XMAX
            BEQ   DOWN
            INY
            LDA   (PZ2),Y
            STA   VALUE
            JSR   RBITS
            JSR   SETC
            JMP   RLOOP
DOWN        DEC   BITN
            BPL   LEFTON
            LDA   #6
            STA   BITN
            DEY
LEFTON      STY   BYTEN
            RTS

*FIND Y BASE ADDRESS, GIVEN YPOS

BASER       LDY   YPOS
PBASER      LDA   LKHI,Y
            ORA   HPAG
            STA   PZ2+1
            LDA   LKLO,Y
            STA   PZ2
            STY   CLPY
            TYA
            LSR
            BCS   ODROW
            LDA   COLORE
            BCC   STCOL
ODROW       LDA   COLORO
STCOL       ASL
            ASL
            STA   COLORP
            RTS

*FIND XBIT/BYTE, GIVEN XHI/LO

SETX        LDY   #$FF
            LDA   XLO
            SEC
SLOOP       SBC   #7
            INY
            BCS   SLOOP
            SEC
            DEC   XHI
            BPL   SLOOP
            STY   BYTEN
            CLC
            ADC   #7
            STA   BITN
            RTS
DOTS        DFB   1,2,4,8,16,32,64

*CHECK A DOT
*BASER IN PZ2, BYTE IN BYTEN, BIT IN BITN
*RESULT RETURNED IN Z BIT, 0=CONTINUE
*BOTH DOTS SET, <>0 MEANS AT LEAST ONE OFF

CHECK       LDX   BITN
            LDA   DOTS,X
            LDY   BYTEN
            AND   (PZ2),Y
            RTS

*-------------------------------

CNO         DFB   0           ;FILL COLOR, USED BY BASIC

LEFTXH      DS    $20
LEFTXL      DS    $20
RIGHTXH     DS    $20
RIGHTXL     DS    $20
YLINE       DS    $20
DIR         DS    $20

*-------------------------------

RMASK       HEX   808183878F9FBF
LMASK       HEX   FEFCF8F0E0C080

LKHI        HEX   0004080C1014181C0004080C1014181C
            HEX   0105090D1115191D0105090D1115191D
            HEX   02060A0E12161A1E02060A0E12161A1E
            HEX   03070B0F13171B1F03070B0F13171B1F
            HEX   0004080C1014181C0004080C1014181C
            HEX   0105090D1115191D0105090D1115191D
            HEX   02060A0E12161A1E02060A0E12161A1E
            HEX   03070B0F13171B1F03070B0F13171B1F
            HEX   0004080C1014181C0004080C1014181C
            HEX   0105090D1115191D0105090D1115191D
            HEX   02060A0E12161A1E02060A0E12161A1E
            HEX   03070B0F13171B1F03070B0F13171B1F
LKLO        HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
BASEC       HEX   030716071A1D1C17080B001B0004031B
            HEX   03061A060006001102061C1310131007
            HEX   021B0207021702091A04100402051217
            HEX   1A07031716190305030D1A0D1A051005
            HEX   000D0017080516050105160B01070117
            HEX   0109010416040C0F011B01110C170C04
            HEX   1613010616060C1107070404071B1B1D
            HEX   071106071706061B0606040611130411
            HEX   1707170B171905071705070D0505050D
            HEX   0D0F040D1704051B050603031603030C
            HEX   0000081A02161A1C03100203021A0202
            HEX   121C001A121A10120010031A161A1612
            HEX   010216180103011A0116010101001600
            HEX   160C160E0C0E000C
BASECB      HEX   00000000552A552A2A552A557F7F7F7F
            HEX   80808080D5AAD5AAAAD5AAD5FFFFFFFF
            HEX   33664C19B3E6CC994C193366CC99B3E6
            HEX   1122440891A2C48844081122C48891A2
            HEX   22440811A2C48891081122448891A2C4
            HEX   C9A4928924124924776E5D3BF7EEDDBB
            HEX   5D3B776EDDBBF7EE6E5D3B77EEDDBBF7
            HEX   3B776E5DBBF7EEDD

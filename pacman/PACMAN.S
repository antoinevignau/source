*
* Pac-Man
*
* (c) 1983, Atari
* (s) 2024, Antoine Vignau
*

            TYP   BIN
            ORG   $4000
            MX    %11

	USE   PACMAN.E
	
*-----------------------------------
* FIRMWARE EQUATES
*-----------------------------------

SOFTEV      EQU   $03F2
PWREDUP     EQU   $03F4
NMILOC      EQU   $03FB
IRQLOC      EQU   $03FE
KBD         EQU   $C000
KBDSTROBE   EQU   $C010
SPKR        EQU   $C030
TXTCLR      EQU   $C050
TXTSET      EQU   $C051
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
TXTPAGE2    EQU   $C055
LORES       EQU   $C056
HIRES       EQU   $C057
SETAN0      EQU   $C058
CLRAN0      EQU   $C059
SETAN1      EQU   $C05A
CLRAN1      EQU   $C05B
SETAN2      EQU   $C05C
BUTN0       EQU   $C061
PADDL0      EQU   $C064
PADDL1      EQU   $C065
PTRIG       EQU   $C070
VTAB        EQU   $FC22
VTABZ       EQU   $FC24
RDKEY       EQU   $FD0C
GETLN1      EQU   $FD6F
COUT1       EQU   $FDF0
SETKBD      EQU   $FE89
SETVID      EQU   $FE93

*-----------------------------------
* ENTRY POINT
*-----------------------------------

            LDA   #$AF	; relocate from $1000 to $4000
            STA   zpPTR2+1
            LDA   #$7F
            STA   zpPTR1+1
            LDY   #$00
            STY   zpPTR2
            STY   zpPTR1
            LDX   #$70
L4010       LDA   (zpPTR1),Y
            STA   (zpPTR2),Y
            INY
            BNE   L4010
            DEC   zpPTR2+1
            DEC   zpPTR1+1
            DEX
            BPL   L4010
            JSR   SETKBD
            JSR   SETVID
            JMP   L4027

L4027       LDA   #$01
            STA   nbPLAYERS
            JSR   initNEWGAME
            LDA   #$00
            STA   highSCORE
            STA   highSCORE+1
            STA   highSCORE+2
            STA   nbLIVES
            LDA   #$01
            STA   fgCOLOR	; ZP - color monitor if 1
            STA   fgDEMO	; ZP - demo if 1
            LDA   #<welcomePAGE
            STA   SOFTEV
            STA   NMILOC+1
            STA   IRQLOC
            LDA   #>welcomePAGE
            STA   SOFTEV+1
            STA   NMILOC+2
            STA   IRQLOC+1
            EOR   #$A5
            STA   PWREDUP
            LDA   #$4C
            STA   NMILOC
            JSR   selectMONITOR
            JMP   welcomePAGE		; show LOGO

            ASC   "(C) 1983 ATARI, INC.ALL RIGHTS RESERVED."
            ASC   "UNAUTHORIZED REPRODUCTION, ADAPTATION, "
            ASC   "DISTRIBUTION, PERFORMANCE, OR DISPLAY OF "
            ASC   "THIS DOCUMENT, THE ASSOCIATED COMPUTER PROGRAM, "
            ASC   "OR THE AUDIOVISUAL WORK IS STRICTLY PROHIBITED."
            DB    $02
            DB    $BB
            DB    $5A
            DB    $30
            DB    $5F
            DB    $EE
            DB    $3D
            DB    $A8
            DB    $17

*-----------------------------------
* MAIN ENTRY POINT
*-----------------------------------

selectRANKCARTOON
            bit   selecNBPLAYERS		; LoGo

L4147       JSR   setTEXT2	; set text mode
            JSR   clearTEXT2	; clear text screen
            LDA   #$00
            STA   CH
            LDA   #$05
            JSR   gotoXY
            LDX   #$00
L4158       LDA   strRAORCA,X	; RANK OR CARTOON?
            JSR   printCHAR
            INX
            CPX   #$11
            BCC   L4158
            JSR   GETLN1
            LDA   #$07
            JSR   gotoXY
            LDA   #$00
            STA   CH
            LDA   $0200
            CMP   #"C"
            BNE   L419F

*--- Choose cartoon

            LDX   #$00
L4178       LDA   strCARTOON,X	; CARTOON NUMBER (1-3)
            JSR   printCHAR
            INX
            CPX   #$16
            BCC   L4178
            JSR   GETLN1
            LDX   $0200
            LDA   #$02
            CPX   #"1"
            BEQ   L4197
            LDA   #$05
            CPX   #"2"
            BEQ   L4197
            LDA   #$09
L4197       STA   theRANK		; ZP
            JSR   playCARTOON
            JMP   selectRANKCARTOON

*--- Choose rank

L419F       LDX   #$00
L41A1       LDA   strRANK,X	; RANK NUMBER (1-21)
            JSR   printCHAR
            INX
            CPX   #$14
            BCC   L41A1
            JSR   GETLN1
            CPX   #$01
            BEQ   L41D2
            LDA   $0200
            AND   #$0F
            TAX
            LDA   $0201
            AND   #$0F
            CPX   #$00
            BEQ   L41C8
L41C2       CLC
            ADC   #$0A
            DEX
            BNE   L41C2
L41C8       CMP   #$16
            BCS   L41D9
L41CC       STA   L54E0+1
            JMP   selecNBPLAYERS

L41D2       LDA   $0200
            AND   #$0F
            BNE   L41CC
L41D9       JMP   selectRANKCARTOON

strRAORCA   ASC   "RANK OR CARTOON? "
strRANK     ASC   "RANK NUMBER? (1-21) "
strCARTOON  ASC   "CARTOON NUMBER? (1-3) "

*-----------------------------------
* SELECT NUMBER OF PLAYERS
*-----------------------------------

selecNBPLAYERS
            JSR   setTEXT2
            JSR   clearTEXT2
            LDA   #$00
            STA   CH
            LDA   #$06
            JSR   gotoXY
            LDX   #$00
L4228       LDA   strHOWMANY,X	; HOW MANY PLAYERS?
            JSR   printCHAR
            INX
            CPX   #$1D
            BNE   L4228
L4233       JSR   RDKEY
            CMP   #$96		; ctrl-v
            BEQ   L4272
            CMP   #"1"
            BCC   L4233
            CMP   #"5"+1
            BCS   L4233
            JSR   printCHAR
            AND   #$07
            STA   nbPLAYERS		; ZP

            LDA   #$00
            STA   CH
            LDA   #$0B
            STA   CV
            JSR   gotoXY
            LDX   #$00
L4256       LDA   strRETURN,X	; SPACE OR RETURN
            JSR   printCHAR
            INX
            CPX   #$37
            BNE   L4256
L4261       JSR   RDKEY
            CMP   #" "
            BNE   L426B
            JMP   welcomePAGE		; space means the end

L426B       CMP   #$8D
            BNE   L4261
            JMP   L52FC		; RETURN TO PLAY

L4272       JSR   RDKEY
            CMP   #$83		; ctrl-c
            BNE   L4233
            JMP   L4147

strHOWMANY  ASC   "HOW MANY PLAYERS?  (1 - 5)   "
strRETURN   ASC   "PRESS <RETURN> TO PLAY"8D
            ASC   "OR <SPACE> TO GO BACK TO DEMO.  "

*-----------------------------------
* DECODE WELCOME SCRIPT
*-----------------------------------

decodeSCRIPT
            LDA   (zpPTR1),Y	; get X
            STA   zpXCOL
            INY
            LDA   (zpPTR1),Y	; get Y
            STA   zpY1
            STA   zpTEMP3	; save Y
            INY
            STY   zpTEMP4	; save index
L42DE       LDY   zpTEMP4	; get index
            LDA   (zpPTR1),Y	; get value
            BMI   L4303
            BEQ   L42F6		; 0, 3..1F
            CMP   #$20
            BEQ   L42F9
            CMP   #$21		; b comes from another font
            BEQ   L4306		; b/c we exceed 256!
            CMP   #$03
            BCS   L42F6
            INC   zpY1		; +=2
            INC   zpY1
L42F6       JSR   L4316		; draw sprite

L42F9       LDA   zpTEMP3	; #$20: space character
            STA   zpY1		; restore Y
            INC   zpTEMP4	; next index
            INC   zpXCOL	; next X
            BNE   L42DE		; loop

L4303       INC   zpTEMP4	; exit
            RTS

L4306       LDA   #<sprFONT2	; #$21: print the b character
            STA   L55B1+1	; b/c we are over the index of 256
            LDA   #>sprFONT2
            STA   L55B1+2
            JSR   L4338
            JMP   L42F9

L4316       STA   zpTEMP2
            ASL
            ASL
            ASL		; *8
            ADC   zpTEMP2	; +1 = *9
            STA   L55B1+1
            LDA   #>sprFONT
            STA   L55B1+2
            BCC   L432A
            INC   L55B1+2
L432A       CLC
            LDA   L55B1+1
            ADC   #<sprFONT
            STA   L55B1+1
            BCC   L4338
            INC   L55B1+2

L4338       LDA   #$01		; width in bytes
            STA   sprWIDTH
            LDA   #$09		; height in lines
            STA   sprHEIGHT
            LDA   #$00
            STA   zpXBIT
            JSR   drawCOLORSPRITE
            JSR   getINPUT
            LDX   #$50
            JMP   doWAIT2

*---

welcomeSCRIPT
            DB    $0D	; 
            DB    $0B	; 
            DB    $04	; C
            DB    $12	; h
            DB    $0D	; a
            DB    $19	; r
            DB    $0D	; a
            DB    $0E	; c
            DB    $1B	; t
            DB    $10	; e
            DB    $19	; r
            DB    $20	; _
            DB    $1E	; /
            DB    $20	; _
            DB    $09	; N
            DB    $13	; i
            DB    $0E	; c
            DB    $14	; k
            DB    $17	; n
            DB    $0D	; a
            DB    $16	; m
            DB    $10	; e
            DB    $FF
	
            DB    $0E	; 
            DB    $1E	; 
            DB    $0C	; S
            DB    $12	; h
            DB    $0D	; a
            DB    $0F	; d
            DB    $18	; o
            DB    $00	; w
            DB    $FF
	
            DB    $1A	; 
            DB    $1E	; 
            DB    $06	; I
            DB    $17	; n
            DB    $14	; k
            DB    $01	; y
            DB    $FF
	
            DB    $0E	; 
            DB    $2D	; 
            DB    $0B	; B
            DB    $0D	; a
            DB    $1A	; s
            DB    $12	; h
            DB    $11	; f
            DB    $1C	; u
            DB    $15	; l
            DB    $FF
	
            DB    $1A	; 
            DB    $2D	; 
            DB    $0B	; B
            DB    $15	; l
            DB    $13	; i
            DB    $17	; n
            DB    $14	; k
            DB    $01	; y
            DB    $FF

            DB    $0E	; 
            DB    $3C	; 
            DB    $0C	; S
            DB    $02	; p
            DB    $10	; e
            DB    $10	; e
            DB    $0F	; d
            DB    $01	; y
            DB    $FF

            DB    $1A	; 
            DB    $3C	; 
            DB    $0A	; P
            DB    $13	; i
            DB    $17	; n
            DB    $14	; k
            DB    $01	; y
            DB    $FF

            DB    $0E	; 
            DB    $4B	; 
            DB    $0A	; P
            DB    $18	; o
            DB    $14	; k
            DB    $10	; e
            DB    $01	; y
            DB    $FF

            DB    $1A	; 
            DB    $4B	; 
            DB    $04	; C
            DB    $15	; l
            DB    $01	; y
            DB    $0F	; d
            DB    $10	; e
            DB    $FF

            DB    $11	; 
            DB    $8A	; 
            DB    $0A	; P
            DB    $0D	; a
            DB    $0E	; c
            DB    $16	; m
            DB    $0D	; a
            DB    $17	; n
            DB    $FF

            DB    $12	; 
            DB    $9A	; 
            DB    $03	; A
            DB    $1B	; t
            DB    $0D	; a
            DB    $19	; r
            DB    $13	; i
            DB    $20	; _
            DB    $06	; I
            DB    $17	; n
            DB    $0E	; c
            DB    $1F	; .
            DB    $FF

            DB    $0E	; 
            DB    $AF	; 
            DB    $0A	; P
            DB    $19	; r
            DB    $10	; e
            DB    $1A	; s
            DB    $1A	; s
            DB    $20	; _
            DB    $0C	; S
            DB    $02	; p
            DB    $0D	; a
            DB    $0E	; c
            DB    $10	; e
            DB    $20	; _
            DB    $21	; b
            DB    $0D	; a
            DB    $19	; r
            DB    $FF

*-----------------------------------
* WELCOME PAGE
*-----------------------------------

welcomePAGE
            LDA   #$01
            STA   fgDEMO
            JSR   showTITLESCREEN
            JSR   clearHGR

*--- Init

            LDA   #$01
            STA   $81
            LDA   #$00
            STA   ghostFRIGHTENED
            STA   ghostISDEAD
            LDA   #<welcomeSCRIPT
            STA   zpPTR1
            LDA   #>welcomeSCRIPT
            STA   zpPTR1+1

* 1. Character / Nickname

            LDY   #$00
            JSR   decodeSCRIPT
            JSR   welcomeTAB

* 2. Draw Shadow / Inky sprite

            LDA   #$22	
            STA   zpY1
            LDA   #$01
            STA   ghostINDEX
            JSR   L88A2

            LDY   zpTEMP4	; Shadow
            JSR   decodeSCRIPT
            LDY   zpTEMP4	; Inky
            JSR   decodeSCRIPT
            JSR   welcomeTAB

* 3. Draw Bashful / Blinky

            LDA   #$31
            STA   zpY1
            LDA   #gBLINKY
            STA   ghostINDEX
            JSR   L88A2

            LDY   zpTEMP4	; Bashful
            JSR   decodeSCRIPT
            LDY   zpTEMP4	; Blinky
            JSR   decodeSCRIPT
            JSR   welcomeTAB

* 4. Draw Speedy / Pinky

            LDA   #$40
            STA   zpY1
            LDA   #gPINKY
            STA   ghostINDEX
            JSR   L88A2

            LDY   zpTEMP4	; Speedy
            JSR   decodeSCRIPT
            LDY   zpTEMP4	; Pinky
            JSR   decodeSCRIPT
            JSR   welcomeTAB

* 5. Pokey / Clyde

            LDA   #$4F
            STA   zpY1
            LDA   #gCLYDE
            STA   ghostINDEX
            JSR   L88A2

            LDY   zpTEMP4	; Pokey
            JSR   decodeSCRIPT
            LDY   zpTEMP4	; Clyde
            JSR   decodeSCRIPT

* 6. Draw normal dot and its associated 10 points

            LDA   #$74
            STA   zpX1
            LDA   #$78
            STA   zpY1
            JSR   drawNORMALDOT

            LDA   #$7C
            STA   zpX2
            LDA   #$00
            STA   zpX2+1
            LDA   #$75
            STA   zpY2
            LDA   #$01
            JSR   printDIGIT
            CLC
            LDA   zpX2
            ADC   #$06
            STA   zpX2
            LDA   #$00
            JSR   printDIGIT

            LDA   #$14		; draw the Points sprite
            STA   zpXCOL
            LDA   #$75
            STA   zpY1
            JSR   welcomePOINTS

* 7. Draw energizer dot and its associated 50 points

            LDA   #$73
            STA   zpX1
            LDA   #$81
            STA   zpY1
            JSR   drawENERGIZERDOT

            LDA   #$7C
            STA   zpX2
            LDA   #$80
            STA   zpY2
            LDA   #$05
            JSR   printDIGIT
            CLC
            LDA   zpX2
            ADC   #$06
            STA   zpX2
            LDA   #$00
            JSR   printDIGIT

            LDA   #$14		; draw the Points sprite
            STA   zpXCOL
            LDA   #$80
            STA   zpY1
            JSR   welcomePOINTS

* 8. Draw the (c) 1983 sprite

            LDA   #$0C
            STA   zpXCOL
            LDA   #$9A
            STA   zpY1
            LDA   #$00
            STA   zpXBIT
            LDA   #$05
            STA   sprWIDTH
            LDA   #$09
            STA   sprHEIGHT
            LDA   #<sprC1983
            STA   L55B1+1
            LDA   #>sprC1983
            STA   L55B1+2
            JSR   drawCOLORSPRITE

* 9. Print Pacman

            LDY   zpTEMP4
            JSR   decodeSCRIPT

* 10. Print Atari Inc.

            LDY   zpTEMP4
            JSR   decodeSCRIPT

* 11. Print Press Space bar

            LDY   zpTEMP4
            JSR   decodeSCRIPT
            JMP   doWELCOME

*---

welcomeTAB  LDA   #$49		; set X
            STA   zpX1
            LDA   #$00
            STA   zpX1+1
            RTS

*---

welcomePOINTS
            LDA   #$04		; Draw the Points sprite
            STA   sprWIDTH
            LDA   #$07
            STA   sprHEIGHT
            LDA   #<sprPOINTS
            STA   L55B1+1
            LDA   #>sprPOINTS
            STA   L55B1+2
            LDA   #$00
            STA   zpXBIT
            JMP   drawCOLORSPRITE

*--- Sprite for POINTS

sprPOINTS   HEX   0F002000
            HEX   11102000
            HEX   1100701C
            HEX   0F532302
            HEX   4154241C
            HEX   41542420
            HEX   0153441C

*--- Sprites for the Welcome page

sprC1983    HEX   7C40707138
            HEX   0261080A45
            HEX   3942080A41
            HEX   0542080A41
            HEX   0542707138
            HEX   0542000941
            HEX   3942400841
            HEX   0241200845
            HEX   7C70137038

sprFONT     HEX   00000011111515150A	; 00 w
            HEX   00111111111E10110E	; 01 y
            HEX   001D2222221E020202	; 02 p
            HEX   0C1221213F21212121	; 03 A
            HEX   1E210101010101211E	; 04 C
            HEX   3F0101010F01010101	; 05 F
            HEX   3F0C0C0C0C0C0C0C3F	; 06 I
            HEX   212121213F21212121	; 07 H
            HEX   01010101010101013F	; 08 L
            HEX   232325252929293131	; 09 N
            HEX   1F2121211F01010101	; 0A P
            HEX   1F2121211F2121211F	; 0B B
            HEX   1E2101011E2020211E	; 0C S
            HEX   0000000E11101E112E	; 0D a
            HEX   0000001E010101011E	; 0E c
            HEX   101010101E1111113E	; 0F d
            HEX   0000001E211F01211E	; 10 e
            HEX   182404041F04040404	; 11 f
            HEX   0101011D2321212121	; 12 h
            HEX   000400040404040408	; 13 i
            HEX   010101090503050911	; 14 k
            HEX   020404040404040408	; 15 l
            HEX   000000152A2A2A2A2A	; 16 m
            HEX   0000001D2222222222	; 17 n
            HEX   0000001E212121211E	; 18 o
            HEX   0000001D2202020202	; 19 r
            HEX   0000001E011E20211E	; 1A s
            HEX   0404041E0404040418	; 1B t
            HEX   00000011121212122C	; 1C u
            HEX   000000003F00000000	; 1D -
            HEX   004020100804020100	; 1E /
            HEX   000000000000000606	; 1F .
				; 20 space character
sprFONT2    HEX   01010101011F21211F	; 21 b

*-----------------------------------
* ANIPMATION - SHOW BONUS
*-----------------------------------

welcomeBONUS
            JSR   showBONUS
            CLC
            SED
            LDA   bonusINDEX
            ADC   bonusINDEX
            STA   bonusINDEX
            CLD
            RTS

*-----------------------------------
* ANIMATION ON THE WELCOME PAGE
*-----------------------------------

doWELCOME   LDA   #$70
            STA   dotTEMPO
            LDA   #$20
            STA   frameCNT
            LDA   #$18
            STA   $80
            LDA   #dirLEFT
            STA   pacmanDIR
            LDA   #$00
            STA   pacmanSTEP
            STA   ghostFRIGHTENED	; ghost is not frightened
            STA   ghostISDEAD	; ghost is alive
            LDA   #$01
            STA   $81
            STA   fgDOTS
            LDA   #$8D		; coordinate of Pacman
            STA   pacmanX
            LDA   #$68
            STA   ghostY
            STA   pacmanY

            LDA   #gCLYDE	; we have 4 ghosts
            STA   ghostINDEX	; and we get their data
L46B5       JSR   getGHOSTSDATA
            DEC   ghostINDEX
            BNE   L46B5

            LDA   #$B1		; coordinates of each ghost
            STA   ghost1X
            LDA   #$C1
            STA   ghost2X
            LDA   #$D1
            STA   ghost3X
            LDA   #$E1
            STA   ghost4X
L46CC       DEC   frameCNT
            BNE   L46EC
            JSR   getINPUT
            LDA   #$20
            STA   frameCNT
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            SEC
            LDA   pacmanX
            SBC   #$02
            STA   pacmanX
            JSR   setXYPACMAN
            INC   pacmanSTEP
            JSR   L79A4
L46EC       JSR   L6CF3
            LDA   #gCLYDE
            STA   ghostINDEX
L46F3       JSR   setGHOSTSDATA
            DEC   $80
            BNE   L4711
            LDA   #$18
            STA   $80
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            SEC
            LDA   ghostX
            SBC   #$02
            STA   ghostX
            JSR   setXYGHOST
            JSR   L88A2
L4711       JSR   getGHOSTSDATA
            DEC   ghostINDEX
            BNE   L46F3
            DEC   $5E
            BNE   L4742
            LDA   #$60
            STA   dotTEMPO
            LDA   fgDOTS
            BEQ   L4733
            LDA   #$67
            STA   zpY1
            LDA   #$4B
            STA   zpX1
            JSR   drawENERGIZERDOT
            LDA   #$00
            BEQ   L4740
L4733       LDA   #$66
            STA   zpY1
            LDA   #$4A
            STA   zpX1
            JSR   hideENERGIZERDOT
            LDA   #$01
L4740       STA   fgDOTS
L4742       LDA   pacmanX
            CMP   #$4F
            BCC   L474B
            JMP   L46CC

L474B       LDA   #$01	; ghost data + 8 = frightened mode
            STA   ghost1FRIGHTENED
            STA   ghost2FRIGHTENED
            STA   ghost3FRIGHTENED
            STA   ghost4FRIGHTENED
            LDA   #$FF
            STA   $E2
            LDA   #dirRIGHT	; or score200
            STA   bonusINDEX
            STA   pacmanDIR	; pacman goes to the right
L475F       DEC   frameCNT
            BNE   L477F
            JSR   getINPUT
            LDA   #$20
            STA   frameCNT
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            CLC
            LDA   pacmanX
            ADC   #$02
            STA   pacmanX
            JSR   setXYPACMAN
            INC   pacmanSTEP
            JSR   L79A4
L477F       JSR   L6CF3
            LDA   #gCLYDE
            STA   ghostINDEX
L4786       JSR   setGHOSTSDATA
            DEC   $80
            BNE   L47C0
            LDA   #$40
            STA   $80
            LDA   ghostISDEAD	; is ghost dead?
            BNE   L47C0		; yes
            SEC		; no
            LDA   ghostX
            SBC   pacmanX
            CMP   #$05
            BCS   L47AD
            JSR   welcomeBONUS

            LDA   bonusINDEX		; shall we exit?
            CMP   #$32		; 2/4/8/16/32
            BEQ   L47C9		; yes

            LDA   #$01		; ghost is dead
            STA   ghostISDEAD	; now
            BNE   L47C0
L47AD       JSR   setXYGHOST
            JSR   eraseSPRITE44
            CLC
            LDA   ghostX
            ADC   #$02
            STA   ghostX
            JSR   setXYGHOST
            JSR   L88A2
L47C0       JSR   getGHOSTSDATA
            DEC   ghostINDEX
            BNE   L4786
            BEQ   L475F

L47C9       LDA   #<L47DA
            LDY   #>L47DA
            STA   zpPTR3
            STY   zpPTR3+1
            LDA   #$01
            STA   fgDEMO
            STA   theRANK
            JMP   L5303

L47DA       DB    $03
            DB    $03
            DB    $03
            DB    $00
            DB    $03
            DB    $03
            DB    $00
            DB    $02
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $03
            DB    $03
            DB    $01
            DB    $03
            DB    $03
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $03
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $02
            DB    $02
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $01
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $03
            DB    $01
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $02
            DB    $00
            DB    $00
            DB    $03
            DB    $03
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $00

*-----------------------------------
* SELECT MONITOR TYPE
*-----------------------------------

selectMONITOR
            bit   selectINPUTDEVICE		; LoGo
            JSR   setTEXT2	; set text mode
            JSR   clearTEXT2	; clear text screen
            LDA   #$0A
            STA   CV
            JSR   gotoXY
            LDA   #$00
            STA   CH
            LDX   #$00
L4837       LDA   L4886,X	; B&W OR COLOR MONITOR?
            JSR   printCHAR
            INX
            CPX   #$20
            BNE   L4837
L4842       JSR   RDKEY
            CMP   #"B"		; BLACK
            BCC   L4842
            CMP   #"C"+1	; COLOR
            BCS   L4842
            AND   #$01
            STA   $1D		; ZP MONITOR
            JMP   selectINPUTDEVICE

*-----------------------------------
* 
*-----------------------------------

            LDA   CV
            JSR   VTABZ
            JMP   L485F

*-----------------------------------
* GOTO X/Y
*-----------------------------------

gotoXY      JSR   VTAB
L485F       LDA   $29
            AND   #$03
            ORA   #$08
            STA   $29
            RTS

*-----------------------------------
* CLER TEXT PAGE 2
*-----------------------------------

clearTEXT2  LDA   #$00
            STA   CV
            STA   CH
            LDX   #$04
            LDY   #$00
L4872       LDA   #" "
L4874       STA   TEXT2,Y
            INY
            BNE   L4874
            INC   L4874+2
            DEX
            BNE   L4872
            LDA   #>TEXT2
            STA   L4874+2
            RTS

L4886       ASC   "BLACK & WHITE OR COLOR? (B / C) "

*-----------------------------------
* SELECT INPUT DEVICE
*-----------------------------------

selectINPUTDEVICE
            JSR   setTEXT2
            JSR   clearTEXT2
            LDA   #$00
            STA   CH
            STA   CV
            JSR   gotoXY
            LDX   #$00
L48B7       LDA   strINPUTDEVICE,X	; KEYBOARD OR JOYSTICK
            BEQ   L48C2
            JSR   printCHAR
            INX
            BNE   L48B7
L48C2       JSR   RDKEY
            CMP   #$B1
            BEQ   L48D2
            CMP   #$B2
            BNE   L48C2
            LDA   #$01		; ZP joystick
            STA   theDEVICE
            RTS
L48D2       LDA   #$00		; ZP keyboard
            STA   theDEVICE
            JMP   selectKEYBOARD

strINPUTDEVICE
            ASC   " PACMAN CAN BE PLAYED WITH"8D8D
            ASC   " 1. KEYBOARD"8D
            ASC   " 2. APPLE JOYSTICK"8D8D8D8D
            ASC   "CHOOSE A MODE (1 - 2) "00

*-----------------------------------
* SELECT KEYBOARD / SET KEYS
*-----------------------------------

selectKEYBOARD
            JSR   clearTEXT2
            JSR   setTEXT2
            LDA   #$00
            STA   CH
            STA   CV
            JSR   gotoXY
            LDX   #$00
L4940       LDA   strKEYBOARD,X
            JSR   printCHAR
            INX
            CPX   #$26
            BCC   L4940
            JSR   RDKEY
            CMP   #$C3
            BEQ   L4955
            JMP   L4A00

L4955       JSR   printCHAR
            LDA   #$04
            STA   CV
            LDA   #$00
            STA   CH
            JSR   gotoXY
            LDX   #$00
L4965       LDA   strKEYS,X
            JSR   printCHAR
            INX
            CPX   #$14
            BCC   L4965
            LDA   #$16
            STA   CH
            LDA   #$06
            STA   CV
            JSR   gotoXY
            LDX   #$00
L497D       LDA   strLEFT,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L497D
            JSR   RDKEY
            STA   L6FB9+1
            INC   CV
            LDA   #$16
            STA   CH
            JSR   gotoXY
            LDX   #$00
L4999       LDA   strRIGHT,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L4999
L49A4       JSR   RDKEY
            CMP   L6FB9+1
            BEQ   L49A4
            STA   L6FB5+1
            INC   CV
            LDA   #$16
            STA   CH
            JSR   gotoXY
            LDX   #$00
L49BA       LDA   strUP,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L49BA
L49C5       JSR   RDKEY
            CMP   L6FB9+1
            BEQ   L49C5
            CMP   L6FB5+1
            BEQ   L49C5
            STA   L6FB1+1
            INC   CV
            LDA   #$16
            STA   CH
            JSR   gotoXY
            LDX   #$00
L49E0       LDA   strDOWN,X
            JSR   printCHAR
            INX
            CPX   #$0C
            BCC   L49E0
L49EB       JSR   RDKEY
            CMP   L6FB9+1
            BEQ   L49EB
            CMP   L6FB5+1
            BEQ   L49EB
            CMP   L6FB1+1
            BEQ   L49EB
            STA   L6FBD+1
L4A00       RTS

strKEYBOARD ASC   "NORMAL OR CUSTOMIZED KEYBOARD (N/C)? "
strKEYS     ASC   "   PRESS KEY USED TO"
strLEFT     ASC   "MOVE LEFT   "
strRIGHT    ASC   "MOVE RIGHT  "
strUP       ASC   "MOVE UP     "
strDOWN     ASC   "MOVE DOWN   "

*-----------------------------------
* OUTPUT CHARACTER
*-----------------------------------

printCHAR   CMP   #$8D
            BNE   L4A77
            INC   CV
            LDA   #$00
            STA   CH
            JMP   gotoXY
L4A77       JMP   COUT1

*-----------------------------------
* PACMAN LOGO
*-----------------------------------

* +0 goes to $0C: X start
* +1 goes to $0E: X end
* +2 goes to $10: Y

theLOGO     HEX   FFFFFE01410101450301450501470701
            HEX   4909014B0B014D0D014F0F014F110151
            HEX   13015115015317012419012B11295319
            HEX   01211B2B531B01201F011F1D2D531D2D
            HEX   531F0121212B5321012323295323FFFF
            HEX   FE01532501532701532901512B01512D
            HEX   014F2F014F31014D3301493501453701
            HEX   4339012B3B012B3D012B3F012B41012B
            HEX   43012B45012B47012B49012B49012B4B
            HEX   012B4D012B4F012B51012B53012B55FF
            HEX   FFFF014302014504014706014908014B
            HEX   0A014B0C014D0E014F10014F12015114
            HEX   01511601511801221A2B531A011F1C2D
            HEX   531C01201E2D53202D531E0120200121
            HEX   222B5322012424255324015326015328
            HEX   01512C01512A014F30014F2E014D3201
            HEX   4934014536014338014338012B3A012B
            HEX   3C012B3E012B3E012B40012B42012B44
            HEX   012B46012B48012B4A012B4E012B4C01
            HEX   2B50012B52012B54FFFFFFFFFFFFFFFF
            HEX   FE737301737303737305717507717509
            HEX   6F770B6F770D6D790F6D7911697D176B
            HEX   7B136B7B15677F1B697D19677F1F677F
            HEX   1D658123658121638325637127718327
            HEX   616F29778529616D2B79852B5F6B2D7B
            HEX   872D5F6B2F7B872F5D6D317989317789
            HEX   335D6F335B8B355B8B37598D39598D3B
            HEX   598D3D578F3F578F4155914355914553
            HEX   934753934951954B51954D4F974F4F97
            HEX   514D99534D9955FFFFFF737302737304
            HEX   73730671750871750A71750A6F770C6F
            HEX   770E6F770E6D79106D79126B7B146B7B
            HEX   146B7B16697D18697D1A677F1C677F1E
            HEX   658120658122638324638326616F2875
            HEX   8528616D2A77852A5F6B2C79872C5F6B
            HEX   2E7B872E5F6B307B87305D6D325D7134
            HEX   5B8B365B8B36598D3A5B8B38598D3C59
            HEX   8D3E578F40758934798932578F425591
            HEX   4455914653934853934A51954C51954E
            HEX   4F97504F97524D9954FFFFFEC1D501BB
            HEX   DB03B7DF05B5E107B1E509AFE70BADE9
            HEX   0DABEB11ABEB0FA9ED13A7EF17A7EF15
            HEX   A5EB19A3E71BA3E31DA3DF1FA1DB21A1
            HEX   D723A1CF27A1CF27A1D325A1CB29A1C9
            HEX   2BA1CD2DA1D12FA1D531A1D933A1DB35
            HEX   A3E137A3E73BA3E339A7EF3FA7EB3DA9
            HEX   ED43A7EF41ADEB49ABEB47ABEB45AFE7
            HEX   4BB1E54DB5E14FC1D555BBDB53B7DF51
            HEX   FFFFFFBDD902B9DD04B5E106B3E308B1
            HEX   E50AAFE70C0D490EA7EF16ADE90EABEB
            HEX   10A9ED12A9ED14BDD954B9DD52B5E150
            HEX   B3E34EB1E54CAFE74AADE948ABEB46A9
            HEX   ED44A9ED42A7EF40A7EF40A5ED3EA5E9
            HEX   3CA3E53AA3E138A1DD36A1D934A1CF2E
            HEX   A1D330A1D732A1C92AA1CB2CA1D922A1
            HEX   D126A1CD28A1DD20A1D524A3E51CA3E1
            HEX   1EA5E91AA5ED18FFFFFE01010101016A
            HEX   01036C01056E010770010972010B7401
            HEX   0D76010F7801117A01137C01157E0117
            HEX   80011982011B84011D86011F8801218A
            HEX   01238C01258E01279001299201559401
            HEX   559601559801559A01559C0155A00155
            HEX   A20155A40155A60155A80155AA0155A0
            HEX   0155A20155A401559E2D55922F559031
            HEX   558E33558C35558A3755883955863B55
            HEX   843D55823F558041567E43557C45557A
            HEX   4755784955764B55744D55724F557051
            HEX   556E53556C55556AFFFFFF01016B0103
            HEX   6D01056F010771010973010B75010D77
            HEX   010F7901117B01137D01157F01178101
            HEX   1983011B8501218B011F89011D870123
            HEX   8D01258F012791015593015595015597
            HEX   01559901559B01559D01559F0155A101
            HEX   55A30155A50155A70155A92F558F2D55
            HEX   9131558D33558B355589375587395585
            HEX   3B55833D55813F557F41557D43557B45
            HEX   55794755774955754B55734D55714F55
            HEX   6F51556D53556B0155BD0155BB0155B9
            HEX   0155B70155B50155B30155B10155AF01
            HEX   55AD0155ABFFFFFE0155BE0155BC0155
            HEX   BA0155B80155B60155B40155B20155B0
            HEX   0155AE0155ACFFFFFE81816A81816C81
            HEX   816E7F83707F83727D85767D85747B87
            HEX   787B877A79897C79897E778B80778B82
            HEX   758D84758D86758D88758D86738F8A73
            HEX   8F8C71918E717F908391906F7D928593
            HEX   926F7B948793946D79968995966D7998
            HEX   8995986B7B9A87979A6B7D9C85979C81
            HEX   819069999E6999A0679BA6679BA4679B
            HEX   A2659DA8659DAA639FAC639FAE61A1B0
            HEX   61A1B25FA3B65FA3B45DA5B85DA5BA5B
            HEX   A7BE5DA7BCFFFFFF81816B81816D8181
            HEX   6F7F83717F83737D85757D85777B8779
            HEX   7B877B79897D79897F778B81778B8375
            HEX   8D85758D87738F89738F8B71918D7191
            HEX   8F6F7D918391916F7B938591936D7995
            HEX   8793956D79978995976B7B9B6D799989
            HEX   959987979B6B7F9D83979D69999F7F7F
            HEX   915BA7BD5DA5BB5DA5B95FA3B55FA3B7
            HEX   639FAD639FAF61A1B361A1B1659DAB65
            HEX   9DA9679BA7679BA36999A1679BA5FFFF
            HEX   FEABAB69ABAF6BABB16DABB36FABB771
            HEX   ABB973ABBB75ABBD77ABC179ABC37BAB
            HEX   C57DABC97FABCB81ABCD83ABD185ABD3
            HEX   87ABD589ABD98BABDB8DABDD8FABE191
            HEX   ABFF93ABFF95ABFF97ABFF99ABFF9DAB
            HEX   FF9BABFF9FABFFA1ABFFA3ABFFA5ABFF
            HEX   A9ABFFA7ABFFABABFFADABFFAFABFFB1
            HEX   ABFFB3ABFFB5ABFFB7ABFFB9ABFFBBAB
            HEX   FFBDE3FF69E3FF6BE3FF6DE3FF6FE3FF
            HEX   71E3FF73E3FF77E3FF75E3FF79E3FF7B
            HEX   E3FF7DE3FF7FE3FF81E3FF83E3FF85E3
            HEX   FF89E3FF87E3FF8BE3FF8DE3FF8FE3FF
            HEX   91FFFFFEFFFFFE0B0101FFFFFFABAD6A
            HEX   ABAF6CABB36EABB570ABB772ABB974AB
            HEX   BD76ABBF78ABC17AABC57CABC77EABC9
            HEX   80ABCD82ABCF84ABD186ABD588ABD78A
            HEX   ABD98CABDD8EABDF90ABE192ABFF94AB
            HEX   FF96ABFF98ABFF9AABFF9CABFF9EABFF
            HEX   A0ABFFA2ABFFA4ABFFA6ABFFA8ABFFAA
            HEX   ABFFACABFFAEABFFB0ABFFB2ABFFB4AB
            HEX   FFB6ABFFB8ABFFBAABFFBCABFFBEE3FF
            HEX   6AE3FF6CE3FF6EE3FF70E3FF72E3FF74
            HEX   E3FF76E3FF78E3FF7AE3FF7CE3FF7EE3
            HEX   FF80E3FF82E3FF84E3FF86E3FF88E3FF
            HEX   8AE3FF8CE3FF8EE3FF92E3FF90FDFDFD
            ASC   'THIS W'

*-----------------------------------
* DECODE LOGO
*-----------------------------------

decodeLOGO  STA   zpPTR2
            STY   zpPTR2+1
            LDA   fgCOLOR	; save monitor type
            PHA
            LDA   #$01		; force color
            STA   fgCOLOR
            LDA   #$00
            STA   hgrBIT7		; no high-bit
            STA   zpX1+1
            STA   zpX2+1
L5273       LDY   #$00
            LDA   (zpPTR2),Y
            STA   zpX1
            INY
            LDA   (zpPTR2),Y
            STA   zpX2
            INY
            LDA   (zpPTR2),Y	; line
            STA   zpY1
            CMP   #$FD		; exit
            BEQ   L52A7
            CMP   #$FE		; reset high-bit
            BEQ   L52AD
            CMP   #$FF		; set high-bit
            BEQ   L52B4
            JSR   drawHLINE
            LDA   KBD
            CMP   #" "
            BEQ   L52A7
L5299       CLC		; ptr +=3
            LDA   zpPTR2
            ADC   #$03
            STA   zpPTR2
            BCC   L52A4
            INC   zpPTR2+1
L52A4       JMP   L5273

L52A7       PLA		; restore monitor type
            STA   fgCOLOR
            JMP   getINPUT	; exit

L52AD       LDA   #$00		; reset high-bit
            STA   hgrBIT7
            JMP   L5299

L52B4       LDA   #$80		; set high-bit
            STA   hgrBIT7
            JMP   L5299

*-----------------------------------
* SHOW TITLE SCREEN
*-----------------------------------

showTITLESCREEN
            LDA   TXTCLR	; set GR MODE PAGE 2
            LDA   LORES
            LDA   MIXCLR
            LDA   TXTPAGE2
            LDA   #$DD		; make it yellow
            LDY   #$00
L52CB       STA   TEXT2,Y
            STA   TEXT2+$100,Y
            STA   TEXT2+$200,Y
            STA   TEXT2+$300,Y
            INY
            BNE   L52CB
            JSR   clearHGR

            LDA   #<theLOGO
            LDY   #>theLOGO
            JSR   decodeLOGO
            JSR   setHGR
            LDY   #$0A
L52E9       LDX   #$FA
            JSR   doWAIT2
            LDA   KBD
            CMP   #" "
            BEQ   L52F9
            DEY
            BPL   L52E9
            RTS
L52F9       JMP   getINPUT

*-----------------------------------
* 
*-----------------------------------

L52FC       JSR   initNEWGAME
            LDA   #$00
            STA   fgMUSIC
L5303       JSR   L531E
L5306       JSR   prepareLEVEL
            JSR   getREADY
            JSR   initGAMEDATA
L530F       JSR   L7861
            JSR   L86EA
            JSR   doFRUIT	; show/hide fruit
            JSR   blinkTHINGS	; blink what needs to be blinked
            JMP   L530F

L531E       LDA   #$01
            STA   frameCNT
            JSR   setDEFAULTBOARD
            LDA   #NBDOTS
            STA   nbDOTS
            LDA   #$40
            STA   fruitFREQ
            JSR   savePLAYERDATA
            RTS

*-----------------------------------
* SET DEFAULT BOARD
*-----------------------------------

setDEFAULTBOARD
            LDA   #<dftBOARD
            STA   zpPTR1
            LDA   #>dftBOARD
            STA   zpPTR1+1
            LDA   #<theBOARD
            STA   zpPTR2
            LDA   #>theBOARD
            STA   zpPTR2+1
            LDY   #$00
L5343       LDA   (zpPTR1),Y
            STA   (zpPTR2),Y
            INC   zpPTR2
            BNE   L534D
            INC   zpPTR2+1
L534D       INC   zpPTR1
            BNE   L5353
            INC   zpPTR1+1
L5353       LDA   zpPTR2+1
            CMP   #>dftBOARD
            BNE   L5343
            LDA   zpPTR2
            CMP   #<dftBOARD
            BNE   L5343
            RTS

*-----------------------------------
* LOAD PLAYER BOARD
*-----------------------------------

loadPLAYERBOARD
            LDA   curPLAYER
            ASL
            TAX
            LDA   tblPLAYERBOARD,X
            STA   zpPTR1
            LDA   tblPLAYERBOARD+1,X
            CLC
            ADC   #$03
            STA   zpPTR1+1
            LDA   #<theBOARD
            STA   zpPTR2
            LDA   #>theBOARD
            CLC
            ADC   #$03
            STA   zpPTR2+1

*-----------------------------------
* COPY FROM/TO BOARD BUFFER
*-----------------------------------

L537C       LDX   #$03	; $copy $380 bytes of buffer data
            LDY   #$7F	; this is a player's board
L5380       LDA   (zpPTR1),Y
            STA   (zpPTR2),Y
            DEY
            BNE   L5380
            LDA   (zpPTR1),Y
            STA   (zpPTR2),Y
            DEY
            DEC   zpPTR2+1
            DEC   zpPTR1+1
            DEX
            BPL   L5380
            RTS

*-----------------------------------
* SAVE PLAYER BOARD
*-----------------------------------

savePLAYERBOARD
            LDA   curPLAYER
            ASL
            TAX
            LDA   tblPLAYERBOARD,X
            STA   zpPTR2
            LDA   tblPLAYERBOARD+1,X
            CLC
            ADC   #$03
            STA   zpPTR2+1
            LDA   #<theBOARD
            STA   zpPTR1
            LDA   #>theBOARD
            CLC
            ADC   #$03
            STA   zpPTR1+1
            BNE   L537C

tblPLAYERBOARD	; board buffers ($380) per player
            DA    $0666	
            DA    L0C00
            DA    L1000
            DA    L1380
            DA    L1700
            DA    L1A80

*-----------------------------------
* SAVE PLAYER DATA
*-----------------------------------

savePLAYERDATA
            LDX   curPLAYER
            LDY   tbplPDOFFSET,X
            LDX   #$07
L53C5       LDA   curSCORE,X
            STA   L0300,Y
            DEY
            DEX
            BPL   L53C5
            RTS

*-----------------------------------
* LOAD PLAYER DATA
*-----------------------------------

loadPLAYERDATA
            LDX   curPLAYER
            LDY   tbplPDOFFSET,X
            LDX   #$07
L53D6       LDA   L0300,Y
            STA   curSCORE,X
            DEY
            DEX
            BPL   L53D6
            RTS

tbplPDOFFSET	; offset to each player data
            HEX   00070F171F27

*-----------------------------------
* INIT GAME DATA (AT LEVEL ENTRY)
*-----------------------------------

initGAMEDATA
            JSR   showPACMAN

            LDX   #$0D		; set Pacman default data
L53EB       LDA   dftPACMAN_DATA,X
            STA   pacmanDATA,X
            DEX
            BPL   L53EB

            LDY   #$53		; set Ghosts default data
L53F5       LDA   dftGHOSTS_DATA,Y
            STA   |ghost1DATA,Y
            DEY
            BPL   L53F5

            LDA   #$00		; set game default data
            LDY   #$06		; $59..$5F
L5402       STA   |frameCNT,Y
            DEY
            BPL   L5402

            JSR   setGHOSTMOVES
            JSR   loadPLAYERDATA
            LDA   #$01
            STA   $E9
            LDA   #$A0
            STA   $EA
            LDA   #$00
            STA   $EB
            STA   $E4
            STA   fgFRUIT
            STA   zp1F		; no more used
            JSR   getMAXRANK15
            TAX
            LDY   #$12
            LDA   L54A4,X
            STA   |ghost2DATA,Y	; $82
            LDA   L54B4,X
            STA   |ghost3DATA,Y
            LDA   L54C4,X
            STA   |ghost4DATA,Y

            LDY   #$03
L543A       LDX   #$FF
            JSR   doWAIT2
            DEY
            BPL   L543A
            JSR   getINPUT
            RTS

*-----------------------------------
* DEFAUL PACMAN AND GHOSTS DATA
*-----------------------------------

dftPACMAN_DATA
            DB    $8B	; 60
            DB    $8F	; 61
            DB    $03	; 62
            DB    $03	; 63
            DB    $2C	; 64
            DB    $2D	; 65
            DB    $00	; 66
            DB    $00	; 67
            DB    $02	; 68
            DB    $00	; 69
            DB    $0D	; 6A
            DB    $17	; 6B
            DB    $02	; 6C
            DB    $00	; 6D

dftGHOSTS_DATA
            DB    $8B	; 70 shown here instead of $84
            DB    $47	; 71
            DB    $03	; 72
            DB    $17	; 73
            DB    $18	; 74
            DA    GHOST1MOVE	; 75
            DB    $FF	; 77
            DB    $00	; 78
            DB    $00	; 79
            DB    $00	; 7A
            DB    $0D	; 7B
            DB    $0B	; 7C
            DB    $02	; 7D
            DB    $00	; 7E
            DB    $01	; 7F
            DB    $01	; 80
            DB    $00	; 81
            DB    $00	; 82
            DB    $00	; 83
*
            DB    $7F	; Ghost 2
            DB    $5D
            DB    $01
            DB    $17
            DB    $18
            DA    GHOST2MOVE
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $0B
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $01
            DB    $80
            DB    $00
*
            DB    $8B	; Ghost 3
            DB    $55
            DB    $00
            DB    $17
            DB    $18
            DA    GHOST3MOVE
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $0B
            DB    $02
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $40
            DB    $00
*
            DB    $99	; Ghost 4
            DB    $5D
            DB    $01
            DB    $17
            DB    $18
            DA    GHOST4MOVE
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $0B
            DB    $02
            DB    $00
            DB    $04
            DB    $01
            DB    $01
            DB    $A0
            DB    $00
	
L54A4       HEX   0070503030141410100E0E1010080808
L54B4       HEX   00302820201010080805050808080404
L54C4       HEX   00907040401818141412121012040A09

*-----------------------------------
* INIT NEW GAME DATA
*-----------------------------------

initNEWGAME
            LDA   #$00
            STA   curSCORE
            STA   curSCORE+1
            STA   curSCORE+2
            STA   fgDEMO
            STA   $F3
L54E0       LDA   #$01		; ZP - RANK
            STA   theRANK
            LDA   #$01
            STA   frameCNT
            LDA   #$83		; 3 lives!
            STA   nbLIVES
            LDA   #NBDOTS
            STA   nbDOTS
            LDA   #$40
            STA   fruitFREQ
            LDA   nbPLAYERS
            STA   curPLAYER
            JSR   setDEFAULTBOARD
L54FB       JSR   savePLAYERDATA
            JSR   savePLAYERBOARD
            DEC   curPLAYER
            BNE   L54FB
            LDA   #$01
            STA   curPLAYER
            RTS

*-----------------------------------
* DRAW ALL SCORES
*-----------------------------------

drawSCORES  LDA   nbPLAYERS	; get nb players
            STA   curPLAYER	; make it current

L550E       LDA   curPLAYER
            ASL
            ASL
            ASL		; *8
            TAX
            LDA   L55C7+5,X
            STA   zpTEMP4
            LDA   L55C7+6,X
            STA   zpTEMP3
            JSR   L556E
            LDA   #$00
            STA   zpX1+1
            STA   zpX2+1
            LDA   zpTEMP4
            STA   zpX1
            CLC
            ADC   #$31
            STA   zpX2
            BCC   L5534
            INC   zpX2+1
L5534       JSR   L5CF6
            LDA   curPLAYER
            BEQ   L553E
            JSR   loadPLAYERDATA
L553E       JSR   L70CC
            DEC   curPLAYER	; next player
            BMI   L5563
            BEQ   L554A
            JMP   L550E

L554A       LDA   #<sprHISCORE	; HISCORE sprite
            STA   L5591+1
            LDA   #>sprHISCORE
            STA   L5596+1
            LDA   highSCORE
            STA   curSCORE
            LDA   highSCORE+1
            STA   curSCORE+1
            LDA   highSCORE+2
            STA   curSCORE+2
            JMP   L550E

L5563       LDA   #<sprPLAYER	; reset to PLAYER# sprite
            STA   L5591+1
            LDA   #>sprPLAYER
            STA   L5596+1
            RTS

L556E       LDA   L55C7,X	; X on screen
            STA   zpXCOL
            LDA   L55C7+1,X	; Y on screen
            STA   zpY1
            LDA   L55C7+2,X	; X2
            STA   zpX2
            LDA   L55C7+3,X
            STA   zpX2+1
            LDA   L55C7+4,X	; Y2
            STA   zpY2
            LDA   #$00
            STA   zpXBIT
            LDA   #$07		; 7w and 7h
            STA   sprHEIGHT
            STA   sprWIDTH
L5591       LDA   #<sprPLAYER	; PLAYER sprite
            STA   L55B1+1
L5596       LDA   #>sprPLAYER
            STA   L55B1+2
            JSR   drawCOLORSPRITE
            LDA   curPLAYER		; skip if player 0
            BEQ   L55A5
            JSR   printDIGIT
L55A5       RTS

*-----------------------------------
* DRAW A SPRITE IN COLOR
*-----------------------------------

drawCOLORSPRITE
            JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   sprWIDTH		; number of bytes per line to output
            STA   zpTEMP2
L55B1       LDA   $0666,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            INY
            DEC   zpTEMP2
            BNE   L55B1
            STX   zpXBIT	; next X bit
            INC   zpY1	; next Y
            DEC   sprHEIGHT	; data--
            BNE   drawCOLORSPRITE
            RTS

*--- Structure (7-bytes) to display PLAYER X data

L55C7       HEX   00,54,2F,00,54,04,5C,00	; High score
            HEX   00,06,2F,00,06,04,0E,00	; P1
            HEX   20,06,0F,01,06,E4,0E,00	; P2
            HEX   00,29,2F,00,29,04,31,00	; P3
            HEX   20,29,0F,01,29,E4,31,00	; P4
            HEX   20,54,0F,01,54,E4,5C,00	; P5

* PLAYER sprite (7*7)

sprPLAYER   HEX   700910225F070A
            HEX   100A282241080A
            HEX   100A441441081F
            HEX   70097C085F070A
            HEX   1008440841021F
            HEX   1008440841040A
            HEX   107845085F080A

* HISCORE sprite (7*7)

sprHISCORE  HEX   307B7978383E38
            HEX   102A8D44444422
            HEX   10220402044502
            HEX   70227802043D1E
            HEX   10224002041502
            HEX   102A4544442422
            HEX   307B7C78384638

*-----------------------------------
* PREPARE THE COMPLETE LEVEL
*-----------------------------------

prepareLEVEL
            JSR   clearHGR
            STA   KBDSTROBE
            JSR   setHGR
            JSR   drawGAMEBOARD
            JSR   drawGHOSTDOOR
            LDA   curPLAYER	; save current player index
            STA   saveVAR
            JSR   loadPLAYERDATA
            JSR   drawDOTS
            JSR   drawSCORES
            LDA   saveVAR		; restore current player index
            STA   curPLAYER
            JSR   loadPLAYERDATA
            JSR   printRANK
            JSR   printNBLIVES
            LDA   fgDEMO
            BNE   L5691
            LDA   fgMUSIC	; did we already play the intro music? 
            BNE   L5691
            JSR   playINTROMUSIC
            LDA   #$01
            STA   fgMUSIC
L5691       RTS

*-----------------------------------
* PRINT RANK (LEVEL)
*-----------------------------------

printRANK   JMP   drawFRUITEDRANK		; LoGo

            LDA   #$E1		; display the rank number, aka the level
            STA   zpX2		; it was replaced on the released game
            LDA   #$00		; by the equivalent fruit!
            STA   zpX2+1
            LDA   #$B0
            STA   zpY2
            LDA   theRANK
            JSR   L56C3
            STA   $19
            AND   #$F0
            BEQ   L56B3
            ROR
            ROR
            ROR
            ROR
            JSR   printDIGIT
L56B3       LDA   #$E7
            STA   zpX2
            LDA   #$B0
            STA   zpY2
            LDA   $19
            AND   #$0F
            JSR   printDIGIT
            RTS

L56C3       TAX		; from hex to dec
            LDA   #$00
            SED
            CLC
L56C8       ADC   #$01
            DEX
            BNE   L56C8
            CLD
            RTS

*-----------------------------------
* PRINT NB LIVES
*-----------------------------------

printNBLIVES
            LDA   nbLIVES	; Show 2 Pacman if we have 3 lives
            AND   #$7F
            STA   $19		; save nb lives
            LDA   fgDEMO
            BNE   L56FC		; if demo, skip

            LDA   #$09	; set coordinates
            STA   zpX2
            LDA   #$00
            STA   zpX1+1
            LDA   #$B2
            STA   zpY2
            LDA   $19	; do we have lives?
            BNE   L56EA
            RTS	; no

L56EA       DEC   $19	; yes
            BEQ   L56FC
L56EE       JSR   L56FD	; print Pacman
            CLC	; next one
            LDA   zpX2
            ADC   #$0C
            STA   zpX2
            DEC   $19
            BNE   L56EE
L56FC       RTS

L56FD       LDA   zpX2	; draw Pacman sprite
            STA   zpX1
            LDA   zpY2
            STA   zpY1
            LDA   #<sprPACMANRIGHT2
            LDY   #>sprPACMANRIGHT2
            JMP   drawSPRITE

*-----------------------------------
* BLINK THINGS!
*-----------------------------------

blinkTHINGS JSR   blinkPLAYERNAME

            LDA   dotTEMPO	; blink dots
            BEQ   L5716
            DEC   dotTEMPO
            RTS

L5716       JSR   getMAXRANK15
            TAX
            LDA   tblBLINKTEMPO,X
            STA   dotTEMPO

            LDA   fgDOTS
            BEQ   L572B
            JSR   hideENERGIZERS
            LDA   #$00
            STA   fgDOTS
            RTS

L572B       JSR   showENERGIZERS
            LDA   #$01
            STA   fgDOTS
            RTS

tblBLINKTEMPO	; Tempo table
            HEX   50505050505050505050505050505050

*-----------------------------------
* HIDE ENERGIZERS
*-----------------------------------

hideENERGIZERS
            LDA   #$00		; fixed address
            STA   zpX1+1
            LDA   #>theBOARD	; go to dot 1
            STA   zpPTR2+1
            CLC
            LDA   #<theBOARD
            ADC   #$23
            STA   zpPTR2
            BCC   L5756
            INC   zpPTR2+1
L5756       LDY   #$00		; was it already eaten?
            LDA   (zpPTR2),Y
            BEQ   L5767		; yes
            LDA   #$3F		; no, erase it
            STA   zpX1
            LDA   #$15
            STA   zpY1
            JSR   hideENERGIZERDOT

L5767       CLC		; go to dot 2
            LDA   zpPTR2
            ADC   #$14
            STA   zpPTR2
            BCC   L5772
            INC   zpPTR2+1
L5772       LDY   #$00		; was it already eaten?
            LDA   (zpPTR2),Y
            BEQ   L5783		; yes
            LDA   #$3F		; no, erae it
            STA   zpX1
            LDA   #$8D
            STA   zpY1
            JSR   hideENERGIZERDOT

L5783       CLC		; go to dot 3
            LDA   #<theBOARD
            ADC   #$43
            STA   zpPTR2
            LDA   #>theBOARD
            ADC   #$03
            STA   zpPTR2+1
            LDY   #$00
            LDA   (zpPTR2),Y
            BEQ   L57A1
            LDA   #$D6
            STA   zpX1
            LDA   #$15
            STA   zpY1
            JSR   hideENERGIZERDOT

L57A1       CLC		; go to dot 4
            LDA   zpPTR2
            ADC   #$14
            STA   zpPTR2
            BCC   L57AC
            INC   zpPTR2+1
L57AC       LDY   #$00
            LDA   (zpPTR2),Y
            BEQ   L57BD
            LDA   #$D6
            STA   zpX1
            LDA   #$8D
            STA   zpY1
            JSR   hideENERGIZERDOT
L57BD       RTS

*-----------------------------------
* DRAW ENERGIZERS
*-----------------------------------

showENERGIZERS
            LDA   #$00		; same process as above
            STA   zpX1+1	; but routine draws an energizer dot
            LDA   #>theBOARD
            STA   zpPTR2+1
            CLC
            LDA   #<theBOARD
            ADC   #$23
            STA   zpPTR2
            BCC   L57D1
            INC   zpPTR2+1
L57D1       LDY   #$00
            LDA   (zpPTR2),Y
            BEQ   L57E2
            LDA   #$40
            STA   zpX1
            LDA   #$16
            STA   zpY1
            JSR   drawENERGIZERDOT

L57E2       CLC
            LDA   zpPTR2
            ADC   #$14
            STA   zpPTR2
            BCC   L57ED
            INC   zpPTR2+1
L57ED       LDY   #$00
            LDA   (zpPTR2),Y
            BEQ   L57FE
            LDA   #$40
            STA   zpX1
            LDA   #$8E
            STA   zpY1
            JSR   drawENERGIZERDOT

L57FE       CLC
            LDA   #<theBOARD
            ADC   #$43
            STA   zpPTR2
            LDA   #>theBOARD
            ADC   #$03
            STA   zpPTR2+1
            LDY   #$00
            LDA   (zpPTR2),Y
            BEQ   L581C
            LDA   #$D6
            STA   zpX1
            LDA   #$16
            STA   zpY1
            JSR   drawENERGIZERDOT

L581C       CLC
            LDA   zpPTR2
            ADC   #$14
            STA   zpPTR2
            BCC   L5827
            INC   zpPTR2+1
L5827       LDY   #$00
            LDA   (zpPTR2),Y
            BEQ   L5838
            LDA   #$D6
            STA   zpX1
            LDA   #$8E
            STA   zpY1
            JSR   drawENERGIZERDOT
L5838       RTS

*-----------------------------------
* SHOW PACMAN (at its initial pos)
*-----------------------------------

showPACMAN  LDA   #$8B	; draw Pacman at its initial position
            STA   zpX1
            LDA   #$8F
            STA   zpY1
            LDA   #$00
            STA   zpX1+1
            LDA   #$00
            STA   hgrBIT7
            LDA   #<sprPACMANFULL	; fully closed
            LDY   #>sprPACMANFULL	; fully closed
            JMP   drawSPRITE

*-----------------------------------
* GET READY!!
*-----------------------------------

getREADY    JSR   showPACMAN
            LDA   fgDEMO	; are we playing?
            BEQ   L585A
            JMP   showGAMEOVER	; no, demo

L585A       LDA   #$68		; yes...
            STA   zpY1
            LDA   #$00
            STA   zpXBIT
            LDA   #$05
            STA   sprWIDTH
            LDA   #$07
            STA   sprHEIGHT
            LDA   #$11
            STA   zpXCOL
            LDA   #<sprREADY	; show the READY sprite
            STA   L55B1+1
            LDA   #>sprREADY
            STA   L55B1+2
            JSR   drawCOLORSPRITE
            LDY   #$08
L587D       LDX   #$FF
            JSR   doWAIT2
            DEY
            BNE   L587D
            LDA   #$10		; and now, erase the sprite
            STA   zpXCOL
            LDA   #$66
            STA   zpY1
            JMP   eraseBLOCK

* Ready! sprite

sprREADY    HEX   787C0C0F49
            HEX   0805125148
            HEX   4402524824
            HEX   3C1E4F0823
            HEX   0641280411
            HEX   4A40144200
            HEX   312F742104

*-----------------------------------
* BLINK PLAYER NAME
*-----------------------------------

blinkPLAYERNAME
            LDA   frameCNT
            CMP   #$01
            BNE   L58C6
            LDA   fgDEMO
            BEQ   L58C0
            JSR   showGAMEOVER
L58C0       LDA   $E5
            BEQ   L58C7
            DEC   $E5
L58C6       RTS

*-----------------------------------
* 
*-----------------------------------

L58C7       JSR   getMAXRANK15
            TAX
            LDA   L5903,X
            STA   $E5
            LDA   $E6
            BEQ   L58DF
            JSR   erasePLAYER
            LDA   #$00
            STA   $E6
            CLC
            ROR   $E5
            RTS

L58DF       JSR   L58FA
            LDA   #$01
            STA   $E6
            RTS

*-----------------------------------
* ERASE PLAYER# ON SCREEN (BLINK)
*-----------------------------------

erasePLAYER
            LDA   curPLAYER		; get player index
            ASL
            TAX
            LDA   L6992,X	; get X
            STA   zpXCOL
            LDA   L6992+1,X	; and Y
            SBC   #$0E		; - 14
            STA   zpY1
            JMP   eraseBLOCK		; erase PLAYER# sprite

*-----------------------------------
* 
*-----------------------------------

L58FA       LDA   curPLAYER
            ASL
            ASL
            ASL		; *8
            TAX
            JMP   L556E

L5903       DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08

*-----------------------------------
* DRAW A DOT ON SCREEN
*-----------------------------------

drawDOT     LDA   xBITON,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            RTS

            LDA   xBITOFF,X	; this erases a dot
            AND   (zpHGR),Y	; but it is useless
            ORA   hgrBIT7
            STA   (zpHGR),Y
            RTS

xBITON      HEX   01020408102040
xBITOFF     HEX   FEFDFBF7EFDFBF

*-----------------------------------
* CALCULATE HGR X-COORDS
*-----------------------------------

calcXYHGR   LDA   zpX1+1	; address in 0-255?
            BEQ   L594B		; yup
            CLC		; no, after
            LDA   zpX1
            ADC   #$04
            TAX
            CLC
            LDA   tblXBYT,X
            ADC   #$24
            STA   zpXCOL	; to the right of the board
            LDA   tblXBIT,X
            STA   zpXBIT	; the x-sprite offset
            RTS

L594B       LDX   zpX1		; from x-coord
            LDA   tblXBYT,X
            STA   zpXCOL	; to x-screen
            LDA   tblXBIT,X
            STA   zpXBIT	; and x-sprite offset
            RTS

*--- X-coord to Y-byte

tblXBIT     HEX   00010203040506000102030405060001
            HEX   02030405060001020304050600010203
            HEX   04050600010203040506000102030405
            HEX   06000102030405060001020304050600
            HEX   01020304050600010203040506000102
            HEX   03040506000102030405060001020304
            HEX   05060001020304050600010203040506
            HEX   00010203040506000102030405060001
            HEX   02030405060001020304050600010203
            HEX   04050600010203040506000102030405
            HEX   06000102030405060001020304050600
            HEX   01020304050600010203040506000102
            HEX   03040506000102030405060001020304
            HEX   05060001020304050600010203040506
            HEX   00010203040506000102030405060001
            HEX   02030405060001020304050600010203

*--- X-coord to Y-col

tblXBYT     HEX   00000000000000010101010101010202
            HEX   02020202020303030303030304040404
            HEX   04040405050505050505060606060606
            HEX   06070707070707070808080808080809
            HEX   0909090909090A0A0A0A0A0A0A0B0B0B
            HEX   0B0B0B0B0C0C0C0C0C0C0C0D0D0D0D0D
            HEX   0D0D0E0E0E0E0E0E0E0F0F0F0F0F0F0F
            HEX   10101010101010111111111111111212
            HEX   12121212121313131313131314141414
            HEX   14141415151515151515161616161616
            HEX   16171717171717171818181818181819
            HEX   1919191919191A1A1A1A1A1A1A1B1B1B
            HEX   1B1B1B1B1C1C1C1C1C1C1C1D1D1D1D1D
            HEX   1D1D1E1E1E1E1E1E1E1F1F1F1F1F1F1F
            HEX   20202020202020212121212121212222
            HEX   22222222222323232323232324242424

*-----------------------------------
* SET HGR ADDRESS
*-----------------------------------

setHGRADDRESS
            LDX   zpY1
            LDA   tblHGRL,X
            STA   zpHGR
            LDA   tblHGRH,X
            ORA   #>HGR
            STA   zpHGR+1
            RTS

*--- The HGR tables

tblHGRL     HEX   00000000000000008080808080808080
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
tblHGRH     HEX   0004080C1014181C0004080C1014181C
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

*-----------------------------------
* GET NEXT X BIT (0..7)
*-----------------------------------

getNEXTXBIT INX	; next X-bit
            CPX   #$07
            BCC   L5CEF
            LDX   #$00	; loop done
            INY	; next Y-coord
L5CEF       RTS

*-----------------------------------
* DRAW LINE
*-----------------------------------

drawHLINE   LDA   #$00
            STA   zpX1+1
            STA   zpX2+1
L5CF6       JSR   setHGRADDRESS
            JSR   calcXYHGR
            LDX   zpXBIT
            LDY   zpXCOL
L5D00       JSR   drawDOT
            LDA   (zpHGR),Y
            AND   #$7F
            ORA   hgrBIT7
            STA   (zpHGR),Y
            LDA   fgCOLOR
            BEQ   L5D31
            JSR   getNEXTXBIT
            JSR   getNEXTXBIT
            CLC
            LDA   zpX1
            ADC   #$02
            STA   zpX1
            BCC   L5D20
            INC   zpX1+1
L5D20       LDA   zpX1+1	; end of X?
            CMP   zpX2+1
            BCC   L5D00
            BEQ   L5D2A
            BCS   L5D30
L5D2A       LDA   zpX2
            CMP   zpX1
            BCS   L5D00
L5D30       RTS		; yes!

L5D31       JSR   getNEXTXBIT
            INC   zpX1
            BNE   L5D20
            INC   zpX1+1
            JMP   L5D20

*-----------------------------------
* DRAW A VERTICAL LINE
*-----------------------------------

drawVLINE   JSR   calcXYHGR
L5D40       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            JSR   drawDOT
            INC   zpY1	; next Y
            LDA   zpY2	; Y-end reached?
            CMP   zpY1
            BCS   L5D40	; no, loop
            RTS	; yes, exit

*-----------------------------------
* DRAW GAME BOARD
*-----------------------------------

drawGAMEBOARD
            LDA   #$80
            STA   hgrBIT7
            LDA   fgCOLOR
            BEQ   L5D66
            LDA   #<boardBW
            STA   zpPTR2
            LDA   #>boardBW
            STA   zpPTR2+1
            JMP   L5D6E

L5D66       LDA   #<boardCOLOR
            STA   zpPTR2
            LDA   #>boardCOLOR
            STA   zpPTR2+1
L5D6E       LDA   #$00
            STA   zpX1+1
            LDA   #$48		; $48 entries for horizontal line
            STA   zpTEMP1
L5D76       LDY   #$00
            LDA   (zpPTR2),Y
            STA   zpX1		; x from
            INY
            LDA   (zpPTR2),Y
            STA   zpX2		; x to
            INY
            LDA   (zpPTR2),Y
            STA   zpY1		; y
            JSR   drawHLINE
            CLC
            LDA   #$03
            ADC   zpPTR2
            STA   zpPTR2
            BCC   L5D94
            INC   zpPTR2+1
L5D94       DEC   zpTEMP1
            BNE   L5D76

            LDA   #$46		; $46 entries for vertical line
            STA   zpTEMP1
L5D9C       LDY   #$00
            LDA   (zpPTR2),Y
            STA   zpX1
            INY
            LDA   (zpPTR2),Y
            STA   zpY1
            INY
            LDA   (zpPTR2),Y
            STA   zpY2
            JSR   drawVLINE
            CLC
            LDA   zpPTR2
            ADC   #$03
            STA   zpPTR2
            BCC   L5DBA
            INC   zpPTR2+1
L5DBA       DEC   zpTEMP1
            BNE   L5D9C
            RTS

*--- The board in color

boardCOLOR  HEX   3C89058B8E1D90DD05C1DD3CC1E153C1
            HEX   E160C1DD77D3DD96D3DD9B3CDDBA3C46
            HEX   9B3C46963C58773958603958533C583C
            HEX   49581249581D677C12677C1D9DB2129D
            HEX   B21DC1D012C1D01D49582A49582FC1D0
            HEX   2AC1D02F79A04E79A065676A60686A77
            HEX   AFB260AFB277677C84677C899DB2849D
            HEX   B28949588455589B495389C1D084C6D0
            HEX   89C1C49B676A2A6C7C3C6C7C41676A53
            HEX   79A02A90A02F8B8E4179892FAFB22AAF
            HEX   B2539DAD419DAD3C79A07290A0778B8E
            HEX   89798977676A966C7CA8497CAD4965A8
            HEX   79A09690A09B8B8EAD79899BAFB296B4
            HEX   D0A89DD0AD9DADA88A061C8F061CDE06
            HEX   3BC03D52C06176DE7895D2979ADE9CB9
            HEX   3B9CB947979A3B7895596176593D523B
            HEX   063B59131C48131C7D131C66131CB313
            HEX   1C9C131CD1131CC0131C592B2E482B2E
            HEX   D12B2EC02B2EA14F64784F646B617666
            HEX   6176B36176AE61767D8588668588B385
            HEX   889C858859859A548A9A488588D18588
            HEX   C58A9AC0859A6B2B3B7D3D406B425266
            HEX   2B52A12B2E8F30408A3040782B2EB32B
            HEX   52AE42529C3D40AE2B3BA173768F7888
            HEX   8A78887873766B97A77DA9AC48A9AC66
            HEX   97A7A1979A8F9CAC8A9CAC78979AB397
            HEX   A7D1A9AC9CA9ACAE97A7

*--- The board in black & white

boardBW     HEX   3C88058C8E1D90DC05C2DC3CC2E253C2
            HEX   E260C2DC77D4DC96D4DC9B3CDCBA3C44
            HEX   9B3C44963C56773856603856533C563C
            HEX   4A56124A561D687A12687A1D9EB0129E
            HEX   B01DC2CE12C2CE1D4A562A4A562FC2CE
            HEX   2AC2CE2F7A9E4E7A9E65686A60686A77
            HEX   B0B260B0B277687A84687A899EB0849E
            HEX   B0894A568456589B4A5289C2CE84C8CE
            HEX   89C2C49B686A2A6C7A3C6C7A41686A53
            HEX   7A9E2A909E2F8C8E417A882FB0B22AB0
            HEX   B2539EAC419EAC3C7A9E72909E778C8E
            HEX   897A8877686A966C7AA84A7AAD4A64A8
            HEX   7A9E96909E9B8C8EAD7A889BB0B296B4
            HEX   CEA89ECEAD9EACA88A061C8E061CDE06
            HEX   3BC03D52C06176DE7895D2979ADE9CB9
            HEX   3A9CB946979A3A7895586176583D523A
            HEX   063B58131C48131C7C131C66131CB213
            HEX   1C9C131CD0131CC0131C582B2E482B2E
            HEX   D02B2EC02B2EA04F64784F646A617666
            HEX   6176B26176AE61767C8588668588B285
            HEX   889C858858859A548A9A488588D08588
            HEX   C48A9AC0859A6A2B3B7C3D406A425266
            HEX   2B52A02B2E8E30408A3040782B2EB22B
            HEX   52AE42529C3D40AE2B3BA073768E7888
            HEX   8A78887873766A97A77CA9AC48A9AC66
            HEX   97A7A0979A8E9CAC8A9CAC78979AB297
            HEX   A7D0A9AC9CA9ACAE97A7

*-----------------------------------
* DRAW ALL REMAINING DOTS
*-----------------------------------
* 0: empty
* 1: normal dot
* 2: energy dot
*
* The board is stored per column!!

drawDOTS    LDA   #<theBOARD
            STA   zpPTR2
            LDA   #>theBOARD
            STA   zpPTR2+1
            LDA   #$3B	; draw at X=$3B
            STA   zpX2
L611F       LDA   #$01	; index in board
            STA   $19
            LDA   #$0B	; draw at Y=$B
            STA   zpY2
L6127       LDY   $19
            LDA   (zpPTR2),Y
            BEQ   L614D	; empty
            ROR
            BCS   L6142
            LDA   zpX2	; move X/Y coord
            STA   zpX1	; by -1
            DEC   zpX1
            LDA   zpY2
            STA   zpY1
            DEC   zpY1
            JSR   drawENERGIZERDOT	; draw energizer dot
            CLC
            BCC   L614D
L6142       LDA   zpX2
            STA   zpX1
            LDA   zpY2
            STA   zpY1
            JSR   drawNORMALDOT	; draw standard dot
	
L614D       CLC	; next Y on board
            LDA   zpY2
            ADC   #$06
            STA   zpY2

            INC   $19	; next X-board
            LDA   $19	; end of line?
            CMP   #$1F
            BCC   L6127
            LDA   zpPTR2	; yes, next board line
            ADC   #$1F
            STA   zpPTR2
            BCC   L6166
            INC   zpPTR2+1
L6166       CLC	; next X
            LDA   zpX2
            ADC   #$06
            STA   zpX2
            CMP   #$DD	; until last line
            BCC   L611F
            RTS

*-----------------------------------
* DRAW DOT
*-----------------------------------

drawNORMALDOT
            JSR   calcXYHGR	; calculate address
            ASL   zpXBIT	; word table (two bytes to draw)
            JSR   setHGRADDRESS	; make it a HGR address
            LDX   zpXBIT	; offset in X
            LDY   zpXCOL	; destination X in Y
            LDA   L61A8,X	; output first byte
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            INY
            LDA   L61A8,X	; output second byte
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INC   zpY1		; next line
            JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   L61A8,X	; output same first byte
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            INY
            LDA   L61A8,X	; output same second byte
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            RTS

*--- Dot sprite (value depends on bit position)

L61A8       HEX   0300	; x=0
            HEX   0600	; x=1
            HEX   0C00	; etc...
            HEX   1800
            HEX   3000
            HEX   6000
            HEX   4001

*-----------------------------------
* DRAW ENERGIZER DOT
*-----------------------------------

drawENERGIZERDOT
            LDA   #<L61CA
            STA   L6950+1
            STA   L6959+1
            LDA   #>L61CA
            STA   L6950+2
            STA   L6959+2
            JSR   L693A
            RTS

*--- Energizer dot sprite (value depends on bit position)

L61CA       HEX   8680	; 1000_0110_1000_0000
            HEX   8F80	; 1000_1111_1000_0000
            HEX   8F80	; 1000_1111_1000_0000
            HEX   8680	; 1000_0110_1000_0000
            HEX   8080	; 1000_0000_1000_0000
            HEX   8080	; 1000_0000_1000_0000
            HEX   8080	; 1000_0000_1000_0000
            HEX   8080	; 1000_0000_1000_0000

            HEX   8C80	; bit 1
            HEX   9E80
            HEX   9E80
            HEX   8C80
            HEX   8080
            HEX   8080
            HEX   8080
            HEX   8080

            HEX   9880	; bit 2
            HEX   BC80
            HEX   BC80
            HEX   9880
            HEX   8080
            HEX   8080
            HEX   8080
            HEX   8080

            HEX   B080	; bit 3
            HEX   F880
            HEX   F880
            HEX   B080
            HEX   8080
            HEX   8080
            HEX   8080
            HEX   8080

            HEX   E080	; bit 4
            HEX   F081
            HEX   F081
            HEX   E080
            HEX   8080
            HEX   8080
            HEX   8080
            HEX   8080

            HEX   C081	; bit 5
            HEX   E083
            HEX   E083
            HEX   C081
            HEX   8080
            HEX   8080
            HEX   8080
            HEX   8080

            HEX   8083	; bit 6
            HEX   C087
            HEX   C087
            HEX   8083
            HEX   8080
            HEX   8080
            HEX   8080
            HEX   8080

*-----------------------------------
* CURRENT BOARD (32-Y x 28-X)
*-----------------------------------

theBOARD    HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010FFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010AFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF
            HEX   1010BFBF1010AFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF1010BFBF

*-----------------------------------
* DEFAULT BOARD (STORED PER COLUMN)
*-----------------------------------
* The first byte is not used to make 32b wide
* Turn your head 90¡ to the left to see where the dots are

dftBOARD    HEX   0000000000000000000000000000000000000000000000000000000000000000
            HEX   0001010201010101010000000000000000000000010101020000010101010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010000010000000000000000000000010000010101010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001010101010101010101010101010101010101010101010101010000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001000000010101010000000000000000000000010000010101010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001010101010000010101000000000000000000010101010000010101010000
            HEX   0000000000010000000000000000000000000000000000000000000000010000
            HEX   0000000000010000000000000000000000000000000000000000000000010000
            HEX   0001010101010000010101000000000000000000010101010000010101010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001000000010101010000000000000000000000010000010101010000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001000000010000000000000000000000000000010000010000000000010000
            HEX   0001010101010101010101010101010101010101010101010101010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001000000010000010000000000000000000000010000000000010000010000
            HEX   0001000000010000010000000000000000000000010000010101010000010000
            HEX   0001000000010000010000000000000000000000010000010000010000010000
            HEX   0001010201010101010000000000000000000000010101020000010101010000
            HEX   0000000000000000000000000000000000000000000000000000000000000000

*-----------------------------------
* DRAW BIG SPRITE (8 LINES)
*-----------------------------------

L693A       LDA   #$F8
            STA   sprHEIGHT
            JSR   calcXYHGR
            LDA   zpXBIT
            ASL
            ASL
            ASL
            ASL	; *16
            STA   zpXBIT
L6949       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
L6950       LDA   $0666,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INY
            INX
L6959       LDA   $0666,X
            ORA   (zpHGR),Y
            STA   (zpHGR),Y
            INX
            STX   zpXBIT
            INC   zpY1
            INC   sprHEIGHT
            BNE   L6949
            RTS

*-----------------------------------
* ERASE SCORE
*-----------------------------------

eraseSCORE  LDA   curPLAYER		; get current player
            ASL			; and set the coordinates
            TAX
            LDA   L6992,X
            STA   zpXCOL
            LDA   L6992+1,X
            STA   zpY1

*-----------------------------------
* ERASE BLOCK
*-----------------------------------

eraseBLOCK  LDA   #$0C		; 12 lines to erase
            STA   sprHEIGHT
L697C       JSR   setHGRADDRESS
            LDY   zpXCOL
            LDX   #$08		; clear 8 bytes
            LDA   #$80
L6985       STA   (zpHGR),Y
            INY
            DEX
            BNE   L6985
            INC   zpY1		; screen line++
            DEC   sprHEIGHT		; nb lines--
            BNE   L697C
            RTS

*--- X/Y of each score on scren

L6992       HEX   00,5E	; High score
            HEX   00,10	; P1
            HEX   20,10	; P2
            HEX   00,33	; P3
            HEX   20,33	; P4
            HEX   20,5E	; P5

*-----------------------------------
* ERASE A SPRITE
*-----------------------------------

eraseSPRITE44
            JSR   moveCURSOR44

L69A1       LDA   #$F6		; 10 lines to erase
            STA   sprHEIGHT
            JSR   calcXYHGR
            ASL   zpXBIT
            ASL   zpXBIT
L69AC       JSR   setHGRADDRESS
            LDA   #$03		; width
            STA   zpTEMP2
            LDX   zpXBIT
            LDY   zpXCOL
L69B7       LDA   L69CD,X
            AND   (zpHGR),Y
            ORA   #$80
            STA   (zpHGR),Y
            INY
            INX
            DEC   zpTEMP2
            BNE   L69B7
            INC   zpY1		; Y+=1
            INC   sprHEIGHT	; data++
            BNE   L69AC
            RTS

L69CD       HEX   00787F00
            HEX   01707F00
            HEX   03607F00
            HEX   07407F00
            HEX   0F007F00
            HEX   1F007E00
            HEX   3F007C00

*-----------------------------------
* ERASE A SPRITE
*-----------------------------------

eraseSPRITE54
            JSR   moveCURSOR54

            LDA   #<L6A04	; set erase table
            LDY   #>L6A04
            STA   L69B7+1
            STY   L69B7+2
            JSR   L69A1		; erase it

            LDA   #<L69CD	; restore the standard 4*4 table
            LDY   #>L69CD
            STA   L69B7+1
            STY   L69B7+2
            RTS

L6A04       HEX   00607F00
            HEX   01407F00
            HEX   03007F00
            HEX   07007E00
            HEX   0F007C00
            HEX   1F007800
            HEX   3F007000

*-----------------------------------
* DRAW SPRITE
*-----------------------------------

drawSPRITE  LDX   fgCOLOR
            BEQ   L6A28
            LDX   hgrBIT7
            BNE   L6A62

L6A28       STA   L6A4A+1	; b&w
            STY   L6A4A+2
            JSR   moveCURSOR44
            LDA   #$0A
            STA   sprHEIGHT
            LDA   #$03
            STA   sprWIDTH
            JSR   calcXYHGR
            JSR   calcSPROFFSET
L6A3F       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   sprWIDTH
            STA   zpTEMP2
L6A4A       LDA   $0666,X
            ORA   (zpHGR),Y
            AND   #$7F
            STA   (zpHGR),Y
            INX
            INY
            DEC   zpTEMP2
            BNE   L6A4A
            STX   zpXBIT
            INC   zpY1
            DEC   sprHEIGHT
            BNE   L6A3F
            RTS

L6A62       STA   L55B1+1	; color
            STY   L55B1+2
            JSR   moveCURSOR44
            LDA   #$0A
            STA   sprHEIGHT
            JSR   calcXYHGR
            JSR   calcSPROFFSET
            LDA   #$03
            STA   sprWIDTH
            JMP   drawCOLORSPRITE

*-----------------------------------
* SHOW/HIDE/HANDLE FRUIT
*-----------------------------------

doFRUIT     LDA   fruitFREQ	; are we already in fruit mode?
            BNE   L6AA7		; yes
            LDA   theRANK	; no, set data
            CMP   #$1A
            BCC   L6A88
            LDA   #$1A
L6A88       ASL
            ASL
            TAX
            LDA   tblFRUITS,X	; pointer
            STA   ptrFRUIT
            LDA   tblFRUITS+1,X
            STA   ptrFRUIT+1
            LDA   tblFRUITS+2,X	; counter
            STA   fruitCNT
            LDA   tblFRUITS+3,X
            STA   fruitCNT+1
            LDA   #$60		; tempo
            STA   fruitFREQ
            LDA   #$01		; set fruit mode
            STA   fgFRUIT

L6AA7       LDA   frameCNT	; check frame
            CMP   #$01
            BNE   L6AFA		; exit
            LDA   fgFRUIT	; are we in fruit mode?
            BEQ   L6AFA		; no, exit

            LDA   fruitCNT	; check counter
            BNE   L6AB7
            DEC   fruitCNT+1
L6AB7       DEC   fruitCNT
            CLC
            LDA   fruitCNT
            ADC   fruitCNT+1
            BNE   L6AC2
            BCC   hideFRUIT	; counter = 0, hide

L6AC2       LDA   fgFRUIT	; are we in fruit mode?
            CMP   #$01
            BEQ   showFRUIT	; yes, show

            LDA   #$91		; set data based
            STA   zpX2		; on level
            LDA   #$00
            STA   zpX2+1
            STA   deciSCORE
            STA   deciSCORE+2
            LDA   #$68
            STA   zpY2
            JSR   getMAXRANK15
            TAX
            LDA   tblSCORE,X
            STA   deciSCORE+1
            JMP   L70F5

showFRUIT   LDA   ptrFRUIT
            LDY   ptrFRUIT+1
            JMP   drawFRUIT

hideFRUIT   LDA   #$10
            STA   zpXCOL
            LDA   #$66
            STA   zpY1
            LDA   #$00		; hide fruit
            STA   fgFRUIT
            JSR   eraseBLOCK

L6AFA       RTS

hideFRUIT2   JMP   hideFRUIT	; could have been avoided by
			; jumping to hideFRUIT directly

*-----------------------------------
* FRUITS TABLE
*-----------------------------------

tblFRUITS   DA    $0000		; +0: pointer to sprite
            DW    $0000		; +2: delay before appearance
            DA    L6B6E
            DW    $0100
            DA    L6B92
            DW    $0100
            DA    L6BB6
            DW    $0100
            DA    L6BB6
            DW    $0100
            DA    L6BDA
            DW    $0120
            DA    L6BDA
            DW    $0120
            DA    L6BFE
            DW    $0130
            DA    L6BFE
            DW    $0130
            DA    L6C22
            DW    $0140
            DA    L6C22
            DW    $0140
            DA    L6C46
            DW    $0160
            DA    L6C46
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C6A
            DW    $0160
            DA    L6C8E
            DW    $0200
            DA    L6C6A
            DW    $0200
            DA    L6C6A
            DW    $0200
            DA    L6C6A
            DW    $0200
            DA    L6C6A
            DW    $0200

L6B6E       HEX   550000040200040800102000902085D4
            HEX   0095DC0097DDA2D7D5A2D5D40095D400
            HEX   95900094
L6B92       HEX   002A05102A1540A41140A286509A8500
            HEX   AE8700B285008A8600EC8500A8840088
            HEX   8100A081
L6BB6       HEX   002A00402000C08200500A00D4AE0054
            HEX   E300D4AA00542A00D4AA00500A00C082
            HEX   00400200
L6BDA       HEX   000A00000100B89D00D4AB00D4AA00D4
            HEX   AA00D4AA00D4AA00C89200D08A009089
            HEX   00E08600
L6BFE       HEX   000A0040000040000050020050020054
            HEX   0B00540E005C0A00540A005002004000
            HEX   00000000
L6C22       HEX   000000900000B40000928100B28100BA
            HEX   8100BA8100BA8100928100B80000B800
            HEX   00900000
L6C46       HEX   900000900000E08100E08100F08200F0
            HEX   8200F88600E88700EC8F00EE9F00C000
            HEX   00C00000
L6C6A       HEX   B88100888100888100B00000F08100B0
            HEX   0000F08000B00000F08100F00000B000
            HEX   00F00000
L6C8E       HEX   0000004A04002A05006E05002A1D0000
            HEX   00005B3B00552A00552A005B3B000000
            HEX   00000000

*-----------------------------------
* ADD TO SCORE
*-----------------------------------

addTOSCORE  LDX   fgDEMO
            BNE   L6CD3
            JSR   getMAXRANK15
            TAX
            CLC
            SED
            LDA   curSCORE+1
            ADC   tblSCORE,X
            STA   curSCORE+1
            LDA   curSCORE+2
            ADC   #$00
            STA   curSCORE+2
            CLD
            JSR   eraseSCORE
            JSR   displayPLAYERSCORE
            JSR   L7C61
L6CD3       RTS

tblSCORE    HEX   00,01,03,05,05,07,07,10,10,20,20,30,30,50,50,50,50,50

*-----------------------------------
* PATIENTLY WAIT
*-----------------------------------

doWAIT      LDX   #$01
doWAIT2     LDA   #$8F
L6CEA       SEC
            SBC   #$01
            BCS   L6CEA
            DEX
            BNE   doWAIT2
            RTS
L6CF3       RTS

*-----------------------------------
* WE WON! GO TO NEXT LEVEL
*-----------------------------------

gotoNEXTLEVEL
            JSR   L58FA
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            JSR   setXYPACMAN
            JSR   L79A4

            LDY   #$0B
L6D05       LDX   #$FF
            JSR   doWAIT2
            DEY
            BNE   L6D05

            JSR   playCARTOON
            INC   theRANK	; ZP next level?
            JSR   L531E
            JSR   prepareLEVEL
            JSR   initGAMEDATA
            JMP   L530F

*-----------------------------------
* GET MAX RANK MOD 15
*-----------------------------------

getMAXRANK15
            LDA   theRANK
            CMP   #$0F
            BCC   L6D26
            LDA   #$0F
L6D26       RTS

*-----------------------------------
* GET MAX RANK MOD 21
*-----------------------------------

getMAXRANK21
            LDA   theRANK
            CMP   #$15
            BCC   L6D2F
            LDA   #$15
L6D2F       RTS

*-----------------------------------
* SET GHOST INITIAL POSITION
*-----------------------------------

setGHOSTINITIALPOSITION
            LDA   ghostINDEX
            ASL
            TAX
            LDA   tblGIPOS,X
            STA   ghostX
            LDA   tblGIPOS+1,X
            STA   ghostY
            RTS

tblGIPOS    HEX   0000
            HEX   8B55
            HEX   7F5D
            HEX   8B55
            HEX   995D

*-----------------------------------
* 
*-----------------------------------

L6D49       LDA   #$00		; ghosts are not frightened
            LDX   #$08
            STA   ghost1DATA,X
            STA   ghost2DATA,X
            STA   ghost3DATA,X
            STA   ghost4DATA,X
            STA   ghostDATA+8
            STA   $E4
            STA   $E9
            LDA   #score200	; and the default
            STA   bonusINDEX
            RTS

*-----------------------------------
* GHOSTS ARE FRIGHTENED
*-----------------------------------
* (b/c we ate a pacgum)

makeGHOSTSFRIGTHENED
            LDX   theRANK	; ghosts are invincible
            CPX   #$15		; as from level 21
            BCS   L6DA0

            LDA   #gCLYDE	; we have 4 ghosts
            STA   ghostINDEX
L6D6A       JSR   setGHOSTSDATA
            LDA   ghostISDEAD
            BNE   L6D75
            LDA   #$01
            STA   ghostFRIGHTENED
L6D75       JSR   getGHOSTSDATA
            DEC   ghostINDEX
            BNE   L6D6A
            LDA   #score200
            STA   bonusINDEX
            LDA   #$01
            STA   $E4
            JSR   getMAXRANK21
            ASL
            TAX
            LDA   L6DEF,X
            STA   $E1
            LDA   L6DEF+1,X
            STA   $E2
            LDA   #$04
            STA   $EA
            STA   $EB
            LDA   #$01
            STA   $E9
            JSR   L80C1
L6DA0       RTS

L6DA1       LDY   ghostMOVEINDEX
            INY
            LDA   ghostINDEX
            CMP   #gINKY
            BEQ   L6DDE
            CMP   #gBLINKY
            BEQ   L6DDE

            LDA   #$01	; for Pinky / Clyde
            STA   (ghostMOVE),Y
            INY
            LDA   #$00
            STA   (ghostMOVE),Y
            INY
            LDA   ghostINDEX
            CMP   #gPINKY
            BEQ   L6DC4
            LDA   #$03
            STA   (ghostMOVE),Y
            BNE   L6DC8
L6DC4       LDA   #$02
            STA   (ghostMOVE),Y

L6DC8       INY	; for all ghosts
            LDA   #$01
            STA   (ghostMOVE),Y
            INY
            STA   (ghostMOVE),Y
            INY
            LDA   #$03
            STA   (ghostMOVE),Y
            INY
            LDA   #$FF
            STA   (ghostMOVE),Y
            JSR   getGHOSTSDATA
            RTS

L6DDE       LDA   #$00	; for Inky/Blinky
            STA   (ghostMOVE),Y
            INY
            LDA   #$01
            STA   (ghostMOVE),Y
            INY
            LDA   #$00
            STA   (ghostMOVE),Y
            BEQ   L6DC8
            RTS

L6DEF       DB    $00
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $C0
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $01
            DB    $50
            DB    $00
            DB    $50
            DB    $00
            DB    $40
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $FF
            DB    $FF
            DB    $B0
            DB    $00
            DB    $10
            DB    $00
            DB    $30
            DB    $00
            DB    $30
            DB    $00
            DB    $B0
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L6E19       DB    $40
L6E1A       DB    $00
            DB    $30
            DB    $00
            DB    $20
            DB    $00
            DB    $20
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $02
            DB    $00
            DB    $03
            DB    $02
            DB    $00
            DB    $03
            DB    $01
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $03
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $03
            DB    $03
            DB    $00
            DB    $00
            DB    $02
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $01
            DB    $03
            DB    $03
            DB    $02
            DB    $02
            DB    $01
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $03
            DB    $02
            DB    $01
            DB    $01
            DB    $02
            DB    $00
            DB    $02
            DB    $01
            DB    $01
            DB    $03

*-----------------------------------
* SET DEFAULT GHOST MOVE IN BOARDS
*-----------------------------------

setGHOSTMOVES
            LDY   #$0E
L6E7B       LDA   L8A44,Y
            STA   GHOST1MOVE,Y	; TEXT2,Y
            DEY
            BPL   L6E7B

            LDY   #$00
            LDX   #$01
L6E88       LDA   #$00
            STA   GHOST3MOVE,Y	; TEXT2+$200,Y
            STA   GHOST2MOVE,X	; TEXT2+$100,X
            STA   GHOST4MOVE,X	; TEXT2+$300,X
            INX
            INY
            LDA   #$01
            STA   GHOST3MOVE,Y	; TEXT2+$200,Y
            STA   GHOST2MOVE,X	; TEXT2+$100,X
            STA   GHOST4MOVE,X	; TEXT2+$300,X
            INX
            INY
            BNE   L6E88
            RTS

*-----------------------------------
* 
*-----------------------------------

L6EA5       LDA   ghostINDEX
            ASL
            TAX
            LDA   L8A3A,X
            STA   L6EB7+1
            LDA   L8A3A+1,X
            STA   L6EB7+2
            LDX   #$00
L6EB7       LDA   $0666,X
            STA   (ghostMOVE),Y
            INY
            INX
            CPX   #$10
            BNE   L6EB7
            RTS

*-----------------------------------
* END OF THE GAME
*-----------------------------------

endGAME     JSR   hideFRUIT2	; erase the fruit
            JSR   showGAMEOVER	; show GAME OVER
            LDA   #$01		; enter demo mode
            STA   fgDEMO
            LDY   #$30		; wait
L6ECF       LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L6ECF
            JMP   welcomePAGE	; and return home

*-----------------------------------
* DRAW FRUIT
*-----------------------------------

drawFRUIT   LDX   #$66
            STX   zpY1
            LDX   #$13
            STX   zpXCOL

*-----------------------------------
* DISPLAY FRUIT SPRITE
*-----------------------------------

drawFRUIT2  STA   L6EFF+1	; fruit address
            STY   L6EFF+2
            LDA   #$0C		; height in lines
            STA   sprHEIGHT
            LDA   #$00		; source x index
            STA   zpXBIT
L6EF0       JSR   setHGRADDRESS	; calc HGR address
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   #$03		; width counter
            STA   zpTEMP2
L6EFB       LDA   (zpHGR),Y	; load
            AND   #$7F		; mask bit 7
L6EFF       ORA   $0666,X	; ora data
            STA   (zpHGR),Y	; store
            INX
            INY
            DEC   zpTEMP2
            BNE   L6EFB
            STX   zpXBIT	; save index
            INC   zpY1		; next HGR lines
            DEC   sprHEIGHT	; next sprite line
            BNE   L6EF0
            RTS

*-----------------------------------
* SHOW FRUITED RANK
*-----------------------------------

drawFRUITEDRANK
            LDA   theRANK
            CMP   #$1A		; 26
            BCC   L6F1B
            LDA   #$1A
L6F1B       ASL		; show the rank as a fruit
            ASL
            TAX
            LDA   #$B0
            STA   zpY1
            LDA   #$21
            STA   zpXCOL
            LDA   tblFRUITS,X	; pointer to the fruit table
            LDY   tblFRUITS+1,X
            JMP   drawFRUIT2

*-----------------------------------
* SET THE HGR SCREEN
*-----------------------------------

setHGR      LDA   TXTCLR
            LDA   MIXCLR
            LDA   HIRES
            LDA   TXTPAGE1
            RTS

*-----------------------------------
* SET THE TEXT SCREEN
*-----------------------------------

setTEXT2    LDA   TXTSET
            LDA   TXTPAGE2
            LDA   MIXCLR
            RTS

*-----------------------------------
* CLEAR THE HGR SCREEN
*-----------------------------------

clearHGR    LDA   #>HGR
            STA   zpPTR2+1
            LDY   #<HGR
            STY   zpPTR2
L6F4E       LDA   #$80
L6F50       STA   (zpPTR2),Y
            INY
            BNE   L6F50
            INC   zpPTR2+1
            LDA   zpPTR2+1
            CMP   #>HGR2
            BNE   L6F4E
            RTS

*-----------------------------------
* GET INPUT FROM SELECTED DEVICE
*-----------------------------------

getINPUT    JSR   readKEYBOARD	; read keyboard
            BCS   L6F65
            STA   theDIR
L6F65       LDA   theDEVICE	; which device?
            BNE   L6F6F
            JSR   readJOYPAD	; read joypad
            JMP   L6F72
L6F6F       JSR   readJOYSTICK	; read joystick
L6F72       BCS   L6F76
            STA   theDIR		; save movement
L6F76       RTS

*-----------------------------------
* READ KEYBOARD
*-----------------------------------

readKEYBOARD
            LDA   KBD
            BPL   L6FCE
            STA   KBDSTROBE

            CMP   #$93		; ctrl-s
            BNE   L6F96		; speaker or tape out
            LDA   L7BB5+1
            EOR   #$10
            STA   L7BB5+1
            LDA   L7D06+1
            EOR   #$10
            STA   L7D06+1
            JMP   L6FCE

L6F96       CMP   #$9B		; ESC
            BNE   L6FA2

L6F9A       LDA   KBD
            BPL   L6F9A
            STA   KBDSTROBE

L6FA2       LDX   fgDEMO
            BEQ   L6FB1
            CMP   #" "
            BEQ   L6FAE
            CMP   #" "
            BNE   L6FCE
L6FAE       JMP   selectRANKCARTOON		; space resets the game

*  0: down
*  1: up
*  2: right
*  3: left

L6FB1       CMP   #"A"		; A
            BEQ   L6FCA
L6FB5       CMP   #$95		; right-arrow
            BEQ   L6FC7
L6FB9       CMP   #$88		; left-arrow
            BEQ   L6FC4
L6FBD       CMP   #$DA		; Z
            BNE   L6FCE
            LDA   #dirDOWN	; 0 down
            HEX   2C
L6FC4       LDA   #dirLEFT	; 3 left
            HEX   2C
L6FC7       LDA   #dirRIGHT	; 2 right
            HEX   2C
L6FCA       LDA   #dirUP	; 1 up
            CLC
            RTS
L6FCE       SEC
            RTS

*-----------------------------------
* READ ATARI JOYPAD
*-----------------------------------

readJOYPAD
            LDA   fgDEMO
            BNE   L700A
            LDA   #$00
            BIT   SETAN0
            BIT   SETAN1
            BIT   SETAN2
            LDX   BUTN0
            BPL   L6FE6
            ORA   #$04
L6FE6       BIT   CLRAN0
            LDX   BUTN0
            BPL   L6FF0
            ORA   #$08
L6FF0       BIT   CLRAN1
            LDX   BUTN0
            BPL   L6FFA
            ORA   #$02
L6FFA       BIT   SETAN0
            LDX   BUTN0
            BPL   L7004
            ORA   #$01
L7004       TAX
            LDA   L700E,X
            BPL   L700C
L700A       SEC
            RTS
L700C       CLC
            RTS

L700E       DB    $FF
            DB    $00	; down
            DB    $01	; up
            DB    $FF
            DB    $02	; right
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $03	; left
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF

*-----------------------------------
* GET JOYSTICK VALUES
*-----------------------------------

getLLJOYSTICK
            LDA   PTRIG
            SEC
            LDA   #$63
            LDX   #$00
            LDY   #$00
L7028       BIT   PADDL0
            BPL   L7030
            INX
            BNE   L7032
L7030       NOP
            NOP
L7032       BIT   PADDL1
            BPL   L703A
            INY
            BNE   L703C
L703A       NOP
            NOP
L703C       SBC   #$01
            BNE   L7028
            RTS

*-----------------------------------
* READ JOYSTICK
*-----------------------------------

readJOYSTICK
            LDA   fgDEMO
            BNE   L708D
            JSR   getLLJOYSTICK	; read joystick
            LDA   pacmanDIR	; 
            LSR
            BNE   L7065		; was right/left
            BCS   L705E		; was up
            CPY   #$1C		; was down
            BCC   L7081
L7053       CPX   #$1C
            BCC   L7089
            CPX   #$44
            BCS   L7085
            LDA   #$80
            RTS

L705E       CPY   #$44
            BCS   L707D
            JMP   L7053

L7065       BCS   L7076		; was up
            CPX   #$1C
            BCC   L7089
L706B       CPY   #$1C
            BCC   L7081
            CPY   #$44
            BCS   L707D
            LDA   #$80
            RTS

L7076       CPX   #$44
            BCS   L7085
            JMP   L706B

*  0: down
*  1: up
*  2: right
*  3: left
* 80: none

L707D       CLC
            LDA   #dirDOWN
            RTS
L7081       CLC
            LDA   #dirUP
            RTS
L7085       CLC
            LDA   #dirRIGHT
            RTS
L7089       CLC
            LDA   #dirLEFT
            RTS
L708D       CLC		; for the demo mode
            LDA   #$80
            RTS

*-----------------------------------
* DISPLAY CURRENT PLAYER'S SCORE
*-----------------------------------

displayPLAYERSCORE
            LDA   curSCORE+2	; compare current score with high score
            CMP   highSCORE+2
            BEQ   L709B
            BCC   L70CC
            BCS   L70AB
L709B       LDA   curSCORE+1
            CMP   highSCORE+1
            BEQ   L70A5
            BCC   L70CC
            BCS   L70AB
L70A5       LDA   curSCORE
            CMP   highSCORE
            BCC   L70CC

L70AB       LDA   curSCORE	; save score as high score
            STA   highSCORE
            STA   deciSCORE
            LDA   curSCORE+1
            STA   highSCORE+1
            STA   deciSCORE+1
            LDA   curSCORE+2
            STA   highSCORE+2
            STA   deciSCORE+2
            LDA   curPLAYER	; save current player
            STA   $F0
            LDA   #$00		; force high score player
            STA   curPLAYER
            JSR   L70D8		; output score
            LDA   $F0		; restore current player
            STA   curPLAYER

L70CC       LDA   curSCORE	; current player score
            STA   deciSCORE
            LDA   curSCORE+1
            STA   deciSCORE+1
            LDA   curSCORE+2
            STA   deciSCORE+2

L70D8       JSR   eraseSCORE	; erase the area
            LDA   curPLAYER	; set the coordinates
            ASL
            ASL
            TAX
            LDA   L7141,X
            STA   zpX2
            LDA   L7142,X
            STA   zpX2+1
            LDA   L7143,X
            STA   zpY2
            JSR   L70F5
            JMP   L7124

L70F5       LDA   #$00		; calculate the score
            LDY   #$04
L70F9       CLC
            ROR   deciSCORE+2
            ROR   deciSCORE+1
            ROR   deciSCORE
            ROR
            DEY
            BNE   L70F9
            CLC
            ROR
            ROR
            ROR
            ROR
            JSR   printDIGIT
            SEC
            LDA   zpX2
            SBC   #$06
            STA   zpX2
            BCS   L7117
            DEC   zpX2+1
L7117       LDA   deciSCORE+2
            BNE   L70F5
            LDA   deciSCORE+1
            BNE   L70F5
            LDA   deciSCORE
            BNE   L70F5
            RTS

*-----------------------------------
* 
*-----------------------------------

L7124       LDA   curPLAYER	; high score player?
            BEQ   L7140
            BIT   nbLIVES	; no life already?
            BPL   L7140
            LDA   curSCORE+2	; 10000?
            CMP   #$01
            BCC   L7140		; no

            JSR   sndEXTRALIFE		; play a happy sound
            INC   nbLIVES	; life++
            LDA   nbLIVES
            AND   #$7F
            STA   nbLIVES
            JSR   printNBLIVES

L7140       RTS

L7141       DB    $28
L7142       DB    $00
L7143       DB    $5E
            DB    $00
            DB    $28
            DB    $00
            DB    $10
            DB    $00
            DB    $0A
            DB    $01
            DB    $10
            DB    $00
            DB    $28
            DB    $00
            DB    $33
            DB    $00
            DB    $0A
            DB    $01
            DB    $33
            DB    $00
            DB    $0A
            DB    $01
            DB    $5E
            DB    $00

*-----------------------------------
* PRINT DIGIT (0 TO 9)
*-----------------------------------

printDIGIT  ASL
            TAX
            LDA   L717D,X	; get the pointer to the digit
            STA   L6950+1
            STA   L6959+1
            LDA   L717D+1,X
            STA   L6950+2
            STA   L6959+2
            LDA   zpX2		; where to output it
            STA   zpX1
            LDA   zpX2+1
            STA   zpX1+1
            LDA   zpY2
            STA   zpY1
            JSR   L693A		; print "sprite"
            RTS

L717D       DA    L7191	; 0
            DA    L7201	; 1
            DA    L7271	; 2
            DA    L72E1	; 3
            DA    L7351	; 4
            DA    L73C1	; 5
            DA    L7431	; 6
            DA    L74A1	; 7
            DA    L7511	; 8
            DA    L7581	; 9

L7191       HEX   8E80918091809180918091808E808080
            HEX   9C80A280A280A280A280A2809C808080
            HEX   B880C480C480C480C480C480B8808080
            HEX   F08088818881888188818881F0808080
            HEX   E08190829082908290829082E0818080
            HEX   C083A084A084A084A084A084C0838080
            HEX   8087C088C088C088C088C08880878080
L7201       HEX   8480868084808480848084808E808080
            HEX   88808C8088808880888088809C808080
            HEX   908098809080908090809080B8808080
            HEX   A080B080A080A080A080A080F0808080
            HEX   C080E080C080C080C080C080E0818080
            HEX   8081C0818081808180818081C0838080
            HEX   80828083808280828082808280878080
L7271       HEX   8E80918090808C80828081809F808080
            HEX   9C80A280A080988084808280BE808080
            HEX   B880C480C080B08088808480FC808080
            HEX   F08088818081E08090808880F8818080
            HEX   E08190828082C081A0809080F0838080
            HEX   C083A08480848083C080A080E0878080
            HEX   8087C088808880868081C080C08F8080
L72E1       HEX   9F80908088808C80908091808E808080
            HEX   BE80A08090809880A080A2809C808080
            HEX   FC80C080A080B080C080C480B8808080
            HEX   F8818081C080E08080818881F0808080
            HEX   F08380828081C08180829082E0818080
            HEX   E0878084808280838084A084C0838080
            HEX   C08F8088808480868088C08880878080
L7351       HEX   8C808A8089809F808880888088808080
            HEX   988094809280BE809080908090808080
            HEX   B080A880A480FC80A080A080A0808080
            HEX   E080D080C880F881C080C080C0808080
            HEX   C081A0819081F0838081808180818080
            HEX   8083C082A082E0878082808280828080
            HEX   80868085C084C08F8084808480848080
L73C1       HEX   9F8081808E809080908091808E808080
            HEX   BE8082809C80A080A080A2809C808080
            HEX   FC808480B880C080C080C480B8808080
            HEX   F8818880F080808180818881F0808080
            HEX   F0839080E081808280829082E0818080
            HEX   E087A080C08380848084A084C0838080
            HEX   C08FC080808780888088C08880878080
L7431       HEX   9C80828081808F80918091808E808080
            HEX   B880848082809E80A280A2809C808080
            HEX   F08088808480BC80C480C480B8808080
            HEX   E08190808880F88088818881F0808080
            HEX   C083A0809080F08190829082E0818080
            HEX   8087C080A080E083A084A084C0838080
            HEX   808E8081C080C087C088C08880878080
L74A1       HEX   9F809080888084808280828082808080
            HEX   BE80A080908088808480848084808080
            HEX   FC80C080A08090808880888088808080
            HEX   F8818081C080A0809080908090808080
            HEX   F08380828081C080A080A080A0808080
            HEX   E087808480828081C080C080C0808080
            HEX   C08F8088808480828081808180818080
L7511       HEX   8E80918091808E80918091808E808080
            HEX   9C80A280A2809C80A280A2809C808080
            HEX   B880C480C480B880C480C480B8808080
            HEX   F08088818881F08088818881F0808080
            HEX   E08190829082E08190829082E0818080
            HEX   C083A084A084C083A084A084C0838080
            HEX   8087C088C0888087C088C08880878080
L7581       HEX   8E80918091809E809080888087808080
            HEX   9C80A280A280BC80A08090808E808080
            HEX   B880C480C480F880C080A0809C808080
            HEX   F08088818881F0818081C080B8808080
            HEX   E08190829082E08380828081F0808080
            HEX   C083A084A084C08780848082E0818080
            HEX   8087C088C088808F80888084C0838080

*-----------------------------------
* CHECK AUTHORIZED MODE
*-----------------------------------

checkMOVE   STA   ptrMOVE
            LDA   #>boardMOVES
            STA   ptrMOVE+1
            LDA   ptrMOVE
            ASL
            ASL
            ASL
            BCC   L7600
            INC   ptrMOVE+1
L7600       CLC
            ADC   #<boardMOVES
            STA   ptrMOVE
            BCC   L7609
            INC   ptrMOVE+1
L7609       RTS

*--- Authorized moves ($200 bytes)
* Table contains all X/Y positions where a move is available
* The next four bytes contain the index to jump to for the next check of X/Y position
* If FF then the move is not authorized in the direction
* The last two bytes are for padding

*                 X  Y  D  U  R  L
boardMOVES	HEX   41,0B,06,FF,01,FF,0000,5F0B07FF02006666
	HEX   830B09FFFF011111950B0AFF04FF0000
	HEX   B90B0CFF05036666D70B0DFFFF041111
	HEX   41230E0007FF88885F230F0108069999
	HEX   712310FF090766668323FF020A085555
	HEX   9523FF030B095555A72313FF0C0A6666
	HEX   B92314040D0B9999D7231505FF0C7777
	HEX   4135FF060FFF22225F351A07FF0E7777
	HEX   7135FF0811FF2222833517FFFF101111
	HEX   953518FF13FF0000A735FF0BFF123333
	HEX   B9351D0C15FF8888D735FF0DFF143333
	HEX   71471BFF17FF00008347FF1118164444
	HEX   9547FF1219174444A7471CFFFF181111
	HEX   5F59210F1B1D999971591E16FF1A7777
	HEX   A7591F191DFF8888B95926141A1C9999
	HEX   716B221B1FFF8888A76B251CFF1E7777
	HEX   417D28FF21FF00005F7D2A1A22209999
	HEX   717DFF1E23215555837D2CFFFF221111
	HEX   957D2DFF25FF0000A77DFF1F26245555
	HEX   B97D2F1D27259999D77D31FFFF261111
	HEX   418FFF2029FF22224D8F33FFFF281111
	HEX   5F8F34212BFF8888718F35FF2C2A6666
	HEX   838FFF232D2B5555958FFF242E2C5555
	HEX   A78F38FF2F2D6666B98F3926FF2E7777
	HEX   CB8F3AFF31FF0000D78FFF27FF303333
	HEX   41A13CFF33FF00004DA1FF2934325555
	HEX   5FA1FF2AFF33333371A1FF2B36FF2222
	HEX   83A13DFFFF35111195A13EFF38FF0000
	HEX   A7A1FF2EFF373333B9A1FF2F3AFF2222
	HEX   CBA1FF303B395555D7A13FFFFF3A1111
	HEX   41B3FF323DFF222283B3FF363E3C5555
	HEX   95B3FF373F3D5555D7B3FF3BFF3E3333

*-----------------------------------
* CALCULATE SPRITE OFFSET
*-----------------------------------

calcSPROFFSET
            LDX   zpXBIT	; get sprite bit position
            LDA   L7812,X	; 0:0, 1:30, 2:60...
            STA   zpXBIT	; and save offset to sprite data
            RTS

* De 30 en 30...

L7812       HEX   00,1E,3C,5A,78,96,B4

*-----------------------------------
* HIDE ENERGIZER DOT
*-----------------------------------

hideENERGIZERDOT
            LDA   #$F8
            STA   sprHEIGHT
            JSR   calcXYHGR
            ASL   zpXBIT	; *2
L7822       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   sprEEDOT,X
            AND   (zpHGR),Y
            ORA   #$80		; force bit 7
            STA   (zpHGR),Y
            INY
            LDA   sprEEDOT+1,X
            AND   (zpHGR),Y
            ORA   #$80		; force bit 7
            STA   (zpHGR),Y
            INC   zpY1
            INC   sprHEIGHT
            BNE   L7822
            RTS

* Sprite Erase Energizer Dot value to draw based on bit position

sprEEDOT    HEX   407F	; 0100_0000_0111_1111
            HEX   017F	; 0000_0001_0111_1111
            HEX   037E	; 0000_0011_0111_1110
            HEX   077C	; 0000_0111_0111_1100
            HEX   0F78	; 0000_1111_0111_1000
            HEX   1F70	; 0001_1111_0111_0000
            HEX   3F60	; 0011_1111_0110_0000

*-----------------------------------
* 
*-----------------------------------

L7851       HEX   09090807070606060605050505040404

*-----------------------------------
* TOTO
*-----------------------------------

L7861       LDA   theDEVICE	; which device?
            BNE   L7868		; joystick?
            JSR   getINPUT	; no, keyboard or joypad
L7868       DEC   frameCNT
            BEQ   L786D
            RTS
L786D       LDA   theDEVICE
            BEQ   L7874
            JSR   getINPUT

L7874       JSR   L808C
            JSR   getMAXRANK15
            TAX
            LDA   L7851,X
            CLC
            LDX   #idxGHOST_FRIGHTENED
            LDY   ghost2DATA,X
            BEQ   L7887
            ADC   #$01
L7887       LDY   ghost4DATA,X
            BEQ   L788D
            ADC   #$01
L788D       SEC
            INX
            LDY   ghost1DATA,X
            BEQ   L7895
            SBC   #$01
L7895       LDY   ghost3DATA,X
            BEQ   L789B
            SBC   #$01
L789B       STA   frameCNT

            LDA   $F3
            BEQ   L78A5
            DEC   $F3
            INC   frameCNT

L78A5       LDA   pacmanBOARD
            TAX
            JSR   checkMOVE
            LDY   #$00
            LDA   (ptrMOVE),Y
            CMP   pacmanX
            BNE   L78BA
            INY
            LDA   (ptrMOVE),Y
            CMP   pacmanY
            BEQ   L78D1
L78BA       LDA   pacmanNEXTBOARD	; is move possible?
            BMI   L78D7		; no
            TAX		; perhaps
            JSR   checkMOVE
            LDY   #$00
            LDA   (ptrMOVE),Y
            CMP   pacmanX
            BNE   L78CF
            INY
            LDA   (ptrMOVE),Y
            CMP   pacmanY
L78CF       BNE   L794B

L78D1       STX   pacmanBOARD	; save new position
            LDA   #$FF		; move is not possible
            STA   pacmanNEXTBOARD

L78D7       LDA   fgDEMO	; are in demo mode?
            BEQ   L78E7		; no
            INC   zpPTR3	; yes
            BNE   L78E1
            INC   zpPTR3+1
L78E1       LDY   #$00
            LDA   (zpPTR3),Y
            STA   theDIR

L78E7       LDY   theDIR
            BMI   L78FD
            INY
            INY
            LDA   (ptrMOVE),Y
            BPL   L78F9
            LDY   pacmanDIR
            INY
            INY
            LDA   (ptrMOVE),Y
            BPL   L7915
L78F9       LDA   theDIR
            STA   pacmanDIR
L78FD       LDY   pacmanDIR
            INY
            INY
            LDA   (ptrMOVE),Y
            BPL   L7915
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            LDA   #$02
            STA   pacmanSTEP
            JSR   setXYPACMAN
            JMP   L79A4

*--- Check tunnel

L7915       STA   pacmanNEXTBOARD
            LDA   pacmanBOARD
            CMP   #$1A
            BEQ   L793B
            CMP   #$1D
            BNE   L795B
            LDA   #$15
            STA   boardY
            LDA   #$00
            STA   $6C
            LDA   pacmanDIR
            CMP   #dirRIGHT
            BNE   L7935
L792F       LDA   #$01		; Pacman enters tunnel
            STA   pacmanINTUNNEL
            BNE   L795B
L7935       LDA   #$00		; Pacmal exits tunnel
            STA   pacmanINTUNNEL
            BEQ   L795B

L793B       LDA   #$06
            STA   boardY
            LDA   #$00
            STA   $6C
            LDA   pacmanDIR
            CMP   #dirLEFT
            BNE   L7935
            BEQ   L792F
L794B       LDA   theDIR
            BMI   L795B
            EOR   pacmanDIR
            CLC
            ROR
            BNE   L795B
            BCC   L795B
            LDA   theDIR
            STA   pacmanDIR
L795B       LDA   pacmanINTUNNEL
            BEQ   L7962
            JMP   L7B2F

L7962       JSR   setXYPACMAN
            JSR   eraseSPRITE44
            CLC
            LDA   pacmanDIR
            ROR
            BNE   L797A
            LDA   pacmanY
            BCS   L7976
            ADC   #$02
            BCC   L7988
L7976       SBC   #$02
            BCS   L7988
L797A       LDA   pacmanX
            BCS   L7982
            ADC   #$02
            BCC   L7984
L7982       SBC   #$02
L7984       STA   pacmanX
            LDA   pacmanY
L7988       STA   pacmanY
            STA   zpY1
            LDA   pacmanX
            STA   zpX1
            INC   pacmanSTEP

            INC   zp1F		; variable is no more used
            LDA   zp1F
            CMP   #$FB
            BNE   L799E
            LDA   #$00
            STA   zp1F

L799E       JSR   L79A4
            JMP   L79CD

L79A4       LDA   pacmanSTEP
            AND   #$0F
            STA   pacmanSTEP
            AND   #$03	; 00000011
            BEQ   L79BE
            CMP   #$03	; 00000011
            BNE   L79B4
            LDA   #$01	; 00000001
L79B4       ROR
            LDA   pacmanDIR
            BCS   L79BC
            ADC   #$04
            SEC
L79BC       ADC   #$00
L79BE       ASL
            TAX
            LDA   #$80
            STA   hgrBIT7
            LDA   sprPACMAN,X
            LDY   sprPACMAN+1,X
            JMP   drawSPRITE

L79CD       LDA   pacmanY
            CMP   #$6B
            BNE   L79FD
            LDA   pacmanX
            CMP   #$8A
            BCC   L79FD
            CMP   #$8E
            BCS   L79FD
            LDA   fgFRUIT
            CMP   #$01
            BNE   L79FD
            LDA   #$30
            STA   fruitCNT
            LDA   #$00
            STA   fruitCNT+1
            LDA   #$02
            STA   fgFRUIT
            LDA   #$10
            STA   zpXCOL
            LDA   #$66
            STA   zpY1
            JSR   eraseBLOCK
            JSR   addTOSCORE	; add score
L79FD       CLC
            LDA   pacmanDIR
            ROR
            BEQ   L7A31
            LDA   $6C
            BCS   L7A1F
            ADC   #$02
            CMP   #$06
            BNE   L7A11
            LDA   #$00
            INC   boardY
L7A11       STA   $6C
            CMP   #$02
            BNE   L7A1E
            INC   boardY
            JSR   L7A5F
            DEC   boardY
L7A1E       RTS

L7A1F       SBC   #$02
            CMP   #$FE
            BNE   L7A29
            LDA   #$04
            DEC   boardY
L7A29       STA   $6C
            CMP   #$04
            BNE   L7A1E
            BEQ   L7A5F
L7A31       LDA   $6D
            BCS   L7A4D
            ADC   #$02
            CMP   #$06
            BNE   L7A3F
            LDA   #$00
            INC   boardX
L7A3F       STA   $6D
            CMP   #$02
            BNE   L7A1E
            INC   boardX
            JSR   L7A5F
            DEC   boardX
            RTS

L7A4D       SBC   #$02
            CMP   #$FE
            BNE   L7A57
            LDA   #$04
            DEC   boardX
L7A57       STA   $6D
            CMP   #$04
            BNE   L7A1E
            BEQ   L7A5F
L7A5F       JSR   L7A6B
            LDY   #$00		; what's on the board?
            LDA   (zpPTR2),Y
            BEQ   L7A1E		; nothing
            JMP   eatMYDOT	; a dot!!!

L7A6B       LDA   #>theBOARD
            STA   zpPTR2+1
            LDA   boardY
            ASL
            ASL
            ASL
            ASL		; *16
            BCC   L7A7B
            INC   zpPTR2+1
            INC   zpPTR2+1
L7A7B       ASL
            BCC   L7A80
            INC   zpPTR2+1
L7A80       CLC
            ADC   boardX
            ADC   #<theBOARD
            BCC   L7A89
            INC   zpPTR2+1
L7A89       STA   zpPTR2
            RTS

*-----------------------------------
* FRAME COUNTER & SPEED DATA
*-----------------------------------

L7A8C       HEX   02020202020101010101010000000000
L7A9C       HEX   02020202020202010101010101010100

*-----------------------------------
* WE'RE OVER A DOT, EAT IT
*-----------------------------------

eatMYDOT    CLC
            JSR   getMAXRANK15
            TAX
            LDA   L7A8C,X
            ADC   frameCNT
            STA   frameCNT
            LDA   L7A9C,X
            STA   $F3

            LDA   (zpPTR2),Y	; get the board value

            LDX   fgDEMO	; game or demo?
            BNE   eatMYDOTDEMO	; simple dot removal

            CLC		; check the dot
            ROR		; 0-0000_0001 becomes 0000_0000-1
            BEQ   L7AF4		; carry set means normal dot

* We have an energizer dot

            JSR   sndENERGIZERDOT	; play sound
            LDA   zpPTR2
            PHA
            LDA   zpPTR2+1
            PHA
            JSR   hideENERGIZERS
            PLA
            STA   zpPTR2+1
            PLA
            STA   zpPTR2

            CLC		; score +50
            SED
            LDA   curSCORE
            ADC   #$50
            STA   curSCORE
            LDA   curSCORE+1
            ADC   #$00
            STA   curSCORE+1
            LDA   curSCORE+2
            ADC   #$00
            STA   curSCORE+2
            CLD
            JSR   makeGHOSTSFRIGTHENED	; ghosts can be eaten now
            CLC
            BCC   L7B0C

* We ate a normal dot

L7AF4       CLC		; score +10
            SED
            LDA   curSCORE
            ADC   #$10
            STA   curSCORE
            LDA   curSCORE+1
            ADC   #$00
            STA   curSCORE+1
            LDA   curSCORE+2
            ADC   #$00
            STA   curSCORE+2
            CLD
            JSR   sndNORMALDOT	; play sound

L7B0C       LDA   #$00		; remove the dot from the board
            LDY   #$00
            STA   (zpPTR2),Y
            JSR   displayPLAYERSCORE
            DEC   fruitFREQ	; nbdots--
            DEC   nbDOTS
            BNE   L7B1E		; dots remain
            JMP   gotoNEXTLEVEL	; no more dots
L7B1E       RTS

*--- Eat my dot when in demo mode

eatMYDOTDEMO
            CLC		; which kind of dot?
            ROR
            BEQ   L7B26		; normal dot
            JSR   makeGHOSTSFRIGTHENED	; or energizer

L7B26       LDA   #$00		; remove dot from the board
            LDY   #$00
            STA   (zpPTR2),Y
            DEC   nbDOTS	; decrement number of ghosts
            RTS

*-----------------------------------
* 
*-----------------------------------

L7B2F       JSR   setXYPACMAN
            JSR   eraseSPRITE44
            LDA   pacmanBOARD
            CMP   #$1A
            BEQ   L7B79
            LDA   pacmanDIR
            ROR		; is going up?
            BCC   L7B54		; no
            LDA   pacmanX	; yes
            SBC   #$02
            STA   pacmanX
            STA   zpX1

L7B48       LDA   pacmanY
            STA   zpY1
            INC   pacmanSTEP
            JSR   L79A4
            JMP   L79FD

63 = une direction
64 = case actuelle
65 = case cible ou FF si dŽplacement pas possible

*-----------------------------------
* PACMAN ENTERS TUNNEL TO THE RIGHT
*-----------------------------------

L7B54       CLC
            LDA   pacmanX
            ADC   #$02
            STA   pacmanX
            STA   zpX1
            CMP   #$DD
            BNE   L7B48
            LDA   pacmanNEXTBOARD
            STA   pacmanBOARD
            LDA   #$1D
            STA   pacmanNEXTBOARD
            LDA   #$3D
            STA   pacmanX
            STA   zpX1
            LDA   #$00
            STA   boardY
            LDA   #$00
            STA   $6C
            BEQ   L7B48

*-----------------------------------
* PACMAN ENTERS THE LEFT TUNNEL
*-----------------------------------

L7B79       LDA   pacmanDIR
            ROR		; is going up?
            BCS   L7B88		; yes
            LDA   pacmanX
            ADC   #$02
            STA   pacmanX
            STA   zpX1
            BNE   L7B48

L7B88       LDA   pacmanX
            SBC   #$02
            STA   pacmanX
            STA   zpX1
            CMP   #$3B
            BNE   L7B48
            LDA   pacmanNEXTBOARD
            STA   pacmanBOARD
            LDA   #$1A
            STA   pacmanNEXTBOARD
            LDA   #$DB
            STA   pacmanX
            STA   zpX1
            LDA   #$1C
            STA   boardY
            LDA   #$00
            STA   $6C
            BEQ   L7B48

*-----------------------------------
* PLAY A NOTE
*-----------------------------------

playNOTE    LDX   #$04
L7BAE       LDY   $05
L7BB0       DEY
            INY
            DEY
            BNE   L7BB0
L7BB5       BIT   SPKR
            DEX
            BNE   L7BAE
            RTS

*-----------------------------------
* PLAY SOUND EFFECT
*-----------------------------------

playSOUNDFX
            STA   L7BCD+1
            STY   L7BCD+2
            LDA   fgDEMO	; game or demo?
            BEQ   L7BC7		; game
            RTS		; demo

L7BC7       LDY   #$00
            STY   $06
L7BCB       LDY   $06
L7BCD       LDA   $0666,Y
            BEQ   L7BDB		; end of song
            STA   $05
            JSR   playNOTE
            INC   $06
            BNE   L7BCB
L7BDB       RTS

*-----------------------------------
* WE ATE A NORMAL DOT
*-----------------------------------

sndNORMALDOT
	LDA   #<L7BE3
            LDY   #>L7BE3
            JMP   playSOUNDFX

L7BE3       DB    $30
            DB    $1C
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L7BE6       LDA   #<L7BED
            LDY   #>L7BED
            JMP   playSOUNDFX

L7BED       DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $49
            DB    $49
            DB    $49
            DB    $48
            DB    $48
            DB    $48
            DB    $47
            DB    $47
            DB    $47
            DB    $46
            DB    $46
            DB    $46
            DB    $45
            DB    $45
            DB    $45
            DB    $44
            DB    $44
            DB    $44
            DB    $43
            DB    $43
            DB    $43
            DB    $42
            DB    $42
            DB    $42
            DB    $41
            DB    $41
            DB    $41
            DB    $40
            DB    $40
            DB    $40
            DB    $40
            DB    $40
            DB    $40
            DB    $39
            DB    $39
            DB    $39
            DB    $38
            DB    $38
            DB    $38
            DB    $37
            DB    $37
            DB    $37
            DB    $36
            DB    $36
            DB    $36
            DB    $35
            DB    $35
            DB    $35
            DB    $34
            DB    $34
            DB    $34
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $28
            DB    $28
            DB    $27
            DB    $27
            DB    $26
            DB    $26
            DB    $25
            DB    $25
            DB    $24
            DB    $24
            DB    $23
            DB    $23
            DB    $23
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $00

*-----------------------------------
* WE ATE AN ENERGIZER DOT
*-----------------------------------

sndENERGIZERDOT
            LDA   #<L7C4C
            LDY   #>L7C4C
            JMP   playSOUNDFX

L7C4C       DB    $40
            DB    $40
            DB    $40
            DB    $30
            DB    $00

*-----------------------------------
* WE HAVE AN EXTRA LIFE
*-----------------------------------

sndEXTRALIFE
            LDY   #$50
            STY   $06
L7C55       LDA   #$20
            STA   $05
            JSR   playNOTE
            DEC   $06
            BNE   L7C55
            RTS

*-----------------------------------
* 
*-----------------------------------

L7C61       LDA   #<L7C68
            LDY   #>L7C68
            JMP   playSOUNDFX

L7C68       DB    $70
            DB    $70
            DB    $70
            DB    $70
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $69
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $60
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $00

*-----------------------------------
* PLAY SOUNDS WHEN PACMAN DIES
*-----------------------------------

playPACMANDIES
            LDA   zpTEMP3	; get sprite index
            ASL
            TAX
            LDA   L7C8F,X
            LDY   L7C8F+1,X
            JMP   playSOUNDFX	; and play associated sound

L7C8F       DA    $0000
            DA    L7CE4
            DA    L7CD7
            DA    L7CCA
            DA    L7CBD
            DA    L7CB0
            DA    L7C9D

L7C9D       DB    $20
            DB    $20
            DB    $20
            DB    $19
            DB    $19
            DB    $20
            DB    $20
            DB    $19
            DB    $19
            DB    $16
            DB    $16
            DB    $16
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $12
            DB    $12
            DB    $00
L7CB0       DB    $20
            DB    $20
            DB    $22
            DB    $24
            DB    $25
            DB    $28
            DB    $29
            DB    $2A
            DB    $2C
            DB    $2D
            DB    $2D
            DB    $2E
            DB    $00
L7CBD       DB    $28
            DB    $28
            DB    $2A
            DB    $2A
            DB    $2B
            DB    $2F
            DB    $2F
            DB    $30
            DB    $34
            DB    $35
            DB    $39
            DB    $39
            DB    $00
L7CCA       DB    $30
            DB    $39
            DB    $36
            DB    $36
            DB    $39
            DB    $40
            DB    $42
            DB    $43
            DB    $43
            DB    $43
            DB    $44
            DB    $47
            DB    $00
L7CD7       DB    $40
            DB    $40
            DB    $42
            DB    $43
            DB    $43
            DB    $44
            DB    $46
            DB    $48
            DB    $48
            DB    $48
            DB    $49
            DB    $49
            DB    $00
L7CE4       DB    $10
            DB    $10
            DB    $08
            DB    $07
            DB    $07
            DB    $09
            DB    $20
            DB    $07
            DB    $06
            DB    $03
            DB    $03
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L7CF0       LDA   #<L7C9D
            LDY   #>L7C9D
            JMP   playSOUNDFX

*-----------------------------------
* PLAY LONGER NOTE
*-----------------------------------

playNOTE2   LDX   #$04
L7CF9       LDY   $05
L7CFB       DEY
            INY
            PHA
            PLA
            PHA
            PLA
            PHA
            PLA
            DEY
            BNE   L7CFB
L7D06       BIT   SPKR
            DEX
            BNE   L7CF9
            RTS

*-----------------------------------
* PLAY SONG
*-----------------------------------

playSONG    STA   zpPTR1
            STY   zpPTR1+1
            LDA   #$00
            STA   $06
L7D15       LDY   $06
            LDA   (zpPTR1),Y
            BEQ   L7D32
            STA   $05		; height
            INY
            LDA   (zpPTR1),Y
            STA   playNOTE2+1	; duration
            JSR   playNOTE2
            JSR   getINPUT
            JSR   sndWAIT
            INC   $06
            INC   $06
            BNE   L7D15
L7D32       LDA   #$04
            STA   playNOTE2+1
            RTS

*-----------------------------------
* PLAY INTRO MUSIC
*-----------------------------------

playINTROMUSIC
            LDA   #<intromusicDATA
            LDY   #>intromusicDATA
            JMP   playSONG

*--- Song data

intromusicDATA
	HEX   41604130412049245726416037A04160
	HEX   41304120492457264160497041604130
	HEX   41204924572641603980392031242EA0
	HEX   319039604130348041820000

*-----------------------------------
* WAIT FOR THE SONG ROUTINE
*-----------------------------------

sndWAIT     LDX   #$1E
            JMP   doWAIT2

*-----------------------------------
* SET X/Y COORDS FOR THE ENGINE
*-----------------------------------

setXYPACMAN LDA   pacmanX	; coords of Pacman
            STA   zpX1
            LDA   pacmanY
            STA   zpY1
            LDA   #$00
            STA   zpX1+1
            RTS

setXYGHOST  LDA   ghostX	; coords of the current GHOST
            STA   zpX1
            LDA   ghostY
            STA   zpY1
            LDA   #$00
            STA   zpX1+1
            RTS

*-----------------------------------
* MOVE CURSOR -4,-4
*-----------------------------------

moveCURSOR44
            SEC	; X1 - 4
            LDA   zpX1
            SBC   #$04
            STA   zpX1
            SEC	; Y1 - 4
            LDA   zpY1
            SBC   #$04
            STA   zpY1
            RTS

*-----------------------------------
* MOVE CURSOR -5,-4
*-----------------------------------

moveCURSOR54
            SEC	; X1 - 5
            LDA   zpX1
            SBC   #$05
            STA   zpX1
            SEC	; Y1 - 4
            LDA   zpY1
            SBC   #$04
            STA   zpY1
            RTS

*-----------------------------------
* SHOW BONUS (RIP Mr Ghost) 
*-----------------------------------

showBONUS   LDA   bonusINDEX
            CMP   #score200
            BEQ   L7DCC
            CMP   #score400
            BEQ   L7DD2
            CMP   #score800
            BEQ   L7DD8
            LDA   #<sprSCORE1600	; sprSCORE1600
            LDY   #>sprSCORE1600
            BNE   L7DDC
L7DCC       LDA   #<sprSCORE200
            LDY   #>sprSCORE200
            BNE   L7DDC
L7DD2       LDA   #<sprSCORE400
            LDY   #>sprSCORE400
            BNE   L7DDC
L7DD8       LDA   #<sprSCORE800
            LDY   #>sprSCORE800
L7DDC       STA   zpPTR2
            STY   zpPTR2+1
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            JSR   setXYGHOST
            JSR   prepareSPRITE

            LDA   fgDEMO	; demo mode?
            BNE   L7E0E		; yes, skip
            JSR   L805D
            JSR   L805D
            JSR   L7BE6
            JSR   L805D
            JSR   L805D
            JSR   L805D
            JSR   L805D
            JMP   L7E13

L7E0E       LDX   #$FF
            JSR   doWAIT2
L7E13       JSR   setXYGHOST
            JSR   eraseSPRITE54
            JSR   setXYPACMAN
            JMP   L79A4

*-----------------------------------
* PREPARE SPRITE FOR DRAWING
*-----------------------------------

prepareSPRITE
            JSR   moveCURSOR54	; move cursor
            JSR   calcXYHGR	; calcumate HGR postiion
            LDY   #$1D		; move original sprite data
L7E27       LDA   (zpPTR2),Y
            STA   sprDATA,Y
            DEY
            BPL   L7E27
            LDA   zpXBIT	; which bit in byte
            BEQ   L7E3C
            STA   zpTEMP4	; make it an index
L7E35       JSR   alignSPRITEHGR		; calculate sprite data
            DEC   zpTEMP4
            BNE   L7E35
L7E3C       JSR   calcSPROFFSET	; calculate sprite offset on screen
            JSR   moveXY44	; move coords
            LDA   #<sprDATA
            LDY   #>sprDATA
            SEC
            SBC   zpXBIT
            BCS   L7E4C
            DEY
L7E4C       JMP   drawSPRITE	; and draw sprite

*-----------------------------------
* ALIGN SPRITE DATA ON HGR COLUMN
*-----------------------------------

alignSPRITEHGR
            LDX   #$1B		; rotate sprite data
L7E51       ASL   sprDATA,X	; bit by bit
            ASL   sprDATA,X	; so that it is
            INX		; aligned with
            ROL   sprDATA,X	; the HGR screen
            ASL   sprDATA,X
            INX
            ROL   sprDATA,X
            DEX
            ROR   sprDATA,X
            DEX
            ROR   sprDATA,X
            DEX
            DEX
            DEX
            BPL   L7E51
            RTS

*--- Array of data is $50 bytes
* This is the sprite area that is
* shifted based on the x-coord where
* it should be displayed
* Thank you, Apple II HGR mode!!!

sprDATA     DB    $CB
            DB    $A0
            DB    $D4
            DB    $CF
            DB    $A0
            DB    $C4
            DB    $C5
            DB    $CD
            DB    $CF
            DB    $AE
            DB    $A0
            DB    $A0
            DB    $B1
            DB    $14
            DB    $85
            DB    $04
            DB    $C8
            DB    $B1
            DB    $14
            DB    $85
            DB    $10
            DB    $85
            DB    $0A
            DB    $C8
            DB    $84
            DB    $0B
            DB    $A4
            DB    $0B	; $1B

            DB    $B1
            DB    $14
            DB    $30
            DB    $1F
            DB    $F0
            DB    $10
            DB    $C9
            DB    $20
            DB    $F0
            DB    $0F
            DB    $C9
            DB    $21
            DB    $F0
            DB    $18
            DB    $C9
            DB    $03
            DB    $B0
            DB    $04
            DB    $E6
            DB    $10
            DB    $E6
            DB    $10
            DB    $20
            DB    $16
            DB    $43
            DB    $A5
            DB    $0A
            DB    $85
            DB    $10
            DB    $E6
            DB    $0B
            DB    $E6
            DB    $04
            DB    $D0
            DB    $DB
            DB    $E6
            DB    $0B
            DB    $60
            DB    $A9
            DB    $73
            DB    $8D
            DB    $B2
            DB    $55
            DB    $A9
            DB    $46
            DB    $8D
            DB    $B3
            DB    $55
            DB    $20
            DB    $38
            DB    $43
            DB    $4C

*-----------------------------------
* ANIMATE PACMAN WHEN IT DIES
*-----------------------------------

animPACMANDIES
            JSR   setXYPACMAN
            LDA   #<sprPACMANUP2
            LDY   #>sprPACMANUP2
            JSR   drawSPRITE
            LDY   #$03
L7ECC       LDX   #$FF
            JSR   doWAIT2
            DEY
            BNE   L7ECC
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            LDA   #$06		; Pacman dies
            STA   zpTEMP3	; in 6 sprites
L7EDE       LDA   zpTEMP3
            ASL
            TAX
            JSR   setXYPACMAN
            LDA   tblSPRPACMANDIES,X
            LDY   tblSPRPACMANDIES+1,X
            STA   zpPTR2
            STY   zpPTR2+1
            JSR   prepareSPRITE
            JSR   playPACMANDIES	; play a sound
            LDX   #$80
            JSR   doWAIT2
            JSR   setXYPACMAN
            JSR   eraseSPRITE54
            DEC   zpTEMP3	; next sprite
            BNE   L7EDE
            RTS

tblSPRPACMANDIES
            DA    $0000
            DA    sprPACDIES6	; 6th sprite
            DA    sprPACDIES5
            DA    sprPACDIES4
            DA    sprPACDIES3
            DA    sprPACDIES2
            DA    sprPACDIES1	; 1st sprite

sprPACDIES1 HEX   000000
            HEX   000000
            HEX   000000
            HEX   060C00
            HEX   1E0F00
            HEX   7E0F00
            HEX   7E0F00
            HEX   7C0700
            HEX   780300
            HEX   700100
sprPACDIES2 HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   7E0F00
            HEX   7E0F00
            HEX   7C0700
            HEX   780300
            HEX   700100
sprPACDIES3 HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   780300
            HEX   7C0700
            HEX   7C0700
            HEX   780300
            HEX   700100
sprPACDIES4 HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   700100
            HEX   780300
            HEX   780300
            HEX   700100
            HEX   600000
sprPACDIES5 HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   000000
            HEX   600000
            HEX   600000
            HEX   600000
            HEX   600000
            HEX   600000
sprPACDIES6 HEX   000000
            HEX   240200
            HEX   280100
            HEX   000000
            HEX   2C0300
            HEX   000000
            HEX   280100
            HEX   240200
            HEX   000000
            HEX   000000

sprSCORE200
            HEX   000000
            HEX   000000
            HEX   770E00	; 0111011100001110
            HEX   540A00	; 0101010000001010
            HEX   560A00	; 0101011000001010
            HEX   510A00	; 0101000110100000
            HEX   770E00	; 0111011100001110
            HEX   000000
            HEX   000000
            HEX   000000
sprSCORE400
            HEX   000000
            HEX   000000
            HEX   750E00
            HEX   550A00
            HEX   570A00
            HEX   540A00
            HEX   740E00
            HEX   000000
            HEX   000000
            HEX   000000
sprSCORE800
            HEX   000000
            HEX   000000
            HEX   770E00
            HEX   550A00
            HEX   570A00
            HEX   550A00
            HEX   770E00
            HEX   000000
            HEX   000000
            HEX   000000
sprSCORE1600
            HEX   440000
            HEX   440000
            HEX   440300
            HEX   440200
            HEX   440300
            HEX   000000
            HEX   5C0300
            HEX   540200
            HEX   540200
            HEX   5C0300

*-----------------------------------
* MOVE XY BY 5,3 - UNUSED
*-----------------------------------

L803F       CLC
            LDA   zpX1
            ADC   #$05
            STA   zpX1
            CLC
            LDA   zpY1
            ADC   #$04
            STA   zpY1
            RTS

*-----------------------------------
* MOVE XY BY 4,4
*-----------------------------------

moveXY44    CLC
            LDA   zpX1
            ADC   #$04
            STA   zpX1
            CLC
            LDA   zpY1
            ADC   #$04
            STA   zpY1
            RTS

*-----------------------------------
* 
*-----------------------------------

L805D       LDA   ghostINDEX	; save out ghost index
            STA   saveVAR
            JSR   getGHOSTSDATA	; save its data
            LDA   #gCLYDE	; loop 4..1
            STA   ghostINDEX
L8068       JSR   setGHOSTSDATA	; get data
            LDA   ghostISDEAD	; is ghost dead?
            BEQ   L807D		; no
            LDA   #$01		; yes
            STA   $80
            JSR   L8763		; do something
            LDA   #$01
            STA   $80
            JSR   L8763		; do something
L807D       JSR   getGHOSTSDATA	; save data
            DEC   ghostINDEX	; ghost--
            BNE   L8068
            LDA   saveVAR	; restore ghost index
            STA   ghostINDEX
            JSR   setGHOSTSDATA	; ...and its data	
            RTS

*-----------------------------------
* 
*-----------------------------------

L808C       LDA   $EA
            BNE   L8092
            DEC   $EB
L8092       DEC   $EA
            CLC
            LDA   $EA
            ADC   $EB
            BCS   L80C0
            BNE   L80C0
            LDA   $E9
            BNE   L80B1
            JSR   L80C1
            LDA   #$01
            STA   $E9
            LDA   #$8C
            STA   $EA
            LDA   #$00
            STA   $EB
            RTS

L80B1       JSR   L80C1
            LDA   #$00
            STA   $E9
            LDA   #$02
            STA   $EB
            LDA   #$58
            STA   $EA
L80C0       RTS

L80C1       LDA   #gCLYDE	; loop 4..1
            STA   ghostINDEX
L80C5       JSR   setGHOSTSDATA	; get data
            LDA   $81		; can we handle?
            BNE   L80DB		; nope
            LDA   ghostDIR	; yes, change direction
            EOR   #$01
            STA   ghostDIR
            LDY   ghostMOVEINDEX	; update the ghost board/move table
            STA   (ghostMOVE),Y
            LDA   #$FF
            INY
            STA   (ghostMOVE),Y
L80DB       JSR   getGHOSTSDATA	; save data
            DEC   ghostINDEX	; next ghost
            BNE   L80C5
            RTS

*-----------------------------------
* SHOW GAME OVER
*-----------------------------------

showGAMEOVER
            LDA   #$69	; Y
            LDX   #$04	; width in bytes
            LDY   #$0F	; X
            JSR   prepareGO
            LDX   #$07	; nb lines
            LDA   #<sprGAME
            LDY   #>sprGAME
            JSR   drawGO
            LDA   #$69
            LDX   #$04
            LDY   #$15
            JSR   prepareGO
            LDX   #$07
            LDA   #<sprOVER
            LDY   #>sprOVER
            JMP   drawGO

prepareGO   STA   zpY1
            STX   sprWIDTH
            STY   zpXCOL
            LDA   #$00
            STA   zpXBIT
            RTS

drawGO      STX   sprHEIGHT
            STA   L55B1+1
            STY   L55B1+2
            JMP   drawCOLORSPRITE

*--- Sprite for GAME

sprGAME     HEX   6023443E
            HEX   10506C02
            HEX   10085502
            HEX   507B550E
            HEX   100A4502
            HEX   100A4502
            HEX   600B453E

*--- Sprite for OVER

sprOVER     HEX   4E687701
            HEX   51281002
            HEX   51281002
            HEX   51687101
            HEX   51285000
            HEX   11251001
            HEX   0E621702

*-----------------------------------
* WHICH CARTOON TO PLAY?
*-----------------------------------

playCARTOON LDA   theRANK
L8157       CMP   #$02
            BNE   L815E
            JMP   playCARTOON1

L815E       CMP   #$05
            BNE   L8165
            JMP   playCARTOON2

L8165       CMP   #$09
            BNE   L816C
            JMP   playCARTOON3

L816C       BCC   L8172
            SBC   #$0D
            BCS   L8157
L8172       RTS

*-----------------------------------
* DRAW AN HORIZONTAL LINE
*-----------------------------------

cartoonHLINE
            STA   zpX1	; X
            STY   zpX2	; Y from
            STX   zpY1	; Y to
            LDA   #$80	; mode
            STA   hgrBIT7
            JMP   drawHLINE

*-----------------------------------
* DRAW A VERTICAL LINE
*-----------------------------------

cartoonVLINE
            STA   zpX1	; X
            STY   zpY1	; Y-from
            STX   zpY2	; Y-to
            JMP   drawVLINE

*-----------------------------------
* CARTOON INIT
*-----------------------------------

initCARTOON
            LDA   #$C1	; start X
            STA   pacmanX
            LDA   #$7A	; Y
            STA   pacmanY
            STA   ghostY
            LDA   #$E5
            STA   ghostX
            LDA   #$00
            STA   ghostISDEAD
            STA   ghostFRIGHTENED
            STA   pacmanSTEP
            LDA   #gINKY	; 1
            STA   ghostINDEX
            STA   $81
            STA   frameCNT
            STA   $80
            LDA   #dirLEFT
            STA   pacmanDIR
            RTS

*-----------------------------------
* PLAY CARTOON 1
*-----------------------------------

playCARTOON1
            JSR   clearHGR
            JSR   setHGR
            JSR   initCARTOON
L81B7       DEC   frameCNT
            BNE   L81DB
            LDA   #$20
            STA   frameCNT
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            SEC
            LDA   pacmanX	; x -= 2
            SBC   #$02
            STA   pacmanX
            STA   zpX1
            CMP   #$21
            BCC   L81FC
            LDA   pacmanY
            STA   zpY1
            INC   pacmanSTEP
            JSR   L79A4
L81DB       JSR   doWAIT
            DEC   $80
            BNE   L81F9
            LDA   #$1D
            STA   $80
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            SEC
            LDA   ghostX
            SBC   #$02
            STA   ghostX
            JSR   setXYGHOST
            JSR   L88A2
L81F9       JMP   L81B7

L81FC       JSR   setXYPACMAN
            JSR   eraseSPRITE44
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            LDY   #$08
L820A       LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L820A
            LDA   #$00
            STA   pacmanX
            SEC
            LDA   pacmanY
            SBC   #$0E
            STA   pacmanY
            LDA   #$38
            STA   ghostX
L8221       DEC   frameCNT
            BNE   L8237
            LDA   #$06
            STA   frameCNT
            CLC
            LDA   pacmanX
            ADC   #$02
            STA   pacmanX
            CMP   #$A0
            BCS   L8258
            JSR   L8259
L8237       JSR   doWAIT
            DEC   $80
            BNE   L8255
            LDA   #$07
            STA   $80
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            CLC
            LDA   ghostX
            ADC   #$02
            STA   ghostX
            JSR   setXYGHOST
            JSR   L88A2
L8255       JMP   L8221
L8258       RTS

L8259       INC   pacmanSTEP
            LDA   pacmanSTEP
            AND   #$03
            ASL
            TAX
            LDA   L82D8,X
            LDY   L82D8+1,X
            STA   L827A+1
            STY   L827A+2
            LDA   pacmanY
            STA   zpY1
            LDA   pacmanX
            STA   zpX1
            JSR   calcXYHGR
            LDY   #$4F
L827A       LDA   $0666,Y
            STA   sprDATA,Y
            DEY
            BPL   L827A
            LDA   #$14
            STA   sprHEIGHT
            LDA   zpXBIT
            BEQ   L8292
L828B       JSR   L82B1
            DEC   zpXBIT
            BNE   L828B
L8292       JSR   setHGRADDRESS
            LDX   zpXBIT
            LDY   zpXCOL
            LDA   #$04
            STA   zpTEMP2
L829D       LDA   sprDATA,X
            STA   (zpHGR),Y
            INX
            INY
            DEC   zpTEMP2
            BNE   L829D
            STX   zpXBIT
            INC   zpY1
            DEC   sprHEIGHT
            BNE   L8292
            RTS

L82B1       LDX   #$4C		; prepare the sprite data
L82B3       ASL   sprDATA,X
            ASL   sprDATA,X
            ROL   sprDATA+1,X
            ASL   sprDATA+1,X
            ROL   sprDATA+2,X
            ASL   sprDATA+2,X
            ROL   sprDATA+3,X
            ROR   sprDATA+2,X
            ROR   sprDATA+1,X
            ROR   sprDATA,X
            DEX
            DEX
            DEX
            DEX
            BPL   L82B3
            RTS

L82D8       DA    L82E0
            DA    L8330
            DA    L8380
            DA    L8330

L82E0       HEX   00000000007E0100407F0700607F0F00
            HEX   707F1F00787F3F00787F3F007C7F7F00
            HEX   7C7F7F007C7F7F007C7F7F007C7F7F00
            HEX   7C7F7F007C7F7F00787F3F00787F3F00
            HEX   707F1F00607F0F00407F0700007E0100
L8330       HEX   00000000007E0100407F0700607F0F00
            HEX   707F1F00787F3F00787F3F007C7F1F00
            HEX   7C7F03007C3F00007C0F00007C3F0000
            HEX   7C7F03007C7F1F00787F3F00787F3F00
            HEX   707F1F00607F0F00407F0700007E0100
L8380       HEX   00000000007E0100407F0700607F0300
            HEX   707F0100787F0000783F00007C1F0000
            HEX   7C0F00007C0700007C0300007C070000
            HEX   7C0F00007C1F0000783F0000787F0000
            HEX   707F0100607F0300407F0700007E0100

*-----------------------------------
* PLAY CARTOON 2
*-----------------------------------

playCARTOON2
            JSR   clearHGR
            JSR   setHGR
            JSR   initCARTOON
L83D9       DEC   frameCNT
            BNE   L840C
            LDA   #$28
            STA   frameCNT
            LDA   #$80
            LDY   #$7C
            LDX   #$81
            JSR   cartoonVLINE
            LDA   #$81
            LDY   #$7C
            LDX   #$81
            JSR   cartoonVLINE
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            SEC
            LDA   pacmanX
            SBC   #$02
            STA   pacmanX
            CMP   #$10
            BCC   L847D
            JSR   setXYPACMAN
            INC   pacmanSTEP
            JSR   L79A4
L840C       JSR   doWAIT
            DEC   $80
            BNE   L83D9
            LDA   #$21
            STA   $80
            LDA   ghostX
            CMP   #$71
            BEQ   L83D9
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            SEC
            LDA   ghostX
            SBC   #$02
            STA   ghostX
            JSR   setXYGHOST
            JSR   L88A2
            LDA   ghostX
            CMP   #$7B
            BCS   L83D9
            CMP   #$71
            BEQ   L844F
            SBC   #$73
            TAX
            LDA   #$A0
            STA   $80
            LDA   L847E,X
            LDY   L847F,X
            LDX   #$7F
            JSR   cartoonVLINE
            JMP   L83D9

L844F       JSR   setXYGHOST
            JSR   eraseSPRITE44
            JSR   setXYGHOST
            CLC
            LDA   zpX1
            ADC   #$0A
            STA   zpX1
            JSR   eraseSPRITE44
            JSR   setXYGHOST
            JSR   L88A2
            LDA   #$74
            LDY   #$7D
            LDX   #$7F
            JSR   cartoonVLINE
            LDA   #$76
            LDY   #$7E
            LDX   #$7F
            JSR   cartoonVLINE
            JMP   L83D9
L847D       RTS

L847E       DB    $79
L847F       DB    $7B
            DB    $7B
            DB    $7C
            DB    $7D
            DB    $7D
            DB    $7F
            DB    $7E

*-----------------------------------
* PLAY CARTOON 3
*-----------------------------------

playCARTOON3
            JSR   clearHGR
            JSR   setHGR
            JSR   initCARTOON
L848F       DEC   frameCNT
            BNE   L84B0
            LDA   #$26
            STA   frameCNT
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            SEC
            LDA   pacmanX
            SBC   #$02
            STA   pacmanX
            CMP   #$20
            BCC   L84DD
            JSR   setXYPACMAN
            INC   pacmanSTEP
            JSR   L79A4
L84B0       JSR   doWAIT
            DEC   $80
            BNE   L848F

            LDA   #$21
            STA   $80
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            SEC
            LDA   ghostX
            SBC   #$02
            STA   ghostX
            JSR   setXYGHOST
            JSR   L88A2
            CLC
            LDA   ghostX
            ADC   #$03
            LDY   #$7D
            LDX   #$7F
            JSR   cartoonVLINE
            JMP   L848F

*--- Play 2nd part of the cartoon

L84DD       JSR   setXYGHOST
            JSR   eraseSPRITE44
            LDY   #$08
L84E5       LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L84E5
            LDA   #$37
            STA   ghostX
            LDA   #$10
            STA   pacmanX
            LDA   #dirRIGHT
            STA   pacmanDIR
L84F9       DEC   frameCNT
            BNE   L8519
            LDA   #$22
            STA   frameCNT
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            LDA   pacmanX
            CMP   #$B0
            BCS   L8549
            ADC   #$02
            STA   pacmanX
            JSR   setXYPACMAN
            INC   pacmanSTEP
            JSR   L79A4
L8519       JSR   doWAIT
            DEC   $80
            BNE   L8546
            LDA   #$27
            STA   $80
            JSR   setXYGHOST
            JSR   eraseSPRITE54
            CLC
            LDA   ghostX
            ADC   #$02
            STA   ghostX
            JSR   setXYGHOST
            LDA   pacmanSTEP
            AND   #$02
            TAX
            LDA   L854A,X
            LDY   L854A+1,X
            STA   zpPTR2
            STY   zpPTR2+1
            JSR   prepareSPRITE
L8546       JMP   L84F9
L8549       RTS

L854A       DA    L856C
            DA    L854E

L854E       DB    $00
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
            DB    $61
            DB    $05
            DB    $00
            DB    $23
            DB    $07
            DB    $00
            DB    $33
            DB    $02
            DB    $00
            DB    $1E
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
L856C       DB    $00
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
            DB    $07
            DB    $00
            DB    $4E
            DB    $05
            DB    $00
            DB    $6F
            DB    $00
            DB    $00
            DB    $39
            DB    $00
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $60
            DB    $60

*-----------------------------------
* PACMAN IS TRAPPED (DEAD CODE)
*-----------------------------------

L858C       JSR   clearHGR
            JSR   setHGR
            LDA   #$80
            STA   hgrBIT7
            LDA   #$00
            LDY   #$7A
            LDX   #$51
            JSR   cartoonHLINE
            LDA   #$00
            LDY   #$7A
            LDX   #$5E
            JSR   cartoonHLINE
            LDA   #$88
            LDY   #$FC
            LDX   #$51
            JSR   cartoonHLINE
            LDA   #$88
            LDY   #$FC
            LDX   #$5E
            JSR   cartoonHLINE
            LDA   #$7A
            LDY   #$00
            LDX   #$51
            JSR   cartoonVLINE
            LDA   #$88
            LDY   #$00
            LDX   #$51
            JSR   cartoonVLINE
            LDA   #$7A
            LDY   #$5E
            LDX   #$BE
            JSR   cartoonVLINE
            LDA   #$88
            LDY   #$5E
            LDX   #$BE
            JSR   cartoonVLINE
            JSR   initCARTOON
            LDA   #$02
            STA   pacmanSTEP
            LDA   #gCLYDE
            STA   ghostINDEX
L85E9       JSR   getGHOSTSDATA
            DEC   ghostINDEX
            BNE   L85E9
            LDA   #$81
            STA   pacmanX
            STA   ghost1X
            STA   ghost2X
            LDA   #$31
            STA   ghost3X
            LDA   #$D1
            STA   ghost4X
            LDA   #$57
            STA   pacmanY
            STA   ghost3Y
            STA   ghost4Y
            LDA   #$07
            STA   ghost1Y
            LDA   #$A7
            STA   ghost2Y
            JSR   setXYPACMAN
            JSR   L79A4
L8616       LDA   #gCLYDE
            STA   ghostINDEX
L861A       JSR   setGHOSTSDATA
            DEC   $80
            BNE   L8662
            LDA   #$12
            STA   $80
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            LDA   ghostINDEX
            CMP   #$03
            BCS   L8649
            CMP   #$02
            BEQ   L863F
            CLC
            LDA   ghostY
            ADC   #$02
            STA   ghostY
            JMP   L865C

L863F       LDA   ghostY
            SEC
            SBC   #$02
            STA   ghostY
            JMP   L865C

L8649       BEQ   L8655
            SEC
            LDA   ghostX
            SBC   #$02
            STA   ghostX
            JMP   L865C

L8655       CLC
            LDA   ghostX
            ADC   #$02
            STA   ghostX
L865C       JSR   setXYGHOST
            JSR   L88A2
L8662       JSR   getGHOSTSDATA
            DEC   ghostINDEX
            BNE   L861A
            LDA   ghost1Y
            CMP   #$43
            BCC   L8616
            JSR   L7CF0
            LDA   #$8D
            LDY   #$8F
            LDX   #$57
            JSR   cartoonHLINE
            LDX   #$50
            JSR   doWAIT2
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            LDA   #dirUP
            STA   pacmanDIR
            JSR   setXYPACMAN
            JSR   L79A4
            JSR   L7CF0
            LDA   #$81
            LDY   #$49
            LDX   #$4C
            JSR   cartoonVLINE
            LDX   #$50
            JSR   doWAIT2
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            LDA   #dirLEFT
            STA   pacmanDIR
            JSR   setXYPACMAN
            JSR   L79A4
            JSR   L7CF0
            LDA   #$73
            LDY   #$75
            LDX   #$57
            JSR   cartoonHLINE
            LDX   #$50
            JSR   doWAIT2
            LDA   #dirDOWN
            STA   pacmanDIR
            JSR   setXYPACMAN
            JSR   eraseSPRITE44
            JSR   setXYPACMAN
            JSR   L79A4
            JSR   L7CF0
            LDA   #$81
            LDY   #$63
            LDX   #$66
            JSR   cartoonVLINE
            LDY   #$19
L86E0       NOP
            LDX   #$64
            JSR   doWAIT2
            DEY
            BNE   L86E0
            RTS

L86EA       LDA   #gCLYDE
            STA   ghostINDEX
L86EE       JSR   setGHOSTSDATA
            JSR   L8763
            JSR   getGHOSTSDATA
            DEC   ghostINDEX
            BNE   L86EE
            RTS

*--------------------------------------
* SET GHOSTS DATA (FOR ENGINE)
*--------------------------------------

setGHOSTSDATA
            LDY   ghostINDEX
            LDX   tblGHOSTSDATA,Y
            LDY   #$13
L8703       LDA   ghost1DATA,X
            STA   |ghostDATA,Y
            DEX
            DEY
            BPL   L8703
            RTS

*--- Addresses are: 84 / 97 / AB / BF / D3 / other data starts at $E7

tblGHOSTSDATA	; index of ghost data relative to $84
            HEX   0013273B4F

*--------------------------------------
* GET GHOSTS DATA (FROM ENGINE)
*--------------------------------------

getGHOSTSDATA
            LDY   ghostINDEX
            LDX   tblGHOSTSDATA,Y
            LDY   #$13
L8719       LDA   |ghostDATA,Y
            STA   ghost1DATA,X
            DEX
            DEY
            BPL   L8719
            RTS

*--------------------------------------
* FRAME COUNTER FOR GHOSTS ANIMATION...
*--------------------------------------

L8723       HEX   0A0A0908080707070706060606050504	; no frighten / no dead
L8733       HEX   13131110100D0D0C0C09090909070605	; not dead
L8743       HEX   131312111110100F0F0D0D0D0D0B0B07	; frightened
L8753       HEX   04040404030303030302020202020101	; dead

*-----------------------------------
* 
*-----------------------------------

L8763       DEC   $80	; timer for ghost refresh
            BEQ   L8768
            RTS

L8768       LDA   $E4	; are we in frighten mode?
            BEQ   L8780
            LDA   $E1	; what about the frighten tempo?
            BNE   L8772
            DEC   $E2
L8772       DEC   $E1
            CLC
            LDA   $E1
            ADC   $E2
            BNE   L8780
            BCS   L8780
            JSR   L6D49	; reset frightened parms

L8780       JSR   getMAXRANK15
            TAX
            LDA   ghostFRIGHTENED
            BNE   L8793
            LDA   ghostISDEAD
            BNE   L879A
            LDA   L8723,X
            STA   $80
            BNE   L879F
L8793       LDA   L8743,X
            STA   $80
            BNE   L879F
L879A       LDA   L8753,X
            STA   $80
L879F       CLC
            LDA   ghostINDEX
            ROR
            TAX
            DEX
            LDA   ghostDIR
            AND   #$02
            BEQ   L87AF
            LDA   ghostY
            BNE   L87B1
L87AF       LDA   ghostX
L87B1       AND   #$02
            BNE   L87BA
            TXA
            ADC   $80
            STA   $80
L87BA       LDA   $7A
            BEQ   L87C0
            ASL   $80
L87C0       LDA   ghostBOARD
            TAX
            JSR   checkMOVE
            LDY   #$00
            LDA   (ptrMOVE),Y
            CMP   ghostX
            BNE   L87D5
            INY
            LDA   (ptrMOVE),Y
            CMP   ghostY
            BEQ   L87ED
L87D5       LDA   ghostNEXTBOARD
            TAX
            JSR   checkMOVE
            LDY   #$00
            LDA   (ptrMOVE),Y
            CMP   ghostX
            BNE   L87EA
            INY
            LDA   (ptrMOVE),Y
            CMP   ghostY
            BEQ   L87ED
L87EA       JMP   L8866

L87ED       STX   ghostBOARD
            JSR   L8C50
            INC   ghostMOVEINDEX
            LDY   ghostMOVEINDEX
            LDA   (ghostMOVE),Y
            CMP   ghostDIR
            STA   ghostDIR
            BEQ   L880B
            LDA   ghostISDEAD
            BNE   L880B
            JSR   getMAXRANK15
            TAX
            LDA   L8733,X
            STA   $80
L880B       LDY   ghostDIR
            INY
            INY
            LDA   (ptrMOVE),Y
            STA   ghostNEXTBOARD
            LDA   ghostBOARD
            CMP   #$17
            BEQ   L8839
            CMP   #$18
            BEQ   L8839
            CMP   #$1A
            BEQ   L8854
            CMP   #$1D
            BNE   L8866
            LDA   #$15
            STA   $7B
            LDA   #$00
            STA   $7D
            LDA   ghostDIR
            CMP   #dirRIGHT
            BNE   L8862
L8833       LDA   #$01
            STA   $7A
            BNE   L8866
L8839       LDA   ghostISDEAD
            BEQ   L8866
            LDA   #$00
            STA   ghostISDEAD
            LDA   #$01
            STA   $81
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            JSR   setGHOSTINITIALPOSITION
            JSR   L6DA1
            JMP   L8866

L8854       LDA   #$06
            STA   $7B
            LDA   #$00
            STA   $7D
            LDA   ghostDIR
            CMP   #dirLEFT
            BEQ   L8833
L8862       LDA   #$00
            STA   $7A
L8866       LDA   $7A
            BEQ   L886D
            JMP   L8A9C

L886D       LDA   $81
            BEQ   L8874
            JMP   L8988

L8874       JSR   setXYGHOST
            JSR   eraseSPRITE44
            CLC
            LDA   ghostDIR
            ROR
            BNE   L888C
            LDA   ghostY
            BCS   L8888
            ADC   #$02
            BCC   L889A
L8888       SBC   #$02
            BCS   L889A
L888C       LDA   ghostX
            BCS   L8894
            ADC   #$02
            BCC   L8896
L8894       SBC   #$02
L8896       STA   ghostX
            LDA   ghostY
L889A       STA   ghostY
            STA   zpY1
            LDA   ghostX
            STA   zpX1

L88A2       LDA   ghostINDEX	; current ghost
            ASL
            TAX
            LDA   ghostFRIGHTENED	; is it frightened?
            BEQ   L88BC		; nope
            LDA   $E2
            BNE   L88BA
            LDA   $E1
            CMP   #$80
            BCS   L88BA
            LDX   #$06		; 0000_0110
            AND   #$10
            BEQ   L88C2
L88BA       LDX   #$00		; 0000_0000
L88BC       LDA   ghostISDEAD
            BEQ   L88C2
            LDX   #$0A		; 0000_1010

L88C2       LDA   fgCOLOR
            BEQ   L88D3
            CLC
            TXA
            ROR
            TAY
            LDA   L88E1,Y
            STA   hgrBIT7
            TXA
            ADC   #$0C
            TAX

L88D3       LDA   sprGHOSTS,X
            LDY   sprGHOSTS+1,X
            JSR   drawSPRITE
            LDA   $81
            BEQ   L88E6
            RTS

L88E1       DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00

*-----------------------------------
* 
*-----------------------------------

L88E6       LDA   ghostISDEAD	; is ghost dead?
            BNE   L88ED		; yes, skip
            JSR   L8B34
L88ED       CLC
            LDA   ghostDIR
            ROR
            BEQ   L8929
            BCS   L890F
            LDA   #$02
            ADC   $7D
            CMP   #$06
            BNE   L8901
            LDA   #$00
            INC   $7B
L8901       STA   $7D
            CMP   #$00
            BNE   L890E
            DEC   $7B
            JSR   L895F
            INC   $7B
L890E       RTS

L890F       LDA   $7D
            SBC   #$02
            CMP   #$FE
            BNE   L891B
            LDA   #$04
            DEC   $7B
L891B       STA   $7D
            CMP   #$00
            BNE   L890E
            INC   $7B
            JSR   L895F
            DEC   $7B
            RTS

L8929       BCS   L8945
            LDA   $7E
            ADC   #$02
            CMP   #$06
            BNE   L8937
            LDA   #$00
            INC   $7C
L8937       STA   $7E
            CMP   #$00
            BNE   L890E
            DEC   $7C
            JSR   L895F
            INC   $7C
            RTS

L8945       LDA   $7E
            SBC   #$02
            CMP   #$FE
            BNE   L8951
            LDA   #$04
            DEC   $7C
L8951       STA   $7E
            CMP   #$00
            BNE   L890E
            INC   $7C
            JSR   L895F
            DEC   $7C
            RTS

L895F       JSR   L8B13
            LDY   #$00
            LDA   (zpPTR2),Y
            ROR
            BCC   L8980
            LDA   $7B
            JSR   L8981
            CLC
            ADC   #$3B
            STA   zpX1
            LDA   $7C
            JSR   L8981
            CLC
            ADC   #$05
            STA   zpY1
            JSR   drawNORMALDOT
L8980       RTS

L8981       ASL		; *2
            STA   zpTEMP4
            ASL		; *4
            ADC   zpTEMP4	; +6
            RTS

*-----------------------------------
* 
*-----------------------------------

L8988       DEC   $82
            BNE   L89DA
            LDY   ghostMOVEINDEX
            LDA   ghostINDEX
            ROR
            BCC   L89A6
            LDA   ghostDIR
            CMP   #dirDOWN
            BNE   L899E
L8999       LDA   #$01
            INY
            STA   (ghostMOVE),Y
L899E       LDA   #$01
            INY
            STA   (ghostMOVE),Y
            JMP   L89C7

L89A6       LDA   ghostDIR
            CMP   #dirUP
            BNE   L89B1
            INY
            LDA   #$00
            STA   (ghostMOVE),Y

L89B1       LDA   ghostINDEX
            CMP   #$02
            BNE   L89BF
            LDA   #$02
            INY
            STA   (ghostMOVE),Y
            JMP   L8999

L89BF       LDA   #$03
            INY
            STA   (ghostMOVE),Y
            JMP   L8999

L89C7       INY
            LDA   $E9
            BNE   L89D7
            LDA   #$03
            STA   (ghostMOVE),Y
            INY
            LDA   #$FF
            STA   (ghostMOVE),Y
            BNE   L89DA
L89D7       JSR   L6EA5

*---

L89DA       LDA   ghostINDEX
            ROR
            BCC   L89E1
            BCS   L8A05
L89E1       ROR
            BCC   L89E8
            LDA   #$7F
            BNE   L89EA
L89E8       LDA   #$99
L89EA       CMP   ghostX
            BNE   L8A05
            LDA   ghostY
            CMP   #$55
            BNE   L89FF
L89F4       INC   ghostMOVEINDEX
            LDY   ghostMOVEINDEX
            LDA   (ghostMOVE),Y
            STA   ghostDIR
L89FC       JMP   L8874

L89FF       CMP   #$5D
            BEQ   L89F4
            BNE   L89FC

L8A05       LDA   ghostX
            CMP   #$8B
            BNE   L89FC
            LDA   ghostY
            CMP   #$5D
            BEQ   L89F4
            CMP   #$55
            BEQ   L89F4
            CMP   #$47
            BNE   L89FC
            JSR   drawGHOSTDOOR
            LDA   #$17
            STA   ghostBOARD
            LDA   #$18
            STA   ghostNEXTBOARD
            LDA   #$0D
            STA   $7B
            LDA   #$0B
            STA   $7C
            LDA   #$02
            STA   $7D
            LDA   #$00
            STA   $7E
            LDA   #$00
            STA   $81
            BEQ   L89F4

*-----------------------------------
* 
*-----------------------------------

L8A3A       DA    $0000
            DA    L8A44
            DA    L8A53
            DA    L8A61
            DA    L8A6F

L8A44       HEX   0300030101020202020201020003FF
L8A53       HEX   03030000000300000303000201FF
L8A61       HEX   03030003010103000200030002FF
L8A6F       HEX   03030000020002000002020003FF

*-----------------------------------
* DRAW GHOST DOOR
*-----------------------------------

drawGHOSTDOOR
            LDA   #$87
            STA   zpX1
            LDA   #$93
            STA   zpX2
            LDA   #$4D
            STA   zpY1
            JSR   drawHLINE
            LDA   #$87
            STA   zpX1
            LDA   #$93
            STA   zpX2
            LDA   #$4E
            STA   zpY1
            JSR   drawHLINE
            RTS

*-----------------------------------
* 
*-----------------------------------

L8A9C       JSR   setXYGHOST
            JSR   eraseSPRITE44
            LDA   ghostX
            CMP   #$60
            BCC   L8AE0
            LDA   ghostDIR
            ROR
            BCC   L8ABC
            LDA   ghostX
            SBC   #$02
            STA   ghostX
            STA   zpX1
L8AB5       LDA   ghostY
            STA   zpY1
            JMP   L88A2

L8ABC       LDA   ghostX
            ADC   #$02
            STA   ghostX
            STA   zpX1
            CMP   #$DD
            BNE   L8AB5
            LDA   ghostNEXTBOARD
            STA   ghostBOARD
            LDA   #$1D
            STA   ghostNEXTBOARD
            LDA   #$3D
            STA   ghostX
            STA   zpX1
            LDA   #$00
            STA   $7B
            LDA   #$00
            STA   $7D
            BEQ   L8AB5
L8AE0       LDA   ghostDIR
            ROR
            BCS   L8AEF
            LDA   ghostX
            ADC   #$02
            STA   ghostX
            STA   zpX1
            BNE   L8AB5
L8AEF       LDA   ghostX
            SBC   #$02
            STA   ghostX
            STA   zpX1
            CMP   #$3B
            BNE   L8AB5
            LDA   ghostNEXTBOARD
            STA   ghostBOARD
            LDA   #$1A
            STA   ghostNEXTBOARD
            LDA   #$DB
            STA   ghostX
            STA   zpX1
            LDA   #$1C
            STA   $7B
            LDA   #$00
            STA   $7D
            BEQ   L8AB5
L8B13       LDA   #>theBOARD
            STA   zpPTR2+1
            LDA   $7B
            ASL
            ASL
            ASL
            ASL
            BCC   L8B23
            INC   zpPTR2+1
            INC   zpPTR2+1
L8B23       ASL
            BCC   L8B28
            INC   zpPTR2+1
L8B28       CLC
            ADC   $7C
            ADC   #<theBOARD
            BCC   L8B31
            INC   zpPTR2+1
L8B31       STA   zpPTR2
            RTS

L8B34       LDA   pacmanX
            CMP   ghostX
            BNE   L8B6F
            SEC
            LDA   pacmanY
            SBC   ghostY
L8B3F       BCS   L8B45
            EOR   #$FF
            ADC   #$01
L8B45       CMP   #$0A
            BCS   L8B7D
            TAX
            LDA   theRANK
            CMP   #$05
            BCC   L8B67
            LDA   ghostDIR
            AND   #$02
            BEQ   L8B5A
            LDA   pacmanY
            BNE   L8B5C
L8B5A       LDA   pacmanX
L8B5C       AND   #$02
            BNE   L8B67
            CLC
            LDA   frameCNT
            ADC   #$01
            STA   frameCNT
L8B67       TXA
            CMP   #$06
            BCS   L8B7D
            JMP   L8B7E

L8B6F       LDA   pacmanY
            CMP   ghostY
            BNE   L8B7D
            SEC
            LDA   pacmanX
            SBC   ghostX
            JMP   L8B3F
L8B7D       RTS

*--- This code makes $1F and $67 useless

L8B7E       LDA   zp67
            JMP   L8B9D		; PATCH

            BEQ   L8B8A		; Dead code...
            DEC   zp67
            BEQ   L8B9D
            RTS

L8B8A       LDA   zp1F
            LDX   ghostFRIGHTENED	; is ghost frightened?
            BNE   L8B92		; yes
            AND   #$3F		; no
L8B92       CMP   #$00
            BNE   L8B9D
            LDA   #$04
            STA   zp67
            STA   pacmanSTEP
            RTS		; ...dead code

*--- End of useless code

L8B9D       LDA   ghostFRIGHTENED	; is ghost frightened?
            BEQ   L8BDD		; no, exit
            JSR   showBONUS
            JSR   getMAXRANK15
            ASL
            TAX
            LDA   $E1
            ADC   L6E19,X
            STA   $E1
            LDA   $E2
            ADC   L6E1A,X
            STA   $E2
            LDA   #$01		; the ghost is dead
            STA   ghostISDEAD
            LDA   #$00		; and so, no more frightened
            STA   ghostFRIGHTENED
            LDX   fgDEMO	; demo mode?
            BNE   L8BDC		; yes, skip
            CLC		; add score
            SED
            LDA   bonusINDEX
            ADC   curSCORE+1
            STA   curSCORE+1
            LDA   curSCORE+2
            ADC   #$00
            STA   curSCORE+2
            CLC
            LDA   bonusINDEX
            ADC   bonusINDEX
            STA   bonusINDEX
            CLD
            JSR   displayPLAYERSCORE
L8BDC       RTS

*-----------------------------------
* 
*-----------------------------------

L8BDD       JSR   getGHOSTSDATA
            JSR   L58FA
            LDY   #$03
L8BE5       LDX   #$FA
            JSR   doWAIT2
            DEY
            BNE   L8BE5
            LDA   #$04
            STA   ghostINDEX
L8BF1       JSR   setGHOSTSDATA
            JSR   setXYGHOST
            JSR   eraseSPRITE44
            DEC   ghostINDEX
            BNE   L8BF1
            JSR   setXYPACMAN	; set XY coords
            JSR   eraseSPRITE44	; erase the current Pacman sprite
            JSR   animPACMANDIES	; and shows the dying animation
            LDA   fgDEMO	; are we on demo mode?
            BEQ   L8C0E		; no
            JMP   welcomePAGE	; yes, return

L8C0E       DEC   nbLIVES	; lives--
            LDA   nbLIVES
            AND   #$7F
            BNE   L8C1A
            LDA   #$00		; we are dead
            STA   nbLIVES

L8C1A       JSR   savePLAYERBOARD
            JSR   savePLAYERDATA
            LDA   curPLAYER
            STA   zpTEMP4
            JMP   L8C2E

L8C27       JSR   loadPLAYERDATA
            LDA   nbLIVES
            BNE   L8C4A
L8C2E       INC   curPLAYER	; next player
            LDA   nbPLAYERS
            CMP   curPLAYER
            BCS   L8C3A
            LDA   #$01
            STA   curPLAYER
L8C3A       LDA   curPLAYER
            CMP   zpTEMP4
            BNE   L8C27
            JSR   loadPLAYERDATA
            LDA   nbLIVES
            BNE   L8C4A
            JMP   endGAME

L8C4A       JSR   loadPLAYERBOARD
            JMP   L5306

*-----------------------------------
* GHOST INTELLIGENCE
*-----------------------------------

L8C50       LDA   ghostISDEAD
            BEQ   L8C64
            LDY   ghostMOVEINDEX
            LDX   ghostBOARD
            LDA   LA360,X
            INY
            STA   (ghostMOVE),Y
            INY
            LDA   #$FF
            STA   (ghostMOVE),Y
            RTS

L8C64       LDY   ghostMOVEINDEX
            INY
            LDA   (ghostMOVE),Y
            BMI   L8C6C
            RTS

L8C6C       LDA   ghostBOARD
            ASL
            ASL
            ADC   ghostINDEX
            SEC
            SBC   #$01
            TAX
            LDA   L8CBE,X
            ASL
            TAX
            LDA   L8DBE,X
            STA   L8CA6+1
            LDA   L8DBE+1,X
            STA   L8CA6+2
            LDA   ghostFRIGHTENED
            BNE   L8C8F
            LDA   $E9
            BEQ   L8CA0
L8C8F       LDA   ghostINDEX
            ASL
            TAX
            LDA   L8CB4,X
            TAY
            LDA   L8CB5,X
            TAX
            LDA   ghostDIR
            JMP   L8CA6

L8CA0       LDA   ghostDIR
            LDX   pacmanX
            LDY   pacmanY
L8CA6       JSR   $0666
            LDY   ghostMOVEINDEX
            INY
            STA   (ghostMOVE),Y
            INY
            LDA   #$FF
            STA   (ghostMOVE),Y
            RTS

L8CB4       DB    $00
L8CB5       DB    $00
            DB    $19
            DB    $C9
            DB    $19
            DB    $51
            DB    $87
            DB    $51
            DB    $87
            DB    $C9

L8CBE	HEX   00000000040404040101010100000000
	HEX   05050505010101010606060608080808
	HEX   0A290A0A0C0C0C0C0D0D0D2D0B0B0B0B
	HEX   2609090907070707020202020E0E0E0E
	HEX   02020202010101010000000003030303
	HEX   0F0F0F2E030303030000000010101010
	HEX   11111111010101011228121214141414
	HEX   15151515131313131616162F17171717
	HEX   0000000018182C181A1A1A1A01010101
	HEX   000000001B271B1B1919191901010101
	HEX   02020202010101011C1C1C1C1E1E1E1E
	HEX   20202B20212121211F1F1F1F1D1D1D1D
	HEX   00000000030303030000000022222222
	HEX   03030303020202020101010100000000
	HEX   03030303020202022323232301010101
	HEX   020202022424242425252A2503030303

L8DBE       DA    L8E1E
            DA    L8E28
            DA    L8E32
            DA    L8E3C
            DA    L8E46
            DA    L8E6B
            DA    L8E90
            DA    L8EB3
            DA    L8ED6
            DA    L8F20
            DA    L8F6C
            DA    L8F95
            DA    L8FBE
            DA    L8FED
            DA    L901A
            DA    L903B
            DA    L905E
            DA    L905F
            DA    L9073
            DA    L90B7
            DA    L90CF
            DA    L90F0
            DA    L9111
            DA    L9136
            DA    L915D
            DA    L91C3
            DA    L922B
            DA    L9266
            DA    L92A3
            DA    L92F2
            DA    L933D
            DA    L936A
            DA    L9399
            DA    L93DE
            DA    L941D
            DA    L9458
            DA    L9493
            DA    L94C6
            DA    L94F7
            DA    L95EA
            DA    L96C0
            DA    L969D
            DA    L966C
            DA    L9627
            DA    L9590
            DA    L951F
            DA    L954A
            DA    L956B

L8E1E       CMP   #$01
            BEQ   L8E25
            LDA   #$00
            RTS

L8E25       LDA   #$02
            RTS

L8E28       CMP   #$01
            BEQ   L8E2F
            LDA   #$00
            RTS

L8E2F       LDA   #$03
            RTS

L8E32       CMP   #$00
            BEQ   L8E39
            LDA   #$01
            RTS

L8E39       LDA   #$02
            RTS

L8E3C       CMP   #$00
            BEQ   L8E43
            LDA   #$01
            RTS

L8E43       LDA   #$03
            RTS

L8E46       CMP   #$01
            BEQ   L8E62
            CPY   #$22
            BCS   L8E5F
            CMP   #$02
            BEQ   L8E59
            CPX   ghostX
            BCS   L8E5F
L8E56       LDA   #$03
            RTS

L8E59       CPX   ghostX
            BEQ   L8E5F
            BCS   L8E68
L8E5F       LDA   #$00
            RTS

L8E62       CPX   ghostX
            BEQ   L8E56
            BCC   L8E56
L8E68       LDA   #$02
            RTS

L8E6B       CMP   #$01
            BEQ   L8E89
            CPY   #$22
            BCS   L8E86
            CMP   #$03
            BEQ   L8E80
            CPX   ghostX
            BEQ   L8E86
            BCC   L8E86
L8E7D       LDA   #$02
            RTS

L8E80       CPX   ghostX
            BEQ   L8E86
            BCC   L8E8D
L8E86       LDA   #$00
            RTS

L8E89       CPX   ghostX
            BCS   L8E7D
L8E8D       LDA   #$03
            RTS

L8E90       CMP   #$03
            BEQ   L8EAC
            CPX   #$5F
            BCS   L8EA2
            CMP   #$01
            BEQ   L8EA5
            CPY   ghostY
            BEQ   L8EA2
            BCS   L8EB0
L8EA2       LDA   #$02
            RTS

L8EA5       CPY   ghostY
            BCS   L8EA2
L8EA9       LDA   #$01
            RTS

L8EAC       CPY   ghostY
            BCC   L8EA9
L8EB0       LDA   #$00
            RTS

L8EB3       CMP   #$02
            BEQ   L8ECF
            CPX   #$BB
            BCC   L8EC5
            CMP   #$01
            BEQ   L8EC8
            CPY   ghostY
            BEQ   L8EC5
            BCS   L8ED3
L8EC5       LDA   #$03
            RTS

L8EC8       CPY   ghostY
            BCS   L8EC5
L8ECC       LDA   #$01
            RTS

L8ECF       CPY   ghostY
            BCC   L8ECC
L8ED3       LDA   #$00
            RTS

L8ED6       CMP   #$01
            BEQ   L8EEF
            CPY   #$58
            BCS   L8F15
            CMP   #$02
            BEQ   L8EF8
            CMP   #$03
            BEQ   L8F0B
            CPX   ghostX
            BEQ   L8F15
            BCS   L8F02
L8EEC       LDA   #$03
            RTS

L8EEF       CPX   ghostX
            BCC   L8EEC
            BNE   L8F02
L8EF5       LDA   #$01
            RTS

L8EF8       CPX   ghostX
            BCC   L8F05
            BEQ   L8F05
            CPY   ghostY
            BCC   L8EF5
L8F02       LDA   #$02
            RTS

L8F05       CPY   ghostY
            BCC   L8EF5
            BCS   L8F15
L8F0B       CPX   ghostX
            BCC   L8F18
            CPY   ghostY
            BCC   L8EF5
            BEQ   L8EF5
L8F15       LDA   #$00
            RTS

L8F18       CPY   ghostY
            BEQ   L8EEC
            BCC   L8EF5
            BCS   L8F15
L8F20       CMP   #$01
            BEQ   L8F39
            CPY   #$58
            BCS   L8F61
            CMP   #$03
            BEQ   L8F42
            CMP   #$02
            BEQ   L8F55
            CPX   ghostX
            BEQ   L8F61
            BCC   L8F3F
L8F36       LDA   #$02
            RTS

L8F39       CPX   ghostX
            BEQ   L8F4C
            BCS   L8F36
L8F3F       LDA   #$03
            RTS

L8F42       CPX   ghostX
            BCS   L8F4F
            CPY   ghostY
            BEQ   L8F3F
            BCC   L8F3F
L8F4C       LDA   #$01
            RTS

L8F4F       CPY   ghostY
            BCC   L8F4C
            BCS   L8F61
L8F55       CPX   ghostX
            BEQ   L8F5B
            BCS   L8F64
L8F5B       CPY   ghostY
            BCC   L8F4C
            BEQ   L8F4C
L8F61       LDA   #$00
            RTS

L8F64       CPY   ghostY
            BEQ   L8F36
            BCC   L8F4C
            BCS   L8F61

L8F6C       CMP   #$01
            BEQ   L8F8A
            CMP   #$02
            BEQ   L8F81
            CPX   #$60
            BCC   L8F92
            CPY   ghostY
            BCC   L8F92
            BEQ   L8F92
L8F7E       LDA   #$00
            RTS

L8F81       CPY   ghostY
            BEQ   L8F87
            BCS   L8F7E
L8F87       LDA   #$02
            RTS

L8F8A       CPY   #$37
            BCS   L8F92
            CPX   ghostX
            BCS   L8F87
L8F92       LDA   #$03
            RTS

L8F95       CMP   #$01
            BEQ   L8FB3
            CMP   #$03
            BEQ   L8FAA
            CPX   #$B9
            BCS   L8FBB
            CPY   ghostY
            BCC   L8FBB
            BEQ   L8FBB
L8FA7       LDA   #$00
            RTS

L8FAA       CPY   ghostY
            BEQ   L8FB0
            BCS   L8FA7
L8FB0       LDA   #$03
            RTS

L8FB3       CPY   #$37
            BCS   L8FBB
            CPX   ghostX
            BCC   L8FB0
L8FBB       LDA   #$02
            RTS

L8FBE       CMP   #$00
            BEQ   L8FE5
            CMP   #$02
            BEQ   L8FD8
            CPX   #$85
            BCC   L8FCD
L8FCA       LDA   #$03
            RTS

L8FCD       CPX   #$61
            BCC   L8FCA
            CPY   ghostY
            BCS   L8FCA
L8FD5       LDA   #$01
            RTS

L8FD8       CPX   #$85
            BCC   L8FDF
L8FDC       LDA   #$02
            RTS

L8FDF       CPY   #$37
            BCC   L8FD5
            BCS   L8FDC
L8FE5       CPX   ghostX
            BCC   L8FCA
            BEQ   L8FCA
            BCS   L8FDC

L8FED       CMP   #$00
            BEQ   L9014
            CMP   #$03
            BEQ   L9007
            CPX   #$93
            BCS   L8FFC
L8FF9       LDA   #$02
            RTS

L8FFC       CPX   #$B9
            BCS   L8FF9
            CPY   ghostY
            BCS   L8FF9
L9004       LDA   #$01
            RTS

L9007       CPX   #$93
            BCS   L900E
L900B       LDA   #$03
            RTS

L900E       CPY   #$37
            BCC   L9004
            BCS   L900B
L9014       CPX   ghostX
            BCS   L8FF9
            BCC   L900B

L901A       CMP   #$02
            BEQ   L9032
            CMP   #$00
            BEQ   L9029
            CPX   ghostX
            BCC   L902F
L9026       LDA   #$01
            RTS

L9029       CPY   ghostY
            BEQ   L902F
            BCS   L9038
L902F       LDA   #$03
            RTS

L9032       CPY   ghostY
            BCC   L9026
            BEQ   L9026
L9038       LDA   #$00
            RTS

L903B       CMP   #$03
            BEQ   L9055
            CMP   #$00
            BEQ   L904C
            CPX   ghostX
            BEQ   L9049
            BCS   L9052
L9049       LDA   #$01
            RTS

L904C       CPY   ghostY
            BEQ   L9052
            BCS   L905B
L9052       LDA   #$02
            RTS

L9055       CPY   ghostY
            BCC   L9049
            BEQ   L9049
L905B       LDA   #$00
            RTS

L905E       NOP
L905F       CMP   #$00
            BEQ   L906D
            CMP   #$02
            BEQ   L906A
L9067       LDA   #$03
            RTS

L906A       LDA   #$02
            RTS

L906D       CPX   ghostX
            BCC   L9067
            BCS   L906A
L9073       CMP   #$02
            BEQ   L90A3
            LDA   pacmanINTUNNEL
            BEQ   L907E
            LDA   #$03
            RTS

L907E       LDA   ghostDIR
            CMP   #$03
            BEQ   L90B1
            CMP   #$01
            BEQ   L9098
            CPY   ghostY
            BEQ   L908E
            BCS   L9091
L908E       LDA   #$02
            RTS

L9091       CPY   #$6C
            BCC   L908E
L9095       LDA   #$00
            RTS

L9098       CPY   ghostY
            BCS   L908E
            CPY   #$46
            BCS   L908E
L90A0       LDA   #$01
            RTS

L90A3       CPX   ghostX
            BEQ   L90B1
            CPY   #$46
            BCC   L90A0
            CPY   #$6C
            BCS   L9095
            BCC   L908E
L90B1       CPY   ghostY
            BCC   L90A0
            BCS   L9095

L90B7       PHA
            CMP   #$02
            BCC   L90BE
            EOR   #$01
L90BE       STA   ghostDIR
            JSR   L9073
            CMP   #$02
            BCC   L90C9
            EOR   #$01
L90C9       TAX
            PLA
            STA   ghostDIR
            TXA
            RTS

L90CF       CMP   #$02
            BEQ   L90E9
            CPX   #$60
            BCC   L90E6
            CMP   #$01
            BEQ   L90E2
            CPY   #$36
            BCC   L90E6
L90DF       LDA   #$00
            RTS

L90E2       CPY   #$7C
            BCC   L90ED
L90E6       LDA   #$03
            RTS

L90E9       CPY   ghostY
            BCS   L90DF
L90ED       LDA   #$01
            RTS

L90F0       CMP   #$03
            BEQ   L910A
            CPX   #$B9
            BCS   L9107
            CMP   #$01
            BEQ   L9103
            CPY   #$36
            BCC   L9107
L9100       LDA   #$00
            RTS

L9103       CPY   #$7C
            BCC   L910E
L9107       LDA   #$02
            RTS

L910A       CPY   ghostY
            BCS   L9100
L910E       LDA   #$01
            RTS

L9111       CMP   #$03
            BEQ   L9130
            CMP   #$01
            BEQ   L9129
            CPX   ghostX
            BCS   L9120
L911D       LDA   #$00
            RTS

L9120       CPY   ghostY
            BEQ   L9126
            BCS   L911D
L9126       LDA   #$02
            RTS

L9129       CPY   ghostY
            BEQ   L9126
L912D       LDA   #$01
            RTS

L9130       CPY   ghostY
            BCC   L912D
            BCS   L911D

L9136       CMP   #$02
            BEQ   L9157
            CMP   #$01
            BEQ   L9150
            CPX   ghostX
            BCC   L9147
            BEQ   L9147
L9144       LDA   #$00
            RTS

L9147       CPY   ghostY
            BEQ   L914D
            BCS   L9144
L914D       LDA   #$03
            RTS

L9150       CPY   ghostY
            BEQ   L914D
L9154       LDA   #$01
            RTS

L9157       CPY   ghostY
            BCC   L9154
            BCS   L9144

L915D       CMP   #$00
            BEQ   L91A3
            CPY   #$36
            BCS   L9168
L9165       LDA   #$01
            RTS

L9168       CPX   ghostX
            BEQ   L9165
            CMP   #$01
            BEQ   L919D
            CMP   #$02
            BEQ   L917E
            CPX   ghostX
            BCC   L917B
L9178       LDA   #$00
            RTS

L917B       LDA   #$03
            RTS

L917E       CPX   ghostX
            BEQ   L9178
            BCC   L9178
            CPX   #$8D
            BCC   L918B
L9188       LDA   #$02
            RTS

L918B       CPY   ghostY
            BEQ   L9188
            BCS   L9197
            CPY   #$5A
            BCC   L9165
            BCS   L9188
L9197       CPY   #$8F
            BCS   L9178
            BCC   L9188
L919D       CPX   ghostX
            BCC   L917B
            BCS   L9188
L91A3       CPY   ghostY
            BCC   L9188
            BNE   L91AF
            CPX   ghostX
            BCC   L917B
            BCS   L9188
L91AF       CPX   ghostX
            BEQ   L9178
            BCS   L91BB
            CPY   #$A1
            BCS   L9178
            BCC   L917B
L91BB       LDA   pacmanDIR
            CMP   #dirLEFT
            BEQ   L9178
            BNE   L9188

L91C3       CMP   #$00
            BEQ   L920B
            CPY   #$36
            BCS   L91CE
L91CB       LDA   #$01
            RTS

L91CE       CPX   ghostX
            BEQ   L91CB
            CMP   #$01
            BEQ   L9205
            CMP   #$03
            BEQ   L91E6
            CPX   ghostX
            BEQ   L91E0
            BCS   L917B
L91E0       LDA   #$00
            RTS

L91E3       LDA   #$02
            RTS

L91E6       CPX   ghostX
            BCS   L91E0
            CPX   #$8D
            BEQ   L91F0
            BCS   L91F3
L91F0       LDA   #$03
            RTS

L91F3       CPY   ghostY
            BEQ   L91F0
            BCS   L91FF
            CPY   #$5A
            BCC   L91CB
            BCS   L91F0
L91FF       CPY   #$8F
            BCS   L91E0
            BCC   L91F0
L9205       CPX   ghostX
            BCS   L91E3
            BCC   L91F0
L920B       CPY   ghostY
            BCC   L91F0
            BNE   L9217
            CPX   ghostX
            BCS   L91E3
            BCC   L91F0
L9217       CPX   ghostX
            BEQ   L91E0
            BCC   L9223
            CPY   #$A1
            BCS   L91E0
            BCC   L91E3
L9223       LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L91E0
            BNE   L91F0

L922B       CMP   #$00
            BEQ   L9258
            CMP   #$02
            BEQ   L924D
            CPY   #$36
            BCS   L923A
L9237       LDA   #$03
            RTS

L923A       CPY   ghostY
            BCS   L9237
            CPX   ghostX
            BCC   L9245
L9242       LDA   #$01
            RTS

L9245       LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L9242
            BNE   L9237
L924D       CPY   #$36
            BCC   L9242
            CPY   ghostY
            BCC   L9242
L9255       LDA   #$02
            RTS

L9258       CPY   ghostY
            BCC   L9237
            BEQ   L9260
            BCS   L9255
L9260       CPX   ghostX
            BCC   L9237
            BCS   L9255

L9266       CMP   #$00
            BEQ   L9295
            CMP   #$03
            BEQ   L928A
            CPY   #$36
            BCS   L9275
L9272       LDA   #$02
            RTS

L9275       CPY   ghostY
            BCS   L9272
            CPX   ghostX
            BEQ   L927F
            BCS   L9282
L927F       LDA   #$01
            RTS

L9282       LDA   pacmanDIR
            CMP   #$03
            BEQ   L927F
            BNE   L9272
L928A       CPY   #$36
            BCC   L927F
            CPY   ghostY
            BCC   L927F
L9292       LDA   #$03
            RTS

L9295       CPY   ghostY
            BCC   L9272
            BEQ   L929D
            BCS   L9292
L929D       CPX   ghostX
            BCS   L9272
            BCC   L9292

L92A3       CMP   #$03
            BEQ   L92EC
            CMP   #$01
            BEQ   L92CB
            CPY   #$5A
            BCC   L92BC
            CPX   ghostX
            BEQ   L92B5
            BCS   L92B8
L92B5       LDA   #$00
            RTS

L92B8       CPX   #$83
            BCC   L92BF
L92BC       LDA   #$02
            RTS

L92BF       CPY   #$B3
            BCC   L92BC
            LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L92BC
            BNE   L92B5
L92CB       CPY   #$7D
            BCS   L92D2
L92CF       LDA   #$01
            RTS

L92D2       CPX   #$83
            BCS   L92BC
            CPX   ghostX
            BEQ   L92CF
            BCC   L92CF
            CPY   ghostY
            BCS   L92BC
            LDA   pacmanDIR
            CMP   #dirLEFT
            BEQ   L92CF
            CMP   #$01
            BEQ   L92CF
            BNE   L92BC
L92EC       CPY   ghostY
            BCC   L92CF
            BCS   L92B5

L92F2       CMP   #$02
            BEQ   L9337
            CMP   #$01
            BEQ   L9318
            CPY   #$5A
            BCC   L9309
            CPX   ghostX
            BCC   L9305
L9302       LDA   #$00
            RTS

L9305       CPX   #$96
            BCS   L930C
L9309       LDA   #$03
            RTS

L930C       CPY   #$B3
            BCC   L9309
            LDA   pacmanDIR
            CMP   #dirLEFT
            BEQ   L9309
            BNE   L9302
L9318       CPY   #$7D
            BCS   L931F
L931C       LDA   #$01
            RTS

L931F       CPX   #$96
            BCC   L9309
            CPX   ghostX
            BCS   L931C
            CPY   ghostY
            BCS   L9309
            LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L931C
            CMP   #$01
            BEQ   L931C
            BNE   L9309
L9337       CPY   ghostY
            BCC   L931C
            BCS   L9302

L933D       CMP   #$01
            BEQ   L9364
            CMP   #$02
            BEQ   L9355
            CPX   ghostX
            BCC   L9352
            CPY   ghostY
            BCC   L9352
            BEQ   L9352
L934F       LDA   #$00
            RTS

L9352       LDA   #$03
            RTS

L9355       CPY   ghostY
            BEQ   L935B
            BCS   L935E
L935B       LDA   #$02
            RTS

L935E       CPX   #$84
            BCC   L934F
            BCS   L935B
L9364       CPX   ghostX
            BCC   L9352
            BCS   L935B

L936A       CMP   #$01
            BEQ   L9393
            CMP   #$03
            BEQ   L9384
            CPX   ghostX
            BEQ   L9378
            BCS   L9381
L9378       CPY   ghostY
            BCC   L9381
            BEQ   L9381
L937E       LDA   #$00
            RTS

L9381       LDA   #$02
            RTS

L9384       CPY   ghostY
            BEQ   L938A
            BCS   L938D
L938A       LDA   #$03
            RTS

L938D       CPX   #$94
            BCS   L937E
            BCC   L938A
L9393       CPX   ghostX
            BCS   L9381
            BCC   L938A

L9399       CMP   #$00
            BEQ   L93CA
            CMP   #$02
            BEQ   L93B1
            CPY   #$7D
            BCC   L93AE
            CPX   ghostX
            BEQ   L93AB
            BCS   L93AE
L93AB       LDA   #$03
            RTS

L93AE       LDA   #$01
            RTS

L93B1       CPY   #$B3
            BCS   L93BF
            CPY   #$6B
            BEQ   L93C2
            CPX   ghostX
            BCC   L93AE
            BEQ   L93AE
L93BF       LDA   #$02
            RTS

L93C2       LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L93BF
            BNE   L93AE
L93CA       CPY   #$B3
            BCC   L93D6
            LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L93BF
            BNE   L93AB
L93D6       CPX   ghostX
            BCC   L93AB
            BEQ   L93AB
            BCS   L93BF

L93DE       CMP   #$00
            BEQ   L940B
            CMP   #$03
            BEQ   L93F4
            CPY   #$7D
            BCC   L93F1
            CPX   ghostX
            BCC   L93F1
L93EE       LDA   #$02
            RTS

L93F1       LDA   #$01
            RTS

L93F4       CPY   #$B3
            BCS   L9400
            CPY   #$6B
            BEQ   L9403
            CPX   ghostX
            BCS   L93F1
L9400       LDA   #$03
            RTS

L9403       LDA   pacmanDIR
            CMP   #dirLEFT
            BEQ   L9400
            BNE   L93F1
L940B       CPY   #$B3
            BCC   L9417
            LDA   pacmanDIR
            CMP   #dirLEFT
            BEQ   L9400
            BNE   L93EE
L9417       CPX   ghostX
            BCS   L93EE
            BCC   L9400

L941D       CMP   #$00
            BEQ   L943E
            CMP   #$02
            BEQ   L942C
            CPY   ghostY
            BCC   L9438
L9429       LDA   #$03
            RTS

L942C       CPY   #$7D
            BCC   L943B
            CPY   ghostY
            BCS   L943B
            CPX   #$5F
            BCS   L943B
L9438       LDA   #$01
            RTS

L943B       LDA   #$02
            RTS

L943E       CPY   #$B3
            BNE   L944E
            LDA   pacmanDIR
            CMP   #dirRIGHT
            BNE   L9429
            CPX   ghostX
            BCC   L9429
            BCS   L943B
L944E       CPX   ghostX
            BCS   L943B
            CPY   ghostY
            BCS   L9429
            BCC   L943B

L9458       CMP   #$00
            BEQ   L9479
            CMP   #$03
            BEQ   L9467
            CPY   ghostY
            BCC   L9473
L9464       LDA   #$02
            RTS

L9467       CPY   #$7D
            BCC   L9476
            CPY   ghostY
            BCS   L9476
            CPX   #$BA
            BCC   L9476
L9473       LDA   #$01
            RTS

L9476       LDA   #$03
            RTS

L9479       CPY   #$B3
            BNE   L9489
            LDA   pacmanDIR
            CMP   #dirLEFT
            BNE   L9464
            CPX   ghostX
            BCC   L9476
            BCS   L9464
L9489       CPX   ghostX
            BCC   L9476
            CPY   ghostY
            BCS   L9464
            BCC   L9476

L9493       CMP   #$00
            BEQ   L94BC
            CMP   #$02
            BEQ   L94AF
            CPY   #$B3
            BEQ   L94A9
            CPX   #$5F
            BCS   L94AC
            LDA   pacmanDIR
            CMP   #dirDOWN
            BNE   L94AC
L94A9       LDA   #$03
            RTS

L94AC       LDA   #$01
            RTS

L94AF       CPY   #$B3
            BEQ   L94B9
            CPX   ghostX
            BCC   L94AC
            BEQ   L94AC
L94B9       LDA   #$02
            RTS

L94BC       CPY   #$7D
            BCC   L94B9
            CPX   ghostX
            BCC   L94A9
            BCS   L94B9

L94C6       CMP   #$00
            BEQ   L94ED
            CMP   #$03
            BEQ   L94E2
            CPY   #$B3
            BEQ   L94DC
            CPX   #$BA
            BCC   L94DF
            LDA   pacmanDIR
            CMP   #dirDOWN
            BNE   L94DF
L94DC       LDA   #$02
            RTS
L94DF       LDA   #$01
            RTS

L94E2       CPY   #$B3
            BEQ   L94EA
            CPX   ghostX
            BCS   L94DF
L94EA       LDA   #$03
            RTS

L94ED       CPY   #$7D
            BCC   L94EA
            CPX   ghostX
            BCS   L94DC
            BCC   L94EA

L94F7       PHA
            TXA
            SEC
            SBC   ghostX
            BCS   L9500
            EOR   #$FF
L9500       CMP   #$20
            BCS   L951B
            TYA
            SEC
            SBC   ghostY
            BCS   L950C
            EOR   #$FF
L950C       CMP   #$20
            BCS   L951B
            PLA
            CMP   #$02
            BEQ   L9518
            LDA   #$03
            RTS

L9518       LDA   #$01
            RTS

L951B       PLA
            JMP   L8F20

L951F       CMP   #$00
            BEQ   L9544
            CMP   #$03
            BEQ   L9539
            CPX   #$93
            BCS   L952E
L952B       LDA   #$01
            RTS

L952E       CPX   #$B9
            BCS   L952B
            CPY   ghostY
            BCS   L952B
L9536       LDA   #$02
            RTS

L9539       CPX   #$93
            BCC   L952B
            CPX   #$37
            BCC   L952B
L9541       LDA   #$03
            RTS

L9544       CPX   ghostX
            BCS   L9541
            BCC   L9536

L954A       CMP   #$03
            BEQ   L9564
            CMP   #$00
            BEQ   L955B
            CPX   ghostX
            BEQ   L9558
            BCS   L9568
L9558       LDA   #$02
            RTS

L955B       CPY   ghostY
            BEQ   L9561
            BCS   L9558
L9561       LDA   #$00
            RTS

L9564       CPY   ghostY
            BCS   L9561
L9568       LDA   #$00
            RTS

L956B       CMP   #$03
            BEQ   L958A
            CMP   #$01
            BEQ   L9583
            CPX   ghostX
            BCS   L957A
L9577       LDA   #$02
            RTS

L957A       CPY   ghostY
            BEQ   L9580
            BCS   L9577
L9580       LDA   #$00
            RTS

L9583       CPY   ghostY
            BNE   L9577
L9587       LDA   #$01
            RTS

L958A       CPY   ghostY
            BCC   L9580
            BCS   L9587

L9590       CMP   #$00
            BEQ   L95CA
            CPY   #$36
            BCS   L959B
L9598       LDA   #$01
            RTS

L959B       CMP   #$01
            BEQ   L95C4
            CMP   #$02
            BEQ   L95AD
            CPX   ghostX
            BCC   L95AA
L95A7       LDA   #$00
            RTS

L95AA       LDA   #$03
            RTS

L95AD       CPX   ghostX
            BEQ   L9598
            BCC   L9598
            CPX   #$8D
            BCS   L9598
            CPY   ghostY
            BCS   L9598
            CPY   #$5A
            BCC   L95A7
            BCS   L9598
L95C1       LDA   #$02
            RTS

L95C4       CPX   ghostX
            BCC   L95AA
            BCS   L95C1
L95CA       CPY   ghostY
            BCC   L95C1
            BNE   L95D6
            CPX   ghostX
            BCC   L95AA
            BCS   L95C1
L95D6       CPX   ghostX
            BEQ   L95A7
            BCS   L95E2
            CPY   #$A1
            BCS   L95A7
            BCC   L95AA
L95E2       LDA   pacmanDIR
            CMP   #dirLEFT
            BEQ   L95A7
            BNE   L95C1

L95EA       CMP   #$00
            BEQ   L9619
            CMP   #$03
            BEQ   L960E
            CPY   #$36
            BCS   L95F9
L95F6       LDA   #$01
            RTS

L95F9       CPY   ghostY
            BCS   L95F6
            CPX   ghostX
            BEQ   L9603
            BCS   L9606
L9603       LDA   #$02
            RTS

L9606       LDA   pacmanDIR
            CMP   #dirLEFT
            BEQ   L9603
            BNE   L95F6
L960E       CPY   #$36
            BCC   L9616
            CPY   ghostY
            BCS   L95F6
L9616       LDA   #$03
            RTS

L9619       CPY   ghostY
            BCC   L9616
            BEQ   L9621
            BCS   L9603
L9621       CPX   ghostX
            BCS   L9616
            BCC   L9603

L9627       CMP   #$00
            BEQ   L9658
            CMP   #$02
            BEQ   L963F
            CPY   #$7D
            BCC   L9639
            CPX   ghostX
            BEQ   L963C
            BCC   L963C
L9639       LDA   #$03
            RTS

L963C       LDA   #$01
            RTS

L963F       CPY   #$B3
            BCS   L963C
            CPY   #$6B
            BEQ   L9650
            CPX   ghostX
            BEQ   L964D
            BCS   L963C
L964D       LDA   #$02
            RTS

L9650       LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L963C
            BNE   L964D
L9658       CPY   #$B3
            BCC   L9664
            LDA   pacmanDIR
            CMP   #dirRIGHT
            BEQ   L9639
            BNE   L964D
L9664       CPX   ghostX
            BCC   L964D
            BEQ   L964D
            BCS   L9639

L966C       CMP   #$00
            BEQ   L9693
            CMP   #$03
            BEQ   L9688
            CPY   #$B3
            BEQ   L9682
            CPX   #$BA
            BCC   L9685
            LDA   pacmanDIR
            CMP   #dirDOWN
            BNE   L9685
L9682       LDA   #$01
            RTS

L9685       LDA   #$02
            RTS

L9688       CPY   #$B3
            BEQ   L9682
            CPX   ghostX
            BCC   L9682
L9690       LDA   #$03
            RTS

L9693       CPY   #$7D
            BCC   L9682
            CPX   ghostX
            BCS   L9690
            BCC   L9685

L969D       CMP   #$01
            BEQ   L96B5
            CMP   #$02
            BEQ   L96B2
            CPX   #$60
            BCC   L96BD
            CPY   ghostY
            BCC   L96BD
            BEQ   L96BD
            LDA   #$00
            RTS

L96B2       LDA   #$02
            RTS

L96B5       CPY   #$37
            BCS   L96BD
            CPX   ghostX
            BCS   L96B2
L96BD       LDA   #$03
            RTS

L96C0       PHA
            TXA
            SEC
            SBC   ghostX
            BCS   L96C9
            EOR   #$FF
L96C9       CMP   #$20
            BCS   L96E4
            TYA
            SEC
            SBC   ghostY
            BCS   L96D5
            EOR   #$FF
L96D5       CMP   #$20
            BCS   L96E4
            PLA
            CMP   #$02
            BEQ   L96E1
            LDA   #$03
            RTS

L96E1       LDA   #$02
            RTS

L96E4       PLA
            JMP   L9073

*-----------------------------------
* PAC-MAN SPRITES
*-----------------------------------

sprPACMAN   DA    sprPACMANFULL		; Fully closed
            DA    sprPACMANDOWN1		; Open goes down
            DA    sprPACMANUP1		; Open goes up
            DA    sprPACMANRIGHT1		; Open goes right
            DA    sprPACMANLEFT1		; Open goes left
            DA    sprPACMANDOWN2		; Open goes down 2
            DA    sprPACMANUP2		; Open goes up 2
            DA    sprPACMANRIGHT2		; Open goes right 2
            DA    sprPACMANLEFT2		; Open goes left 2

sprPACMANFULL
            HEX   7800007C01007E03007F07007F07007F
            HEX   07007F07007E03007C01007800007001
            HEX   007803007C07007E0F007E0F007E0F00
            HEX   7E0F007C070078030070010060030070
            HEX   0700780F007C1F007C1F007C1F007C1F
            HEX   00780F00700700600300400700600F00
            HEX   701F00783F00783F00783F00783F0070
            HEX   1F00600F00400700000F00401F00603F
            HEX   00707F00707F00707F00707F00603F00
            HEX   401F00000F00001E00003F00407F0060
            HEX   7F01607F01607F01607F01407F00003F
            HEX   00001E00003C00007E00007F01407F03
            HEX   407F03407F03407F03007F01007E0000
            HEX   3C00
sprPACMANDOWN1
            HEX   7800007C01007E03007F07007F07004F
            HEX   07004F07000603000401000000007001
            HEX   007803007C07007E0F007E0F001E0F00
            HEX   1E0F000C060008020000000060030070
            HEX   0700780F007C1F007C1F003C1E003C1E
            HEX   00180C00100400000000400700600F00
            HEX   701F00783F00783F00783C00783C0030
            HEX   1800200800000000000F00401F00603F
            HEX   00707F00707F00707900707900603000
            HEX   401000000000001E00003F00407F0060
            HEX   7F01607F016073016073014061000021
            HEX   00000000003C00007E00007F01407F03
            HEX   407F0340670340670300430100420000
            HEX   0000
sprPACMANUP1
            HEX   0000000401000603004F07004F07007F
            HEX   07007F07007E03007C01007800000000
            HEX   000802000C06001E0F001E0F007E0F00
            HEX   7E0F007C070078030070010000000010
            HEX   0400180C003C1E003C1E007C1F007C1F
            HEX   00780F00700700600300000000200800
            HEX   301800783C00783C00783F00783F0070
            HEX   1F00600F004007000000004010006030
            HEX   00707900707900707F00707F00603F00
            HEX   401F00000F0000000000210040610060
            HEX   7301607301607F01607F01407F00003F
            HEX   00001E00000000004200004301406703
            HEX   406703407F03407F03007F01007E0000
            HEX   3C00
sprPACMANRIGHT1
            HEX   7800007C01007E03007F00001F00001F
            HEX   00007F00007E03007C01007800007001
            HEX   007803007C07007E01003E00003E0000
            HEX   7E01007C070078030070010060030070
            HEX   0700780F007C03007C00007C00007C03
            HEX   00780F00700700600300400700600F00
            HEX   701F0078070078010078010078070070
            HEX   1F00600F00400700000F00401F00603F
            HEX   00700F00700300700300700F00603F00
            HEX   401F00000F00001E00003F00407F0060
            HEX   1F00600700600700601F00407F00003F
            HEX   00001E00003C00007E00007F01403F00
            HEX   400F00400F00403F00007F01007E0000
            HEX   3C00
sprPACMANLEFT1
            HEX   7800007C01007E030078070060070060
            HEX   07007807007E03007C01007800007001
            HEX   007803007C0700700F00400F00400F00
            HEX   700F007C070078030070010060030070
            HEX   0700780F00601F00001F00001F00601F
            HEX   00780F00700700600300400700600F00
            HEX   701F00403F00003E00003E00403F0070
            HEX   1F00600F00400700000F00401F00603F
            HEX   00007F00007C00007C00007F00603F00
            HEX   401F00000F00001E00003F00407F0000
            HEX   7E01007801007801007E01407F00003F
            HEX   00001E00003C00007E00007F01007C03
            HEX   007003007003007C03007F01007E0000
            HEX   3C00
sprPACMANDOWN2
            HEX   7800007C01007E03007F07007F07004F
            HEX   07000707000202000000000000007001
            HEX   007803007C07007E0F007E0F001E0F00
            HEX   0E0E0004040000000000000060030070
            HEX   0700780F007C1F007C1F003C1E001C1C
            HEX   00080800000000000000400700600F00
            HEX   701F00783F00783F00783C0038380010
            HEX   1000000000000000000F00401F00603F
            HEX   00707F00707F00707900707000202000
            HEX   000000000000001E00003F00407F0060
            HEX   7F01607F016073016061014040000000
            HEX   00000000003C00007E00007F01407F03
            HEX   407F0340670340430300010100000000
            HEX   0000
sprPACMANUP2
            HEX   0000000000000202000707004F07007F
            HEX   07007F07007E03007C01007800000000
            HEX   000000000404000E0E001E0F007E0F00
            HEX   7E0F007C070078030070010000000000
            HEX   00000808001C1C003C1E007C1F007C1F
            HEX   00780F00700700600300000000000000
            HEX   101000383800783C00783F00783F0070
            HEX   1F00600F004007000000000000002020
            HEX   00707000707900707F00707F00603F00
            HEX   401F00000F0000000000000040400060
            HEX   6101607301607F01607F01407F00003F
            HEX   00001E00000000000000000101404303
            HEX   406703407F03407F03007F01007E0000
            HEX   3C00
sprPACMANRIGHT2
            HEX   7800007C01007E00003F00001F00001F
            HEX   00003F00007E00007C01007800007001
            HEX   007803007C01007E00003E00003E0000
            HEX   7E00007C010078030070010060030070
            HEX   07007803007C01007C00007C00007C01
            HEX   00780300700700600300400700600F00
            HEX   70070078030078010078010078030070
            HEX   0700600F00400700000F00401F00600F
            HEX   00700700700300700300700700600F00
            HEX   401F00000F00001E00003F00401F0060
            HEX   0F00600700600700600F00401F00003F
            HEX   00001E00003C00007E00003F00401F00
            HEX   400F00400F00401F00003F00007E0000
            HEX   3C00
sprPACMANLEFT2
            HEX   7800007C010078030070070060070060
            HEX   07007007007803007C01007800007001
            HEX   00780300700700600F00400F00400F00
            HEX   600F0070070078030070010060030070
            HEX   0700600F00401F00001F00001F00401F
            HEX   00600F00700700600300400700600F00
            HEX   401F00003F00003E00003E00003F0040
            HEX   1F00600F00400700000F00401F00003F
            HEX   00007E00007C00007C00007E00003F00
            HEX   401F00000F00001E00003F00007E0000
            HEX   7C01007801007801007C01007E00003F
            HEX   00001E00003C00007E00007C01007803
            HEX   007003007003007803007C01007E0000
            HEX   3C00

*-----------------------------------
* GHOSTS SPRITES POINTERS TABLE
*-----------------------------------

sprGHOSTS   DA    LA1BC		; 0 Transparent
            DA    LA0EA		; 1 White happy
            DA    L9F46		; 2 White mean
            DA    LA018		; 3 Narrow
            DA    L9E74		; 4 Round
            DA    LA28E		; 5 Eyes (when a ghost is killed)
            DA    LA3A0		; 6 Blue (when energizer is active)
            DA    LA472		; 7 Green
            DA    LA544		; 8 Pink
            DA    LA616		; 9 White rounded happy
            DA    LA472		; A Green (again)
            DA    LA28E		; C Eyes (again)

L9E74       HEX   3000007C01007E030036030033060033
            HEX   06007F07000707007F07003603006000
            HEX   007803007C07006C0600660C00660C00
            HEX   7E0F000E0E007E0F006C060040010070
            HEX   0700780F00580D004C19004C19007C1F
            HEX   001C1C007C1F00580D00000300600F00
            HEX   701F00301B00183300183300783F0038
            HEX   3800783F00301B00000600401F00603F
            HEX   00603600306600306600707F00707000
            HEX   707F00603600000C00003F00407F0040
            HEX   6D00604C01604C01607F01606101607F
            HEX   01406D00001800007E00007F01005B01
            HEX   401903401903407F03404303407F0300
            HEX   5B01
L9F46       HEX   0000007C01007E03007B06003707007F
            HEX   07007F07000306007F07003307000000
            HEX   007803007C0700760D006E0E007E0F00
            HEX   7E0F00060C007E0F00660E0000000070
            HEX   0700780F006C1B005C1D007C1F007C1F
            HEX   000C18007C1F004C1D00000000600F00
            HEX   701F00583700383B00783F00783F0018
            HEX   3000783F00183B00000000401F00603F
            HEX   00306F00707600707F00707F00306000
            HEX   707F00307600000000003F00407F0060
            HEX   5E01606D01607F01607F01604001607F
            HEX   01606C01000000007E00007F01403D03
            HEX   405B03407F03407F03400103407F0340
            HEX   5903
LA018       HEX   3000007800003401003603007E030006
            HEX   03007E03004A02004A02004A02006000
            HEX   007001006802006C06007C07000C0600
            HEX   7C070014050014050014050040010060
            HEX   0300500500580D00780F00180C00780F
            HEX   00280A00280A00280A00000300400700
            HEX   200B00301B00701F00301800701F0050
            HEX   1400501400501400000600000F004016
            HEX   00603600603F00603000603F00202900
            HEX   202900202900000C00001E00002D0040
            HEX   6D00407F00406100407F004052004052
            HEX   00405200001800003C00005A00005B01
            HEX   007F01004301007F0100250100250100
            HEX   2501
LA0EA       HEX   7C01007E03007F07003306007F07007F
            HEX   07007F07000306007F07003306007803
            HEX   007C07007E0F00660C007E0F007E0F00
            HEX   7E0F00060C007E0F00660C0070070078
            HEX   0F007C1F004C19007C1F007C1F007C1F
            HEX   000C18007C1F004C1900600F00701F00
            HEX   783F00183300783F00783F00783F0018
            HEX   3000783F00183300401F00603F00707F
            HEX   00306600707F00707F00707F00306000
            HEX   707F00306600003F00407F00607F0160
            HEX   4C01607F01607F01607F01604001607F
            HEX   01604C01007E00007F01407F03401903
            HEX   407F03407F03407F03400103407F0340
            HEX   1903
LA1BC       HEX   0300004C01000202004A02004D05004D
            HEX   05000104000104004904003603000600
            HEX   001803000404001405001A0B001A0B00
            HEX   0208000208001209006C06000C000030
            HEX   0600080800280A003416003416000410
            HEX   00041000241200580D00180000600C00
            HEX   101000501400682C00682C0008200008
            HEX   2000482400301B003000004019002020
            HEX   00202900505900505900104000104000
            HEX   10490060360060000000330040400040
            HEX   52002033012033012000012000012012
            HEX   01406D00400100006600000101002501
            HEX   40660240660240000240000240240200
            HEX   5B01
LA28E       HEX   0000000000000000000000004C01004C
            HEX   01000000000000000000000000000000
            HEX   00000000000000000000180300180300
            HEX   00000000000000000000000000000000
            HEX   00000000000000003006003006000000
            HEX   00000000000000000000000000000000
            HEX   000000000000600C00600C0000000000
            HEX   00000000000000000000000000000000
            HEX   00000000401900401900000000000000
            HEX   00000000000000000000000000000000
            HEX   00000033000033000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00660000660000000000000000000000
            HEX   0000

LA360       HEX   00000000000002020003020003030201
            HEX   02000003010300030200010302010000
            HEX   02010303020201030100010301010201
            HEX   00010202010103020101030301010101

LA3A0       HEX   2801002801003A07003A07002A05006A
            HEX   05007A07002A05002A05002204005002
            HEX   00500200740E00740E00540A00540B00
            HEX   740F00540A00540A0044080020050020
            HEX   0500681D00681D00281500281700681F
            HEX   00281500281500081100400A00400A00
            HEX   503B00503B00502A00502E00503F0050
            HEX   2A00502A001022000015000015002077
            HEX   00207700205500205D00207F00205500
            HEX   205500204400002A00002A00406E0140
            HEX   6E01402A01403A01407E01402A01402A
            HEX   01400801005400005400005D03005D03
            HEX   005502007502007D0300550200550200
            HEX   1102
LA472       HEX   54000054000077020077020055020055
            HEX   02007F02005502005502001102002801
            HEX   002801006E05006E05002A05002A0500
            HEX   7E05002A05002A050022040050020050
            HEX   02005C0B005C0B00540A00540A007C0B
            HEX   00540A00540A00440800200500200500
            HEX   38170038170028150028150078170028
            HEX   1500281500081100400A00400A00702E
            HEX   00702E00502A00502A00702F00502A00
            HEX   502A00102200001500001500605D0060
            HEX   5D00205500205500605F002055002055
            HEX   00204400002A00002A00403B01403B01
            HEX   402A01402A01403F01402A01402A0140
            HEX   0801
LA544       HEX   2801002801003A07003A07002A05002A
            HEX   05007A07002A05002A05002204005002
            HEX   00500200740E00740E00540A00540A00
            HEX   740F00540A00540A0044080020050020
            HEX   0500681D00681D00281500281500681F
            HEX   00281500281500081100400A00400A00
            HEX   503B00503B00502A00502A00503F0050
            HEX   2A00502A001022000015000015002077
            HEX   00207700205500205500207F00205500
            HEX   205500204400002A00002A00406E0140
            HEX   6E01402A01402A01407E01402A01402A
            HEX   01400801005400005400005D03005D03
            HEX   005502005502007D0300550200550200
            HEX   1102
LA616       HEX   7C01007C01003306003306007F07007F
            HEX   07000306007F07007F07003306007803
            HEX   00780300660C00660C007E0F007E0F00
            HEX   060C007E0F007E0F00660C0070070070
            HEX   07004C19004C19007C1F007C1F000C18
            HEX   007C1F007C1F004C1900600F00600F00
            HEX   183300183300783F00783F0018300078
            HEX   3F00783F00183300401F00401F003066
            HEX   00306600707F00707F00306000707F00
            HEX   707F00306600003F00003F00604C0160
            HEX   4C01607F01607F01604001607F01607F
            HEX   01604C01007E00007E00401903401903
            HEX   407F03407F03400103407F03407F0340
            HEX   1903

*--- What is that?

            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $6A
            DB    $6C
            DB    $60
            DB    $01
            DB    $8E
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $6A
            DB    $6C
            DB    $00
            DB    $02
            DB    $55
            DB    $00
            DB    $00
            DB    $04
            DB    $02
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $90
            DB    $20
            DB    $85
            DB    $D4
            DB    $00
            DB    $95
            DB    $DC
            DB    $00
            DB    $97
            DB    $DD
            DB    $A2
            DB    $D7
            DB    $D5
            DB    $A2
            DB    $D5
            DB    $D4
            DB    $00
            DB    $95
            DB    $D4
            DB    $00
            DB    $95
            DB    $90
            DB    $00
            DB    $94
            DB    $00
            DB    $2A
            DB    $05
            DB    $10
            DB    $2A
            DB    $15
            DB    $40
            DB    $A4
            DB    $11
            DB    $40
            DB    $A2
            DB    $86
            DB    $50
            DB    $9A
            DB    $85
            DB    $00
            DB    $AE
            DB    $87
            DB    $00
            DB    $B2
            DB    $85
            DB    $00
            DB    $8A
            DB    $86
            DB    $00
            DB    $EC
            DB    $85
            DB    $00
            DB    $A8
            DB    $84
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $A0
            DB    $81
            DB    $00
            DB    $2A
            DB    $00
            DB    $40
            DB    $20
            DB    $00
            DB    $C0
            DB    $82
            DB    $00
            DB    $50
            DB    $0A
            DB    $00
            DB    $D4
            DB    $AE
            DB    $00
            DB    $54
            DB    $E3
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $54
            DB    $2A
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $50
            DB    $0A
            DB    $00
            DB    $C0
            DB    $82
            DB    $00
            DB    $40
            DB    $02
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $B8
            DB    $9D
            DB    $00
            DB    $D4
            DB    $AB
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $D4
            DB    $AA
            DB    $00
            DB    $C8
            DB    $92
            DB    $00
            DB    $D0
            DB    $8A
            DB    $00
            DB    $90
            DB    $89
            DB    $00
            DB    $E0
            DB    $86
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $54
            DB    $0B
            DB    $00
            DB    $54
            DB    $0E
            DB    $00
            DB    $5C
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $B4
            DB    $00
            DB    $00
            DB    $92
            DB    $81
            DB    $00
            DB    $B2
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $BA
            DB    $81
            DB    $00
            DB    $92
            DB    $81
            DB    $00
            DB    $B8
            DB    $00
            DB    $00
            DB    $B8
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $E0
            DB    $81
            DB    $00
            DB    $E0
            DB    $81
            DB    $00
            DB    $F0
            DB    $82
            DB    $00
            DB    $F0
            DB    $82
            DB    $00
            DB    $F8
            DB    $86
            DB    $00
            DB    $E8
            DB    $87
            DB    $00
            DB    $EC
            DB    $8F
            DB    $00
            DB    $EE
            DB    $9F
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $B8
            DB    $81
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $88
            DB    $81
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $81
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $80
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $81
            DB    $00
            DB    $F0
            DB    $00
            DB    $00
            DB    $B0
            DB    $00
            DB    $00
            DB    $F0
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $4A
            DB    $04
            DB    $00
            DB    $2A
            DB    $05
            DB    $00
            DB    $6E
            DB    $05
            DB    $00
            DB    $2A
            DB    $1D
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $5B
            DB    $3B
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $5B
            DB    $3B
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $A6
            DB    $E8
            DB    $D0
            DB    $1D
            DB    $20
            DB    $1E
            DB    $6D
            DB    $AA
            DB    $18
            DB    $F8
            DB    $A5
            DB    $53
            DB    $7D
            DB    $D4
            DB    $6C
            DB    $85
            DB    $53
            DB    $A5
            DB    $54
            DB    $69
            DB    $00
            DB    $85
            DB    $54
            DB    $D8
            DB    $20
            DB    $6A
            DB    $69
            DB    $20
            DB    $91
            DB    $70
            DB    $20
            DB    $61
            DB    $7C
            DB    $60
            DB    $00
            DB    $01
            DB    $03
            DB    $05
            DB    $05
            DB    $07
            DB    $07
            DB    $10
            DB    $10
            DB    $20
            DB    $20
            DB    $30
            DB    $30
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $50
            DB    $A2
            DB    $01
            DB    $A9
            DB    $8F
            DB    $38
            DB    $E9
            DB    $01
            DB    $B0
            DB    $FB
            DB    $CA
            DB    $D0
            DB    $F6
            DB    $60
            DB    $60
            DB    $20
            DB    $FA
            DB    $58
            DB    $20
            DB    $80
            DB    $7D
            DB    $20
            DB    $9E
            DB    $69
            DB    $20
            DB    $80
            DB    $7D
            DB    $20
            DB    $A4
            DB    $79
            DB    $A0
            DB    $0B
            DB    $A2
            DB    $FF
            DB    $20
            DB    $E8
            DB    $6C
            DB    $88
            DB    $D0
            DB    $F8
            DB    $20
            DB    $55
            DB    $81
            DB    $E6
            DB    $55
            DB    $20
            DB    $1E
            DB    $53
            DB    $20
            DB    $59
            DB    $56
            DB    $20
            DB    $E6
            DB    $53
            DB    $4C
            DB    $0F
            DB    $53
            DB    $A5
            DB    $55
            DB    $C9
            DB    $0F
            DB    $90
            DB    $02
            DB    $A9
            DB    $0F
            DB    $60
            DB    $A5
            DB    $55
            DB    $C9
            DB    $15
            DB    $90
            DB    $02
            DB    $A9
            DB    $15
            DB    $60
            DB    $A5
            DB    $E0
            DB    $0A
            DB    $AA
            DB    $BD
            DB    $3F
            DB    $6D
            DB    $85
            DB    $70
            DB    $BD
            DB    $40
            DB    $6D
            DB    $85
            DB    $71
            DB    $60
            DB    $00
            DB    $00
            DB    $8B
            DB    $55
            DB    $7F
            DB    $5D
            DB    $8B
            DB    $55
            DB    $99
            DB    $5D
            DB    $A9
            DB    $00
            DB    $A2
            DB    $08
            DB    $95
            DB    $84
            DB    $95
            DB    $98
            DB    $95
            DB    $AC
            DB    $95
            DB    $C0
            DB    $85
            DB    $78
            DB    $85
            DB    $E4
            DB    $85
            DB    $E9
            DB    $A9
            DB    $02
            DB    $85
            DB    $68
            DB    $60
            DB    $A6
            DB    $55
            DB    $E0
            DB    $15
            DB    $B0
            DB    $3A
            DB    $A9
            DB    $04
            DB    $85
            DB    $E0
            DB    $20
            DB    $FC
            DB    $86
            DB    $A5
            DB    $79
            DB    $D0
            DB    $04
            DB    $A9
            DB    $01
            DB    $85
            DB    $78
            DB    $20
            DB    $12
            DB    $87
            DB    $C6
            DB    $E0
            DB    $D0
            DB    $EE
            DB    $A9
            DB    $02
            DB    $85
            DB    $68
            DB    $A9
            DB    $01
            DB    $85
            DB    $E4
            DB    $20
            DB    $27
            DB    $6D
            DB    $0A
            DB    $AA
            DB    $BD
            DB    $EF
            DB    $6D
            DB    $85
            DB    $E1
            DB    $BD
            DB    $F0
            DB    $6D
            DB    $85
            DB    $E2
            DB    $A9
            DB    $04
            DB    $85
            DB    $EA
            DB    $85
            DB    $EB
            DB    $A9
            DB    $01
            DB    $85
            DB    $E9
            DB    $20
            DB    $C1
            DB    $80
            DB    $60
            DB    $A4
            DB    $77
            DB    $C8
            DB    $A5
            DB    $E0
            DB    $C9
            DB    $01
            DB    $F0
            DB    $34
            DB    $C9
            DB    $03
            DB    $F0
            DB    $30
            DB    $A9
            DB    $01
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $00
            DB    $91
            DB    $75
            DB    $C8
            DB    $A5
            DB    $E0
            DB    $C9
            DB    $02
            DB    $F0
            DB    $06
            DB    $A9
            DB    $03
            DB    $91
            DB    $75
            DB    $D0
            DB    $04
            DB    $A9
            DB    $02
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $01
            DB    $91
            DB    $75
            DB    $C8
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $03
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $FF
            DB    $91
            DB    $75
            DB    $20
            DB    $12
            DB    $87
            DB    $60
            DB    $A9
            DB    $00
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $01
            DB    $91
            DB    $75
            DB    $C8
            DB    $A9
            DB    $00
            DB    $91
            DB    $75
            DB    $F0
            DB    $DA
            DB    $60
            DB    $00
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $C0
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $01
            DB    $50
            DB    $00
            DB    $50
            DB    $00
            DB    $40
            DB    $00
            DB    $C0
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $40
            DB    $00
            DB    $FF
            DB    $FF
            DB    $B0
            DB    $00
            DB    $10
            DB    $00
            DB    $30
            DB    $00
            DB    $30
            DB    $00
            DB    $B0
            DB    $00
            DB    $40
            DB    $00
            DB    $30
            DB    $00
            DB    $20
            DB    $00
            DB    $20
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $02
            DB    $00
            DB    $03
            DB    $02
            DB    $00
            DB    $03
            DB    $01
            DB    $00
            DB    $03
            DB    $01
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $01
            DB    $03
            DB    $01
            DB    $03
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $01
            DB    $03
            DB    $01

*--- End of Pac-Man

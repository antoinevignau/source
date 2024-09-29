*
* ZipGSX CDA (WIP)
*
* ( c) Zip Technologies
* (s) 2024, Antoine Vignau
*

	mx	%00
	rel
	dsk	ZipDA.l
	lst	off

	use	4/Int.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	
*-------------------------------

KBD	EQU	$C000
KBDSTROBE	EQU	$C010
CYAREG	EQU	$C036
CLRAN0	EQU	$C059
SETAN1	EQU	$C05A
CLRAN1	EQU	$C05B
SETAN2	EQU	$C05C
CLRAN2	EQU	$C05D
SETAN3	EQU	$C05E
BUTN0	EQU	$C061
BUTN1	EQU	$C062

*------------------------------- CDA Header
	
            STR   "Zip GS Control"
            ADRL  entryPOINT	; Ptr to code start
            ADRL  exitPOINT	; Ptr to shutdown routine

*-------------------------------

entryPOINT  PHB
            PHK
            PLB
            PHA
            PHA
            PHA
            _GetInputDevice
            PHA
            PHA
            _GetInGlobals
            PHA
            PHA
            PHA
            _GetOutputDevice
            PHA
            PHA
            _GetOutGlobals
            TSC
            STA   stackPTR
            JSR   initTEXT
            JSR   L0D6A
            JSR   checkZIPGS       ; ZIPGS PRESENT?
            LDA   fgZIPGS
            BNE   L0055
            JSR   L03B4
L0055       JSR   L1207
            JSR   L0144
            JSR   L0145

*-------------------------------

L005E       JSR   waitforKEY
            AND   #$00FF
            CMP   #$008A
            BEQ   L009B
            CMP   #$008B
            BEQ   L0095
            CMP   #$0088
            BEQ   L00A1
            CMP   #$0095
            BEQ   L00A1
            CMP   #$008D
            BNE   L0084
            LDA   L088D
            BEQ   L00A1
            BRA   L00A7
L0084       CMP   #$009B
            BEQ   L00A7
            CMP   #$00BF
            BEQ   L00AD
            CMP   #$00AF
            BEQ   L00AD
            BRA   L005E
L0095       JSR   L090D
            BRL   L005E
L009B       JSR   L0927
            BRL   L005E
L00A1       JSR   L096F
            BRL   L005E
L00A7       JSR   L0992
            BRL   L005E
L00AD       JSR   L00B3
            BRL   L005E

L00B3       LDAL  BUTN0
            AND   #$0080
            BNE   L00C6
            LDAL  BUTN1
            AND   #$0080
            BNE   L00C6
            RTS

L00C6       LDA   $10
            STA   L00EA
            LDA   $12
            STA   L00EA+2
            JSR   L0EAB
            JSR   L0FDA
            JSR   L03D2
            JSR   waitforKEY
            JSR   L1029
            LDA   L00EA
            STA   $10
            LDA   L00EA+2
            STA   $12
            RTS

L00EA       ADRL  $00000000

*-------------------------------

waitforKEY  SEP   #$20
            LDAL  KBD
            BPL   waitforKEY
            STAL  KBDSTROBE
            REP   #$20
            RTS

*-------------------------------

L00FD       LDA   fgZIPGS
            BEQ   L0105
            JSR   L1241
L0105       JSR   L0EAB
            JSR   L0D6A
            LDA   stackPTR
            TCS
            _SetOutGlobals
            _SetOutputDevice
            _SetInGlobals
            _SetInputDevice
            PEA   $0000
            _InitTextDev
            PEA   $0001
            _InitTextDev
            PLB

*-------------------------------

exitPOINT   RTL

*-------------------------------

stackPTR    DW    $0000

*-------------------------------

L0143       RTS
L0144       RTS

*-------------------------------

L0145       LDA   #L01C5
            JSR   L10DB
            JSR   L0406
            JSR   L0D0F
            JSR   L097F
            JSR   L0441
            JSR   L0467
            RTS

L015B       LDA   #L04BB
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$06
            REP   #$10
            JSR   L1078
            RTS

L016C       LDA   #L04CC
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$08
            REP   #$10
            JSR   L1078
            RTS

L017D       LDA   #L04DD
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$09
            REP   #$10
            JSR   L1078
            RTS

L018E       LDA   #L04EE
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$0A
            REP   #$10
            JSR   L1078
            RTS

L019F       LDA   #L04FF
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$0E
            REP   #$10
            JSR   L1078
            RTS

L01B0       SEP   #$20
            LDA   #$13
            STA   $10
            LDA   #$00
            STA   $12
            LDA   #$3D
            STA   $11
            LDA   #$18
            STA   $13
            REP   #$20
            RTS

L01C5       DB    $13
            DB    $00
            DB    $3C
            DB    $17
            DB    $FF
            DA    L0506
            DB    $FE
            DB    $00
            DB    $05
            DA    L04BB
            DB    $03
            DB    $06
            DA    L04CC
            DB    $03
            DB    $08
            DA    L04DD
            DB    $03
            DB    $09
            DA    L04EE
            DB    $03
            DB    $0A
            DA    L04FF
            DB    $03
            DB    $0E

L01E3       LDA   #$FFFF
            STA   L0EF2
            LDA   #L0268
            JSR   L10DB
            JSR   L0A5F
            LDA   #$0000
            STA   L088F
            JSR   L097F
            JSR   L045B
            JSR   L0487
            RTS

L0202       LDA   #L051A
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$04
            REP   #$10
            JSR   L1078
            RTS

L0213       LDA   #L052C
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$05
            REP   #$10
            JSR   L1078
            RTS

L0224       LDA   #L053D
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$06
            REP   #$10
            JSR   L1078
            RTS

L0235       LDA   #L0550
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$07
            REP   #$10
            JSR   L1078
            RTS

L0246       LDA   #L0565
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$08
            REP   #$10
            JSR   L1078
            RTS

L0257       LDA   #L0586
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$09
            REP   #$10
            JSR   L1078
            RTS

L0268       DB    $13
            DB    $02
            DB    $3C
            DB    $17
            DB    $FF
            DA    L0576
            DB    $FE
            DB    $00
            DB    $06
            DA    L051A
            DB    $03
            DB    $04
            DA    L052C
            DB    $03
            DB    $05
            DA    L053D
            DB    $03
            DB    $06
            DA    L0550
            DB    $03
            DB    $07
            DA    L0565
            DB    $03
            DB    $08
            DA    L0586
            DB    $03
            DB    $09

L028A       SEP   #$20
            LDA   #$13
            STA   $10
            LDA   #$02
            STA   $12
            LDA   #$3D
            STA   $11
            LDA   #$18
            STA   $13
            REP   #$20
            JSR   L0DB2
            RTS

L02A2       LDA   #$FFFF
            STA   L0EF2
            LDA   #L0338
            JSR   L10DB
            JSR   L0ACC
            LDA   #$0000
            STA   L088F
            JSR   L097F
            JSR   L045B
            JSR   L0487
            RTS

L02C1       LDA   #L0594
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$04
            REP   #$10
            JSR   L1078
            RTS

L02D2       LDA   #L059E
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$05
            REP   #$10
            JSR   L1078
            RTS

L02E3       LDA   #L05A8
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$06
            REP   #$10
            JSR   L1078
            RTS

L02F4       LDA   #L05B2
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$07
            REP   #$10
            JSR   L1078
            RTS

L0305       LDA   #L05BC
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$08
            REP   #$10
            JSR   L1078
            RTS

L0316       LDA   #L05C6
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$09
            REP   #$10
            JSR   L1078
            RTS

L0327       LDA   #L05D0
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$0A
            REP   #$10
            JSR   L1078
            RTS

L0338       DB    $13
            DB    $02
            DB    $3C
            DB    $17
            DB    $FF
            DA    L05DA
            DB    $FE
            DB    $00
            DB    $07
            DA    L0594
            DB    $03
            DB    $04
            DA    L059E
            DB    $03
            DB    $05
            DA    L05A8
            DB    $03
            DB    $06
            DA    L05B2
            DB    $03
            DB    $07
            DA    L05BC
            DB    $03
            DB    $08
            DA    L05C6
            DB    $03
            DB    $09
            DA    L05D0
            DB    $03
            DB    $0A

L035E       SEP   #$20
            LDA   #$13
            STA   $10
            LDA   #$02
            STA   $12
            LDA   #$3D
            STA   $11
            LDA   #$18
            STA   $13
            REP   #$20
            JSR   L0DB2
            RTS

L0376       LDA   #L0386
            JSR   L10DB
            JSR   L0B4B
            JSR   L045B
            JSR   L0487
            RTS

L0386       DB    $0D
            DB    $02
            DB    $40
            DB    $12
            DB    $FF
            DA    L05E9
            DB    $FE
            DB    $00
            DB    $03
            DA    L0600
            DB    $05
            DB    $06
            DA    L062A
            DB    $04
            DB    $07
            DA    L0657
            DB    $05
            DB    $08

L039C       SEP   #$20
            LDA   #$0D
            STA   $10
            LDA   #$02
            STA   $12
            LDA   #$41
            STA   $11
            LDA   #$13
            STA   $13
            REP   #$20
            JSR   L0DB2
            RTS

L03B4       LDA   #L03C0
            JSR   L10DB
            JSR   waitforKEY
            JMP   L00FD

L03C0       DB    $13
            DB    $00
            DB    $3C
            DB    $17
            DB    $FF
            DA    L0506
            DB    $FE
            DB    $00
            DB    $02
            DA    L073B
            DB    $FF
            DB    $06
            DA    L0753
            DB    $FF
            DB    $09

L03D2       LDA   #L03DC
            JSR   L10DB
            JSR   L0487
            RTS

L03DC       DB    $1D
            DB    $07
            DB    $46
            DB    $16
            DB    $FF
            DA    L0682
            DB    $FF
            DB    $00
            DB    $08
            DA    L0693
            DB    $FF
            DB    $02
            DA    L06A3
            DB    $FF
            DB    $03
            DA    L06B2
            DB    $FF
            DB    $05
            DA    L06D3
            DB    $FF
            DB    $06
            DA    L06E9
            DB    $FF
            DB    $07
            DA    L06F8
            DB    $0A
            DB    $09
            DA    L0710
            DB    $0A
            DB    $0A
            DA    L0724
            DB    $0A
            DB    $0B
L0406       LDA   #L04A7
            STA   $06
            SEP   #$10
            LDX   #$0A
            LDY   #$13
            REP   #$10
            JSR   L1078
            SEP   #$10
            LDX   #$19
            LDY   #$13
            REP   #$10
            JSR   L1095
            LDA   L11FD
            AND   #$0003
            ASL
            ASL
            CLC
            ADC   #L0857
            STA   $06
            JSR   L107B
            SEP   #$10
            LDX   #$0A
            LDY   #$11
            REP   #$10
            JSR   L1095
            JSR   L1349
            RTS

L0441       LDX   #$0001
            INX
            SEP   #$20
            LDA   $13
            CLC
            SBC   $12
            REP   #$20
            TAY
            JSR   L1095
            LDA   #L0769
            STA   $06
            JSR   L107B
            RTS

L045B       JSR   L0441
            LDA   #L0779
            STA   $06
            JSR   L107B
            RTS

L0467       SEP   #$20
            LDA   $11
            SEC
            SBC   $10
            SEC
            SBC   L0782
            TAX
            LDA   $13
            CLC
            SBC   $12
            TAY
            REP   #$20
            JSR   L1095
            LDA   #L0783
            STA   $06
            JSR   L107B
            RTS

L0487       SEP   #$20
            LDA   $11
            SEC
            SBC   $10
            SEC
            SBC   L078D
            TAX
            LDA   $13
            CLC
            SBC   $12
            TAY
            REP   #$20
            JSR   L1095
            LDA   #L078E
            STA   $06
            JSR   L107B
            RTS

L04A7       ASC   "Zip Cache Size:   k"00
L04BB       ASC   " Zip GS         "00
L04CC       ASC   " Misc. Settings "00
L04DD       ASC   " Slot  Settings "00
L04EE       ASC   " Speed Settings "00
L04FF       ASC   " Quit "00
L0506       ASC   " ZipGS Control v1.2"00
L051A       ASC   " Joystick Delay: "00
L052C       ASC   " Speaker Delay: "00
L053D       ASC   " AppleTalk Delay: "00
L0550       ASC   " C/D Cache Disable: "00
L0565       ASC   " Counter Delay: "00
L0576       ASC   " Misc. Settings"00
L0586       ASC   " CPS Follow: "00
L0594       ASC   " Slot 1: "00
L059E       ASC   " Slot 2: "00
L05A8       ASC   " Slot 3: "00
L05B2       ASC   " Slot 4: "00
L05BC       ASC   " Slot 5: "00
L05C6       ASC   " Slot 6: "00
L05D0       ASC   " Slot 7: "00
L05DA       ASC   " Slot Settings"00
L05E9       ASC   " System Speed"00
            ASC   "100%"00
            ASC   "~J~"00
L0600       ASC   "_________________________________________"00
L062A       ASC   "~Z"
L062C       ASC   "VWVWVWVWVWVWVWVWVWVWVWVWVWVWVWVWVWVWVWVWV_"00
L0657       ASC   "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
            ASC   "LL~"00
L0682       ASC   "^ About Zip GS ^"00
L0693       ASC   "Zip GS (c) 1990"00
L06A3       ASC   "Zip Technology"00
L06B2       ASC   "5601 West Slauson Ave, Suite 190"00
L06D3       ASC   "Culver City, CA 90230"00
L06E9       ASC   "(213) 337-1313"00
L06F8       ASC   "Hardware: Steve Meadows"00
L0710       ASC   "          Tony Vece"00
L0724       ASC   "Software: David D. Ely"00
L073B       ASC   "Sorry, no ZipGS present"00
L0753       ASC   "Press any key to exit"00
L0769       ASC   "Select: ~J~ ~K~"00
L0779       ASC   " ~H~ ~U~"00
L0782       ASC   0A
L0783       ASC   "Open: ~M~"00
L078D       ASC   10
L078E       ASC   "Exit: ~M~ <Esc>"00
L079E       ASC   "On "00
L07A2       ASC   "Off"00
L07A6       ASC   "Fast  "00
L07AD       ASC   "Normal"00
L07B4       ASC   "        "
            ASC   "  6.25 %"
            ASC   " 12.50 %"
            ASC   " 18.75 %"
            ASC   " 25.00 %"
            ASC   " 31.25 %"
            ASC   " 37.50 %"
            ASC   " 43.75 %"
            ASC   " 50.00 %"
            ASC   " 56.25 %"
            ASC   " 62.50 %"
            ASC   " 68.75 %"
            ASC   " 75.00 %"
            ASC   " 81.25 %"
            ASC   " 87.50 %"
            ASC   " 93.75 %"
            ASC   "100.00 %"
            ASC   "        "
            ASC   " "
L0845       HEX   05080A0C0F121416191C1E202326282A
            HEX   2D31
L0857       ASC   "  8"00
            ASC   " 16"00
            ASC   " 32"00
            ASC   " 64"00
            DW    $003A
            DW    $0064
            DW    $0096
            DW    $00C8
            DW    $00FA
            DW    $012C
            DW    $015E
            DW    $0190
            DW    $01C2
            DW    $01F4
            DW    $0226
            DW    $0258
            DW    $028A
            DW    $02BC
            DW    $02EE
            DW    $0320
            DW    $0352
            DW    $0378
            DW    $03E8

L088D       DW    $0000
L088F       DW    $0003
L0891       DW    $0003

L0893       DA    L01B0-1
            DA    L028A-1
            DA    L035E-1
            DA    L039C-1
L089B       DA    L0145-1
            DA    L01E3-1
            DA    L02A2-1
            DA    L0376-1

L08A3       DA    L08B3
            DA    L08BF
            DA    L08C9
            DA    L08D7
            DA    L08E3
            DA    L08F3
            DA    L0901
            DA    L0903
L08B3       DA    $0005
            DA    L015B-1
            DA    L016C-1
            DA    L017D-1
            DA    L018E-1
            DA    L019F-1
L08BF       DA    L0CE6-1
            DA    L0C5D-1
            DA    L0C64-1
            DA    L0C6B-1
            DA    L00FD-1
L08C9       DA    $0006
            DA    L0202-1
            DA    L0213-1
            DA    L0224-1
            DA    L0235-1
            DA    L0246-1
            DA    L0257-1
L08D7       DA    L0BED-1
            DA    L0BF5-1
            DA    L0BFD-1
            DA    L0C05-1
            DA    L0C0D-1
            DA    L0C15-1
L08E3       DA    $0007
            DA    L02C1-1
            DA    L02D2-1
            DA    L02E3-1
            DA    L02F4-1
            DA    L0305-1
            DA    L0316-1
            DA    L0327-1
L08F3       DA    L0C21-1
            DA    L0C29-1
            DA    L0C31-1
            DA    L0C39-1
            DA    L0C41-1
            DA    L0C49-1
            DA    L0C51-1
L0901       DA    $0001
L0903       DA    L0143-1
            DA    L0143-1
            DA    L0143-1

*-------------------------------

L0909       LDA   $FE
            PHA
            RTS

L090D       JSR   L0955
            JSR   L094E
            LDX   L088F
            DEX
            BPL   L0920
L0919       LDY   #$0000
            LDA   ($FC),Y
            TAX
            DEX
L0920       STX   L088F
            BRL   L097F
            RTS

L0927       JSR   L0955
            JSR   L094E
            LDA   L088F
            INC
            LDY   #$0000
            CMP   ($FC),Y
            BCC   L093B
            LDA   #$0000
L093B       STA   L088F
            BRL   L097F
            RTS

L0942       LDA   L088F
            ASL
            TAY
            INY
            INY
            LDA   ($FC),Y
            STA   $FE
            RTS

L094E       JSR   L0942
            JSR   L0909
            RTS

L0955       LDA   L088D
            ASL
            ASL
            TAX
            LDA   L08A3,X
            STA   $FC
            RTS

L0961       LDA   L088D
            ASL
            ASL
            TAX
            INX
            INX
            LDA   L08A3,X
            STA   $FC
            RTS

L096F       JSR   L0961
            LDA   L088F
            ASL
            TAY
            LDA   ($FC),Y
            STA   $FE
            JSR   L0909
            RTS

            MX    %00
L097F       LDA   #$00DE
            JSR   L0DD0
            JSR   L0955
            JSR   L094E
            LDA   #$00DE
            JSR   L0DD0
            RTS

L0992       JSR   L0955
            JSR   L094E
            LDA   L088D
            CMP   #$0000
            BNE   L09A3
            BRL   L0919
L09A3       LDA   #$0000
            JSR   L09AA
            RTS

L09AA       PHA
            LDA   L088D
            ASL
            TAX
            LDA   L0893,X
            STA   $FE
            JSR   L0909
            PLA
            STA   L088D
            CMP   #$0000
            BEQ   L09C9
            LDA   L088F
            STA   L0891
            BRA   L09CF
L09C9       LDA   L0891
            STA   L088F
L09CF       LDA   L088D
            ASL
            TAX
            LDA   L089B,X
            STA   $FE
            JSR   L0909
            RTS

L09DD       STA   L0A27
            PLX
            PLA
            STA   L0A2F
            AND   L11FD
            STA   L0A31
            PLA
            STA   L0A2D
            PLA
            STA   L0A2B
            PLA
            STA   L0A29
            PHX
            LDX   L0A2B
            LDY   L0A29
            JSR   L1095
            LDA   L0A2F
            AND   #$4558	; EX
            CMP   L0A31
            JSR   L0A33
            LDX   L0A2D
            LDY   L0A29
            JSR   L1095
            LDA   L0A27
            BNE   L0A21
            LDA   L0A31
            JMP   L0A41

L0A21       LDA   L0A31
            JMP   L0A50

L0A27       DW    $0000
L0A29       DW    $0000
L0A2B       DW    $0000
L0A2D       DW    $0000
L0A2F       DW    $0000
L0A31       DW    $0000

*-------------------------------

L0A33       BNE   L0A3B
            LDA   #$0044
            JMP   L0DD0

L0A3B       LDA   #$00A0
            JMP   L0DD0

L0A41       BEQ   L0A48
            LDA   #L079E
            BRA   L0A4B
L0A48       LDA   #L07A2
L0A4B       STA   $06
            JMP   L107B

L0A50       BNE   L0A57
            LDA   #L07A6
            BRA   L0A5A
L0A57       LDA   #L07AD
L0A5A       STA   $06
            JMP   L107B

L0A5F       PEA   $0004
            PEA   $0001
            PEA   $001A
            PEA   $0040
            LDA   #$0000
            JSR   L09DD
            PEA   $0005
            PEA   $0001
            PEA   $001A
            PEA   $0100
            LDA   #$0000
            JSR   L09DD
            PEA   $0006
            PEA   $0001
            PEA   $001A
            PEA   $0020
            LDA   #$0000
            JSR   L09DD
            PEA   $0007
            PEA   $0001
            PEA   $001A
            PEA   $0080
            LDA   #$0000
            JSR   L09DD
            PEA   $0008
            PEA   $0001
            PEA   $001A
            PEA   $0010
            LDA   #$0000
            JSR   L09DD
            PEA   $0009
            PEA   $0001
            PEA   $001A
            PEA   $0008
            LDA   #$0000
            JSR   L09DD
            RTS

L0ACC       PEA   $0004
            PEA   $0001
            PEA   $000D
            PEA   $0200
            LDA   #$FFFF
            JSR   L09DD
            PEA   $0005
            PEA   $0001
            PEA   $000D
            PEA   $0400
            LDA   #$FFFF
            JSR   L09DD
            PEA   $0006
            PEA   $0001
            PEA   $000D
            PEA   $0800
            LDA   #$FFFF
            JSR   L09DD
            PEA   $0007
            PEA   $0001
            PEA   $000D
            PEA   $1000
            LDA   #$FFFF
            JSR   L09DD
            PEA   $0008
            PEA   $0001
            PEA   $000D
            PEA   $2000
            LDA   #$FFFF
            JSR   L09DD
            PEA   $0009
            PEA   $0001
            PEA   $000D
            PEA   $4000
            LDA   #$FFFF
            JSR   L09DD
            PEA   $000A
            PEA   $0001
            PEA   $000D
            PEA   $8000
            LDA   #$FFFF
            JSR   L09DD
            RTS

L0B4B       JSR   L133E
            JSR   L0B95
            SEP   #$10
            LDX   #$15
            LDY   #$03
            REP   #$10
            JSR   L1095
            LDX   freqSTEP
            TXA
            AND   #$00FF
            ASL
            ASL
            ASL
            TAX
            LDY   #$0007
L0B6A       LDA   L07B4,X
            AND   #$00FF
            JSR   L0DD0
            INX
            DEY
            BPL   L0B6A
            RTS

L0B78       LDX   freqSTEP
            INX
            CPX   #$0011
            BCC   L0B84
            LDX   #$0000
L0B84       STX   freqSTEP
            RTS

L0B88       LDX   freqSTEP
            DEX
            BPL   L0B91
            LDX   #$0010
L0B91       STX   freqSTEP
            RTS

L0B95       LDA   freqSTEP
            AND   #$001F
            STA   freqSTEP
            LDA   L0845
            AND   #$00FF
            TAX
            LDY   #$0007
            JSR   L1095
            LDX   #$FFFF
            LDY   #$0000
L0BB1       INX
            CPX   #$0011
            BCS   L0BEC
L0BB7       CPX   freqSTEP
            BCC   L0BC8
            BEQ   L0BC3
            LDA   #$00A0
            BRA   L0BCF
L0BC3       CPX   #$0000
            BEQ   L0BB1
L0BC8       LDA   L062C,Y
            SEC
            SBC   #$0080
L0BCF       JSR   L0DD0
            INY
            TYA
            AND   #$00FF
            CLC
            ADC   #$0005
            PHA
            LDA   L0845,X
            AND   #$00FF
            CMP   $01,S
            BCC   L0BE9
            PLA
            BRA   L0BB7
L0BE9       PLA
            BRA   L0BB1
L0BEC       RTS

L0BED       LDA   L11FD
            EOR   #$0040
            BRA   L0C1B
L0BF5       LDA   L11FD
            EOR   #$0100
            BRA   L0C1B
L0BFD       LDA   L11FD
            EOR   #$0020
            BRA   L0C1B
L0C05       LDA   L11FD
            EOR   #$0080
            BRA   L0C1B
L0C0D       LDA   L11FD
            EOR   #$0010
            BRA   L0C1B
L0C15       LDA   L11FD
            EOR   #$0008
L0C1B       STA   L11FD
            BRL   L0A5F
L0C21       LDA   L11FD
            EOR   #$0200
            BRA   L0C57
L0C29       LDA   L11FD
            EOR   #$0400
            BRA   L0C57
L0C31       LDA   L11FD
            EOR   #$0800
            BRA   L0C57
L0C39       LDA   L11FD
            EOR   #$1000
            BRA   L0C57
L0C41       LDA   L11FD
            EOR   #$2000
            BRA   L0C57
L0C49       LDA   L11FD
            EOR   #$4000
            BRA   L0C57
L0C51       LDA   L11FD
            EOR   #$8000
L0C57       STA   L11FD
            BRL   L0ACC
L0C5D       LDA   #$0001
            JSR   L09AA
            RTS

L0C64       LDA   #$0002
            JSR   L09AA
            RTS

L0C6B       LDA   #$0003
            JSR   L09AA
L0C71       JSR   waitforKEY
            AND   #$00FF
            CMP   #$008D
            BEQ   L0CB3
            CMP   #$0088
            BEQ   L0CBA
            CMP   #$008A
            BEQ   L0CBA
            CMP   #$0095
            BEQ   L0CC2
            CMP   #$008B
            BEQ   L0CC2
            CMP   #$00C6
            BEQ   L0CD5
            CMP   #$00E6
            BEQ   L0CD5
            CMP   #$00CF
            BEQ   L0CCA
            CMP   #$00EF
            BEQ   L0CCA
            CMP   #$00BF
            BEQ   L0CE0
            CMP   #$00AF
            BEQ   L0CE0
            CMP   #$009B
            BNE   L0C71
L0CB3       LDA   #$0000
            JSR   L09AA
            RTS

L0CBA       JSR   L0B88
            JSR   L0B4B
            BRA   L0C71
L0CC2       JSR   L0B78
            JSR   L0B4B
            BRA   L0C71
L0CCA       LDA   #$0000
            STA   freqSTEP
            JSR   L0B4B
            BRA   L0C71
L0CD5       LDA   #$0010
            STA   freqSTEP
            JSR   L0B4B
            BRA   L0C71
L0CE0       JSR   L00B3
L0CE3       BRL   L0C71
L0CE6       SEP   #$20
            LDA   freqSTEP
            BEQ   L0CF1
            LDA   #$00
            BRA   L0CF3
L0CF1       LDA   #$10
L0CF3       STA   freqSTEP
            REP   #$20
            JSR   L0D0F
            JSR   L090D
            RTS

strENABLE   ASC   "Enable "00
strDISABLE  ASC   "Disable"00

L0D0F       SEP   #$30
            LDX   #$00
            LDA   freqSTEP
            BNE   L0D23
L0D18       LDA   strENABLE,X
            BEQ   L0D2E
            STA   L04BB+8,X
            INX
            BRA   L0D18
L0D23       LDA   strDISABLE,X
            BEQ   L0D2E
            STA   L04BB+8,X
            INX
            BRA   L0D23

L0D2E       REP   #$30
            LDA   #L04BB
            STA   $06
            SEP   #$10
            LDX   #$03
            LDY   #$06
            REP   #$10
            JSR   L1078
            SEP   #$10
            LDX   #$0A
            LDY   #$11
            REP   #$10
            JSR   L1095
            JSR   L1349
            RTS

            MX    %10
L0D4F       LDX   $15
            LDA   L0EC2,X
            STA   $16
            LDA   L0EDA,X
            STA   $17
            LDA   $14
            BIT   #$01
            BEQ   L0D65
            LDA   #$00
            BRA   L0D67
L0D65       LDA   #$01
L0D67       STA   $18
            RTS

            MX    %00
L0D6A       LDA   #$A0A0
            PHA
            LDX   #$FFFF
            PHX
L0D72       LDA   $01,S
            INC
            CMP   #$0018
            BCS   L0DAF
            STA   $01,S
            TAX
            LDA   L0EC2,X
            STA   $16
            LDA   L0EDA,X
            STA   $17
            LDA   #$0001
            STA   $18
            LDA   $03,S
            LDY   #$0000
L0D91       STA   [$16],Y
            INY
            INY
            CPY   #$0027	; 40 columns
            BCC   L0D91
            LDA   #$0000
            STA   $18
            LDA   $03,S
            LDY   #$0000
L0DA4       STA   [$16],Y
            INY
            INY
            CPY   #$0027	; 40 columns
            BCC   L0DA4
            BRA   L0D72
L0DAF       PLA
            PLA
            RTS

L0DB2       LDA   #$00A0
            PHA
            JSR   L0EB5
L0DB9       REP   #$20
            PLA
            PHA
            JSR   L0DD0
            SEP   #$20
            LDA   $15
            CMP   $13
            BNE   L0DB9
            REP   #$20
            PLA
            JSR   L0EB5
            RTS

L0DCF       DB    $00

L0DD0       PHX
            PHY
            SEP   #$30
            AND   #$FF
            PHA
            CMP   #$8D
            BNE   L0DDE
            BRL   L0E54
L0DDE       CMP   #$FE
            BNE   L0DE5
            BRL   L0E1D
L0DE5       CMP   #$DE
            BNE   L0DEC
            BRL   L0E32
L0DEC       BIT   L0DCF
            BPL   L0DF8
            PLA
            JSR   L0E2F
            PHA
            BRA   L0DFF
L0DF8       BVC   L0DFF
            PLA
            JSR   L0E45
            PHA
L0DFF       SEP   #$30
            JSR   L0D4F
            LDA   $14
            LSR
            TAY
            PLA
            STA   [$16],Y
            LDA   $14
            INC
            CMP   $11
            BCC   L0E16
            INC   $15
            LDA   $10
L0E16       STA   $14
L0E18       REP   #$30
            PLY
            PLX
            RTS

            MX    %10
L0E1D       LDA   #$80
            BIT   L0DCF
            BNE   L0E29
            TSB   L0DCF
            BRA   L0E2C
L0E29       TRB   L0DCF
L0E2C       PLA
            BRA   L0E18
L0E2F       AND   #$5F
            RTS

L0E32       LDA   #$40
            BIT   L0DCF
            BVS   L0E3E
            TSB   L0DCF
            BRA   L0E42
L0E3E       TRB   L0DCF
            CLV
L0E42       PLA
            BRA   L0E18
L0E45       CMP   #$C0
            BCC   L0E4D
            CMP   #$E0
            BCC   L0E51
L0E4D       AND   #$7F
            BRA   L0E53
L0E51       AND   #$1F
L0E53       RTS

            MX    %00
L0E54       INC   $15
            LDA   $10
            STA   $14
            PLA
            BRA   L0E18

*-------------------------------
* initTEXT
*-------------------------------

initTEXT    PEA   $0000
            PEA   $0000
            PEA   $0003
            _SetInputDevice
            PEA   $0000
            PEA   $0000
            PEA   $0003
            _SetOutputDevice
            PEA   $00FF
            PEA   $0080
            _SetInGlobals
            PEA   $00FF
            PEA   $0080
            _SetOutGlobals
            PEA   $0000
            _InitTextDev
            PEA   $0001
            _InitTextDev

L0EAB       LDA   #$5000
            STA   $10
            LDA   #$1800
            STA   $12
L0EB5       SEP   #$20
            LDA   $10
            STA   $14
            LDA   $12
            STA   $15
            REP   #$20
            RTS

L0EC2       HEX   0080008000800080
            HEX   28A828A828A828A8
            HEX   50D050D050D050D0
L0EDA       HEX   0404050506060707
            HEX   0404050506060707
            HEX   0404050506060707
L0EF2       DW    $0000

*-------------------------------

L0EF4       SEP   #$30
            INY
            STY   $13
            INX
            STX   $11
            TXA
            AND   #$FF
            SEC
            SBC   $10
            STA   L0FB9
            REP   #$10
            LDA   #$FE
            JSR   L0DD0
            SEP   #$30
            LDX   #$00
            LDY   #$00
            JSR   L0FBA
            LDA   $11
            AND   #$FF
            CLC
            SBC   $10
            TAX
            LDA   L0EF2
            BNE   L0F26
            LDA   #$A0
            BRA   L0F28
L0F26       LDA   #$5A
L0F28       JSR   L0FC6
            DEX
            LDA   L0EF2
            BNE   L0F35
            LDA   #$DF
            BRA   L0F37
L0F35       LDA   #$5C
L0F37       JSR   L0FC6
            DEX
            BNE   L0F37
            LDA   L0EF2
            BNE   L0F46
            LDA   #$A0
            BRA   L0F48
L0F46       LDA   #$5F
L0F48       JSR   L0FC6
            LDA   $13
            SEC
            SBC   $12
            SBC   #$02
            STA   $0E
            LDY   #$00
            STY   $0F
L0F58       LDY   $0F
            INY
            STY   $0F
            LDX   #$00
            JSR   L0FBA
            LDA   #$5A
            JSR   L0FC6
            LDY   $0F
            LDX   L0FB9
            DEX
            JSR   L0FBA
            LDA   #$5F
            JSR   L0FC6
            DEC   $0E
            BNE   L0F58
            LDX   #$00
            LDA   $13
            SEC
            SBC   $12
            TAY
            DEY
            JSR   L0FBA
            LDX   L0FB9
            INC   L0FB9
            LDA   #$A0
            JSR   L0FC6
            DEX
            DEX
L0F92       LDA   #$4C
            JSR   L0FC6
            DEX
            BNE   L0F92
            LDA   #$A0
            JSR   L0FC6
            DEC   L0FB9
            REP   #$10
            LDA   #$FE
            JSR   L0DD0
            SEP   #$20
            INC   $10
            DEC   $11
            INC   $12
            DEC   $13
            REP   #$20
            JSR   L0DB2
            RTS

L0FB9       DB    $00

L0FBA       TXA
            AND   #$20FF
            STA   $10,X
            SEP   #$10
            JSR   L0D4F
            RTS

L0FC6       PHX
            PHY
            PHA
            JSR   L0D4F
            LDA   $14
            AND   #$4AFF
            TAY
            PLA
            STA   [$16],Y
            INC   $14
            PLY
            PLX
            RTS

            MX    %00
L0FDA       LDA   #$0000
            PHA
            PHA
            PHA
L0FE0       LDA   $01,S
            TAX
            LDA   $05,S
            SEP   #$20
            STA   $18
            LDA   L0EC2,X
            STA   $16
            LDA   L0EDA,X
            STA   $17
            REP   #$20
            LDY   #$0000
            LDA   $03,S
            TAX
L0FFB       LDA   [$16],Y
            STA   L14DB,X
            INX
            INX
            INY
            INY
            CPY   #$0028
            BNE   L0FFB
            TXA
            STA   $03,S
            LDA   $01,S
            INC
            STA   $01,S
            CMP   #$0018
            BCC   L0FE0
            LDA   #$0000
            STA   $01,S
            LDA   $05,S
            INC
            STA   $05,S
            CMP   #$0002
            BCC   L0FE0
            PLA
            PLA
            PLA
            RTS

L1029       LDA   #$0000
            PHA
            PHA
            PHA
L102F       LDA   $01,S
            TAX
            LDA   $05,S
            SEP   #$20
            STA   $18
            LDA   L0EC2,X
            STA   $16
            LDA   L0EDA,X
            STA   $17
            REP   #$20
            LDY   #$0000
            LDA   $03,S
            TAX
L104A       LDA   L14DB,X
            STA   [$16],Y
            INX
            INX
            INY
            INY
            CPY   #$0028
            BNE   L104A
            TXA
            STA   $03,S
            LDA   $01,S
            INC
            STA   $01,S
            CMP   #$0018
            BCC   L102F
            LDA   #$0000
            STA   $01,S
            LDA   $05,S
            INC
            STA   $05,S
            CMP   #$0002
            BCC   L102F
            PLA
            PLA
            PLA
            RTS

L1078       JSR   L1095
L107B       LDY   #$0000
            SEP   #$20
L1080       LDA   ($06),Y
            BEQ   L108C
            JSR   L108F
            INY
            SEP   #$20
            BRA   L1080
L108C       REP   #$20
            RTS

            MX    %10
L108F       ORA   #$80
            JSR   L0DD0
            RTS

L1095       SEP   #$10
            TXA
            CLC
            ADC   $10
            STA   $14
            TYA
            CLC
            ADC   $12
            STA   $15
            REP   #$10
            RTS

            PHA
            LSR
            LSR
            LSR
            LSR
            AND   #$000F
            CLC
            ADC   #$00B0
            JSR   L0DD0
            PLA
            AND   #$000F
            CLC
            ADC   #$00B0
            JMP   L0DD0

            LDY   #$0000
            SEP   #$20
L10C5       LDA   ($06),Y
            BEQ   L10D5
            JSR   L0DD0
            INY
            BNE   L10C5
            INC   $06
            SEP   #$20
            BRA   L10C5
L10D5       REP   #$20
            RTS

L10D8       DB    $00
L10D9       DB    $00
L10DA       DB    $00

L10DB       STA   $08
            SEP   #$30
            LDY   #$00
            LDA   ($08),Y
            STA   $10
            INY
            LDA   ($08),Y
            STA   $12
            INY
            LDA   ($08),Y
            TAX
            INY
            LDA   ($08),Y
            TAY
            JSR   L0EF4
            SEP   #$30
            LDY   #$04
            LDA   ($08),Y
            STA   L10D8
            BEQ   L1130
            BPL   L1118
            LDA   $12
            CLC
            ADC   #$01
            STA   $15
            LDA   $10
            STA   $14
            LDA   $11
            SEC
            SBC   $10
            TAX
            REP   #$30
            JSR   L11DD
L1118       SEP   #$20
            BIT   L10D8
            BVC   L1130
            REP   #$20
            CLC
            LDA   $08
            ADC   #$0005
            STA   $0C
            LDA   ($0C)
            STA   $0A
            JSR   L115C
L1130       REP   #$30
            LDY   #$0009
            LDA   ($08),Y
            AND   #$00FF
            PHA
            CLC
            LDA   #$0006
            ADC   $08
            STA   $0C
L1143       PLA
            BNE   L1149
            BRL   L11E8
L1149       DEC
            PHA
            CLC
            LDA   $0C
            ADC   #$0004
            STA   $0C
            LDA   ($0C)
            STA   $0A
            JSR   L115C
            BRA   L1143
L115C       LDA   $0A
            STA   $06
            SEP   #$30
            LDY   #$02
            LDA   ($0C),Y
            BPL   L11AB
            CMP   #$FF
            BEQ   L1193
            LDA   #$00
            JSR   L11AF
            SEP   #$20
            LDA   #$80
            TSB   L0DCF
            LDA   #$DA
            JSR   L108F
L117D       SEP   #$20
            JSR   L11EE
            LDA   #$D6
            JSR   L108F
            SEP   #$20
            JSR   L11EE
            LDA   #$D7
            JSR   L108F
            BRA   L117D
L1193       JSR   L11B8
            LDA   L10D9
            LSR
            STA   L10D9
            SEC
            LDA   $11
            SBC   $10
            LSR
            SBC   #$00
            SEC
            SBC   L10D9
            BRA   L11AF
L11AB       LDY   #$02
            LDA   ($0C),Y
L11AF       TAX
            LDY   #$03
            LDA   ($0C),Y
            TAY
            JMP   L1078

L11B8       STZ   L10DA
            LDY   #$FF
L11BD       INY
            LDA   ($0A),Y
            AND   #$7F
            CMP   $7E
            BNE   L11C9
            INC   L10DA
L11C9       CMP   $5E
            BNE   L11D0
            INC   L10DA
L11D0       CMP   #$00
            BNE   L11BD
            TYA
            CLC
            SBC   L10DA
            STA   L10D9
            RTS

L11DD       SEP   #$20
            LDA   #$4C
            JSR   L0DD0
            DEX
            BNE   L11DD
            RTS

L11E8       REP   #$30
            STZ   L0EF2
            RTS

            MX    %10
L11EE       LDA   $14
            CMP   $10
            BNE   L11FC
            LDA   #$80
            TRB   L0DCF
            REP   #$20
            PLA
L11FC       RTS

*-------------------------------

L11FD       DB    $00
            DB    $00
L11FF       DB    $00
L1200       DB    $00
L1201       DB    $00
L1202       DB    $00
fgZIPGS     DW    $0000	; 0: no ZipGS, -1: we have one
freqSTEP    DW    $0002	; 0: 0%, 15: 100%

*-------------------------------

L1207       LDX   #L130D
L120A       LDA   L1210,X
            DEX
            BNE   L120A
L1210       SEP   #$30
            JSR   L12CF
            LDAL  CLRAN1
            STA   L1202
            STAL  CLRAN1
            LDAL  SETAN1
            STA   L1201
            LDAL  CLRAN0
            STA   L11FF
            LDAL  SETAN2
            STA   L1200
            JSR   L12CB
            REP   #$30
            JSR   L1282
            JSR   L12E2
            RTS

L1241       JSR   L12B3
            JSR   L1248
            RTS

L1248       SEP   #$30
            JSR   L12CF
            LDA   L11FF
            STAL  CLRAN0
            LDA   L1200
            STAL  SETAN2
            LDA   freqSTEP
            CMP   #$00
            BEQ   L1276
            SEC
            LDA   #$10
            SBC   freqSTEP
            ASL
            ASL
            ASL
            ASL
            STAL  CLRAN2
            STAL  CLRAN1
            BRA   L127C
L1276       STA   CLRAN2
            JSR   L12C7
L127C       JSR   L12CB
            REP   #$30
            RTS

L1282       SEP   #$10
            LDX   L1202
            PHX
            PHX
            TXA
            AND   #$0003
            PHA
            LDX   L11FF
            LDY   L1200
            PHY
            PHX
            REP   #$10
            PLA
            AND   #$FFF8
            STA   L11FD
            PLA
            ORA   L11FD
            STA   L11FD
            PLA
            AND   #$0010
            LSR
            LSR
            ORA   L11FD
            STA   L11FD
            RTS

L12B3       LDA   L11FD
            AND   #$FFFB
            PHA
            SEP   #$10
            PLX
            PLY
            STX   L11FF
            STY   L1200
            REP   #$10
            RTS

            MX    %10
L12C7       LDA   #$00
            BRA   L12DD
L12CB       LDA   #$A5
            BRA   L12DD
L12CF       LDA   #$5A
            STAL  SETAN1
            STAL  SETAN1
            STAL  SETAN1
L12DD       STAL  SETAN1
            RTS

L12E2       SEP   #$20
            LDA   L1201
            AND   #$F0
            LSR
            LSR
            LSR
            LSR
            STA   L1201
            SEC
            LDA   #$10
            SBC   L1201
            REP   #$20
            AND   #$00FF
            STA   freqSTEP
            LDA   L11FD
            BIT   #$0004
            BEQ   L130C
            LDA   #$0000
            STA   freqSTEP
L130C       RTS

            MX    %10
L130D       ASC   "Zip GS is Disabled"00
L1320       ASC   "MHz       "00
L132B       ASC   "    "00

L1330       DB    $00
            DB    $00
L1332       DB    $00
L1333       DB    $00
L1334       DB    $00
L1335       DB    $00
L1336       DB    $00
            DB    $00
L1338       DB    $00
            DB    $00
L133A       DB    $00
            DB    $00
            DB    $00
            DB    $00

*-------------------------------

L133E       SEP   #$10
            LDX   #$10
            LDY   #$0A
            REP   #$10
            JSR   L1095
L1349       LDA   #$0000
            STA   L1334
            STA   L1336
            STA   L1338
            STA   L133A
            JSR   L13CC
            SEP   #$30
            LDA   freqSTEP
            BNE   L136D
            REP   #$30
            LDA   #L130D
            STA   $06
            JSR   L107B
            RTS

L136D       REP   #$30
            LDA   L1330
            PHA
            PEA   ^L1334
            PEA   L1334
            PEA   $0006
            PEA   $0000
            _Int2Dec
            SEP   #$30
            LDY   #$FF
L138A       INY
            LDA   L1334,Y
            CMP   #$00
            BNE   L138A
            LDA   #$A0
            STA   L1333,Y
            STA   L1334,Y
            LDA   #$00
            STA   L1335,Y
            DEY
            LDX   #$02
L13A2       DEY
            LDA   L1334,Y
            STA   L1335,Y
            DEX
            BNE   L13A2
            LDA   #$AE
            STA   L1334,Y
            REP   #$30
            LDA   #L132B
            STA   $06
            JSR   L107B
            LDA   #L1334
            STA   $06
            JSR   L107B
            LDA   #L1320
            STA   $06
            JSR   L107B
            RTS

*-------------------------------

L13CC       LDA   #$0000
            STA   L1330
            STA   L1332
            LDY   #$00C1
L13D8       LDA   L13D8,Y
            DEY
            BNE   L13D8

            PHP
            SEI
            SEP   #$30
            LDAL  CYAREG
            STA   L148B
            AND   #$7F
            STAL  CYAREG
            LDA   #$5A	; unlock
            STAL  SETAN1
            STAL  SETAN1
            STAL  SETAN1
            STAL  SETAN1
            LDA   freqSTEP
            BEQ   L141A
            LDA   #$10
            SEC
            SBC   freqSTEP
            ASL
            ASL
            ASL
            ASL
            STAL  CLRAN2
            STAL  CLRAN1
            BRA   L141E
L141A       STAL  SETAN1
L141E       LDAL  CLRAN0
            STA   L148C
            AND   #$D7
            STAL  CLRAN0
            LDA   #$80
            STAL  SETAN3
            LDA   #$00
            STAL  SETAN3
            REP   #$30
            LDY   #$0064
            LDX   #$0000
L143F       LDAL  SETAN1
            BPL   L143F
L1445       LDAL  SETAN1
            BMI   L1445
L144B       LDAL  SETAN1
            BPL   L144B
L1451       TXA
            LDX   #$0005
L1455       DEX
            BNE   L1455
            NOP
            NOP
            CLC
            ADC   #$0001
            TAX
            LDAL  SETAN1
            BMI   L1451
            DEY
            BNE   L144B
            TXA
            CLC
            ADC   #$0005
            STAL  L1330
            SEP   #$20
            LDA   L148C
            STAL  CLRAN0
            LDA   L148B
            STAL  CYAREG
            LDA   #$A5
            STAL  SETAN1
            REP   #$20
            PLP
            RTS

L148B       DB    $00
L148C       DB    $00

*-------------------------------
* checkZIPGS
*-------------------------------

checkZIPGS  STZ   fgZIPGS

            LDY   #$0000	; wait a big number of cycles
L1493       LDA   L1493,Y
            DEY
            BNE   L1493

            PHP
            SEP   #$20
            LDA   #$5A	; unlock
            STAL  SETAN1
            STAL  SETAN1
            STAL  SETAN1
            STAL  SETAN1
            LDAL  CLRAN0	; save value
            EOR   #$F8
            STA   L14DA
            STAL  CLRAN0
            LDAL  CLRAN0	; read again
            CMP   L14DA	; same value?
            BNE   L14D8	; nope, it was write-only, so no ZipGS
            EOR   #$F8	; yes, restore the original value
            STAL  CLRAN0
            LDA   #$A5	; lock the beast
            STAL  SETAN1
            REP   #$20
            LDA   #$FFFF	; and say we have a ZipGSX
            STA   fgZIPGS
L14D8       PLP
            RTS

L14DA       DB    $00

*-------------------------------
* Big buffer
*-------------------------------

L14DB       DS    $800,$01

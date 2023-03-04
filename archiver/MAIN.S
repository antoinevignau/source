*
* Archiver GS
*
* (c) 1992, Apple Computer, Inc.
* (s) 2023, Antoine Vignau
*

	mx	%00
	rel
	lst	off

*-----------------------------------

	use	MAIN.X

	use	4/Ctl.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Resource.Macs
	use	4/SANE.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-----------------------------------

STATEREG        EQU   $C068
RDBANK2         EQU   $C080
LCBANK2         EQU   $C083
DEV_DISPATCHER  EQU   $01FC00
DISPATCH2       EQU   $E10004
GSOS            EQU   $E100A8
GSOS2           EQU   $E100B0

*-----------------------------------

                PEA   >L0612EF
                PLB
                PLB
                STA   L0612EF
                STX   L0612F3
                STY   L0612F1
                PHA
                PHA
                TSC
                TCD
                PHA
                _MMStartUp
                PLA
                PHX
                PHA
                PEA   $0000
                PEA   $0100
                PHA
                PEA   $C011
                PEA   $0000
                PEA   $0000
                _NewHandle
                PLY
                PLX
                BCC   L03005F
                PHA
                PEA   ^L050000
                PEA   L050000
                LDA   L0612F1
                ORA   L0612F3
                BEQ   L030058
                _ErrWriteLine
                PLA
                LDA   #$FFFF
                STA   L0612E9
                BRL   L0300D5
L030058         _SysFailMgr
L03005F         STY   $01
                STX   $03
                LDA   [$01]
                PHA
                _SANEStartUp
                LDX   L0612F3
                LDA   L0612F1
                PHX
                PHA
                PEA   $0001
                JSL   L03A645
                PLY
                PLY
                PLY
                TAY
                BPL   L030087
                STA   L0612E9
                BRA   L0300B5
L030087         STZ   L060000
                PEA   ^L0514C7
                PEA   L0514C7
                JSL   L03B0E5
                PLY
                PLY
                TAY
                BNE   L0300B5
                LDX   L0612E1
                LDA   L0612DF
                PHX
                PHA
                LDA   L0612F5
                PHA
                JSL   L030107
                PLY
                PLY
                PLY
                LDA   L060000
                PHA
                JSL   L03A7F7
                PLY
L0300B5         _SANEShutDown
                PEI   $03
                PEI   $01
                _DisposeHandle
                LDA   L0612EF
                ORA   #$0F00
                PHA
                _DisposeAll
L0300D5         LDA   L0612E5
                STAL  L050020
                LDA   L0612E7
                STAL  L050022
                LDA   L0612E3
                STAL  L050024
                LDA   L0612E9
                JSL   GSOS
                DW    $0029             ; Quit
                ADRL  L050020
                PHA
                PEA   $0000
                PEA   $0000
                _SysFailMgr
                BRK   $00
L030107         PHD
                TSC
                CLC
                ADC   #$FFFC
                TCS
                TCD
                PHY
                JSL   L074A31
                PLA
                LSR
                BCS   L03011B
                BRL   L03019C
L03011B         JSL   L07494A
                PEA   $0000
                PEA   $0000
                PEA   ^L06006E
                PEA   L06006E
                PEA   $0002
                PEA   ^L060436
                PEA   L060436
                PEA   $0000
                PEA   $0000
                LDA   L0600DC
                PHA
                LDA   L0600D8
                LDX   L0600DA
                STA   $01
                STX   $03
                LDY   #$0002
                LDA   [$01],Y
                TAX
                LDA   [$01]
                PHA
                JSL   L031CE7
                LDA   L06006E
                BEQ   L030189
                PHY
                PHY
                PEA   $0000
                PEA   $1141
                PEA   $0000
                PEA   $000F
                JSL   L03A1A0
                PLA
                PLX
                CLC
                ADC   #$0010
                BCC   L030175
                INX
L030175         CLC
                ADC   #$0040
                BCC   L03017C
                INX
L03017C         CLC
                ADC   #$0200
                BCC   L030183
                INX
L030183         STA   L060002
                STX   L060004
L030189         JSL   L074538
                STZ   L0600CE
L030190         JSL   L0743FE
                LDA   L0600CE
                DEC
                BNE   L030190
                BRA   L0301BD
L03019C         PHY
                PEA   ^L06125A
                PEA   L06125A
                PEA   ^L06127C
                PEA   L06127C
                PEA   ^L061296
                PEA   L061296
                PEA   ^L061297
                PEA   L061297
                JSL   L03B102
                PLA
                STA   L060020
L0301BD         JSL   L070000
                PLY
                PLY
                PLD
                RTL

L0301C5         DB    $00
                DB    $00
L0301C7         DB    $00
                DB    $00
L0301C9         DB    $00
                DB    $00
                DB    $00
                DB    $00
L0301CD         DB    $00
                DB    $00
L0301CF         DB    $02
                DB    $04
L0301D1         DB    $00
L0301D2         DB    $00
L0301D3         DB    $00
L0301D4         DB    $00
L0301D5         DB    $00
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
L0305D3         STX   $00
                LDY   #$FFFE
L0305D8         INY
                INY
                LDA   ($00),Y
                BMI   L0305D8
                BEQ   L0305E9
                TYX
                TAY
                LDA   [$02],Y
                TXY
                STA   [$0A],Y
                BRA   L0305D8
L0305E9         RTS

L0305EA         LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                LDA   [$1A]
                STA   $06
                CLC
                ADC   L0301C5
                STA   $0A
                LDA   $08
                ADC   L0301C7
                STA   $0C
                RTS

L030603         LDY   #$0004
                LDA   [$1A],Y
                AND   #$7FFF
                STA   [$1A],Y
                LDA   $92
                CLC
                ADC   #$0000
                TAX
                LDA   $94
                ADC   #$0001
                PHA
                PHX
                PEI   $1C
                PEI   $1A
                _SetHandleSize
                BCC   L030629
                RTS

L030629         LDA   $92
                STA   $12
                CLC
                ADC   #$0000
                STA   $92
                LDA   $94
                STA   $14
                ADC   #$0001
                STA   $94
                LDY   #$0004
                LDA   [$1A],Y
                ORA   #$8000
                STA   [$1A],Y
                LDA   $0A
                SEC
                SBC   $06
                STA   L0301C5
                LDA   $0C
                SBC   $08
                STA   L0301C7
                JSR   L0305EA
                LDA   $06
                CLC
                ADC   $12
                STA   $12
                LDA   $08
                ADC   $14
                STA   $14
                LDY   #$0000
                LDA   #$0000
L03066B         DEY
                DEY
                BEQ   L030673
                STA   [$12],Y
                BRA   L03066B
L030673         STA   [$0A]
                CLC
                RTS

L030677         LDA   #$000D
                LDY   #$0002
                STA   [$02],Y
                INY
                INY
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDA   #$0002
                STA   [$02]
                PEI   $04
                PEI   $02
                PEA   $2009
                JSL   GSOS2
                LDY   #$000A
L0306A0         LDA   L030AC1,Y
                STA   [$02],Y
                DEY
                DEY
                BPL   L0306A0
                LDA   #$2010
                JSR   L033500
                RTS

L0306B0         LDY   #$0002
                STA   [$02],Y
                LDA   #$0001
                STA   [$02]
                PEI   $04
                PEI   $02
                PEA   $2014
                JSL   GSOS2
                RTS

L0306C6         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L0301CD
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0600
                STA   L0301C9
                LDA   $09,S
                STA   $84
                LDA   $0B,S
                STA   $86
                PLA
                STA   $07,S
                PLA
                STA   $07,S
                TSC
                CLC
                ADC   #$0004
                TCS
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                STZ   L030AB5
                STZ   L030ABD
                _CompactMem
                LDX   #$0000
                LDA   #$0001
                LDY   L0301C9
                JSR   L0325E6
                STX   $1A
                STY   $1C
                BCC   L03071E
                LDA   #$8054
                STA   L030AB5
                BRL   L030A99
L03071E         LDA   #$0000
                STA   $92
                LDA   #$0001
                STA   $94
                LDA   #$01B6
                STA   L0301C5
                STZ   L0301C7
                JSR   L0305EA
                LDY   #$0000
                LDA   #$0000
L03073A         DEY
                DEY
                BEQ   L030742
                STA   [$06],Y
                BRA   L03073A
L030742         STA   [$06]
                LDA   #$0001
                STA   L030AB7
                LDA   #L05009E
                STA   $12
                LDA   #^L05009E
                STA   $14
                LDA   [$12]
                AND   #$00FF
                STA   L0301D1
                TAX
                TAY
                SEP   #$20
L030760         LDA   [$12],Y
                STA   L0301D2,X
                DEY
                DEX
                BNE   L030760
                REP   #$20
                JSR   L030677
                BCC   L030779
                LDA   #$8051
                STA   L030AB5
                BRL   L0309CA
L030779         LDY   #$0002
                LDA   [$02],Y
                STA   L030AE0
                LDX   #L030B20
                JSR   L0305D3
                LDA   L030AB7
                LDY   #$001E
                STA   [$0A],Y
                LDA   L0301D1
                TAX
                CLC
                ADC   #$002F
                TAY
                DEY
                STA   L030AB9
                XBA
                STA   [$0A]
                SEP   #$20
                TXA
                PHA
L0307A3         LDA   L0301D2,X
                STA   [$0A],Y
                DEY
                DEX
                BNE   L0307A3
                PLA
                STA   [$0A],Y
                REP   #$20
L0307B1         LDY   #$000C
L0307B4         LDA   L030ACD,Y
                STA   [$02],Y
                DEY
                DEY
                BPL   L0307B4
                LDA   L030AB7
                ASL
                TAY
                LDA   L030ADB+3,Y
                LDY   #$0002
                STA   [$02],Y
                LDA   #$0000
                LDY   #$0032
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                PEI   $04
                PEI   $02
                PEA   $201C
                JSL   GSOS2
                BCC   L030823
                CMP   #$0061
                BNE   L0307EB
                BRL   L030957
L0307EB         LDA   $0A
                STA   $16
                LDA   $0C
                STA   $18
L0307F3         LDY   #$001E
                LDA   [$16],Y
                AND   #$00FF
                CMP   L030AB7
                BEQ   L030816
                LDA   [$16]
                AND   #$00FF
                CLC
                SBC   $16
                EOR   #$FFFF
                STA   $16
                BCC   L030811
                DEC   $18
L030811         DEC   L030ABD
                BRA   L0307F3
L030816         LDY   #$001C
                LDA   [$16],Y
                ORA   #$8000
                STA   [$16],Y
                BRL   L030957
L030823         LDA   $0A
                CLC
                ADC   L030AB9
                STA   $0A
                BCC   L03082F
                INC   $0C
L03082F         LDA   L0301D1
                CLC
                ADC   #$002F
                STA   L030ABB
                LDA   $0A
                SEC
                SBC   $06
                TAX
                LDA   $0C
                SBC   $08
                TAY
                TXA
                CLC
                ADC   L030ABB
                TAX
                BCC   L03084D
                INY
L03084D         CPY   $94
                BNE   L030865
                CPX   $92
                BCC   L030865
                BEQ   L030865
                JSR   L030603
                BCC   L030865
                LDA   #$8054
                STA   L030AB5
                BRL   L0309CA
L030865         LDA   L030ABB
                LDX   L030AB9
                STA   L030AB9
                TXA
                XBA
                ORA   L030AB9
                XBA
                STA   [$0A]
                LDX   #L030B3E
                JSR   L0305D3
                LDY   #$001E
                LDA   L030AB7
                INC
                STA   [$0A],Y
                STZ   L030ABF
                LDA   #$0100
                TSB   L030ABF
                LDY   #$0004
                LDA   [$02],Y
                AND   #$8000
                BEQ   L03089E
                LDA   #$0800
                TSB   L030ABF
L03089E         LDY   #$002A
                LDA   [$02],Y
                TAX
                AND   #$0020
                BEQ   L0308AF
                LDA   #$0400
                TSB   L030ABF
L0308AF         TXA
                AND   #$0040
                BEQ   L0308BB
                LDA   #$0200
                TSB   L030ABF
L0308BB         LDA   L030ABF
                LDY   #$001C
                STA   [$0A],Y
                SEP   #$30
                LDA   L0301D1
                LDY   #$2E
                STA   [$0A],Y
                TAX
                CLC
                ADC   #$2E
                TAY
L0308D1         LDA   L0301D2,X
                STA   [$0A],Y
                DEY
                DEX
                BNE   L0308D1
                REP   #$30
                INC   L030ABD
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L0308EC
                BRL   L0307B1
L0308EC         LDA   L030AB7
                CMP   #$0020
                BNE   L0308F7
                BRL   L0307B1
L0308F7         INC
                STA   L030AB7
                LDA   L0301D1
                CMP   #$00FF
                BCC   L03090C
                LDA   #$8040
                STA   L030AB5
                BRL   L0309CA
L03090C         TAY
                INC
                INC
                INC
                TAX
                STA   L0301D1
                SEP   #$20
L030916         LDA   L0301D2,Y
                STA   L0301D2,X
                DEX
                DEY
                BNE   L030916
                REP   #$30
                LDA   L030ADB+2
                STA   L0301D3
                LDA   L030ADB+3
                STA   L0301D4
                JSR   L030677
                BCC   L030947
                LDY   #$001C
                LDA   [$0A],Y
                ORA   #$8000
                STA   [$0A],Y
                LDA   L030AB7
                ASL
                TAX
                STZ   L030ADB+3,X
                BRA   L030957
L030947         LDA   L030AB7
                ASL
                TAX
                LDY   #$0002
                LDA   [$02],Y
                STA   L030ADB+3,X
                BRL   L0307B1
L030957         LDA   L030AB7
                ASL
                TAX
                LDA   L030ADB+3,X
                BEQ   L030964
                JSR   L0306B0
L030964         DEC   L030AB7
                BNE   L03096C
                BRL   L0309E4
L03096C         LDA   #$000D
                LDY   #$0002
                STA   [$02],Y
                INY
                INY
                LDA   #L0301CF
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301CF
                STA   [$02],Y
                LDA   #$0002
                STA   [$02]
                PEI   $04
                PEI   $02
                PEA   $200A
                JSL   GSOS2
                SEP   #$20
                LDY   L0301D1
                DEY
L030998         DEY
                LDA   L0301D3,Y
                CMP   #$3A
                BNE   L030998
                INY
                STY   L0301D1
                REP   #$20
                LDA   #$000D
                LDY   #$0002
                STA   [$02],Y
                LDA   #L0301D1
                INY
                INY
                STA   [$02],Y
                LDA   #^L0301D1
                INY
                INY
                STA   [$02],Y
                PEI   $04
                PEI   $02
                PEA   $2009
                JSL   GSOS2
                BRL   L0307B1
L0309CA         LDA   #$0001
                STA   [$02]
L0309CF         LDA   L030AB7
                ASL
                TAX
                LDA   L030ADB+3,X
                BEQ   L0309DC
                JSR   L0306B0
L0309DC         DEC   L030AB7
                BNE   L0309CF
                BRL   L030A99
L0309E4         LDA   [$0A]
                TAX
                AND   #$FF00
                XBA
                LDY   #$000E
                STA   [$06],Y
                TXA
                AND   #$00FF
                STA   [$0A]
                STZ   $8C
                STZ   $8E
                STZ   $90
                LDY   #$0004
                LDA   $92
                STA   [$06],Y
                INY
                INY
                LDA   $94
                STA   [$06],Y
                LDY   #$000A
                LDA   $0A
                SEC
                SBC   $06
                STA   [$06],Y
                INY
                INY
                LDA   $0C
                SBC   $08
                STA   [$06],Y
                LDA   L030ABD
                LDY   #$0008
                STA   [$06],Y
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                ADC   #$0000
                STA   $0C
                JSL   L031B5B
                LDY   #$01B2
                STA   [$06],Y
                LDY   #$0004
                STA   [$84],Y
                TXA
                TYX
                LDY   #$01B4
                STA   [$06],Y
                TXY
                INY
                INY
                STA   [$84],Y
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                BCC   L030A59
                INC
L030A59         STA   $0C
L030A5B         LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L030A72
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$0400
                BEQ   L030A72
                JSR   L031059
L030A72         LDA   [$0A]
                AND   #$FF00
                BEQ   L030A85
                XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L030A5B
                INC   $0C
                BRA   L030A5B
L030A85         LDY   #$0008
                LDA   $8E
                STA   [$84],Y
                INY
                INY
                LDA   $90
                STA   [$84],Y
                LDY   #$000C
                LDA   $8C
                STA   [$84],Y
L030A99         LDA   L030ABD
                LDY   #$0002
                STA   [$84],Y
                LDA   L030AB5
                LDY   #$0000
                STA   [$84],Y
                LDA   L0301CD
                TCD
                LDA   L030AB5
                PLB
                CMP   #$0001
                RTL

L030AB5         DB    $00
                DB    $00
L030AB7         DB    $00
                DB    $00
L030AB9         DB    $00
                DB    $00
L030ABB         DB    $00
                DB    $00
L030ABD         DB    $00
                DB    $00
L030ABF         DB    $00
                DB    $00
L030AC1         DB    $0A
                DB    $00
                DB    $00
                DB    $00
                ADRL  L030ADB
                DB    $01
                DB    $00
                DB    $00
                DB    $00
L030ACD         DB    $10
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $01
                DB    $00
                DB    $01
                DB    $00
                ADRL  L0301CF
L030ADB         STRL  '13:'
L030AE0         DB    $00
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
L030B20         DB    $00
                DB    $80
                DW    $000E
                DW    $002A
                DW    $002C
                DW    $0016
                DW    $0018
                DW    $001A
                DW    $001C
                DW    $001E
                DW    $0020
                DW    $0022
                DW    $0024
                DW    $0032
                DW    $0034
                DW    $0000
L030B3E         DW    $8000
                DW    $0010
                DW    $0012
                DW    $0014
                DW    $001A
                DW    $001C
                DW    $001E
                DW    $0020
                DW    $0022
                DW    $0024
                DW    $0026
                DW    $0028
                DW    $0036
                DW    $0038
                DW    $0000
L030B5C         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L0301CD
                LDA   $05,S
                TCD
                LDA   $03,S
                STA   $05,S
                LDA   $01,S
                STA   $03,S
                PLA
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #L0301CF
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301CF
                STA   [$02],Y
                PEI   $04
                PEI   $02
                PEA   $2028
                JSL   GSOS2
                LDX   L0301D1
                SEP   #$20
                LDA   L0301D2,X
                CMP   #$3A
                BNE   L030BA5
                DEX
L030BA5         TXA
                STAL  L050425
L030BAA         LDA   L0301D2,X
                STAL  L050425,X
                DEX
                BNE   L030BAA
                REP   #$20
                LDA   L0301CD
                TCD
                PLB
                RTL

L030BBC         DB    $00
                DB    $00
L030BBE         DB    $00
                DB    $00
L030BC0         DB    $00
                DB    $00
                DB    $00
                DB    $00
L030BC4         DB    $00
                DB    $00
L030BC6         DB    $00
                DB    $00
L030BC8         DB    $00
                DB    $00
L030BCA         DB    $00
                DB    $00
L030BCC         DB    $00
                DB    $00
L030BCE         DB    $00
                DB    $00
L030BD0         DB    $00
                DB    $00
L030BD2         DB    $00
                DB    $00
L030BD4         DB    $00
                DB    $00
L030BD6         DB    $00
                DB    $00
L030BD8         DB    $00
                DB    $00
L030BDA         DB    $00
                DB    $00
L030BDC         DB    $00
                DB    $00
L030BDE         DB    $00
                DB    $00
L030BE0         DB    $00
                DB    $00
L030BE2         DB    $00
                DB    $00
L030BE4         DB    $00
                DB    $00
L030BE6         DB    $00
                DB    $00
L030BE8         DB    $00
                DB    $00
L030BEA         DB    $00
                DB    $00
L030BEC         DB    $00
                DB    $00
L030BEE         DB    $00
                DB    $00
L030BF0         LDY   #$0004
                LDA   [$26],Y
                AND   #$7FFF
                STA   [$26],Y
                LDA   L030BC4
                CLC
                ADC   #$03E8
                STA   L030BD4
                TAX
                LDA   L030BC6
                ADC   #$0000
                STA   L030BD6
                PHA
                PHX
                PEI   $28
                PEI   $26
                _SetHandleSize
                BCC   L030C1E
                RTS

L030C1E         LDA   L030BD4
                STA   L030BC4
                LDA   L030BD6
                STA   L030BC6
                LDY   #$0004
                LDA   [$26],Y
                ORA   #$8000
                STA   [$26],Y
                LDA   $2E
                SEC
                SBC   $2A
                STA   L030BD8
                LDA   $30
                SBC   $2C
                STA   L030BDA
                LDY   #$0002
                LDA   [$26],Y
                STA   $2C
                LDA   [$26]
                STA   $2A
                CLC
                ADC   L030BD8
                STA   $2E
                LDA   $2C
                ADC   L030BDA
                STA   $30
                LDA   #$00C8
                STA   L030BDC
                CLC
                ADC   L030BD2
                STA   L030BD2
                CLC
                RTS

L030C6A         LDA   $2A
                CLC
                ADC   #$0003
                STA   $2E
                LDA   $2C
                BCC   L030C77
                INC
L030C77         STA   $30
                LDX   L030BD0
                BEQ   L030C91
L030C7E         LDA   [$2E]
                BMI   L030C93
                LDA   $2E
                CLC
                ADC   #$0005
                STA   $2E
                BCC   L030C8E
                INC   $30
L030C8E         DEX
                BNE   L030C7E
L030C91         SEC
                RTS

L030C93         LDA   $2E
                SEC
                SBC   #$0003
                STA   $2E
                BCS   L030C9F
                DEC   $30
L030C9F         CLC
                RTS

L030CA1         STZ   L030BD0
                LDA   $2A
                STA   $2E
                LDA   $2C
                STA   $30
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                BCC   L030CB9
                INC
L030CB9         STA   $0C
                LDA   [$0A]
                AND   #$FF00
                BNE   L030CC5
                BRL   L030D7C
L030CC5         XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L030CCF
                INC   $0C
L030CCF         LDA   L030BD2
                STA   L030BDC
L030CD5         LDA   #$FFFF
                STA   L030BE4
                BIT   L030BE6
                BPL   L030CFF
                LDY   #$001C
                LDA   [$0A],Y
                BIT   #$00C0
                BEQ   L030CF1
                ORA   #$4000
                STA   [$0A],Y
                BRA   L030CFF
L030CF1         LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                INC
                STA   L030BE4
                BRA   L030D5B
L030CFF         INC   L030BD0
                LDA   $0A
                STA   [$2E]
                LDA   $0C
                LDY   #$0002
                STA   [$2E],Y
                SEP   #$30
                LDA   #$00
                LDY   #$04
                STA   [$2E],Y
                REP   #$31
                BIT   L030BE6
                BMI   L030D3C
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BNE   L030D3C
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$4000
                BNE   L030D3C
                LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                INC
                STA   L030BE4
L030D3C         LDA   $2E
                CLC
                ADC   #$0005
                STA   $2E
                BCC   L030D48
                INC   $30
L030D48         DEC   L030BDC
                BNE   L030D5B
                JSR   L030BF0
                BCC   L030D5B
                LDA   #$8054
                STA   L030BC0
                BRL   L030D7C
L030D5B         LDY   #$001E
L030D5E         LDA   [$0A]
                AND   #$FF00
                BEQ   L030D7C
                XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L030D6F
                INC   $0C
L030D6F         LDA   [$0A],Y
                AND   #$00FF
                CMP   L030BE4
                BCS   L030D5E
                BRL   L030CD5
L030D7C         LDA   L030BC0
                CMP   #$0001
                RTS

L030D83         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $07,S
                STA   $36
                LDA   $09,S
                STA   $38
                LDA   $0B,S
                STA   $3A
                LDA   $0D,S
                STA   $3C
                LDA   $0F,S
                STA   $22
                LDA   $11,S
                STA   $24
                PLA
                STA   $0D,S
                PLA
                STA   $0D,S
                TSC
                CLC
                ADC   #$000A
                TCS
                STZ   L030BC0
                LDA   [$26]
                STA   $2A
                LDY   #$0002
                LDA   [$26],Y
                STA   $2C
                JSR   L030C6A
                BCC   L030DCD
                LDA   #$8000
                STA   L030BC0
                BRL   L030E00
L030DCD         LDA   [$2E]
                STA   $0A
                LDY   #$0002
                LDA   [$2E],Y
                STA   $0C
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L030DEB
                LDA   #$8051
                STA   L030BC0
                BRL   L030E00
L030DEB         LDY   #$001C
                LDA   #$4000
                EOR   [$0A],Y
                STA   [$0A],Y
                JSR   L030CA1
                BCC   L030E00
                LDA   #$8054
                STA   L030BC0
L030E00         LDA   L030BC0
                STA   [$22]
                TAX
                LDA   L030BD0
                STA   [$3A]
                LDA   $2A
                STA   [$36]
                LDY   #$0002
                LDA   $2C
                STA   [$36],Y
                LDA   L030BBC
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L030E20         DW    $0000
L030E22         DW    $0000
L030E24         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0200
                STA   L030BBE
                LDA   $09,S
                STA   $36
                LDA   $0B,S
                STA   $38
                LDA   $0D,S
                STA   $3A
                LDA   $0F,S
                STA   $3C
                LDA   $11,S
                STA   $22
                LDA   $13,S
                STA   $24
                LDA   $15,S
                STA   L030BE6
                PLA
                STA   $11,S
                PLA
                STA   $11,S
                TSC
                CLC
                ADC   #$000E
                TCS
                STZ   L030BC0
                LDX   #$03E8
                LDA   #$0000
                LDY   L030BBE
                JSR   L0325E6
                BCC   L030E79
                LDA   #$8054
                STA   L030BC0
                BRL   L030EED
L030E79         STX   $26
                STY   $28
                LDA   #$03E8
                STA   L030BC4
                LDA   #$0000
                STA   L030BC6
                LDA   [$26]
                STA   $2A
                LDY   #$0002
                LDA   [$26],Y
                STA   $2C
                LDA   #$03E3
                CLC
                ADC   $2A
                STA   L030BC8
                LDA   #$0000
                ADC   $2C
                STA   L030BCA
                LDA   #$00C8
                STA   L030BD2
                LDA   [$1A]
                STA   $06
                LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $32
                LDA   $08
                ADC   #$0000
                STA   $34
                LDY   #$000A
                LDA   [$06],Y
                CLC
                ADC   $06
                STA   L030BCC
                INY
                INY
                LDA   [$06],Y
                ADC   $08
                STA   L030BCE
                JSR   L030CA1
                BCC   L030EE3
                STA   L030BC0
                BRA   L030EED
L030EE3         LDY   #$0004
                LDA   [$2A],Y
                ORA   #$0080
                STA   [$2A],Y
L030EED         LDA   L030BC0
                STA   [$22]
                TAX
                LDA   L030BD0
                STA   [$3A]
                LDA   $2A
                STA   [$36]
                LDY   #$0002
                LDA   $2C
                STA   [$36],Y
                LDA   L030BBC
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L030F0D         LDY   #$001C
                LDA   [$0A],Y
                TAX
                AND   #$3000
                BNE   L030F1B
                BRL   L031056
L030F1B         TXA
                AND   #$CFFF
                STA   [$0A],Y
                LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                INC
                STA   L030BE4
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L030F5C
                LDA   $8E
                LDY   #$0004
                SEC
                SBC   [$0A],Y
                TAX
                LDA   $90
                INY
                INY
                SBC   [$0A],Y
                TAY
                TXA
                TYX
                LDY   #$0018
                SBC   [$0A],Y
                STA   $8E
                TXA
                INY
                INY
                SBC   [$0A],Y
                STA   $90
                DEC   $8C
                BRL   L030FF0
L030F5C         LDY   #$001E
L030F5F         LDA   [$0A]
                AND   #$FF00
                BEQ   L030F8B
                XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L030F70
                INC   $0C
L030F70         LDA   [$0A],Y
                AND   #$00FF
                CMP   L030BE4
                BCS   L030F5F
L030F7A         LDA   [$0A]
                AND   #$00FF
                CLC
                SBC   $0A
                EOR   #$FFFF
                STA   $0A
                BCC   L030F8B
                DEC   $0C
L030F8B         LDY   #$0002
                LDA   [$0A],Y
                TAX
                CMP   #$000F
                BNE   L030F9E
                LDY   #$002A
                LDA   #$0000
                STA   [$0A],Y
L030F9E         LDY   #$001C
                LDA   [$0A],Y
                PHA
                AND   #$CFFF
                STA   [$0A],Y
                PLA
                AND   #$3000
                BEQ   L030FD6
                CPX   #$000F
                BEQ   L030FD6
                LDA   $8E
                LDY   #$0004
                SEC
                SBC   [$0A],Y
                TAX
                LDA   $90
                INY
                INY
                SBC   [$0A],Y
                TAY
                TXA
                TYX
                LDY   #$0018
                SBC   [$0A],Y
                STA   $8E
                TXA
                INY
                INY
                SBC   [$0A],Y
                STA   $90
                DEC   $8C
L030FD6         LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                CMP   L030BE4
                BCC   L030FE5
                BRA   L030F7A
L030FE5         LDA   [$2E]
                STA   $0A
                LDY   #$0002
                LDA   [$2E],Y
                STA   $0C
L030FF0         STZ   L031057
L030FF3         LDA   L030BE4
                DEC
                CMP   #$0001
                BEQ   L031056
                STA   L030BE4
                LDY   #$001E
L031002         LDA   [$0A]
                AND   #$00FF
                CLC
                SBC   $0A
                EOR   #$FFFF
                STA   $0A
                BCC   L031013
                DEC   $0C
L031013         LDA   [$0A],Y
                AND   #$00FF
                CMP   L030BE4
                BCS   L031002
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$DFFF
                TAX
                LDA   L031057
                BNE   L031040
                LDY   #$002A
                LDA   [$0A],Y
                DEC
                STA   [$0A],Y
                BNE   L031048
                TXA
                AND   #$EFFF
                LDY   #$001C
                STA   [$0A],Y
                BRA   L030FF3
L031040         TXA
                LDY   #$001C
                STA   [$0A],Y
                BRA   L030FF3
L031048         LDA   #$FFFF
                STA   L031057
                TXA
                LDY   #$001C
                STA   [$0A],Y
                BRA   L030FF3
L031056         RTS

L031057         DW    $0000
L031059         LDY   #$001C
                LDA   [$0A],Y
                STA   L0311BE
                TAX
                AND   #$2080
                BEQ   L03106A
                BRL   L0311BD
L03106A         TXA
                ORA   #$3000
                STA   [$0A],Y
                LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                INC
                STA   L030BE4
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L0310B1
                TXA
                AND   #$3000
                BNE   L0310AE
                LDA   $8E
                LDY   #$0004
                CLC
                ADC   [$0A],Y
                TAX
                LDA   $90
                INY
                INY
                ADC   [$0A],Y
                TAY
                TXA
                TYX
                LDY   #$0018
                ADC   [$0A],Y
                STA   $8E
                TXA
                INY
                INY
                ADC   [$0A],Y
                STA   $90
                INC   $8C
L0310AE         BRL   L03116D
L0310B1         LDX   #$0020
L0310B4         STZ   L0311BE,X
                DEX
                DEX
                BNE   L0310B4
                LDY   #$001E
L0310BE         LDA   [$0A]
                AND   #$FF00
                BEQ   L0310EA
                XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L0310CF
                INC   $0C
L0310CF         LDA   [$0A],Y
                AND   #$00FF
                CMP   L030BE4
                BCS   L0310BE
L0310D9         LDA   [$0A]
                AND   #$00FF
                CLC
                SBC   $0A
                EOR   #$FFFF
                STA   $0A
                BCC   L0310EA
                DEC   $0C
L0310EA         LDY   #$001C
                LDA   [$0A],Y
                BIT   #$0080
                BNE   L03112C
                PHA
                ORA   #$3000
                STA   [$0A],Y
                PLA
                AND   #$3000
                BNE   L03112C
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L03112C
                LDA   $8E
                LDY   #$0004
                CLC
                ADC   [$0A],Y
                TAX
                LDA   $90
                INY
                INY
                ADC   [$0A],Y
                TAY
                TXA
                TYX
                LDY   #$0018
                ADC   [$0A],Y
                STA   $8E
                TXA
                INY
                INY
                ADC   [$0A],Y
                STA   $90
                INC   $8C
L03112C         LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                TAX
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BNE   L03115B
                LDY   #$002A
                LDA   L0311C0,X
                STA   [$0A],Y
                BNE   L031153
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$EFFF
                STA   [$0A],Y
L031153         STZ   L0311C0,X
                CPX   L030BE4
                BCC   L031162
L03115B         DEX
                INC   L0311C0,X
                BRL   L0310D9
L031162         LDA   [$2E]
                STA   $0A
                LDY   #$0002
                LDA   [$2E],Y
                STA   $0C
L03116D         LDA   L0311BE
                AND   #$1000
                BNE   L0311BD
L031175         LDA   L030BE4
                DEC
                CMP   #$0001
                BEQ   L0311BD
                STA   L030BE4
                LDY   #$001E
L031184         LDA   [$0A]
                AND   #$00FF
                CLC
                SBC   $0A
                EOR   #$FFFF
                STA   $0A
                BCC   L031195
                DEC   $0C
L031195         LDA   [$0A],Y
                AND   #$00FF
                CMP   L030BE4
                BCS   L031184
                LDY   #$002A
                LDA   [$0A],Y
                INC
                STA   [$0A],Y
                DEC
                BNE   L0311BD
                LDY   #$001C
                LDA   [$0A],Y
                PHA
                ORA   #$1000
                STA   [$0A],Y
                PLA
                AND   #$3000
                BNE   L0311BB
L0311BB         BRA   L031175
L0311BD         RTS

L0311BE         DB    $00
                DB    $00
L0311C0         DB    $00
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
L031200         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $07,S
                STA   $36
                LDA   $09,S
                STA   $38
                LDA   $11,S
                STA   $4A
                LDA   $13,S
                STA   $4C
                LDA   $0D,S
                STA   $4E
                LDA   $0F,S
                STA   $50
                LDA   $0B,S
                STA   L0312FF
                LDA   $15,S
                STA   $22
                LDA   $17,S
                STA   $24
                PLA
                STA   $13,S
                PLA
                STA   $13,S
                TSC
                CLC
                ADC   #$0010
                TCS
                LDA   #$8000
                STA   L030BC0
                LDA   [$26]
                STA   $2A
                LDY   #$0002
                LDA   [$26],Y
                STA   $2C
                LDA   $2A
                CLC
                ADC   #$0004
                STA   $2E
                LDA   $2C
                BCC   L031259
                INC
L031259         STA   $30
                LDX   L030BD0
                BEQ   L0312B9
                STX   L0312FD
                LDA   L0312FF
                CMP   #$0003
                BNE   L03126E
                BRL   L0312E0
L03126E         LDA   [$2E]
                AND   #$0080
                BEQ   L0312A8
                STZ   L030BC0
                LDA   $2E
                SEC
                SBC   #$0004
                STA   $2E
                BCS   L031284
                DEC   $30
L031284         LDA   [$2E]
                STA   $0A
                LDY   #$0002
                LDA   [$2E],Y
                STA   $0C
                LDA   L0312FF
                BEQ   L031299
                JSR   L031059
                BRA   L03129C
L031299         JSR   L030F0D
L03129C         LDA   $2E
                CLC
                ADC   #$0004
                STA   $2E
                BCC   L0312A8
                INC   $30
L0312A8         LDA   $2E
                CLC
                ADC   #$0005
                STA   $2E
                BCC   L0312B4
                INC   $30
L0312B4         DEC   L0312FD
                BNE   L03126E
L0312B9         LDA   L030BC0
                STA   [$22]
                TAX
                LDA   $8C
                STA   [$4A]
                LDA   $8E
                STA   [$4E]
                LDA   $90
                LDY   #$0002
                STA   [$4E],Y
                LDA   $2A
                STA   [$36]
                LDA   $2C
                STA   [$36],Y
                LDA   L030BBC
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L0312E0         LDA   [$2E]
                ORA   #$0080
                STA   [$2E]
                LDA   $2E
                CLC
                ADC   #$0005
                STA   $2E
                BCC   L0312F3
                INC   $30
L0312F3         DEC   L0312FD
                BNE   L0312E0
                STZ   L030BC0
                BRA   L0312B9
L0312FD         DW    $0000
L0312FF         DW    $0000
L031301         LDA   [$2E]
                STA   $0A
                LDY   #$0002
                LDA   [$2E],Y
                STA   $0C
L03130C         LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L031352
                LDY   #$0004
                LDA   [$0A],Y
                CLC
                ADC   L030BDE
                STA   L030BDE
                INY
                INY
                LDA   [$0A],Y
                ADC   L030BE0
                STA   L030BE0
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$0800
                BEQ   L03134C
                LDY   #$0018
                LDA   [$0A],Y
                CLC
                ADC   L030BDE
                STA   L030BDE
                INY
                INY
                LDA   [$0A],Y
                ADC   L030BE0
                STA   L030BE0
L03134C         INC   L030BE2
                BRL   L0313CB
L031352         LDY   #$001C
                LDA   [$0A],Y
                AND   #$4000
                BNE   L0313CB
                LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                INC
                STA   L030BE4
L031368         LDA   [$0A]
                AND   #$FF00
                BEQ   L0313CB
                XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L031379
                INC   $0C
L031379         LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                CMP   L030BE4
                BCC   L0313CB
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L0313C9
                LDY   #$0004
                LDA   [$0A],Y
                CLC
                ADC   L030BDE
                STA   L030BDE
                INY
                INY
                LDA   [$0A],Y
                ADC   L030BE0
                STA   L030BE0
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$0800
                BEQ   L0313C6
                LDY   #$0018
                LDA   [$0A],Y
                CLC
                ADC   L030BDE
                STA   L030BDE
                INY
                INY
                LDA   [$0A],Y
                ADC   L030BE0
                STA   L030BE0
L0313C6         INC   L030BE2
L0313C9         BRA   L031368
L0313CB         RTS

L0313CC         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $07,S
                STA   $3E
                LDA   $09,S
                STA   $40
                LDA   $0B,S
                STA   $42
                LDA   $0D,S
                STA   $44
                LDA   $0F,S
                STA   $46
                LDA   $11,S
                STA   $48
                LDA   $13,S
                STA   $22
                LDA   $15,S
                STA   $24
                LDA   $17,S
                STA   L0315A4
                PLA
                STA   $13,S
                PLA
                STA   $13,S
                TSC
                CLC
                ADC   #$0010
                TCS
                LDA   #$8000
                STA   L030BC0
                STZ   L030BDE
                STZ   L030BE0
                STZ   L030BE2
                LDA   [$26]
                STA   $2A
                LDY   #$0002
                LDA   [$26],Y
                STA   $2C
                LDA   $2A
                CLC
                ADC   #$0004
                STA   $2E
                LDA   $2C
                BCC   L03142E
                INC
L03142E         STA   $30
                LDX   L030BD0
                BNE   L031438
                BRL   L0314BC
L031438         STX   L0315A2
                LDA   L0315A4
                BEQ   L031481
                STZ   L030BC0
                JSR   L030C6A
                LDA   [$2E]
                STA   $0A
                LDY   #$0002
                LDA   [$2E],Y
                STA   $0C
                LDA   L0315A4
                DEC
                BEQ   L03145A
                BRL   L0314D9
L03145A         LDY   #$0002
                LDA   [$0A],Y
                STA   [$3E]
                LDA   $42
                SEC
                SBC   #$0010
                STA   $42
                BCS   L03146D
                DEC   $44
L03146D         LDY   #$0016
L031470         LDA   [$0A],Y
                STA   [$42],Y
                DEY
                DEY
                CPY   #$000E
                BNE   L031470
                JSR   L031301
                BRL   L0314BC
L031481         LDA   [$2E]
                AND   #$0080
                BEQ   L0314A6
                STZ   L030BC0
                LDA   $2E
                SEC
                SBC   #$0004
                STA   $2E
                BCS   L031497
                DEC   $30
L031497         JSR   L031301
                LDA   $2E
                CLC
                ADC   #$0004
                STA   $2E
                BCC   L0314A6
                INC   $30
L0314A6         LDA   $2E
                CLC
                ADC   #$0005
                STA   $2E
                BCC   L0314B2
                INC   $30
L0314B2         DEC   L0315A2
                BNE   L031481
                LDA   L030BE2
                STA   [$3E]
L0314BC         LDA   L030BDE
                STA   [$46]
                LDY   #$0002
                LDA   L030BE0
                STA   [$46],Y
L0314C9         LDA   L030BC0
                STA   [$22]
                TAX
                LDA   L030BBC
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L0314D9         LDY   #$001C
                LDA   [$0A],Y
                BIT   #$0080
                BNE   L0314EA
                LDA   #$0000
                STA   [$3E]
                BRA   L0314C9
L0314EA         LDY   #$0022
                LDA   [$0A],Y
                STA   L0315AA
                STA   [$3E]
                PHA
                PHA
                PEA   $8020
                PEA   $07FF
                PHA
                _LoadResource
                PLX
                STX   $7C
                PLX
                STX   $7E
                BCC   L031530
                LDA   L0315AA
                PHA
                PEA   ^L031611+$11
                PEA   L031611+$11
                PEA   $0002
                _Int2Hex
                LDA   #L031611
                STA   [$46]
                LDA   #^L031611
                LDY   #$0002
                STA   [$46],Y
                BRL   L0314C9
L031530         LDY   #$0002
                LDA   [$7C]
                STA   $66
                LDA   [$7C],Y
                STA   $68
                LDY   #$FFFF
                SEP   #$20
L031540         INY
                LDA   [$66],Y
                CMP   #$41
                BCC   L031540
                CMP   #$5B
                BCS   L031540
                STY   L0315A6
                DEY
                LDA   [$66],Y
L031551         INY
                CMP   [$66],Y
                BNE   L031551
                STY   L0315A8
                REP   #$20
                TYA
                SEC
                SBC   L0315A6
                CMP   #$0064
                BCC   L031568
                LDA   #$0064
L031568         STA   L0315AC
                TAX
                CLC
                ADC   L0315A6
                TAY
                SEP   #$20
L031573         DEY
                LDA   [$66],Y
                STA   L0315AC,X
                DEX
                BNE   L031573
                REP   #$20
                PEA   $0003
                PEA   $8020
                PEA   $07FF
                LDA   L0315AA
                PHA
                _ReleaseResource
                LDA   #L0315AC
                STA   [$46]
                LDA   #^L0315AC
                LDY   #$0002
                STA   [$46],Y
                BRL   L0314C9
L0315A2         DB    $00
                DB    $00
L0315A4         DB    $00
                DB    $00
L0315A6         DB    $00
                DB    $00
L0315A8         DB    $00
                DB    $00
L0315AA         DB    $00
                DB    $00
L0315AC         DB    $00
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
L031611         STR   'Unknown error ($'0000').'
L031626         LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L031636
                SEC
                ROR   L03171F
                BRA   L031669
L031636         STZ   L03171F
                LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                INC
                STA   L031721
L031645         LDA   [$0A]
                AND   #$FF00
                BNE   L03164F
                BRL   L03171E
L03164F         XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L031659
                INC   $0C
L031659         LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
                CMP   L031721
                BCS   L031669
                BRL   L03171E
L031669         LDY   #$0002
                LDA   [$0A],Y
                STA   L031729
                STZ   L031723
                LDA   L03181F
                LSR
                STA   L03172B
                LDA   #$FFFE
                STA   L031725
                STA   L031727
L031684         LDY   L031725
                INY
                INY
                STY   L031725
                CPY   #$0006
                BEQ   L0316F2
                LDA   [$5A],Y
                BEQ   L0316CD
                TAX
                LDY   L031727
                INY
                INY
                LDA   [$5E],Y
                STA   $62
                INY
                INY
                STY   L031727
                LDA   [$5E],Y
                STA   $64
                CPX   #$0004
                BNE   L0316B6
                LDA   L031729
                CMP   $62
                BEQ   L0316D5
                BRA   L0316DA
L0316B6         TXA
                BIT   #$0018
                BEQ   L0316C3
                JSR   L031825
                BCC   L0316D5
                BRA   L0316DA
L0316C3         AND   #$0003
                JSR   L03186C
                BCS   L0316DA
                BRA   L0316D5
L0316CD         LDA   #$8000
                ROL   L03172B
                BRA   L0316EA
L0316D5         LDA   #$8000
                BRA   L0316DD
L0316DA         LDA   #$0000
L0316DD         ROL   L03172B
                BCS   L0316EA
                ORA   L031723
                STA   L031723
                BRA   L031684
L0316EA         AND   L031723
                STA   L031723
                BRA   L031684
L0316F2         LDA   L031723
                BEQ   L031716
                LDA   $0A
                STA   $78
                LDA   $0C
                STA   $7A
                LDA   $09,S
                AND   #$0001
                BEQ   L03170B
                JSR   L031059
                BRA   L03170E
L03170B         JSR   L030F0D
L03170E         LDA   $78
                STA   $0A
                LDA   $7A
                STA   $0C
L031716         LDA   L03171F
                BNE   L03171E
                BRL   L031645
L03171E         RTS

L03171F         DB    $00
                DB    $00
L031721         DB    $00
                DB    $00
L031723         DB    $00
                DB    $00
L031725         DB    $00
                DB    $00
L031727         DB    $00
                DB    $00
L031729         DB    $00
                DB    $00
L03172B         DB    $00
                DB    $00
L03172D         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $09,S
                STA   $5A
                LDA   $0B,S
                STA   $5C
                LDA   $0D,S
                STA   $5E
                LDA   $0F,S
                STA   $60
                LDA   $15,S
                STA   $4A
                LDA   $17,S
                STA   $4C
                LDA   $11,S
                STA   $4E
                LDA   $13,S
                STA   $50
                LDY   #$0002
                LDA   [$26],Y
                STA   $2C
                LDA   [$26]
                STA   $2A
                LDA   $07,S
                TAX
                AND   #$F800
                STA   L03181F
                TXA
                AND   #$0002
                BNE   L031791
                LDA   [$1A]
                STA   $06
                LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                ADC   #$0000
                STA   $0C
                JSR   L031626
                BRL   L0317FA
L031791         LDA   #$8000
                STA   L031821
                LDA   [$26]
                STA   $2A
                LDY   #$0002
                LDA   [$26],Y
                STA   $2C
                LDA   $2A
                CLC
                ADC   #$0004
                STA   $2E
                LDA   $2C
                BCC   L0317AF
                INC
L0317AF         STA   $30
                LDX   L030BD0
                BEQ   L0317FA
                STX   L031823
L0317B9         LDA   [$2E]
                AND   #$0080
                BEQ   L0317E9
                STZ   L031821
                LDA   $2E
                SEC
                SBC   #$0004
                STA   $2E
                BCS   L0317CF
                DEC   $30
L0317CF         LDA   [$2E]
                STA   $0A
                LDY   #$0002
                LDA   [$2E],Y
                STA   $0C
                JSR   L031626
                LDA   $2E
                CLC
                ADC   #$0004
                STA   $2E
                BCC   L0317E9
                INC   $30
L0317E9         LDA   $2E
                CLC
                ADC   #$0005
                STA   $2E
                BCC   L0317F5
                INC   $30
L0317F5         DEC   L031823
                BNE   L0317B9
L0317FA         LDA   $8C
                STA   [$4A]
                LDA   $8E
                STA   [$4E]
                LDA   $90
                LDY   #$0002
                STA   [$4E],Y
                PLA
                STA   $13,S
                PLA
                STA   $13,S
                TSC
                CLC
                ADC   #$0010
                TCS
                LDA   L030BBC
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L03181F         DB    $00
                DB    $00
L031821         DB    $00
                DB    $00
L031823         DB    $00
                DB    $00
L031825         CMP   #$0009
                ROR   L03186A
                LDA   $0A
                CLC
                ADC   #$0010
                STA   $12
                LDA   $0C
                BCC   L031838
                INC
L031838         STA   $14
                SEP   #$20
                LDY   #$0003
                LDA   [$12],Y
                CMP   [$62],Y
                REP   #$20
                BCC   L031862
                BNE   L03185D
                LDY   #$0004
                LDA   [$12],Y
                CMP   [$62],Y
                BCC   L031862
                BNE   L03185D
                LDY   #$0001
                LDA   [$12],Y
                CMP   [$62],Y
                BCC   L031862
L03185D         LDA   #$0000
                BRA   L031865
L031862         LDA   #$8000
L031865         EOR   L03186A
                ASL
                RTS

L03186A         DW    $0000
L03186C         TAX
                LDA   $0A
                CLC
                ADC   #$002E
                STA   $12
                LDA   $0C
                BCC   L03187A
                INC
L03187A         STA   $14
                LDA   #$0000
                SEP   #$20
                LDA   [$12]
                STA   L031909
                CMP   [$62]
                BCS   L03188C
                BRA   L031905
L03188C         DEX
                BEQ   L0318CB
                DEX
                BEQ   L0318DF
                LDX   $12
                STX   L0318AF+1
                LDX   $13
                STX   L0318AF+2
                LDA   [$62]
                BEQ   L031905
                STA   L03190D
                LDA   L031909
                STA   L03190B
                TAX
L0318AA         LDY   L03190D
L0318AD         LDA   [$62],Y
L0318AF         EORL  $000000,X
                AND   #$DF
                BNE   L0318BD
                DEX
                DEY
                BEQ   L031902
                BRA   L0318AD
L0318BD         LDX   L03190B
                DEX
                STX   L03190B
                CPX   L03190D
                BCS   L0318AA
                BRA   L031905
L0318CB         LDA   [$62]
                BEQ   L0318DD
                TAY
L0318D0         LDA   [$62],Y
                EOR   [$12],Y
                AND   #$DF
                BNE   L0318DD
                DEY
                BNE   L0318D0
                BRA   L031902
L0318DD         BRA   L031905
L0318DF         LDA   L031909
                SEC
                SBC   [$62]
                CLC
                ADC   $12
                STA   $12
                BCC   L0318EE
                INC   $14
L0318EE         LDA   [$62]
                BEQ   L031900
                TAY
L0318F3         LDA   [$62],Y
                EOR   [$12],Y
                AND   #$DF
                BNE   L031900
                DEY
                BNE   L0318F3
                BRA   L031902
L031900         BRA   L031905
L031902         CLC
                BRA   L031906
L031905         SEC
L031906         REP   #$20
                RTS

L031909         DB    $00
                DB    $00
L03190B         DB    $00
                DB    $00
L03190D         DB    $00
                DB    $00
                DB    $00
                DB    $00
L031911         STA   L03193D
                LDY   #$001C
                LDX   #$0000
L03191A         LDA   [$0A]
                AND   #$FF00
                BNE   L031923
                SEC
                RTS

L031923         XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L03192D
                INC   $0C
L03192D         LDA   [$0A],Y
                AND   #$3000
                CMP   #$0001
                TXA
                ADC   L03193D
                BNE   L03191A
                CLC
                RTS

L03193D         DW    $0000
L03193F         LDA   $8C
                BNE   L031973
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                BCC   L031950
                INC
L031950         STA   $0C
                LDA   [$0A]
                XBA
                AND   #$00FF
                BNE   L03195F
                LDY   #$000E
                LDA   [$0A],Y
L03195F         STA   L031ADC
                CLC
                ADC   $0A
                STA   L031AE0
                LDA   $0C
                ADC   #$0000
                STA   L031AE2
                BRL   L031A66
L031973         LDY   #$0008
                CMP   [$06],Y
                BNE   L03197C
                CLC
                RTS

L03197C         LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                BCC   L031989
                INC
L031989         STA   $0C
                STZ   L031ACE
                LDA   #$0000
                JSR   L031911
                BCC   L031997
                RTS

L031997         LDA   $0A
                STA   L031AD0
                LDA   $0C
                STA   L031AD2
                LDA   [$0A]
                STA   L031ADE
L0319A6         LDA   #$FFFF
                JSR   L031911
                BCC   L0319C9
                INC   L031ACE
                LDA   L031AD0
                STA   L031AE0
                LDA   L031AD2
                STA   L031AE2
                LDA   L031ADE
                AND   #$00FF
                STA   L031ADC
                BRL   L031A66
L0319C9         LDA   $0A
                STA   L031AD4
                LDA   $0C
                STA   L031AD6
                LDA   L031ADE
                SEP   #$20
                STA   [$0A]
                REP   #$20
                LDA   #$0000
                JSR   L031911
                BCC   L031A08
                INC   L031ACE
                LDY   #$002E
                LDA   [$0A],Y
                AND   #$00FF
                CLC
                ADC   #$002F
                STA   L031ADC
                CLC
                ADC   $0A
                STA   $0A
                STA   L031AE0
                LDA   $0C
                BCC   L031A03
                INC
L031A03         STA   $0C
                STA   L031AE2
L031A08         LDA   $0A
                SEC
                SBC   L031AD4
                STA   L031AD8
                LDA   $0C
                SBC   L031AD6
                STA   L031ADA
                LDA   L031AD6
                PHA
                LDA   L031AD4
                PHA
                LDA   L031AD2
                PHA
                LDA   L031AD0
                PHA
                LDA   L031ADA
                PHA
                LDA   L031AD8
                PHA
                _BlockMove
                LDA   L031AD0
                CLC
                ADC   L031AD8
                STA   L031AD0
                LDA   L031AD2
                ADC   L031ADA
                STA   L031AD2
                LDA   L031ACE
                BEQ   L031A5E
                LDA   L031AD0
                STA   L031AE0
                LDA   L031AD2
                STA   L031AE2
                BRA   L031A66
L031A5E         LDA   [$0A]
                STA   L031ADE
                BRL   L0319A6
L031A66         LDA   L031AE0
                SEC
                SBC   $06
                STA   $92
                TAX
                LDA   L031AE2
                SBC   $08
                STA   $94
                TAY
                TXA
                SEC
                SBC   L031ADC
                TAX
                TYA
                BCS   L031A81
                DEC
L031A81         LDY   #$000C
                STA   [$06],Y
                DEY
                DEY
                TXA
                STA   [$06],Y
                LDY   #$000E
                LDA   L031ADC
                STA   [$06],Y
                LDA   $8C
                LDY   #$0008
                STA   [$06],Y
                LDA   L031AE0
                SEC
                SBC   L031ADC
                STA   $0A
                LDA   L031AE2
                BCS   L031AA9
                DEC
L031AA9         STA   $0C
                LDA   [$0A]
                AND   #$00FF
                STA   [$0A]
                LDY   #$0006
                LDA   $94
                PHA
                STA   [$06],Y
                LDA   $92
                PHA
                DEY
                DEY
                STA   [$06],Y
                PEI   $1C
                PEI   $1A
                _SetHandleSize
                CLC
                RTS

L031ACE         DB    $00
                DB    $00
L031AD0         DB    $00
                DB    $00
L031AD2         DB    $00
                DB    $00
L031AD4         DB    $00
                DB    $00
L031AD6         DB    $00
                DB    $00
L031AD8         DB    $00
                DB    $00
L031ADA         DB    $00
                DB    $00
L031ADC         DB    $00
                DB    $00
L031ADE         DB    $00
                DB    $00
L031AE0         DB    $00
                DB    $00
L031AE2         DB    $00
                DB    $00
L031AE4         STAL  $FF0100
                PHB
                PHK
                PLB
                TDC
                STA   L031B59
                LDA   $07,S
                TCD
                PLA
                STA   $03,S
                PLA
                STA   $03,S
                TSC
                CLC
                ADC   #$0000
                TCS
                LDA   [$1A]
                STA   $06
                LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                JSR   L03193F
                STZ   L030BDE
                STZ   L030BE0
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                BCC   L031B1F
                INC
L031B1F         STA   $0C
                JSR   L03130C
                LDY   #$01B2
                LDA   L030BDE
                STA   [$06],Y
                LDA   L030BE0
                INY
                INY
                STA   [$06],Y
                LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                ADC   #$0000
                STA   $0C
                JSR   L030F0D
                LDA   #$0060
                LDY   #$0010
                STA   [$06],Y
                LDA   L031B59
                TCD
                LDA   #$0000
                PLB
                CMP   #$0001
                RTL

L031B59         DW    $0000
L031B5B         PHB
                PHK
                PLB
                STZ   L030BDE
                STZ   L030BE0
                JSR   L03130C
                LDA   L030BDE
                LDX   L030BE0
                PLB
                RTL

L031B6F         PHA
                BIT   L033036
                BMI   L031BD5
                SEP   #$30
                LDX   L031C2F
L031B7A         LDA   L031C2F,X
                STA   L0339C6,X
                DEX
                BNE   L031B7A
                REP   #$20
                LDAL  L0301D1
                DEC
                STA   $78
                TAX
                SEP   #$20
L031B8F         DEX
                LDAL  L0301D2,X
                CMP   #$3A
                BEQ   L031B9A
                BRA   L031B8F
L031B9A         LDY   L031C2F
L031B9D         INX
                LDAL  L0301D2,X
                STA   L0339C7,Y
                INY
                CPX   $78
                BNE   L031B9D
                LDX   #$00
L031BAC         LDA   L031C4C+1,X
                STA   L0339C7,Y
                INY
                INX
                CPX   L031C4C
                BNE   L031BAC
                STY   L0339C6
                REP   #$30
                LDA   #$0004
                LDX   #L0339C6
                JSR   L033456
                TAX
                BNE   L031BD5
                JSR   L0334CD
                BCS   L031BD5
                SEC
                PLA
                LDA   #$8010
                RTS

L031BD5         INC   L030BE8
                LDY   #$001C
                LDA   [$0A],Y
                ORA   #$0080
                STA   [$0A],Y
                LDY   #$0022
                LDA   $01,S
                STA   [$0A],Y
                LDA   $0A
                STA   $78
                LDA   $0C
                STA   $7A
                LDY   #$001E
                LDA   [$0A],Y
                AND   #$00FF
L031BF9         STA   L030BE4
                DEC
                BEQ   L031C2D
L031BFF         LDA   [$78]
                AND   #$00FF
                CLC
                SBC   $78
                EOR   #$FFFF
                STA   $78
                BCC   L031C10
                DEC   $7A
L031C10         LDA   [$78],Y
                AND   #$00FF
                CMP   L030BE4
                BCS   L031BFF
                LDY   #$001C
                LDA   [$78],Y
                ORA   #$0040
                STA   [$78],Y
                LDY   #$001E
                LDA   L030BE4
                DEC
                BRA   L031BF9
L031C2D         PLA
                RTS

L031C2F         STR   'Can'27't read the file/folder "'
L031C4C         STR   '."  It will not be backed up.'
L031C6A         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $07,S
                STA   $88
                LDA   $09,S
                STA   $8A
                LDA   $0B,S
                STA   $80
                LDA   $0D,S
                STA   $82
                PLA
                STA   $09,S
                PLA
                STA   $09,S
                TSC
                CLC
                ADC   #$0006
                TCS
                LDA   [$88]
                STA   $78
                LDY   #$0002
                LDA   [$88],Y
                STA   $7A
                LDY   #$001C
                LDA   [$78],Y
                STA   $52
                INY
                INY
                LDA   [$78],Y
                STA   $54
                LDA   [$52]
                STA   $78
                LDY   #$0002
                LDA   [$52],Y
                STA   $7A
                LDY   #$0004
                LDA   [$78],Y
                STA   [$80]
                TAX
                DEY
                DEY
                LDA   [$78],Y
                STA   $7E
                LDA   [$78]
                STA   $7C
                LDA   [$7C]
                STA   $78
                LDA   [$7C],Y
                STA   $7A
                INC   $80
                BNE   L031CD3
                INC   $82
L031CD3         SEP   #$20
                TXY
L031CD6         DEY
                BMI   L031CDF
                LDA   [$78],Y
                STA   [$80],Y
                BRA   L031CD6
L031CDF         REP   #$21
                LDA   L030BBC
                TCD
                PLB
                RTL

L031CE7         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0600
                STA   L030BEA
                LDA   $13,S
                STA   $22
                LDA   $15,S
                STA   $24
                LDA   $0D,S
                STA   $12
                LDA   $0F,S
                STA   $14
                LDA   $09,S
                STA   $80
                LDA   $0B,S
                STA   $82
                LDA   $17,S
                STA   $84
                LDA   $19,S
                STA   $86
                LDA   $11,S
                STA   L030BEC
                PLA
                STA   $15,S
                PLA
                STA   $15,S
                TSC
                CLC
                ADC   #$0012
                TCS
                STZ   L030BC0
                STZ   L030BEE
                LDA   L030BEC
                LSR
                BCC   L031D9B
                LDA   #$0001
                STA   [$02]
                LDA   $12
                LDY   #$0002
                STA   [$02],Y
                LDA   $14
                INY
                INY
                STA   [$02],Y
                LDA   #$2002
                JSR   L033500
                BCC   L031D58
                CMP   #$0046
                BEQ   L031D58
                BRL   L031F1A
L031D58         LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   $12
                STA   [$02],Y
                LDA   $14
                INY
                INY
                STA   [$02],Y
                INY
                INY
                LDA   #$00E3
                STA   [$02],Y
                INY
                INY
                LDA   L030BEC
                ASL
                TAX
                LDAL  L061242,X
                STA   [$02],Y
                INY
                INY
                TXA
                ASL
                TAX
                LDAL  L06124A,X
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2001
                JSR   L033500
                BCC   L031D9B
                BRL   L031F1A
L031D9B         LDA   #$0002
                STA   [$02]
                LDY   #$0004
                LDA   $12
                STA   [$02],Y
                LDA   $14
                INY
                INY
                STA   [$02],Y
                LDA   #$2010
                JSR   L033500
                BCC   L031DB8
                BRL   L031F1A
L031DB8         LDY   #$0002
                LDA   [$02],Y
                STA   L030BEE
                LDY   #$0002
                STA   [$02],Y
                LDA   #$0004
                STA   [$02]
                LDA   L030BEC
                BNE   L031DD2
                BRL   L031E7F
L031DD2         DEC
                BEQ   L031E17
                DEC
                BEQ   L031DF7
                LDY   #$0004
                LDA   #L060002
                STA   [$02],Y
                INY
                INY
                LDA   #^L060002
                STA   [$02],Y
                INY
                INY
                LDA   #$0004
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                BRA   L031E74
L031DF7         LDY   #$0004
                LDA   #L060002
                STA   [$02],Y
                INY
                INY
                LDA   #^L060002
                STA   [$02],Y
                INY
                INY
                LDA   #$0004
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                BRL   L031F14
L031E17         LDY   #$0004
                TDC
                CLC
                ADC   #$008C
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                LDA   #$0006
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2013
                JSR   L033500
                BCC   L031E41
L031E3E         BRL   L031F1A
L031E41         LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                TAX
                LDA   [$1A]
                STA   $06
                LDY   #$0004
                STA   [$02],Y
                INY
                INY
                TXA
                STA   [$02],Y
                LDY   #$000C
                LDA   [$06],Y
                TAX
                DEY
                DEY
                LDA   [$06],Y
                LDY   #$000E
                CLC
                ADC   [$06],Y
                BCC   L031E6A
                INX
L031E6A         LDY   #$0008
                STA   [$02],Y
                INY
                INY
                TXA
                STA   [$02],Y
L031E74         LDA   #$2013
                JSR   L033500
                BCS   L031E3E
                BRL   L031F1D
L031E7F         LDY   #$0002
                LDA   L030BEE
                STA   [$02],Y
                LDA   #$0002
                STA   [$02]
                LDA   #$2019
                JSR   L033500
                BCC   L031E97
                BRL   L031F1A
L031E97         LDY   #$0006
                LDA   [$02],Y
                TAX
                DEY
                DEY
                LDA   [$02],Y
                SEC
                SBC   #$0006
                BCS   L031EA8
                DEX
L031EA8         STA   $92
                STX   $94
                TXY
                TAX
                TYA
                LDY   L030BEA
                JSR   L0325E6
                BCC   L031EBA
                BRL   L031F1A
L031EBA         STX   $1A
                STY   $1C
                LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L030BEE
                STA   [$02],Y
                INY
                INY
                TDC
                CLC
                ADC   #$008C
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                LDA   #$0006
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                BCC   L031EF3
                BRA   L031F1A
L031EF3         LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                LDY   #$0006
                STA   [$02],Y
                LDA   [$1A]
                STA   $06
                DEY
                DEY
                STA   [$02],Y
                LDA   $92
                LDY   #$0008
                STA   [$02],Y
                INY
                INY
                LDA   $94
                STA   [$02],Y
L031F14         LDA   #$2012
                JSR   L033500
L031F1A         STA   L030BC0
L031F1D         LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L030BEE
                BEQ   L031F3C
                STA   [$02],Y
                LDA   #$2014
                JSR   L033500
                BCC   L031F3C
                LDX   L030BC0
                BNE   L031F3C
                STA   L030BC0
L031F3C         LDA   L030BEC
                BNE   L031F9B
                LDA   $06
                CLC
                ADC   #$01E4
                STA   $78
                LDA   $08
                ADC   #$0000
                STA   $7A
                LDA   [$78]
                AND   #$00FF
                TAY
                SEP   #$20
L031F58         LDA   [$78],Y
                STA   [$80],Y
                DEY
                BPL   L031F58
                REP   #$20
                LDY   #$0000
                LDA   L030BC0
                STA   [$84],Y
                LDY   #$0008
                LDA   [$06],Y
                LDY   #$0002
                STA   [$84],Y
                LDY   #$01B2
                LDA   [$06],Y
                TAX
                INY
                INY
                LDA   [$06],Y
                LDY   #$0006
                STA   [$84],Y
                TXA
                DEY
                DEY
                STA   [$84],Y
                LDA   $8E
                LDY   #$0008
                STA   [$84],Y
                LDA   $90
                INY
                INY
                STA   [$84],Y
                LDA   $8C
                LDY   #$000C
                STA   [$84],Y
L031F9B         LDA   L030BC0
                STA   [$22]
                CMP   #$0001
                LDA   L030BBC
                TCD
                PLB
                RTL

L031FA9         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L030BBC
                LDA   $05,S
                TCD
                LDA   $09,S
                STA   $46
                LDA   $0B,S
                STA   $48
                LDA   $0D,S
                STA   $22
                LDA   $0F,S
                STA   $24
                LDA   $07,S
                STA   L0320A4
                PLA
                STA   $0B,S
                PLA
                STA   $0B,S
                TSC
                CLC
                ADC   #$0008
                TCS
                STZ   L030BC0
                LDA   L0320A4
                STA   L032128
                PEA   ^L032126
                PEA   L032126
                PEA   $202D             ; DStatus
                JSL   GSOS2
                BCC   L031FF2
                STA   L030BC0
                BRL   L032094
L031FF2         LDA   L032134
                CMP   #$0018
                BCS   L032046
L031FFA         LDA   #$0008
                STA   [$02]
                LDY   #$0002
                LDA   L0320A4
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                LDA   #$202C
                JSR   L033500
                BCS   L032040
                LDY   #$0014
                LDA   [$02],Y
                CMP   #$0020
                BNE   L03202B
                LDY   #$0028
                STZ   $78
                BRA   L032073
L03202B         LDY   #$000C
                LDA   [$02],Y
                TAX
                DEY
                DEY
                ORA   [$02],Y
                BEQ   L032040
                LDA   [$02],Y
                STX   $78
                LSR   $78
                ROR
                BRA   L03207D
L032040         DEC   L030BC0
                BRL   L032094
L032046         LDA   L0320A6+4
                BEQ   L031FFA
                ASL
                DEC
                ASL
                ASL
                ASL
                TAX
                CMP   #$0090
                BCS   L031FFA
                STZ   $78
                LDA   L0320A6+$E,X
                TAY
                LDA   L0320A6+4,X
                AND   #$000C
                BEQ   L03208B
                EOR   #$0008
                BEQ   L032073
                EOR   #$0004
                BNE   L032088
                LDX   #$0014
                BRA   L032076
L032073         LDX   #$000A
L032076         TYA
L032077         ASL
                ROL   $78
                DEX
                BNE   L032077
L03207D         STA   [$46]
                LDA   $78
                LDY   #$0002
                STA   [$46],Y
                BRA   L032094
L032088         TYA
                BRA   L03207D
L03208B         LDX   #$000A
L03208E         LSR
                DEX
                BNE   L03208E
                BRA   L03207D
L032094         LDA   L030BC0
                STA   [$22]
                TAX
                LDA   L030BBC
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L0320A4         DB    $00
                DB    $00
L0320A6         HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
L032126         DW    $0005             ; Parms for DStatus
L032128         DW    $0000             ;  device num
                DW    $0003             ;  status code
                ADRL  L0320A6           ;  status list
                ADRL  $00000080         ;  request count
L032134         ADRL  $00000000         ;  transfer count
L032138         DB    $00
                DB    $00
L03213A         DB    $00
                DB    $00
L03213C         STX   $05
                BCS   L032157
                LDY   #$FFFF
                LDX   #$003F
L032146         TYA
                STA   L032357,X
                STA   L032357+1,X
                TXA
                SEC
                SBC   #$0009
                TAX
                BPL   L032146
                BRA   L032174
L032157         LDX   #$003F
                LDY   #$0015
L03215D         LDA   L032357+$48,Y
                STA   L032357,X
                LDA   L032357+$49,Y
                STA   L032357+1,X
                DEY
                DEY
                DEY
                TXA
                SEC
                SBC   #$0009
                TAX
                BPL   L03215D
L032174         LDY   #$0000
                TYX
L032178         LDA   ($05),Y
                STA   L032357+3,X
                INY
                INY
                LDA   ($05),Y
                STA   L032357+5,X
                INY
                INY
                LDA   ($05),Y
                STA   L032357+7,X
                INY
                INY
                TXA
                CLC
                ADC   #$0009
                TAX
                CPX   #$0048
                BNE   L032178
                LDY   #$001C
                LDA   [$01],Y
                AND   #$0080
                BEQ   L0321BF
                LDX   #$003F
                LDY   #$0015
L0321A8         LDA   L032357+$180,Y
                STA   L032357,X
                LDA   L032357+$181,Y
                STA   L032357+1,X
                DEY
                DEY
                DEY
                TXA
                SEC
                SBC   #$0009
                TAX
                BPL   L0321A8
L0321BF         RTS

L0321C0         ENT
                PHB
                PHK
                PLB
                PHD
                TSC
                SEC
                SBC   #$0006
                TCS
                TCD
                LDA   [$11]
                STA   $01
                LDY   #$0002
                LDA   [$11],Y
                STA   $03
                PEI   $17
                PEI   $15
                _EraseRect
                LDY   #$001E
                LDA   [$01],Y
                AND   #$00FF
                DEC
                DEC
                ASL
                STA   L0322F5
                ASL
                ASL
                ADC   L0322F5
                LDY   #$0002
                CLC
                ADC   [$15],Y
                CLC
                ADC   #$0004
                STA   L0322F3
                LDY   #$0002
                LDA   [$01],Y
                CMP   #$000F
                BEQ   L03221F
                CMP   #$00FF
                BEQ   L03221A
                CMP   #$00B3
                BEQ   L03221A
                LDX   #L032357+$C0
                BRA   L032266
L03221A         LDX   #L032357+$F0
                BRA   L032266
L03221F         LDY   #$001C
                LDA   [$01],Y
                TAX
                AND   #$4000
                BEQ   L032248
                TXA
                AND   #$2000
                BNE   L03223C
                TXA
                AND   #$1000
                BEQ   L032242
                LDX   #L032357+$150
                CLC
                BRA   L032271
L03223C         LDX   #L032357+$120
                SEC
                BRA   L032271
L032242         LDX   #L032357+$120
                CLC
                BRA   L032271
L032248         TXA
                AND   #$2000
                BNE   L032260
                TXA
                AND   #$1000
                BNE   L03225A
                LDX   #L032357+$60
                CLC
                BRA   L032271
L03225A         LDX   #L032357+$90
                CLC
                BRA   L032271
L032260         LDX   #L032357+$60
                SEC
                BRA   L032271
L032266         LDY   #$001C
                LDA   [$01],Y
                AND   #$2000
                CMP   #$0001
L032271         JSR   L03213C
                PEA   ^L032347
                PEA   L032347
                PEA   ^L03233F
                PEA   L03233F
                LDA   L0322F3
                PHA
                LDA   [$15]
                PHA
                LDA   #$0000
                PHA
                _PPToPort
                LDA   L0322F3
                CLC
                ADC   #$0028
                PHA
                LDA   [$15]
                CLC
                ADC   #$0008
                PHA
                _MoveTo
                LDA   $01
                CLC
                ADC   #$002E
                TAX
                LDA   $03
                BCC   L0322B4
                INC
L0322B4         PHA
                PHX
                _DrawString
                LDY   #$0004
                LDA   [$11],Y
                AND   #$0080
                BEQ   L0322DE
                LDA   $11
                STAL  L030E20
                LDA   $13
                STAL  L030E22
                PEI   $17
                PEI   $15
                _InvertRect
L0322DE         LDA   $07
                STA   $13
                LDA   $09
                STA   $15
                LDA   $0B
                STA   $17
                TSC
                CLC
                ADC   #$0012
                TCS
                PLD
                PLB
                RTL

L0322F3         DB    $00
                DB    $00
L0322F5         DB    $00
                DB    $00
                DB    $00
                DB    $00
L0322F9         DB    $00
L0322FA         DB    $00
L0322FB         DB    $00
                DB    $00
L0322FD         DB    $00
                DB    $00
L0322FF         DB    $00
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
L03233F         DW    $0000
                DW    $0000
                DW    $0008
                DW    $0024
L032347         DW    $0080             ; SCB byte
                ADRL  L032357           ; Pointer to pixel image
                DW    $0009             ; Width
                DW    $0000             ; Bounds rect
                DW    $0000
                DW    $0008
                DW    $0024
L032357         HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   0000000000000000FFFFFFFFFFFFFFFF
                HEX   F0FFFF0FF0F0FFFF0FFFFFFFFFFFFFFF
                HEX   FFFFFFFFFFFFFFF000FFFFFFFF0FFF00
                HEX   00FFFF0FFFFFFF0FFF0FFFFFFF0FFF0F
                HEX   FFFFFF0FFF0FFFFFFF0FFF000000000F
                HEX   FFFFFFFFFFFFFFF000FFFFFFFF033300
                HEX   00FFFF033333330FFF033333330FFF03
                HEX   3333330FFF033333330FFF000000000F
                HEX   FFFFFFFFFFFFFFF0000000FFFFF0FFFF
                HEX   0F0FFFF0FFFF000FFFF0FFFFFF0FFFF0
                HEX   FFFFFF0FFFF0FFFFFF0FFFF00000000F
                HEX   FFFFFFFFFFFFFFFF00FFFFFFFFF0FF00
                HEX   0FFFFF0FF0FFF0FFF0FF0000FF00FF0F
                HEX   FF0FFF00FFF0FF000000FFFF00FFF000
                HEX   FFFFFFFFFFFFFFFF000FFFFFFFF0FFF0
                HEX   000FFFF0FFFFFFF0000000000FF0F0FF
                HEX   FFFFF0F0FF0FFFFFFF00FFF000000000
                HEX   FFFFFFFFFFFFFFFF000FFFFFFFF03330
                HEX   000FFFF0CCCCCCC0000000000CC0F033
                HEX   333330C0FF0CCCCCCC00FFF000000000
                HEX   FFFFFFFFFFFF44FF44F4444FFF44FFF4
                HEX   444F44FF44FFFFFF
L0324EF         TAY
                TDC
                STA   L03255F
                PHY
                PHX
                TSC
                TCD
                LDA   #$3030
                STA   L0322FB
                STA   L0322FD
                LDA   [$01]
                PHA
                PEA   ^L0322FB
                PEA   L0322FB
                PEA   $0004
                _Int2Hex
                LDA   $04
                AND   #$00FF
                ASL
                ASL
                TAX
                LDY   #$0008
                LDA   [$01],Y
                CLC
                ADC   L032C97,X
                TAY
                LDA   L032C99,X
                BCC   L03252C
                INC
L03252C         STA   $03,S
                TYA
                STA   $01,S
                LDA   #$0000
                SEP   #$21
                LDA   [$01]
                TAY
                ADC   #$06
                STA   L0322F9
                TAX
                TYA
                BEQ   L03254B
L032542         LDA   [$01],Y
                STA   L0322F9,X
                DEX
                DEY
                BNE   L032542
L03254B         LDA   #$24
                STA   L0322FA
                REP   #$20
                LDA   #$2020
                STA   L0322FF
                PLA
                PLA
                LDA   L03255F
                TCD
                RTS

L03255F         DW    $0000
L032561         ENT
                PHB
                PHK
                PLB
                PHD
                TSC
                SEC
                SBC   #$0008
                TCS
                TCD
                PEI   $19
                PEI   $17
                _EraseRect
                LDA   [$13]
                STA   $01
                TAX
                LDY   #$0002
                LDA   [$13],Y
                STA   $03
                JSR   L0324EF
                LDY   #$0002
                LDA   [$17],Y
                CLC
                ADC   #$0005
                PHA
                LDA   [$17]
                CLC
                ADC   #$0008
                PHA
                _MoveTo
                PEA   ^L0322F9
                PEA   L0322F9
                _DrawString
                LDY   #$0003
                LDA   [$13],Y
                BPL   L0325BD
                PEI   $19
                PEI   $17
                _InvertRect
L0325BD         LDA   $09
                STA   $15
                LDA   $0B
                STA   $17
                LDA   $0D
                STA   $19
                TSC
                CLC
                ADC   #$0014
                TCS
                PLD
                PLB
                RTL

L0325D2         LDY   #$0002
                STA   [$02],Y
                LDA   #$0001
                STA   [$02]
                LDA   #$2014
                JSR   L033500
                RTS

L0325E3         CLC
                BRA   L0325E7
L0325E6         SEC
L0325E7         PHA
                PHA
                PHA
                PHX
                PHY
                BCC   L0325F3
                LDA   #$8008
                BRA   L0325F6
L0325F3         LDA   #$4008
L0325F6         PHA
                PHA
                PHA
                _NewHandle
                PLX
                PLY
                RTS

L032603         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L032138
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0400
                STA   L03284E
                LDA   $09,S
                STA   $36
                LDA   $0B,S
                STA   $38
                LDA   $0D,S
                STA   $3A
                LDA   $0F,S
                STA   $3C
                LDA   $11,S
                STA   $22
                LDA   $13,S
                STA   $24
                PLA
                STA   $0F,S
                PLA
                STA   $0F,S
                TSC
                CLC
                ADC   #$000C
                TCS
                STZ   L03213A
                STZ   L03284C
                LDX   #$000A
L032642         LDA   L032816,X
                STA   L032822,X
                DEX
                DEX
                BPL   L032642
                LDA   L032C91
                BNE   L032654
                BRL   L0327EF
L032654         STA   $7C
                DEC
                ASL
                ASL
                STA   L03284A
                TAY
                LDA   L032C97,Y
                STA   $BE
                LDA   L032C99,Y
                STA   $C0
                LDY   #$000A
                LDA   [$BE],Y
                LDX   L03284A
                CLC
                ADC   $BE
                STA   L03282E,X
                LDA   $C0
                ADC   #$0000
                STA   L032830,X
                LDA   $7C
                DEC
                BNE   L032654
                LDA   #$0000
                LDX   #$0140
                LDY   L03284E
                JSR   L0325E6
                STX   $B6
                STY   $B8
                BCC   L032697
                BRL   L032803
L032697         LDA   [$B6]
                STA   L032858
                STA   $BA
                LDY   #$0002
                LDA   [$B6],Y
                STA   L03285A
                STA   $BC
                LDA   #$0040
                STA   L032850
                LDA   #$0140
                STA   L032852
L0326B4         LDA   #$FFFF
                STA   L032854
                LDA   #$0000
                STA   $7C
                ASL
L0326C0         STA   L03284A
                TAX
                ASL
                TAY
                LDA   L032822,X
                BEQ   L0326EE
                LDA   L03282E,Y
                STA   $BE
                LDA   L032830,Y
                STA   $C0
                LDA   [$BE]
                TAX
                CMP   L032854
                BCC   L0326E6
                BNE   L0326EE
                LDY   #$0006
                LDA   [$BE],Y
                BPL   L0326EE
L0326E6         STX   L032854
                LDA   $7C
                STA   L032846
L0326EE         INC   $7C
                LDA   $7C
                TAX
                ASL
                CPX   L032C91
                BNE   L0326C0
                LDA   L032846
                ASL
                ASL
                TAX
                LDA   L032830,X
                TAY
                LDA   L03282E,X
                STA   [$BA]
                TYA
                LDY   #$0002
                STA   [$BA],Y
                LDA   L032846
                INY
                STA   [$BA],Y
                INC   L03284C
                DEC   L032850
                BNE   L03277B
                LDY   #$0004
                LDA   [$B6],Y
                AND   #$7FFF
                STA   [$B6],Y
                LDA   L032852
                CLC
                ADC   #$0140
                STA   L032856
                PEA   $0000
                PHA
                PEI   $B8
                PEI   $B6
                _SetHandleSize
                BCC   L032744
                BRL   L032803
L032744         LDA   L032856
                STA   L032852
                LDY   #$0004
                LDA   [$B6],Y
                ORA   #$8000
                STA   [$B6],Y
                LDA   $BA
                SEC
                SBC   L032858
                TAX
                LDY   #$0002
                LDA   [$B6],Y
                STA   L03285A
                LDA   [$B6]
                STA   L032858
                TXA
                CLC
                ADC   [$B6]
                STA   $BA
                LDA   [$B6],Y
                ADC   #$0000
                STA   $BC
                LDA   #$0040
                STA   L032850
L03277B         LDA   $BA
                CLC
                ADC   #$0005
                STA   $BA
                BCC   L032787
                INC   $BC
L032787         LDA   #$FFFF
                STA   L032848
                LDA   L032C91
                STA   $7C
L032792         LDA   $7C
                DEC
                ASL
                TAX
                ASL
                TAY
                LDA   L032822,X
                BEQ   L0327CF
                LDA   L03282E,Y
                STA   $BE
                LDA   L032830,Y
                STA   $C0
L0327A8         LDA   L032854
                CMP   [$BE]
                BCC   L0327C2
                DEC   L032822,X
                BEQ   L0327CF
                LDA   $BE
                CLC
                ADC   #$000A
                STA   $BE
                BCC   L0327A8
                INC   $C0
                BRA   L0327A8
L0327C2         STZ   L032848
                LDA   $BE
                STA   L03282E,Y
                LDA   $C0
                STA   L032830,Y
L0327CF         DEC   $7C
                BNE   L032792
                LDA   L032848
                BNE   L0327DB
                BRL   L0326B4
L0327DB         LDA   L032858
                STA   $BA
                LDA   L03285A
                STA   $BC
                LDY   #$0003
                LDA   [$BA],Y
                ORA   #$8000
                STA   [$BA],Y
L0327EF         LDA   L032858
                STA   [$36]
                LDA   L03285A
                LDY   #$0002
                STA   [$36],Y
                LDA   L03284C
                STA   [$3A]
                BRA   L032806
L032803         STA   L03213A
L032806         LDA   L03213A
                TAX
                STA   [$22]
                LDA   L032138
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L032816         DB    $00
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
L032822         DB    $00
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
L03282E         DB    $00
                DB    $00
L032830         DB    $00
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
L032846         DB    $00
                DB    $00
L032848         DB    $00
                DB    $00
L03284A         DB    $00
                DB    $00
L03284C         DB    $00
                DB    $00
L03284E         DB    $00
                DB    $00
L032850         DB    $00
                DB    $00
L032852         DB    $00
                DB    $00
L032854         DB    $00
                DB    $00
L032856         DB    $00
                DB    $00
L032858         DB    $00
                DB    $00
L03285A         DB    $00
                DB    $00
                PHB
                PHK
                PLB
                PHD
                TSC
                SEC
                SBC   #$0000
                TCS
                TCD
                LDA   [$07]
                STA   L03288B
                CMP   #$0009
                BNE   L032876
                LDA   #$0004
                STA   [$07]
L032876         LDA   $01
                STA   $09
                LDA   $03
                STA   $0B
                LDA   $05
                STA   $0D
                TSC
                CLC
                ADC   #$0008
                TCS
                PLD
                PLB
                RTL

L03288B         DW    $0000
L03288D         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L032138
                LDA   $05,S
                TCD
                LDA   $07,S
                STA   $3A
                LDA   $09,S
                STA   $3C
                LDA   $0B,S
                STA   $36
                LDA   $0D,S
                STA   $38
                PLA
                STA   $09,S
                PLA
                STA   $09,S
                TSC
                CLC
                ADC   #$0006
                TCS
                STZ   L03213A
                LDA   [$B6]
                CLC
                ADC   #$0003
                STA   $BA
                LDY   #$0002
                LDA   [$B6],Y
                ADC   #$0000
                STA   $BC
L0328C8         LDA   [$BA]
                BMI   L0328DA
                LDA   $BA
                CLC
                ADC   #$0005
                STA   $BA
                BCC   L0328D8
                INC   $BC
L0328D8         BRA   L0328C8
L0328DA         LDA   $BA
                SEC
                SBC   #$0003
                STA   $BA
                BCS   L0328E6
                DEC   $BC
L0328E6         LDA   [$BA]
                STA   $78
                LDY   #$0002
                LDA   [$BA],Y
                STA   $7A
                LDA   [$78]
                STA   [$3A]
                LDA   $7A
                LDX   $78
                JSR   L0324EF
                LDA   L0322F9
                AND   #$00FF
                TAY
                SEP   #$20
                STA   [$36]
L032907         LDA   L0322F9,Y
                STA   [$36],Y
                DEY
                BNE   L032907
                REP   #$20
                LDA   L032138
                TCD
                PLB
                CLC
                LDA   #$0000
                RTL

L03291B         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L032138
                LDA   $05,S
                TCD
                LDA   $07,S
                STA   L032A50
                LDA   $09,S
                STA   $36
                LDA   $0B,S
                STA   $38
                PLA
                STA   $07,S
                PLA
                STA   $07,S
                TSC
                CLC
                ADC   #$0004
                TCS
                STZ   L032A52
                LDA   L032C91
                BNE   L032949
                BRL   L032A39
L032949         STA   L032A54
L03294C         DEC   L032A54
                LDA   L032A54
                BPL   L032957
                BRL   L032A34
L032957         ASL
                ASL
                TAY
                LDA   L032C97,Y
                STA   $3A
                STA   L032A56
                LDA   L032C99,Y
                STA   $3C
                STA   L032A58
                LDY   #$0004
                LDA   [$3A],Y
                BEQ   L03294C
                STA   L032A5C
                LDY   #$000A
                LDA   [$3A],Y
                CLC
                ADC   $3A
                STA   $3A
                STA   $78
                LDA   $3C
                ADC   #$0000
                STA   $3C
                STA   $7A
                STZ   L032A60
                LDA   L032A5C
                CMP   #$0006
                BCC   L0329D4
                STA   L032A62
L032997         LDA   L032A62
                LSR
                STA   L032A62
                CMP   #$0003
                BCC   L0329D4
                CLC
                ADC   L032A60
                ASL
                PHA
                ASL
                ASL
                ADC   $01,S
                PLX
                ADC   $3A
                STA   $78
                LDA   $3C
                BCC   L0329B7
                INC
L0329B7         STA   $7A
                LDA   [$78]
                CMP   L032A50
                BCS   L032997
                LDA   L032A62
                CLC
                ADC   L032A60
                STA   L032A60
                LDA   $78
                STA   $3A
                LDA   $7A
                STA   $3C
                BRA   L032997
L0329D4         LDA   L032A60
                STA   L032A5E
L0329DA         LDA   L032A50
                CMP   [$3A]
                BEQ   L0329E6
                BCS   L032A18
                BRL   L03294C
L0329E6         LDY   #$0006
                LDA   [$3A],Y
                TAX
                BMI   L0329F6
                LDA   L032A52
                BEQ   L0329F6
                BRL   L03294C
L0329F6         LDA   #$FFFF
                STA   L032A52
                LDY   #$0008
                LDA   [$3A],Y
                CLC
                ADC   L032A56
                STA   [$36]
                LDA   L032A58
                ADC   #$0000
                LDY   #$0002
                STA   [$36],Y
                TXA
                BMI   L032A46
                BRL   L03294C
L032A18         INC   L032A5E
                LDA   L032A5E
                CMP   L032A5C
                BNE   L032A26
                BRL   L03294C
L032A26         LDA   $3A
                CLC
                ADC   #$000A
                STA   $3A
                BCC   L0329DA
                INC   $3C
                BRA   L0329DA
L032A34         LDA   L032A52
                BNE   L032A46
L032A39         LDA   #L032A64
                STA   [$36]
                LDA   #^L032A64
                LDY   #$0002
                STA   [$36],Y
L032A46         LDA   L032138
                TCD
                PLB
                CLC
                LDA   #$0000
                RTL

L032A50         DB    $00
                DB    $00
L032A52         DB    $00
                DB    $00
L032A54         DB    $00
                DB    $00
L032A56         DB    $00
                DB    $00
L032A58         DB    $00
                DB    $00
                DB    $00
                DB    $00
L032A5C         DB    $00
                DB    $00
L032A5E         DB    $00
                DB    $00
L032A60         DB    $00
                DB    $00
L032A62         DB    $00
                DB    $00
L032A64         STR   'unknown type'
L032A71         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L032138
                LDA   $05,S
                TCD
                LDA   $09,S
                STA   $22
                LDA   $0B,S
                STA   $24
                LDA   $07,S
                ORA   #$0500
                STA   L032CB3
                PLA
                STA   $07,S
                PLA
                STA   $07,S
                TSC
                CLC
                ADC   #$0004
                TCS
                STZ   L03213A
                STZ   L032CAF
                STZ   L032C91
                LDX   #$000A
L032AA3         STZ   L032816,X
                DEX
                DEX
                BPL   L032AA3
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                LDA   #$0002
                STA   [$02]
                LDY   #$0002
                LDA   #$000D
                STA   [$02],Y
                INY
                INY
                LDA   #L032CB5
                STA   [$02],Y
                INY
                INY
                LDA   #^L032CB5
                STA   [$02],Y
                LDA   #$2009
                JSR   L033500
                BCC   L032ADA
                BRL   L032C64
L032ADA         LDX   #$0004
L032ADD         LDA   L032CD6,X
                STA   L0301D1,X
                DEX
                DEX
                BPL   L032ADD
                PEA   ^L032CBE
                PEA   L032CBE
                PEA   $2010             ; Open
                JSL   GSOS2
                BCC   L032AF9
                BRL   L032C64
L032AF9         LDA   L032CC0
                STA   L032CAF
                LDA   #$00FF
                STA   L032C8F
L032B05         LDA   #$000D
                STA   [$02]
                LDY   #$0002
                LDA   L032CAF
                STA   [$02],Y
                LDY   #$0006
                LDA   #$0001
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                INY
                INY
                LDA   #L032CDB
                STA   [$02],Y
                INY
                INY
                LDA   #^L032CDB
                STA   [$02],Y
                LDA   #$201C
                JSR   L033500
                BCC   L032B3F
                CMP   #$0061
                BNE   L032B3C
                BRL   L032C22
L032B3C         BRL   L032C64
L032B3F         LDY   #$0010
                LDA   [$02],Y
                CMP   #$0042
                BNE   L032B05
                LDY   #$002C
                LDA   [$02],Y
                BNE   L032B51
                INC
L032B51         AND   L032C8F
                BEQ   L032B05
                LDY   #$0012
                LDA   [$02],Y
                TAX
                INY
                INY
                LDA   [$02],Y
                STA   L032C95
                STX   L032C93
                LDY   L032CB3
                JSR   L0325E3
                STX   $7C
                STY   $7E
                BCC   L032B75
                BRL   L032C64
L032B75         LDA   L032CDD
                TAX
L032B79         LDA   L032CDE,X
                STA   L0301D5,X
                DEX
                BNE   L032B79
                LDA   L032CDD
                INC
                INC
                INC
                STA   L0301D1
                PEA   ^L032CBE
                PEA   L032CBE
                PEA   $2010             ; Open
                JSL   GSOS2
                BCC   L032B9D
                BRL   L032C64
L032B9D         LDA   L032CC0
                STA   L032CB1
                LDY   #$0002
                STA   [$02],Y
                LDA   #$0004
                STA   [$02]
                LDA   [$7C]
                STA   $78
                TAX
                LDY   #$0002
                LDA   [$7C],Y
                AND   #$00FF
                STA   $7A
                LDY   #$0006
                STA   [$02],Y
                DEY
                DEY
                TXA
                STA   [$02],Y
                LDY   #$0008
                LDA   L032C93
                STA   [$02],Y
                INY
                INY
                LDA   L032C95
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                PHA
                LDA   L032CB1
                JSR   L0325D2
                PLX
                BCC   L032BEB
                BEQ   L032BE8
                TXA
L032BE8         BRL   L032C64
L032BEB         LDA   [$78]
                CMP   #$0100
                BNE   L032C49
                LDY   #$0002
                LDA   [$78],Y
                ASL
                BNE   L032C49
                LDA   L032C91
                ASL
                TAX
                LDY   #$0004
                LDA   [$78],Y
                STA   L032816,X
                TXA
                ASL
                TAX
                LDA   $78
                STA   L032C97,X
                LDA   $7A
                STA   L032C99,X
                INC   L032C91
                LDA   L032C91
                CMP   #$0006
                BEQ   L032C57
                BRL   L032B05
L032C22         LDA   L032C8F
                ASL
                BCS   L032C57
                LDA   #$FF00
                STA   L032C8F
                LDA   L032CAF
                STA   L032CCA
                PEA   ^L032CC8
                PEA   L032CC8
                PEA   $201C             ; GetDirEntry
                JSL   GSOS2
                BCC   L032C46
                BRL   L032C64
L032C46         BRL   L032B05
L032C49         PEI   $7E
                PEI   $7C
                _DisposeHandle
                BRL   L032B05
L032C57         LDA   L032CAF
                JSR   L0325D2
                BCC   L032C62
                BRL   L032C64
L032C62         BRA   L032C6F
L032C64         STA   L03213A
                LDA   L032CAF
                BEQ   L032C6F
                JSR   L0325D2
L032C6F         LDA   L03213A
                BEQ   L032C7F
                LDA   L032CB3
                PHA
                _DisposeAll
L032C7F         LDA   L03213A
                TAX
                STA   [$22]
                LDA   L032138
                TCD
                PLB
                TXA
                CMP   #$0001
                RTL

L032C8F         DB    $00
                DB    $00
L032C91         DB    $00
                DB    $00
L032C93         DB    $00
                DB    $00
L032C95         DB    $00
                DB    $00
L032C97         DB    $00
                DB    $00
L032C99         DB    $00
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
L032CAF         DB    $00
                DB    $00
L032CB1         DB    $00
                DB    $00
L032CB3         DB    $00
                DB    $00
L032CB5         STRL  '*:icons'
L032CBE         DW    $0003             ; Parms for Open
L032CC0         DW    $0000             ;  ref num
                ADRL  L0301D1           ;  path name
                DW    $0001             ;  req access
L032CC8         DW    $0005             ; Parms for GetDirEntry
L032CCA         DW    $0000             ;  ref num
                DW    $0000             ;  flags
                DW    $0000             ;  base
                DW    $0000             ;  displacement
                ADRL  L032CDB           ;  file name
L032CD6         STRL  '13:'
L032CDB         DW    $0026
L032CDD         DB    $00
L032CDE         DB    $00
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
L032D01         ENT
                DW    $0000             ; dtBoundsRect
                DW    $0000
                DW    $0078
                DW    $018C
                DW    $FFFF             ; dtVisible
                ADRL  $00000000         ; dtRefCon
                ADRL  L032D3F           ; itemPtr
                ADRL  L032D57           ; itemPtr
                ADRL  L032D6F           ; itemPtr
                ADRL  L032D87           ; itemPtr
                ADRL  L032D9F           ; itemPtr
                ADRL  L032DB7           ; itemPtr
                ADRL  L032DCF           ; itemPtr
                ADRL  L032DE7           ; itemPtr
                ADRL  L032DFF           ; itemPtr
                ADRL  L032E17           ; itemPtr
                ADRL  L032E2F           ; itemPtr
                ADRL  $00000000         ; Terminator
L032D3F         DW    $0001             ; Item ID
                DW    $0057             ; Item rect
                DW    $0118
                DW    $0063
                DW    $0180
                DW    $000A             ; Std button
                ADRL  L032E5F           ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032D57         DW    $0002             ; Item ID
                DW    $0031             ; Item rect
                DW    $0118
                DW    $003D
                DW    $0180
                DW    $000A             ; Std button
                ADRL  L032E62           ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032D6F         DW    $0003             ; Item ID
                DW    $0040             ; Item rect
                DW    $0118
                DW    $004C
                DW    $0180
                DW    $000A             ; Std button
                ADRL  L032E6E           ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032D87         DW    $0004             ; Item ID
                DW    $001A             ; Item rect
                DW    $0118
                DW    $0026
                DW    $0180
                DW    $000A             ; Std button
                ADRL  L032E74           ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032D9F         DW    $0005             ; Item ID
                DW    $0068             ; Item rect
                DW    $0118
                DW    $0074
                DW    $0180
                DW    $000A             ; Std button
                ADRL  L032E7C           ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032DB7         DW    $0006             ; Item ID
                DW    $0000             ; Item rect
                DW    $0000
                DW    $0000
                DW    $0000
                DW    $0014             ; User item
                ADRL  $00000000         ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032DCF         DW    $0007             ; Item ID
                DW    $0000             ; Item rect
                DW    $000A
                DW    $000C
                DW    $0181
                DW    $0014             ; User item
                ADRL  $00000000         ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032DE7         DW    $0008             ; Item ID
                DW    $001A             ; Item rect
                DW    $000A
                DW    $0058
                DW    $00E6
                DW    $8014             ; User item
                ADRL  $00000000         ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032DFF         DW    $0009             ; Item ID
                DW    $005B             ; Item rect
                DW    $000A
                DW    $0067
                DW    $0114
                DW    $800F             ; Static text
                ADRL  $00000000         ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032E17         DW    $000A             ; Item ID
                DW    $0067             ; Item rect
                DW    $000A
                DW    $0074
                DW    $010E
                DW    $8011             ; Editable text
                ADRL  $00000000         ; Item descriptor
                DW    $0020             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
L032E2F         DW    $000B             ; Item ID
                DW    $000C             ; Item rect
                DW    $000A
                DW    $0016
                DW    $00C8
                DW    $800F             ; Static text
                ADRL  L032E8E           ; Item descriptor
                DW    $0000             ; Item value
                DW    $0000             ; Bit flag
                ADRL  $00000000         ; Ptr to color table
                DW    $000C
                DW    $001D
                DW    $0118
                DW    $0029
                DW    $0180
                DW    $000A
                ADRL  L032E83
                DW    $0000
                DW    $0000
                DW    $0000
                DW    $0000
L032E5F         STR   'OK'
L032E62         STR   'Open'
                STR   'Accept'
L032E6E         STR   'Close'
L032E74         STR   'Volumes'
L032E7C         STR   'Cancel'
L032E83         STR   'New Folder'
L032E8E         STR   '^0 free of ^1 k.'
L032E9F         STR   'Untitled'
L032EA8         STR   '/'
L032EAA         DB    $38
                DB    $0E
L032EAC         DB    $06
                DB    $04
                DB    $00
                DB    $04
                DB    $22
                DB    $21
L032EB2         DB    $00
                DB    $00
L032EB4         DB    $00
                DB    $00
L032EB6         DB    $00
                DB    $00
L032EB8         DB    $00
                DB    $00
L032EBA         DB    $00
                DB    $00
L032EBC         DB    $00
L032EBD         DB    $00
L032EBE         DB    $00
L032EBF         DB    $00
L032EC0         DB    $00
                DB    $00
L032EC2         DB    $00
                DB    $00
L032EC4         DB    $00
                DB    $00
L032EC6         DB    $00
                DB    $00
L032EC8         DB    $00
                DB    $00
L032ECA         DB    $00
                DB    $00
L032ECC         DB    $00
                DB    $00
L032ECE         DB    $00
                DB    $00
L032ED0         DB    $00
                DB    $00
L032ED2         DB    $00
                DB    $00
L032ED4         DB    $00
                DB    $00
L032ED6         DB    $00
                DB    $00
L032ED8         DB    $00
                DB    $00
L032EDA         DB    $00
                DB    $00
L032EDC         DB    $00
                DB    $00
L032EDE         DB    $00
                DB    $00
L032EE0         DB    $00
                DB    $00
L032EE2         DB    $00
                DB    $00
L032EE4         DB    $00
                DB    $00
L032EE6         DB    $00
                DB    $00
L032EE8         DB    $00
                DB    $00
L032EEA         DB    $00
                DB    $00
L032EEC         DB    $00
                DB    $00
L032EEE         DB    $00
                DB    $00
L032EF0         DB    $00
                DB    $00
L032EF2         DB    $00
                DB    $00
L032EF4         DB    $00
                DB    $00
L032EF6         DB    $00
                DB    $00
L032EF8         DB    $00
                DB    $00
L032EFA         DB    $00
L032EFB         DB    $00
L032EFC         DB    $00
L032EFD         DB    $00
L032EFE         DB    $00
                DB    $00
L032F00         DB    $00
                DB    $00
L032F02         DB    $00
                DB    $00
L032F04         DB    $00
                DB    $00
L032F06         DB    $00
                DB    $00
L032F08         DB    $00
                DB    $00
L032F0A         DB    $00
                DB    $00
L032F0C         DB    $00
                DB    $00
L032F0E         DB    $00
                DB    $00
L032F10         DB    $00
                DB    $00
L032F12         DB    $00
                DB    $00
L032F14         DB    $00
                DB    $00
L032F16         DB    $00
                DB    $00
L032F18         DB    $00
                DB    $00
L032F1A         DB    $00
                DB    $00
L032F1C         DB    $00
                DB    $00
L032F1E         DB    $00
                DB    $00
L032F20         DB    $00
                DB    $00
L032F22         DB    $00
                DB    $00
L032F24         DB    $00
                DB    $00
L032F26         DB    $00
                DB    $00
L032F28         DB    $00
                DB    $00
L032F2A         DB    $00
                DB    $00
L032F2C         DB    $00
                DB    $00
L032F2E         DB    $00
                DB    $00
L032F30         DB    $00
                DB    $00
L032F32         DB    $00
                DB    $00
L032F34         DB    $00
                DB    $00
L032F36         DB    $00
                DB    $00
L032F38         DB    $00
                DB    $00
L032F3A         DB    $00
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
L032F56         DB    $00
                DB    $00
L032F58         DB    $00
                DB    $00
L032F5A         DB    $00
                DB    $00
L032F5C         DB    $00
                DB    $00
L032F5E         DB    $00
                DB    $00
L032F60         DB    $00
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
                DB    $00
                DB    $00
L032F8C         DB    $00
                DB    $00
L032F8E         DB    $00
                DB    $00
L032F90         DB    $00
                DB    $00
L032F92         DB    $00
                DB    $00
L032F94         DB    $00
                DB    $00
L032F96         DB    $00
                DB    $00
L032F98         DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L032F9E         DB    $00
                DB    $00
L032FA0         DB    $00
                DB    $00
L032FA2         DB    $00
                DB    $00
                DB    $00
                DB    $00
L032FA6         DB    $00
                DB    $00
L032FA8         DB    $00
                DB    $00
L032FAA         DB    $00
                DB    $00
L032FAC         DB    $00
                DB    $00
L032FAE         DB    $00
                DB    $00
L032FB0         DB    $00
                DB    $00
L032FB2         DB    $00
                DB    $00
L032FB4         DB    $00
                DB    $00
L032FB6         DB    $00
                DB    $00
L032FB8         DB    $00
                DB    $00
L032FBA         DB    $00
                DB    $00
L032FBC         DB    $00
                DB    $00
L032FBE         DB    $00
                DB    $00
L032FC0         DB    $00
                DB    $00
L032FC2         DB    $00
                DB    $00
L032FC4         DB    $00
                DB    $00
L032FC6         DB    $00
                DB    $00
L032FC8         DB    $00
                DB    $00
L032FCA         DB    $00
                DB    $00
L032FCC         DB    $00
                DB    $00
L032FCE         DB    $00
                DB    $00
L032FD0         DB    $00
                DB    $00
L032FD2         DB    $00
                DB    $00
L032FD4         DB    $00
                DB    $00
L032FD6         DB    $00
                DB    $00
L032FD8         DB    $00
L032FD9         DB    $00
L032FDA         DB    $00
                DB    $00
L032FDC         DB    $00
                DB    $00
L032FDE         DB    $00
                DB    $00
L032FE0         DB    $00
                DB    $00
L032FE2         DB    $00
                DB    $00
L032FE4         DB    $00
                DB    $00
L032FE6         DB    $00
                DB    $00
L032FE8         DB    $00
                DB    $00
L032FEA         DB    $00
                DB    $00
L032FEC         DB    $00
                DB    $00
L032FEE         DB    $00
                DB    $00
L032FF0         DB    $00
                DB    $00
L032FF2         DB    $00
                DB    $00
L032FF4         DB    $00
                DB    $00
L032FF6         DB    $00
                DB    $00
L032FF8         DB    $00
                DB    $00
L032FFA         DB    $00
L032FFB         DB    $00
L032FFC         DB    $00
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
L03301E         DB    $00
                DB    $00
L033020         DB    $00
                DB    $00
L033022         DB    $00
                DB    $00
L033024         DB    $00
                DB    $00
L033026         DB    $00
                DB    $00
L033028         DB    $00
                DB    $00
L03302A         DB    $00
                DB    $00
L03302C         DB    $00
                DB    $00
L03302E         DB    $00
                DB    $00
L033030         DB    $00
                DB    $00
L033032         DB    $00
                DB    $00
L033034         DB    $00
                DB    $00
L033036         DB    $00
                DB    $00
L033038         DB    $00
                DB    $00
L03303A         DW    $0006             ; Parms for DRead
L03303C         DW    $0000             ;  device num
L03303E         ADRL  $00000000         ;  buffer ptr
L033042         ADRL  $00000000         ;  request count
L033046         ADRL  $00000000         ;  starting block
L03304A         DW    $0000             ;  block size
                ADRL  $00000000         ;  transfer count
L033050         DB    $00
                DB    $00
L033052         DB    $00
                DB    $00
L033054         DB    $00
                DB    $00
L033056         DB    $00
                DB    $00
L033058         DB    $00
                DB    $00
L03305A         DB    $00
                DB    $00
L03305C         DB    $00
                DB    $00
L03305E         DB    $00
                DB    $00
L033060         DB    $00
                DB    $00
L033062         DB    $00
                DB    $00
L033064         DB    $00
                DB    $00
L033066         DB    $00
                DB    $00
L033068         DB    $00
                DB    $00
L03306A         DB    $00
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
L03307A         DB    $00
                DB    $00
L03307C         DB    $00
                DB    $00
L03307E         DB    $00
                DB    $00
L033080         DB    $00
                DB    $00
L033082         DB    $00
                DB    $00
L033084         DB    $00
                DB    $00
L033086         DB    $00
                DB    $00
L033088         DB    $00
                DB    $00
L03308A         DB    $00
                DB    $00
L03308C         DB    $00
                DB    $00
L03308E         DB    $00
                DB    $00
L033090         DB    $00
                DB    $00
L033092         DB    $00
                DB    $00
L033094         DB    $00
                DB    $00
L033096         DB    $00
                DB    $00
L033098         DB    $00
                DB    $00
L03309A         DB    $00
                DB    $00
L03309C         DB    $00
                DB    $00
L03309E         DB    $00
                DB    $00
L0330A0         DB    $00
                DB    $00
L0330A2         DB    $00
                DB    $00
L0330A4         DB    $00
                DB    $00
L0330A6         DB    $00
                DB    $00
L0330A8         DB    $00
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
L0330B8         DB    $00
                DB    $00
L0330BA         DB    $00
                DB    $00
L0330BC         DB    $00
                DB    $00
L0330BE         DB    $00
                DB    $00
L0330C0         DB    $00
                DB    $00
L0330C2         DB    $00
                DB    $00
L0330C4         DB    $00
                DB    $00
L0330C6         DB    $00
                DB    $00
L0330C8         DB    $00
                DB    $00
L0330CA         DB    $00
                DB    $00
L0330CC         DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L0330D2         DB    $00
                DB    $00
L0330D4         DB    $00
                DB    $00
L0330D6         DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L0330E0         DB    $00
                DB    $00
L0330E2         DB    $00
                DB    $00
L0330E4         DB    $00
                DB    $00
L0330E6         DB    $00
                DB    $00
L0330E8         DB    $00
                DB    $00
L0330EA         DB    $00
                DB    $00
L0330EC         DB    $00
                DB    $00
L0330EE         DB    $00
                DB    $00
L0330F0         DB    $00
                DB    $00
L0330F2         DB    $00
                DB    $00
L0330F4         DB    $00
                DB    $00
L0330F6         DB    $00
                DB    $00
L0330F8         DB    $00
                DB    $00
L0330FA         DB    $00
                DB    $00
L0330FC         DB    $00
                DB    $00
L0330FE         DB    $00
                DB    $00
L033100         DB    $00
                DB    $00
L033102         DB    $00
                DB    $00
L033104         DB    $2E
                DB    $00
L033106         DB    $00
                DB    $00
L033108         DB    $00
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
L033132         DB    $00
                DB    $00
L033134         DB    $00
                DB    $00
L033136         DB    $00
                DB    $00
L033138         DB    $00
                DB    $00
L03313A         DB    $00
                DB    $00
L03313C         DB    $00
                DB    $00
L03313E         DB    $00
                DB    $00
L033140         HEX   0138B0034C4608788643C903088A2970
                HEX   4A4A4A4A09C08549A0FF844828C8B148
                HEX   D002B000A000C9F9B01C85488460844A
                HEX   844C844E8447C884428446A90A856185
                HEX   4B20B70890034C460820DDFB8D00C08D
                HEX   0CC02093FE202FFB2058FCA2FFE8BDC2
                HEX   08F0059D8404D0F5A2FFE8BDE308F005
                HEX   9D0006D0F5A2FFE8BDF708F0059DA804
                HEX   D0F5A2FFE8BD0709F0059D0007D0F5A2
                HEX   FFE8BD2609F0059D5605D0F5A227BD1E
                HEX   0A09809D2805CA10F5AD10C0AD00C010
                HEX   FBEEF4034C62FAA5608544A56185456C
                HEX   4800D4C8C9D3A0C9D3A0C1CEA0C1D2C3
                HEX   C8C9D6C5D2A0C2C1C3CBD5D0A0C4C9D3
                HEX   CBBA00D0C9C5C3C5A0CED5CDC2C5D2BA
                HEX   A0000000000000C2C1C3CBD5D0A0C3CF
L033240         HEX   CDCDC5CED4BA00C2C1C3CBD5D0A0D3C9
                HEX   DAC5BAA0000000000000000000000000
                HEX   000000000000D0D2C5D3D3A0C1CED9A0
                HEX   CBC5D9A0D4CFA0D2C5D3D4C1D2D4AEAE
                HEX   AE200000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
                HEX   00000000000000000000000000000000
L033340         LDA   L032EF6
                STA   $78
                LDA   L032EF8
                STA   $7A
                LDA   [$78]
                STA   $74
                LDY   #$0002
                LDA   [$78],Y
                STA   $76
                LDY   #$0004
                LDA   [$78],Y
                ORA   #$8000
                STA   [$78],Y
                BCC   L033371
                LDY   #$01FE
                LDA   #$0000
L033367         STA   [$74],Y
                DEY
                DEY
                BPL   L033367
                CLC
                LDA   #$0000
L033371         RTS

L033372         STY   $78
                STZ   $7A
                LDX   L032ED4
L033379         LSR   $78
                ROR
                ROR   $7A
                DEX
                BNE   L033379
                TAY
                LDA   #$0010
                SEC
                SBC   L032ED4
L033389         LSR   $7A
                DEC
                BNE   L033389
                TYA
                LDY   $78
                LDX   $7A
                RTS

L033394         STY   $78
                LDX   L032ED4
L033399         ASL
                ROL   $78
                DEX
                BNE   L033399
                LDY   $78
                RTS

L0333A2         LDA   [$0A]
                AND   #$FF00
                BNE   L0333AB
                SEC
                RTS

L0333AB         XBA
                CLC
                ADC   $0A
                STA   $0A
                BCC   L0333B5
                INC   $0C
L0333B5         LDY   #$001C
                LDA   [$0A],Y
                ORA   L033024
                AND   #$3000
                BEQ   L0333A2
                LDX   L032EE2
                LDY   #$001E
                LDA   [$0A],Y
                STA   L032EE2
                TXA
                INC
                SEC
                SBC   [$0A],Y
                BEQ   L0333EA
                TAY
                LDAL  L0301D1
                TAX
                SEP   #$20
L0333DC         DEX
                LDAL  L0301D2,X
                CMP   #$3A
                BNE   L0333DC
                DEY
                BNE   L0333DC
                BRA   L0333F1
L0333EA         SEP   #$20
                LDAL  L0301D1
                TAX
L0333F1         LDY   #$002E
                LDA   [$0A],Y
                CLC
                ADC   #$2E
                STA   L032F8C
L0333FC         INX
                INY
                LDA   [$0A],Y
                STAL  L0301D2,X
                CPY   L032F8C
                BNE   L0333FC
                LDA   #$3A
                STAL  L0301D3,X
                REP   #$20
                INX
                TXA
                STAL  L0301D1
                CLC
                RTS

L033419         LDA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                LDA   $08
                BCC   L033426
                INC
L033426         STA   $0C
                LDY   #$002E
                LDA   [$0A],Y
                AND   #$00FF
                INC
                STAL  L0301D1
                TAX
                CLC
                ADC   #$002E
                TAY
                SEP   #$20
                LDA   #$3A
                BRA   L033443
L033441         LDA   [$0A],Y
L033443         STAL  L0301D2,X
                DEY
                DEX
                BNE   L033441
                REP   #$20
                LDY   #$001E
                LDA   [$0A],Y
                STA   L032EE2
                RTS

L033456         PHA
                PEA   $0000
                PHA
                PEA   ^L033456
                PHX
                PHA
                PHA
                _GetCursorAdr
                PLA
                STA   $78
                PLA
                STA   $7A
                _InitCursor
                PHP
                LDA   L032FC6
                PHA
                PLB
                PLA
                JSL   L07001D
                PEI   $7A
                PEI   $78
                _SetCursor
                LDAL  L0612BF
                TAX
                ORAL  L0612BD
                BEQ   L0334C9
                PHX
                LDAL  L0612BD
                PHA
                _BeginUpdate
                LDAL  L0612BF
                PHA
                LDAL  L0612BD
                PHA
                _SetPort
                JSL   L039A84
                LDAL  L0612BF
                PHA
                LDAL  L0612BD
                PHA
                _EndUpdate
L0334C9         PLA
                PHK
                PLB
                RTS

L0334CD         LDX   L033102
                LDA   #$0006
                JSR   L033456
                CMP   #$0001
                RTS

L0334DA         PHP
                LDA   L032FC6
                PHA
                PLB
                PLA
                JSL   L0743FE
                PHK
                PLB
                LDAL  L06000C
                BEQ   L0334F7
                JSR   L0334CD
                BCS   L0334F7
                LDA   #$8010
                SEC
                RTS

L0334F7         LDA   #$0000
                STAL  L06000C
                CLC
                RTS

L033500         PEI   $04
                PEI   $02
                PHA
                JSL   GSOS2
                RTS

L03350A         STZ   L032FCE
                STZ   L032FD0
                PHA
                PHA
                LDAL  L0612BF
                PHA
                LDAL  L0612BD
                PHA
                PEA   $0000
                PEA   $0484
                _GetCtlHandleFromID
                PLY
                STY   L032FC8
                PLX
                STX   L032FCA
                PEA   $0000
                PHX
                PHY
                _SetCtlValue
                RTS

L03353E         LDA   L032FCE
                STA   $78
                LDA   L032FD0
                LDX   L032FCC
L033549         BEQ   L033551
                ASL   $78
                ROL
                DEX
                BRA   L033549
L033551         PHA
                LDA   L032FCA
                PHA
                LDA   L032FC8
                PHA
                _SetCtlValue
                RTS

L033562         JSR   L03350A
                LDY   #$01B2
                LDA   [$06],Y
                STA   $78
                INY
                INY
                LDA   [$06],Y
                TAY
                ORA   $78
                BEQ   L033596
                TYA
                LDX   #$0000
L033579         ASL   $78
                ROL
                BCS   L033581
                INX
                BNE   L033579
L033581         STX   L032FCC
                ROR
                PHA
                PHA
                LDA   L032FCA
                PHA
                LDA   L032FC8
                PHA
                _SetCtlTitle
L033596         RTS

L033597         PHA
                PHA
                LDX   L032FF6
                PHX
                LDX   L032FF4
                PHX
                PEA   $0000
                PHA
                _GetCtlHandleFromID
                PLA
                PLX
                RTS

L0335AF         CMP   #$0040
                BEQ   L0335BB
                CMP   #$0047
                BEQ   L033635
                SEC
                RTS

L0335BB         LDA   #$0026
                STA   L032FF8
                LDAL  L0301D1
                DEC
                STA   L033945
                TAX
                SEP   #$20
L0335CC         DEX
                LDAL  L0301D2,X
                CMP   #$3A
                BEQ   L0335D7
                BRA   L0335CC
L0335D7         LDY   #$0000
L0335DA         INX
                INY
                LDAL  L0301D2,X
                STA   L032FFB,Y
                CPX   L033945
                BNE   L0335DA
                REP   #$20
                TYA
                STA   L032FFA
                LDA   #$0005
                STA   [$02]
                LDY   #$0002
                LDA   L033136
                STA   [$02],Y
                INY
                INY
                LDA   L0330D4
                BEQ   L033607
                LDA   #$0002
                BRA   L03360A
L033607         LDA   #$0003
L03360A         STA   [$02],Y
                LDY   #$000C
                LDA   #L032FF8
                STA   [$02],Y
                INY
                INY
                LDA   #^L032FF8
                STA   [$02],Y
                LDA   #$2007
                JSR   L033500
                LDAL  L060002
                BIT   #$0100
                BEQ   L03362D
                BRL   L033914
L03362D         LDA   #L03394B
                LDX   #L033962
                BRA   L03367D
L033635         LDA   #$0003
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D3
                STA   [$02],Y
                LDA   #$2006
                JSR   L033500
                BCC   L033652
                RTS

L033652         LDAL  L060002
                BIT   #$0080
                BEQ   L033668
                LDY   #$0008
                LDA   [$02],Y
                CMP   #$000F
                BEQ   L033668
                BRL   L0338E6
L033668         LDY   #$0006
                LDA   [$02],Y
                AND   #$0080
                BNE   L033677
                LDX   #L0339A6
                BRA   L03367A
L033677         LDX   #L033994
L03367A         LDA   #L03394B
L03367D         STA   $66
                STX   L033947
                LDA   ($66)
                AND   #$00FF
                PHA
                TAY
                SEP   #$20
L03368B         LDA   ($66),Y
                STA   L0339C6,Y
                DEY
                BNE   L03368B
                REP   #$20
                LDAL  L0301D1
                DEC
                STA   L033945
                TAX
                SEP   #$20
L0336A0         DEX
                LDAL  L0301D2,X
                CMP   #$3A
                BEQ   L0336AB
                BRA   L0336A0
L0336AB         PLY
L0336AC         INX
                LDAL  L0301D2,X
                STA   L0339C7,Y
                INY
                CPX   L033945
                BNE   L0336AC
                LDX   L033947
                STX   $66
                LDA   #$00
                XBA
                TYA
                CLC
                ADC   ($66)
                PHA
                TAX
                LDA   ($66)
                TAY
L0336CB         LDA   ($66),Y
                STA   L0339C6,X
                DEX
                DEY
                BNE   L0336CB
                PLA
                STA   L0339C6
                REP   #$20
                PHA
                PHA
                _GetCtlParamPtr
                PLA
                STA   L032FEC
                PLA
                STA   L032FEE
                LDA   #L0339C6
                STA   L032FF0
                LDA   #^L0339C6
                STA   L032FF2
                PEA   ^L032FF0
                PEA   L032FF0
                _SetCtlParamPtr
                LDA   #$0000
                LDY   #$0011
                LDX   #$0000
                PHA
                PHA
                PHX
                PHX
                PHA
                PHY
                PEA   ^L039A84
                PEA   L039A84
                PHX
                PHX
                PEA   $0002
                PHA
                PHY
                PEA   $800E
                _NewWindow2
                PLA
                STA   L032FF4
                PLA
                STA   L032FF6
                LDA   #$0502
                JSR   L033597
                STA   $88
                STX   $8A
                LDA   [$88]
                STA   $78
                LDY   #$0002
                LDA   [$88],Y
                STA   $7A
                LDY   #$001C
                LDA   [$78],Y
                STA   $52
                INY
                INY
                LDA   [$78],Y
                STA   $54
                LDA   L033947
                CMP   #L033994
                BNE   L033777
                LDY   #$0008
                LDA   [$02],Y
                CMP   #$000F
                BEQ   L03379D
                LDA   #$0506
                JSR   L033597
                PHX
                PHA
                _ShowControl
                BRA   L03379D
L033777         PEA   ^L032FFC
                PEA   L032FFC
                LDA   L032FFA
                PHA
                PEI   $54
                PEI   $52
                _LESetText
                PEA   $0000
                PEA   $00FF
                PEI   $54
                PEI   $52
                _LESetSelect
L03379D         LDA   #$0505
                JSR   L033597
                STA   L033020
                STX   L033022
                _InitCursor
                STZ   L03301E
L0337B3         LDA   #$0000
                STAL  L06000C
                STAL  L06000A
L0337BE         LDA   [$52]
                STA   $78
                LDY   #$0002
                LDA   [$52],Y
                STA   $7A
                LDY   #$0004
                LDA   [$78],Y
                BEQ   L0337DD
                LDA   #$8000
                TSB   L03301E
                BNE   L0337F8
                LDA   #$0000
                BRA   L0337E8
L0337DD         LDA   #$8000
                TRB   L03301E
                BEQ   L0337F8
                LDA   #$00FF
L0337E8         PHA
                LDA   L033022
                PHA
                LDA   L033020
                PHA
                _HiliteControl
L0337F8         JSR   L0334DA
                LDAL  L06000A
                BEQ   L0337BE
                CMP   #$0503
                BNE   L03380E
                LDAL  L06000C
                BNE   L033844
                BRA   L0337B3
L03380E         CMP   #$0505
                BNE   L033844
                LDA   [$52]
                STA   $78
                LDY   #$0002
                LDA   [$52],Y
                STA   $7A
                LDY   #$0004
                LDA   [$78],Y
                STA   L032FF8
                DEY
                DEY
                LDA   [$78],Y
                STA   $7E
                LDA   [$78]
                STA   $7C
                LDA   [$7C]
                STA   $78
                LDA   [$7C],Y
                STA   $7A
                LDY   #$001E
L03383B         LDA   [$78],Y
                STA   L032FFA,Y
                DEY
                DEY
                BPL   L03383B
L033844         _WaitCursor
                LDA   L032FF6
                PHA
                LDA   L032FF4
                PHA
                _CloseWindow
                LDA   L032FEE
                PHA
                LDA   L032FEC
                PHA
                _SetCtlParamPtr
                LDAL  L06000A
                CMP   #$0504
                BEQ   L03387E
                CMP   #$0505
                BEQ   L0338B5
                CMP   #$0506
                BEQ   L0338E6
                CLC
                RTS

L03387E         LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BEQ   L033899
                STZ   L033024
                JSR   L0333A2
                BCC   L033897
L033890         LDA   #$8000
                STAL  L06000A
L033897         CLC
                RTS

L033899         LDY   #$001E
                LDA   [$0A],Y
                INC
                STA   L033949
L0338A2         STZ   L033024
                JSR   L0333A2
                BCS   L033890
                LDY   #$001E
                LDA   [$0A],Y
                CMP   L033949
                BCS   L0338A2
                RTS

L0338B5         LDAL  L0301D1
                TAX
                SEP   #$20
L0338BC         DEX
                LDAL  L0301D2,X
                CMP   #$3A
                BNE   L0338BC
                LDY   #$0000
L0338C8         INX
                LDA   L032FFA,Y
                STAL  L0301D2,X
                INY
                CPY   L032FF8
                BNE   L0338C8
                INX
                LDA   #$3A
                STAL  L0301D2,X
                REP   #$20
                TXA
                STAL  L0301D1
                CLC
                RTS

L0338E6         LDY   #$0006
                LDA   [$02],Y
                ORA   #$0080
                STA   [$02],Y
                LDA   #$2005
                JSR   L033500
                BCC   L0338F9
                RTS

L0338F9         LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDA   #$2002
                JSR   L033500
                RTS

L033914         LDAL  L0301D1
                TAX
                SEP   #$20
L03391B         DEX
                LDAL  L0301D2,X
                CMP   #$3A
                BNE   L03391B
                LDY   #$0000
L033927         INX
                LDA   L032FFC,Y
                STAL  L0301D2,X
                INY
                CPY   L032FFA
                BNE   L033927
                INX
                LDA   #$3A
                STAL  L0301D2,X
                REP   #$20
                TXA
                STAL  L0301D1
                CLC
                RTS

L033945         DW    $0000
L033947         DW    $0000
L033949         DW    $0000
L03394B         STR   'The file/folder name "'
L033962         STR   '" is unacceptable to the destination file system.'
L033994         STR   '" already exists.'
L0339A6         STR   '" already exists and is locked.'
L0339C6         DB    $00
L0339C7         DB    $00
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
L033A5C         LDA   L032EDA
                JSL   L03746D
                BIT   L032FD6
                BPL   L033A77
                SEP   #$30
                LDAL  L040023
                TAX
                LDA   #$FF
                STAL  L04002B,X
                REP   #$30
L033A77         JSR   L037492
                RTS

L033A7B         LDAL  L0301D1
                DEC
                CLC
                ADC   #$0062
                STA   L032F32
                LDA   L032EE2
                STA   L032F56
                LDA   #$0000
                STA   L032F58
                STA   L032F5A
                STA   L032F5C
                STA   L032F5E
                LDX   #$FFFE
L033A9F         INX
                INX
                LDA   L034C64,X
                BMI   L033A9F
                BEQ   L033AB0
                TAY
                LDA   [$02],Y
                STA   L032F2C,X
                BRA   L033A9F
L033AB0         LDX   #$002A
L033AB3         LDA   L033106,X
                STA   L032F60,X
                DEX
                DEX
                BPL   L033AB3
                RTS

L033ABE         LDA   L032F2A
                BEQ   L033ACC
                JSR   L034AFC
                BCC   L033AC9
                RTS

L033AC9         STZ   L032F2A
L033ACC         JSR   L033419
L033ACF         LDA   $0A
                CMP   L033056
                BNE   L033ADD
                LDA   $0C
                CMP   L033058
                BEQ   L033AE2
L033ADD         JSR   L0333A2
                BRA   L033ACF
L033AE2         LDA   L03305A
                STA   L032FCE
                LDA   L03305C
                STA   L032FD0
                JSR   L03353E
                STZ   L032FD2
                STZ   L032FD4
                LDA   L03305E
                BEQ   L033B1E
                AND   #$8000
                BNE   L033B0C
                LDA   #L034DB9+2
                STA   L033B8C
                LDA   #$0001
                BRA   L033B15
L033B0C         LDA   #L034D71+2
                STA   L033B8C
                LDA   #$0000
L033B15         LDX   #$0001
                JSR   L034785
                BCC   L033B1E
                RTS

L033B1E         LDA   L03305E
                STA   L032F2A
                JSR   L033A7B
                LDA   L033062
                STA   L032ECC
                SEC
                SBC   L033066
                LDY   #$0006
                STA   [$02],Y
                LDA   L033064
                STA   L032ECE
                SBC   L033068
                INY
                INY
                STA   [$02],Y
                LDA   #$0003
                STA   [$02]
                LDY   #$0002
                LDA   L032ED0
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2016
                JSR   L033500
                BCC   L033B60
                RTS

L033B60         LDA   L033066
                STA   L032EB8
                LDA   L033068
                STA   L032EBA
                LDA   L033060
                STA   L030BE8
                LDA   L03306A
                STA   L032ED2
                DEC   L032F0C
                LDA   L033050
                TCS
                PEA   L035684+2
                LDA   L033B8C
                PHA
                PEA   L034ABD+2
                JMP   L033FD8

L033B8C         BRK   $00
L033B8E         LDA   L032F2A
                BEQ   L033B9C
                JSR   L034AFC
                BCC   L033B99
                RTS

L033B99         STZ   L032F2A
L033B9C         JSR   L033419
L033B9F         LDA   $0A
                CMP   L033056
                BNE   L033BAD
                LDA   $0C
                CMP   L033058
                BEQ   L033BB2
L033BAD         JSR   L0333A2
                BRA   L033B9F
L033BB2         LDA   L03305A
                STA   L032FCE
                LDA   L03305C
                STA   L032FD0
                JSR   L03353E
                STZ   L032FD2
                STZ   L032FD4
                LDA   L03305E
                BEQ   L033BE2
                AND   #$8000
                BNE   L033BD6
                LDA   #$0001
                BRA   L033BD9
L033BD6         LDA   #$0000
L033BD9         LDX   #$0001
                JSR   L034785
                BCC   L033BE2
                RTS

L033BE2         LDA   L03305E
                STA   L032F2A
                LDY   #$002A
                LDA   [$02],Y
                STA   L03313A
                INY
                INY
                LDA   [$02],Y
                STA   L03313C
                LDY   #$0014
                LDA   [$02],Y
                STA   L03313E
                JSR   L033A7B
                LDA   L033060
                STA   L030BE8
                DEC   L032F0C
                JSR   L033FD8
                BCC   L033C11
                RTS

L033C11         LDA   L033062
                STA   L033038
                LDA   L033050
                TCS
                PEA   L035684+2
                PEA   L034D4E+2
                JMP   L034B86

L033C24         LDA   L033050
                TCS
                JMP   L0355C1

L033C2B         STZ   L032F18
                CLC
                JSR   L033340
                LDA   L032EDA
                BEQ   L033C7D
                STA   L03303C
                LDA   $74
                STA   L03303E
                LDA   $76
                STA   L03303E+2
                LDA   L032EF0
                TAX
                STA   L033042
                STZ   L033042+2
                CPX   #$0200
                BNE   L033C5B
                LDA   #$0001
                STZ   L032F18
                BRA   L033C64
L033C5B         LDA   #$0200
                STA   L032F18
                LDA   #$0000
L033C64         STA   L033046
                STZ   L033046+2
                STX   L03304A
                PEA   ^L03303A
                PEA   L03303A
                PEA   $202F             ; DRead
                JSL   GSOS2
                BCC   L033CEF
                RTS

L033C7D         STZ   L032FE2
                LDX   L032FE4
                LDA   L032FE6
                LDY   #$0006
                STA   [$02],Y
                DEY
                DEY
                TXA
                STA   [$02],Y
                LDA   #$0002
                STA   [$02]
                LDA   #$2010
                JSR   L033500
                BCC   L033C9E
                RTS

L033C9E         LDY   #$0002
                LDA   [$02],Y
                STA   L032FE2
                LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                INY
                INY
                LDA   #$0200
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                PHA
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                LDA   #$2014
                JSR   L033500
                PLX
                BEQ   L033CED
                TXA
                SEC
L033CEC         RTS

L033CED         BCS   L033CEC
L033CEF         LDA   #$0008
                CLC
                ADC   L032F18
                TAY
                LDX   #$0008
L033CFA         LDA   [$74],Y
                CMP   L032EA8,X
                BNE   L033D7E
                DEY
                DEY
                DEX
                DEX
                BPL   L033CFA
                LDA   L032EDA
                BEQ   L033D79
                LDA   L032EF0
                CMP   #$2000
                BEQ   L033D79
                LDY   #$0012
                LDX   #$0006
L033D1A         LDA   [$74],Y
                CPX   #$0000
                BNE   L033D24
                AND   #$FF00
L033D24         STA   L033D83,X
                DEY
                DEY
                DEX
                DEX
                BPL   L033D1A
                LDA   L033D85
                CMP   #$2800
                BCS   L033D4A
                SEP   #$21
                XBA
                ADC   #$63
                STA   L033D85+1
                LDA   L033D89+1
                DEC
                BNE   L033D45
                LDA   #$07
L033D45         STA   L033D89+1
                REP   #$20
L033D4A         LDA   #$0007
                STA   [$02]
                LDY   #$0002
                LDA   #L034FEC
                STA   [$02],Y
                INY
                INY
                LDA   #^L034FEC
                STA   [$02],Y
                LDA   #$2006
                JSR   L033500
                BCS   L033D7E
                LDY   #$001E
                LDX   #$0006
L033D6C         LDA   [$02],Y
                CMP   L033D83,X
                BNE   L033D7E
                DEY
                DEY
                DEX
                DEX
                BPL   L033D6C
L033D79         LDA   #$0000
                CLC
                RTS

L033D7E         LDA   #$002E
                SEC
                RTS

L033D83         DW    $0000
L033D85         DW    $0000
                DW    $0000
L033D89         DW    $0000
L033D8B         LDY   #$0002
                STA   [$02],Y
                LDA   #$0005
                STA   [$02]
                INY
                INY
                TXA
                STA   [$02],Y
                LDA   #$0000
                INY
                INY
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                LDA   #$202E
                JSR   L033500
                RTS

L033DB4         LDA   L032EDA
                STA   L03451F
                PEA   ^L03451D
                PEA   L03451D
                PEA   $202D             ; DStatus
                JSL   GSOS2
                BCC   L033DCA
                RTS

L033DCA         LDA   L03452F
                LDX   L032EF0
                CPX   #$2000
                BEQ   L033DDD
                AND   #$0010
                EOR   #$0010
L033DDB         CLC
                RTS

L033DDD         AND   #$0010
                EOR   #$0010
                BEQ   L033DDB
                PEA   ^L03451D
                PEA   L03451D
                PEA   $202D             ; DStatus
                JSL   GSOS2
                BCC   L033DF5
                RTS

L033DF5         LDA   L03452F
                AND   #$0010
                EOR   #$0010
                CLC
                RTS

L033E00         PEA   $4050
                _SysBeep2
                LDA   #$0001
                LDX   #L033E22
                JSR   L033456
                TAX
                BEQ   L033E18
L033E16         CLC
                RTS

L033E18         JSR   L0334CD
                BCS   L033E16
                LDA   #$8010
                SEC
                RTS

L033E22         STR   'The media just inserted is write-protected. Make sure the write-protect tab is in the correct position.'
L033E8A         LDA   L032EF2
                AND   #$0004
                BNE   L033E95
                BRL   L03423C
L033E95         LDA   L032F0C
                BNE   L033E9D
                BRL   L033F3D
L033E9D         BIT   L032FD6
                BPL   L033F19
                LDAL  L060002
                AND   #$0010
                BEQ   L033F19
                LDA   L0370AA
                STA   L03454B
                LDX   #L0343EF
                JSR   L03793E
                JSR   L0395E4
                PHP
                LDX   L03454B
                JSR   L03793E
                PLP
                BCC   L033F19
L033EC4         LDA   L032EDA
                STA   L034537
                LDA   L032EF0
                STA   L03453D
                STA   L034545
                CMP   #$0200
                BNE   L033EDD
                LDA   #$0001
                BRA   L033EE0
L033EDD         LDA   #$0000
L033EE0         STA   L034541
                PEA   ^L034535
                PEA   L034535
                PEA   $2030             ; DWrite
                JSL   GSOS2
                PEA   $4033
                _SysBeep2
                LDA   #$0001
                LDX   #L03439A
                JSR   L033456
                TAX
                BEQ   L033F0F
L033F06         LDA   L033052
                STA   L033F0C+1
L033F0C         JMP   $0000

L033F0F         JSR   L0334CD
                BCS   L033F06
                LDA   #$8010
                SEC
                RTS

L033F19         LDA   L033054
                STA   L033052
                LDX   #$003C
L033F22         LDA   L033094,X
                STA   L033056,X
                DEX
                DEX
                BPL   L033F22
L033F2C         LDA   L032EF0
                CMP   #$2000
                BEQ   L033F3D
                LDA   L032EDA
                LDX   #$0002
                JSR   L033D8B
L033F3D         PEA   $4030
                _SysBeep2
                LDA   L032EF0
                CMP   #$2000
                BEQ   L033F57
                LDA   #$6964
                LDX   #$6B73
                BRA   L033F5D
L033F57         LDA   #$6174
                LDX   #$6570
L033F5D         LDY   L032F0C
                BEQ   L033FBC
                STA   L03427B
                STX   L03427D
                AND   #$FFDF
                STA   L034282
                STX   L034284
                PHY
                PEA   ^L0330D6
                PEA   L0330D6
                PEA   $0005
                PEA   $0000
                _Int2Dec
                LDX   #$000C
                LDY   #$FFFF
                SEP   #$20
L033F8D         INY
                LDA   L0330D6,Y
                CMP   #$20
                BEQ   L033F8D
L033F95         STA   L034282,X
                INX
                INY
                LDA   L0330D6,Y
                CPY   #$0005
                BNE   L033F95
                LDY   #$0000
L033FA5         LDA   L034254,Y
                BEQ   L033FB1
                STA   L034282,X
                INX
                INY
                BRA   L033FA5
L033FB1         TXA
                STA   L034281
                REP   #$20
                LDX   #L034281
                BRA   L033FC5
L033FBC         STA   L0342BF+$19
                STX   L0342BF+$1B
                LDX   #L0342BF
L033FC5         LDA   #$0001
                JSR   L033456
                TAX
                BNE   L033FD8
                JSR   L0334CD
                BCS   L033FD8
                LDA   #$8010
                SEC
                RTS

L033FD8         JSR   L033DB4
                BCC   L033FDE
                RTS

L033FDE         BEQ   L033FE3
                BRL   L033F2C
L033FE3         STZ   L0370B0
                LDA   L03452F
                AND   #$0004
                BEQ   L033FF4
                JSR   L033E00
                BCC   L033FD8
                RTS

L033FF4         BIT   L032FD6
                BPL   L034004
                LDA   #$0640
                STA   L032ED6
                STZ   L032ED8
                BRA   L034010
L034004         LDA   L034531
                STA   L032ED6
                LDA   L034533
                STA   L032ED8
L034010         JSR   L033C2B
                STA   L033138
                BCS   L03406B
                LDA   L032F18
                CLC
                ADC   #$0046
                TAY
                LDA   L032F08
                CMP   [$74],Y
                BNE   L034046
                INY
                INY
                LDA   L032F0A
                CMP   [$74],Y
                BNE   L034046
                PEA   $4052
                _SysBeep2
                LDA   #$0002
                LDX   #L034413
                JSR   L033456
                BRL   L033F2C
L034046         LDAL  L060002
                AND   #$0020
                BNE   L03406B
                PEA   $4054
                _SysBeep2
                LDA   #$0008
                LDX   #L034471
                JSR   L033456
                TAX
                BEQ   L034068
                BRL   L03410C
L034068         BRL   L033F2C
L03406B         LDA   #$01FC
                STA   [$74]
                LDA   #$0007
                STA   [$02]
                LDY   #$0002
                LDA   #L034FEC
                STA   [$02],Y
                INY
                INY
                LDA   #^L034FEC
                STA   [$02],Y
                INY
                INY
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                LDA   #$2008
                JSR   L033500
                BCS   L03410C
                LDY   #$0016
                LDA   [$02],Y
                AND   #$0010
                BEQ   L0340B8
                PEA   $4052
                _SysBeep2
                LDA   #$0002
                LDX   #L0344CB
                JSR   L033456
                BRL   L033F2C
L0340B8         LDAL  L060002
                AND   #$0020
                BNE   L03410C
                LDY   #$0002
                LDA   [$74],Y
                CMP   #$0023
                BCC   L0340CE
                LDA   #$0022
L0340CE         STA   L032F8C
                LDX   #$0000
                LDY   #$0004
                SEP   #$20
L0340D9         LDA   [$74],Y
                STA   L034377,X
                INY
                INX
                CPX   L032F8C
                BNE   L0340D9
                LDA   #$3F
                STA   L034377,X
                TXA
                CLC
                ADC   #$16
                STA   L034361
                REP   #$20
                PEA   $4054
                _SysBeep2
                LDA   #$0008
                LDX   #L034361
                JSR   L033456
                TAX
                BNE   L03410C
                BRL   L033F2C
L03410C         STZ   L0370B0
                BIT   L032FD6
                BPL   L034117
                BRL   L03419A
L034117         LDA   L032EF0
                CMP   #$2000
                BNE   L03413E
                LDA   L033138
                CMP   #$0027
                BEQ   L034132
                LDA   #$000A
                JSR   L033456
                TAX
                BEQ   L03419A
                BRA   L03413E
L034132         LDA   #$000B
                JSR   L033456
                TAX
                BNE   L03413E
                BRL   L033F2C
L03413E         JSR   L0334DA
                BCC   L034144
                RTS

L034144         LDA   L0370AA
                STA   L0370AC
                LDA   L0370B0
                BNE   L034197
                LDX   #L0343FF
                JSR   L03793E
                LDA   L032EDA
                LDX   #$0001
                JSR   L033D8B
                PHA
                PHP
                LDX   L0370AC
                JSR   L03793E
                PLP
                PLA
                BCC   L03419A
                CMP   #$002F
                BEQ   L034197
                CMP   #$002E
                BEQ   L034197
                PEA   $4033
                _SysBeep2
                LDA   #$0001
                LDX   #L03439A
                JSR   L033456
                TAX
                BEQ   L03418D
L03418A         BRL   L033F2C
L03418D         JSR   L0334CD
                BCS   L03418A
                LDA   #$8010
                SEC
                RTS

L034197         BRL   L033F2C
L03419A         STZ   L0370B0
                BIT   L032FD6
                BMI   L0341A8
                JSR   L034F86
                BCC   L0341A8
                RTS

L0341A8         INC   L032F0C
                STZ   L032EBC
                STZ   L032EBE
                STZ   L032EE8
                STZ   L032EEA
                LDA   #$0000
                STAL  L040025
                STAL  L040027
                JSR   L03454D
                JSR   L035282
                BCC   L0341CB
                RTS

L0341CB         BIT   L032FD8
                BMI   L034237
                LDA   L032F0C
                DEC
                BEQ   L034237
                LDA   L032F2A
                BNE   L0341E0
                STZ   L032F5A
                BRA   L034203
L0341E0         AND   #$8000
                BEQ   L0341EA
                LDA   #$0000
                BRA   L0341ED
L0341EA         LDA   #$8000
L0341ED         STA   L032F5A
                LDA   L032ECC
                SEC
                SBC   L032EB8
                STA   L032F5C
                LDA   L032ECE
                SBC   L032EBA
                STA   L032F5E
L034203         LDA   #L032F2C
                STA   $68
                LDA   #^L032F2C
                STA   $6A
                LDA   #$0060
                STA   L032EB4
                STZ   L032EB6
                JSR   L0348AB
                BCC   L03421C
                RTS

L03421C         LDA   #L0301D1
                STA   $68
                LDA   #^L0301D1
                STA   $6A
                LDAL  L0301D1
                INC
                STA   L032EB4
                STZ   L032EB6
                JSR   L0348AB
                BCC   L034237
                RTS

L034237         LDA   #$0000
                CLC
                RTS

L03423C         PEA   $400C
                _SysBeep2
                LDA   #$0002
                LDX   #L0342F1
                JSR   L033456
                LDA   #$8011
                SEC
                RTS

L034254         ASC   ' is full.  Please insert another blank '
L03427B         DB    $00
                DB    $00
L03427D         DB    $00
                DB    $00
                ASC   '.'
                DB    $00
L034281         DB    $00
L034282         DB    $00
                DB    $00
L034284         DB    $00
                DB    $00
                ASC   ' number '
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
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L0342BF         STR   'Please insert the first '00000000' for this backup set.'
L0342F1         STR   'The destination device for the backup is full and contains non-removable media. The backup must now be aborted.'
L034361         DB    $00
                ASC   'OK to destroy volume '
L034377         DB    $00
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
L03439A         STR   'A media error occurred while writing the last disk/tape. Insert a new one for retry.'
L0343EF         STR   'Verifying diskI'
L0343FF         STR   'Initializing mediaI'
L034413         STR   'Sorry, you inserted an earlier member of this backup set!  Please use another piece of media.'
L034471         STR   'The media you inserted contains an earlier Archiver backup.  Do you still want to use it?'
L0344CB         STR   'Sorry, you cannot back up to that disk because it contains files that are in use.'
L03451D         DW    $0005             ; Parms for DStatus
L03451F         DW    $0000             ;  device num
                DW    $0000             ;  status code
                ADRL  L03452F           ;  status list
                ADRL  $00000006         ;  request count
                ADRL  $00000000         ;  transfer count
L03452F         DB    $00
                DB    $00
L034531         DB    $00
                DB    $00
L034533         DB    $00
                DB    $00
L034535         DW    $0006             ; Parms for DWrite
L034537         DW    $0000             ;  device num
                ADRL  $00FF0000         ;  buffer ptr
L03453D         ADRL  $00000000         ;  request count
L034541         ADRL  $00000000         ;  starting block
L034545         DW    $0000             ;  block size
                ADRL  $00000000         ;  transfer count
L03454B         DW    $0000
L03454D         LDA   L032EBC
                ORA   L032EBE
                BNE   L034558
                BRL   L0346DF
L034558         LDX   L0370B4
                JSR   L03793E
                LDA   L032EDA
                BNE   L0345A9
                LDA   #$0004
                STA   [$02]
                LDA   L032FE2
                LDY   #$0002
                STA   [$02],Y
                INY
                INY
                LDA   $6C
                STA   [$02],Y
                INY
                INY
                LDA   $6E
                STA   [$02],Y
                INY
                INY
                LDA   L032EBC
                STA   [$02],Y
                INY
                INY
                LDA   L032EBE
                STA   [$02],Y
                LDA   #$2013
                JSR   L033500
                BCS   L0345A8
                LDA   L032FE8
                CLC
                ADC   L032EBC
                STA   L032FE8
                LDA   L032FEA
                ADC   L032EBE
                STA   L032FEA
                BRL   L034748
L0345A8         RTS

L0345A9         LDA   L0370B0
                BEQ   L0345B4
L0345AE         JSR   L033A5C
                BCC   L0345B4
                RTS

L0345B4         BIT   L032FD6
                BPL   L0345E0
                LDA   $6C
                STA   $96
                LDA   $6E
                STA   $98
                LDA   #$0000
                STAL  L040029
                JSL   L041DEA
                BCS   L0345D1
                BRL   L03467C
L0345D1         AND   #$00FF
                CMP   #$002F
                BEQ   L0345AE
                CMP   #$002E
                BEQ   L0345AE
                SEC
                RTS

L0345E0         LDA   L032EBC
                LDY   L032EBE
                JSR   L033372
                STY   L032EE6
                TXY
                BEQ   L0345F0
                INC
L0345F0         STA   L032EE4
                LDA   L032EE4
                STA   L032EF4
                LDA   L032EF4
                STA   L032EEC
                STZ   L032EEE
                LDX   L032ED4
L034605         ASL   L032EEC
                ROL   L032EEE
                DEX
                BNE   L034605
                LDA   #$0006
                LDY   #$0000
                STA   [$02],Y
                INY
                INY
                LDA   L032EDA
                STA   [$02],Y
                INY
                INY
                LDA   $6C
                STA   [$02],Y
                INY
                INY
                LDA   $6E
                STA   [$02],Y
                INY
                INY
                LDA   L032EEC
                STA   [$02],Y
                LDA   L032EEE
                INY
                INY
                STA   [$02],Y
                INY
                INY
                LDA   L032EE8
                STA   [$02],Y
                INY
                INY
                LDA   L032EEA
                STA   [$02],Y
                INY
                INY
                LDA   L032EF0
                STA   [$02],Y
                LDA   #$2030
                JSR   L033500
                BCC   L03467C
                CMP   #$002F
                BNE   L03465C
L034659         BRL   L0345AE
L03465C         CMP   #$002E
                BEQ   L034659
                LDX   L0330D2
                BNE   L03467A
                CMP   #$0027
                BNE   L03467A
                TAX
                LDA   L032EF2
                AND   #$0004
                TAY
                TXA
                TYX
                BEQ   L03467A
                JMP   L033EC4

L03467A         SEC
                RTS

L03467C         STZ   L0370B0
                BIT   L032FD6
                BPL   L0346BD
                LDA   L032EE8
                CLC
                ADC   L032FDC
                STA   L032EE8
                LDAL  L040026
                EOR   #$8000
                STAL  L040026
                BMI   L0346DF
                LDAL  L040025
                INC
                STAL  L040025
                CMP   #$0050
                BNE   L0346DF
                LDA   L033132
                STA   $78
                LDA   L033134
                STA   $7A
                LDY   #$000A
                LDA   #$0640
                STA   [$78],Y
                BRA   L0346DC
L0346BD         LDA   L032EE8
                CLC
                ADC   L032EF4
                STA   L032EE8
                BCC   L0346CC
                INC   L032EE8
L0346CC         LDA   L032EE8
                CMP   L032ED6
                BNE   L0346DF
                LDA   L032EEA
                CMP   L032ED8
                BNE   L0346DF
L0346DC         JMP   L033E8A

L0346DF         LDA   L032EDA
                BEQ   L034748
                BIT   L032FD6
                BPL   L034708
                LDAL  L040025
                AND   #$00FF
                LSR
                LSR
                LSR
                LSR
                EOR   #$FFFF
                SEC
                ADC   #$000C
                STA   L032FDC
                XBA
                ASL
                STA   L032EC8
                STZ   L032ECA
                BRA   L034748
L034708         LDA   L032ED6
                SEC
                SBC   L032EE8
                TAX
                LDA   L032ED8
                SBC   L032EEA
                BNE   L03473C
                STZ   L032ECA
                STX   L032EC8
                LDX   L032ED4
L034721         ASL   L032EC8
                ROL   L032ECA
                DEX
                BNE   L034721
                LDA   L032ECA
                CMP   L032EC2
                BCC   L034748
                BNE   L03473C
                LDA   L032EC8
                CMP   L032EC0
                BCC   L034748
L03473C         LDA   L032EC0
                STA   L032EC8
                LDA   L032EC2
                STA   L032ECA
L034748         STZ   L032EBC
                STZ   L032EBE
                LDA   #$0000
                CLC
                RTS

L034753         STR   'Writing data to backup setI'
L03476F         LDA   #$0200
                LDX   L032EDC
                CPX   #$0020
                BNE   L03477D
                LDA   #$2000
L03477D         STA   L032EF0
                LDA   #$0000
                CLC
                RTS

L034785         LDY   #$000A
                STA   [$02],Y
                LDY   #$0008
                TXA
                STA   [$02],Y
                LDY   #$0006
L034793         LDA   L0347C4,Y
                STA   [$02],Y
                DEY
                DEY
                BPL   L034793
                LDY   #$0026
                LDA   #L033104
                STA   [$02],Y
                INY
                INY
                LDA   #^L033104
                STA   [$02],Y
                LDA   #$2010
                JSR   L033500
                BCC   L0347B7
                STZ   L032ED0
                RTS

L0347B7         LDY   #$0002
                LDA   [$02],Y
                STA   L032ED0
                LDA   #$0000
                CLC
                RTS

L0347C4         DW    $000F
                DW    $0000
                ADRL  L0301D1
L0347CC         LDA   L032F0C
                STA   L033032
                JSR   L034C90
                STX   L03302E
                STA   L033030
                JSR   L03454D
                BCC   L0347E1
                RTS

L0347E1         BIT   L032FD6
                BPL   L03484A
                LDAL  L040025
                ORAL  L040027
                BEQ   L034838
                LDX   #L034894
                JSR   L03793E
                LDA   L0370B0
                BEQ   L034801
L0347FB         JSR   L033A5C
                BCC   L034801
                RTS

L034801         LDA   #$8000
                STAL  L040029
                JSL   L041DEA
                BCC   L03481D
                AND   #$00FF
                CMP   #$002F
                BEQ   L0347FB
                CMP   #$002E
                BEQ   L0347FB
                SEC
                RTS

L03481D         LDAL  L040026
                EOR   #$8000
                STAL  L040026
                BMI   L034801
                LDAL  L040025
                INC
                STAL  L040025
                CMP   #$0050
                BNE   L034801
L034838         LDA   L033132
                STA   $78
                LDA   L033134
                STA   $7A
                LDY   #$000A
                LDA   #$0640
                STA   [$78],Y
L03484A         LDA   L032FD2
                CLC
                ADC   L032FCE
                STA   L032FCE
                LDA   L032FD4
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                STZ   L032FD2
                STZ   L032FD4
                BIT   L032FD6
                BPL   L034892
                LDAL  L060002
                AND   #$0010
                BEQ   L034892
                LDA   L0370AA
                STA   L0370AC
                LDX   #L0343EF
                JSR   L03793E
                JSR   L0395E4
                PHP
                PHA
                LDX   L0370AC
                JSR   L03793E
                PLA
                PLP
                BCC   L034892
                JMP   L033EC4

L034892         CLC
                RTS

L034894         STR   'Finishing disk formatI'
L0348AB         TSC
                SEC
                SBC   #$000C
                TCS
                LDA   $68
                STA   $01,S
                LDA   $6A
                STA   $03,S
                LDA   L032EB4
                STA   $05,S
                LDA   L032EB6
                STA   $07,S
L0348C3         LDA   L032EBC
                CLC
                ADC   $05,S
                STA   L032EC4
                LDA   L032EBE
                ADC   $07,S
                STA   L032EC6
                CMP   L032ECA
                BCC   L0348EF
                BNE   L0348E3
                LDA   L032EC8
                CMP   L032EC4
                BCS   L0348EF
L0348E3         LDA   L032EC8
                STA   L032EC4
                LDA   L032ECA
                STA   L032EC6
L0348EF         LDA   L032EC4
                SEC
                SBC   L032EBC
                STA   $09,S
                LDA   L032EC6
                SBC   L032EBE
                STA   $0B,S
                LDA   $01,S
                TAX
                LDA   $03,S
                PHA
                PHX
                LDA   $6C
                CLC
                ADC   L032EBC
                TAX
                LDA   $6E
                ADC   L032EBE
                PHA
                PHX
                LDA   $11,S
                TAX
                LDA   $13,S
                PHA
                PHX
                _BlockMove
                LDA   L032EC4
                LDX   L032EC6
                STA   L032EBC
                STX   L032EBE
                CMP   L032EC8
                BNE   L03496F
                CPX   L032ECA
                BNE   L03496F
                LDA   L0370AA
                STA   L03497E
                JSR   L03454D
                BCS   L034972
                LDX   L03497E
                JSR   L03793E
                LDA   $01,S
                CLC
                ADC   $09,S
                STA   $01,S
                LDA   $03,S
                ADC   $0B,S
                STA   $03,S
                LDA   $05,S
                SEC
                SBC   $09,S
                STA   $05,S
                TAX
                LDA   $07,S
                SBC   $0B,S
                STA   $07,S
                BNE   L03496C
                TXA
                BNE   L03496C
                BRA   L03496F
L03496C         BRL   L0348C3
L03496F         LDA   #$0000
L034972         TAX
                TSC
                CLC
                ADC   #$000C
                TCS
                TXA
                CMP   #$0001
                RTS

L03497E         DW    $0000
L034980         LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032ED0
                STA   [$02],Y
                INY
                INY
                LDA   $70
                STA   [$02],Y
                INY
                INY
                LDA   $72
                STA   [$02],Y
                LDY   #$0008
                LDA   L032EDE
                STA   [$02],Y
                INY
                INY
                LDA   L032EE0
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                RTS

L0349AF         LDA   L032ECC
                STA   L032EB8
                LDA   L032ECE
                STA   L032EBA
L0349BB         LDA   L032EBC
                CLC
                ADC   L032EB8
                STA   L032EC4
                LDA   L032EBE
                ADC   L032EBA
                STA   L032EC6
                CMP   L032ECA
                BCC   L0349E9
                BNE   L0349DD
                LDA   L032EC8
                CMP   L032EC4
                BCS   L0349E9
L0349DD         LDA   L032EC8
                STA   L032EC4
                LDA   L032ECA
                STA   L032EC6
L0349E9         LDA   L032EC4
                SEC
                SBC   L032EBC
                STA   L032EDE
                LDA   L032EC6
                SBC   L032EBE
                STA   L032EE0
                LDA   $6C
                CLC
                ADC   L032EBC
                STA   $70
                LDA   $6E
                ADC   L032EBE
                STA   $72
                JSR   L034980
                BCC   L034A13
                SEP   #$41
                RTS

L034A13         LDA   L032EE0
                STA   $78
                LDA   L032EDE
                LSR   $78
                ROR
                TAY
                CLC
                ADC   L032FD2
                STA   L032FD2
                LDA   $78
                ADC   L032FD4
                STA   L032FD4
                TYA
                CLC
                ADC   L032FCE
                STA   L032FCE
                LDA   L032FD0
                ADC   $78
                STA   L032FD0
                JSR   L03353E
                LDA   L032EB8
                SEC
                SBC   L032EDE
                STA   L032EB8
                LDA   L032EBA
                SBC   L032EE0
                STA   L032EBA
                LDA   L032EC4
                LDX   L032EC6
                STA   L032EBC
                STX   L032EBE
                CMP   L032EC8
                BNE   L034A6A
                CPX   L032ECA
                BEQ   L034A6D
L034A6A         BRL   L034AF7
L034A6D         LDA   #L033ABE
                STA   L033054
                LDA   $0A
                STA   L033094
                LDA   $0C
                STA   L033096
                LDA   L032FCE
                STA   L033098
                LDA   L032FD0
                STA   L03309A
                LDA   L032F2A
                STA   L03309C
                LDA   L030BE8
                STA   L03309E
                LDA   L032ECC
                STA   L0330A0
                LDA   L032ECE
                STA   L0330A2
                LDA   L032EB8
                STA   L0330A4
                LDA   L032EBA
                STA   L0330A6
                LDA   L032ED2
                STA   L0330A8
                LDA   L0370AA
                STA   L0370AC
                SEC
                ROR   L0370C6
L034ABD         JSR   L03454D
                BCC   L034AC5
                REP   #$40
                RTS

L034AC5         STZ   L0370C6
                LDX   L0370B2
                JSR   L03793E
                LDA   L032FD2
                CLC
                ADC   L032FCE
                STA   L032FCE
                LDA   L032FD4
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                STZ   L032FD2
                STZ   L032FD4
                LDA   L032EB8
                ORA   L032EBA
                BNE   L034AF4
                BRA   L034AF7
L034AF4         BRL   L0349BB
L034AF7         LDA   #$0000
                CLC
                RTS

L034AFC         LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032ED0
                BEQ   L034B17
                STA   [$02],Y
                LDA   #$2014
                JSR   L033500
                BCC   L034B17
                STZ   L032ED0
                RTS

L034B17         LDA   #$0000
                CLC
                RTS

L034B1C         PHX
                PHA
                LDA   #$0003
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                PLA
                STA   [$02],Y
                INY
                INY
                PLA
                STA   [$02],Y
                LDA   #$2016
                JSR   L033500
                RTS

L034B43         STZ   L033038
                LDA   #L033B8E
                STA   L033054
                LDA   $0A
                STA   L033094
                LDA   $0C
                STA   L033096
                LDA   L032FCE
                STA   L033098
                LDA   L032FD0
                STA   L03309A
                LDA   L032F2A
                STA   L03309C
                LDA   L032EC8
                SEC
                SBC   L032EBC
                TAX
                LDA   L032ECA
                SBC   L032EBE
                BNE   L034B7D
                STX   L0330A0
                BRA   L034B86
L034B7D         STZ   L0330A0
                LDA   L030BE8
                STA   L03309E
L034B86         LDX   #$0060
L034B89         DEX
                DEX
                STZ   L032F2C,X
                BNE   L034B89
                LDA   L032EA8
                EOR   L032F08
                STA   L032F2C
                LDA   L032EAA
                EOR   L032F0A
                STA   L032F2E
                LDA   L032EAC
                STA   L032F30
                LDAL  L0301D1
                DEC
                CLC
                ADC   #$0062
                STA   L032F32
                LDA   L032EE2
                STA   L032F56
                LDA   #$0000
                STA   L032F58
                STA   L032F5A
                STA   L032F5C
                STA   L032F5E
                LDX   #$FFFE
L034BCC         INX
                INX
                LDA   L034C64,X
                BMI   L034BCC
                BEQ   L034BDD
                TAY
                LDA   [$02],Y
                STA   L032F2C,X
                BRA   L034BCC
L034BDD         LDX   #$002A
L034BE0         LDA   L033106,X
                STA   L032F60,X
                DEX
                DEX
                BPL   L034BE0
                LDA   L033038
                SEC
                SBC   #$0060
                BCC   L034BF8
                STA   L033038
                BRA   L034C20
L034BF8         LDA   #L032F2C
                CLC
                ADC   L033038
                STA   $68
                LDA   #^L032F2C
                ADC   #$0000
                STA   $6A
                LDA   #$0060
                SEC
                SBC   L033038
                STA   L032EB4
                STZ   L032EB6
                STZ   L033038
                JSR   L0348AB
                BCC   L034C20
                BRA   L034C4A
L034C20         LDA   #L0301D1
                CLC
                ADC   L033038
                STA   $68
                LDA   #^L0301D1
                ADC   #$0000
                STA   $6A
                LDAL  L0301D1
                INC
                SEC
                SBC   L033038
                BCS   L034C41
                LDA   #$0000
                BRA   L034C4A
L034C41         STA   L032EB4
                STZ   L032EB6
                JSR   L0348AB
L034C4A         TAX
                LDA   L032EF6
                STA   $78
                LDA   L032EF8
                STA   $7A
                LDY   #$0004
                LDA   [$78],Y
                AND   #$7FFF
                STA   [$78],Y
                TXA
                CMP   #$0001
                RTS

L034C64         DW    $8000
                DW    $8000
                DW    $8000
                DW    $8000
                DW    $000C
                DW    $000E
                DW    $0010
                DW    $0012
                DW    $0014
                DW    $002A
                DW    $002C
                DW    $0016
                DW    $0018
                DW    $001A
                DW    $001C
                DW    $001E
                DW    $0020
                DW    $0022
                DW    $0024
                DW    $0032
                DW    $0034
                DW    $0000
L034C90         LDA   L032EDA
                BNE   L034CA4
                LDA   L032FE8
                CLC
                ADC   L032EBC
                TAX
                LDA   L032FEA
                ADC   L032EBE
                RTS

L034CA4         LDA   L032EBC
                STA   L032F1A
                LDA   L032EBE
                STA   L032F1C
                LDA   L032EEA
                STA   L032F20
                LDA   L032EE8
                LDX   L032ED4
L034CBC         ASL
                ROL   L032F20
                DEX
                BNE   L034CBC
                STA   L032F1E
                CLC
                ADC   L032F1A
                TAX
                LDA   L032F20
                ADC   L032F1C
                RTS

L034CD2         LDX   L0370B2
                JSR   L03793E
                STZ   L0370C6
                JSR   L033419
L034CDE         LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BNE   L034CEB
                BRL   L034DD0
L034CEB         JSR   L034C90
                LDY   #$0026
                STA   [$0A],Y
                DEY
                DEY
                TXA
                STA   [$0A],Y
                LDY   #$0022
                LDA   L032F0C
                STA   [$0A],Y
                LDA   #$0000
                LDX   #$0001
                JSR   L034785
                BCC   L034D14
                JSR   L031B6F
                BCC   L034D11
                RTS

L034D11         BRL   L034DD0
L034D14         LDA   #$8000
                TSB   L032F2A
                LDX   #L030B20
                JSR   L0305D3
                LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BNE   L034D33
                STZ   L032F2A
                JSR   L034AFC
                BRL   L034DD0
L034D33         LDY   #$002A
                LDA   [$02],Y
                STA   L03313A
                INY
                INY
                LDA   [$02],Y
                STA   L03313C
                LDY   #$0014
                LDA   [$02],Y
                STA   L03313E
                SEC
                ROR   L0370C6
L034D4E         JSR   L034B43
                BCC   L034D54
                RTS

L034D54         STZ   L0370C6
                LDA   L032F32
                LDY   #$0028
                STA   [$0A],Y
                LDA   L03313A
                STA   L032ECC
                LDA   L03313C
                STA   L032ECE
                LDA   L03313E
                STA   L032ED2
L034D71         JSR   L0349AF
                BCC   L034D89
L034D76         BVS   L034D7A
L034D78         SEC
                RTS

L034D7A         PHA
                JSR   L034AFC
                STZ   L032F2A
                PLA
L034D82         JSR   L031B6F
                BCS   L034D78
                BRA   L034DD0
L034D89         JSR   L034AFC
                BCS   L034D78
                STZ   L032F2A
                LDA   L032ED2
                CMP   #$0005
                BNE   L034DC6
                LDA   #$0001
                LDX   #$0001
                JSR   L034785
                BCS   L034D82
                LDA   #$4000
                TSB   L032F2A
                LDY   #$0032
                LDA   [$02],Y
                STA   L032ECC
                INY
                INY
                LDA   [$02],Y
                STA   L032ECE
L034DB9         JSR   L0349AF
                BCS   L034D76
                JSR   L034AFC
                STZ   L032F2A
                BCS   L034D82
L034DC6         LDY   #$001C
                LDA   [$0A],Y
                AND   #$FF7F
                STA   [$0A],Y
L034DD0         LDA   #$2000
                STA   L033024
                JSR   L0333A2
                BCS   L034DE4
                JSR   L0334DA
                BCC   L034DE1
                RTS

L034DE1         BRL   L034CDE
L034DE4         LDA   #$0000
                CLC
                RTS

L034DE9         LDA   L032EF0
                CMP   #$0200
                BEQ   L034DF5
                STZ   L032F0E
                RTS

L034DF5         LDA   L032ED8
                BEQ   L034E01
                LDA   #$0010
                STA   L032F0E
                RTS

L034E01         STZ   L032F0E
                LDA   L032ED6
                LDX   #$0004
L034E0A         ASL
                ROL   L032F0E
                DEX
                BNE   L034E0A
                TAX
                BEQ   L034E17
                INC   L032F0E
L034E17         RTS

L034E18         SEC
                JSR   L033340
                LDY   #$0008
                LDX   #$000A
L034E22         LDA   L032E9F+7,X
                STA   [$74],Y
                DEY
                DEY
                DEX
                DEX
                BNE   L034E22
                LDY   #$000A
                LDA   L033034
                STA   [$74],Y
                LDY   #$0012
                LDX   #$0008
L034E3B         LDA   L032EF8,X
                STA   [$74],Y
                DEY
                DEY
                DEX
                DEX
                BNE   L034E3B
                CPY   #$0012
                BEQ   L034E53
                LDY   #$001A
                LDX   #$0008
                BRA   L034E3B
L034E53         LDA   L032F02
                STA   $78
                LDA   L032F04
                STA   $7A
                LDY   #$0002
                LDA   [$78],Y
                TAX
                LDA   [$78]
                SEC
                SBC   #$001E
                STA   $78
                BCS   L034E6E
                DEX
L034E6E         STX   $7A
                LDY   #$001E
                LDX   #$0014
L034E76         LDA   [$78],Y
                STA   [$74],Y
                INY
                INY
                DEX
                BNE   L034E76
                LDA   #$001E
                CLC
                ADC   L032F06
                TAY
                SEP   #$20
                LDA   #$20
L034E8B         CPY   #$0046
                BEQ   L034E95
                STA   [$74],Y
                INY
                BRA   L034E8B
L034E95         REP   #$20
                LDA   L032F08
                LDY   #$0046
                STA   [$74],Y
                INY
                INY
                LDA   L032F0A
                STA   [$74],Y
                LDY   #$004A
                LDA   L032F0C
                STA   [$74],Y
                BIT   L032FD8
                BMI   L034EC9
                LDY   #$01B2
                LDA   [$06],Y
                TAX
                INY
                INY
                LDA   [$06],Y
                LDY   #$0050
                STA   [$74],Y
                DEY
                DEY
                TXA
                STA   [$74],Y
                BRA   L034ED8
L034EC9         LDA   L037042
                LDY   #$004E
                STA   [$74],Y
                LDA   L037044
                INY
                INY
                STA   [$74],Y
L034ED8         JSR   L034DE9
                BIT   L032FD8
                BMI   L034EE6
                LDA   L032F0C
                DEC
                BNE   L034F0A
L034EE6         LDA   L032EF0
                CMP   #$0200
                BEQ   L034EF3
                LDA   #$0400
                BRA   L034EFB
L034EF3         LDA   L032F0E
                INC
                INC
                INC
                XBA
                ASL
L034EFB         LDY   #$0054
                STA   [$74],Y
                STA   L032F28
                INY
                INY
                LDA   #$0000
                STA   [$74],Y
L034F0A         BIT   L032FD8
                BMI   L034F2E
                LDY   #$000C
                LDA   [$06],Y
                TAX
                DEY
                DEY
                LDA   [$06],Y
                LDY   #$000E
                CLC
                ADC   [$06],Y
                BCC   L034F22
                INX
L034F22         LDY   #$0058
                STA   [$74],Y
                TXA
                INY
                INY
                STA   [$74],Y
                BRA   L034F56
L034F2E         LDA   L037046
                LDY   #$005C
                STA   [$74],Y
                LDA   L037054
                LDY   #$0062
                STA   [$74],Y
                LDA   L03704C
                LDY   #$0060
                STA   [$74],Y
                LDA   L037022
                LDY   #$006C
                STA   [$74],Y
                LDA   L03705A
                LDY   #$006E
                STA   [$74],Y
L034F56         LDA   $74
                STA   $68
                LDA   $76
                STA   $6A
                LDA   #$0200
                STA   L032EB4
                STZ   L032EB6
                JSR   L0348AB
                BCC   L034F6D
                RTS

L034F6D         LDX   L032EF6
                STX   $78
                LDX   L032EF8
                STX   $7A
                LDY   #$0004
                LDA   [$78],Y
                AND   #$7FFF
                STA   [$78],Y
                LDA   #$0000
                CLC
                RTS

L034F86         LDA   #$0008
                STA   [$02]
                LDA   L032EDA
                LDY   #$0002
                STA   [$02],Y
                LDA   #L034FEA
                LDY   #$0004
                STA   [$02],Y
                INY
                INY
                LDA   #^L034FEA
                STA   [$02],Y
                LDA   #$202C
                JSR   L033500
                BCC   L034FAB
                RTS

L034FAB         LDY   #$000A
                LDA   [$02],Y
                STA   L032ED6
                INY
                INY
                LDA   [$02],Y
                STA   L032ED8
                LDY   #$0014
                LDA   [$02],Y
                STA   L032EDC
                LDY   #$0010
                LDA   [$02],Y
                STA   L032FDE
                LDY   #$000E
                LDA   [$02],Y
                STA   L032FE0
                JSR   L03476F
                BCC   L034FD8
                RTS

L034FD8         LDA   L032EF0
                LDX   #$FFFF
L034FDE         INX
                LSR
                BCC   L034FDE
                STX   L032ED4
                LDA   #$0000
                CLC
                RTS

L034FEA         CLC
                DB    $00
L034FEC         DB    $00
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
L035002         LDA   L032FE0
                CMP   #$0005
                BNE   L035036
                STZ   L032FDA
                STZ   L035097
                LDA   #$0008
                STA   [$02]
                LDY   #$0002
                LDA   #$0001
                STA   [$02],Y
                LDY   #$0004
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
L035029         LDA   #$202C
                JSR   L033500
                BCC   L035038
                CMP   #$0011
                BEQ   L03508D
L035036         SEC
                RTS

L035038         LDY   #$0014
                LDA   [$02],Y
                CMP   #$0003
                BNE   L035083
                LDY   #$000E
                LDA   [$02],Y
                CMP   #$0005
                BNE   L035083
                LDAL  $00BD20
                STA   $78
                LDAL  $00BD22
                STA   $7A
                LDY   #$0044
                LDA   [$78],Y
                CMP   #$00C0
                BNE   L035083
                LDY   #$0010
                LDA   [$02],Y
                CMP   L032FDE
                BEQ   L035076
                BCS   L035083
                LDA   #$0001
                STA   L032FDA
                BRA   L035083
L035076         INC   L035097
                LDA   $78
                STA   L033132
                LDA   $7A
                STA   L033134
L035083         LDY   #$0002
                LDA   [$02],Y
                INC
                STA   [$02],Y
                BRA   L035029
L03508D         LDA   L035097
                BEQ   L035036
                LDA   L032FDA
                CLC
                RTS

L035097         DW    $0000
L035099         LDA   L032F0C
                PHA
                PEA   ^L035178
                PEA   L035178
                PEA   $0005
                PEA   $0000
                _Int2Dec
                LDX   #$0005
                SEP   #$20
L0350B5         LDA   L03516F+8,X
                CMP   #$20
                BNE   L0350C1
                LDA   #$30
                STA   L03516F+8,X
L0350C1         DEX
                BNE   L0350B5
                REP   #$20
                LDA   L032ED8
                BEQ   L0350D0
                LDA   #$FFFF
                BRA   L0350D3
L0350D0         LDA   L032ED6
L0350D3         STA   L035193
                LDA   L032EFE
                CLC
                ADC   #$0101
                SEP   #$20
                ASL
                ASL
                ASL
                REP   #$20
                LSR
                LSR
                LSR
                AND   #$01FF
                STA   L035186
                LDA   L032EFD
                AND   #$007F
                ASL
                XBA
                ORA   L035186
                STA   L035186
                STA   L035180
                LDA   L032EFB
                STA   L035188
                STA   L035182
                SEC
                JSR   L033340
                LDY   #$0029
L03510E         LDA   L03516A,Y
                STA   [$74],Y
                DEY
                DEY
                BPL   L03510E
                LDA   $74
                STA   $68
                LDA   $76
                STA   $6A
                LDA   #$0200
                STA   L032EB4
                STZ   L032EB6
                JSR   L0348AB
                BCC   L03512F
                BRA   L035150
L03512F         LDY   #$01FE
                LDA   #$0000
L035135         STA   [$74],Y
                DEY
                DEY
                BPL   L035135
                LDA   L032F0E
                STA   L035195
L035141         JSR   L0348AB
                BCC   L035148
                BRA   L035150
L035148         DEC   L035195
                BNE   L035141
                LDA   #$0000
L035150         TAX
                LDA   L032EF6
                STA   $78
                LDA   L032EF8
                STA   $7A
                LDY   #$0004
                LDA   [$78],Y
                AND   #$7FFF
                STA   [$78],Y
                TXA
                CMP   #$0001
                RTS

L03516A         DB    $00
                DB    $00
                DB    $00
                DB    $00
                ASC   "~"
L03516F         ASC   'ARCHIVER.'
L035178         DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L035180         DB    $00
                DB    $00
L035182         DB    $00
                DB    $00
                DB    $00
                DB    $00
L035186         DB    $00
                DB    $00
L035188         DB    $00
                DB    $00
                DB    $08
                DB    $00
                DB    $C3
                DB    $27
                DB    $0D
                DB    $00
                DB    $00
                DB    $03
                DB    $00
L035193         DB    $00
                DB    $00
L035195         DB    $00
                DB    $00
L035197         STZ   L032FD6
                LDA   L032EDA
                BEQ   L0351DF
                LDA   L032EDC
                CMP   #$0003
                BNE   L0351CA
                LDA   L032EC2
                BNE   L0351B4
                LDA   L032EC0
                CMP   #$1800
                BCC   L0351CA
L0351B4         JSR   L035002
                BCS   L0351CA
                STAL  L040023
                LDA   #$0640
                STA   L032ED6
                STZ   L032ED8
                SEC
                ROR   L032FD6
L0351CA         LDA   L032EF2
                AND   #$0004
                BEQ   L0351D9
                JSR   L033E8A
                BCC   L0351DE
                BCS   L0351DE
L0351D9         JSR   L0341A8
                BCC   L0351DE
L0351DE         RTS

L0351DF         STZ   L032FE2
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032FE4
                STA   [$02],Y
                INY
                INY
                LDA   L032FE6
                STA   [$02],Y
                LDA   #$2002
                JSR   L033500
                BCC   L035205
                CMP   #$0046
                BEQ   L035205
                SEC
                RTS

L035205         LDA   #$0005
                STA   [$02]
                LDY   #$0002
                LDA   L032FE4
                STA   [$02],Y
                INY
                INY
                LDA   L032FE6
                STA   [$02],Y
                INY
                INY
                LDA   #$00C3
                STA   [$02],Y
                INY
                INY
                LDA   #$00E0
                STA   [$02],Y
                INY
                INY
                LDA   #$0004
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                LDA   #$2001
                JSR   L033500
                BCC   L035242
L035241         RTS

L035242         LDA   #$0002
                STA   [$02]
                LDY   #$0004
                LDA   L032FE4
                STA   [$02],Y
                INY
                INY
                LDA   L032FE6
                STA   [$02],Y
                LDA   #$2010
                JSR   L033500
                BCS   L035241
                LDY   #$0002
                LDA   [$02],Y
                STA   L032FE2
                STZ   L032EBC
                STZ   L032EBE
                LDA   L032EC0
                STA   L032EC8
                LDA   L032EC2
                STA   L032ECA
                STZ   L032FE8
                STZ   L032FEA
                JSR   L034E18
                RTS

L035282         LDA   L032F0C
                PHA
                PEA   ^L0330D6
                PEA   L0330D6
                PEA   $0005
                PEA   $0000
                _Int2Dec
                LDX   #$0000
                LDY   #$FFFF
                SEP   #$20
L0352A1         INY
                LDA   L0330D6,Y
                CMP   #$20
                BEQ   L0352A1
L0352A9         ORA   #$80
                STA   L033140+$F1,X
                INX
                INY
                LDA   L0330D6,Y
                CPY   #$0005
                BNE   L0352A9
                STZ   L033140+$F1,X
                REP   #$20
                BIT   L032FD8
                BMI   L0352CE
                LDY   #$01B2
                LDA   [$06],Y
                TAX
                INY
                INY
                LDA   [$06],Y
                BRA   L0352D4
L0352CE         LDX   L037042
                LDA   L037044
L0352D4         PHA
                PHX
                PEA   ^L0330D6
                PEA   L0330D6
                PEA   $000A
                PEA   $0000
                _Long2Dec
                SEP   #$20
                LDX   #$0000
                STZ   $78
L0352F0         LDA   L0330D6,X
                CMP   #$20
                BNE   L035302
                DEC   $78
                BPL   L0352FF
                LDA   #$02
                STA   $78
L0352FF         INX
                BRA   L0352F0
L035302         LDY   #$0000
L035305         LDA   L0330D6,X
                INX
L035309         ORA   #$80
                STA   L033240+$14,Y
                INY
                CPX   #$000A
                BEQ   L035320
                DEC   $78
                BPL   L035305
                LDA   #$03
                STA   $78
                LDA   #$AC
                BRA   L035309
L035320         LDX   #$0000
                BIT   L032FD9
                BMI   L035334
L035328         LDA   L03536E,X
                STA   L033240+$14,Y
                BEQ   L035340
                INY
                INX
                BRA   L035328
L035334         LDA   L035375,X
                STA   L033240+$14,Y
                BEQ   L035340
                INY
                INX
                BRA   L035334
L035340         REP   #$20
                LDA   #L033140
                STA   $68
                LDA   #^L033140
                STA   $6A
                LDA   #$0200
                STA   L032EB4
                STZ   L032EB6
                JSR   L0348AB
                BCC   L03535B
                RTS

L03535B         JSR   L034E18
                BCC   L035361
                RTS

L035361         LDA   L032EF0
                CMP   #$0200
                CLC
                BNE   L03536D
                JSR   L035099
L03536D         RTS

L03536E         ASC   " BYTES"00
L035375         ASC   " BLOCKS"00
L03537D         _CompactMem
                LDX   #$0200
                LDA   #$0000
                LDY   L032F14
                JSR   L0325E6
                STX   L032EF6
                STY   L032EF8
                BCC   L03539C
                LDA   #$0054
                RTS

L03539C         LDA   L032EDA
                BEQ   L0353E6
                JSR   L034F86
                BCC   L0353A7
                RTS

L0353A7         LDA   L032EF0
                CMP   #$0200
                BEQ   L0353E6
                LDX   L032EF6
                STX   $78
                LDX   L032EF8
                STX   $7A
                LDY   #$0004
                LDA   [$78],Y
                AND   #$7FFF
                STA   [$78],Y
                PEA   $0000
                LDA   L032EF0
                PHA
                PHX
                LDA   L032EF6
                PHA
                _SetHandleSize
                BCC   L0353DC
                LDA   #$0054
                RTS

L0353DC         LDY   #$0004
                LDA   [$78],Y
                ORA   #$8000
                STA   [$78],Y
L0353E6         LDA   #$0000
                CLC
                RTS

L0353EB         LDA   L032EF8
                PHA
                LDA   L032EF6
                PHA
                _DisposeHandle
                STZ   L032EF8
                RTS

L0353FE         PHA
                PHA
                _MaxBlock
                TAY
                PLA
                PLX
                STA   L03547A
                STAL  $0002F8
                STX   L03547C
                PHA
                TXA
                STAL  $0002FA
                PLA
                SEC
                SBC   #$8002
                BCS   L03542A
                CPX   #$0000
                BNE   L035429
L035426         TYA
                SEC
                RTS

L035429         DEX
L03542A         LDY   L032EF0
                CPY   #$0200
                BEQ   L035437
                AND   #$E000
                BRA   L03543A
L035437         AND   #$FE00
L03543A         BIT   L032FD8
                BPL   L035443
                CLC
                ADC   #$0002
L035443         STA   L032EC0
                TAY
                STX   L032EC2
                AND   #$FFFC
                ORA   L032EC2
                BEQ   L035426
                TXA
                TYX
                LDY   L032F14
                JSR   L0325E6
                STX   L032F10
                STX   $78
                STY   L032F12
                STY   $7A
                BCC   L03546A
                LDA   #$0054
                RTS

L03546A         LDA   [$78]
                STA   $6C
                LDY   #$0002
                LDA   [$78],Y
                STA   $6E
                LDA   #$0000
                CLC
                RTS

L03547A         DW    $0000
L03547C         DW    $0000
L03547E         ENT
                PHB
                LDA   $01,S
                PHK
                PLB
                STA   L032FC6
                TDC
                STA   L032EB2
                LDA   $05,S
                TCD
                LDA   $09,S
                STA   L032EDA
                LDA   $0B,S
                STA   L032EF2
                LDA   $07,S
                ORA   #$0300
                STA   L032F14
                LDA   $0D,S
                STA   L032F02
                LDA   $0F,S
                STA   L032F04
                LDA   $11,S
                STA   L032F06
                LDA   $13,S
                STA   $22
                LDA   $15,S
                STA   $24
                LDA   $17,S
                STA   L032FE4
                LDA   $19,S
                STA   L032FE6
                LDA   $1B,S
                STA   $3A
                LDA   $1D,S
                STA   $3C
                PLA
                STA   $19,S
                PLA
                STA   $19,S
                TSC
                CLC
                ADC   #$0016
                TCS
                STA   L033050
                LDA   #L038997
                STA   L033102
                LDA   #$FFFF
                STA   L0370AA
                JSR   L0334DA
                BCC   L0354EB
                BRL   L0357F3
L0354EB         LDX   #L0358F3
                JSR   L03793E
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                STZ   L032FD8
                STZ   L032F16
                LDAL  L060002
                LDX   #$8000
                STZ   L033036
                BIT   #$0040
                BNE   L035513
                STX   L033036
L035513         PHD
                PHA
                JSL   L031AE4
                SEC
                ROR   L0370C6
                JSR   L03537D
                BCC   L035525
L035522         BRL   L0357F3
L035525         JSR   L0353FE
                BCS   L035522
                LDA   [$1A]
                STA   $06
                LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                JSR   L033562
                PHA
                PHA
                PHA
                PHA
                _ReadTimeHex
                LDX   #$0000
L035546         PLA
                STA   L032EFA,X
                INX
                INX
                CPX   #$0008
                BNE   L035546
                LDA   L032EFA
                EOR   L032EFC
                TAX
                LDA   L032EFE
                EOR   L032F00
                LDY   #$0004
                EOR   [$06],Y
                INY
                INY
                EOR   [$06],Y
                LDY   #$0008
                EOR   [$06],Y
                LDY   #$000A
                EOR   [$06],Y
                STA   L032F0A
                TXA
                INY
                INY
                EOR   [$06],Y
                INY
                INY
                EOR   [$06],Y
                LDY   #$01B2
                EOR   [$06],Y
                INY
                INY
                EOR   [$06],Y
                STA   L032F08
                STZ   L033034
                LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2034
                JSR   L033500
                BCC   L0355AB
                BRL   L0357F3
L0355AB         JSR   L03738B
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #$8000
                STA   [$02],Y
                LDA   #$200C
                JSR   L033500
L0355C1         LDA   #L033C24
                STA   L033052
                STZ   L032F0C
                STZ   L032F2A
                STZ   L0330D2
                JSR   L03350A
                STZ   L032EBC
                STZ   L032EBE
                SEC
                ROR   L0370C6
                JSR   L035197
                BCC   L0355E5
                BRL   L0357F3
L0355E5         STZ   L032FD2
                STZ   L032FD4
                STZ   L030BE8
                JSR   L0334DA
                BCC   L0355F6
                BRL   L0357F3
L0355F6         LDA   L032ECA
                BNE   L03560E
                LDA   L032EC8
                CMP   #$8000
                BCS   L03560E
                LDA   #L0358DD
                STA   L0370B2
                STA   L0370B4
                BRA   L03561A
L03560E         LDA   #L0358CE
                STA   L0370B2
                LDA   #L034753
                STA   L0370B4
L03561A         LDY   #$000C
                LDA   [$06],Y
                TAX
                DEY
                DEY
                LDA   [$06],Y
                LDY   #$000E
                CLC
                ADC   [$06],Y
                BCC   L03562D
                INX
L03562D         STA   L032EB4
                STX   L032EB6
                LDA   $06
                STA   $68
                LDA   $08
                STA   $6A
                SEC
                ROR   L0370C6
                JSR   L0348AB
                BCC   L035647
                BRL   L0357F3
L035647         BIT   L032FD6
                BPL   L035674
                LDA   L032EBC
                AND   #$01FF
                BEQ   L03567C
                EOR   #$FFFF
                SEC
                ADC   #$0200
                STA   L032EB4
                STZ   L032EB6
                LDA   $74
                STA   $68
                LDA   $76
                STA   $6A
                SEC
                ROR   L0370C6
                JSR   L0348AB
                BCC   L03567C
                BRA   L035679
L035674         JSR   L03454D
                BCC   L03567C
L035679         BRL   L0357F3
L03567C         JSR   L0334DA
                BCC   L035684
                BRL   L0357F3
L035684         JSR   L034CD2
                BCC   L03568F
                STA   L032F16
                BRL   L0357F6
L03568F         SEC
                ROR   L0370C6
                JSR   L0347CC
                BCC   L03569B
                BRL   L0357F3
L03569B         JSR   L037239
                BCC   L0356A3
                BRL   L0357F3
L0356A3         LDA   L032EDA
                BNE   L0356B9
                LDA   #$0200
                LDX   #$0000
                JSR   L034B1C
                BCC   L0356B6
                BRL   L0357F3
L0356B6         BRL   L035734
L0356B9         LDA   L032F28
                LDY   #$0000
                JSR   L033372
                STA   L032EE8
                STY   L032EEA
                STX   L032F26
                TXA
                BEQ   L035718
                LDA   #$0006
                STA   [$02]
                LDY   #$0002
                LDA   L032EDA
                STA   [$02],Y
                INY
                INY
                LDA   $6C
                STA   [$02],Y
                INY
                INY
                LDA   $6E
                STA   [$02],Y
                INY
                INY
                LDA   L032EF0
                TAX
                STA   [$02],Y
                LDA   #$0000
                INY
                INY
                STA   [$02],Y
                INY
                INY
                LDA   L032EE8
                STA   [$02],Y
                INY
                INY
                LDA   L032EEA
                STA   [$02],Y
                INY
                INY
                TXA
                STA   [$02],Y
                SEC
                ROR   L0370C6
                LDA   #$202F
                JSR   L033500
                BCC   L035718
                BRL   L0357F3
L035718         STZ   L032FD6
                DEC   L0330D2
                STZ   L032EBC
                STZ   L032EBE
                SEC
                ROR   L0370C6
                JSR   L03454D
                LDA   L032F26
                STA   L032EBC
                STZ   L032EBE
L035734         LDY   #$000C
                LDA   [$06],Y
                TAX
                DEY
                DEY
                LDA   [$06],Y
                LDY   #$000E
                CLC
                ADC   [$06],Y
                BCC   L035747
                INX
L035747         STA   L032EB4
                STX   L032EB6
                LDA   $06
                STA   $68
                LDA   $08
                STA   $6A
                JSR   L0348AB
                BCC   L03575D
                BRL   L0357F3
L03575D         LDA   L032EBC
                ORA   L032EBE
                BEQ   L035779
                LDA   L0370AA
                STA   L0370AC
                JSR   L03454D
                BCC   L035773
                BRL   L0357F3
L035773         LDX   L0370AC
                JSR   L03793E
L035779         LDA   #$FFFF
                STA   L032FCE
                STA   L032FD0
                JSR   L03353E
                LDX   #L03590E
                JSR   L03793E
                LDA   #$0000
                STA   [$02]
                LDA   #$201D
                JSR   L033500
                BCS   L0357F3
                JSR   L033419
                STZ   L0370C6
L03579E         LDY   #$001C
                LDA   [$0A],Y
                AND   #$0080
                BNE   L0357D5
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDA   #$200B
                JSR   L033500
                BCC   L0357D5
                CMP   #$0046
                BEQ   L0357D5
                CMP   #$004E
                BEQ   L0357D5
                CMP   #$002B
                BEQ   L0357E0
                BNE   L0357E3
L0357D5         LDA   #$2000
                STA   L033024
                JSR   L0333A2
                BCC   L03579E
L0357E0         LDA   #$0000
L0357E3         PHA
                LDA   #$0000
                STA   [$02]
                LDA   #$201E
                JSR   L033500
                PLX
                BEQ   L0357F3
                TXA
L0357F3         STA   L032F16
L0357F6         LDA   L032EDA
                BNE   L035819
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                BEQ   L035819
                STA   [$02],Y
                LDA   L032F16
                BNE   L035813
                SEC
                ROR   L0370C6
L035813         LDA   #$2014
                JSR   L033500
L035819         JSR   L03860F
                JSR   L0373B3
                LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2035
                JSR   L033500
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #$0000
                STA   [$02],Y
                LDA   #$200C
                JSR   L033500
                LDA   L032F16
                STA   [$22]
                LDA   L030BE8
                STA   [$3A]
                LDA   L032EB2
                TCD
                PLB
                CMP   #$0001
                RTL

                STR   'Please insert the first disk/tape from this backup.'
                STR   'Sorry, you inserted the wrong disk/tape. Please try again.'
L0358CE         STR   'Reading filesI'
L0358DD         STR   'Backing up file dataI'
L0358F3         STR   'Preparing for file backupI'
L03590E         STR   'Marking files that were backed upI'
L035931         ENT
                PHB
                PHK
                PLB
                TDC
                STA   L032EB2
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0300
                STA   L032F14
                LDA   $09,S
                STA   $84
                LDA   $0B,S
                STA   $86
                PLA
                STA   $07,S
                PLA
                STA   $07,S
                TSC
                CLC
                ADC   #$0004
                TCS
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                STZ   L032F16
                STZ   L032EF8
                LDY   #$0006
                LDA   [$84],Y
                STA   L035B14
                LDY   #$0004
                LDA   [$84],Y
                STA   L032EDC
                LDY   #$0012
                LDA   [$84],Y
                STA   L032FE4
                INY
                INY
                LDA   [$84],Y
                STA   L032FE6
                LDY   #$0002
                LDA   [$84],Y
                STA   L032EDA
                BEQ   L0359B4
                STA   L03451F
                PEA   ^L03451D
                PEA   L03451D
                PEA   $202D             ; DStatus
                JSL   GSOS2
                BCC   L0359A8
                STA   L032F16
                BRL   L035B06
L0359A8         LDA   L03452F
                TAX
                AND   #$0010
                BNE   L0359B4
                BRL   L035AEC
L0359B4         LDA   L035B14
                BNE   L0359C2
                TXA
                AND   #$0001
                BNE   L0359C2
                BRL   L035AFE
L0359C2         LDX   #$0200
                LDA   #$0000
                LDY   L032F14
                JSR   L0325E6
                STX   L032EF6
                STX   $78
                STY   L032EF8
                STY   $7A
                BCC   L0359E0
                STA   L032F16
                BRL   L035B06
L0359E0         LDA   [$78]
                STA   $74
                LDY   #$0002
                LDA   [$78],Y
                STA   $76
                LDA   L032EDA
                BEQ   L035A3D
                JSR   L034F86
                BCC   L0359FB
                STA   L032F16
                BRL   L035B06
L0359FB         LDA   L032EF0
                CMP   #$0200
                BEQ   L035A3D
                LDX   L032EF6
                STX   $78
                LDX   L032EF8
                STX   $7A
                LDY   #$0004
                LDA   [$78],Y
                AND   #$7FFF
                STA   [$78],Y
                PEA   $0000
                LDA   L032EF0
                PHA
                PHX
                LDA   L032EF6
                PHA
                _SetHandleSize
                BCC   L035A32
                STA   L032F16
                BRL   L035B06
L035A32         LDA   [$78]
                STA   $74
                LDY   #$0002
                LDA   [$78],Y
                STA   $76
L035A3D         JSR   L033C2B
                BCC   L035A45
                BRL   L035AF9
L035A45         LDY   #$0008
                LDA   [$84],Y
                STA   $80
                INY
                INY
                LDA   [$84],Y
                STA   $82
                LDA   L032F18
                TAX
                CLC
                ADC   #$001D
                ADC   $74
                STA   $78
                LDA   $76
                ADC   #$0000
                STA   $7A
                LDY   #$0028
                SEP   #$20
L035A6A         LDA   [$78],Y
                CMP   #$20
                BNE   L035A73
                DEY
                BNE   L035A6A
L035A73         TYA
                STA   [$80]
                BEQ   L035A7F
L035A78         LDA   [$78],Y
                STA   [$80],Y
                DEY
                BNE   L035A78
L035A7F         REP   #$20
                TXA
                CLC
                ADC   #$0046
                TAY
                LDA   [$74],Y
                STA   L032F08
                INY
                INY
                LDA   [$74],Y
                STA   L032F0A
                TXA
                CLC
                ADC   #$004A
                TAY
                LDA   [$74],Y
                LDY   #$000C
                STA   [$84],Y
                DEC
                BNE   L035AC3
                TXA
                CLC
                ADC   #$0054
                TAY
                LDA   [$74],Y
                STA   L032F22
                INY
                INY
                LDA   [$74],Y
                STA   L032F24
                INY
                INY
                LDA   [$74],Y
                STA   L032FC2
                INY
                INY
                LDA   [$74],Y
                STA   L032FC4
L035AC3         TXA
                CLC
                ADC   #$000A
                TAY
                LDA   [$74],Y
                LDY   #$0016
                STA   [$84],Y
                TXA
                CLC
                ADC   #$004E
                TAY
                LDA   [$74],Y
                TAX
                INY
                INY
                LDA   [$74],Y
                LDY   #$0010
                STA   [$84],Y
                DEY
                DEY
                TXA
                STA   [$84],Y
                LDA   #$0002
                BRA   L035B01
L035AEC         LDA   L035B14
                BNE   L035AF9
                LDA   L03452F
                AND   #$0001
                BEQ   L035AFE
L035AF9         LDA   #$0001
                BRA   L035B01
L035AFE         LDA   #$0000
L035B01         LDY   #$0006
                STA   [$84],Y
L035B06         JSR   L0353EB
                LDA   L032F16
                STA   [$84]
                LDA   L032EB2
                TCD
                PLB
                RTL

L035B14         DW    $0000
L035B16         ENT
                PHB
                LDA   $01,S
                PHK
                PLB
                STA   L032FC6
                TDC
                STA   L032EB2
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0600
                STA   L032F14
                LDA   $09,S
                STA   $22
                LDA   $0B,S
                STA   $24
                LDA   $0D,S
                STA   L032EDA
                LDA   $0F,S
                STA   L032FE4
                LDA   $11,S
                STA   L032FE6
                PLA
                STA   $0D,S
                PLA
                STA   $0D,S
                TSC
                CLC
                ADC   #$000A
                TCS
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                STZ   L032F16
                JSR   L03537D
                BCC   L035B68
                STA   L032F16
                BRL   L035D4C
L035B68         JSR   L033340
                LDA   L032EDA
                BNE   L035BD6
                LDA   #$0002
                STA   [$02]
                LDY   #$0004
                LDA   L032FE4
                STA   [$02],Y
                INY
                INY
                LDA   L032FE6
                STA   [$02],Y
                LDA   #$2010
                JSR   L033500
                BCC   L035B92
L035B8C         STA   L032F16
                BRL   L035D4C
L035B92         LDY   #$0002
                LDA   [$02],Y
                STA   L032FE2
                LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                INY
                INY
                LDA   #$0200
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                BCS   L035B8C
                LDY   #$005A
                LDA   [$74],Y
                TAX
                DEY
                DEY
                LDA   [$74],Y
                TXY
                BRA   L035C2F
L035BD6         JSR   L034F86
                BCC   L035BE1
L035BDB         STA   L032F16
                BRL   L035D4C
L035BE1         STZ   L032EE8
                STZ   L032EEA
                LDA   #L035D60
                STA   L033102
                JSR   L036651
                BCS   L035BDB
                LDA   L032F22
                LDY   L032F24
                JSR   L033372
                STA   L032F22
                STY   L032F24
                STX   L032F26
                LDA   L032FC2
                LDX   L032FC4
                CLC
                ADC   L032F26
                BCC   L035C11
                INX
L035C11         TXY
                LDX   L032ED4
                STZ   L035D5A
L035C18         LSR
                ROR   L035D5A
                DEX
                BNE   L035C18
                LDX   L035D5A
                BEQ   L035C25
                INC
L035C25         LDX   L032ED4
L035C28         ASL
                DEX
                BNE   L035C28
                BCC   L035C2F
                INY
L035C2F         STA   L035D5C
                STY   L035D5E
                TAX
                TYA
                LDY   L032F14
                JSR   L0325E6
                STX   $1A
                STY   $1C
                BCC   L035C49
                STA   L032F16
                BRL   L035D4C
L035C49         LDA   [$1A]
                STA   $06
                LDY   #$0002
                LDA   [$1A],Y
                STA   $08
                LDA   L032EDA
                BNE   L035CA6
                LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   $06
                STA   [$02],Y
                INY
                INY
                LDA   $08
                STA   [$02],Y
                INY
                INY
                LDA   L035D5C
                STA   [$02],Y
                INY
                INY
                LDA   L035D5E
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                BCC   L035C8B
                STA   L032F16
L035C8B         LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                LDA   #$2014
                JSR   L033500
                BCC   L035CA3
                STA   L032F16
L035CA3         BRL   L035D46
L035CA6         LDA   #$0006
                LDY   #$0000
                STA   [$02],Y
                INY
                INY
                LDA   L032EDA
                STA   [$02],Y
                INY
                INY
                LDA   $06
                STA   [$02],Y
                INY
                INY
                LDA   $08
                STA   [$02],Y
                INY
                INY
                LDA   L035D5C
                STA   [$02],Y
                LDA   L035D5E
                INY
                INY
                STA   [$02],Y
                INY
                INY
                LDA   L032F22
                STA   [$02],Y
                INY
                INY
                LDA   L032F24
                STA   [$02],Y
                INY
                INY
                LDA   L032EF0
                STA   [$02],Y
                LDA   #$202F
                JSR   L033500
                BCC   L035CF2
                STA   L032F16
                BRL   L035D4C
L035CF2         LDA   L032F26
                BEQ   L035D15
                CLC
                ADC   $06
                TAX
                LDA   $08
                BCC   L035D00
                INC
L035D00         PHA
                PHX
                PEI   $08
                PEI   $06
                LDA   L032FC4
                PHA
                LDA   L032FC2
                PHA
                _BlockMove
L035D15         LDY   #$0004
                LDA   [$1A],Y
                AND   #$7FFF
                STA   [$1A],Y
                LDA   L032FC4
                PHA
                LDA   L032FC2
                PHA
                PEI   $1C
                PEI   $1A
                _SetHandleSize
                LDY   #$0004
                LDA   [$1A],Y
                ORA   #$8000
                STA   [$1A],Y
                DEY
                DEY
                LDA   [$1A],Y
                STA   $08
                LDA   [$1A]
                STA   $06
L035D46         STZ   $8C
                STZ   $8E
                STZ   $90
L035D4C         JSR   L0353EB
                LDA   L032F16
                STA   [$22]
                LDA   L032EB2
                TCD
                PLB
                RTL

L035D5A         DB    $00
                DB    $00
L035D5C         DB    $00
                DB    $00
L035D5E         DB    $00
                DB    $00
L035D60         DB    $00
L035D61         STX   L03302C
                STA   L033026
                LDA   L032F8E
                PHA
                PEA   ^L0330D6
                PEA   L0330D6
                PEA   $0005
                PEA   $0000
                _Int2Dec
                LDX   #$001F
                LDY   #$FFFF
                SEP   #$20
L035D86         INY
                LDA   L0330D6,Y
                CMP   #$20
                BEQ   L035D86
L035D8E         STA   L035EC9,X
                INX
                INY
                LDA   L0330D6,Y
                CPY   #$0005
                BNE   L035D8E
                LDY   #$0000
L035D9E         LDA   L035EAD,Y
                BEQ   L035DAA
                STA   L035EC9,X
                INX
                INY
                BRA   L035D9E
L035DAA         TXA
                STA   L035EC8
                REP   #$20
                LDA   L032EDA
                LDX   #$0002
                JSR   L033D8B
L035DB9         PEA   $4030
                _SysBeep2
                LDA   L033026
                LDX   #L035EC8
                JSR   L033456
                CMP   L033028
                BNE   L035DDB
                JSR   L0334CD
                BCS   L035DDB
                LDA   #$8010
                SEC
                RTS

L035DDB         STA   L03302A
L035DDE         JSR   L033DB4
                BCC   L035DE4
                RTS

L035DE4         BNE   L035DB9
                JSR   L033C2B
                BCS   L035E61
                LDA   #$0046
                CLC
                ADC   L032F18
                TAY
                LDA   [$74],Y
                CMP   L032F08
                BNE   L035E03
                INY
                INY
                LDA   [$74],Y
                CMP   L032F0A
                BEQ   L035E2E
L035E03         PEA   $4054
                _SysBeep2
                LDA   L032EDA
                LDX   #$0002
                JSR   L033D8B
                LDA   L033026
                LDX   #L035F07
                JSR   L033456
                CMP   L033028
                BNE   L035DDB
L035E24         JSR   L0334CD
                BCS   L035DDB
                LDA   #$8010
                SEC
                RTS

L035E2E         LDA   #$004A
                CLC
                ADC   L032F18
                TAY
                LDA   [$74],Y
                CMP   L032F8E
                BEQ   L035E7C
                PEA   $4054
                _SysBeep2
                LDA   L032EDA
                LDX   #$0002
                JSR   L033D8B
                LDA   L033026
                LDX   #L035F99
                JSR   L033456
                CMP   L033028
                BEQ   L035E24
                BRL   L035DDB
L035E61         PEA   $4033
                _SysBeep2
                LDA   L033026
                LDX   #L035F53
                JSR   L033456
                CMP   L033028
                BEQ   L035E24
                BRL   L035DDB
L035E7C         BIT   L03302C
                BPL   L035E9A
                LDA   L03452F
                AND   #$0004
                BEQ   L035E9A
                LDA   L032EDA
                LDX   #$0002
                JSR   L033D8B
                JSR   L033E00
                BCS   L035E24
                BRL   L035DDE
L035E9A         STZ   L0370B0
                LDA   L032F8E
                STA   L032F0C
                JSR   L034F86
                BCS   L035EAC
                LDA   L03302A
                CLC
L035EAC         RTS

L035EAD         ASC   ' from the same backup set.'
                DB    $00
L035EC8         DB    $00
L035EC9         ASC   'Please insert disk/tape number '
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
L035F07         STR   'That disk/tape does not belong to the current backup set. Please try again.'
L035F53         STR   'That disk/tape does not contain an Archiver backup. Please try again.'
L035F99         STR   'That disk/tape is not the correct number. Please try again.'
L035FD5         LDX   L0370B2
                JSR   L03793E
                LDA   $6C
                STA   L032EBC
                LDA   $6E
                STA   L032EBE
                LDA   L032F94
                CMP   L032EC2
                BCC   L036006
                BNE   L035FF7
                LDA   L032EC0
                CMP   L032F92
                BCS   L036006
L035FF7         LDX   L032EC2
                STX   L032F98
                LDA   L032EC0
                STA   L032F96
                BRL   L036012
L036006         LDA   L032F92
                STA   L032F96
                LDX   L032F94
                STX   L032F98
L036012         LDX   L032EEA
                LDA   L032EE8
                CMP   L032FE8
                BNE   L036022
                CPX   L032FEA
                BEQ   L036028
L036022         JSR   L034B1C
                BCC   L036028
L036027         RTS

L036028         LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   L032EBC
                STA   [$02],Y
                INY
                INY
                LDA   L032EBE
                STA   [$02],Y
                INY
                INY
                LDA   L032F96
                STA   [$02],Y
                INY
                INY
                LDA   L032F98
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                BCS   L036027
                LDA   L032EE8
                CLC
                ADC   L032F96
                STA   L032FE8
                LDA   L032EEA
                ADC   L032F98
                STA   L032FEA
                LDA   L032EBC
                CLC
                ADC   L032F96
                STA   L032EBC
                LDA   L032EBE
                ADC   L032F98
                STA   L032EBE
                LDA   L032F96
                CLC
                ADC   L032FCE
                STA   L032FCE
                LDA   L032F98
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                STZ   L032F96
                STZ   L032F98
                LDA   #$0000
                CLC
                RTS

L0360A0         LDA   #$0007
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDY   #$0006
                LDA   #$00C3
                STA   [$02],Y
                LDA   #$0000
                LDY   #$000A
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                LDY   #$0002
                LDA   [$0A],Y
                LDY   #$0008
                STA   [$02],Y
                CMP   #$000F
                BEQ   L03610A
                LDA   #$0000
                LDY   #$0012
                STA   [$02],Y
                DEY
                DEY
                STA   [$02],Y
                LDA   #$0001
                LDY   #$000E
                STA   [$02],Y
                TYX
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$0800
                BEQ   L03611D
                LDA   #$0005
                TXY
                STA   [$02],Y
                LDA   #$0000
                LDY   #$0016
                STA   [$02],Y
                DEY
                DEY
                STA   [$02],Y
                BRA   L03611D
L03610A         LDY   #$000E
                LDA   #$000D
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
L03611D         LDA   #$2001
                JSR   L033500
                RTS

L036124         LDA   #$0008
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDA   $02
                STA   L03614A+1
                LDA   $03
                STA   L03614A+2
                LDY   #$0016
                LDX   #$001E
L036148         LDA   [$0A],Y
L03614A         STAL  $000000,X
                DEX
                DEX
                DEY
                DEY
                CPY   #$0006
                BNE   L036148
                LDX   #$002A
L03615A         LDA   L032F60,X
                STA   L033106,X
                DEX
                DEX
                BPL   L03615A
                LDY   #$0020
                LDA   #L033104
                STA   [$02],Y
                INY
                INY
                LDA   #^L033104
                STA   [$02],Y
                LDY   #$0002
                LDA   [$0A],Y
                LDY   #$0008
                STA   [$02],Y
                CMP   #$000F
                BEQ   L0361A1
                LDA   L032F34
                LDY   #$0006
                STA   [$02],Y
                LDA   L032F36
                INY
                INY
                STA   [$02],Y
                LDA   L032F38
                INY
                INY
                STA   [$02],Y
                LDA   L032F3A
                INY
                INY
                STA   [$02],Y
                BRA   L0361BD
L0361A1         LDA   #$0000
                LDY   #$000C
                STA   [$02],Y
                LDY   #$0006
                LDA   #$00C3
                STA   [$02],Y
                LDY   #$0020
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
L0361BD         LDA   #$2005
                JSR   L033500
                RTS

L0361C4         LDA   L032FB0
                ORA   L032FB2
                BNE   L0361D1
                LDA   #$0000
                CLC
                RTS

L0361D1         LDX   L0370B4
                JSR   L03793E
                LDA   #$0004
                STA   [$02]
                LDA   L032ED0
                LDY   #$0002
                STA   [$02],Y
                INY
                INY
                LDA   $6C
                CLC
                ADC   L032FAC
                STA   [$02],Y
                INY
                INY
                LDA   $6E
                ADC   L032FAE
                STA   [$02],Y
                INY
                INY
                LDA   L032FB0
                STA   [$02],Y
                INY
                INY
                LDA   L032FB2
                STA   [$02],Y
                LDA   #$2013
                JSR   L033500
                PHP
                PHA
                LDA   L032FB0
                CLC
                ADC   L032FCE
                STA   L032FCE
                LDA   L032FB2
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                PLA
                PLP
                RTS

L036226         LDX   L0370B2
                JSR   L03793E
                LDA   $6C
                STA   L032EBC
                LDA   $6E
                STA   L032EBE
                LDA   $0A
                STA   $12
                LDA   $0C
                STA   $14
                STZ   L032FD2
                STZ   L032FD4
                LDA   L032EE8
                CMP   L032ED6
                BNE   L036299
                LDA   L032EEA
                CMP   L032ED8
                BNE   L036299
                LDA   L0330FE
                ORA   L033100
                BEQ   L036299
                LDA   L032FA8
                LDY   #$0000
                JSR   L033372
                TXA
                CLC
                ADC   L0330EE
                LDY   L0330F0
                BCC   L036270
                INY
L036270         SEC
                SBC   L0330E4
                TAX
                TYA
                SBC   L0330E6
                TAY
                TXA
                JSR   L033372
                PHX
                PLX
                BEQ   L036286
                INC
                BNE   L036286
                INY
L036286         STA   L0330FE
                STY   L033100
                LDA   L032F0C
                INC
                STA   L032F8E
                JSR   L0365A7
                BCC   L036299
                RTS

L036299         JSR   L03660C
                STZ   L032F9E
                STZ   L032FA0
                LDA   L0330FE
                ORA   L033100
                BEQ   L0362BC
                LDA   L0330FE
                LDY   L033100
                JSR   L033394
                STA   L032F9E
                STY   L032FA0
                BRL   L0363C4
L0362BC         LDY   #$0022
                LDA   [$12],Y
                TAX
                CMP   L032F0C
                BEQ   L0362DC
                LDA   L032F9E
                ORA   L032FA0
                BEQ   L0362D3
                SEC
                BRL   L03646D
L0362D3         STX   L032F8E
                JSR   L0365A7
                BCC   L0362DC
                RTS

L0362DC         LDY   #$0024
                LDA   [$12],Y
                TAX
                INY
                INY
                LDA   [$12],Y
                TAY
                TXA
                JSR   L033372
                TXA
                LDY   #$0028
                CLC
                ADC   [$12],Y
                LDY   #$0004
                ADC   [$12],Y
                STA   L032F92
                LDA   #$0000
                INY
                INY
                ADC   [$12],Y
                TAX
                LDY   #$001C
                LDA   [$12],Y
                AND   #$0800
                BEQ   L03631E
                LDY   #$0018
                LDA   [$12],Y
                CLC
                ADC   L032F92
                STA   L032F92
                TXA
                INY
                INY
                ADC   [$12],Y
                TAX
L03631E         STX   L032F94
                TXY
                LDA   L032F92
                JSR   L033372
                PHX
                PLX
                BEQ   L036330
                INC
                BNE   L036330
                INY
L036330         STA   L0330FE
                STY   L033100
                LDY   #$0024
                LDA   [$12],Y
                TAX
                INY
                INY
                LDA   [$12],Y
                TAY
                TXA
                JSR   L033372
                TAX
                LDA   L032F9E
                ORA   L032FA0
                BNE   L036368
                STX   L032EE8
                STY   L032EEA
                JSR   L03660C
                LDA   L0330FE
                LDY   L033100
                JSR   L033394
                STA   L032F9E
                STY   L032FA0
                BRA   L0363C4
L036368         TXA
                SEC
                SBC   L0330E0
                TAX
                TYA
                SBC   L0330E2
                BNE   L03637A
                TXA
                BEQ   L03637E
                DEC
                BEQ   L036396
L03637A         CLC
                BRL   L03646D
L03637E         LDY   L033100
                LDA   L0330FE
                BNE   L036387
                DEY
L036387         DEC
                STA   L0330FE
                STY   L033100
                ORA   L033100
                BNE   L036396
                BRL   L036558
L036396         LDA   L0330E0
                CLC
                ADC   L0330FE
                STA   L0330E0
                TAX
                LDA   L0330E2
                ADC   L033100
                STA   L0330E2
                INX
                BNE   L0363AE
                INC
L0363AE         TAY
                TXA
                SEC
                SBC   L032EE8
                TAX
                TYA
                SBC   L032EEA
                TAY
                TXA
                JSR   L033394
                STA   L032F9E
                STY   L032FA0
L0363C4         LDA   L032F9E
                LDY   L032FA0
                JSR   L033372
                PHX
                PLX
                BEQ   L0363D5
                INC
                BNE   L0363D5
                INY
L0363D5         JSR   L033394
                STA   L032F9E
                STY   L032FA0
                CLC
                ADC   L032EBC
                TAX
                TYA
                ADC   L032EBE
                TAY
                TXA
                SEC
                SBC   $6C
                TAX
                TYA
                SBC   $6E
                TAY
                TXA
                SEC
                SBC   L032EC8
                TAX
                TYA
                SBC   L032ECA
                BCC   L036402
                BNE   L036442
                TXY
                BNE   L036442
L036402         STZ   L0330FE
                STZ   L033100
                JSR   L03658B
                LDY   #$0024
                LDA   [$12],Y
                TAX
                INY
                INY
                LDA   [$12],Y
                TAY
                TXA
                JSR   L033372
                TXA
                EOR   #$FFFF
                SEC
                ADC   L032F92
                LDX   L032F94
                BCS   L036428
                DEX
L036428         LDY   #$0028
                SEC
                SBC   [$12],Y
                BCS   L036431
                DEX
L036431         CLC
                ADC   L032FD2
                STA   L032FD2
                TXA
                ADC   L032FD4
                STA   L032FD4
                BRL   L036558
L036442         TAY
                TXA
                JSR   L033372
                STA   L0330FE
                STY   L033100
                LDA   L032EC8
                CLC
                ADC   $6C
                TAX
                LDA   L032ECA
                ADC   $6E
                TAY
                TXA
                SEC
                SBC   L032EBC
                STA   L032F9E
                TYA
                SBC   L032EBE
                STA   L032FA0
                JSR   L03658B
                SEC
L03646D         ROR   L036589
                LDA   L032EBC
                CMP   $6C
                BNE   L03648A
                LDA   L032EBE
                CMP   $6E
                BNE   L03648A
                LDA   L032EE8
                STA   L0330F6
                LDA   L032EEA
                STA   L0330F8
L03648A         LDA   L0370B0
                BEQ   L036495
L03648F         JSR   L037492
                BCC   L036495
                RTS

L036495         LDA   #$0006
                STA   [$02]
                LDY   #$0002
                LDA   L032EDA
                STA   [$02],Y
                INY
                INY
                LDA   L032EBC
                STA   [$02],Y
                INY
                INY
                LDA   L032EBE
                STA   [$02],Y
                INY
                INY
                LDA   L032F9E
                STA   [$02],Y
                LDA   L032FA0
                INY
                INY
                STA   [$02],Y
                INY
                INY
                LDA   L032EE8
                STA   [$02],Y
                INY
                INY
                LDA   L032EEA
                STA   [$02],Y
                INY
                INY
                LDA   L032EF0
                STA   [$02],Y
                LDA   #$202F
                JSR   L033500
                BCC   L0364E7
                CMP   #$002F
                BEQ   L03648F
                CMP   #$002E
                BEQ   L03648F
                SEC
                RTS

L0364E7         STZ   L0370B0
                LDA   L032FD2
                CLC
                ADC   L032FCE
                STA   L032FCE
                LDA   L032FD4
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                STZ   L032FD2
                STZ   L032FD4
                LDA   L032F9E
                LDY   L032FA0
                JSR   L033372
                CLC
                ADC   L032EE8
                STA   L032EE8
                TAX
                TYA
                ADC   L032EEA
                STA   L032EEA
                LDA   L032EBC
                CLC
                ADC   L032F9E
                STA   L032EBC
                TAY
                LDA   L032EBE
                ADC   L032FA0
                STA   L032EBE
                TAX
                TYA
                SEC
                SBC   $6C
                TAY
                TXA
                SBC   $6E
                CMP   L032ECA
                BNE   L036545
                CPY   L032EC8
                BEQ   L03654A
L036545         BIT   L036589
                BPL   L03654C
L03654A         CLC
                RTS

L03654C         JSR   L03660C
                STZ   L032F9E
                STZ   L032FA0
                BRL   L0362BC
L036558         LDA   [$12]
                AND   #$FF00
                BNE   L036563
                SEC
                BRL   L03646D
L036563         XBA
                CLC
                ADC   $12
                STA   $12
                BCC   L03656D
                INC   $14
L03656D         LDY   #$001C
                LDA   [$12],Y
                BIT   #$0080
                BNE   L036558
                AND   #$3000
                BEQ   L036558
                LDY   #$0002
                LDA   [$12],Y
                CMP   #$000F
                BEQ   L036558
                BRL   L0362BC
L036589         BRK   $00
L03658B         LDY   L032FA0
                LDA   L032F9E
                BNE   L036594
                DEY
L036594         DEC
                JSR   L033372
                CLC
                ADC   L032EE8
                STA   L0330E0
                TYA
                ADC   L032EEA
                STA   L0330E2
                RTS

L0365A7         LDA   #$0000
                STA   L033028
                TAX
                LDA   #$0001
                JSR   L035D61
                BCC   L0365B7
                RTS

L0365B7         JSR   L0334DA
                BCC   L0365BD
                RTS

L0365BD         JSR   L034DE9
                LDA   L032F0E
                BEQ   L0365C6
                INC
L0365C6         INC
                INC
                STA   L032FA2
                STZ   $78
                LDA   L032ED4
                SEC
                SBC   #$0009
                BEQ   L0365EC
                TAX
L0365D7         LSR   L032FA2
                ROR   $78
                DEX
                BNE   L0365D7
                LDA   #$0010
                SEC
                SBC   L032ED4
                TAX
L0365E7         LSR   $78
                DEX
                BNE   L0365E7
L0365EC         LDY   #$0028
                LDA   [$12],Y
                CLC
                ADC   $78
                LDY   #$0000
                JSR   L033372
                CLC
                ADC   L032FA2
                STA   L032EE8
                STZ   L032EEA
                STX   L032F90
                JSR   L03660C
                CLC
                RTS

L03660C         LDA   L032ED6
                SEC
                SBC   L032EE8
                TAX
                LDA   L032ED8
                SBC   L032EEA
                TAY
                TXA
                JSR   L033394
                CLC
                ADC   L032EBC
                TAX
                TYA
                ADC   L032EBE
                TAY
                TXA
                SEC
                SBC   $6C
                TAX
                TYA
                SBC   $6E
                CMP   L032EC2
                BCC   L03664A
                BNE   L03663D
                CPX   L032EC0
                BCC   L03664A
L03663D         LDA   L032EC0
                STA   L032EC8
                LDA   L032EC2
                STA   L032ECA
                RTS

L03664A         STX   L032EC8
                STA   L032ECA
                RTS

L036651         LDA   #$0001
                STA   L0366AB
L036657         JSR   L033C2B
                BCC   L036668
                CMP   #$002E
                BNE   L03668C
                DEC   L0366AB
                BEQ   L036657
                BRA   L03668C
L036668         LDA   L032F18
                TAX
                CLC
                ADC   #$0046
                TAY
                LDA   [$74],Y
                CMP   L032F08
                BNE   L03668C
                INY
                INY
                LDA   [$74],Y
                CMP   L032F0A
                BNE   L03668C
                TXA
                CLC
                ADC   #$004A
                TAY
                LDA   [$74],Y
                DEC
                BEQ   L0366A0
L03668C         JSR   L034F86
                BCS   L03669A
                LDA   #$0001
                STA   L032F8E
                STA   L032F0C
L03669A         JSR   L037492
                BCC   L0366A0
                RTS

L0366A0         LDA   #$0001
                STA   L032F0C
                STZ   L0370B0
                CLC
                RTS

L0366AB         BRK   $00
L0366AD         ENT
                PHB
                LDA   $01,S
                PHK
                PLB
                STA   L032FC6
                TDC
                STA   L032EB2
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0300
                STA   L032F14
                LDA   $09,S
                STA   $84
                LDA   $0B,S
                STA   $86
                PLA
                STA   $07,S
                PLA
                STA   $07,S
                TSC
                CLC
                ADC   #$0004
                TCS
                STA   L033050
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                STZ   L032F16
                STZ   L032FD8
                STZ   L032ED0
                LDA   #$FFFF
                STA   L0370AA
                LDY   #$0002
                LDA   [$84],Y
                STA   L032EDA
                LDA   #L036FBF
                STA   L033102
                JSR   L0334DA
                BCC   L03670A
                BRL   L036F0C
L03670A         LDX   #L036FE0
                JSR   L03793E
                JSR   L03350A
                LDY   #$000E
                LDA   [$84],Y
                STA   $78
                INY
                INY
                LDA   [$84],Y
                TAY
                ORA   $78
                BEQ   L036745
                TYA
                LDX   #$0000
L036727         ASL   $78
                ROL
                BCS   L03672F
                INX
                BNE   L036727
L03672F         DEX
                STX   L032FCC
                ROR
                PHA
                PHA
                LDA   L032FCA
                PHA
                LDA   L032FC8
                PHA
                _SetCtlTitle
L036745         LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #$8000
                STA   [$02],Y
                LDA   #$200C
                JSR   L033500
                LDY   #$0006
                LDA   [$84],Y
                STA   $78
                INY
                INY
                LDA   [$84],Y
                STA   $7A
                LDA   [$78]
                STAL  L0301D1
                TAY
                INY
                TYX
                SEP   #$20
L036770         LDA   [$78],Y
                STAL  L0301D1,X
                DEX
                DEY
                BNE   L036770
                REP   #$20
                LDA   #$0007
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDY   #$0006
                LDA   #$00C3
                STA   [$02],Y
                LDA   #$0000
                LDY   #$000A
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                LDA   #$000F
                LDY   #$0008
                STA   [$02],Y
                LDY   #$000E
                LDA   #$000D
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                STA   [$02],Y
                SEC
                ROR   L0370C6
                LDA   #$2001
                JSR   L033500
                BCC   L0367D6
                STA   L0330D4
                JSR   L0335AF
                BCC   L0367D6
L0367D3         BRL   L036F0C
L0367D6         LDA   #$0008
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDY   #$0020
                LDA   #L033104
                STA   [$02],Y
                INY
                INY
                LDA   #^L033104
                STA   [$02],Y
                SEC
                ROR   L0370C6
                LDA   #$2006
                JSR   L033500
                BCS   L0367D3
                LDA   L033108
                STA   L033136
                LDA   #$000D
                LDY   #$0002
                STA   [$02],Y
                INY
                INY
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDA   #$0002
                STA   [$02]
                LDA   #$2009
                JSR   L033500
                LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2034
                JSR   L033500
                BCC   L03684B
                BRL   L036F0C
L03684B         STZ   L0370C6
                JSR   L03537D
                BCC   L036856
L036853         BRL   L036F0C
L036856         JSR   L0353FE
                BCS   L036853
                LDY   #$0004
                LDA   [$1A],Y
                ORA   #$8000
                STA   [$1A],Y
                DEY
                DEY
                LDA   [$1A],Y
                STA   $08
                TAX
                LDA   [$1A]
                STA   $06
                CLC
                ADC   #$01B6
                STA   $0A
                BCC   L036879
                INX
L036879         STX   $0C
                LDY   #$0010
                LDA   [$06],Y
                STA   L032FA6
                LDY   #$002E
                LDA   [$0A],Y
                AND   #$00FF
                DEC
                STA   L032FAA
                LDA   #$0001
                STA   L032EE2
                LDA   #$3331
                STAL  L0301D3
                LDA   #$203A
                STAL  L0301D5
                LDA   #$0003
                STAL  L0301D1
                JSR   L0334DA
                BCC   L0368B2
                BRL   L036F0C
L0368B2         LDA   L032EC2
                BNE   L0368CA
                LDA   L032EC0
                CMP   #$8000
                BCS   L0368CA
                LDA   #L036FFC
                STA   L0370B2
                STA   L0370B4
                BRA   L0368D6
L0368CA         LDA   #L039575
                STA   L0370B2
                LDA   #L03700D
                STA   L0370B4
L0368D6         STZ   L0330E4
                STZ   L0330E6
                STZ   L0330EE
                STZ   L0330F0
                LDA   $6C
                STA   L0330E8
                STA   L032EBC
                LDA   $6E
                STA   L032EBE
                STA   L0330EA
                STZ   L032F90
                STZ   L0330FE
                STZ   L033100
                STZ   L032EE8
                STZ   L032EEA
                STZ   L0370C6
                LDA   L032EDA
                BNE   L036946
                STZ   L032FE2
                LDY   #$000A
                LDA   [$84],Y
                STA   L032FE4
                TAX
                INY
                INY
                LDA   [$84],Y
                STA   L032FE6
                LDY   #$0006
                STA   [$02],Y
                DEY
                DEY
                TXA
                STA   [$02],Y
                LDA   #$0002
                STA   [$02]
                LDA   #$2010
                JSR   L033500
                BCC   L036936
                BRL   L036F0C
L036936         LDY   #$0002
                LDA   [$02],Y
                STA   L032FE2
                STZ   L032FE8
                STZ   L032FEA
                BRA   L036969
L036946         JSR   L036651
                BCC   L03694E
                BRL   L036F0C
L03694E         LDA   #$0000
                STA   [$02]
                LDA   #$201D
                JSR   L033500
L036959         LDA   L0330EE
                CMP   L0330E4
                BNE   L0369C6
                LDA   L0330F0
                CMP   L0330E6
                BNE   L0369C6
L036969         STZ   L033024
                JSR   L0333A2
                BCC   L036974
                BRL   L036F0A
L036974         LDY   #$001C
                LDA   [$0A],Y
                BIT   #$0080
                BNE   L036969
                STZ   L0330E4
                STZ   L0330E6
L036984         LDY   #$0002
                LDA   [$0A],Y
                CMP   #$000F
                BNE   L0369C6
L03698E         SEC
                ROR   L0370C6
                JSR   L0360A0
                BCC   L0369BA
L036997         STA   L0330D4
                JSR   L0335AF
                BCS   L0369B0
                LDAL  L06000A
                BPL   L0369A8
                BRL   L036F0A
L0369A8         CMP   #$0503
                BNE   L03698E
L0369AD         LDA   #$8010
L0369B0         BRL   L036F0C
                CMP   #$0504
                BEQ   L036984
                BRA   L03698E
L0369BA         JSR   L036124
                BCS   L036997
                JSR   L0334DA
                BCS   L0369AD
                BRA   L036969
L0369C6         LDY   #$0028
                LDA   [$0A],Y
                STA   L032FA8
                LDY   #$0004
                LDA   [$0A],Y
                STA   L032FB4
                INY
                INY
                LDA   [$0A],Y
                STA   L032FB6
                LDY   #$001C
                LDA   [$0A],Y
                AND   #$0800
                BNE   L0369EF
                STZ   L032FB8
                STZ   L032FBA
                BRA   L0369FE
L0369EF         LDY   #$0018
                LDA   [$0A],Y
                STA   L032FB8
                INY
                INY
                LDA   [$0A],Y
                STA   L032FBA
L0369FE         LDA   L032FA8
                CLC
                ADC   L032FB4
                TAX
                LDA   #$0000
                ADC   L032FB6
                TAY
                TXA
                ADC   L032FB8
                STA   L0330EE
                TYA
                ADC   L032FBA
                STA   L0330F0
                LDX   L032EDA
                BNE   L036A23
                BRL   L036D37
L036A23         LDX   L0330EA
                CPX   L032EBE
                BCC   L036A60
                BNE   L036A35
                LDX   L0330E8
                CPX   L032EBC
                BCC   L036A60
L036A35         STZ   L0370C6
                JSR   L036226
                BCC   L036A40
                BRL   L036F0C
L036A40         SEC
                ROR   L0330EC
                JSR   L0334DA
                BCC   L036A4C
                BRL   L036F0C
L036A4C         LDA   $6C
                CLC
                ADC   L032F90
                STA   L0330E8
                LDA   $6E
                BCC   L036A5A
                INC
L036A5A         STA   L0330EA
                STZ   L032F90
L036A60         LDY   #$0024
                LDA   [$0A],Y
                TAX
                INY
                INY
                LDA   [$0A],Y
                TAY
                TXA
                LDX   L0330EC
                BEQ   L036AB5
                STZ   L0330EC
                LDX   $6C
                STX   L0330F2
                LDX   $6E
                STX   L0330F4
                TAX
                LDA   L0330E4
                ORA   L0330E6
                BNE   L036A9F
                TXA
                JSR   L033372
                TXA
                CLC
                ADC   L0330F2
                STA   L0330E8
                LDA   L0330F4
                ADC   #$0000
                STA   L0330EA
                BRL   L036B52
L036A9F         LDA   L0330E4
                SEC
                SBC   L032FA8
                TAX
                LDA   L0330E6
                SBC   #$0000
                BCS   L036AB2
                BRL   L036B58
L036AB2         BRL   L036C2E
L036AB5         JSR   L033372
                STA   $7C
                STY   $7E
                LDY   #$0022
                LDA   [$0A],Y
                CMP   L032F0C
                BEQ   L036AC9
                BRL   L036A35
L036AC9         LDA   $7C
                SEC
                SBC   L0330FA
                TAX
                LDA   $7E
                SBC   L0330FC
                BNE   L036ADD
                TXA
                BEQ   L036B24
                DEC
                BEQ   L036B24
L036ADD         LDA   L0330E8
                SEC
                SBC   $6C
                TAX
                LDA   L0330EA
                SBC   $6E
                TAY
                TXA
                JSR   L033372
                PHX
                PLX
                BEQ   L036AF6
                INC
                BNE   L036AF6
                INY
L036AF6         JSR   L033394
                CLC
                ADC   $6C
                STA   L0330F2
                TYA
                ADC   $6E
                STA   L0330F4
                LDA   $7C
                STA   L0330F6
                LDA   $7E
                STA   L0330F8
                LDA   L0330F4
                CMP   L032EBE
                BCC   L036B24
                BNE   L036B21
                LDA   L0330F2
                CMP   L032EBC
                BCC   L036B24
L036B21         BRL   L036A35
L036B24         LDA   L0330F6
                LDY   L0330F8
                JSR   L033394
                TYX
                LDY   #$0024
                EOR   #$FFFF
                SEC
                ADC   [$0A],Y
                STA   $78
                TXA
                EOR   #$FFFF
                INY
                INY
                ADC   [$0A],Y
                TAX
                LDA   $78
                CLC
                ADC   L0330F2
                STA   L0330E8
                TXA
                ADC   L0330F4
                STA   L0330EA
L036B52         LDA   #$0060
                STA   L032FBC
L036B58         LDA   L0330E8
                CLC
                ADC   L032FBC
                TAX
                LDA   L0330EA
                ADC   #$0000
                CMP   L032EBE
                BCC   L036B80
                BNE   L036B74
                CPX   L032EBC
                BCC   L036B80
                BEQ   L036B80
L036B74         LDA   L032EBC
                SEC
                SBC   L0330E8
                STA   L032FB0
                BRA   L036B86
L036B80         LDA   L032FBC
                STA   L032FB0
L036B86         LDA   L0330E8
                STA   $78
                LDA   L0330EA
                STA   $7A
                LDX   L0330E4
                LDY   #$0000
                SEP   #$20
L036B98         LDA   [$78],Y
                STA   L032F2C,X
                INX
                INY
                CPY   L032FB0
                BNE   L036B98
                REP   #$20
                LDA   L0330E4
                CLC
                ADC   L032FB0
                STA   L0330E4
                CMP   #$0060
                BNE   L036BD1
                LDA   L032FA8
                SEC
                SBC   #$0060
                TAX
                CLC
                ADC   L0330E4
                STA   L0330E4
                TXA
                CLC
                ADC   L0330E8
                STA   L0330E8
                BCC   L036BD1
                INC   L0330EA
L036BD1         LDA   L0330E8
                CLC
                ADC   L032FB0
                STA   L0330E8
                BCC   L036BE0
                INC   L0330EA
L036BE0         LDA   L032FBC
                SEC
                SBC   L032FB0
                STA   L032FBC
                BEQ   L036BEF
                BRL   L036A23
L036BEF         STZ   L032FC0
L036BF2         SEC
                ROR   L0370C6
                JSR   L0360A0
                BCC   L036C1F
                STZ   L0330D4
                JSR   L0335AF
                BCS   L036C14
                LDAL  L06000A
                BPL   L036C0C
                BRL   L036F0A
L036C0C         CMP   #$0503
                BNE   L036C17
                LDA   #$8010
L036C14         BRL   L036F0C
L036C17         CPX   #$0504
                BNE   L036BF2
                BRL   L036984
L036C1F         STZ   L032F2A
                LDA   L032FB4
                STA   L032FBC
                LDA   L032FB6
                STA   L032FBE
L036C2E         LDA   L032F2A
                BNE   L036C49
                SEC
                ROR   L032F2A
                SEC
                ROR   L0370C6
                LDA   L032FC0
                LDX   #$0003
                JSR   L034785
                BCC   L036C49
                BRL   L036F0C
L036C49         LDA   L032EBC
                SEC
                SBC   L0330E8
                TAX
                LDA   L032EBE
                SBC   L0330EA
                BCS   L036C5C
                BRL   L036A23
L036C5C         CMP   L032FBE
                BCC   L036C6E
                BNE   L036C68
                CPX   L032FBC
                BCC   L036C6E
L036C68         LDA   L032FBE
                LDX   L032FBC
L036C6E         STA   L032FB2
                STX   L032FB0
                LDA   L0330E8
                SEC
                SBC   $6C
                STA   L032FAC
                LDA   L0330EA
                SBC   $6E
                STA   L032FAE
                SEC
                ROR   L0370C6
                JSR   L0361C4
                BCC   L036C91
                BRL   L036F0C
L036C91         JSR   L0334DA
                BCC   L036C99
                BRL   L036F0C
L036C99         LDA   L0330E8
                CLC
                ADC   L032FB0
                STA   L0330E8
                LDA   L0330EA
                ADC   L032FB2
                STA   L0330EA
                LDA   L0330E4
                CLC
                ADC   L032FB0
                STA   L0330E4
                LDA   L0330E6
                ADC   L032FB2
                STA   L0330E6
                LDA   L032FBC
                SEC
                SBC   L032FB0
                STA   L032FBC
                LDA   L032FBE
                SBC   L032FB2
                STA   L032FBE
                ORA   L032FBC
                BEQ   L036CDA
                BRL   L036A23
L036CDA         SEC
                ROR   L0370C6
                JSR   L034AFC
                BCC   L036CE6
L036CE3         BRL   L036F0C
L036CE6         STZ   L032F2A
                LDA   L032FC0
                BNE   L036D06
                INC
                STA   L032FC0
                LDA   L032FB8
                STA   L032FBC
                LDA   L032FBA
                STA   L032FBE
                ORA   L032FB8
                BEQ   L036D06
                BRL   L036C2E
L036D06         SEC
                ROR   L0370C6
                JSR   L036124
                BCS   L036CE3
                LDA   L0330E8
                SEC
                SBC   L0330F2
                TAX
                LDA   L0330EA
                SBC   L0330F4
                TAY
                TXA
                BNE   L036D22
                DEY
L036D22         DEC
                JSR   L033372
                CLC
                ADC   L0330F6
                STA   L0330FA
                TYA
                ADC   L0330F8
                STA   L0330FC
                BRL   L036959
L036D37         LDY   #$0024
                LDA   [$0A],Y
                STA   L032EE8
                INY
                INY
                LDA   [$0A],Y
                STA   L032EEA
                LDA   L032FA8
                CLC
                ADC   L032FB4
                TAX
                LDA   L032FB6
                BCC   L036D54
                INC
L036D54         TAY
                TXA
                CLC
                ADC   L032FB8
                TAX
                TYA
                ADC   L032FBA
                STA   L032F94
                STX   L032F92
                LDA   L032FCE
                SEC
                SBC   L032FA8
                STA   L032FCE
                BCS   L036D74
                DEC   L032FD0
L036D74         STZ   L0370C6
                JSR   L035FD5
                BCC   L036D7F
L036D7C         BRL   L036F0C
L036D7F         JSR   L0334DA
                BCC   L036D87
                BRL   L036F0C
L036D87         LDY   #$005E
L036D8A         LDA   [$6C],Y
                STA   L032F2C,Y
                DEY
                DEY
                BPL   L036D8A
                LDA   L032F92
                SEC
                SBC   L032FA8
                STA   L032F92
                BCS   L036DA2
                DEC   L032F94
L036DA2         LDA   L032FA8
                STA   L032FAC
                STZ   L032FAE
                CLC
                ADC   $6C
                LDX   $6E
                BCC   L036DB3
                INX
L036DB3         CPX   L032EBE
                BCC   L036E00
                BNE   L036DC1
                CMP   L032EBC
                BCC   L036E00
                BEQ   L036E00
L036DC1         LDA   L032EE8
                STA   $7C
                LDA   L032EEA
                STA   $7E
                LDY   #$0024
                LDA   [$0A],Y
                CLC
                ADC   L032FA8
                STA   L032EE8
                TAX
                INY
                INY
                LDA   [$0A],Y
                ADC   #$0000
                STA   L032EEA
                TXA
                SEC
                SBC   $7C
                CLC
                ADC   L032FCE
                STA   L032FCE
                BCC   L036DF2
                INC   L032FD0
L036DF2         STZ   L0370C6
                JSR   L035FD5
                BCS   L036D7C
                STZ   L032FAC
                STZ   L032FAE
L036E00         SEC
                ROR   L0370C6
                JSR   L0360A0
                BCC   L036E2D
                STZ   L0330D4
                JSR   L0335AF
                BCS   L036E22
                LDAL  L06000A
                BPL   L036E1A
                BRL   L036F0A
L036E1A         CMP   #$0503
                BNE   L036E25
                LDA   #$8010
L036E22         BRL   L036F0C
L036E25         CPX   #$0504
                BNE   L036E00
                BRL   L036984
L036E2D         STZ   L032FC0
                LDA   L032FB4
                STA   L032FBC
                LDA   L032FB6
                STA   L032FBE
L036E3C         LDA   L032FC0
                LDX   #$0003
                JSR   L034785
                BCC   L036E4A
                BRL   L036F0C
L036E4A         LDA   L032EBC
                SEC
                SBC   $6C
                TAX
                LDA   L032EBE
                SBC   $6E
                TAY
                TXA
                SEC
                SBC   L032FAC
                TAX
                TYA
                SBC   L032FAE
                CMP   L032FBE
                BCC   L036E73
                BNE   L036E6D
                CPX   L032FBC
                BCC   L036E73
L036E6D         LDA   L032FBE
                LDX   L032FBC
L036E73         STA   L032FB2
                STX   L032FB0
                SEC
                ROR   L0370C6
                JSR   L0361C4
                BCC   L036E85
                BRL   L036F0C
L036E85         JSR   L0334DA
                BCC   L036E8D
                BRL   L036F0C
L036E8D         LDA   L032F92
                SEC
                SBC   L032FB0
                STA   L032F92
                LDA   L032F94
                SBC   L032FB2
                STA   L032F94
                LDA   L032FBC
                SEC
                SBC   L032FB0
                STA   L032FBC
                LDA   L032FBE
                SBC   L032FB2
                STA   L032FBE
                ORA   L032FBC
                BEQ   L036EC3
                STZ   L0370C6
                JSR   L035FD5
                BCC   L036E4A
                BRL   L036F0C
L036EC3         SEC
                ROR   L0370C6
                JSR   L034AFC
                BCC   L036ECE
L036ECC         BRA   L036F0C
L036ECE         LDA   L032FC0
                BNE   L036EFE
                INC
                STA   L032FC0
                LDA   L032FAC
                CLC
                ADC   L032FB0
                STA   L032FAC
                LDA   L032FAE
                ADC   L032FB2
                STA   L032FAE
                LDA   L032FB8
                STA   L032FBC
                LDA   L032FBA
                STA   L032FBE
                ORA   L032FB8
                BEQ   L036EFE
                BRL   L036E3C
L036EFE         SEC
                ROR   L0370C6
                JSR   L036124
                BCS   L036ECC
                BRL   L036969
L036F0A         BRA   L036F4B
L036F0C         STA   L032F16
                LDA   L032ED0
                BEQ   L036F24
                LDY   #$0002
                STA   [$02],Y
                LDA   #$0001
                STA   [$02]
                LDA   #$2014
                JSR   L033500
L036F24         LDA   L032F16
                CMP   #$0048
                BEQ   L036F31
                CMP   #$0027
                BNE   L036F4B
L036F31         LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #L0301D1
                STA   [$02],Y
                INY
                INY
                LDA   #^L0301D1
                STA   [$02],Y
                LDA   #$2002
                JSR   L033500
L036F4B         JSR   L03860F
                LDA   L032EDA
                BNE   L036F7A
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                BEQ   L036F7A
                STA   [$02],Y
                LDA   L032F16
                BNE   L036F6A
                STZ   L0370C6
L036F6A         LDA   #$2014
                JSR   L033500
                BCC   L036F7A
L036F72         LDY   L032F16
                BNE   L036F7A
                STA   L032F16
L036F7A         LDA   #$0000
                STA   [$02]
                LDA   #$201E
                JSR   L033500
                BCS   L036F72
                LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2035
                JSR   L033500
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   #$0000
                STA   [$02],Y
                LDA   #$200C
                JSR   L033500
                LDA   L032F16
                STA   [$84]
                LDA   L032EB2
                TCD
                PLB
                RTL

L036FBF         STR   'Some files will not be restored.'
L036FE0         STR   'Preparing for file restoreI'
L036FFC         STR   'Restoring filesI'
L03700D         STR   'Writing filesI'
L03701C         DB    $00
                DB    $00
L03701E         DB    $00
                DB    $00
L037020         DB    $00
                DB    $00
L037022         DB    $00
                DB    $00
L037024         DB    $00
                DB    $00
L037026         DB    $00
                DB    $00
L037028         DB    $00
L037029         DB    $00
L03702A         DB    $00
                DB    $00
L03702C         DB    $00
                DB    $00
L03702E         DB    $00
                DB    $00
L037030         DB    $00
                DB    $00
L037032         DB    $00
                DB    $00
L037034         DB    $00
                DB    $00
L037036         DB    $00
                DB    $00
L037038         DB    $00
                DB    $00
L03703A         DB    $00
                DB    $00
L03703C         DB    $00
                DB    $00
L03703E         DB    $00
                DB    $00
L037040         DB    $00
                DB    $00
L037042         DB    $00
                DB    $00
L037044         DB    $00
                DB    $00
L037046         DB    $00
                DB    $00
L037048         DB    $00
                DB    $00
L03704A         DB    $00
                DB    $00
L03704C         DB    $00
                DB    $00
L03704E         DB    $00
                DB    $00
L037050         DB    $00
L037051         DB    $00
L037052         DB    $00
                DB    $00
L037054         DB    $00
                DB    $00
L037056         DB    $00
                DB    $00
L037058         DB    $00
                DB    $00
L03705A         DB    $00
                DB    $00
L03705C         DB    $00
                DB    $00
L03705E         DB    $00
L03705F         DB    $00
L037060         DB    $00
L037061         DB    $00
L037062         DB    $00
                DB    $00
L037064         DB    $00
                DB    $00
L037066         DB    $24
                DB    $00
L037068         DB    $00
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
L03708A         DB    $00
                DB    $00
L03708C         DB    $00
                DB    $00
L03708E         DB    $00
                DB    $00
L037090         DB    $00
                DB    $00
L037092         DB    $00
                DB    $00
L037094         DB    $00
L037095         DB    $00
L037096         DB    $00
L037097         DB    $00
L037098         DB    $00
L037099         DB    $00
L03709A         DB    $00
                DB    $00
L03709C         DB    $00
                DB    $00
L03709E         DB    $00
                DB    $00
L0370A0         DB    $00
                DB    $00
L0370A2         DB    $00
                DB    $00
L0370A4         DB    $00
                DB    $00
L0370A6         DB    $00
                DB    $00
L0370A8         DB    $00
                DB    $00
L0370AA         DB    $00
                DB    $00
L0370AC         DB    $00
                DB    $00
L0370AE         DB    $00
                DB    $00
L0370B0         DB    $00
                DB    $00
L0370B2         DB    $00
                DB    $00
L0370B4         DB    $00
                DB    $00
L0370B6         DB    $00
                DB    $00
L0370B8         DB    $00
                DB    $00
L0370BA         DB    $00
                DB    $00
L0370BC         DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L0370C6         ENT
                DB    $00
                DB    $00
L0370C8         DB    $00
                DB    $00
L0370CA         DB    $00
                DB    $00
L0370CC         DB    $00
                DB    $00
L0370CE         DB    $00
                DB    $00
L0370D0         DB    $00
L0370D1         DB    $00
L0370D2         DB    $00
L0370D3         DB    $00
                DB    $00
L0370D5         DB    $00
                DB    $00
L0370D7         DB    $00
                DB    $00
L0370D9         DB    $00
                DB    $00
L0370DB         DB    $00
                DB    $00
L0370DD         DB    $00
                DB    $00
L0370DF         DB    $00
                DB    $00
L0370E1         DB    $00
                DB    $00
L0370E3         DB    $00
                DB    $00
L0370E5         DB    $00
L0370E6         DB    $00
L0370E7         DB    $00
L0370E8         DB    $00
L0370E9         DB    $00
                DB    $00
                DB    $00
L0370EC         DB    $00
                DW    $0000
                DW    $0010
                DW    $0020
                DW    $0030
                DW    $0040
                DW    $0050
                DW    $0060
                DW    $0070
                DW    $0080
                DW    $0090
                DW    $00A0
                DW    $00B0
                DW    $00C0
                DW    $00D0
                DW    $00E0
L03710B         DW    $00F0
                DB    $00
L03710E         DB    $00
                DB    $00
L037110         DB    $00
                DB    $01
                DB    $00
                DB    $02
                DB    $00
                DB    $04
                DB    $00
                DB    $08
                DB    $00
                DB    $10
                DB    $00
                DB    $20
                DB    $00
                DB    $40
                DB    $00
                DB    $80
                DB    $01
                DB    $00
                DB    $02
                DB    $00
                DB    $04
                DB    $00
                DB    $08
                DB    $00
                DB    $10
                DB    $00
                DB    $20
                DB    $00
                DB    $40
                DB    $00
                DB    $80
                DB    $00
L037130         DB    $00
                DB    $00
L037132         DB    $00
                DB    $00
L037134         DB    $00
                DB    $00
L037136         DB    $00
                DB    $00
L037138         DB    $00
                DB    $00
L03713A         DB    $00
                DB    $00
L03713C         DB    $00
                DB    $00
L03713E         DB    $00
                DB    $00
L037140         DB    $00
                DB    $00
L037142         DB    $00
                DB    $00
L037144         DB    $00
                DB    $00
L037146         DB    $00
L037147         DB    $00
L037148         DB    $00
L037149         DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L03714E         DB    $00
                DB    $00
L037150         DB    $00
                DB    $00
L037152         DB    $00
                DB    $00
L037154         DB    $00
                DB    $00
L037156         LDA   L03708A
                STA   $12
                LDA   L03708C
                STA   $14
                LDA   [$12]
                AND   #$00FF
                TAY
                STA   [$74]
L037168         LDA   [$12],Y
                INY
                STA   [$74],Y
                DEY
                DEY
                BNE   L037168
L037171         LDA   #$0002
                STA   [$02]
                LDY   #$0002
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                LDA   #$2020
                JSR   L033500
                BCC   L0371D5
                CMP   #$0045
                BEQ   L037192
                SEC
                RTS

L037192         LDA   [$74]
                INC
                INC
                STA   $78
                LDY   #$0002
                SEP   #$20
L03719D         LDA   [$74],Y
                STA   L0371F2+$1A,Y
                INY
                CPY   $78
                BNE   L03719D
                LDA   #$2E
                STA   L0371F2+$1A,Y
                TYA
                CLC
                ADC   #$1B
                STA   L0371F1
                REP   #$20
                PEA   $4030
                _SysBeep2
                LDA   #$0001
                LDX   #L0371F1
                JSR   L033456
                TAX
                BNE   L037171
                JSR   L0334CD
                BCS   L037171
                LDA   #$8010
                SEC
                RTS

L0371D5         STZ   L0370AE
                LDY   #$0006
                LDA   [$02],Y
                STA   L037020
                STA   L037233
                PEA   ^L037231
                PEA   L037231
                PEA   $202C             ; DInfo
                JSL   GSOS2
                RTS

L0371F1         DB    $00
L0371F2         ASC   'Please re-insert the volume '
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
L037231         DW    $0002             ; Parms for DInfo
L037233         DW    $0000             ;  device num
                ADRL  L037066           ;  device name
L037239         CLC
                JSR   L033340
                LDA   L032EDA
                BNE   L037282
                STZ   L032F18
                LDA   #$0000
                TAX
                JSR   L034B1C
                BCC   L03724F
                RTS

L03724F         LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                INY
                INY
                LDA   #$0200
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                BCC   L03727F
                RTS

L03727F         BRL   L0372BB
L037282         LDA   L032F0C
                DEC
                BEQ   L0372A0
                LDA   #$0001
                STA   L032F8E
                LDA   #$0000
                STA   L033028
                LDA   #$0001
                LDX   #$8000
                JSR   L035D61
                BCC   L0372BB
L03729F         RTS

L0372A0         LDA   L0370B0
                BEQ   L0372AA
L0372A5         JSR   L037492
                BCS   L03729F
L0372AA         JSR   L033C2B
                BCC   L0372BB
                CMP   #$002F
                BEQ   L0372A5
                CMP   #$002E
                BEQ   L0372A5
                SEC
                RTS

L0372BB         LDX   L032F18
                TXA
                CLC
                ADC   #$004C
                TAY
                LDA   L033032
                STA   [$74],Y
                TXA
                CLC
                ADC   #$005E
                TAY
                LDA   L03705E
                STA   [$74],Y
                TXA
                CLC
                ADC   #$0064
                TAY
                LDA   L0370D5
                STA   [$74],Y
                INY
                INY
                LDA   L0370D7
                STA   [$74],Y
                TXA
                CLC
                ADC   #$000A
                TAY
                LDA   [$74],Y
                ORA   #$8000
                STA   [$74],Y
                TXA
                CLC
                ADC   #$0068
                TAY
                LDA   L03302E
                STA   [$74],Y
                INY
                INY
                LDA   L033030
                STA   [$74],Y
                LDA   L032EDA
                BEQ   L037353
                LDY   #$0002
                STA   [$02],Y
                LDA   #$0006
                STA   [$02]
                INY
                INY
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                INY
                INY
                LDA   L032EF0
                TAX
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                CPX   #$0200
                BNE   L037339
                LDA   #$0001
                BRA   L03733C
L037339         LDA   #$0000
L03733C         INY
                INY
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                TXA
                INY
                INY
                STA   [$02],Y
                LDA   #$2030
                JSR   L033500
                RTS

L037353         LDA   #$0000
                TAX
                JSR   L034B1C
                BCC   L03735D
                RTS

L03735D         LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                INY
                INY
                LDA   #$0200
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2013
                JSR   L033500
                RTS

L03738B         SEI
                JSR   L03740A
                LDAL  DEV_DISPATCHER+1
                STA   L037459
                LDAL  DEV_DISPATCHER+3
                AND   #$00FF
                STA   L03745B
                LDA   #L0373CA
                STAL  DEV_DISPATCHER+1
                LDA   #>L0373CA
                STAL  DEV_DISPATCHER+2
                JSR   L037442
                CLI
                RTS

L0373B3         SEI
                JSR   L03740A
                LDA   L037459
                STAL  DEV_DISPATCHER+1
                LDA   L03745A
                STAL  DEV_DISPATCHER+2
                JSR   L037442
                CLI
                RTS

L0373CA         PHD
                PHB
                PHB
                PHA
                PHX
                PHP
                PHK
                PLB
                REP   #$30
                BIT   L032FD6
                BPL   L0373FA
                LDAL  $00BD00
                CMP   L032EDA
                BNE   L0373FA
                LDAL  $00BD02
                CMP   #$0002
                BNE   L0373FA
                SEP   #$30
                LDAL  L040023
                TAX
                LDA   #$FF
                STAL  L04002B,X
                REP   #$30
L0373FA         LDA   L03745A
                STA   $08,S
                LDA   L037459
                DEC
                STA   $07,S
                PLP
                PLX
                PLA
                PLB
                RTL

L03740A         SEP   #$20
                LDAL  STATEREG
                STA   L037457
                ORA   #$80
                AND   #$C7
                STAL  STATEREG
                STZ   L037458
                LDAL  $00D000
                EOR   #$FF
                STAL  $00D000
                CMPL  $00D000
                BNE   L037437
                EOR   #$FF
                STAL  $00D000
                DEC   L037458
L037437         LDAL  LCBANK2
                LDAL  LCBANK2
                REP   #$20
                RTS

L037442         SEP   #$20
                BIT   L037458
                BMI   L03744D
                LDAL  RDBANK2
L03744D         LDA   L037457
                STAL  STATEREG
                REP   #$20
                RTS

L037457         DB    $00
L037458         DB    $00
L037459         DB    $00
L03745A         DB    $00
L03745B         DB    $00
                DB    $00
L03745D         DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DW    $A55A
                DW    $0008
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
                DB    $00
L03746D         PHK
                PLB
                BIT   L032FD8
                BMI   L03747F
                CMP   L032EDA
                BNE   L037491
                SEC
                ROR   L0370B0
                BRA   L037491
L03747F         CMP   L032EDA
                BNE   L037488
                SEC
                ROR   L0370B0
L037488         CMP   L037020
                BNE   L037491
                SEC
                ROR   L0370AE
L037491         RTL

L037492         PEA   $4030
                _SysBeep2
                LDAL  L060006
                CMP   #$0003
                BEQ   L0374AD
                STZ   L03762C
                LDX   #L037565
                BRA   L0374B4
L0374AD         SEC
                ROR   L03762C
                LDX   #L0375CD
L0374B4         LDA   #$000C
                JSR   L033456
                TAX
                BNE   L0374C7
L0374BD         JSR   L0334CD
                BCS   L037492
                LDA   #$8010
                SEC
L0374C6         RTS

L0374C7         JSR   L033DB4
                BCS   L0374C6
                BEQ   L0374D0
                BRA   L037492
L0374D0         BIT   L03762C
                BMI   L0374EC
                LDA   L03452F
                AND   #$0004
                BEQ   L0374E4
                JSR   L033E00
                BCC   L0374C7
                BRA   L0374BD
L0374E4         LDA   L032EE8
                ORA   L032EEA
                BEQ   L037563
L0374EC         JSR   L033C2B
                BCS   L037509
                LDA   #$0046
                CLC
                ADC   L032F18
                TAY
                LDA   [$74],Y
                CMP   L032F08
                BNE   L037509
                INY
                INY
                LDA   [$74],Y
                CMP   L032F0A
                BEQ   L037532
L037509         PEA   $4054
                _SysBeep2
                LDA   L032EDA
                LDX   #$0002
                JSR   L033D8B
                LDA   #$0001
                LDX   #L035F07
                JSR   L033456
                TAX
                BNE   L0374C7
L037528         JSR   L0334CD
                BCS   L0374C7
                LDA   #$8010
                SEC
                RTS

L037532         LDA   #$004A
                CLC
                ADC   L032F18
                TAY
                LDA   [$74],Y
                CMP   L032F0C
                BEQ   L037563
                PEA   $4054
                _SysBeep2
                LDA   L032EDA
                LDX   #$0002
                JSR   L033D8B
                LDA   #$0001
                LDX   #L035F99
                JSR   L033456
                TAX
                BEQ   L037528
                BRL   L0374C7
L037563         CLC
                RTS

L037565         STR   'Please re-insert the destination media into the destination device, or click Cancel to stop the backup.'
L0375CD         STR   'Please re-insert the backup media into the source device, or click Cancel to stop the restore.'
L03762C         DW    $0000
L03762E         LDAL  L060006
                CMP   #$0003
                BEQ   L03763C
                STZ   L03790C
                BRA   L037640
L03763C         SEC
                ROR   L03790C
L037640         LDA   L0370B8
                BNE   L03767C
                PEA   ^L03790E
                PEA   L03790E
                PEA   $2008             ; Volume
                JSL   GSOS2
                BCS   L0376BD
                LDA   L03708A
                STA   $78
                LDA   L03708C
                STA   $7A
                SEP   #$30
                LDA   [$78]
                CMP   L03791A
                BNE   L037675
                TAY
L037668         LDA   [$78],Y
                CMP   L03791B,Y
                BNE   L037675
                DEY
                BNE   L037668
                CLC
                BRA   L037676
L037675         SEC
L037676         REP   #$30
                BCS   L0376BD
                BRA   L0376F0
L03767C         LDA   L037020
                STA   L0377C4
                LDA   $74
                STA   L0377C6
                LDA   $76
                STA   L0377C6+2
                LDA   L0370BA
                STA   L0377CE
L037692         PEA   ^L0377C2
                PEA   L0377C2
                PEA   $202F             ; DRead
                JSL   GSOS2
                BCC   L0376AD
                CMP   #$002E
                BEQ   L037692
                CMP   #$002F
                BEQ   L0376BD
                BRA   L0376EB
L0376AD         LDY   #$0008
L0376B0         LDA   L032EA8,Y
                CMP   [$74],Y
                BNE   L0376BD
                DEY
                DEY
                BPL   L0376B0
                BRA   L0376F0
L0376BD         PEA   $4030
                _SysBeep2
                LDA   L03790C
                BNE   L0376D1
                LDX   #L0377D8
                BRA   L0376D4
L0376D1         LDX   #L037838
L0376D4         LDA   #$000C
                JSR   L033456
                TAX
                BEQ   L0376E0
                BRL   L03762E
L0376E0         JSR   L0334CD
                BCC   L0376E8
                BRL   L03762E
L0376E8         LDA   #$8010
L0376EB         STZ   L0370B8
L0376EE         SEC
                RTS

L0376F0         LDAL  L060006
                CMP   #$0003
                BEQ   L0376FE
                STZ   L03790C
                BRA   L037702
L0376FE         SEC
                ROR   L03790C
L037702         LDA   L037020
                STA   L0377B0
                PEA   ^L0377AE
                PEA   L0377AE
                PEA   $202D             ; DStatus
                JSL   GSOS2
                BCS   L0376EE
                LDA   L0377C0
                BIT   #$0010
                BEQ   L0376BD
                LDX   L03790C
                BEQ   L037742
                BIT   #$0004
                BEQ   L037742
                PEA   $4050
                _SysBeep2
                LDX   #L0378A5
                LDA   #$0004
                JSR   L033456
                TAX
                BEQ   L0376E0
                BRL   L03762E
L037742         STZ   L0370AE
                CLC
                RTS

L037747         LDA   L037020
                STA   L0377C4
                LDA   $74
                STA   L0377C6
                LDA   $76
                STA   L0377C6+2
                LDA   L0370BA
                STA   L0377CE
                LDA   L0370AE
                BEQ   L037768
L037762         JSR   L03762E
                BCC   L037768
                RTS

L037768         PEA   ^L0377C2
                PEA   L0377C2
                PEA   $202F             ; DRead
                JSL   GSOS2
                BCC   L037783
                CMP   #$002F
                BEQ   L037762
                CMP   #$002E
                BEQ   L037762
                SEC
                RTS

L037783         LDY   #$0008
L037786         LDA   L0370BC,Y
                STA   [$74],Y
                DEY
                DEY
                BPL   L037786
                PEA   ^L0377C2
                PEA   L0377C2
                PEA   $2030             ; DWrite
                JSL   GSOS2
                BCC   L0377AA
                CMP   #$002F
                BEQ   L037762
                CMP   #$002E
                BEQ   L037762
                SEC
                RTS

L0377AA         STZ   L0370B8
                RTS

L0377AE         DW    $0005             ; Parms for DStatus
L0377B0         DW    $0000             ;  device num
                DW    $0000             ;  status code
                ADRL  L0377C0           ;  status list
                ADRL  $00000002         ;  request count
                ADRL  $00000000         ;  transfer count
L0377C0         DW    $0000
L0377C2         DW    $0006             ; Parms for DWrite
L0377C4         DW    $0000             ;  device num
L0377C6         ADRL  $00000000         ;  buffer ptr
                ADRL  $00000200         ;  request count
L0377CE         ADRL  $00000000         ;  starting block
                DW    $0200             ;  block size
                ADRL  $00000000         ;  transfer count
L0377D8         STR   'Please re-insert the disk to back up into the source drive, or click Cancel to stop the backup.'
L037838         STR   'Please re-insert the disk you are restoring into the destination drive, or click Cancel to stop the restore.'
L0378A5         STR   'The destination volume is write-protected. Make sure the write-protect tab is in the correct position.'
L03790C         DW    $0000
L03790E         DW    $0002             ; Parms for Volume
                ADRL  L037068           ;  device name
                ADRL  L037918           ;  volume name
L037918         DW    $0026
L03791A         DB    $00
L03791B         DB    $00
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
L03793E         CPX   L0370AA
                BEQ   L03799B
                STX   L0370AA
                LDA   #L05002A
                STA   $78
                LDA   #^L05002A
                STA   $7A
                TXA
                STA   [$78]
                LDY   #$0002
                LDA   #^L03793E
                STA   [$78],Y
                PHA
                PHA
                LDAL  L0612BF
                PHA
                LDAL  L0612BD
                PHA
                PEA   $0000
                PEA   $048B
                _GetCtlHandleFromID
                PLY
                STY   $7C
                PLX
                STX   $7E
                PHX
                PHY
                _DrawOneCtl
                LDA   [$7C]
                CLC
                ADC   #$0008
                TAX
                LDY   #$0002
                LDA   [$7C],Y
                ADC   #$0000
                PHA
                PHX
                _ValidRect
L03799B         RTS

L03799C         JSR   L03350A
                LDA   L037042
                LDY   L037044
                LDX   L03701C
                BEQ   L0379B5
                SEC
                SBC   L03703E
                TAX
                TYA
                SBC   L037040
                TAY
                TXA
L0379B5         STA   $78
                ORA   $78
                BEQ   L0379DC
                TYA
                LDX   #$0000
L0379BF         ASL   $78
                ROL
                BCS   L0379C7
                INX
                BRA   L0379BF
L0379C7         STX   L032FCC
                ROR
                PHA
                PHA
                LDA   L032FCA
                PHA
                LDA   L032FC8
                PHA
                _SetCtlTitle
L0379DC         RTS

L0379DD         LDA   L037020
                STA   L0384B5
                STZ   L0370E1
                LDA   #$001E
                STA   L0370E3
                CLC
                LDA   $CE
                ADC   #$0128
                STA   L0384B7
                STA   $D2
                LDA   $D0
                ADC   #$0000
                STA   L0384B7+2
                STA   $D4
                LDA   #$0200
                STA   L0384BB
                STZ   L0384BB+2
                STA   L0384C3
                LDA   L03704C
                STA   L0384BF
                STZ   L0384BF+2
                STA   L0370DF
                JMP   L038490

L037A1C         LDA   L0370DF
                INC
                STA   L0370DF
                STA   L0384BF
                STZ   L0384BF+2
                SEC
                SBC   L03704C
                CMP   L037048
                BNE   L037A33
                RTS

L037A33         LDA   L037020
                STA   L0384B5
                CLC
                LDA   $CE
                ADC   #$0128
                STA   L0384B7
                STA   $D2
                LDA   $D0
                ADC   #$0000
                STA   L0384B7+2
                STA   $D4
                LDA   #$0200
                STA   L0384BB
                STZ   L0384BB+2
                STA   L0384C3
                STZ   L0370DD
                CLC
                RTS

L037A5F         LDA   L03701E
                BNE   L037A80
                LDA   $C6
                STA   L0370C8
                STA   L03714E
                LDA   $C8
                STA   L0370CA
                STA   L037150
                LDA   L037146
                STA   L037152
                LDA   L037148
                STA   L037154
L037A80         SEC
                LDA   L037152
                SBC   L0370C8
                AND   #$FE00
                STA   L037028
                LDA   L037154
                SBC   L0370CA
                STA   L03702A
                LDA   L0370D9
                BEQ   L037AC8
                STZ   L0370CC
                STZ   L0370CE
                STZ   L0370D0
                STZ   L0370D2
                BRA   L037AC5
                STZ   L0370D0
                LDA   L03704C
                CLC
                ADC   L037048
                STA   L0370D1
                LDA   L03704E
                ADC   L03704A
                STA   L0370D3
                ASL   L0370D1
                ROL   L0370D3
L037AC5         STZ   L0370D9
L037AC8         LDA   L0370DB
                BNE   L037AD4
                JSR   L037AD8
                BCS   L037AD7
                BVS   L037AD7
L037AD4         JSR   L037C95
L037AD7         RTS

L037AD8         LDA   L03701C
                BNE   L037AF4
L037ADD         LDA   L0370CC
                CMP   L037042
                BNE   L037AF1
                LDA   L0370CE
                CMP   L037044
                BNE   L037AF1
L037AED         SEP   #$40
                CLC
                RTS

L037AF1         REP   #$41
                RTS

L037AF4         LDA   L0370DF
                CMP   L037022
                BNE   L037B31
                LDY   L0370E1
                CPY   L037024
                BNE   L037B31
                LDX   L0370E3
                CPX   L037026
                BCS   L037B31
L037B0C         LDA   L037046
                CMP   #$0006
                BNE   L037AED
                LDA   L0370E9
                BNE   L037AED
                LDA   L037042
                SEC
                SBC   #$0002
                STA   L0370CC
                LDA   L037044
                SBC   #$0000
                STA   L0370CE
                DEC   L0370E9
                BRA   L037AF1
L037B31         LDA   L037046
                CMP   #$0001
                BEQ   L037B6C
                CMP   #$0006
                BNE   L037ADD
                LDA   L0370CC
                ORA   L0370CE
                BEQ   L037AF1
                LDX   L0370E3
                LDY   L0370E1
L037B4C         LDA   [$D2],Y
                BEQ   L037B5E
L037B50         AND   L037110,X
                BNE   L037B94
                JSR   L037C10
                BCS   L037B83
                BVC   L037B4C
                BRA   L037B0C
L037B5E         JSR   L037C81
                BCS   L037B50
                JSR   L037C17
                BCS   L037B83
                BVC   L037B4C
                BRA   L037B0C
L037B6C         LDX   L0370E3
                LDY   L0370E1
L037B72         LDA   [$D2],Y
                CMP   #$FFFF
                BEQ   L037B87
L037B79         AND   L037110,X
                BEQ   L037B94
                JSR   L037C10
                BCC   L037B84
L037B83         RTS

L037B84         BVC   L037B72
                RTS

L037B87         JSR   L037C81
                BCS   L037B79
                JSR   L037C17
                BCS   L037B83
                BVC   L037B72
                RTS

L037B94         SEC
                LDA   L0370DF
                SBC   L03704C
                ASL
                TAX
                LDA   L0370EC,X
                STA   L037C08
                STZ   L037C0A
                TYA
                ASL
                ASL
                ASL
                ADC   L037C08
                STA   L037C08
                LDX   L0370E3
                TXA
                LSR
                STA   L037C0C
                SEC
                LDA   #$000F
                SBC   L037C0C
                CLC
                ADC   L037C08
                STA   L037C08
                STA   L0370CC
                LDA   L037C0A
                STA   L0370CE
                LDA   L0370CC
                STA   L037C0C
                LDA   L0370CE
                STA   L037C0E
                LDX   L037054
                BRA   L037BF3
L037BE0         CLC
                LDA   L0370CC
                ADC   L037C0C
                STA   L0370CC
                LDA   L0370CE
                ADC   L037C0E
                STA   L0370CE
L037BF3         DEX
                BNE   L037BE0
                LDA   L0370CC
                CLC
                ADC   L03704E
                STA   L0370CC
                BCC   L037C05
                INC   L0370CE
L037C05         BRL   L037AF1
L037C08         DB    $00
                DB    $00
L037C0A         DB    $00
                DB    $00
L037C0C         DB    $00
                DB    $00
L037C0E         DB    $00
                DB    $00
L037C10         LDX   L0370E3
                DEX
                DEX
                BPL   L037C62
L037C17         LDX   #$001E
                LDY   L0370E1
                INY
                INY
                BIT   L03705C
                BPL   L037C2F
                STY   L0370E1
                STX   L0370E3
                STZ   L03705C
                BRA   L037C4B
L037C2F         CPY   #$0200
                BCC   L037C62
                LDAL  L060006
                CMP   #$0003
                BNE   L037C51
                LDA   L032EEA
                BNE   L037C51
                LDA   L0370DF
                INC
                CMP   L032EE8
                BCC   L037C51
L037C4B         SEC
                ROR   L0370DD
                BRA   L037C7A
L037C51         JSR   L037A1C
                BCS   L037C7A
                JSR   L038490
                BCC   L037C5C
                RTS

L037C5C         LDY   #$0000
                LDX   #$001E
L037C62         STY   L0370E1
                STX   L0370E3
                LDA   L0370DF
                CMP   L037022
                BNE   L037C7E
                CPY   L037024
                BNE   L037C7E
                CPX   L037026
                BCS   L037C7E
L037C7A         SEP   #$40
                CLC
                RTS

L037C7E         REP   #$41
                RTS

L037C81         PHA
                LDA   L0370DF
                CMP   L037022
                BNE   L037C92
                CPY   L037024
                BNE   L037C92
                PLA
                SEC
                RTS

L037C92         PLA
                CLC
                RTS

L037C95         LDA   L0370DB
                BEQ   L037C9D
                BRL   L037D83
L037C9D         LDA   L03701C
                BNE   L037CF0
L037CA2         LDA   L037029
                LSR
                CLC
                ADC   L0370CC
                TAX
                LDA   L0370CE
                BCC   L037CB1
                INC
L037CB1         CMP   L037044
                BCC   L037CDD
                BNE   L037CBD
                CPX   L037042
                BCC   L037CDD
L037CBD         LDA   L037042
                SEC
                SBC   L0370CC
                STA   L0370D0
                LDA   L037044
                SBC   L0370CE
                LDX   #$0009
L037CD0         ASL   L0370D0
                ROL
                DEX
                BNE   L037CD0
                STA   L0370D2
                BRL   L037DAF
L037CDD         CLC
                LDA   L037028
                AND   #$FE00
                STA   L0370D0
                LDA   L03702A
                STA   L0370D2
                BRL   L037DAF
L037CF0         LDA   L037046
                CMP   #$0001
                BEQ   L037D5E
                CMP   #$0006
                BNE   L037CA2
                LDA   L0370CC
                ORA   L0370CE
                BNE   L037D16
                LDA   L03704E
                STA   L0370D5
                STZ   L0370D7
                XBA
                ASL
                STA   L0370D0
                STZ   L0370D2
L037D16         LDA   L0370E9
                BEQ   L037D35
                LDA   #$0400
                STA   L0370D0
                STZ   L0370D2
                LDA   L0370D5
                CLC
                ADC   #$0002
                STA   L0370D5
                BCC   L037D83
                INC   L0370D7
                BRA   L037D83
L037D35         LDX   L0370E3
                LDY   L0370E1
L037D3B         LDA   [$D2],Y
                CMP   #$FFFF
                BEQ   L037D50
L037D42         AND   L037110,X
                BEQ   L037D83
                JSR   L037E5E
                BCS   L037D72
                BVC   L037D3B
                BRA   L037D83
L037D50         JSR   L037C81
                BCS   L037D42
                JSR   L037E83
                BCS   L037D72
                BVC   L037D3B
                BRA   L037D83
L037D5E         LDX   L0370E3
                LDY   L0370E1
L037D64         LDA   [$D2],Y
                BEQ   L037D77
L037D68         AND   L037110,X
                BNE   L037D83
                JSR   L037E5E
                BCC   L037D73
L037D72         RTS

L037D73         BVC   L037D64
                BRA   L037D83
L037D77         JSR   L037C81
                BCS   L037D68
                JSR   L037E83
                BCS   L037D72
                BVC   L037D64
L037D83         JSR   L0334DA
                BCC   L037D89
                RTS

L037D89         SEC
                LDA   L037028
                SBC   L0370D0
                LDA   L03702A
                SBC   L0370D2
                BCS   L037DAF
                LDA   L037028
                AND   #$FE00
                STA   L0384BB
                STA   L0330C6
                LDA   L03702A
                STA   L0384BB+2
                STA   L0330C8
                BRA   L037DC1
L037DAF         LDA   L0370D0
                STA   L0384BB
                STA   L0330C6
                LDA   L0370D2
                STA   L0384BB+2
                STA   L0330C8
L037DC1         LDA   L0370C8
                STA   L0384B7
                LDA   L0370CA
                STA   L0384B7+2
                LDA   L0370CC
                STA   L0384BF
                STA   L0330CA
                LDA   L0370CE
                STA   L0384BF+2
                STA   L0330CC
                LDA   #$0200
                STA   L0384C3
                LDA   L037020
                STA   L0384B5
                LDX   L0370B2
                JSR   L03793E
                JSR   L038490
                BCC   L037DF7
                RTS

L037DF7         LDA   L0384C5+1
                LSR
                LSR
                BCC   L037E01
                ORA   #$0001
L037E01         CLC
                ADC   L032FCE
                STA   L032FCE
                BCC   L037E0D
                INC   L032FD0
L037E0D         JSR   L03353E
                CLC
                LDA   L0370C8
                ADC   L0384C5
                STA   L0370C8
                LDA   L0370CA
                ADC   L0384C5+2
                STA   L0370CA
                SEC
                LDA   L0370D0
                SBC   L0384C5
                STA   L0370D0
                LDA   L0370D2
                SBC   L0384C5+2
                STA   L0370D2
                BCS   L037E41
                LDA   #$0000
                STA   L0370D0
                STA   L0370D2
L037E41         ORA   L0370D0
                STA   L0370DB
                LDA   L0384C5+1
                LSR
                CLC
                ADC   L0370CC
                STA   L0370CC
                LDA   #$0000
                ADC   L0370CE
                STA   L0370CE
                REP   #$41
                RTS

L037E5E         LDA   L037054
                CLC
                ADC   L0370D5
                STA   L0370D5
                BCC   L037E6D
                INC   L0370D7
L037E6D         CLC
                LDA   L037050
                ADC   L0370D0
                STA   L0370D0
                LDA   L037052
                ADC   L0370D2
                STA   L0370D2
                JMP   L037C10

L037E83         LDA   L037054
                STZ   L037ECE
                LDX   #$0004
L037E8C         ASL
                ROL   L037ECE
                DEX
                BNE   L037E8C
                CLC
                ADC   L0370D5
                STA   L0370D5
                LDA   L037ECE
                ADC   L0370D7
                STA   L0370D7
                LDA   L037052
                STA   L037ECE
                LDA   L037050
                ASL
                ROL   L037ECE
                ASL
                ROL   L037ECE
                ASL
                ROL   L037ECE
                ASL
                ROL   L037ECE
                ADC   L0370D0
                STA   L0370D0
                LDA   L037ECE
                ADC   L0370D2
                STA   L0370D2
                JMP   L037C17

L037ECE         DW    $0000
L037ED0         LDA   L03701E
                BNE   L037EED
                LDX   L0370CA
                LDA   L0370C8
                BNE   L037EDE
                DEX
L037EDE         DEC
                STA   $C6
                STX   $C8
                SEP   #$30
                JSR   L038186
                REP   #$30
                BRL   L037F6D
L037EED         JSR   L0334DA
                BCC   L037EF3
                RTS

L037EF3         LDX   L0370B6
                JSR   L03793E
                LDA   L03714E
                STA   $C2
                STA   L0370A6
                LDA   L037150
                STA   $C4
                STA   L0370A8
                STZ   L0370E7
                STZ   L0370E5
                STZ   L038184
                SEC
                LDA   #$0000
                SBC   L03710B+1
                STA   $E6
                LDA   #$0000
                SBC   L03710E
                STA   $E8
                ORA   $E6
                BEQ   L037F2A
                LDA   #$FFFF
L037F2A         STA   $EA
                SEP   #$30
L037F2E         LDA   $EA
                BEQ   L037F6D
                LDA   L0370E7
                BNE   L037F58
                STZ   L0370E8
                LDA   [$C2]
                STA   L0370E6
                INC   L0370E8
                DEC   L0370E7
                CMP   #$DB
                BNE   L037F53
                INC   L0370E8
                JSR   L03815F
                BVS   L037F7D
                BRA   L037FCB
L037F53         JSR   L03815F
                BVS   L037F7D
L037F58         LDA   [$C2]
                CMP   L0370E6
                BNE   L037F82
                INC   L0370E8
                PHP
                JSR   L03815F
                BVS   L037F7C
                PLP
                BNE   L037F58
                BRA   L037F8B
L037F6D         REP   #$30
                LDX   L03714E
                STX   L0370C8
                LDX   L037150
                STX   L0370CA
                RTS

L037F7C         PLP
                MX    %11
L037F7D         STZ   $EA
                STZ   L038184
L037F82         LDA   L0370E8
                BEQ   L037F8B
                CMP   #$04
                BCC   L037FCB
L037F8B         LDA   #$DB
                STA   [$C6]
                JSR   L038186
                BCC   L037F97
L037F94         REP   #$30
                RTS

                MX    %11
L037F97         LDA   L0370E8
                CMP   #$DB
                BNE   L037FA2
                DEC
                DEC   L0370E5
L037FA2         STA   [$C6]
                JSR   L038186
                BCS   L037F94
                LDA   L0370E6
                STA   [$C6]
                JSR   L038186
                BCS   L037F94
                LDX   L0370E5
                BEQ   L037FC2
                LDA   L0370E6
                STA   [$C6]
                JSR   L038186
                BCS   L037F94
L037FC2         STZ   L0370E7
                STZ   L0370E5
                BRL   L037F2E
L037FCB         LDX   L0370E8
L037FCE         LDA   L0370E6
                STA   [$C6]
                JSR   L038186
                BCS   L037F94
                DEX
                BNE   L037FCE
                STZ   L0370E7
                BRL   L037F2E
                MX    %00
L037FE1         LDX   L0370B6
                JSR   L03793E
                LDA   $CA
                STA   L03815B
                LDA   $CC
                STA   L03815D
                LDA   $C6
                SEC
                SBC   $CA
                STA   L03710B+1
                EOR   #$FFFF
                STA   L037094
                LDA   $C8
                SBC   $CC
                STA   L03710E
                EOR   #$FFFF
                INC   L037094
                BNE   L03800F
                INC
L03800F         STA   L037096
                BNE   L038017
                BRL   L038128
L038017         SEP   #$30
                LDA   L03709A
                BEQ   L03802B
                STA   L037098
                INC   L037094
                BNE   L03806D
                INC   L037096
                BRA   L03806D
L03802B         STZ   L03709C
                LDA   [$CA]
                CMP   #$DB
                BNE   L03809A
                INC   L03709C
                INC   L037094
                BNE   L038055
                INC   L037095
                BNE   L038055
                INC   L037096
                BNE   L038055
                INC   L037097
                BNE   L038055
L03804B         REP   #$30
                JSR   L038130
                STZ   L03709A
                SEC
                RTS

                MX    %11
L038055         STZ   L037099
                LDY   #$01
                LDA   [$CA],Y
                BNE   L038063
                LDX   #$01
                STX   L037099
L038063         CMP   #$DB
                BEQ   L03809A
                STA   L037098
                INC   L03709C
L03806D         REP   #$30
                LDA   L037152
                SEC
                SBC   $C2
                TAX
                LDA   L037154
                SBC   $C4
                BNE   L038082
                CPX   L037098
                BCC   L038085
L038082         LDX   L037098
L038085         INC   L037094
                BNE   L03808F
                INC   L037096
                BEQ   L03804B
L03808F         STX   L03709A
                SEP   #$30
                LDY   #$02
                LDA   [$CA],Y
                BRA   L0380A5
L03809A         LDX   #$01
                STX   L03709A
                STX   L037098
                STZ   L037099
L0380A5         PHX
                LDY   #$00
L0380A8         STA   [$C2],Y
                INY
                DEX
                BNE   L0380A8
                PLA
                REP   #$31
                AND   #$00FF
                BNE   L0380B9
                LDA   #$0100
L0380B9         ADC   $C2
                STA   $C2
                TAY
                LDX   $C4
                BCC   L0380C5
                INX
                STX   $C4
L0380C5         LDA   $CA
                SEC
                ADC   L03709C
                STA   $CA
                BCC   L0380D1
                INC   $CC
L0380D1         CPX   L037154
                BNE   L03810F
                CPY   L037152
                BNE   L03810F
L0380DB         LDA   L037098
                SEC
                SBC   L03709A
                BCS   L0380EF
                LDA   L03709A
                AND   #$00FF
                STA   L03709A
                BRA   L0380DB
L0380EF         STA   L03709A
                BEQ   L038100
                LDA   $CA
                CLC
                SBC   L03709C
                STA   $CA
                BCS   L038100
                DEC   $CC
L038100         LDA   $C2
                STA   L0370C8
                LDA   $C4
                STA   L0370CA
                JSR   L038130
                CLC
                RTS

L03810F         SEP   #$30
                INC   L037094
                BNE   L038125
                INC   L037095
                BNE   L038125
                INC   L037096
                BNE   L038125
                INC   L037097
                BEQ   L038128
L038125         BRL   L03802B
L038128         REP   #$30
                STZ   L03709C
                BRL   L03804B
L038130         LDA   $CA
                SEC
                SBC   L03815B
                STA   $78
                LDA   $CC
                SBC   L03815D
                LDX   #$000A
L038140         LSR
                ROR   $78
                DEX
                BNE   L038140
                TAX
                LDA   L032FCE
                CLC
                ADC   $78
                STA   L032FCE
                TXA
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                RTS

L03815B         BRK   $00
L03815D         BRK   $00
L03815F         INC   $E6
                BNE   L038172
                INC   $E7
                BNE   L038172
                INC   $E8
                BNE   L038172
                INC   $E9
                BNE   L038172
                DEC   L038184
L038172         INC   $C2
                BNE   L038180
                INC   $C3
                BNE   L038180
                INC   $C4
                BNE   L038180
                INC   $C5
L038180         BIT   L038184
                RTS

L038184         BRK   $00
L038186         INC   $C6
                BNE   L038194
                INC   $C7
                BNE   L038194
                INC   $C8
                BNE   L038194
                INC   $C9
L038194         LDA   $C6
                CMP   L037146
                BNE   L0381BC
                LDA   $C7
                CMP   L037147
                BNE   L0381BC
                LDA   $C8
                CMP   L037148
                BNE   L0381BC
                LDA   $C9
                CMP   L037149
                BNE   L0381BC
                REP   #$30
                PHY
                PHX
L0381B4         JSR   L03826E
                PLX
                PLY
                SEP   #$30
                RTS

L0381BC         CLC
                RTS

                MX    %00
L0381BE         LDA   L037142
                STA   $CA
                LDA   L037144
                STA   $CC
                LDA   L03714E
                STA   $C2
                STA   L0370C8
                LDA   L037150
                STA   $C4
                STA   L0370CA
                LDA   L033050
                TCS
                JMP   L0387CB

L0381DF         LDX   #$0022
L0381E2         LDA   L033056,X
                STA   L0370C8,X
                DEX
                DEX
                BPL   L0381E2
                LDA   L03307A
                STA   $C2
                LDA   L03307C
                STA   $C4
                LDA   L03307E
                STA   $E6
                LDA   L033080
                STA   $E8
                LDA   L03308C
                LDX   L03308E
                CMP   L0330CA
                BNE   L038210
                CPX   L0330CC
                BEQ   L038240
L038210         STA   L0384BF
                STX   L0384BF+2
                LDA   L033088
                STA   L0384BB
                LDA   L03308A
                STA   L0384BB+2
                LDA   L03714E
                STA   L0384B7
                LDA   L037150
                STA   L0384B7+2
                LDA   #$0200
                STA   L0384C3
                LDA   L037020
                STA   L0384B5
                JSR   L038490
                BCC   L038240
                RTS

L038240         LDA   L033090
                STA   L032FCE
                LDA   L033092
                STA   L032FD0
                JSR   L03353E
                DEC   L032F0C
                LDA   L033050
                TCS
                PEA   L038882+2
                LDA   L033086
                PHA
                LDA   L033084
                PHA
                LDA   L033082
                PHA
                PEA   L0381B4+2
                PEA   L0382C7+2
                JMP   L033FD8

L03826E         JSR   L0334DA
                BCC   L038274
                RTS

L038274         LDA   $C6
                SEC
                SBC   L037142
                STA   L032EBC
                LDA   $C8
                SBC   L037144
                STA   L032EBE
                LDX   #$0022
L038288         LDA   L0370C8,X
                STA   L033094,X
                DEX
                DEX
                BPL   L038288
                LDA   $C2
                STA   L0330B8
                LDA   $C4
                STA   L0330BA
                LDA   $E6
                STA   L0330BC
                LDA   $E8
                STA   L0330BE
                LDA   $03,S
                STA   L0330C0
                LDA   $05,S
                STA   L0330C2
                LDA   $07,S
                STA   L0330C4
                LDA   L032FCE
                STA   L033090
                LDA   L032FD0
                STA   L033092
                LDA   L0370AA
                STA   L0370AC
L0382C7         JSR   L03454D
                BCC   L0382CD
                RTS

L0382CD         LDX   L0370AC
                JSR   L03793E
                JSR   L0334DA
                BCC   L0382D9
                RTS

L0382D9         LDA   L03701E
                BNE   L0382EC
                LDA   $C6
                SEC
                SBC   L037142
                TAY
                LDA   $C8
                SBC   L037144
                BRA   L0382F8
L0382EC         LDA   $C2
                SEC
                SBC   L0370A6
                TAY
                LDA   $C4
                SBC   L0370A8
L0382F8         LDX   #$000A
                STA   $78
                TYA
L0382FE         LSR   $78
                ROR
                DEX
                BNE   L0382FE
                BCC   L038309
                ORA   #$0001
L038309         CLC
                ADC   L032FCE
                STA   L032FCE
                BCC   L038315
                INC   L032FD0
L038315         LDA   $C2
                STA   L0370A6
                LDA   $C4
                STA   L0370A8
                JSR   L03353E
                LDA   L032EBC
                CLC
                ADC   $6C
                STA   $CA
                STA   $C6
                LDA   L032EBE
                ADC   $6E
                STA   $CC
                STA   $C8
                LDA   L032EC8
                CLC
                ADC   $6C
                STA   L037146
                LDA   L032ECA
                ADC   $6E
                STA   L037148
                LDA   L03701E
                BNE   L03836B
                LDA   $CA
                STA   L03714E
                STA   $C2
                STA   L0370C8
                LDA   $CC
                STA   L037150
                STA   $C4
                STA   L0370CA
                LDA   L037146
                STA   L037152
                LDA   L037148
                STA   L037154
L03836B         CLC
                RTS

L03836D         LDA   L03705A
                XBA
                AND   #$00FF
                STA   L037048
                STZ   L03704A
                LSR   L03704A
                ROR   L037048
                LSR   L03704A
                ROR   L037048
                LSR   L03704A
                ROR   L037048
                LSR   L03704A
                ROR   L037048
                LDA   L03705A
                AND   #$0FFF
                BEQ   L0383A2
                INC   L037048
                BNE   L0383A2
                INC   L03704A
L0383A2         PHA
                LSR
                LSR
                LSR
                AND   #$FFFE
                STA   L037024
                PLA
                AND   #$000F
                ASL
                EOR   #$001F
                STA   L037026
                CLC
                LDA   L037048
                DEC
                ADC   L03704C
                STA   L037022
                RTS

L0383C3         LDA   L037046
                CMP   #$0001
                BEQ   L0383D3
                CMP   #$0006
                BEQ   L0383D3
                BRL   L038475
L0383D3         LDA   L037020
                STA   L03847C
                CLC
                LDA   $CE
                ADC   #$0128
                STA   L03847E
                STA   $D2
                LDA   $D0
                ADC   #$0000
                STA   L03847E+2
                STA   $D4
                LDA   L0370AE
                BEQ   L0383F8
L0383F3         JSR   L03762E
                BCS   L03840E
L0383F8         JSL   GSOS
                DW    $202F             ; DRead
                ADRL  L03847A
                BCC   L03840F
                CMP   #$002F
                BEQ   L0383F3
                CMP   #$002E
                BEQ   L0383F3
L03840E         RTS

L03840F         LDA   L037046
                CMP   #$0001
                BNE   L03843C
                LDY   #$0027
                LDA   [$D2],Y
                STA   L03704C
                LDA   #$0200
                STA   L037050
                STZ   L037052
                STZ   L03704E
                LDA   L037042
                STA   L037056
                STA   L03705A
                LDA   L037044
                STA   L037058
                BRA   L038469
L03843C         LDY   #$000E
                LDA   [$D2],Y
                XBA
                STA   L03704C
                LDY   #$0014
                LDA   [$D2],Y
                XBA
                STA   L037052
                LDY   #$0016
                LDA   [$D2],Y
                XBA
                STA   L037050
                LDY   #$001C
                LDA   [$D2],Y
                XBA
                STA   L03704E
                LDY   #$0012
                LDA   [$D2],Y
                XBA
                STA   L03705A
L038469         JSR   L03836D
                LDA   L037051
                LSR
                STA   L037054
                CLC
                RTS

L038475         STZ   L03701C
                CLC
                RTS

L03847A         DW    $0006             ; Parms for DRead
L03847C         DW    $0000             ;  device num
L03847E         ADRL  $00000000         ;  buffer ptr
                ADRL  $00000200         ;  request count
                ADRL  $00000002         ;  starting block
                DW    $0200             ;  block size
                ADRL  $00000000         ;  transfer count
L038490         LDA   L0370AE
                BEQ   L03849B
L038495         JSR   L03762E
                BCC   L03849B
                RTS

L03849B         JSL   GSOS
                DW    $202F             ; DRead
                ADRL  L0384B3
                BCC   L0384B2
                CMP   #$002F
                BEQ   L038495
                CMP   #$002E
                BEQ   L038495
                SEC
L0384B2         RTS

L0384B3         DW    $0006             ; Parms for DRead
L0384B5         DW    $0000             ;  device num
L0384B7         ADRL  $00000000         ;  buffer ptr
L0384BB         ADRL  $00000000         ;  request count
L0384BF         ADRL  $00000000         ;  starting block
L0384C3         DW    $0000             ;  block size
L0384C5         ADRL  $00000000         ;  transfer count
L0384C9         LDA   $6C
                STA   L037142
                LDA   $6E
                STA   L037144
                LDA   L03701E
                BNE   L038529
                LDA   L037142
                STA   L03714E
                STA   $C2
                STA   L0370C8
                LDA   L037144
                STA   L037150
                STA   $C4
                STA   L0370CA
                LDA   L032EC0
                LDX   L032EDA
                BEQ   L0384FE
                LDX   L032EF0
                CPX   #$0200
                BNE   L038503
L0384FE         AND   #$FE00
                BRA   L038506
L038503         AND   #$E000
L038506         BNE   L03850F
                LDX   L032EC2
                BNE   L03850F
                SEC
                RTS

L03850F         STA   L032EC0
                CLC
                ADC   L037142
                STA   L037146
                STA   L037152
                LDA   L032EC2
                ADC   L037144
                STA   L037148
                STA   L037154
                RTS

L038529         LDA   L032EC2
                BNE   L03855B
                LDA   L032EDA
                BNE   L038536
                BRL   L0385C6
L038536         STZ   $7A
                LDA   L032EC0
                LSR
                CMP   L032EF0
                BCC   L038545
                STA   $78
                BRA   L038567
L038545         LDA   L032EC0
                SEC
                SBC   L032EF0
                CMP   #$0200
                BCS   L038554
                BRL   L0385F2
L038554         LDA   L032EF0
                STA   $78
                BRA   L038567
L03855B         LDA   L032EC2
                LSR
                STA   $7A
                LDA   L032EC0
                ROR
                STA   $78
L038567         LDA   $78
                LDY   L032EF0
                CPY   #$0200
                BNE   L038576
                AND   #$FE00
                BRA   L038579
L038576         AND   #$E000
L038579         CLC
                ADC   #$0002
                CLC
                ADC   $6C
                STA   L037146
                STA   L03714E
                STA   $C2
                STA   L0370C8
                LDA   $7A
                ADC   $6E
                STA   L037148
                STA   L037150
                STA   $C4
                STA   L0370CA
L03859A         LDA   L032EC0
                CLC
                ADC   $6C
                TAX
                LDA   L032EC2
                ADC   $6E
                TAY
                TXA
                SEC
                SBC   L03714E
                AND   #$FE00
                TAX
                TYA
                SBC   L037150
                TAY
                TXA
                CLC
                ADC   L03714E
                STA   L037152
                TYA
                ADC   L037150
                STA   L037154
                BRA   L0385F7
L0385C6         LDA   L032EC0
                CMP   #$0400
                BCC   L0385EC
                AND   #$FE00
                LSR
                CLC
                ADC   #$0002
L0385D6         CLC
                ADC   $6C
                STA   L037146
                STA   L03714E
                LDA   $6E
                ADC   #$0000
                STA   L037148
                STA   L037150
                BRA   L03859A
L0385EC         SEC
                SBC   #$0200
                BCS   L0385D6
L0385F2         LDA   #$0054
                SEC
                RTS

L0385F7         LDA   L037146
                SEC
                SBC   L037142
                AND   #$FFFC
                STA   L032EC0
                LDA   L037148
                SBC   L037144
                STA   L032EC2
                CLC
                RTS

L03860F         LDA   L032F14
                PHA
                _DisposeAll
                RTS

L03861B         ENT
                PHB
                LDA   $01,S
                PHK
                PLB
                STA   L032FC6
                TDC
                STA   L032EB2
                LDA   $05,S
                TCD
                LDA   $09,S
                STA   L032EDA
                LDA   $0B,S
                STA   L032EF2
                LDA   $07,S
                ORA   #$0300
                STA   L032F14
                LDA   $0D,S
                STA   L032F02
                LDA   $0F,S
                STA   L032F04
                LDA   $11,S
                STA   L032F06
                LDA   $13,S
                STA   $22
                LDA   $15,S
                STA   $24
                LDA   $17,S
                STA   L032FE4
                LDA   $19,S
                STA   L032FE6
                LDA   $1B,S
                STA   L03708A
                LDA   $1D,S
                STA   L03708C
                LDA   $1F,S
                STA   L037046
                LDA   $21,S
                STA   L037042
                LDA   $23,S
                STA   L037044
                LDA   $25,S
                STA   L03703E
                LDA   $27,S
                STA   L037040
                PLA
                STA   $23,S
                PLA
                STA   $23,S
                TSC
                CLC
                ADC   #$0020
                TCS
                STA   L033050
                LDA   #L038997
                STA   L033102
                LDA   #$FFFF
                STA   L0370AA
                JSR   L0334DA
                BCC   L0386A3
                BRL   L0388E0
L0386A3         LDX   #L038934
                STX   L0370B4
                JSR   L03793E
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                STZ   L037130
                STZ   L0330D2
                STZ   L03701E
                STZ   L033034
                STZ   L03701C
                LDAL  L060002
                BIT   #$0200
                BEQ   L0386D1
                DEC   L03701C
L0386D1         BIT   #$000F
                BEQ   L0386DF
                DEC   L03701E
                LDA   #$0020
                TSB   L033034
L0386DF         SEC
                ROR   L032FD8
                LDA   #$0004
                TSB   L033034
                STZ   L0370D5
                STZ   L0370D7
                JSR   L03537D
                BCC   L0386F7
L0386F4         BRL   L0388E0
L0386F7         CLC
                JSR   L033340
                LDX   #$2000
                LDA   #$0000
                LDY   L032F14
                JSR   L0325E6
                STX   L037132
                STX   $7C
                STY   L037134
                STY   $7E
                BCS   L0386F4
                LDY   #$0002
                LDA   [$7C],Y
                STA   $D0
                STA   L03713C
                STA   L037140
                TAX
                LDA   [$7C]
                STA   $CE
                STA   L03713A
                STA   L03713E
                CLC
                ADC   #$2000
                STA   L037136
                BCC   L038735
                INX
L038735         STX   L037138
                JSR   L0353FE
                BCS   L0386F4
                JSR   L0384C9
                BCS   L0386F4
                STZ   L0370C6
                JSR   L037156
                BCC   L03874D
                BRL   L0388E0
L03874D         LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2034
                JSR   L033500
                BCC   L03876C
                BRL   L0388E0
L03876C         STZ   L0370AE
                JSR   L03738B
                STZ   L0370C6
                JSR   L0383C3
                BCC   L03877D
                BRL   L0388E0
L03877D         LDA   L03701C
                BEQ   L038788
                LDA   #$0100
                TSB   L033034
L038788         PHA
                PHA
                PHA
                PHA
                _ReadTimeHex
                LDX   #$0000
L038796         PLA
                STA   L032EFA,X
                INX
                INX
                CPX   #$0008
                BNE   L038796
                LDA   L032EFA
                EOR   L032EFC
                EOR   L037042
                EOR   L03714E
                STA   L032F08
                LDA   L032EFE
                EOR   L032F00
                EOR   L037044
                EOR   L037150
                STA   L032F0A
                LDA   #L0381BE
                STA   L033052
                LDA   #L0381DF
                STA   L033054
L0387CB         JSR   L0334DA
                BCC   L0387D3
                BRL   L0388E0
L0387D3         STZ   L032F0C
                STZ   L03705C
                STZ   L0370D9
                DEC   L0370D9
                STZ   L0370DB
                STZ   L0370E9
                JSR   L03799C
                STZ   L032EBC
                STZ   L032EBE
                SEC
                ROR   L0370C6
                JSR   L035197
                BCC   L0387FA
L0387F7         BRL   L0388E0
L0387FA         STZ   L0370C6
                JSR   L0379DD
                BCS   L0387F7
                LDA   [$D2]
                STA   L03705E
                LDA   L032EC8
                CLC
                ADC   L037142
                STA   L037146
                LDA   L032ECA
                ADC   L037144
                STA   L037148
                LDA   L032EBC
                CLC
                ADC   $6C
                STA   $C6
                LDA   L032EBE
                ADC   $6E
                STA   $C8
                LDA   L032ECA
                BNE   L038844
                LDA   L032EC8
                CMP   #$8000
                BCS   L038844
                LDA   #L038951
                STA   L0370B2
                STA   L0370B4
                STA   L0370B6
                BRA   L038856
L038844         LDA   #L038982
                STA   L0370B2
                LDA   #L034753
                STA   L0370B4
                LDA   #L038969
                STA   L0370B6
L038856         JSR   L0334DA
                BCC   L03885E
                BRL   L0388E0
L03885E         STZ   L0370C6
                JSR   L037A5F
                BCC   L038869
                BRL   L0388E0
L038869         BVS   L03888A
                LDA   L0370C8
                SEC
                SBC   L03714E
                STA   L03710B+1
                LDA   L0370CA
                SBC   L037150
                STA   L03710E
                SEC
                ROR   L0370C6
L038882         JSR   L037ED0
                BCC   L03885E
                BRL   L0388E0
L03888A         LDA   L03701E
                BNE   L038899
                LDA   L0370C8
                STA   $C6
                LDA   L0370CA
                STA   $C8
L038899         LDA   $C6
                SEC
                SBC   L037142
                STA   L032EBC
                STA   $78
                LDA   $C8
                SBC   L037144
                STA   L032EBE
                LDX   #$0009
L0388AF         LSR
                ROR   $78
                DEX
                BNE   L0388AF
                STA   L032FD4
                LDA   $78
                STA   L032FD2
                SEC
                ROR   L0370C6
                JSR   L0347CC
                BCC   L0388C9
                BRL   L0388E0
L0388C9         JSR   L037239
                BCC   L0388D1
                BRL   L0388E0
L0388D1         LDA   #$FFFF
                STA   L032FCE
                STA   L032FD0
                JSR   L03353E
                LDA   #$0000
L0388E0         STA   L037130
                LDA   L032EDA
                BNE   L038906
                LDA   L037130
                BNE   L0388F1
                SEC
                ROR   L0370C6
L0388F1         LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                BEQ   L038906
                STA   [$02],Y
                LDA   #$2014
                JSR   L033500
L038906         JSR   L03860F
                JSR   L0373B3
                LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2035
                JSR   L033500
                LDA   L037130
                STA   [$22]
                CMP   #$0001
                LDA   L032EB2
                TCD
                PLB
                RTL

L038934         STR   'Preparing for volume backupI'
L038951         STR   'Backing up volume dataI'
L038969         STR   'Compressing volume dataI'
L038982         STR   'Reading volume dataI'
L038997         STR   'Your backup will be completely unusable.'
                DB    $00
L0389C1         LDX   L0370B2
                JSR   L03793E
L0389C7         LDA   L037146
                SEC
                SBC   $CA
                STA   L037030
                LDA   L037148
                SBC   $CC
                STA   L037032
                LDA   L032EDA
                BEQ   L0389E0
                BRL   L038A70
L0389E0         LDA   L03302E
                SEC
                SBC   L032FE8
                TAX
                STA   L037034
                LDA   L033030
                SBC   L032FEA
                STA   L037036
                CMP   L037032
                BCC   L038A08
                BNE   L038A00
                CPX   L037030
                BCC   L038A08
L038A00         LDA   L037030
                LDX   L037032
                BRA   L038A0E
L038A08         LDA   L037034
                LDX   L037036
L038A0E         STA   L0370D0
                STX   L0370D2
                TAY
                ORA   L0370D2
                BEQ   L038A6C
                TYA
                LDY   #$0008
                STA   [$02],Y
                INY
                INY
                TXA
                STA   [$02],Y
                LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   $CA
                STA   [$02],Y
                INY
                INY
                LDA   $CC
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                BCC   L038A47
                RTS

L038A47         LDA   L032FE8
                CLC
                ADC   L0370D0
                STA   L032FE8
                LDA   L032FEA
                ADC   L0370D2
                STA   L032FEA
                LDA   $CA
                CLC
                ADC   L0370D0
                STA   $CA
                LDA   $CC
                ADC   L0370D2
                STA   $CC
                CLC
                CLV
                RTS

L038A6C         CLC
                SEP   #$40
                RTS

L038A70         LDA   L032F0C
                CMP   L033032
                BNE   L038A8D
                LDA   L037062
                SEC
                SBC   L0370CC
                STA   L037038
                LDA   L037064
                SBC   L0370CE
                STA   L03703A
                BRA   L038AA0
L038A8D         LDA   L032ED6
                SEC
                SBC   L0370CC
                STA   L037038
                LDA   L032ED8
                SBC   L0370CE
                STA   L03703A
L038AA0         LDA   L037030
                LDY   L037032
                JSR   L033372
                CPY   L03703A
                BCC   L038AB5
                BNE   L038ACD
                CMP   L037038
                BCS   L038ACD
L038AB5         LDA   L037030
                LDX   L032EF0
                CPX   #$0200
                BEQ   L038AC5
                AND   #$E000
                BRA   L038AC8
L038AC5         AND   #$FE00
L038AC8         LDX   L037032
                BRA   L038AE0
L038ACD         LDA   L03703A
                STA   $EC
                LDA   L037038
                LDX   L032ED4
L038AD8         ASL
                ROL   $EC
                DEX
                BNE   L038AD8
                LDX   $EC
L038AE0         STA   L0370D0
                STX   L0370D2
                LDY   L0370B0
                BEQ   L038AF1
L038AEB         JSR   L037492
                BCC   L038AF1
                RTS

L038AF1         LDA   L0370D0
                LDX   L0370D2
                TAY
                ORA   L0370D2
                BNE   L038B00
                BRL   L038A6C
L038B00         TYA
                LDY   #$0008
                STA   [$02],Y
                INY
                INY
                TXA
                STA   [$02],Y
                LDA   #$0006
                STA   [$02]
                LDY   #$0002
                LDA   L032EDA
                STA   [$02],Y
                INY
                INY
                LDA   $CA
                STA   [$02],Y
                INY
                INY
                LDA   $CC
                STA   [$02],Y
                LDY   #$000C
                LDA   L0370CC
                STA   [$02],Y
                INY
                INY
                LDA   L0370CE
                STA   [$02],Y
                INY
                INY
                LDA   L032EF0
                STA   [$02],Y
                LDA   #$202F
                JSR   L033500
                BCC   L038B50
                CMP   #$002F
                BEQ   L038AEB
                CMP   #$002E
                BNE   L038B4E
                BRA   L038AEB
L038B4E         SEC
                RTS

L038B50         LDA   L03703C
                BEQ   L038B7C
                CLC
                ADC   $CA
                TAX
                LDA   $CC
                TAY
                ADC   #$0000
                PHA
                PHX
                PHY
                LDA   $CA
                PHA
                LDA   L0370D0
                SEC
                SBC   L03703C
                TAX
                LDA   L0370D2
                SBC   #$0000
                PHA
                PHX
                _BlockMove
L038B7C         LDA   L0370D0
                SEC
                SBC   L03703C
                TAX
                LDA   L0370D2
                SBC   #$0000
                TAY
                TXA
                CLC
                ADC   $CA
                STA   $CA
                TYA
                ADC   $CC
                STA   $CC
                STZ   L03703C
                LDA   L0370D0
                LDY   L0370D2
                JSR   L033372
                CLC
                ADC   L0370CC
                STA   L0370CC
                TAX
                TYA
                ADC   L0370CE
                STA   L0370CE
                CMP   L032ED8
                BNE   L038BF0
                CPX   L032ED6
                BNE   L038BF0
                LDA   L032F0C
                CMP   L033032
                BEQ   L038BF0
                INC
                STA   L032F8E
                LDA   #$0000
                STA   L033028
                TAX
                LDA   #$0001
                JSR   L035D61
                BCC   L038BD7
                RTS

L038BD7         JSR   L039058
                LDA   L037146
                SEC
                SBC   $CA
                TAX
                LDA   L037148
                SBC   $CC
                BNE   L038BED
                CPX   L032EF0
                BCC   L038BF0
L038BED         BRL   L0389C7
L038BF0         CLC
                CLV
                RTS

L038BF3         STX   L038CA8
                STA   L038CAA
                LDY   L0370AE
                BEQ   L038C04
L038BFE         JSR   L03762E
                BCC   L038C04
                RTS

L038C04         LDA   L0370B8
                BNE   L038C2A
                DEC   L0370B8
                LDY   #$0008
L038C0F         LDA   [$C2],Y
                STA   L0370BC,Y
                DEY
                DEY
                BPL   L038C0F
                LDY   #$0008
L038C1B         LDA   L032EA8,Y
                STA   [$C2],Y
                DEY
                DEY
                BPL   L038C1B
                LDA   L032EE8
                STA   L0370BA
L038C2A         LDX   L038CA8
                LDA   L038CAA
                LDY   #$000A
                STA   [$02],Y
                DEY
                DEY
                TXA
                STA   [$02],Y
                LDA   #$0006
                STA   [$02]
                LDY   #$0002
                LDA   L037020
                STA   [$02],Y
                INY
                INY
                LDA   $C2
                STA   [$02],Y
                INY
                INY
                LDA   $C4
                STA   [$02],Y
                LDY   #$000C
                LDA   L032EE8
                STA   [$02],Y
                INY
                INY
                LDA   L032EEA
                STA   [$02],Y
                INY
                INY
                LDA   #$0200
                STA   [$02],Y
                LDX   L0370B4
                JSR   L03793E
                LDA   #$2030
                JSR   L033500
                BCC   L038C86
                CMP   #$002F
                BEQ   L038BFE
                CMP   #$002E
                BNE   L038C84
                BRL   L038BFE
L038C84         SEC
                RTS

L038C86         LDA   L038CA8
                LDX   #$000A
L038C8C         LSR   L038CAA
                ROR
                DEX
                BNE   L038C8C
                CLC
                ADC   L032FCE
                STA   L032FCE
                LDA   L038CAA
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                CLC
                RTS

L038CA8         DW    $0000
L038CAA         DW    $0000
L038CAC         BIT   L0370DD
                BPL   L038CC7
                LDA   L0370E1
                CMP   #$0002
                BNE   L038CBC
                DEC   L0370DF
L038CBC         JSR   L037A1C
                BCS   L038D0E
                JSR   L038490
                BCC   L038CC7
                RTS

L038CC7         LDA   L0370DF
                CMP   L037022
                BNE   L038D18
                LDY   L0370E1
                CPY   L037024
                BNE   L038D18
                LDX   L0370E3
                CPX   L037026
                BCS   L038D18
                LDA   L037046
                CMP   #$0006
                BNE   L038D0E
                LDA   L0370E9
                BNE   L038D0E
L038CEC         LDA   L037042
                SEC
                SBC   #$0002
                STA   L032EE8
                LDA   L037044
                SBC   #$0000
                STA   L032EEA
                LDA   #$0002
                STA   L03702C
                STZ   L03702E
                DEC   L0370E9
                REP   #$41
                RTS

L038D0E         STZ   L03702C
                STZ   L03702E
                CLC
                SEP   #$40
                RTS

L038D18         LDA   L037046
                CMP   #$0001
                BEQ   L038D72
                LDA   L032EE8
                TAX
                ORA   L032EEA
                BNE   L038D39
                LDA   L037022
                INC
                STA   L03704E
                STA   L03702C
                STZ   L03702E
                REP   #$41
                RTS

L038D39         DEX
                CPX   L037022
                BNE   L038D4A
                LDA   L032EEA
                BNE   L038D4A
                JSR   L0379DD
                BCC   L038D4A
                RTS

L038D4A         LDX   L0370E3
                LDY   L0370E1
L038D50         LDA   [$D2],Y
                BEQ   L038D63
L038D54         AND   L037110,X
                BNE   L038DA8
                JSR   L037C10
                BCC   L038D5F
L038D5E         RTS

L038D5F         BVC   L038D50
                BRA   L038CEC
L038D63         JSR   L037C81
                BCS   L038D54
                JSR   L037C17
                BCS   L038D5E
                BVC   L038D50
                BRL   L038CEC
L038D72         LDX   L0370E3
                LDY   L0370E1
L038D78         BIT   L03705C
                BPL   L038D82
                LDA   L03705E
                BRA   L038D84
L038D82         LDA   [$D2],Y
L038D84         CMP   #$FFFF
                BEQ   L038D99
L038D89         AND   L037110,X
                BEQ   L038DA8
                JSR   L037C10
                BCC   L038D94
L038D93         RTS

L038D94         BVC   L038D78
                BRL   L038D0E
L038D99         JSR   L037C81
                BCS   L038D89
                JSR   L037C17
                BCS   L038D93
                BVC   L038D78
                BRL   L038D0E
L038DA8         LDA   L0370DF
                SEC
                SBC   L03704C
                ASL
                TAX
                LDA   L0370EC,X
                STA   L038EB7
                STZ   L038EB9
                TYA
                ASL
                ASL
                ASL
                ADC   L038EB7
                STA   L038EB7
                LDX   L0370E3
                TXA
                LSR
                STA   $EC
                SEC
                LDA   #$000F
                SBC   $EC
                CLC
                ADC   L038EB7
                STA   L038EB7
                STA   L032EE8
                LDA   L038EB9
                STA   L032EEA
                LDA   L032EE8
                STA   $EC
                LDA   L032EEA
                STA   $EE
                LDX   L037054
                BRA   L038E01
L038DF0         CLC
                LDA   L032EE8
                ADC   $EC
                STA   L032EE8
                LDA   L032EEA
                ADC   $EE
                STA   L032EEA
L038E01         DEX
                BNE   L038DF0
                LDA   L032EE8
                CLC
                ADC   L03704E
                STA   L032EE8
                BCC   L038E13
                INC   L032EEA
L038E13         LDA   L037046
                CMP   #$0001
                BEQ   L038E44
                LDX   L0370E3
                LDY   L0370E1
L038E21         LDA   [$D2],Y
                CMP   #$FFFF
                BEQ   L038E36
L038E28         AND   L037110,X
                BEQ   L038E75
                JSR   L038E9B
                BCS   L038E62
                BVC   L038E21
                BRA   L038E75
L038E36         JSR   L037C81
                BCS   L038E28
                JSR   L038EA6
                BCS   L038E62
                BVC   L038E21
                BRA   L038E75
L038E44         LDX   L0370E3
                LDY   L0370E1
L038E4A         BIT   L03705C
                BPL   L038E54
                LDA   L03705E
                BRA   L038E56
L038E54         LDA   [$D2],Y
L038E56         BEQ   L038E67
L038E58         AND   L037110,X
                BNE   L038E75
                JSR   L038E9B
                BCC   L038E63
L038E62         RTS

L038E63         BVC   L038E4A
                BRA   L038E75
L038E67         JSR   L037C81
                BCS   L038E58
                JSR   L038EA6
                BCS   L038E62
                BVC   L038E4A
                BRA   L038E75
L038E75         LDA   L03702C
                STA   $EC
                LDA   L03702E
                STA   $EE
                LDX   L037054
                BRA   L038E95
L038E84         CLC
                LDA   L03702C
                ADC   $EC
                STA   L03702C
                LDA   L03702E
                ADC   $EE
                STA   L03702E
L038E95         DEX
                BNE   L038E84
                REP   #$41
                RTS

L038E9B         INC   L03702C
                BNE   L038EA3
                INC   L03702E
L038EA3         JMP   L037C10

L038EA6         LDA   L03702C
                ADC   #$0010
                STA   L03702C
                BCC   L038EB4
                INC   L03702E
L038EB4         JMP   L037C17

L038EB7         BRK   $00
L038EB9         BRK   $00
L038EBB         LDA   L03701C
                BEQ   L038EC3
                BRL   L038F68
L038EC3         LDA   L0370C8
                SEC
                SBC   L03714E
                TAX
                LDA   L0370CA
                SBC   L037150
                TAY
                TXA
                STY   $78
                STZ   $7A
                LDX   #$0009
L038EDA         LSR   $78
                ROR
                ROR   $7A
                DEX
                BNE   L038EDA
                TAY
                LDA   #$0010
                SEC
                SBC   #$0009
L038EEA         LSR   $7A
                DEC
                BNE   L038EEA
                TYA
                LDY   $78
                LDX   $7A
                STA   L037060
                CLC
                ADC   L032EE8
                TAX
                TYA
                ADC   L032EEA
                CMP   L037044
                BCC   L038F17
                BNE   L038F0C
                CPX   L037042
                BCC   L038F17
L038F0C         LDA   L037042
                SEC
                SBC   L032EE8
                STA   L037060
                TAX
L038F17         LDA   L03705F
                AND   #$FF00
                ASL
                STA   L032EBC
                TAX
                LDA   L037061
                AND   #$00FF
                ROL
                STA   L032EBE
                LDY   L03714E
                STY   $C2
                LDY   L037150
                STY   $C4
                JSR   L038BF3
                BCC   L038F3C
                RTS

L038F3C         LDA   L032EBF
                AND   #$00FF
                LSR
                TAY
                LDA   L032EBD
                ROR
                CLC
                ADC   L032EE8
                STA   L032EE8
                TAX
                TYA
                ADC   L032EEA
                STA   L032EEA
                CMP   L037044
                BNE   L038F65
                CPX   L037042
                BNE   L038F65
                CLC
                SEP   #$40
                RTS

L038F65         BRL   L039045
L038F68         LDA   L03714E
                STA   $C2
                LDA   L037150
                STA   $C4
                LDA   L0370C8
                SEC
                SBC   $C2
                STA   L037028
                LDA   L0370CA
                SBC   $C4
                STA   L03702A
L038F83         LDA   L03702C
                ORA   L03702E
                BNE   L038F93
                JSR   L038CAC
                BCC   L038F91
L038F90         RTS

L038F91         BVS   L038F90
L038F93         LDA   L037028
                STA   $EC
                LDA   L03702A
                LDX   #$0009
L038F9E         LSR
                ROR   $EC
                DEX
                BNE   L038F9E
                LDX   L03702E
                BNE   L038FC6
                LDX   $EC
                CPX   L03702C
                BCC   L038FC6
                LDA   L03702C
                STA   L037060
                STZ   $EC
                LDX   #$0009
L038FBB         ASL
                ROL   $EC
                DEX
                BNE   L038FBB
                TAX
                LDA   $EC
                BRA   L038FD1
L038FC6         LDA   $EC
                STA   L037060
                LDA   L03702A
                LDX   L037028
L038FD1         STA   L032EBE
                STX   L032EBC
                JSR   L038BF3
                BCC   L038FDD
                RTS

L038FDD         LDA   L032EE8
                CLC
                ADC   L037060
                STA   L032EE8
                BCC   L038FEC
                INC   L032EEA
L038FEC         LDA   L03702C
                SEC
                SBC   L037060
                STA   L03702C
                BCS   L038FFB
                DEC   L03702E
L038FFB         LDA   L037090
                CLC
                ADC   L037060
                STA   L037090
                BCC   L03900A
                INC   L037092
L03900A         CMP   L0370D5
                BNE   L03901B
                LDA   L037092
                CMP   L0370D7
                BNE   L03901B
                CLC
                SEP   #$40
                RTS

L03901B         LDA   $C2
                CLC
                ADC   L032EBC
                STA   $C2
                LDA   $C4
                ADC   L032EBE
                STA   $C4
                LDA   L037028
                SEC
                SBC   L032EBC
                STA   L037028
                LDA   L03702A
                SBC   L032EBE
                STA   L03702A
                ORA   L037028
                BEQ   L039045
                BRL   L038F83
L039045         LDA   L03714E
                STA   L0370C8
                STA   $C2
                LDA   L037150
                STA   L0370CA
                STA   $C4
                REP   #$41
                RTS

L039058         LDA   $74
                CLC
                ADC   L032F18
                STA   $74
                BCC   L039064
                INC   $76
L039064         LDA   L032EDA
                BEQ   L039072
                LDA   L032F0C
                DEC
                BEQ   L039072
                BRL   L03913C
L039072         LDY   #$0046
                LDA   [$74],Y
                STA   L032F08
                INY
                INY
                LDA   [$74],Y
                STA   L032F0A
                LDY   #$000A
                LDA   [$74],Y
                STA   L033034
                BIT   #$0100
                BEQ   L039091
                DEC   L03701C
L039091         AND   #$00E0
                CMP   #$0020
                BNE   L03909C
                DEC   L03701E
L03909C         LDY   #$004E
                LDA   [$74],Y
                STA   L037042
                INY
                INY
                LDA   [$74],Y
                STA   L037044
                LDY   #$006E
                LDA   [$74],Y
                STA   L03705A
                LDY   #$004C
                LDA   [$74],Y
                STA   L033032
                LDY   #$005E
                LDA   [$74],Y
                STA   L03705E
                LDY   #$0060
                LDA   [$74],Y
                STA   L03704C
                STA   L0370DF
                LDY   #$006C
                LDA   [$74],Y
                STA   L037022
                SEC
                SBC   L03704C
                INC
                STA   L037048
                STZ   L03704A
                LDY   #$005C
                LDA   [$74],Y
                STA   L037046
                LDY   #$0062
                LDA   [$74],Y
                STA   L037054
                LDY   #$0064
                LDA   [$74],Y
                STA   L0370D5
                INY
                INY
                LDA   [$74],Y
                STA   L0370D7
                LDA   L037042
                SEC
                SBC   L0370D5
                STA   L03703E
                LDA   L037044
                SBC   L0370D7
                STA   L037040
                LDY   #$0068
                LDA   [$74],Y
                STA   L03302E
                TAX
                INY
                INY
                LDA   [$74],Y
                STA   L033030
                LDY   L032EDA
                BEQ   L039154
                TAY
                TXA
                JSR   L033372
                STA   L037062
                TXA
                BEQ   L039139
                INC   L037062
                BNE   L039139
                INY
L039139         STY   L037064
L03913C         LDY   #$0054
                LDA   [$74],Y
                TAX
                INY
                INY
                LDA   [$74],Y
                TAY
                TXA
                JSR   L033372
                STA   L0370CC
                STY   L0370CE
                STX   L03703C
L039154         LDA   $74
                SEC
                SBC   L032F18
                STA   $74
                BCS   L039160
                DEC   $74
L039160         RTS

L039161         ENT
                PHB
                LDA   $01,S
                PHK
                PLB
                STA   L032FC6
                TDC
                STA   L032EB2
                LDA   $05,S
                TCD
                LDA   $07,S
                ORA   #$0300
                STA   L032F14
                LDA   $09,S
                STA   $22
                LDA   $0B,S
                STA   $24
                LDA   $0D,S
                STA   L032EDA
                LDA   $0F,S
                STA   L03708A
                LDA   $11,S
                STA   L03708C
                LDA   $13,S
                STA   L032FE4
                LDA   $15,S
                STA   L032FE6
                PLA
                STA   $11,S
                PLA
                STA   $11,S
                TSC
                CLC
                ADC   #$000E
                TCS
                LDA   #L05004E
                STA   $02
                LDA   #^L05004E
                STA   $04
                STZ   L037130
                LDA   #$FFFF
                STA   L0370AA
                STZ   L03701E
                STZ   L03701C
                STZ   L0370E9
                STZ   L0370B8
                SEC
                ROR   L032FD8
                LDA   #L03952B
                STA   L033102
                JSR   L0334DA
                BCC   L0391D6
                BRL   L0394B5
L0391D6         LDX   #L0395C6
                JSR   L03793E
                JSR   L03537D
                BCC   L0391E4
                BRL   L0394B5
L0391E4         STZ   L032EE8
                STZ   L032EEA
                STZ   L0370C6
                LDA   L032EDA
                BNE   L039263
                STZ   L032FE2
                LDY   #$0004
                LDA   L032FE4
                STA   [$02],Y
                INY
                INY
                LDA   L032FE6
                STA   [$02],Y
                LDA   #$0002
                STA   [$02]
                LDA   #$2010
                JSR   L033500
                BCC   L039214
                BRL   L0394B5
L039214         LDY   #$0002
                LDA   [$02],Y
                STA   L032FE2
                STZ   L032FE8
                STZ   L032FEA
                CLC
                JSR   L033340
                LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                STA   [$02],Y
                INY
                INY
                LDA   $74
                STA   [$02],Y
                INY
                INY
                LDA   $76
                STA   [$02],Y
                INY
                INY
                LDA   #$0200
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                LDA   #$2012
                JSR   L033500
                BCC   L039258
                BRL   L0394B5
L039258         LDA   #$0200
                STA   L032FE8
                STZ   L032F18
                BRA   L039273
L039263         JSR   L0334DA
                BCC   L03926B
                BRL   L0394B5
L03926B         JSR   L036651
                BCC   L039273
                BRL   L0394B5
L039273         JSR   L039058
                SEC
                ROR   L0370C6
                JSR   L037156
                BCC   L039282
                BRL   L0394B5
L039282         LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2034
                JSR   L033500
                BCC   L0392A1
                BRL   L0394B5
L0392A1         SEC
                ROR   L0370C6
                LDA   #$0004
                STA   [$02]
                LDY   #$0002
                LDA   #L037068
                STA   [$02],Y
                INY
                INY
                LDA   #^L037068
                BCC   L0392BA
                INC
L0392BA         STA   [$02],Y
                INY
                INY
                LDA   #L039522
                STA   [$02],Y
                INY
                INY
                LDA   #^L039522
                STA   [$02],Y
                LDY   #$000C
                LDA   L037046
                CMP   #$0006
                BEQ   L0392D8
                LDA   #$0001
L0392D8         STA   [$02],Y
                LDA   #$2025
                JSR   L033500
                BCC   L0392F3
                CMP   #$002B
                BNE   L0392F0
                SEC
                ROR   L0370C6
                JSR   L0376F0
                BCC   L0392A1
L0392F0         BRL   L0394B5
L0392F3         STZ   L0370AE
                LDA   L03708A
                STA   $12
                LDA   L03708C
                STA   $14
                SEP   #$30
                LDA   L039522
                STA   [$12]
                TAY
L039308         LDA   L039522+1,Y
                STA   [$12],Y
                DEY
                BNE   L039308
                REP   #$30
                JSR   L03799C
                LDX   #$2000
                LDA   #$0000
                LDY   L032F14
                JSR   L0325E6
                STX   L037132
                STX   $7C
                STY   L037134
                STY   $7E
                BCC   L039330
L03932D         BRL   L0394B5
L039330         LDY   #$0002
                LDA   [$7C],Y
                STA   $D0
                STA   L03713C
                STA   L037140
                TAX
                LDA   [$7C]
                STA   $CE
                STA   L03713A
                STA   L03713E
                CLC
                ADC   #$2000
                STA   L037136
                BCC   L039352
                INX
L039352         STX   L037138
                JSR   L0353FE
                BCS   L03932D
                JSR   L0384C9
                BCS   L03932D
                JSR   L03836D
                LDA   L037046
                CMP   #$0001
                BNE   L039370
                SEC
                ROR   L03705C
                BRA   L039373
L039370         STZ   L03705C
L039373         STZ   L03709A
                STZ   L03702C
                STZ   L03702E
                STZ   L032EE8
                STZ   L032EEA
                STZ   L037090
                STZ   L037092
                STZ   L0370DD
                STZ   L03708E
                STZ   L0370E1
                LDA   #$001E
                STA   L0370E3
                LDA   L03714E
                STA   $C2
                LDA   L037150
                STA   $C4
                LDA   L037142
                STA   $CA
                LDA   L037144
                STA   $CC
                LDA   L037146
                SEC
                SBC   $CA
                TAX
                LDA   L037148
                SBC   $CC
                BNE   L0393CC
                CPX   #$8000
                BCS   L0393CC
                LDA   #L03955E
                STA   L0370B2
                STA   L0370B4
                STA   L0370B6
                BRA   L0393DE
L0393CC         LDA   #L039575
                STA   L0370B2
                LDA   #L039593
                STA   L0370B4
                LDA   #L0395AB
                STA   L0370B6
L0393DE         LDA   L032EDA
                BEQ   L0393EB
                JSR   L036651
                BCC   L0393EB
                BRL   L0394B5
L0393EB         LDA   L037142
                STA   $C6
                LDA   L037144
                STA   $C8
L0393F5         JSR   L0334DA
                BCC   L0393FD
                BRL   L0394B5
L0393FD         STZ   L0370C6
                JSR   L0389C1
                BCC   L039408
                BRL   L0394B5
L039408         BVC   L039416
                LDA   $C2
                STA   L0370C8
                LDA   $C4
                STA   L0370CA
                BRA   L03948F
L039416         LDA   L03701E
                BEQ   L03945B
                LDA   $CA
                STA   $C6
                LDA   $CC
                STA   $C8
                LDA   L037142
                STA   $CA
                LDA   L037144
                STA   $CC
L03942D         JSR   L0334DA
                BCC   L039435
                BRL   L0394B5
L039435         JSR   L037FE1
                BCC   L03948F
                LDA   [$CA]
                LDX   L037142
                STX   $78
                LDX   L037144
                STX   $7A
                STA   [$78]
                LDA   L037142
                CLC
                ADC   L03709C
                STA   $CA
                LDA   L037144
                ADC   #$0000
                STA   $CC
                BRA   L0393F5
L03945B         LDA   $CA
                SEC
                SBC   L037142
                STA   $78
                LDA   $CC
                SBC   L037144
                LDX   #$000A
L03946B         LSR
                ROR   $78
                DEX
                BNE   L03946B
                TAX
                LDA   L032FCE
                CLC
                ADC   $78
                STA   L032FCE
                TXA
                ADC   L032FD0
                STA   L032FD0
                JSR   L03353E
                LDA   $CA
                STA   L0370C8
                LDA   $CC
                STA   L0370CA
L03948F         JSR   L0334DA
                BCC   L039496
                BRA   L0394B5
L039496         SEC
                ROR   L0370C6
                JSR   L038EBB
                BCC   L0394A1
                BRA   L0394B5
L0394A1         BVS   L0394B8
                LDA   L03701E
                BNE   L03942D
                LDA   L037142
                STA   $CA
                LDA   L037144
                STA   $CC
                BRL   L0393F5
L0394B5         STA   L037130
L0394B8         LDA   L0370B8
                BEQ   L0394D3
                LDA   L037130
                BNE   L0394C6
                SEC
                ROR   L0370C6
L0394C6         JSR   L037747
                BCC   L0394D3
                LDX   L037130
                BNE   L0394D3
                STA   L037130
L0394D3         JSR   L03860F
                LDA   L032EDA
                BNE   L0394FA
                LDA   #$0001
                STA   [$02]
                LDY   #$0002
                LDA   L032FE2
                BEQ   L0394FA
                STA   [$02],Y
                LDA   #$2014
                JSR   L033500
                BCC   L0394FA
                LDY   L037130
                BNE   L0394FA
                STA   L037130
L0394FA         LDA   #$0001
                STA   [$02]
                LDA   #L03745D
                LDY   #$0002
                STA   [$02],Y
                LDA   #^L03745D
                INY
                INY
                STA   [$02],Y
                LDA   #$2035
                JSR   L033500
                LDA   L037130
                STA   [$22]
                CMP   #$0001
                LDA   L032EB2
                TCD
                PLB
                RTL

L039522         STRL  ':X.arch'
L03952B         STR   'The restored volume will be left completely blank.'
L03955E         STR   'Restoring volume dataI'
L039575         STR   'Reading data from backup setI'
L039593         STR   'Writing data to volumeI'
L0395AB         STR   'Decompressing volume dataI'
L0395C6         STR   'Preparing for volume restoreI'
L0395E4         STZ   L03709E
                STZ   L0370A0
L0395EA         LDA   #$9000
                LDY   #$0001
                JSR   L033372
                STA   L0370A2
                STY   L0370A4
                CLC
                ADC   L03709E
                TAX
                TYA
                ADC   L0370A0
                CMP   L032ED8
                BCC   L039630
                BNE   L03960E
                CPX   L032ED6
                BCC   L039630
L03960E         LDA   L032ED6
                SEC
                SBC   L03709E
                STA   L0370A2
                STA   $78
                LDA   L032ED8
                SBC   L0370A0
                STA   L0370A4
                LDX   L032ED4
L039626         ASL   $78
                ROL
                DEX
                BNE   L039626
                LDX   $78
                BRA   L039636
L039630         LDX   #$9000
                LDA   #$0001
L039636         LDY   #$000A
                STA   [$02],Y
                TXA
                DEY
                DEY
                STA   [$02],Y
                LDA   #$0006
                STA   [$02]
                LDY   #$0002
                LDA   L032EDA
                STA   [$02],Y
                INY
                INY
                LDA   #$0000
                STA   [$02],Y
                INY
                INY
                LDA   #$00F0
                STA   [$02],Y
                LDY   #$000C
                LDA   L03709E
                STA   [$02],Y
                INY
                INY
                LDA   L0370A0
                STA   [$02],Y
                INY
                INY
                LDA   L032EF0
                STA   [$02],Y
                LDA   #$202F
                JSR   L033500
                BCS   L03969C
                LDA   L03709E
                CLC
                ADC   L0370A2
                STA   L03709E
                TAY
                LDA   L0370A0
                ADC   L0370A4
                STA   L0370A0
                CMP   L032ED8
                BNE   L039697
                CPY   L032ED6
                BEQ   L03969A
L039697         BRL   L0395EA
L03969A         CLC
                RTS

L03969C         SEC
                RTS

L03969E         ENT
                PHD
                TSC
                CLC
                ADC   #$FFF4
                TCS
                TCD
                PHY
                PHY
                JSL   L03A45D
                PLA
                STA   $01
                PLX
                STX   $03
L0396B2         PHY
                PHY
                JSL   L03A45D
                PLA
                STA   $05
                PLX
                STX   $07
                PEI   $07
                PEI   $05
                LDA   $01
                LDX   $03
                JSL   L03B1AC
                PHX
                PHA
                LDA   $12
                LDX   $14
                JSL   L03AA18
                BVS   L0396D9
                EOR   #$8000
L0396D9         BPL   L0396B2
                LDA   $10
                STA   $14
                LDA   $0F
                STA   $13
                LDA   $0D
                TCD
                TSC
                CLC
                ADC   #$0012
                TCS
                RTL

L0396ED         ENT
                PHD
                TSC
                CLC
                ADC   #$FEE3
                TCS
                ADC   #$002A
                TCD
                TDC
                CLC
                ADC   #$00D6
                PEA   $0000
                PHA
                PEI   $FA
                PEI   $F8
                PEA   $0008
                JSL   L03B108
                LDA   $DA
                JSL   L03A610
                INC
                PHA
                TDC
                CLC
                ADC   #$00E4
                PEA   $0000
                PHA
                PEA   $0002
                PEA   $0000
                JSL   L03A8C7
                SEP   #$20
                LDA   #$02
                STA   $E3
                REP   #$20
                LDA   $DB
                JSL   L03A610
                INC
                PHA
                TDC
                CLC
                ADC   #$00ED
                PEA   $0000
                PHA
                PEA   $0002
                PEA   $0000
                JSL   L03A8C7
                SEP   #$20
                LDA   #$02
                STA   $EC
                REP   #$20
                LDA   $D9
                JSL   L03A610
                PHA
                TDC
                CLC
                ADC   #$00DF
                PEA   $0000
                PHA
                PEA   $0002
                PEA   $0000
                JSL   L03A8C7
                SEP   #$20
                LDA   #$02
                STA   $DE
                REP   #$20
                LDA   $D8
                JSL   L03A610
                PHA
                TDC
                CLC
                ADC   #$00E7
                PEA   $0000
                PHA
                PEA   $0002
                PEA   $0000
                JSL   L03A8C7
                SEP   #$20
                LDA   #$02
                STA   $E6
                REP   #$20
                LDA   $D7
                JSL   L03A610
                PHA
                TDC
                CLC
                ADC   #$00EA
                PEA   $0000
                PHA
                PEA   $0002
                PEA   $0000
                JSL   L03A8C7
                SEP   #$20
                LDA   #$02
                STA   $E9
                REP   #$20
                LDA   #$00FF
                AND   $EA
                AND   #$00FF
                CMP   #$0020
                BNE   L0397CD
                SEP   #$20
                LDA   #$30
                STA   $EA
                REP   #$20
L0397CD         PEI   $FE
                PEI   $FC
                LDA   $DD
                JSL   L03A610
                DEC
                ASL
                ASL
                TAX
                LDAL  L060124+2,X
                PHA
                LDAL  L060124,X
                PLX
                PHX
                PHA
                PEA   ^L0514B5
                PEA   L0514B5
                TDC
                CLC
                ADC   #$00EC
                PEA   $0000
                PHA
                PEA   ^L0514B8
                PEA   L0514B8
                TDC
                CLC
                ADC   #$00E3
                PEA   $0000
                PHA
                PEA   ^L0514BA
                PEA   L0514BA
                TDC
                CLC
                ADC   #$00DE
                PEA   $0000
                PHA
                PEA   ^L0514BC
                PEA   L0514BC
                TDC
                CLC
                ADC   #$00E6
                PEA   $0000
                PHA
                PEA   ^L0514BF
                PEA   L0514BF
                TDC
                CLC
                ADC   #$00E9
                PEA   $0000
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$FFD6
                PHA
                PEA   $000B
                JSL   L03A8DC
                PEA   $0100
                JSL   L03B108
                LDA   $F6
                STA   $FA
                LDA   $F5
                STA   $F9
                LDA   $F3
                TCD
                TSC
                CLC
                ADC   #$0123
                TCS
                RTL

L03985B         ENT
                PHD
                TSC
                CLC
                ADC   #$FFE5
                TCS
                TCD
                PEI   $23
                TDC
                CLC
                ADC   #$000E
                PEA   $0000
                PHA
                PEI   $21
                PEA   $0000
                JSL   L03A8C7
                LDA   $21
                SEP   #$20
                STA   $0D
                REP   #$20
                LDA   $23
                BNE   L039897
                TDC
                CLC
                ADC   #$000D
                STA   $18
                STZ   $1A
                LDY   $21
                LDA   #$0030
                SEP   #$20
                STA   [$18],Y
                REP   #$20
L039897         LDA   #$00FF
                AND   $0E
                AND   #$00FF
                CMP   #$0020
                BNE   L0398B9
                TDC
                CLC
                ADC   #$000D
                PEA   $0000
                PHA
                PEA   $0001
                PEA   $0001
                JSL   L03A96C
                BRA   L039897
L0398B9         PEI   $27
                PEI   $25
                TDC
                CLC
                ADC   #$000D
                PEA   $0000
                PHA
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                PEA   $0001
                JSL   L03A8DC
                PEA   $000B
                JSL   L03B108
                LDA   $1F
                STA   $23
                LDA   $1E
                STA   $22
                LDA   $1C
                TCD
                TSC
                CLC
                ADC   #$0021
                TCS
                RTL

L0398EF         ENT
                PHD
                TSC
                CLC
                ADC   #$FEE1
                TCS
                ADC   #$002C
                TCD
                PEI   $FA
                PEI   $F8
                PEA   $0000
                TDC
                CLC
                ADC   #$FFE1
                PHA
                PEA   $000A
                PEA   $0000
                JSL   L03B16B
                LDX   #$FFE0
                SEP   #$20
                LDA   #$0A
                STA   $00,X
                REP   #$20
                PEA   $0000
                TDC
                CLC
                ADC   #$FFEB
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$FFE0
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$FFD4
                PHA
                PEA   $0001
                JSL   L03A8DC
                PEA   $000B
                JSL   L03B108
                LDA   #$0001
                STA   $EB
L03994A         PEA   $000A
                LDA   $EB
                PEA   $0003
                JSL   L03AA73
                PLA
                STA   $EF
                PLA
                SEC
                SBC   $EF
                STA   $ED
                LDA   $ED
                CLC
                ADC   #$FFEB
                TAX
                LDA   #$00FF
                AND   $00,X
                AND   #$00FF
                CMP   #$0020
                BEQ   L03998A
                PEA   ^L0514C1
                PEA   L0514C1
                PEA   $0000
                TDC
                CLC
                ADC   #$FFEB
                PHA
                LDA   $ED
                INC
                PHA
                JSL   L03AAE2
L03998A         LDA   #$0003
                CMP   $EB
                BEQ   L039995
                INC   $EB
                BRA   L03994A
L039995         LDA   #$00FF
                LDX   #$FFEC
                AND   $00,X
                AND   #$00FF
                CMP   #$0020
                BNE   L0399BA
                PEA   $0000
                TDC
                CLC
                ADC   #$FFEB
                PHA
                PEA   $0001
                PEA   $0001
                JSL   L03A96C
                BRA   L039995
L0399BA         PEI   $FE
                PEI   $FC
                PEA   $0000
                TDC
                CLC
                ADC   #$FFEB
                PHA
                PEA   $0100
                JSL   L03B108
                LDA   $F6
                STA   $FA
                LDA   $F5
                STA   $F9
                LDA   $F3
                TCD
                TSC
                CLC
                ADC   #$0125
                TCS
                RTL

L0399E0         ENT
                PHD
                TSC
                CLC
                ADC   #$FDF6
                TCS
                ADC   #$0117
                TCD
                PEA   $0000
                TDC
                CLC
                ADC   #$FEE9
                PHA
                PEI   $FA
                PEI   $F8
                PEA   $0101
                JSL   L03B108
                PEA   $0000
                TDC
                CLC
                ADC   #$FFEE
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$FEE9
                PHA
                PEA   $0101
                JSL   L03B108
                TDC
                CLC
                ADC   #$FFEE
                LDX   #$FFEA
                STA   $00,X
                STZ   $02,X
                LDX   #$FFEA
                LDA   $02,X
                TAY
                LDA   $00,X
                TYX
                CLC
                ADC   #$0001
                BCC   L039A34
                INX
L039A34         PHX
                PHA
                LDX   #$FFEA
                LDA   $02,X
                PHA
                LDA   $00,X
                PHA
                PLA
                PLX
                STA   $EF
                STX   $F1
                LDA   #$00FF
                AND   [$EF]
                PHA
                PLA
                PLX
                STX   $EF
                PLX
                STX   $F1
                SEP   #$20
                STA   [$EF]
                REP   #$20
                PEI   $FE
                PEI   $FC
                LDX   #$FFEA
                LDA   $02,X
                TAY
                LDA   $00,X
                TYX
                INC
                BNE   L039A69
                INX
L039A69         PHX
                PHA
                PEA   $0100
                JSL   L03B108
                LDA   $F6
                STA   $FA
                LDA   $F5
                STA   $F9
                LDA   $F3
                TCD
                TSC
                CLC
                ADC   #$0210
                TCS
                RTL

L039A84         ENT
                PHD
                TSC
                CLC
                ADC   #$FFE8
                TCS
                TCD
                JSL   L03A633
                TAY
                CLC
                TSC
                ADC   #$0000
                TCS
                TYA
                STA   $01
                PHY
                PHY
                JSL   L03A60A
                PLA
                STA   $11
                PLX
                STX   $13
                PEA   $0002
                PEA   $0001
                JSL   L03ADF1
                LDY   #$00B0
                LDA   [$11],Y
                TAX
                DEY
                DEY
                LDA   [$11],Y
                STA   $0B
                LDA   $0B
                SEC
                SBC   #$0006
                BPL   L039AC7
                BRL   L039B76
L039AC7         CMP   #$000A
                BMI   L039ACF
                BRL   L039B76
L039ACF         SEC
                SBC   #$0000
                BEQ   L039B29
                SEC
                SBC   #$0005
                BEQ   L039AE6
                DEC
                BEQ   L039B4C
                DEC
                DEC
                DEC
                BEQ   L039AE6
                BRL   L039B76
L039AE6         LDA   #$000B
                CMP   $0B
                BNE   L039AF9
                LDA   #$0033
                STA   $0D
                LDA   #$006B
                STA   $0F
                BRA   L039B03
L039AF9         LDA   #$0069
                STA   $0D
                LDA   #$008C
                STA   $0F
L039B03         PEA   $0014
                PEI   $0D
                JSL   L03B15F
                PEA   $01F4
                PEI   $0D
                JSL   L03A7F1
                PEA   $0014
                PEI   $0F
                JSL   L03B15F
                PEA   $01F4
                PEI   $0F
                JSL   L03A7F1
                BRA   L039B76
L039B29         LDA   #$0083
                STA   $03
                LDA   #$00AD
                STA   $07
                LDA   #$000A
                STA   $05
                LDA   #$00FD
                STA   $09
                TDC
                CLC
                ADC   #$0003
                PEA   $0000
                PHA
                JSL   L03B1FC
                BRA   L039B76
L039B4C         PEA   $000F
                PEA   $007F
                JSL   L03B15F
                PEA   $0184
                PEA   $007F
                JSL   L03A7F1
                PEA   $000F
                PEA   $0055
                JSL   L03B15F
                PEA   $0184
                PEA   $0055
                JSL   L03A7F1
                BRA   L039B76
L039B76         PEA   ^L061206
                PEA   L061206
                JSL   L03AA12
                LDA   $0B
                SEC
                SBC   #$0009
                BMI   L039BDB
                CMP   #$0007
                BPL   L039BDB
                SEC
                SBC   #$0000
                BEQ   L039BB1
                SEC
                SBC   #$0006
                BEQ   L039B9B
                BRA   L039BDB
L039B9B         PEA   $00D1
                PEA   $0014
                JSL   L03B15F
                PEA   $00D1
                PEA   $0038
                JSL   L03A7F1
                BRA   L039BDB
L039BB1         PEA   $000F
                PEA   $005E
                JSL   L03B15F
                PEA   $01AE
                PEA   $005E
                JSL   L03A7F1
                PEA   $000F
                PEA   $0079
                JSL   L03B15F
                PEA   $01AE
                PEA   $0079
                JSL   L03A7F1
                BRA   L039BDB
L039BDB         PEA   ^L06120E
                PEA   L06120E
                JSL   L03AA12
                PEI   $13
                PEI   $11
                JSL   L03B390
                LDX   #$0000
                LDA   #$000B
                CMP   $0B
                BNE   L039BF8
                INX
L039BF8         PHX
                LDX   #$0000
                LDA   #$000F
                CMP   $0B
                BNE   L039C04
                INX
L039C04         TXA
                ORA   $01,S
                PLX
                LSR
                BCC   L039C49
                LDA   L0612D1
                ORA   L0612D3
                BEQ   L039C2A
                LDA   L0612D1
                LDX   L0612D3
                PHX
                PHA
                PEA   $F000
                LDA   L0612C5
                PHA
                LDA   L0612C7
                PHA
                JSL   L03A5ED
L039C2A         LDA   L0612D5
                ORA   L0612D7
                BEQ   L039C49
                LDA   L0612D5
                LDX   L0612D7
                PHX
                PHA
                PEA   $F000
                LDA   L0612C1
                PHA
                LDA   L0612C3
                PHA
                JSL   L03A5ED
L039C49         PEI   $01
                JSL   L03A8A7
                TAY
                CLC
                TSC
                ADC   #$0002
                TCS
                TYA
                TSC
                CLC
                ADC   #$0018
                TCS
                PLD
                RTL

                PHD
                TSC
                CLC
                ADC   #$FFF8
                TCS
                TCD
                LDY   #$0002
                LDA   [$10],Y
                TAX
                LDA   [$10]
                CLC
                ADC   #$0028
                BCC   L039C76
                INX
L039C76         STA   $05
                STX   $07
                LDY   #$0002
                LDA   [$05],Y
                TAX
                LDA   [$05]
                STA   $01
                STX   $03
                LDY   #$0002
                LDA   [$01],Y
                TAX
                LDA   [$01]
                CLC
                ADC   #$0010
                BCC   L039C95
                INX
L039C95         STA   $05
                STX   $07
                LDA   $14
                LDX   $16
                STA   [$05]
                TXA
                LDY   #$0002
                STA   [$05],Y
                PEI   $16
                PEI   $14
                PEI   $12
                PEI   $10
                JSL   L03B208
                LDA   $0C
                STA   $16
                LDA   $0B
                STA   $15
                LDA   $09
                TCD
                TSC
                CLC
                ADC   #$0014
                TCS
                RTL

L039CC3         ENT
                PHD
                TSC
                CLC
                ADC   #$FFFC
                TCS
                TCD
                PEI   $0E
                PEI   $0C
                JSL   L03B1E4
                LDA   $0A
                DEC
                BNE   L039CFC
                PHY
                PHY
                LDA   L0612DB
                LDX   L0612DD
                PHX
                PHA
                PHY
                PHY
                PEA   $0000
                PEA   $1FE9
                JSL   L03A8AE
                JSL   L03A1A0
                PLA
                STA   L0612DB
                PLA
                STA   L0612DD
                BRA   L039D18
L039CFC         PHY
                PHY
                LDA   L0612DB
                LDX   L0612DD
                PHX
                PHA
                PEA   $0000
                PEA   $1FE9
                JSL   L03A39B
                PLA
                STA   L0612DB
                PLA
                STA   L0612DD
L039D18         PHY
                PHY
                JSL   L03AA61
                PLA
                STA   $10
                PLX
                STX   $12
                LDA   $08
                STA   $0E
                LDA   $07
                STA   $0D
                LDA   $05
                TCD
                TSC
                CLC
                ADC   #$000C
                TCS
                RTL

L039D36         ENT
                PHD
                TSC
                CLC
                ADC   #$FFF2
                TCS
                TCD
                PHY
                PHY
                PEI   $16
                PEI   $14
                LDA   $1C
                JSL   L03A5FF
                PHX
                PHA
                JSL   L03B1DE
                PLA
                STA   $07
                PLX
                STX   $09
                LDY   #$0002
                LDA   [$07],Y
                TAX
                LDA   [$07]
                STA   $03
                STX   $05
                LDY   #$0010
                LDA   [$03],Y
                AND   #$00FF
                AND   #$00FF
                STA   $01
                LDY   #$0010
                LDA   #$0080
                ORA   $01
                PHA
                PLA
                SEP   #$20
                STA   [$03],Y
                REP   #$20
                LDA   #$0008
                CLC
                ADC   $03
                LDX   $05
                BCC   L039D8A
                INX
L039D8A         CLC
                ADC   #$0002
                BCC   L039D91
                INX
L039D91         STA   $0B
                STX   $0D
                LDA   $18
                CLC
                ADC   [$0B]
                PHA
                LDY   #$0008
                LDA   $1A
                CLC
                ADC   [$03],Y
                PHA
                PEI   $09
                PEI   $07
                JSL   L03AA00
                LDY   #$0010
                LDA   $01
                SEP   #$20
                STA   [$03],Y
                REP   #$20
                LDA   $12
                STA   $1C
                LDA   $11
                STA   $1B
                LDA   $0F
                TCD
                TSC
                CLC
                ADC   #$001A
                TCS
                RTL

                PHD
                TSC
                CLC
                ADC   #$FFF4
                TCS
                TCD
                LDA   L0612BD
                LDX   L0612BF
                PHX
                PHA
                JSL   L03B165
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                PHY
                PHY
                LDA   L0612BD
                LDX   L0612BF
                PHX
                PHA
                LDA   $12
                JSL   L03A5FF
                PHX
                PHA
                JSL   L03B1DE
                PLA
                PLX
                STA   $09
                STX   $0B
                LDY   #$0002
                LDA   [$09],Y
                TAX
                LDA   [$09]
                CLC
                ADC   #$0008
                BCC   L039E11
                INX
L039E11         PHX
                PHA
                PEA   $0008
                JSL   L03B108
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                JSL   L03AA43
                LDA   $10
                STA   $12
                LDA   $0F
                STA   $11
                LDA   $0D
                TCD
                TSC
                CLC
                ADC   #$0010
                TCS
                RTL

L039E39         ENT
                PHD
                TSC
                CLC
                ADC   #$FFF4
                TCS
                TCD
                LDA   L0612BD
                LDX   L0612BF
                PHX
                PHA
                JSL   L03B165
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                PHY
                PHY
                LDA   L0612BD
                LDX   L0612BF
                PHX
                PHA
                LDA   $12
                JSL   L03A5FF
                PHX
                PHA
                JSL   L03B1DE
                PLA
                PLX
                STA   $09
                STX   $0B
                LDY   #$0002
                LDA   [$09],Y
                TAX
                LDA   [$09]
                CLC
                ADC   #$0008
                BCC   L039E81
                INX
L039E81         PHX
                PHA
                PEA   $0008
                JSL   L03B108
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                JSL   L03B171
                LDA   $10
                STA   $12
                LDA   $0F
                STA   $11
                LDA   $0D
                TCD
                TSC
                CLC
                ADC   #$0010
                TCS
                RTL

L039EA9         ENT
                PHD
                TSC
                CLC
                ADC   #$FFF0
                TCS
                TCD
                LDA   L0612BD
                LDX   L0612BF
                PHX
                PHA
                JSL   L03B165
                PHY
                PHY
                LDA   L0612BD
                LDX   L0612BF
                PHX
                PHA
                LDA   $16
                JSL   L03A5FF
                PHX
                PHA
                JSL   L03B1DE
                PLA
                STA   $01
                PLX
                STX   $03
                PEI   $03
                PEI   $01
                JSL   L03ADDF
                TDC
                CLC
                ADC   #$0005
                PEA   $0000
                PHA
                LDY   #$0002
                LDA   [$01],Y
                TAX
                LDA   [$01]
                CLC
                ADC   #$0008
                BCC   L039EF9
                INX
L039EF9         PHX
                PHA
                PEA   $0008
                JSL   L03B108
                TDC
                CLC
                ADC   #$0005
                PEA   $0000
                PHA
                JSL   L03B171
                LDA   $14
                STA   $16
                LDA   $13
                STA   $15
                LDA   $11
                TCD
                TSC
                CLC
                ADC   #$0014
                TCS
                RTL

                PHD
                TSC
                CLC
                ADC   #$FEFA
                TCS
                ADC   #$0015
                TCD
                LDA   $F4
                STA   $FA
                LDA   $F3
                STA   $F9
                LDA   $F1
                TCD
                TSC
                CLC
                ADC   #$010E
                TCS
                RTL

L039F3E         ENT
                PHD
                TSC
                CLC
                ADC   #$FBF8
                TCS
                ADC   #$0317
                TCD
                PHY
                PEI   $F8
                PEI   $F6
                JSL   L03A8A1
                PLA
                SEC
                SBC   $FA
                BVS   L039F5B
                EOR   #$8000
L039F5B         BMI   L039F60
                BRL   L03A0B6
L039F60         PEI   $FA
                PHY
                PEA   $00C9
                JSL   L03B0D9
                PLA
                STA   $ED
                PLA
                SEC
                SBC   $ED
                PHA
                PEA   $0002
                JSL   L03A181
                PLX
                PLX
                SEC
                SBC   #$0005
                STA   $EB
                LDAL  L0514C3
                LDX   #$FEE9
                SEP   #$20
                STA   $00,X
                REP   #$20
                STZ   $E9
L039F90         LDA   $E9
                INC
                STA   $E9
                PEA   $0000
                TDC
                CLC
                ADC   #$FEE9
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$FEE9
                PHA
                PEI   $F8
                PEI   $F6
                PEI   $E9
                PEA   $0001
                PEA   $0000
                TDC
                CLC
                ADC   #$FDE9
                PHA
                JSL   L03A1B9
                PEA   $0000
                TDC
                CLC
                ADC   #$FCE9
                PHA
                PEA   $0002
                JSL   L03A8DC
                PEA   $0100
                JSL   L03B108
                PHY
                PEA   $0000
                TDC
                CLC
                ADC   #$FEE9
                PHA
                JSL   L03A8A1
                PLA
                SEC
                SBC   $EB
                BVS   L039FEB
                EOR   #$8000
L039FEB         BPL   L039F90
                PEA   $0000
                TDC
                CLC
                ADC   #$FEE9
                PHA
                PEI   $E9
                PEA   $0001
                JSL   L03A96C
                LDAL  L0514C4
                LDX   #$FFE9
                SEP   #$20
                STA   $00,X
                REP   #$20
                LDA   #$00FF
                AND   [$F6]
                STA   $E9
L03A013         PEA   $0000
                TDC
                CLC
                ADC   #$FFE9
                PHA
                PEI   $F8
                PEI   $F6
                PEI   $E9
                PEA   $0001
                PEA   $0000
                TDC
                CLC
                ADC   #$FDE9
                PHA
                JSL   L03A1B9
                PEA   $0000
                TDC
                CLC
                ADC   #$FFE9
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$FCE9
                PHA
                PEA   $0002
                JSL   L03A8DC
                PEA   $0100
                JSL   L03B108
                LDA   $E9
                DEC
                STA   $E9
                PHY
                PEA   $0000
                TDC
                CLC
                ADC   #$FFE9
                PHA
                JSL   L03A8A1
                PLA
                SEC
                SBC   $EB
                BVS   L03A06E
                EOR   #$8000
L03A06E         BPL   L03A013
                PEA   $0000
                TDC
                CLC
                ADC   #$FFE9
                PHA
                PEA   $0001
                PEA   $0001
                JSL   L03A96C
                PEI   $F8
                PEI   $F6
                PEA   $0000
                TDC
                CLC
                ADC   #$FEE9
                PHA
                PEA   ^L0514C5
                PEA   L0514C5
                PEA   $0000
                TDC
                CLC
                ADC   #$FFE9
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$FDE9
                PHA
                PEA   $0003
                JSL   L03A8DC
                PEA   $0100
                JSL   L03B108
L03A0B6         LDA   $F4
                STA   $FA
                LDA   $F3
                STA   $F9
                LDA   $F1
                TCD
                TSC
                CLC
                ADC   #$0410
                TCS
                RTL

L03A0C8         ENT
                LDX   #$1302
                JMP   L03A8CD

L03A0CE         ENT
                PHD
                TSC
                CLC
                ADC   #$FFF0
                TCS
                TCD
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                PEI   $18
                PEI   $16
                PEA   $000A
                JSL   L03B108
                PHY
                JSL   L03AD07
                PLA
                STA   $0B
                PEA   $0003
                JSL   L03AC4A
                PHY
                PHY
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                JSL   L03A126
                PLA
                STA   $1A
                PLX
                STX   $1C
                PEI   $0B
                JSL   L03AC4A
                LDA   $14
                STA   $18
                LDA   $13
                STA   $17
                LDA   $11
                TCD
                TSC
                CLC
                ADC   #$0016
                TCS
                RTL

L03A126         PHD
                TSC
                CLC
                ADC   #$FFEE
                TCS
                TCD
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                PEI   $1A
                PEI   $18
                PEA   $000A
                JSL   L03B108
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                TDC
                CLC
                ADC   #$000B
                PEA   $0000
                PHA
                PEA   $0310
                _SANEFP816
                BCS   L03A163
                LDA   #$0000
L03A163         STAL  L0612ED
                LDA   $0B
                LDX   $0D
                STA   $1C
                STX   $1E
                LDA   $16
                STA   $1A
                LDA   $15
                STA   $19
                LDA   $13
                TCD
                TSC
                CLC
                ADC   #$0018
                TCS
                RTL

L03A181         ENT
                PHD
                TSC
                SEC
                SBC   #$00F7
                TCD
                ADC   #$00F0
                TCS
                PEI   $FD
                LDA   $FF
                SEC
                JSL   L03A3D8
                PLY
                TAY
                TSC
                CLC
                ADC   #$0006
                TCS
                TYA
                PLD
                RTL

L03A1A0         ENT
                LDA   $04,S
                AND   $08,S
                STA   $0C,S
                LDA   $06,S
                AND   $0A,S
                STA   $0E,S
                LDA   $02,S
                STA   $0A,S
                LDA   $01,S
                STA   $09,S
                PLA
                PLA
                PLA
                PLA
                RTL

L03A1B9         ENT
                PHD
                TSC
                SEC
                SBC   #$00F3
                TCD
                ADC   #$FEF6
                TCS
                LDX   #$0103
                LDA   $00,X
                TAX
                PHX
                LDX   #$0101
                LDA   $00,X
                PLX
                STX   $EA
                STA   $E8
                LDA   [$E8]
                AND   #$00FF
                STA   $EC
                LDA   $FF
                SEC
                SBC   #$0001
                BVS   L03A1E7
                EOR   #$8000
L03A1E7         BPL   L03A22D
                LDA   $FF
                SEC
                SBC   #$00FF
                BEQ   L03A1F8
                BVS   L03A1F6
                EOR   #$8000
L03A1F6         BMI   L03A22D
L03A1F8         LDA   $FD
                SEC
                SBC   #$0001
                BVS   L03A203
                EOR   #$8000
L03A203         BPL   L03A22D
                LDA   $FD
                SEC
                SBC   #$00FF
                BEQ   L03A214
                BVS   L03A212
                EOR   #$8000
L03A212         BMI   L03A22D
L03A214         LDA   $FD
                CLC
                ADC   $FF
                PHA
                LDA   $EC
                CLC
                ADC   #$0001
                PLX
                STX   $EE
                SEC
                SBC   $EE
                BVS   L03A22B
                EOR   #$8000
L03A22B         BMI   L03A239
L03A22D         LDA   #$0000
                SEP   #$20
                STA   [$F9]
                REP   #$20
                BRL   L03A36D
L03A239         LDA   #$0000
                STA   $EC
                LDX   #$0000
                TDC
                CLC
                ADC   #$FF01
                TXY
                LDX   #$FEFC
                STY   $02,X
                STA   $00,X
                TYX
                LDA   $FF
                LDX   #$0000
                TAY
                BPL   L03A258
                DEX
L03A258         PHX
                PHA
                LDX   $EA
                LDA   $E8
                JSL   L03A390
                PLA
                PLX
                STX   $EA
                STA   $E8
                BRA   L03A2AD
L03A26A         LDX   $EA
                LDA   $E8
                INC   $E8
                BNE   L03A274
                INC   $EA
L03A274         STA   $EE
                STX   $F0
                LDA   [$EE]
                PHA
                LDX   #$FEFE
                LDA   $00,X
                TAX
                PHX
                LDX   #$FEFC
                LDA   $00,X
                PHA
                CLC
                ADC   #$0001
                LDX   #$FEFC
                STA   $00,X
                LDX   #$FEFE
                LDA   $00,X
                BCC   L03A299
                INC
L03A299         LDX   #$FEFE
                STA   $00,X
                PLA
                PLX
                STA   $EE
                STX   $F0
                PLA
                SEP   #$20
                STA   [$EE]
                REP   #$20
                INC   $EC
L03A2AD         LDA   $EC
                CMP   $FD
                BNE   L03A26A
                LDA   $FD
                SEP   #$20
                STA   [$F9]
                REP   #$20
                LDX   $FB
                LDA   $F9
                TXY
                LDX   #$FEF8
                STY   $02,X
                STA   $00,X
                TYX
                LDA   $FD
                CLC
                ADC   #$0001
                STA   $FD
                LDA   #$0001
                STA   $EC
                LDX   #$FEFA
                LDA   $00,X
                TAX
                PHX
                LDX   #$FEF8
                LDA   $00,X
                PLX
                CLC
                ADC   #$0001
                PHA
                TXA
                ADC   #$0000
                TAX
                PLA
                TXY
                LDX   #$FEF8
                STY   $02,X
                STA   $00,X
                TYX
                LDX   #$0000
                TDC
                CLC
                ADC   #$FF01
                TXY
                LDX   #$FEFC
                STY   $02,X
                STA   $00,X
                TYX
                BRA   L03A367
L03A309         LDX   #$FEFE
                LDA   $00,X
                TAX
                PHX
                LDX   #$FEFC
                LDA   $00,X
                PHA
                CLC
                ADC   #$0001
                LDX   #$FEFC
                STA   $00,X
                LDX   #$FEFE
                LDA   $00,X
                BCC   L03A327
                INC
L03A327         LDX   #$FEFE
                STA   $00,X
                PLA
                PLX
                STA   $EE
                STX   $F0
                LDA   [$EE]
                PHA
                LDX   #$FEFA
                LDA   $00,X
                TAX
                PHX
                LDX   #$FEF8
                LDA   $00,X
                PHA
                CLC
                ADC   #$0001
                LDX   #$FEF8
                STA   $00,X
                LDX   #$FEFA
                LDA   $00,X
                BCC   L03A353
                INC
L03A353         LDX   #$FEFA
                STA   $00,X
                PLA
                PLX
                STA   $EE
                STX   $F0
                PLA
                SEP   #$20
                STA   [$EE]
                REP   #$20
                INC   $EC
L03A367         LDA   $EC
                CMP   $FD
                BNE   L03A309
L03A36D         LDX   $FB
                LDA   $F9
                TXY
                LDX   #$0101
                STY   $02,X
                STA   $00,X
                TYX
                TSC
                CLC
                ADC   #$01FC
                TCS
                PLD
                LDA   $02,S
                STA   $0A,S
                LDA   $01,S
                STA   $09,S
                TSC
                CLC
                ADC   #$0008
                TCS
                RTL

L03A390         CLC
                ADC   $04,S
                STA   $04,S
                TXA
                ADC   $06,S
                STA   $06,S
                RTL

L03A39B         ENT
                LDA   $04,S
                ORA   $08,S
                STA   $0C,S
                LDA   $06,S
                ORA   $0A,S
                STA   $0E,S
                LDA   $02,S
                STA   $0A,S
                LDA   $01,S
                STA   $09,S
                PLA
                PLA
                PLA
                PLA
                RTL

L03A3B4         ENT
                PHD
                TSC
                SEC
                SBC   #$00F3
                TCD
                ADC   #$00EC
                TCS
                PEI   $FB
                PEI   $F9
                LDX   $FF
                LDA   $FD
                SEC
                JSL   L03A4BA
                PLY
                PLY
                TAY
                TSC
                CLC
                ADC   #$0006
                TCS
                TYA
                PLD
                RTL

L03A3D8         PHD
                PHA
                PEA   $0001
                TSC
                TCD
                LDA   $0A
                BEQ   L03A44D
                LDX   #$0000
                BCC   L03A403
                BIT   #$8000
                BEQ   L03A3F4
                EOR   #$FFFF
                INC
                STA   $0A
                INX
L03A3F4         LDA   $03
                BIT   #$8000
                BEQ   L03A403
                EOR   #$FFFF
                INC
                STA   $03
                INX
                INX
L03A403         LDY   #$0000
                BRA   L03A40A
L03A408         ASL   $01
L03A40A         ASL   $0A
                BCC   L03A408
                ROR   $0A
L03A410         LDA   $03
                CMP   $0A
                BCC   L03A421
                LDA   $03
                SEC
                SBC   $0A
                STA   $03
                TYA
                ORA   $01
                TAY
L03A421         LSR   $0A
                LSR   $01
                BCC   L03A410
                LDA   $03
                STA   $0A
                TYA
                CPX   #$0000
                BEQ   L03A449
                CPX   #$0003
                BEQ   L03A43F
                EOR   #$FFFF
                INC
                CPX   #$0001
                BEQ   L03A449
L03A43F         TAY
                LDA   $0A
                EOR   #$FFFF
                INC
                STA   $0A
                TYA
L03A449         PLY
                PLY
                PLD
                RTL

L03A44D         PEA   $0004
                PEA   $0000
                PEA   $0000
                _SysFailMgr
L03A45D         ENT
                LDX   #$2503
                JMP   L03A8CD

L03A463         ENT
                LDX   #$2910
                JMP   L03B20E

L03A469         ENT
                LDX   #$130F
                JMP   L03A8CD

L03A46F         ENT
                LDX   #$390F
                JMP   L03A8CD

L03A475         ENT
                LDX   #$0A0F
                JMP   L03A8CD

L03A47B         ENT
                LDX   #$2F10
                JMP   L03A8CD

L03A481         ENT
                LDX   #$2E10
                JMP   L03A8CD

L03A487         ENT
                PHD
                TSC
                TCD
                STZ   $0E
                LDY   #$0000
                TYA
                SEP   #$20
                LDA   [$0A]
                CMP   [$06]
                BNE   L03A4A6
                TAY
                BEQ   L03A4A4
L03A49B         LDA   [$0A],Y
                CMP   [$06],Y
                BNE   L03A4A6
                DEY
                BNE   L03A49B
L03A4A4         INC   $0E
L03A4A6         REP   #$20
                LDA   $03
                STA   $0B
                LDA   $04
                STA   $0C
                LDA   $01
                STA   $09
                PLY
                PLY
                PLY
                PLY
                PLD
                RTL

L03A4BA         PHD
                PHX
                PHA
                PEA   $0000
                PEA   $0001
                PEA   $0000
                PEA   $0000
                TSC
                TCD
                LDA   $12
                ORA   $14
                BNE   L03A4D7
                LDX   #$0000
                BRL   L03A59B
L03A4D7         LDX   #$0000
                BCC   L03A515
                LDA   $14
                BIT   #$8000
                BEQ   L03A4F5
                EOR   #$FFFF
                STA   $14
                LDA   $12
                EOR   #$FFFF
                INC
                BNE   L03A4F2
                INC   $14
L03A4F2         STA   $12
                INX
L03A4F5         LDA   $0B
                BIT   #$8000
                BEQ   L03A515
                EOR   #$FFFF
                STA   $0B
                LDA   $09
                EOR   #$FFFF
                INC
                BNE   L03A50B
                INC   $0B
L03A50B         STA   $09
                INX
                INX
                BRA   L03A515
L03A511         ASL   $05
                ROL   $07
L03A515         ASL   $12
                ROL   $14
                BCC   L03A511
                ROR   $14
                ROR   $12
L03A51F         LDA   $0B
                CMP   $14
                BEQ   L03A529
                BCC   L03A548
                BRA   L03A52F
L03A529         LDA   $09
                CMP   $12
                BCC   L03A548
L03A52F         LDA   $09
                SEC
                SBC   $12
                STA   $09
                LDA   $0B
                SBC   $14
                STA   $0B
                LDA   $01
                ORA   $05
                STA   $01
                LDA   $03
                ORA   $07
                STA   $03
L03A548         LSR   $14
                ROR   $12
                LSR   $07
                ROR   $05
                BCC   L03A51F
                CPX   #$0000
                BEQ   L03A587
                CPX   #$0003
                BEQ   L03A574
                LDA   $01
                EOR   #$FFFF
                STA   $01
                LDA   $03
                EOR   #$FFFF
                INC   $01
                BNE   L03A56D
                INC
L03A56D         STA   $03
                CPX   #$0001
                BEQ   L03A587
L03A574         LDA   $09
                EOR   #$FFFF
                STA   $09
                LDA   $0B
                EOR   #$FFFF
                INC   $09
                BNE   L03A585
                INC
L03A585         STA   $0B
L03A587         LDA   $09
                STA   $12
                LDA   $0B
                STA   $14
                LDA   $01
                LDX   $03
                PLY
                PLY
                PLY
                PLY
                PLY
                PLY
                PLD
                RTL

L03A59B         PEA   $0004
                PEA   $0000
                PEA   $0000
                _SysFailMgr
L03A5AB         ENT
                PHD
                TSC
                TCD
                LDA   #$0001
                STA   $0E
                LDY   #$0000
                TYA
                SEP   #$20
                LDA   [$0A]
                CMP   [$06]
                BNE   L03A5CD
                TAY
                BEQ   L03A5CB
L03A5C2         LDA   [$0A],Y
                CMP   [$06],Y
                BNE   L03A5CD
                DEY
                BNE   L03A5C2
L03A5CB         DEC   $0E
L03A5CD         REP   #$20
                LDA   $03
                STA   $0B
                LDA   $04
                STA   $0C
                LDA   $01
                STA   $09
                PLY
                PLY
                PLY
                PLY
                PLD
                RTL

L03A5E1         ENT
                LDX   #$3803
                JMP   L03A8CD

L03A5E7         ENT
                LDX   #$161C
                JMP   L03A8CD

L03A5ED         ENT
                LDX   #$0B12
                JMP   L03A8CD

L03A5F3         ENT
                LDX   #$1117
                JMP   L03A8CD

L03A5F9         ENT
                LDX   #$0F17
                JMP   L03A8CD

L03A5FF         ENT
                TAX
                BMI   L03A606
                LDX   #$0000
                RTL

L03A606         LDX   #$FFFF
                RTL

L03A60A         LDX   #$1C04
                JMP   L03A8CD

L03A610         XBA
                AND   #$FF00
                BPL   L03A619
                ORA   #$00FF
L03A619         XBA
                RTL

L03A61B         ENT
                LDX   #$1C05
                JMP   L03A8CD

L03A621         ENT
                LDX   #$1F02
                JMP   L03A8CD

L03A627         ENT
                LDX   #$610E
                JMP   L03A8CD

L03A62D         ENT
                LDX   #$2C0F
                JMP   L03A8CD

L03A633         PHB
                PHB
                PLA
                AND   #$00FF
                PEA   >L0612ED
                PLB
                PLB
                RTL

L03A63F         ENT
                LDX   #$1C0F
                JMP   L03A8CD

L03A645         PHD
                TSC
                SEC
                SBC   #$00F5
                TCD
                ADC   #$00DE
                TCS
                PEI   $FF
                PEI   $FD
                PEI   $FB
                JSL   L03ADF7
                PLY
                PLY
                PLY
                TAY
                BEQ   L03A666
                LDA   #$FFFF
                BRL   L03A7E7
L03A666         LDA   #L03AABF
                LDX   #^L03AABF
                PHX
                PHA
                LDAL  L0514E1+2
                TAX
                LDAL  L0514E1
                STA   $F0
                STX   $F2
                PLA
                PLX
                LDY   #$0002
                PHA
                TXA
                STA   [$F0],Y
                PLA
                STA   [$F0]
                LDA   L0612EB
                BNE   L03A6A7
                LDA   L0612F5
                STAL  L0514D1
                LDX   L0612E1
                LDA   L0612DF
                PHA
                TXA
                STAL  L0514D3+2
                PLA
                STAL  L0514D3
                BRL   L03A7E4
L03A6A7         LDA   #$0004
                STA   $E4
                LDA   #$0001
                STA   $E8
                LDX   #$0000
                TDC
                CLC
                ADC   #$00E4
                STX   $EC
                STA   $EA
                PEA   $0000
                TDC
                CLC
                ADC   #$00E8
                PHA
                PEA   $2027
                LDX   #$0000
                JSL   GSOS2
                BCS   L03A6D5
                LDA   #$0000
L03A6D5         STAL  L0612ED
                PHX
                PHA
                LDA   $E6
                CLC
                ADC   #$0005
                LDX   #$0000
                TAY
                BPL   L03A6E8
                DEX
L03A6E8         PHX
                PHA
                LDA   L0612EF
                ORA   #$0F00
                PHA
                PEA   $4000
                PEA   $0000
                PEA   $0000
                _NewHandle
                BCS   L03A706
                LDA   #$0000
L03A706         STAL  L0612ED
                PLA
                PLX
                STA   $F0
                STX   $F2
                LDY   #$0002
                LDA   [$F0],Y
                TAX
                LDA   [$F0]
                STX   $E2
                STA   $E0
                LDA   L0612ED
                BEQ   L03A727
                LDA   #$FFFF
                BRL   L03A7E7
L03A727         LDX   $E2
                LDA   $E0
                STX   $EC
                STA   $EA
                LDA   $E6
                CLC
                ADC   #$0005
                STA   [$EA]
                PEA   $0000
                TDC
                CLC
                ADC   #$00E8
                PHA
                PEA   $2027
                LDX   #$0000
                JSL   GSOS2
                BCS   L03A74F
                LDA   #$0000
L03A74F         STAL  L0612ED
                LDY   #$0002
                LDA   [$E0],Y
                LDX   #$0000
                PHX
                PHA
                LDA   $E0
                CLC
                ADC   #$0004
                LDX   $E2
                BCC   L03A768
                INX
L03A768         JSL   L03A390
                PLA
                PLX
                STA   $F0
                STX   $F2
                LDA   #$0000
                SEP   #$20
                STA   [$F0]
                REP   #$20
                LDA   $FB
                BEQ   L03A793
                LDA   $E0
                CLC
                ADC   #$0004
                TAX
                LDA   $E2
                BCC   L03A78B
                INC
L03A78B         PHA
                PHX
                JSL   L03B446
                PLY
                PLY
L03A793         LDA   $E0
                CLC
                ADC   #$0004
                LDX   $E2
                BCC   L03A79E
                INX
L03A79E         PHX
                PHA
                LDAL  L0514D3+2
                TAX
                LDAL  L0514D3
                STA   $F0
                STX   $F2
                PLA
                PLX
                LDY   #$0002
                PHA
                TXA
                STA   [$F0],Y
                PLA
                STA   [$F0]
                LDA   #$0001
                STA   L0612F5
                LDAL  L0514D3+2
                TAX
                LDAL  L0514D3
                STX   L0612E1
                STA   L0612DF
                PEA   $007F
                PEA   $0000
                _SetInGlobals
                BCS   L03A7E0
                LDA   #$0000
L03A7E0         STAL  L0612ED
L03A7E4         LDA   #$0000
L03A7E7         TAY
                TSC
                CLC
                ADC   #$0016
                TCS
                TYA
                PLD
                RTL

L03A7F1         LDX   #$3C04
                JMP   L03A8CD

L03A7F7         PHD
                TSC
                SEC
                SBC   #$00F9
                TCD
                ADC   #$00EE
                TCS
                LDAL  L0514E1+2
                TAX
                LDAL  L0514E1
                STA   $F4
                STX   $F6
                LDX   $F6
                LDA   #$0024
                CLC
                ADC   $F4
                BCC   L03A81A
                INX
L03A81A         STX   $F2
                STA   $F0
                BRA   L03A851
L03A820         LDY   #$0002
                LDA   [$F0],Y
                TAX
                LDA   [$F0]
                STX   $F4
                ORA   $F4
                BEQ   L03A845
                PEI   $FF
                LDY   #$0002
                LDA   [$F0],Y
                TAX
                LDA   [$F0]
                STA   $F4
                STX   $F6
                LDA   $F4
                LDX   $F6
                JSL   L03B177
                PLY
L03A845         LDA   $F0
                SEC
                SBC   #$0004
                STA   $F0
                BCS   L03A851
                DEC   $F2
L03A851         SEC
                LDA   $F0
                SBCL  L0514E1
                BNE   L03A862
                LDA   $F2
                SBCL  L0514E1+2
                BRA   L03A86A
L03A862         LDA   $F2
                SBCL  L0514E1+2
                REP   #$02
L03A86A         BEQ   L03A873
                BVS   L03A871
                EOR   #$8000
L03A871         BMI   L03A820
L03A873         LDA   $FF
                STA   L0612E9
                LDAL  L0514E1+2
                TAX
                LDAL  L0514E1
                STA   $F4
                STX   $F6
                LDY   #$0002
                LDA   [$F4],Y
                TAX
                LDA   [$F4]
                STA   $F4
                STX   $F6
                LDA   $F4
                LDX   $F6
                JSL   L03B177
                TSC
                CLC
                ADC   #$000A
                TCS
                PLD
                RTL

L03A8A1         ENT
                LDX   #$A904
                JMP   L03A8CD

L03A8A7         LDA   $04,S
                XBA
                PHA
                PLB
                PLB
                RTL

L03A8AE         ENT
                LDA   $04,S
                EOR   #$FFFF
                STA   $08,S
                LDA   $06,S
                EOR   #$FFFF
                STA   $0A,S
                LDA   $02,S
                STA   $06,S
                LDA   $01,S
                STA   $05,S
                PLA
                PLA
                RTL

L03A8C7         LDX   #$260B
                JMP   L03A8CD

L03A8CD         JSL   DISPATCH2
                STAL  L0612ED
                RTL

L03A8D6         ENT
                LDX   #$420F
                JMP   L03A8CD

L03A8DC         ENT
                PHD
                TSC
                SEC
                SBC   #$000A
                TCD
                SEC
                SBC   #$0100
                TCS
                LDX   #$FF01
                STX   $01
                LDA   $10
                STA   $09
L03A8F1         LDA   $10
                BEQ   L03A926
                DEC   $10
                ASL
                ASL
                TAX
                LDA   $12,X
                STA   $03
                LDA   $14,X
                STA   $05
                LDA   [$03]
                AND   #$00FF
                BEQ   L03A8F1
                STA   $07
                LDY   #$0001
                LDX   $01
                SEP   #$20
L03A912         LDA   [$03],Y
                STA   $01,X
                INX
                BEQ   L03A924
                INY
                DEC   $07
                BNE   L03A912
                REP   #$20
                STX   $01
                BRA   L03A8F1
L03A924         STX   $01
L03A926         REP   #$20
                LDA   #$00FF
                CLC
                ADC   $01
                SEP   #$20
                LDX   #$FF00
                STA   $01,X
                REP   #$20
                TAY
                LDX   $01
                SEP   #$20
L03A93C         LDA   $00,X
                STA   [$12],Y
                DEX
                DEY
                BPL   L03A93C
                REP   #$20
                LDA   $09
                ASL
                ASL
                TAX
                LDA   $12
                STA   $12,X
                LDA   $14
                STA   $14,X
                LDA   $0D
                STA   $0F,X
                LDA   $0E
                STA   $10,X
                LDA   $0B
                STA   $0D,X
                STX   $07
                TSC
                CLC
                ADC   #$010C
                CLC
                ADC   $07
                TCS
                PLD
                RTL

L03A96C         ENT
                PHD
                TSC
                SEC
                SBC   #$000E
                TCS
                TCD
                LDA   [$18]
                AND   #$00FF
                STA   $0B
                SEC
                SBC   $16
                INC
                STA   $0D
                BEQ   L03A9E1
                BMI   L03A9E1
                LDA   $16
                BEQ   L03A9E1
                BMI   L03A9E1
                CMP   #$0100
                BCS   L03A9E1
                LDA   $14
                BEQ   L03A9E1
                BMI   L03A9E1
                CMP   #$0100
                BCS   L03A9E1
                LDA   $0D
                SEC
                SBC   $14
                BPL   L03A9A5
                LDA   #$0000
L03A9A5         STA   $09
                LDA   $16
                CLC
                ADC   $09
                DEC
                SEP   #$20
                STA   [$18]
                REP   #$20
                LDA   $09
                BEQ   L03A9E1
                LDA   $18
                LDX   $1A
                CLC
                ADC   $16
                BCC   L03A9C1
                INX
L03A9C1         STA   $05
                STX   $07
                CLC
                ADC   $14
                BCC   L03A9CB
                INX
L03A9CB         STA   $01
                STX   $03
                LDX   $09
                DEX
                LDY   #$0000
                SEP   #$20
L03A9D7         LDA   [$01],Y
                STA   [$05],Y
                INY
                DEX
                BPL   L03A9D7
                REP   #$20
L03A9E1         LDA   $12
                STA   $1A
                LDA   $11
                STA   $19
                LDX   $0F
                TDC
                CLC
                ADC   #$0018
                TCS
                TXA
                TCD
                RTL

L03A9F4         ENT
                LDX   #$1110
                JMP   L03A8CD

L03A9FA         ENT
                LDX   #$0F10
                JMP   L03A8CD

L03AA00         ENT
                LDX   #$1610
                JMP   L03A8CD

L03AA06         ENT
                LDX   #$0E10
                JMP   L03A8CD

L03AA0C         ENT
                LDX   #$220B
                JMP   L03A8CD

L03AA12         LDX   #$3204
                JMP   L03A8CD

L03AA18         ENT
                PHX
                PHA
                LDA   $08,S
                TAX
                LDA   $0A,S
                TAY
                LDA   $06,S
                STA   $0A,S
                LDA   $04,S
                STA   $08,S
                TXA
                SEC
                SBC   $01,S
                BNE   L03AA33
                TYA
                SBC   $03,S
                BRA   L03AA38
L03AA33         TYA
                SBC   $03,S
                REP   #$02
L03AA38         PHP
                LDA   $00,S
                STA   $08,S
                PLY
                PLY
                PLY
                PLY
                PLP
                RTL

L03AA43         LDX   #$3A0E
                JMP   L03A8CD

L03AA49         ENT
                LDX   #$300F
                JMP   L03A8CD

L03AA4F         ENT
                LDX   #$310F
                JMP   L03A8CD

L03AA55         ENT
                LDX   #$1901
                JMP   L03A8CD

L03AA5B         ENT
                LDX   #$120F
                JMP   L03A8CD

L03AA61         ENT
                LDX   #$150E
                JMP   L03A8CD

L03AA67         ENT
                LDX   #$590E
                JMP   L03A8CD

L03AA6D         ENT
                LDX   #$1714
                JMP   L03A8CD

L03AA73         ENT
                SEC
                PHD
                PHA
                TSC
                TCD
                LDX   #$0000
                BCC   L03AA99
                LDA   $08
                BIT   #$8000
                BEQ   L03AA8B
                EOR   #$FFFF
                INC
                STA   $08
                INX
L03AA8B         LDA   $01
                BIT   #$8000
                BEQ   L03AA99
                EOR   #$FFFF
                INC
                STA   $01
                DEX
L03AA99         LDA   #$0000
                BRA   L03AAA7
L03AA9E         LSR   $01
                BCC   L03AAA5
                CLC
                ADC   $08
L03AAA5         ASL   $08
L03AAA7         LDY   $01
                BNE   L03AA9E
                CPX   #$0000
                BEQ   L03AAB4
                EOR   #$FFFF
                INC
L03AAB4         STA   $08
                PLY
                PLD
                RTL

L03AAB9         ENT
                LDX   #$1F0F
                JMP   L03A8CD

L03AABF         PHD
                TSC
                SEC
                SBC   #$00F9
                TCD
                ADC   #$00F2
                TCS
                PEA   $0001
                PEA   ^L0514C7
                PEA   L0514C7
                JSL   L03B35E
                PLY
                PLY
                PLY
                TSC
                CLC
                ADC   #$0006
                TCS
                PLD
                RTL

L03AAE2         ENT
                PHD
                TSC
                SEC
                SBC   #$000E
                TCS
                TCD
                LDA   [$1A]
                AND   #$00FF
                STA   $0B
                INC   $1A
                BNE   L03AAF7
                INC   $1C
L03AAF7         LDA   [$16]
                AND   #$00FF
                STA   $0D
                LDA   $14
                BEQ   L03AB0B
                BMI   L03AB0B
                DEC
                CMP   $0D
                BEQ   L03AB0E
                BCC   L03AB0E
L03AB0B         BRL   L03ABA3
L03AB0E         LDA   $14
                CLC
                ADC   $0B
                CMP   #$0101
                BCC   L03AB2B
                LDA   #$0100
                SEC
                SBC   $14
                STA   $0B
                LDA   #$00FF
L03AB23         SEP   #$20
                STA   [$16]
                REP   #$20
                BRA   L03AB86
L03AB2B         LDA   $0D
                BNE   L03AB33
                LDA   $0B
                BRA   L03AB23
L03AB33         LDA   $0D
                SEC
                SBC   $14
                INC
                STA   $09
                LDA   $0D
                CLC
                ADC   $0B
                CMP   #$0100
                BCC   L03AB55
                SEC
                SBC   #$00FF
                SEC
                SBC   $09
                EOR   #$FFFF
                INC
                STA   $09
                LDA   #$00FF
L03AB55         SEP   #$20
                STA   [$16]
                REP   #$20
                LDA   $09
                BEQ   L03AB86
                LDA   $16
                LDX   $18
                CLC
                ADC   $14
                BCC   L03AB69
                INX
L03AB69         STA   $01
                STX   $03
                CLC
                ADC   $0B
                BCC   L03AB73
                INX
L03AB73         STA   $05
                STX   $07
                SEP   #$20
                LDY   $09
                BRA   L03AB81
L03AB7D         LDA   [$01],Y
                STA   [$05],Y
L03AB81         DEY
                BPL   L03AB7D
                REP   #$20
L03AB86         LDA   $16
                LDX   $18
                CLC
                ADC   $14
                BCC   L03AB90
                INX
L03AB90         STA   $05
                STX   $07
                SEP   #$20
                LDY   $0B
                BRA   L03AB9E
L03AB9A         LDA   [$1A],Y
                STA   [$05],Y
L03AB9E         DEY
                BPL   L03AB9A
                REP   #$20
L03ABA3         LDA   $12
                STA   $1C
                LDA   $11
                STA   $1B
                LDX   $0F
                TDC
                CLC
                ADC   #$001A
                TCS
                TXA
                TCD
                RTL

L03ABB6         ENT
                LDX   #$8E04
                JMP   L03A8CD

L03ABBC         ENT
                LDX   #$0A12
                JMP   L03A8CD

L03ABC2         ENT
                SEC
                PHD
                PHX
                PHA
                PEA   $0000
                PEA   $0000
                TSC
                TCD
                LDX   #$0000
                BCC   L03AC1E
                LDA   $10
                BIT   #$8000
                BEQ   L03ABEC
                EOR   #$FFFF
                STA   $10
                LDA   $0E
                EOR   #$FFFF
                INC
                BNE   L03ABE9
                INC   $10
L03ABE9         STA   $0E
                INX
L03ABEC         LDA   $07
                BIT   #$8000
                BEQ   L03AC1E
                EOR   #$FFFF
                STA   $07
                LDA   $05
                EOR   #$FFFF
                INC
                BNE   L03AC02
                INC   $07
L03AC02         STA   $05
                DEX
                BRA   L03AC1E
L03AC07         LSR   $07
                ROR   $05
                BCC   L03AC1A
                LDA   $01
                CLC
                ADC   $0E
                STA   $01
                LDA   $03
                ADC   $10
                STA   $03
L03AC1A         ASL   $0E
                ROL   $10
L03AC1E         LDA   $05
                ORA   $07
                BNE   L03AC07
                CPX   #$0000
                BEQ   L03AC3C
                LDA   $01
                EOR   #$FFFF
                STA   $01
                LDA   $03
                EOR   #$FFFF
                INC   $01
                BNE   L03AC3A
                INC
L03AC3A         STA   $03
L03AC3C         LDA   $01
                STA   $0E
                LDA   $03
                STA   $10
                PLY
                PLY
                PLY
                PLY
                PLD
                RTL

L03AC4A         PHD
                TSC
                CLC
                ADC   #$FFF6
                TCS
                TCD
                TDC
                CLC
                ADC   #$0005
                PEA   $0000
                PHA
                JSL   L03B3C4
                TAY
                CLC
                TSC
                ADC   #$0004
                TCS
                TYA
                LDA   $05
                BMI   L03AC79
                BEQ   L03AC79
                LDA   $05
                JSL   L03A5FF
                STA   $01
                STX   $03
                BRA   L03AC8D
L03AC79         LDA   $05
                JSL   L03A5FF
                PEA   $0001
                PEA   $0000
                JSL   L03ADB9
                STA   $01
                STX   $03
L03AC8D         PEI   $03
                PEI   $01
                PEA   $0000
                PEA   $4000
                JSL   L03B4DC
                PLY
                PLY
                PLY
                PLY
                PHX
                PHA
                LDA   $10
                PEA   $4000
                JSL   L03AA73
                PLA
                LDX   #$0000
                BIT   #$8000
                BEQ   L03ACB4
                DEX
L03ACB4         JSL   L03ADB9
                STA   $01
                STX   $03
                PEI   $03
                PEI   $01
                LDA   #$8000
                LDX   #$0000
                JSL   L03AA18
                BVS   L03ACCF
                EOR   #$8000
L03ACCF         BMI   L03ACD7
                LDA   $01
                STA   $05
                BRA   L03ACE7
L03ACD7         PEA   $0001
                PEA   $0000
                LDA   $01
                LDX   $03
                JSL   L03B1AC
                STA   $05
L03ACE7         PEI   $05
                JSL   L03B39C
                TAY
                CLC
                TSC
                ADC   #$0002
                TCS
                TYA
                LDA   $0E
                STA   $10
                LDA   $0D
                STA   $0F
                LDA   $0B
                TCD
                TSC
                CLC
                ADC   #$000E
                TCS
                RTL

L03AD07         PHD
                TSC
                CLC
                ADC   #$FFF4
                TCS
                TCD
                TDC
                CLC
                ADC   #$0007
                PEA   $0000
                PHA
                JSL   L03B3C4
                TAY
                CLC
                TSC
                ADC   #$0004
                TCS
                TYA
                LDA   $07
                BMI   L03AD36
                BEQ   L03AD36
                LDA   $07
                JSL   L03A5FF
                STA   $03
                STX   $05
                BRA   L03AD4A
L03AD36         LDA   $07
                JSL   L03A5FF
                PEA   $0001
                PEA   $0000
                JSL   L03ADB9
                STA   $03
                STX   $05
L03AD4A         PEI   $05
                PEI   $03
                PEA   $0000
                PEA   $4000
                JSL   L03A3B4
                PLY
                PLY
                PLY
                PLY
                PHX
                PHA
                PEA   $0000
                PEA   $0004
                JSL   L03B4DC
                PLY
                PLY
                PLY
                PLY
                SEC
                SBC   #$0000
                BMI   L03ADA1
                CMP   #$0004
                BPL   L03ADA1
                SEC
                SBC   #$0000
                BEQ   L03AD88
                DEC
                BEQ   L03AD8C
                DEC
                BEQ   L03AD93
                DEC
                BEQ   L03AD9A
                BRA   L03ADA1
L03AD88         STZ   $01
                BRA   L03ADA1
L03AD8C         LDA   #$0001
                STA   $01
                BRA   L03ADA1
L03AD93         LDA   #$0002
                STA   $01
                BRA   L03ADA1
L03AD9A         LDA   #$0003
                STA   $01
                BRA   L03ADA1
L03ADA1         LDA   $01
                STA   $12
                TSC
                CLC
                ADC   #$000C
                TCS
                PLD
                RTL

L03ADAD         ENT
                LDX   #$2B0E
                JMP   L03A8CD

L03ADB3         ENT
                LDX   #$2C03
                JMP   L03A8CD

L03ADB9         ENT
                CLC
                ADC   $04,S
                TAY
                TXA
                ADC   $06,S
                TAX
                LDA   $01,S
                STA   $05,S
                LDA   $02,S
                STA   $06,S
                PLA
                PLA
                TYA
                RTL

L03ADCD         ENT
                LDX   #$0D0E
                JMP   L03A8CD

L03ADD3         ENT
                LDX   #$2810
                JMP   L03A8CD

L03ADD9         ENT
                LDX   #$1801
                JMP   L03A8CD

L03ADDF         LDX   #$2510
                JMP   L03A8CD

L03ADE5         ENT
                LDX   #$111C
                JMP   L03A8CD

L03ADEB         ENT
                LDX   #$3410
                JMP   L03A8CD

L03ADF1         LDX   #$2C04
                JMP   L03A8CD

L03ADF7         PHD
                TSC
                SEC
                SBC   #$00F5
                TCD
                ADC   #$00E0
                TCS
                STZ   L0612F5
                LDX   $FF
                LDA   $FD
                STX   $F0
                ORA   $F0
                BNE   L03AE1B
                LDA   #$0001
                STA   L0612EB
                LDA   #$0000
                BRL   L03B0CF
L03AE1B         LDX   $FF
                LDA   $FD
                CLC
                ADC   #$0008
                PHA
                TXA
                ADC   #$0000
                TAX
                PLA
                STX   $E6
                STA   $E4
                PEA   $0008
                PEI   $FF
                PEI   $FD
                PEA   ^L05152F
                PEA   L05152F
                JSL   L03B4BC
                PLY
                PLY
                PLY
                PLY
                PLY
                LDA   #$0000
                SEP   #$20
                STAL  L051537
                REP   #$20
                STZ   L0612EB
                PHX
                PHA
                PEA   $0000
                PEA   $0004
                LDA   L0612EF
                ORA   #$0F00
                PHA
                PEA   $0000
                PEA   $0000
                PEA   $0000
                _NewHandle
                BCS   L03AE76
                LDA   #$0000
L03AE76         STAL  L0612ED
                PLA
                PLX
                STX   $EA
                STA   $E8
                LDA   L0612ED
                BEQ   L03AE8B
                LDA   L0612ED
                BRL   L03B0CF
L03AE8B         LDA   [$E4]
                AND   #$00FF
                BNE   L03AE95
                BRL   L03B019
L03AE95         LDX   #$0000
                LDA   #$0002
                PHX
                PHA
                LDA   L0612F5
                CLC
                ADC   #$0002
                LDX   #$0000
                TAY
                BPL   L03AEAB
                DEX
L03AEAB         SEC
                JSL   L03B185
                PEI   $EA
                PEI   $E8
                _SetHandleSize
                BCS   L03AEC0
                LDA   #$0000
L03AEC0         STAL  L0612ED
                LDA   L0612F5
                PHA
                INC
                STA   L0612F5
                PLA
                LDX   #$0000
                TAY
                BPL   L03AED4
                DEX
L03AED4         STX   $F4
                ASL
                ROL   $F4
                ASL
                ROL   $F4
                LDX   $F4
                PHX
                PHA
                LDY   #$0002
                LDA   [$E8],Y
                TAX
                LDA   [$E8]
                JSL   L03A390
                PLA
                PLX
                STA   $F0
                STX   $F2
                LDX   $E6
                LDA   $E4
                LDY   #$0002
                PHA
                TXA
                STA   [$F0],Y
                PLA
                STA   [$F0]
                LDA   [$E4]
                AND   #$00FF
                CMP   #$0022
                BEQ   L03AF0D
                BRL   L03AFAC
L03AF0D         LDA   L0612F5
                SEC
                SBC   #$0001
                LDX   #$0000
                TAY
                BPL   L03AF1B
                DEX
L03AF1B         STX   $F4
                ASL
                ROL   $F4
                ASL
                ROL   $F4
                LDX   $F4
                PHX
                PHA
                LDY   #$0002
                LDA   [$E8],Y
                TAX
                LDA   [$E8]
                JSL   L03A390
                PLA
                PLX
                STA   $F0
                STX   $F2
                LDY   #$0002
                LDA   [$F0],Y
                TAX
                LDA   [$F0]
                CLC
                ADC   #$0001
                STA   [$F0]
                PHA
                LDY   #$0002
                LDA   [$F0],Y
                BCC   L03AF50
                INC
L03AF50         TAX
                LDY   #$0002
                STA   [$F0],Y
                PLA
L03AF57         INC   $E4
                BNE   L03AF5D
                INC   $E6
L03AF5D         LDX   $E6
                LDA   $E4
                STA   $F0
                STX   $F2
                LDA   [$F0]
                AND   #$00FF
                STA   $E2
                TAY
                BEQ   L03AFAA
                LDA   $E2
                CMP   #$0022
                BNE   L03AFA8
                INC   $E4
                BNE   L03AF7C
                INC   $E6
L03AF7C         LDX   $E6
                LDA   $E4
                STA   $F0
                STX   $F2
                LDA   [$F0]
                AND   #$00FF
                CMP   #$0022
                BNE   L03AFA6
                LDY   #$FFFF
L03AF91         INY
                LDA   [$E4],Y
                XBA
                STA   [$E4],Y
                AND   #$00FF
                BNE   L03AF91
                LDA   $E4
                BNE   L03AFA2
                DEC   $E6
L03AFA2         DEC   $E4
                BRA   L03AFA8
L03AFA6         BRA   L03AFAA
L03AFA8         BRA   L03AF57
L03AFAA         BRA   L03AFD3
L03AFAC         LDX   $E6
                LDA   $E4
                INC   $E4
                BNE   L03AFB6
                INC   $E6
L03AFB6         STA   $F0
                STX   $F2
                LDA   [$F0]
                AND   #$00FF
                STA   $E2
                CMP   #$0020
                BEQ   L03AFD3
                LDA   $E2
                BEQ   L03AFD3
                LDA   $E2
                CMP   #$0009
                BEQ   L03AFD3
                BRA   L03AFAC
L03AFD3         LDX   $E6
                LDA   $E4
                SEC
                SBC   #$0001
                PHA
                TXA
                SBC   #$0000
                TAX
                PLA
                STA   $F0
                STX   $F2
                LDA   #$0000
                SEP   #$20
                STA   [$F0]
                REP   #$20
                LDA   $E2
                BNE   L03AFFB
                LDA   $E4
                BNE   L03AFF9
                DEC   $E6
L03AFF9         DEC   $E4
L03AFFB         LDA   [$E4]
                AND   #$00FF
                STA   $E2
                CMP   #$0020
                BEQ   L03B00E
                LDA   $E2
                CMP   #$0009
                BNE   L03B016
L03B00E         INC   $E4
                BNE   L03B014
                INC   $E6
L03B014         BRA   L03AFFB
L03B016         BRL   L03AE8B
L03B019         PEI   $EA
                PEI   $E8
                _HLock
                BCS   L03B029
                LDA   #$0000
L03B029         STAL  L0612ED
                LDY   #$0002
                LDA   [$E8],Y
                TAX
                LDA   [$E8]
                STX   L0612E1
                STA   L0612DF
                LDA   L0612F5
                LDX   #$0000
                TAY
                BPL   L03B045
                DEX
L03B045         STX   $F4
                ASL
                ROL   $F4
                ASL
                ROL   $F4
                LDX   $F4
                PHX
                PHA
                LDX   L0612E1
                LDA   L0612DF
                JSL   L03A390
                PLA
                PLX
                STA   $F0
                STX   $F2
                LDX   #$0000
                LDA   #$0000
                LDY   #$0002
                PHA
                TXA
                STA   [$F0],Y
                PLA
                STA   [$F0]
                LDA   $FB
                BNE   L03B078
                BRL   L03B0CC
L03B078         PEA   ^L05152F
                PEA   L05152F
                JSL   L03B446
                PLY
                PLY
                STZ   $E2
                BRA   L03B0BF
L03B088         LDA   $E2
                LDX   #$0000
                TAY
                BPL   L03B091
                DEX
L03B091         STX   $F4
                ASL
                ROL   $F4
                ASL
                ROL   $F4
                LDX   $F4
                PHX
                PHA
                LDX   L0612E1
                LDA   L0612DF
                JSL   L03A390
                PLA
                PLX
                STA   $F0
                STX   $F2
                LDY   #$0002
                LDA   [$F0],Y
                TAX
                LDA   [$F0]
                PHX
                PHA
                JSL   L03B446
                PLY
                PLY
                INC   $E2
L03B0BF         LDA   $E2
                SEC
                SBC   L0612F5
                BVS   L03B0CA
                EOR   #$8000
L03B0CA         BPL   L03B088
L03B0CC         LDA   #$0000
L03B0CF         TAY
                TSC
                CLC
                ADC   #$0014
                TCS
                TYA
                PLD
                RTL

L03B0D9         LDX   #$A804
                JMP   L03A8CD

L03B0DF         ENT
                LDX   #$1E05
                JMP   L03A8CD

L03B0E5         PHD
                TSC
                TCD
                STA   [$06]
                LDA   $01,S
                LDY   #$0002
                STA   [$06],Y
                LDA   $02,S
                INY
                INY
                STA   [$06],Y
                LDA   $04,S
                INY
                INY
                STA   [$06],Y
                PLD
                LDA   #$0000
                RTL

L03B102         LDX   #$1201
                JMP   L03A8CD

L03B108         ENT
                PHD
                TSC
                TCD
                LDA   $08
                CLC
                ADC   $06
                BEQ   L03B114
                BCS   L03B143
L03B114         LDA   $0C
                CLC
                ADC   $06
                BEQ   L03B11D
                BCS   L03B143
L03B11D         LDX   $08
                LDY   $0C
                LDA   $0D
                STA   $08
                LDA   $09
                STAL  L03B12F+1
                LDA   $06
                DEC
                PHB
L03B12F         MVN   $000000,$000000
                PLB
L03B133         LDA   $04
                STA   $0E
                LDA   $03
                STA   $0D
                PLD
                TSC
                CLC
                ADC   #$000A
                TCS
                RTL

L03B143         LDA   $06
                TAY
                LSR
                TAX
                BCC   L03B15A
                SEP   #$20
                LDA   [$08]
                STA   [$0C]
                REP   #$20
                BRA   L03B15A
L03B154         DEY
                DEY
                LDA   [$08],Y
                STA   [$0C],Y
L03B15A         DEX
                BPL   L03B154
                BRA   L03B133
L03B15F         LDX   #$3A04
                JMP   L03A8CD

L03B165         ENT
                LDX   #$1B04
                JMP   L03A8CD

L03B16B         LDX   #$270B
                JMP   L03A8CD

L03B171         LDX   #$3C0E
                JMP   L03A8CD

L03B177         SEP   #$10
                PHX
                REP   #$10
                DEC
                PHA
                RTL

L03B17F         ENT
                LDX   #$5504
                JMP   L03A8CD

L03B185         PHD
                PHX
                PHA
                TSC
                TCD
                LDX   $0A
                LDA   $0C
                BEQ   L03B193
                LDX   #$0021
L03B193         TXY
                BEQ   L03B1A0
                LDA   $01
L03B198         ASL
                ROL   $03
                DEX
                BNE   L03B198
                STA   $01
L03B1A0         LDA   $01
                STA   $0A
                LDA   $03
                STA   $0C
                PLY
                PLY
                PLD
                RTL

L03B1AC         ENT
                EOR   #$FFFF
                SEC
                ADC   $04,S
                TAY
                TXA
                EOR   #$FFFF
                ADC   $06,S
                TAX
                LDA   $01,S
                STA   $05,S
                LDA   $02,S
                STA   $06,S
                PLA
                PLA
                TYA
                RTL

L03B1C6         ENT
                LDX   #$0E14
                JMP   L03A8CD

L03B1CC         ENT
                LDX   #$1910
                JMP   L03A8CD

L03B1D2         ENT
                LDX   #$1A10
                JMP   L03A8CD

L03B1D8         ENT
                LDX   #$1102
                JMP   L03A8CD

L03B1DE         ENT
                LDX   #$3010
                JMP   L03A8CD

L03B1E4         ENT
                LDX   #$0B0E
                JMP   L03A8CD

L03B1EA         ENT
                LDX   #$0202
                JMP   L03A8CD

L03B1F0         ENT
                LDX   #$131C
                JMP   L03A8CD

L03B1F6         ENT
                LDX   #$0902
                JMP   L03A8CD

L03B1FC         LDX   #$5304
                JMP   L03A8CD

L03B202         ENT
                LDX   #$1D0E
                JMP   L03A8CD

L03B208         ENT
                LDX   #$0C10
                JMP   L03A8CD

L03B20E         JSL   DISPATCH2
                STAL  L0612ED
                LDA   $04,S
                BEQ   L03B21F
                LDA   #$0001
                STA   $04,S
L03B21F         RTL

L03B220         ENT
                LDX   #$430F
                JMP   L03A8CD

L03B226         ENT
                LDX   #$8F04
                JMP   L03A8CD

L03B22C         ENT
                LDX   #$2A0F
                JMP   L03A8CD

L03B232         ENT
                LDX   #$240B
                JMP   L03A8CD

L03B238         ENT
                PHD
                TSC
                CLC
                ADC   #$FFC8
                TCS
                TCD
                TDC
                CLC
                ADC   #$0029
                PEA   $0000
                PHA
                PEI   $40
                PEI   $3E
                PEA   $000A
                JSL   L03B108
                TDC
                CLC
                ADC   #$0033
                PEA   $0000
                PHA
                JSL   L03B46D
                PHY
                PHY
                TDC
                CLC
                ADC   #$0029
                PEA   $0000
                PHA
                JSL   L03A126
                PLA
                STA   $42
                PLX
                STX   $44
                PHY
                PEA   $0010
                JSL   L03B3F0
                PLA
                LSR
                BCS   L03B285
                BRL   L03B32E
L03B285         PEA   $0003
                JSL   L03AC4A
                PHY
                PHY
                PEA   $0000
                TDC
                CLC
                ADC   #$001F
                PHA
                TDC
                CLC
                ADC   #$0029
                PEA   $0000
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$000B
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$0015
                PHA
                TDC
                CLC
                ADC   #$0029
                PEA   $0000
                PHA
                PEA   $000A
                JSL   L03B108
                PEA   $0000
                TDC
                CLC
                ADC   #$0015
                PHA
                PEA   $000F
                _SANEFP816
                PEA   $0000
                TDC
                CLC
                ADC   #$0015
                PHA
                PEA   $000A
                JSL   L03B108
                PEA   $0000
                TDC
                CLC
                ADC   #$0001
                PHA
                PEA   $0000
                TDC
                CLC
                ADC   #$0001
                PHA
                PEA   ^L051538
                PEA   L051538
                PEA   $000A
                JSL   L03B108
                PEA   $0000
                TDC
                CLC
                ADC   #$000B
                PHA
                PEA   $0000
                _SANEFP816
                PEA   $0000
                TDC
                CLC
                ADC   #$000B
                PHA
                JSL   L03B52F
                JSL   L03A126
                PLA
                STA   $42
                PLX
                STX   $44
L03B32E         PEI   $33
                JSL   L03B502
                LDA   $3C
                STA   $40
                LDA   $3B
                STA   $3F
                LDA   $39
                TCD
                TSC
                CLC
                ADC   #$003E
                TCS
                RTL

L03B346         ENT
                LDX   #$0E17
                JMP   L03A8CD

L03B34C         ENT
                LDX   #$0B14
                JMP   L03A8CD

L03B352         ENT
                LDX   #$6B0E
                JMP   L03A8CD

L03B358         ENT
                LDX   #$620E
                JMP   L03A8CD

L03B35E         TSC
                TCD
                LDA   [$04]
                TAX
                LDA   $04,S
                TAY
                LDA   $06,S
                TCD
                LDA   $08,S
                TXS
                PHA
                PHD
                PHY
                TSC
                TCD
                LDY   #$0002
                LDA   [$01],Y
                TAX
                INY
                INY
                LDA   [$01],Y
                STA   $08,S
                INY
                INY
                LDA   [$01],Y
                STA   $0A,S
                PLA
                PLA
                PLA
                PLY
                CMP   #$0000
                BNE   L03B38D
                INC
L03B38D         PHX
                PLD
                RTL

L03B390         ENT
                LDX   #$1010
                JMP   L03A8CD

L03B396         ENT
                LDX   #$CA04
                JMP   L03A8CD

L03B39C         PHD
                TSC
                SEC
                SBC   #$00F9
                TCD
                ADC   #$00F2
                TCS
                PEI   $FF
                PEA   $0001
                _SANEFP816
                BCS   L03B3B8
                LDA   #$0000
L03B3B8         STAL  L0612ED
                TSC
                CLC
                ADC   #$0006
                TCS
                PLD
                RTL

L03B3C4         PHD
                TSC
                SEC
                SBC   #$00F7
                TCD
                ADC   #$00F0
                TCS
                PEA   $0003
                _SANEFP816
                BCS   L03B3DE
                LDA   #$0000
L03B3DE         STAL  L0612ED
                JSL   L03B500
                STA   [$FD]
                TSC
                CLC
                ADC   #$0006
                TCS
                PLD
                RTL

L03B3F0         PHD
                TSC
                CLC
                ADC   #$FFFA
                TCS
                TCD
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                JSL   L03B3C4
                TAY
                CLC
                TSC
                ADC   #$0004
                TCS
                TYA
                PEI   $01
                PEA   $0100
                JSL   L03A181
                PLX
                PLX
                PHA
                PEA   $0020
                JSL   L03B49D
                PLX
                PLX
                STA   $01
                LDA   #$0001
                STA   $0E
                LDA   $0C
                AND   $01
                STA   $01
                LDA   $01
                BNE   L03B435
                STZ   $0E
L03B435         LDA   $0A
                STA   $0C
                LDA   $09
                STA   $0B
                LDA   $07
                TCD
                PLY
                PLY
                PLY
                PLY
                PLY
                RTL

L03B446         TSC
                PHD
                TCD
                LDY   #$0000
                SEP   #$20
                LDA   [$04],Y
                BEQ   L03B465
                XBA
L03B453         INY
                BEQ   L03B45F
                LDA   [$04],Y
                BEQ   L03B45F
                XBA
                STA   [$04],Y
                BRA   L03B453
L03B45F         XBA
                STA   [$04],Y
                TYA
                STA   [$04]
L03B465         REP   #$20
                LDX   $06
                LDA   $04
                PLD
                RTL

L03B46D         PHD
                TSC
                CLC
                ADC   #$FFFC
                TCS
                TCD
                PEI   $0C
                PEI   $0A
                PEA   $0017
                _SANEFP816
                BCS   L03B488
                LDA   #$0000
L03B488         STAL  L0612ED
                LDA   $08
                STA   $0C
                LDA   $07
                STA   $0B
                LDA   $05
                TCD
                PLY
                PLY
                PLY
                PLY
                PLY
                RTL

L03B49D         PHD
                TSC
                SEC
                SBC   #$00F7
                TCD
                ADC   #$00F0
                TCS
                PEI   $FD
                LDA   $FF
                SEC
                JSL   L03A3D8
                PLA
                TAY
                TSC
                CLC
                ADC   #$0006
                TCS
                TYA
                PLD
                RTL

L03B4BC         TSC
                PHD
                TCD
                LDY   $0C
                BEQ   L03B4D6
                BMI   L03B4D6
                SEP   #$20
                BRA   L03B4CD
L03B4C9         LDA   [$08],Y
                STA   [$04],Y
L03B4CD         DEY
                BNE   L03B4C9
                LDA   [$08]
                STA   [$04]
                REP   #$20
L03B4D6         LDA   $04
                LDX   $06
                PLD
                RTL

L03B4DC         PHD
                TSC
                SEC
                SBC   #$00F3
                TCD
                ADC   #$00EC
                TCS
                PEI   $FB
                PEI   $F9
                LDX   $FF
                LDA   $FD
                SEC
                JSL   L03A4BA
                PLA
                PLX
                TAY
                TSC
                CLC
                ADC   #$0006
                TCS
                TYA
                PLD
                RTL

L03B500         TXA
                RTL

L03B502         PHD
                TSC
                CLC
                ADC   #$FFFC
                TCS
                TCD
                PEI   $0A
                PEA   $0019
                _SANEFP816
                BCS   L03B51B
                LDA   #$0000
L03B51B         STAL  L0612ED
                LDA   $08
                STA   $0A
                LDA   $07
                STA   $09
                LDA   $05
                TCD
                PLY
                PLY
                PLY
                PLY
                RTL

L03B52F         PHD
                TSC
                CLC
                ADC   #$FFDE
                TCS
                TCD
                TDC
                CLC
                ADC   #$000B
                PEA   $0000
                PHA
                PEI   $2E
                PEI   $2C
                PEA   $000A
                JSL   L03B108
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                PEI   $2A
                PEI   $28
                PEA   $000A
                JSL   L03B108
                TDC
                CLC
                ADC   #$0015
                PEA   $0000
                PHA
                TDC
                CLC
                ADC   #$0001
                PEA   $0000
                PHA
                PEA   $000A
                JSL   L03B108
                TDC
                CLC
                ADC   #$000B
                PEA   $0000
                PHA
                TDC
                CLC
                ADC   #$0015
                PEA   $0000
                PHA
                PEA   $0011
                _SANEFP816
                BCS   L03B599
                LDA   #$0000
L03B599         STAL  L0612ED
                PEI   $32
                PEI   $30
                TDC
                CLC
                ADC   #$0015
                PEA   $0000
                PHA
                PEA   $000A
                JSL   L03B108
                LDA   $26
                STA   $2E
                LDA   $25
                STA   $2D
                LDA   $23
                TCD
                TSC
                CLC
                ADC   #$002C
                TCS
                RTL



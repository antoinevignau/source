*
* ShellPlay v0.71
*
* (c) 1993, Brian Bening
* (s) 2026, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* TOOLS
*-------------------------------

	use	4/Int.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Sch.Macs
	use	4/Sound.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	
*-------------------------------
* EQUATES
*-------------------------------

KBD         EQU   $C000
KBDSTROBE   EQU   $C010
CYAREG      EQU   $C036
INCBUSYFLG  EQU   $E10064
DECBUSYFLG  EQU   $E10068
GSOS        EQU   $E100A8
GSOSBusy    EQU   $E100BE

*-------------------------------
* EXTERNALS
*-------------------------------

            EXT   L02078E
            EXT   L020D1B

*-------------------------------
* CODE
*-------------------------------

L030000     ENT
            BRL   L030105
            DB    $00
L030004     DB    $00
            DB    $00
L030006     DB    $00
            DB    $00
L030008     DB    $00
            DB    $00
L03000A     DB    $00
            DB    $00
L03000C     ADRL  $00000000
L030010     ADRL  $00000000
L030014     DB    $00
            DB    $00
L030016     DB    $00
            DB    $00
L030018     DW    $0000	; Max songs in memory
L03001A     DB    $00	; Play order
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L030020     DB    $00
            DB    $00
L030022     DB    $00
            DB    $00
L030024     DW    $0000
L030026     DW    $0000
L030028     DB    $00
            DB    $00
L03002A     DW    $0000
L03002C     DB    $00
L03002D     DB    $00
L03002E     DB    $00
            DB    $00
L030030     DB    $00
            DB    $00
L030032     DB    $00
            DB    $00
L030034     DB    $00
L030035     STR   'Song list is empty.'
L030049     DW    $002B
            STR   'Xplayer crime scene, do not disturb.'
L030070     DB    $00
            DB    $00
L030072     DB    $00
            DB    $00
            DB    $00
            DB    $00
L030076     DB    $00
            DB    $00
L030078     DW    $003C	; volume level
L03007A     DW    $0046	; stereo value
L03007C     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L03008A     DB    $00
            DB    $00
L03008C     DB    $00
            DB    $00

L03008E     PHA
            PEA   ^L0300A6
            PEA   L0300A6
            _SchAddTask
            PLA
            JSL   INCBUSYFLG
            JSL   DECBUSYFLG
            RTL

L0300A6     LDAL  GSOSBusy
            BMI   L0300B5
            PEA   $0001
            JSL   L030775
            PLX
            RTL

L0300B5     PHA
            PEA   ^L0300A6
            PEA   L0300A6
            _SchAddTask
            PLA
            LDA   #$0005
            STAL  L0300D0
            RTL

L0300CC     ADRL  $00000000
L0300D0     DW    $0000
            DW    $A55A
            REP   #$30
            JSL   INCBUSYFLG
            JSL   DECBUSYFLG
            SEP   #$30
            RTL

            MX    %00
L0300E1     DA    L03037A	;  1 - StartUp
            DA    L03034A	;  2 - ShutDown
            DA    L030124	;  3 - nada
            DA    L030124	;  4 - nada
            DA    L030525	;  5 - ???? memory stuff
            DA    L030336	;  6 - Stop song and remove from memory
            DA    L0302C6	;  7 - Set Tempo
            DA    L03028C	;  8 - Clear all songs from the playlist
            DA    L030775	;  9 - Skip to the previous (0000) or next (0001) song
            DA    L030285	;  A - Hardware Handshaking (off: 0000, on: FFFF)
            DA    L030125	;  B - Set Volume (0.100)
            DA    L030132	;  C - Set Stereo Value (-200..+200)
            DA    L030150	;  D - ???? Unknown feature -E 0..240
            DA    L03065A	;  E - Play order (0000: sequentially, 0001: randomly)
            DA    L03066D	;  F - Position jumps (0000: don't follow, 0001: follow)
            DA    L030910	; 10 - Print out the playlist
            DA    L030899	; 11 - Print current song name
            DA    L0309D7	; 12 - Goto song number X

L030105     CMP   #$0013
            BCC   L030111
            LDA   #$8101
            SEC
            BRL   L030124
L030111     DEC
            ASL
            TAX
            PHP
            PHP
            PLA
            AND   #$0004
            EOR   #$0004
            STAL  L030028
            JMP   (L0300E1,X)

*-------------------------------
* 03 & 04 / NADA
*-------------------------------

L030124     RTL

*-------------------------------
* 0B / Set Volume
*-------------------------------

L030125     LDA   $04,S
            CMP   #$0065	; +/- 100
            BCS   L03015D
            STAL  L030078	; volume level
            BRA   L03015E

*-------------------------------
* 0C / Set Stereo Value
*-------------------------------

L030132     LDY   #$0000
            LDA   $04,S
            BPL   L030140
            LDY   #$0001
            EOR   #$FFFF
            INC
L030140     CMP   #$00C9	; +/- 200
            BCS   L03015D
            STAL  L03007A	; stereo value
            TYA
            STAL  L030076
            BRA   L03015E

*-------------------------------
* 0D / Unknown feature -E 0..240
*-------------------------------

L030150     LDA   $04,S
            CMP   #$00F1	; q
            BCS   L03015D
            STAL  L031576	; 0..240
            BRA   L03015E
L03015D     RTL

L03015E     PHB
            PHK
            PLB
            SEC
            LDA   #$00FF
            SBC   L031576
            PHA
            PHA
            PHA
            LDA   L030078	; volume level
            PHA
            _Multiply
            LDA   $01,S
            PHA
            PEA   $0064	; /100
            _UDivide
            LDA   $01,S
            CMP   #$0100
            BCC   L03018D	; MOD 256
            LDA   #$00FF
L03018D     STA   $03,S
            PHA
            PHA
            SEC
            LDA   #$0064
            SBC   L03007A	; stereo value
            BPL   L03019E
            EOR   #$FFFF
            INC
L03019E     PHA
            _Multiply
            LDA   $01,S
            PHA
            PEA   $0064
            _UDivide
            PLA
            PLX
            XBA
            ORA   $01,S
            PLX
            PHP
            SEI
            STA   L031BDC
            STA   L031BE2
            STA   L031BDE
            STA   L031BE0
            LDA   #$1010
            LDX   L03007A	; stereo value
            CPX   #$0065
            BCS   L0301D5
            LDA   #$0010
L0301D5     LDX   L030076
            BEQ   L0301DD
            EOR   #$1010
L0301DD     STA   L031CD4
            STA   L031CDA
            EOR   #$1010
            STA   L031CD6
            STA   L031CD8
            SEP   #$30
            LDAL  $E100CA
            STAL  $E1C03C
            LDX   #$A1
            LDY   #$00
L0301FA     TXA
            STAL  $E1C03E
            LDAL  $E1C03D
            LDAL  $E1C03D
            AND   #$0F
            ORA   L031CD4,Y
            STAL  $E1C03D
            INX
            INY
            TXA
            STAL  $E1C03E
            LDAL  $E1C03D
            LDAL  $E1C03D
            AND   #$0F
            ORA   L031CD4,Y
            STAL  $E1C03D
            INX
            INX
            INY
            CPY   #$08
            BNE   L0301FA
            LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
            LDY   #$06
L03023B     LDA   L031DE2,Y
            INC
            ORA   #$40
            STAL  $E1C03E
            REP   #$30
            LDA   L031CC0,Y
            AND   #$00FF
            STA   $2A
            STA   $30
            LDA   L031BDC,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            LDA   $2A
            STA   $2E
            LDA   $30
            STA   $2A
            LDA   L031BDD,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            SEP   #$30
            LDA   $2E
            STAL  $E1C03D
            LDA   $2A
            STAL  $E1C03D
            DEY
            DEY
            BPL   L03023B
            PLP
            PLB
            CLC
            RTL

            MX    %00

*-------------------------------
* 0A / Hardware handshaking
*-------------------------------

L030285     LDA   $04,S	; off: 0000, on: FFFF
            STAL  L03157C	; Hardware handshaking
            RTL

*-------------------------------
* 08 / Clear all songs from the playlist
*-------------------------------

L03028C     PHB
            PHK
            PLB
            JSL   L032401
            STZ   L030018	; no songs in memory
            STZ   L030014
            STZ   L030016
            STZ   L030020
            STZ   L030022
            LDA   #$0000
            PHA
            PHA
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _SetHandleSize
            LDA   L030024
            ORA   #$0100
            PHA
            _DisposeAll
            PLB
            RTL

*-------------------------------
* 07 / Set Tempo
*-------------------------------

L0302C6     PHD
            PHB
            PHK
            PLB
            LDA   L030026
            TCD
            LDA   $07,S
            CMP   #$0003
            BCS   L0302DA
            STA   L03000A
            BRA   L0302E6
L0302DA     SEC
            SBC   #$0003
            CMP   #$0002
            BCS   L03030F
            STA   L030008
L0302E6     LDA   L03000A
            BNE   L0302EE
            LDA   L030006
L0302EE     CMP   #$0001
            BNE   L030312
            PHP
            SEP   #$30
            SEI
            LDA   L03157A
            JSR   L032FDC
            LDA   L031579
            STA   L0315B2
            LDA   #$00
            STA   L0315B0
            LDA   #$01
            STA   L0315AA
            PLP
L03030E     CLC
L03030F     PLB
            PLD
            RTL

            MX    %00
L030312     LDY   #$007D
            LDA   L030008
            BEQ   L03031D
            LDY   #$0096
L03031D     PHP
            SEP   #$30
            SEI
            TYA
            JSR   L032FDC
            LDA   L03157B
            STA   L0315B2
            LDA   #$00
            STA   L0315B0
            STA   L0315AA
            PLP
            MX    %00
            BRA   L03030E

*-------------------------------
* 06 / 
*-------------------------------

L030336     JSL   L032401
            LDAL  L030024
            ORA   #$0100
            PHA
            _DisposeAll
            RTL

*-------------------------------
* 02 / ShutDown
*-------------------------------

L03034A     PHB
            PHK
            PLB
            PEA   ^L0300CC
            PEA   L0300CC
            _DelHeartBeat
            JSL   L0323FC
            _SoundShutDown
            PEA   $0003
            LDA   L03002A
            PHA
            PHA
            PHA
            _MessageCenter
            LDA   L030024
            PLB
            RTL

*-------------------------------
* 01 / StartUp
*-------------------------------

L03037A     PHB
            PHK
            PLB
            JSR   L03049C
            BCS   L03039F
            LDA   L03002E
            STA   $07,S
            LDA   L03002C
            STA   $05,S
            XBA
            AND   #$FF00
            ORA   #$005C
            STA   L030000
            LDA   L03002D
            STA   $0002
            BRL   L03048A
L03039F     PHA
            _SoundToolStatus
            PLA
            BEQ   L0303B2
            PLP
            LDA   #$8103
            SEC
            BRL   L03048A
L0303B2     PHA
            PEA   $1000
            _GetNewID
            PLA
            STA   L030024
            STA   L0310C0
            LDX   #$0000
            PHA
            PHA
            PHX
            PEA   $0200
            PHA
            PEA   $C005
            PHX
            PHX
            _NewHandle
            BCC   L0303E1
            PLX
            PLX
            BRL   L03048C
L0303E1     PHD
            TSC
            TCD
            LDA   [$03]
            STA   L030026
            PLD
            PLX
            PLX
            PHA
            CLC
            ADC   #$0100
            PHA
            _SoundStartUp
            JSL   L0323AE
            PLA
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            LDX   L030024
            PHX
            PHA
            PHA
            PHA
            _NewHandle
            PLA
            STA   L03000C
            PLA
            STA   L03000C+2
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            LDX   L030024
            PHX
            PHA
            PHA
            PHA
            _NewHandle
            PLA
            STA   L030010
            PLA
            STA   L030010+2
            PHA
            PHA
            PEA   ^L030000
            PEA   L030000
            _FindHandle
            PHD
            TSC
            TCD
            LDY   #$0006
            LDA   L030024
            STA   [$03],Y
            PLD
            PLA
            PLA
            LDA   #^L030000
            STA   L030072
            LDA   #L030000
            STA   L030070
            PHA
            PHA
            PEA   $0001
            PEA   ^L030049
            PEA   L030049
            _MessageByName
            PLA
            STA   L03002A
            PLA
            PEA   ^L0300CC
            PEA   L0300CC
            _SetHeartBeat
            JSL   L03015E
            CLC
L03048A     PLB
            RTL

L03048C     PHA
            LDA   L030024
            PHA
            _DeleteID
            PLA
            SEC
            BRA   L03048A
L03049C     STZ   L03002C
            STZ   L03002E
            STZ   L03002A
            PHA
            PHA
            PEA   $0000
            PEA   ^L030049
            PEA   L030049
            _MessageByName
            PLY
            PLA
            BCS   L030524
            STY   L03002A
            PEA   $0002
            PHY
            PHA
            PHA
            LDA   #$0000
            PHA
            PHA
            LDAL  L02078E
            PHA
            PEA   $0000
            PHA
            PHA
            _NewHandle
            LDA   $03,S
            STA   L030032
            LDA   $01,S
            STA   L030030
            _MessageCenter
            LDA   L030032
            PHA
            LDA   L030030
            PHA
            PHD
            TSC
            TCD
            LDY   #$0002
            LDA   [$03],Y
            TAX
            LDA   [$03]
            STA   $03
            STX   $05
            LDY   #$002D
            LDA   [$03],Y
            STA   L03002C
            INY
            INY
            LDA   [$03],Y
            STA   L03002E
            PLD
            PLA
            PLA
            LDA   L030032
            PHA
            LDA   L030030
            PHA
            _DisposeHandle
            CLC
L030524     RTS

*-------------------------------
* 05 / Memory stuff
*-------------------------------

L030525     PHD
            PHB
            PHK
            PLB
            LDA   L030026
            TCD
            LDA   $07,S
            BNE   L030534
            BRL   L0305C8
L030534     CLC
            ADC   L030018
            BCS   L03053F
            CMP   #$0FFF
            BCC   L030545
L03053F     LDA   #$8102
            BRL   L0305C8
L030545     PHA
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            LDA   $11,S
            PHA
            LDA   $11,S
            PHA
            JSR   L0305D9
            BCC   L03055C
            PLX
            BRA   L0305C8
L03055C     LDA   L030010+2
            PHA
            LDA   L030010
            PHA
            LDA   $15,S
            PHA
            LDA   $15,S
            PHA
            JSR   L0305D9
            BCC   L0305AE
            PHA
            PHA
            PHA
            LDA   $13,S
            PHA
            LDA   $13,S
            PHA
            _GetHandleSize
            PHA
            PHA
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _GetHandleSize
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _SetHandleSize
            PLA
            PLX
            BRA   L0305C8
L0305AE     PLA
            STA   L030018
            CMP   #$0001
            BEQ   L0305BA
            LDA   #$0000
L0305BA     STA   L0315C2
            JSR   L030674
            LDA   L030022
            BEQ   L0305CE
            LDA   #$0000
L0305C8     CMP   #$0001
            PLB
            PLD
            RTL

L0305CE     PLB
            PLD
            PEA   $0001
            JSL   L030775
            PLX
            RTL

L0305D9     PHA
            PHA
            LDA   $0D,S
            PHA
            LDA   $0D,S
            PHA
            _GetHandleSize
            PHA
            PHA
            LDA   $0D,S
            PHA
            LDA   $0D,S
            PHA
            _GetHandleSize
            TSC
            INC
            PHD
            TCD
            CLC
            LDA   $00
            ADC   $04
            TAX
            LDA   $02
            ADC   $06
            PHA
            PHX
            PEI   $10
            PEI   $0E
            _SetHandleSize
            BCS   L030649
            LDY   #$0004
            LDA   [$0E],Y
            ORA   #$8000
            STA   [$0E],Y
            PEI   $0C
            PEI   $0A
            LDY   #$0002
            LDA   [$0E]
            CLC
            ADC   $04
            TAX
            LDA   [$0E],Y
            ADC   $06
            PHA
            PHX
            PEI   $02
            PEI   $00
            _HandToPtr
            LDY   #$0004
            LDA   [$0E],Y
            AND   #$7FFF
            STA   [$0E],Y
            LDA   #$0000
L030649     TAY
            LDA   $08
            STA   $10
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            CMP   #$0001
            RTS

*-------------------------------
* 0E / Play order (0000: sequentially, 0001: randomly)
*-------------------------------

L03065A     PHD
            PHB
            PHK
            PLB
            LDA   L030026
            TCD
            LDA   $07,S
            STA   L03001A	; Play order
            JSR   L030674
            PLB
            PLD
            RTL

*-------------------------------
* 0F / Set Position Jumps
*-------------------------------

L03066D     LDA   $04,S
            STAL  L0315A8	; Position jumps
            RTL

*-------------------------------
* 
*-------------------------------

L030674     LDY   L030020
            LDX   L030022
            LDA   L03001A	; Play order
            BEQ   L030682
            BRL   L0306BD
L030682     LDA   L030010
            STA   $04
            LDA   L030010+2
            STA   $06
            LDA   [$04]
            TAX
            LDY   #$0002
            LDA   [$04],Y
            STA   $06
            STX   $04
            LDA   L030018
            BEQ   L0306B6
            DEC
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #$0002
            TAY
            LDX   L030018
L0306AA     TXA
            STA   [$04],Y
            DEX
            TYA
            SEC
            SBC   #$0010
            TAY
            BCS   L0306AA
L0306B6     LDA   L030020
            STA   L030022
            RTS

L0306BD     LDA   L030020
            LDA   L030010
            STA   $04
            LDA   L030010+2
            STA   $06
            LDA   [$04]
            TAX
            LDY   #$0002
            LDA   [$04],Y
            STA   $06
            STX   $04
            JSR   L030766
            LDA   L030018
            BEQ   L03073E
            DEC
            ASL
            ASL
            ASL
            ASL
            TAY
L0306E4     LDA   [$04],Y
            AND   #$7FFF
            STA   [$04],Y
            TYA
            SEC
            SBC   #$0010
            TAY
            BCS   L0306E4
            LDA   L030018
            ASL
            ASL
            ASL
            ASL
L0306FA     PHA
            LDA   #$0002
L0306FE     PHA
L0306FF     PHA
            PHA
            JSR   L030741
            PHA
            LDA   L030018
            PHA
            _UDivide
            PLA
            PLA
            TAX
            ASL
            ASL
            ASL
            ASL
            TAY
            LDA   [$04],Y
            BMI   L0306FF
            ORA   #$8000
            STA   [$04],Y
            TXA
            INC
            PLY
            STA   [$04],Y
            CMP   L030020
            BNE   L030734
            TYA
            LSR
            LSR
            LSR
            LSR
            INC
            STA   L030022
L030734     TYA
            CLC
            ADC   #$0010
            CMP   $01,S
            BCC   L0306FE
            PLA
L03073E     RTS

            DW    $0000

L030741     CLC
            LDX   #$000C
            LDA   L03008A
L030748     ADC   L03007C,X
            STA   L03007C,X
            DEX
            DEX
            BPL   L030748
            LDX   #$000E
L030755     LDA   L03007C,X
            INC
            STA   L03007C,X
            BNE   L030762
            DEX
            DEX
            BPL   L030755
L030762     LDA   L03007C
            RTS

L030766     LDAL  $E1C02E
            LDX   #$000E
L03076D     STA   L03007C,X
            DEX
            DEX
            BPL   L03076D
            RTS

*-------------------------------
* 09 / Skip to the previous or next song
*-------------------------------

L030775     PHD
            PHB
            PHK
            PLB
            LDA   L030026
            TCD
            LDA   L030018
            BNE   L030785
            BRL   L03082E
L030785     CLC
            LDA   L030022
            DEC
            ADC   $07,S
            BMI   L03079B
            CMP   L030018
L030791     BCC   L0307A1
            SBC   L030018
            CMP   L030018
            BRA   L030791
L03079B     CLC
            ADC   L030018
            BMI   L03079B
L0307A1     INC
            STA   L030022
            PHA
            JSL   L032401
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _HLock
            LDA   L030010+2
            PHA
L0307BD     LDA   L030010
            PHA
L0307C1     _HLock
L0307C8     LDA   L030024
            ORA   #$0100
            PHA
            _DisposeAll
            LDA   L030022
            PHA
            JSR   L030832
            PLA
            STA   L030020
            PEI   $02
            PEI   $00
            JSL   L0309F2
            PLX
            PLX
            BCC   L03080F
            LDY   L030022
            DEY
            LDA   $09,S
            BPL   L0307FD
            DEY
            BPL   L030806
            LDY   L030018
            BRA   L030807
L0307FD     INY
            CPY   L030018
            BCC   L030806
            LDY   #$0000
L030806     INY
L030807     TYA
            STA   L030022
            CMP   $01,S
            BNE   L0307C8
L03080F     PLA
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _HUnlock
            LDA   L030010+2
            PHA
            LDA   L030010
            PHA
            _HUnlock
L03082E     CLC
            PLB
            PLD
            RTL

L030832     LDA   L030010
            STA   $04
            LDA   L030010+2
            STA   $06
            LDA   [$04]
            TAX
            LDY   #$0002
            LDA   [$04],Y
            STA   $06
            STX   $04
            LDA   L03000C
            STA   $00
            LDA   L03000C+2
            STA   $02
            LDA   [$00]
            TAX
            LDY   #$0002
            LDA   [$00],Y
            STA   $02
            STX   $00
            LDA   $03,S
            DEC
            ASL
            ASL
            ASL
            ASL
            ADC   #$0002
            TAY
            LDA   [$04],Y
            STA   $03,S
            TAX
            BRA   L030887
L030870     LDA   [$00]
            CLC
            ADC   $00
            STA   $00
            BCC   L03087B
            INC   $02
L03087B     CLC
            LDA   $00
            ADC   #$0002
            STA   $00
            BCC   L030887
            INC   $02
L030887     DEX
            BNE   L030870
            RTS

L03088B     PEA   ^L030034
            PEA   L030034
            _WriteLine
            RTS

*-------------------------------
* 11 / Print current song name
*-------------------------------

L030899     PHD
            PHB
            PHK
            PLB
            LDA   L030026
            TCD
            LDA   L030018
            BEQ   L03090A
            LDA   L030022
            BEQ   L03090A
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _HLock
            LDA   L030010+2
            PHA
            LDA   L030010
            PHA
            _HLock
            LDA   L030022
            PHA
            JSR   L030832
            PLA
            LDA   $00
            CLC
            ADC   #$0002
            TAX
            LDA   $02
            ADC   #$0000
            PHA
            PHX
            PEA   $0000
            LDA   [$00]
            PHA
            _TextWriteBlock
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _HUnlock
            LDA   L030010+2
            PHA
            LDA   L030010
            PHA
            _HUnlock
L03090A     JSR   L03088B
            PLB
            PLD
            RTL

*-------------------------------
* 10 / Print out the playlist
*-------------------------------

L030910     PHD
            PHB
            PHK
            PLB
            LDA   L030026
            TCD
            LDA   L030018
            BNE   L03092D
L03091D     PEA   ^L030035
            PEA   L030035
            _WriteLine
            BRL   L0309D4
L03092D     LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _HLock
            LDA   L030010+2
            PHA
            LDA   L030010
            PHA
            _HLock
            LDA   #$0001
            STA   L03008C
L030951     LDX   #$003E
            LDA   L03008C
            CMP   L030022
            BEQ   L03095F
            LDX   #$0020
L03095F     PHX
            _WriteChar
            LDA   L03008C
            PHA
            PEA   $0004
            PEA   $0000
            PEA   $0000
            JSL   L020D1B
            PEA   $0020
            _WriteChar
            LDA   L03008C
            PHA
            JSR   L030832
            PLA
            LDA   $00
            CLC
            ADC   #$0002
            TAY
            LDA   $02
            ADC   #$0000
            PHA
            PHY
            PEA   $0000
            LDA   [$00]
            PHA
            _TextWriteBlock
            JSR   L03088B
            LDA   L03008C
            INC
            STA   L03008C
            CMP   L030018
            BCC   L030951
            BEQ   L030951
            LDA   L03000C+2
            PHA
            LDA   L03000C
            PHA
            _HUnlock
            LDA   L030010+2
            PHA
            LDA   L030010
            PHA
            _HUnlock
L0309D4     PLB
            PLD
            RTL

*-------------------------------
* 12 / Goto song number X
*-------------------------------

L0309D7     LDA   $04,S	; song 0?
            BEQ   L0309F0
            CMPL  L030018	; max index?
            BCC   L0309E3
            BNE   L0309F0
L0309E3     STAL  L030022	; make it current song
            PEA   $0000
            JSL   L030775	; play it
            PLA
            RTL
L0309F0     SEC
            RTL

*-------------------------------
* 
*-------------------------------

L0309F2     PHB
            PHK
            PLB
            LDA   $05,S
            STA   L0310D0
            LDA   $07,S
            STA   L0310D0+2
            JSL   GSOS
            DW    $2010        ; Open
            ADRL  L0310CC
            BCS   L030A6D
            JSR   L030AC7
            BCS   L030A6F
            JSR   L030B09
            SEC
            LDA   L0310DE
            SBC   L0310A8
            STA   L0310BC
            LDA   L0310DE+2
            SBC   L0310AA
            STA   L0310BE
            BPL   L030A3D
            EOR   #$FFFF
            STA   L0310BE
            LDA   L0310BC
            EOR   #$FFFF
            INC
            STA   L0310BC
            BNE   L030A3D
            INC   L0310BE
L030A3D     LDA   L0310BE
            BNE   L030A4A
            LDA   L0310BC
            CMP   #$0800
            BCC   L030A50
L030A4A     SEC
            LDA   #$8000
            BRA   L030A6F
L030A50     JSL   L030BEC
            BCS   L030A6F
            LDA   L0310CE
            STA   L0310D8
            JSL   GSOS
            DW    $2014        ; Close
            ADRL  L0310D6
            JSR   L030A84
            JSR   L030F7A
            CLC
L030A6D     PLB
            RTL

L030A6F     PHA
            LDA   L0310CE
            STA   L0310D8
            JSL   GSOS
            DW    $2014        ; Close
            ADRL  L0310D6
            PLA
            SEC
            BRA   L030A6D
L030A84     LDA   L0315C8
            AND   #$003F
            ASL
            TAY
            LDA   L031708,Y
            STA   $94
            LDA   L031788,Y
            STA   $96
            LDY   #$000E
            LDX   #$0000
L030A9C     LDA   [$94],Y
            PHA
            AND   #$000F
            CMP   #$000F
            BNE   L030AB3
            LDA   $01,S
            AND   #$FF00
            CMP   #$2000
            BCC   L030AB2
            INX
L030AB2     INX
L030AB3     PLA
            DEY
            DEY
            DEY
            DEY
            BPL   L030A9C
            LDY   #$0002
            CPX   #$0002
            BCC   L030AC3
            DEY
L030AC3     STY   L030006
            RTS

L030AC7     LDA   L0310CE
            STA   L0310E4
            STA   L0310DC
            LDA   #L0310F2
            STA   L0310E6
            LDA   #^L0310F2
            STA   L0310E6+2
            LDA   #$043C
            STA   L0310EA
            STZ   L0310EA+2
            JSL   GSOS
            DW    $2012        ; Read
            ADRL  L0310E2
            BCS   L030B03
            LDA   L0310EE
            CMP   #$043C
            BNE   L030B04
            JSL   GSOS
            DW    $2019        ; GetEOF
            ADRL  L0310DA
L030B03     RTS

            MX    %00
L030B04     SEC
            LDA   #$8000
            RTS

L030B09     STZ   L0310A4
            LDA   #$043C
            STA   L0310A6
            LDA   L03152A
            CMP   #$2E4D
            BNE   L030B22
            LDA   L03152C
            CMP   #$2E4B
            BEQ   L030B76
L030B22     LDA   L03152A
            CMP   #$4C46
            BNE   L030B3A
            LDA   L03152C
            CMP   #$3454
            BNE   L030B3A
            LDA   #$FFFF
            STA   L0310A4
            BRA   L030B76
L030B3A     LDA   #$0258
            STA   L0310A6
            LDX   #$0080
L030B43     LDA   L0312C8,X
            STA   L0314A8,X
            DEX
            DEX
            BPL   L030B43
            LDX   #$01DE
L030B50     STZ   L0312C8,X
            DEX
            DEX
            BPL   L030B50
            LDA   L0310CE
            STA   L0310C4
            STZ   L0310C8+2
            LDA   #$01E4
            STA   L0310C8
            LDA   #$0003
            STA   L0310C6
            JSL   GSOS
            DW    $2016        ; SetMark
            ADRL  L0310C2
L030B76     STZ   L0310AA
            STZ   L0310A8
            STZ   L0310AC
            LDY   #$0384
L030B82     LDA   L03111C,Y
            BEQ   L030B97
            INC   L0310AC
            XBA
            CLC
            ADC   L0310A8
            STA   L0310A8
            BCC   L030B97
            INC   L0310AA
L030B97     TYA
            SEC
            SBC   #$001E
            TAY
            BPL   L030B82
            ASL   L0310A8
            ROL   L0310AA
            LDA   L0310A6
            CLC
            ADC   L0310A8
            STA   L0310A8
            BCC   L030BB4
            INC   L0310AA
L030BB4     SEP   #$20
            LDA   #$00
            LDY   #$007F
L030BBB     CMP   L0314AA,Y
            BCS   L030BC3
            LDA   L0314AA,Y
L030BC3     DEY
            BPL   L030BBB
            REP   #$20
            AND   #$00FF
            INC
            STA   L0310AE
            XBA
            STZ   L0310B0
            ASL
            ROL   L0310B0
            ASL
            ROL   L0310B0
            CLC
            ADC   L0310A8
            STA   L0310A8
            LDA   L0310AA
            ADC   L0310B0
            STA   L0310AA
            RTS

L030BEC     LDA   #$0004
            STAL  L0315C6
            LDA   L0314A8
            AND   #$00FF
            STAL  L0315C4
            TAX
            SEP   #$20
L030C00     DEX
            BMI   L030C0C
            LDA   L0314AA,X
            STAL  L0315C8,X
            BRA   L030C00
L030C0C     REP   #$20
            LDA   #$4040
            LDX   #$003E
L030C14     STAL  L0316C8,X
            DEX
            DEX
            BPL   L030C14
            LDA   #$0000
            LDX   #$0000
L030C22     STAL  L031648,X
            CLC
            ADC   #$0010
            INX
            INX
            CPX   #$0080
            BCC   L030C22
            STZ   L0310EA+2
            LDA   L0310AE
            XBA
            ASL
            ROL   L0310EA+2
            ASL
            ROL   L0310EA+2
            STA   L0310EA
            PHA
            PHA
            LDA   L0310EA+2
            PHA
            LDA   L0310EA
            PHA
            LDA   L0310C0
            ORA   #$0100
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCC   L030C6B
            PLX
            PLX
            BRL   L030D9C
L030C6B     TSC
            PHD
            INC
            TCD
            LDA   [$00]
            STAL  L031708
            STA   L0310E6
            LDY   #$0002
            LDA   [$00],Y
            STAL  L031788
            STA   L0310E6+2
            PLD
            PLA
            PLA
            LDX   #$0002
L030C8A     LDAL  L031706,X
            CLC
            ADC   #$0400
            STAL  L031708,X
            LDAL  L031786,X
            BCC   L030C9D
            INC
L030C9D     STAL  L031788,X
            INX
            INX
            CPX   #$0080
            BCC   L030C8A
            JSL   GSOS
            DW    $2012        ; Read
            ADRL  L0310E2
            MX    %00
            JSR   L030EF6
            LDX   #$003E
            LDA   #$F000
L030CBB     STAL  L031848,X
            STAL  L031948,X
            STAL  L031908,X
            DEX
            DEX
            BPL   L030CBB
            LDA   L0310CE
            STA   L0310C4
            LDY   #$0000
            LDX   #$0002
L030CD7     SEP   #$20
            LDA   L03111F,Y
            STAL  L031A08,X
            LDA   L03111E,Y
            STAL  L031A48,X
            REP   #$20
            LDA   L03111C,Y
            BNE   L030CF1
            BRL   L030D8A
L030CF1     LDA   L031120,Y
            BNE   L030D04
            LDA   L031122,Y
            BEQ   L030D01
            XBA
            CMP   #$0001
            BNE   L030D04
L030D01     BRL   L030D6E
L030D04     LDA   L031120,Y
            XBA
            ASL
            STA   L0310B4
            LDA   #$0000
            ROL
            STA   L0310B6
            LDA   L031122,Y
            XBA
            ASL
            STA   L0310B8
            STAL  L031908,X
            LDA   #$0000
            ROL
            STA   L0310BA
            STAL  L031948,X
            CLC
            LDA   L0310B4
            ADC   L0310B8
            STA   L0310EA
            STAL  L031808,X
            LDA   L0310B6
            ADC   L0310BA
            STA   L0310EA+2
            STAL  L031848,X
            LDA   L03111C,Y
            XBA
            ASL
            STA   L0310C8
            LDA   #$0000
            ROL
            STA   L0310C8+2
            SEC
            LDA   L0310C8
            SBC   L0310EA
            STA   L0310C8
            LDA   L0310C8+2
            SBC   L0310EA+2
            STA   L0310C8+2
            JSR   L030DAE
            BCS   L030D9C
            BRA   L030D8A
L030D6E     LDA   L03111C,Y
            XBA
            ASL
            STA   L0310EA
            STAL  L031808,X
L030D7A     LDA   #$0000
            ROL
            STA   L0310EA+2
            STAL  L031848,X
            JSR   L030DAE
            BCS   L030D9C
L030D8A     TYA
            CLC
            ADC   #$001E
            TAY
            INX
            INX
            CPX   #$0040
            BCS   L030D9A
            BRL   L030CD7
L030D9A     CLC
            RTL

L030D9C     PHA
            LDA   L0310C0
            ORA   #$0100
            PHA
            _DisposeAll
            PLA
            SEC
            RTL

L030DAE     PHY
            PHX
            LDAL  L031948,X
            BMI   L030DBB
            LDA   #$0100
            BRA   L030DBE
L030DBB     LDA   #$0010
L030DBE     CLC
L030DBF     ADC   L0310EA
            TAY
            LDA   L0310EA+2
            BCC   L030DC9
            INC
L030DC9     PHA
            PHA
            PHA
            PHY
            LDA   L0310C0
            ORA   #$0100
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCC   L030DEC
            PLX
            PLX
            PLX
            PLY
            SEC
            RTS

L030DEC     LDA   $05,S
            TAX
            TSC
            PHD
            TCD
            LDA   [$01]
            STAL  L031888,X
            STA   L0310E6
            LDY   #$0002
            LDA   [$01],Y
L030E00     STAL  L0318C8,X
            STA   L0310E6+2
            PLD
            PLA
            PLA
            JSL   GSOS
            DW    $2012        ; Read
            ADRL  L0310E2
            MX    %00
            LDA   L0310E6
            STA   $8C
            LDA   L0310E6+2
            STA   $8E
            LDA   L0310EA+2
            LSR
            LDA   L0310EA
            ROR
            TAX
            LDY   #$0000
            SEP   #$20
L030E2C     LDA   [$8C],Y
            EOR   #$80
            BNE   L030E33
            INC
L030E33     STA   [$8C],Y
            INY
            LDA   [$8C],Y
            EOR   #$80
            BNE   L030E3D
            INC
L030E3D     STA   [$8C],Y
            INY
            BNE   L030E44
            INC   $8E
L030E44     DEX
            BNE   L030E2C
            REP   #$20
            LDA   $01,S
            TAX
            LDAL  L031888,X
            CLC
            ADC   L0310EA
            STA   $90
            LDAL  L0318C8,X
            ADC   L0310EA+2
            STA   $92
            LDAL  L031948,X
            BMI   L030ECB
            LDA   #$0002
            STA   L0310C6
            JSL   GSOS
            DW    $2016        ; SetMark
            ADRL  L0310C2
            MX    %00
L030E75     LDA   $01,S
            TAX
            LDAL  L031888,X
            CLC
            ADC   L0310B4
            STAL  L031988,X
            STA   $8C
            LDAL  L0318C8,X
            ADC   L0310B6
            STAL  L0319C8,X
            STA   $8E
            LDA   L0310BA
            LSR
            LDA   L0310B8
            ROR
            TAX
            PHA
            LDY   #$0000
L030EA0     LDA   [$8C],Y
            STA   [$90],Y
            INY
            INY
            CPY   #$0100
            BEQ   L030EC6
            DEX
            BNE   L030EA0
            LDA   $01,S
            ASL
            PHA
            LDA   $8C
            SEC
            SBC   $01,S
            STA   $8C
            LDA   $8E
            BCS   L030EBE
            DEC
L030EBE     STA   $8E
            PLA
            LDA   $01,S
            TAX
            BRA   L030EA0
L030EC6     PLA
L030EC7     PLX
            PLY
            CLC
            RTS

L030ECB     LDA   $01,S
            TAX
            CLC
            LDAL  L031808,X
            ADC   #$0010
            STAL  L031808,X
            LDAL  L031848,X
            ADC   #$0000
            STAL  L031848,X
            LDA   #$0000
            LDY   #$0000
L030EEB     STA   [$90],Y
            INY
            INY
            CPY   #$0010
            BCC   L030EEB
            BRA   L030EC7
L030EF6     LDA   L0310E6
            STA   $94
            LDA   L0310E6+2
            STA   $96
            LDY   #$0002
            LDA   L0310AE
L030F06     PHA
            LDA   #$0100
L030F0A     PHA
            LDA   [$94],Y
            STA   $9A
            LDA   [$94]
            STA   $98
            XBA
            AND   #$0FFF
            BEQ   L030F33
            LDX   #$0000
L030F1C     CMP   L03152E,X
            BCS   L030F2D
            INX
            INX
            CPX   #$0048
            BCC   L030F1C
            LDA   #$0000
            BRA   L030F33
L030F2D     TXA
            LSR
            CLC
            ADC   #$0018
L030F33     SEP   #$20
            STA   $99
            LDA   $98
            AND   #$F0
            STA   $98
            LDA   $9A
            LSR
            LSR
            LSR
            LSR
            ORA   $98
            STA   $98
            LDA   $9A
            AND   #$0F
            BIT   L0310A4
            BPL   L030F58
            CMP   #$0E
            BNE   L030F58
            LDA   #$00
            STA   $9B
L030F58     STA   $9A
            REP   #$20
            LDA   $98
            XBA
            STA   [$94]
            LDA   $9A
            STA   [$94],Y
            LDA   #$0004
            CLC
            ADC   $94
            STA   $94
            BCC   L030F71
            INC   $96
L030F71     PLA
            DEC
            BNE   L030F0A
            PLA
            DEC
            BNE   L030F06
            RTS

L030F7A     STZ   L0315A6
            LDA   #$0005
            STAL  L0315B0
            LDA   #$0006
            STAL  L0315B2
            SEP   #$30
            STA   L031579
            STA   L03157B
            LDA   #$7D
            STA   L03157A
            REP   #$30
            LDA   #$0004
            STAL  L0315C6
            LDA   #$0001
            STAL  L0315B6
            LDX   #$0012
L030FAB     LDA   #$0000
            STA   L031B50,X
            STA   L031BF8,X
            STA   L031C20,X
            STA   L031C34,X
            STA   L031C48,X
            STA   L031C5C,X
            STA   L031C70,X
            STA   L031CAC,X
            STA   L031B8C,X
            STA   L031BA0,X
            LDA   #$0080
            STA   L031B3C,X
            LDA   #$0001
            STA   L031C98,X
            STA   L031B64,X
            STA   L031D9C,X
            DEX
            DEX
            BPL   L030FAB
            LDA   #$0000
            STA   L0315BC
            STA   L0315B8
            STA   L0315B4
            LDA   L030004
            BEQ   L030FF6
            BRL   L031077
L030FF6     STZ   L0315AA
            LDY   #$007D
            LDA   L03000A
            BNE   L031004
            LDA   L030006
L031004     CMP   #$0001
            BNE   L03100E
            STA   L0315AA
            BRA   L031016
L03100E     LDA   L030008
            BEQ   L031016
            LDY   #$0096
L031016     PHY
            PHP
            SEI
            SEP   #$30
            LDA   $02,S
            JSR   L032FDC
            LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
            LDX   #$0C
            TXA
            ORA   #$40
            STAL  $E1C03E
            LDA   #$00
            STAL  $E1C03D
            STAL  $E1C03D
            TXA
            ORA   #$80
            STAL  $E1C03E
            LDA   #$FF
            STAL  $E1C03D
            STAL  $E1C03D
            TXA
            ORA   #$C0
            STAL  $E1C03E
            LDA   #$02
            STAL  $E1C03D
            LDA   #$01
            STAL  $E1C03D
            TXA
            ORA   #$A0
            STAL  $E1C03E
            LDA   #$01
            STAL  $E1C03D
            LDA   #$08
            STAL  $E1C03D
            PLP
            PLA
            RTS

            MX    %00
L031077     PHB
            PHD
            PHK
            PLB
            LDA   L030026
            TCD
L03107F     JSR   L031092
            CMP   #$001B
            BEQ   L03108F
            SEI
            JSL   L0325DB
            CLI
            BRA   L03107F
L03108F     PLD
            PLB
            RTS

L031092     SEP   #$20
L031094     LDAL  KBD
            BPL   L031094
            STAL  KBDSTROBE
            REP   #$20
            AND   #$007F
            RTS

L0310A4     DB    $00
            DB    $00
L0310A6     DB    $00
            DB    $00
L0310A8     DB    $00
            DB    $00
L0310AA     DB    $00
            DB    $00
L0310AC     DB    $00
            DB    $00
L0310AE     DB    $00
            DB    $00
L0310B0     DB    $00
            DB    $00
            DB    $00
            DB    $00
L0310B4     DB    $00
            DB    $00
L0310B6     DB    $00
            DB    $00
L0310B8     DB    $00
            DB    $00
L0310BA     DB    $00
            DB    $00
L0310BC     DB    $00
            DB    $00
L0310BE     DB    $00
            DB    $00
L0310C0     DB    $00
            DB    $00
L0310C2     DW    $0003        ; Parms for SetMark
L0310C4     DW    $0000        ;  ref num
L0310C6     DW    $0000        ;  base
L0310C8     ADRL  $00000000    ;  displacement
L0310CC     DW    $0003        ; Parms for Open
L0310CE     DW    $0000        ;  ref num
L0310D0     ADRL  $00000000    ;  path name
            DW    $0001        ;  req access
L0310D6     DW    $0001        ; Parms for Close
L0310D8     DW    $0000        ;  ref num
L0310DA     DW    $0002        ; Parms for GetEOF
L0310DC     DW    $0000        ;  ref num
L0310DE     ADRL  $00000000    ;  end of file
L0310E2     DW    $0004        ; Parms for Read
L0310E4     DW    $0000        ;  ref num
L0310E6     ADRL  $00000000    ;  buffer ptr
L0310EA     ADRL  $00000000    ;  request count
L0310EE     ADRL  $00000000    ;  transfer count
L0310F2     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L03111C     DB    $00
            DB    $00
L03111E     DB    $00
L03111F     DB    $00
L031120     DB    $00
            DB    $00
L031122     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0312C8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0314A8     DB    $00
            DB    $00
L0314AA     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L03152A     DB    $00
            DB    $00
L03152C     DB    $00
            DB    $00
L03152E     DB    $58
            DB    $03
            DB    $28
            DB    $03
            DB    $FA
            DB    $02
            DB    $D0
            DB    $02
            DB    $A6
            DB    $02
            DB    $80
            DB    $02
            DB    $5C
            DB    $02
            DB    $3A
            DB    $02
            DB    $1A
            DB    $02
            DB    $FC
            DB    $01
            DB    $E0
            DB    $01
            DB    $C5
            DB    $01
            DB    $AC
            DB    $01
            DB    $94
            DB    $01
            DB    $7D
            DB    $01
            DB    $68
            DB    $01
            DB    $53
            DB    $01
            DB    $40
            DB    $01
            DB    $2E
            DB    $01
            DB    $1D
            DB    $01
            DB    $0D
            DB    $01
            DB    $FE
            DB    $00
            DB    $F0
            DB    $00
            DB    $E2
            DB    $00
            DB    $D6
            DB    $00
            DB    $CA
            DB    $00
            DB    $BE
            DB    $00
            DB    $B4
            DB    $00
            DB    $AA
            DB    $00
            DB    $A0
            DB    $00
            DB    $97
            DB    $00
            DB    $8F
            DB    $00
            DB    $87
            DB    $00
            DB    $7F
            DB    $00
            DB    $78
            DB    $00
            DB    $71
            DB    $00
L031576     DW    $001B
L031578     DB    $FF
L031579     DB    $06
L03157A     DB    $7D
L03157B     DB    $06
L03157C     DW    $0000	; Hardware handshaking
L03157E     DB    $F9
L03157F     DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $00
L0315A4     DB    $00
            DB    $00
L0315A6     DB    $00
            DB    $00
L0315A8     DW    $0000	; Position jumps
L0315AA     DB    $01
            DB    $00
L0315AC     DB    $00
            DB    $00
L0315AE     DB    $00
            DB    $00
L0315B0     DB    $00
            DB    $00
L0315B2     DB    $00
            DB    $00
L0315B4     DB    $00
            DB    $00
L0315B6     DB    $00
            DB    $00
L0315B8     DB    $00
            DB    $00
L0315BA     DB    $00
            DB    $00
L0315BC     DB    $00
            DB    $00
L0315BE     DB    $00
            DB    $00
L0315C0     DB    $00
            DB    $00
L0315C2     DB    $00
            DB    $00
L0315C4     DB    $00
            DB    $00
L0315C6     DB    $00
            DB    $00
L0315C8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031648     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0316C8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031706     DB    $00
            DB    $00
L031708     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031786     DB    $00
            DB    $00
L031788     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031808     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031848     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031888     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0318C8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031908     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031948     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031988     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0319C8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031A08     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031A48     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031A88     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031A9C     DB    $00
L031A9D     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031AB0     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031AC4     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031AD8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031AEC     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031B00     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031B14     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031B3C     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031B50     DB    $00
L031B51     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031B64     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031B78     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031B8C     DB    $00
L031B8D     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031BA0     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031BB4     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031BC8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031BDC     DB    $A0
L031BDD     DB    $40
L031BDE     DB    $A0
            DB    $40
L031BE0     DB    $A0
            DB    $40
L031BE2     DB    $A0
            DB    $40
L031BE4     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031BF8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C0C     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C20     DB    $00
L031C21     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C34     DB    $00
L031C35     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C48     DB    $00
L031C49     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C5C     DB    $00
L031C5D     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C70     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C84     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031C98     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031CAC     DB    $00
L031CAD     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031CC0     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031CD4     DB    $10
L031CD5     DB    $10
L031CD6     DB    $00
            DB    $00
L031CD8     DB    $00
            DB    $00
L031CDA     DB    $10
            DB    $10
            DB    $60
            DB    $60
            DB    $50
            DB    $50
            DB    $40
            DB    $40
            DB    $30
            DB    $30
            DB    $20
            DB    $20
            DB    $10
            DB    $10
L031CE8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031CFC     DB    $00
L031CFD     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D10     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D24     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D38     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D4C     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D60     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D74     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D88     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031D9C     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L031DB0     DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $08
            DB    $00
            DB    $0C
            DB    $00
            DB    $10
            DB    $00
            DB    $14
            DB    $00
            DB    $18
            DB    $00
            DB    $1C
            DB    $00
            DB    $20
            DB    $00
            DB    $24
            DB    $00
L031DC4     DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $01
            DB    $02
            DB    $02
            DB    $02
            DB    $03
            DB    $03
            DB    $03
            DB    $04
            DB    $04
            DB    $04
            DB    $05
            DB    $05
            DB    $05
            DB    $06
            DB    $06
            DB    $06
            DB    $07
            DB    $07
            DB    $07
            DB    $08
            DB    $08
            DB    $08
            DB    $09
            DB    $09
            DB    $09
L031DE2     DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $06
            DB    $00
            DB    $09
            DB    $00
            DB    $0C
            DB    $00
            DB    $0F
            DB    $00
            DB    $12
            DB    $00
            DB    $15
            DB    $00
            DB    $18
            DB    $00
            DB    $1B
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $02
            DB    $00
            DB    $04
            DB    $00
            DB    $08
L031DFE     DB    $00
            DB    $18
            DB    $31
            DB    $4A
            DB    $61
            DB    $78
            DB    $8D
            DB    $A1
            DB    $B4
            DB    $C5
            DB    $D4
            DB    $E0
            DB    $EB
            DB    $F4
            DB    $FA
            DB    $FD
            DB    $FF
            DB    $FD
            DB    $FA
            DB    $F4
            DB    $EB
            DB    $E0
            DB    $D4
            DB    $C5
            DB    $B4
            DB    $A1
            DB    $8D
            DB    $78
            DB    $61
            DB    $4A
            DB    $31
            DB    $18
L031E1E     DB    $00
            DB    $00
            DB    $25
            DB    $00
            DB    $4A
            DB    $00
            DB    $6F
            DB    $00
            DB    $94
            DB    $00
            DB    $B9
            DB    $00
            DB    $DE
            DB    $00
            DB    $03
            DB    $01
            DB    $28
            DB    $01
            DB    $4D
            DB    $01
            DB    $72
            DB    $01
            DB    $97
            DB    $01
            DB    $BC
            DB    $01
            DB    $E1
            DB    $01
            DB    $06
            DB    $02
            DB    $2B
            DB    $02
L031E3E     DB    $58
            DB    $03
            DB    $28
            DB    $03
            DB    $FA
            DB    $02
            DB    $D0
            DB    $02
            DB    $A6
            DB    $02
            DB    $80
            DB    $02
            DB    $5C
            DB    $02
            DB    $3A
            DB    $02
            DB    $1A
            DB    $02
            DB    $FC
            DB    $01
            DB    $E0
            DB    $01
            DB    $C5
            DB    $01
            DB    $AC
            DB    $01
            DB    $94
            DB    $01
            DB    $7D
            DB    $01
            DB    $68
            DB    $01
            DB    $53
            DB    $01
            DB    $40
            DB    $01
            DB    $2E
            DB    $01
            DB    $1D
            DB    $01
            DB    $0D
            DB    $01
            DB    $FE
            DB    $00
            DB    $F0
            DB    $00
            DB    $E2
            DB    $00
            DB    $D6
            DB    $00
            DB    $CA
            DB    $00
            DB    $BE
            DB    $00
            DB    $B4
            DB    $00
            DB    $AA
            DB    $00
            DB    $A0
            DB    $00
            DB    $97
            DB    $00
            DB    $8F
            DB    $00
            DB    $87
            DB    $00
            DB    $7F
            DB    $00
            DB    $78
            DB    $00
            DB    $71
            DB    $00
            DB    $00
            DB    $00
            DB    $52
            DB    $03
            DB    $22
            DB    $03
            DB    $F5
            DB    $02
            DB    $CB
            DB    $02
            DB    $A2
            DB    $02
            DB    $7D
            DB    $02
            DB    $59
            DB    $02
            DB    $37
            DB    $02
            DB    $17
            DB    $02
            DB    $F9
            DB    $01
            DB    $DD
            DB    $01
            DB    $C2
            DB    $01
            DB    $A9
            DB    $01
            DB    $91
            DB    $01
            DB    $7B
            DB    $01
            DB    $65
            DB    $01
            DB    $51
            DB    $01
            DB    $3E
            DB    $01
            DB    $2C
            DB    $01
            DB    $1C
            DB    $01
            DB    $0C
            DB    $01
            DB    $FD
            DB    $00
            DB    $EF
            DB    $00
            DB    $E1
            DB    $00
            DB    $D5
            DB    $00
            DB    $C9
            DB    $00
            DB    $BD
            DB    $00
            DB    $B3
            DB    $00
            DB    $A9
            DB    $00
            DB    $9F
            DB    $00
            DB    $96
            DB    $00
            DB    $8E
            DB    $00
            DB    $86
            DB    $00
            DB    $7E
            DB    $00
            DB    $77
            DB    $00
            DB    $71
            DB    $00
            DB    $00
            DB    $00
            DB    $4C
            DB    $03
            DB    $1C
            DB    $03
            DB    $F0
            DB    $02
            DB    $C5
            DB    $02
            DB    $9E
            DB    $02
            DB    $78
            DB    $02
            DB    $55
            DB    $02
            DB    $33
            DB    $02
            DB    $14
            DB    $02
            DB    $F6
            DB    $01
            DB    $DA
            DB    $01
            DB    $BF
            DB    $01
            DB    $A6
            DB    $01
            DB    $8E
            DB    $01
            DB    $78
            DB    $01
            DB    $63
            DB    $01
            DB    $4F
            DB    $01
            DB    $3C
            DB    $01
            DB    $2A
            DB    $01
            DB    $1A
            DB    $01
            DB    $0A
            DB    $01
            DB    $FB
            DB    $00
            DB    $ED
            DB    $00
            DB    $E0
            DB    $00
            DB    $D3
            DB    $00
            DB    $C7
            DB    $00
            DB    $BC
            DB    $00
            DB    $B1
            DB    $00
            DB    $A7
            DB    $00
            DB    $9E
            DB    $00
            DB    $95
            DB    $00
            DB    $8D
            DB    $00
            DB    $85
            DB    $00
            DB    $7D
            DB    $00
            DB    $76
            DB    $00
            DB    $70
            DB    $00
            DB    $00
            DB    $00
            DB    $46
            DB    $03
            DB    $17
            DB    $03
            DB    $EA
            DB    $02
            DB    $C0
            DB    $02
            DB    $99
            DB    $02
            DB    $74
            DB    $02
            DB    $50
            DB    $02
            DB    $2F
            DB    $02
            DB    $10
            DB    $02
            DB    $F2
            DB    $01
            DB    $D6
            DB    $01
            DB    $BC
            DB    $01
            DB    $A3
            DB    $01
            DB    $8B
            DB    $01
            DB    $75
            DB    $01
            DB    $60
            DB    $01
            DB    $4C
            DB    $01
            DB    $3A
            DB    $01
            DB    $28
            DB    $01
            DB    $18
            DB    $01
            DB    $08
            DB    $01
            DB    $F9
            DB    $00
            DB    $EB
            DB    $00
            DB    $DE
            DB    $00
            DB    $D1
            DB    $00
            DB    $C6
            DB    $00
            DB    $BB
            DB    $00
            DB    $B0
            DB    $00
            DB    $A6
            DB    $00
            DB    $9D
            DB    $00
            DB    $94
            DB    $00
            DB    $8C
            DB    $00
            DB    $84
            DB    $00
            DB    $7D
            DB    $00
            DB    $76
            DB    $00
            DB    $6F
            DB    $00
            DB    $00
            DB    $00
            DB    $40
            DB    $03
            DB    $11
            DB    $03
            DB    $E5
            DB    $02
            DB    $BB
            DB    $02
            DB    $94
            DB    $02
            DB    $6F
            DB    $02
            DB    $4C
            DB    $02
            DB    $2B
            DB    $02
            DB    $0C
            DB    $02
            DB    $EF
            DB    $01
            DB    $D3
            DB    $01
            DB    $B9
            DB    $01
            DB    $A0
            DB    $01
            DB    $88
            DB    $01
            DB    $72
            DB    $01
            DB    $5E
            DB    $01
            DB    $4A
            DB    $01
            DB    $38
            DB    $01
            DB    $26
            DB    $01
            DB    $16
            DB    $01
            DB    $06
            DB    $01
            DB    $F7
            DB    $00
            DB    $E9
            DB    $00
            DB    $DC
            DB    $00
            DB    $D0
            DB    $00
            DB    $C4
            DB    $00
            DB    $B9
            DB    $00
            DB    $AF
            DB    $00
            DB    $A5
            DB    $00
            DB    $9C
            DB    $00
            DB    $93
            DB    $00
            DB    $8B
            DB    $00
            DB    $83
            DB    $00
            DB    $7C
            DB    $00
            DB    $75
            DB    $00
            DB    $6E
            DB    $00
            DB    $00
            DB    $00
            DB    $3A
            DB    $03
            DB    $0B
            DB    $03
            DB    $E0
            DB    $02
            DB    $B6
            DB    $02
            DB    $8F
            DB    $02
            DB    $6B
            DB    $02
            DB    $48
            DB    $02
            DB    $27
            DB    $02
            DB    $08
            DB    $02
            DB    $EB
            DB    $01
            DB    $CF
            DB    $01
            DB    $B5
            DB    $01
            DB    $9D
            DB    $01
            DB    $86
            DB    $01
            DB    $70
            DB    $01
            DB    $5B
            DB    $01
            DB    $48
            DB    $01
            DB    $35
            DB    $01
            DB    $24
            DB    $01
            DB    $14
            DB    $01
            DB    $04
            DB    $01
            DB    $F5
            DB    $00
            DB    $E8
            DB    $00
            DB    $DB
            DB    $00
            DB    $CE
            DB    $00
            DB    $C3
            DB    $00
            DB    $B8
            DB    $00
            DB    $AE
            DB    $00
            DB    $A4
            DB    $00
            DB    $9B
            DB    $00
            DB    $92
            DB    $00
            DB    $8A
            DB    $00
            DB    $82
            DB    $00
            DB    $7B
            DB    $00
            DB    $74
            DB    $00
            DB    $6D
            DB    $00
            DB    $00
            DB    $00
            DB    $34
            DB    $03
            DB    $06
            DB    $03
            DB    $DA
            DB    $02
            DB    $B1
            DB    $02
            DB    $8B
            DB    $02
            DB    $66
            DB    $02
            DB    $44
            DB    $02
            DB    $23
            DB    $02
            DB    $04
            DB    $02
            DB    $E7
            DB    $01
            DB    $CC
            DB    $01
            DB    $B2
            DB    $01
            DB    $9A
            DB    $01
            DB    $83
            DB    $01
            DB    $6D
            DB    $01
            DB    $59
            DB    $01
            DB    $45
            DB    $01
            DB    $33
            DB    $01
            DB    $22
            DB    $01
            DB    $12
            DB    $01
            DB    $02
            DB    $01
            DB    $F4
            DB    $00
            DB    $E6
            DB    $00
            DB    $D9
            DB    $00
            DB    $CD
            DB    $00
            DB    $C1
            DB    $00
            DB    $B7
            DB    $00
            DB    $AC
            DB    $00
            DB    $A3
            DB    $00
            DB    $9A
            DB    $00
            DB    $91
            DB    $00
            DB    $89
            DB    $00
            DB    $81
            DB    $00
            DB    $7A
            DB    $00
            DB    $73
            DB    $00
            DB    $6D
            DB    $00
            DB    $00
            DB    $00
            DB    $2E
            DB    $03
            DB    $00
            DB    $03
            DB    $D5
            DB    $02
            DB    $AC
            DB    $02
            DB    $86
            DB    $02
            DB    $62
            DB    $02
            DB    $3F
            DB    $02
            DB    $1F
            DB    $02
            DB    $01
            DB    $02
            DB    $E4
            DB    $01
            DB    $C9
            DB    $01
            DB    $AF
            DB    $01
            DB    $97
            DB    $01
            DB    $80
            DB    $01
            DB    $6B
            DB    $01
            DB    $56
            DB    $01
            DB    $43
            DB    $01
            DB    $31
            DB    $01
            DB    $20
            DB    $01
            DB    $10
            DB    $01
            DB    $00
            DB    $01
            DB    $F2
            DB    $00
            DB    $E4
            DB    $00
            DB    $D8
            DB    $00
            DB    $CC
            DB    $00
            DB    $C0
            DB    $00
            DB    $B5
            DB    $00
            DB    $AB
            DB    $00
            DB    $A1
            DB    $00
            DB    $98
            DB    $00
            DB    $90
            DB    $00
            DB    $88
            DB    $00
            DB    $80
            DB    $00
            DB    $79
            DB    $00
            DB    $72
            DB    $00
            DB    $6C
            DB    $00
            DB    $00
            DB    $00
            DB    $8B
            DB    $03
            DB    $58
            DB    $03
            DB    $28
            DB    $03
            DB    $FA
            DB    $02
            DB    $D0
            DB    $02
            DB    $A6
            DB    $02
            DB    $80
            DB    $02
            DB    $5C
            DB    $02
            DB    $3A
            DB    $02
            DB    $1A
            DB    $02
            DB    $FC
            DB    $01
            DB    $E0
            DB    $01
            DB    $C5
            DB    $01
            DB    $AC
            DB    $01
            DB    $94
            DB    $01
            DB    $7D
            DB    $01
            DB    $68
            DB    $01
            DB    $53
            DB    $01
            DB    $40
            DB    $01
            DB    $2E
            DB    $01
            DB    $1D
            DB    $01
            DB    $0D
            DB    $01
            DB    $FE
            DB    $00
            DB    $F0
            DB    $00
            DB    $E2
            DB    $00
            DB    $D6
            DB    $00
            DB    $CA
            DB    $00
            DB    $BE
            DB    $00
            DB    $B4
            DB    $00
            DB    $AA
            DB    $00
            DB    $A0
            DB    $00
            DB    $97
            DB    $00
            DB    $8F
            DB    $00
            DB    $87
            DB    $00
            DB    $7F
            DB    $00
            DB    $78
            DB    $00
            DB    $00
            DB    $00
            DB    $84
            DB    $03
            DB    $52
            DB    $03
            DB    $22
            DB    $03
            DB    $F5
            DB    $02
            DB    $CB
            DB    $02
            DB    $A3
            DB    $02
            DB    $7C
            DB    $02
            DB    $59
            DB    $02
            DB    $37
            DB    $02
            DB    $17
            DB    $02
            DB    $F9
            DB    $01
            DB    $DD
            DB    $01
            DB    $C2
            DB    $01
            DB    $A9
            DB    $01
            DB    $91
            DB    $01
            DB    $7B
            DB    $01
            DB    $65
            DB    $01
            DB    $51
            DB    $01
            DB    $3E
            DB    $01
            DB    $2C
            DB    $01
            DB    $1C
            DB    $01
            DB    $0C
            DB    $01
            DB    $FD
            DB    $00
            DB    $EE
            DB    $00
            DB    $E1
            DB    $00
            DB    $D4
            DB    $00
            DB    $C8
            DB    $00
            DB    $BD
            DB    $00
            DB    $B3
            DB    $00
            DB    $A9
            DB    $00
            DB    $9F
            DB    $00
            DB    $96
            DB    $00
            DB    $8E
            DB    $00
            DB    $86
            DB    $00
            DB    $7E
            DB    $00
            DB    $77
            DB    $00
            DB    $00
            DB    $00
            DB    $7E
            DB    $03
            DB    $4C
            DB    $03
            DB    $1C
            DB    $03
            DB    $F0
            DB    $02
            DB    $C5
            DB    $02
            DB    $9E
            DB    $02
            DB    $78
            DB    $02
            DB    $55
            DB    $02
            DB    $33
            DB    $02
            DB    $14
            DB    $02
            DB    $F6
            DB    $01
            DB    $DA
            DB    $01
            DB    $BF
            DB    $01
            DB    $A6
            DB    $01
            DB    $8E
            DB    $01
            DB    $78
            DB    $01
            DB    $63
            DB    $01
            DB    $4F
            DB    $01
            DB    $3C
            DB    $01
            DB    $2A
            DB    $01
            DB    $1A
            DB    $01
            DB    $0A
            DB    $01
            DB    $FB
            DB    $00
            DB    $ED
            DB    $00
            DB    $DF
            DB    $00
            DB    $D3
            DB    $00
            DB    $C7
            DB    $00
            DB    $BC
            DB    $00
            DB    $B1
            DB    $00
            DB    $A7
            DB    $00
            DB    $9E
            DB    $00
            DB    $95
            DB    $00
            DB    $8D
            DB    $00
            DB    $85
            DB    $00
            DB    $7D
            DB    $00
            DB    $76
            DB    $00
            DB    $00
            DB    $00
            DB    $77
            DB    $03
            DB    $46
            DB    $03
            DB    $17
            DB    $03
            DB    $EA
            DB    $02
            DB    $C0
            DB    $02
            DB    $99
            DB    $02
            DB    $74
            DB    $02
            DB    $50
            DB    $02
            DB    $2F
            DB    $02
            DB    $10
            DB    $02
            DB    $F2
            DB    $01
            DB    $D6
            DB    $01
            DB    $BC
            DB    $01
            DB    $A3
            DB    $01
            DB    $8B
            DB    $01
            DB    $75
            DB    $01
            DB    $60
            DB    $01
            DB    $4C
            DB    $01
            DB    $3A
            DB    $01
            DB    $28
            DB    $01
            DB    $18
            DB    $01
            DB    $08
            DB    $01
            DB    $F9
            DB    $00
            DB    $EB
            DB    $00
            DB    $DE
            DB    $00
            DB    $D1
            DB    $00
            DB    $C6
            DB    $00
            DB    $BB
            DB    $00
            DB    $B0
            DB    $00
            DB    $A6
            DB    $00
            DB    $9D
            DB    $00
            DB    $94
            DB    $00
            DB    $8C
            DB    $00
            DB    $84
            DB    $00
            DB    $7D
            DB    $00
            DB    $76
            DB    $00
            DB    $00
            DB    $00
            DB    $71
            DB    $03
            DB    $40
            DB    $03
            DB    $11
            DB    $03
            DB    $E5
            DB    $02
            DB    $BB
            DB    $02
            DB    $94
            DB    $02
            DB    $6F
            DB    $02
            DB    $4C
            DB    $02
            DB    $2B
            DB    $02
            DB    $0C
            DB    $02
            DB    $EE
            DB    $01
            DB    $D3
            DB    $01
            DB    $B9
            DB    $01
            DB    $A0
            DB    $01
            DB    $88
            DB    $01
            DB    $72
            DB    $01
            DB    $5E
            DB    $01
            DB    $4A
            DB    $01
            DB    $38
            DB    $01
            DB    $26
            DB    $01
            DB    $16
            DB    $01
            DB    $06
            DB    $01
            DB    $F7
            DB    $00
            DB    $E9
            DB    $00
            DB    $DC
            DB    $00
            DB    $D0
            DB    $00
            DB    $C4
            DB    $00
            DB    $B9
            DB    $00
            DB    $AF
            DB    $00
            DB    $A5
            DB    $00
            DB    $9C
            DB    $00
            DB    $93
            DB    $00
            DB    $8B
            DB    $00
            DB    $83
            DB    $00
            DB    $7B
            DB    $00
            DB    $75
            DB    $00
            DB    $00
            DB    $00
            DB    $6B
            DB    $03
            DB    $3A
            DB    $03
            DB    $0B
            DB    $03
            DB    $E0
            DB    $02
            DB    $B6
            DB    $02
            DB    $8F
            DB    $02
            DB    $6B
            DB    $02
            DB    $48
            DB    $02
            DB    $27
            DB    $02
            DB    $08
            DB    $02
            DB    $EB
            DB    $01
            DB    $CF
            DB    $01
            DB    $B5
            DB    $01
            DB    $9D
            DB    $01
            DB    $86
            DB    $01
            DB    $70
            DB    $01
            DB    $5B
            DB    $01
            DB    $48
            DB    $01
            DB    $35
            DB    $01
            DB    $24
            DB    $01
            DB    $14
            DB    $01
            DB    $04
            DB    $01
            DB    $F5
            DB    $00
            DB    $E8
            DB    $00
            DB    $DB
            DB    $00
            DB    $CE
            DB    $00
            DB    $C3
            DB    $00
            DB    $B8
            DB    $00
            DB    $AE
            DB    $00
            DB    $A4
            DB    $00
            DB    $9B
            DB    $00
            DB    $92
            DB    $00
            DB    $8A
            DB    $00
            DB    $82
            DB    $00
            DB    $7B
            DB    $00
            DB    $74
            DB    $00
            DB    $00
            DB    $00
            DB    $64
            DB    $03
            DB    $34
            DB    $03
            DB    $06
            DB    $03
            DB    $DA
            DB    $02
            DB    $B1
            DB    $02
            DB    $8B
            DB    $02
            DB    $66
            DB    $02
            DB    $44
            DB    $02
            DB    $23
            DB    $02
            DB    $04
            DB    $02
            DB    $E7
            DB    $01
            DB    $CC
            DB    $01
            DB    $B2
            DB    $01
            DB    $9A
            DB    $01
            DB    $83
            DB    $01
            DB    $6D
            DB    $01
            DB    $59
            DB    $01
            DB    $45
            DB    $01
            DB    $33
            DB    $01
            DB    $22
            DB    $01
            DB    $12
            DB    $01
            DB    $02
            DB    $01
            DB    $F4
            DB    $00
            DB    $E6
            DB    $00
            DB    $D9
            DB    $00
            DB    $CD
            DB    $00
            DB    $C1
            DB    $00
            DB    $B7
            DB    $00
            DB    $AC
            DB    $00
            DB    $A3
            DB    $00
            DB    $9A
            DB    $00
            DB    $91
            DB    $00
            DB    $89
            DB    $00
            DB    $81
            DB    $00
            DB    $7A
            DB    $00
            DB    $73
            DB    $00
            DB    $00
            DB    $00
            DB    $5E
            DB    $03
            DB    $2E
            DB    $03
            DB    $00
            DB    $03
            DB    $D5
            DB    $02
            DB    $AC
            DB    $02
            DB    $86
            DB    $02
            DB    $62
            DB    $02
            DB    $3F
            DB    $02
            DB    $1F
            DB    $02
            DB    $01
            DB    $02
            DB    $E4
            DB    $01
            DB    $C9
            DB    $01
            DB    $AF
            DB    $01
            DB    $97
            DB    $01
            DB    $80
            DB    $01
            DB    $6B
            DB    $01
            DB    $56
            DB    $01
            DB    $43
            DB    $01
            DB    $31
            DB    $01
            DB    $20
            DB    $01
            DB    $10
            DB    $01
            DB    $00
            DB    $01
            DB    $F2
            DB    $00
            DB    $E4
            DB    $00
            DB    $D8
            DB    $00
            DB    $CB
            DB    $00
            DB    $C0
            DB    $00
            DB    $B5
            DB    $00
            DB    $AB
            DB    $00
            DB    $A1
            DB    $00
            DB    $98
            DB    $00
            DB    $90
            DB    $00
            DB    $88
            DB    $00
            DB    $80
            DB    $00
            DB    $79
            DB    $00
            DB    $72
            DB    $00
            DB    $00
            DB    $00
L0322DE     DB    $00
            DB    $00

            MX    %11
L0322E0     PHD
            PHB
            PHK
            PLB
            LDA   L03157C	; Hardware handshaking
            BEQ   L0322F5
            LDA   #$05
            STAL  $E1C038
            LDA   #$EA
            STAL  $E1C038
L0322F5     LDAL  $E100CA
            STAL  $E1C03C
            LDA   #$0C
            STAL  $E1C03E
            LDA   L03157E
            STAL  $E1C03D
            LDA   #$2C
            STAL  $E1C03E
            LDA   L03157F
            STAL  $E1C03D
            REP   #$30
            LDA   L0315AC
            TCD
            LDAL  $E100CC
L032321     AND   #$003E
            CMP   #$001A
            BEQ   L03232E
            JSR   L032451
            BRA   L03234E
L03232E     JSL   L0325DB
            LDAL  CYAREG
            AND   #$007F
            STAL  CYAREG
            LDA   #$000A
L032340     DEC
            BNE   L032340
            LDAL  CYAREG
            ORA   #$0080
            STAL  CYAREG
L03234E     SEP   #$30
            LDAL  $E100CA
            STAL  $E1C03C
            LDA   #$E0
            STAL  $E1C03E
            LDAL  $E1C03D
            LDA   #$00
            STAL  $E1C03E
            LDAL  $E1C03D
            REP   #$30
            BPL   L032321
            SEP   #$30
            LDAL  $E100CA
            STAL  $E1C03C
            LDA   #$0C
            STAL  $E1C03E
            LDA   #$00
            STAL  $E1C03D
            LDA   #$2C
            STAL  $E1C03E
            LDA   #$00
            STAL  $E1C03D
L032392     LDA   L03157C	; Hardware handshaking
            BEQ   L0323A3
            LDA   #$05
            STAL  $E1C038
            LDA   #$6A
            STAL  $E1C038
L0323A3     PLB
            PLD
            CLC
            RTL

*-------------------------------
* DEAD CODE
*-------------------------------

            MX    %00
L0323A7     JSL   L030000
            BRL   L032392

L0323AE     LDA   #$0002
            STAL  L0315B4
            LDA   $04,S
            STAL  L0315AC
            JSL   L032401
            SEI		; bug
            SEP   #$30
            LDAL  $E100CA
            ORA   #$60
            STAL  $E1C03C
            LDA   #$FF
            STAL  $E1C03F
            LDA   #$00
            STAL  $E1C03E
            LDA   #$01
            STAL  $E1C03D
            LDX   #$FF
L0323E0     STAL  $E1C03D
            INC
            DEX
            BNE   L0323E0
            CLI
            REP   #$30
            PEA   $000B
            PEA   ^L0322E0
            PEA   L0322E0
            _SetVector
            RTL

L0323FC     JSL   L032401
            RTL

*-------------------------------
* Stop oscillators
*-------------------------------

L032401     PHP
            SEP   #$30
            SEI
            LDAL  $E100CA
            STAL  $E1C03C
            LDA   #$E1
            STAL  $E1C03E
            LDA   #$1C
            STAL  $E1C03D
            LDA   #$00
            STAL  $E1C03F
            LDX   #$A0
L032421     LDY   #$02
L032423     TXA
            STAL  $E1C03E
            LDA   #$03
            STAL  $E1C03D
            TXA
            INC
            STAL  $E1C03E
            LDA   #$03
            STAL  $E1C03D
            DEY
            BNE   L032423
            INX
            INX
            CPX   #$C0
            BNE   L032421
            LDA   #$E0
            STAL  $E1C03E
L032449     LDAL  $E1C03D
            BPL   L032449
            PLP
            RTL

L032451     LSR
            TAX
            LDA   L031DC4,X
            AND   #$FF
            BRK   $0A
            TAY
            LDA   L031CE8,Y
            STA   $10
            LDA   L031CFC,Y
            STA   $12
            BPL   L032468
            RTS

L032468     LDA   L031D10,Y
            STA   $0C
            LDA   L031D24,Y
            STA   $0E
            LDA   L031D38,Y
            STA   $18
            LDA   L031D4C,Y
            STA   $1A
            LDA   L031D60,Y
            STA   $14
            LDA   L031D74,Y
            STA   $16
            SEP   #$30
            LDA   L031D88,Y
            STA   $0A
            STZ   $08
            PHX
            LDX   L031DB0,Y
            LDA   L031DE2,Y
            CMP   $01,S
            BEQ   L03249D
            INX
            INC   $08
L03249D     STA   $01,S
            TXA
            XBA
            LDA   #$00
            PHY
            REP   #$30
            STAL  $E1C03E
            JSL   L03255E
            SEP   #$30
            PLY
            PLX
            LDA   $13
            BMI   L0324FD
            LDAL  $E100CA
            STAL  $E1C03C
            TXA
            ORA   #$A0
            STAL  $E1C03E
            LDA   $08
            BEQ   L0324CB
            LDA   #$08
L0324CB     STAL  $E1C03D
            REP   #$30
            LDA   $10
            STA   L031CE8,Y
            LDA   $12
            STA   L031CFC,Y
            LDA   $0C
            STA   L031D10,Y
            LDA   $0E
            STA   L031D24,Y
            LDA   $18
            STA   L031D38,Y
            LDA   $1A
            STA   L031D4C,Y
            LDA   $14
            STA   L031D60,Y
            LDA   $16
            STA   L031D74,Y
            BRL   L03252F
            RTS

            MX    %11
L0324FD     LDAL  $E100CA
            STAL  $E1C03C
            TXA
            ORA   #$A0
            STAL  $E1C03E
            LDA   #$03
            STAL  $E1C03D
            TXA
            INC
            ORA   #$A0
            STAL  $E1C03E
            LDAL  $E1C03D
            LDAL  $E1C03D
            AND   #$F7
            STAL  $E1C03D
            REP   #$30
            LDA   $12
            STA   L031CFC,Y
L03252F     SEP   #$30
            LDA   $08
            CMP   L031BC8,Y
            BEQ   L032538
L032538     LDA   $08
            EOR   #$01
            STA   L031BC8,Y
            REP   #$30
            RTS

            MX    %11
            PHA
            LDAL  CYAREG
            AND   #$7F
            STAL  CYAREG
            LDA   #$08
L03254F     DEC
            BNE   L03254F
            LDAL  CYAREG
            ORA   #$80
            STAL  CYAREG
            PLA
            RTS

            MX    %00
L03255E     LDX   #$0000
            PHD
            PHB
            LDY   $0C
            SEP   #$20
            LDA   $0E
            PHA
            PLB
            PEA   $C000
            PLD
            LDAL  $E100CA
            ORA   #$60
            STA   $3C
            JSR   (L0325D3,X)
            PLB
            PLD
            REP   #$20
            SEC
            LDA   $10
            SBC   #$0100
            STA   $10
            BCS   L0325AF
            DEC   $12
            BPL   L0325B1
            LDA   $1A
            BMI   L0325AE
L032590     SEC
            LDA   $14
            SBC   $10
            STA   $0C
            LDA   $16
            BCC   L03259C
            INC
L03259C     STA   $0E
            CLC
            LDA   $18
            ADC   $10
            STA   $10
            LDA   $1A
            BCS   L0325AA
            DEC
L0325AA     STA   $12
            BMI   L032590
L0325AE     RTL

L0325AF     BEQ   L0325BE
L0325B1     CLC
            LDA   $0C
            ADC   #$0100
            STA   $0C
            BCC   L0325BD
            INC   $0E
L0325BD     RTL

L0325BE     LDA   $12
            BNE   L0325B1
            LDA   $18
            STA   $10
            LDA   $1A
            STA   $12
            LDA   $14
            STA   $0C
            LDA   $16
            STA   $0E
            RTL

L0325D3     DA    L033211
            DA    $3712
            DA    L033211
            DA    L033211
L0325DB     LDA   L0315B0
            INC
            STA   L0315B0
            CMP   L0315B2
            BEQ   L0325EA
            BRL   L0326BB
L0325EA     STZ   L0315B0
            LDA   L0315B4
            BEQ   L0325F5
            BRL   L0326C0
L0325F5     JSR   L032B56
            LDA   #$0001
            STA   L0322DE
            LDA   L0315B6
            BNE   L03262B
            LDA   L0315B8
            INC
            STA   L0315B8
            CMP   L0315BA
            BNE   L032650
            STZ   L0315B8
            LDA   L0315BC
            INC
            STA   L0315BC
            CMP   L0315C4
            BNE   L03262B
            STZ   L0315BC
            LDA   L0315C2
            BNE   L03262B
            INC   L0315B4
            BRA   L03262B
L03262B     STZ   L0315B6
            LDY   L0315BC
            LDA   L0315C8,Y
            AND   #$00FF
            TAY
            LDA   L0316C8,Y
            AND   #$00FF
            STA   L0315BA
            TYA
            ASL
            TAY
            LDA   L031708,Y
            STA   L0315BE
            LDA   L031788,Y
            STA   L0315C0
L032650     LDA   L0315B8
            ASL
            TAY
            LDA   L031648,Y
            CLC
            ADC   L0315BE
            STA   $1E
            LDA   L0315C0
            BCC   L032664
            INC
L032664     STA   $20
L032666     LDA   L0315B0
            INC
            CMP   L0315B2
            SEP   #$30
            BNE   L032685
            LDA   L0315C6
            DEC
            ASL
            TAX
            LDA   #$00
L032679     BIT   L031B3C,X
            BMI   L032681
            STA   L031B3C,X
L032681     DEX
            DEX
            BPL   L032679
L032685     REP   #$30
            LDA   L0315C6
            ASL
            TAX
            ASL
            TAY
            DEX
            DEX
L032690     DEY
            DEY
            LDA   [$1E],Y
            STA   $22
            DEY
            DEY
            LDA   [$1E],Y
            STA   $24
            SEP   #$20
            BIT   L031B3C,X
            REP   #$20
            BMI   L0326AE
            BVS   L0326AE
            PHX
            PHY
            JSR   L0326D0
            PLY
            PLX
L0326AE     DEX
            DEX
            BPL   L032690
            JSR   L032A22
            BCC   L0326BA
            BRL   L0325DB
L0326BA     RTL

L0326BB     JSR   L032C39
            BRA   L032666
L0326C0     LDA   #$0002
            STA   L0315B4
            JSL   L032401
            JSL   L03008E
            BRA   L0326BA
L0326D0     LDA   $22
            AND   #$FF0F
            STA   L031B8C,X
            LDA   $25
            AND   #$00FF
            ASL
            TAY
            BNE   L032700
            LDY   L031BA0,X
            BEQ   L0326F4
            LDA   #$FFFF
            STA   L031B78,X
            LDA   L031C0C,X
            STA   L031BB4,X
            BRA   L032725
L0326F4     STZ   L031B50,X
            SEP   #$30
            LDA   #$80
            STA   L031B3C,X
            BRA   L032746
L032700     LDA   L031A08,Y
            STA   L031B78,X
            LDA   L031A48,Y
            ASL
            STA   L031BB4,X
            LDA   L031908,Y
            STA   L031AD8,X
            LDA   L031948,Y
            STA   L031AEC,X
            LDA   L031988,Y
            STA   L031B00,X
            LDA   L0319C8,Y
            STA   L031B14,X
L032725     LDA   L031808,Y
            STA   L031A88,X
            LDA   L031848,Y
            BMI   L0326F4
            STA   L031A9C,X
            LDA   L031888,Y
            STA   L031AB0,X
            LDA   L0318C8,Y
            STA   L031AC4,X
            SEP   #$30
            LDA   #$C0
            STA   L031B3C,X
L032746     LDA   $22
            AND   #$0F
            ASL
            PHY
            PHX
            TXY
            TAX
            JSR   (L0327A0,X)
            PLX
            PLY
            REP   #$30
            LDA   $24
            AND   #$00FF
            BEQ   L032783
            CPY   #$0000
            BEQ   L03277E
            SEC
            SBC   #$0018
            PHY
            SEP   #$30
            LDY   L031BB4,X
            REP   #$30
            CLC
            ADC   L031E1E,Y
            ASL
            TAY
            LDA   L031E3E,Y
            PLY
            STA   L031B50,X
            STZ   L031B64,X
L03277E     TYA
            STA   L031BA0,X
L032782     RTS

L032783     STZ   L031B50,X
            SEP   #$30
            LDY   #$80
            LDA   $25
            ASL
            BEQ   L032799
            CMP   L031BA0,X
            BEQ   L032799
            STA   L031BA0,X
            LDY   #$C0
L032799     TYA
            STA   L031B3C,X
            REP   #$30
            RTS

L0327A0     DA    L032782
            DA    L032782
            DA    L032782
            DA    L03283F
            DA    L032782
            DA    L03283F
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L0327FA
            DA    L032782
            DA    L032857
            DA    L032848
            DA    L03286F
            DA    L0327C0
            DA    L032782
            MX    %11
L0327C0     LDA   $23
            AND   #$F0
            LSR
            LSR
            LSR
            TAX
            JMP   (L0327CB,X)

L0327CB     DA    L032782
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L0327F1
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L032782
            DA    L0327EB
            DA    L032782
            DA    L032782
L0327EB     LDA   #$80
            STA   L031B3C,Y
            RTS

L0327F1     LDA   $23
            AND   #$0F
            ASL
            STA   L031BB4,Y
            RTS

L0327FA     REP   #$20
            LDA   L031B8C,Y
            AND   #$FF00
            BEQ   L032834
            LDX   L031A9C,Y
            BNE   L032810
            CMP   L031A88,Y
            BEQ   L032810
            BCS   L032837
L032810     PHA
            CLC
            ADC   L031AB0,Y
            STA   L031AB0,Y
            BCC   L032821
            LDA   L031AC4,Y
            INC
            STA   L031AC4,Y
L032821     LDA   L031A88,Y
            SEC
            SBC   $01,S
            STA   L031A88,Y
            BCS   L032833
            LDA   L031A9C,Y
            DEC
            STA   L031A9C,Y
L032833     PLA
L032834     SEP   #$20
            RTS

L032837     SEP   #$20
            LDA   #$80
            STA   L031B3C,Y
            RTS

L03283F     LDA   $03,S
            TAX
            LDA   #$80
            STA   L031B3C,X
            RTS

L032848     LDA   $03,S
            TAX
            LDA   $23
            CMP   #$41
            BCC   L032853
            LDA   #$40
L032853     STA   L031B78,X
            RTS

L032857     LDA   L0315A8	; Position jumps
            BEQ   L032871	; don't follow
            LDA   $23
            CMP   L0315C4
            BCS   L03286E
            STZ   L0315B8
            STA   L0315BC
            LDA   #$01
            STA   L0315B6
L03286E     RTS

L03286F     LDA   $23
L032871     TAX
            AND   #$0F
            PHA
            TXA
            AND   #$F0
            PHA
            LSR
            LSR
            ADC   $01,S
            LSR
            ADC   $02,S
            PLX
            PLX
            CMP   #$40
            BCC   L032888
            LDA   #$00
L032888     STA   L0315B8
            LDA   L0315B6
            BNE   L0328AC
            LDA   #$01
            STA   L0315B6
            LDA   L0315BC
            INC
            STA   L0315BC
            CMP   L0315C4
            BNE   L0328AC
            STZ   L0315BC
            LDA   L0315C2
            BNE   L0328AC
            INC   L0315B4
L0328AC     RTS

L0328AD     LDA   L031B50,Y
            BNE   L0328B3
            RTS

            MX    %00
L0328B3     STA   L031D9C,Y
            JSR   L0329E6
            LDA   L031B64,Y
            AND   #$00FF
            BNE   L0328C2
            RTS

L0328C2     LDA   L031A88,Y
            STA   L031CE8,Y
            LDA   L031A9C,Y
            STA   L031CFC,Y
            LDA   L031AB0,Y
            STA   L031D10,Y
            LDA   L031AC4,Y
            STA   L031D24,Y
            LDA   L031B00,Y
            STA   L031D60,Y
            LDA   L031B14,Y
            STA   L031D74,Y
            LDA   L031AD8,Y
            STA   L031D38,Y
            LDA   L031AEC,Y
            STA   L031D4C,Y
            LDA   L031CC0,Y
            AND   #$00FF
            STA   $2A
            STA   $30
            LDA   L031BDC,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            LDA   $2A
            STA   $2E
            LDA   $30
            STA   $2A
            LDA   L031BDD,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            SEP   #$30
            LDA   #$00
            STA   L031BC8,Y
            LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
            LDA   L031DE2,Y
            TAX
            STAL  $E1C03E
            LDA   $26
            STAL  $E1C03D
            STAL  $E1C03D
            STAL  $E1C03D
            TXA
            ORA   #$20
            STAL  $E1C03E
            LDA   $27
            STAL  $E1C03D
            STAL  $E1C03D
            STAL  $E1C03D
            TXA
            ORA   #$40
            STAL  $E1C03E
            LDA   #$00
            STAL  $E1C03D
            LDA   $2E
            STAL  $E1C03D
            LDA   $2A
            STAL  $E1C03D
            TXA
            ORA   #$80
            STAL  $E1C03E
            LDA   #$FF
            STAL  $E1C03D
            LDA   L031DB0,Y
            EOR   #$02
            STA   L031DB0,Y
            STAL  $E1C03D
            STAL  $E1C03D
            TXA
            ORA   #$C0
            STAL  $E1C03E
            LDA   #$01
            STAL  $E1C03D
            LDA   #$0A
            STAL  $E1C03D
            STAL  $E1C03D
            TXA
            ORA   #$A0
            STAL  $E1C03E
            LDA   L031CFD,Y
            BMI   L0329C8
            LDA   #$08
            STAL  $E1C03D
            LDA   L031CD4,Y
            ORA   #$08
            STAL  $E1C03D
            LDA   L031CD5,Y
            STAL  $E1C03D
            REP   #$30
            RTS

L0329C8     LDA   #$8F03
            AND   $E1C0,X
            LDA   #$5902
            PEI   $1C
            STAL  $E1C03D
            LDA   L031CD5,Y
            ORA   #$8F02
            AND   $E1C0,X
            REP   #$20
            RTS

            REP   #$20
            RTS

L0329E6     STZ   $26
            LDX   #$0000
L0329EB     ASL
            INX
            BCC   L0329EB
            STA   $28
            LDA   #$1000
            CMP   $28
            BCS   L0329FD
            SEC
            ROR   $28
            BRA   L032A16
L0329FD     SBC   $28
            INC   $26
            ROR   $28
            ASL   $26
            CMP   $28
            BCC   L032A1A
            SBC   $28
            INC   $26
            DEX
L032A0E     LSR   $28
            ASL   $26
            CMP   $28
            BCC   L032A1A
L032A16     SBC   $28
            INC   $26
L032A1A     DEX
            BNE   L032A0E
            LDA   $26
            STA   $26
            RTS

L032A22     SEP   #$30
            LDA   L031578
            BMI   L032A3F
            LDX   #$FF
            STX   L031578
            REP   #$30
            AND   #$003E
            CMP   #$001A
            BNE   L032A3A
            SEC
            RTS

L032A3A     JSR   L032451
            SEP   #$30
L032A3F     LDA   L0315C6
            DEC
            ASL
            TAY
L032A45     LDA   L031B64,Y
            BEQ   L032A67
L032A4A     DEY
            DEY
            BPL   L032A45
            REP   #$30
            CLC
            RTS

L032A52     REP   #$30
            AND   #$003E
            CMP   #$001A
            BNE   L032A5E
            SEC
            RTS

L032A5E     PHY
            JSR   L032451
            PLY
            SEP   #$30
            BRA   L032A85
L032A67     LDAL  $E100CA
            STAL  $E1C03C
            LDA   #$E0
            STAL  $E1C03E
            LDAL  $E1C03D
            LDA   #$00
            STAL  $E1C03E
            LDAL  $E1C03D
            BPL   L032A52
L032A85     REP   #$30
            LDA   L031A88,Y
            STA   $10
            LDA   L031A9C,Y
            STA   $12
            LDA   L031AB0,Y
            STA   $0C
            LDA   L031AC4,Y
            STA   $0E
            LDA   L031AD8,Y
            STA   $18
            LDA   L031AEC,Y
            STA   $1A
            LDA   L031B00,Y
            STA   $14
            LDA   L031B14,Y
            STA   $16
            LDA   #$0000
            STA   $0A
            SEP   #$30
            LDA   L031DB0,Y
            EOR   #$02
            XBA
            LDA   #$00
            REP   #$30
            PHY
            STAL  $E1C03E
            JSL   L03255E
            LDA   $12
            BMI   L032AF2
            JSL   L03255E
            LDA   $12
            BMI   L032AF2
            PLY
            STA   L031A9C,Y
            LDA   $10
            STA   L031A88,Y
            LDA   $0C
            STA   L031AB0,Y
            LDA   $0E
            STA   L031AC4,Y
            SEP   #$30
            LDA   #$01
            STA   L031B64,Y
            BRL   L032A4A
L032AF2     PLY
            SEP   #$30
            XBA
            STA   L031A9D,Y
            STA   L031B64,Y
            BRL   L032A4A
            MX    %00
L032AFF     LDA   $2A
            EOR   #$FFFF
            STA   $2A
            LDA   #$0000
            LSR   $2A
            BCS   L032B0F
            ADC   $2C
L032B0F     ASL   $2C
            LSR   $2A
            BCS   L032B17
            ADC   $2C
L032B17     ASL   $2C
            LSR   $2A
            BCS   L032B1F
            ADC   $2C
L032B1F     ASL   $2C
            LSR   $2A
            BCS   L032B27
            ADC   $2C
L032B27     ASL   $2C
            LSR   $2A
            BCS   L032B2F
            ADC   $2C
L032B2F     ASL   $2C
            LSR   $2A
            BCS   L032B37
            ADC   $2C
L032B37     ASL   $2C
            LSR   $2A
            BCS   L032B3F
            ADC   $2C
L032B3F     ASL   $2C
            LSR   $2A
            BCS   L032B47
            ADC   $2C
L032B47     ASL
            ASL
            XBA
            AND   #$00FF
            BEQ   L032B53
            CLC
            ADC   L031576
L032B53     STA   $2A
            RTS

L032B56     SEP   #$30
            STZ   L0315AE
            LDA   L0315C6
            DEC
            ASL
            TAX
            PHX
            LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
L032B6C     BIT   L031B3C,X
            BVC   L032B88
            LDA   L031DE2,X
            ORA   #$A0
            STAL  $E1C03E
            LDA   #$03
            STAL  $E1C03D
            STAL  $E1C03D
            STAL  $E1C03D
L032B88     DEX
            DEX
            BPL   L032B6C
            LDA   $01,S
            TAY
L032B8F     LDA   L031B78,Y
            BMI   L032B97
            STA   L031CC0,Y
L032B97     LDA   L031BB4,Y
            STA   L031C0C,Y
            LDA   L031B8C,Y
            STA   L031CAC,Y
            LDA   L031B8D,Y
            STA   L031CAD,Y
            DEY
            DEY
            BPL   L032B8F
            LDAL  CYAREG
            AND   #$7F
            STAL  CYAREG
            LDA   #$0A
L032BB9     DEC
            BNE   L032BB9
            LDAL  CYAREG
            ORA   #$80
            STAL  CYAREG
            LDA   #$E0
            STAL  $E1C03E
            LDAL  $E1C03D
            LDAL  $E1C03D
            BMI   L032BE9
            LSR
            AND   #$1F
            TAY
            LDA   L031DC4,Y
            ASL
            TAX
            BIT   L031B3C,X
            BVS   L032BE9
            TYA
            ASL
            STA   L031578
L032BE9     LDA   $01,S
            TAX
L032BEC     BIT   L031B3C,X
            STZ   L031B3C,X
            BVC   L032BFD
            TXY
            REP   #$30
            JSR   L0328AD
            SEP   #$30
            TYX
L032BFD     DEX
            DEX
            BPL   L032BEC
            PLY
L032C02     JSR   L032EC2
            JSR   L032E2A
            LDA   L031CAC,Y
            ASL
            TAX
            PHY
            JSR   (L032C19,X)
            PLY
            DEY
            DEY
            BPL   L032C02
            REP   #$30
            RTS

L032C19     DA    L032C5E
            DA    L032C5E
            DA    L032C5E
            DA    L032F02
            DA    L032C5E
            DA    L032F02
            DA    L032C5E
            DA    L032C5E
            DA    L032C5E
            DA    L032C5E
            DA    L032C5E
            DA    L032C5E
            DA    L032D84
            DA    L032C5E
            DA    L032C5F
            DA    L032FC1
L032C39     SEP   #$30
            LDA   L0315AE
            INC
            CMP   #$03
            BCC   L032C45
            LDA   #$00
L032C45     STA   L0315AE
            LDA   L0315C6
            DEC
            ASL
            TAY
L032C4E     LDA   L031CAC,Y
            ASL
            TAX
            PHY
            JSR   (L032C6B,X)
            PLY
            DEY
            DEY
            BPL   L032C4E
            REP   #$30
L032C5E     RTS

            MX    %11
L032C5F     LDA   L031CAD,Y
            AND   #$F0
            LSR
            LSR
            LSR
            TAX
            JMP   (L032C8B,X)

L032C6B     DA    L03317F
            DA    L032D9F
            DA    L032DCE
            DA    L032F35
            DA    L03303A
            DA    L032F2F
            DA    L033034
            DA    L0330E3
            DA    L032C5E
            DA    L032C5E
            DA    L032E02
            DA    L032C5E
            DA    L032C5E
            DA    L032C5E
            DA    L032C5F
            DA    L032C5E
L032C8B     DA    L032CAB
            DA    L032D93
            DA    L032DC2
            DA    L032D68
            DA    L0330D0
            DA    L032C5E
            DA    L032C5E
            DA    L03316C
            DA    L032C5E
            DA    L032CC1
            DA    L032DEA
            DA    L032DF6
            DA    L032D71
            DA    L032D31
            DA    L032C5E
            DA    L032C5E
            MX    %11
L032CAB     LDA   L0315A4
            BEQ   L032CC0
            LDX   #$02
            LDA   L031CAD,Y
            BEQ   L032CBD
            CMP   #$01
            BNE   L032CC0
            LDX   #$00
L032CBD     STX   L0315A6
L032CC0     RTS

L032CC1     LDA   L031B50,Y
            ORA   L031B51,Y
            BEQ   L032CDF
            LDA   L0315B0
            BEQ   L032D04
            LDA   L031BE4,Y
            INC
            STA   L031BE4,Y
            LDA   L031CAD,Y
            AND   #$0F
            CMP   L031BE4,Y
            BEQ   L032CE0
L032CDF     RTS

L032CE0     LDA   #$20
            STAL  $E1C03C
            LDA   L031DE2,Y
            ORA   #$A0
            STAL  $E1C03E
            LDA   #$03
            STAL  $E1C03D
            STAL  $E1C03D
            STAL  $E1C03D
            REP   #$30
            JSR   L0328AD
            SEP   #$30
L032D04     LDX   L031BA0,Y
            REP   #$20
            LDA   L031888,X
            STA   L031AB0,Y
            LDA   L0318C8,X
            STA   L031AC4,Y
            LDA   L031808,X
            STA   L031A88,Y
            LDA   L031848,X
            STA   L031A9C,Y
            SEP   #$20
            LDA   #$40
            STA   L031B3C,Y
            LDA   #$00
            STA   L031B64,Y
            STA   L031BE4,Y
            RTS

L032D31     LDA   L031CAD,Y
            AND   #$0F
            CMP   L0315B0
            BEQ   L032D43
            BCC   L032D42
            LDA   #$40
            STA   L031B3C,Y
L032D42     RTS

L032D43     LDA   #$20
            STAL  $E1C03C
            LDA   L031DE2,Y
            ORA   #$A0
            STAL  $E1C03E
            LDA   #$03
            STAL  $E1C03D
            STAL  $E1C03D
            STAL  $E1C03D
            REP   #$30
            JSR   L0328AD
            SEP   #$30
            RTS

L032D68     LDA   L031CAD,Y
            AND   #$0F
            STA   L031BF8,Y
            RTS

L032D71     LDA   L031CAD,Y
            AND   #$0F
            CMP   L0315B0
            BNE   L032D83
            LDA   #$00
            STA   L031CC0,Y
            BRL   L032E2A
L032D83     RTS

L032D84     LDA   L031CAD,Y
            CMP   #$41
            BCC   L032D8D
            LDA   #$40
L032D8D     STA   L031CC0,Y
            BRL   L032E2A
L032D93     LDA   L0315B0
            BNE   L032DC1
            LDA   L031CAD,Y
            AND   #$0F
            BRA   L032DA2
L032D9F     LDA   L031CAD,Y
L032DA2     REP   #$20
            AND   #$00FF
            PHA
            LDA   L031D9C,Y
            SEC
            SBC   $01,S
            BCC   L032DB5
            CMP   #$0071
            BCS   L032DB8
L032DB5     LDA   #$0071
L032DB8     STA   L031D9C,Y
            PLA
            SEP   #$20
            BRL   L032EC2
L032DC1     RTS

L032DC2     LDA   L0315B0
            BNE   L032DC1
            LDA   L031CAD,Y
            AND   #$0F
            BRA   L032DD1
L032DCE     LDA   L031CAD,Y
L032DD1     REP   #$20
            AND   #$00FF
            CLC
            ADC   L031D9C,Y
            CMP   #$0358
            BCC   L032DE2
            LDA   #$0358
L032DE2     STA   L031D9C,Y
            SEP   #$20
            BRL   L032EC2
L032DEA     LDA   L0315B0
            BNE   L032DC1
            LDA   L031CAD,Y
            AND   #$0F
            BRA   L032E14
L032DF6     LDA   L0315B0
            BNE   L032DC1
            LDA   L031CAD,Y
            AND   #$0F
            BRA   L032E11
L032E02     LDA   L031CAD,Y
            BIT   #$F0
            BEQ   L032E0F
            LSR
            LSR
            LSR
            LSR
            BRA   L032E14
L032E0F     AND   #$0F
L032E11     EOR   #$FF
            INC
L032E14     CLC
            ADC   L031CC0,Y
            BPL   L032E1E
            LDA   #$00
            BRA   L032E24
L032E1E     CMP   #$41
            BCC   L032E24
            LDA   #$40
L032E24     STA   L031CC0,Y
            BRL   L032E2A
L032E2A     LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
            LDA   L031DE2,Y
            INC
            ORA   #$40
            STAL  $E1C03E
            REP   #$30
            LDA   L031CC0,Y
            AND   #$00FF
            STA   $2A
            STA   $30
            LDA   L031BDC,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            LDA   $2A
            STA   $2E
            LDA   $30
            STA   $2A
            LDA   L031BDD,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            SEP   #$30
            LDA   $2E
            STAL  $E1C03D
            LDA   $2A
            STAL  $E1C03D
            RTS

L032E77     LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
            LDA   L031DE2,Y
            INC
            ORA   #$40
            STAL  $E1C03E
            TXA
            REP   #$30
            AND   #$00FF
            STA   $30
            STA   $2A
            LDA   L031BDC,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            LDA   $2A
            STA   $2E
            LDA   $30
            STA   $2A
            LDA   L031BDD,Y
            AND   #$00FF
            STA   $2C
            JSR   L032AFF
            SEP   #$30
            LDA   $2E
            STAL  $E1C03D
            LDA   $2A
            STAL  $E1C03D
            RTS

L032EC2     REP   #$30
            LDA   L031D9C,Y
L032EC7     JSR   L0329E6
            SEP   #$30
            LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
            LDA   L031DE2,Y
            TAX
            STAL  $E1C03E
            LDA   $26
            STAL  $E1C03D
            STAL  $E1C03D
            STAL  $E1C03D
            TXA
            ORA   #$20
            STAL  $E1C03E
            LDA   $27
            STAL  $E1C03D
            STAL  $E1C03D
            STAL  $E1C03D
            RTS

L032F02     REP   #$20
            LDA   L031B50,Y
            BNE   L032F0E
            LDA   L031C98,Y
            BEQ   L032F26
L032F0E     STA   L031C98,Y
            CMP   L031D9C,Y
            BEQ   L032F26
            SEP   #$20
            BCS   L032F20
            LDA   #$01
            STA   L031C84,Y
            RTS

L032F20     LDA   #$00
            STA   L031C84,Y
            RTS

            MX    %00
L032F26     LDA   #$0000
            STA   L031C98,Y
            SEP   #$20
            RTS

L032F2F     JSR   L032F42
            BRL   L032E02
L032F35     LDA   L031CAD,Y
            BEQ   L032F42
            STA   L031C70,Y
            LDA   #$00
            STA   L031CAD,Y
L032F42     REP   #$20
            LDA   L031C98,Y
            BEQ   L032F96
            LDX   L031C70,Y
            TXA
            LDX   L031C84,Y
            BNE   L032F6C
            CLC
            ADC   L031D9C,Y
            STA   L031D9C,Y
            CMP   L031C98,Y
            BCC   L032F8C
            LDA   L031C98,Y
            STA   L031D9C,Y
            LDA   #$0000
            STA   L031C98,Y
            BRA   L032F8C
L032F6C     EOR   #$FFFF
            INC
            CLC
            ADC   L031D9C,Y
            STA   L031D9C,Y
            BMI   L032F80
            CMP   L031C98,Y
            BCC   L032F80
            BNE   L032F8C
L032F80     LDA   L031C98,Y
            STA   L031D9C,Y
            LDA   #$0000
            STA   L031C98,Y
L032F8C     LDX   L031BF8,Y
            BNE   L032F99
            SEP   #$20
            BRL   L032EC2
L032F96     SEP   #$20
            RTS

L032F99     LDX   L031C0C,Y
            REP   #$30
            LDA   L031E1E,X
            ASL
            ADC   #L031E3E
            STA   $32
            LDA   L031D9C,Y
            STY   $30
            LDY   #$FFFE
L032FAF     INY
            INY
            CMP   ($32),Y
            BCC   L032FAF
            LDA   ($32),Y
            BEQ   L032FBE
            LDY   $30
            BRL   L032EC7
L032FBE     SEP   #$30
            RTS

L032FC1     LDA   L031CAD,Y
            BEQ   L032FD3
            STA   L03157B
            CMP   #$20
            BCS   L032FD4
            STA   L031579
L032FD0     STA   L0315B2
L032FD3     RTS

L032FD4     STA   L03157A
            LDX   L0315AA
            BEQ   L032FD0
L032FDC     STZ   $2B
            STA   $2A
            REP   #$20
            ASL
            ADC   $2A
            ASL
            ADC   $2A
            ASL
            ADC   $2A
            ASL
            ADC   $2A
            ASL
            ADC   $2A
            ASL
            ADC   $2A
            ASL
            ADC   $2A
            XBA
            ASL
            BCC   L032FFC
            INC
L032FFC     AND   #$01FF
            STA   $2A
            SEP   #$20
            LDAL  $E100CA
            ORA   #$20
            STAL  $E1C03C
            LDA   #$2C
            STAL  $E1C03E
            LDA   $2B
            STAL  $E1C03D
            STAL  $E1C03D
            STA   L03157F
            LDA   #$0C
            STAL  $E1C03E
            LDA   $2A
            STAL  $E1C03D
            STAL  $E1C03D
            STA   L03157E
            RTS

L033034     JSR   L033056
            BRL   L032E02
L03303A     LDA   L031CAD,Y
            BEQ   L033056
            TAX
            AND   #$0F
            BEQ   L033047
            STA   L031C5C,Y
L033047     TXA
            AND   #$F0
            BEQ   L033051
            LSR
            LSR
            STA   L031C5D,Y
L033051     LDA   #$00
            STA   L031CAD,Y
L033056     LDX   L031C48,Y
            JMP   (L03305C,X)

L03305C     DA    L033062
            DA    L03306F
            DA    L033079
L033062     LDA   L031C49,Y
            LSR
            LSR
            AND   #$1F
            TAX
            LDA   L031DFE,X
            BRA   L03307B
L03306F     LDA   L031C49,Y
            ASL
            BCC   L03307B
            EOR   #$FF
            BRA   L03307B
L033079     LDA   #$FF
L03307B     REP   #$20
            AND   #$00FF
            STA   $2A
            LDA   L031C5C,Y
            AND   #$000F
            EOR   #$FFFF
            STA   $2C
            LDA   #$0000
            LSR   $2C
            BCS   L033096
            ADC   $2A
L033096     ASL   $2A
            LSR   $2C
            BCS   L03309E
            ADC   $2A
L03309E     ASL   $2A
            LSR   $2C
            BCS   L0330A6
            ADC   $2A
L0330A6     ASL   $2A
            LSR   $2C
            BCS   L0330AE
            ADC   $2A
L0330AE     ASL
            XBA
            AND   #$00FF
            LDX   L031C49,Y
            BPL   L0330BC
            EOR   #$FFFF
            INC
L0330BC     CLC
            ADC   L031D9C,Y
            REP   #$10
            JSR   L032EC7
            LDA   L031C5D,Y
            CLC
            ADC   L031C49,Y
            STA   L031C49,Y
            RTS

            MX    %11
L0330D0     LDA   L031CAD,Y
            AND   #$0F
            CMP   #$03
            BCS   L0330DD
            ASL
            STA   L031C48,Y
L0330DD     LDA   #$00
            STA   L031CAD,Y
            RTS

L0330E3     LDA   L031CAD,Y
            BEQ   L033105
            TAX
            AND   #$0F
            BEQ   L0330F6
            ASL
            ASL
            ASL
            ASL
            EOR   #$F0
            STA   L031C34,Y
L0330F6     TXA
            AND   #$F0
            BEQ   L033100
            LSR
            LSR
            STA   L031C35,Y
L033100     LDA   #$00
            STA   L031CAD,Y
L033105     LDX   L031C20,Y
            JMP   (L03310B,X)

L03310B     DA    L033111
            DA    L03311E
            DA    L033128
L033111     LDA   L031C21,Y
            LSR
            LSR
            AND   #$1F
            TAX
            LDA   L031DFE,X
            BRA   L03312A
L03311E     LDA   L031C21,Y
            ASL
            BCC   L03312A
            EOR   #$FF
            BRA   L03312A
L033128     LDA   #$FF
L03312A     LDX   L031C34,Y
            STX   $2D
            REP   #$30
            AND   #$00FF
            STA   $2A
            LDA   #$0000
            JSR   L0331F5
            ASL
            ASL
            XBA
            SEP   #$30
            LDX   L031C21,Y
            BPL   L033153
            EOR   #$FF
            INC
            CLC
            ADC   L031CC0,Y
            BPL   L03315D
            LDA   #$00
            BRA   L03315D
L033153     CLC
            ADC   L031CC0,Y
            CMP   #$41
            BCC   L03315D
            LDA   #$40
L03315D     TAX
            JSR   L032E77
            LDA   L031C35,Y
            CLC
            ADC   L031C21,Y
            STA   L031C21,Y
            RTS

L03316C     LDA   L031CAD,Y
            AND   #$0F
            CMP   #$03
            BCS   L033179
            ASL
            STA   L031C20,Y
L033179     LDA   #$00
            STA   L031CAD,Y
            RTS

L03317F     LDA   L031CAD,Y
            BNE   L033185
            RTS

L033185     LDA   L0315AE
            BEQ   L0331D1
            CMP   #$02
            BNE   L033194
            LDA   L031CAD,Y
            ASL
            BRA   L03319A
L033194     LDA   L031CAD,Y
            LSR
            LSR
            LSR
L03319A     LDX   L031C0C,Y
            REP   #$30
            STY   $30
            AND   #$001E
            STA   $2E
            LDA   L031E1E,X
            ASL
            ADC   #L031E3E
            STA   $32
            LDA   L031D9C,Y
            LDY   #$FFFE
L0331B5     INY
            INY
            CMP   ($32),Y
            BCC   L0331B5
            TYA
            CLC
            ADC   $2E
            CMP   #$0048
            BCS   L0331CC
            TAY
            LDA   ($32),Y
            LDY   $30
            BRL   L032EC7
L0331CC     LDY   $30
            SEP   #$30
            RTS

L0331D1     REP   #$30
            LDA   L031D9C,Y
            BRL   L032EC7
            ASL   $2C
            BCS   L0331E0
            ADC   $2A
            ASL
L0331E0     ASL   $2C
            BCS   L0331E7
            ADC   $2A
            ASL
L0331E7     ASL   $2C
            BCS   L0331EE
            ADC   $2A
            ASL
L0331EE     ASL   $2C
            BCS   L0331F5
            ADC   $2A
            ASL
L0331F5     ASL   $2C
            BCS   L0331FC
            ADC   $2A
            ASL
L0331FC     ASL   $2C
            BCS   L033203
            ADC   $2A
            ASL
L033203     ASL   $2C
            BCS   L03320A
            ADC   $2A
            ASL
L03320A     ASL   $2C
            BCS   L033210
            ADC   $2A
L033210     RTS

L033211     LDA   |$0000,Y
            STA   $3D
            LDA   |$0001,Y
            STA   $3D
            LDA   |$0002,Y
            STA   $3D
            LDA   |$0003,Y
            STA   $3D
            LDA   |$0004,Y
            STA   $3D
            LDA   |$0005,Y
            STA   $3D
            LDA   |$0006,Y
            STA   $3D
            LDA   |$0007,Y
            STA   $3D
            LDA   |$0008,Y
            STA   $3D
            LDA   |$0009,Y
            STA   $3D
            LDA   |$000A,Y
            STA   $3D
            LDA   |$000B,Y
            STA   $3D
            LDA   |$000C,Y
            STA   $3D
            LDA   |$000D,Y
            STA   $3D
            LDA   |$000E,Y
            STA   $3D
            LDA   |$000F,Y
            STA   $3D
            LDA   |$0010,Y
            STA   $3D
            LDA   |$0011,Y
            STA   $3D
            LDA   |$0012,Y
            STA   $3D
            LDA   |$0013,Y
            STA   $3D
            LDA   |$0014,Y
            STA   $3D
            LDA   |$0015,Y
            STA   $3D
            LDA   |$0016,Y
            STA   $3D
            LDA   |$0017,Y
            STA   $3D
            LDA   |$0018,Y
            STA   $3D
            LDA   |$0019,Y
            STA   $3D
            LDA   |$001A,Y
            STA   $3D
            LDA   |$001B,Y
            STA   $3D
            LDA   |$001C,Y
            STA   $3D
            LDA   |$001D,Y
            STA   $3D
            LDA   |$001E,Y
            STA   $3D
            LDA   |$001F,Y
            STA   $3D
            LDA   |$0020,Y
            STA   $3D
            LDA   |$0021,Y
            STA   $3D
            LDA   |$0022,Y
            STA   $3D
            LDA   |$0023,Y
            STA   $3D
            LDA   |$0024,Y
            STA   $3D
            LDA   |$0025,Y
            STA   $3D
            LDA   |$0026,Y
            STA   $3D
            LDA   |$0027,Y
            STA   $3D
            LDA   |$0028,Y
            STA   $3D
            LDA   |$0029,Y
            STA   $3D
            LDA   |$002A,Y
            STA   $3D
            LDA   |$002B,Y
            STA   $3D
            LDA   |$002C,Y
            STA   $3D
            LDA   |$002D,Y
            STA   $3D
            LDA   |$002E,Y
            STA   $3D
            LDA   |$002F,Y
            STA   $3D
            LDA   |$0030,Y
            STA   $3D
            LDA   |$0031,Y
            STA   $3D
            LDA   |$0032,Y
            STA   $3D
            LDA   |$0033,Y
            STA   $3D
            LDA   |$0034,Y
            STA   $3D
            LDA   |$0035,Y
            STA   $3D
            LDA   |$0036,Y
            STA   $3D
            LDA   |$0037,Y
            STA   $3D
            LDA   |$0038,Y
            STA   $3D
            LDA   |$0039,Y
            STA   $3D
            LDA   |$003A,Y
            STA   $3D
            LDA   |$003B,Y
            STA   $3D
            LDA   |$003C,Y
            STA   $3D
            LDA   |$003D,Y
            STA   $3D
            LDA   |$003E,Y
            STA   $3D
            LDA   |$003F,Y
            STA   $3D
            LDA   |$0040,Y
            STA   $3D
            LDA   |$0041,Y
            STA   $3D
            LDA   |$0042,Y
            STA   $3D
            LDA   |$0043,Y
            STA   $3D
            LDA   |$0044,Y
            STA   $3D
            LDA   |$0045,Y
            STA   $3D
            LDA   |$0046,Y
            STA   $3D
            LDA   |$0047,Y
            STA   $3D
            LDA   |$0048,Y
            STA   $3D
            LDA   |$0049,Y
            STA   $3D
            LDA   |$004A,Y
            STA   $3D
            LDA   |$004B,Y
            STA   $3D
            LDA   |$004C,Y
            STA   $3D
            LDA   |$004D,Y
            STA   $3D
            LDA   |$004E,Y
            STA   $3D
            LDA   |$004F,Y
            STA   $3D
            LDA   |$0050,Y
            STA   $3D
            LDA   |$0051,Y
            STA   $3D
            LDA   |$0052,Y
            STA   $3D
            LDA   |$0053,Y
            STA   $3D
            LDA   |$0054,Y
            STA   $3D
            LDA   |$0055,Y
            STA   $3D
            LDA   |$0056,Y
            STA   $3D
            LDA   |$0057,Y
            STA   $3D
            LDA   |$0058,Y
            STA   $3D
            LDA   |$0059,Y
            STA   $3D
            LDA   |$005A,Y
            STA   $3D
            LDA   |$005B,Y
            STA   $3D
            LDA   |$005C,Y
            STA   $3D
            LDA   |$005D,Y
            STA   $3D
            LDA   |$005E,Y
            STA   $3D
            LDA   |$005F,Y
            STA   $3D
            LDA   |$0060,Y
            STA   $3D
            LDA   |$0061,Y
            STA   $3D
            LDA   |$0062,Y
            STA   $3D
            LDA   |$0063,Y
            STA   $3D
            LDA   |$0064,Y
            STA   $3D
            LDA   |$0065,Y
            STA   $3D
            LDA   |$0066,Y
            STA   $3D
            LDA   |$0067,Y
            STA   $3D
            LDA   |$0068,Y
            STA   $3D
            LDA   |$0069,Y
            STA   $3D
            LDA   |$006A,Y
            STA   $3D
            LDA   |$006B,Y
            STA   $3D
            LDA   |$006C,Y
            STA   $3D
            LDA   |$006D,Y
            STA   $3D
            LDA   |$006E,Y
            STA   $3D
            LDA   |$006F,Y
            STA   $3D
            LDA   |$0070,Y
            STA   $3D
            LDA   |$0071,Y
            STA   $3D
            LDA   |$0072,Y
            STA   $3D
            LDA   |$0073,Y
            STA   $3D
            LDA   |$0074,Y
            STA   $3D
            LDA   |$0075,Y
            STA   $3D
            LDA   |$0076,Y
            STA   $3D
            LDA   |$0077,Y
            STA   $3D
            LDA   |$0078,Y
            STA   $3D
            LDA   |$0079,Y
            STA   $3D
            LDA   |$007A,Y
            STA   $3D
            LDA   |$007B,Y
            STA   $3D
            LDA   |$007C,Y
            STA   $3D
            LDA   |$007D,Y
            STA   $3D
            LDA   |$007E,Y
            STA   $3D
            LDA   |$007F,Y
            STA   $3D
            LDA   |$0080,Y
            STA   $3D
            LDA   |$0081,Y
            STA   $3D
            LDA   |$0082,Y
            STA   $3D
            LDA   |$0083,Y
            STA   $3D
            LDA   |$0084,Y
            STA   $3D
            LDA   |$0085,Y
            STA   $3D
            LDA   |$0086,Y
            STA   $3D
            LDA   |$0087,Y
            STA   $3D
            LDA   |$0088,Y
            STA   $3D
            LDA   |$0089,Y
            STA   $3D
            LDA   |$008A,Y
            STA   $3D
            LDA   |$008B,Y
            STA   $3D
            LDA   |$008C,Y
            STA   $3D
            LDA   |$008D,Y
            STA   $3D
            LDA   |$008E,Y
            STA   $3D
            LDA   |$008F,Y
            STA   $3D
            LDA   |$0090,Y
            STA   $3D
            LDA   |$0091,Y
            STA   $3D
            LDA   |$0092,Y
            STA   $3D
            LDA   |$0093,Y
            STA   $3D
            LDA   |$0094,Y
            STA   $3D
            LDA   |$0095,Y
            STA   $3D
            LDA   |$0096,Y
            STA   $3D
            LDA   |$0097,Y
            STA   $3D
            LDA   |$0098,Y
            STA   $3D
            LDA   |$0099,Y
            STA   $3D
            LDA   |$009A,Y
            STA   $3D
            LDA   |$009B,Y
            STA   $3D
            LDA   |$009C,Y
            STA   $3D
            LDA   |$009D,Y
            STA   $3D
            LDA   |$009E,Y
            STA   $3D
            LDA   |$009F,Y
            STA   $3D
            LDA   |$00A0,Y
            STA   $3D
            LDA   |$00A1,Y
            STA   $3D
            LDA   |$00A2,Y
            STA   $3D
            LDA   |$00A3,Y
            STA   $3D
            LDA   |$00A4,Y
            STA   $3D
            LDA   |$00A5,Y
            STA   $3D
            LDA   |$00A6,Y
            STA   $3D
            LDA   |$00A7,Y
            STA   $3D
            LDA   |$00A8,Y
            STA   $3D
            LDA   |$00A9,Y
            STA   $3D
            LDA   |$00AA,Y
            STA   $3D
            LDA   |$00AB,Y
            STA   $3D
            LDA   |$00AC,Y
            STA   $3D
            LDA   |$00AD,Y
            STA   $3D
            LDA   |$00AE,Y
            STA   $3D
            LDA   |$00AF,Y
            STA   $3D
            LDA   |$00B0,Y
            STA   $3D
            LDA   |$00B1,Y
            STA   $3D
            LDA   |$00B2,Y
            STA   $3D
            LDA   |$00B3,Y
            STA   $3D
            LDA   |$00B4,Y
            STA   $3D
            LDA   |$00B5,Y
            STA   $3D
            LDA   |$00B6,Y
            STA   $3D
            LDA   |$00B7,Y
            STA   $3D
            LDA   |$00B8,Y
            STA   $3D
            LDA   |$00B9,Y
            STA   $3D
            LDA   |$00BA,Y
            STA   $3D
            LDA   |$00BB,Y
            STA   $3D
            LDA   |$00BC,Y
            STA   $3D
            LDA   |$00BD,Y
            STA   $3D
            LDA   |$00BE,Y
            STA   $3D
            LDA   |$00BF,Y
            STA   $3D
            LDA   |$00C0,Y
            STA   $3D
            LDA   |$00C1,Y
            STA   $3D
            LDA   |$00C2,Y
            STA   $3D
            LDA   |$00C3,Y
            STA   $3D
            LDA   |$00C4,Y
            STA   $3D
            LDA   |$00C5,Y
            STA   $3D
            LDA   |$00C6,Y
            STA   $3D
            LDA   |$00C7,Y
            STA   $3D
            LDA   |$00C8,Y
            STA   $3D
            LDA   |$00C9,Y
            STA   $3D
            LDA   |$00CA,Y
            STA   $3D
            LDA   |$00CB,Y
            STA   $3D
            LDA   |$00CC,Y
            STA   $3D
            LDA   |$00CD,Y
            STA   $3D
            LDA   |$00CE,Y
            STA   $3D
            LDA   |$00CF,Y
            STA   $3D
            LDA   |$00D0,Y
            STA   $3D
            LDA   |$00D1,Y
            STA   $3D
            LDA   |$00D2,Y
            STA   $3D
            LDA   |$00D3,Y
            STA   $3D
            LDA   |$00D4,Y
            STA   $3D
            LDA   |$00D5,Y
            STA   $3D
            LDA   |$00D6,Y
            STA   $3D
            LDA   |$00D7,Y
            STA   $3D
            LDA   |$00D8,Y
            STA   $3D
            LDA   |$00D9,Y
            STA   $3D
            LDA   |$00DA,Y
            STA   $3D
            LDA   |$00DB,Y
            STA   $3D
            LDA   |$00DC,Y
            STA   $3D
            LDA   |$00DD,Y
            STA   $3D
            LDA   |$00DE,Y
            STA   $3D
            LDA   |$00DF,Y
            STA   $3D
            LDA   |$00E0,Y
            STA   $3D
            LDA   |$00E1,Y
            STA   $3D
            LDA   |$00E2,Y
            STA   $3D
            LDA   |$00E3,Y
            STA   $3D
            LDA   |$00E4,Y
            STA   $3D
            LDA   |$00E5,Y
            STA   $3D
            LDA   |$00E6,Y
            STA   $3D
            LDA   |$00E7,Y
            STA   $3D
            LDA   |$00E8,Y
            STA   $3D
            LDA   |$00E9,Y
            STA   $3D
            LDA   |$00EA,Y
            STA   $3D
            LDA   |$00EB,Y
            STA   $3D
            LDA   |$00EC,Y
            STA   $3D
            LDA   |$00ED,Y
            STA   $3D
            LDA   |$00EE,Y
            STA   $3D
            LDA   |$00EF,Y
            STA   $3D
            LDA   |$00F0,Y
            STA   $3D
            LDA   |$00F1,Y
            STA   $3D
            LDA   |$00F2,Y
            STA   $3D
            LDA   |$00F3,Y
            STA   $3D
            LDA   |$00F4,Y
            STA   $3D
            LDA   |$00F5,Y
            STA   $3D
            LDA   |$00F6,Y
            STA   $3D
            LDA   |$00F7,Y
            STA   $3D
            LDA   |$00F8,Y
            STA   $3D
            LDA   |$00F9,Y
            STA   $3D
            LDA   |$00FA,Y
            STA   $3D
            LDA   |$00FB,Y
            STA   $3D
            LDA   |$00FC,Y
            STA   $3D
            LDA   |$00FD,Y
            STA   $3D
            LDA   |$00FE,Y
            STA   $3D
            LDA   |$00FF,Y
            STA   $3D
L033711     RTS



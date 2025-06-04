*
* Crypt v1.0
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	PIF
	dsk	Crypt.l

GSOS	EQU	$E100A8

*------------------------------

	use	4/Ctl.Macs
	use	4/List.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Menu.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*------------------------------

            PHB
            PHK
            PLB
            PHA
            _QDVersion
            PLA
            AND   #$0FFF
            CMP   #$0307
            BCC   L004D
            PEA   ^L004F
            PEA   L004F
            PEA   ^L0079
            PEA   L0079
            _ShowBootInfo
            PEA   ^L006C
            PEA   L006C
            PHA
            _MMStartUp
            PLA
            STA   L03A1
            PHA
            ORA   #$0100
            STA   L03A3
            PEA   ^L0211
            PEA   L0211
            _AcceptRequests
L004D       PLB
            RTL

L004F       ASC   'Crypt                 v01.00'00
L006C       STR   'Tudor~Crypt~'
L0079       DW    $0080       ; Icon type
            DW    $00C8       ; Icon size
            DW    $0014       ; Icon height
            DW    $0014       ; Icon width
            HEX   0000000000000000DDDD  ; Icon image
            HEX   0FFFFFFFFFFFFF0F0DDD
            HEX   0FCCF33F00FCFF0FF0DD
            HEX   0FFFFFF0FF0FFF0000CD
            HEX   0F3F33F0FF0FCFFFF0CD
            HEX   0FFFFF000000FFFFF0CD
            HEX   0FCCCF000000FF33F0CD
            HEX   0FFFFF000000FFFFF0CD
            HEX   0FCCFF000000CCFCF0CD
            HEX   0FFFFFFFFFFFFFFFF0CD
            HEX   0F0FC03F0FF0FC03F0CD
            HEX   0F0F0F0F0FF0F0F0F0CD
            HEX   0F0FC03F0FF0FC03F0CD
            HEX   0FFFFFFFFFFFFFFFF0CD
            HEX   0FC03F0FC03F0FF0F0CD
            HEX   0F0F0F0F0F0F0FF0F0CD
            HEX   0FC03F0FC03F0FF0F0CD
            HEX   0FFFFFFFFFFFFFFFF0CD
            HEX   000000000000000000CD
            HEX   FCCCCCCCCCCCCCCCCCCD
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
L0211       PHD
            TSC
            TCD
            LDA   $0E
            CMP   #$0100
            BNE   L0221
            JSR   L0313
            BRL   L02FF
L0221       CMP   #$0101
            BNE   L022C
            JSR   L0356
            BRL   L02FF
L022C       CMP   #$0108
            BEQ   L0249
            CMP   #$0003
            BNE   L0257
            LDY   #$0002
            LDAL  L03A1
            STA   [$06],Y
            INY
            INY
            LDA   #$0000
            STA   [$06],Y
            BRL   L02FF
L0249       LDA   $0A
            CMPL  L03D5
            BEQ   L025F
            CMPL  L03CD
            BEQ   L025A
L0257       BRL   L0304
L025A       LDA   #$0000
            BRA   L0262
L025F       LDA   #$FFFF
L0262       STAL  L1056
            PEA   $0000
            _GetCurResourceApp
            LDAL  L03A1
            PHA
            _ResourceStartUp
            PEA   $0000
            PEA   $0003
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDAL  L03A1
            PHA
            PEA   $0001
            _LGetPathname2
            _OpenResourceFile
            PLA
            BCS   L02F1
            PHB
            PHK
            PLB
            PEA   $0000
            PEA   $0000
            _GetCtlParamPtr
            PLA
            STA   L10C8
            PLA
            STA   L10C8+2
            PEA   ^L10CC
            PEA   L10CC
            _SetCtlParamPtr
            JSR   L0691
            LDA   L03A3
            PHA
            _DisposeAll
            LDA   L10C8+2
            PHA
            LDA   L10C8
            PHA
            _SetCtlParamPtr
            _InitCursor
            PLB
L02F1       _ResourceShutDown
            _SetCurResourceApp
L02FF       LDA   #$8000
            STA   $10
L0304       PLD
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

L0313       PHB
            PHK
            PLB
            PEA   $800F
            PEA   $0001
            PEA   ^L03B7
            PEA   L03B7
            PEA   ^L03D9
            PEA   L03D9
            PEA   ^L03D1
            PEA   L03D1
            _SendRequest
            PEA   $800F
            PEA   $0001
            PEA   ^L03B7
            PEA   L03B7
            PEA   ^L03E7
            PEA   L03E7
            PEA   ^L03C9
            PEA   L03C9
            _SendRequest
            PLB
            RTS

L0356       PHB
            PHK
            PLB
            PEA   $8014
            PEA   $0001
            PEA   ^L03B7
            PEA   L03B7
            PEA   $0000
            LDA   L03D5
            PHA
            PEA   ^L03C5
            PEA   L03C5
            _SendRequest
            PEA   $8014
            PEA   $0001
            PEA   ^L03B7
            PEA   L03B7
            PEA   $0000
            LDA   L03CD
            PHA
            PEA   ^L03C5
            PEA   L03C5
            _SendRequest
            STZ   L03D5
            STZ   L03CD
            PLB
            RTS

L03A1       DW    $0000
L03A3       DW    $0000
L03A5       STR   'EncryptI'
L03AE       STR   'DecryptI'
L03B7       STR   'Apple~Finder~'
L03C5       DW    $0000
            DB    $00
            DB    $00
L03C9       DB    $00
            DB    $00
            DB    $00
            DB    $00
L03CD       DB    $00
            DB    $00
            DB    $00
            DB    $00
L03D1       DB    $00
            DB    $00
            DB    $00
            DB    $00
L03D5       DB    $00
            DB    $00
            DB    $00
            DB    $00
L03D9       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            ADRL  L03A5
L03E7       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            ADRL  L03AE
L03F5       PHD
            PHX
            PHA
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            PLY
            PLY
            PLD
            RTS

L0406       LDA   L1056
            BNE   L0428
            LDA   #L1131
            STA   L10D4
            LDA   #^L1131
            STA   L10D4+2
            LDA   #L10EC
            STA   L10D0
            LDA   #^L10EC
            STA   L10D0+2
            LDA   #$0003
            BRA   L0443
L0428       LDA   #L10F8
            STA   L10D4
            LDA   #^L10F8
            STA   L10D4+2
            LDA   #L10E0
            STA   L10D0
            LDA   #^L10E0
            STA   L10D0+2
            LDA   #$0002
L0443       PEA   $0000
            PEA   $0000
            LDX   L104C+2
            PHX
            LDX   L104C
            PHX
            PEA   $0000
            PHA
            _GetCtlHandleFromID
            PLA
            STA   L1060
            PLY
            STY   L1060+2
            PHY
            PHA
            _ShowControl
            RTS

L046E       STZ   L11A7
            STZ   L11E1
            LDA   L10C4+2
            STA   L11A1+2
            STA   L120D+2
            LDA   L10C4
            CLC
            ADC   L1066
            STA   L11A1
            STA   L120D
            PHD
            LDA   L10C4+2
            PHA
            LDA   L10C4
            PHA
            TSC
            TCD
            LDY   L1066
            STY   L0636
            LDA   [$01],Y
            INC
            INC
            CLC
            ADC   L1066
            STA   L1066
            TAY
            DEY
            LDX   #$0001
L04AB       DEY
            LDA   [$01],Y
            AND   #$007F
            CMP   #$003A
            BEQ   L04C1
            INX
            CPX   #$0020
            BCC   L04AB
            PLY
            PLY
            PLD
            SEC
            RTS

L04C1       STX   L1163
            STX   L0634
            INY
            LDX   #$0001
            SEP   #$20
L04CD       LDA   [$01],Y
            STA   L1163,X
            INX
            INY
            DEC   L0634
            BNE   L04CD
            REP   #$20
            LDY   L0636
            LDA   L1163
            AND   #$00FF
            STA   L0634
            LDA   [$01],Y
            TAX
            CLC
            SBC   L0634
            STX   L0634
            STA   [$01],Y
            JSL   GSOS
            DW    $2009       ; SetPrefix
            ADRL  L1209
            LDY   L0636
            LDA   L0634
            STA   [$01],Y
            PLY
            PLY
            PLD
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            PEA   $0000
            PEA   $0004
            _GetCtlHandleFromID
            _HiliteControl
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            PEA   $0000
            PEA   $0005
            _GetCtlHandleFromID
            _HiliteControl
            JSR   L0638
            PEA   $0000
            PEA   $0000
            PEA   ^L1211
            PEA   L1211
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0008
            _DoModalWindow
            PLA
            PLX
            PEA   $0000
            PEA   $0000
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            PEA   $0000
            PEA   $0007
            _GetCtlHandleFromID
            _DrawOneCtl
            LDY   #$0038
            LDA   #$0000
L05A7       STA   L0C0F,Y
            DEY
            BNE   L05A7
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCC   L05C1
L05B9       STA   L1054
            JSR   L0E9D
            SEC
            RTS

L05C1       LDA   L119F
            STA   L1197
            STA   L11EB
            LDA   #$0038
            STA   L11F1
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            PHP
            PHA
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1195
            PLA
            PLP
            BCS   L05B9
            LDA   L11AB
            CMP   #$000F
            BNE   L05FF
            LDA   #$0002
L05F5       JSR   L065B
            SEC
            RTS

L05FA       LDA   #$0008
            BRA   L05F5
L05FF       LDA   L1056
            BNE   L0632
            LDA   L0C1D
            CMP   #$4320
            BNE   L05FA
            LDA   L0C1F
            CMP   #$59D2
            BNE   L05FA
            LDA   L0C21
            CMP   #$54D0
            BNE   L05FA
            LDA   L0C2D
            STA   L0C0D
            LDY   #$0016
L0625       LDA   L0C2F,Y
            EOR   L0C0D
            STA   L0C2F,Y
            DEY
            DEY
            BPL   L0625
L0632       CLC
            RTS

L0634       BRK   $00
L0636       BRK   $00
L0638       PEA   $0000
            PEA   $0000
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            PEA   $0000
            PEA   $0009
            _GetCtlHandleFromID
            _HideControl
            RTS

L065B       STA   L0680
            _InitCursor
            PHA
            PEA   $0037
            PEA   ^L10CC
            PEA   L10CC
            LDA   L0680+2
            PHA
            LDA   L0680
            PHA
            _AlertWindow
            PLA
            RTS

L0680       ADRL  $00000000
L0684       LDA   #$00E0
            STA   L1048
            LDA   #$800C
            STA   L104A
            RTS

L0691       _WaitCursor
            JSR   L0684
            PEA   $8004
            PEA   $0001
            PEA   ^L03B7
            PEA   L03B7
            PEA   $0000
            PEA   $0000
            PEA   ^L10B8
            PEA   L10B8
            _SendRequest
            BCC   L06BD
L06BC       RTS

L06BD       LDA   L10BA
            BNE   L06BC
            LDA   L10C2
            PHA
            LDA   L10C0
            PHA
            _HLock
            LDA   L10C0
            LDX   L10C2
            JSR   L03F5
            STX   L10C4+2
            STA   L10C4
            PHD
            PHX
            PHA
            TSC
            TCD
            LDA   [$01]
            PLY
            PLY
            PLD
            CMP   #$0000
            BNE   L06F7
            LDA   #$0001
            JSR   L065B
            BRA   L0746
L06F7       STA   L1064
            LDA   #$0002
            STA   L1066
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0E8C
            PEA   L0E8C
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0064
            PEA   $800E
            _NewWindow2
            STA   L1054
            PLA
            STA   L104C
            PLA
            STA   L104C+2
            BCC   L076B
            BRA   L0743
            STA   L1054
L0743       JSR   L0E9D
L0746       _WaitCursor
            LDA   L10C0
            ORA   L10C2
            BEQ   L076A
            LDA   L10C2
            PHA
            LDA   L10C0
            PHA
            _DisposeHandle
            STZ   L10C0
            STZ   L10C2
L076A       RTS

L076B       PHA
            PHA
            _GetPort
            PLA
            STA   L1050
            PLA
            STA   L1050+2
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            _SetPort
            JSR   L0406
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            _ShowWindow
            STZ   L105C
            STZ   L105E
            STZ   L105A
L07A6       LDA   L105A
            BNE   L07CE
            STZ   L1058
            JSR   L046E
            BCC   L07BA
            DEC   L1064
            BNE   L07A6
            BRA   L07CE
L07BA       _InitCursor
L07C1       LDA   L1058
            BNE   L07C9
            BRL   L07EF
L07C9       DEC   L1064
            BNE   L07A6
L07CE       LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            _CloseWindow
            LDA   L1050+2
            PHA
            LDA   L1050
            PHA
            _SetPort
            BRL   L0746
L07EF       PEA   $0000
            PEA   $0000
            PEA   ^L1211
            PEA   L1211
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0008
            _DoModalWindow
            PLA
            PLX
            CMP   #$0000
            BEQ   L082E
            CMP   #$0006
            BCS   L082E
            DEC
            ASL
            TAX
            JSR   (L0831,X)
            LDA   L105A
            BNE   L07CE
L082E       BRL   L07C1
L0831       DA    L0E0C
            DA    L0952
            DA    L0849
            DA    L083B
            DA    L0DB0
L083B       _WaitCursor
            DEC   L1058
            DEC   L105A
            RTS

L0849       _WaitCursor
            JSR   L0E6F
            CMP   L0C0D
            BNE   L0872
            LDA   L10A0
            AND   #$00FF
            TAX
            SEP   #$20
L0861       LDA   L10A0,X
            CMP   L0C2F,X
            BNE   L0870
            DEX
            BPL   L0861
            REP   #$20
            BRA   L0883
L0870       REP   #$20
L0872       LDA   #$0003
L0875       JSR   L065B
L0878       JSR   L0638
            _InitCursor
            RTS

L0883       LDA   L0C0D
            STA   L1086
            LDA   L0C23
            STA   L107C
            LDA   L0C25
            STA   L107E
            LDA   L0C25+2
            STA   L107E+2
            _WaitCursor
            JSR   L0F61
            BCS   L0878
            _WaitCursor
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCC   L08BD
            BRL   L093D
L08BD       LDA   L119F
            STA   L1197
            STA   L11EB
            LDA   #$0038
            STA   L11F1
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            BCS   L092D
            LDA   L11B1
            STA   L1193
            LDA   L107C
            STA   L118D
            LDA   L107E
            STA   L118F
            LDA   L107E+2
            STA   L118F+2
            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  L11E3
            JSL   GSOS
            DW    $2001       ; Create
            ADRL  L1185
            BCS   L091E
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L11D7
            BCS   L091E
            LDA   L11D9
            STA   L119B
            STA   L11FB
            BRL   L0A77
L091E       STA   L1054
            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  L11E3
            BRA   L0930
L092D       STA   L1054
L0930       JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1195
            JSR   L0E9D
L093D       LDA   L1044+2
            PHA
            LDA   L1044
            PHA
            _DisposeHandle
            LDA   #$0006
            BRL   L0875
L0952       _WaitCursor
            LDA   L11C7
            ORA   L11C7+2
            BNE   L0972
            LDA   #$0007
L0964       JSR   L065B
L0967       JSR   L0638
            _InitCursor
            RTS

L0972       JSR   L0F61
            BCS   L0967
            _WaitCursor
            JSR   L0E6F
            STA   L1086
            LDY   #$0016
L0987       LDA   L10A0,Y
            EOR   L1086
            STA   L1088,Y
            DEY
            DEY
            BPL   L0987
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCC   L09A3
            BRL   L0A5C
L09A3       LDA   L119F
            STA   L1197
            STA   L11EB
            LDA   L11B1
            STA   L1193
            LDA   L1048
            STA   L118D
            LDA   L104A
            STA   L118F
            STZ   L118F+2
            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  L11E3
            JSL   GSOS
            DW    $2001       ; Create
            ADRL  L1185
            BCS   L0A4D
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L11D7
            BCS   L0A3B
            LDA   L11D9
            STA   L119B
            STA   L11FB
            LDA   L11AB
            STA   L107C
            LDA   L11AD
            STA   L107E
            LDA   L11AD+2
            STA   L107E+2
            PEA   ^L1068
            PEA   L1068
            PEA   ^L0C0F
            PEA   L0C0F
            PEA   $0000
            PEA   $0038
            _BlockMove
            LDA   #$0038
            STA   L1201
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L11F9
            BCS   L0A2C
            BRL   L0A77
L0A2C       STA   L1054
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1199
            BRA   L0A3E
L0A3B       STA   L1054
L0A3E       JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  L11E3
            JSR   L0E9D
            BRA   L0A62
L0A4D       STA   L1054
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1195
            BRA   L0A5F
L0A5C       STA   L1054
L0A5F       JSR   L0E9D
L0A62       LDA   L1044+2
            PHA
            LDA   L1044
            PHA
            _DisposeHandle
            LDA   #$0006
            BRL   L0964
L0A77       _WaitCursor
            JSR   L0D0F
            STZ   L0C0B
            LDA   #$0100
            STA   L11F1
            JSL   L0E8C
L0A8E       INC   L0C0B
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            BCC   L0ADF
            CMP   #$004C
            BEQ   L0B0C
L0AA2       STA   L1054
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1195
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1199
            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  L11E3
            JSR   L0E9D
            LDA   #$0006
L0AC9       JSR   L065B
            JSR   L0638
            LDA   L1044+2
            PHA
            LDA   L1044
            PHA
            _DisposeHandle
            RTS

L0ADF       LDY   #$0000
L0AE2       LDA   L0C0F,Y
            EOR   L1086
            STA   L0C0F,Y
            INY
            INY
            CPY   #$0100
            BCC   L0AE2
            LDA   L11F5
            STA   L1201
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L11F9
            BCS   L0AA2
            LDA   L0C0B
            JSR   L0D9B
            BRA   L0A8E
L0B0C       LDA   L11B1
            CMP   #$0005
            BNE   L0B8C
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1195
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1199
            LDA   #$0001
            STA   L11A7
            STA   L11E1
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCS   L0B6F
            LDA   L119F
            STA   L11EB
            STA   L1197
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L11D7
            BCS   L0B6F
            LDA   L11D9
            STA   L119B
            STA   L11FB
L0B5B       INC   L0C0B
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            BCC   L0B72
            CMP   #$004C
            BEQ   L0B8C
L0B6F       BRL   L0AA2
L0B72       LDA   L11F5
            STA   L1201
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L11F9
            BCS   L0B6F
            LDA   L0C0B
            JSR   L0D9B
            BRA   L0B5B
L0B8C       JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1195
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  L1199
            PHD
            LDA   L1187+2
            PHA
            LDA   L1187
            PHA
            TSC
            TCD
            LDA   [$01]
            STA   L0C05
            CMP   #$0003
            BCC   L0BF1
            TAY
L0BB6       LDA   [$01],Y
            AND   #$007F
            CMP   #$003A
            BEQ   L0BC6
            DEY
            CPY   #$0003
            BCS   L0BB6
L0BC6       DEY
            DEY
            TYA
            STA   [$01]
            PEA   $800C
            PEA   $0001
            PEA   ^L03B7
            PEA   L03B7
            LDA   L1187+2
            PHA
            LDA   L1187
            PHA
            PEA   ^L0C07
            PEA   L0C07
            _SendRequest
            LDA   L0C05
            STA   [$01]
L0BF1       PLA
            PLA
            PLD
            DEC   L1058
            LDA   #$0004
            LDX   L1056
            BNE   L0C02
            LDA   #$0005
L0C02       BRL   L0AC9
L0C05       DW    $0000
L0C07       DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C0B       DB    $00
            DB    $00
L0C0D       DW    $0000
L0C0F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C1D       DB    $00
            DB    $00
L0C1F       DB    $00
            DB    $00
L0C21       DB    $00
            DB    $00
L0C23       DW    $0000
L0C25       ADRL  $00000000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C2D       DB    $00
            DB    $00
L0C2F       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0D0F       LDA   L11C7
            CLC
            ADC   L11CF
            STA   L0D97
            LDA   L11C7+2
            ADC   L11CF+2
            STA   L0D97+2
            PHA
            PHA
            PHA
            PHA
            LDA   L0D97+2
            PHA
            LDA   L0D97
            PHA
            PEA   $0000
            PEA   $0100
            _LongDivide
            PLY
            PLX
            PLA
            PLA
            PEA   $0000
            PHY
            PEA   $0000
            PEA   $0000
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            PEA   $0000
            PEA   $0009
            _GetCtlHandleFromID
            PLA
            STA   L0DAC
            PLA
            STA   L0DAC+2
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _SetCtlTitle
            PEA   $0000
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _SetCtlValue
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _ShowControl
            RTS

L0D97       ADRL  $00000000
L0D9B       PHA
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _SetCtlValue
            RTS

L0DAC       ADRL  $00000000
L0DB0       LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            PEA   $0000
            PEA   $0005
            PEA   ^L10A0
            PEA   L10A0
            _GetLETextByID
            LDA   L10A0
            AND   #$00FF
            BEQ   L0DF1
            LDA   L105E
            BNE   L0E0B
            PEA   $0000
            LDA   L1060+2
            PHA
            LDA   L1060
            PHA
            _HiliteControl
            LDA   #$FFFF
            STA   L105E
            RTS

L0DF1       LDA   L105E
            BEQ   L0E0B
            PEA   $00FF
            LDA   L1060+2
            PHA
            LDA   L1060
            PHA
            _HiliteControl
            STZ   L105E
L0E0B       RTS

L0E0C       PEA   $0000
            PEA   $0000
            LDA   L104C+2
            PHA
            LDA   L104C
            PHA
            PEA   $0000
            PEA   $0066
            _GetCtlHandleFromID
            PLA
            STA   L0E6B
            PLA
            STA   L0E6B+2
            BCS   L0E6A
            LDA   L105C
            BEQ   L0E49
            STZ   L105C
            LDA   L0E6B+2
            PHA
            LDA   L0E6B
            PHA
            _HideControl
            RTS

L0E49       DEC   L105C
            LDA   L0E6B+2
            PHA
            LDA   L0E6B
            PHA
            _ShowControl
            LDA   L0E6B+2
            PHA
            LDA   L0E6B
            PHA
            _DrawOneCtl
L0E6A       RTS

L0E6B       ADRL  $00000000
L0E6F       LDA   L10A0
            AND   #$00FF
            BEQ   L0E8B
            TAY
            XBA
            LDX   #$0001
            SEP   #$20
L0E7E       EOR   L10A0,X
            CLC
            ADC   L10A0,X
            INX
            DEY
            BNE   L0E7E
            REP   #$20
L0E8B       RTS

L0E8C       PHA
            PHA
            _GetPort
            _DrawControls
            RTL

L0E9D       PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L1054
            PHA
            _InitCursor
            _ErrorWindow
            PLA
            SEC
            RTS

L0EBE       STZ   L0F5B
            STZ   L0F5D
            STZ   L0F5D+2
            PHA
            _SFStatus
            PLA
            BCS   L0ED4
            BNE   L0F2B
L0ED4       PEA   $0017
            PEA   $0101
            _LoadOneTool
            BCC   L0EEB
L0EE3       STA   L1054
            JSR   L0E9D
            SEC
            RTS

L0EEB       PHA
            PHA
            PEA   $0000
            PEA   $0100
            LDA   L03A3
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLX
            PLA
            BCS   L0EE3
            STX   L0F5D
            STA   L0F5D+2
            PHD
            PHA
            PHX
            TSC
            TCD
            LDA   [$01]
            TAX
            PLY
            PLY
            PLD
            LDA   L03A1
            PHA
            PHX
            _SFStartUp
            INC   L0F5B
L0F2B       CLC
            RTS

L0F2D       LDA   L0F5B
            BEQ   L0F5A
            _SFShutDown
            PEA   $0017
            _UnloadOneTool
            LDA   L0F5D
            ORA   L0F5D+2
            BEQ   L0F5A
            LDA   L0F5D+2
            PHA
            LDA   L0F5D
            PHA
            _DisposeHandle
L0F5A       RTS

L0F5B       DW    $0000
L0F5D       ADRL  $00000000
L0F61       JSR   L0EBE
            BCC   L0F72
            RTS

L0F67       STA   L1054
            JSR   L0E9D
            JSR   L0F2D
            SEC
            RTS

L0F72       PEA   $0078
            PEA   $0028
            PEA   $0000
            LDA   L1056
            BNE   L0F88
            PEA   ^L0FF9
            PEA   L0FF9
            BRA   L0F8E
L0F88       PEA   ^L1012
            PEA   L1012
L0F8E       PEA   $0000
            PEA   ^L102A
            PEA   L102A
            PEA   ^L1034
            PEA   L1034
            _SFPutFile2
            BCS   L0F67
            _WaitCursor
            LDA   L1034
            BNE   L0FB7
            JSR   L0F2D
            SEC
            RTS

L0FB7       LDA   L103E+2
            PHA
            LDA   L103E
            PHA
            _DisposeHandle
            LDA   L1044+2
            PHA
            LDA   L1044
            PHA
            _HLock
            LDX   L1044+2
            LDA   L1044
            JSR   L03F5
            INC
            INC
            STA   L11E5
            STA   L11DB
            STA   L1187
            STX   L11E5+2
            STX   L11DB+2
            STX   L1187+2
            JSR   L0F2D
            CLC
            RTS

            DW    $0000
L0FF9       STR   'Save Descrypted File as:'
L1012       STR   'Save Encrypted File as:'
L102A       STRL  'Untitled'
L1034       DW    $0000
            DW    $0000
            ADRL  $00000000
            DW    $0003
L103E       ADRL  $00000000
            DW    $0003
L1044       ADRL  $00000000
L1048       DW    $0000
L104A       DW    $0000
L104C       ADRL  $00000000
L1050       ADRL  $00000000
L1054       DW    $0000
L1056       DW    $0000
L1058       DW    $0000
L105A       DW    $0000
L105C       DW    $0000
L105E       DW    $0000
L1060       ADRL  $00000000
L1064       DW    $0000
L1066       DW    $0000
L1068       ASC   'ENCRYPTED FILE C'
            ASC   "R"
            ASC   'Y'
            ASC   "P"
            ASC   'T'
L107C       DW    $0000
L107E       ADRL  $00000000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1086       DB    $00
            DB    $00
L1088       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L10A0       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L10B8       DB    $00
            DB    $00
L10BA       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L10C0       DB    $00
            DB    $00
L10C2       DB    $00
            DB    $00
L10C4       ADRL  $00000000
L10C8       ADRL  $00000000
L10CC       ADRL  L1163
L10D0       ADRL  L10DC
L10D4       ADRL  L10DC
            ADRL  L10A0
L10DC       STR   '???'
L10E0       STR   'Encrypting '
L10EC       STR   'Decrypting '
L10F8       STR   'You must remember the key in order to decrypt this file.'
L1131       STR   'Enter the key that was used to encrypt this file.'
L1163       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1185       DW    $0005       ; Parms for Create
L1187       ADRL  $00000000   ;  file name
            DW    $00C3       ;  access
L118D       DW    $0000       ;  file type
L118F       ADRL  $00000000   ;  aux type
L1193       DW    $0000       ;  storage
L1195       DW    $0001       ; Parms for Close
L1197       DW    $0000       ;  ref num
L1199       DW    $0001       ; Parms for Close
L119B       DW    $0000       ;  ref num
L119D       DW    $000E       ; Parms for Open
L119F       DW    $0000       ;  ref num
L11A1       ADRL  $00000000   ;  path name
            DW    $0001       ;  req access
L11A7       DW    $0000       ;  res num
            DW    $0000       ;  access
L11AB       DW    $0000       ;  file type
L11AD       ADRL  $00000000   ;  aux type
L11B1       DW    $0000       ;  storage
            DS    8           ;  creation date
            DS    8           ;  modification date
            ADRL  $00000000   ;  option list
L11C7       ADRL  $00000000   ;  end of file
            ADRL  $00000000   ;  blocks used
L11CF       ADRL  $00000000   ;  resource eof
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L11D7       DW    $0004       ; Parms for Open
L11D9       DW    $0000       ;  ref num
L11DB       ADRL  $00000000   ;  path name
            DW    $0003       ;  req access
L11E1       DW    $0000       ;  res num
L11E3       DW    $0001       ; Parms for Destroy
L11E5       ADRL  $00000000   ;  file name
L11E9       DW    $0004       ; Parms for Read
L11EB       DW    $0000       ;  ref num
            ADRL  L0C0F       ;  buffer ptr
L11F1       ADRL  $00000100   ;  request count
L11F5       ADRL  $00000000   ;  transfer count
L11F9       DW    $0004       ; Parms for Write
L11FB       DW    $0000       ;  ref num
            ADRL  L0C0F       ;  buffer ptr
L1201       ADRL  $00000100   ;  request count
            ADRL  $00000000   ;  transfer count
L1209       DW    $0002       ; Parms for SetPrefix
            DW    $0008       ;  prefix num
L120D       ADRL  $00000000   ;  prefix ptr
L1211       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00


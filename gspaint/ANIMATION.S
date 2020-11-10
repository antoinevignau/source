*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	ANIMATION.E
	 use	ANIMATION.X
	 lst	off
	 
*-------------------------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/List.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-------------------------------

         BRA   L080004
         LDA   $A5
L080004  PHB
         PHK
         PLB
         _HideCursor
         PEA   $0000
         PEA   ^L080F23
         PEA   L080F23
         _GetColorTable
         LDA   $DE
         PHA
         LDA   $DC
         PHA
         _HUnlock
         LDA   $DE
         PHA
         LDA   $DC
         PHA
         _DisposeHandle
         LDA   $E2
         PHA
         LDA   $E0
         PHA
         _HUnlock
         LDA   $E2
         PHA
         LDA   $E0
         PHA
         _DisposeHandle
         LDA   $E6
         PHA
         LDA   $E4
         PHA
         _HUnlock
         LDA   $E6
         PHA
         LDA   $E4
         PHA
         _DisposeHandle
         LDAL  L0196CB
         CMP   #$011C
         BNE   L080078
         BRL   L0800C0
L080078  LDA   $EE
         PHA
         LDA   $EC
         PHA
         _HUnlock
         LDA   $EE
         PHA
         LDA   $EC
         PHA
         _DisposeHandle
         JSR   L0808D4
         LDAL  L019699
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L0800A7
         BRK   $A1
L0800A7  LDA   $0A
         STA   $EC
         LDA   $0C
         STA   $EE
         LDA   [$0A]
         STAL  L019976
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L019978
         BRA   L0800C3
L0800C0  JSR   L080162
L0800C3  PEA   $0000
         PEA   ^L080F23
         PEA   L080F23
         _SetColorTable
         _InitPalette
         _DrawMenuBar
         LDA   #$459E
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L0800F2
         BRK   $A2
L0800F2  LDA   $0A
         STA   $DC
         LDA   $0C
         STA   $DE
         LDA   [$0A]
         STAL  L0199AC
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L0199AE
         LDA   #$459E
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L08011A
         BRK   $A3
L08011A  LDA   $0A
         STA   $E0
         LDA   $0C
         STA   $E2
         LDA   [$0A]
         STAL  L019970
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L019972
         LDA   #$459E
         LDX   #$0000
         LDY   #$8010
         JSL   L018717
         BCC   L080142
         BRK   $A4
L080142  LDA   $0A
         STA   $E4
         LDA   $0C
         STA   $E6
         LDA   [$0A]
         STAL  L019984
         LDY   #$0002
         LDA   [$0A],Y
         STAL  L019986
         _ShowCursor
         PLB
         RTL

L080162  PEA   $0000
         PEA   ^L080F23
         PEA   L080F23
         _GetColorTable
         _ShowCursor
         LDAL  L019976
         STA   $C4
         LDAL  L019978
         STA   $C6
         PEA   $001E
         PEA   $001E
         PEA   ^L01068A
         PEA   L01068A
*         PEA   ^L080683
*         PEA   L080683
	 pea   $0000
	 pea   $0000
         PEA   ^L080F1D
         PEA   L080F1D
         PEA   ^L0198D9
         PEA   L0198D9
         _SFGetFile
         JSL   L010D82
         LDAL  L0198D9
         BNE   L0801B5
L0801B4  RTS

L0801B5  LDAL  L0198EF
         AND   #$003F
         PHA
         TAX
L0801BE  LDAL  L0198EF,X
         AND   #$007F
         CMP   #$002F
         BEQ   L0801CD
         DEX
         BNE   L0801BE
L0801CD  PHX
         LDY   #$FFFF
         DEX
L0801D2  INX
         INX
         INY
         INY
         LDAL  L0198EF,X
         STA   L080DA5,Y
         TXA
         CMP   $03,S
         BCC   L0801D2
         LDA   $03,S
         SEC
         SBC   $01,S
         PHA
         LDA   L080DA5
         AND   #$FF00
         ORA   $01,S
         STA   L080DA5
         PLA
         PLA
         PLA
         LDA   L080DA5
         AND   #$000F
         TAX
L0801FD  LDA   L080DA5,X
         AND   #$007F
         CMP   #$0030
         BCC   L080210
         CMP   #$003A
         BCS   L080210
         DEX
         BNE   L0801FD
L080210  CPX   #$0000
         BEQ   L0801B4
         PHX
         LDA   L080DA5
         AND   #$FF00
         ORA   $01,S
         STA   L080DA5
         PLA
         _HideCursor
         LDA   #$2000
         STA   $C8
         LDA   #$00E1
         STA   $CA
         PEA   $0000
         PEA   $0000
         PHA
         PHA
         _MaxBlock
         PLA
         PLX
         SEC
         SBC   #$1000
         BCS   L08024B
         DEX
L08024B  PHX
         PHA
         STA   L080DC5
         STX   L080DC5+2
         LDAL  L01967F
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L08026C
         BRK   $02
L08026C  PLA
         STA   $B8
         PLA
         STA   $BA
         LDA   [$B8]
         STA   $BC
         LDY   #$0002
         LDA   [$B8],Y
         STA   $BE
         LDA   #$0004
         STA   L080DBF
         STA   [$BC]
         LDY   #$0002
         LDA   #$0000
         STA   L080DBF+2
         STA   [$BC],Y
         JSR   L080B52
         LDA   L080F13
         CMP   #$0002
         BCS   L08029E
         JMP   L0804EC

L08029E  JSR   L080D95
         LDA   #$0000
         STA   L080DBD
         LDA   [$AC]
         AND   #$FF0F
         STA   [$AC]
         LDY   #$000E
L0802B1  LDA   [$AC],Y
         STA   L080E45,Y
         TYX
         STAL  L0198EF,X
         DEY
         DEY
         BPL   L0802B1
         LDY   #$0010
         LDA   [$AC],Y
         AND   #$00FF
         STA   L080F1B
         JSR   L08058F
         CLC
         LDA   #$0012
         ADC   $AC
         STA   $AC
         LDA   $AE
         ADC   #$0000
         STA   $AE
         INC   L080DBD
L0802DF  LDA   [$AC]
         AND   #$FF0F
         STA   [$AC]
         LDY   #$000E
L0802E9  LDA   [$AC],Y
         TYX
         STAL  L0198EF,X
         DEY
         DEY
         BPL   L0802E9
         LDY   #$0010
         LDA   [$AC],Y
         AND   #$00FF
         JSR   L08059E
         JSR   L0805BC
         BCC   L080307
         BRL   L08054C
L080307  LDA   L080DBF
         TAY
         LDA   #$0000
         STA   [$BC],Y
         JSR   L0805E8
         BCC   L080318
         BRL   L08054C
L080318  LDA   #$0012
         CLC
         ADC   $AC
         STA   $AC
         LDA   $AE
         ADC   #$0000
         STA   $AE
         INC   L080DBD
         LDA   L080DBD
         CMP   L080F13
         BNE   L0802DF
         LDX   #$000E
L080335  LDA   L080E45,X
         STAL  L0198EF,X
         DEX
         DEX
         BPL   L080335
         LDA   L080F1B
         JSR   L08059E
         JSR   L0805BC
         BCC   L08034E
         BRL   L08054C
L08034E  LDA   L080DBF
         TAY
         LDA   #$0000
         STA   [$BC],Y
         JSR   L0805E8
         BCC   L08035F
         BRL   L08054C
L08035F  PEA   $0000
         PEA   ^L080F23
         PEA   L080F23
         _SetColorTable
         PEA   $0000
         PEA   $0000
         _RefreshDesktop
         _InitPalette
         _DrawMenuBar
         _ShowCursor
         JSL   L010D82
         LDA   L080DB7
         AND   #$000F
         PHA
         LDA   L080DA5
         AND   #$000F
         CMP   #$000A
         BCC   L0803AA
         LDA   #$000A
L0803AA  TAX
         CLC
         ADC   $01,S
         PHA
         LDA   L080DA5
         AND   #$FF00
         ORA   $01,S
         STA   L080DA5
         PLA
         LDY   #$0001
L0803BE  LDA   L080DB7,Y
         STA   L080DA6,X
         INX
         INX
         INY
         INY
         TYA
         CMP   $01,S
         BCC   L0803BE
         BEQ   L0803BE
         PLA
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         JSR   L0806D5
         PEA   $0014
         PEA   $001E
         PEA   ^L0106A9
         PEA   L0106A9
         PEA   ^L080DA5
         PEA   L080DA5
         PEA   $000F
         PEA   ^L0198D9
         PEA   L0198D9
         _SFPutFile
         JSL   L010D82
         _ShowCursor
         LDAL  L0198D9
         BNE   L08041A
         BRL   L0804EC
L08041A  PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         JSL   GSOS
         DW    $0001      ; Create
         ADRL  L080E69
         JSL   GSOS
         DW    $0005      ; SetFileInfo
         ADRL  L080E69
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L080E7F
         LDA   L080E7F
         STA   L080E89
         STA   L080E8F
         STA   L080E9D
         STA   L080EAB
         STA   L080EB9
         JSL   GSOS
         DW    $0018      ; SetEOF
         ADRL  L080E89
         LDA   L080DBF
         STA   L080F0F
         LDA   L080DBF+2
         STA   L080F0F+2
         LDA   [$B8]
         STA   L080EBB
         STA   $BC
         LDY   #$0002
         LDA   [$B8],Y
         STA   L080EBB+2
         STA   $BE
         LDA   L080DBF
         STA   [$BC]
         LDA   L080DBF+2
         STA   [$BC],Y
         LDA   $C4
         STA   L080E91
         LDA   $C6
         STA   L080E91+2
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L080E8F
         BCC   L0804A1
         BRL   L080521
L0804A1  JSL   GSOS
         DW    $0013      ; Write
         ADRL  L080E9D
         BCS   L080521
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L080EAB
         BCS   L080521
         LDA   L080F0F
         STA   L080EBF
         LDA   L080F0F+2
         STA   L080EBF+2
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L080EB9
         BCS   L080521
         JSL   GSOS
         DW    $0014      ; Close
         ADRL  L080E7F
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
L0804EC  LDA   $BA
         PHA
         LDA   $B8
         PHA
         _HUnlock
         LDA   $BA
         PHA
         LDA   $B8
         PHA
         _DisposeHandle
         LDA   $AA
         PHA
         LDA   $A8
         PHA
         _HUnlock
         LDA   $AA
         PHA
         LDA   $A8
         PHA
         _DisposeHandle
         RTS

L080521  STA   L0808D2
         JSL   GSOS
         DW    $0014      ; Close
         ADRL  L080E7F
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         LDX   #$0000
         LDA   L0808D2
         JSL   L017D37
         BRL   L0804EC
L08054C  PEA   $0000
         PEA   ^L080F23
         PEA   L080F23
         _SetColorTable
         PEA   $0000
         PEA   $0000
         _RefreshDesktop
         _InitPalette
         _DrawMenuBar
         _ShowCursor
         JSL   L010D82
         LDX   #$0002
         LDA   L0808D2
         JSL   L017D37
         BRL   L0804EC
L08058F  JSR   L08059E
         LDY   #$7E1E
L080595  LDA   [$C4],Y
         STA   [$C8],Y
         DEY
         DEY
         BPL   L080595
         RTS

L08059E  STA   L080E67
         CMP   #$0006
         BEQ   L0805B7
         CMP   #$00C1
         BEQ   L0805B7
         CMP   #$00C0
         BEQ   L0805B2
         BRK   $FF
L0805B2  JSL   L012828
         RTS

L0805B7  JSL   L01273C
         RTS

L0805BC  LDY   #$0000
L0805BF  LDA   [$C4],Y
         CMP   [$C8],Y
         BEQ   L0805DF
         STA   [$C8],Y
         TAX
         PHY
         LDA   L080DBF
         TAY
         LDA   $01,S
         STA   [$BC],Y
         INY
         INY
         TXA
         STA   [$BC],Y
         JSR   L0805E8
         BCC   L0805DE
         PLA
         SEC
         RTS

L0805DE  PLY
L0805DF  INY
         INY
         CPY   #$7E20
         BNE   L0805BF
         CLC
         RTS

L0805E8  LDA   L080DBF
         CLC
         ADC   #$0004
         STA   L080DBF
         BCC   L0805F9
         INC   L080DBF+2
         INC   $BE
L0805F9  LDA   L080DBF+2
         CMP   L080DC5+2
         BCC   L08065A
         BNE   L08060B
         LDA   L080DBF
         CMP   L080DC5
         BCC   L08065A
L08060B  LDA   $BA
         PHA
         LDA   $B8
         PHA
         _HUnlock
         LDA   L080DC5
         CLC
         ADC   #$2000
         STA   L080DC5
         BCC   L080627
         INC   L080DC5+2
L080627  LDA   L080DC5+2
         PHA
         LDA   L080DC5
         PHA
         LDA   $BA
         PHA
         LDA   $B8
         PHA
         _SetHandleSize
         BCS   L08065C
         LDA   $BA
         PHA
         LDA   $B8
         PHA
         _HLock
         LDA   [$B8]
         STA   $BC
         LDY   #$0002
         LDA   [$B8],Y
         CLC
         ADC   L080DBF+2
         STA   $BE
L08065A  CLC
         RTS

L08065C  STA   L0808D2
         LDA   $BA
         PHA
         LDA   $B8
         PHA
         _HLock
         LDAL  L019EE0+2
         PHA
         LDAL  L019EE0
         PHA
         _SetCursor
         JSL   L010D82
         SEC
         RTS

*--- filterProc

L080683  PHB
         PHD
         PHK
         PLB
         LDAL  L01968D
         TCD
         LDA   $07,S
         STA   $0A
         LDA   $09,S
         STA   $0C
         LDY   #$0010
         LDA   [$0A],Y
         AND   #$00FF
         CMP   #$0006
         BEQ   L0806B9
         CMP   #$00C0
         BEQ   L0806B0
         CMP   #$00C1
         BEQ   L0806B9
L0806AB  LDA   #$0000
         BRA   L0806C6
L0806B0  LDY   #$001F
         LDA   [$0A],Y
         BNE   L0806AB
         BRA   L0806C3
L0806B9  LDY   #$0013
         LDA   [$0A],Y
         CMP   #$0041
         BNE   L0806AB
L0806C3  LDA   #$0002
L0806C6  STA   $0B,S
         PLD
         PLB
         LDA   $00,S
         STA   $04,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         RTL

L0806D5  PHA
         PHA
         PEA   ^L0808AD
         PEA   L0808AD
         PEA   $0001
         PEA   $0000
         PEA   $0000
         _NewModalDialog
         PLA
         STA   $A0
         PLA
         STA   $A2
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _SetPort
         PEA   $0000
         PEA   $0000
         _SetOrigin
         PEA   $0055
         LDA   L0808C9
         DEC
         PHA
         _MoveTo
         PEA   ^L010681
         PEA   L010681
         _DrawString
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   $0001
         PEA   ^L0808B5
         PEA   L0808B5
         PEA   $000A
         PEA   ^L01046F
         PEA   L01046F
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewDItem
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   $0002
         PEA   ^L0808BD
         PEA   L0808BD
         PEA   $000D
         PEA   ^L0807A4
         PEA   L0807A4
         PEA   $0000
         PEA   $001C
         PEA   $0000
         PEA   $0000
         _NewDItem
L08077F  LDA   #$0000
         PHA
         PHA
         PHA
         _ModalDialog
         PLA
         CMP   #$0001
         BNE   L08077F
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         _CloseDialog
         JSL   L010D82
         RTS

L0807A4  NOP
         PHD
         PHB
         PHK
         PLB
         LDAL  L01968D
         TCD
         LDA   $0D,S
         DEC
         ASL
         TAX
         JMP   (L08089D,X)

L0807B6  LDA   #$0000
         STA   $0F,S
         BRL   L08083F
L0807BE  LDA   #$007F
         STA   $0F,S
         BRL   L08083F
L0807C6  LDA   #$0002
         STA   L080F19
         STA   $0F,S
         JSR   L08084E
         BRL   L08083F
L0807D4  LDA   L080F19
         BNE   L0807DC
         BRL   L08083A
L0807DC  DEC
         JSR   L08084E
         BRL   L08083A
L0807E3  LDA   L080F19
         CMP   #$007F
         BCC   L0807EE
         BRL   L08083A
L0807EE  INC
         JSR   L08084E
         BRL   L08083A
L0807F5  SEC
         LDA   L080F19
         SBC   #$0005
         BPL   L080804
         STZ   L080F19
         LDA   #$0000
L080804  JSR   L08084E
         BRL   L08083A
L08080A  CLC
         LDA   L080F19
         ADC   #$0005
         CMP   #$007F
         BCC   L08081C
         LDA   #$007F
         STA   L080F19
L08081C  JSR   L08084E
         BRL   L08083A
L080822  PHA
         LDA   $A2
         PHA
         LDA   $A0
         PHA
         PEA   $0002
         _GetDItemValue
         PLA
         STA   L080F19
         JSR   L08084E
L08083A  LDA   L080F19
         STA   $0F,S
L08083F  PLB
         PLD
         LDA   $00,S
         STA   $08,S
         LDA   $02,S
         STA   $0A,S
         PLA
         PLA
         PLA
         PLA
         RTL

L08084E  STA   L080F19
         PEA   ^L0808C5
         PEA   L0808C5
         PEA   ^L0199F4
         PEA   L0199F4
         _FillRect
         LDA   L080F19
         PHA
         PEA   ^L0808CD+1
         PEA   L0808CD+1
         LDA   L0808CD
         AND   #$00FF
         PHA
         PEA   $0000
         _Int2Dec
         LDA   L0808C7
         PHA
         LDA   L0808C9
         DEC
         PHA
         _MoveTo
         PEA   ^L0808CD
         PEA   L0808CD
         _DrawString
         RTS

L08089D  DA    L0807B6
         DA    L0807BE
         DA    L0807C6
         DA    L0807D4
         DA    L0807E3
         DA    L0807F5
         DA    L08080A
         DA    L080822
L0808AD  DW    $0028
         DW    $0037
         DW    $0064
         DW    $0131
L0808B5  DW    $0028
         DW    $005A
         DW    $0036
         DW    $00A0
L0808BD  DW    $0015
         DW    $0019
         DW    $0022
         DW    $00E1
L0808C5  DW    $0005
L0808C7  DW    $008E
L0808C9  DW    $000F
         DW    $00B4
L0808CD  STR   '    '
L0808D2  DW    $0000

L0808D4  _ShowCursor
         PEA   $001E
         PEA   $001E
         PEA   ^L0106BE
         PEA   L0106BE
         LDA   #$0000
         PHA
         PHA
         PEA   ^L08090A
         PEA   L08090A
         PEA   ^L0198D9
         PEA   L0198D9
         _SFGetFile
         JSL   L010D82
         LDAL  L0198D9
         BNE   L08090C
L080909  RTS

L08090A  DB    $01
         DB    $C2

L08090C  PHA
         PEA   $FFFF
         PEA   $0000
         _FlushEvents
         PLA
         LDAL  L0198EF
         AND   #$003F
         PHA
         TAX
L080924  LDAL  L0198EF,X
         AND   #$007F
         CMP   #$002F
         BEQ   L080933
         DEX
         BNE   L080924
L080933  PHX
         LDY   #$FFFF
         DEX
L080938  INX
         INX
         INY
         INY
         LDAL  L0198EF,X
         STA   L080E45,Y
         TXA
         CMP   $03,S
         BCC   L080938
         LDA   $03,S
         SEC
         SBC   $01,S
         PHA
         LDA   L080E45
         AND   #$FF00
         ORA   $01,S
         STA   L080E45
         PLA
         PLA
         PLA
         _HideCursor
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L080DC9
         BCS   L080909
         LDA   L080DC9
         BEQ   L080909
         STA   L080DFF
         STA   L080E0D
         STA   L080E29
         STA   L080E1B
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L080DFF
         BCS   L0809CE
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L080E0D
         BCS   L0809CE
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L080E1B
         BCS   L0809CE
         PEA   $0000
         PEA   $0000
         LDA   L080F0F+2
         PHA
         LDA   L080F0F
         PHA
         LDAL  L01967F
         PHA
         PEA   $8000
         PEA   $0000
         PEA   $0000
         _NewHandle
         STA   L080B50
         BCC   L0809DB
         PLA
         PLA
L0809CE  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L080DC9
         BRL   L080AE4
L0809DB  PLA
         STA   $B8
         PLA
         STA   $BA
         LDA   [$B8]
         STA   $BC
         STA   L080E2B
         LDY   #$0002
         LDA   [$B8],Y
         STA   $BE
         STA   L080E2B+2
         LDA   #$0000
         STA   L080E2F+2
L0809F8  LDA   L080F0F+2
         BEQ   L080A36
         LDA   #$FFFF
         STA   L080E2F
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L080E29
         LDA   #$FFFF
         CLC
         ADC   L080E2B
         STA   L080E2B
         LDA   #$0000
         ADC   L080E2B+2
         STA   L080E2B+2
         LDA   L080F0F
         SEC
         SBC   #$FFFF
         STA   L080F0F
         LDA   L080F0F+2
         SBC   #$0000
         STA   L080F0F+2
         JMP   L0809F8

L080A36  LDA   L080F0F
         BEQ   L080A48
         STA   L080E2F
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L080E29
L080A48  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L080DC9
         BCC   L080A56
         BRK   $10
L080A56  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDAL  L0196C1
         STA   L080DC3
L080A71  LDA   [$B8]
         STA   $BC
         LDY   #$0002
         LDA   [$B8],Y
         STA   $BE
         LDA   #$0004
         STA   L080DBF
         STZ   L080DBF+2
         LDA   #$2000
         STA   $C8
         LDA   #$00E1
         STA   $CA
         LDA   [$BC]
         STA   L080DC5
         LDY   #$0002
         LDA   [$BC],Y
         STA   L080DC5+2
L080A9C  LDY   L080DBF
         LDA   [$BC],Y
         BEQ   L080B10
         PHA
         INY
         INY
         LDA   [$BC],Y
         INY
         INY
         STY   L080DBF
         BNE   L080AB4
         INC   $BE
         INC   L080DBF+2
L080AB4  PLY
         STA   [$C8],Y
L080AB7  LDA   L080DBF+2
         CMP   L080DC5+2
         BCC   L080A9C
         LDA   L080DBF
         CMP   L080DC5
         BCC   L080A9C
         JMP   L080A71

L080ACA  LDA   $BA
         PHA
         LDA   $B8
         PHA
         _HUnlock
         LDA   $BA
         PHA
         LDA   $B8
         PHA
         _DisposeHandle
L080AE4  PEA   $0000
         PEA   $0000
         _RefreshDesktop
         JSL   L010D82
         _DrawMenuBar
         _ShowCursor
         LDA   L080B50
         BEQ   L080B0F
         LDX   #$0002
         JSL   L017D37
L080B0F  RTS

L080B10  INC   L080DBF
         INC   L080DBF
         INC   L080DBF
         INC   L080DBF
L080B1C  PEA   $0000
         PEA   $FFFF
         PEA   ^L0196BB
         PEA   L0196BB
         _GetNextEvent
         PLA
         LDAL  L0196BB
         CMP   #$0001
         BEQ   L080ACA
         LDAL  L0196C1
         SEC
         SBC   L080DC3
         CMP   L080F19
         BCC   L080B1C
         LDAL  L0196C1
         STA   L080DC3
         JMP   L080AB7

L080B50  DW    $0000

L080B52  PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDAL  L01967F
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCC   L080B78
         BRL   L080DA1
L080B78  PLA
         STA   $A8
         PLA
         STA   $AA
         LDA   #$0001
         STA   L080F17
         STZ   L080F13
         JSL   GSOS
         DW    $000A      ; GetPrefix
         ADRL  L080BF2
         JSL   GSOS
         DW    $0010      ; Open
         ADRL  L080BE2
         BCC   L080B9F
         BRK   $10
L080B9F  LDA   L080BE2
         STA   L080F15
         STA   L080BEC
         JSL   GSOS
         DW    $0016      ; SetMark
         ADRL  L080BEC
         BCC   L080BB6
         BRK   $16
L080BB6  JSR   L080BF8
         BCS   L080BC5
         JSR   L080C59
         BEQ   L080BB6
         JSR   L080C9F
         BRA   L080BB6
L080BC5  CMP   #$004C
         BEQ   L080BCC
         BRK   $12
L080BCC  JSL   GSOS
         DW    $0014      ; Close
         ADRL  L080BE2
         LDA   L080F13
         BNE   L080BE1
         LDA   #$FFFF
         STA   L080F21
L080BE1  RTS

L080BE2  DW    $0000      ;  ref num
         ADRL  L080EC7    ;  path name
         ADRL  $00000000  ;  reserved
L080BEC  DW    $0000      ;  ref num
         ADRL  $0000002B  ;  position
L080BF2  DW    $0000      ;  prefix num
         ADRL  L080EC7    ;  prefix ptr

L080BF8  LDA   #L080F43
         STA   $B4
         STA   L080C4D
         LDA   #^L080F43
         STA   $B6
         STA   L080C4D+2
         LDA   L080F15
         STA   L080C4B
L080C0E  LDA   L080F17
         CMP   #$000D
         BCC   L080C31
         STZ   L080F17
         LDA   #$0005
         STA   L080C51
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L080C4B
         LDX   #$0027
         STX   L080C51
         BCS   L080C4A
L080C31  JSL   GSOS
         DW    $0012      ; Read
         ADRL  L080C4B
         BCS   L080C4A
         INC   L080F17
         LDA   [$B4]
         AND   #$000F
         BEQ   L080C0E
         LDA   #$0000
L080C4A  RTS

L080C4B  DW    $0000      ;  ref num
L080C4D  ADRL  $00000000  ;  buffer ptr
L080C51  ADRL  $00000027  ;  request count
         ADRL  $00000000  ;  transfer count

L080C59  SEP   #$30
         LDY   L080DA5
L080C5E  LDA   L080DA5,Y
         AND   #$7F
         CMP   #$61
         BCC   L080C69
         AND   #$5F
L080C69  CMP   L080F43,Y
         BNE   L080C99
         DEY
         BNE   L080C5E
         LDY   #$10
         LDA   L080F43,Y
         CMP   #$06
         BEQ   L080C82
         CMP   #$C0
         BEQ   L080C82
         CMP   #$C1
         BNE   L080C99
L080C82  LDY   L080DA5
         INY
         LDA   L080F43,Y
         AND   #$7F
         CMP   #$30
         BCC   L080C99
         CMP   #$3A
         BCS   L080C99
         REP   #$30
         LDA   #$FFFF
         RTS

L080C99  REP   #$30
         LDA   #$0000
         RTS

L080C9F  JSR   L080D95
         LDA   L080F43
         AND   #$FF0F
         STA   L080F43
         LDA   $AC
         STA   $B0
         LDA   $AE
         STA   $B2
         LDX   #$0000
L080CB6  CPX   L080F13
         BCS   L080CFA
         SEP   #$30
         LDA   [$B0]
         CMP   L080F43
         BCC   L080CE9
         BNE   L080CFA
         LDA   L080F43
         INC
         STA   $B4
         LDY   #$01
L080CCE  LDA   [$B0],Y
         CMP   #$61
         BCC   L080CD6
         AND   #$DF
L080CD6  CMP   L080F43,Y
         BCC   L080CE9
         BNE   L080CFA
         INY
         CPY   $B4
         BCC   L080CCE
         LDA   [$B0]
         CMP   L080F43
         BCS   L080CFA
L080CE9  REP   #$30
         LDA   $B0
         CLC
         ADC   #$0012
         STA   $B0
         BCC   L080CF7
         INC   $B2
L080CF7  INX
         BRA   L080CB6
L080CFA  REP   #$30
         INC   L080F13
         LDA   $B0
         SEC
         SBC   $AC
         STA   $B0
         LDA   $B2
         SBC   $AE
         STA   $B2
         PEA   $0000
         PEA   $0000
         LDA   $AA
         PHA
         LDA   $A8
         PHA
         _GetHandleSize
         PLA
         STA   $B4
         PLX
         STX   $B6
         CLC
         ADC   #$0012
         BCC   L080D2C
         INX
L080D2C  PHX
         PHA
         LDA   $AA
         PHA
         LDA   $A8
         PHA
         _SetHandleSize
         BCC   L080D40
         BRL   L080DA3
L080D40  JSR   L080D95
         LDA   $AC
         CLC
         ADC   $B0
         PHA
         LDA   $AE
         ADC   $B2
         TAX
         PLA
         PHX
         PHA
         PHX
         PHA
         CLC
         ADC   #$0012
         BCC   L080D5A
         INX
L080D5A  PHX
         PHA
         LDA   $B4
         SEC
         SBC   $B0
         TAX
         LDA   $B6
         SBC   $B2
         BNE   L080D6D
         CPX   #$0000
         BEQ   L080D78
L080D6D  PHA
         PHX
         _BlockMove
         BRA   L080D7C
L080D78  PLA
         PLA
         PLA
         PLA
L080D7C  LDA   #L080F43
         LDY   #^L080F43
         PLA
         STA   $B0
         PLX
         STX   $B2
         LDY   #$0010
L080D8B  LDA   L080F43,Y
         STA   [$B0],Y
         DEY
         DEY
         BPL   L080D8B
         RTS

L080D95  LDY   #$0002
         LDA   [$A8]
         STA   $AC
         LDA   [$A8],Y
         STA   $AE
         RTS

L080DA1  PLA
         PLA
L080DA3  SEC
         RTS

L080DA5  DB    $00
L080DA6  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L080DB7  STR   '.show'
L080DBD  DW    $0000
L080DBF  ADRL  $00000000
L080DC3  DW    $0000
L080DC5  ADRL  $00000000
L080DC9  DW    $0000      ;  ref num
         ADRL  L080E45    ;  path name
         ADRL  $00000000  ;  reserved
         BRK   $00
         ADRL  L080E56
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  $00E19E00
         DB    $20
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L080DFF  DW    $0000      ;  ref num
         ADRL  $00E12000  ;  buffer ptr
         ADRL  $00008000  ;  request count
         ADRL  $00000000  ;  transfer count
L080E0D  DW    $0000      ;  ref num
         ADRL  L080F0F    ;  buffer ptr
         ADRL  $00000004  ;  request count
         ADRL  $00000000  ;  transfer count
L080E1B  DW    $0000      ;  ref num
         ADRL  L080F19    ;  buffer ptr
         ADRL  $00000004  ;  request count
         ADRL  $00000000  ;  transfer count
L080E29  DW    $0000      ;  ref num
L080E2B  ADRL  $00E12000  ;  buffer ptr
L080E2F  ADRL  $00008000  ;  request count
         ADRL  $00000000  ;  transfer count
         DB    $00
         DB    $00
         DB    $00
         DB    $20
         DB    $E1
         DB    $00
         DB    $00
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L080E45  DB    $0D
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L080E56  DB    $0D
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L080E67  DW    $0000      ;  which file type is loaded?

L080E69  ADRL  L0198EF    ;  file name
         DW    $00C3      ;  access
         DW    $00C2      ;  file type
         ADRL  $00000000  ;  aux type
         DS    2          ;  (null field)
         DS    4          ;  creation date
         DS    4          ;  modification date
L080E7F  DW    $0000      ;  ref num
         ADRL  L0198EF    ;  path name
         ADRL  $00000000  ;  reserved
L080E89  DW    $0000      ;  ref num
         ADRL  $00000000  ;  end of file
L080E8F  DW    $0000      ;  ref num
L080E91  ADRL  $00000000  ;  buffer ptr
         ADRL  $00008000  ;  request count
         ADRL  $00000000  ;  transfer count
L080E9D  DW    $0000      ;  ref num
         ADRL  L080F0F    ;  buffer ptr
         ADRL  $00000004  ;  request count
         ADRL  $00000000  ;  transfer count
L080EAB  DW    $0000      ;  ref num
         ADRL  L080F19    ;  buffer ptr
         ADRL  $00000004  ;  request count
         ADRL  $00000000  ;  transfer count
L080EB9  DW    $0000      ;  ref num
L080EBB  ADRL  $00000000  ;  buffer ptr
L080EBF  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L080EC7  STR   '/Pro/anime'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L080F0F  ADRL  $00000000
L080F13  DW    $0000
L080F15  DW    $0000
L080F17  DW    $0000
L080F19  DW    $0000
L080F1B  DW    $0000
L080F1D  DB    $03
         HEX   C0C106	; PNT, PIC, BIN

L080F21  DW    $0000
L080F23  DS    32
L080F43  DS    40

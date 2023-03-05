
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

	mx	%00
	rel
	lst	off

*-----------------------

	use	4/Desk.Macs
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Resource.Macs
	use	4/SANE.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
	use	DISASM.E
	use	DISASM.X
	
*-----------------------

         BRL   L020D45

L020003  DW    $0000
L020005  DW    $0000
L020007  DW    $0000
L020009  DB    $00
L02000A  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L020059  DB    $00
         DB    $01
L02005B  DB    $00
L02005C  DB    $00
L02005D  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02015B  DB    $01
         DB    $10
L02015D  DB    $00
         DB    $00
         DB    $02
         DB    $10
         DB    $00
         DB    $00
         DB    $03
         DB    $10
         DB    $00
         DB    $00
         DB    $04
         DB    $10
         DB    $00
         DB    $00
         DB    $05
         DB    $10
         DB    $00
         DB    $00
         DB    $06
         DB    $10
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L020177  DB    $00
L020178  DB    $00
L020179  DB    $00
         DB    $00
L02017B  DB    $00
L02017C  DB    $00
L02017D  DB    $00
         DB    $00
L02017F  DB    $00
L020180  DB    $00
L020181  DB    $00
         DB    $00
L020183  DB    $00
L020184  DB    $00
L020185  DB    $00
         DB    $00
L020187  DB    $00
L020188  DB    $00
L020189  DB    $00
         DB    $00
L02018B  DB    $00
L02018C  DB    $00
L02018D  DB    $00
         DB    $00

L02018F  STRL  '9:Expand:'
L02019A  STRL  '9:Configs:'

*L0201A6  STR   "The Flaming Bird Disassembler    Written by Ferox - (c) 1994 Phoenix corporation"
L0201A6  STR   "The Flaming Bird Disassembler      Written by Ferox - (c) 1994-2023 Phoenix Corp"
L0201F7  STR   87">ERR: "

L0201FF  DA    L020239	;  0 Not enough memory
         DA    L02024C	;  1 Syntax
         DA    L020254	;  2 Duplicate label
         DA    L020265	;  3 Parameter out of range
         DA    L02027D	;  4 Invalid label
         DA    L02028C	;  5 Label not found
         DA    L02029D	;  6 Label expected
         DA    L0202AD	;  7 No such constant
         DA    L0202BF	;  8 File/Segment longer than 64K
         DA    L0202DD	;  9 File should be in OMF 1 or 2
         DA    L0202FB	; 10 No file in memory
         DA    L02030E	; 11 Not an OMF load file
         DA    L020324	; 12 Invalid segment number
         DA    L02033C	; 13 Invalid file type
         DA    L02034F	; 14 No resource fork
         DA    L020361	; 15 Specified resource not found
         DA    L02037F	; 16 Not a code resource
         DA    L020394	; 17 File is empty
         DA    L0203A3	; 18 Not a TFBD expansion file
         DA    L0203BE	; 19 This expansion can't be runned with this version of TFBD
         DA    L0203F8	; 20 This expansion can't process that file
         DA    L020420	; 21 Not a configuration file
         DA    L02043A	; 22 Not enough bank zero memory
         DA    L020457	; 23 Structure too complex
         DA    L02046E	; 24 Resource fork is empty
         DA    L020486	; 25 No string in memory
         DA    L02049B	; 26 Needs System v6.0 or higher
         DA    L0204B8	; 27 Misformatted OMF segment
         DA    L0204D2	; 28 Not a valid LNK file

L020239  STR   "Not enough memory "
L02024C  STR   "Syntax "
L020254  STR   "Duplicate label "
L020265  STR   "Parameter out of range "
L02027D  STR   "Invalid label "
L02028C  STR   "Label not found "
L02029D  STR   "Label expected "
L0202AD  STR   "No such constant "
L0202BF  STR   "File/Segment longer than 64K "
L0202DD  STR   "File should be in OMF 1 or 2 "
L0202FB  STR   "No file in memory "
L02030E  STR   "Not an OMF load file "
L020324  STR   "Invalid segment number "
L02033C  STR   "Invalid file type "
L02034F  STR   "No resource fork "
L020361  STR   "Specified resource not found "
L02037F  STR   "Not a code resource "
L020394  STR   "File is empty "
L0203A3  STR   "Not a TFBD expansion file "
L0203BE  STR   "This expansion can't be runned with this version of TFBD "
L0203F8  STR   "This expansion can't process that file "
L020420  STR   "Not a configuration file "
L02043A  STR   "Not enough bank zero memory "
L020457  STR   "Structure too complex "
L02046E  STR   "Resource fork is empty "
L020486  STR   "No string in memory "
L02049B  STR   "Needs System v6.0 or higher "
L0204B8  STR   "Misformatted OMF segment "
L0204D2  STR   "Not a valid LNK file "
L0204E8  STR   "GS/OS MLI $"
L0204F4  STR   "Loader error $"

L020503  ASC   "LOA"	; 0
         ASC   'D'
         ASC   "TCL"	; 1
         ASC   'R'
         ASC   "TLOA"	; 2
         ASC   'D'
         ASC   "TSAV"	; 3
         ASC   'E'
         ASC   "GENLA"	; 4
         ASC   'B'
         ASC   "LIS"	; 5
         ASC   'T'
         ASC   "RE"	; 6
         ASC   'M'
	 ASC   '?'	; 7
         ASC   "INFO"	; 8
         ASC   'S'
         ASC   "QUI"	; 9
         ASC   'T'
         ASC   "BY"	; 10
         ASC   'E'
         ASC   "PF"	; 11
         ASC   'X'
         ASC   "OF"	; 12
         ASC   'F'
         ASC   "SE"	; 13
         ASC   'G'
         ASC   "SLOA"	; 14
         ASC   'D'
	 ASC   '\'	; 15
         ASC   "PH"	; 16
         ASC   'L'
         ASC   "RPH"	; 17
         ASC   'L'
         ASC   "PHL"	; 18
         ASC   '2'
         ASC   "MATC"	; 19
         ASC   'H'
         ASC   "SR"	; 20
         ASC   'C'
         ASC   "CO"	; 21
         ASC   'M'
         ASC   "TAB"	; 22
         ASC   'S'
         ASC   "CA"	; 23
         ASC   'T'
         ASC   "RO"	; 24
         ASC   'M'
         ASC   "STOO"	; 25
         ASC   'L'
         ASC   "MLAB"	; 26
         ASC   'S'
         ASC   "MRE"	; 27
         ASC   'L'
         ASC   "REL"	; 28
         ASC   '8'
         ASC   "RREL"	; 29
         ASC   '8'
         ASC   "RE"	; 30
         ASC   'L'
         ASC   "T"	; 31
         ASC   'C'
         ASC   "TRO"	; 32
         ASC   'N'
         ASC   "TROF"	; 33
         ASC   'F'
         ASC   "BU"	; 34
         ASC   'G'
         ASC   "RLOA"	; 35
         ASC   'D'
	 ASC   '$'	; 36
         ASC   "SEDI"	; 37
         ASC   'T'
         ASC   "PO"	; 38
         ASC   'P'
         ASC   "DS"	; 39
         ASC   'K'
         ASC   "SSAV"	; 40
         ASC   'E'
         ASC   "HIS"	; 41
         ASC   'T'
	 ASC   '-'	; 42
         ASC   "CF"	; 43
         ASC   'G'
         ASC   "C"	; 44
         ASC   'S'
         ASC   "C"	; 45
         ASC   '1'
	 ASC   '['	; 46
         ASC   "M"	; 47
         ASC   'D'
         ASC   "TS"	; 48
         ASC   'T'
         ASC   "FIN"	; 49
         ASC   'D'
         ASC   "SCA"	; 50
         ASC   'N'

* AV 202010 - Two new commands

	asc	"CHO"	; 51
	asc	'N'
	asc	"CHOF"	; 52
	asc	'F'
	
         ASC   00

*--- The commands

L0205B7  ADRL  L020503	; COMMANDS...
         ADRL  L040326	; DB...
         ADRL  L040358	; LAB...
         ADRL  L04036A	; ORG...
         ADRL  $00000000

*--- The routines

L0205CB  ADRL  L021AC8	; COMMANDS...
         ADRL  L021758	; DB...
         ADRL  L021F0A	; LAB...
         ADRL  L0220D2	; ORG...

*--- The flags

L0205DB  ADRL  L021B94	; COMMANDS...
         ADRL  L02179C	; DB...
         ADRL  L021F22	; LAB...
         ADRL  L0220EA	; ORG...

L0205EB  BRL   L0205F8
         DW    $7771
         STR   'InitAll'

L0205F8  PHP
         REP   #$30
         JSR   L02076E
         _TLStartUp
         PHA
         _MMStartUp
         PLA
         STA   $FE
         STA   L0209B1
         ORA   #$0100
         STA   $FC
         JSR   L020736
         JSR   L02067C
         BCC   L02066B
         JSR   L02084C
         JSR   L02095E
         JSR   L0208B1
         JSR   L0207C2
         JSR   L02077C
         JSL   L041D74
         BCS   L02066F
         JSR   L020694
         JSR   L0206CA
         JSR   L02071D
         PEA   ^L020678
         PEA   L020678
         PEA   $200F      ; GetSysPrefs
         JSL   GSOS2
         LDA   L02067A
         PHA
         ORA   #$8000
         STA   L02067A
         PEA   ^L020678
         PEA   L020678
         PEA   $200C      ; SetSysPrefs
         JSL   GSOS2
         PLA
         STA   L02067A
         JSR   L026659
         PLP
         RTS

L02066B  LDA   #$001A
         DB    $CF
L02066F  LDA   #$0000
         JSR   L020AB8
         BRL   L020A10

L020678  DW    $0001      ; Parms for SetSysPrefs
L02067A  DW    $0000      ;  preferences

L02067C  JSL   GSOS
         DW    $202A      ; GetVersion
         ADRL  L020690
         LDA   L020692
         AND   #$7FFF
         CMP   #$0400
         RTS

L020690  DW    $0001      ; Parms for GetVersion
L020692  DW    $0000      ;  version number

L020694  LDA   L020007
         BEQ   L0206C9
         LDX   #$0000
L02069C  LDA   L02015B,X
         TAY
         ORA   L02015D,X
         BEQ   L0206C9
         PHX
         PHA
         PHA
         PEA   $8022
         LDA   L02015D,X
         PHA
         PHY
         _LoadResource
         PLA
         PLY
         PLX
         BCS   L0206C3
         STA   L020177,X
         TYA
         STA   L020179,X
L0206C3  INX
         INX
         INX
         INX
         BRA   L02069C
L0206C9  RTS

L0206CA  LDA   L020178
         BEQ   L0206DE
         LDX   L020177
         LDY   L020179
         JSR   L023EF2
         STX   L020719
         STY   L020719+2
L0206DE  LDA   L02017C
         BEQ   L0206F2
         LDX   L02017B
         LDY   L02017D
         JSR   L023EF2
         STX   L020711
         STY   L020711+2
L0206F2  PEA   ^L02070D
         PEA   L02070D
         PEA   $2009      ; SetPrefix
         JSL   GSOS2
         PEA   ^L020715
         PEA   L020715
         PEA   $2009      ; SetPrefix
         JSL   GSOS2
         RTS

L02070D  DW    $0002      ; Parms for SetPrefix
         DW    $0002      ;  prefix num
L020711  ADRL  L02018F    ;  prefix ptr
L020715  DW    $0002      ; Parms for SetPrefix
         DW    $0003      ;  prefix num
L020719  ADRL  L02019A    ;  prefix ptr

L02071D  LDA   L020180
         BEQ   L02072D
         LDX   L02017F
         LDY   L020181
         JSR   L023EF2
         BRA   L020731
L02072D  LDX   #$0000
         TXY
L020731  JSL   L044B1B
         RTS

L020736  PHP
         SEP   #$30
         JSL   L030006
         JSL   L030314
         ADR   L0201A6
         JSR   L020A56
         LDA   #$16
         JSL   L03006F
         JSR   L020A56
         LDX   #$00
         LDY   #$02
         JSL   L0300E2
         JSL   L030035
         DB    $02
         DB    $15
         DB    $00
         DB    $4F
         LDX   #$24
         STX   $44
         LDX   #$2A
         STX   $45
         LDX   #$3A
         STX   $46
         PLP
         RTS

	 MX    %00
	 
L02076E  PHP
         REP   #$30
         LDX   #$00FE
L020774  STZ   $00,X
         DEX
         DEX
         BPL   L020774
         PLP
         RTS

L02077C  PHP
         REP   #$30
         LDA   L0207BD
         BEQ   L020793
         LDA   L0207BE
         PHA
         LDA   L0207BC
         PHA
         _DisposeHandle
L020793  PHA
         PHA
         PEA   $0000
         PEA   $0FA0
         PEI   $FC
         PEA   $0008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCS   L0207B9
         STX   L0207BC
         STY   L0207BE
         STZ   L0207C0
         PLP
         CLC
         RTS

L0207B9  PLP
         SEC
         RTS

L0207BC  DB    $00
L0207BD  DB    $00
L0207BE  DB    $00
         DB    $00
L0207C0  DB    $00
         DB    $00

L0207C2  JSR   L020836
         PHA
         PHA
         PEA   $0000
         PEA   $0100
         LDA   $FE
         PHA
         PEA   $C015
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLX
         PLY
         BCC   L0207E5
         RTS

L0207E5  STY   L02080D+2
         STX   L02080D
         PHB
         PHY
         PLB
         LDA   |$0000,X
         PLB
         PLB
         PHA
         PEA   $0800
         PEA   $0000
         PEA   $027F
         PEA   $0000
         PEA   $00C7
         PEI   $FE
         _EMStartUp
         RTS

L02080D  ADRL  $00000000

L020811  PHA
         _EMStatus
         PLA
         BEQ   L020835
         _EMShutDown
         LDA   L02080D+2
         PHA
         LDA   L02080D
         PHA
         _DisposeHandle
         JSR   L020836
L020835  RTS

L020836  PHP
         SEP   #$30
         LDX   #$10
L02083B  LDAL  $E0C019
         BPL   L02083B
L020841  LDAL  $E0C019
         BMI   L020841
         DEX
         BNE   L02083B
         PLP
         RTS

	 MX    %00
	 
L02084C  PEA   ^L020898
         PEA   L020898
         PEA   $2027      ; GetName
         JSL   GSOS2
         LDX   L021658
L02085C  LDA   L021658,X
         STA   L021656+4,X
         DEX
         BNE   L02085C
         LDA   #$39
         DEC
         STA   L021656+4
         INC   L021658
         INC   L021658
         PEI   $FE
         _ResourceStartUp
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^L021658
         PEA   L021658
         _OpenResourceFile
         PLA
         BCS   L020897
         STA   L020007
L020897  RTS

L020898  DW    $0001      ; Parms for GetName
         ADRL  L021656    ;  buffer ptr
L02089E  LDA   L020007
         PHA
         _CloseResourceFile
         _ResourceShutDown
         RTS

L0208B1  PHA
         _SANEStatus
         PLA
         BNE   L0208F2
         PHA
         PHA
         PEA   $0000
         PEA   $0100
         LDA   $FE
         PHA
         PEA   $C015
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLX
         PLY
         BCC   L0208DC
         RTS

L0208DC  STY   L0208F5
         STX   L0208F3
         PHB
         PHY
         PLB
         LDA   |$0000,X
         PLB
         PLB
         PHA
         _SANEStartUp
L0208F2  RTS

L0208F3  DB    $00
         DB    $00
L0208F5  DB    $00
         DB    $00

L0208F7  PHA
         _SANEStatus
         PLA
         BEQ   L020918
         _SANEShutDown
         LDA   L0208F5
         PHA
         LDA   L0208F3
         PHA
         _DisposeHandle
L020918  RTS

L020919  STR   'Phoenix~QuitCDA~'
L02092A  ADR   L0209AD
         DB    $00
L02092E  DB    $00
         DB    $00
L020930  DB    $00
         DB    $00

L020932  STZ   L020930
         PEA   $C300
         PEA   $8001
         PEA   ^L020919
         PEA   L020919
         PEA   $0000
         PEA   $0000
         PEA   ^L02092E
         PEA   L02092E
         _SendRequest
         BCS   L02095C
         LDA   L020930
         BEQ   L02095C
         RTS

L02095C  SEC
         RTS

L02095E  LDA   L020930
         BNE   L020987
         JSR   L020932
         BCS   L020987
         PEA   $C303
         PEA   $8001
         PEA   ^L020919
         PEA   L020919
         PEA   ^L02092A
         PEA   L02092A
         PEA   ^L02092E
         PEA   L02092E
         _SendRequest
L020987  RTS

L020988  JSR   L020932
         BCS   L0209AC
         PEA   $C304
         PEA   $8001
         PEA   ^L020919
         PEA   L020919
         PEA   ^L02092A
         PEA   L02092A
         PEA   ^L02092E
         PEA   L02092E
         _SendRequest
L0209AC  RTS

L0209AD  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0209B1  DW    $0000
         DW    $A55A
         REP   #$30
         PHK
         PLB
         PHD
         LDA   L020005
         TCD
         JSR   L020988
         SEP   #$20
         LDAL  $E0C025
         REP   #$20
         BMI   L0209EF
         LDA   $82
         BEQ   L0209EF
         JSL   L044EAB
         LDA   L02018C
         BEQ   L0209E5
         LDX   L02018B
         LDY   L02018D
         JSR   L023EF2
         PHY
         PHX
         BRA   L0209EB
L0209E5  PEA   ^L020A05
         PEA   L020A05
L0209EB  JSL   L042166
L0209EF  LDA   L0267A9
         BEQ   L0209F7
         JSR   L0267B9
L0209F7  PLD
         LDA   $02,S
         STA   $08,S
         LDA   $01,S
         STA   $07,S
         PLA
         PLA
         PLA
         CLC
         RTL

L020A05  STRL  '0:TMP.BAK'
L020A10  REP   #$30
         JSL   L050537
         JSL   L041DDC
         JSL   L040FF1
         JSR   L020988
         JSR   L020811
         JSR   L0208F7
         JSR   L02089E
         LDA   $FC
         PHA
         _DisposeAll
         LDA   $FE
         PHA
         _MMShutDown
         JSL   GSOS
         DW    $200C      ; SetSysPrefs
         ADRL  L020678
         JSL   GSOS
         DW    $2029      ; Quit
         ADRL  L020A54
         BRK   $00
L020A54  DW    $0000      ; Parms for Quit
L020A56  PHP
         SEP   #$30
         LDX   #$50
L020A5B  PHX
         LDA   #$53
         JSL   L03022D
         PLX
         DEX
         BNE   L020A5B
         PLP
         RTS

L020A68  PHP
         REP   #$30
         JSL   L0300EE
         PHX
         PHY
L020A71  REP   #$30
         LDA   #$0017
         JSL   L03006F
         LDA   #$FFFF
         STA   L020F6A
         PEA   ^L020F6C
         PEA   L020F6C
         PEA   ^L020009
         PEA   L020009
         PEA   $00BA
         JSL   L03050A
         SEP   #$30
         LDX   L020009
         BEQ   L020A71
L020A9A  LDA   L020009,X
         CMP   #$A0
         BNE   L020AA6
         DEX
         BNE   L020A9A
         BRA   L020A71
L020AA6  REP   #$30
         PLY
         PLX
         JSL   L0300E2
         PLP
         RTS

         PHB
         PHK
         PLB
         JSR   L020AB8
         PLB
         RTL

L020AB8  PHP
         REP   #$20
         SEP   #$10
         AND   #$007F
         ASL
         TAX
         LDAL  L0201FF,X
         STAL  L020AE8
         SEP   #$20
         JSL   L0300EE
         PHX
         PHY
         LDX   #$00
         LDY   #$17
         JSL   L0300E2
         JSR   L020CED
         JSL   L030314
         ADR   L0201F7
         JSL   L030314
L020AE8  ADR   L0201FF
         JSL   L03034A
         PLY
         PLX
         JSL   L0300E2
         PLP
         RTS

L020AF7  PHP
         REP   #$30
         PHA
         JSL   L0300EE
         PHX
         PHY
         LDX   #$0000
         LDY   #$0017
         JSL   L0300E2
         JSR   L020CED
         JSL   L030314
         ADR   L0201F7
         JSL   L030314
         ADR   L0204E8
         LDA   $05,S
         PHA
         JSL   L030670
         LDA   $05,S
         LDX   #$0000
L020B28  LDY   L020B61,X
         BEQ   L020B4E
         CMP   L020B61,X
         BEQ   L020B38
         INX
         INX
         INX
         INX
         BRA   L020B28
L020B38  INX
         INX
         LDA   L020B61,X
         STA   L020B4B
         JSL   L0302E1
         STR   ": "
         JSL   L030314
L020B4B  ADR   L020BB0
L020B4E  JSL   L0302E1
         STR   " "
         JSL   L03034A
         PLY
         PLX
         JSL   L0300E2
         PLA
         PLP
         RTS

L020B61  DW    $0010
         DA    L020B9F
         DW    $0027
         DA    L020BB0
         DW    $002B
         DA    L020BBA
         DW    $0040
         DA    L020BD2
         DW    $0044
         DA    L020BEA
         DW    $0045
         DA    L020BF9
         DW    $0046
         DA    L020C0A
         DW    $0048
         DA    L020C19
         DW    $0049
         DA    L020C25
         DW    $004A
         DA    L020C34
         DW    $004C
         DA    L020C4D
         DW    $004D
         DA    L020C64
         DW    $0050
         DA    L020C7A
         DW    $0051
         DA    L020C91
         DW    $0058
         DA    L020CA1
         DW    $0000

L020B9F  STR   "Device not found"
L020BB0  STR   "I/O Error"
L020BBA  STR   "Disk is write-protected"
L020BD2  STR   "Invalid pathname syntax"
L020BEA  STR   "Path not found"
L020BF9  STR   "Volume not found"
L020C0A  STR   "File not found"
L020C19  STR   "Volume full"
L020C25  STR   "Directory full"
L020C34  STR   "Incompatible file format"
L020C4D  STR   "Unexpected end of file"
L020C64  STR   "Position out of range"
L020C7A  STR   "File is already opened"
L020C91  STR   "Directory error"
L020CA1  STR   "Not a block device"

L020CB4  PHP
         REP   #$30
         PHA
         JSL   L0300EE
         PHX
         PHY
         LDX   #$0000
         LDY   #$0017
         JSL   L0300E2
         JSR   L020CED
         JSL   L030314
         ADR   L0201F7
         JSL   L030314
         ADR   L0204F4
         LDA   $05,S
         PHA
         JSL   L030670
         JSL   L03034A
         PLY
         PLX
         JSL   L0300E2
         PLA
         PLP
         RTS

L020CED  PHP
         SEP   #$30
         LDA   #$A0
         STAL  $E0C055
         JSR   L020CFE
         STAL  $E0C054
         PLP
L020CFE  PHP
         SEP   #$30
         LDX   #$27
L020D03  STAL  $E007D0,X
         DEX
         BPL   L020D03
         PLP
         RTS

L020D0C  PHP
         SEP   #$30
         JSL   L03074E
         DB    $0A
         DB    $0E
         DB    $1E
         DB    $31
         LDX   #$21
         LDY   #$0C
         JSL   L0300E2
         JSL   L0302E1
         STR   "Please wait..."
         PLP
         RTS

L020D34  PHP
         SEP   #$30
         JSL   L030035
         DB    $02
         DB    $15
         DB    $00
         DB    $4F
         JSL   L0300D1
         PLP
         RTS

L020D45  PHK
         PLB
         CLC
         XCE
         REP   #$30
         TSC
         STA   L020003
         TDC
         STA   L020005
         JSR   L0205EB
         JSR   L02728C
         LDY   #$0014
         LDX   #$0015
         JSL   L0300E2
         JSL   L0302E1
         STR   "Type ? for help, $ for shareware page."
L020D8E  JSR   L020A68
         JSR   L020DE5
         BCC   L020D9B
         BVC   L020D9B
         BRL   L020A10
L020D9B  LDA   L0207BD
         BNE   L020DA5
         JSR   L02077C
         BCS   L020D8E
L020DA5  LDX   L0207BC
         LDY   L0207BE
         JSR   L023EF2
         STX   $00
         STY   $02
         CLC
         LDA   #$0050
         ADC   $00
         STA   $04
         LDA   #$0000
         ADC   $02
         STA   $06
         LDY   #$0F4E
L020DC4  LDA   [$00],Y
         STA   [$04],Y
         DEY
         DEY
         BPL   L020DC4
         LDY   #$004E
L020DCF  LDA   L020009,Y
         STA   [$00],Y
         DEY
         DEY
         BPL   L020DCF
         LDA   L0207C0
         CMP   #$0032
         BCS   L020D8E
         INC   L0207C0
         BRA   L020D8E

L020DE5  BRL   L020DF6
         DW    $7771
         STR   'ExecCommand'
L020DF6  PHP
         REP   #$30
         LDA   L02000A
         AND   #$00FF
         BNE   L020E04
         BRL   L020EBD
L020E04  LDX   #$0000
L020E07  LDA   L0205B7+2,X
         TAY
         ORA   L0205B7,X
         BEQ   L020E20
         LDA   L0205B7,X
         PHX
         JSR   L020EE1
         PLX
         BCC   L020E52
         INX
         INX
         INX
         INX
         BRA   L020E07
L020E20  LDA   #L02000A
         STA   $F8
         LDA   #^L020009
         STA   $FA
         JSR   L020F52
         JSR   L027040
         BCC   L020E44
         JSR   L021586
         JSR   L026740
         BCS   L020EAA
         LDA   L0283C2
         BEQ   L020E71
         JSR   L0267F3
         BRA   L020E4C
L020E44  LDA   L0283C2
         BEQ   L020E71
         JSR   L027076
L020E4C  JSR   L021E04
         BRL   L020EDC
L020E52  LDY   L0205DB,X
         STY   $00
         LDY   L0205DB+2,X
         STY   $02
         PHA
         TAY
         LDA   [$00],Y
         AND   #$00FF
         STA   L020EDF
         BIT   #$0080
         BEQ   L020E7A
         LDA   L0283C2
         BNE   L020E7A
         PLA
L020E71  LDA   #$000A
         JSR   L020AB8
         PLP
         CLC
         RTS

L020E7A  PLA
         LDY   L0205CB,X
         STY   $00
         LDY   L0205CB+2,X
         STY   $02
         ASL
         ASL
         TAY
         LDA   [$00],Y
         BEQ   L020EBD
         DEC
         PER   L020EB4-1
         PHA
         LDA   #$0000
         TAX
         TAY
         PHP
         SEP   #$20
         PHA
         LDAL  $E0C025
         LSR
         BCS   L020EA5
         PLA
         PLP
         BRA   L020EA9
L020EA5  PLA
         PLP
         BRK   $00
L020EA9  RTS

         MX    %00

L020EAA  LDA   #$0001
         JSR   L020AB8
         PLP
         SEC
         CLV
         RTS

L020EB4  REP   #$30
         BCC   L020EC7
         BVS   L020EC1
         JSR   L020EC6
L020EBD  PLP
         SEC
         CLV
         RTS

L020EC1  PLP
         SEC
         SEP   #$40
         RTS

L020EC6  PHP
L020EC7  LDA   L020EDF
         BIT   #$0020
         BEQ   L020ED4
         PHA
         JSR   L020736
         PLA
L020ED4  BIT   #$0040
         BEQ   L020EDC
         JSR   L021E04
L020EDC  PLP
         CLC
         RTS

L020EDF  DB    $00
         DB    $00

L020EE1  PHP
         REP   #$30
         STA   $00
         STY   $02
         STZ   $04
         SEP   #$30
L020EEC  LDY   #$00
         LDX   #$00
L020EF0  LDA   [$00],Y
         BEQ   L020F4F
         ORA   #$80
         CMP   L02000A,X
         BEQ   L020F22
         CMP   #$C1
         BCC   L020F0A
         CMP   #$DB
         BCS   L020F0A
         ORA   #$20
         CMP   L02000A,X
         BEQ   L020F22
L020F0A  LDA   [$00],Y
         BPL   L020F11
         INY
         BRA   L020F0A
L020F11  INY
         TYA
         CLC
         ADC   $00
         STA   $00
         LDA   #$00
         ADC   $01
         STA   $01
         INC   $04
         BRA   L020EEC
L020F22  LDA   [$00],Y
         BPL   L020F2A
         INX
         INY
         BRA   L020EF0
L020F2A  INX
         CPX   #$01
         BEQ   L020F38
         LDA   L02000A,X
         BEQ   L020F38
         CMP   #$A0
         BNE   L020F0A
L020F38  REP   #$30
         INX
         TXA
         CLC
         ADC   #L020009
         STA   $F8
         LDA   #^L020009
         STA   $FA
         JSR   L020F52
         LDA   $04
         PLP
         CLC
         RTS

L020F4F  PLP
         SEC
         RTS

L020F52  PHP
         SEP   #$30
         LDY   #$FF
L020F57  INY
         LDA   [$F8],Y
         CMP   #$A0
         BEQ   L020F57
         REP   #$30
         TYA
         CLC
         ADC   $F8
         STA   $F8
         PLP
         RTS

L020F68  DB    $00
         DB    $00
L020F6A  DB    $00
         DB    $00

L020F6C  PLA
         PHK
         PLB
         SEP   #$30
         XBA
         STA   L020F98
         XBA
         LDX   L020F9A
L020F79  CMP   L020F9A,X
         BEQ   L020F83
         DEX
         BNE   L020F79
         SEC
         RTL

L020F83  DEX
         BIT   L0283C2
         BMI   L020F8E
         LDA   L020FBC,X
         BMI   L020F96
L020F8E  REP   #$30
         TXA
         ASL
         TAX
         JSR   (L020FA6,X)
L020F96  CLC
         RTL

L020F98  DB    $00
         DB    $00
L020F9A  DB    $0B
         DB    $0A
         DB    $0B
         DB    $08
         DB    $02
         DB    $0E
         DB    $12
         DB    $03
         DB    $13
         DB    $2B
         DB    $2D
         DB    $2A

L020FA6  DA    L020FC7
         DA    L02104E
         DA    L021166
         DA    L021179
         DA    L02118D
         DA    L0211C2
         DA    L0211CE
         DA    L0211E0
         DA    L0211EA
         DA    L021208
         DA    L021251

L020FBC  DB    $00
         DB    $00
         DB    $80
         DB    $80
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $80
         DB    $80
         DB    $00

L020FC7  LDA   L020F98
         AND   #$0010
         BEQ   L020FD2
         BRL   L02125A
L020FD2  BIT   L0283C2
         BPL   L020FDE
         LDA   $58
         BIT   L020F68
         BPL   L020FDF
L020FDE  RTS

L020FDF  BIT   $5C
         BMI   L020FE7
         CMP   $3E
         BCS   L020FDE
L020FE7  LDA   L020F98
         AND   #$0001
         BEQ   L021007
         LDX   #$0000
         LDY   #$0002
         JSL   L0300E2
         LDA   $5A
         STA   $56
         LDA   $58
         STA   $54
         LDY   #$0014
         BRL   L021034
L021007  JSL   L030139
         BIT   $48
         BPL   L021019
         LDA   $54
         CLC
         ADC   #$0010
         STA   $54
         BRA   L021025
L021019  PEI   $54
         PEI   $56
         JSL   L0415A4
         STA   $54
         STX   $56
L021025  LDX   #$0000
         LDY   #$0015
         JSL   L0300E2
         LDA   $58
         LDY   #$0001
L021034  JSL   L0405F4
         STA   $58
         STZ   L020F68
         CPY   #$00EF
         BNE   L02104D
         CPX   #$6502
         BNE   L02104D
         LDA   #$FFFF
         STA   L020F68
L02104D  RTS

L02104E  LDA   L020F98
         AND   #$0010
         BEQ   L021059
         BRL   L021278
L021059  BIT   L0283C2
         BMI   L02105F
         RTS

L02105F  LDA   $54
         BNE   L02106C
         PHA
         JSL   L04155D
         CPX   $56
         BEQ   L0210DF
L02106C  LDA   L020F98
         AND   #$0001
         BEQ   L0210E0
L021074  BIT   $48
         BPL   L0210A3
         LDA   $54
         CMP   #$0140
         BCC   L021085
         SEC
         SBC   #$0140
         BRA   L021088
L021085  LDA   #$0000
L021088  STA   $54
         LDX   #$0000
         LDY   #$0002
         JSL   L0300E2
         LDA   $54
         LDY   #$0014
         JSL   L0405F4
         STA   $58
         STZ   L020F68
         RTS

L0210A3  PEI   $54
         PEI   $56
         JSL   L04163A
         PHA
         PHX
         PEA   $0013
         JSL   L041462
         STA   $54
         STX   $56
         LDX   #$0000
         LDY   #$0002
         JSL   L0300E2
         LDA   $56
         STA   $5A
         LDA   $54
         LDY   #$0014
         JSL   L0405F4
         STA   $58
         STZ   L020F68
         CPY   #$00EF
         BNE   L0210DF
         LDA   #$FFFF
         STA   L020F68
L0210DF  RTS

L0210E0  BIT   L020F68
         BPL   L021100
         DEC   $58
         BPL   L021100
         STZ   L020F68
         LDA   $3E
         STA   $58
         BIT   $48
         BPL   L0210FC
         CLC
         LDA   $54
         ADC   #$0140
         BRA   L0210FE
L0210FC  LDA   $3E
L0210FE  STA   $58
L021100  BIT   $48
         BPL   L021125
         LDA   $54
         CMP   #$0010
         BCC   L0210DF
         SEC
         SBC   #$0010
         BRA   L021114
         LDA   #$0000
L021114  STA   $54
         LDA   $58
         BIT   L020F68
         BMI   L021145
         SEC
         SBC   #$0010
         STA   $58
         BRA   L021145
L021125  PEI   $54
         PEI   $56
         JSL   L04163A
         STA   $54
         STX   $56
         BIT   L020F68
         BMI   L021145
         PEI   $58
         PEI   $5A
         JSL   L04163A
         STA   $58
         STX   $5A
         STZ   L020F68
L021145  JSL   L030193
         LDY   #$0002
         LDX   #$0000
         JSL   L0300E2
         PEI   $5A
         LDA   $56
         STA   $5A
         LDA   $54
         LDY   #$0001
         JSL   L0405F4
         PLA
         STA   $5A
         RTS

L021166  LDA   #$FFFF
         EOR   $48
         STA   $48
         PEI   $54
         JSL   L04155D
         STX   $56
         JSR   L021E04
         RTS

L021179  PHP
         REP   #$30
         LDA   #$0000
         STA   $54
         PHA
         JSL   L04155D
         STX   $56
         JSR   L021E04
         PLP
         RTS

L02118D  STZ   $56
         LDA   $3E
         BIT   $48
         BPL   L0211BD
         BIT   $5C
         BMI   L0211B4
         AND   #$000F
         PHA
         LDA   $3E
         AND   #$FFF0
         PLY
         BEQ   L0211A9
         CLC
         ADC   #$0010
L0211A9  SEC
         SBC   #$0140
         BCS   L0211B7
         LDA   #$0000
         BRA   L0211B7
L0211B4  LDA   #$FEC0
L0211B7  STA   $54
         JSR   L021E04
         RTS

L0211BD  STA   $54
         BRL   L021074
L0211C2  LDA   #$8000
         EOR   $5E
         AND   #$BFFF
         STA   $5E
         BRA   L0211D8
L0211CE  LDA   #$4000
         EOR   $5E
         AND   #$7FFF
         STA   $5E
L0211D8  BIT   $48
         BPL   L0211DF
         BRL   L021E04
L0211DF  RTS

L0211E0  LDA   #$2000
         EOR   $5E
         STA   $5E
         BRL   L021E04
L0211EA  LDX   #$001C
L0211ED  LDA   L021231,X
         STA   L021233,X
         DEX
         DEX
         BPL   L0211ED
         LDA   $54
         STA   L021231
         LDA   L02122F
         CMP   #$0010
         BCS   L021207
         INC   L02122F
L021207  RTS

L021208  LDA   L02122F
         BEQ   L021207
         DEC   L02122F
         LDY   L021231
         STY   $54
         LDX   #$0000
L021218  LDA   L021233,X
         STA   L021231,X
         INX
         INX
         CPX   #$001E
         BCC   L021218
         PHY
         JSL   L04155D
         STX   $56
         BRL   L021E04
L02122F  DB    $00
         DB    $00
L021231  DB    $00
         DB    $00
L021233  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L021251  JSR   L025DD4
         JSR   L020736
         BRL   L021E04
L02125A  LDA   L0207BD
         BEQ   L021277
         LDA   L0207C0
         BEQ   L021277
         LDA   L020F6A
         DEC
         CMP   L0207C0
         BCC   L021271
         LDA   L0207C0
         DEC
L021271  STA   L020F6A
         JSR   L021295
L021277  RTS

L021278  LDA   L0207BD
         BEQ   L021277
         LDA   L0207C0
         BEQ   L021277
         LDA   L020F6A
         INC
         CMP   L0207C0
         BCC   L02128E
         LDA   #$0000
L02128E  STA   L020F6A
         JSR   L021295
         RTS

L021295  LDX   L0207BC
         LDY   L0207BE
         JSR   L023EF2
         PHY
         PHX
         LDA   L020F6A
         ASL
         ASL
         ASL
         ASL
         PHA
         ASL
         ASL
         ADC   $01,S
         TAY
         PLA
         LDX   #$0000
         LDA   $03,S
         XBA
         PHA
         PLB
         PLB
L0212B7  LDA   ($01,S),Y
         STAL  L020009,X
         INY
         INX
         CPX   #$0050
         BCC   L0212B7
         PHK
         PLB
         PLA
         PLA
         RTS

L0212C9  PHP
         REP   #$30
         AND   #$007F
         CMP   #$0030
         BCC   L0212E6
         CMP   #$0047
         BCS   L0212E6
         CMP   #$003A
         BCC   L0212E3
         CMP   #$0041
         BCC   L0212E6
L0212E3  PLP
         CLC
         RTS

L0212E6  PLP
         SEC
         RTS

L0212E9  PHP
         REP   #$30
         AND   #$007F
         CMP   #$0041
         BCC   L021306
         CMP   #$007B
         BCS   L021306
         CMP   #$005B
         BCC   L021303
         CMP   #$0061
         BCC   L021306
L021303  PLP
         CLC
         RTS

L021306  PLP
         SEC
         RTS

L021309  PHP
         REP   #$30
L02130C  LDA   [$F8]
         AND   #$00FF
         BEQ   L02131D
         INC   $F8
         CMP   #$00A0
         BEQ   L02130C
         PLP
         CLC
         RTS

L02131D  PLP
         SEC
         RTS

L021320  PHP
         REP   #$30
L021323  LDA   [$F8]
         AND   #$00FF
         BEQ   L021336
         CMP   #$00A0
         BNE   L021333
         INC   $F8
         BRA   L021323
L021333  PLP
         CLC
         RTS

L021336  PLP
         SEC
         RTS

L021339  PHP
         REP   #$30
         JSR   L021367
         BCC   L021344
         PLP
         SEC
         RTS

L021344  BVS   L021364
         BIT   $F6
         BPL   L021353
         CPY   #$0000
         BNE   L021353
         LDY   $42
         BRA   L021364
L021353  PHY
         PHA
         JSL   L042ABB
         BCC   L021364
         LDA   #$0003
         JSR   L020AB8
         PLP
         SEC
         RTS

L021364  PLP
         CLC
         RTS

L021367  PHP
         REP   #$30
         LDA   [$F8]
         AND   #$00FF
         CMP   #$00A4	; $
         BEQ   L0213A6
         CMP   #$00B0	; 0
         BCC   L0213BB
         CMP   #$00BA	; 9+1
         BCC   L0213A8
         LDA   #L0213D1
         JSR   L021F2A
         BCS   L0213C1
         LDA   L0213D1
         AND   #$00FF
         BEQ   L0213C4
         PEA   ^L0213D1
         PEA   L0213D1
         JSL   L0426C7
         BCS   L0213A1
         CPX   #$0004
         BNE   L0213C8
         BRA   L0213CD
L0213A1  LDA   #$0005
         BRA   L0213BE
L0213A6  INC   $F8
L0213A8  PEI   $FA
         PEI   $F8
         LDX   #$0006
         JSL   L0306BD
         PLX
         STX   $F8
         PLX
         STX   $FA
         BCC   L0213CD
L0213BB  LDA   #$0001	; Err: Syntax
L0213BE  JSR   L020AB8
L0213C1  PLP
         SEC
         RTS

L0213C4  LDA   #$0000
         TAY
L0213C8  PLP
         CLC
         SEP   #$40
         RTS

L0213CD  PLP
         CLC
         CLV
         RTS

L0213D1  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02141A  CLC
         HEX   B0
L02141C  SEC
         PHP
         REP   #$30
         BCS   L02142C
         STZ   L021496
         JSR   L021309
         BCS   L021479
         BRA   L021442
L02142C  JSR   L021339
         BCS   L02148E
         CPY   $42
         BNE   L021488
         STA   L021496
         JSR   L021309
         BCS   L021479
         CMP   #$00AE	; .
         BEQ   L021465
L021442  CMP   #$00AC	; ,
         BNE   L021491
         JSR   L021564
         BCS   L02148E
         CMP   #$0000
         BEQ   L021488
         STA   L021498
         DEC
L021455  CLC
         ADC   L021496
         BCS   L021488
         BIT   $5C
         BMI   L02147F
         CMP   $3E
         BCS   L021488
         BRA   L02147F
L021465  JSR   L021339
         BCS   L02148E
         CMP   L021496
         BCC   L021488
         SEC
         SBC   L021496
         INC
         STA   L021498
         BRA   L02147F
L021479  LDA   #$0001
         STA   L021498
L02147F  LDA   L021496
         LDY   L021498
         PLP
         CLC
         RTS

L021488  LDA   #$0003
L02148B  JSR   L020AB8
L02148E  PLP
         SEC
         RTS

L021491  LDA   #$0001
         BRA   L02148B

L021496  DW    $0000
L021498  DW    $0000

L02149A  PHP
         REP   #$30
         JSR   L021309
         BCS   L021511
         CMP   #$00DB
         BNE   L021511
         STZ   L02151F
         LDA   $3E
         DEC
         STA   L021521
         LDA   $42
         STA   L021523
         LDA   [$F8]
         AND   #$00FF
         CMP   #$00AE
         BNE   L0214C3
         INC   $F8
         BRA   L0214E6
L0214C3  JSR   L021339
         BCS   L02151C
         STA   L02151F
         STY   L021523
         JSR   L021309
         BCS   L021511
         CMP   #$00AE
         BNE   L02151C
         LDA   [$F8]
         AND   #$00FF
         CMP   #$00DD
         BNE   L0214E6
         INC   $F8
         BRA   L021502
L0214E6  JSR   L021339
         BCS   L02151C
         STA   L021521
         CPY   L021523
         BNE   L021516
         CMP   L02151F
         BCC   L021516
         JSR   L021309
         BCS   L021511
         CMP   #$00DD
         BNE   L021511
L021502  JSR   L020F52
         LDA   L02151F
         LDX   L021521
         LDY   L021523
         PLP
         CLC
         RTS

L021511  LDA   #$0001
         BRA   L021519
L021516  LDA   #$0003
L021519  JSR   L020AB8
L02151C  PLP
         SEC
         RTS

L02151F  DW    $0000
L021521  DW    $0000
L021523  DW    $0000

L021525  PHP
         REP   #$30
         JSR   L02149A
         BCS   L02153A
         CPY   $42
         BNE   L021534
         PLP
         CLC
         RTS

L021534  LDA   #$0003
         JSR   L020AB8
L02153A  PLP
         SEC
         RTS

L02153D  LDA   L021542
         BRA   L021542+2
L021542  BIT   $0800
         SEP   #$20
         REP   #$10
         AND   #$7F
         STA   L021563
         JSR   L021309
         AND   #$7F
         CMP   L021563
         BNE   L02155B
         PLP
         CLC
         RTS

L02155B  LDA   #$01
         JSR   L020AB8
         PLP
         SEC
         RTS

L021563  DB    $00

L021564  PHP
         REP   #$30
         PEI   $FA
         PEI   $F8
         LDX   #$0004
         JSL   L0306BD
         PLX
         STX   $F8
         PLX
         STX   $FA
         BCS   L02157D
         PLP
         CLC
         RTS

L02157D  LDA   #$0001
         JSR   L020AB8
         PLP
         SEC
         RTS

L021586  PHP
         SEP   #$20
         REP   #$10
         LDY   #$0000
L02158E  JSR   L021309
         BCS   L0215C2
         AND   #$7F
         CMP   #$27
         BEQ   L02159D
         CMP   #$22
         BNE   L0215A5
L02159D  TYX
         BNE   L0215B9
         STA   L0215CC
         BRA   L02158E
L0215A5  CMP   #$2C
         BEQ   L0215C0
         CMP   #$20
         BEQ   L0215C0
         CMP   #$2F
         BNE   L0215B3
         LDA   #$3A
L0215B3  STA   L0215CF,Y
         INY
         BRA   L02158E
L0215B9  CMP   L0215CC
         BNE   L0215B3
         BRA   L0215C2
L0215C0  DEC   $F8
L0215C2  LDA   #$00
         STA   L0215CF,Y
         STY   L0215CD
         PLP
         RTS

L0215CC  DB    $00
L0215CD  DB    $00
L0215CE  DB    $00
L0215CF  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L021631  PHP
         REP   #$30
         JSR   L021586
         JSL   GSOS
         DW    $200E      ; ExpandPath
         ADRL  L02164C
         BCC   L021649
         JSR   L020AF7
         PLP
         SEC
         RTS

L021649  PLP
         CLC
         RTS

L02164C  DW    $0002      ; Parms for ExpandPath
         ADRL  L0215CD    ;  path name
         ADRL  L021656    ;  new pathname

L021656  DW    $0100
L021658  DS    $0002
L02165A  DS    $00FE

L021758  ADRL  L0217D6	; 0 DB
         ADRL  L0217D5	; 1 DW
         ADRL  L0217D4	; 2 DDB
         ADRL  L0217D3	; 3 DA
         ADRL  L0217D2	; 4 ADRL
         ADRL  L0217D1	; 5 ADR
         ADRL  L0217D0	; 6 FLO
         ADRL  L021858	; 7 HEX
         ADRL  L02186B	; 8 DS
         ADRL  L0218B5	; 9 ASC
         ADRL  L0219C7	; 10 DCI
         ADRL  L0218B0	; 11 REV
         ADRL  L0217AD	; 12 INV
         ADRL  L0217AD	; 13 FLS
         ADRL  L021A4A	; 14 STRL
         ADRL  L021A45	; 15 STR
         ADRL  L0217C6	; 16 CHK
         adrl  doRECT	; 17 - AV 202303 RECT

L02179C  DB    $C0	; 0 DB
         DB    $C0	; 1
         DB    $C0	; 2
         DB    $C0	; 3
         DB    $C0	; 4
         DB    $C0	; 5
         DB    $C0	; 6
         DB    $C0	; 7
         DB    $C0	; 8
         DB    $C0	; 9
         DB    $C0	; 10
         DB    $C0	; 11
         DB    $C0	; 12
         DB    $C0	; 13
         DB    $C0	; 14
         DB    $C0	; 15
         DB    $C0	; 16
         db    $c0	; 17 - AV 202303 RECT

L0217AD  CLC
         RTS

         PHP
         REP   #$30
         PHA
         PHX
         PEA   $E030
         PHA
         PHX
         PEA   $E020
         JSL   L0435FB
         JSL   L0435FB
         PLP
         RTS

doRECT   iny	; AV 202303 - a RECT is 4 DW
L0217C6  INY
         INY
         INY
         INY
         INY
         INY
         INY
         INY
         INY
         INY
L0217D0  INY
L0217D1  INY
L0217D2  INY
L0217D3  INY
L0217D4  INY
L0217D5  INY

L0217D6  LDA   L021847,Y
         AND   #$00FF
         STA   L021843	; number of bytes to disassemble
         STY   L021841	; Y is the index
         JSR   L021339	; check syntax
         BCS   L0217F7
         STA   L02183F	; address
         STY   L02183D	; segment
         JSR   L02141A	; check count
         BCS   L0217F7
         STY   L021845	; count
         BRA   L0217F9
L0217F7  CLC
         RTS

* AV 202303 - check if a RECT is required

L0217F9	lda	L021843	; is that a rect
	cmp	#$0082
	bne	L0217FA	; not a rect
	
	and	#$007f	; yes, erase bit 7
	sta	L021843	; we want 2 bytes as a word
	
	lda	#1	; command is DW - disassemble 2 bytes (ie. a word)
	sta	L021841
	
	lda	L021845	; but 4 times each count
	asl		; as a RECT is 4 words
	asl
	sta	L021845

L0217FA  LDX   L021845
         DEX
         BEQ   L021819
         LDA   L021841
         CMP   #$0006
         BCS   L021819
         INX
         CLC
         LDA   #$0000
L02180C  ADC   L021843
         DEX
         BNE   L02180C
         STA   L021843
         INX
         STX   L021845
L021819  LDA   L02183D	; segment
         PHA
         LDA   L02183F	; address
         PHA
         LDA   L021843	; number of bytes
         PHA
         LDA   L021841	; command
         PHA
         JSL   L043069
         LDA   L02183F	; address
         ADC   L021843	; + length
         STA   L02183F	; = address
         DEC   L021845	; count--
         BNE   L021819	; loop
         CLC
         RTS

L02183D  DW    $0000
L02183F  DW    $0000
L021841  DW    $0000
L021843  DW    $0000
L021845  DW    $0000

L021847  DB    $01
         DB    $02
         DB    $02
         DB    $02
         DB    $04
         DB    $03
         DB    $0A
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         db    $82	; AV 202303 - bit 7 to ID a rect

L021858  JSR   L02141C
         BCS   L021869
         PEI   $42
         PHA
         PHY
         PEA   $0007
         JSL   L043069
         CLC
L021869  CLV
         RTS

L02186B  JSR   L02141C
         BCS   L0218A9
         STA   L0218AB
         STY   L0218AD
         TYX
         TAY
         SEP   #$20
         LDA   [$3A],Y
         STA   L0218AF
L02187F  INY
         DEX
         BEQ   L021895
         LDA   [$3A],Y
         EOR   L0218AF
         BEQ   L02187F
         REP   #$20
         LDA   #$0007
         JSR   L020AB8
         SEC
         CLV
         RTS

L021895  REP   #$20
         PEI   $42
         LDA   L0218AB
         PHA
         LDA   L0218AD
         PHA
         PEA   $0008
         JSL   L043069
         CLC
L0218A9  CLV
         RTS

L0218AB  DW    $0000
L0218AD  DW    $0000
L0218AF  DB    $00

L0218B0  LDA   #$000B
         BRA   L0218B8
L0218B5  LDA   #$0009
L0218B8  STA   L0219C4
         CMP   #$0009
         BEQ   L0218CB
         JSR   L02141C
         BCS   L021902
         STA   L0219BE
         TYA
         BRA   L021920
L0218CB  JSR   L021339
         BCS   L021902
         STA   L0219BE
         CPY   $42
         BNE   L0218FC
         JSR   L021309
         BCS   L021956
         CMP   #$00AC
         BEQ   L021905
         CMP   #$00AE
         BNE   L0218F6
         JSR   L021339
         BCS   L021902
         CMP   L0219BE
         BCC   L0218FC
         SBC   L0219BE
         INC
         BRA   L021920
L0218F6  LDA   #$0001
         BRA   L0218FF
L0218FB  PLA
L0218FC  LDA   #$0003
L0218FF  JSR   L020AB8
L021902  REP   #$31
         RTS

L021905  JSR   L021564
         BCS   L021902
         CMP   #$0000
         BEQ   L021902
         PHA
         DEC
         CLC
         ADC   L0219BE
         BCS   L0218FB
         BIT   $5C
         BMI   L02191F
         CMP   $3E
         BCS   L0218FB
L02191F  PLA
L021920  STA   L0219C2
         CLC
         ADC   L0219BE
         STA   L0219C0
L02192A  SEP   #$20
         LDY   L0219BE
         JSR   L021978
         LDX   #$0001
L021935  LDA   [$3A],Y
         AND   #$7F
         CMP   #$20
         BCC   L02194D
         LDA   [$3A],Y
         EOR   L0219C6
         BPL   L02194D
         DEX
L021945  JSR   L02198D
         BCS   L021902
         JSR   L021978
L02194D  CPX   L0219C2
         BCS   L021945
         INY
         INX
         BRA   L021935
L021956  SEP   #$20
         LDY   L0219BE
         LDX   #$0001
L02195E  LDA   [$3A],Y
         BEQ   L021969
         INX
         INY
         CPY   $3E
         BNE   L02195E
         DEX
L021969  STX   L0219C2
         REP   #$20
         TXA
         CLC
         ADC   L0219BE
         STA   L0219C0
         BRA   L02192A

         MX    %10
	 
L021978  PHY
L021979  LDA   [$3A],Y
         PHA
         AND   #$80
         STA   L0219C6
         PLA
         AND   #$7F
         CMP   #$20
         BCS   L02198B
         INY
         BNE   L021979
L02198B  PLY
         RTS

         MX    %00

L02198D  REP   #$20
         PEI   $42
         LDA   L0219BE
         PHA
         PHX
         LDA   L0219C4
         PHA
         TXA
         CLC
         ADC   L0219BE
         STA   L0219BE
         TXA
         SEC
         SBC   L0219C2
         EOR   #$FFFF
         INC
         STA   L0219C2
         JSL   L043069
         LDX   #$0001
         LDY   L0219BE
         CPY   L0219C0
         SEP   #$20
         RTS

L0219BE  DW    $0000
L0219C0  DW    $0000
L0219C2  DW    $0000
L0219C4  DW    $0000
L0219C6  DB    $00

L0219C7  PHP
         REP   #$30
         JSR   L021339
         BCS   L021A35
         STA   L021A41
         LDA   #$0001
         STA   L021A43
         JSR   L021309
         BCS   L0219EF
         CMP   #$00AC
         BEQ   L0219E7
         LDA   #$0001
         BRA   L021A3B
L0219E7  JSR   L021564
         BCS   L021A35
         STA   L021A43
L0219EF  SEP   #$20
         LDY   L021A41
         LDA   [$3A],Y
         AND   #$80
         STA   L021A40
L0219FB  SEP   #$20
         LDY   L021A41
         LDX   #$0001
         BRA   L021A11
L021A05  INX
         INY
         BEQ   L021A38
         BIT   $5D
         BMI   L021A11
         CPY   $3E
         BCS   L021A38
L021A11  LDA   [$3A],Y
         EOR   L021A40
         BPL   L021A05
         REP   #$20
         PEI   $42
         LDA   L021A41
         PHA
         PHX
         TXA
         CLC
         ADC   L021A41
         STA   L021A41
         PEA   $000A
         JSL   L043069
         DEC   L021A43
         BNE   L0219FB
L021A35  PLP
         CLC
         RTS

L021A38  LDA   #$0007
L021A3B  JSR   L020AB8
         BRA   L021A35

L021A40  DB    $00
L021A41  DW    $0000
L021A43  DW    $0000

L021A45  LDA   #$000F
         BRA   L021A4D
L021A4A  LDA   #$000E
L021A4D  STA   L021AC4
         JSR   L021339
         BCS   L021ABF
         CPY   $42
         BNE   L021AB9
         STA   L021AC2
         JSR   L021309
         TAX
         LDA   #$0001
         BCS   L021A6F
         CPX   #$00AC
         BNE   L021AB4
         JSR   L021564
         BCS   L021ABF
L021A6F  STA   L021AC6
L021A72  LDY   L021AC2
         LDA   [$3A],Y
         LDX   L021AC4
         CPX   #$000E
         BEQ   L021A82
         AND   #$00FF
L021A82  INC
         CPX   #$000E
         BNE   L021A89
         INC
L021A89  PEI   $42
         PHY
         PHA
         CLC
         ADC   L021AC2
         BCC   L021AA0
         BEQ   L021AA0
         PLA
         PLA
         PLA
         LDA   L021AC6
         DEC
         BNE   L021AAD
         BRA   L021AAF
L021AA0  STA   L021AC2
         PHX
         JSL   L043069
         DEC   L021AC6
         BNE   L021A72
L021AAD  CLC
         RTS

L021AAF  LDA   #$0007
         BRA   L021ABC
L021AB4  LDA   #$0001
         BRA   L021ABC
L021AB9  LDA   #$0003
L021ABC  JSR   L020AB8
L021ABF  SEC
         CLV
         RTS

L021AC2  DW    $0000
L021AC4  DW    $0000
L021AC6  DW    $0000

L021AC8  ADRL  L028C04	; 0  LOAD
         ADRL  L021BC7	; 1  TCLR
         ADRL  L021BF3	; 2  TLOAD
         ADRL  L021C54	; 3  TSAVE
         ADRL  L021CA6	; 4  GENLAB
         ADRL  L021D90	; 5  LIST
         ADRL  L021CAC	; 6  REM
         ADRL  L02438E	; 7  ?
         ADRL  L029C1B	; 8  INFOS
         ADRL  L021D8C	; 9  QUIT
         ADRL  L021D8C	; 10 BYE
         ADRL  L021E48	; 11 PFX
         ADRL  L021E80	; 12 OFF
         ADRL  L028F53	; 13 SEG
         ADRL  L025C74	; 14 SLOAD
         ADRL  L025CF4	; 15 \
         ADRL  L02238A	; 16 PHL
         ADRL  L02242B	; 17 RPHL
         ADRL  L0224CE	; 18 PHL2
         ADRL  L022578	; 19 MATCH
         ADRL  L022D08	; 20 SRC
         ADRL  L0225D9	; 21 COM
         ADRL  L025AFE	; 22 TABS
         ADRL  L02269B	; 23 CAT
         ADRL  L023D1C	; 24 ROM
         ADRL  L023DD3	; 25 STOOL
         ADRL  L023D77	; 26 MLABS
         ADRL  L023B82	; 27 MREL
         ADRL  L023CC4	; 28 REL8
         ADRL  L023CC7	; 29 RREL8
         ADRL  L0221D9	; 30 RELL
         ADRL  L023F00	; 31 TC
         ADRL  L023F10	; 32 TRON
         ADRL  L023F13	; 33 TROFF
         ADRL  L023F19	; 34 BUG
         ADRL  L029066	; 35 RLOAD
         ADRL  L025543	; 36 $
         ADRL  L025D7E	; 37 SEDIT
         ADRL  L027365	; 38 POP
         ADRL  L025DD4	; 39 DSK
         ADRL  L025CC2	; 40 SSAVE
         ADRL  L025B75	; 41 HIST
         ADRL  L0267F2	; 42 -
         ADRL  L0260AF	; 43 CFG
         ADRL  L024271	; 44 CS
         ADRL  L0241FF	; 45 C1
         ADRL  L026F79	; 46 [
         ADRL  L027330	; 47 MD
         ADRL  L027798	; 48 TST
         ADRL  L02779B	; 49 FIND
         ADRL  L027EB0	; 50 SCAN

* AV 202010 - Two new commands

	adrl	doCHON	; 51 CHON
	adrl	doCHOFF	; 52 CHOFF

*---

L021B94  DB    $00      ; 0  LOAD
         DB    $C0      ; 1  TCLR
         DB    $C0      ; 2  TLOAD
         DB    $80      ; 3  TSAVE
         DB    $C0      ; 4  GENLAB
         DB    $80      ; 5  LIST
         DB    $C0      ; 6  REM
         DB    $00      ; 7  ?
         DB    $C0      ; 8  INFOS
         DB    $00      ; 9  QUIT
         DB    $00      ; 10 BYE
         DB    $00      ; 11 PFX
         DB    $C0      ; 12 OFF
         DB    $80      ; 13 SEG
         DB    $00      ; 14 SLOAD
         DB    $C0      ; 15 \
         DB    $C0      ; 16 PHL
         DB    $C0      ; 17 RPHL
         DB    $C0      ; 18 PHL2
         DB    $C0      ; 19 MATCH
         DB    $C0      ; 20 SRC
         DB    $C0      ; 21 COM
         DB    $C0      ; 22 TABS
         DB    $00      ; 23 CAT
         DB    $40      ; 24 ROM
         DB    $C0      ; 25 STOOL
         DB    $C0      ; 26 MLABS
         DB    $C0      ; 27 MREL
         DB    $C0      ; 28 REL8
         DB    $C0      ; 29 RREL8
         DB    $C0      ; 30 RELL
         DB    $C0      ; 31 TC
         DB    $80      ; 32 TRON
         DB    $80      ; 33 TROFF
         DB    $80      ; 34 BUG
         DB    $00      ; 35 RLOAD
         DB    $00      ; 36 $
         DB    $60      ; 37 SEDIT
         DB    $00      ; 38 POP
         DB    $60      ; 39 DSK
         DB    $00      ; 40 SSAVE
         DB    $40      ; 41 HIST
         DB    $E0      ; 42 -
         DB    $00      ; 43 CFG
         DB    $C0      ; 44 CS
         DB    $C0      ; 45 C1
         DB    $00      ; 46 [
         DB    $00      ; 47 MD
         DB    $C0      ; 48 TST
         DB    $80      ; 49 FIND
         DB    $C0      ; 50 SCAN

* AV 202010 - Two new commands

	db	$00	; 51 CHON
	db	$00	; 52 CHOFF

*--- end of AV 202010

L021BC7  JSL   L041D74
         JSL   L040F9B
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         JSL   L0437E4
         JSR   L020D0C
         PEA   $0000
         PEI   $3E
         PEA   $FFFF
         JSL   L041015
         JSL   L0410DD
         JSR   L020D34
         CLC
         RTS

L021BF3  PHP
         REP   #$30
         JSR   L020D0C
         LDA   [$F8]
         AND   #$00FF
         BEQ   L021C0B
         JSR   L021586
         PEA   ^L0215CD
         PEA   L0215CD
         BRA   L021C31
L021C0B  LDAL  L041ACE
         BNE   L021C2B
         LDA   L020188
         BNE   L021C1E
         PEA   ^L021C9B
         PEA   L021C9B
         BRA   L021C31
L021C1E  LDX   L020187
         LDY   L020189
         JSR   L023EF2
         PHY
         PHX
         BRA   L021C31
L021C2B  PEA   $0000
         PEA   $0000
L021C31  JSL   L041F95
         BCC   L021C3C
         JSR   L020AF7
         BRA   L021C4E
L021C3C  REP   #$20
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         JSL   L0437E4
         JSL   L042328
L021C4E  JSR   L020D34
         PLP
         CLC
         RTS

L021C54  PHP
         REP   #$30
         LDA   [$F8]
         AND   #$00FF
         BEQ   L021C69
         JSR   L021586
         PEA   ^L0215CD
         PEA   L0215CD
         BRA   L021C8F
L021C69  LDAL  L041ACE
         BNE   L021C89
         LDA   L020188
         BNE   L021C7C
         PEA   ^L021C9B
         PEA   L021C9B
         BRA   L021C8F
L021C7C  LDX   L020187
         LDY   L020189
         JSR   L023EF2
         PHY
         PHX
         BRA   L021C8F
L021C89  PEA   $0000
         PEA   $0000
L021C8F  JSL   L042166
         BCC   L021C98
         JSR   L020AF7
L021C98  PLP
         CLC
         RTS

L021C9B  STRL  '0:Temps.T'
L021CA6  JSL   L0443B3
         CLC
         RTS

L021CAC  PHP
         REP   #$30
         STZ   L021D33
L021CB2  JSR   L021309
         BCC   L021CC3
         LDA   L021D33
         BEQ   L021CCD
         LDA   #$0000
         LDY   $3E
         BRA   L021D04
L021CC3  CMP   #$00AC
         BEQ   L021CFF
         JSR   L021CD6
         BCC   L021CB2
L021CCD  LDA   #$0001
         JSR   L020AB8
L021CD3  PLP
         CLC
         RTS

L021CD6  CMP   #$00C3
         BNE   L021CE3
         LDA   #$0001
         TSB   L021D33
         CLC
         RTS

L021CE3  CMP   #$00CC
         BNE   L021CF0
         LDA   #$0002
         TSB   L021D33
         CLC
         RTS

L021CF0  CMP   #$00C4
         BNE   L021CFD
         LDA   #$0004
         TSB   L021D33
         CLC
         RTS

L021CFD  SEC
         RTS

L021CFF  JSR   L02141C
         BCS   L021CD3
L021D04  STA   L021D2D
         TYA
         BNE   L021D0B
         DEC
L021D0B  ADC   L021D2D
         STA   L021D2F
         LDA   L021D33
         LSR
         PHA
         BCC   L021D1B
         JSR   L021D35
L021D1B  PLA
         LSR
         PHA
         BCC   L021D23
         JSR   L021D57
L021D23  PLA
         LSR
         BCC   L021D2A
         JSR   L021D79
L021D2A  PLP
         CLC
         RTS

L021D2D  DB    $00
         DB    $00
L021D2F  DB    $00
         DB    $00
         DB    $00
         DB    $00
L021D33  DB    $00
         DB    $00
L021D35  LDA   L021D2D
         JSL   L0416F3
         TAY
L021D3D  LDA   #$8000
         JSL   L04172C
         BCS   L021D56
         CPY   L021D2F
         BCS   L021D56
         PHY
         PEI   $42
         PHY
         JSL   L043563
         PLY
         BRA   L021D3D
L021D56  RTS

L021D57  LDA   L021D2D
         JSL   L0416F3
L021D5E  TAY
         LDA   #$4000
         JSL   L04172C
         BCS   L021D78
         CPY   L021D2F
         BCS   L021D78
         PHY
         PEI   $42
         PHY
         JSL   L0429D3
         PLA
         BRA   L021D5E
L021D78  RTS

L021D79  PEI   $42
         LDA   L021D2D
         PHA
         LDA   L021D2F
         SEC
         SBC   $01,S
         INC
         PHA
         JSL   L044E36
         RTS

L021D8C  SEP   #$40
         SEC
         RTS

L021D90  PHP
         REP   #$30
         JSR   L021339
         BCC   L021D9B
L021D98  PLP
         CLC
         RTS

L021D9B  CPY   $42
         BEQ   L021DA7
         LDA   #$0003
         JSR   L020AB8
         BRA   L021D98
L021DA7  TAY
         LDA   [$F8]
         AND   #$00FF
         CMP   #$00AA
         PHP
         TYA
         PLP
         BEQ   L021DBA
         PHA
         JSL   L0416D7
L021DBA  PLP
L021DBB  PHP
         REP   #$30
         BIT   L0283C2
         BPL   L021E01
         PHA
         JSL   L0300EE
         PLA
         PHY
         PHX
         PHA
         LDY   #$0002
         LDX   #$0000
         JSL   L0300E2
         PLA
         STA   $54
         PHA
         PHA
         JSL   L04155D
         STX   $56
         STX   $5A
         PLA
         LDY   #$0014
         JSL   L0405F4
         STA   $58
         STZ   L020F68
         CPY   #$00EF
         BNE   L021DFB
         LDA   #$FFFF
         STA   L020F68
L021DFB  PLX
         PLY
         JSL   L0300E2
L021E01  PLP
         CLC
         RTS

L021E04  PHP
         REP   #$30
         BIT   L0283C2
         BPL   L021E42
         JSL   L0300EE
         PHY
         PHX
         LDX   #$0000
         LDY   #$0002
         JSL   L0300E2
         LDA   $56
         STA   $5A
         LDA   $54
         LDY   #$0014
         JSL   L0405F4
         STA   $58
         STZ   L020F68
         CPY   #$00EF
         BNE   L021E39
         LDA   #$FFFF
         STA   L020F68
L021E39  PLX
         PLY
         JSL   L0300E2
         PLP
         CLC
         RTS

L021E42  JSR   L020D34
         PLP
         CLC
         RTS

L021E48  SEP   #$20
         LDA   [$F8]
         BNE   L021E51
         JMP   L0273A6

L021E51  LDX   #$0000
L021E54  JSR   L021309
         BCS   L021E61
         AND   #$7F
         STA   L02005D,X
         INX
         BRA   L021E54
L021E61  REP   #$20
         STX   L02005B
         JSL   GSOS
         DW    $2009      ; SetPrefix
         ADRL  L021E78
         BCC   L021E75
         JSR   L020AF7
L021E75  CLC
         CLV
         RTS

L021E78  DW    $0002      ; Parms for SetPrefix
         DW    $0000      ;  prefix num
         ADRL  L02005B    ;  prefix ptr
L021E80  PHP
         REP   #$30
         JSR   L021339
         BCC   L021E8B
         BRL   L021F01
L021E8B  STA   L021F04
         STY   L021F06
         JSR   L021309
         BCC   L021EDF
         LDA   L021F04
         LDY   L021F06
         CPY   $42
         BNE   L021EFB
         JSL   L0410BB
         BIT   #$8000
         BNE   L021ED0
         LDY   L021F04
         LDA   [$3A],Y
         JSL   L04037A
         TYX
         INC   L021F04
L021EB6  LDY   L021F04
         LDA   [$3A],Y
         CPX   #$0002
         BCS   L021ECB
         AND   #$00FF
         CMP   #$0080
         BCC   L021ECB
         ORA   #$FF00
L021ECB  STA   L021F08
         BRA   L021EE1
L021ED0  LDY   L021F06
         PHY
         LDA   L021F04
         PHA
         JSL   L04349E
         TYX
         BRA   L021EB6
L021EDF  BRA   L021EF6
L021EE1  LDA   L021F06
         PHA
         LDA   L021F04
         PHA
         LDA   L021F08
         PHA
         PEA   $0000
         JSL   L043813
         BRA   L021F01
L021EF6  LDA   #$0001
         BRA   L021EFE
L021EFB  LDA   #$0003
L021EFE  JSR   L020AB8
L021F01  PLP
         CLC
         RTS

L021F04  DB    $00
         DB    $00
L021F06  DB    $00
         DB    $00
L021F08  DB    $00
         DB    $00
	 
L021F0A  ADRL  L021FA1	; 0 LAB
         ADRL  L021F9A	; 1 ENT
         ADRL  L021F28	; 2 EXT
         ADRL  L021F28	; 3 EXD
         ADRL  L021F93	; 4 EQU
         ADRL  L021F28	; 5 DP

L021F22  DB    $C0	; 0 LAB
         DB    $C0	; 1 ENT
         DB    $C0	; 2 EXT
         DB    $C0	; 3 EXD
         DB    $C0	; 4 EQU
         DB    $C0	; 5 DP

L021F28  CLC
         RTS

L021F2A  PHP
         REP   #$30
         STA   $04
         JSR   L020F52
         SEP   #$30
         LDY   #$00
L021F36  LDA   [$F8],Y
         BEQ   L021F85
	 cmp	#'a'
	 bcc	nochange
	 cmp	#'z'+1
	 bcs	nochange
	 sec
	 sbc	#$20
nochange
         CMP   #$A0
         BEQ   L021F85
         CMP   #$AC	; ,
         BEQ   L021F85
         CMP   #$AE	; .
         BEQ   L021F85
         CMP   #$BA	; 9+1
         BEQ   L021F7C
         CMP   #$B0	; 0
         BCC   L021F6E
         CMP   #$BA	; 9+1
         BCC   L021F76
         CMP   #$FE	; {
         BEQ   L021F80
         CMP   #$C1	; A
         BCC   L021F6E
         CMP   #$FB	; z+1
         BCS   L021F6E
         CMP   #$DD	; ]
         BEQ   L021F7C
         CMP   #$DF	; _
         BEQ   L021F80
         CMP   #$DB	; [
         BCC   L021F80
         CMP   #$E1	; a
         BCS   L021F80
L021F6E  LDA   #$04
         JSR   L020AB8
         PLP
         SEC
         RTS

L021F76  CPY   #$00
         BNE   L021F80
         BRA   L021F6E
L021F7C  CPY   #$00
         BNE   L021F6E
L021F80  INY
         STA   ($04),Y
         BRA   L021F36
L021F85  TYA
         STA   ($04)
         REP   #$20
         TYA
         CLC
         ADC   $F8
         STA   $F8
         PLP
         CLC
         RTS

L021F93  PHP
         SEP   #$30
         LDA   #$04
         BRA   L021FA6
L021F9A  PHP
         SEP   #$30
         LDA   #$01
         BRA   L021FA6
L021FA1  PHP
         SEP   #$30
         LDA   #$00
L021FA6  STA   L022085
         REP   #$30
         JSR   L021367
         BCS   L022013
         BVS   L021FCD
         STA   L022081
         STY   L022083
         LDX   L022085
         CPX   #$0004
         BCS   L021FD3
         PHY
         PHA
         JSL   L042ABB
         BCC   L021FCD
         LDA   #$0003
         BRA   L022010
L021FCD  STA   L022081
         STY   L022083
L021FD3  JSR   L021309
         BCS   L022035
         CMP   #$00AC
         BEQ   L021FE6
         LDA   #$0001
         JSR   L020AB8
         PLP
         CLC
         RTS

L021FE6  LDA   #L022089
         JSR   L021F2A
         BCS   L022013
         LDA   L022089
         AND   #$00FF
         BEQ   L022064
         LDA   L02208A
         AND   #$00FF
         CMP   #$00BA
         BEQ   L022016
         PEA   ^L022089
         PEA   L022089
         JSL   L0426C7
         BCS   L022016
         LDA   #$0002
L022010  JSR   L020AB8
L022013  PLP
         CLC
         RTS

L022016  JSR   L022063
         LDA   L022083
         PHA
         LDA   L022081
         PHA
         PEA   $0000
         LDA   L022085
         PHA
         PEA   ^L022089
         PEA   L022089
         JSL   L042748
L022032  PLP
         CLC
         RTS

L022035  LDA   L022085
         CMP   #$0001
         BNE   L022064
         STZ   L022089
         LDA   L022083
         PHA
         LDA   L022081
         PHA
         PEA   ^L022089
         PEA   L022089
         JSL   L0428B4
         BCS   L022032
         LDA   L022089
         AND   #$00FF
         BEQ   L02205E
         BRA   L022016
L02205E  LDA   #$0006
         BRA   L022010
L022063  PHP
L022064  LDA   L022083
         PHA
         LDA   L022081
         PHA
         LDA   L022085
         CMP   #$0004
         BCC   L02207A
         JSL   L0429B6
         BRA   L02207E
L02207A  JSL   L0429D3
L02207E  PLP
         CLC
         RTS

L022081  DB    $00
         DB    $00
L022083  DB    $00
         DB    $00
L022085  DB    $00
         DB    $00
         DB    $00
         DB    $00
L022089  DB    $00
L02208A  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L0220D2  ADRL  L02218E	 ; 0 ORG
         ADRL  L0220F0	 ; 1 MX
         ADRL  $00000000 ; 2 ORG
         ADRL  $00000000 ; 3 " "
         ADRL  L02233C	 ; 4 DBR
         ADRL  $00000000 ; 5 B=K

L0220EA  DB    $C0	; 0 ORG
         DB    $C0	; 1 MX
         DB    $00	; 2 ORG
         DB    $00	; 3 " "
         DB    $C0	; 4 DBR
         DB    $00	; 5 B=K

L0220F0  PHP
         REP   #$30
         LDA   [$F8]
         AND   #$00FF
         CMP   #$00A5
         BEQ   L022139
         JSR   L021339
         BCC   L022105
         BRL   L022187
L022105  STA   L02218A
         JSR   L021309
         BCS   L022114
         CMP   #$00AC
         BNE   L022181
         BRA   L022124
L022114  JSR   L022119
         BRA   L022187
L022119  PEI   $42
         LDA   L02218A
         PHA
         JSL   L042D9E
         RTS

L022124  JSR   L022150
         BCS   L022181
         PEI   $42
         LDA   L02218A
         PHA
         LDA   L02218C
         PHA
         JSL   L042D43
         BRA   L022187
L022139  JSR   L022150
         BCS   L022181
         SEP   #$20
         PHA
         AND   #$0F
         STA   $31
         PLA
         LSR
         LSR
         LSR
         LSR
         STA   $30
         REP   #$20
         BRA   L022187
L022150  SEP   #$20
         JSR   L021309
         BCS   L022174
         CMP   #$A5
         BNE   L022174
         JSR   L022178
         BCS   L022174
         ASL
         ASL
         ASL
         ASL
         STA   L02218C
         JSR   L022178
         BCS   L022174
         ORA   L02218C
         STA   L02218C
         CLC
	 HEX   B0
L022174  SEC
         REP   #$20
         RTS

         MX    %10
L022178  JSR   L021309
         SEC
         SBC   #$B0
         CMP   #$02
         RTS

         MX    %00
L022181  LDA   #$0001
         JSR   L020AB8
L022187  PLP
         CLC
         RTS

L02218A  DB    $00
         DB    $00
L02218C  DB    $00
         DB    $00
L02218E  PHP
         REP   #$30
         JSR   L021339
         BCC   L022199
L022196  PLP
         CLC
         RTS

L022199  STA   L0221D7
         JSR   L021309
         BCS   L0221CB
         CMP   #$00AC
         BEQ   L0221AE
         LDA   #$0001
         JSR   L020AB8
L0221AC  BRA   L022196
L0221AE  JSR   L021367
         BCS   L022196
         LDX   L0221D7
         PEI   $42
         PHX
         PEA   $0000
         PHY
         PHA
         PEI   $42
         PHX
         JSL   L042C85
         JSL   L042BC0
         BRA   L022196
L0221CB  PEI   $42
         LDA   L0221D7
         PHA
         JSL   L042C85
         BRA   L022196
L0221D7  DB    $00
         DB    $00
L0221D9  PHP
         REP   #$30
         JSR   L021339
         BCC   L0221E4
L0221E1  PLP
         CLC
         RTS

L0221E4  STA   L022330
         STZ   L022334
         STZ   L022336
         JSR   L021309
         BCC   L02221B
         LDA   L022330
         JSL   L040586
         STA   L022332
         CPY   #$0000
         BNE   L02220F
         DEC
         STA   L022332
         INC   L022330
         CMP   #$0002
         BCC   L0221E1
         BRA   L022244
L02220F  CMP   #$0005
         BCS   L0221E1
         CMP   #$0002
         BCC   L0221E1
         BRA   L022244
L02221B  CMP   #$00AC
         BEQ   L022223
         BRL   L022323
L022223  JSR   L021309
         SEC
         SBC   #$00B0
         BNE   L02222F
         BRL   L022328
L02222F  CMP   #$0005
         BCC   L022237
         BRL   L022328
L022237  STA   L022332
         STZ   L022334
         LDA   [$F8]
         AND   #$00FF
         BNE   L022280
L022244  LDY   L022330
         LDA   [$3A],Y
         STA   L022338
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         STA   L02233A
         LDA   L022332
         CMP   #$0003
         BCS   L02226B
         PEI   $42
         LDA   L022330
         PHA
         JSL   L042A5C
         STY   L02233A
L02226B  LDA   L02233A
         PHA
         LDA   L022338
         PHA
         JSL   L042ABB
         STA   L022338
         STY   L02233A
         BRL   L0222FE
L022280  JSR   L02153D
         BCC   L022288
         BRL   L022320
L022288  LDA   [$F8]
         AND   #$00FF
         CMP   #$00AD
         BNE   L02229B
         JSR   L021309
         LDA   #$FFFF
         STA   L022334
L02229B  PEI   $FA
         PEI   $F8
         LDX   #$0002
         JSL   L0306BD
         PLX
         STX   $F8
         PLX
         STX   $FA
         BCS   L022323
         BIT   L022334
         BPL   L0222B7
         EOR   #$FFFF
         INC
L0222B7  STA   L022334
         JSR   L02153D
         BCS   L022320
         JSR   L021339
         BCS   L022320
         STA   L022338
         STY   L02233A
         JSR   L021309
         BCS   L0222FE
         CMP   #$00AB
         BEQ   L0222DF
         CMP   #$00AD
         BNE   L022323
         LDA   #$FFFF
         STA   L022336
L0222DF  PEI   $FA
         PEI   $F8
         LDX   #$0002
         JSL   L0306BD
         PLX
         STX   $F8
         PLX
         STX   $FA
         BCS   L022323
         BIT   L022336
         BPL   L0222FB
         EOR   #$FFFF
         INC
L0222FB  STA   L022336
L0222FE  PEI   $42
         LDA   L022330
         PHA
         LDA   L022332
         PHA
         SEP   #$20
         LDA   L022336
         PHA
         LDA   L022334
         PHA
         REP   #$20
         LDY   L02233A
         PHY
         LDA   L022338
         PHA
         JSL   L043774
L022320  PLP
         CLC
         RTS

L022323  LDA   #$0001
         BRA   L02232B
L022328  LDA   #$0003
L02232B  JSR   L020AB8
         BRA   L022320
L022330  DB    $00
         DB    $00
L022332  DB    $00
         DB    $00
L022334  DB    $00
         DB    $00
L022336  DB    $00
         DB    $00
L022338  DB    $00
         DB    $00
L02233A  DB    $00
         DB    $00
L02233C  PHP
         REP   #$30
         JSR   L021339
         BCS   L022385
         STA   L022388
         JSR   L021309
         BCS   L022373
         CMP   #$00AC
         BNE   L02237F
         PEI   $FA
         PEI   $F8
         LDX   #$0002
         JSL   L0306BD
         PLX
         STX   $F8
         PLX
         STX   $FA
         AND   #$00FF
         TAX
         PEI   $42
         LDA   L022388
         PHA
         PHX
         JSL   L042E01
         BRA   L022385
L022373  PEI   $42
         LDA   L022388
         PHA
         JSL   L042ED4
         BRA   L022385
L02237F  LDA   #$0001
         JSR   L020AB8
L022385  PLP
         CLC
         RTS

L022388  DB    $00
         DB    $00
L02238A  PHP
         REP   #$30
         JSR   L021339
         BCS   L0223EB
         STA   L022425
         CPY   $42
         BNE   L0223EB
         TAY
         INY
         LDA   [$3A],Y
         STA   L022429
         PHA
         INY
         INY
         INY
         LDA   [$3A],Y
         STA   L022427
         PHA
         JSL   L042ABB
         BCS   L0223EE
         STA   L022427
         STY   L022429
         PEI   $42
         LDA   L022425
         INC
         PHA
         PEA   $0002
         PEA   $00F0
         LDA   L022429
         PHA
         LDA   L022427
         PHA
         JSL   L043774
         PEI   $42
         LDA   L022425
         CLC
         ADC   #$0004
         PHA
         PEA   $0002
         PEA   $0000
         LDA   L022429
         PHA
         LDA   L022427
         PHA
         JSL   L043774
L0223EB  PLP
         CLC
         RTS

L0223EE  PEI   $42
         LDA   L022425
         INC
         PHA
         PEA   $0002
         PEA   $00F0
         LDA   L022429
         PHA
         LDA   L022427
         PHA
         JSL   L043772
         PEI   $42
         LDA   L022425
         CLC
         ADC   #$0004
         PHA
         PEA   $0002
         PEA   $0000
         LDA   L022429
         PHA
         LDA   L022427
         PHA
         JSL   L043772
         BRA   L0223EB
L022425  DB    $00
         DB    $00
L022427  DB    $00
         DB    $00
L022429  DB    $00
         DB    $00
L02242B  PHP
         REP   #$30
         JSR   L021339
         BCS   L02248E
         CPY   $42
         BNE   L02248E
         STA   L0224C8
         TAY
         INY
         LDA   [$3A],Y
         STA   L0224CA
         PHA
         INY
         INY
         INY
         LDA   [$3A],Y
         STA   L0224CC
         PLX
         PHA
         PHX
         JSL   L042ABB
         BCS   L022491
         STA   L0224CA
         STY   L0224CC
         PEI   $42
         LDA   L0224C8
         INC
         PHA
         PEA   $0002
         PEA   $0000
         LDA   L0224CC
         PHA
         LDA   L0224CA
         PHA
         JSL   L043774
         PEI   $42
         LDA   L0224C8
         CLC
         ADC   #$0004
         PHA
         PEA   $0002
         PEA   $00F0
         LDA   L0224CC
         PHA
         LDA   L0224CA
         PHA
         JSL   L043774
L02248E  PLP
         CLC
         RTS

L022491  PEI   $42
         LDA   L0224C8
         INC
         PHA
         PEA   $0002
         PEA   $0000
         LDA   L0224CC
         PHA
         LDA   L0224CA
         PHA
         JSL   L043772
         PEI   $42
         LDA   L0224C8
         CLC
         ADC   #$0004
         PHA
         PEA   $0002
         PEA   $00F0
         LDA   L0224CC
         PHA
         LDA   L0224CA
         PHA
         JSL   L043772
         BRA   L02248E
L0224C8  DB    $00
         DB    $00
L0224CA  DB    $00
         DB    $00
L0224CC  DB    $00
         DB    $00
L0224CE  PHP
         REP   #$30
         JSR   L021339
         BCS   L02253B
         CPY   $42
         BNE   L02253B
         STA   L022570
         TAY
         LDA   [$3A],Y
         STA   L022576
         JSR   L02153D
         BCS   L02253B
         JSR   L021339
         BCS   L02253B
         CPY   $42
         BNE   L02253B
         STA   L022572
         TAY
         LDA   [$3A],Y
         STA   L022574
         LDY   L022576
         PHY
         PHA
         JSL   L042ABB
         BCS   L02253E
         STA   L022574
         STY   L022576
         PEI   $42
         LDA   L022570
         PHA
         PEA   $0002
         PEA   $00F0
         LDA   L022576
         PHA
         LDA   L022574
         PHA
         JSL   L043774
         PEI   $42
         LDA   L022572
         PHA
         PEA   $0002
         PEA   $0000
         LDA   L022576
         PHA
         LDA   L022574
         PHA
         JSL   L043774
L02253B  PLP
         CLC
         RTS

L02253E  PEI   $42
         LDA   L022570
         PHA
         PEA   $0002
         PEA   $00F0
         LDA   L022576
         PHA
         LDA   L022574
         PHA
         JSL   L043772
         PEI   $42
         LDA   L022572
         PHA
         PEA   $0002
         PEA   $0000
         LDA   L022576
         PHA
         LDA   L022574
         PHA
         JSL   L043772
         BRA   L02253B
L022570  DB    $00
         DB    $00
L022572  DB    $00
         DB    $00
L022574  DB    $00
         DB    $00
L022576  DB    $00
         DB    $00
L022578  PHP
         REP   #$30
         STZ   L0225D7
L02257E  JSR   L021309
         BCS   L0225BA
         JSR   L022591
         BCC   L02257E
L022588  LDA   #$0001
         JSR   L020AB8
         PLP
         CLC
         RTS

L022591  CMP   #$00C3
         BNE   L02259E
         LDA   #$0001
         TSB   L0225D7
         CLC
         RTS

L02259E  CMP   #$00CC
         BNE   L0225AB
         LDA   #$0002
         TSB   L0225D7
         CLC
         RTS

L0225AB  CMP   #$00C4
         BNE   L0225B8
         LDA   #$0004
         TSB   L0225D7
         CLC
         RTS

L0225B8  SEC
         RTS

L0225BA  LDA   L0225D7
         BEQ   L022588
         LSR
         PHA
         BCC   L0225C3
L0225C3  PLA
         LSR
         PHA
         BCC   L0225D0
         JSL   L044A2D
         JSL   L044A71
L0225D0  PLA
         LSR
         BCC   L0225D4
L0225D4  PLP
         CLC
         RTS

L0225D7  DB    $00
         DB    $00
L0225D9  JSR   L021339
         BCS   L02261B
         STA   L022650
         STY   L02264E
         JSR   L021309
         BCS   L022625
         CMP   #$00AC
         BNE   L02261D
         SEP   #$20
         LDY   #$0000
L0225F3  LDA   [$F8],Y
         BEQ   L0225FD
         STA   L022653,Y
         INY
         BRA   L0225F3
L0225FD  SEP   #$10
         STY   L022652
         REP   #$30
         CPY   #$0000
         BEQ   L02261D
         LDA   L02264E
         PHA
         LDA   L022650
         PHA
         PEA   ^L022652
         PEA   L022652
         JSL   L04386A
L02261B  CLC
         RTS

L02261D  LDA   #$0000
         JSR   L020AB8
         CLC
         RTS

L022625  LDA   L02264E
         EOR   $42
         BNE   L02263A
         LDA   L022650
         PHA
         PEA   $0001
         PEA   $0400
         JSL   L041015
L02263A  LDA   L02264E
         PHA
         LDA   L022650
         PHA
         PEA   $0001
         PEA   $FF66
         JSL   L0435FB
         CLC
         RTS

L02264E  DB    $00
         DB    $00
L022650  DB    $00
         DB    $00
L022652  DB    $00
L022653  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02269B  JSR   L020D34
         JSL   L030314
         ADR   L0228A4
         JSL   L030314
         ADR   L0228F5
         JSL   L030035
         DB    $04
         DB    $15
         DB    $00
         DB    $4F
         JSR   L021586
         LDA   L0215CD
         BNE   L0226C5
         INC   L0215CD
         LDA   #$0030
         STA   L0215CF

L0226C5  PEA   ^L022838
         PEA   L022838
         PEA   $2010      ; Open
         JSL   GSOS2
         BCC   L0226D7
         BRL   L02275C
L0226D7  LDA   L02283A
         STA   L022846
         STA   L022842
         STZ   L02284A
         STZ   L02284C
         PEA   ^L022844
         PEA   L022844
         PEA   $201C      ; GetDirEntry
         JSL   GSOS2
         BCS   L022759
         LDA   #$0001
         STA   L022832
         LDA   L022852
         STA   L022836
         BEQ   L02272F
         CMP   #$0012
         BCC   L02270B
         LDA   #$0012
L02270B  STA   L022834
         LDA   L022832
L022711  STA   L02284C
         JSR   L022824
         BCS   L022759
         JSR   L022946
         LDA   L02284C
         INC
         CMP   L022834
         BEQ   L022727
         BCS   L02272F
L022727  PHA
         JSL   L0302D4
         PLA
         BRA   L022711
L02272F  SEP   #$20
L022731  JSL   L03059F
         BCS   L022731
         XBA
         TAY
         XBA
         REP   #$20
         AND   #$00FF
         CMP   #$008D
         BEQ   L022769
         CMP   #$009B
         BEQ   L022769
         CMP   #$008A
         BEQ   L022786
         CMP   #$008B
         BNE   L02272F
         BRL   L0227DA
         JSR   L020AF7
L022759  JSR   L022774
L02275C  SEP   #$20
         STAL  $E0C001
         REP   #$20
         JSR   L020AF7
         BRA   L02276C
L022769  JSR   L022774
L02276C  JSR   L020D34
         JSR   L021E04
         CLC
         RTS

L022774  PHP
         PHA
         PEA   ^L022840
         PEA   L022840
         PEA   $2014      ; Close
         JSL   GSOS2
         PLA
         PLP
         RTS

L022786  LDA   L022834
         CMP   L022836
         BCS   L02272F
         TYA
         LSR
         BCC   L0227B4
         JSL   L0300D1
         LDA   L022834
         CLC
         ADC   #$0012
         CMP   L022836
         BCC   L0227A7
         LDA   L022836
         BRA   L0227A7
L0227A7  STA   L022834
         SEC
         SBC   #$0011
         STA   L022832
         BRL   L022711
L0227B4  LDA   L022834
         INC
         STA   L022834
         STA   L02284C
         INC   L022832
         JSR   L022824
         BCS   L022759
         JSL   L030139
         LDX   #$0000
         LDY   #$0015
L0227D0  JSL   L0300E2
         JSR   L022946
         BRL   L02272F
L0227DA  LDA   L022832
         DEC
         BNE   L0227E3
         BRL   L02272F
L0227E3  TYA
         LSR
         BCC   L022803
         JSL   L0300D1
         LDA   L022832
         SEC
         SBC   #$0012
         BMI   L0227F6
         BNE   L0227F9
L0227F6  LDA   #$0001
L0227F9  STA   L022832
         CLC
         ADC   #$0011
         BRL   L02270B
L022803  LDA   L022832
         DEC
         STA   L022832
         STA   L02284C
         DEC   L022834
         JSR   L022824
         BCC   L022818
         BRL   L022759
L022818  JSL   L030193
         LDX   #$0000
         LDY   #$0004
         BRA   L0227D0
L022824  PEA   ^L022844
         PEA   L022844
         PEA   $201C      ; GetDirEntry
         JSL   GSOS2
         RTS

L022832  DB    $00
         DB    $00
L022834  DB    $00
         DB    $00
L022836  DB    $00
         DB    $00

L022838  DW    $0002      ; Parms for Open
L02283A  DW    $0000      ;  ref num
         ADRL  L0215CD    ;  path name

L022840  DW    $0001      ; Parms for Close
L022842  DW    $0000      ;  ref num

L022844  DW    $0011      ; Parms for GetDirEntry
L022846  DW    $0000      ;  ref num
         DW    $0000      ;  flags
L02284A  DW    $0000      ;  base
L02284C  DW    $0000      ;  displacement
         ADRL  L022882    ;  file name
L022852  DW    $0000      ;  entry num
L022854  DW    $0000      ;  file type
L022856  ADRL  $00000000  ;  end of file
L02285A  ADRL  $00000000  ;  blocks used
         DS    8          ;  creation date
L022866  DS    8          ;  modification date
         DW    $0000      ;  access
L022870  ADRL  $00000000  ;  aux type
         DW    $0000      ;  file system
         ADRL  $00000000  ;  option list
L02287A  ADRL  $00000000  ;  resource eof
L02287E  ADRL  $00000000  ;  resource blocks

L022882  DW    $0020
L022884  DB    $00
L022885  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L0228A4  STR   " Name            Type  Blocks| Rez      Last modif      Length|  Rez    Auxtype"8D
*L0228F5 STR   " LLLL            LLLL  LLLLLLLLLLLL     LLLLLLLLLL      LLLLLLLLLLLLLL  LLLLLLL "
L0228F5  DB    $50
	 HEX   A04C4C4C4CA0A0A0A0A0A0A0A0A0A0A0
	 HEX   A04C4C4C4CA0A04C4C4C4C4C4C4C4C4C
	 HEX   4C4C4CA0A0A0A0A04C4C4C4C4C4C4C4C
	 HEX   4C4CA0A0A0A0A0A04C4C4C4C4C4C4C4C
	 HEX   4C4C4C4C4C4C4CA0A04C4C4C4C4C4CA0

L022946  PHP
         SEP   #$30
         LDX   L022884
         STX   L022885
L02294F  LDA   L022885,X
         ORA   #$80
         STA   L022885,X
         DEX
         BNE   L02294F
         JSL   L0300EE
         LDX   #$01
         JSL   L0300E2
         JSL   L030314
         ADR   L022885
         STZ   L022885
         JSL   L0300EE
         LDX   #$12
         JSL   L0300E2
         LDX   L022C57
         LDA   L022854
L02297E  CMP   L022C57,X
         BEQ   L0229A0
         DEX
         BNE   L02297E
         PHA
         LDA   #$A4
         JSL   L03022D
         PLA
         JSL   L030837
         XBA
         PHA
         XBA
         JSL   L03022D
         PLA
         JSL   L03022D
         BRA   L0229C2
L0229A0  REP   #$30
         DEX
         TXA
         PHA
         ASL
         ADC   $01,S
         STA   $01,S
         PLA
         TAX
         SEP   #$20
         LDY   #$0003
L0229B1  LDA   L022C84,X
         PHY
         PHX
         JSL   L03022D
         PLX
         PLY
         INX
         DEY
         BNE   L0229B1
         SEP   #$10
L0229C2  JSL   L0300EE
         LDX   #$18
         JSL   L0300E2
         REP   #$30
         LDA   L02285A
         JSR   L022B58
         LDX   #$0005
         JSR   L022AE5
         LDA   #$00A0
         JSL   L0301F9
         LDA   L02287E
         JSR   L022B58
         LDX   #$0005
         JSR   L022AE5
         SEP   #$30
         JSL   L0300EE
         LDX   #$26
         JSL   L0300E2
         LDX   #$07
L0229FB  LDA   L022866,X
         STA   L022AAC,X
         DEX
         BPL   L0229FB
         JSR   L022A4D
         JSL   L0300EE
         LDX   #$37
         JSL   L0300E2
         REP   #$30
         LDY   L022856+2
         LDA   L022856
         LDX   #$0006
         JSR   L022BD4
         JSL   L0302E1
         STR   " "
         LDY   L02287A+2
         LDA   L02287A
         LDX   #$0006
         JSR   L022BD4
         JSL   L0300EE
         LDX   #$004A
         JSL   L0300E2
         LDA   #$00A4
         JSL   L03022D
         LDA   L022870
         PHA
         JSL   L030670
         PLP
         RTS

L022A4D  PHP
         REP   #$30
         LDA   L022AB0
         INC
         JSR   L022AD8
         SEP   #$30
         LDA   #$AD
         JSL   L03022D
         LDA   L022AB1
         PHA
         ASL
         ADC   $01,S
         STA   $01,S
         PLX
         LDY   #$03
L022A6B  LDA   L022AB4,X
         PHY
         PHX
         JSL   L03022D
         PLX
         PLY
         INX
         DEY
         BNE   L022A6B
         LDA   #$AD
         JSL   L03022D
         REP   #$30
         LDA   L022AAF
         JSR   L022AD8
         LDA   #$00A0
         JSL   L03022D
         LDA   L022AAE
         JSR   L022AD8
         LDA   #$00BA
         JSL   L03022D
         LDA   L022AAD
         AND   #$00FF
         JSR   L022B58
         PHA
         JSL   L03065A
         PLP
         RTS

L022AAC  DB    $00
L022AAD  DB    $00
L022AAE  DB    $00
L022AAF  DB    $00
L022AB0  DB    $00
L022AB1  DB    $00
         DB    $00
         DB    $00
L022AB4  ASC   "JAN"
         ASC   "FEB"
         ASC   "MAR"
         ASC   "APR"
         ASC   "MAY"
         ASC   "JUN"
         ASC   "JUL"
         ASC   "AUG"
         ASC   "SEP"
         ASC   "OCT"
         ASC   "NOV"
         ASC   "DEC"
L022AD8  AND   #$00FF
         JSR   L022B58
         LDX   #$0002
         JSR   L022AFC
         RTS

L022AE5  CMP   #$0000
         BNE   L022AFC
         CPY   #$0000
         BNE   L022AFC
L022AEF  PHX
         LDA   #$00A0
         JSL   L03022D
         PLX
         DEX
         BNE   L022AEF
         RTS

L022AFC  PHA
         LSR   L022B54
         DEX
         STX   L022B52
         CPX   #$0004
         BCS   L022B17
L022B09  CPX   #$0003
         BEQ   L022B1E
         PLA
         ASL
         ASL
         ASL
         ASL
         PHA
         INX
         BRA   L022B09
L022B17  TYA
L022B18  JSL   L030823
         BRA   L022B2F
L022B1E  PLA
         LDX   #$0004
L022B22  ASL
         ROL   L022B56
         DEX
         BNE   L022B22
         PHA
         LDA   L022B56
         BRA   L022B18
L022B2F  DEC   L022B52
         BMI   L022B47
         BIT   L022B54
         BMI   L022B47
         CMP   #$00B0
         BNE   L022B43
         LDA   #$00A0
         BRA   L022B47
L022B43  SEC
         ROR   L022B54
L022B47  JSL   L03022D
         BIT   L022B52
         BPL   L022B1E
         PLA
         RTS

L022B52  DB    $00
         DB    $00
L022B54  DB    $00
         DB    $00
L022B56  DB    $00
         DB    $00
L022B58  STA   L022B8E
         STZ   L022B92
         STZ   L022B90
         LDX   #$0000
L022B64  LSR   L022B8E
         BCC   L022B7E
         SED
         CLC
         LDA   L022B94,X
         ADC   L022B90
         STA   L022B90
         LDA   L022B94+2,X
         ADC   L022B92
         STA   L022B92
         CLD
L022B7E  INX
         INX
         INX
         INX
         CPX   #$0040
         BCC   L022B64
         LDY   L022B92
         LDA   L022B90
         RTS

L022B8E  DB    $00
         DB    $00
L022B90  DB    $00
         DB    $00
L022B92  DB    $00
         DB    $00
L022B94  ADRL  $00000001
         ADRL  $00000002
         ADRL  $00000004
         ADRL  $00000008
         ADRL  $00000016
         ADRL  $00000032
         ADRL  $00000064
         ADRL  $00000128
         ADRL  $00000256
         ADRL  $00000512
         ADRL  $00001024
         ADRL  $00002048
         ADRL  $00004096
         ADRL  $00008192
         ADRL  $00016384
         ADRL  $00032768
         MX    %00
L022BD4  CMP   #$0000
         BNE   L022BEB
         CPY   #$0000
         BNE   L022BEB
L022BDE  PHX
         LDA   #$00A0
         JSL   L03022D
         PLX
         DEX
         BPL   L022BDE
         RTS

L022BEB  DEX
         STX   L022C4F
         STY   L022C55
         STA   L022C53
L022BF5  CPX   #$0007
         BEQ   L022C10
         ASL
         ROL   L022C55
         ASL
         ROL   L022C55
         ASL
         ROL   L022C55
         ASL
         ROL   L022C55
         STA   L022C53
         INX
         BRA   L022BF5
L022C10  LSR   L022C51
L022C13  LDX   #$0004
L022C16  ASL   L022C53
         ROL   L022C55
         ROL
         DEX
         BNE   L022C16
         JSL   L030823
         BIT   L022C51
         BMI   L022C45
         CMP   #$00B0
         BNE   L022C38
         LDY   L022C4F
         BEQ   L022C38
         LDA   #$00A0
         BRA   L022C45
L022C38  PHA
         LDA   #$00A4
         JSL   L03022D
         PLA
         SEC
         ROR   L022C51
L022C45  JSL   L03022D
         DEC   L022C4F
         BPL   L022C13
         RTS

L022C4F  DB    $00
         DB    $00
L022C51  DB    $00
         DB    $00
L022C53  DB    $00
         DB    $00
L022C55  DB    $00
         DB    $00
L022C57  DB    $2C
         DB    $00
         DB    $04
         DB    $06
         DB    $0F
         DB    $B3
         DB    $FF
         DB    $F8
         DB    $FC
         DB    $C9
         DB    $CA
         DB    $B0
         DB    $B1
         DB    $B2
         DB    $B4
         DB    $B5
         DB    $B6
         DB    $B7
         DB    $B8
         DB    $B9
         DB    $BA
         DB    $BB
         DB    $BC
         DB    $BD
         DB    $C7
         DB    $F9
         DB    $FA
         DB    $FB
         DB    $FD
         DB    $FE
         DB    $C0
         DB    $C1
         DB    $E0
         DB    $01
         DB    $5A
         DB    $19
         DB    $1A
         DB    $1B
         DB    $FE
         DB    $07
         DB    $D5
         DB    $D6
         DB    $D7
         DB    $D8
         DB    $5E

L022C84  ASC   "UNKTXTBINDIRS16SYSLNKBASFNDICNSRCOBJLIBR"
         ASC   "TLEXEPIFTIFNDACDATOLDRVTLKFSTCDVOS INTIV"
         ASC   "RVARRELPNTPICLBRBADCFGADBAWPASPRELFNTMUS"
         ASC   "INSMDISNDDVU"

*--- Command SRC (20)

L022D08  PHP		; 20 SRC
         SEP   #$20
         REP   #$10
         JSR   L022F65
         BCC   L022D15
         BRL   L022DB7
L022D15  LDX   #$0000
L022D18  JSR   L021309
         BCS   L022D25
         AND   #$7F
         STA   L02331D+2,X
         INX
         BNE   L022D18
L022D25  REP   #$20
         CPX   #$0000
         BEQ   L022D37
         LDA   #$532E	; .S
         STA   L02331D+2,X
         INX
         INX
         STX   L02331D

L022D37  JSR   L022E10	; create file
         BCC   L022D3F
         BRL   L022DB7

L022D3F  JSR   L0233DD
         LDX   #$0024
         LDY   #$000D
         JSL   L0300E2
         LDA   L0230B5
         PHA
         JSL   L030670
         LDA   L0230C5
         XBA
         STA   L0230C5
         CLC
         ADC   L02338F
         STA   L02338F
         PEA   ^L0230C5
         PEA   L0230C5
         LDA   L0230B1
         PHA
         LDA   L0230AF
         PHA
         JSL   L030852
         STZ   L0230C5
         CLC
         LDA   L0230BD
         ADC   L0230B5
         STA   L0230B5
         BCS   L022D9A
         BIT   L0230B9
         BMI   L022D8D
         CMP   L0230B7
         BCS   L022D9A
L022D8D  LDA   L02338F	; length of source
         CMP   #$BF00
         BCC   L022D98
         BRL   L022F28	; must create another file because it is a big source file
L022D98  BRA   L022D3F

L022D9A  JSL   GSOS
         DW    $2013      ; Write
         ADRL  L023387
         BCS   L022DBD
         JSR   L022DC5	; GetMark + Close
         BCC   L022DAE
         BRL   L022E34
L022DAE  JSR   L0239B0
         JSR   L02308D	; disposehandle
         JSR   L023AF9
L022DB7  JSR   L023079
         PLP
         CLC
         RTS

L022DBD  JSR   L022DE7
         JSR   L020AF7
         BRA   L022DB7

L022DC5  JSL   GSOS
         DW    $2017      ; GetMark
         ADRL  L0233C7
         BCS   L022DE7

         LDA   L0233CB	; position
         STA   L0233D5	; eof
         LDA   L0233CB+2	; position+2
         STA   L0233D5+2	; eof+2
         JSL   GSOS
         DW    $2018      ; SetEOF
         ADRL  L0233CF

L022DE7  PHP
         PHA
	
* AV 202010 - Output one or more source files?

	lda	fgOUTPUT
	bne	L022DE8
	
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L0233D9

L022DE8  PLA
         PLP
         RTS

L022DF6  JSL   GSOS
         DW    $2006      ; GetFileInfo
         ADRL  L023375
         BCS   L022E0F

         LDA   L02337D
         SEC
         SBC   #$0004
         CMP   #$0001
         LDA   #$0000
L022E0F  RTS

*--- Create file

L022E10  JSL   GSOS
         DW    $2001      ; Create
         ADRL  L023367
         BCC   L022E39
         CMP   #$0047
         BNE   L022E34
         JSR   L022DF6
         BCC   L022E39
         CMP   #$0000
         BNE   L022E34
         LDA   #$000D
         JSR   L020AB8
         BRL   L022DB7
L022E34  JSR   L020AF7
         SEC
         RTS

L022E39  JSL   GSOS
         DW    $2010      ; Open
         ADRL  L02337F
         BCS   L022E34
         LDA   L023381
         STA   L023389
         STA   L023399
         STA   L0233A9
         STA   L0233B9
         STA   L0233C9
         STA   L0233D1
         STA   L0233DB
         LDA   L0230B3	; first pass?
         BNE   L022E65	; no
         JSR   L022E67	; yes, write header
L022E65  CLC
         RTS

*--- Output Disassembled with the Flaming Bird Disassembler

L022E67  JSL   GSOS
         DW    $2013      ; Write
         ADRL  L023397
         STZ   L0230C5
         LDA   L0283CA
         BEQ   L022E8B
         PEA   ^L022F16
         PEA   L022F16
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0307DD
         BRA   L022EE6
L022E8B  LDA   #$B0A4
         STA   L022F1C+6
         LDA   L028451
         AND   #$00FF
         PHA
         PHA
         PHA
         PHA
         _HexIt
         PLA
         PLA
         ORA   #$8080
         STA   L022F1C+7
         LDA   L022C57
         AND   #$00FF
         TAX
         PLA
         SEP   #$20
L022EB4  CMP   L022C57,X
         BEQ   L022EBE
         DEX
         BNE   L022EB4
         BRA   L022ED4
L022EBE  REP   #$20
         DEX
         TXA
         PHA
         ASL
         ADC   $01,S
         PLX
         TAX
         LDA   L022C84,X
         STA   L022F1C+6
         LDA   L022C84+1,X
         STA   L022F1C+7
L022ED4  REP   #$20
         PEA   ^L022F1C
         PEA   L022F1C
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0307DD
L022EE6  PEA   ^L022F26
         PEA   L022F26
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0307DD
         LDA   L0230C5
         XBA
         STA   L0230C5
         STA   L02338F
         PEA   ^L0230C5
         PEA   L0230C5
         LDA   L0230B1
         PHA
         LDA   L0230AF
         PHA
         JSL   L030852
         STZ   L0230C5
         RTS

L022F16  STR   " REL"8D
L022F1C  STR   " TYP $00"8D
L022F26  STR   8D

*--- Write

L022F28  JSL   GSOS
         DW    $2013      ; Write
         ADRL  L023387
         BCC   L022F37
         BRL   L022DBD
L022F37  JSR   L022DC5	; GetMark + close
         BCC   L022F3F
         BRL   L022E34

* AV 202010 - Shall we output one or more files?

L022F3F	lda	fgOUTPUT	; one file?
	beq	L022F40	; no, multiple

	jsr	L023064	; yes, deref
	brl	L022D3F	; loop there if one file

L022F40  LDX   L02331D
         LDA   L0230B3	; is that first pass?
         BNE   L022F4C
         LDA   #$312E	; .1
         INX
         INX
L022F4C  CLC
         ADC   #$0100
         STA   L0230B3
         STA   L0232E9+$32,X
         LDA   #$532E	; .S
         STA   L02331D,X
         STX   L02331D	; save counter
         JSR   L023064	; deref
         BRL   L022D37	; loop

L022F65  PHP
         SEP   #$20
         REP   #$10
         LDX   #$0157
L022F6D  LDA   L0231C5,X
         CMP   #$A0
         BNE   L022F79
         AND   #$7F
         STA   L0231C5,X
L022F79  DEX
         BNE   L022F6D
         REP   #$30
         STZ   L0230B5
         LDA   $3E
         STA   L0230B7
         LDA   $5C
         STA   L0230B9
         LDA   [$F8]
         AND   #$007F
         CMP   #$005B
         BNE   L022FB5
         STZ   L0230B9
         JSR   L021525
         BCC   L022FA0
         BRL   L023061
L022FA0  PHX
         JSL   L0416F3
         STA   L0230B5
         PLX
         STX   L0230B7
         BNE   L022FB2
         DEX
         STX   L0230B9
L022FB2  JSR   L020F52
L022FB5  JSL   L03074E
         DB    $09
         DB    $0F
         DB    $18
         DB    $37
         LDX   #$001E
         LDY   #$000B
         JSL   L0300E2
         JSL   L0302E1
         STR   "Generating source..."
         LDX   #$0023
         LDY   #$000D
         JSL   L0300E2
         JSL   L0302E1
         STR   "$0000/$"
         SEC
         LDA   L0230B7
         SBC   L0230B5
         INC
         PHA
         JSL   L030670
         JSL   L0424A8
         LDA   #$0000
         PHA
         PHA
         PEA   $0000
         PEA   $C000
         PEI   $FC
         PEA   $8008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCS   L02305B
         STY   L0230AD
         STX   L0230AB
         TYA
         XBA
         PHB
         PHA
         PLB
         PLB
         LDA   |$0000,X
         STAL  L0230AF
         LDA   |$0002,X
         STAL  L0230B1
         PLB
         CLC
         LDA   L0230AF
         ADC   #$0002
         STA   L02338B
         LDA   L0230B1
         ADC   #$0000
         STA   L02338B+2
         JSR   L023064
         STZ   L0230B3
         PLP
         CLC
         RTS

L02305B  LDA   #$0000
         JSR   L020AB8
L023061  PLP
         SEC
         RTS

L023064  LDA   L0230B1
         LDX   L0230AF
         PHB
         PHA
         PLB
         LDA   #$0000
         STA   |$0000,X
         PLB
         PLB
         STZ   L02338F
         RTS

L023079  PHP
         REP   #$30
         JSR   L02308D
         JSL   L030035
         DB    $02
         DB    $15
         DB    $00
         DB    $4F
         JSL   L0300D1
         PLP
         RTS

L02308D  LDA   L0230AD
         ORA   L0230AB
         BEQ   L0230AA
         LDA   L0230AD
         PHA
         LDA   L0230AB
         PHA
         _DisposeHandle
         STZ   L0230AD
         STZ   L0230AB
L0230AA  RTS

L0230AB  DB    $00
         DB    $00
L0230AD  DB    $00
         DB    $00
L0230AF  DB    $00
         DB    $00
L0230B1  DB    $00
         DB    $00
L0230B3  DB    $00
         DB    $00
L0230B5  DB    $00
         DB    $00
L0230B7  DB    $00
         DB    $00
L0230B9  DB    $00
         DB    $00
L0230BB  DB    $00
         DB    $00
L0230BD  DB    $00
         DB    $00
L0230BF  DB    $00
         DB    $00
L0230C1  DB    $00
         DB    $00
L0230C3  DB    $00
         DB    $00
L0230C5  DB    $00
L0230C6  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0231C5  DB    $00
L0231C6  ASC   8D
         ASC   "*---------------------------------------------------------*"8D
         ASC   "*     Disassembled with The Flaming Bird Disassembler     *"8D
         ASC   "*    (c) Phoenix corp. 1992,93  -  All rights reserved    *"8D
         ASC   "*---------------------------------------------------------*"8D8D
L0232B8  ASC   8D
         ASC   "* TFBD generated equates"8D
         ASC   "*    (c) PHC 1992,93"8D8D8D
L0232E9  ASC   8D
         ASC   "* TFBD generated externals"8D
         ASC   "*     (c) PHC 1992,93"8D8D8D
L02331D  STRL  '0:Source.S'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L023367  DW    $0004      ; Parms for Create
         ADRL  L02331D    ;  file name
         DW    $00E3      ;  access
         DW    $0004      ;  file type
         ADRL  $00000000  ;  aux type

L023375  DW    $0003      ; Parms for GetFileInfo
         ADRL  L02331D    ;  file name
         DW    $0000      ;  access
L02337D  DW    $0000      ;  file type

L02337F  DW    $0002      ; Parms for Open
L023381  DW    $0000      ;  ref num
         ADRL  L02331D    ;  path name

L023387  DW    $0004      ; Parms for Write
L023389  DW    $0000      ;  ref num
L02338B  ADRL  $00000000  ;  buffer ptr
L02338F  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count

L023397  DW    $0004      ; Parms for Write
L023399  DW    $0000      ;  ref num
         ADRL  L0231C6    ;  buffer ptr
         ADRL  $000000F2  ;  request count
         ADRL  $00000000  ;  transfer count

L0233A7  DW    $0004      ; Parms for Write
L0233A9  DW    $0000      ;  ref num
         ADRL  L0232B8    ;  buffer ptr
         ADRL  $00000031  ;  request count
         ADRL  $00000000  ;  transfer count

L0233B7  DW    $0004      ; Parms for Write
L0233B9  DW    $0000      ;  ref num
         ADRL  L0232E9    ;  buffer ptr
         ADRL  $00000034  ;  request count
         ADRL  $00000000  ;  transfer count

L0233C7  DW    $0002      ; Parms for GetMark
L0233C9  DW    $0000      ;  ref num
L0233CB  ADRL  $00000000  ;  position

L0233CF  DW    $0003      ; Parms for SetEOF
L0233D1  DW    $0000      ;  ref num
         DW    $0000      ;  base
L0233D5  ADRL  $00000000  ;  displacement

L0233D9  DW    $0001      ; Parms for Close
L0233DB  DW    $0000      ;  ref num

L0233DD  STZ   L0230C6
         LDA   L0230B5
         PHA
         JSL   L041719
         LDA   $01,S
         JSL   L0410BB
         STA   L0230BB
         PLA
         JSL   L040586
         STY   L0230BF
         STA   L0230BD
         LDA   #$8080
         AND   L0230BB
         CMP   #$8000
         BEQ   L023413
         JSR   L0234CF
         JSR   L023527
         JSR   L02356B
         JSR   L0235A0
L023413  JSR   L0235BC
         JSR   L023671
         JSR   L023465
         JSR   L023423
         JSR   L02348D
         RTS

L023423  PHP
         REP   #$30
         LDA   L0230BB
         BMI   L02344C
         LDY   L0230B5
         SEP   #$20
         LDA   [$3A],Y
         JSR   L02344E
         BCS   L02344C
         REP   #$20
         TYA
         ADC   L0230BD
         TAY
         SEP   #$20
         LDA   [$3A],Y
         JSR   L02344E
         BCC   L02344C
         REP   #$20
         JSR   L0234A9
L02344C  PLP
         RTS

L02344E  LDX   #$0007
L023451  CMP   L02345D,X
         BEQ   L02345B
         DEX
         BPL   L023451
         SEC
         RTS

L02345B  CLC
         RTS

L02345D  DB    $60
         DB    $40
         DB    $6B
         DB    $4C
         DB    $5C
         DB    $6C
         DB    $7C
         DB    $DC

L023465  LDA   L0230BB
         BIT   #$0400
         BEQ   L023489
         JSR   L0234A4
         LDA   #$00BB
         JSR   L0234BE
         JSR   L0234A4
         PEI   $42
         LDA   L0230B5
         PHA
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L04392C
L023489  JSR   L0234A9
         RTS

L02348D  SEP   #$30
         LDX   L0230C6
L023492  LDA   L0230C6,X
         ORA   #$80
         CMP   #$A0
         BEQ   L02349E
         STA   L0230C6,X
L02349E  DEX
         BNE   L023492
         REP   #$30
         RTS

L0234A4  LDA   #$00A0
         BRA   L0234BE
L0234A9  LDA   #$008D
         BRA   L0234BE
L0234AE  PHY
         PHP
         JSL   L030837
         REP   #$30
         PHA
         JSR   L0234BE
         PLA
         XBA
         PLP
         PLY
L0234BE  PHY
         PHP
         SEP   #$30
         LDX   L0230C6
         INX
         STA   L0230C6,X
         STX   L0230C6
         PLP
         PLY
         RTS

         MX    %00
L0234CF  LDA   L0230BB
L0234D2  BIT   #$0018
         BEQ   L023521
         PHA
         PEA   ^L023522
         PEA   L023522
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0307DD
         PLA
         BIT   #$0008
         BEQ   L023502
         AND   #$FFF7
         PHA
         JSR   L0234A9
         PLA
         BIT   #$0010
         BEQ   L023521
         PHA
         JSR   L0234A4
         PLA
         BRA   L0234D2
L023502  JSR   L0234A4
         PEI   $42
         LDA   L0230B5
         PHA
         JSL   L042D12
         PHY
         PHA
         PEA   $0003
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L044315
         JSR   L0234A9
L023521  RTS

L023522  STR   " ORG"

L023527  LDA   L0230BB
         BIT   #$0001
         BEQ   L023543
         LDY   L0230B5
         LDA   [$3A],Y
         AND   #$00DF
         CMP   #$00C2
         BNE   L023544
         LDA   [$3A],Y
         AND   #$3000
         BEQ   L023544
L023543  RTS

L023544  PEA   ^L023565
         PEA   L023565
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0307DD
         PEI   $42
         LDA   L0230B5
         PHA
         JSL   L042DD9
         JSR   L0234AE
         JSR   L0234A9
         RTS

L023565  STR   " MX %"

L02356B  LDA   L0230BB
         BIT   #$2000
         BEQ   L023599
         PEI   $42
         LDA   L0230B5
         PHA
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0428B4
         PEA   ^L02359A
         PEA   L02359A
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0307DD
         LDA   #$6000
         TRB   L0230BB
L023599  RTS

L02359A  STR   " ENT"8D

L0235A0  LDA   L0230BB
         BIT   #$4000
         BEQ   L0235B8
         PEI   $42
         LDA   L0230B5
         PHA
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0428B4
L0235B8  JSR   L0234A4
         RTS

L0235BC  LSR   L0230C1
         LSR   L0230C3
         LDA   L0230BB
         BMI   L023620
         LDY   L0230B5
         LDA   [$3A],Y
         AND   #$00FF
         CMP   #$00A2
         BNE   L023607
         INY
         INY
         INY
         LDA   [$3A],Y
         CMP   #$0022
         BNE   L0235FF
         INY
         INY
         LDA   [$3A],Y
         CMP   #$E100
         BNE   L0235FF
         LDY   L0230B5
         INY
         LDA   [$3A],Y
         PHA
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L044C72
         BCS   L0235FF
         SEC
         ROR   L0230C1
         RTS

L0235FF  LDY   L0230B5
         LDA   [$3A],Y
         AND   #$00FF
L023607  PHA
         PHA
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L0403B6
         PLA
         AND   #$00EF
         CMP   #$0044
         BNE   L02361F
         ROR   L0230C3
L02361F  RTS

L023620  LDA   L0230BB
         BIT   #$0080
         BNE   L02362B
         JSR   L0234A4
L02362B  LDA   L0230BF
         AND   #$001F
         TAY
         LDX   #$0000
         SEP   #$20
L023637  DEY
         BMI   L023644
L02363A  INX
         LDAL  L040326,X
         BMI   L02363A
         INX
         BRA   L023637
L023644  LDAL  L040326,X
         PHA
         PHX
         JSR   L023658
         JSR   L0234BE
         PLX
         INX
         PLA
         BMI   L023644
         REP   #$20
         RTS

         MX    %10
L023658  PHA
         LDA   $5F
         AND   #$20
         BEQ   L02366F
         LDA   $01,S
         AND   #$7F
         CMP   #$41
         BCC   L02366F
         CMP   #$5B
         BCS   L02366F
         PLA
         ORA   #$20
         RTS

L02366F  PLA
         RTS

         MX    %00
L023671  LDA   L0230BB
         BMI   L0236D7
         BIT   L0230C1
         BMI   L0236C2
         LDA   L0230BD
         DEC
         BEQ   L0236C2
         JSR   L0234A4
         PEI   $42
         LDY   L0230B5
         INY
         PHY
         BIT   L0230C3
         BPL   L02369B
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L045887
         RTS

L02369B  PHA
         STZ   L0236C3
         PEA   ^L0236C3
         PEA   L0236C3
         JSL   L04397A
         LDY   L0230B5
         LDA   [$3A],Y
         AND   #$00FF
         PHA
         PEA   ^L0236C3
         PEA   L0236C3
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L040456
L0236C2  RTS

L0236C3  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L0236D7  LDA   L0230BD
         BEQ   L0236C2
         JSR   L0234A4
         LDA   L0230BF
         AND   #$001F
         ASL
         TAX
         JMP   (L0236EA,X)

L0236EA  DA    L023711
         DA    L023726
         DA    L02372D
         DA    L023711
         DA    L023711
         DA    L023711
         DA    L023745
         DA    L02379C
         DA    L0237C4
         DA    L023947
         DA    L023839
         DA    L023822
         DA    L02370C
         DA    L02370C
         DA    L02385B
         DA    L02386B
         DA    L02370D

L02370C  RTS

L02370D  DEC   L0230C6
         RTS

L023711  PEI   $42
         LDA   L0230B5
         PHA
         LDA   L0230BD
         PHA
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L04397A
         RTS

L023726  LDY   L0230B5
         LDA   [$3A],Y
         BRA   L023733
L02372D  LDY   L0230B5
         LDA   [$3A],Y
         XBA
L023733  PEA   $0000
         PHA
         PEA   $0002
         PEA   ^L0230C6
         PEA   L0230C6
         JSL   L044315
         RTS

L023745  CLC
         LDA   L0230B5
         ADC   $3A
         PHA
         PHA
         LDA   #$0000
         ADC   $3C
         STA   $03,S
         PEA   ^L02377D
         PEA   L02377D
         JSL   L040D34
         SEP   #$30
         LDA   #$A2
         JSR   L0234BE
         LDX   #$00
L023767  LDA   L02377E,X
         PHX
         JSR   L0234BE
         PLX
         INX
         CPX   L02377D
         BCC   L023767
         LDA   #$A2
         JSR   L0234BE
         REP   #$30
         RTS

L02377D  DB    $00
L02377E  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L02379C  LDA   L0230BD
         CMP   #$0011
         BCC   L0237AA
         LDA   #$0010
         STA   L0230BD
L0237AA  STA   L0237C2
         LDY   L0230B5
L0237B0  SEP   #$20
         LDA   [$3A],Y
         PHY
         JSR   L0234AE
         PLY
         INY
         REP   #$20
         DEC   L0237C2
         BNE   L0237B0
         RTS

L0237C2  DW    $0000

L0237C4  LDA   L0230BD
         PHA
         CMP   #$000A
         BCC   L0237D3
         LDA   #$00A4
         JSR   L0234BE
L0237D3  LSR   L023820
         PLA
         LDX   #$0004
L0237DA  PHX
         LDX   #$0004
L0237DE  ASL
         ROL   L02381E
         DEX
         BNE   L0237DE
         PHA
         LDA   L02381E
         JSL   L030823
         BIT   L023820
         BMI   L0237FA
         CMP   #$00B0
         BEQ   L0237FD
         ROR   L023820
L0237FA  JSR   L0234BE
L0237FD  PLA
         PLX
         DEX
         BNE   L0237DA
         LDY   L0230B5
         LDA   [$3A],Y
         AND   #$00FF
         BEQ   L02381D
         PHA
         LDA   #$00AC
         JSR   L0234BE
         LDA   #$00A4
         JSR   L0234BE
         PLA
         JSR   L0234AE
L02381D  RTS

L02381E  DB    $00
         DB    $00
L023820  DB    $00
         DB    $00

L023822  LDA   #$FFFF
         STA   L0238B3
         CLC
         LDA   L0230B5
         ADC   L0230BD
         DEC
         TAY
         LDA   L0230BD
         STA   L0238B5
         BRA   L02387C
L023839  LDY   L0230B5
         LDA   L0230BD
         STA   L0238B5
         STZ   L0238B3
         CMP   #$0001
         BNE   L02387C
         LDA   [$3A],Y
         PHA
         EOR   #$0080
         STA   [$3A],Y
         PHY
         JSR   L023893
         PLY
         PLA
         STA   [$3A],Y
         RTS

L02385B  LDY   L0230B5
         LDA   [$3A],Y
         STA   L0238B5
         BEQ   L023880
         INY
         STZ   L0238B3
         BRA   L02387B
L02386B  LDY   L0230B5
         LDA   [$3A],Y
         AND   #$00FF
         STA   L0238B5
         BEQ   L023880
         STZ   L0238B3
L02387B  INY
L02387C  JSR   L023893
         RTS

L023880  SEP   #$10
         LDX   L0230C6
         INX
         LDA   #$A7A7
         STA   L0230C6,X
         INX
         STX   L0230C6
         REP   #$10
         RTS

L023893  SEP   #$20
         JSR   L0238D2
         BCS   L0238B0
         JSR   L0238BA
         STA   L0238B9
         JSR   L0234BE
         JSR   L0238F6
         PHP
         LDA   L0238B9
         JSR   L0234BE
         PLP
         BCC   L023893
L0238B0  REP   #$20
         RTS

L0238B3  DB    $00
         DB    $00
L0238B5  DB    $00
         DB    $00
L0238B7  DB    $00
         DB    $00
L0238B9  DB    $00

	 MX    %10
	 
L0238BA  PHY
L0238BB  LDA   [$3A],Y
         AND   #$7F
	 CMP   #$20
	 BCS   L0238C6
	 INY
	 BNE   L0238BB
L0238C6  LDA   [$3A],Y
         BPL   L0238CE
         LDA   #$A2
	 PLY
         RTS

L0238CE  LDA   #$A7
         PLY
         RTS

L0238D2  LDA   [$3A],Y
         AND   #$7F
	 CMP   #$20
	 BCC   L0238DC
         CLC
         RTS
L0238DC  LDA   [$3A],Y
         PHY
         JSR   L0234AE
         PLY
         INY
         BIT   L0238B3
         BPL   L0238EB
         DEY
         DEY
L0238EB  REP   #$20
         DEC   L0238B5
         SEP   #$20
         BNE   L0238D2
         SEC
         RTS

L0238F6  REP   #$20
         LDA   #$FFFF
         STA   L0238B7
L0238FE  SEP   #$20
         LDA   [$3A],Y
         ORA   #$80
         CMP   #$A0
         BCS   L023909
         RTS

L023909  BNE   L02390F
         AND   #$7F
         BRA   L023926
L02390F  CMP   L0238B9
         BNE   L023926
         PHY
         PHA
         JSR   L0234BE
         PLA
         PHA
         CMP   #$A7
         BNE   L023921
         AND   #$7F
L023921  JSR   L0234AE
         PLA
         PLY
L023926  PHY
         JSR   L0234BE
         PLY
         INY
         BIT   L0238B3
         BPL   L023933
         DEY
         DEY
L023933  REP   #$20
         DEC   L0238B5
         BEQ   L023943
         DEC   L0238B7
         BNE   L0238FE
         SEP   #$20
         CLC
         RTS

L023943  SEP   #$20
         SEC
         RTS

L023947  STZ   L0238B3
         LDA   L0230BD
         STA   L0238B5
         SEP   #$20
         LDY   L0230B5
         JSR   L0238D2
         BCS   L023984
         CPY   L0230B5
         BNE   L023987
         JSR   L0238BA
         STA   L0238B9
         JSR   L0234BE
         REP   #$20
         LDA   #$0028
         STA   L0238B7
         SEP   #$20
         JSR   L0238FE
         PHP
         LDA   L0238B9
         JSR   L0234BE
         PLP
         BCS   L023984
         JSR   L0238D2
         BCC   L023987
L023984  REP   #$20
         RTS

L023987  REP   #$20
         TYA
         SEC
         SBC   L0230B5
         STA   L0230BD
         RTS

L023992  DB    $00
         DB    $00
L023994  DB    $00
         DB    $00
L023996  DB    $00
         DB    $00
L023998  DB    $00
         DB    $00
L02399A  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $E1
         DB    $00
         DB    $E0
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
L0239A8  STRL  " EQU $"
L0239B0  JSL   L044C3E
         BCC   L0239B7
         RTS

L0239B7  JSL   L0300D1
         LDX   #$001B
         LDY   #$000C
         JSL   L0300E2
         JSL   L0302E1
         STR   "Generating Equates file..."
         JSR   L023064
         LDY   #$000C
L0239EA  STY   L023992
         PHY
         JSL   L044C3E
         PLY
         LDA   [$CA],Y
         CLC
         ADC   $CA
         STA   $CA
         BCC   L0239FE
         INC   $CC
L0239FE  LDY   #$0000
L023A01  LDA   [$CA],Y
         BNE   L023A08
         BRL   L023AAC
L023A08  STA   L023994
         INY
         INY
         LDA   [$CA],Y
         BIT   #$8000
         BNE   L023A17
         BRL   L023A9C
L023A17  INY
         LDA   [$CA],Y
         PHY
         PHA
         XBA
         AND   #$00FF
         STA   [$CA],Y
         CLC
         ADC   #$000B
         ADC   L02338F
         STA   L02338F
         STY   L023998
         PEA   ^L0239A8
         PEA   L0239A8
         LDY   L0230B1
         PHY
         LDX   L0230AF
         PHX
         PEI   $CC
         LDY   L023998
         TYA
         CLC
         ADC   $CA
         PHA
         BCC   L023A4E
         LDA   $03,S
         INC
         STA   $03,S
L023A4E  LDY   L0230B1
         PHY
         PHX
         JSL   L030852
         JSL   L030852
         LDX   L023992
         LDA   L02399A,X
         BEQ   L023A73
         LDY   L0230B1
         LDX   L0230AF
         JSL   L0308AF
         INC   L02338F
         INC   L02338F
L023A73  LDY   L0230B1
         LDX   L0230AF
         PHY
         PHX
         LDA   L023994
         JSL   L0308D1
         PHD
         TSC
         TCD
         LDA   [$03]
         INC
         STA   [$03]
         INC
         TAY
         LDA   #$008D
         STA   [$03],Y
         PLD
         PLX
         PLY
         PLA
         PLY
         STA   [$CA],Y
         INC   L023996
         DEY
L023A9C  INY
         INY
         LDA   [$CA],Y
         AND   #$00FF
         PHY
         SEC
         ADC   $01,S
         PLY
         TAY
         BRL   L023A01
L023AAC  LDY   L023992
         DEY
         DEY
         CPY   #$0006
         BCC   L023AB9
         BRL   L0239EA
L023AB9  LDA   L023996
         BNE   L023ABF
         RTS

L023ABF  LDX   L02331D
         LDA   L0230B3
         BNE   L023AC9
         INX
         INX
L023AC9  LDA   #$452E     ; .E
         STA   L0232E9+$32,X
         LDA   #$532E     ; .S
         STA   L02331D,X
         STX   L02331D
         INC   L0230B3
         JSR   L022E10	; create file
         BCC   L023AE1
         RTS

L023AE1  JSL   GSOS
         DW    $2013      ; Write
         ADRL  L0233A7
         JSL   GSOS
         DW    $2013      ; Write
         ADRL  L023387
         JSR   L022DC5
         RTS

L023AF9  JSL   L0300D1
         LDX   #$001C
         LDY   #$000C
         JSL   L0300E2
         JSL   L0302E1
         STR   "Generating Externals..."
         PEI   $42
         JSL   L0456A6
         BCC   L023B2C
         RTS

L023B2C  CMP   #$0000
         BEQ   L023B81
         STA   L02338F
         STZ   L02338F+2
         PHY
         PHX
         JSR   L023EF2
         STX   L02338B
         STY   L02338B+2
         LDX   L02331D
         LDA   L0230B3
         BNE   L023B4C
         INX
         INX
L023B4C  LDA   #$582E	; .X
         STA   L0232E9+$32,X
         LDA   #$532E
         STA   L02331D,X
         STX   L02331D
         INC   L0230B3
         JSR   L022E10	; create file
         BCS   L023B7A
         JSL   GSOS
         DW    $2013      ; Write
         ADRL  L0233B7
         JSL   GSOS
         DW    $2013      ; Write
         ADRL  L023387
         JSR   L022DC5
L023B7A  _DisposeHandle
L023B81  RTS

L023B82  STZ   L023CC2
         LDA   [$F8]
         AND   #$00FF
         CMP   #$00AB
         BNE   L023B9E
         INC   $F8
         JSR   L021564
         CMP   #$0080
         BCS   L023BEC
         STA   L023CC2
         BRA   L023BB4
L023B9E  CMP   #$00AD
         BNE   L023BB9
         INC   $F8
         JSR   L021564
         CMP   #$0081
         BCS   L023BEC
         EOR   #$FFFF
         INC
         STA   L023CC2
L023BB4  JSR   L02153D
         BCS   L023BF2
L023BB9  JSR   L021339
         BCS   L023BF2
         STA   L023CBA
         CPY   $42
         BNE   L023BEC
         JSR   L02153D
         BCS   L023BF2
         JSR   L021564
         STA   L023CC0
         LDA   [$F8]
         AND   #$00FF
         BNE   L023BF4
         LDA   #$FFFF
         STA   L023CB8
         PEI   $42
         LDA   L023CBA
         PHA
         JSL   L042A5C
         STY   L023CB2
         BRA   L023C07
L023BEC  LDA   #$0003
         JSR   L020AB8
L023BF2  CLC
         RTS

L023BF4  JSR   L02153D
         BCS   L023BF2
         STZ   L023CB8
         JSR   L021367
         BCS   L023BF2
         STA   L023CB0
         STY   L023CB2
L023C07  LDA   L023CBA
         JSL   L041993
         STA   L023CBC
         CMP   #$0004
         BCC   L023C19
         LDA   #$0003
L023C19  STA   L023CBE
         LDX   #$0000
         LDY   L023CBA
         SEP   #$20
L023C24  LDA   [$3A],Y
         STA   L023CB4,X
         INY
         INX
         CPX   L023CBE
         BNE   L023C24
L023C30  STZ   L023CB4,X
         INX
         CPX   #$0004
         BNE   L023C30
         REP   #$20
         BIT   L023CB8
         BPL   L023C52
         LDA   L023CBE
         CMP   #$0002
         BCC   L023C9A
         BNE   L023C65
         LDA   L023CB2
         STA   L023CB6
         BRA   L023C65
L023C52  SEP   #$20
         LDX   L023CBE
L023C57  CPX   #$0003
         BEQ   L023C65
         LDA   L023CB0,X
         STA   L023CB4,X
         INX
         BRA   L023C57
L023C65  REP   #$30
         PEI   $42
         LDA   L023CBA
         PHA
         LDA   L023CBE
         PHA
         SEP   #$20
         LDA   L023CC2
         PHA
         LDA   #$00
         PHA
         REP   #$20
         LDA   L023CB6
         PHA
L023C80  LDA   L023CB4
         SEC
         SBC   L023CC2
         PHA
         JSL   L042ABB
         PHY
         PHA
         BCS   L023C96
         JSL   L043774
         BRA   L023C9A
L023C96  JSL   L043772
L023C9A  CLC
         LDA   L023CBA
         ADC   L023CBC
         STA   L023CBA
         BCS   L023CAE
         DEC   L023CC0
         BEQ   L023CAE
         BRL   L023C07
L023CAE  CLC
         RTS

L023CB0  DB    $00
         DB    $00
L023CB2  DB    $00
         DB    $00
L023CB4  DB    $00
         DB    $00
L023CB6  DB    $00
         DB    $00
L023CB8  DB    $00
         DB    $00
L023CBA  DB    $00
         DB    $00
L023CBC  DB    $00
         DB    $00
L023CBE  DB    $00
         DB    $00
L023CC0  DB    $00
         DB    $00
L023CC2  DB    $00
         DB    $00

L023CC4  SEP   #$40
         HEX   50
L023CC7  CLV
         JSR   L021339
         BCS   L023D1A
         TAY
         LDX   #$0001
         SEP   #$20
         INY
         PEI   $42
         PHY
         PHX
         PHX
         PHX
         PHX
         LDA   [$3A],Y
         XBA
         INY
         INY
         PEI   $42
         PHY
         PHX
         LDA   [$3A],Y
         REP   #$20
         BVS   L023CEB
         XBA
L023CEB  TAX
         LDA   #$00F8
         BVS   L023CF4
         LDA   #$0000
L023CF4  STA   $0B,S
         EOR   #$00F8
         PHA
         PHX
         PEI   $42
         PHY
         JSL   L042A5C
         PLA
         PHY
         PHA
         JSL   L042ABB
         PHA
         PHA
         STA   $0D,S
         TYA
         STA   $03,S
         STA   $0F,S
         JSL   L043774
         JSL   L043774
L023D1A  CLC
         RTS

L023D1C  BIT   L0283C2
         BPL   L023D4A
         PEI   $38
         PEI   $36
         _DisposeHandle
         STZ   $38
         STZ   $36
         BIT   L0283CA
         BPL   L023D4A
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         _DisposeHandle
         STZ   L0283CE
         STZ   L0283CC
L023D4A  STZ   $3E
         SEC
         ROR   $5C
         STZ   $3A
         STZ   $32
         LDA   #$FE00
         STA   $3B
         STA   $33
         LDA   #$0001
         STA   $42
         INC
         STA   $40
         STZ   L0283CA
         LDA   #$FFFF
         STA   L0283C2
         STA   $F6
         STZ   $54
         LDA   #$0004
         STA   $56
         BRL   L021BC7
L023D77  BIT   $F6
         BMI   L023D7D
L023D7B  CLC
         RTS

L023D7D  JSL   L044C3E
         BCS   L023D7B
         LDY   #$000C
         LDA   [$CA],Y
         ADC   $CA
         STA   $CA
         BCC   L023D90
         INC   $CC
L023D90  LDY   #$0000
L023D93  LDA   [$CA],Y
         BEQ   L023D7B
         CMP   #$C100
         BCC   L023DC3
         PHY
         PEA   $0002
         PHA
         INY
         INY
         LDA   [$CA],Y
         AND   #$00FF
         PHA
         PEA   $0000
         INY
         PEI   $CC
         PEI   $CA
         TYA
         CLC
         ADC   $01,S
         STA   $01,S
         BCC   L023DBE
         LDA   $03,S
         INC
         STA   $03,S
L023DBE  JSL   L042748
         PLY
L023DC3  INY
         INY
         INY
         LDA   [$CA],Y
         AND   #$00FF
         PHY
         SEC
         ADC   $01,S
         TAY
         PLA
         BRA   L023D93
L023DD3  JSR   L021339
         CPY   $42
         BNE   L023DFD
         STA   L023EAC
         TAY
         LDA   [$3A],Y
         STA   L023EAE
         CMP   #$0101
         BCS   L023E03
         INY
         INY
         LDA   [$3A],Y
         BNE   L023E03
         JSR   L02153D
         BCS   L023E03
         JSR   L021564
         BCS   L023E03
         STA   L023EB0
         BRA   L023E21
L023DFD  LDA   #$0003
         JSR   L020AB8
L023E03  CLC
         RTS

L023E05  PEI   $42
         LDA   L023EAC
         PHA
         PEA   $0004
         PEA   $0004
         JSL   L043069
         RTS

L023E16  CLC
         LDA   #$0004
         ADC   L023EAC
         STA   L023EAC
         RTS

L023E21  JSR   L023E05
L023E24  JSR   L023E16
         DEC   L023EAE
         BEQ   L023E03
         LDA   L023EB0
         CLC
         ADC   #$0100
         STA   L023EB0
         JSR   L023E05
         LDY   L023EAC
         LDA   [$3A],Y
         TAX
         INY
         INY
         LDA   [$3A],Y
         PHA
         PHX
         ORA   $01,S
         BNE   L023E4D
         PLA
         PLA
         BRA   L023E24
L023E4D  JSL   L042ABB
         STY   L023EB4
         INC
         STA   L023EB2
         PEI   $42
         LDX   L023EAC
         PHX
         PEA   $0004
         PEA   $FF00
         PHY
         PHA
         JSL   L043774
         LDA   L023EB0
         PHA
         STZ   L023EB6
         PEA   ^L023EB6
         PEA   L023EB6
         JSL   L044C72
         LDA   L023EB7
         AND   #$00FF
         CMP   #$00DF
         BNE   L023E24
         SEP   #$20
         LDA   L023EB6
         DEC
         STA   L023EB7
         REP   #$30
         LDA   L023EB4
         PHA
         LDA   L023EB2
         PHA
         PEA   $0000
         PEA   $0000
         PEA   ^L023EB7
         PEA   L023EB7
         JSL   L042748
         BRL   L023E24
L023EAC  DB    $00
         DB    $00
L023EAE  DB    $00
         DB    $00
L023EB0  DB    $00
         DB    $00
L023EB2  DB    $00
         DB    $00
L023EB4  DB    $00
         DB    $00
L023EB6  DB    $00
L023EB7  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L023ED6  PHA
         PHA
         PHY
         PHX
         PEI   $FC
         PHA
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCC   L023EF1
         LDA   #$0000
         JSR   L020AB8
         SEC
L023EF1  RTS

L023EF2  PHB
         PHY
         PLB
         LDA   |$0002,X
         TAY
         LDA   |$0000,X
         TAX
         PLB
         PLB
         RTS

L023F00  JSR   L020D0C
         JSL   L044EAB
         JSL   L042328
         JSR   L020D34
         CLC
         RTS

L023F10  EOR   #$FFFF	; 32 TRON
L023F13  JSL   L04507E	; 33 TROFF
         CLC
         RTS

* AV 202010 - Two new commands

doCHON	stz	fgOUTPUT	; we want multiple files (default)
	clc
	rts

doCHOFF	lda	#-1		; we want one file only
	sta	fgOUTPUT
	clc
	rts

fgOUTPUT	ds	2

*--- end of AV 202010
	
L023F19  LDA   [$F8]
         AND   #$00FF
         BEQ   L023F72
         JSR   L023F44
         BCC   L023F72
         JSR   L021339
         BCS   L023F42
         STA   L023F68
         STA   L023F6A
         STZ   L023F6C
         CPY   $42
         BNE   L023F3C
         JSR   L023F44
         BRA   L023F72
L023F3C  LDA   #$0003
         JSR   L020AB8
L023F42  CLC
         RTS

L023F44  LDA   [$F8]
         AND   #$00FF
         BEQ   L023F61
         CMP   #$00AF
         BNE   L023F61
         INC   $F8
         JSR   L021309
         SEC
         SBC   #$00B0
         CMP   #$0003
         BCC   L023F63
         JSR   L023F3C
L023F61  SEC
         RTS

L023F63  STA   L023F6C
         CLC
         RTS

L023F68  DB    $00
         DB    $00
L023F6A  DB    $00
         DB    $00
L023F6C  DB    $00
         DB    $00
L023F6E  DB    $00
         DB    $00
L023F70  DB    $00
         DB    $00

L023F72  LDA   L023F6A
         JSL   L0416F3
         STA   L023F6A
         STZ   L0240B1
L023F7F  LDA   L023F6A
         PHA
         JSL   L0410BB
         STA   L023F6E
         PLA
         JSL   L041993
         STA   L023F70
         BIT   L023F6E
         BMI   L023FA6
         LDA   L023F6C
         ASL
         TAX
         LDY   L023F6A
         JSR   (L023FD7,X)
         BCC   L023FA6
         CLC
         RTS

L023FA6  LDA   L023F6A
         CLC
         ADC   L023F70
         BCS   L023FBA
         STA   L023F6A
         BIT   $5C
         BMI   L023F7F
         CMP   $3E
         BCC   L023F7F
L023FBA  LDA   L023F68
         STA   L023F6A
         LDA   L023F6C
         INC
         STA   L023F6C
         CMP   #$0003
         BCC   L023F7F
         STZ   L023F6C
         LDA   #$0000
         JSR   L023FDD
         CLC
         RTS

L023FD7  DA    L02408D
         DA    L0240B3
         DA    L02411E

L023FDD  PHA
         JSR   L020CED
         PLA
         ASL
         TAX
         LDA   L02401C,X
         STA   L023FFF
         LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
         STR   "> "
         JSL   L030314
L023FFF  ADR   L023FFF
         JSL   L03034A
         PHA
         JSR   L020CED
         PLA
         AND   #$00FF
         CMP   #$008D
         SEC
         BEQ   L02401B
         CMP   #$009B
         SEC
         BEQ   L02401B
         CLC
L02401B  RTS

L02401C  DA    L024026
         DA    L02403B
         DA    L024042
         DA    L024063
         DA    L024079

L024026  STR   "No more bugs found. "
L02403B  STR   "Break "
L024042  STR   "Branch on middle of instruction "
L024063  STR   "Branch on a constant "
L024079  STR   "Never taken branch "

L02408D  LDA   [$3A],Y
         AND   #$00FF
         BEQ   L024099
         STZ   L0240B1
         CLC
         RTS

L024099  LDA   L0240B1
         BEQ   L0240A0
         CLC
         RTS

L0240A0  LDA   #$0001
         STA   L0240B1
L0240A6  PHA
         LDA   L023F6A
         JSR   L021DBB
         PLA
         BRL   L023FDD
L0240B1  DB    $00
         DB    $00
L0240B3  LDA   [$3A],Y
         AND   #$00FF
         CMP   #$004C
         BEQ   L0240D1
         CMP   #$0020
         BEQ   L0240D1
         CMP   #$0082
         BEQ   L024100
         AND   #$001F
         CMP   #$0010
         BEQ   L02410D
L0240CF  CLC
         RTS

L0240D1  PHY
         PEI   $42
         PHY
         JSL   L042A5C
         PLA
         PHY
         TAY
         INY
         LDA   [$3A],Y
         PHA
         JSL   L042ABB
         BCS   L0240CF
L0240E6  JSL   L0410BB
         BCS   L0240CF
         BIT   #$8000
         BNE   L0240FB
         BIT   #$0080
         BNE   L0240CF
         LDA   #$0002
         BRA   L0240A6
L0240FB  LDA   #$0003
         BRA   L0240A6
L024100  INY
         LDA   [$3A],Y
L024103  CLC
         ADC   L023F6A
         CLC
         ADC   #$0003
         BRA   L0240E6
L02410D  INY
         LDA   [$3A],Y
         AND   #$00FF
         BIT   #$0080
         BEQ   L02411B
         ORA   #$FF00
L02411B  DEC
         BRA   L024103
L02411E  LDA   [$3A],Y
         CMP   #$40E2
         BEQ   L024136
         CMP   #$B018
         BEQ   L02413E
         CMP   #$9038
         BEQ   L02413E
         CMP   #$70B8
         BEQ   L02413E
L024134  CLC
         RTS

L024136  INY
         LDA   [$3A],Y
         CMP   #$5040
         BNE   L024134
L02413E  LDA   #$0004
         BRL   L0240A6
L024144  PHP
         REP   #$30
         LDY   #$0000
L02414A  SEP   #$20
         PHY
         LDA   [$3A],Y
         CMP   #$82
         BNE   L02417E
         INY
         REP   #$20
         LDA   [$3A],Y
         INY
         INY
         PHY
         CLC
         ADC   $01,S
         STA   L0241B3
         PLY
         LDA   [$3A],Y
         AND   #$FFF0
         CMP   #$7770
         BNE   L02417E
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         INC
         PHY
         CLC
         ADC   $01,S
         PLY
         CMP   L0241B3
         BEQ   L024187
L02417E  PLY
         INY
         CPY   $3E
         BNE   L02414A
         PLP
         CLC
         RTS

L024187  PLY
         INY
         INY
         INY
         PHY
         PEI   $42
         PHY
         PEA   $0002
         PEA   $0001
         JSL   L043069
         PLY
         INY
         INY
         PEI   $42
         PHY
         LDA   [$3A],Y
         AND   #$00FF
         INC
         PHA
         PEA   $000F
         JSL   L043069
         LDY   L0241B3
         BRL   L02414A

L0241B3  DW    $0000

L0241B5  JSR   L020D34
         JSL   L040FF1
         JSL   L041D74
         JSR   L02A229
         LDA   $37
         BEQ   L0241D6
         PEI   $38
         PEI   $36
         _DisposeHandle
         STZ   $36
         STZ   $38
L0241D6  LDA   L0283CD
         BEQ   L0241F0
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         _DisposeHandle
         STZ   L0283CC
         STZ   L0283CE
L0241F0  STZ   L0283C2
         STZ   $40
         STZ   $42
         STZ   $5C
         STZ   $F6
         STZ   L0283C8
         RTS

L0241FF  JSR   L021339
         BCC   L024206
         CLV
         RTS

L024206  STA   L02426D
         LDA   #$0001
         STA   L02426F
         JSR   L021309
         BCS   L024226
         CMP   #$00AC
         BNE   L02425F
         JSR   L021564
         BCS   L02426A
         STA   L02426F
         CMP   #$0000
         BEQ   L02425D
L024226  LDY   L02426D
L024229  LDA   [$3A],Y
         TAX
         CLC
         ADC   L02426D
         BCS   L024264
         BIT   $5C
         BMI   L02423A
         CMP   $3E
         BCS   L024264
L02423A  PHX
         PHY
         PEI   $42
         PHY
         PEA   $0002
         PEA   $0001
         JSL   L043069
         PLY
         INY
         INY
         PLA
         JSR   L0242DC
         BIT   $5C
         BMI   L024258
         CPY   $3E
         BCS   L02425D
L024258  DEC   L02426F
         BNE   L024229
L02425D  CLC
         RTS

L02425F  LDA   #$0001
         BRA   L024267
L024264  LDA   #$0007
L024267  JSR   L020AB8
L02426A  SEC
         CLV
         RTS

L02426D  DB    $00
         DB    $00
L02426F  DB    $00
         DB    $00
L024271  JSR   L021339
         BCC   L024278
L024276  CLV
         RTS

L024278  STA   L0242D8
         LDA   #$0001
         STA   L0242DA
         JSR   L021309
         BCS   L024298
         CMP   #$00AC
         BNE   L0242CF
         JSR   L021564
         BCS   L024276
         STA   L0242DA
         CMP   #$0000
         BEQ   L0242CD
L024298  LDY   L0242D8
L02429B  LDX   #$0000
L02429E  INX
         LDA   [$3A],Y
         AND   #$00FF
         BEQ   L0242B1
         INY
         BEQ   L0242B1
         BIT   $5C
         BMI   L02429E
         CPY   $3E
         BCC   L02429E
L0242B1  TXA
         LDY   L0242D8
         JSR   L0242DC
         STY   L0242D8
         CPY   #$0000
         BEQ   L0242CD
         BIT   $5C
         BMI   L0242C8
         CPY   $3E
         BCS   L0242CD
L0242C8  DEC   L0242DA
         BNE   L02429B
L0242CD  CLC
         RTS

L0242CF  LDA   #$0001
         JSR   L020AB8
         SEC
         BRA   L024276
L0242D8  DB    $00
         DB    $00
L0242DA  DB    $00
         DB    $00
L0242DC  STY   L02438A
         CLC
         ADC   L02438A
         STA   L02438C
L0242E6  JSR   L0242ED
         BNE   L0242E6
         CLC
         RTS

L0242ED  SEP   #$20
         STY   L02438A
         LDX   #$0001
         LDA   [$3A],Y
         AND   #$7F
         CMP   #$20
         BCS   L02432C
L0242FD  LDA   [$3A],Y
         JSR   L024374
         BCS   L02434D
         INX
         CPX   #$0028
         BCS   L02434D
         AND   #$7F
         CMP   #$0D
         BEQ   L02431E
         CMP   #$0A
         BEQ   L02431E
         LDA   [$3A],Y
         AND   #$7F
         CMP   #$20
         BCC   L0242FD
         BRA   L02432C
L02431E  LDA   [$3A],Y
         AND   #$7F
         CMP   #$0D
         BEQ   L0242FD
         CMP   #$0A
         BEQ   L0242FD
         BRA   L02434D
L02432C  LDA   [$3A],Y
         AND   #$80
         STA   L024373
L024333  JSR   L024374
         BCS   L02434D
         INX
         LDA   [$3A],Y
         AND   #$7F
         CMP   #$20
         BCC   L0242FD
         CPX   #$0028
         BCS   L02434D
         LDA   [$3A],Y
         EOR   L024373
         BPL   L024333
L02434D  REP   #$20
         PHY
         PEI   $42
         LDA   L02438A
         PHA
         PHX
         PEA   $0009
         JSL   L043069
         PLY
         STY   L02438A
         DEY
         JSR   L024374
         BCC   L02436D
         LDA   #$0000
         BRA   L024372
L02436D  LDA   [$3A],Y
         AND   #$00FF
L024372  RTS

L024373  DB    $00

L024374  INY
         BEQ   L024388
         PHY
         LDY   L02438C
         BEQ   L024385
         PLY
         CPY   L02438C
         BCS   L024388
         CLC
         RTS

L024385  PLY
         CLC
         RTS

L024388  SEC
         RTS

L02438A  DB    $00
         DB    $00
L02438C  DB    $00
         DB    $00

L02438E  LDX   #$0000
L024391  LDA   L0243C9+1,X
         STA   L0243AF+1
         LDA   L0243C9,X
         STA   L0243AF
         BEQ   L0243C0
         PHX
         JSL   L0300D1
         PLX
         PHX
         BNE   L0243AB
         JSR   L02728C
L0243AB  JSL   L030719
L0243AF  ADR   $000000
         JSR   L025A40
         PLX
         BCS   L0243C0
         TXA
         CLC
         ADC   #$0004
         TAX
         BRA   L024391
L0243C0  JSL   L0300D1
         JSR   L021E04
         CLC
         RTS

L0243C9  ADRL  L0243E9
         ADRL  L0245B9
         ADRL  L02483E
         ADRL  L024B44
         ADRL  L024DC1
         ADRL  L024FE3
         ADRL  L025254
         ADRL  $00000000

L0243E9 DW      L0245B9-L0243EB
L0243EB	ASC	8D
	ASC	"             Phoenix wings:  Ferox, Bandit II, Nibble, Perfect Bug."8D8D8D8D
	ASC	"Single-key ops:"8D8D
	ASC	"   "
	ASC	'J'
	ASC	" one line down        ^* access desktop "
	ASC	"              ^+ stack position"8D
	ASC	"   "
	ASC	'K'
	ASC	" one line up                            "
	ASC	"              ^- unstack position"8D
	ASC	"                          ^S lower/upper"
	ASC	"case opcodes"8D
	ASC	"  "
	ASC	'AJ'
	ASC	" one page down"8D
	ASC	"  "
	ASC	'AK'
	ASC	" one page up          ^H hex dump mode"8D8D
	ASC	"  ^"
	ASC	'J'
	ASC	" line history down    ^R hilite relocs i"
	ASC	"n hex"8D
	ASC	"  ^"
	ASC	'K'
	ASC	" line history up      ^C hilite constant"
	ASC	"s in hex"8D

L0245B9 DW      L02483E-L0245BB
L0245BB ASC     8D
	ASC	"Disk commands:"8D8D
	ASC	"  PFX    [Path] ................ Set/choose prefix 0"8D
	ASC	"  CAT    [Path] ................ Catalog a directory or prefix 0"8D
	ASC	"  MD     DirName ............... Create directory"8D8D
	ASC	"  LOAD   FileName .............. Load the file to disassemble"8D
	ASC	"  RLOAD  Filename[,rType,ID] ... Load and disassemble a resource"8D
	ASC	8D"  SEG    [SegNum] .............. Load specified segment"8D
	ASC	8D"  SLOAD  [FileName] ............ Load a scripts file"8D
	ASC	"  SSAVE  [FileName] ............ Save script file"8D
	ASC	8D"  TLOAD  [FileName] ............ Load a template file"8D
	ASC	"  TSAVE  [FileName] ............ Save a template file"8D
	ASC	8D"  QUIT or BYE .................. Quit TFBD back to launcher"

L02483E DW      L024B44-L024840
L024840	ASC     8D
	ASC	"Constants (followed by address [,num]):"8D8D
	ASC	"  DB/DW/RECT ................... Byte/Word/Rect"8D
	ASC	"  DDB .......................... Double byte"8D
	ASC	"  DA/ADR/ADRL .................. 2/3/4 bytes address"8D
	ASC	"  DCI .......................... Hi-bit ended string"8D
	ASC	"  STR .......................... Pascal string"8D
	ASC	"  STRL ......................... C1 (GS/OS) string"8D
	ASC	"  FLO .......................... 80-bits IEEE number"8D
	ASC	"  CHK .......................... CheckSum byte"8D
	ASC	"  OFF .......................... Offset (xxxx-*)"8D
	ASC	"  C1 ........................... Word-lengthed text (DW + ASC)"8D
	ASC	"  CS ........................... CString"8D
	ASC	8D"  ASC adr,len | adr1.adr2 ...... ASCII zone"8D
	ASC	"  REV  (Idem) .................. Reversed ASCII"8D
	ASC	"  HEX  (Idem) .................. Hexa datas"8D
	ASC	"  DS   (Idem) .................. Reserved space"8D

L024B44 DW      L024DC1-L024B46
L024B46	ASC	8D
	ASC	"Labels:"8D8D
	ASC	"  LAB adr,Label ................ Define label"8D
	ASC	"  LAB adr ...................... Delete label at adr"8D
	ASC	"  LAB Label .................... Delete label "A2"Label"A2""8D
	ASC	"  ENT adr,Label ................ Define entry label"8D
	ASC	"  EQU adr,Label ................ Define Equate label"8D
	ASC	"  TRON / TROFF ................. 16/24-bits labels for GENLAB"8D
	ASC	"  CHON / CHOFF ................. Multiple or one file for SRC"8D
	ASC	"  GENLAB ....................... Generate labels"8D
	ASC	8D"Directives:"8D8D
	ASC	"  MX  adr,%xx .................. Registers size"8D
	ASC	"  ORG adr,orgadr ............... Re-org code"8D
	ASC	"  ORG adr ...................... Reset org"8D
	ASC	"  DBR adr,xx ................... Assume Data Bank Reg"8D
	ASC	"  DBR adr ...................... DBR = Program bank"

L024DC1 DW      L024FE3-L024DC3
L024DC3 ASC	8D
	ASC	"Relocations:"8D8D
	ASC	"  REL  adr [,size,shift,refadr,disp] .. Set reloc record"8D
	ASC	"  MREL [+/-disp,] adr,n [,refadr] ..... Multiple REL"8D
	ASC	"  PHL  adr ............................ 2xPEA relocation"8D
	ASC	"  PHL2 adr1,adr2 ...................... HiWord,LoWord"8D
	ASC	"  RPHL adr ............................ PHL with LoWord first"8D
	ASC	"  REL8 ................................ 2x8 bits relocation"8D
	ASC	"  RREL8 ............................... Idem, reversed"8D
	ASC	8D8D"Comments:"8D8D
	ASC	"  COM adr,text ........................ Set comment text at adr"8D
	ASC	"  COM adr ............................. Remove comment"

L024FE3 DW      L025254-L024FE5
L024FE5	ASC	8D
	ASC	"Miscellaneous:"8D8D
	ASC	"  LIST adr ..................... List from adr"8D
	ASC	"  TABS x,y,z ................... Set tabs"8D8D
	ASC	"  INFOS ........................ Infos about segment"8D8D
	ASC	"  \ ScrName [adr] .............. Execute script"8D
	ASC	"  \ * [adr] .................... Choose & exec script"8D
	ASC	"  SEDIT ........................ Edit script file"8D8D
	ASC	"  SRC [range] Name ............. Generate Name.S source file"8D8D
	ASC	"  ROM .......................... Disassemble ROMs"8D
	ASC	"  STOOL adr,toolnum ............ Disasm toolset header with routines names"8D
	ASC	"  MLABS ........................ Generate monitor labels (when in ROM)"8D8D
	ASC	"  [Const list] Name ............ Define structure"8D

L025254 DW      L025543-L025256
L025256	ASC	8D
	ASC	"Miscellaneous:"8D8D
	ASC	"  MATCH [C][L][D] .............. Align or Purge Consts, Labs & Directives"8D
	ASC	"  REM   [C][L][D][,Range] ...... Remove Consts, Labs & Directives"8D
	ASC	"  TCLR ......................... Clear all templates"8D
	ASC	"  TC ........................... Templates correction"8D8D
	ASC	"  DOS .......................... Search for OS calls & disasm parms tables"8D
	ASC	"  BUG [adr][/n] ................ Search for bugs in disassembly"8D8D
	ASC	"  DSK .......................... Access desktop"8D
	ASC	"  HIST ......................... Commands history"8D8D
	ASC	"  -FileName .................... Call an expansion file"8D
	ASC	"  CFG [/S or /D] Name .......... Save, Delete or load configuration"8D8D
	ASC	"  FIND [range] [objects] ....... Locate a string in object code"8D
	ASC	"  SCAN [range] [kinds] ......... Scan for a kind of data"

L025543  JSR   L025566
         JSL   L030719
         ADR   L0255A7
         JSR   L025A40
         JSR   L025566
         JSL   L030719
	 ADR   L025822
         JSR   L025A40
         JSR   L020D34
         JSR   L021E04
         CLC
         CLV
         RTS

L025566  JSR   L020D34
         JSL   L030719
         ADR   L025571
         RTS

L025571	dw	L0255A7-L025573
L025573	asc	8D"                               - Shareware info -"8D8D

L0255A7	dw	L025822-L0255A9
L0255A9	asc	8D"TFB-Disasm is a usefull and a powerfull utility. But it's also a very long and"
	asc	8D"hard-to-think program. It's been thousands hours of programming and testing. By."
	asc	8D"the way, it should cost thousands of dollars. But who -except governments- wouldpay such a fee for a soft ? You ?"
	asc	8D8D8D"              TFB-Disasm is a Shareware. But an unusual shareware."
	asc	8D8D" There's no evaluation period. I don't ask you to delete or to stop using TFBD"
	asc	8D"within 15 or 30 days. There's no hidden option that some voodoo magic, using a"
	asc	8D"shareware fee, will make accessible, and the version I send is up-to-date."
	asc	8D8D8D"                           So, what am I asking you ?"

L025822	dw	L025A40-L025824
L025824	asc	" Whatever you want."
	asc	8D8D"    You feel it's worth sending any fee ?    -    Do it."
	asc	8D"    How much ?  $1 ?  $5 ?  $10 ?  $30 ?     -    As you see."
	asc	8D"    And why not your last production ?       -    I may need it."
	asc	8D8D8D"        Just remember that everything I can receive is only used for the"
	asc	8D"       expansion of my Apple II developpement configuration  -  for YOU."
	asc	8D8D8D8D"           Send anything to:              Philippe Savitch"
	asc	8D"                                          19, rue de la Duee"
	asc	8D"                                          75020 Paris  -  France"

L025A40  JSR   L020CED
         LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
         STR   "> Press any key "
         JSL   L03034A
         PHA
         JSR   L020CED
         PLA
         AND   #$00FF
         CMP   #$009B
         BEQ   L025A74
         CLC
L025A74  RTS

L025A75  PHP
         SEP   #$20
         REP   #$10
         LDY   #$0000
L025A7D  LDX   #$0000
L025A80  LDA   [$3A],Y
         CMP   L025AF7,X
         BEQ   L025A8A
         BRL   L025AB6
L025A8A  INY
         INX
         CPX   #$0004
         BCC   L025A80
         PHY
         PEI   $42
         PHY
         PEA   $0002
         PEA   $0001
         JSL   L043069
         PLY
         INY
         INY
         PHY
         PEI   $42
         PHY
         PEA   $0004
         PEA   $0004
         JSL   L043069
         PLY
         INY
         INY
         INY
         BRA   L025AE7
L025AB6  LDX   #$0000
L025AB9  LDA   [$3A],Y
         CMP   L025AFB,X
         BNE   L025AE7
         INY
         INX
         CPX   #$0003
         BCC   L025AB9
         PHY
         PEI   $42
         PHY
         PEA   $0001
         PEA   $0000
         JSL   L043069
         PLY
         INY
         PHY
         PEI   $42
         PHY
         PEA   $0002
         PEA   $0003
         JSL   L043069
         PLY
         INY
L025AE7  INY
         BEQ   L025AF5
         BIT   $5C
         BMI   L025A7D
         CPY   $3E
         BCS   L025AF5
         BRL   L025A7D
L025AF5  PLP
         RTS

L025AF7  HEX   22A800E1
L025AFB  HEX   2000BF

L025AFE  SEP   #$30
         LDA   [$F8]
         BNE   L025B15
         LDX   #$0E
         STX   L025B72
         LDX   #$06
         STX   L025B73
         LDX   #$10
         STX   L025B74
         BRA   L025B4B
L025B15  LDX   #$00
L025B17  PHX
         JSR   L025B2F
         PLX
         BCS   L025B2D
         STA   L025B72,X
         INX
         CPX   #$03
         BEQ   L025B4B
         PHX
         JSR   L02153D
         PLX
         BCC   L025B17
L025B2D  CLC
         RTS
L025B2F  PEI   $FA
         PEI   $F8
         LDX   #$02
         JSL   L0306BD
         REP   #$10
         PLX
         STX   $F8
         PLX
         STX   $FA
         SEP   #$10
         RTS

L025B44  LDA   #$03
         JSR   L020AB8
         CLC
         RTS

L025B4B  CLC
         LDA   #$16
         ADC   L025B72
         ADC   L025B73
         CMP   #$2F
         BCS   L025B44
         ADC   L025B74
         CMP   #$50
         BCS   L025B44
         LDA   #$16
         ADC   L025B72
         STA   $44
         ADC   L025B73
         STA   $45
         ADC   L025B74
         STA   $46
         CLC
         RTS

L025B72  DB    $00
L025B73  DB    $00
L025B74  DB    $00

         MX    %00
L025B75  JSR   L020D34
         LDA   L0207BD
         BNE   L025BBE
         LDX   #$0001
         LDY   #$0014
         JSL   L0300E2
         JSL   L0302E1
         STR   "Sorry, not enough memory for history buffer."
L025BB8  JSR   L02A0C1
         SEC
         CLV
         RTS

L025BBE  JSL   L0302E1
         STR   "   Command-line history from latest:"8D8D
         LDX   L0207BC
         LDY   L0207BE
         JSR   L023EF2
         STX   $0A
         STY   $0C
         LDX   L0207C0
         BNE   L025C24
         JSL   L0302E1
         STR   "   --- History buffer is empty ---"
         BRA   L025BB8
L025C24  STZ   L025C72
         CPX   #$0013
         BCC   L025C2F
         LDX   #$0012
L025C2F  PHX
         LDA   #$00A0
         JSL   L03022D
         CLC
         LDA   L025C72
         ADC   $0A
         STA   L025C50
         LDA   #$0000
         ADC   $0C
         SEP   #$20
         STA   L025C52
         REP   #$20
         JSL   L030314
L025C50  DB    $00
         DB    $00
L025C52  DB    $00
         PLX
         CPX   #$0001
         BEQ   L025C6C
         PHX
         JSL   L0302C3
         PLX
         CLC
         LDA   L025C72
         ADC   #$0050
         STA   L025C72
         DEX
         BNE   L025C2F
L025C6C  JSR   L02A0C1
         SEC
         CLV
         RTS

L025C72  DB    $00
         DB    $00
L025C74  PHP
         REP   #$30
         LDA   [$F8]
         AND   #$00FF
         BEQ   L025C89
         JSR   L021586
         LDY   #^L0215CD
         LDA   #L0215CD
         BRA   L025CAC
L025C89  LDAL  L050143
         BNE   L025CA8
         LDA   L020184
         BNE   L025C9C
         LDA   #L025CE4
         LDY   #^L025CE4
         BRA   L025CAC
L025C9C  LDX   L020183
         LDY   L020185
         JSR   L023EF2
         TXA
         BRA   L025CAC
L025CA8  LDA   #$0000
         TAY
L025CAC  JSL   L05054C
         BCC   L025CBF
         CMP   #$0000
         BNE   L025CBC
         JSR   L020AB8
         BRA   L025CBF
L025CBC  JSR   L020AF7
L025CBF  PLP
         CLC
         RTS

L025CC2  PHP
         REP   #$30
         LDA   [$F8]
         AND   #$00FF
         BEQ   L025CD7
         JSR   L021586
         LDY   #^L0215CD
         LDA   #L0215CD
         BRA   L025CD8
L025CD7  TAY
L025CD8  JSL   L0523AA
         BCC   L025CE1
         JSR   L020AF7
L025CE1  PLP
         CLC
         RTS

L025CE4  STRL  '9:ScriptFile.S'
L025CF4  PHP
         REP   #$30
         LDX   #$0000
L025CFA  LDA   [$F8]
         INC   $F8
         AND   #$00FF
         BEQ   L025D11
         AND   #$007F
         CMP   #$0020
         BEQ   L025D11
         STA   L025D36,X
         INX
         BRA   L025CFA
L025D11  SEP   #$10
         STX   L025D35
         REP   #$10
         PEA   ^L025D35
         PEA   L025D35
         CMP   #$0000
         BEQ   L025D2A
         JSR   L021339
         PHY
         PHA
         BRA   L025D2E
L025D2A  PEI   $42
         PEI   $54
L025D2E  JSL   L05063A
         PLP
         CLC
         RTS

L025D35  DB    $00
L025D36  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L025D7E  JSL   L051902
         CLC
         RTS

L025D84  DB    $00
         DB    $00
L025D86  DB    $80
         DB    $C0
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DW    $0011      ; number of tools
         DW    $0004      ; quickdraw II
         DW    $0301
         DW    $0005      ; desk manager
         DW    $0302
         DW    $0006      ; event manager
         DW    $0300
         DW    $000B      ; int math tool set
         DW    $0200
         DW    $000E      ; window manager
         DW    $0301
         DW    $000F      ; menu manager
         DW    $0301
         DW    $0010      ; control manager
         DW    $0301
         DW    $0012      ; quickdraw II aux
         DW    $0301
         DW    $0013      ; print manager
         DW    $0300
         DW    $0014      ; lineedit tool set
         DW    $0301
         DW    $0015      ; dialog manager
         DW    $0301
         DW    $0016      ; scrap manager
         DW    $0300
         DW    $0017      ; std file tool set
         DW    $0301
         DW    $001B      ; font manager
         DW    $0301
         DW    $001C      ; list manager
         DW    $0301
         DW    $001E
         DW    $0100
         DW    $0022
         DW    $0101
L025DD4  JSR   L02089E
         JSR   L020811
         SEP   #$20
         LDAL  $E0C025
         REP   #$20
         AND   #$0080
         EOR   #$0080
         PHA
         LDA   L025D86
         AND   #$FF7F
         ORA   $01,S
         STA   L025D86
         PHA
         LDA   $FE
         PHA
         PEA   $0000
         PEA   ^L025D84
         PEA   L025D84
         _StartUpTools
         PLA
         STA   L025E5C
         PLA
         STA   L025E5E
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         PHA
         PEA   $8000
         _UseColorTable
         _DisposeHandle
         JSR   L025E60
         JSR   L025FE3
         PHP
         PHA
         PEA   $FFFF
         PEA   $0000
         _FlushEvents
         PLA
         PEA   $0004
         PEA   ^L025D84
         PEA   L025D84
         _ShutDownTools
         JSR   L0207C2
         JSR   L02084C
         PLP
         BVS   L025E5A
         CLC
         RTS

L025E5A  SEC
         RTS

L025E5C  DB    $00
         DB    $00
L025E5E  DB    $00
         DB    $00
L025E60  PEA   $0000
         PEA   $0000
         PEA   ^L025F57
         PEA   L025F57
         _NewMenu
         PEA   $0000
         _InsertMenu
         PEA   $0000
         PEA   $0000
         PEA   ^L025F15
         PEA   L025F15
         _NewMenu
         PEA   $0000
         _InsertMenu
         PEA   $0000
         PEA   $0000
         PEA   ^L025EE6
         PEA   L025EE6
         _NewMenu
         PEA   $0000
         _InsertMenu
         PEA   $0001
         _FixAppleMenu
         PEA   $0000
         _FixMenuBar
         PLA
         PEA   $000A
         _SetMTitleStart
         _DrawMenuBar
         _InitCursor
         CLC
         RTS

L025EE6  ASC   '>>@\XH'01000D
         ASC   '==About TFB-Disasm'
         ASC   "I"
         ASC   '\BH'00010D
         ASC   '==-\N500D\0'0D
         ASC   '.'
L025F15  ASC   '>>  File  \H'02000D
         ASC   '==Return\BV*RrH'01010D
         ASC   '==Quit\BV*QqH'02010D
         ASC   '==Close\D*WwH'03010D
         ASC   '.'
L025F57  ASC   '>>  Edit  \H'03000D
         ASC   '==Undo\*ZzH'
         ASC   "z"000D
         ASC   '==-\N500D'0D
         ASC   '==Cut\*XxH'
         ASC   "{"000D
         ASC   '==Copy\*CcH'
         ASC   "|"000D
         ASC   '==Paste\*VvH'
         ASC   "}"000D
         ASC   '==Clear\H'
         ASC   "~"000D
         ASC   '.'
L025FB5  DW    $0000      ; event code
         ADRL  $00000000  ; event message
         ADRL  $00000000  ; tick count
         DW    $0000      ; mouse location
         DW    $0000
         DW    $0000      ; modifiers
L025FC5  ADRL  $00000000  ; task data
         ADRL  $001FFFFF  ; task mask
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         MX    %00
L025FE3  PHA
         PHA
         _FrontWindow
         PLA
         ORA   $01,S
         STA   $01,S
         PLA
         BEQ   L02600B
         BIT   L026063
         BMI   L02601D
         PEA   $0103
         _EnableMItem
         LDA   #$FFFF
         STA   L026063
         BRA   L02601D
L02600B  BIT   L026063
         BPL   L02601D
         PEA   $0103
         _DisableMItem
         STZ   L026063
L02601D  PEA   $0000
         PEA   $FFFF
         PEA   ^L025FB5
         PEA   L025FB5
         _TaskMaster
         PLA
         BEQ   L025FE3
         CMP   #$0011
         BEQ   L02603F
         CMP   #$0019
         BNE   L025FE3
         BRA   L026052
L02603F  LDA   L025FC5
         CMP   #$0104
         BCS   L026052
         SEC
         SBC   #$00FA
         ASL
         TAX
         JSR   (L026065,X)
         BCS   L026062
L026052  PEA   $0000
         LDA   L025FC5+2
         PHA
         _HiliteMenu
         BRA   L025FE3
L026062  RTS

L026063  DB    $00
         DB    $00

L026065  DA    L026062
         DA    L026062
         DA    L026062
         DA    L026062
         DA    L026062
         DA    L026062
         DA    L026079
         DA    L02607B
         DA    L02607E
         DA    L026095

L026079  CLC
         RTS

L02607B  SEC
         CLV
         RTS

L02607E  PEA   $0004
         PEA   ^L025D84
         PEA   L025D84
         _ShutDownTools
         LDA   L020003
         TCS
         JMP   L020A10

L026095  PHA
         PHA
         _FrontWindow
         LDA   $02,S
         BEQ   L0260AB
         _CloseNDAbyWinPtr
         CLC
         RTS

L0260AB  PLA
         PLA
         CLC
         RTS

L0260AF  JSR   L021309
         BCC   L0260BE
         JSR   L026659
         PHP
         JSR   L021E04
         PLP
         CLV
         RTS

L0260BE  CMP   #$00AF
         BEQ   L0260C8
         DEC   $F8
         BRL   L0264AD
L0260C8  JSR   L021309
         CMP   #$00C4
         BNE   L0260E6
         JSR   L02635B
         BCC   L0260D6
         RTS

L0260D6  PEA   ^L0263B1
         PEA   L0263B1
         PEA   $2002      ; Destroy
         JSL   GSOS2
         BCS   L026112
         RTS

L0260E6  CMP   #$00D3
         BEQ   L0260EE
         BRL   L026352
L0260EE  JSR   L021320
         BCC   L0260F8
         JSR   L026698
         CLV
         RTS

L0260F8  JSR   L02635B
         BCC   L0260FE
         RTS

L0260FE  PEA   ^L026395
         PEA   L026395
         PEA   $2006      ; GetFileInfo
         JSL   GSOS2
         BCC   L026126
         CMP   #$0046
         BEQ   L026115
L026112  BRL   L026348
L026115  PEA   ^L0263A3
         PEA   L0263A3
         PEA   $2001      ; Create
         JSL   GSOS2
         BCS   L026112
         BRA   L0260FE
L026126  LDA   L02639D
         CMP   #$005A
         BEQ   L026131
L02612E  BRL   L02634D
L026131  LDA   L02639F
         CMP   #$8040
         BNE   L02612E
         JSR   L02629F
         BCS   L026112
         LDA   L0263DD
         STA   L0263F1
         STA   L026417
         STZ   L026417+2
         PEA   ^L026411
         PEA   L026411
         PEA   $2018      ; SetEOF
         JSL   GSOS2
         BCC   L02615C
L026159  BRL   L026345
L02615C  PEA   ^L026411
         PEA   L026411
         PEA   $2016      ; SetMark
         JSL   GSOS2
         BCS   L026159
         LDA   #$C6D4
         STA   L0263E5
         LDA   #$C4C2
         STA   L0263E5+2
         LDA   #$0100
         STA   L0263E9
         LDA   $F6
         ASL
         LDA   #$0000
         ROL
         ORA   $5E
         STA   L0263EB
         LDA   $44
         STA   L0263ED
         LDA   $46
         AND   #$00FF
         STA   L0263EF
         LDA   $54
         STA   L0263FB
         LDA   $56
         STA   L0263FD
         LDA   L02845D
         STA   L0263FF
         LDA   L02845F
         STA   L026401
         LDA   L028461
         STA   L026403
         LDA   L028463
         STA   L026405
         LDA   $42
         STA   L0263F9
         PEA   ^L026385
         PEA   L026385
         PEA   $200A      ; GetPrefix
         JSL   GSOS2
         BCS   L026159
         LDA   L021658
         INC
         INC
         STA   L026435
         CLC
         ADC   L0263F1
         STA   L0263F3
         PEA   ^L02642D
         PEA   L02642D
         PEA   $2013      ; Write
         JSL   GSOS2
         BCC   L0261ED
         BRL   L026345
L0261ED  BIT   $F6
         BMI   L0261F6
         BIT   L0283C2
         BMI   L026201
L0261F6  LDA   L0263F3
         STA   L0263F5
         STZ   L0263F3
         BRA   L02621F
L026201  LDA   L0282C2
         INC
         INC
         STA   L026445
         CLC
         ADC   L0263F3
         STA   L0263F5
         PEA   ^L02643D
         PEA   L02643D
         PEA   $2013      ; Write
         JSL   GSOS2
         BCS   L026270
L02621F  LDAL  L041ACA
         BNE   L026230
         STZ   L0263F5
         JSR   L026302
         STA   L0263F7
         BRA   L02624F
L026230  LDAL  L041ACE
         INC
         INC
         STA   L026455
         CLC
         ADC   L0263F5
         STA   L0263F7
         PEA   ^L02644D
         PEA   L02644D
         PEA   $2013      ; Write
         JSL   GSOS2
         BCS   L026270
L02624F  LDA   $D8
         BNE   L026258
         STZ   L0263F7
         BRA   L026273
L026258  LDAL  L050143
         INC
         INC
         STA   L026465
         PEA   ^L02645D
         PEA   L02645D
         PEA   $2013      ; Write
         JSL   GSOS2
         BCC   L026273
L026270  BRL   L026345
L026273  JSR   L026313
         BCS   L026270
         LDA   #$0000
         JSR   L0262F1
         PEA   ^L0263D5
         PEA   L0263D5
         PEA   $2013      ; Write
         JSL   GSOS2
         BCS   L026270
         PEA   ^L026407
         PEA   L026407
         PEA   $2018      ; SetEOF
         JSL   GSOS2
         JSR   L0262DF
         CLC
         RTS

L02629F  PEA   ^L0263B7
         PEA   L0263B7
         PEA   $2010      ; Open
         JSL   GSOS2
         BCS   L0262DE
         LDA   L0263B9
         STA   L0263C1
         STA   L0263C5
         STA   L0263D7
         STA   L026409
         STA   L026413
         STA   L02641D
         STA   L026425
         STA   L02642F
         STA   L02643F
         STA   L02644F
         STA   L02645F
         STA   L02646F
         STA   L02647F
         STA   L02648F
         STA   L02649F
L0262DE  RTS

L0262DF  PHP
         PHA
         PEA   ^L0263BF
         PEA   L0263BF
         PEA   $2014      ; Close
         JSL   GSOS2
         PLA
         PLP
         RTS

L0262F1  STA   L026429
         PEA   ^L026423
         PEA   L026423
         PEA   $2016      ; SetMark
         JSL   GSOS2
         RTS

L026302  PEA   ^L02641B
         PEA   L02641B
         PEA   $2017      ; GetMark
         JSL   GSOS2
         LDA   L02641F
         RTS

L026313  PEA   ^L02641B
         PEA   L02641B
         PEA   $2017      ; GetMark
         JSL   GSOS2
         PHA
         LDA   L02641F
         LDA   L02641F+2
         STA   L02640D+2
         LDA   L02641F
         STA   L02640D
         PLA
         RTS

L026332  PEA   ^L0263C3
         PEA   L0263C3
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L026344
         LDA   L0263D3
L026344  RTS

L026345  JSR   L0262DF
L026348  JSR   L020AF7
         BRA   L026358
L02634D  LDA   #$0015
         BRA   L026355
L026352  LDA   #$0001
L026355  JSR   L020AB8
L026358  SEC
         CLV
         RTS

L02635B  JSR   L021586
         LDA   L0215CD
         BEQ   L026352
         LDA   #$3A33
         STA   L021656+4
         SEP   #$20
         LDX   #$0002
         LDY   #$0000
L026371  LDA   L0215CF,Y
         INY
         STA   L021656+4,X
         INX
         CPY   L0215CD
         BCC   L026371
         STX   L021658
         REP   #$20
         CLC
         RTS

L026385  DW    $0002      ; Parms for GetPrefix
         DW    $0000      ;  prefix num
         ADRL  L021656    ;  prefix ptr
L02638D  DW    $0002      ; Parms for SetPrefix
         DW    $0000      ;  prefix num
         ADRL  L021658  ;  prefix ptr
L026395  DW    $0004      ; Parms for GetFileInfo
         ADRL  L021658  ;  file name
         DW    $0000      ;  access
L02639D  DW    $0000      ;  file type
L02639F  ADRL  $00000000  ;  aux type
L0263A3  DW    $0004      ; Parms for Create
         ADRL  L021658  ;  file name
         DW    $00C3      ;  access
         DW    $005A      ;  file type
         ADRL  $00008040  ;  aux type
L0263B1  DW    $0001      ; Parms for Destroy
         ADRL  L021658  ;  file name
L0263B7  DW    $0002      ; Parms for Open
L0263B9  DW    $0000      ;  ref num
         ADRL  L021658  ;  path name
L0263BF  DW    $0001      ; Parms for Close
L0263C1  DW    $0000      ;  ref num
L0263C3  DW    $0004      ; Parms for Read
L0263C5  DW    $0000      ;  ref num
         ADRL  L0263D3    ;  buffer ptr
         ADRL  $00000002  ;  request count
         ADRL  $00000000  ;  transfer count
L0263D3  DW    $0000
L0263D5  DW    $0004      ; Parms for Read
L0263D7  DW    $0000      ;  ref num
         ADRL  L0263E5    ;  buffer ptr
L0263DD  ADRL  $00000022  ;  request count
         ADRL  $00000000  ;  transfer count
L0263E5  ASC   "TFBD"
L0263E9  DB    $00
         DB    $01
L0263EB  DB    $00
         DB    $00
L0263ED  DB    $00
L0263EE  DB    $00
L0263EF  DB    $00
         DB    $00
L0263F1  DB    $22
         DB    $00
L0263F3  DB    $00
         DB    $00
L0263F5  DB    $00
         DB    $00
L0263F7  DB    $00
         DB    $00
L0263F9  DB    $00
         DB    $00
L0263FB  DB    $00
         DB    $00
L0263FD  DB    $00
         DB    $00
L0263FF  DB    $00
         DB    $00
L026401  DB    $00
         DB    $00
L026403  DB    $00
         DB    $00
L026405  DB    $00
         DB    $00
L026407  DW    $0003      ; Parms for SetEOF
L026409  DW    $0000      ;  ref num
         DW    $0000      ;  base
L02640D  ADRL  $00000000  ;  displacement
L026411  DW    $0003      ; Parms for SetMark
L026413  DW    $0000      ;  ref num
         DW    $0000      ;  base
L026417  ADRL  $00000000  ;  displacement
L02641B  DW    $0002      ; Parms for GetMark
L02641D  DW    $0000      ;  ref num
L02641F  ADRL  $00000000  ;  position
L026423  DW    $0003      ; Parms for SetMark
L026425  DW    $0000      ;  ref num
         DW    $0000      ;  base
L026429  ADRL  $00000000  ;  displacement
L02642D  DW    $0004      ; Parms for Write
L02642F  DW    $0000      ;  ref num
         ADRL  L021658  ;  buffer ptr
L026435  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02643D  DW    $0004      ; Parms for Write
L02643F  DW    $0000      ;  ref num
         ADRL  L0282C2    ;  buffer ptr
L026445  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02644D  DW    $0004      ; Parms for Write
L02644F  DW    $0000      ;  ref num
         ADRL  L041ACE    ;  buffer ptr
L026455  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02645D  DW    $0004      ; Parms for Write
L02645F  DW    $0000      ;  ref num
         ADRL  L050143    ;  buffer ptr
L026465  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02646D  DW    $0004      ; Parms for Read
L02646F  DW    $0000      ;  ref num
         ADRL  L021656+4  ;  buffer ptr
L026475  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02647D  DW    $0004      ; Parms for Read
L02647F  DW    $0000      ;  ref num
         ADRL  L0282C4    ;  buffer ptr
L026485  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02648D  DW    $0004      ; Parms for Read
L02648F  DW    $0000      ;  ref num
         ADRL  L041AD0    ;  buffer ptr
L026495  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02649D  DW    $0004      ; Parms for Read
L02649F  DW    $0000      ;  ref num
         ADRL  L050145    ;  buffer ptr
L0264A5  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L0264AD  JSR   L02635B
         BCC   L0264B3
         RTS

L0264B3  PEA   ^L026395
         PEA   L026395
         PEA   $2006      ; GetFileInfo
         JSL   GSOS2
L0264C0  BCC   L0264C5
         BRL   L026348
L0264C5  LDA   L02639D
         CMP   #$005A
         BEQ   L0264D0
L0264CD  BRL   L02634D
L0264D0  LDA   L02639F
         CMP   #$8040
         BNE   L0264CD
         JSR   L02629F
         BCS   L0264C0
         PEA   ^L0263D5
         PEA   L0263D5
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L0264EF
L0264EC  BRL   L026345
L0264EF  LDA   L0263F1
         JSR   L0262F1
         JSR   L026332
         BCS   L0264EC
         STA   L021658
         STA   L026475
         PEA   ^L02646D
         PEA   L02646D
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L0264EC
         PEA   ^L02638D
         PEA   L02638D
         PEA   $2009      ; SetPrefix
         JSL   GSOS2
         BCS   L0264EC
         LDA   L0263F3
         BEQ   L026540
         JSR   L0262F1
         JSR   L026332
         BCS   L0264EC
         STA   L0282C2
         STA   L026485
         PEA   ^L02647D
         PEA   L02647D
         PEA   $2012      ; Read
         JSL   GSOS2
L02653E  BCS   L0264EC
L026540  LDA   L0263F5
         BEQ   L026563
         JSR   L0262F1
         JSR   L026332
         BCS   L0264EC
         STAL  L041ACE
         STA   L026495
         PEA   ^L02648D
         PEA   L02648D
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L02653E
L026563  LDA   L0263F7
         BEQ   L026586
         JSR   L0262F1
         JSR   L026332
         BCS   L02653E
         STAL  L050143
         STA   L0264A5
         PEA   ^L02649D
         PEA   L02649D
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L02653E
L026586  LDA   L0263EB
         PHA
         AND   #$FFFE
         STA   $5E
         STZ   $F6
         PLA
         AND   #$0001
         BEQ   L02659C
         LDA   #$FFFF
         STA   $F6
L02659C  LDA   L0263ED
         STA   $44
         LDA   L0263EE
         STA   $45
         LDA   L0263FB
         STA   $54
         LDA   L0263FD
         STA   $56
         LDA   L0263FF
         STA   L02845D
         LDA   L026401
         STA   L02845F
         LDA   L026403
         STA   L028461
         LDA   L026405
         STA   L028463
         JSR   L0262DF
         LDA   L0263F3
         BNE   L0265F7
         BIT   $F6
         BPL   L0265DC
         JSR   L023D1C
         JSR   L021E04
         BRA   L02660B
L0265DC  JSR   L020D34
         JSL   L040FF1
         JSL   L041D74
         JSR   L02A229
         STZ   L0283C2
         STZ   $40
         STZ   $42
         STZ   $5C
         STZ   $F6
         BRA   L02663D
L0265F7  LDA   L0263F9
         BIT   L02845D
         BPL   L026604
         JSR   L0290DD
         BRA   L026607
L026604  JSR   L028C22
L026607  BCC   L02660B
         CLV
         RTS

L02660B  LDA   L0263F5
         BEQ   L02663D
         JSR   L020D0C
         PEA   $0000
         PEA   $0000
         JSL   L041F95
         BCC   L026625
         JSR   L021E04
L026622  BRL   L026348
L026625  REP   #$20
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         JSL   L0437E4
         JSL   L042328
         JSR   L020D34
         JSR   L021E04
L02663D  LDA   L0263F7
         BEQ   L02664C
         LDA   #$0000
         TAY
         JSL   L05054C
         BCS   L02664E
L02664C  CLC
         RTS

L02664E  CMP   #$0000
         BNE   L026622
         JSR   L020AB8
         SEC
         CLV
         RTS

L026659  SEC
         LDA   L020007
         BEQ   L026697
         PHA
         PHA
         PEA   $0001
         PEA   $0000
         PEA   $0001
         _LoadResource
         PLX
         PLY
         BCS   L026697
         JSR   L023EF2
         STX   $10
         STY   $12
         LDA   [$10]
         STA   $5E
         SEP   #$30
         LDY   #$02
         CLC
         LDA   #$16
         ADC   [$10],Y
         INY
         STA   $44
         ADC   [$10],Y
         INY
         STA   $45
         ADC   [$10],Y
         STA   $46
         REP   #$31
L026697  RTS

L026698  SEC
         LDA   L020007
         BEQ   L0266ED
         PHA
         PHA
         PEA   $0001
         PEA   $0000
         PEA   $0001
         _LoadResource
         PLX
         PLY
         BCS   L0266ED
         JSR   L023EF2
         STX   $10
         STY   $12
         LDA   $5E
         STA   [$10]
         SEP   #$30
         LDY   #$02
         LDA   $44
         SEC
         SBC   #$16
         STA   [$10],Y
         INY
         LDA   $45
         SBC   $44
         STA   [$10],Y
         INY
         LDA   $46
         SBC   $45
         STA   [$10],Y
         REP   #$30
         PEA   $0001
         PEA   $0001
         PEA   $0000
         PEA   $0001
         _MarkResourceChange
L0266ED  RTS

L0266EE  DB    $00
L0266EF  DB    $00
L0266F0  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L026740  LDA   L0215CD
         BEQ   L02678A
         TAX
         INC
         INC
         TAY
         SEP   #$20
         LDA   L0215CF
         CMP   #$3A
         BNE   L026754
         DEY
         DEY
L026754  STY   L0266EE
L026757  LDA   L0215CE,X
         STA   L0266EF,Y
         DEY
         DEX
         BNE   L026757
         REP   #$20
         AND   #$007F
         CMP   #$003A
         BEQ   L026771
         LDA   #$3A32
         STA   L0266F0
L026771  PEA   ^L026797
         PEA   L026797
         PEA   $2006      ; GetFileInfo
         JSL   GSOS2
         BCS   L026795
         LDA   L02679F
         CMP   #$00BC
         BNE   L02678F
         CLC
         RTS

L02678A  LDX   #$0001
         BRA   L026792
L02678F  LDX   #$0012
L026792  LDA   #$0000
L026795  SEC
         RTS

L026797  DW    $0004      ; Parms for GetFileInfo
         ADRL  L0266EE    ;  file name
         DW    $0000      ;  access
L02679F  DW    $0000      ;  file type
L0267A1  ADRL  $00000000  ;  aux type
L0267A5  DB    $00
         DB    $00
L0267A7  DB    $00
         DB    $00
L0267A9  DB    $00
         DB    $00
L0267AB  DB    $00
         DB    $00
L0267AD  DB    $00
L0267AE  DB    $00
L0267AF  PHK
         PLB
         LDA   L0267A5
         TCS
         LDA   L0267A7
         TCD
L0267B9  LDA   L0267AD
         BEQ   L0267D2
         PHA
         PHA
         PEA   $0000
         PHA
         _FindHandle
         _DisposeHandle
L0267D2  LDA   L0267A9
         BEQ   L0267F0
         PHA
         LDA   L0267A9
         PHA
         PEA   $0000
         _UserShutDown
         _DeleteID
         STZ   L0267A9
L0267F0  CLC
         RTS

L0267F2  HEX   2C
L0267F3  BRA   L026809
         JSR   L021586
         JSR   L026740
         BCC   L026809
         CMP   #$0000
         BEQ   L026805
         BRL   L026958
L026805  TXA
         BRL   L026979
L026809  LDA   L0267A1
         BEQ   L026825
         BPL   L026818
         BIT   L0283CA
         BMI   L026818
         BRL   L026976
L026818  AND   #$7FFF
         BEQ   L026825
         CMP   L028451
         BEQ   L026825
         BRL   L026976
L026825  STZ   L0267AB
         STZ   L0267AD
         PHA
         PHA
         PHA
         PHA
         PHA
         PHA
         PEI   $FE
         _GetNewID
         PEA   ^L0266EE
         PEA   L0266EE
         PEA   $0000
         PEA   $0001
         _InitialLoad2
         STA   L026986
         PLA
         STA   L0267A9
         PLA
         STA   L026982
         STA   $00
         PLA
         STA   L026984
         STA   $02
         PLA
         STA   L0267AB
         CLC
         ADC   $01,S
         STA   L0267AD
         PLA
         LDA   L026986
         BEQ   L026873
         BRL   L02695D
L026873  LDA   L0267AD
         BNE   L0268A9
         PHA
         PHA
         PEA   $0000
         PEA   $0800
         LDA   L0267A9
         PHA
         PEA   $C015
         PEA   $0000
         PEA   $0000
         _NewHandle
         PLX
         PLY
         BCC   L02689B
         BRL   L026962
L02689B  JSR   L023EF2
         STX   L0267AB
         TXA
         CLC
         ADC   #$0800
         STA   L0267AD
L0268A9  LDA   [$00]
         CMP   #$C6D4
         BEQ   L0268B3
         BRL   L02696C
L0268B3  LDY   #$0002
         LDA   [$00],Y
         CMP   #$C4C2
         BEQ   L0268C0
         BRL   L02696C
L0268C0  INY
         INY
         LDA   [$00],Y
         CMP   #$0101
         BCC   L0268CC
         BRL   L026971
L0268CC  INY
         INY
         INY
         INY
         LDA   #$005C
         STA   [$00],Y
         INY
         LDA   #L0269D2
         STA   [$00],Y
         INY
         LDA   #>L0269D2
         STA   [$00],Y
         TSC
         STA   L0267A5
         TDC
         STA   L0267A7
         LDA   L0267AD
         DEC
         TCS
         LDA   $42
         PHA
         LDA   $3A
         PHA
         LDA   $3C
         PHA
         LDA   $3E
         PHA
         LDA   #$0000
         BIT   $5C
         BPL   L026902
         INC
L026902  PHA
         LDA   L0267AB
         TCD
         PLA
         STA   $86
         PLA
         STA   $84
         PLA
         STA   $82
         PLA
         STA   $80
         PLA
         STA   $88
         LDA   L0283CC
         STA   $94
         LDA   L0283CE
         STA   $96
         LDA   L0267A9
         STA   $98
         LDA   L028451
         STA   $8A
         LDA   L028453
         STA   $8C
         LDA   L028455
         STA   $8E
         LDA   #L0283D0
         STA   $90
         LDA   #^L0283D0
         STA   $92
         PHK
         PEA   L0267AE
         SEP   #$20
         LDA   L026984
         PHA
         REP   #$21
         LDA   L026982
         ADC   #$000B
         PHA
         LDA   L026983
         PHA
         PLB
         PLB
         RTL

L026958  JSR   L020AF7
         BRA   L02697C
L02695D  JSR   L020CB4
         BRA   L02697C
L026962  LDA   #$0000
         BRA   L026979
         LDA   #$0001
         BRA   L026979
L02696C  LDA   #$0012
         BRA   L026979
L026971  LDA   #$0013
         BRA   L026979
L026976  LDA   #$0014
L026979  JSR   L020AB8
L02697C  JSR   L0267B9
         SEC
         CLV
         RTS

L026982  DB    $00
L026983  DB    $00
L026984  DB    $00
         DB    $00
L026986  DB    $00
         DB    $00
L026988  DB    $00
         DB    $00
L02698A  DB    $00
         DB    $00
L02698C  DB    $00
         DB    $00
L02698E  DB    $00
L02698F  JSR   L020CED
         LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
         STR   "> Abort expansion execution ? "
         JSL   L03034A
         PHA
         JSR   L020CED
         PLA
         AND   #$005F
         CMP   #$0059
         BEQ   L0269D1
         CLC
L0269D1  RTS

L0269D2  PHB
         PHP
         REP   #$30
         PHK
         PLB
         LDA   L0267A7
         TCD
         PLA
         AND   #$FFFE
         STA   L02698A
         STX   L026988
         PLA
         STA   L02698C
         SEP   #$20
         PLA
         STA   L02698E
         LDAL  $E0C025
         BPL   L026A0A
         LDAL  $E0C000
         AND   #$7F
         CMP   #$2E
         BNE   L026A0A
         REP   #$20
         JSR   L02698F
         BCC   L026A0A
         BRL   L0267AF
L026A0A  REP   #$20
         LDA   L026988
         AND   #$00FF
         CMP   #$0002
         BCS   L026A53
         ASL
         TAX
         LDA   L026A59,X
         PHA
         LDA   L026988
         XBA
         AND   #$00FF
         RTS

L026A25  LDA   #$0000
L026A28  STA   L026A51
         SEP   #$20
         LDA   L02698E
         PHA
         REP   #$20
         LDA   L02698C
         PHA
         LDA   L026A51
         BEQ   L026A42
         LDA   #$0001
         TSB   L02698A
L026A42  LDA   L02698A
         PHA
         LDA   L0267AB
         PHA
         LDA   L026A51
         PLD
         PLP
         PLB
         RTL

L026A51  DB    $00
         DB    $00
L026A53  LDA   #$0001
         BRL   L026A28

L026A59  DA    L026A5D-1
         DA    L026B36-1

L026A5D  CMP   #$0003
         BCS   L026A53
         ASL
         TAX
         JMP   (L026A67,X)

L026A67  DA    L026A6D
         DA    L026AAA
         DA    L026A70

L026A6D  BRL   L026A25
L026A70  PLA
         STA   L026A9B
         SEP   #$20
         PLA
         STA   L026A9B+2
         PLA
         REP   #$20
         JSL   L0300EE
         PHX
         PHY
         LDX   #$0000
         LDY   #$0017
         JSL   L0300E2
         JSR   L020CED
         JSL   L030314
         ADR   L0201F7
         JSL   L030314
L026A9B  ADR   $000000
         JSL   L03034A
         PLY
         PLX
         JSL   L0300E2
         BRA   L026A6D
L026AAA  PLA
         STA   L026AD5
         SEP   #$20
         PLA
         STA   L026AD5+2
         PLA
         REP   #$20
         JSL   L0300EE
         PHX
         PHY
         LDX   #$0000
         LDY   #$0017
         JSL   L0300E2
         JSR   L020CED
         JSL   L0302E1
         STR   "> "
         JSL   L030314
L026AD5  ADR   $000000
         PLY
         PLX
         JSL   L0300E2
         BRA   L026A6D
L026AE0  DB    $06
         DB    $00
         DB    $11
         DB    $00
         DB    $05
         DB    $00
         DB    $07
         DB    $00
L026AE8  DA    L026AF0
         DA    L026AFC
         DA    L026B1E
         DA    L026B28
L026AF0  DA    L026B70
         DA    L026B81
         DA    L026B92
         DA    L026BA1
         DA    L026BAC
         DA    L026BB9
L026AFC  DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
         DA    L026BC2
L026B1E  DA    L026C53
         DA    L026C53
         DA    $0000
         DA    $0000
         DA    L026C53
L026B28  DA    L026C62
         DA    L026C78
         DA    L026C86
         DA    L026CA7
         DA    L026CAE
         DA    L026CC8
         DA    L026CDF

L026B36  PHA
         AND   #$001F
         STA   L026B6E
         PLA
         AND   #$00E0
         LSR
         LSR
         LSR
         LSR
         CMP   #$0008
         BCC   L026B4D
         BRL   L026A53
L026B4D  TAX
         LDA   L026B6E
         CMP   L026AE0,X
         BCC   L026B59
         BRL   L026A53
L026B59  ASL
         PHA
         LDA   L026AE8,X
         CLC
         ADC   $01,S
         PLY
         TAX
         LDA   |$0000,X
         BNE   L026B6B
         BRL   L026A53
L026B6B  DEC
         PHA
         RTS

L026B6E  DB    $00
         DB    $00
L026B70  JSL   L042ABB
         PHY
         PHA
         BCS   L026B7B
         BRL   L026A6D
L026B7B  LDA   #$0102
         BRL   L026A28
L026B81  JSL   L042A5C
         PHY
         PHA
         BCS   L026B8C
         BRL   L026A6D
L026B8C  LDA   #$0101
         BRL   L026A28
L026B92  JSL   L045089
         BCS   L026B9B
         BRL   L026A6D
L026B9B  LDA   #$0103
         BRL   L026A28
L026BA1  PEA   $0001
         JSL   L0413FC
         PHA
         BRL   L026A6D
L026BAC  PLY
         INY
         LDA   #$0080
         JSL   L04172C
         PHY
         BRL   L026A6D
L026BB9  PLA
         JSL   L0416F3
         PHA
         BRL   L026A6D
L026BC2  LDX   L026B6E
         PHX
         CPX   #$0006
         BCC   L026BED
         LDA   L026BDC,X
         AND   #$00FF
         BEQ   L026BD5
         STA   $03,S
L026BD5  JSL   L043069
         BRL   L026A25
L026BDC  DB    $01
         DB    $02
         DB    $02
         DB    $02
         DB    $04
         DB    $03
         DB    $0A
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
L026BED  TXA
         ASL
         TAX
         LDA   $03,S
         JSR   (L026BF9,X)
         STA   $03,S
         BRA   L026BD5

L026BF9  DA    L026C05
         DA    L026C06
         DA    L026C06
         DA    L026C06
         DA    L026C0D
         DA    L026C15

L026C05  RTS

L026C06  BIT   #$0001
         BEQ   L026C05
         INC
         RTS

L026C0D  BIT   #$0003
         BEQ   L026C05
         INC
         BRA   L026C0D
L026C15  PHA
         JSR   L026C1F
         PLA
         BCC   L026C05
         INC
         BRA   L026C15
L026C1F  STA   L026C4F
         STZ   L026C51
         LDX   #$0008
L026C28  LDA   #$0000
         ASL   L026C4F
         ROL
         ASL   L026C4F
         ROL
         ADC   L026C51
         STA   L026C51
         DEX
         BNE   L026C28
         LDA   L026C51
         BEQ   L026C4A
         CMP   #$0003
         BEQ   L026C4A
         BCS   L026C1F
         SEC
         RTS

L026C4A  LDA   #$0000
         CLC
         RTS

L026C4F  DB    $00
         DB    $00
L026C51  DB    $00
         DB    $00
L026C53  PLX
         PLY
         LDA   L026B6E
         PHA
         PHY
         PHX
         JSL   L042748
         BRL   L026A25
L026C62  LDA   $01,S
         ORA   $03,S
         BNE   L026C71
         PLA
         PLA
         JSL   L042C85
         BRL   L026A25
L026C71  JSL   L042BC0
         BRL   L026A25
L026C78  LDA   $01,S
         AND   #$FEFE
         STA   $01,S
         JSL   L042D43
         BRL   L026A25
L026C86  LDA   $07,S
         XBA
         AND   #$FF00
         STA   $07,S
         LDA   $05,S
         AND   #$00FF
         ORA   $07,S
         STA   $07,S
         LDA   $03,S
         STA   $05,S
         LDA   $01,S
         STA   $03,S
         PLA
         JSL   L043774
         BRL   L026A25
L026CA7  JSL   L043772
         BRL   L026A25
L026CAE  LDA   $01,S
         CMP   #$8000
         BNE   L026CBE
         PLA
         PLA
         JSL   L042ED4
         BRL   L026A25
L026CBE  STA   $03,S
         PLA
         JSL   L042E01
         BRL   L026A25
L026CC8  LDA   $07,S
         EOR   $42
         BEQ   L026CD1
         BRL   L026B8C
L026CD1  LDA   $05,S
         TAY
         LDA   [$3A],Y
         STA   $03,S
         JSL   L043813
         BRL   L026A25
L026CDF  LDA   $01,S
         ORA   $03,S
         BNE   L026CF4
         PLA
         PLA
         PEA   $0001
         PEA   $FF66
         JSL   L0435FB
         BRL   L026A25
L026CF4  JSL   L04386A
         BRL   L026A25
L026CFB  DB    $00
L026CFC  DB    $00
L026CFD  DB    $00
         DB    $00
L026CFF  DB    $00
L026D00  DB    $00
L026D01  DB    $00
         DB    $00
L026D03  DB    $00
L026D04  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L026D13  DB    $00
         DB    $00
L026D15  DB    $00
         DB    $00
L026D17  LDA   L026CFC
         BEQ   L026D60
         LDY   L026CFD
         LDX   L026CFB
L026D22  STY   L026D01
         STX   L026CFF
         PHB
         PHY
         PLB
         LDA   |$0002,X
         STA   $12
         LDA   |$0000,X
         STA   $10
         PLB
         PLB
         SEP   #$30
         LDY   #$04
         LDX   #$00
L026D3D  LDA   [$10],Y
         CMP   L026D03,X
         BNE   L026D51
         INY
         INX
         CPX   L026D03
         BEQ   L026D3D
         BCC   L026D3D
         REP   #$30
         CLC
         RTS

L026D51  REP   #$30
         LDA   [$10]
         TAX
         LDY   #$0002
         LDA   [$10],Y
         TAY
         ORA   [$10]
         BNE   L026D22
L026D60  SEC
         RTS

L026D62  LDA   L026CFC
         BEQ   L026DA1
         LDA   L026D00
         BEQ   L026DA1
         LDY   L026CFD
         LDX   L026CFB
         CPX   L026CFF
         BNE   L026DA3
         CPY   L026D01
         BNE   L026DA3
         PHB
         PHY
         PLB
         LDA   |$0002,X
         STA   $12
         LDA   |$0000,X
         STA   $10
         PLB
         PLB
         PHY
         PHX
         LDY   #$0002
         LDA   [$10]
         STA   L026CFB
         LDA   [$10],Y
         STA   L026CFD
L026D9A  _DisposeHandle
L026DA1  CLC
         RTS

L026DA3  PHB
         PHY
         PLB
         LDA   |$0002,X
         STA   $12
         LDA   |$0000,X
         STA   $10
         PLB
         PLB
         LDY   #$0002
         LDA   [$10]
         TAX
         LDA   [$10],Y
         TAY
         ORA   [$10]
         BEQ   L026DA1
         CPX   L026CFF
         BNE   L026DA3
         CPY   L026D01
         BNE   L026DA3
         PHY
         PHX
         PHB
         PHY
         PLB
         LDA   |$0002,X
         STA   $16
         LDA   |$0000,X
         STA   $14
         PLB
         PLB
         LDY   #$0002
         LDA   [$14]
         STA   [$10]
         LDA   [$14],Y
         STA   [$10],Y
         BRA   L026D9A
L026DE7  LDA   $F8
         STA   L026E62
         LDA   #$0006
         STA   L026D13
         STZ   L026D15
L026DF5  JSR   L021320
         BCS   L026E28
         CMP   #$00DD
         BEQ   L026E30
         JSR   L026E64
         BCS   L026E28
         LDA   #$0006
         ADC   L026D13
         STA   L026D13
         INC   L026D15
         SEP   #$30
         LDY   #$FF
L026E14  INY
         LDA   [$F8],Y
         CMP   #$A0
         BEQ   L026E1F
         CMP   #$DD
         BNE   L026E14
L026E1F  REP   #$31
         TYA
         ADC   $F8
         STA   $F8
         BRA   L026DF5
L026E28  LDA   #$0001
L026E2B  JSR   L020AB8
         SEC
         RTS

L026E30  INC   $F8
         LDX   #$FFFF
L026E35  INX
         JSR   L021309
         SEP   #$20
         STA   L026D04,X
         REP   #$20
         BCC   L026E35
         CPX   #$0000
         BEQ   L026E28
         LDA   L026E62
         STA   $F8
         TXA
         SEP   #$21
         STA   L026D03
         REP   #$20
         ADC   L026D13
         STA   L026D13
         BCC   L026E61
         LDA   #$0017
         BRA   L026E2B
L026E61  RTS

L026E62  DB    $00
         DB    $00
L026E64  LDX   #$0000
         STX   L026F5A
         SEP   #$20
L026E6C  LDY   #$0000
L026E6F  JSR   L026F4B
         EORL  L040326,X
         AND   #$7F
         BNE   L026E84
         LDAL  L040326,X
         BPL   L026E98
         INX
         INY
         BNE   L026E6F
L026E84  INX
         LDAL  L040326-1,X
         BMI   L026E84
         INC   L026F5A
         LDAL  L040326,X
         BNE   L026E6C
         REP   #$20
         BRA   L026EB4
L026E98  REP   #$21
         INY
         TYA
         ADC   $F8
         STA   $F8
         LDA   #$0001
         STA   L026F5E
         LDX   L026F5A
         LDA   L026F60,X
         AND   #$00FF
         STA   L026F5C
         BRA   L026EFC
L026EB4  LDA   #$8000
         STA   L026F5A
         SEP   #$20
         LDX   #$0000
L026EBF  LDY   #$0000
L026EC2  JSR   L026F4B
         EORL  L026F71,X
         AND   #$7F
         BNE   L026ED7
         LDAL  L026F71,X
         BPL   L026EEB
         INX
         INY
         BNE   L026EC2
L026ED7  INX
         LDAL  L026F70,X
         BMI   L026ED7
         INC   L026F5A
         LDAL  L026F71,X
         BNE   L026EBF
         REP   #$20
L026EE9  SEC
         RTS

L026EEB  REP   #$21
         INY
         TYA
         ADC   $F8
         STA   $F8
         STZ   L026F5C
         LDA   #$0001
         STA   L026F5E
L026EFC  LDA   [$F8]
         AND   #$00FF
         BEQ   L026F40
         CMP   #$00DD
         BEQ   L026F40
         CMP   #$00A0
         BEQ   L026F40
         CMP   #$00A8
         BEQ   L026F23
         CMP   #$00AA
         BNE   L026EE9
         INC   $F8
         JSR   L021564
         BCS   L026EE9
         STA   L026F5E
         BRA   L026EFC
L026F23  INC   $F8
         JSR   L021564
         BCS   L026EE9
         LDX   L026F5C
         BNE   L026F32
         STA   L026F5C
L026F32  LDA   [$F8]
         AND   #$00FF
         CMP   #$00A9
         BNE   L026EE9
         INC   $F8
         BRA   L026EFC
L026F40  LDA   L026F5A
         LDX   L026F5E
         LDY   L026F5C
         CLC
         RTS

         MX    %10
L026F4B  LDA   [$F8],Y
         CMP   #$E1
         BCC   L026F59
         CMP   #$FB
         BCS   L026F59
         AND   #$DF
         STA   [$F8],Y
L026F59  RTS

L026F5A  DB    $00
         DB    $00
L026F5C  DB    $00
         DB    $00
L026F5E  DB    $00
         DB    $00
L026F60  DB    $01
         DB    $02
         DB    $02
         DB    $02
         DB    $04
         DB    $03
         DB    $0A
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L026F70  DB    $01
L026F71  ASC   "SK"
         ASC   'P'
         ASC   "C"
         ASC   'S'
         ASC   "C"
         DB    $31
         DB    $00
         MX    %00
L026F79  JSR   L026DE7
         BCC   L026F81
L026F7E  BRL   L02703E
L026F81  JSR   L026D17
         BCS   L026F89
         JSR   L026D62
L026F89  LDX   L026D13
         LDY   #$0000
         LDA   $08
         JSR   L023ED6
         BCS   L026F7E
         PHY
         PHX
         LDA   L026D03
         PHA
         STZ   L026D03
         JSR   L026D17
         PLA
         STA   L026D03
         LDA   L026CFC
         BNE   L026FB5
         PLX
         PLY
         STY   L026CFD
         STX   L026CFB
         BRA   L026FC2
L026FB5  LDY   #$0002
         LDA   $01,S
         STA   [$10]
         LDA   $03,S
         STA   [$10],Y
         PLX
         PLY
L026FC2  STY   L026D01
         STX   L026CFF
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $10
         LDA   |$0002,X
         STA   $12
         PLB
         PLB
         LDY   #$0002
         LDA   #$0000
         STA   [$10]
         STA   [$10],Y
         INY
         INY
         SEP   #$30
         LDX   #$00
L026FE7  LDA   L026D03,X
         INX
         STA   [$10],Y
         INY
         CPX   L026D03
         BEQ   L026FE7
         BCC   L026FE7
         REP   #$30
         LDA   L026D15
         STA   [$10],Y
         INY
         INY
L026FFE  PHY
         JSR   L021320
         PLY
         CMP   #$00DD
         BEQ   L02703D
         PHY
         PHY
         PHY
         JSR   L026E64
         STA   $03,S
         TYA
         STA   $05,S
         PLY
         PLA
         STA   [$10],Y
         INY
         INY
         PLA
         STA   [$10],Y
         INY
         INY
         TXA
         STA   [$10],Y
         INY
         INY
         PHY
         SEP   #$30
         LDY   #$FF
L027028  INY
         LDA   [$F8],Y
         CMP   #$A0
         BEQ   L027033
         CMP   #$DD
         BNE   L027028
L027033  REP   #$31
         TYA
         ADC   $F8
         STA   $F8
         PLY
         BRA   L026FFE
L02703D  CLC
L02703E  CLV
         RTS

L027040  SEP   #$30
         LDY   #$00
L027044  LDA   [$F8],Y
         BEQ   L02705C
         CMP   #$A0
         BEQ   L027060
         CMP   #$E1
         BCC   L027056
         CMP   #$FB
         BCS   L027056
         AND   #$DF
L027056  STA   L026D04,Y
         INY
         BRA   L027044
L02705C  REP   #$30
         SEC
         RTS

L027060  STY   L026D03
         REP   #$30
         CPY   #$0000
         BEQ   L02705C
         TYA
         ADC   $F8
         STA   $F8
         JSR   L020F52
         JSR   L026D17
         RTS

L027076  JSR   L021339
         BCC   L02707D
L02707B  SEC
         RTS

L02707D  STA   L027121
         LDA   #$0001
         STA   L027123
         JSR   L021309
         BCS   L02709D
         CMP   #$00AC
         BNE   L02707B
         JSR   L021564
         BCS   L02707B
         CMP   #$0000
         BEQ   L02709D
         STA   L027123
L02709D  LDX   L026CFF
         LDY   L026D01
         JSR   L023EF2
         STX   $10
         STY   $12
         LDY   #$0004
         LDA   [$10],Y
         AND   #$00FF
         CLC
         ADC   #$0005
         ADC   $10
         STA   $10
         BCC   L0270BE
         INC   $12
L0270BE  LDA   [$10]
         STA   L026D15
         LDY   #$0002
L0270C6  LDA   [$10],Y
         INY
         INY
         STA   L027125
         PHA
         LDA   [$10],Y
         INY
         INY
         STA   L027127
         LDA   [$10],Y
         INY
         INY
         STA   L027129
         PLA
         PHY
         ASL
         TAX
         BCC   L0270E7
         JSR   (L02711B,X)
         BRA   L0270EA
L0270E7  JSR   (L0270F9,X)
L0270EA  PLY
         BCS   L0270F7
         DEC   L026D15
         BNE   L0270C6
         DEC   L027123
         BNE   L0270BE
L0270F7  CLC
         RTS

L0270F9  DA    L027152
         DA    L027152
         DA    L027152
         DA    L027152
         DA    L027152
         DA    L027152
         DA    L027164
         DA    L027170
         DA    L02717A
         DA    L027170
         DA    L0271BB
         DA    L027170
         DA    L02718B
         DA    L02718B
         DA    L02718D
         DA    L0271A3
         DA    L027164

L02711B  DA    L0271EF
         DA    L027250
         DA    L027219

L027121  DB    $00
         DB    $00
L027123  DB    $00
         DB    $00
L027125  DB    $00
         DB    $00
L027127  DB    $00
         DB    $00
L027129  DB    $00
         DB    $00
L02712B  PEI   $42
         LDA   L027121
         PHA
         LDA   L027127
         PHA
         JSR   L0271EF
         BCC   L02713F
         PLA
         PLA
         PLA
L02713D  SEC
         RTS

L02713F  LDA   L027125
         PHA
         JSL   L043069
         LDA   L027121
         BEQ   L02713D
         CMP   $3E
         BEQ   L02713D
         CLC
         RTS

L027152  CLC
         LDA   #$0000
L027156  ADC   L027127
         DEC   L027129
         BNE   L027156
         INC   L027129
         STA   L027127
L027164  JSR   L02712B
         BCS   L02716F
         DEC   L027129
         BNE   L027164
L02716E  CLC
L02716F  RTS

L027170  LDA   L027127
         BNE   L027164
L027175  INC   L027127
         BRA   L027164
L02717A  LDA   L027127
         BNE   L027164
         LDY   L027121
         LDA   [$3A],Y
         AND   #$00FF
         BNE   L02716E
         BRA   L027175
L02718B  CLC
         RTS

L02718D  LDY   L027121
         LDA   [$3A],Y
         INC
         INC
         STA   L027127
         JSR   L02712B
         BCS   L02716F
         DEC   L027129
         BNE   L02718D
         CLC
         RTS

L0271A3  LDY   L027121
         LDA   [$3A],Y
         AND   #$00FF
         INC
         STA   L027127
         JSR   L02712B
         BCS   L02716F
         DEC   L027129
         BNE   L0271A3
         CLC
         RTS

L0271BB  SEP   #$20
         LDY   L027121
         LDA   [$3A],Y
         STA   L0271EE
         LDX   #$0001
L0271C8  INX
         INY
         BEQ   L0271EC
         BIT   $5D
         BMI   L0271D4
         CPY   $3E
         BCS   L0271EC
L0271D4  LDA   [$3A],Y
         EOR   L0271EE
         BPL   L0271C8
         STX   L027127
         REP   #$20
         JSR   L02712B
         BCS   L0271EC
         DEC   L027129
         BNE   L0271BB
         CLC
         RTS

L0271EC  SEC
         RTS

L0271EE  DB    $00
L0271EF  LDA   L027121
         CMP   $3E
         BEQ   L02720B
         CLC
         ADC   L027127
         BIT   $5C
         BMI   L027210
         BCS   L02720B
         CMP   $3E
         BEQ   L027206
         BCS   L02720B
L027206  STA   L027121
         CLC
         RTS

L02720B  STZ   L027121
         SEC
L02720F  RTS

L027210  BCC   L027206
         CMP   #$0001
         BCS   L02720B
         BRA   L027206
L027219  LDY   L027121
         LDA   [$3A],Y
         STA   L027127
         PHY
         PEI   $42
         PHY
         PEA   $0002
         PEA   $0001
         JSL   L043069
         PLY
         INY
         INY
         STY   L027121
         PHY
         JSR   L0271EF
         PLY
         BCS   L02720F
         LDA   L027127
         JSR   L0242DC
         LDY   L027121
         BEQ   L02724E
         DEC   L027129
         BNE   L027219
         CLC
         RTS

L02724E  SEC
         RTS

L027250  LDY   L027121
         LDX   #$0001
L027256  LDA   [$3A],Y
         AND   #$00FF
         BEQ   L027269
         INX
         INY
         BEQ   L027269
         BIT   $5C
         BMI   L027256
         CPY   $3E
         BCC   L027256
L027269  TXA
         LDY   L027121
         JSR   L0242DC
         STY   L027121
         CPY   #$0000
         BEQ   L027287
         BIT   $5C
         BMI   L027280
         CPY   $3E
         BCS   L027287
L027280  DEC   L027129
         BNE   L027250
         CLC
         RTS

L027287  STZ   L027121
         SEC
         RTS

L02728C  LDA   L020007
         BEQ   L0272C5
         PHA
         PHA
         PEA   $8029
         PEA   $0000
         PEA   $0001
         _LoadResource
         PLX
         PLY
         BCS   L0272C5
         JSR   L023EF2
         STX   $10
         STY   $12
         LDY   #$0004
L0272B1  LDA   [$10],Y
         PHA
         DEY
         DEY
         BPL   L0272B1
         PEA   ^L027318
         PEA   L027318
         _VersionString
L0272C5  SEP   #$30
         LDX   L027318
L0272CA  LDA   L027318,X
         ORA   #$80
         STA   L027318,X
         DEX
         BNE   L0272CA
         CLC
         LDA   L027318
         ADC   L02730B
         ADC   L027322
         REP   #$30
         AND   #$00FF
         PHA
         LDA   #$0050
         SEC
         SBC   $01,S
         PLX
         LSR
         TAX
         LDY   #$0003
         JSL   L0300E2
         JSL   L030314
         ADR   L02730B
         JSL   L030314
         ADR   L027318
         JSL   L030314
         ADR   L027322
         RTS

L02730B  STR   "TFB-Disasm v"
L027318  STR   "1.0.6"	; was "1.0.5" "1.0.4" was "1.0.2"
         DB    $00
         DB    $00
         DB    $00
         DB    $00
*L027322  STR   "   19-SEP-2020"8D	; was "10-MAY-94"
*L027322  STR   "   21-MAR-2021"8D	; was "10-MAY-94"
L027322  STR   "    5-MAR-2023"8D	; was "21-MAR-2021"

L027330  JSR   L021586
         LDA   L0215CD
         BEQ   L02734D
         PEA   ^L027355
         PEA   L027355
         PEA   $2001      ; Create
         JSL   GSOS2
         BCS   L027348
         RTS

L027348  JSR   L020AF7
         BRA   L027353
L02734D  LDA   #$0001
         JSR   L020AB8
L027353  SEC
         RTS

L027355  DW    $0005      ; Parms for Create
         ADRL  L0215CD    ;  file name
         DW    $00E3      ;  access
         DW    $000F      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $000D      ;  storage

L027365  JSL   GSOS
         DW    $200A      ; GetPrefix
         ADRL  L02739E
         SEP   #$20
         LDX   L02005B
         BEQ   L027392
L027376  DEX
         BEQ   L027392
         LDA   L02005C,X
         CMP   #$3A
         BNE   L027376
         CPX   #$0001
         BEQ   L027392
         STX   L02005B
         JSL   GSOS
         DW    $2009      ; SetPrefix
         ADRL  L027396
L027392  REP   #$30
         CLC
         RTS

L027396  DW    $0002      ; Parms for SetPrefix
         DW    $0000      ;  prefix num
         ADRL  L02005B    ;  prefix ptr

L02739E  DW    $0002      ; Parms for GetPrefix
         DW    $0000      ;  prefix num
         ADRL  L020059    ;  prefix ptr

L0273A6  REP   #$30

         BRL   L0273B2
         DW    $7771
         STR   'CPFX'
L0273B2  PEA   ^L0276FE
         PEA   L0276FE
         PEA   $200A      ; GetPrefix
         JSL   GSOS2
         BCS   L0273FD
         PEA   ^L027706
         PEA   L027706
         PEA   $200E      ; ExpandPath
         JSL   GSOS2
         BCS   L0273FD
         JSR   L02765E
         BCS   L027400
         JSR   L027535
L0273D8  JSR   L0276B0
L0273DB  JSL   L03059F
         BCS   L0273DB
         AND   #$007F
         CMP   #$000D
         BEQ   L0273F5
         CMP   #$001B
         BEQ   L0273F8
         JSR   L027458
         BCS   L027400
         BRA   L0273D8
L0273F5  JSR   L027437
L0273F8  JSR   L027447
         CLC
         RTS

L0273FD  JSR   L020AF7
L027400  JSR   L027447
         SEC
         CLV
         RTS

L027406  LDA   L02771A
         BEQ   L02740E
         JSR   L027447
L02740E  PEA   ^L027718
         PEA   L027718
         PEA   $2010      ; Open
         JSL   GSOS2
         BCS   L0273FD
         LDA   L02771A
         STA   L027738
         STA   L027722
         RTS

L027427  PEA   ^L027736
         PEA   L027736
         PEA   $201C      ; GetDirEntry
         JSL   GSOS2
         BCS   L0273FD
         RTS

L027437  PEA   ^L027710
         PEA   L027710
         PEA   $2009      ; SetPrefix
         JSL   GSOS2
         BCS   L0273FD
         RTS

L027447  PEA   ^L027720
         PEA   L027720
         PEA   $2014      ; Close
         JSL   GSOS2
         STZ   L02771A
         RTS

L027458  LDX   #$0000
L02745B  CMP   L027472,X
         BEQ   L02746F
         INX
         INX
         CPX   #$0008
         BCC   L02745B
         _SysBeep
         RTS
L02746F  JMP   (L02747A,X)

L027472  DW    $000A
         DW    $000B
         DW    $0008
         DW    $0015

L02747A  DA    L0274D5
         DA    L0274E4
         DA    L027699
         DA    L02766A

L027482  LDA   #$0001
         BNE   L02748A
L027487  LDA   #$FFFF
L02748A  STA   L0274D3
         LDA   L02771A
         BNE   L02749A
         JSR   L027591
         CPX   #$0002
         BCC   L0274F6
L02749A  LDX   L027748
L02749D  CLC
         LDA   L02773E
         ADC   L0274D3
         STA   L02773E
         DEC
         CMP   L027748
         BCC   L0274BB
         LDA   #$0001
         BIT   L0274D3
         BPL   L0274B8
         LDA   L027748
L0274B8  STA   L02773E
L0274BB  PHX
         JSR   L027427
         PLX
         BCC   L0274C3
         RTS

L0274C3  CLV
         LDA   L027746
         CMP   #$000F
         BEQ   L0274D1
         DEX
         BNE   L02749D
         SEP   #$40
L0274D1  CLC
         RTS

L0274D3  DB    $00
         DB    $00
L0274D5  LDA   L02005B
         BEQ   L0274D1
         JSR   L027482
         JSR   L027588
         JSR   L027535
         RTS

L0274E4  LDA   L02005B
         BEQ   L0274D1
         JSR   L027487
         JSR   L027588
         JSR   L027535
         RTS

L0274F3  STZ   L027726
L0274F6  INC   L027726
         PEA   ^L027724
         PEA   L027724
         PEA   $202C      ; DInfo
         JSL   GSOS2
         BCS   L0274F3
         PEA   ^L02772C
         PEA   L02772C
         PEA   $2008      ; Volume
         JSL   GSOS2
         BCS   L0274F6
         LDX   #$0010
L02751A  LDA   L02005B,X
         STA   L02774C,X
         DEX
         DEX
         BPL   L02751A
         RTS

L027525  STZ   L02773E
         JSR   L027427
         BCS   L027534
         LDA   L027744
         STA   L027748
         CLC
L027534  RTS

L027535  LDA   L02774C
         STA   L027787
         BEQ   L02756E
         SEP   #$20
         LDX   L02005B
         LDY   #$0000
         LDA   L02774E
         CMP   #$3A
         BEQ   L027559
         LDA   L02005C,X
         CMP   #$3A
         BEQ   L027559
         LDA   #$3A
         STA   L02005D,X
         INX
L027559  LDA   L02774E,Y
         STA   L027789,Y
         STA   L02005D,X
         INY
         INX
         DEC   L02774C
         BNE   L027559
         REP   #$20
         STX   L02005B
L02756E  CLC
         RTS

         SEP   #$20
         LDX   L02005B
         BEQ   L027585
         INX
         LDA   #$3A
         CMP   L02005B,X
         BEQ   L027585
         STA   L02005C,X
         STX   L02005B
L027585  REP   #$20
         RTS

L027588  JSR   L027591
         DEX
         STX   L02005B
         CLC
         RTS

L027591  SEP   #$20
         LDX   L02005B
L027596  DEX
         LDA   L02005C,X
         CMP   #$3A
         BNE   L027596
         REP   #$20
         RTS

L0275A1  JSR   L027591
         PHX
         CPX   #$0001
         BEQ   L0275AB
         INX
L0275AB  LDY   #$0000
         SEP   #$20
L0275B0  LDA   L02005C,X
         STA   L027789,Y
         INY
         INX
         CPX   L02005B
         BCC   L0275B0
         BNE   L0275CA
         LDA   L02005C,X
         CMP   #$3A
         BEQ   L0275CA
         STA   L027789,Y
         INY
L0275CA  STY   L027787
         REP   #$20
         PLX
         DEX
         STX   L02005B
         CLC
         RTS

L0275D6  LDA   L02005B
         BNE   L0275E7
L0275DB  JSR   L0274F6
         JSR   L027624
         STZ   L02005B
         BCS   L0275DB
         RTS

L0275E7  JSR   L027406
         BCC   L0275ED
L0275EC  RTS

L0275ED  JSR   L027525
         BCS   L0275EC
         LDA   L027748
         STA   L02764D
         BEQ   L02761E
L0275FA  INC   L02773E
         JSR   L027427
         BCS   L0275EC
         LDA   L027746
         CMP   #$000F
         BNE   L027617
         JSR   L027624
         BCS   L027617
         LDA   L027744
         STA   L027785
         CLC
         RTS

L027617  REP   #$20
         DEC   L02764D
         BNE   L0275FA
L02761E  LDA   #$0044
         BRL   L0273FD
L027624  LDA   L02774C
         TAX
         CMP   L027787
         BNE   L027649
         SEP   #$20
L02762F  LDA   L02774D,X
         JSR   L027651
         STA   L02764F
         LDA   L027788,X
         JSR   L027651
         CMP   L02764F
         BNE   L027649
         DEX
         BNE   L02762F
         REP   #$21
         RTS

L027649  REP   #$20
         SEC
         RTS

L02764D  DB    $00
         DB    $00
L02764F  DB    $00
         DB    $00
         MX    %11
L027651  AND   #$7F
         CMP   #$61
         BCC   L02765D
         CMP   #$7B
         BCS   L02765D
         AND   #$5F
L02765D  RTS

         MX    %00
L02765E  LDA   L02005B
         BEQ   L027669
         JSR   L0275A1
         JSR   L0275D6
L027669  RTS

L02766A  LDA   L02005B
         BNE   L027672
         BRL   L0274F3
L027672  JSR   L027406
         BCS   L027694
         JSR   L027525
         BCS   L027694
         LDA   L027748
         BEQ   L027688
         JSR   L027482
         BCS   L027694
         BVC   L027690
L027688  JSR   L027447
         JSR   L02765E
         BCS   L027694
L027690  JSR   L027535
         RTS

L027694  JSR   L027447
         SEC
         RTS

L027699  LDA   L02005B
         BEQ   L0276AE
         JSR   L027447
         JSR   L027588
         BEQ   L0276AE
         JSR   L02765E
         BCS   L0276AF
         JSR   L027535
L0276AE  CLC
L0276AF  RTS

L0276B0  JSR   L020CED
         LDX   #$0000
         LDY   #$0017
         JSL   L0300E2
         LDA   #$00BE
         JSR   L0276F7
         LDX   #$0000
         LDA   L02005B
         BNE   L0276D8
         JSL   L0302E1
         STR   "[clear]"
         RTS

L0276D8  CMP   #$004F
         BCC   L0276E7
         SBC   #$004D
         TAX
         LDA   #$0049
         JSR   L0276F7
L0276E7  LDA   L02005D,X
         ORA   #$0080
         JSR   L0276F7
         INX
         CPX   L02005B
         BCC   L0276E7
         RTS

L0276F7  PHX
         JSL   L0301F9
         PLX
         RTS

L0276FE  DW    $0002      ; Parms for GetPrefix
         DW    $0000      ;  prefix num
         ADRL  L021656    ;  prefix ptr
L027706  DW    $0002      ; Parms for ExpandPath
         ADRL  L021658  ;  path name
         ADRL  L020059    ;  new pathname
L027710  DW    $0002      ; Parms for SetPrefix
         DW    $0000      ;  prefix num
         ADRL  L02005B    ;  prefix ptr
L027718  DW    $0003      ; Parms for Open
L02771A  DW    $0000      ;  ref num
         ADRL  L02005B    ;  path name
L027720  DW    $0001      ; Parms for Close
L027722  DW    $0000      ;  ref num
L027724  DW    $0002      ; Parms for DInfo
L027726  DW    $0000      ;  device num
         ADRL  L02775E    ;  device name
L02772C  DW    $0002      ; Parms for Volume
         ADRL  L027760    ;  device name
         ADRL  L020059    ;  volume name
L027736  DW    $0007      ; Parms for GetDirEntry
L027738  DW    $0000      ;  ref num
         DW    $0000      ;  flags
         DW    $0000      ;  base
L02773E  DW    $0000      ;  displacement
         ADRL  L02774A    ;  file name
L027744  DW    $0000      ;  entry num
L027746  DW    $0000      ;  file type
L027748  DB    $00
         DB    $00
L02774A  DB    $13
         DB    $00
L02774C  DB    $00
L02774D  DB    $00
L02774E  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02775E  DB    $27
         DB    $00
L027760  DB    $23
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027785  DB    $00
         DB    $00
L027787  DB    $00
L027788  DB    $00
L027789  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027798  SEC
         CLV
         RTS

L02779B  LDA   [$F8]
         AND   #$007F
         BNE   L0277A5
         BRL   L027957
L0277A5  STZ   L027D43
         LDA   $3E
         STA   L027D47
         LDA   $5C
         STA   L027D49
         LDA   [$F8]
         AND   #$007F
         CMP   #$005B
         BNE   L0277D6
         STZ   L027D49
         JSR   L021525
         BCC   L0277C7
         BRL   L0278CC
L0277C7  STA   L027D43
         INX
         STX   L027D47
         BNE   L0277D6
         LDA   #$FFFF
         STA   L027D49
L0277D6  STZ   L027D82
         STZ   L027D4B
         SEP   #$20
L0277DE  LDA   [$F8]
         BEQ   L027830
         AND   #$7F
         CMP   #$20
         BEQ   L027830
         CMP   #$3F
         BEQ   L02782B
         CMP   #$22
         BNE   L0277F3
         BRL   L02788C
L0277F3  CMP   #$3E
         BNE   L0277FA
         BRL   L0278D6
L0277FA  CMP   #$5E
         BNE   L027801
         BRL   L0278CF
L027801  CMP   #$3A
         BNE   L027808
         BRL   L027903
L027808  JSR   L0212C9
         BCS   L027888
         SEC
         SBC   #$30
         CMP   #$0A
         BCC   L027816
         SBC   #$07
L027816  PHA
         JSR   L027ADF
         PLA
         TSB   L027D78
         LDA   #$0F
         TSB   L027D7C
L027823  INC   L027D77
L027826  JSR   L027AF6
         BRA   L0277DE
L02782B  JSR   L027ADF
         BRA   L027823
L027830  LDA   L027D77
         BEQ   L02787B
         CMP   #$09
         BCC   L02783E
         LDA   #$08
         STA   L027D77
L02783E  BIT   #$01
         BEQ   L027859
         INC
         STA   L027D77
         LSR
         DEC
         TAX
         LDA   #$0F
         AND   L027D78,X
         STA   L027D78,X
         LDA   #$F0
         ORA   L027D7C,X
         STA   L027D7C,X
L027859  LSR   L027D77
         LDY   #$0000
         LDX   L027D82
L027862  LDA   L027D78,Y
         STA   L027D84,X
         LDA   L027D7C,Y
         STA   L027DE8,X
         STZ   L027E4C,X
         INY
         INX
         DEC   L027D77
         BNE   L027862
         STX   L027D82
L02787B  JSR   L020F52
         LDA   [$F8]
         BEQ   L027885
         BRL   L0277DE
L027885  BRL   L027957
L027888  LDA   #$01
         BRA   L0278C9
L02788C  JSR   L027AF6
         LDA   [$F8]
         BEQ   L027885
         AND   #$7F
         CMP   #$22
         BEQ   L027826
         LDX   L027D82
         STA   L027D84,X
         PHA
         LDA   #$7F
         STA   L027DE8,X
         STZ   L027E4C,X
         PLA
         CMP   #$3F
         BNE   L0278B2
         STZ   L027DE8,X
         BRA   L0278C4
L0278B2  JSR   L0212E9
         BCS   L0278C4
         AND   #$5F
         STA   L027D84,X
         LDA   #$5F
         STA   L027DE8,X
         STZ   L027E4C,X
L0278C4  INC   L027D82
         BRA   L02788C
L0278C9  JSR   L020AB8
L0278CC  CLV
         SEC
         RTS

L0278CF  REP   #$20
         LDA   #$0101
         BRA   L0278EF
L0278D6  REP   #$20
         LDY   #$0001
         LDA   [$F8],Y
         AND   #$007F
         CMP   #$003E
         BEQ   L0278EA
         LDA   #$0202
         BRA   L0278EF
L0278EA  INC   $F8
         LDA   #$0303
L0278EF  JSR   L027ABD
         BCS   L0278CC
         SEP   #$20
         LDA   [$F8]
         AND   #$7F
         BEQ   L027957
         CMP   #$20
         BNE   L027888
         BRL   L0277DE
L027903  REP   #$20
         INC   $F8
         JSR   L026E64
         BCS   L0278CC
         ASL
         XBA
         ROR
         XBA
         PHX
         PHY
         LDX   L027D82
         STA   L027D84,X
         CMP   #$0080
         BEQ   L027922
         CMP   #$0006
         BCS   L027936
L027922  LDA   $03,S
         TAY
         LDA   $01,S
L027927  DEY
         BEQ   L02792F
         CLC
         ADC   $01,S
         BRA   L027927
L02792F  STA   $01,S
         LDA   #$0001
         STA   $03,S
L027936  LDA   #$0004
         STA   L027E4C,X
         INX
         PLA
         STA   L027D84,X
         INX
         INX
         PLA
         STA   L027D84,X
         INX
         INX
         STX   L027D82
         LDA   #$FFFF
         STA   L027D4B
         SEP   #$20
         BRL   L02787B
L027957  REP   #$20
         LDA   L027D82
         BNE   L027964
         LDA   #$0019
         BRL   L0278C9
L027964  LDAL  $E0BFFF
         BPL   L02797B
         STAL  $E0C010
         AND   #$7F00
         CMP   #$1B00
         BEQ   L027998
         CMP   #$0300
         BEQ   L027998
L02797B  JSR   L027AFD
         BCC   L02799B
L027980  INC   L027D43
         BEQ   L027998
         BIT   L027D49
         BMI   L027964
         LDA   L027D43
         CMP   L027D47
         BCC   L027964
         LDA   L027D45
         STA   L027D43
L027998  CLC
         CLV
         RTS

L02799B  BIT   $48
         BPL   L0279B6
         LDX   #$0000
         LDA   L027D43
         AND   #$FFF0
         CMP   #$00A0
         BCS   L0279B0
         LDA   #$00A0
L0279B0  SEC
         SBC   #$00A0
         BRA   L0279C8
L0279B6  LDA   L027D43
         JSL   L0416F3
         PHA
         PEA   $0000
         PEA   $0008
         JSL   L041462
L0279C8  STA   $54
         STX   $56
         JSR   L021E04
         JSR   L027CCA
         BCS   L027A2B
         AND   #$005F
         CMP   #$0059
         BNE   L027A19
         BIT   L027D4B
         BPL   L027A19
         LDX   #$0000
L0279E4  LDA   L027E4C,X
         AND   #$00FF
         CMP   #$0004
         BNE   L027A10
         LDA   L027E4D,X
         STA   L027D6F
         LDA   L027D85,X
         STA   L027D73
         LDA   L027D87,X
         STA   L027D75
         LDA   L027D84,X
         AND   #$00FF
         PHX
         JSR   L027A2E
         PLX
         INX
         INX
         INX
         INX
L027A10  INX
         CPX   L027D82
         BCC   L0279E4
         JSR   L021E04
L027A19  CLC
         LDA   L027D80
         ADC   L027D43
         BCS   L027A2B
         DEC
         STA   L027D43
         BCS   L027A2B
         BRL   L027980
L027A2B  CLC
         CLV
L027A2D  RTS

L027A2E  CMP   #$0080
         BEQ   L027A2D
         BCS   L027A6D
L027A35  PHA
         PEI   $42
         LDY   L027D6F
         PHY
         LDX   L027D73
         BNE   L027A56
         PHA
         ASL
         TAX
         LDA   L027C5C,X
         BEQ   L027A4E
         JSR   (L027C5C,X)
         BRA   L027A51
L027A4E  LDA   #$0001
L027A51  STA   L027D73
         TAX
         PLA
L027A56  PHX
         PHA
         JSL   L043069
         CLC
         LDA   L027D73
         ADC   L027D6F
         STA   L027D6F
         PLA
         DEC   L027D75
         BNE   L027A35
         RTS

L027A6D  AND   #$007F
         ASL
         TAX
         JMP   (L027A75,X)

L027A75  DA    $0000
         DA    L027A7B
         DA    L027A90

L027A7B  LDY   L027D6F
         PHY
         JSR   L027C90
         INY
         STY   L027D6F
         PLY
         JSR   L0242DC
         DEC   L027D75
         BNE   L027A7B
         RTS

L027A90  LDY   L027D6F
         PHY
         JSR   L027C8B
         PHA
         CLC
         ADC   L027D6F
         STA   L027D6F
         LDA   $03,S
         PEI   $42
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L043069
         PLA
         DEC
         DEC
         PLY
         INY
         INY
         JSR   L0242DC
         DEC   L027D75
         BNE   L027A90
         RTS

L027ABD  LDX   L027D82
         STA   L027E4C,X
         STA   L027E4E,X
         INC   $F8
         JSR   L021339
         BCS   L027ADE
         LDX   L027D82
         STA   L027D84,X
         TYA
         STA   L027D86,X
         INX
         INX
         INX
         INX
         STX   L027D82
L027ADE  RTS

L027ADF  PHP
         REP   #$30
         LDX   #$0004
L027AE5  ASL   L027D78
         ROL   L027D7A
         ASL   L027D7C
         ROL   L027D7E
         DEX
         BNE   L027AE5
         PLP
         RTS

L027AF6  REP   #$20
         INC   $F8
         SEP   #$20
         RTS

L027AFD  SEP   #$20
         LDY   L027D43
         LDX   #$0000
L027B05  LDA   L027E4C,X
         BNE   L027B0D
         BRL   L027BF1
L027B0D  DEC
         BNE   L027B13
         BRL   L027BA6
L027B13  PHX
         PHY
         LDX   #$0005
         STX   L027CBA
         DEC
         BEQ   L027B7F
         LDX   #$000E
         STX   L027CBA
         DEC
         BEQ   L027B7F
         PLY
         PLX
         PHY
         INX
         REP   #$21
         TYA
         STA   L027E4C,X
         LDA   L027D86,X
         STA   L027D75
         LDA   L027D83,X
         AND   #$00FF
         CMP   #$0080
         BCS   L027B4E
         PHX
         ASL
         TAX
         LDA   L027D4D,X
         PLX
         CMP   #$0000
         BEQ   L027B5E
L027B4E  LDA   L027D84,X
         BEQ   L027B5E
L027B53  DEC   L027D75
         BEQ   L027B6C
         CLC
         ADC   L027D84,X
         BRA   L027B53
L027B5E  LDA   L027D83,X
         AND   #$00FF
         PHX
         JSR   L027C15
         PLX
         STA   L027D84,X
L027B6C  INX
         INX
         INX
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         SEP   #$20
         BCS   L027B7C
         BRL   L027BFC
L027B7C  BRL   L027C11
L027B7F  REP   #$20
         TYA
         JSL   L0410BB
         SEP   #$20
         PLY
         ASL
         BCC   L027B9F
         XBA
         BMI   L027B9F
         LDA   [$3A],Y
         LDX   #$0000
L027B94  CMP   L027CBC,X
         BEQ   L027BA2
         INX
         CPX   L027CBA
         BCC   L027B94
L027B9F  PLX
         BRA   L027C11
L027BA2  PLX
         INY
         BRA   L027BB7
L027BA6  REP   #$20
         PHY
         TYA
         JSL   L0410BB
         PLY
         AND   #$9880
         CMP   #$0080
         BEQ   L027C11
L027BB7  REP   #$20
         PHY
         PHX
         PEI   $42
         PHY
         PEA   ^L027D39
         PEA   L027D39
         JSL   L045089
         PLX
         PLY
         BCS   L027C11
         LDA   L027D39
         CMP   #$0004
         BCS   L027C11
         LDA   L027D84,X
         CMP   L027D3F
         BNE   L027C11
         LDA   L027D86,X
         CMP   L027D41
         BNE   L027C11
         TYA
         CLC
         ADC   L027D3B
         TAY
         SEP   #$20
         INX
         INX
         INX
         BRA   L027BFC
L027BF1  LDA   [$3A],Y
         AND   L027DE8,X
         CMP   L027D84,X
         BNE   L027C11
         INY
L027BFC  INX
         CPX   L027D82
         BCS   L027C05
         BRL   L027B05
L027C05  REP   #$20
         SEC
         TYA
         SBC   L027D43
         STA   L027D80
         CLC
         RTS

L027C11  REP   #$20
         SEC
         RTS

L027C15  STZ   L027D73
         STY   L027D6F
         STA   L027D71
L027C1E  LDA   L027D71
         XBA
         ASL
         XBA
         TAX
         BCS   L027C53
         LDA   L027D4D,X
         BNE   L027C31
         BPL   L027C4A
L027C2E  LDA   #$0001
L027C31  CLC
         PHA
         ADC   L027D73
         STA   L027D73
         PLA
         ADC   L027D6F
         STA   L027D6F
         TAY
         DEC   L027D75
         BNE   L027C1E
         LDA   L027D73
         RTS

L027C4A  LDA   L027C5C,X
         BEQ   L027C2E
         JSR   (L027C5C,X)
         RTS

L027C53  LDA   L027C7E,X
         BEQ   L027C2E
         JSR   (L027C7E,X)
         RTS

L027C5C  DA    $0000
	 DA    $0000
	 DA    $0000
	 DA    $0000
	 DA    $0000
	 DA    $0000
	 DA    $0000
	 DA    $0000
	 DA    $0000
	 DA    $0000
         DA    L027CA2
	 DA    $0000
	 DA    $0000
	 DA    $0000
         DA    L027C8B
         DA    L027C84
         DA    $0000
L027C7E  DA    $0000
         DA    L027C90
         DA    L027C8B

L027C84  LDA   [$3A],Y
         AND   #$00FF
         INC
         RTS

L027C8B  LDA   [$3A],Y
         INC
         INC
         RTS

L027C90  LDX   #$0001
         SEP   #$20
L027C95  LDA   [$3A],Y
         BEQ   L027CB5
         INX
         INY
         CPY   L027D47
         BNE   L027C95
         BRA   L027CB5
L027CA2  LDX   #$0001
         SEP   #$20
         LDA   [$3A],Y
         STA   L027CB9
L027CAC  INY
         INX
         LDA   [$3A],Y
         EOR   L027CB9
         BPL   L027CAC
L027CB5  REP   #$20
         TXA
         RTS

L027CB9  DB    $00
L027CBA  DB    $05
         DB    $00
L027CBC  DB    $20
         DB    $22
         DB    $4C
         DB    $5C
         DB    $82
         DB    $80
         DB    $90
         DB    $B0
         DB    $10
         DB    $30
         DB    $D0
         DB    $F0
         DB    $50
         DB    $70
L027CCA  JSR   L020CED
         LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
         STR   "> Found at: "
         PEI   $42
         LDA   L027D43
         PHA
         JSL   L042A5C
         PHA
         PHY
         JSL   L03065A
         LDA   #$00AF
         JSL   L03022D
         JSL   L030670
         JSL   L0302E1
         STR   ". "
         BIT   L027D4B
         BPL   L027D1F
         JSL   L0302E1
         STR   "Set csts ? "
L027D1F  JSL   L03034A
         PHA
         JSR   L020CED
         PLA
         AND   #$007F
         CMP   #$000D
         SEC
         BEQ   L027D38
         CMP   #$001B
         SEC
         BEQ   L027D38
         CLC
L027D38  RTS

L027D39  DB    $00
         DB    $00
L027D3B  DB    $00
         DB    $00
         DB    $00
         DB    $00
L027D3F  DB    $00
         DB    $00
L027D41  DB    $00
         DB    $00
L027D43  DB    $00
         DB    $00
L027D45  DB    $00
         DB    $00
L027D47  DB    $00
         DB    $00
L027D49  DB    $00
         DB    $00
L027D4B  DB    $00
         DB    $00
L027D4D  DB    $01
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $04
         DB    $00
         DB    $03
         DB    $00
         DB    $0A
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $00
L027D6F  DB    $00
         DB    $00
L027D71  DB    $00
         DB    $00
L027D73  DB    $00
         DB    $00
L027D75  DB    $00
         DB    $00
L027D77  DB    $00
L027D78  DB    $00
         DB    $00
L027D7A  DB    $00
         DB    $00
L027D7C  DB    $00
         DB    $00
L027D7E  DB    $00
         DB    $00
L027D80  DB    $00
         DB    $00
L027D82  DB    $00
L027D83  DB    $00
L027D84  DB    $00
L027D85  DB    $00
L027D86  DB    $00
L027D87  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027DE8  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027E4C  DB    $00
L027E4D  DB    $00
L027E4E  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L027EB0  LDA   $5E
         STA   L027F2B
         STZ   L027F23
         LDA   $3E
         STA   L027F25
         LDA   $5C
         STA   L027F27
         LDA   [$F8]
         AND   #$007F
         CMP   #$005B
         BNE   L027EE3
         STZ   L027F27
         JSR   L021525
         CLV
         BCC   L027ED6
         RTS

L027ED6  STA   L027F23
         STX   L027F25
         TXA
         BNE   L027EE3
         DEC
         STA   L027F27
L027EE3  LDA   #$0003
         STA   L027F21
         LDA   [$F8]
         AND   #$00FF
         BEQ   L027F2D
         STZ   L027F21
L027EF3  JSR   L021309
         BCS   L027F2D
         CMP   #$00C1
         BNE   L027F08
         LDA   #$0001
         ORA   L027F21
         STA   L027F21
         BRA   L027EF3
L027F08  CMP   #$00D3
         BNE   L027F18
         LDA   #$0002
         ORA   L027F21
         STA   L027F21
         BRA   L027EF3
L027F18  LDA   #$0001
         JSR   L020AB8
         CLV
         SEC
         RTS

L027F21  DB    $00
         DB    $00
L027F23  DB    $00
         DB    $00
L027F25  DB    $00
         DB    $00
L027F27  DB    $00
         DB    $00
L027F29  DB    $00
         DB    $00
L027F2B  DB    $00
         DB    $00
L027F2D  LSR   L027F21
         BCC   L027F3C
         JSR   L027F80
         LDA   L027F2B
         STA   $5E
         BCS   L027F49
L027F3C  LSR   L027F21
         BCC   L027F49
         JSR   L0281DD
         LDA   L027F2B
         STA   $5E
L027F49  CLC
         RTS

L027F4B  LDA   L027F29
         INC
         BEQ   L027F5B
L027F51  BIT   L027F27
         BMI   L027F5D
         CMP   L027F25
         BCC   L027F5D
L027F5B  SEC
         RTS

L027F5D  STA   L027F29
         CLC
         RTS

L027F62  CLC
         ADC   L027F29
         BCS   L027F5B
         BRA   L027F51
L027F6A  LDY   #$FFFF
         STY   $48
         SEC
         SBC   #$0030
         BCS   L027F78
         LDA   #$0000
L027F78  STA   $54
         STZ   $56
         JSR   L021E04
         RTS

L027F80  LDA   L027F23
         STA   L027F29
         LDA   $5E
         AND   #$3FFF
         ORA   #$8000
         STA   $5E
L027F90  LDY   L027F29
         LDA   #$1800
         JSL   L041764
         BCS   L027FB4
         STY   L027F29
         BIT   L027F27
         BMI   L027FA9
         CPY   L027F25
         BCS   L027FB4
L027FA9  JSR   L0280B9
         BCS   L027FB6
         JSR   L027FC0
         BCC   L027F90
         RTS

L027FB4  CLC
         RTS

L027FB6  LDA   L028096
         JSR   L027F62
         BCC   L027F90
         CLC
         RTS

L027FC0  LDA   L028092
         JSR   L027F6A
         LDA   L028096
         DEC
         ASL
         ASL
         TAX
         LDA   L02809A,X
         STA   L027FEA+$D
         LDA   L02809A+2,X
         STA   L027FEA+$F
         JSR   L020CED
         LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
L027FEA  STR   "> adresses: ....x"
         LDA   L028098
         PHA
         JSL   L030670
         JSL   L0302E1
         STR   " in ["
         LDA   L028092
         JSR   L02806B
         LDA   #$00AE
         JSL   L03022D
         LDA   L028094
         DEC
         JSR   L02806B
         JSL   L0302E1
         STR   "]. Set ?  "
         JSR   L02807D
         BCS   L028065
         AND   #$00DF
         CMP   #$00D9
         BNE   L02805E
         JSL   L03022D
         PEI   $42
         LDA   L028092
         PHA
         SEC
         LDA   L028094
         SBC   L028092
         PHA
         LDX   L028096
         LDA   L0280AA,X
         AND   #$00FF
         PHA
         JSL   L043069
L02805E  LDA   L028094
         STA   L027F29
         CLC
L028065  PHP
         JSR   L020CED
         PLP
         RTS

L02806B  PEI   $42
         PHA
         JSL   L042A5C
         PHA
         PHY
         JSL   L03065A
         JSL   L030670
         RTS

L02807D  JSL   L03034A
         AND   #$00FF
         CMP   #$008D
         SEC
         BEQ   L028091
         CMP   #$009B
         SEC
         BEQ   L028091
         CLC
L028091  RTS

L028092  DB    $00
         DB    $00
L028094  DB    $00
         DB    $00
L028096  DB    $00
         DB    $00
L028098  DB    $00
         DB    $00
L02809A  ASC   "  DB"
         ASC   "  DA"
         ASC   " ADR"
         ASC   "ADRL"
L0280AA  DB    $00
         DB    $00
         DB    $03
         DB    $05
         DB    $04
L0280AF  DB    $00
         DB    $00
L0280B1  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0280B9  LDA   L027F29
         STA   L028092
         LDA   #$0001
         STA   L028096
         JSL   L0410BB
         BIT   #$8000
         BNE   L028145
         PEI   $42
         LDA   L027F29
         PHA
         PEA   ^L0280AF
         PEA   L0280AF
         JSL   L045089
         BCS   L028145
         LDA   L0280AF
         CMP   #$0004
         BCS   L028145
         LDA   #$0001
         STA   L028098
         JSR   L0281BA
         LDA   L0280B1
         STA   L028096
L0280F7  CLC
         LDA   L028096
         ADC   L027F29
         BCS   L02814D
         BIT   L027F27
         BMI   L02810A
         CMP   L027F25
         BCS   L02814D
L02810A  STA   L027F29
         JSL   L0410BB
         BIT   #$8000
         BNE   L02814D
         BIT   #$1800
         BEQ   L02814D
         PEI   $42
         LDA   L027F29
         PHA
         PEA   ^L0280AF
         PEA   L0280AF
         JSL   L045089
         BCS   L02814D
         LDA   L0280AF
         CMP   #$0004
         BCS   L02814D
         JSR   L0281BA
         LDA   L0280B1
         CMP   L028096
         BNE   L02814D
         INC   L028098
         BRA   L0280F7
L028145  LDA   L028092
         STA   L027F29
         SEC
         RTS

L02814D  LDA   L028098
         CMP   #$0001
         BEQ   L028145
         LDA   L027F29
         STA   L028094
         LDX   L028096
         CPX   #$0001
         BEQ   L0281B8
         CPX   #$0004
         BEQ   L0281B8
         LDA   L028092
         BEQ   L0281B8
         DEC
         PHA
         JSL   L0410BB
         PLY
         BIT   #$9800
         BNE   L0281B8
         LDA   [$3A],Y
         AND   #$00FF
         CPX   #$0002
         BEQ   L0281A4
         CMP   #$005C
         BEQ   L028195
         CMP   #$0022
         BNE   L0281B8
         LDA   L028098
         CMP   #$0002
         BEQ   L028145
L028195  CLC
         LDA   L028096
         ADC   L028092
         STA   L028092
         DEC   L028098
         BRA   L0281B8
L0281A4  CMP   #$007C
         BEQ   L028195
         CMP   #$006C
         BEQ   L028195
         CMP   #$00DC
         BEQ   L028195
         CMP   #$004C
         BEQ   L028195
L0281B8  CLC
         RTS

L0281BA  LDA   L0280B1
         CMP   #$0003
         BNE   L0281DC
         LDY   L027F29
         INY
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         BNE   L0281DC
         TYA
         JSL   L0410BB
         BIT   #$1800
         BNE   L0281DC
         INC   L0280B1
L0281DC  RTS

L0281DD  LDA   L027F23
         STA   L027F29
         LDA   $5E
         AND   #$3FFF
         ORA   #$4000
         STA   $5E
L0281ED  LDY   L027F29
         JSR   L02820E
         BCS   L028207
         LDA   L027F29
         JSL   L0410BB
         AND   #$8000
         BNE   L028207
         JSR   L02824D
         BCC   L0281ED
         RTS

L028207  JSR   L027F4B
         BCC   L0281ED
         CLC
         RTS

L02820E  LDA   [$3A],Y
         AND   #$00FF
         CMP   #$0005
         BCC   L028249
         CMP   #$0051
         BCS   L028249
         TAX
         SEP   #$20
L028220  INY
         LDA   [$3A],Y
         AND   #$7F
         CMP   #$07
         BEQ   L028243
         CMP   #$0A
         BEQ   L028243
         CMP   #$0D
         BEQ   L028243
         CMP   #$20
         BCC   L028249
         LDA   [$3A],Y
         CMP   #$40
         BCC   L028249
         CMP   #$A0
         BCS   L028243
         CMP   #$60
         BCS   L028249
L028243  DEX
         BNE   L028220
         REP   #$21
         RTS

L028249  REP   #$20
         SEC
         RTS

L02824D  LDA   L027F29
         JSR   L027F6A
         JSR   L020CED
         LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
         STR   "> string:  STR at $"
         LDA   L027F29
         JSR   L02806B
         JSL   L0302E1
         STR   ". Set ?  "
         JSR   L02807D
         BCS   L0282BC
         AND   #$00DF
         CMP   #$00D9
         BNE   L0282B9
         JSL   L03022D
         PEI   $42
         LDY   L027F29
         PHY
         LDA   [$3A],Y
         AND   #$00FF
         INC
         PHA
         CLC
         ADC   L027F29
         DEC
         STA   L027F29
         PEA   $000F
         JSL   L043069
L0282B9  JSR   L027F4B
L0282BC  PHP
         JSR   L020CED
         PLP
         RTS

L0282C2  DB    $00
         DB    $00
L0282C4  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0283C2  DB    $00
         DB    $00
L0283C4  DB    $00
         DB    $00
L0283C6  ENT
         DB    $00
         DB    $00
L0283C8  DB    $00
         DB    $00
L0283CA  ENT
         DB    $00
         DB    $00
L0283CC  DB    $00
L0283CD  DB    $00
L0283CE  DB    $00
         DB    $00
L0283D0  DB    $00
L0283D1  DB    $00
L0283D2  DB    $00
         DB    $00
L0283D4  DB    $00
         DB    $00
L0283D6  DB    $00
         DB    $00
L0283D8  DB    $00
         DB    $00
L0283DA  DB    $00
         DB    $00
L0283DC  DB    $00
L0283DD  DB    $00
L0283DE  DB    $00
L0283DF  DB    $00
L0283E0  DB    $00
         DB    $00
L0283E2  DB    $00
         DB    $00
L0283E4  ENT
         DB    $00
         DB    $00
L0283E6  DB    $00
         DB    $00
L0283E8  DB    $00
         DB    $00
L0283EA  DB    $00
         DB    $00
L0283EC  DB    $00
         DB    $00
L0283EE  DB    $00
         DB    $00
L0283F0  DB    $00
L0283F1  DB    $00
L0283F2  DB    $00
L0283F3  DB    $00
L0283F4  DB    $00
         DB    $00
L0283F6  DB    $00
         DB    $00
L0283F8  DB    $00
         DB    $00
L0283FA  DB    $00
         DB    $00
L0283FC  DB    $0A
L0283FD  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028407  DB    $00
L028408  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028428  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L028449  DB    $00
         DB    $00
L02844B  DB    $00
         DB    $00
L02844D  DB    $00
         DB    $00
L02844F  DB    $00
         DB    $00
L028451  DB    $00
         DB    $00
L028453  DB    $00
         DB    $00
L028455  DB    $00
         DB    $00
L028457  DB    $00
         DB    $00
L028459  DB    $00
         DB    $00
L02845B  DB    $00
         DB    $00
L02845D  DB    $00
         DB    $00
L02845F  DB    $00
         DB    $00
L028461  DB    $00
         DB    $00
L028463  DB    $00
         DB    $00
L028465  DB    $00
         DB    $00
L028467  DB    $00
         DB    $00
L028469  DB    $00
         DB    $00
L02846B  DB    $00
         DB    $00
L02846D  DB    $00
         DB    $00
L02846F  DB    $00
         DB    $00
L028471  STZ   L02844D
         LDA   L028457
         STA   L028671
         STA   L028679
         STA   L028683
         STA   L028695
         STA   L0286A7
         PEA   ^L02866F
         PEA   L02866F
         PEA   $2017      ; GetMark
         JSL   GSOS2
         BCC   L028498
         BRL   L0285D3
L028498  PEA   ^L028681
         PEA   L028681
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L0284AA
         BRL   L0285D3
L0284AA  JSR   L02862C
         BCC   L0284B0
         RTS

L0284B0  LDA   L0283F8
         CLC
         ADC   L028673
         STA   L02867D
         LDA   #$0000
         ADC   L028673+2
         STA   L02867D+2
         PEA   ^L028677
         PEA   L028677
         PEA   $2016      ; SetMark
         JSL   GSOS2
         BCC   L0284D5
         BRL   L0285D3
L0284D5  LDA   #$000A
         STA   L02869B
         LDA   L0283DD
         AND   #$00FF
         STA   L028407
         BNE   L0284E9
         INC   L02869B
L0284E9  PEA   ^L028693
         PEA   L028693
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L0284FB
         BRL   L0285D3
L0284FB  LDA   L028407
         AND   #$00FF
         CMP   #$0020
         BCC   L02850C
         LDA   #$0020
         STA   L028407
L02850C  STA   L0286AD
         PEA   ^L0286A5
         PEA   L0286A5
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L028521
         BRL   L0285D3
L028521  SEP   #$20
         LDX   #$000A
L028526  LDA   L0283FC,X
         JSR   L0285D8
         STA   L0283FC,X
         DEX
         BNE   L028526
         LDX   #$0020
L028535  LDA   L028407,X
         JSR   L0285D8
         STA   L028407,X
         STA   L028428,X
         DEX
         BNE   L028535
         LDA   L028407
         STA   L028428
         TAX
         BEQ   L02856B
L02854D  LDA   L028428,X
         CMP   #$A0
         BNE   L028568
         DEX
         DEC   L028428
         BNE   L02854D
         BRA   L02856B
L02855C  LDA   L028428,X
         CMP   #$A0
         BNE   L028568
         LDA   #$DF
         STA   L028428,X
L028568  DEX
         BNE   L02855C
L02856B  JSR   L0285EC
         REP   #$20
         LDA   #$002D
         STA   L0283F8
         LDA   L0283FA
         CLC
         ADC   L028673
         STA   L02867D
         LDA   #$0000
         ADC   L028673+2
         STA   L02867D+2
         PEA   ^L028677
         PEA   L028677
         PEA   $2016      ; SetMark
         JSL   GSOS2
         BCS   L0285D3
         LDA   L0283DF
         AND   #$00FF
         DEC
         BNE   L0285D1
         JSR   L0286B7
         CLC
         LDA   L028673
         ADC   L0283D0
         TAX
         LDA   L028673+2
         ADC   L0283D2
         CMP   L02845B
         BCC   L0285D1
         BNE   L0285BE
         CPX   L028459
         BCC   L0285D1
L0285BE  SEC
         LDA   L028459
         SBC   L028673
         STA   L0283D0
         LDA   L02845B
         SBC   L028673+2
         STA   L0283D2
L0285D1  CLC
         RTS

L0285D3  JSR   L020AF7
         SEC
         RTS

         MX    %11
L0285D8  ORA   #$80
         CMP   #$A0
         BCS   L0285E0
         LDA   #$A0
L0285E0  RTS

L0285E1  CMP   #$E1
         BCC   L0285EB
         CMP   #$FB
         BCS   L0285EB
         AND   #$DF
L0285EB  RTS

L0285EC  PHP
         SEP   #$30
         LDX   L028407
         CPX   L028656
         BCC   L0285FA
         LDX   L028656
L0285FA  LDA   L028407,X
         JSR   L0285E1
         CMP   L028656,X
         BNE   L02860A
         DEX
         BNE   L0285FA
         BEQ   L028623
L02860A  LDX   L028407
         CPX   L028662
         BCC   L028615
         LDX   L028662
L028615  LDA   L028407,X
         JSR   L0285E1
         CMP   L028662,X
         BNE   L02862A
         DEX
         BNE   L028615
L028623  REP   #$30
         DEC   L02844D
         PLP
         RTS

L02862A  PLP
         RTS

L02862C  LDA   L0283D2
         CMP   #$0100
         BCS   L02864E
         ORA   L0283D0
         BEQ   L02864E
         LDA   L0283D6
         ORA   L0283DA
         AND   #$FF00
         BNE   L02864E
         LDA   L0283F8
         CMP   L0283FA
         BCS   L02864E
         CLC
         RTS

L02864E  LDA   #$001B
         JSR   L020AB8
         SEC
         RTS

L028656  STR   "EXPRESSLOAD"
L028662  STR   "~EXPRESSLOAD"
L02866F  DW    $0002      ; Parms for GetMark
L028671  DW    $0000      ;  ref num
L028673  ADRL  $00000000  ;  position
L028677  DW    $0003      ; Parms for SetMark
L028679  DW    $0000      ;  ref num
         DW    $0000      ;  base
L02867D  ADRL  $00000000  ;  displacement
L028681  DW    $0005      ; Parms for Read
L028683  DW    $0000      ;  ref num
         ADRL  L0283D0    ;  buffer ptr
         ADRL  $0000002C  ;  request count
         ADRL  $00000000  ;  transfer count
         DW    $0001      ;  cache priority
L028693  DW    $0005      ; Parms for Read
L028695  DW    $0000      ;  ref num
         ADRL  L0283FD    ;  buffer ptr
L02869B  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
         DW    $0001      ;  cache priority
L0286A5  DW    $0005      ; Parms for Read
L0286A7  DW    $0000      ;  ref num
         ADRL  L028408    ;  buffer ptr
L0286AD  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
         DW    $0001      ;  cache priority
L0286B7  LDA   L0283DF
         AND   #$00FF
         CMP   #$0001
         BNE   L0286E0
         LDA   L0283D0
         STZ   L0283D0
         STA   L0283D1
         ASL   L0283D0
         ROL   L0283D2
         LDA   L0283DC
         AND   #$00FF
         SEP   #$20
         ASL
         REP   #$20
         ROR
         STA   L0283E4
L0286E0  CLC
         RTS

L0286E2  LDA   L028457
         STA   L028765
         STA   L02876D
         LDA   L028469
         STA   L028767
         LDA   L02846B
         STA   L028767+2
         BIT   L02845D
         BMI   L02870B
         PEA   ^L028763
         PEA   L028763
         PEA   $2019      ; GetEOF
         JSL   GSOS2
         BCS   L02875E
L02870B  STZ   L02844F
         STZ   L028771+2
         STZ   L028771
         BIT   L02845D
         BPL   L028725
         LDA   L028467
         STA   L028771+2
         LDA   L028465
         STA   L028771
L028725  PEA   ^L02876B
         PEA   L02876B
         PEA   $2016      ; SetMark
         JSL   GSOS2
         BCS   L02875E
         JSR   L028471
         BCS   L02875D
         INC   L02844F
         CLC
         LDA   L0283D0
         ADC   L028771
         STA   L028771
         LDA   L0283D2
         ADC   L028771+2
         STA   L028771+2
         CMP   L028767+2
         BNE   L028725
         LDA   L028771
         CMP   L028767
         BNE   L028725
         CLC
L02875D  RTS

L02875E  JSR   L020AF7
         SEC
         RTS

L028763  DW    $0002      ; Parms for GetEOF
L028765  DW    $0000      ;  ref num
L028767  ADRL  $00000000  ;  end of file
L02876B  DW    $0003      ; Parms for SetMark
L02876D  DW    $0000      ;  ref num
         DW    $0000      ;  base
L028771  ADRL  $00000000  ;  displacement
L028775  STA   L02887A
         STA   L028878
         LDA   L028457
         STA   L028890
         STA   L02887E
         STA   L028886
         LDA   L028469
         STA   L028892
         LDA   L02846B
         STA   L028892+2
         LDA   L028465
         STA   L02888A
         LDA   L028467
         STA   L02888A+2
         BIT   L02845D
         BMI   L0287B9
         PEA   ^L02888E
         PEA   L02888E
         PEA   $2019      ; GetEOF
         JSL   GSOS2
         BCS   L0287F4
         STZ   L02888A+2
         STZ   L02888A
L0287B9  PEA   ^L028884
         PEA   L028884
         PEA   $2016      ; SetMark
         JSL   GSOS2
         BCS   L0287F4
         JSR   L028471
         BCS   L0287F3
         DEC   L028878
         BEQ   L0287F9
         CLC
         LDA   L0283D0
         ADC   L02888A
         STA   L02888A
         LDA   L0283D2
         ADC   L02888A+2
         STA   L02888A+2
         CMP   L028892+2
         BNE   L0287B9
         LDA   L02888A
         CMP   L028892
         BNE   L0287B9
         CLC
L0287F3  RTS

L0287F4  JSR   L020AF7
         SEC
         RTS

L0287F9  PEA   ^L02887C
         PEA   L02887C
         PEA   $2017      ; GetMark
         JSL   GSOS2
         BCS   L0287F4

         LDA   L0283D8
         LDY   L0283DA
         CPY   #$0000
         BEQ   L028823
         DEY
         BNE   L02881B
         CMP   #$0000
         BEQ   L028823

L02881B  LDA   #$0008	; File/Segment longer than 64K
         JSR   L020AB8
         SEC
         RTS

L028823  LDA   L0283F2
         BNE   L02882B
         LDA   L02887A
L02882B  STA   $42
         STA   L0283F2
         JSR   L02A241
         BCS   L0287F3
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         _DisposeHandle
         PEI   $38
         PEI   $36
         _DisposeHandle
         PLX
         PLY
         STX   $36
         STY   $38
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $3A
         LDA   |$0002,X
         STA   $3C
         PLB
         PLB
         PLA
         STA   L028449
         PLA
         STA   L02844B
         PLX
         PLY
         STX   L0283CC
         STY   L0283CE
         PLA
         PLA
         CLC
         RTS

L028878  DB    $00
         DB    $00
L02887A  DB    $00
         DB    $00
L02887C  DW    $0002      ; Parms for GetMark
L02887E  DW    $0000      ;  ref num
         ADRL  $00000000  ;  position
L028884  DW    $0003      ; Parms for SetMark
L028886  DW    $0000      ;  ref num
         DW    $0000      ;  base
L02888A  ADRL  $00000000  ;  displacement
L02888E  DW    $0002      ; Parms for GetEOF
L028890  DW    $0000      ;  ref num
L028892  ADRL  $00000000  ;  end of file
L028896  STA   L028918
         STY   L028918+2
         PHA
         PHA
         PEA   $0001
         PEA   $0000
         PEI   $FC
         PEA   $8008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCC   L0288BE
         LDA   #$0000
         JSR   L020AB8
         SEC
         RTS

L0288BE  PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $00
         STAL  L028914
         LDA   |$0002,X
         STA   $02
         PLB
         PLB
         STA   L028914+2
         PHY
         PHX
         LDY   #$0000
         TYA
L0288DA  STA   [$00],Y
         INY
         INY
         BNE   L0288DA
         LDA   L028457
         STA   L028912
         PEA   ^L028910
         PEA   L028910
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L028904
         LDA   L028918
         STA   L028449
         LDA   L028918+2
         STA   L02844B
         PLX
         PLY
         RTS

L028904  JSR   L020AF7
         _DisposeHandle
         SEC
         RTS

L028910  DW    $0004      ; Parms for Read
L028912  DW    $0000      ;  ref num
L028914  ADRL  $00000000  ;  buffer ptr
L028918  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L028920  LDA   L028459
         SEC
         SBC   $3E
         STA   L028BF2
         LDA   L02845B
         SBC   #$0000
         BIT   $5C
         BPL   L028934
         DEC
L028934  BNE   L02894C
         LDY   #$0000
         LDX   L028BF2
         STX   L028BFC
         LDA   #$8008
         JSR   L023ED6
         BCC   L028954
         LDA   #$0000
         BRA   L02894F
L02894C  LDA   #$001C
L02894F  JSR   L020AB8
         SEC
         RTS

L028954  STX   L028BEE
         STY   L028BF0
         PHB
         PHY
         PLB
         LDA   |$0002,X
         TAY
         LDA   |$0000,X
         TAX
         PLB
         PLB
         STX   $AE
         STY   $B0
         STX   L028BF8
         STY   L028BF8+2
         LDA   L028457
         STA   L028BF6
         PEA   ^L028BF4
         PEA   L028BF4
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L02898C
         JSR   L020AF7
         SEC
         BRA   L028994
L02898C  JSR   L0289A6
         BCS   L028994
         JSR   L028B56
L028994  PHP
         LDA   L028BF0
         PHA
         LDA   L028BEE
         PHA
         _DisposeHandle
         PLP
         RTS

L0289A6  LDY   #$0000
L0289A9  LDA   [$AE],Y
         INY
         AND   #$00FF
         BEQ   L0289CA
         LDX   #$0000
L0289B4  CMP   L0289CC,X
         BEQ   L0289C3
         INX
         INX
         CPX   #$0010
         BCC   L0289B4
L0289C0  BRL   L02894C
L0289C3  JSR   (L0289DC,X)
         BCS   L0289C0
         BRA   L0289A9
L0289CA  CLC
         RTS

L0289CC  DW    $000F
         DW    $001F
         DW    $002F
         DW    $003F
         DW    $004F
         DW    $008F
         DW    $009F
         DW    $00FF

L0289DC  DA    L0289EC
         DA    L0289F1
         DA    L028A4A
         DA    L028A1B
         DA    L0289EC
         DA    L028A4F
         DA    L028A20
         DA    L028A6D

L0289EC  INY
         INY
         INY
         CLC
         RTS

L0289F1  LDA   #$0001
         STA   L028AB5
         PHY
         LDA   [$AE],Y
         STA   L028AB3
         TAX
         INY
         INY
         LDA   [$AE],Y
         AND   #$00FF
         STA   L028ABF
         STZ   L028AB9
         TXY
         LDA   [$3A],Y
         AND   #$00FF
         BIT   #$0080
         BEQ   L028A19
         ORA   #$FF00
L028A19  BRA   L028A41
L028A1B  LDA   #$0003
         BRA   L028A23
L028A20  LDA   #$0002
L028A23  PHY
         STA   L028AB5
         LDA   [$AE],Y
         STA   L028AB3
         TAX
         INY
         INY
         LDA   [$AE],Y
         AND   #$00FF
         STA   L028ABF
         STZ   L028AB9
         TXY
         SEC
         LDA   [$3A],Y
         SBC   #$8000
L028A41  STA   L028AB7
         JSR   L028B03
         PLY
L028A48  BRA   L0289EC
L028A4A  LDX   #$0003
         BRA   L028A52
L028A4F  LDX   #$0002
L028A52  PHY
         PEI   $42
         LDA   [$AE],Y
         PHA
         PHX
         PEA   $0000
         TAY
         LDA   [$3A],Y
         PEI   $42
         SEC
         SBC   #$8000
         PHA
         JSL   L043774
         PLY
         BRA   L028A48
L028A6D  LDA   [$AE],Y
         STA   L028AB3
         INY
         INY
         LDA   [$AE],Y
         AND   #$00FF
         STA   L028ABF
         INY
         LDA   [$AE],Y
         AND   #$00FF
         TAX
         INY
         SEC
         LDA   [$AE],Y
         SBC   #$8000
         STA   L028ABB
         INY
         INY
         LDA   [$AE],Y
         AND   #$00FF
         SBC   #$0000
         STA   L028ABD
         INY
         PHY
         TXA
         SEC
         SBC   #$00D0
         CMP   #$0008
         BCC   L028AAA
L028AA6  PLY
         BRL   L02894C
L028AAA  ASL
         TAX
         JSR   (L028AC1,X)
         BCS   L028AA6
         PLY
         RTS

L028AB3  DB    $00
         DB    $00
L028AB5  DB    $00
         DB    $00
L028AB7  DB    $00
         DB    $00
L028AB9  DB    $00
         DB    $00
L028ABB  DB    $00
         DB    $00
L028ABD  DB    $00
         DB    $00
L028ABF  DB    $00
         DB    $00

L028AC1  DA    L028AD3
         DA    L028B45
         DA    L028AD1
         DA    L028AD1
         DA    L028AF7
         DA    L028AE4
         DA    L028AD1
         DA    L028AEF

L028AD1  SEC
         RTS

L028AD3  LDA   #$0001
         STA   L028AB5
         LDA   #$FFF0
         STA   L028AB9
         STZ   L028AB7
         BRA   L028B12
L028AE4  LDA   #$FFF8
         STA   L028AB9
         LDA   #$0002
         BRA   L028B00
L028AEF  LDA   #$FFF8
         STA   L028AB9
         BRA   L028AFD
L028AF7  LDA   #$FFF0
         STA   L028AB9
L028AFD  LDA   #$0001
L028B00  STA   L028AB5
L028B03  CLC
         LDA   L028ABF
         STA   L028ABB
         LDA   $42
         ADC   #$0080
         STA   L028ABD
L028B12  CLC
         LDA   L028AB7
         ADC   #$0080
         CMP   #$0100
         BCS   L028B43
         PEI   $42
         LDA   L028AB3
         PHA
         LDA   L028AB5
         PHA
         SEP   #$20
         LDA   L028AB7
         PHA
         LDA   L028AB9
         PHA
         REP   #$20
         CLC
         LDA   L028ABD
         ADC   $42
         PHA
         LDA   L028ABB
         PHA
         JSL   L043774
L028B43  CLC
         RTS

L028B45  LDA   #$0002
         STA   L028AB5
         LDA   #$FFF8
         STA   L028AB9
         STZ   L028AB7
         BRA   L028B12
L028B56  TYA
         CLC
         ADC   $AE
         STA   L028BEA
         LDA   #$0000
         ADC   $B0
         STA   L028BEC
         LDA   [$AE],Y
         PHA
         AND   #$00FF
         BEQ   L028BE7
         PLA
         PHA
         AND   #$FF1F
         STA   [$AE],Y
         AND   #$001F
         PHA
         TYA
         SEC
         ADC   $01,S
         TAY
         PLA
         PLA
         AND   #$00E0
         CMP   #$0040
         BEQ   L028BC4
         CMP   #$0060
         BEQ   L028BBF
         CMP   #$0080
         BNE   L028BE4
         SEC
         LDA   [$AE],Y
         SBC   #$8000
         TAX
         INY
         INY
         LDA   [$AE],Y
         INY
         PHY
         AND   #$00FF
         SBC   #$0000
         CLC
         ADC   #$0080
         PHA
         PHX
         PEA   $0000
         PEA   $0000
L028BB0  LDA   L028BEC
         PHA
         LDA   L028BEA
         PHA
         JSL   L042748
         PLY
         BRA   L028B56
L028BBF  INY
         INY
         INY
         BRA   L028B56
L028BC4  SEC
         LDA   [$AE],Y
         SBC   #$8000
         TAX
         INY
         INY
         LDA   [$AE],Y
         INY
         PHY
         AND   #$00FF
         SBC   #$0000
         CLC
         ADC   $42
         PHA
         PHX
         PEA   $0000
         PEA   $0001
         BRA   L028BB0
L028BE4  BRL   L02894C
L028BE7  PLA
         CLC
         RTS

L028BEA  DB    $00
         DB    $00
L028BEC  DB    $00
         DB    $00
L028BEE  DB    $00
         DB    $00
L028BF0  DB    $00
         DB    $00
L028BF2  DB    $00
         DB    $00
L028BF4  DW    $0004      ; Parms for Read
L028BF6  DW    $0000      ;  ref num
L028BF8  ADRL  $00000000  ;  buffer ptr
L028BFC  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L028C04  LDA   [$F8]
         AND   #$00FF
         BEQ   L028C1F
         JSR   L021631
         BCC   L028C12
         CLC
         RTS

L028C12  LDX   #$00FE
L028C15  LDA   L021658,X
         STA   L0282C2,X
         DEX
         DEX
         BPL   L028C15
L028C1F  LDA   #$0001
L028C22  STA   L028F0D
         PEA   ^L028F13
         PEA   L028F13
         PEA   $2006      ; GetFileInfo
         JSL   GSOS2
         BCC   L028C37
         BRL   L028D1A
L028C37  LDA   L028F37
         ORA   L028F37+2
         BNE   L028C47
         LDA   #$0011
         JSR   L020AB8
         CLC
         RTS

L028C47  LDA   L028F37
         STA   L028459
         LDA   L028F37+2
         STA   L02845B
         STZ   L028F09
         STZ   L028F0B
         LDA   L02845D
         STA   L028F07
         STZ   L02845D
         LDA   L028F1B
         STA   L028451
         STZ   L0283C8
         CMP   #$00B1
         BCC   L028C7D
         CMP   #$00BF
         BCS   L028C7D
         LDA   #$FFFF
         STA   L028F09
         BRA   L028C88
L028C7D  CMP   #$00F8
         BNE   L028C88
         LDA   #$FFFF
         STA   L028F0B
L028C88  PEA   ^L028F47
         PEA   L028F47
         PEA   $2010      ; Open
         JSL   GSOS2
         BCC   L028C9A
         BRL   L028D1A
L028C9A  LDA   L028F49
         STA   L028F11
         STA   L028457
         LDAL  $E0C025
         AND   #$0080
         BEQ   L028CBC
         BIT   L028F0B
         BPL   L028CB9
         LDA   #$0000
         STA   L028F0B
         BRA   L028CBC
L028CB9  LDA   #$FFFF
L028CBC  EOR   L028F09
         STA   L028F09
         BNE   L028CC7
         BRL   L028E8C
L028CC7  JSR   L028471
         BCS   L028D1D
         LDA   L0283DF
         AND   #$00FF
         DEC
         CMP   #$0002
         BCC   L028CE0
         LDA   #$0009
         JSR   L020AB8
         BRA   L028D1D
L028CE0  BIT   L02844D
         BPL   L028CEE
         LDA   L028F0D
         DEC
         BNE   L028CEE
         INC   L028F0D
L028CEE  JSR   L0286E2
         BCS   L028D1D
         JSR   L02A0EA
         BCS   L028D1D
         LDA   L028451
         CMP   #$00B1
         BEQ   L028D33
         CMP   #$00B2
         BEQ   L028D33
         LDA   L028F0D
         CMP   L02844F
         BEQ   L028D13
         BCC   L028D13
         DEC   L028F0D
         DEC
L028D13  JSR   L028775
         BCS   L028D1D
         BRA   L028D33
L028D1A  JSR   L020AF7
L028D1D  PEA   ^L028F0F
         PEA   L028F0F
         PEA   $2014      ; Close
         JSL   GSOS2
         LDA   L028F07
         STA   L02845D
         SEC
         CLV
         RTS

L028D33  LDA   #$FFFF
         STA   L0283C2
         STZ   L0283C8
         STZ   L0283C6
         STZ   $F6
         STZ   L02845D
         LDA   L028F09
         STA   L0283CA
         BPL   L028D6F
         STZ   $32
         LDA   L02844F
         STA   $40
         LDA   $42
         XBA
         STA   $33
         LDA   L0283E4
         AND   #$0100
         BNE   L028D6A
         LDA   L0283EE
         CMP   #$0001
         BEQ   L028D6A
         BRA   L028D7D
L028D6A  DEC   L0283C6
         BRA   L028D7D
L028D6F  LDA   L028F1D
         STA   $32
         LDA   L028F1D+1
         STA   $33
         STZ   $40
         STZ   $42
L028D7D  JSL   L041D74
         LDA   L0283CA
         BEQ   L028DB3
         LDA   L028451
         CMP   #$00B1
         BEQ   L028D93
         CMP   #$00B2
         BNE   L028DB3
L028D93  JSR   L020D34
         LDA   #$FFFF
         STA   L0283C8
         INC
         STA   $42
         INC
         JSR   L028775
         BCC   L028DB3
L028DA5  STZ   L0283C2
         JSL   L040FF1
         JSL   L041DDC
         BRL   L028D1D
L028DB3  STZ   $5C
         LDA   L028449
         STA   $3E
         BNE   L028DBF
         SEC
         ROR   $5C
L028DBF  JSR   L020D34
         JSL   L040F9B
         BCS   L028DA5
         LDA   L0283CA
         BEQ   L028DD9
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         JSL   L0437E4
L028DD9  JSR   L020D0C
         JSR   L029A36
         JSL   L042328
         LDA   L0283CA
         BNE   L028E04
         LDA   #$0000
         JSL   L0410BB
         AND   #$0010
         BNE   L028E04
         PEI   $42
         PEA   $0000
         PEI   $3E
         JSR   L028E53
         PHY
         PHX
         JSL   L042BC0
L028E04  JSR   L028E33
         JSR   L025A75
         JSR   L024144
         BIT   L0283C4
         BPL   L028E15
         JSR   L028920
L028E15  JSR   L020D34
         LDA   #$0000
         JSR   L021DBB
         LDA   L028F1D
         STA   L028453
         PEA   ^L028F0F
         PEA   L028F0F
         PEA   $2014      ; Close
         JSL   GSOS2
         CLC
         RTS

L028E33  LDA   L0283CA
         BEQ   L028E4B
         LDA   $40
         BIT   L02844D
         BPL   L028E40
         DEC
L028E40  CMP   #$0002
         LDA   #$0000
         SBC   #$0000
         BRA   L028E4E
L028E4B  EOR   #$FFFF
L028E4E  JSL   L04507E
         RTS

L028E53  LDA   L028F1B
         CMP   #$0006
         BEQ   L028E6C
         LDX   L028E7E
L028E5E  CMP   L028E80,X
         BEQ   L028E73
         DEX
         DEX
         BPL   L028E5E
         LDY   #$0000
         TYX
         RTS

L028E6C  LDY   L028F1D+2
         LDX   L028F1D
         RTS

L028E73  TXA
         ASL
         TAX
         LDY   L028E86,X
         LDA   L028E84,X
         TAX
         RTS

L028E7E  DB    $02
         DB    $00
L028E80  DB    $F8
         DB    $00
         DB    $FF
         DB    $00
L028E84  DB    $00
         DB    $80
L028E86  DB    $00
         DB    $00
         DB    $00
         DB    $20
         DB    $00
         DB    $00

L028E8C  LDA   L028F0B
         STA   L0283C4
         BEQ   L028EA2
         STZ   L028F37+2
         LDA   L028F1D
         STA   L028F37
         BNE   L028EA2
         INC   L028F37+2
L028EA2  LDY   L028F37+2
         BEQ   L028EB9
         DEY
         BNE   L028EB0
         INY
         LDA   L028F37
         BEQ   L028EB9

L028EB0  LDA   #$0008	; File/Segment longer than 64K
         JSR   L020AB8
         BRL   L028D1D
L028EB9  LDA   L028F37
         JSR   L028896
         BCC   L028EC4
         BRL   L028D1D
L028EC4  LDA   #$0001
         STA   L02844F
         PHY
         PHX
         PEI   $38
         PEI   $36
         _DisposeHandle
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         _DisposeHandle
         STZ   L0283CE
         STZ   L0283CC
         PLX
         PLY
         STY   $38
         STX   $36
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $3A
         LDA   |$0002,X
         STA   $3C
         PLB
         PLB
         JSR   L02A229
         BRL   L028D33
L028F07  DB    $00
         DB    $00
L028F09  DB    $00
         DB    $00
L028F0B  DB    $00
         DB    $00
L028F0D  DB    $00
         DB    $00

L028F0F  DW    $0001      ; Parms for Close
L028F11  DW    $0000      ;  ref num

L028F13  DW    $000C      ; Parms for GetFileInfo
         ADRL  L0282C2    ;  file name
         DW    $0000      ;  access
L028F1B  DW    $0000      ;  file type
L028F1D  ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    8          ;  creation date
         DS    8          ;  modification date
         ADRL  $00000000  ;  option list
L028F37  ADRL  $00000000  ;  end of file
         ADRL  $00000000  ;  blocks used
         ADRL  $00000000  ;  resource eof
         ADRL  $00000000  ;  resource blocks

L028F47  DW    $0003      ; Parms for Open
L028F49  DW    $0000      ;  ref num
         ADRL  L0282C2    ;  path name
         DW    $0000      ;  req access
         DW    $0000

L028F53  BIT   $F6
         BPL   L028FAB
         JSR   L021309
         BCS   L028F8F
         SEC
         SBC   #$00B1
         CMP   #$0002
         BCS   L028F94
         INC
         STA   $42
         SEP   #$20
         CLC
         ADC   #$FD
         STA   $3C
         STA   $34
         REP   #$20
         JSR   L020D0C
         JSL   L040F9B
         JSL   L042328
         JSR   L025A75
         JSR   L024144
         JSR   L020D34
         LDA   #$0000
         JSR   L021DBB
         CLC
         RTS

L028F8F  LDA   #$0001
         BRA   L028FA1
L028F94  LDA   #$0003
         BRA   L028FA1
L028F99  LDA   #$000C
         BRA   L028FA1
L028F9E  LDA   #$000B
L028FA1  JSR   L020AB8
L028FA4  CLC
         RTS

L028FA6  JSR   L020AF7
         BRA   L028FA4
L028FAB  BIT   L0283CA
         BPL   L028F9E
         LDA   [$F8]
         AND   #$00FF
         BNE   L028FC1
         JSR   L02A20D
         BCC   L028FDB
         JSR   L021E04
         CLC
         RTS

L028FC1  PEI   $FA
         PEI   $F8
         LDX   #$0002
         JSL   L0306BD
         PLX
         PLX
         BCS   L028F8F
         TYX
         BNE   L028F94
         DEC
         BMI   L028F94
         CMP   $40
         BCS   L028F99
         INC
L028FDB  PHA
         LDA   L02845D
         AND   #$0001
         STA   L029060
         PEA   ^L029056
         PEA   L029056
         PEA   $2010      ; Open
         JSL   GSOS2
         PLX
         BCS   L028FA6
         LDA   L029058
         STA   L029064
         STA   L028457
         TXA
         JSR   L028775
         PHP
         PEA   ^L029062
         PEA   L029062
         PEA   $2014      ; Close
         JSL   GSOS2
         PLP
         BCS   L028FA4
         STZ   $32
         LDA   $42
         XBA
         STA   $33
         LDA   L028449
         STA   $3E
         STZ   $5C
         CMP   #$0000
         BNE   L029029
         SEC
         ROR   $5C
L029029  JSL   L040F9B
         BCS   L02904B
         LDA   L0283CE
         PHA
         LDA   L0283CC
         PHA
         JSL   L0437E4
         JSR   L020D0C
         JSR   L029A36
         JSL   L042328
         JSR   L025A75
         JSR   L024144
L02904B  JSR   L020D34
         LDA   #$0000
         JSR   L021DBB
         CLC
         RTS

L029056  DW    $0004      ; Parms for Open
L029058  DW    $0000      ;  ref num
         ADRL  L0282C2    ;  path name
         DW    $0000      ;  req access
L029060  DW    $0000      ;  res num

L029062  DW    $0001      ; Parms for Close
L029064  DW    $0000      ;  ref num

L029066  STZ   L0293DA
         LDA   [$F8]
         AND   #$00FF
         BNE   L02907D
         LDA   L0283C2
         BEQ   L0290C5
         DEC   L0293DA
         LDA   #$0001
         BRA   L0290DD
L02907D  JSR   L021631
         BCS   L0290B3
         LDA   [$F8]
         AND   #$00FF
         BNE   L02908E
         DEC   L0293DA
         BRA   L0290CD
L02908E  JSR   L02153D
         BCS   L0290B3
         LDX   #$0004
         JSR   L0290B5
         BCS   L0290B3
         STA   L02845F
         JSR   L02153D
         BCS   L0290B3
         LDX   #$0008
         JSR   L0290B5
         BCS   L0290B3
         STA   L028461
         STY   L028463
         BRA   L0290CD
L0290B3  CLV
         RTS

L0290B5  PEI   $FA
         PEI   $F8
         JSL   L0306BD
         PLX
         STX   $F8
         PLX
         STX   $FA
         BCC   L0290CC
L0290C5  LDA   #$0001
         JSR   L020AB8
         SEC
L0290CC  RTS

L0290CD  LDX   #$00FE
L0290D0  LDA   L021658,X
         STA   L0282C2,X
         DEX
         DEX
         BPL   L0290D0
         LDA   #$0001
L0290DD  STA   L02934E
         JSL   GSOS
         DW    $2006      ; GetFileInfo
         ADRL  L029364
         BCC   L0290EF
L0290EC  BRL   L029251
L0290EF  LDA   L029372
         CMP   #$0005
         BEQ   L029100
         LDA   #$000E
         JSR   L020AB8
         BRL   L029245
L029100  JSL   GSOS
         DW    $2010      ; Open
         ADRL  L029358
         BCS   L0290EC
         LDA   L02935A
         STA   L028457
         STA   L02939A
         STA   L0293A4
         STA   L0293B4
         STA   L0293D8
         LDA   L0293DA
         BEQ   L02912B
         JSR   L02949A
         BCC   L02912B
         BRL   L029245
L02912B  STZ   L029352
         LDAL  $E0C025
         AND   #$0080
         BEQ   L02913A
         DEC   L029352
L02913A  LDA   #$0004
         STA   L02939E
         STZ   L02939E+2
         JSR   L029308
         BCS   L0290EC
         LDA   #$0004
         STA   L0293BA
         STZ   L0293BA+2
         JSR   L029313
         BCS   L0290EC
         LDA   L0293C2
         STA   L02939E
         LDA   L0293C4
         STA   L02939E+2
         JSR   L029308
         BCS   L0290EC
         LDA   #$0010
         STA   L0293BA
         JSR   L029313
         BCS   L029194
         LDA   L0293D0
         ADC   L02939E
         STA   L02939E
         LDA   #$0000
         ADC   L02939E+2
         STA   L02939E+2
         JSR   L029308
         BCS   L029194
         LDA   #$0014
         STA   L0293BA
L02918F  JSR   L029313
         BCC   L029197
L029194  BRL   L029251
L029197  LDA   L0293C2
         BEQ   L0291C4
         CMP   L02845F
         BNE   L02918F
         LDA   L0293C4
         CMP   L028461
         BNE   L02918F
         LDA   L0293C6
         CMP   L028463
         BNE   L02918F
         LDA   L0293CC
         BIT   #$0800
         BEQ   L0291CD
         LDA   #$FFFF
         EOR   L029352
         STA   L029352
         BRA   L0291CD
L0291C4  LDA   #$000F
         JSR   L020AB8
         BRL   L029245
L0291CD  LDA   L0293C8
         STA   L02939E
         STA   L028465
         CLC
         ADC   L0293CE
         STA   L028469
         LDA   L0293CA
         STA   L02939E+2
         STA   L028467
         ADC   L0293D0
         STA   L02846B
         JSR   L029308
         BCS   L029194
         JSR   L0241B5
         LDA   #$FFFF
         STA   L02845D
         LDA   L029352
         BEQ   L029259
         JSR   L028471
         BCC   L029207
         BRL   L029245
L029207  LDA   L0283DF
         AND   #$00FF
         DEC
         CMP   #$0002
         BCC   L029218
         STZ   L029352
         BRA   L029259
L029218  BIT   L02844D
         BPL   L029220
         INC   L02934E
L029220  JSR   L0286E2
         BCS   L029245
         JSR   L02A0EA
         BCS   L029245
         LDA   L02934E
         CMP   L02844F
         BEQ   L029238
         BCC   L029238
         DEC   L02934E
         DEC
L029238  JSR   L028775
         BCS   L029245
         JSR   L02929F
L029240  JSR   L029329
         CLC
         RTS

L029245  JSR   L029329
         JSR   L020D34
         JSR   L021E04
         SEC
         CLV
         RTS

L029251  JSR   L029329
         JSR   L020AF7
         BRA   L029245
L029259  LDA   L0293CE
         LDY   L0293D0
         BEQ   L029271
         CPY   #$0002
         BCS   L029269
         TAX
         BEQ   L029271

L029269  LDA   #$0008	; File/Segment longer than 64K
         JSR   L020AB8
         BRA   L029245

L029271  STA   $3E
         TYX
         BEQ   L02927B
         LDX   #$FFFF
         STX   $5C
L02927B  JSR   L028896
         BCS   L029245
         LDA   #$0001
         STA   L02844F
         STY   $38
         STX   $36
         JSR   L023EF2
         STY   $3C
         STX   $3A
         STZ   $40
         STZ   $42
         STZ   $33
         STZ   $32
         JSR   L0292BE
         BRL   L029240
L02929F  LDA   L02844F
         STA   $40
         LDA   L02934E
         STA   $42
         AND   #$00FF
         XBA
         STA   $33
         STZ   $32
         STZ   $5C
         CLC
         LDA   L028449
         STA   $3E
         BNE   L0292BE
         SEC
         ROR   $5C
L0292BE  LDA   #$FFFF
         STA   L0283C2
         LDA   L029352
         STA   L0283CA
         JSL   L040F9B
         BCS   L0292F2
         LDA   L0283CC
         TAX
         ORA   L0283CE
         BEQ   L0292E2
         LDY   L0283CE
         PHY
         PHX
         JSL   L0437E4
L0292E2  JSR   L020D0C
         JSR   L029A36
         JSL   L042328
         JSR   L025A75
         JSR   L024144
L0292F2  JSR   L020D34
         LDA   #$0000
         JSR   L021DBB
         LDA   L02936C
         STA   L028451
         LDA   L02936E
         STA   L028453
         RTS

L029308  JSL   GSOS
         DW    $2016      ; SetMark
         ADRL  L029398
         RTS

L029313  JSL   GSOS
         DW    $2012      ; Read
         ADRL  L0293B2
         RTS

         JSL   GSOS
         DW    $2012      ; Read
         ADRL  L0293A2
         RTS

L029329  PHA
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L0293D6
         PLA
         RTS

         PEI   $FA
         PEI   $F8
         JSL   L0306BD
         PLX
         STX   $F8
         PLX
         STX   $FA
         BCC   L02934D
         LDA   #$0001
         JSR   L020AB8
         SEC
L02934D  RTS

L02934E  DW    $0000
         DW    $0000
L029352  DW    $0000
         DW    $0000
         DW    $0000

L029358  DW    $0004      ; Parms for Open
L02935A  DW    $0000      ;  ref num
         ADRL  L0282C2    ;  path name
         DW    $0000      ;  req access
         DW    $0001      ;  res num

L029364  DW    $000C      ; Parms for GetFileInfo
         ADRL  L0282C2    ;  file name
         DW    $0000      ;  access
L02936C  DW    $0000      ;  file type
L02936E  ADRL  $00000000  ;  aux type
L029372  DW    $0000      ;  storage
         DS    8          ;  creation date
         DS    8          ;  modification date
         ADRL  $00000000  ;  option list
         ADRL  $00000000  ;  end of file
         ADRL  $00000000  ;  blocks used
         ADRL  $00000000  ;  resource eof
         ADRL  $00000000  ;  resource blocks

L029398  DW    $0003      ; Parms for SetMark
L02939A  DW    $0000      ;  ref num
         DW    $0000      ;  base
L02939E  ADRL  $00000000  ;  displacement

L0293A2  DW    $0004      ; Parms for Read
L0293A4  DW    $0000      ;  ref num
         ADRL  $00000000  ;  buffer ptr
         ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count

L0293B2  DW    $0004      ; Parms for Read
L0293B4  DW    $0000      ;  ref num
         ADRL  L0293C2    ;  buffer ptr
L0293BA  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L0293C2  DB    $00
         DB    $00
L0293C4  DB    $00
         DB    $00
L0293C6  DB    $00
         DB    $00
L0293C8  DB    $00
         DB    $00
L0293CA  DB    $00
         DB    $00
L0293CC  DB    $00
         DB    $00
L0293CE  DB    $00
         DB    $00
L0293D0  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L0293D6  DW    $0001      ; Parms for Close
L0293D8  DW    $0000      ;  ref num
L0293DA  DB    $00
         DB    $00
L0293DC  LDA   L028457
         STA   L029492
         STA   L029466
         STA   L029480
         LDA   #$0004
         STA   L029496
         STZ   L029496+2
         JSR   L029456
         BCS   L029449
         PEA   ^L029464
         PEA   L029464
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L029449
         LDA   L029476
         STA   L029496
         LDA   L029478
         STA   L029496+2
         JSR   L029456
         BCS   L029449
         LDX   L02947A
         LDY   L02947C
         STX   L029486
         STY   L029486+2
         LDA   #$8008
         JSR   L023ED6
         BCS   L02944E
         STX   L02846D
         STY   L02846F
         JSR   L023EF2
         STX   L029482
         STY   L029482+2
         PEA   ^L02947E
         PEA   L02947E
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L029449
         RTS

L029449  JSR   L020AF7
         SEC
         RTS

L02944E  LDA   #$0000
         JSR   L020AB8
         SEC
         RTS

L029456  PEA   ^L029490
         PEA   L029490
         PEA   $2016      ; SetMark
         JSL   GSOS2
         RTS

L029464  DW    $0005      ; Parms for Read
L029466  DW    $0000      ;  ref num
         ADRL  L029476    ;  buffer ptr
         ADRL  $00000008  ;  request count
         ADRL  $00000000  ;  transfer count
         DW    $0001      ;  cache priority
L029476  DB    $00
         DB    $00
L029478  DB    $00
         DB    $00
L02947A  DB    $00
         DB    $00
L02947C  DB    $00
         DB    $00
L02947E  DW    $0005      ; Parms for Read
L029480  DW    $0000      ;  ref num
L029482  ADRL  $00000000  ;  buffer ptr
L029486  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
         DW    $0001      ;  cache priority
L029490  DW    $0003      ; Parms for SetMark
L029492  DW    $0000      ;  ref num
         DW    $0000      ;  base
L029496  ADRL  $00000000  ;  displacement
L02949A  JSR   L0293DC
         BCC   L0294A0
         RTS

L0294A0  LDX   L02846D
         LDY   L02846F
         JSR   L023EF2
         STX   $10
         STY   $12
         LDY   #$0018
         LDA   [$10],Y
         STA   L02953C
         BEQ   L029507
         LDY   #$000E
         LDA   [$10],Y
         CLC
         ADC   $10
         STA   $10
         BCC   L0294C5
         INC   $12
L0294C5  JSL   L030B27
         DB    $05
         DB    $12
         DB    $14
         DB    $3B
         ADR   L02950F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         BCS   L0294F5
         ASL
         ASL
         PHA
         ASL
         ASL
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   [$10],Y
         STA   L02845F
         INY
         INY
         LDA   [$10],Y
         STA   L028461
         INY
         INY
         LDA   [$10],Y
         STA   L028463
         CLC
L0294F5  PHP
         LDA   L02846F
         PHA
         LDA   L02846D
         PHA
         _DisposeHandle
         PLP
         RTS

L029507  LDA   #$0018
         JSR   L020AB8
         SEC
         RTS

L02950F  LDA   $04,S
         CMP   #$FFFF
         BNE   L02951D
         LDAL  L02953C
         STA   $06,S
         RTL

L02951D  CMPL  L02953C
         BCC   L02952E
         LDA   #^L02953E
         STA   $08,S
         LDA   #L02953E
         STA   $06,S
         RTL

L02952E  JSR   L029568
         LDA   #^L02953F
         STA   $08,S
         LDA   #L02953F
         STA   $06,S
         RTL

L02953C  DB    $00
         DB    $00
L02953E  DB    $00
L02953F  DB    $24
L029540  ASC   "  0000  "
L029548  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02955C  ASC   "00000000"
L029564  DB    $00
         DB    $00
L029566  DB    $00
         DB    $00
L029568  PHB
         PHK
         PLB
         JSR   L02962F
         TAY
         LDA   [$10],Y
         STA   L029566
         PHA
         PHA
         PHA
         INY
         INY
         LDA   [$10],Y
         PHA
         PHA
         PHA
         INY
         INY
         LDA   [$10],Y
         PHA
         PHA
         PHA
         INY
         INY
         INY
         INY
         INY
         INY
         LDA   [$10],Y
         STA   L029564
         _HexIt
         PLA
         ORA   #$8080
         STA   L02955C
         PLA
         ORA   #$8080
         STA   L02955C+2
         _HexIt
         PLA
         ORA   #$8080
         STA   L02955C+4
         PLA
         ORA   #$8080
         STA   L02955C+6
         _HexIt
         PLA
         ORA   #$8080
         STA   L029540+2
         PLA
         ORA   #$8080
         STA   L029540+4
         LDA   #$A0A0
         STA   L029540
         LDA   L029564
         BIT   #$0800
         BEQ   L0295E3
         LDA   #$A0E3
         STA   L029540
L0295E3  LDA   L029566
         PHA
         AND   #$3FFF
         TAY
         PLA
         AND   #$C000
         CMP   #$C000
         BEQ   L029608
         CMP   #$8000
         BNE   L02962A
         TYA
         CMP   #$0030
         BCS   L02962A
         DEC
         JSR   L02962F
         ADC   #L02964E
         BRA   L029615
L029608  TYA
         CMP   #$0003
         BCS   L02962A
         DEC
         JSR   L02962F
         ADC   #L0299FA
L029615  TAX
         LDY   #$0000
L029619  LDA   |$0000,X
         STA   L029548,Y
         INX
         INX
         INY
         INY
         CPY   #$0014
         BCC   L029619
         PLB
         RTS

L02962A  LDA   #L02963A
         BRA   L029615
L02962F  ASL
         ASL
         PHA
         ASL
         ASL
         ADC   $01,S
         STA   $01,S
         PLA
         RTS

L02963A  ASC   "?                   "
L02964E  ASC   "rIcon               "
         ASC   "rPicture            "
         ASC   "rControlList        "
         ASC   "rControlTemplate    "
         ASC   "rC1InputString      "
         ASC   "rPString            "
         ASC   "rStringList         "
         ASC   "rMenuBar            "
         ASC   "rMenu               "
         ASC   "rMenuItem           "
         ASC   "rTextForLETextBox2  "
         ASC   "rCtlDefProc         "
         ASC   "rCtlColorTbl        "
         ASC   "rWindParam1         "
         ASC   "rWindParam2         "
         ASC   "rWindColor          "
         ASC   "rTextBlock          "
         ASC   "rStyleBlock         "
         ASC   "rToolStartUp        "
         ASC   "rResName            "
         ASC   "rAlertString        "
         ASC   "rText               "
         ASC   "rCodeResource       "
         ASC   "rCDEVCode           "
         ASC   "rCDEVFlags          "
         ASC   "rTwoRects           "
         ASC   "rFileType           "
         ASC   "rListRef            "
         ASC   "rCString            "
         ASC   "rXCMD               "
L0298A6  ASC   "rXFCN               "
         ASC   "rErrorString        "
         ASC   "rKTransTable        "
         ASC   "rWString            "
         ASC   "rC1OutputString     "
         ASC   "rSoundSample        "
         ASC   "rTERuler            "
         ASC   "rFSequence          "
         ASC   "rCursor             "
         ASC   "rItemStruct         "
         ASC   "rVersion            "
         ASC   "rComment            "
         ASC   "rBundle             "
         ASC   "rFinderPath         "
         ASC   "rPaletteWindow      "
         ASC   "rTaggedString       "
         ASC   "rPatternList        "
L0299FA  ASC   "rRectList           "
         ASC   "rPrintRecord        "
         ASC   "rFont               "

L029A36  PHP
         REP   #$30
         LDA   $AA
         ORA   $AC
         BNE   L029A41
L029A3F  PLP
         RTS

L029A41  LDY   #$0002
         LDA   [$AA]
         TAX
         LDA   [$AA],Y
         TAY
         BNE   L029A4F
         TXA
         BEQ   L029A3F
L029A4F  STX   $AE
         STY   $B0
L029A53  LDA   [$AE]
         INC   $AE
         BNE   L029A5B
         INC   $B0
L029A5B  AND   #$00FF
         BEQ   L029A3F
         CMP   #$00E0
         BCS   L029A70
         CLC
         ADC   $AE
         STA   $AE
         BCC   L029A53
         INC   $B0
         BRA   L029A53
L029A70  ASL
         TAX
         JMP   (L029A75-$1C0,X)

L029A75  DA    L029AB5
         DA    L029AB5
         DA    L029AC3
         DA    L029AF3
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
         DA    L029B48
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
         DA    L029B5C
         DA    L029B5C
         DA    L029B5C
         DA    L029B50
         DA    L029AB5
         DA    L029B48
         DA    L029AB5
         DA    L029AB5
         DA    L029B5C
         DA    L029AB5
         DA    L029ADB
         DA    L029B0E
         DA    L029B2B
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
         DA    L029AB5
L029AB5  PLP
         RTS

L029AB7  CLC
         ADC   $AE
         STA   $AE
         BCC   L029AC0
         INC   $B0
L029AC0  BRL   L029A53
L029AC3  JSR   L029BB8
         LDY   #$0006
         LDA   [$AE],Y
         STA   L029BDB
         LDA   $42
         STA   L029BDD
         JSR   L029BE3
         LDA   #$000A
         BRA   L029AB7
L029ADB  JSR   L029BB8
         LDY   #$0004
         LDA   [$AE],Y
         STA   L029BDB
         LDA   $42
         STA   L029BDD
         JSR   L029BE3
         LDA   #$0006
         BRA   L029AB7
L029AF3  JSR   L029BB8
         LDY   #$0008
         LDA   [$AE],Y
         STA   L029BDD
         INY
         INY
         LDA   [$AE],Y
         STA   L029BDB
         JSR   L029BE3
         LDA   #$000E
         BRL   L029AB7
L029B0E  JSR   L029BB8
         LDY   #$0004
         LDA   [$AE],Y
         AND   #$00FF
         STA   L029BDD
         INY
         LDA   [$AE],Y
         STA   L029BDB
         JSR   L029BE3
         LDA   #$0007
         BRL   L029AB7
L029B2B  LDY   #$0002
         LDA   [$AE],Y
         BEQ   L029B35
         BRL   L029A3F
L029B35  LDA   [$AE]
         PHA
         LDA   #$0004
         CLC
         ADC   $AE
         STA   $AE
         BCC   L029B44
         INC   $B0
L029B44  PLA
         BRL   L029AB7
L029B48  JSR   L029BA8
         LDA   #$0004
         BRA   L029B5F
L029B50  CLC
         LDA   #$0004
         ADC   $AE
         STA   $AE
         BCC   L029B5C
         INC   $B0
L029B5C  LDA   #$0003
L029B5F  CLC
         ADC   $AE
         STA   $AE
         BCC   L029B68
         INC   $B0
L029B68  LDA   [$AE]
         INC   $AE
         BNE   L029B70
         INC   $B0
L029B70  AND   #$00FF
         BEQ   L029B86
         CMP   #$0080
         BCC   L029B68
         AND   #$007F
         BEQ   L029B68
         CMP   #$0008
         BCC   L029B89
         PLP
         RTS

L029B86  BRL   L029A53
L029B89  ASL
         TAX
         JMP   (L029B8E,X)

L029B8E  DA    $0000
         DA    L029B9E
         DA    L029BA3
         DA    L029BA3
         DA    L029BA3
         DA    L029BA3
         DA    L029BA3
         DA    L029B9E

L029B9E  LDA   #$0004
         BRA   L029B5F
L029BA3  JSR   L029BA8
         BRA   L029B68
L029BA8  LDA   [$AE]
         AND   #$00FF
         INC
         CLC
         ADC   $AE
         STA   $AE
         BCC   L029BB7
         INC   $B0
L029BB7  RTS

L029BB8  LDA   [$AE]
         AND   #$00FF
         STA   L029BDF
         LDY   #$0001
         LDA   [$AE],Y
         AND   #$00FF
         STA   L029BE1
         INY
         LDA   [$AE],Y
         STA   L029BD7
         LDA   $42
         STA   L029BD9
         RTS

L029BD7  DB    $00
         DB    $00
L029BD9  DB    $00
         DB    $00
L029BDB  DB    $00
         DB    $00
L029BDD  DB    $00
         DB    $00
L029BDF  DB    $00
         DB    $00
L029BE1  DB    $00
         DB    $00
L029BE3  LDA   L029BE1
         BEQ   L029C04
         BIT   #$0080
         BEQ   L029BFB
         ORA   #$FF00
L029BF0  LSR   L029BDD
         ROR   L029BDB
         INC
         BNE   L029BF0
         BRA   L029C04
L029BFB  ASL   L029BDB
         ROL   L029BDD
         DEC
         BNE   L029BFB
L029C04  SEP   #$20
         LDX   #$0000
         LDY   L029BD7
L029C0C  LDA   L029BDB,X
         STA   [$3A],Y
         INX
         INY
         CPX   L029BDF
         BCC   L029C0C
         REP   #$20
         RTS

L029C1B  BIT   L0283C2
         BMI   L029C23
         SEC
         CLV
         RTS

L029C23  JSR   L020D34
         LDA   L0283CA
         BNE   L029C2E
         BRL   L029F92
L029C2E  LDY   #$0002
         LDX   #$001C
         BIT   L02845D
         BMI   L029C5C
         JSL   L0300E2
         JSL   L0302E1
         STR   "Infos on current segment"
         BRA   L029C7F
L029C5C  DEX
         JSL   L0300E2
         JSL   L0302E1
         STR   "Infos on resource segment"
L029C7F  JSR   L02A0B4
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Byte count ....... $"
         LDA   L0283D2
         PHA
         JSL   L03065A
         LDA   L0283D0
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Reserved space ... $"
         LDA   L0283D6
         PHA
         JSL   L03065A
         LDA   L0283D4
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Segment length ... $"
         LDA   L0283DA
         PHA
         JSL   L03065A
         LDA   L0283D8
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   " Unused .......... $"
         LDA   L0283DC
         PHA
         JSL   L03065A
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Label length ..... $"
         LDA   L0283DD
         PHA
         JSL   L03065A
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Number length .... $"
         LDA   L0283DE
         PHA
         JSL   L03065A
         JSR   L02A0B4
         JSL   L0302E1
         STR   "OMF version ...... $"
         LDA   L0283DF
         PHA
         JSL   L03065A
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Bank size ........ $"
         LDA   L0283E2
         PHA
         JSL   L03065A
         LDA   L0283E0
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Kind ............. $"
         LDA   L0283E4
         PHA
         PHA
         JSL   L030670
         JSL   L0302E1
         STR   "     "
         PLA
         AND   #$001F
         ASL
         TAX
         LDA   L02A024,X
         STA   L029E34
         JSL   L0302E1
         STR   "("
         BIT   L0283E4
         BPL   L029E16
         JSL   L0302E1
         STR   "Dynamic, "
L029E16  LDA   #$1000
         AND   L0283E4
         BEQ   L029E30
         JSL   L0302E1
         STR   "No spec mem, "
L029E30  JSL   L030314
L029E34  ADR   L02A064
         JSR   L02A0B4
         JSL   L0302E1
         STR   " Unused .......... $"
         LDA   L0283E6
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Origin ........... $"
         LDA   L0283EA
         PHA
         JSL   L03065A
         LDA   L0283E8
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Align ............ $"
         LDA   L0283EE
         PHA
         JSL   L03065A
         LDA   L0283EC
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Number sex ....... $"
         LDA   L0283F0
         PHA
         JSL   L03065A
         JSR   L02A0B4
         JSL   L0302E1
         STR   " Unused .......... $"
         LDA   L0283F1
         PHA
         JSL   L03065A
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Segment number.... $"
         LDA   L0283F2
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Entry ............ $"
         LDA   L0283F6
         PHA
         JSL   L03065A
         LDA   L0283F4
         PHA
         JSL   L030670
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Load name ........ "
         JSL   L030314
         ADR   L0283FC
         JSR   L02A0B4
         JSL   L0302E1
         STR   "Segment name ..... "
         JSL   L030314
         ADR   L028407
         BRL   L02A0C1
L029F92  LDY   #$0002
         LDX   #$0019
         JSL   L0300E2
         JSL   L0302E1
         STR   "Infos on non-relocatable file"
         JSR   L02A0B4
         JSR   L02A0B4
         JSL   L0302E1
         STR   "File length ...... $"
         LDA   #$0000
         BIT   $5C
         BPL   L029FE5
         INC
L029FE5  PHA
         JSL   L03065A
         PEI   $3E
         JSL   L030670
         JSR   L02A0B4
         JSR   L02A0B4
         JSL   L0302E1
         STR   "(Sorry, nothing more for the moment..)"
         BRL   L02A0C1

L02A024  DA    L02A06A
         DA    L02A064
         DA    L02A070
         DA    L02A064
         DA    L02A07C
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A086
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A09A
         DA    L02A064
         DA    L02A0AA
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064
         DA    L02A064

L02A064  STR   "Data)"
L02A06A  STR   "Code)"
L02A070  STR   "Jump Table)"
L02A07C  STR   "Pathname)"
L02A086  STR   "Library dictionary)"
L02A09A  STR   "Initialization)"
L02A0AA  STR   "DP/Stack)"

L02A0B4  JSL   L0300EE
         INY
         LDX   #$0014
         JSL   L0300E2
         RTS

L02A0C1  LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
         STR   "> Press any key "
         JSL   L03034A
         CLC
         RTS

L02A0E6  DB    $00
L02A0E7  DB    $00
L02A0E8  DB    $00
         DB    $00
L02A0EA  JSR   L02A229
         LDA   L02844F
         STA   L02A1FF
         ASL
         PHA
         ASL
         PHA
         ASL
         PHA
         ASL
         ADC   $01,S
         ADC   $03,S
         ADC   $05,S
         INC
         PLX
         PEA   $0000
         PHA
         PEI   $FC
         PEA   $8008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCC   L02A120
         LDA   #$0000
         JSR   L020AB8
         SEC
         RTS

L02A120  STX   L02A0E6
         STY   L02A0E8
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $10
         STAL  L02A21C
         LDA   |$0002,X
         STA   $12
         PLB
         PLB
         STA   L02A21E
         STZ   L02A201
         LDA   L028457
         STA   L02A205
         STZ   L02A209
         STZ   L02A209+2
         BIT   L02845D
         BPL   L02A15C
         LDA   L028465
         STA   L02A209
         LDA   L028467
         STA   L02A209+2
L02A15C  JSL   GSOS
         DW    $2016      ; SetMark
         ADRL  L02A203
         BCS   L02A181
         JSR   L028471
         BCS   L02A184
         LDA   L0283D0
         ADC   L02A209
         STA   L02A209
         LDA   L0283D2
         ADC   L02A209+2
         STA   L02A209+2
         BRA   L02A189
L02A181  JSR   L020AF7
L02A184  JSR   L02A229
         SEC
         RTS

L02A189  SEP   #$20
         LDY   L02A201
         LDA   L028407
         CMP   #$19
         BCC   L02A19B
         LDA   #$18
         STA   L028407
         CLC
L02A19B  ADC   #$05
         STA   [$10],Y
         INY
         REP   #$20
         PHY
         LDA   L0283F3
         JSL   L030837
         PLY
         STA   [$10],Y
         INY
         INY
         PHY
         LDA   L0283F2
         BNE   L02A1BD
         SEC
         LDA   L02844F
         SBC   L02A1FF
         INC
L02A1BD  JSL   L030837
         PLY
         STA   [$10],Y
         INY
         INY
         SEP   #$20
         LDA   #$A0
         STA   [$10],Y
         INY
         LDA   L028407
         BEQ   L02A1E9
         LDX   #$0001
L02A1D5  LDA   L028407,X
         INX
         ORA   #$80
         CMP   #$A0
         BCS   L02A1E1
         LDA   #$A0
L02A1E1  STA   [$10],Y
         INY
         DEC   L028407
         BNE   L02A1D5
L02A1E9  STY   L02A201
         REP   #$20
         DEC   L02A1FF
         BEQ   L02A1F6
         BRL   L02A15C
L02A1F6  SEP   #$20
         LDA   #$00
         STA   [$10],Y
         REP   #$21
         RTS

L02A1FF  DB    $00
         DB    $00
L02A201  DB    $00
         DB    $00
L02A203  DW    $0003      ; Parms for SetMark
L02A205  DW    $0000      ;  ref num
         DW    $0000      ;  base
L02A209  ADRL  $00000000  ;  displacement

L02A20D  LDA   L02A0E7
         BNE   L02A214
         SEC
         RTS

L02A214  JSL   L0308F3
         DB    $06
         DB    $12
         DB    $18
         DB    $37
L02A21C  DB    $00
         DB    $00
L02A21E  DB    $00
         DB    $00
         PHP
         INC
         PHA
         JSR   L020D34
         PLA
         PLP
         RTS

L02A229  LDA   L02A0E7
         BEQ   L02A240
         LDA   L02A0E8
         PHA
         LDA   L02A0E6
         PHA
         _DisposeHandle
         STZ   L02A0E7
L02A240  RTS

L02A241  LDY   #$0001
         TYX
         DEX
         LDA   #$8008
         JSR   L023ED6
         BCC   L02A24F
         RTS

L02A24F  PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $00
         STAL  L02A831
         LDA   |$0002,X
         STA   $02
         PLB
         PLB
         STA   L02A831+2
         STX   L02A89B
         STY   L02A89D
         LDY   #$0000
         TYA
L02A26F  STA   [$00],Y
         INY
         INY
         BNE   L02A26F
         LDY   #$0001
         TYX
         DEX
         LDA   #$8008
         JSR   L023ED6
         BCC   L02A283
         RTS

L02A283  PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $00
         STAL  L02A80E
         LDA   |$0002,X
         STA   $02
         PLB
         PLB
         STA   L02A80E+2
         STX   L02A89F
         STY   L02A8A1
         LDA   L028457
         STA   L02A82F
         STA   L02A80C
         STA   L02A7C0
         STA   L02A7E5
         STA   L02A865
         STA   L02A7A3
         STZ   L02A893
         STZ   L02A897
         STZ   L02A895
         STZ   L02A899
L02A2C0  JSR   L02A7AB
         BNE   L02A327
         STA   [$00]
         INC   L02A897
         BNE   L02A2CF
         INC   L02A899
L02A2CF  LDA   L0283D4
         STA   L02A7F3
         LDA   L0283D6
         STA   L02A7F5
         JSR   L02A6DD
         BCS   L02A339
         JSR   L02A33E
         LDA   L02A899
         PHA
         LDA   L02A897
         PHA
         LDY   L02A8A1
         PHY
         LDX   L02A89F
         PHX
         PHY
         PHX
         _HUnlock
         _SetHandleSize
         PLX
         LDA   L02A899
         PHA
         LDA   L02A897
         PHA
         LDA   L02A8A1
         PHA
         LDA   L02A89F
         PHA
         LDA   L02A895
         PHA
         LDA   L02A893
         PHA
         LDA   L02A89D
         PHA
         LDA   L02A89B
         PHA
         PHX
         CLC
         RTS

L02A327  CMP   #$00E0
         BCS   L02A331
         JSR   L02A71E
         BRA   L02A337
L02A331  ASL
         TAX
         LSR
         JSR   (L02A36E-$1C0,X)
L02A337  BCC   L02A2C0
L02A339  JSR   L02A761
         SEC
         RTS

L02A33E  LDA   L0283C8
         BEQ   L02A36D
         LDA   L0283E4
         AND   #$00FF
         CMP   #$0008
         BEQ   L02A36D
         LDA   L028428
         AND   #$00FF
         BEQ   L02A36D
         LDA   L0283F2
         PHA
         PEA   $0000
         PEA   $0001
         PEA   $0001
         PEA   ^L028428
         PEA   L028428
         JSL   L042748
L02A36D  RTS

L02A36E  DA    L02A3AE
         DA    L02A3AE
         DA    L02A622
         DA    L02A622
         DA    L02A3B4
         DA    L02A3B4
         DA    L02A40F
         DA    L02A583
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A4A2
         DA    L02A4A2
         DA    L02A4A2
         DA    L02A43F
         DA    L02A40A
         DA    L02A583
         DA    L02A6C4
         DA    L02A726
         DA    L02A4A2
         DA    L02A3B7
         DA    L02A622
         DA    L02A622
         DA    L02A5E8
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A3C0
         DA    L02A3C0
L02A3AE  LDA   #$0004
         BRL   L02A78E
L02A3B4  BRL   L02A780
L02A3B7  LDA   #$0006
         JSR   L02A78E
         BRL   L02A780
L02A3C0  PHA
         JSR   L02A5CA
         JSL   L0302E1
         STR   "Unsupported OMF type $"
         JSL   L03065A
         JSL   L0302E1
         STR   " "
         JSL   L03034A
         JSR   L020CED
         SEC
         RTS

L02A3F2  LDA   L0283DD
         AND   #$00FF
         BNE   L02A400
         JSR   L02A7AB
         BCC   L02A400
         RTS

L02A400  STA   L02A86B
         STA   L02A873
         JSR   L02A83D
         RTS

L02A40A  LDA   #$0000
         BRA   L02A412
L02A40F  LDA   #$0001
L02A412  STA   L02A43D
         JSR   L02A3F2
         BCC   L02A41B
         RTS

L02A41B  LDA   L0283F2
         PHA
         LDA   L02A893
         PHA
         PEA   $0001
         LDA   L02A43D
         PHA
         PEA   ^L02A873
         PEA   L02A873
         JSL   L042748
         LDA   L0283DF
         INC
         INC
         JSR   L02A78E
         RTS

L02A43D  DB    $00
         DB    $00
L02A43F  STZ   L02A581
         STA   [$00]
         INC   $00
         BNE   L02A44A
         INC   $02
L02A44A  INC   L02A581
         JSR   L02A7AB
         BCC   L02A453
         RTS

L02A453  PHA
         STA   [$00]
         INC   $00
         BNE   L02A45C
         INC   $02
L02A45C  INC   L02A581
         JSR   L02A7D0
         PLA
         BCC   L02A466
         RTS

L02A466  PHA
         LDA   L02A7F3
         STA   [$00]
         LDY   #$0002
         LDA   L02A7F5
         STA   [$00],Y
         CLC
         LDA   #$0004
         PHA
         ADC   $00
         STA   $00
         BCC   L02A481
         INC   $02
L02A481  PLA
         ADC   L02A581
         STA   L02A581
         LDA   L02A893
         STA   [$00]
         INC   $00
         BNE   L02A493
         INC   $02
L02A493  INC   $00
         BNE   L02A499
         INC   $02
L02A499  INC   L02A581
         INC   L02A581
         PLA
         BRA   L02A4D8
L02A4A2  STZ   L02A581
         STA   [$00]
         INC   $00
         BNE   L02A4AD
         INC   $02
L02A4AD  INC   L02A581
         LDA   L02A893
         STA   [$00]
         INC   $00
         BNE   L02A4BB
         INC   $02
L02A4BB  INC   $00
         BNE   L02A4C1
         INC   $02
L02A4C1  INC   L02A581
         INC   L02A581
         JSR   L02A7AB
         BCC   L02A4CD
         RTS

L02A4CD  STA   [$00]
         INC   $00
         BNE   L02A4D5
         INC   $02
L02A4D5  INC   L02A581
L02A4D8  PHA
         CLC
         ADC   L02A893
         STA   L02A893
         BCC   L02A4E5
         INC   L02A895
L02A4E5  PLA
         CLC
         ADC   L02A831
         STA   L02A831
         BCC   L02A4F2
         INC   L02A831+2
L02A4F2  JSR   L02A7AB
         BCC   L02A4F8
         RTS

L02A4F8  STA   [$00]
         INC   $00
         BNE   L02A500
         INC   $02
L02A500  INC   L02A581
         CMP   #$0000
         BEQ   L02A517
         CMP   #$0080
         BCC   L02A4F2
         AND   #$007F
         BEQ   L02A4F2
         ASL
         TAX
         JMP   (L02A521,X)

L02A517  LDY   #$0000
         LDX   L02A581
         JSR   L02A66F
         RTS

L02A521  DA    $0000
         DA    L02A531
         DA    L02A55D
         DA    L02A55D
         DA    L02A55D
         DA    L02A55D
         DA    L02A55D
         DA    L02A531

L02A531  JSR   L02A7D0
         BCC   L02A537
         RTS

L02A537  LDA   L02A7F3
         STA   [$00]
         LDY   #$0002
         LDA   L02A7F5
         STA   [$00],Y
         LDA   #$0004
L02A547  CLC
         PHA
         ADC   $00
         STA   $00
         LDA   #$0000
         ADC   $02
         STA   $02
         PLA
         ADC   L02A581
         STA   L02A581
         BRA   L02A4F2
L02A55D  JSR   L02A3F2
         BCC   L02A563
         RTS

L02A563  LDA   L02A873
         AND   #$00FF
         INC
         PHA
         SEP   #$30
         LDX   #$00
         TXY
L02A570  LDA   L02A873,X
         STA   [$00],Y
         INX
         INY
         DEC   L02A873
         BPL   L02A570
         REP   #$30
         PLA
         BRA   L02A547
L02A581  DB    $00
         DB    $00
L02A583  STZ   L02A581
         STA   [$00]
         INC   $00
         BNE   L02A58E
         INC   $02
L02A58E  INC   L02A581
         JSR   L02A3F2
         BCC   L02A597
         RTS

L02A597  LDA   L02A873
         AND   #$00FF
         INC
         PHA
         SEP   #$30
         LDX   #$00
         TXY
L02A5A4  LDA   L02A873,X
         STA   [$00],Y
         INX
         INY
         DEC   L02A873
         BPL   L02A5A4
         REP   #$30
         PLA
         CLC
         PHA
         ADC   $00
         STA   $00
         LDA   #$0000
         ADC   $02
         STA   $02
         PLA
         ADC   L02A581
         STA   L02A581
         BRL   L02A531
L02A5CA  JSR   L020CED
L02A5CD  LDY   #$0017
         LDX   #$0000
         JSL   L0300E2
         JSL   L0302E1
         STR   87"> Loader: "
         RTS

L02A5E8  STA   [$00]
         INC   $00
         BNE   L02A5F0
         INC   $02
L02A5F0  JSR   L02A7D0
         BCC   L02A5F6
         RTS

L02A5F6  LDA   L02A7F3
         STA   [$00]
         LDY   #$0002
         LDA   L02A7F5
         BEQ   L02A606
         BRL   L02A68A
L02A606  STA   [$00],Y
         CLC
         LDA   #$0004
         ADC   $00
         STA   $00
         LDA   #$0000
         ADC   $02
         STA   $02
         LDX   #$0005
         LDY   #$0000
         JSR   L02A66F
         BRA   L02A63F
L02A622  STA   [$00]
         INC   $00
         BNE   L02A62A
         INC   $02
L02A62A  INC   L02A897
         BNE   L02A632
         INC   L02A899
L02A632  TAX
         LDA   L02A5CD,X
         AND   #$00FF
         STA   L02A7F3
         STZ   L02A7F5
L02A63F  LDA   L02A7F3
         STA   L02A812
         STZ   L02A812+2
         LDA   $00
         STA   L02A80E
         LDA   $02
         STA   L02A80E+2
         LDX   L02A7F3
         LDY   #$0000
         JSR   L02A66F
         BCC   L02A65E
         RTS

L02A65E  LDA   L02A7F3
         ADC   $00
         STA   $00
         LDA   #$0000
         ADC   $02
         STA   $02
         BRL   L02A7F7
L02A66F  CLC
         TXA
         ADC   L02A897
         STA   L02A897
         TYA
         ADC   L02A899
         STA   L02A899
         BEQ   L02A688
         DEC
         BNE   L02A68A
         LDA   L02A897
         BNE   L02A68A
L02A688  CLC
         RTS

L02A68A  JSR   L02A5CA
         JSL   L0302E1
         STR   "Too many OMF records "
L02A6A7  JSL   L03034A
         SEC
         RTS

         DB    $00
         DB    $00
         DB    $0A
         DB    $0E
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $07

L02A6C4  JSR   L02A7D0
         BCC   L02A6CA
         RTS

L02A6CA  CLC
         LDA   L02A7F3
         ADC   L02A831
         STA   L02A831
         LDA   L02A7F5
         ADC   L02A831+2
         STA   L02A831+2
L02A6DD  LDA   L02A7F3
         ADC   L02A893
         STA   L02A893
         LDA   L02A7F5
         ADC   L02A895
         STA   L02A895
         BEQ   L02A6F9
         DEC
         BNE   L02A6FB
         LDA   L02A893
         BNE   L02A6FB
L02A6F9  CLC
         RTS

L02A6FB  JSR   L02A5CA
         JSL   L0302E1
         STR   "Segment longer than 64K "
         BRL   L02A6A7

L02A71E  STA   L02A7F3
         STZ   L02A7F5
         BRA   L02A72C
L02A726  JSR   L02A7D0
         BCC   L02A72C
         RTS

L02A72C  CLC
         LDA   L02A7F3
         STA   L02A835
         LDA   L02A7F5
         STA   L02A835+2
         JSR   L02A6DD
         BCC   L02A73F
         RTS

L02A73F  JSR   L02A81A
         BCC   L02A745
         RTS

L02A745  LDA   L02A7F3
         ADC   L02A831
         STA   L02A831
         LDA   L02A7F5
         ADC   L02A831+2
         STA   L02A831+2
         CLC
         RTS

L02A759  JSR   L020AF7
         JSR   L02A761
         SEC
         RTS

L02A761  LDA   L02A89D
         PHA
         LDA   L02A89B
         PHA
         _DisposeHandle
         LDA   L02A8A1
         PHA
         LDA   L02A89F
         PHA
         _DisposeHandle
         RTS

L02A780  LDA   L0283DD
         AND   #$00FF
         BNE   L02A78E
         JSR   L02A7AB
         BCC   L02A78E
         RTS

L02A78E  STA   L02A7A7
         PEA   ^L02A7A1
         PEA   L02A7A1
         PEA   $2016      ; SetMark
         JSL   GSOS2
         BCS   L02A759
         RTS

L02A7A1  DW    $0003      ; Parms for SetMark
L02A7A3  DW    $0000      ;  ref num
         DW    $0002      ;  base
L02A7A7  ADRL  $00000000  ;  displacement
L02A7AB  PEA   ^L02A7BE
         PEA   L02A7BE
         PEA   $2012      ; Read
         JSL   GSOS2
         BCS   L02A759
         LDA   L02A7CE
         RTS

L02A7BE  DW    $0004      ; Parms for Read
L02A7C0  DW    $0000      ;  ref num
         ADRL  L02A7CE    ;  buffer ptr
         ADRL  $00000001  ;  request count
         ADRL  $00000000  ;  transfer count
L02A7CE  DW    $0000

L02A7D0  PEA   ^L02A7E3
         PEA   L02A7E3
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L02A7E2
         BRL   L02A759
L02A7E2  RTS

L02A7E3  DW    $0004      ; Parms for Read
L02A7E5  DW    $0000      ;  ref num
         ADRL  L02A7F3    ;  buffer ptr
         ADRL  $00000004  ;  request count
         ADRL  $00000000  ;  transfer count
L02A7F3  DW    $0000
L02A7F5  DW    $0000

L02A7F7  PEA   ^L02A80A
         PEA   L02A80A
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L02A809
         BRL   L02A759
L02A809  RTS

L02A80A  DW    $0004      ; Parms for Read
L02A80C  DW    $0000      ;  ref num
L02A80E  ADRL  $00000000  ;  buffer ptr
L02A812  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02A81A  PEA   ^L02A82D
         PEA   L02A82D
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L02A82C
         BRL   L02A759
L02A82C  RTS

L02A82D  DW    $0004      ; Parms for Read
L02A82F  DW    $0000      ;  ref num
L02A831  ADRL  $00000000  ;  buffer ptr
L02A835  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02A83D  PEA   ^L02A863
         PEA   L02A863
         PEA   $2012      ; Read
         JSL   GSOS2
         BCC   L02A84F
         BRL   L02A759
L02A84F  SEP   #$30
         LDX   L02A873
L02A854  LDA   L02A873,X
         ORA   #$80
         STA   L02A873,X
         DEX
         BNE   L02A854
         REP   #$30
         CLC
         RTS

L02A863  DW    $0004      ; Parms for Read
L02A865  DW    $0000      ;  ref num
         ADRL  L02A874    ;  buffer ptr
L02A86B  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L02A873  DB    $00
L02A874  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L02A893  DB    $00
         DB    $00
L02A895  DB    $00
         DB    $00
L02A897  DB    $00
         DB    $00
L02A899  DB    $00
         DB    $00
L02A89B  DB    $00
         DB    $00
L02A89D  DB    $00
         DB    $00
L02A89F  DB    $00
         DB    $00
L02A8A1  DB    $00
         DB    $00

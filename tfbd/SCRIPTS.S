
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

	mx	%00
	rel
	lst	off

*-----------------------

	use	4/Mem.Macs
	use	4/Util.Macs

	use	SCRIPTS.E
	use	SCRIPTS.X
	
*-----------------------

L050000  DB    $00
         DB    $00
L050002  DB    $00
         DB    $00
L050004  DB    $00
         DB    $00
L050006  DB    $00
         DB    $00
L050008  DB    $00
         DB    $00
L05000A  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L050028  DB    $00
         DB    $00
L05002A  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L050090  DB    $00
L050091  DB    $00
L050092  DB    $00
L050093  DB    $00
L050094  DB    $00
         DB    $00
L050096  DB    $00
         DB    $00
L050098  DB    $00
         DB    $00
L05009A  ADRL  L0500AA
         ADRL  L040326
         ADRL  L0500D3
	 ADRL  $00000000

L0500AA  ASC   "END"
         ASC   'S'
         ASC   "I"
         ASC   'F'
         ASC   "ELS"
         ASC   'E'
         ASC   "FI"
         ASC   'N'
         ASC   "G"
         ASC   'O'
         ASC   "SCRIP"
         ASC   'T'
         ASC   "EXE"
         ASC   'C'
         ASC   "O"
         ASC   'N'
         ASC   "REC"
         ASC   'T'
         ASC   "CLEA"
         ASC   'R'
         ASC   "ECH"
         ASC   'O'00

L0500D3  ASC   "M"
         ASC   'X'
         ASC   "OR"
         ASC   'G'
         ASC   "RE"
         ASC   'L'
         ASC   "ERE"
         ASC   'L'
         ASC   "DB"
         ASC   'R'
         ASC   "OF"
         ASC   'F'
         ASC   "CO"
         ASC   'M'00

L0500E9  DB    $00
         DB    $00
L0500EB  DB    $00
         DB    $00
L0500ED  DB    $00
         DB    $00
L0500EF  DB    $00
         DB    $00
L0500F1  DB    $00
L0500F2  DB    $00

L0500F3  DW    $0002      ; Parms for ExpandPath
L0500F5  ADRL  $00000000  ;  path name
         ADRL  L050141    ;  new pathname

L0500FD  DW    $0009      ; Parms for GetFileInfo
         ADRL  L050143    ;  file name
         DW    $0000      ;  access
         DW    $0000      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    8          ;  creation date
         DS    8          ;  modification date
         ADRL  $00000000  ;  option list
L050121  ADRL  $00000000  ;  end of file

L050125  DW    $0002      ; Parms for Open
L050127  DW    $0000      ;  ref num
         ADRL  L050143    ;  path name

L05012D  DW    $0004      ; Parms for Read
L05012F  DW    $0000      ;  ref num
L050131  ADRL  $00000000  ;  buffer ptr
L050135  ADRL  $00000000  ;  request count
L050139  ADRL  $00000000  ;  transfer count

L05013D  DW    $0001      ; Parms for Close
L05013F  DW    $0000      ;  ref num
L050141  DB    $00
         DB    $01
L050143  ENT
         DB    $00
         DB    $00
L050145  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L050245  PHP
         REP   #$30
         LDA   $D0
         ORA   $D2
         BEQ   L050260
         LDY   #$0002
         LDA   [$D0]
         STA   $D4
         LDA   [$D0],Y
         STA   $D6
         ORA   $D4
         BEQ   L050260
         PLP
         CLC
         RTS

L050260  PLP
         SEC
         RTS

L050263  PHP
         REP   #$30
         LDA   $E0
         ORA   $E2
         BEQ   L05027E
         LDY   #$0002
         LDA   [$E0]
         STA   $E4
         LDA   [$E0],Y
         STA   $E6
         ORA   $E4
         BEQ   L05027E
         PLP
         CLC
         RTS

L05027E  PLP
         SEC
         RTS

L050281  BRK   $00
L050283  PHP
         REP   #$30
         LDA   $D0
         ORA   $D2
         BEQ   L050299
         LDY   #$0004
         LDA   [$D0],Y
         ORA   #$8000
         STA   [$D0],Y
         DEC   L050281
L050299  PLP
         RTS

         PHP
         REP   #$30
         LDA   $D0
         ORA   $D2
         BEQ   L0502B3
         INC   L050281
         BNE   L0502B3
         LDY   #$0004
         LDA   [$D0],Y
         AND   #$7FFF
         STA   [$D0],Y
L0502B3  PLP
         RTS

L0502B5  PHP
         REP   #$30
         LDA   $E2
         ORA   $E0
         BEQ   L0502D0
         PEI   $E2
         PEI   $E0
         _DisposeHandle
         STZ   $E2
         STZ   $E0
         STZ   L0500E9
L0502D0  PLP
         CLC
         RTS

L0502D3  PHP
         SEP   #$20
         REP   #$10
         LDY   #$FFFF
L0502DB  INY
         LDA   [$DC],Y
         BEQ   L050309
         AND   #$7F
         CMP   #$0D
         BNE   L0502DB
L0502E6  INY
         LDA   [$DC],Y
         AND   #$7F
         CMP   #$0D
         BEQ   L0502E6
         CMP   #$2A
         BEQ   L0502DB
         CMP   #$3B
         BEQ   L0502DB
         REP   #$20
         TYA
         CLC
         ADC   $DC
         STA   $DC
         LDA   #$0000
         ADC   $DE
         STA   $DE
         PLP
         CLC
         RTS

L050309  PLP
         SEC
         RTS

L05030C  PHP
         REP   #$30
         LDA   $E2
         ORA   $E0
         BNE   L05031E
         JSR   L050379
         BCS   L050376
         STX   $E0
         STY   $E2
L05031E  LDY   #$0002
         LDA   [$E0]
         STA   $E4
         LDA   [$E0],Y
         STA   $E6
L050329  LDX   #$00FF
         LDY   #$0002
L05032F  LDA   [$E4]
         ORA   [$E4],Y
         BEQ   L050363
         CLC
         LDA   #$0004
         ADC   $E4
         STA   $E4
         LDA   #$0000
         ADC   $E6
         STA   $E6
         DEX
         BNE   L05032F
         LDA   [$E4]
         ORA   [$E4],Y
         BEQ   L050366
L05034D  LDA   [$E4]
         PHA
         LDA   [$E4],Y
         STA   $E6
         PLA
         STA   $E4
         LDA   [$E4]
         PHA
         LDA   [$E4],Y
         STA   $E6
         PLA
         STA   $E4
         BRA   L050329
L050363  PLP
         CLC
         RTS

L050366  JSR   L050379
         BCS   L050376
         TXA
         STA   [$E4]
         TYA
         LDY   #$0002
         STA   [$E4],Y
         BRA   L05034D
L050376  PLP
         SEC
         RTS

L050379  PHA
         PHA
         PEA   $0000
         PEA   $0400
         LDA   $FE
         ORA   #$0400
         PHA
         PEA   $0008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCS   L0503C4
         PHP
         PHY
         PHX
         PEI   $00
         PEI   $02
         STX   $00
         STY   $02
         LDY   #$0002
         LDA   [$00]
         PHA
         LDA   [$00],Y
         STA   $02
         PLA
         STA   $00
         LDY   #$03FE
         LDA   #$0000
L0503B5  STA   [$00],Y
         DEY
         DEY
         BPL   L0503B5
         PLA
         STA   $02
         PLA
         STA   $00
         PLX
         PLY
         PLP
L0503C4  RTS

L0503C5  PHP
         REP   #$30
         JSR   L0502B5
         JSR   L050245
         LDA   $D6
         STA   $DE
         LDA   $D4
         STA   $DC
L0503D6  LDY   #$0000
         SEP   #$20
         LDA   [$DC],Y
         AND   #$5F
         CMP   #$41
         BCC   L0503E7
         CMP   #$5B
         BCC   L0503EE
L0503E7  JSR   L0502D3
         BCC   L0503D6
         PLP
         RTS

L0503EE  INY
         LDA   [$DC],Y
         AND   #$7F
         CMP   #$20
         BEQ   L05040F
         CMP   #$5F
         BEQ   L0503EE
         CMP   #$30
         BCC   L0503E7
         CMP   #$3A
         BCC   L0503EE
         AND   #$5F
         CMP   #$41
         BCC   L0503E7
         CMP   #$5B
         BCC   L0503EE
         BRA   L0503E7
L05040F  STY   L050492
         INY
         LDX   #$0000
L050416  LDA   [$DC],Y
         AND   #$5F
         CMP   L05048C,X
         BNE   L0503E7
         INY
         INX
         CPX   #$0006
         BCC   L050416
         JSR   L05030C
         REP   #$20
         PHA
         PHA
         PEA   $0000
         LDA   L050492
         INC
         PHA
         LDA   $FE
         ORA   #$0400
         PHA
         PEA   $0008
         PHA
         PHA
         _NewHandle
         PLA
         STA   $00
         STA   [$E4]
         LDY   #$0002
         PLA
         STA   $02
         STA   [$E4],Y
         LDA   [$00]
         PHA
         LDA   [$00],Y
         STA   $02
         PLA
         STA   $00
         SEP   #$20
         LDY   #$0000
L050463  LDA   [$DC],Y
         AND   #$7F
         INY
         STA   [$00],Y
         DEC   L050492
         BNE   L050463
         TYA
         STA   [$00]
         REP   #$20
         LDY   #$0004
         SEC
         LDA   $DC
         SBC   $D4
         STA   [$E4],Y
         INY
         INY
         LDA   $DE
         SBC   $D6
         STA   [$E4],Y
         INC   L0500E9
         BRL   L0503E7

L05048C  ASC   'SCRIPT'

L050492  DW    $0000

L050494  PHP
         REP   #$30
         JSR   L050263
         BCS   L050513
L05049C  LDX   #$00FF
L05049F  LDY   #$0002
         LDA   [$E4]
         STA   $00
         LDA   [$E4],Y
         STA   $02
         ORA   $00
         BEQ   L050513
         LDA   [$00]
         PHA
         LDA   [$00],Y
         STA   $02
         PLA
         STA   $00
         LDA   [$DC]
         AND   #$00FF
         TAY
         SEP   #$20
L0504C0  LDA   [$DC],Y
         EOR   [$00],Y
         AND   #$7F
         BNE   L0504E5
         DEY
         BPL   L0504C0
         REP   #$20
         JSR   L050245
         CLC
         LDY   #$0004
         LDA   [$E4],Y
         ADC   $D4
         STA   $D4
         INY
         INY
         LDA   [$E4],Y
         ADC   $D6
         STA   $D6
         PLP
         CLC
         RTS

L0504E5  REP   #$20
         CLC
         LDA   #$0008
         ADC   $E4
         STA   $E4
         BCC   L0504F3
         INC   $E5
L0504F3  DEX
         BNE   L05049F
         LDY   #$0002
         LDA   [$E4]
         PHA
         LDA   [$E4],Y
         STA   $E6
         PLA
         STA   $E4
         ORA   $E6
         BEQ   L050513
         LDA   [$E4]
         PHA
         LDA   [$E4],Y
         STA   $E6
         PLA
         STA   $E4
         BRA   L05049C
L050513  PLP
         SEC
         RTS

L050516  PHP
         REP   #$30
         LDA   $D2
         ORA   $D0
         BEQ   L05052E
         PEI   $D2
         PEI   $D0
         _DisposeHandle
         STZ   $D2
         STZ   $D0
L05052E  JSR   L0502B5
         STZ   L050281
         PLP
         CLC
         RTS

L050537  ENT
         PHP
         REP   #$30
         LDA   $FE
         ORA   #$0400
         PHA
         _DisposeAll
         STZ   $D8
         PLP
         CLC
         RTL

L05054C  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STA   L0500F5
         STY   L0500F5+2
         ORA   L0500F5+2
         BEQ   L05056C
         JSL   GSOS
         DW    $200E      ; ExpandPath
         ADRL  L0500F3
         BCC   L05056C
         BRL   L050636
L05056C  JSL   GSOS
         DW    $2006      ; GetFileInfo
         ADRL  L0500FD
         BCC   L05057B
         BRL   L050636
L05057B  LDA   L050121
         ORA   L050121+2
         BNE   L050586
         BRL   L050623
L050586  LDX   L050121
         STX   L050135
         LDY   L050121+2
         BEQ   L050594
         STY   L050135+2
L050594  JSR   L050516
         JSR   L0518AD
         BCC   L05059F
         BRL   L050633
L05059F  STX   $D0
         STY   $D2
         JSR   L050245
         BCC   L0505AB
         BRL   L050633
L0505AB  LDA   $D4
         STA   L050131
         LDA   $D6
         STA   L050131+2
         JSL   GSOS
         DW    $2010      ; Open
         ADRL  L050125
         BCC   L0505C4
         BRL   L050636
L0505C4  LDA   L050127
         STA   L05012F
         STA   L05013F
         JSL   GSOS
         DW    $2012      ; Read
         ADRL  L05012D
         BCC   L0505DE
         CMP   #$004C
         BNE   L050627
L0505DE  JSL   GSOS
         DW    $2014      ; Close
         ADRL  L05013D
         LDA   L050139
         STA   L050121
         LDA   L050139+2
         STA   L050121+2
         LDY   L050121+2
         LDX   L050121
         INX
         STX   $D8
         STY   $DA
         JSR   L050245
         LDY   #$0000
L050605  LDA   [$D4],Y
         AND   #$7F7F
         STA   [$D4],Y
         INY
         INY
         BNE   L050605
         LDY   $D8
         DEY
         LDA   #$0000
         STA   [$D4],Y
         JSR   L0503C5
         LDY   #$0004
         LDA   #$0008
         STA   [$D0],Y
L050623  PLP
         CLC
         PLB
         RTL

L050627  PHA
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L05013D
         PLA
L050633  LDA   #$0000
L050636  PLP
         SEC
         PLB
         RTL

L05063A  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STZ   L0500F1
         LDAL  $E0C025
         AND   #$0002
         BEQ   L050654
         SEC
         ROR   L0500F1
         JSL   L0300D1
L050654  STZ   L050006
         LDA   $3E
         STA   L050004
         BNE   L050661
         INC   L050006
L050661  STZ   L050000
         LDA   $42
         STA   L050002
         STZ   L05000A
         LDAL  L0283E4
         STA   L050008
         LDA   $06,S
         STA   L050028
         LDA   $08,S
         STA   L05002A
         LDA   $0A,S
         STA   $DC
         LDA   $0C,S
         STA   $DE
         LDA   $04,S
         STA   $0C,S
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         TSC
         CLC
         ADC   #$0008
         TCS
         JSR   L050283
         LDA   [$DC]
         CMP   #$2A01
         BNE   L0506BA
         JSL   L05171C
         BCS   L0506DF
         PHX
         JSR   L050245
         PLA
         CLC
         ADC   $D4
         STA   $D4
         LDA   #$0000
         ADC   $D6
         STA   $D6
         BRA   L0506BF
L0506BA  JSR   L050494
         BCS   L0506E3
L0506BF  LDA   $D6
         STA   $DE
         LDA   $D4
         STA   $DC
         STZ   L0500ED
L0506CA  JSR   L050B55
         BCS   L0506E3
         BVS   L0506DF
         JSL   L03059F
         BCS   L0506CA
         AND   #$00FF
         CMP   #$0083
         BNE   L0506CA
L0506DF  PLP
         CLC
         PLB
         RTL

L0506E3  PLP
         SEC
         PLB
         RTL

L0506E7  PHP
         REP   #$30
         STZ   L05079A
         LDA   [$DC]
         AND   #$007F
         CMP   #$002D
         BNE   L050705
         STZ   L050094
         STZ   L050096
         LDA   #$0002
         STA   L05079A
         BRA   L050781
L050705  LDA   L05079A
         PHA
         JSR   L05097D
         PLA
         STA   L05079A
         BCS   L05078D
         BNE   L050790
L050714  LDA   L050092
         STA   L050096
         LDA   L050090
         STA   L050094
         SEP   #$20
         LDA   [$DC]
         AND   #$7F
         BEQ   L05078A
         CMP   #$0D
         BEQ   L05078A
         CMP   #$2C
         BEQ   L05078A
         CMP   #$2E
         BEQ   L05078A
         CMP   #$20
         BEQ   L05078A
         CMP   #$3B
         BEQ   L05078A
         CMP   #$5D
         BNE   L050743
         BRL   L050920
L050743  CMP   #$5E
         BNE   L05074A
         BRL   L05093F
L05074A  STA   L050799
         CMP   #$3C
         BNE   L05076B
         LDY   #$0001
         LDA   [$DC],Y
         AND   #$7F
         CMP   #$3E
         BNE   L05076B
         LDA   #$0B
         STA   L05079A
         REP   #$20
         INC   $DC
         BNE   L050769
         INC   $DE
L050769  BRA   L050781
L05076B  LDX   #$0000
L05076E  LDA   L05079C,X
         BEQ   L05078D
         CMP   L050799
         BEQ   L05077B
         INX
         BRA   L05076E
L05077B  INX
         STX   L05079A
         REP   #$20
L050781  INC   $DC
         BNE   L050787
         INC   $DE
L050787  BRL   L050705
L05078A  PLP
         CLC
         RTS

L05078D  PLP
         SEC
         RTS

L050790  DEC
         ASL
         TAX
         STZ   L05079A
         JMP   (L0507A8,X)

L050799  DB    $00
L05079A  DB    $00
         DB    $00

L05079C  ASC   '+-*/_&!<>=~'00

L0507A8  DA    L050821	; +
         DA    L050837	; -
         DA    L05084D	; *
         DA    L05088B	; /
         DA    L0508E1	; _
         DA    L0508F6	; &
         DA    L05090B	; !
         DA    L0507BE	; <
         DA    L0507E3	; >
         DA    L0507F5	; =
         DA    L05080B	; ~

L0507BE  LDA   L050096
         CMP   L050092
         BCC   L0507DB
         LDA   L050094
         CMP   L050090
         BCC   L0507DB
L0507CE  LDA   #$0000
         TAY
L0507D2  STA   L050090
         STY   L050092
         BRL   L050714
L0507DB  LDA   #$0001
         LDY   #$0000
         BRA   L0507D2
L0507E3  LDA   L050092
         CMP   L050096
         BCC   L0507DB
         LDA   L050090
         CMP   L050094
         BCC   L0507DB
         BRA   L0507CE
L0507F5  LDA   L050092
         EOR   L050096
         PHA
         LDA   L050090
         EOR   L050094
         ORA   $01,S
         STA   $01,S
         PLA
         BEQ   L0507DB
         BRA   L0507CE
L05080B  LDA   L050092
         EOR   L050096
         PHA
         LDA   L050090
         EOR   L050094
         ORA   $01,S
         STA   $01,S
         PLA
         BEQ   L0507CE
         BRA   L0507DB
L050821  CLC
         LDA   L050090
         ADC   L050094
         STA   L050090
         LDA   L050092
         ADC   L050096
         STA   L050092
         BRL   L050714
L050837  SEC
         LDA   L050094
         SBC   L050090
         STA   L050090
         LDA   L050096
         SBC   L050092
         STA   L050092
         BRL   L050714
L05084D  LDA   L050092
         STA   L0508DB
         LDA   L050090
         STA   L0508D9
         STZ   L050092
         STZ   L050090
         LDX   #$0020
L050862  DEX
         BPL   L050868
         BRL   L050714
L050868  ASL   L050090
         ROL   L050092
         ASL   L050094
         ROL   L050096
         BCC   L050862
         CLC
         LDA   L0508D9
         ADC   L050090
         STA   L050090
         LDA   #$0000
         ADC   L050092
         STA   L050092
         BRA   L050862
L05088B  LDA   L050090
         STA   L0508D9
         LDA   L050092
         STA   L0508DB
         STZ   L0508DD
         STZ   L0508DF
         LDX   #$0020
L0508A0  DEX
         BPL   L0508A6
         BRL   L050714
L0508A6  ASL   L050094
         ROL   L050096
         ROL   L0508DD
         ROL   L0508DF
         LDA   L0508DF
         CMP   L0508DB
         BCC   L0508D1
         LDA   L0508DD
         CMP   L0508D9
         BCC   L0508D1
         SBC   L0508D9
         STA   L0508DD
         LDA   L0508DF
         SBC   L0508DB
         STA   L0508DF
L0508D1  ROL   L050090
         ROL   L050092
         BRA   L0508A0
L0508D9  DB    $00
         DB    $00
L0508DB  DB    $00
         DB    $00
L0508DD  DB    $00
         DB    $00
L0508DF  DB    $00
         DB    $00
L0508E1  LDA   L050090
         ORA   L050094
         STA   L050090
         LDA   L050092
         ORA   L050096
         STA   L050092
         BRL   L050714
L0508F6  LDA   L050090
         AND   L050094
         STA   L050090
         LDA   L050092
         AND   L050096
         STA   L050092
         BRL   L050714
L05090B  LDA   L050090
         EOR   L050094
         STA   L050090
         LDA   L050092
         EOR   L050096
         STA   L050092
         BRL   L050714
L050920  REP   #$20
         LDA   L0500EB
         BNE   L05092A
         BRL   L05078D
L05092A  LDY   L050090
         LDA   [$3A],Y
         STA   L050090
         INY
         INY
         LDA   [$3A],Y
         STA   L050092
         PLP
         CLC
         RTS

         PLP
         SEC
         RTS

L05093F  REP   #$30
         PEI   $42
         LDA   L050090
         PHA
         PEA   ^L050973
         PEA   L050973
         JSL   L045089
         BCS   L05096A
         LDA   L050973
         CMP   #$0003
         BCS   L05096A
         LDA   L050979
         STA   L050090
         LDA   L05097B
         STA   L050092
         PLP
         CLC
         RTS

L05096A  STZ   L050090
         STZ   L050092
         PLP
         CLC
         RTS

L050973  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L050979  DB    $00
         DB    $00
L05097B  DB    $00
         DB    $00
L05097D  PHP
         REP   #$30
         JSR   L050A27
         BCC   L050988
         BRL   L050A24
L050988  SEP   #$20
         LDA   [$DC]
         AND   #$7F
         CMP   #$7C
         BEQ   L050995
         PLP
         CLC
         RTS

L050995  REP   #$20
         INC   $DC
         BNE   L05099D
         INC   $DE
L05099D  LDA   [$DC]
         AND   #$007F
         CMP   #$0042
         BNE   L0509AF
         INC   $DC
         BNE   L0509AD
         INC   $DE
L0509AD  BRA   L050A0B
L0509AF  CMP   #$0057
         BNE   L0509BC
         INC   $DC
         BNE   L0509BA
         INC   $DE
L0509BA  BRA   L050A13
L0509BC  CMP   #$0041
         BNE   L0509DB
         INC   $DC
         BNE   L0509C7
         INC   $DE
L0509C7  LDA   L050092
         PHA
         LDA   L050090
         PHA
         JSL   L042ABB
         STY   L050092
         STA   L050090
         BRA   L050988
L0509DB  LDA   L050092
         PHA
         LDA   L050090
         PHA
         JSR   L050A27
         BCS   L050A24
         LDX   L050090
         PLA
         STA   L050090
         PLA
         STA   L050092
         BCS   L050A24
         TXA
         BEQ   L050A24
         CMP   #$0005
         BCS   L050A24
         DEC
         ASL
         TAX
         JMP   (L050A03,X)

L050A03  DA    L050A0B
         DA    L050A13
         DA    L050A1C
         DA    L050988
L050A0B  LDX   #$0000
         STX   L050091
         BRA   L050A16
L050A13  LDX   #$0000
L050A16  STX   L050092
         BRL   L050988
L050A1C  SEP   #$20
         STZ   L050093
         BRL   L050988
L050A24  PLP
         SEC
         RTS

L050A27  PHP
         SEP   #$20
         REP   #$10
         LDA   [$DC]
         AND   #$7F
         CMP   #$30
         BCC   L050A40
         CMP   #$47
         BCS   L050A40
         CMP   #$41
         BCS   L050A71
         CMP   #$3A
         BCC   L050A71
L050A40  PHA
         REP   #$20
         LDA   L050A67
         AND   #$00FF
         TAX
         SEP   #$20
         PLA
L050A4D  CMP   L050A67,X
         BEQ   L050A58
         DEX
         BNE   L050A4D
         PLP
         SEC
         RTS

L050A58  REP   #$20
         INC   $DC
         BNE   L050A60
         INC   $DE
L050A60  DEX
         TXA
         ASL
         TAX
         JMP   (L050A6B,X)

L050A67  DB    $03
         DB    $40
         DB    $24
         DB    $5B
L050A6B  DA    L050AC9
         DA    L050A71
         DA    L050B33
L050A71  REP   #$20
         JSR   L050A9A
         BCS   L050AB3
         STA   L050090
         STZ   L050092
L050A7E  JSR   L050A9A
         BCS   L050A97
         XBA
         ASL
         ASL
         ASL
         ASL
         LDX   #$0004
L050A8B  ASL
         ROL   L050090
         ROL   L050092
         DEX
         BNE   L050A8B
         BRA   L050A7E
L050A97  PLP
         CLC
         RTS

L050A9A  PHP
         SEP   #$20
         REP   #$10
         LDA   [$DC]
         AND   #$7F
         CMP   #$30
         BCC   L050AB3
         CMP   #$47
         BCS   L050AB3
         CMP   #$3A
         BCC   L050ABB
         CMP   #$41
         BCS   L050AB6
L050AB3  PLP
         SEC
         RTS

L050AB6  SEC
         SBC   #$37
         BRA   L050ABE
L050ABB  SEC
         SBC   #$30
L050ABE  REP   #$20
         INC   $DC
         BNE   L050AC6
         INC   $DE
L050AC6  PLP
         CLC
         RTS

L050AC9  LDA   [$DC]
         AND   #$007F
         CMP   #$0030
         BCC   L050AB3
         CMP   #$005B
         BCS   L050AB3
         CMP   #$003A
         BCC   L050AF7
         CMP   #$0041
         BCC   L050AB3
         SEC
         SBC   #$0041
         ASL
         ASL
         TAX
         LDA   L050028,X
         STA   L050090
         LDA   L05002A,X
         STA   L050092
         BRA   L050B0A
L050AF7  SEC
         SBC   #$0030
         ASL
         ASL
         TAX
         LDA   L050000,X
         STA   L050090
         LDA   L050002,X
         STA   L050092
L050B0A  SEP   #$20
         LDY   #$0000
L050B0F  INY
         LDA   [$DC],Y
         AND   #$5F
         CMP   #$30
         BCC   L050B24
         CMP   #$5B
         BCS   L050B24
         CMP   #$41
         BCS   L050B0F
         CMP   #$3A
         BCC   L050B0F
L050B24  REP   #$20
         TYA
         CLC
         ADC   $DC
         STA   $DC
         BCC   L050B30
         INC   $DD
L050B30  PLP
         CLC
         RTS

L050B33  INC   L0500EB
         LDA   L050096
         PHA
         LDA   L050094
         PHA
         JSR   L0506E7
         PLA
         STA   L050094
         PLA
         STA   L050096
         INC   $DC
         BNE   L050B4F
         INC   $DE
L050B4F  DEC   L0500EB
         PLP
         CLC
         RTS

L050B55  PHP
         SEP   #$20
         REP   #$10
         BIT   L0500F2
         BPL   L050B71
         JSR   L0513FA
L050B62  JSL   L03059F
         BCS   L050B62
         CMP   #$83
         BNE   L050B71
         PLP
         CLC
         SEP   #$40
         RTS

L050B71  JSR   L050D7B
         CMP   #$00
         BEQ   L050BAA
         CMP   #$0D
         BEQ   L050B9E
         CMP   #$3A
         BEQ   L050B94
         CMP   #$5F
         BEQ   L050B94
         CMP   #$20
         BEQ   L050B94
         CMP   #$40
         BEQ   L050BAF
         CMP   #$41
         BCC   L050BA7
         CMP   #$5B
         BCS   L050BA7
L050B94  JSR   L050D4A
         JSR   L050C66
         BCS   L050BA7
         BVS   L050BA3
L050B9E  JSR   L0502D3
         BCS   L050BAA
L050BA3  PLP
         CLC
         CLV
         RTS

L050BA7  PLP
         SEC
         RTS

L050BAA  PLP
         CLC
         SEP   #$40
         RTS

L050BAF  LDA   L0500ED
         BEQ   L050BBC
         LDA   L0500EF
         BNE   L050BBC
         BRL   L050B9E
L050BBC  JSR   L050D7B
         CMP   #$41
         BCC   L050BF0
         CMP   #$5B
         BCS   L050BF0
         SEC
         SBC   #$41
         ASL
         ASL
         STA   L050098
         JSR   L050D4A
         JSR   L050D7B
         CMP   #$3D
         BNE   L050BF0
         JSR   L050D4A
         JSR   L0506E7
         BCS   L050BF0
         JSR   L050D7B
         CMP   #$00
         BEQ   L050BF3
         CMP   #$0D
         BEQ   L050BF3
         CMP   #$20
         BEQ   L050BF3
L050BF0  PLP
         SEC
         RTS

L050BF3  REP   #$20
         LDX   L050098
         LDA   L050092
         STA   L05002A,X
         LDA   L050090
         STA   L050028,X
         BRL   L050B9E
L050C07  LDA   L0500ED
         BEQ   L050C14
         LDA   L0500EF
         BNE   L050C14
         BRL   L050C7B
         MX    %11
L050C14  JSR   L050D7B
         JSR   L050D7B
         CMP   #$41
         BCC   L050BF0
         CMP   #$5B
         BCS   L050BF0
         SEC
         SBC   #$41
         ASL
         ASL
         STA   L050098
         JSR   L050D7B
         CMP   #$3D
         BNE   L050BF0
         LDA   [$DC]
         AND   #$7F
         CMP   #$20
         BNE   L050C3C
         JSR   L050D4A
L050C3C  JSR   L0506E7
         BCS   L050BF0
         JSR   L050D7B
         CMP   #$00
         BEQ   L050BF3
         CMP   #$0D
         BEQ   L050C53
         CMP   #$20
         BEQ   L050C53
         PLP
         SEC
         RTS

L050C53  REP   #$20
         LDX   L050098
         LDA   L050092
         STA   L05002A,X
         LDA   L050090
         STA   L050028,X
         BRA   L050C7B
L050C66  PHP
         SEP   #$20
         LDA   [$DC]
         AND   #$7F
         BEQ   L050C7B
         CMP   #$40
         BEQ   L050C07
         CMP   #$0D
         BEQ   L050C7B
         CMP   #$3B
         BNE   L050C7F
L050C7B  PLP
         CLC
         CLV
         RTS

L050C7F  REP   #$30
         LDX   #$0000
L050C84  LDA   L05009A+2,X
         STA   $02
         LDA   L05009A,X
         STA   $00
         ORA   $02
         BEQ   L050CB4
         PHX
         JSR   L050CB7
         PLX
         BCC   L050C9F
         INX
         INX
         INX
         INX
         BRA   L050C84
L050C9F  LDA   L050CF8+2,X
         STA   $02
         LDA   L050CF8,X
         STA   $00
         TYA
         ASL
         TAY
         LDA   [$00],Y
         DEC
         PHA
         JSR   L050D4A
         RTS

L050CB4  PLP
         SEC
         RTS

L050CB7  PHP
         SEP   #$20
         STZ   L050CF6
         LDX   #$0000
L050CC0  LDY   #$0000
L050CC3  PHY
         TXY
         LDA   [$00],Y
         PLY
         EOR   [$DC],Y
         AND   #$7F
         BEQ   L050CE4
         TXY
L050CCF  LDA   [$00],Y
         BPL   L050CD6
         INY
         BRA   L050CCF
L050CD6  INY
         LDA   [$00],Y
         BEQ   L050CE1
         TYX
         INC   L050CF6
         BRA   L050CC0
L050CE1  PLP
         SEC
         RTS

L050CE4  PHY
         TXY
         LDA   [$00],Y
         BPL   L050CEF
         PLY
         INY
         INX
         BRA   L050CC3
L050CEF  PLY
         LDY   L050CF6
         PLP
         CLC
         RTS

L050CF6  DW    $0000
L050CF8  ADRL  L050D04
         ADRL  L050D1A
         ADRL  L050D3C

L050D04  DA    L050DB5
         DA    L050DC1
         DA    L050DFE
         DA    L050E12
         DA    L050E20
         DA    L050EDC
         DA    L051564
         DA    L051623
         DA    L05166C
         DA    L05169F
         DA    L0516A2

L050D1A  DA    L050EE5
         DA    L050F06
         DA    L050F22
         DA    L050F3E
         DA    L050F5B
         DA    L050F7B
         DA    L050F9B
         DA    L051014
         DA    L051035
         DA    L051056
         DA    L051077
         DA    L0510B4
         DA    L0510BA
         DA    L0510C0
         DA    L0510C6
         DA    L0510E8
         DA    L05110C
L050D3C  DA    L05112C
         DA    L051132
         DA    L051269
         DA    L051186
         DA    L05118C
         DA    L051192
         DA    L0511B2
L050D4A  PHP
         SEP   #$20
         REP   #$10
         LDY   #$0000
L050D52  LDA   [$DC],Y
         AND   #$7F
         BEQ   L050D6C
         CMP   #$20
         BEQ   L050D63
         CMP   #$0D
         BEQ   L050D6C
         INY
         BRA   L050D52
L050D63  INY
         LDA   [$DC],Y
         AND   #$7F
         CMP   #$20
         BEQ   L050D63
L050D6C  REP   #$20
         TYA
         CLC
         ADC   $DC
         STA   $DC
         BCC   L050D78
         INC   $DD
L050D78  PLP
         CLC
         RTS

L050D7B  PHP
         REP   #$30
         LDA   [$DC]
         AND   #$007F
         BEQ   L050DA2
         CMP   #$000D
         BEQ   L050DA2
         CMP   #$0020
         BEQ   L050DA2
         CMP   #$0061
         BCC   L050D9C
         CMP   #$007B
         BCS   L050D9C
         AND   #$005F
L050D9C  INC   $DC
         BNE   L050DA2
         INC   $DE
L050DA2  PLP
         CLC
         RTS

L050DA5  LDA   L0500ED
         BEQ   L050DB4
         LDA   L0500EF
         BNE   L050DB4
         PLA
         PLP
         CLC
         CLV
         RTS
L050DB4  RTS

L050DB5  REP   #$20
         SEP   #$10
         PLX
         PLA
         PLX
         PLA
         PLP
         CLC
         PLB
         RTL

L050DC1  JSR   L0506E7
         BCC   L050DC9
         PLP
         SEC
         RTS

L050DC9  LDA   L050090
         ORA   L050092
         BEQ   L050DD4
         LDA   #$FFFF
L050DD4  STA   L0500EF
         LDA   #$FFFF
         STA   L0500ED
         LDA   [$DC]
         AND   #$007F
         CMP   #$002C
         BEQ   L050DEA
         BRL   L050EFF
L050DEA  INC   $DC
         BNE   L050DF0
         INC   $DE
L050DF0  STZ   L0500ED
         BIT   L0500EF
         BMI   L050DFB
         BRL   L050EFF
L050DFB  BRL   L050E20
L050DFE  LDA   L0500ED
         BNE   L050E06
         PLP
         SEC
         RTS

L050E06  LDA   #$FFFF
         EOR   L0500EF
         STA   L0500EF
         BRL   L050EFF
L050E12  LDA   L0500ED
         BNE   L050E1A
         PLP
         SEC
         RTS

L050E1A  STZ   L0500ED
         BRL   L050EFF
L050E20  JSR   L050DA5
         LDA   $DE
         STA   $02
         LDA   $DC
         STA   $00
         LDA   $D6
         STA   $DE
         LDA   $D4
         STA   $DC
         SEP   #$20
         LDA   [$00]
         AND   #$7F
         CMP   #$3A
         BEQ   L050E67
         REP   #$20
         JSR   L050245
         LDA   $D6
         STA   $DE
         LDA   $D4
         STA   $DC
         SEP   #$20
L050E4C  JSR   L0502D3
         LDA   [$DC]
         BEQ   L050E83
         JSR   L050EA6
         BCS   L050E4C
         REP   #$20
         LDA   $DE
         STA   $D6
         LDA   $DC
         STA   $D4
         PLP
         CLC
         SEP   #$40
         RTS

         MX    %11
L050E67  JSR   L0502D3
         LDA   [$DC]
         AND   #$7F
         CMP   #$3A
         BEQ   L050E86
         CMP   #$0D
         BEQ   L050E67
         CMP   #$40
         BEQ   L050E67
         CMP   #$20
         BNE   L050E83
         JSR   L050E90
         BCS   L050E67
L050E83  PLP
         SEC
         RTS

L050E86  JSR   L050EA6
         BCS   L050E67
         PLP
         CLC
         SEP   #$40
         RTS

         MX    %10
L050E90  JSR   L050D4A
         LDY   #$0003
L050E96  LDA   [$DC],Y
         AND   #$7F
         CMP   L050ED8,Y
         BNE   L050EA4
         DEY
         BPL   L050E96
         CLC
         RTS

L050EA4  SEC
         RTS

L050EA6  LDY   #$0000
L050EA9  LDA   [$00],Y
         JSR   L050EC4
         BCC   L050EB9
         EOR   [$DC],Y
         AND   #$7F
         BNE   L050EC0
         INY
         BRA   L050EA9
L050EB9  LDA   [$DC],Y
         JSR   L050EC4
         BCC   L050EC2
L050EC0  SEC
         RTS

L050EC2  CLC
         RTS

L050EC4  AND   #$7F
         BEQ   L050ED6
         CMP   #$20
         BEQ   L050ED6
         CMP   #$0D
         BEQ   L050ED6
         CMP   #$2C
         BEQ   L050ED6
         SEC
         RTS

L050ED6  CLC
         RTS

L050ED8  ASC   'ENDS'

         MX    %00

L050EDC  BRL   L050EFF

L050EDF  DB    $00
         DB    $00
L050EE1  DB    $00
         DB    $00
L050EE3  DB    $00
         DB    $00

L050EE5  JSR   L050DA5
         JSR   L0506E7
         BCS   L050F03
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0001
         PEA   $0000
         JSL   L043069
L050EFF  PLP
         CLC
         CLV
         RTS

L050F03  PLP
         SEC
         RTS

L050F06  JSR   L050DA5
         JSR   L0506E7
         BCS   L050F03
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L043069
         BRA   L050EFF
L050F22  JSR   L050DA5
         JSR   L0506E7
         BCS   L050F03
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0002
         PEA   $0002
         JSL   L043069
         BRA   L050EFF
L050F3E  JSR   L050DA5
         JSR   L0506E7
         BCS   L050F03
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0002
         PEA   $0003
         JSL   L043069
         BRL   L050EFF
L050F5B  JSR   L050DA5
         JSR   L0506E7
         BCC   L050F66
         BRL   L050F03
L050F66  LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0004
         PEA   $0004
         JSL   L043069
         BRL   L050EFF
L050F7B  JSR   L050DA5
         JSR   L0506E7
         BCC   L050F86
         BRL   L050F03
L050F86  LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0003
         PEA   $0005
         JSL   L043069
         BRL   L050EFF
L050F9B  JSR   L050DA5
         JSR   L0506E7
         BCC   L050FA6
         BRL   L050F03
L050FA6  LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $000A
         PEA   $0006
         JSL   L043069
         BRL   L050EFF
L050FBB  JSR   L0506E7
         BCS   L051012
         LDA   L050092
         STA   L050EE1
         LDA   L050090
         STA   L050EDF
         JSR   L050D7B
         CMP   #$002C
         BEQ   L051000
         CMP   #$000D
         BEQ   L05100A
         CMP   #$0000
         BEQ   L05100A
         CMP   #$002E
         BNE   L051012
         JSR   L0506E7
         LDA   L050092
         CMP   L050EE1
         BEQ   L050FF1
         BRL   L050F03
L050FF1  LDA   L050090
         SEC
         SBC   L050EDF
         BMI   L051012
         INC
         STA   L050EE3
         CLC
         RTS

L051000  JSR   L0506E7
         LDA   L050090
         STA   L050EE3
         RTS

L05100A  LDA   #$0001
         STA   L050EE3
         CLC
         RTS

L051012  SEC
         RTS

L051014  JSR   L050DA5
         JSR   L050FBB
         BCC   L05101F
         BRL   L050F03
L05101F  LDA   L050EE1
         PHA
         LDA   L050EDF
         PHA
         LDA   L050EE3
         PHA
         PEA   $0007
         JSL   L043069
         BRL   L050EFF
L051035  JSR   L050DA5
         JSR   L050FBB
         BCC   L051040
         BRL   L050F03
L051040  LDA   L050EE1
         PHA
         LDA   L050EDF
         PHA
         LDA   L050EE3
         PHA
         PEA   $0008
         JSL   L043069
         BRL   L050EFF
L051056  JSR   L050DA5
         JSR   L050FBB
         BCC   L051061
         BRL   L050F03
L051061  LDA   L050EE1
         PHA
         LDA   L050EDF
         PHA
         LDA   L050EE3
         PHA
         PEA   $0009
         JSL   L043069
         BRL   L050EFF
L051077  JSR   L050DA5
         JSR   L0506E7
         BCC   L051082
         BRL   L050F03
L051082  LDY   L050090
         SEP   #$20
         LDA   [$3A],Y
         AND   #$80
         STA   L0510B3
L05108E  INY
         LDA   [$3A],Y
         AND   #$80
         EOR   L0510B3
         BEQ   L05108E
         REP   #$20
         INY
         SEC
         SBC   L050090
         TAY
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         PHY
         PEA   $000A
         JSL   L043069
         BRL   L050EFF
L0510B3  DB    $00
L0510B4  JSR   L050DA5
         BRL   L050EFF
L0510BA  JSR   L050DA5
         BRL   L050EFF
L0510C0  JSR   L050DA5
         BRL   L050EFF
L0510C6  JSR   L050DA5
         JSR   L0506E7
         BCC   L0510D1
         BRL   L050F03
L0510D1  LDA   L050092
         PHA
         LDY   L050090
         PHY
         LDA   [$3A],Y
         INC
         INC
         PHA
         PEA   $000E
         JSL   L043069
         BRL   L050EFF
L0510E8  JSR   L050DA5
         JSR   L0506E7
         BCC   L0510F3
         BRL   L050F03
L0510F3  LDA   L050092
         PHA
         LDY   L050090
         PHY
         LDA   [$3A],Y
         AND   #$00FF
         INC
         PHA
         PEA   $000F
         JSL   L043069
         BRL   L050EFF
L05110C  JSR   L050DA5
         JSR   L0506E7
         BCC   L051117
         BRL   L050F03
L051117  LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0001
         PEA   $0010
         JSL   L043069
         BRL   L050EFF
L05112C  JSR   L050DA5
         BRL   L050EFF
L051132  JSR   L050DA5
         JSR   L0506E7
         BCC   L05113D
         BRL   L050F03
L05113D  JSR   L050D7B
         CMP   #$002C
         BNE   L051173
         LDA   L050090
         STA   L051182
         LDA   L050092
         STA   L051184
         JSR   L0506E7
         BCC   L051159
         BRL   L050F03
L051159  LDA   L051184
         PHA
         LDA   L051182
         PHA
         PEA   $0000
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         JSL   L042BC0
         BRL   L050EFF
L051173  LDA   L050092
         PHA
         LDA   L050090
         PHA
         JSL   L042C85
         BRL   L050EFF
L051182  DB    $00
         DB    $00
L051184  DB    $00
         DB    $00
L051186  JSR   L050DA5
         BRL   L050EFF
L05118C  JSR   L050DA5
         BRL   L050EFF
L051192  JSR   L050DA5
         JSR   L0506E7
         BCC   L05119D
         BRL   L050F03
L05119D  LDA   L050092
         PHA
         LDY   L050090
         PHY
         LDA   [$3A],Y
         PHA
         PEA   $0000
         JSL   L043813
         BRL   L050EFF
L0511B2  JSR   L050DA5
         JSR   L0506E7
         BCC   L0511BD
         BRL   L050F03
L0511BD  STZ   L05121F
         JSR   L050D7B
         CMP   #$002C
         BEQ   L0511CB
         BRL   L050F03
L0511CB  SEP   #$20
         LDA   [$DC]
         CMP   #$22
         BEQ   L0511D7
         CMP   #$27
         BNE   L0511DF
L0511D7  JSR   L050D7B
         ORA   #$80
         STA   L05121F
L0511DF  LDY   #$0000
L0511E2  LDA   [$DC],Y
         BEQ   L0511F6
         ORA   #$80
         CMP   #$8D
         BEQ   L0511F6
         STA   L051221,Y
         INY
         CPY   #$0049
         BCC   L0511E2
         DEY
L0511F6  LDA   L051220,Y
         CMP   L05121F
         BNE   L0511FF
         DEY
L0511FF  TYA
         STA   L051220
         BNE   L051208
         BRL   L050EFF
L051208  REP   #$20
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   ^L051220
         PEA   L051220
         JSL   L04386A
         BRL   L050EFF
L05121F  DB    $00
L051220  DB    $00
L051221  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L051269  JSR   L050DA5
         STZ   L0513BD
         STZ   L0513BF
         JSR   L0506E7
         BCC   L05127A
         BRL   L050F03
L05127A  LDA   L050090
         STA   L0513B7
         LDA   L050092
         STA   L0513B9
         JSR   L0513DA
         BCC   L05128E
         BRL   L050F03
L05128E  BVC   L051293
         BRL   L051316
L051293  JSR   L0506E7
         BCC   L05129B
         BRL   L050F03
L05129B  LDA   L050092
         BEQ   L0512A3
         BRL   L050EFF
L0512A3  LDA   L050090
         CMP   #$0005
         BCC   L0512AE
         BRL   L050EFF
L0512AE  CMP   #$0002
         BCS   L0512B6
         BRL   L050EFF
L0512B6  STA   L0513BB
         JSR   L0513DA
         BCC   L0512C1
         BRL   L050F03
L0512C1  BVC   L0512C6
         BRL   L05135E
L0512C6  JSR   L0506E7
         BCC   L0512CE
         BRL   L050F03
L0512CE  LDA   L050090
         STA   L0513BD
         JSR   L0513DA
         BCC   L0512DC
         BRL   L050F03
L0512DC  BVC   L0512E1
         BRL   L05135E
L0512E1  JSR   L0506E7
         BCC   L0512E9
         BRL   L050F03
L0512E9  LDA   L050090
         STA   L0513C1
         LDA   L050092
         STA   L0513C3
         JSR   L0513C5
         BCC   L0512FD
         BRL   L050F03
L0512FD  JSR   L0513DA
         BCC   L051305
         BRL   L050F03
L051305  JSR   L0506E7
         BCC   L05130D
         BRL   L050F03
L05130D  LDA   L050090
         STA   L0513BF
         BRL   L051390
L051316  LDA   L0513B9
         EOR   $42
         BEQ   L051320
         BRL   L050F03
L051320  LDA   L0513B7
         JSL   L0410BB
         BCC   L05132C
         BRL   L050F03
L05132C  BIT   #$8000
         BNE   L051348
         LDA   L0513B7
         INC   L0513B7
         JSL   L04037A
L05133B  CPY   #$0002
         BCS   L051343
         BRL   L050F03
L051343  STY   L0513BB
         BRA   L05135E
L051348  LDA   L0513B9
         PHA
         LDA   L0513B7
         PHA
         JSL   L04349E
         CPY   #$0005
         BCC   L05135C
         BRL   L050F03
L05135C  BRA   L05133B
L05135E  LDA   L0513B9
         EOR   $42
         BEQ   L051368
         BRL   L050F03
L051368  LDY   L0513B7
         LDA   [$3A],Y
         STA   L0513C1
         INY
         LDA   [$3A],Y
         STA   L0513C2
         LDY   L0513BB
         CPY   #$0002
         BNE   L05138D
         LDA   L0513B9
         PHA
         LDA   L0513B7
         PHA
         JSL   L042A5C
         STY   L0513C3
L05138D  JSR   L0513C5
L051390  LDA   L0513B9
         PHA
         LDA   L0513B7
         PHA
         LDA   L0513BB
         PHA
         SEP   #$20
         LDA   L0513BF
         PHA
         LDA   L0513BD
         PHA
         REP   #$20
         LDA   L0513C3
         PHA
         LDA   L0513C1
         PHA
         JSL   L043774
         BRL   L050EFF
L0513B7  DB    $00
         DB    $00
L0513B9  DB    $00
         DB    $00
L0513BB  DB    $00
         DB    $00
L0513BD  DB    $00
         DB    $00
L0513BF  DB    $00
         DB    $00
L0513C1  DB    $00
L0513C2  DB    $00
L0513C3  DB    $00
         DB    $00
L0513C5  LDA   L0513C3
         PHA
         LDA   L0513C1
         PHA
         JSL   L042ABB
         BCS   L0513D9
         STY   L0513C3
         STA   L0513C1
L0513D9  RTS

L0513DA  JSR   L050D7B
         CMP   #$002C
         BEQ   L0513F5
         CMP   #$0000
         BEQ   L0513F1
         CMP   #$0020
         BEQ   L0513F1
         CMP   #$000D
         BNE   L0513F8
L0513F1  SEP   #$40
         CLC
         RTS

L0513F5  CLV
         CLC
         RTS

L0513F8  SEC
         RTS

L0513FA  PHP
         REP   #$30
         JSR   L051408
         JSR   L05145A
         JSR   L051501
         PLP
         RTS

L051408  LDA   #$0000
L05140B  PHA
         PHA
         LDX   #$0006
         CMP   #$000D
         BCC   L05141B
         SBC   #$000D
         LDX   #$0014
L05141B  CLC
         ADC   #$0003
         TAY
         JSL   L0300E2
         LDA   #$00C0
         JSL   L03022D
         PLA
         PHA
         CLC
         ADC   #$00C1
         JSL   L03022D
         JSL   L0302E1
         STR   "= "
         PLA
         ASL
         ASL
         PHA
         TAX
         LDA   L05002A,X
         PHA
         JSL   L030670
         PLX
         LDA   L050028,X
         PHA
         JSL   L030670
         PLA
         INC
         CMP   #$001A
         BCC   L05140B
         RTS

L05145A  LDA   #$0000
L05145D  PHA
         PHA
         CLC
         ADC   #$0003
         TAY
         LDX   #$0028
         JSL   L0300E2
         LDA   #$00C0
         JSL   L03022D
         PLA
         PHA
         CLC
         ADC   #$00B0
         JSL   L03022D
         JSL   L0302E1
         STR   "= "
         PLA
         ASL
         ASL
         PHA
         TAX
         LDA   L050002,X
         PHA
         JSL   L030670
         PLX
         PHX
         LDA   L050000,X
         PHA
         JSL   L030670
         PLA
         LSR
         TAX
         LDA   L0514C3,X
         BEQ   L0514BB
         STA   L0514B1
         JSL   L0302E1
         STR   "  ("
         JSL   L030314
L0514B1  ADR   L0514B1
         LDA   #$00A9
         JSL   L03022D
L0514BB  PLA
         INC
         CMP   #$000A
         BCC   L05145D
         RTS

L0514C3  DA    L0514D7
         DA    L0514E5
         DA    L0514F4
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0514D7  STR   "Segment start"
L0514E5  STR   "Segment length"
L0514F4  STR   "Segment kind"
L051501  SEP   #$30
         JSL   L030035
         DB    $11
         DB    $14
         DB    $00
         DB    $4F
         JSL   L030139
         JSL   L030035
         DB    $02
         DB    $15
         DB    $00
         DB    $4F
         LDX   #$00
         LDY   #$14
         JSL   L0300E2
         LDY   #$00
L051521  LDA   [$DC],Y
         BEQ   L051559
         ORA   #$80
         CMP   #$8D
         BEQ   L051559
         PHY
         PHX
         PHA
         JSL   L03022D
         PLA
         PLX
         PLY
         CMP   #$A0
         BNE   L051554
         CPX   #$02
         BCS   L051554
         INX
         STY   L051560
         LDA   L051560,X
         CMP   L051560
         BCC   L051554
         PHY
         PHX
         TAX
         LDY   #$14
         JSL   L0300E2
         PLX
         PLY
L051554  INY
         CPY   #$4F
         BCC   L051521
L051559  JSL   L0300F7
         REP   #$30
         RTS

L051560  DB    $00
         DB    $0C
         DB    $16
         DB    $20
L051564  JSR   L050DA5
         SEP   #$20
         LDY   #$0000
L05156C  LDA   [$DC],Y
         AND   #$7F
         BEQ   L051580
         CMP   #$0D
         BEQ   L051580
         CMP   #$20
         BEQ   L051580
         STA   L05160F,Y
         INY
         BRA   L05156C
L051580  TYA
         STA   L05160E
         BNE   L051589
         BRL   L050F03
L051589  REP   #$30
         JSR   L050D4A
         JSR   L0506E7
         BCC   L05159F
         LDA   L050028
         STA   L050090
         LDA   L05002A
         STA   L050092
L05159F  SEP   #$30
         LDX   #$17
L0515A3  LDA   $D0,X
         PHA
         DEX
         BPL   L0515A3
         LDX   #$67
L0515AB  LDA   L050028,X
         PHA
         DEX
         BPL   L0515AB
         REP   #$30
         LDA   L0500ED
         PHA
         LDA   L0500F1
         PHA
         PEA   ^L05160E
         PEA   L05160E
         LDA   L050092
         PHA
         LDA   L050090
         PHA
         JSL   L05063A
         PHP
         SEP   #$20
         PLA
         STA   L05160D
         REP   #$20
         PLA
         STA   L0500F1
         PLA
         STA   L0500ED
         BEQ   L0515E7
         LDA   #$FFFF
         STA   L0500EF
L0515E7  SEP   #$30
         LDY   #$68
         LDX   #$00
L0515ED  PLA
         STA   L050028,X
         INX
         DEY
         BNE   L0515ED
         LDY   #$18
         LDX   #$00
L0515F9  PLA
         STA   $D0,X
         INX
         DEY
         BNE   L0515F9
         LDA   L05160D
         PHA
         PLP
         BCC   L05160A
         BRL   L050F03
L05160A  BRL   L050EFF
L05160D  DB    $00
L05160E  DB    $00
L05160F  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L051623  JSR   L050DA5
         JSR   L0506E7
         BCC   L05162E
         BRL   L050F03
L05162E  SEP   #$30
L051630  JSR   L051642
         BCS   L05163F
         DEC   L050090
         BPL   L051630
         REP   #$30
         BRL   L050E20
L05163F  BRL   L050EFF
         MX    %11
L051642  LDY   #$00
L051644  LDA   [$DC],Y
         AND   #$7F
         BEQ   L051659
         CMP   #$0D
         BEQ   L051659
         CMP   #$20
         BEQ   L051659
         CMP   #$2C
         BEQ   L05165B
         INY
         BNE   L051644
L051659  SEC
         RTS

L05165B  REP   #$30
         INY
         TYA
         CLC
         ADC   $DC
         STA   $DC
         BCC   L051668
         INC   $DE
L051668  SEP   #$30
         CLC
         RTS

         MX    %00
L05166C  JSR   L050DA5
         JSR   L0506E7
         BCC   L051677
         BRL   L050F03
L051677  LDA   #$0004
         STA   L05169D
L05167D  LDA   L050092
         PHA
         LDA   L050090
         PHA
         PEA   $0002
         PEA   $0001
         JSL   L043069
         INC   L050090
         INC   L050090
         DEC   L05169D
         BNE   L05167D
         BRL   L050EFF
L05169D  DB    $00
         DB    $00
L05169F  BRL   L050EFF
L0516A2  JSR   L050DA5
         BIT   L0500F1
         BMI   L051717
         SEP   #$20
         LDY   #$0001
         LDA   [$DC]
         STA   L05171A
         STZ   L05171B
L0516B7  LDA   [$DC],Y
         BEQ   L0516CA
         CMP   L05171A
         BEQ   L0516CA
         CMP   #$0D
         BEQ   L0516CA
         INC   L05171B
         INY
         BNE   L0516B7
L0516CA  LDA   L05171B
         BEQ   L051717
         JSL   L03074E
         DB    $09
         DB    $0D
         DB    $14
         DB    $3B
         LDA   L05171B
         CMP   #$27
         BCC   L0516E3
         LDA   #$26
         STA   L05171B
L0516E3  SEC
         LDA   #$50
         SBC   L05171B
         LSR
         XBA
         LDA   #$00
         XBA
         TAX
         LDY   #$000B
         JSL   L0300E2
         LDY   #$0001
L0516F9  LDA   [$DC],Y
         PHY
         ORA   #$80
         CMP   #$A0
         BCS   L051704
         LDA   #$A0
L051704  JSL   L0301F9
         PLY
         INY
         DEC   L05171B
         BNE   L0516F9
         JSL   L030035
         DB    $02
         DB    $15
         DB    $00
         DB    $4F
L051717  BRL   L050EFF
L05171A  DB    $00
L05171B  DB    $00
L05171C  PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSR   L050263
         BCS   L05175C
         JSL   L03074E
         DB    $08
         DB    $14
         DB    $1C
         DB    $33
         STZ   L05188E
         STZ   L051890
         BRL   L0517B5
L051738  SEP   #$20
L05173A  JSL   L03059F
         BCS   L05173A
         REP   #$20
         AND   #$00FF
         CMP   #$008A
         BEQ   L051770
         CMP   #$008B
         BEQ   L051797
         CMP   #$008D
         BEQ   L051760
         CMP   #$009B
         BNE   L05173A
         JSR   L05187F
L05175C  PLP
         SEC
         PLB
         RTL

L051760  JSR   L05187F
         LDA   L051892
         LDY   L051894
         LDX   L051896
         PLP
         CLC
         PLB
         RTL

L051770  CLC
         LDA   L051890
         ADC   L05188E
         INC
         CMP   L0500E9
         BEQ   L051738
         CMP   #$0006
         BCC   L051792
         LDA   L05188E
         ADC   #$000A
         CMP   L0500E9
         BCS   L051792
         INC   L05188E
         BRA   L0517B5
L051792  INC   L051890
         BRA   L0517B5
L051797  CLC
         LDA   L051890
         ADC   L05188E
         BEQ   L051738
         ADC   #$0005
         CMP   L0500E9
         BCS   L0517B2
         LDA   L05188E
         BEQ   L0517B2
         DEC   L05188E
         BRA   L0517B5
L0517B2  DEC   L051890
L0517B5  LDA   L05188E
         STA   L05188C
         JSR   L050263
L0517BE  LDA   L05188C
         CMP   #$007F
         BCC   L0517EB
         SEC
         SBC   #$007F
         STA   L05188C
         LDY   #$03F8
         LDA   [$E4],Y
         PHA
         INY
         INY
         LDA   [$E4],Y
         STA   $E6
         PLA
         STA   $E4
         LDY   #$0002
         LDA   [$E4]
         PHA
         LDA   [$E4],Y
         STA   $E6
         PLA
         STA   $E4
         BRA   L0517BE
L0517EB  LDX   #$0000
L0517EE  ASL
         ASL
         ASL
         TAY
         LDA   [$E4],Y
         STA   $00
         INY
         INY
         LDA   [$E4],Y
         STA   $02
         ORA   $00
         BNE   L051803
         BRL   L051738
L051803  LDY   #$0002
         LDA   [$00]
         PHA
         LDA   [$00],Y
         STA   $02
         PLA
         STA   $00
         SEP   #$30
         LDA   [$00]
         PHA
         TAY
L051816  LDA   [$00],Y
         ORA   #$80
         STA   L051898,Y
         DEY
         BNE   L051816
         PLY
         INY
         LDA   #$A0
L051824  CPY   #$15
         BCS   L05182E
         STA   L051898,Y
         INY
         BRA   L051824
L05182E  REP   #$30
         PHX
         CPX   L051890
         BNE   L051853
         JSL   L030579
         LDA   $00
         STA   L051892
         LDA   $02
         STA   L051894
         LDA   L05188C
         ASL
         ASL
         ASL
         ADC   #$0004
         TAY
         LDA   [$E4],Y
         STA   L051896
L051853  LDX   #$001E
         LDA   #$0009
         CLC
         ADC   $01,S
         TAY
         JSL   L0300E2
         JSL   L030314
         ADR   L051898
         JSL   L030585
         PLX
         INC   L05188C
         LDA   L05188C
         INX
         CPX   #$000B
         BCS   L05187C
         BRL   L0517EE
L05187C  BRL   L051738
L05187F  JSL   L030035
         DB    $02
         DB    $15
         DB    $00
         DB    $4F
         JSL   L0300D1
         RTS

L05188C  DB    $00
         DB    $00
L05188E  DB    $00
         DB    $00
L051890  DB    $00
         DB    $00
L051892  DB    $00
         DB    $00
L051894  DB    $00
         DB    $00
L051896  DB    $00
         DB    $00
L051898  DB    $14
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L0518AD  PHP
         REP   #$30
         JSR   L050245
         LDX   $D0
         LDY   $D2
         BCC   L0518FF
         PHA
         PHA
         PEA   $0001
         PEA   $0000
         LDA   $FE
         ORA   #$0400
         PHA
         PEA   $8008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCC   L0518DA
         PLP
         SEC
         RTS

L0518DA  PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $D4
         LDA   |$0002,X
         STA   $D6
         PLB
         PLB
         PHY
         LDA   #$0000
         TAY
L0518EE  STA   [$D4],Y
         INY
         INY
         BNE   L0518EE
         LDA   #$0D20
         STA   [$D4]
         LDA   #$0002
         STA   $D8
         PLY
L0518FF  PLP
         CLC
         RTS

L051902  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSR   L0518AD
         BCC   L051911
         PLP
         PLB
         SEC
         RTL

L051911  STX   $D0
         STY   $D2
         JSL   L030035
         DB    $00
         DB    $17
         DB    $00
         DB    $4F
         JSL   L0300D1
         JSR   L051C88
         STZ   L051978
         LDA   #$000A
         CMP   L051CA4
         BCC   L051933
         LDA   L051CA4
         DEC
L051933  STA   L05197A
         PHA
         SEC
         SBC   L051978
         STA   L051980
         STZ   L05197E
         PLX
         JSR   L051ABC
         STY   L051B82
         JSR   L051984
L05194B  JSR   L0519A4
         LDY   L051B82
         JSR   L051AF1
L051954  JSR   L051AD5
         AND   #$007F
         PHA
         LDAL  $E0C025
         AND   #$0080
         ORA   $01,S
         STA   $01,S
         PLA
         JSR   L051CD1
         REP   #$30
         BCS   L051972
         BVS   L05194B
         BCC   L051954
L051972  JSR   L0503C5
         PLP
         PLB
         RTL

L051978  DB    $00
         DB    $00
L05197A  DB    $00
         DB    $00
L05197C  DB    $00
         DB    $00
L05197E  DB    $00
         DB    $00
L051980  DB    $00
         DB    $00
L051982  DB    $00
         DB    $00

L051984  LDA   #$0009
         STA   L05197C
         LDA   #$FFFF
         STA   L051982
         RTS

L051991  LDA   L05197C
         EOR   #$0029
         STA   L05197C
         LDA   #$FFFF
         EOR   L051982
         STA   L051982
         RTS

L0519A4  SEP   #$20
L0519A6  LDAL  $E0C019
         BPL   L0519A6
         REP   #$20
         LDY   L051B82
         SEC
         LDA   L05197A
         SBC   L051978
         TAX
         BEQ   L0519C1
L0519BB  JSR   L051CB9
         DEX
         BNE   L0519BB
L0519C1  LDA   #$0000
L0519C4  PHA
         JSR   L0519D0
         PLA
         INC
         CMP   #$0018
         BCC   L0519C4
         RTS

L0519D0  PHY
         JSL   L03006F
         JSR   L051AA1
         PLY
         SEP   #$20
         LDA   #$00
         XBA
         STZ   L051A9A
         STZ   L051AA0
         LDX   #$0000
         LDA   [$D4],Y
         CMP   #$3B
         BNE   L0519F3
         LDA   L051A9D
         TAX
         LDA   #$2A
L0519F3  STA   L051A9F
L0519F6  LDA   [$D4],Y
         BNE   L0519FD
         BRL   L051A92
L0519FD  CMP   #$0D
         BNE   L051A04
         BRL   L051A92
L051A04  CMP   #$20
         BNE   L051A4F
         LDA   L051A9F
         CMP   #$2A
         BEQ   L051A4D
         LDA   L051AA0
         BNE   L051A4D
         INY
         LDA   [$D4],Y
         DEY
         CMP   #$3B
         BEQ   L051A29
         LDA   L051A9A
         BEQ   L051A3F
         CMP   #$03
         BCS   L051A4D
         CMP   #$02
         BCC   L051A34
L051A29  TXA
         CMP   L051A9D
         BCS   L051A4D
         LDA   L051A9D
         BRA   L051A48
L051A34  TXA
         CMP   L051A9C
         BCS   L051A4D
         LDA   L051A9C
         BRA   L051A48
L051A3F  TXA
         CMP   L051A9B
         BCS   L051A4D
         LDA   L051A9B
L051A48  TAX
         DEX
         INC   L051A9A
L051A4D  LDA   #$A0
L051A4F  PHY
         PHX
         PHA
         REP   #$20
         TXA
         LSR
         TAY
         SEP   #$20
         STAL  $E0C054
         BCS   L051A63
         STAL  $E0C055
L051A63  PLA
         ORA   #$80
         STA   [$28],Y
         STAL  $E0C054
         EOR   L051AA0
         BEQ   L051A7E
         BPL   L051A81
         EOR   L051AA0
         CMP   #$A7
         BEQ   L051A7E
         CMP   #$A2
         BNE   L051A81
L051A7E  STA   L051AA0
L051A81  PLX
         PLY
         INX
         CPX   #$0050
         BCS   L051A8F
         INY
         BEQ   L051A8F
         BRL   L0519F6
L051A8F  JSR   L051CA6
L051A92  CMP   #$01
         BCC   L051A97
         INY
L051A97  REP   #$20
         RTS

L051A9A  DB    $00
L051A9B  DB    $11
L051A9C  DB    $19
L051A9D  DB    $23
         DB    $50
L051A9F  DB    $00
L051AA0  DB    $00

L051AA1  PHP
         SEP   #$20
         REP   #$10
         LDA   #$A0
         LDY   #$0027
L051AAB  STA   [$28],Y
         STAL  $E0C055
         STA   [$28],Y
         STAL  $E0C054
         DEY
         BPL   L051AAB
         PLP
         RTS

L051ABC  SEP   #$20
         LDY   #$0000
         CPX   #$0000
         BEQ   L051AD2
L051AC6  LDA   [$D4],Y
         BEQ   L051AD2
         INY
         CMP   #$0D
         BNE   L051AC6
         DEX
         BNE   L051AC6
L051AD2  REP   #$20
         RTS

L051AD5  LDX   L05197E
         LDY   L051980
         JSL   L0300E2
         LDA   L05197C
         JSL   L030593
         JSL   L03034A
         RTS

         LDX   L05197A
         JSR   L051ABC
L051AF1  STY   L051B82
         LDA   L051980
         JSL   L03006F
         SEP   #$20
         LDX   #$0000
L051B00  LDA   [$D4],Y
         STA   L051B86,X
         INY
         INX
         CMP   #$00
         BEQ   L051B0F
         CMP   #$0D
         BNE   L051B00
L051B0F  TXA
         STA   L051B85
         STA   L051B84
         JSR   L051B62
         REP   #$20
         JSR   L052093
         RTS

L051B1F  JSR   L05210A
         SEP   #$21
         LDY   L051B82
         LDA   L051B85
         SBC   L051B84
         BEQ   L051B48
         BPL   L051B3E
         EOR   #$FF
         INC
         REP   #$20
         AND   #$00FF
         JSR   L052358
         BRA   L051B46
L051B3E  REP   #$20
         AND   #$00FF
         JSR   L052317
L051B46  BCS   L051B61
L051B48  SEP   #$20
         LDA   L051B85
         LDY   L051B82
         LDX   #$0000
L051B53  PHA
         LDA   L051B86,X
         STA   [$D4],Y
         INX
         INY
         PLA
         DEC
         BNE   L051B53
         REP   #$20
L051B61  RTS

L051B62  PHP
         SEP   #$20
         STZ   L051C86
         STZ   L051C87
         LDA   L051B86
         CMP   #$3B
         BNE   L051B74
         LDA   #$2A
L051B74  CMP   #$2A
         BNE   L051B80
         LDA   #$FF
         STA   L051C86
         STA   L051C87
L051B80  PLP
         RTS

L051B82  DB    $00
         DB    $00
L051B84  DB    $00
L051B85  DB    $00
L051B86  DB    $00
L051B87  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L051C83  DB    $00
L051C84  DB    $00
L051C85  DB    $00
L051C86  DB    $00
L051C87  DB    $00

L051C88  SEP   #$20
         LDX   #$0000
         TXY
L051C8E  LDA   [$D4],Y
         INY
         CMP   #$00
         BEQ   L051C9C
         CMP   #$0D
         BNE   L051C8E
         INX
         BNE   L051C8E
L051C9C  REP   #$20
         INX
         STX   L051CA4
         TXA
         RTS

L051CA4  DW    $0000

L051CA6  SEP   #$20
L051CA8  LDA   [$D4],Y
         BEQ   L051CB1
         INY
         CMP   #$0D
         BNE   L051CA8
L051CB1  LDA   [$D4],Y
         REP   #$20
         AND   #$007F
         RTS

L051CB9  SEP   #$20
         CPY   #$0000
         BEQ   L051CCE
         DEY
L051CC1  CPY   #$0000
         BEQ   L051CCE
         DEY
         LDA   [$D4],Y
         CMP   #$0D
         BNE   L051CC1
         INY
L051CCE  REP   #$20
         RTS

L051CD1  SEP   #$20
         CMP   #$80
         BCC   L051CDA
         BRL   L051CE7
L051CDA  CMP   #$20
         BCS   L051CE1
         BRL   L051F16
L051CE1  JSR   L0521BC
         CLC
         CLV
         RTS

L051CE7  LDX   L051CFD
L051CEA  CMP   L051CFF-1,X
         BEQ   L051CF5
         DEX
         BNE   L051CEA
         CLC
         CLV
         RTS

L051CF5  REP   #$20
         TXA
         ASL
         TAX
         JMP   (L051D13-2,X)

L051CFD  DW    L051D13-L051CFF	; was $14 (= 20)

L051CFF  DB    $D1	; Q
	 db    $f1	; q
         DB    $8A	; DOWN-ARROW
         DB    $8B	; UP-ARROW
         DB    $95	; RIGHT-ARROW
         DB    $88	; LEFT-ARROW
         DB    $DA	; Z
	 db    $fa	; z
         DB    $C2	; B
	 db    $e2	; b
         DB    $CE	; N
	 db    $ee	; n
         DB    $D4	; T
	 db    $f4	; t
         DB    $89	; CTRL-I
         DB    $C4	; D
	 db    $e4	; d
         DB    $C9	; I
	 db    $e9	; i
         DB    $FF	; DEL
         DB    $D8	; X - Not implemented
         DB    $C3	; C - Not implemented
         DB    $D6	; V - Not implemented
         DB    $C6	; F - Not implemented
         DB    $D7	; W - Not implemented
         DB    $C5	; E - Not implemented
         DB    $CF	; O - Not implemented

L051D13  DA    L051DFA	; Q
	 da    L051DFA	; q
         DA    L051D73  ; DOWN-ARROW
         DA    L051D6E  ; UP-ARROW
         DA    L051D7D  ; RIGHT-ARROW
         DA    L051D78  ; LEFT-ARROW
         DA    L051D69  ; Z
	 da    L051D69  ; z
         DA    L051D3E  ; B
	 da    L051D3E  ; b
         DA    L051D51  ; N
	 da    L051D51  ; n
         DA    L051DFF  ; T
	 da    L051DFF  ; t
         DA    L051E11  ; CTRL-I
         DA    L051E6D  ; D
	 da    L051E6D  ; d
         DA    L051E96  ; I
	 da    L051E96  ; i
         DA    L051E3D  ; DEL
         DA    L051EC6  ; X
         DA    L051EC6  ; C
         DA    L051EC6  ; V
         DA    L051EC6  ; F
         DA    L051EC6  ; W
         DA    L051EC6  ; E
         DA    L051EC6  ; O

         CLC
         CLV
         RTS

L051D3E  JSR   L051B1F
         STZ   L051978
         STZ   L05197A
         STZ   L051B82
         STZ   L051980
         SEP   #$40
         CLC
         RTS

L051D51  JSR   L051B1F
         LDA   $D8
         DEC
         STA   L051B82
         LDA   L051CA4
         DEC
         STA   L05197A
L051D61  LDA   #$0000
         STA   L051DF8
         BRA   L051D86
L051D69  LDA   #$0000
         BRA   L051D80
L051D6E  LDA   #$FFF6
         BRA   L051D80
L051D73  LDA   #$000A
         BRA   L051D80
L051D78  LDA   #$FFE9
         BRA   L051D80
L051D7D  LDA   #$0017
L051D80  STA   L051DF8
         JSR   L051B1F
L051D86  LDA   L05197A
         CLC
         ADC   L051DF8
         BPL   L051D9C
         BIT   L051DF8
         BPL   L051D9C
         BIT   L05197A
         BMI   L051D9C
         LDA   #$0000
L051D9C  CMP   L051CA4
         BCC   L051DA5
         LDA   L051CA4
         DEC
L051DA5  TAY
         SEC
         SBC   L05197A
         BPL   L051DB0
         EOR   #$FFFF
         INC
L051DB0  TAX
         TYA
         STA   L05197A
         SEC
         SBC   #$000A
         BPL   L051DC3
         BIT   L05197A
         BMI   L051DC3
         LDA   #$0000
L051DC3  STA   L051978
         LDY   L051B82
         TXA
         BEQ   L051DDC
L051DCC  BIT   L051DF8
         BPL   L051DD6
         JSR   L051CB9
         BRA   L051DD9
L051DD6  JSR   L051CA6
L051DD9  DEX
         BNE   L051DCC
L051DDC  JSR   L051AF1
         SEC
         LDA   L05197A
         SBC   L051978
         CMP   #$000A
         BCC   L051DEE
         LDA   #$000A
L051DEE  STA   L051980
         STZ   L05197E
         SEP   #$40
         CLC
         RTS

L051DF8  DB    $00
         DB    $00

L051DFA  JSR   L051B1F
         SEC
         RTS

L051DFF  JSR   L051B1F
         LDA   L051FCE
         STA   L051B82
         LDA   L051FD0
         STA   L05197A
         BRL   L051D61
L051E11  PHP
         SEP   #$30
         LDX   L051C85
L051E17  CPX   #$00
         BEQ   L051E33
         DEX
         LDA   L051B86,X
         CMP   #$20
         BEQ   L051E17
         CPX   #$00
         BEQ   L051E33
L051E27  DEX
         LDA   L051B86,X
         INX
         CMP   #$20
         BEQ   L051E33
         DEX
         BNE   L051E27
L051E33  STX   L051C85
         JSR   L051FF8
         PLP
         CLC
         CLV
         RTS

         MX    %00
L051E3D  JSR   L051B1F
         LDA   L05197A
         BEQ   L051E92
         LDA   L051980
         AND   #$00FF
         BEQ   L051E92
         DEC   L05197A
         DEC   L051980
         LDY   L051B82
         JSR   L051CB9
         JSR   L051AF1
         JSR   L051E6D
         PHP
         LDA   L051978
         BEQ   L051E6B
         DEC   L051978
         INC   L051980
L051E6B  PLP
         RTS

L051E6D  PHP
         SEP   #$30
         STZ   L05197E
         REP   #$30
         JSR   L05210A
         LDA   L051B86
         AND   #$00FF
         BEQ   L051E91
         LDA   L051B84
         AND   #$00FF
         LDY   L051B82
         JSR   L052358
         BCS   L051E91
         DEC   L051CA4
L051E91  PLP
L051E92  SEP   #$40
         CLC
         RTS

L051E96  JSR   L051B1F
         STZ   L05197E
         JSR   L051EA3
         SEP   #$40
         CLC
         RTS

L051EA3  PHP
         SEP   #$20
         REP   #$20
         LDA   #$0001
         LDY   L051B82
         PHY
         JSR   L052317
         PLY
         BCS   L051EC3
         SEP   #$20
         LDA   #$0D
         STA   [$D4],Y
         REP   #$20
         INC   L051CA4
         PLP
         CLC
         RTS

L051EC3  PLP
         SEC
         RTS

L051EC6  JSR   L051B1F
         JSL   L03074E
         DB    $06
         DB    $0C
         DB    $24
         DB    $4F
         LDY   #$0008
         LDX   #$0028
         JSL   L0300E2
         JSL   L0302E1
         STR   "Not yet implemented."
         LDA   #$00DF
         JSL   L030593
         LDY   #$000A
         LDX   #$0026
         JSL   L0300E2
         JSL   L03034A
         JSL   L030035
         DB    $00
         DB    $17
         DB    $00
         DB    $4F
         JSR   L0519A4
         CLC
         RTS

L051F16  LDX   L051F2C
L051F19  CMP   L051F2D,X
         BEQ   L051F24
         DEX
         BNE   L051F19
         CLC
         CLV
         RTS

L051F24  REP   #$20
         TXA
         ASL
         TAX
         JMP   (L051F39,X)

L051F2C  DB    $0D
L051F2D  DB    $00
         DB    $0A
         DB    $0B
         DB    $15
         DB    $08
         DB    $05
         DB    $14
         DB    $09
         DB    $02
         DB    $0E
         DB    $04
         DB    $19
L051F39  DB    $0D
         DB    $1B
         DA    L051F58
         DA    L051F93
         DA    L051FD2
         DA    L051FE6
         DA    L051FB9
         DA    L051FBF
         DA    L052132
         DA    L052167
         DA    L052170
         DA    L052183
         DA    L052189
         DA    L0521A3
         DA    L051F58
         CLC
         CLV
         RTS

L051F58  JSR   L051B1F
         LDA   L05197A
         INC
         CMP   L051CA4
         BCC   L051F72
         LDY   L051B82
         JSR   L051CA6
         STY   L051B82
         JSR   L051EA3
         BCS   L051F89
L051F72  INC   L05197A
         LDY   L051B82
         JSR   L051CA6
         JSR   L051AF1
         LDA   L051980
         CMP   #$0017
         BEQ   L051F8C
         INC   L051980
L051F89  CLC
         CLV
         RTS

L051F8C  INC   L051978
         SEP   #$40
         CLC
         RTS

L051F93  LDA   L05197A
         BEQ   L051FAF
         JSR   L051B1F
         DEC   L05197A
         LDY   L051B82
         JSR   L051CB9
         JSR   L051AF1
         LDA   L051980
         BEQ   L051FB2
         DEC   L051980
L051FAF  CLC
         CLV
         RTS

L051FB2  DEC   L051978
         SEP   #$40
         CLC
         RTS

L051FB9  JSR   L051991
         CLC
         CLV
         RTS

L051FBF  LDA   L051B82
         STA   L051FCE
         LDA   L05197A
         STA   L051FD0
         CLC
         CLV
         RTS

L051FCE  DB    $00
         DB    $00
L051FD0  DB    $00
         DB    $00
L051FD2  SEP   #$30
         LDA   L05197E
         CMP   #$4F
         BCS   L051FDE
         INC   L051C85
L051FDE  REP   #$30
         JSR   L051FF8
         CLC
         CLV
         RTS

L051FE6  SEP   #$30
         LDA   L051C85
         BEQ   L051FDE
         DEC   L051C85
         REP   #$30
         JSR   L051FF8
         CLC
         CLV
         RTS

L051FF8  PHP
         SEP   #$30
         JSR   L051B62
         STZ   L051AA0
         LDX   L051C85
         CPX   L051B85
         BCC   L052024
         LDX   L051B85
         DEX
         LDA   L051B86,X
         PHA
         LDA   #$20
L052013  STA   L051B86,X
         INX
         CPX   L051C85
         BCC   L052013
         PLA
         STA   L051B86,X
         INX
         STX   L051B85
L052024  LDY   #$00
         TYX
         STX   L051A9A
         LDA   L051B86
         CMP   #$3B
         BNE   L052034
         LDY   L051A9D
L052034  CPX   L051C85
         BEQ   L05208E
         LDA   L051B86,X
         CMP   #$20
         BNE   L052070
         BIT   L051C86
         BMI   L052070
         BIT   L051AA0
         BMI   L052070
         LDA   L051A9A
         CMP   #$03
         BCS   L052070
         LDA   L051B87,X
         CMP   #$3B
         BNE   L05205E
         LDY   L051A9D
         DEY
         BRA   L052070
L05205E  PHX
         LDX   L051A9A
         TYA
         CMP   L051A9B,X
         BCS   L05206C
         LDY   L051A9B,X
         DEY
L05206C  INC   L051A9A
         PLX
L052070  LDA   L051B86,X
         ORA   #$80
         EOR   L051AA0
         BEQ   L052087
         BPL   L05208A
         EOR   L051AA0
         CMP   #$A2
         BEQ   L052087
         CMP   #$A7
         BNE   L05208A
L052087  STA   L051AA0
L05208A  INY
         INX
         BRA   L052034
L05208E  STY   L05197E
         PLP
         RTS

L052093  PHP
         SEP   #$30
         STZ   L051AA0
         STZ   L051A9A
         LDY   #$00
         TYX
L05209F  LDA   L051B86,X
         BEQ   L0520A8
         CMP   #$0D
         BNE   L0520B3
L0520A8  STA   L051B87,X
         LDA   #$20
         STA   L051B86,X
         INC   L051B85
L0520B3  CPY   L05197E
         BCS   L0520FA
         CMP   #$20
         BNE   L0520DC
         BIT   L051C86
         BMI   L0520DC
         BIT   L051AA0
         BMI   L0520DC
         PHX
         LDX   L051A9A
         CPX   #$03
         BCS   L0520D8
         TYA
         CMP   L051A9B,X
         BCS   L0520D8
         LDY   L051A9B,X
         DEY
L0520D8  PLX
         INC   L051A9A
L0520DC  LDA   L051B86,X
         ORA   #$80
         EOR   L051AA0
         BEQ   L0520F3
         BPL   L0520F6
         EOR   L051AA0
         CMP   #$A2
         BEQ   L0520F3
         CMP   #$A7
         BNE   L0520F6
L0520F3  STA   L051AA0
L0520F6  INY
         INX
         BRA   L05209F
L0520FA  BEQ   L0520FD
         DEX
L0520FD  STX   L051C85
         REP   #$30
         JSR   L05210A
         JSR   L051FF8
         PLP
         RTS

L05210A  PHP
         SEP   #$30
         LDX   L051B85
         LDA   L051B85,X
         PHA
L052114  DEX
         BEQ   L05211E
         LDA   L051B85,X
         CMP   #$20
         BEQ   L052114
L05211E  INX
         PLA
         STA   L051B85,X
         CMP   #$0D
         BEQ   L05212D
         LDA   #$0D
         STA   L051B86,X
         INX
L05212D  STX   L051B85
         PLP
         RTS

L052132  PHP
         SEP   #$30
         LDA   L05197E
         CMP   #$4F
         BCS   L052156
         LDX   L051C85
L05213F  LDA   L051B86,X
         BEQ   L05215A
         CMP   #$0D
         BEQ   L05215A
         CMP   #$20
         BEQ   L05214F
         INX
         BNE   L05213F
L05214F  INX
         STX   L051C85
         JSR   L051FF8
L052156  PLP
         CLC
         CLV
         RTS

L05215A  STA   L051B87,X
         LDA   #$20
         STA   L051B86,X
         INC   L051B85
         BRA   L05214F
L052167  STZ   L051C85
         JSR   L051FF8
         CLV
         CLC
         RTS

         MX    %00
L052170  JSR   L05210A
         LDA   L051B85
         AND   #$00FF
         DEC
         STA   L051C85
         JSR   L051FF8
         CLV
         CLC
         RTS

L052183  JSR   L0522F0
         CLV
         CLC
         RTS

L052189  PHP
         SEP   #$30
         LDX   L051B85
         LDA   L051B85,X
         LDX   L051C85
         INX
         STA   L051B85,X
         STX   L051B85
         JSR   L052214
         PLP
         CLV
         CLC
         RTS

L0521A3  STZ   L05197E
         LDA   L05197A
         INC
         CMP   L051CA4
         BCC   L0521B2
         BRL   L051F58
L0521B2  JSR   L051F58
         JSR   L051EA3
         SEP   #$40
         CLC
         RTS

L0521BC  SEP   #$30
         CMP   #$7F
         BNE   L0521C5
         BRL   L0522CE
L0521C5  PHA
         LDX   L051B85
         BIT   L051982
         BMI   L0521DF
         DEX
         CPX   L051C85
         BNE   L0521ED
         LDA   L051B86,X
         STA   L051B87,X
         INC   L051B85
         BRA   L0521ED
L0521DF  LDA   L051B85,X
         STA   L051B86,X
         DEX
         BEQ   L0521ED
         CPX   L051C85
         BCS   L0521DF
L0521ED  LDX   L051C85
         PLA
         STA   L051B86,X
         BIT   L051982
         BPL   L05220B
         LDA   L051B85
         CMP   #$FE
         BNE   L052208
         LDA   L051C84
         STA   L051C83
         BRA   L05220B
L052208  INC   L051B85
L05220B  REP   #$30
         JSR   L051FD2
         JSR   L052214
         RTS

L052214  JSR   L051FF8
         JSR   L051AA1
         JSR   L051B62
         SEP   #$30
         STZ   L051AA0
         LDY   #$00
         LDA   #$00
         XBA
         STZ   L051A9A
         LDX   #$00
         LDA   L051B86
         CMP   #$3B
         BNE   L052238
         LDX   L051A9D
         LDA   #$2A
L052238  STA   L051A9F
L05223B  LDA   L051B86,Y
         BNE   L052243
         BRL   L0522CB
L052243  CMP   #$0D
         BNE   L05224A
         BRL   L0522CB
L05224A  CMP   #$20
         BNE   L052290
         LDA   L051A9F
         CMP   #$2A
         BEQ   L05228E
         LDA   L051AA0
         BNE   L05228E
         LDA   L051B87,Y
         CMP   #$3B
         BEQ   L05226E
         LDA   L051A9A
         BEQ   L052282
         CMP   #$03
         BCS   L05228E
         CMP   #$02
         BCC   L052278
L05226E  CPX   L051A9D
         BCS   L05228E
         LDX   L051A9D
         BRA   L05228A
L052278  CPX   L051A9C
         BCS   L05228E
         LDX   L051A9C
         BRA   L05228A
L052282  CPX   L051A9B
         BCS   L05228E
         LDX   L051A9B
L05228A  INC   L051A9A
         DEX
L05228E  LDA   #$A0
L052290  PHY
         PHX
         PHA
         TXA
         LSR
         TAY
         STAL  $E0C054
         BCS   L0522A0
         STAL  $E0C055
L0522A0  PLA
         ORA   #$80
         STA   [$28],Y
         STAL  $E0C054
         EOR   L051AA0
         BEQ   L0522BB
         BPL   L0522BE
         EOR   L051AA0
         CMP   #$A2
         BEQ   L0522BB
         CMP   #$A7
         BNE   L0522BE
L0522BB  STA   L051AA0
L0522BE  PLX
         PLY
         INX
         CPX   #$50
         BCS   L0522CB
         INY
         BEQ   L0522CB
         BRL   L05223B
L0522CB  REP   #$30
         RTS

L0522CE  SEP   #$30
         LDX   L051C85
         BEQ   L0522E7
L0522D5  LDA   L051B86,X
         STA   L051B85,X
         BEQ   L0522E4
         CMP   #$0D
         BEQ   L0522E4
         INX
         BNE   L0522D5
L0522E4  STX   L051B85
L0522E7  REP   #$30
         JSR   L051FE6
         JSR   L052214
         RTS

L0522F0  SEP   #$30
         LDX   L051C85
         INX
         CPX   L051B85
         BEQ   L052311
         DEX
L0522FC  LDA   L051B86,X
         BEQ   L05230E
         CMP   #$0D
         BEQ   L05230E
         LDA   L051B87,X
         STA   L051B86,X
         INX
         BNE   L0522FC
L05230E  DEC   L051B85
L052311  REP   #$30
         JSR   L052214
         RTS

L052317  PHP
         REP   #$30
         CMP   #$0000
         BEQ   L052355
         STA   L0523A8
         STY   $00
         CLC
         ADC   $D8
         BCC   L05232C
         PLP
         SEC
         RTS

L05232C  LDY   $D8
         INY
         STA   $D8
         TYA
         EOR   $00
         LSR
         BCC   L052338
         INY
L052338  CLC
         LDA   L0523A8
         ADC   $D4
         STA   $E4
         LDA   #$0000
         ADC   $D6
         STA   $E6
L052347  LDA   [$D4],Y
         STA   [$E4],Y
         DEY
         DEY
         CPY   $00
         BNE   L052347
         LDA   [$D4],Y
         STA   [$E4],Y
L052355  PLP
         CLC
         RTS

L052358  PHP
         REP   #$30
         CMP   #$0000
         BEQ   L0523A3
         STA   L0523A8
         SEC
         LDA   $D8
         SBC   L0523A8
         BCS   L05236E
         PLP
         SEC
         RTS

L05236E  PHA
         CLC
         LDA   L0523A8
         ADC   $D4
         STA   $E4
         LDA   #$0000
         ADC   $D6
         STA   $E6
         SEP   #$20
         LDA   [$E4],Y
         STA   [$D4],Y
         REP   #$20
         TYA
         EOR   $D8
         LSR
         BCC   L05238D
         INY
L05238D  BRA   L052395
L05238F  LDA   [$E4],Y
         STA   [$D4],Y
         INY
         INY
L052395  CPY   $D8
         BEQ   L05238F
         BCC   L05238F
         PLY
         STY   $D8
         LDA   #$0000
         STA   [$D4],Y
L0523A3  PLP
         CLC
         RTS

         DB    $00
         DB    $00
L0523A8  DB    $00
         DB    $00
L0523AA  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STA   L0500F5
         STY   L0500F5+2
         STA   $00
         STY   $02
         ORA   $02
         BEQ   L0523F0
         PEA   ^L0500F3
         PEA   L0500F3
         PEA   $200E      ; ExpandPath
         JSL   GSOS2
         BCS   L05241D
         LDA   [$00]
         TAY
         INY
         LDX   L050143
         INX
         SEP   #$20
L0523D7  LDA   [$00],Y
         AND   #$7F
         JSR   L052478
         CMP   L050143,X
         BNE   L0523EE
         LDA   [$00],Y
         AND   #$7F
         STA   L050143,X
         DEX
         DEY
         BNE   L0523D7
L0523EE  REP   #$20
L0523F0  JSR   L050245
         BCC   L0523F9
         PLP
         PLB
         CLC
         RTL

L0523F9  PEA   ^L052483
         PEA   L052483
         PEA   $2001      ; Create
         JSL   GSOS2
         BCC   L05241F
         CMP   #$0047
         BEQ   L052410
         BRL   L05245F
L052410  PEA   ^L052483
         PEA   L052483
         PEA   $2005      ; SetFileInfo
         JSL   GSOS2
L05241D  BCS   L05245F
L05241F  PEA   ^L052493
         PEA   L052493
         PEA   $2010      ; Open
         JSL   GSOS2
         BCS   L05245F
         LDA   L052495
         STA   L05249D
         STA   L0524AD
         JSR   L050245
         LDA   $D4
         STA   L05249F
         LDA   $D6
         STA   L05249F+2
         LDA   $D8
         STA   L0524A3
         PEA   ^L05249B
         PEA   L05249B
         PEA   $2013      ; Write
         JSL   GSOS2
         BCS   L05245F
         JSR   L052466
         PLP
         PLB
         CLC
         RTL

L05245F  JSR   L052466
         PLP
         PLB
         SEC
         RTL

L052466  PHP
         PHA
         PEA   ^L0524AB
         PEA   L0524AB
         PEA   $2014      ; Close
         JSL   GSOS2
         PLA
         PLP
         RTS

         MX    %11
L052478  CMP   #$61
         BCC   L052482
         CMP   #$7B
         BCS   L052482
         AND   #$5F
L052482  RTS

L052483  DW    $0005      ; Parms for SetFileInfo
         ADRL  L050143    ;  file name
         DW    $00C3      ;  access
         DW    $0004      ;  file type
         ADRL  $00000000  ;  aux type
         DS    2          ;  (null field)
L052493  DW    $0002      ; Parms for Open
L052495  DW    $0000      ;  ref num
         ADRL  L050143    ;  path name
L05249B  DW    $0004      ; Parms for Write
L05249D  DW    $0000      ;  ref num
L05249F  ADRL  $00000000  ;  buffer ptr
L0524A3  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L0524AB  DW    $0001      ; Parms for Close
L0524AD  DW    $0000      ;  ref num

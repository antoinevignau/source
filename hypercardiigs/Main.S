*
* HypercardGS
* segment: $03 Main
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   Main.l
         lst   off

*---------------------------------------

         use   Main.E
         use   Main.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
	use   4/Load.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
	use   4/SANE.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

         PEA   >L05565F
         PLB
         PLB
         STA   L05565F
         STX   L055665
         STY   L055663
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
	_MMStartUp
	PLY
         PLX
         BCC   L03005F
         PHA
         PEA   ^L0540F5
         PEA   L0540F5
         LDA   L055663
         ORA   L055665
         BEQ   L030058
         _ErrWriteLine
         PLA
         LDA   #$FFFF
         STA   L0555A1
         BRL   L0300D5
L030058  _SysFailMgr
L03005F  STY   $01
         STX   $03
         LDA   [$01]
         PHA
         _SANEStartUp
         LDX   L055665
         LDA   L055663
         PHX
         PHA
         PEA   $0001
         JSL   L033189
         PLY
         PLY
         PLY
         TAY
         BPL   L030087
         STA   L0555A1
         BRA   L0300B5
L030087  STZ   L05411B
         PEA   ^L055599
         PEA   L055599
         JSL   L0337A7
         PLY
         PLY
         TAY
         BNE   L0300B5
         LDX   L055451
         LDA   L05544F
         PHX
         PHA
         LDA   L0556D0
         PHA
         JSL   L032EB8
         PLY
         PLY
         PLY
         LDA   L05411B
         PHA
         JSL   L033335
         PLY
L0300B5  _SANEShutDown
         PEI   $03
         PEI   $01
         _DisposeHandle
         LDA   L05565F
         ORA   #$0F00
         PHA
         _DisposeAll
L0300D5  LDA   L055455
         STAL  L054115
         LDA   L055457
         STAL  L054117
         LDA   L055453
         STAL  L054119
         LDA   L0555A1
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L054115
         PHA
         PEA   $0000
         PEA   $0000
         _SysFailMgr
         DA    L060000    ; DP
L030107  DW    $0000
L030109  ADRL  $00000000
L03010D  DW    $0000
L03010F  DW    $0000
L030111  DW    $0000
L030113  DW    $0000
L030115  DW    $0001
L030117  ADRL  $00000000
L03011B  DW    $FFFF
L03011D  DW    $FFFF
L03011F  ADRL  $00000000
         DB    $00
         DB    $00
L030125  DB    $00
         DB    $00
L030127  DB    $03
         DB    $80
L030129  DB    $10
         DB    $00
         DB    $00
         DB    $00
L03012D  DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L030135  ADRL  $00000000
L030139  ADRL  $00000000
L03013D  DW    $0000
L03013F  DB    $00
L030140  DW    $0000
L030142  DW    $0001
L030144  ADRL  $00FF0000
L030148  DW    $0001
L03014A  DW    $0200
         DB    $00
         DB    $40
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L030154  DB    $FF
         DB    $00
L030156  DW    $0000
L030158  PHB
         PHK
         PLB
         LDA   L030107
         BEQ   L030188
         LDA   L030115
         CMP   #$FFFF
         BEQ   L03016B
         JSR   L030406
L03016B  JSR   L03027F
         PEA   $0000
         PEA   $0000
         LDA   L030117+2
         PHA
         LDA   L030117
         PHA
         _SetUserSoundIRQV
         PLA
         PLA
         STZ   L030107
L030188  PLB
         CLC
         RTL

L03018B  ENT
         PHB
         PHK
         PLB
         LDA   L030107
         BNE   L0301CB
         STZ   L03010D
         STZ   L03010F
         LDA   #$FFFF
         STA   L030115
         PHP
         SEI
         PEA   $0000
         PEA   $0000
         PEA   ^L030504
         PEA   L030504
         _SetUserSoundIRQV
         BCC   L0301BC
         TAX
         PLA
         PLA
         PLP
         BRA   L0301CB
L0301BC  PLA
         STA   L030117
         PLA
         STA   L030117+2
         PLP
         LDA   #$FFFF
         STA   L030107
L0301CB  PLB
         CLC
         RTL

L0301CE  ENT
         PHB
         PHK
         PLB
         LDA   L030107
         BEQ   L0301E1
         LDA   L030115
         CMP   #$FFFF
         BEQ   L0301E1
         JSR   L030406
L0301E1  PLB
         CLC
         RTL

L0301E4  ENT
         PHB
         PHK
         PLB
         LDA   #$0000
         STA   $05,S
         LDA   L030115
         CMP   #$FFFF
         BNE   L030224
         PHP
         SEI
         SEP   #$20
         LDAL  $E100CA
         ORA   #$20
         STAL  $E1C03C
         LDA   L03013F
         CLC
         ADC   #$A0
         STAL  $E1C03E
         LDAL  $E1C03D
         LDAL  $E1C03D
         AND   #$01
         BEQ   L030223
         LDAL  $E1C03D
         AND   #$01
         BEQ   L030223
         PLP
         BRA   L030229
L030223  PLP
         MX    %00
L030224  LDA   #$0001
         STA   $05,S
L030229  PLB
         CLC
         RTL

L03022C  ENT
         PHB
         PHK
         PLB
         PHD
         PHA
         PHA
         PHA
         PHA
         TSC
         TCD
         LDX   #$2400
         LDA   L030107
         BNE   L030241
         BRL   L030267
L030241  LDA   $0F,S
         STA   $01
         LDA   $11,S
         STA   $03
         LDA   [$01]
         STA   $05
         LDY   #$0002
         LDA   [$01],Y
         STA   $07
         LDA   L030115
         CMP   #$FFFF
         BEQ   L03025F
         JSR   L030406
L03025F  JSR   L030484
         BCS   L030267
         LDX   #$0000
L030267  PLA
         PLA
         PLA
         PLA
         PLD
         PLB
         LDA   $02,S
         STA   $08,S
         PLA
         STA   $05,S
         TSC
         CLC
         ADC   #$0004
         TCS
         TXA
         CMP   #$0001
         RTL

L03027F  PHB
         PHK
         PLB
         LDA   L030140
         PHA
         _FFStopSound
         PLB
         RTS

L03028F  PHD
         LDA   L030139+2
         PHA
         LDA   L030139
         PHA
         TSC
         TCD
         LDA   [$01]
         STA   L030135
         CLC
         ADC   #$000A
         STA   L030144
         LDY   #$0002
         LDA   [$01],Y
         STA   L030135+2
         ADC   #$0000
         STA   L030144+2
         PLA
         PLA
         PLD
         LDX   #$2400
         PHD
         LDA   L030135+2
         PHA
         LDA   L030135
         PHA
         TSC
         TCD
         LDA   [$01]
         BNE   L030307
         LDY   #$0002
         LDA   [$01],Y
         STA   L030148
         LDY   #$0004
         LDA   [$01],Y
         STA   L030156
         LDY   #$0006
         LDA   [$01],Y
         AND   #$000F
         XBA
         ASL
         ASL
         ASL
         ASL
         STA   L030142
         LDX   #$FFFF
         STX   L03011D
         LDA   L030148
         CMP   #$0100
         BEQ   L0302F9
         BCS   L0302FF
L0302F9  JSR   L030314
         LDX   #$0000
L0302FF  STX   L03013D
         PLA
         PLA
         PLD
         BRA   L03030C
L030307  PLA
         PLA
         PLD
         BRA   L03030F
L03030C  LDX   #$0000
L03030F  TXA
         CMP   #$0001
         RTS

L030314  PHP
         SEI
         LDA   #$0003
         JSR   L03057D
         AND   #$000F
         STA   L03011D
         TAX
         SEP   #$20
         LDA   L0303F6,X
         STA   L03013F
         LDAL  $E100CA
         ORA   #$20
         STAL  $E1C03C
         LDA   L03013F
         CLC
         ADC   #$A0
         STAL  $E1C03E
         LDA   #$03
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   L03013F
         CLC
         ADC   #$40
         STAL  $E1C03E
         LDA   #$00
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   L03013F
         CLC
         ADC   #$C0
         STAL  $E1C03E
         LDA   #$3F
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   L03013F
         CLC
         ADC   #$80
         STAL  $E1C03E
         LDA   #$00
         STAL  $E1C03D
         LDA   #$80
         STAL  $E1C03D
         REP   #$20
         PHD
         PHA
         PHA
         TSC
         TCD
         LDA   L030144
         STA   $01
         LDA   L030144+2
         STA   $03
         SEP   #$20
         LDAL  $E100CA
         ORA   #$60
         STAL  $E1C03C
         LDA   #$00
         STAL  $E1C03E
         LDA   #$80
         STAL  $E1C03F
         LDX   #$0040
         LDA   #$00
L0303B5  STAL  $E1C03D
         DEX
         BNE   L0303B5
         LDA   #$00
         STAL  $E1C03E
         STAL  $E1C03F
         LDY   #$0000
L0303C9  LDX   #$0100
L0303CC  LDA   [$01],Y
         STAL  $E1C03D
         INY
         DEX
         BNE   L0303CC
         DEC   L030148
         BNE   L0303C9
         LDX   #$0040
         LDA   #$00
L0303E0  STAL  $E1C03D
         DEX
         BNE   L0303E0
         LDAL  $E100CA
         STAL  $E1C03C
         REP   #$30
         PLA
         PLA
         PLD
         PLP
         RTS

L0303F6  HEX   0010081804140C1C02120A1A06160E1E
L030406  PHD
         LDA   #$0001
         STA   L03012D
         PEA   ^L030127
         PEA   L030127
         _SetDocReg
         BCS   L030482
         PHA
         PHA
         PEA   $0000
         PEA   $0008
         _GetWAP
         PLA
         TCD
         PLA
         BCS   L030482
         LDA   L03011B
         CMP   #$FFFF
         BEQ   L030482
         SEP   #$20
         ASL
         ASL
         ASL
         ASL
         TAX
         STZ   $00,X
         REP   #$20
         LDA   L03011D
         CMP   #$FFFF
         BEQ   L030456
         SEP   #$20
         ASL
         ASL
         ASL
         ASL
         TAX
         STZ   $00,X
         REP   #$20
L030456  LDA   #$FFFF
         STA   L03011B
         STA   L03011D
         LDA   #$FFFF
         STA   L030115
         LDA   L03011F
         ORA   L03011F+2
         BEQ   L030482
         PHB
         PHP
         PHK
         LDA   #L030480
         DEC
         PHA
         LDA   L03011F+1
         PHA
         PHK
         LDA   L03011F
         DEC
         PHA
         RTS

L030480  PLP
         PLB
L030482  PLD
         RTS

L030484  LDY   #$0000
         LDA   [$05],Y
         STA   L030139
         INY
         INY
         LDA   [$05],Y
         STA   L030139+2
         JSR   L03028F
         LDY   #$0004
         LDA   [$05],Y
         BEQ   L0304A1
         ASL
         STA   L030129
L0304A1  LDY   #$000C
         LDA   [$05],Y
         STA   L03011F
         INY
         INY
         LDA   [$05],Y
         STA   L03011F+2
         LDY   #$0008
         LDA   [$05],Y
         STA   $01
         INY
         INY
         LDA   [$05],Y
         STA   $03
         LDA   [$01]
         STA   L030109
         LDY   #$0002
         LDA   [$01],Y
         STA   L030109+2
         LDA   #$0003
         JSR   L03057D
         BCS   L030503
         STA   L03011B
         XBA
         ORA   #$8003
         STA   L030127
         LDA   #$0008
         STA   L03012D
         PEA   ^L030127
         PEA   L030127
         _SetDocReg
         BCS   L030503
         LDA   #$0001
         STA   L03010D
         JSR   L0305C5
         STA   L030115
         BNE   L030502
         JSR   L030406
L030502  CLC
L030503  RTS

         MX    %11
	 
L030504  TAX
         AND   #$0F
	 CMP   #$03
	 BNE   L030513
         PHP
         REP   #$30
         JSR   L030522
         PLP
         RTL

L030513  LDA   L030117+2
         PHA
         REP   #$20
         LDA   L030117
         DEC
         PHA
         SEP   #$20
         TXA
         RTL

         MX    %00

L030522  PHB
         PHK
         PLB
         LDA   L030115
         BMI   L03053A
         DEC   L030115
         BNE   L03053A
         JSR   L0305C5
         STA   L030115
         BNE   L03053A
         JSR   L030406
L03053A  PLB
         RTS

L03053C  LDA   #$0000
         JSR   L03057D
         BCS   L03057B
         PHA
         PHX
         AND   #$000F
         TAX
         SEP   #$20
         LDA   L0303F6,X
         STA   L03013F
         REP   #$20
         PLX
         PLA
         PHA
         XBA
         ORA   #$0001
         PHA
         LDA   L030142
         AND   #$F000
         ORA   $01,S
         STA   L030142
         PLA
         PLA
         TAX
         LDA   #$0001
L03056D  CPX   #$0000
         BEQ   L030576
         ASL
         DEX
         BRA   L03056D
L030576  STA   L030140
         CLC
         RTS

L03057B  SEC
         RTS

L03057D  STA   L0305C3
         PHD
         PHA
         PHA
         PEA   $0000
         PEA   $0008
         _GetWAP
         PLA
         TCD
         PLA
         BCS   L0305B9
         SEP   #$20
         LDX   #$0000
L03059A  LDA   $00,X
         BEQ   L0305A9
         TXA
         CLC
         ADC   #$10
         TAX
         CMP   #$F0
         BEQ   L0305BB
         BRA   L03059A
L0305A9  LDA   L0305C3
         STA   $00,X
         REP   #$20
         TXA
         AND   #$00F0
         LSR
         LSR
         LSR
         LSR
         CLC
L0305B9  PLD
         RTS

L0305BB  LDX   #$2400
         REP   #$20
         SEC
         BRA   L0305B9
L0305C3  DW    $0000
L0305C5  PHD
         PHB
         PHK
         PLB
         LDA   L03010D
         ORA   L03010F
         BNE   L0305D4
         BRL   L030667
L0305D4  STZ   L030111
         STZ   L030113
         JSR   L0306E7
         LDA   L03010D
         ORA   L03010F
         BNE   L0305E8
         BRL   L030667
L0305E8  LDA   L03010D
         AND   #$00FF
         STA   L030154
         LDA   L030156
         STA   L030125
         BIT   L030125
         BMI   L030608
         LDA   L03010D
         AND   #$7F00
         CLC
         ADC   L030125
         BRA   L030618
L030608  AND   #$7FFF
         STA   L030125
         LDA   L03010D
         AND   #$7F00
         SEC
         SBC   L030125
L030618  JSR   L030714
         STA   L03014A
         LDA   L03013D
         BNE   L030629
         JSR   L03066C
         JMP   L03065B

L030629  LDA   L030140
         PHA
         ORA   L030111
         STA   L030111
         _FFStopSound
         JSR   L03053C
         BCS   L030663
         LDA   L030140
         ORA   L030113
         STA   L030113
         LDA   L030142
         PHA
         PEA   ^L030144
         PEA   L030144
         _FFStartSound
         BCS   L030663
L03065B  LDA   L03010F
         AND   #$00FF
         BRA   L030667
L030663  TAX
         LDA   #$0000
L030667  PLB
         PLD
         PHA
         PLA
         RTS

L03066C  PHP
         SEP   #$20
         SEI
         LDAL  $E100CA
         ORA   #$20
         STAL  $E1C03C
         LDA   L03013F
         CLC
         ADC   #$A0
         STAL  $E1C03E
         LDA   #$03
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   L03013F
         CLC
         ADC   #$00
         STAL  $E1C03E
         LDA   L03014A
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   L03013F
         CLC
         ADC   #$20
         STAL  $E1C03E
         LDA   L03014A+1
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   L03013F
         CLC
         ADC   #$40
         STAL  $E1C03E
         LDA   L030154
         STAL  $E1C03D
         STAL  $E1C03D
         LDA   L03013F
         CLC
         ADC   #$A0
         STAL  $E1C03E
         LDA   #$06
         STAL  $E1C03D
         LDA   #$03
         STAL  $E1C03D
         REP   #$30
         PLP
         RTS

L0306E7  PHD
         LDA   L030109+2
         PHA
         LDA   L030109
         PHA
         TSC
         TCD
         LDA   [$01]
         STA   L03010D
         LDA   $01,S
         CLC
         ADC   #$0004
         STA   L030109
         LDY   #$0002
         LDA   [$01],Y
         STA   L03010F
         LDA   $03,S
         ADC   #$0000
         STA   L030109+2
         PLA
         PLA
         PLD
         RTS

L030714  CLC
         ADC   #$07C8
         LDY   #$000B
         SEC
         SBC   #$0C00
         BMI   L030727
L030721  DEY
         SBC   #$0C00
         BPL   L030721
L030727  ADC   #$0C00
         PHY
         AND   #$FFFE
         TAY
         LDA   L03073B,Y
         PLY
         DEY
         BMI   L03073A
L030736  LSR
         DEY
         BPL   L030736
L03073A  RTS

L03073B  HEX   A951B251BC51C551CF51D851E251EB51
         HEX   F551FE51085211521A5224522D523752
         HEX   40524A5253525D52665270527A528352
         HEX   8D529652A052A952B352BC52C652CF52
         HEX   D952E352EC52F652FF52095313531C53
         HEX   26532F53395343534C5356535F536953
         HEX   73537C53865390539953A353AD53B653
         HEX   C053CA53D353DD53E753F053FA530454
         HEX   0E54175421542B5434543E5448545254
         HEX   5B5465546F54795482548C549654A054
         HEX   A954B354BD54C754D154DA54E454EE54
         HEX   F85402550C5515551F55295533553D55
         HEX   475550555A5564556E55785582558C55
         HEX   95559F55A955B355BD55C755D155DB55
         HEX   E555EF55F95503560C56165620562A56
         HEX   34563E56485652565C56665670567A56
         HEX   84568E569856A256AC56B656C056CA56
         HEX   D456DE56E856F256FC56065710571B57
         HEX   25572F57395743574D57575761576B57
         HEX   75577F57895794579E57A857B257BC57
         HEX   C657D057DB57E557EF57F95703580D58
         HEX   175822582C58365840584A5855585F58
         HEX   695873587D58885892589C58A658B158
         HEX   BB58C558CF58DA58E458EE58F9580359
         HEX   0D59175922592C59365941594B595559
         HEX   60596A5974597F59895993599E59A859
         HEX   B259BD59C759D159DC59E659F159FB59
         HEX   055A105A1A5A255A2F5A395A445A4E5A
         HEX   595A635A6E5A785A825A8D5A975AA25A
         HEX   AC5AB75AC15ACC5AD65AE15AEB5AF65A
         HEX   005B0B5B155B205B2A5B355B3F5B4A5B
         HEX   555B5F5B6A5B745B7F5B895B945B9F5B
         HEX   A95BB45BBE5BC95BD35BDE5BE95BF35B
         HEX   FE5B095C135C1E5C295C335C3E5C485C
         HEX   535C5E5C685C735C7E5C895C935C9E5C
         HEX   A95CB35CBE5CC95CD35CDE5CE95CF45C
         HEX   FE5C095D145D1F5D295D345D3F5D4A5D
         HEX   555D5F5D6A5D755D805D8A5D955DA05D
         HEX   AB5DB65DC15DCB5DD65DE15DEC5DF75D
         HEX   025E0D5E175E225E2D5E385E435E4E5E
         HEX   595E645E6E5E795E845E8F5E9A5EA55E
         HEX   B05EBB5EC65ED15EDC5EE75EF25EFD5E
         HEX   085F135F1E5F295F345F3F5F4A5F555F
         HEX   605F6B5F765F815F8C5F975FA25FAD5F
         HEX   B85FC35FCE5FD95FE45FEF5FFA5F0660
         HEX   11601C60276032603D60486053605E60
         HEX   6A60756080608B609660A160AC60B860
         HEX   C360CE60D960E460F060FB6006611161
         HEX   1C61286133613E614961556160616B61
         HEX   766182618D619861A361AF61BA61C561
         HEX   D161DC61E761F361FE61096214622062
         HEX   2B62366242624D62596264626F627B62
         HEX   866291629D62A862B462BF62CA62D662
         HEX   E162ED62F86204630F631A6326633163
         HEX   3D63486354635F636B63766382638D63
         HEX   9963A463B063BB63C763D263DE63E963
         HEX   F56300640C64186423642F643A644664
         HEX   51645D646964746480648B649764A364
         HEX   AE64BA64C664D164DD64E964F4640065
         HEX   0C65176523652F653A65466552655D65
         HEX   6965756581658C659865A465B065BB65
         HEX   C765D365DF65EA65F66502660E661966
         HEX   256631663D664966546660666C667866
         HEX   846690669C66A766B366BF66CB66D766
         HEX   E366EF66FB66066712671E672A673667
         HEX   42674E675A67666772677E678A679667
         HEX   A267AE67BA67C667D267DE67EA67F667
         HEX   02680E681A68266832683E684A685668
         HEX   62686E687A68866892689E68AA68B668
         HEX   C268CF68DB68E768F368FF680B691769
         HEX   236930693C694869546960696C697969
         HEX   856991699D69A969B669C269CE69DA69
         HEX   E769F369FF690B6A186A246A306A3C6A
         HEX   496A556A616A6D6A7A6A866A926A9F6A
         HEX   AB6AB76AC46AD06ADC6AE96AF56A016B
         HEX   0E6B1A6B276B336B3F6B4C6B586B646B
         HEX   716B7D6B8A6B966BA36BAF6BBB6BC86B
         HEX   D46BE16BED6BFA6B066C136C1F6C2C6C
         HEX   386C456C516C5E6C6A6C776C836C906C
         HEX   9C6CA96CB56CC26CCF6CDB6CE86CF46C
         HEX   016D0E6D1A6D276D336D406D4D6D596D
         HEX   666D736D7F6D8C6D986DA56DB26DBE6D
         HEX   CB6DD86DE56DF16DFE6D0B6E176E246E
         HEX   316E3E6E4A6E576E646E716E7D6E8A6E
         HEX   976EA46EB06EBD6ECA6ED76EE46EF06E
         HEX   FD6E0A6F176F246F316F3D6F4A6F576F
         HEX   646F716F7E6F8B6F986FA46FB16FBE6F
         HEX   CB6FD86FE56FF26FFF6F0C7019702670
         HEX   337040704D705A706770747081708E70
         HEX   9B70A870B570C270CF70DC70E970F670
         HEX   037110711D712A713771447151715E71
         HEX   6B71797186719371A071AD71BA71C771
         HEX   D471E271EF71FC710972167223723172
         HEX   3E724B7258726572737280728D729A72
         HEX   A872B572C272CF72DD72EA72F7720473
         HEX   12731F732C733A734773547362736F73
         HEX   7C738A739773A473B273BF73CC73DA73
         HEX   E773F57302740F741D742A7438744574
         HEX   537460746D747B7488749674A374B174
         HEX   BE74CC74D974E774F47402750F751D75
         HEX   2A7538754575537561756E757C758975
         HEX   9775A475B275C075CD75DB75E875F675
         HEX   047611761F762D763A76487656766376
         HEX   71767F768C769A76A876B576C376D176
         HEX   DF76EC76FA7608771677237731773F77
         HEX   4D775A7768777677847792779F77AD77
         HEX   BB77C977D777E577F37700780E781C78
         HEX   2A7838784678547862786F787D788B78
         HEX   9978A778B578C378D178DF78ED78FB78
         HEX   097917792579337941794F795D796B79
         HEX   797987799579A379B179BF79CD79DB79
         HEX   E979F879067A147A227A307A3E7A4C7A
         HEX   5A7A687A777A857A937AA17AAF7ABD7A
         HEX   CC7ADA7AE87AF67A047B137B217B2F7B
         HEX   3D7B4C7B5A7B687B767B857B937BA17B
         HEX   AF7BBE7BCC7BDA7BE97BF77B057C147C
         HEX   227C307C3F7C4D7C5B7C6A7C787C867C
         HEX   957CA37CB27CC07CCE7CDD7CEB7CFA7C
         HEX   087D177D257D347D427D507D5F7D6D7D
         HEX   7C7D8A7D997DA77DB67DC57DD37DE27D
         HEX   F07DFF7D0D7E1C7E2A7E397E487E567E
         HEX   657E737E827E917E9F7EAE7EBC7ECB7E
         HEX   DA7EE87EF77E067F147F237F327F417F
         HEX   4F7F5E7F6D7F7B7F8A7F997FA87FB67F
         HEX   C57FD47FE37FF17F00800F801E802D80
         HEX   3B804A8059806880778086809480A380
         HEX   B280C180D080DF80EE80FD800B811A81
         HEX   29813881478156816581748183819281
         HEX   A181B081BF81CE81DD81EC81FB810A82
         HEX   19822882378246825582648273828282
         HEX   9182A082B082BF82CE82DD82EC82FB82
         HEX   0A831983298338834783568365837483
         HEX   84839383A283B183C083D083DF83EE83
         HEX   FD830D841C842B843A844A8459846884
         HEX   788487849684A584B584C484D384E384
         HEX   F28402851185208530853F854E855E85
         HEX   6D857D858C859C85AB85BA85CA85D985
         HEX   E985F885088617862786368646865586
         HEX   6586748684869386A386B386C286D286
         HEX   E186F1860087108720872F873F874E87
         HEX   5E876E877D878D879D87AC87BC87CC87
         HEX   DB87EB87FB870B881A882A883A884988
         HEX   59886988798889889888A888B888C888
         HEX   D788E788F78807891789278936894689
         HEX   56896689768986899689A689B589C589
         HEX   D589E589F589058A158A258A358A458A
         HEX   558A658A758A858A958AA58AB58AC58A
         HEX   D58AE58AF58A058B158B258B358B458B
         HEX   568B668B768B868B968BA68BB68BC68B
         HEX   D78BE78BF78B078C178C278C388C488C
         HEX   588C688C788C898C998CA98CB98CCA8C
         HEX   DA8CEA8CFB8C0B8D1B8D2B8D3C8D4C8D
         HEX   5C8D6D8D7D8D8D8D9E8DAE8DBF8DCF8D
         HEX   DF8DF08D008E108E218E318E428E528E
         HEX   638E738E848E948EA48EB58EC58ED68E
         HEX   E68EF78E078F188F298F398F4A8F5A8F
         HEX   6B8F7B8F8C8F9D8FAD8FBE8FCE8FDF8F
         HEX   F08F0090119021903290439053906490
         HEX   759086909690A790B890C890D990EA90
         HEX   FB900B911C912D913E914E915F917091
         HEX   81919291A291B391C491D591E691F791
         HEX   0892189229923A924B925C926D927E92
         HEX   8F92A092B192C292D392E392F4920593
         HEX   16932793389349935A936B937D938E93
         HEX   9F93B093C193D293E393F49305941694
         HEX   279438944A945B946C947D948E949F94
         HEX   B094C294D394E494F594069518952995
         HEX   3A954B955D956E957F959095A295B395
         HEX   C495D695E795F8950A961B962C963E96
         HEX   4F966096729683969496A696B796C996
         HEX   DA96EC96FD960E972097319743975497
         HEX   6697779789979A97AC97BD97CF97E097
         HEX   F29704981598279838984A985B986D98
         HEX   7F989098A298B498C598D798E998FA98
         HEX   0C991E992F9941995399649976998899
         HEX   9A99AB99BD99CF99E199F299049A169A
         HEX   289A3A9A4B9A5D9A6F9A819A939AA59A
         HEX   B69AC89ADA9AEC9AFE9A109B229B349B
         HEX   469B589B6A9B7C9B8E9BA09BB29BC49B
         HEX   D69BE89BFA9B0C9C1E9C309C429C549C
         HEX   669C789C8A9C9C9CAE9CC09CD29CE49C
         HEX   F79C099D1B9D2D9D3F9D519D649D769D
         HEX   889D9A9DAC9DBF9DD19DE39DF59D089E
         HEX   1A9E2C9E3E9E519E639E759E889E9A9E
         HEX   AC9EBE9ED19EE39EF69E089F1A9F2D9F
         HEX   3F9F519F649F769F899F9B9FAE9FC09F
         HEX   D39FE59FF79F0AA01CA02FA041A054A0
         HEX   66A079A08CA09EA0B1A0C3A0D6A0E8A0
         HEX   FBA00EA120A133A145A158A16BA17DA1
         HEX   90A1A3A1B5A1C8A1DBA1EDA100A213A2
         HEX   26A238A24BA25EA271A283A296A2A9A2
         HEX   BCA2CFA2E1A2F4A207A31AA32DA340A3

         MX    %00
L03133B  ENT
         PHD
         TSC
         TCD
         PHA
         PHA
         PHA
         PHA
         PHA
         PEI   $0E
         PEI   $0C
         PEI   $0A
         PEI   $08
         PEI   $06
         _LoadSegName
         STAL  L05565D
         PLA
         STA   [$10]
         LDY   #$0002
         PLA
         STA   [$10],Y
         LDY   #$0004
         PLA
         STA   [$10],Y
         LDY   #$0006
         PLA
         STA   [$10],Y
         LDY   #$0008
         PLA
         STA   [$10],Y
         LDA   $04
         STA   $0E
         LDA   $03
         STA   $0D
         TDC
         TCS
         PLD
         CLC
         ADC   #$000C
         TCS
         RTL

L031384  PHA
         PHA
         TSC
         PHD
         TCD
         PHA
         PHA
         PEI   $0A
         PEI   $08
         LDA   L05565F
         ORA   #$0F00
         PHA
         PEA   $4000
         PHA
         PHA
         _NewHandle
         PLA
         PLX
         BCC   L0313AC
         LDY   #$0000
         TYX
         BRA   L0313B9
L0313AC  STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         TAY
L0313B9  PLD
         PLA
         PLA
         TYA
         RTL

L0313BE  ENT
         PHD
         TSC
         TCD
         LDA   $08
         CLC
         ADC   $06
         BEQ   L0313CA
         BCS   L0313F9
L0313CA  LDA   $0C
         CLC
         ADC   $06
         BEQ   L0313D3
         BCS   L0313F9
L0313D3  LDX   $08
         LDY   $0C
         LDA   $0D
         STA   $08
         LDA   $09
         STAL  L0313E5+1
         LDA   $06
         DEC
         PHB
L0313E5  MVN   $000000,$000000
         PLB
L0313E9  LDA   $04
         STA   $0E
         LDA   $03
         STA   $0D
         PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         RTL

L0313F9  LDA   $06
         TAY
         LSR
         TAX
         BCC   L031410
         SEP   #$20
         LDA   [$08]
         STA   [$0C]
         REP   #$20
         BRA   L031410
L03140A  DEY
         DEY
         LDA   [$08],Y
         STA   [$0C],Y
L031410  DEX
         BPL   L03140A
         BRA   L0313E9
L031415  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L03143C
         DEX
L03143C  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L03146D
         BVS   L03146B
         EOR   #$8000
L03146B  BMI   L03147E
L03146D  LDA   $01
         LDX   $03
         CLC
         ADC   #$0006
         BCC   L031478
         INX
L031478  STA   $10
         STX   $12
         BRA   L031498
L03147E  LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $10
         STX   $12
L031498  LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0314AA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L0314D1
         DEX
L0314D1  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         STA   $0A
         STX   $0C
         PLY
         PLY
         PLD
         RTL

L0314F6  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   L0553C3
         JSL   L150488
         TAY
         BNE   L03151D
         DEX
L03151D  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0005
         BCC   L031535
         INX
L031535  STA   $01
         STX   $03
         LDA   #$00FF
         AND   [$01]
         BIT   #$0080
         BEQ   L031546
         ORA   #$FF80
L031546  STA   $0A
         PLY
         PLY
         PLD
         RTL

L03154C  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   L0553C5
         LDX   L0553C7
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         PHX
         PHA
         LDA   L0553C3
         DEC
         JSL   L150488
         TAY
         BNE   L031574
         DEX
L031574  DEC
         PEA   $0000
         PEA   $0010
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDA   #$000A
         LDX   #$0000
         JSL   L033477
         BEQ   L0315A5
         BVS   L0315A3
         EOR   #$8000
L0315A3  BMI   L0315B6
L0315A5  LDA   $01
         LDX   $03
         CLC
         ADC   #$0006
         BCC   L0315B0
         INX
L0315B0  STA   $10
         STX   $12
         BRA   L0315D0
L0315B6  LDY   #$0008
         LDA   [$01],Y
         TAX
         DEY
         DEY
         LDA   [$01],Y
         STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $10
         STX   $12
L0315D0  LDA   $0C
         STA   $0E
         LDA   $0B
         STA   $0D
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L0315E2  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFA
         TCS
         TCD
         PHY
         JSL   L071BFF
         PLA
         STA   $01
         JSL   L030158
         STZ   L05535F
         PEI   $01
         JSL   L071AA4
         PLY
         PLY
         PLY
         PLD
         RTL

L031604  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L031B09
         LDA   #$0001
         STA   $0A
         PLY
         PLY
         PLD
         RTL

L031619  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         JSL   L0E0000
         PEA   $1B12
         JSL   L07272E
         PLY
         PLY
         PLD
         RTL

L031630  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         STZ   $0A
         PHY
         JSL   L0B0072
         PLA
         LSR
         BCS   L031645
         BRA   L03166D
L031645  PHY
         PHY
         PEA   $0012
         JSL   L031415
         PLA
         PLX
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         LDA   #$0000
         TAX
         JSL   L033477
         BMI   L03166D
         LDA   #$0001
         STA   $0A
L03166D  PLY
         PLY
         PLD
         RTL

L031671  PHD
         TSC
         CLC
         ADC   #$FECC
         TCS
         ADC   #$0041
         TCD
         STZ   $FC
         PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   $DF
         PLX
         STX   $E1
         LDA   #$00FF
         AND   [$DF]
         BNE   L0316AF
         LDA   L05538F
         BEQ   L0316AC
         LDA   #$0001
         STA   $FC
         LDA   #$0001
         STA   $C9
         STZ   $CB
         STZ   $CD
         BRL   L031965
         BRA   L0316AF
L0316AC  BRL   L03197B
L0316AF  TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L032589
         LDA   #$00FF
         AND   [$DF]
         BNE   L0316DE
         LDA   L05538F
         BEQ   L0316DB
         LDA   #$0001
         STA   $FC
         LDA   #$0001
         STA   $C9
         STZ   $CB
         STZ   $CD
         BRL   L031965
         BRA   L0316DE
L0316DB  BRL   L03197B
L0316DE  LDA   $DF
         LDX   $E1
         STA   $D7
         STX   $D9
         STZ   $EB
         STZ   $E9
         LDA   #$00FF
         AND   [$D7]
         CMP   #$002D
         BNE   L031700
         LDA   $D7
         LDX   $D9
         INC
         BNE   L0316FC
         INX
L0316FC  STA   $D7
         STX   $D9
L031700  TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L032589
L03170D  LDA   #$00FF
         AND   [$D7]
         STA   $E7
         LDA   $E7
         SEC
         SBC   #$0030
         BVS   L03171F
         EOR   #$8000
L03171F  BMI   L031726
         LDA   #$0000
         BRA   L031729
L031726  LDA   #$0001
L031729  BEQ   L031746
         PHA
         LDA   $E7
         SEC
         SBC   #$0039
         BEQ   L031740
         BVS   L031739
         EOR   #$8000
L031739  BPL   L031740
         LDA   #$0000
         BRA   L031743
L031740  LDA   #$0001
L031743  AND   $01,S
         PLX
L031746  CMP   #$0000
         BNE   L031759
         LDX   #$0000
         LDA   #$002E
         CMP   $E7
         BNE   L031756
         INX
L031756  TXA
         BEQ   L03177A
L031759  LDA   #$002E
         CMP   $E7
         BNE   L031767
         LDA   $EB
         INC
         STA   $EB
         BRA   L03176C
L031767  LDA   $E9
         INC
         STA   $E9
L03176C  LDA   $D7
         LDX   $D9
         INC
         BNE   L031774
         INX
L031774  STA   $D7
         STX   $D9
         BRA   L0317AB
L03177A  LDX   #$0000
         LDA   #$0020
         CMP   $E7
         BNE   L031785
         INX
L031785  TXA
         BNE   L031798
         PHA
         LDX   #$0000
         LDA   #$000D
         CMP   $E7
         BNE   L031794
         INX
L031794  TXA
         ORA   $01,S
         PLX
L031798  CMP   #$0000
         BNE   L0317AE
         LDX   #$0000
         LDA   $E7
         BNE   L0317A5
         INX
L0317A5  TXA
         BNE   L0317AE
         BRL   L03197B
L0317AB  BRL   L03170D
L0317AE  LDA   $E9
         SEC
         SBC   #$0001
         BVS   L0317B9
         EOR   #$8000
L0317B9  BPL   L0317C0
         LDA   #$0000
         BRA   L0317C3
L0317C0  LDA   #$0001
L0317C3  BEQ   L0317C8
         BRL   L03197B
L0317C8  LDA   $EB
         SEC
         SBC   #$0001
         BEQ   L0317D7
         BVS   L0317D5
         EOR   #$8000
L0317D5  BMI   L0317DC
L0317D7  LDA   #$0000
         BRA   L0317DF
L0317DC  LDA   #$0001
L0317DF  BEQ   L0317E4
         BRL   L03197B
L0317E4  LDA   $D7
         LDX   $D9
         STA   $DB
         STX   $DD
         TDC
         CLC
         ADC   #$00D7
         PEA   $0000
         PHA
         JSL   L032589
         LDA   #$00FF
         AND   [$D7]
         BEQ   L031803
         BRL   L03197B
L031803  SEP   #$20
         LDA   #$00
         STA   [$DB]
         REP   #$20
         STZ   $ED
L03180D  LDA   #$00FF
         AND   [$DF]
         CMP   #$002D
         BNE   L031839
         LDA   $ED
         EOR   #$0001
         STA   $ED
         LDA   $DF
         LDX   $E1
         INC
         BNE   L031826
         INX
L031826  STA   $DF
         STX   $E1
         TDC
         CLC
         ADC   #$00DF
         PEA   $0000
         PHA
         JSL   L032589
         BRA   L03180D
L031839  PEI   $E1
         PEI   $DF
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC9
         PHA
         JSL   L071FF8
         LDA   #$00FF
         LDX   #$FFC9
         AND   $00,X
         SEC
         SBC   #$0009
         BEQ   L03185F
         BVS   L03185D
         EOR   #$8000
L03185D  BMI   L0318BE
L03185F  LDA   $DF
         LDX   $E1
         STA   $E3
         STX   $E5
L031867  LDA   #$00FF
         AND   [$E3]
         BEQ   L031886
         LDA   #$00FF
         AND   [$E3]
         CMP   #$002E
         BEQ   L0318BE
         LDA   $E3
         LDX   $E5
         INC
         BNE   L031880
         INX
L031880  STA   $E3
         STX   $E5
         BRA   L031867
L031886  LDA   #$0001
         STA   $C9
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC9
         PHA
         JSL   L071DE3
         PLA
         STA   $CB
         PLX
         STX   $CD
         LDA   $ED
         BEQ   L0318BB
         PEI   $CD
         PEI   $CB
         LDA   $03,S
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         PLY
         INC
         BNE   L0318B7
         INX
L0318B7  STA   $CB
         STX   $CD
L0318BB  BRL   L031965
L0318BE  STZ   $C9
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFC9
         PHA
         JSL   L1501C1
         PEA   $000A
         JSL   L0313BE
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PLY
         PLX
         TSC
         CLC
         ADC   #$FFF6
         TCS
         PEA   $0000
         INC
         PHA
         PHX
         PHY
         PEA   $000A
         JSL   L0313BE
         JSL   L0330F3
         TAY
         CLC
         TSC
         ADC   #$000A
         TCS
         TYA
         STA   $D5
         LDA   $D5
         BEQ   L03197B
         LDA   $D5
         DEC
         BEQ   L03197B
         LDA   $ED
         BEQ   L031965
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         TDC
         CLC
         ADC   #$00CB
         PEA   $0000
         PHA
         PEA   $000A
         JSL   L0313BE
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         PEA   $000D
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$FFBF
         PHA
         PEA   $000A
         JSL   L0313BE
L031965  LDA   #$0001
         STA   $FC
         JSL   L0E0000
         TDC
         CLC
         ADC   #$00C9
         PEA   $0000
         PHA
         JSL   L0E07F9
L03197B  LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$013A
         TCS
         RTL

L03198D  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         SEC
         SBC   #$0000
         BMI   L0319CE
         CMP   #$0013
         BPL   L0319CE
         SEC
         SBC   #$0000
         BEQ   L0319C0
         SEC
         SBC   #$0011
         BEQ   L0319B9
         DEC
         BEQ   L0319B9
         BRA   L0319CE
L0319B9  LDA   #$0001
         STA   $0A
         BRA   L0319D0
L0319C0  PHY
         PEA   $0000
         PHD
         JSL   L031671
         PLA
         STA   $0A
         BRA   L0319D0
L0319CE  STZ   $0A
L0319D0  PLY
         PLY
         PLD
         RTL

L0319D4  ENT
         PHD
         TSC
         CLC
         ADC   #$FFE2
         TCS
         TCD
         STZ   $24
         PHY
         JSL   L03198D
         PLA
         LSR
         BCS   L0319EA
         BRL   L031A6A
L0319EA  LDA   #$0001
         STA   $24
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         CMP   #$0011
         BNE   L0319FF
         CPX   #$0000
L0319FF  BEQ   L031A6A
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         JSL   L0E00CC
         LDA   $0F
         BEQ   L031A56
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDA   $11
         LDX   $13
         TXY
         LDX   #$000B
         STA   $00,X
         TYA
         STA   $02,X
         PEA   $0000
         TDC
         CLC
         ADC   #$000B
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $030E
         _SANEFP816
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         PEA   $000A
         JSL   L0313BE
         BRA   L031A5D
L031A56  PEA   $18E2
         JSL   L07272E
L031A5D  TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L0E0C71
L031A6A  TSC
         CLC
         ADC   #$001E
         TCS
         PLD
         RTL

L031A72  ENT
         PHD
         TSC
         CLC
         ADC   #$FEF6
         TCS
         ADC   #$0013
         TCD
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         CMP   #$000E
         BNE   L031A8D
         CPX   #$0000
L031A8D  BNE   L031A96
         LDA   #$0001
         STA   $FC
         BRA   L031B01
L031A96  STZ   $FC
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         STX   $F3
         ORA   $F3
         BEQ   L031AA8
         BRA   L031B01
L031AA8  PHY
         PHY
         PEA   $0000
         JSL   L031415
         PLA
         STA   $ED
         PLX
         STX   $EF
         TDC
         CLC
         ADC   #$00ED
         PEA   $0000
         PHA
         JSL   L032589
         PEI   $EF
         PEI   $ED
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L071FF8
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         TDC
         CLC
         ADC   #$00F1
         PEA   $0000
         PHA
         JSL   L0B05B4
         PLA
         LSR
         BCS   L031AF2
         BRA   L031B01
L031AF2  LDA   #$0001
         STA   $FC
         JSL   L0E0000
         PEI   $F1
         JSL   L0E0E4B
L031B01  TSC
         CLC
         ADC   #$010A
         TCS
         PLD
         RTL

L031B09  ENT
         PHD
         TSC
         CLC
         ADC   #$FC54
         TCS
         ADC   #$02B5
         TCD
         PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         SEC
         SBC   #$0000
         BPL   L031B25
         BRL   L032482
L031B25  CMP   #$0019
         BMI   L031B2D
         BRL   L032482
L031B2D  ASL
         TAX
         LDAL  L031B35,X
         PHA
         RTS

L031B35  DA    L031B65+1
         DA    L031F31+2
         DA    L031F42+2
         DA    L031F42+2
         DA    L031F53+2
         DA    L032480+1
         DA    L032480+1
         DA    L031F64+2
         DA    L031F75+2
         DA    L03232B+2
         DA    L0320FE+2
         DA    L031DF2+2
         DA    L031E4F+2
         DA    L032228+2
         DA    L031D38+2
         DA    L031EE2+2
         DA    L032480+1
         DA    L031B6A+2
         DA    L031B9D+2
         DA    L032362+2
         DA    L032480+1
         DA    L031DC3+2
         DA    L031D5A+2
         DA    L032480+1
L031B65  DA    L0323D4+2
         BRL   L0324C5
L031B6A  BRL   L0324C5
         TDC
         CLC
         ADC   #$00B7
         PEA   $0000
         PHA
         JSL   L0E04A7
         TDC
         CLC
         ADC   #$00B7
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0B1426
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0E0EA8
L031B9D  BRL   L0324C5
         STZ   $E3
         PHY
         PHY
         JSL   L0E05AF
         PLA
         STA   $E5
         PLX
         STX   $E7
         PEI   $E7
         PEI   $E5
         LDA   #$0000
         TAX
         JSL   L033477
         BPL   L031BD8
         PEI   $E7
         PEI   $E5
         LDA   $03,S
         EOR   #$FFFF
         TAX
         PLA
         EOR   #$FFFF
         PLY
         INC
         BNE   L031BCF
         INX
L031BCF  STA   $E5
         STX   $E7
         LDA   #$0001
         STA   $E3
L031BD8  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE37
         PHA
         PEI   $E7
         PEI   $E5
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         LDA   #$00FF
         LDX   #$FF4F
         AND   $00,X
         STA   $F3
         LDA   L0553AD
         SEC
         SBC   $F3
         LDX   #$FE4D
         STA   $00,X
         LDX   #$FE4D
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L031C1C
         EOR   #$8000
L031C1C  BPL   L031C5F
         LDA   #$0001
         STA   $EF
L031C23  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040553
         PEA   L040553
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   $EF
         LDX   #$FE4D
         CMP   $00,X
         BEQ   L031C5F
         INC   $EF
         BRA   L031C23
L031C5F  LDA   L0553AF
         SEC
         SBC   #$0000
         BPL   L031C6B
         BRL   L031CF8
L031C6B  BNE   L031C70
         BRL   L031CF8
L031C70  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040555
         PEA   L040555
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   L0553AF
         LDX   #$FE4B
         STA   $00,X
         LDX   #$FE4B
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L031CB5
         EOR   #$8000
L031CB5  BPL   L031CF8
         LDA   #$0001
         STA   $EF
L031CBC  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040557
         PEA   L040557
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   $EF
         LDX   #$FE4B
         CMP   $00,X
         BEQ   L031CF8
         INC   $EF
         BRA   L031CBC
L031CF8  LDA   $E3
         BEQ   L031D2B
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040559
         PEA   L040559
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L031D2B  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0E0EA8
L031D38  BRL   L0324C5
         PHY
         JSL   L0E0678
         PLA
         LSR
         BCC   L031D50
         PEA   ^L032E38
         PEA   L032E38
         JSL   L0E0F0F
         BRA   L031D5A
L031D50  PEA   ^L032E0A
         PEA   L032E0A
         JSL   L0E0F0F
L031D5A  BRL   L0324C5
         TDC
         CLC
         ADC   #$00EB
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0016
         JSL   L0E0656
         LDA   $EB
         BMI   L031D81
         JSL   L072314
         JSL   L0E0C52
         BRA   L031DC3
L031D81  LDA   L0553CD
         LDX   L0553CF
         STA   $F3
         STX   $F5
         LDY   #$0002
         LDA   [$F3],Y
         TAX
         LDA   [$F3]
         PHX
         PHA
         LDA   $EB
         JSL   L150488
         JSL   L1512A5
         STA   $DF
         STX   $E1
         LDA   L0553CD
         LDX   L0553CF
         PHX
         PHA
         JSL   L0718BF
         PEI   $E1
         PEI   $DF
         JSL   L0E0EA8
         LDA   L0553CD
         LDX   L0553CF
         PHX
         PHA
         JSL   L07191C
L031DC3  BRL   L0324C5
         TDC
         CLC
         ADC   #$00DD
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0015
         JSL   L0E0656
         PEA   $0000
         TDC
         CLC
         ADC   #$FD4B
         PHA
         PEA   $0014
         PEI   $DD
         JSL   L0B383F
         JSL   L0E0F0F
L031DF2  BRL   L0324C5
         TDC
         CLC
         ADC   #$00D9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $000B
         JSL   L0E0656
         PEA   $0000
         TDC
         CLC
         ADC   #$FE37
         PHA
         LDA   $DB
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L04055B
         PEA   L04055B
         PEA   $0000
         TDC
         CLC
         ADC   #$FE23
         PHA
         LDA   $D9
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF27
         PHA
         PEA   $0003
         JSL   L1509CE
         JSL   L0E0F0F
L031E4F  BRL   L0324C5
         TDC
         CLC
         ADC   #$00D1
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0008
         PEA   $000C
         JSL   L0E0656
         PEA   $0000
         TDC
         CLC
         ADC   #$FE37
         PHA
         LDA   $D3
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L04055D
         PEA   L04055D
         PEA   $0000
         TDC
         CLC
         ADC   #$FE23
         PHA
         LDA   $D1
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L04055F
         PEA   L04055F
         PEA   $0000
         TDC
         CLC
         ADC   #$FE0F
         PHA
         LDA   $D7
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L040561
         PEA   L040561
         PEA   $0000
         TDC
         CLC
         ADC   #$FDFB
         PHA
         LDA   $D5
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FEFF
         PHA
         PEA   $0007
         JSL   L1509CE
         JSL   L0E0F0F
L031EE2  BRL   L0324C5
         TDC
         CLC
         ADC   #$006F
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0018
         PEA   $000F
         JSL   L0E0656
         LDA   L0553B3
         STA   $CF
         LDA   L055039
         LDX   L05503B
         CMP   $71
         BNE   L031F0C
         CPX   $73
L031F0C  BEQ   L031F16
         LDA   #$0001
         STA   L0553B3
         BRA   L031F1C
L031F16  LDA   #$0003
         STA   L0553B3
L031F1C  TDC
         CLC
         ADC   #$006F
         PEA   $0000
         PHA
         PEA   $0004
         JSL   L0B6DE3
         LDA   $CF
         STA   L0553B3
L031F31  BRL   L0324C5
         JSL   L0E0000
         PEA   ^L040563
         PEA   L040563
         JSL   L0E0F0F
L031F42  BRL   L0324C5
         JSL   L0E0000
         PEA   ^L040570
         PEA   L040570
         JSL   L0E0F0F
L031F53  BRL   L0324C5
         JSL   L0E0000
         PEA   ^L040577
         PEA   L040577
         JSL   L0E0F0F
L031F64  BRL   L0324C5
         JSL   L0E0000
         PEA   ^L04057F
         PEA   L04057F
         JSL   L0E0F0F
L031F75  BRL   L0324C5
         TDC
         CLC
         ADC   #$00C1
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0008
         JSL   L0E0656
         LDA   $C1
         BMI   L031FED
         CMP   #$0003
         BPL   L031FED
         SEC
         SBC   #$0000
         BEQ   L031FBD
         DEC
         BEQ   L031FA5
         DEC
         BEQ   L031FD5
         BRA   L031FED
L031FA5  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L04058B
         PEA   L04058B
         PEA   $0005
         JSL   L0313BE
         BRA   L031FFA
L031FBD  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040590
         PEA   L040590
         PEA   $0006
         JSL   L0313BE
         BRA   L031FFA
L031FD5  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040596
         PEA   L040596
         PEA   $0007
         JSL   L0313BE
         BRA   L031FFA
L031FED  LDAL  L04059D
         LDX   #$FF4F
         SEP   #$20
         STA   $00,X
         REP   #$20
L031FFA  LDA   $C3
         DEC
         BPL   L032002
         BRL   L0320E4
L032002  CMP   #$0004
         BMI   L03200A
         BRL   L0320E4
L03200A  SEC
         SBC   #$0000
         BEQ   L03201F
         DEC
         BEQ   L032051
         DEC
         BEQ   L032082
         DEC
         BNE   L03201C
         BRL   L0320B3
L03201C  BRL   L0320E4
L03201F  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L04059E
         PEA   L04059E
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRL   L0320F1
L032051  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405A7	; dateItems
         PEA   L0405A7
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0320F1
L032082  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405B2	; date
         PEA   L0405B2
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0320F1
L0320B3  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405B8	; time
         PEA   L0405B8
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0320F1
L0320E4  LDAL  L0405BE
         LDX   #$FF4F
         SEP   #$20
         STA   $00,X
         REP   #$20
L0320F1  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0E0EA8
L0320FE  BRL   L0324C5
         TDC
         CLC
         ADC   #$0087
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0030
         PEA   $000A
         JSL   L0E0656
         PHY
         TDC
         CLC
         ADC   #$0087
         PEA   $0000
         PHA
         PEA   $0001
         JSL   L0D0F6E
         PLA
         STA   $F1
         LDAL  L0405BF
         LDX   #$FF4F
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDA   $8D
         LDX   $8F
         CMP   $89
         BNE   L032142
         CPX   $8B
L032142  BNE   L03215C
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405C0
         PEA   L0405C0
         PEA   $0007
         JSL   L0313BE
         BRA   L03217E
L03215C  LDA   $91
         LDX   $93
         CMP   $89
         BNE   L032166
         CPX   $8B
L032166  BNE   L03217E
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405C7
         PEA   L0405C7
         PEA   $0006
         JSL   L0313BE
L03217E  LDA   $87
         DEC
         DEC
         BNE   L0321B5
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405CD
         PEA   L0405CD
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0321E4
L0321B5  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405D4
         PEA   L0405D4
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
L0321E4  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE37
         PHA
         PHY
         PEI   $8B
         PEI   $89
         PEI   $F1
         PEA   $0000
         JSL   L07AD84
         PLA
         LDX   #$0000
         BIT   #$8000
         BEQ   L03220E
         DEX
L03220E  PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         JSL   L0E0F0F
L032228  BRL   L0324C5
         TDC
         CLC
         ADC   #$00C9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0006
         PEA   $000D
         JSL   L0E0656
         LDAL  L0405DC
         LDX   #$FF4F
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDA   $C9
         BEQ   L032268
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405DD
         PEA   L0405DD
         PEA   $0009
         JSL   L0313BE
L032268  LDA   $CB
         BEQ   L0322C3
         LDA   #$00FF
         LDX   #$FF4F
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L0322AD
         BEQ   L0322AD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405E6
         PEA   L0405E6
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L0322C3
L0322AD  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405F1
         PEA   L0405F1
         PEA   $000A
         JSL   L0313BE
L0322C3  LDA   $CD
         BEQ   L03231E
         LDA   #$00FF
         LDX   #$FF4F
         AND   $00,X
         SEC
         SBC   #$0000
         BMI   L032308
         BEQ   L032308
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L0405FB
         PEA   L0405FB
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         BRA   L03231E
L032308  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040607
         PEA   L040607
         PEA   $000B
         JSL   L0313BE
L03231E  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0E0EA8
L03232B  BRL   L0324C5
         TDC
         CLC
         ADC   #$00C5
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0004
         PEA   $0009
         JSL   L0E0656
         PEI   $C7
         PEI   $C5
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0B1388
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0E0EA8
L032362  BRL   L0324C5
         TDC
         CLC
         ADC   #$00E9
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0002
         PEA   $0013
         JSL   L0E0656
         LDA   $E9
         BMI   L0323D4
         CMP   #$0005
         BPL   L0323D4
         SEC
         SBC   #$0000
         BEQ   L032398
         DEC
         BEQ   L0323A4
         DEC
         BEQ   L0323B0
         DEC
         BEQ   L0323BC
         DEC
         BEQ   L0323C8
         BRA   L0323D4
L032398  PEA   ^L040612
         PEA   L040612
         JSL   L0E0F0F
         BRA   L0323D4
L0323A4  PEA   ^L040619
         PEA   L040619
         JSL   L0E0F0F
         BRA   L0323D4
L0323B0  PEA   ^L04061F
         PEA   L04061F
         JSL   L0E0F0F
         BRA   L0323D4
L0323BC  PEA   ^L040624
         PEA   L040624
         JSL   L0E0F0F
         BRA   L0323D4
L0323C8  PEA   ^L04062B
         PEA   L04062B
         JSL   L0E0F0F
         BRA   L0323D4
L0323D4  BRL   L0324C5
         TDC
         CLC
         ADC   #$004F
         PEA   $0000
         PHA
         PEA   $0000
         PEA   $0020
         PEA   $0018
         JSL   L0E0656
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FE37
         PHA
         LDA   $4F
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
         LDA   #$0001
         STA   $EF
L032417  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         PEA   ^L040631
         PEA   L040631
         PEA   $0000
         TDC
         CLC
         ADC   #$FE37
         PHA
         TDC
         CLC
         ADC   #$004F
         STA   $F3
         STZ   $F5
         LDA   $EF
         ASL
         TAY
         LDA   [$F3],Y
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   $0000
         TDC
         CLC
         ADC   #$FE4F
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $0100
         JSL   L0313BE
         LDA   #$000F
         CMP   $EF
         BEQ   L032473
         INC   $EF
         BRA   L032417
L032473  PEA   $0000
         TDC
         CLC
         ADC   #$FF4F
         PHA
         JSL   L0E0EA8
L032480  BRA   L0324C5
L032482  PHY
         PHY
         JSL   L0B3773
         PLA
         PLX
         STA   $ED
         JSL   L0E0000
         PEA   ^L040633
         PEA   L040633
         PEA   $0000
         TDC
         CLC
         ADC   #$FE37
         PHA
         LDA   $ED
         JSL   L150488
         PHX
         PHA
         JSL   L07346C
         PEA   ^L04063A
         PEA   L04063A
         PEA   $0000
         TDC
         CLC
         ADC   #$FF33
         PHA
         PEA   $0003
         JSL   L1509CE
         JSL   L0E0F0F
L0324C5  TSC
         CLC
         ADC   #$03AC
         TCS
         PLD
         RTL

L0324CD  ENT
         PHD
         PHY
         TSC
         TCD
         LDA   [$08]
         AND   #$00FF
         BEQ   L0324F2
         TAY
         XBA
         STA   $01
         CLC
L0324DD  LDA   [$08],Y
         AND   #$00FF
         TAX
         LDAL  L0714D9,X
         EOR   $01
         ROL
         STA   $01
         DEY
         BNE   L0324DD
         AND   #$0FFC
L0324F2  CLC
         ADC   $0C
         STA   $10
         LDA   $0E
         BCC   L0324FC
         INC
L0324FC  STA   $12
         LDA   $06
         STA   $0E
         LDA   $05
         STA   $0D
         TDC
         TCS
         PLY
         PLD
         PLY
         PLY
         PLY
         PLY
         RTL

L03250F  ENT
         PHD
         TSC
         SEC
         SBC   #$000A
         TCD
         TCS
         STZ   $18
         PHA
         PHA
         PEI   $12
         PEI   $10
         _GetHandleSize
         PLA
         STA   $01
         PLA
         STA   $03
         LDA   [$14]
         AND   #$00FF
         INC
         STA   $05
         CLC
         ADC   $01
         TAX
         LDA   $03
         ADC   #$0000
         PHA
         PHX
         PEI   $12
         PEI   $10
         _SetHandleSize
         BCS   L032576
         PEI   $16
         PEI   $14
         LDA   [$10]
         STA   $07
         CLC
         ADC   $01
         TAX
         LDY   #$0002
         LDA   [$10],Y
         STA   $09
         ADC   $03
         PHA
         PHX
         PEA   $0000
         PEI   $05
         JSL   L070597
         LDA   [$07]
         INC
         STA   [$07]
         LDA   #$0001
         STA   $18
L032576  LDA   $0E
         STA   $16
         LDA   $0D
         STA   $15
         LDX   $0B
         TDC
         CLC
         ADC   #$0014
         TCS
         TXA
         TCD
         RTL

L032589  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$0A]
         STA   $01
         LDA   [$0A],Y
         STA   $03
         LDY   #$0000
         SEP   #$20
L03259E  LDA   [$01],Y
         CMP   #$20
         BEQ   L0325A8
         CMP   #$0D
         BNE   L0325AF
L0325A8  INY
         BNE   L03259E
         INC   $03
         BRA   L03259E
L0325AF  REP   #$20
         TYA
         CLC
         ADC   $01
         STA   [$0A]
         LDA   $03
         ADC   #$0000
         LDY   #$0002
         STA   [$0A],Y
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         PLY
         RTL

L0325D1  ENT
         PHD
         PHY
         PHY
         TSC
         TCD
         LDY   #$0002
         LDA   [$0A]
         STA   $01
         LDA   [$0A],Y
         STA   $03
         LDY   #$0000
         SEP   #$20
L0325E6  LDA   [$01],Y
         CMP   L055277
         BEQ   L0325F8
         CMP   #$00
         BEQ   L0325FD
         INY
         BNE   L0325E6
         INC   $03
         BRA   L0325E6
L0325F8  INY
         BNE   L0325FD
         INC   $03
L0325FD  REP   #$20
         TYA
         CLC
         ADC   $01
         STA   [$0A]
         LDA   $03
         ADC   #$0000
         LDY   #$0002
         STA   [$0A],Y
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         TDC
         TCS
         PLY
         PLY
         PLD
         PLY
         PLY
         RTL

L03261F  ENT
         PHD
         TSC
         SEC
         SBC   #$000E
         TCD
         TCS
         STZ   $1C
         LDY   #$0002
         LDA   [$14]
         STA   $01
         CLC
         ADC   #$0002
         STA   $05
         LDA   [$14],Y
         STA   $03
         ADC   #$0000
         STA   $07
         LDA   [$01]
         BEQ   L0326B3
         STA   $09
         LDA   $18
         ORA   $1A
         BEQ   L032652
         LDA   [$18]
         AND   #$00FF
         BNE   L032669
L032652  LDA   [$05]
         AND   #$00FF
         BEQ   L0326AC
         DEC   $09
         BEQ   L0326B3
         INC
         CLC
         ADC   $05
         STA   $05
         BCC   L032652
         INC   $07
         BRA   L032652
L032669  STA   $0B
L03266B  LDA   [$05]
         AND   #$00FF
         CMP   $0B
         BEQ   L032684
L032674  DEC   $09
         BEQ   L0326B3
         INC
         CLC
         ADC   $05
         STA   $05
         BCC   L03266B
         INC   $07
         BRA   L03266B
L032684  TAY
         LDA   #$0000
         TAX
         SEP   #$20
L03268B  LDA   [$18],Y
         TAX
         LDAL  L0714D9,X
         STA   $0D
         LDA   [$05],Y
         TAX
         LDAL  L0714D9,X
         CMP   $0D
         BNE   L0326A6
         DEY
         BNE   L03268B
         REP   #$20
         BRA   L0326AC
L0326A6  REP   #$20
         LDA   $0B
         BRA   L032674
L0326AC  LDA   $05
         SEC
         SBC   $01
         STA   $1C
L0326B3  LDA   $12
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

L0326C6  ENT
         ADRL  L03271E
         ADRL  L032720
         ADRL  L032723
         ADRL  L032727
         ADRL  L032730
         ADRL  L032734
         ADRL  L032736
         ADRL  L032738
         ADRL  L03273A
         ADRL  L03273D
         ADRL  L03273F
         ADRL  L032745
         ADRL  L03274F
         ADRL  L032759
         ADRL  L032767
         ADRL  L03276A
         ADRL  L03276C
         ADRL  L03276E
         ADRL  L032772
         ADRL  L032775
         ADRL  L032778
         ADRL  L03277A
L03271E  STR   '&'
L032720  STR   '&&'
L032723  STR   'and'
L032727  STR   'contains'
L032730  STR   'div'
L032734  STR   '/'
L032736  STR   '='
L032738  STR   '^'
L03273A  STR   '>='
L03273D  STR   '>'
L03273F  STR   'is in'
L032745  STR   'is not in'
L03274F  STR   'is within'
L032759  STR   'is not within'
L032767  STR   '<='
L03276A  STR   '<'
L03276C  STR   '-'
L03276E  STR   'mod'
L032772  STR   '<>'
L032775  STR   'or'
L032778  STR   '+'
L03277A  STR   '*'
L03277C  ENT
         ADRL  L100000
         ADRL  L100013
         ADRL  L100116
         ADRL  L10079F
         ADRL  L1007B5
         ADRL  L100802
         ADRL  L100137
         ADRL  L100887
         ADRL  L100137
         ADRL  L100137
         ADRL  L1008D4
         ADRL  L100916
         ADRL  L100AA7
         ADRL  L10092A
         ADRL  L100137
         ADRL  L100137
         ADRL  L100B4B
         ADRL  L100B5E
         ADRL  L100137
         ADRL  L100D72
         ADRL  L100D91
         ADRL  L100DA4
L0327D4  ENT
         ADRL  L031604
         ADRL  L031604
         ADRL  L031A72
         ADRL  L031604
         ADRL  L0B0072
         ADRL  L0319D4
         ADRL  $00000000
         ADRL  L0319D4
         ADRL  $00000000
         ADRL  $00000000
         ADRL  L031604
         ADRL  L031604
         ADRL  $00000000
         ADRL  $00000000
         ADRL  $00000000
         ADRL  $00000000
         ADRL  L03198D
         ADRL  L03198D
         ADRL  $00000000
         ADRL  L031A72
         ADRL  L03198D
         ADRL  L03198D
L03282C  ENT
         DW    $0032
         DW    $0032
         DW    $0014
         DW    $0028
         DW    $0046
         DW    $0046
         DW    $001E
         DW    $0050
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $0028
         DW    $003C
         DW    $0046
         DW    $001E
         DW    $000A
         DW    $003C
         DW    $0046
L032858  ENT
         DW    $0007
         DB    $00
         DB    $00
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $02
         DB    $02
         DB    $01
         DB    $01
         DB    $02
         DB    $01
         DB    $05
         DB    $01
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $02
         DB    $00
         DB    $01
         DB    $01
         DB    $01
         DB    $00
         DB    $02
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $02
         DB    $00
         DB    $02
         DB    $01
         DB    $06
         DB    $00
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $02
         DB    $02
         DB    $02
         DB    $00
         DB    $00
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $06
         DB    $06
         DB    $00
         DB    $00
         DB    $01
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
         DB    $06
         DB    $06
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L032950  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $00
         DB    $07
         DB    $0A
         DB    $16
         DB    $15
         DB    $03
         DB    $11
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $10
         DB    $07
         DB    $0A
         DB    $00
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
         DB    $06
         DB    $00
         DB    $09
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $05
         DB    $0B
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $13
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $09
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L032A48  ENT
         ADRL  L0B6EB9
         ADRL  L0B6EDE
         ADRL  L0B6F55
         ADRL  L0B7053
         ADRL  L0B70E5
         ADRL  L0B7274
         ADRL  L0B72CA
         ADRL  L0B737D
         ADRL  L0B73AE
         ADRL  L0B75FD
         ADRL  L0B7642
         ADRL  L0B76E6
L032A78  ENT
         ADR   L110000
         DB    $00
         ADR   L160012
         DB    $80
         ADR   L110059
         DB    $00
         ADR   L160020
         DB    $80
         ADR   L11006E
         DB    $00
         ADR   L1100D1
         DB    $00
         ADR   L1100E6
         DB    $00
         ADR   L16002E
         DB    $80
         ADR   L110161
         DB    $00
         ADR   L16003C
         DB    $80
         ADR   L16004A
         DB    $80
         ADR   L110171
         DB    $00
         ADR   L160058
         DB    $80
         ADR   L160066
         DB    $80
         ADR   L110191
         DB    $00
         ADR   L110216
         DB    $00
         ADR   L110287
         DB    $00
         ADR   L160074
         DB    $80
         ADR   L110325
         DB    $00
         ADR   L11036F
         DB    $00
         ADR   L110453
         DB    $00
         ADR   L160082
         DB    $80
         ADR   L110480
         DB    $00
         ADR   L11049E
         DB    $00
         ADR   L1104AE
         DB    $00
         ADR   L1105EC
         DB    $00
         ADR   L110634
         DB    $00
         ADR   L1107AC
         DB    $00
         ADR   L110804
         DB    $00
         ADR   L110844
         DB    $00
         ADR   L160090
         DB    $80
         ADR   L1108A0
         DB    $00
         ADR   L11108B
         DB    $00
         ADR   L16009E
         DB    $80
         ADR   L1111BD
         DB    $00
         ADR   L111389
         DB    $00
         ADR   L1600AC
         DB    $80
         ADR   L120000
         DB    $00
         ADR   L120093
         DB    $00
         ADR   L1200A3
         DB    $00
         ADR   L1600BA
         DB    $80
         ADR   L1600C8
         DB    $80
         ADR   L121673
         DB    $00
         ADR   L12189D
         DB    $00
         ADR   L1600D6
         DB    $80
         ADR   L121BD7
         DB    $00
         ADR   L121C4A
         DB    $00
         ADR   L121C5A
         DB    $00
         ADR   L121CC3
         DB    $00
         ADR   L121D38
         DB    $00
         ADR   L121D81
         DB    $00
         ADR   L1600E4
         DB    $80
L032B48  ENT
         DW    $0014
L032B4A  ENT
         DW    $0028
L032B4C  ENT
         DW    $002D
L032B4E  ENT
         DW    $0033
         DW    $0034
L032B52  ENT
         ADR   L130000
         DB    $00
         ADR   L1300E8
         DB    $40
         ADR   L1300FB
         DB    $00
         ADR   L130111
         DB    $40
         ADR   L130266
         DB    $00
         ADR   L13029D
         DB    $00
         ADR   L1302BA
         DB    $00
         ADR   L1302F8
         DB    $00
         ADR   L13030D
         DB    $00
         ADR   L130334
         DB    $00
         ADR   L1600F2
         DB    $00
         ADR   L13035B
         DB    $00
         ADR   L130370
         DB    $40
         ADR   L130383
         DB    $00
         ADR   L130399
         DB    $00
         ADR   L1303F0
         DB    $00
         ADR   L13040E
         DB    $00
         ADR   L130424
         DB    $00
         ADR   L13043A
         DB    $00
         ADR   L160100
         DB    $80
         ADR   L16010E
         DB    $80
         ADR   L16011C
         DB    $80
         ADR   L16012A
         DB    $80
         ADR   L130630
         DB    $00
         ADR   L130450
         DB    $00
         ADR   L130646
         DB    $00
         ADR   L130675
         DB    $00
         ADR   L13068B
         DB    $00
         ADR   L1306A1
         DB    $00
         ADR   L1306B7
         DB    $40
         ADR   L1307DC
         DB    $40
         ADR   L130901
         DB    $00
         ADR   L13095F
         DB    $00
         ADR   L1309C0
         DB    $00
         ADR   L1309F5
         DB    $00
         ADR   L130A3F
         DB    $00
         ADR   L130A6C
         DB    $00
         ADR   L130DFB
         DB    $00
         ADR   L130E38
         DB    $40
         ADR   L130EAA
         DB    $00
         ADR   L130EBF
         DB    $00
         ADR   L130F74
         DB    $00
         ADR   L131038
         DB    $00
         ADR   L13113F
         DB    $00
         ADR   L13118B
         DB    $00
         ADR   L1311A3
         DB    $00
         ADR   L1311E8
         DB    $00
         ADR   L13121C
         DB    $00
         ADR   L160138
         DB    $80
         ADR   L160146
         DB    $80
         ADR   L160154
         DB    $80
         ADR   L160162
         DB    $80
         ADR   L131294
         DB    $00
         ADR   L1312A9
         DB    $00
         ADR   L1312BF
         DB    $00
         ADR   L1312E9
         DB    $00
         ADR   L13133F
         DB    $00
         ADR   L131355
         DB    $00
         ADR   L13136B
         DB    $00
         ADR   L131384
         DB    $00
         ADR   L13139A
         DB    $00
         ADR   L1313F8
         DB    $00
         ADR   L13145D
         DB    $00
         ADR   L131473
         DB    $00
L032C52  ENT
         DW    $000C
L032C54  ENT
         DW    $0028
L032C56  ENT
         DW    $0035
         DW    $0040
L032C5A  ENT
         ADRL  L0D1D76
         ADRL  L0D1D91
         ADRL  L0D2016
         ADRL  L0D206A
         ADRL  L0D1DB6
         ADRL  L0D1DCD
         ADRL  L0D1E24
         ADRL  L0D1E6F
         ADRL  L0D1E86
         ADRL  L0D1F31
         ADRL  L031604
         ADRL  L0D2187
         ADRL  L0D1F84
         ADRL  L0D1F49
         ADRL  L0D11E7
         ADRL  L0D11D0
         ADRL  L0B7D5D
         ADRL  L0D20FB
         ADRL  L0D124F
         ADRL  L031604
         ADRL  L03198D
         ADRL  L03198D
         ADRL  L03198D
         ADRL  L0B0072
         ADRL  L0D167A
         ADRL  L0D167A
         ADRL  L0D167A
         ADRL  L0319D4
         ADRL  L0319D4
         ADRL  L031A72
         ADRL  L031A72
         ADRL  L0D2610
         ADRL  L0D264D
         ADRL  L0D2668
         ADRL  L0D25F9
         ADRL  L0D1EE2
         ADRL  $00000000
         ADRL  L0D128B
         ADRL  L0D24E9
         ADRL  L0D244F
         ADRL  $00000000
         ADRL  $00000000
         ADRL  $00000000
         ADRL  L0D320C
         ADRL  L0D318D
         ADRL  $00000000
         ADRL  L0D1404
         ADRL  L0D14D4
         ADRL  L0D15E3
         ADRL  L0D2A33
         ADRL  L0D1BB0
         ADRL  L0D2265
         ADRL  L0D1EB8
         ADRL  L0D14AB
         ADRL  L0D2C02
         ADRL  L0D2FBC
         ADRL  L0D2DEE
         ADRL  L0D2F12
         ADRL  L0D2F55
         ADRL  L0D1732
         ADRL  L0D28FB
         ADRL  L0D1CCE
         ADRL  $00000000
         ADRL  $00000000
         ADRL  $00000000
         ADRL  L0D1D3E
         ADRL  L0D2FE9
         ADRL  L0D25C0
         ADRL  L0D27B1
         ADRL  L0D27FC
         ADRL  L0D1AF4
         ADRL  L0D1B99
         ADRL  L0D20E4
         ADRL  L0D19B7
         ADRL  L0D3064
         ADRL  L0D2A90
         ADRL  L0D2001
         ADRL  L0D298A
         ADRL  L0D2036
         ADRL  L0D30FF
         ADRL  L0D3129
         DW    $0051
L032DA0  ENT
         ADRL  L032E02
         ADRL  L032E08
         ADRL  L032E0A
         ADRL  L032E11
         ADRL  L032E14
         ADRL  L032E17
         ADRL  L032E2F
         ADRL  L032E32
         ADRL  L032E35
         ADRL  L032E38
         ADRL  L032E3E
         ADRL  L032E42
         ADRL  L032E45
         ADRL  L032E48
         ADRL  L032E4B
         ADRL  L032E4E
         ADRL  L032E51
         ADRL  L032E54
         ADRL  L032E57
         ADRL  L032E5A
         ADRL  L032E5D
         ADRL  L032E60
         ADRL  L032E64
         ADRL  L032E67
         DB    $18
         DB    $00
L032E02  ENT
         STR   'down'
         DB    $00
L032E08  DB    $00
         DB    $00
L032E0A  ENT
         STR   'false'
         DB    $00
L032E11  STR   0C
         DB    $00
L032E14  STR   0A
         DB    $00
L032E17  STR   '3.14159265358979323846'
         DB    $00
L032E2F  STR   '"'
         DB    $00
L032E32  STR   ' '
         DB    $00
L032E35  STR   09
         DB    $00
L032E38  ENT
         STR   'true'
         DB    $00
L032E3E  ENT
         STR   'up'
         DB    $00
L032E42  STR   '0'
         DB    $00
L032E45  STR   '1'
         DB    $00
L032E48  STR   '2'
         DB    $00
L032E4B  STR   '3'
         DB    $00
L032E4E  STR   '4'
         DB    $00
L032E51  STR   '5'
         DB    $00
L032E54  STR   '6'
         DB    $00
L032E57  STR   '7'
         DB    $00
L032E5A  STR   '8'
         DB    $00
L032E5D  STR   '9'
         DB    $00
L032E60  STR   '10'
         DB    $00
L032E64  STR   ','
         DB    $00
L032E67  STR   ':'
         DB    $00
L032E6A  ENT
         STR   0D
         DB    $00
	
         MX    %00
L032E6D  ENT
         PHB
         PHD
         PHY
         TSC
         TCD
         LDA   #$0000
         TAX
         TAY
         PEA   >L0714D9
         PLB
         PLB
         SEP   #$20
         CLC
         LDA   [$09]
         TAY
         STA   $02
         STZ   $01
L032E86  LDA   [$09],Y
         TAX
         LDA   L0714D9,X
         EOR   $01
         DEY
         BEQ   L032E98
         ROL
         STA   $01
         ROL   $02
         BRA   L032E86
L032E98  XBA
         LDA   $02
         XBA
         REP   #$20
         AND   #$7FFF
         BNE   L032EA6
         LDA   #$0001
L032EA6  STA   $0D
         LDA   $07
         STA   $0B
         LDA   $05
         STA   $09
         TDC
         TCS
         PLY
         PLD
         PLY
         PLY
         PLB
         RTL

L032EB8  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PHY
         JSL   L0A4321
         PLA
         LSR
         BCC   L032F1B
         PHY
         JSL   L160170
         PLA
         LSR
         BCC   L032F10
*         PEA   ^L160170
*         PEA   L160170
*         JSL   L07187A
         LDA   #$FFFF
         STA   L0550B9
         JSL   L0A3E17
L032EE6  JSL   L0A32C6
         LDA   L05524F
         BEQ   L032EE6
         JSL   L0A129A
         PEA   $001C
         JSL   L099176
         JSL   L0903F2
         PEA   $0000
         PEA   $0001
         JSL   L090000
         JSL   L093A99
         JSL   L074D35
L032F10  LDA   #$0000
         STAL  L055453
         JSL   L0A3FE2
L032F1B  PLY
         PLY
         PLD
         RTL

L032F1F  ENT
         PHD
         PHA
         PEA   $0001
         TSC
         TCD
         LDA   $0A
         BEQ   L032F94
         LDX   #$0000
         BCC   L032F4A
         BIT   #$8000
         BEQ   L032F3B
         EOR   #$FFFF
         INC
         STA   $0A
         INX
L032F3B  LDA   $03
         BIT   #$8000
         BEQ   L032F4A
         EOR   #$FFFF
         INC
         STA   $03
         INX
         INX
L032F4A  LDY   #$0000
         BRA   L032F51
L032F4F  ASL   $01
L032F51  ASL   $0A
         BCC   L032F4F
         ROR   $0A
L032F57  LDA   $03
         CMP   $0A
         BCC   L032F68
         LDA   $03
         SEC
         SBC   $0A
         STA   $03
         TYA
         ORA   $01
         TAY
L032F68  LSR   $0A
         LSR   $01
         BCC   L032F57
         LDA   $03
         STA   $0A
         TYA
         CPX   #$0000
         BEQ   L032F90
         CPX   #$0003
         BEQ   L032F86
         EOR   #$FFFF
         INC
         CPX   #$0001
         BEQ   L032F90
L032F86  TAY
         LDA   $0A
         EOR   #$FFFF
         INC
         STA   $0A
         TYA
L032F90  PLY
         PLY
         PLD
         RTL

L032F94  PEA   $0004
         PEA   $0000
         PEA   $0000
         _SysFailMgr
L032FA4  ENT
         PHD
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
         BNE   L032FC1
         LDX   #$0000
         BRL   L033085
L032FC1  LDX   #$0000
         BCC   L032FFF
         LDA   $14
         BIT   #$8000
         BEQ   L032FDF
         EOR   #$FFFF
         STA   $14
         LDA   $12
         EOR   #$FFFF
         INC
         BNE   L032FDC
         INC   $14
L032FDC  STA   $12
         INX
L032FDF  LDA   $0B
         BIT   #$8000
         BEQ   L032FFF
         EOR   #$FFFF
         STA   $0B
         LDA   $09
         EOR   #$FFFF
         INC
         BNE   L032FF5
         INC   $0B
L032FF5  STA   $09
         INX
         INX
         BRA   L032FFF
L032FFB  ASL   $05
         ROL   $07
L032FFF  ASL   $12
         ROL   $14
         BCC   L032FFB
         ROR   $14
         ROR   $12
L033009  LDA   $0B
         CMP   $14
         BEQ   L033013
         BCC   L033032
         BRA   L033019
L033013  LDA   $09
         CMP   $12
         BCC   L033032
L033019  LDA   $09
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
L033032  LSR   $14
         ROR   $12
         LSR   $07
         ROR   $05
         BCC   L033009
         CPX   #$0000
         BEQ   L033071
         CPX   #$0003
         BEQ   L03305E
         LDA   $01
         EOR   #$FFFF
         STA   $01
         LDA   $03
         EOR   #$FFFF
         INC   $01
         BNE   L033057
         INC
L033057  STA   $03
         CPX   #$0001
         BEQ   L033071
L03305E  LDA   $09
         EOR   #$FFFF
         STA   $09
         LDA   $0B
         EOR   #$FFFF
         INC   $09
         BNE   L03306F
         INC
L03306F  STA   $0B
L033071  LDA   $09
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

L033085  PEA   $0004
         PEA   $0000
         PEA   $0000
         _SysFailMgr
L033095  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00E6
         TCS
         PEI   $FF
         PEI   $FD
         PEA   $0000
         TDC
         CLC
         ADC   #$00E8
         PHA
         PEA   $0009
         _SANEFP816
         BCS   L0330BC
         LDA   #$0000
L0330BC  STAL  L05565D
         PEI   $F0
         PEI   $EE
         PEI   $EC
         PEI   $EA
         PEI   $E8
         PLA
         STAL  L055477
         PLA
         STAL  L055479
         PLA
         STAL  L05547B
         PLA
         STAL  L05547D
         PLA
         STAL  L05547F
         LDA   #L055477
         LDX   #^L055477
         TAY
         TSC
         CLC
         ADC   #$0010
         TCS
         TYA
         PLD
         RTL

L0330F3  PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         PEA   $001C
         _SANEFP816
         BCS   L033116
         LDA   #$0000
L033116  STAL  L05565D
         JSL   L03392E
         CLC
         ADC   #$0004
         AND   #$00FF
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L03312F  ENT
         PHD
         TSC
         SEC
         SBC   #$00F1
         TCD
         ADC   #$00EA
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         PEA   $0014
         _SANEFP816
         BCS   L033152
         LDA   #$0000
L033152  STAL  L05565D
         PEI   $FF
         PEI   $FD
         PEI   $FB
         PEI   $F9
         PEI   $F7
         PLA
         STAL  L05549F
         PLA
         STAL  L0554A1
         PLA
         STAL  L0554A3
         PLA
         STAL  L0554A5
         PLA
         STAL  L0554A7
         LDA   #L05549F
         LDX   #^L05549F
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L033189  PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E0
         TCS
         PEI   $FF
         PEI   $FD
         PEI   $FB
         JSL   L0334C5
         PLY
         PLY
         PLY
         TAY
         BEQ   L0331AA
         LDA   #$FFFF
         BRL   L03332B
L0331AA  LDA   #L0334A2
         LDX   #^L0334A2
         PHX
         PHA
         LDAL  L055679+2
         TAX
         LDAL  L055679
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
         LDA   L05565B
         BNE   L0331EB
         LDA   L0556D0
         STAL  L055669
         LDX   L055451
         LDA   L05544F
         PHA
         TXA
         STAL  L05566B+2
         PLA
         STAL  L05566B
         BRL   L033328
L0331EB  LDA   #$0004
         STA   $E6
         LDA   #$0001
         STA   $EA
         LDX   #$0000
         TDC
         CLC
         ADC   #$00E6
         STX   $EE
         STA   $EC
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $2027
         LDX   #$0000
         JSL   GSOS2
         BCS   L033219
         LDA   #$0000
L033219  STAL  L05565D
         PHX
         PHA
         LDA   $E8
         CLC
         ADC   #$0005
         LDX   #$0000
         TAY
         BPL   L03322C
         DEX
L03322C  PHX
         PHA
         LDA   L05565F
         ORA   #$0F00
         PHA
         PEA   $4000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L03324A
         LDA   #$0000
L03324A  STAL  L05565D
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         STX   $E4
         STA   $E2
         LDA   L05565D
         BEQ   L03326B
         LDA   #$FFFF
         BRL   L03332B
L03326B  LDX   $E4
         LDA   $E2
         STX   $EE
         STA   $EC
         LDA   $E8
         CLC
         ADC   #$0005
         STA   [$EC]
         PEA   $0000
         TDC
         CLC
         ADC   #$00EA
         PHA
         PEA   $2027
         LDX   #$0000
         JSL   GSOS2
         BCS   L033293
         LDA   #$0000
L033293  STAL  L05565D
         LDY   #$0002
         LDA   [$E2],Y
         LDX   #$0000
         PHX
         PHA
         LDA   $E2
         CLC
         ADC   #$0004
         LDX   $E4
         BCC   L0332AC
         INX
L0332AC  JSL   L0338DC
         PLA
         PLX
         STA   $F0
         STX   $F2
         LDA   #$0000
         SEP   #$20
         STA   [$F0]
         REP   #$20
         LDA   $FB
         BEQ   L0332D7
         LDA   $E2
         CLC
         ADC   #$0004
         TAX
         LDA   $E4
         BCC   L0332CF
         INC
L0332CF  PHA
         PHX
         JSL   L0338E7
         PLY
         PLY
L0332D7  LDA   $E2
         CLC
         ADC   #$0004
         LDX   $E4
         BCC   L0332E2
         INX
L0332E2  PHX
         PHA
         LDAL  L05566B+2
         TAX
         LDAL  L05566B
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
         STA   L0556D0
         LDAL  L05566B+2
         TAX
         LDAL  L05566B
         STX   L055451
         STA   L05544F
         PEA   $007F
         PEA   $0000
         _SetInGlobals
         BCS   L033324
         LDA   #$0000
L033324  STAL  L05565D
L033328  LDA   #$0000
L03332B  TAY
         TSC
         CLC
         ADC   #$0014
         TCS
         TYA
         PLD
         RTL

L033335  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00EE
         TCS
         LDAL  L055679+2
         TAX
         LDAL  L055679
         STA   $F4
         STX   $F6
         LDX   $F6
         LDA   #$0024
         CLC
         ADC   $F4
         BCC   L033358
         INX
L033358  STX   $F2
         STA   $F0
         BRA   L03338F
L03335E  LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         STX   $F4
         ORA   $F4
         BEQ   L033383
         PEI   $FF
         LDY   #$0002
         LDA   [$F0],Y
         TAX
         LDA   [$F0]
         STA   $F4
         STX   $F6
         LDA   $F4
         LDX   $F6
         JSL   L0337C4
         PLY
L033383  LDA   $F0
         SEC
         SBC   #$0004
         STA   $F0
         BCS   L03338F
         DEC   $F2
L03338F  SEC
         LDA   $F0
         SBCL  L055679
         BNE   L0333A0
         LDA   $F2
         SBCL  L055679+2
         BRA   L0333A8
L0333A0  LDA   $F2
         SBCL  L055679+2
         REP   #$02
L0333A8  BEQ   L0333B1
         BVS   L0333AF
         EOR   #$8000
L0333AF  BMI   L03335E
L0333B1  LDA   $FF
         STA   L0555A1
         LDAL  L055679+2
         TAX
         LDAL  L055679
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
         JSL   L0337C4
         TSC
         CLC
         ADC   #$000A
         TCS
         PLD
         RTL

L0333DF  ENT
         PHD
         TSC
         SEC
         SBC   #$00E3
         TCD
         ADC   #$00DC
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00F3
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00E9
         PHA
         PEA   $000C
         _SANEFP816
         BCS   L03340B
         LDA   #$0000
L03340B  STAL  L05565D
         JSL   L03392E
         STA   [$FD]
         LDA   [$FD]
         SEC
         SBC   #$0000
         BVS   L033420
         EOR   #$8000
L033420  BMI   L03342D
         LDA   [$FD]
         AND   #$007F
         EOR   #$FFFF
         INC
         BRA   L033432
L03342D  LDA   [$FD]
         AND   #$007F
L033432  STA   [$FD]
         PEI   $F1
         PEI   $EF
         PEI   $ED
         PEI   $EB
         PEI   $E9
         PLA
         STAL  L05548B
         PLA
         STAL  L05548D
         PLA
         STAL  L05548F
         PLA
         STAL  L055491
         PLA
         STAL  L055493
         LDA   #L05548B
         LDX   #^L05548B
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L033467  ENT
         TAY
         LDA   $04,S
         TAX
         BEQ   L033473
         TYA
L03346E  ASL
         DEX
         BNE   L03346E
         TAY
L033473  TYA
         STA   $04,S
         RTL

L033477  ENT
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
         BNE   L033492
         TYA
         SBC   $03,S
         BRA   L033497
L033492  TYA
         SBC   $03,S
         REP   #$02
L033497  PHP
         LDA   $00,S
         STA   $08,S
         PLY
         PLY
         PLY
         PLY
         PLP
         RTL

L0334A2  PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEA   $0001
         PEA   ^L055599
         PEA   L055599
         JSL   L033856
         PLY
         PLY
         PLY
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0334C5  PHD
         TSC
         SEC
         SBC   #$00F5
         TCD
         ADC   #$00E0
         TCS
         STZ   L0556D0
         LDX   $FF
         LDA   $FD
         STX   $F0
         ORA   $F0
         BNE   L0334E9
         LDA   #$0001
         STA   L05565B
         LDA   #$0000
         BRL   L03379D
L0334E9  LDX   $FF
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
         PEA   ^L0556C7
         PEA   L0556C7
         JSL   L03390E
         PLY
         PLY
         PLY
         PLY
         PLY
         LDA   #$0000
         SEP   #$20
         STAL  L0556CF
         REP   #$20
         STZ   L05565B
         PHX
         PHA
         PEA   $0000
         PEA   $0004
         LDA   L05565F
         ORA   #$0F00
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L033544
         LDA   #$0000
L033544  STAL  L05565D
         PLA
         PLX
         STX   $EA
         STA   $E8
         LDA   L05565D
         BEQ   L033559
         LDA   L05565D
         BRL   L03379D
L033559  LDA   [$E4]
         AND   #$00FF
         BNE   L033563
         BRL   L0336E7
L033563  LDX   #$0000
         LDA   #$0002
         PHX
         PHA
         LDA   L0556D0
         CLC
         ADC   #$0002
         LDX   #$0000
         TAY
         BPL   L033579
         DEX
L033579  SEC
         JSL   L0337CC
         PEI   $EA
         PEI   $E8
         _SetHandleSize
         BCS   L03358E
         LDA   #$0000
L03358E  STAL  L05565D
         LDA   L0556D0
         PHA
         INC
         STA   L0556D0
         PLA
         LDX   #$0000
         TAY
         BPL   L0335A2
         DEX
L0335A2  STX   $F4
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
         JSL   L0338DC
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
         BEQ   L0335DB
         BRL   L03367A
L0335DB  LDA   L0556D0
         SEC
         SBC   #$0001
         LDX   #$0000
         TAY
         BPL   L0335E9
         DEX
L0335E9  STX   $F4
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
         JSL   L0338DC
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
         BCC   L03361E
         INC
L03361E  TAX
         LDY   #$0002
         STA   [$F0],Y
         PLA
L033625  INC   $E4
         BNE   L03362B
         INC   $E6
L03362B  LDX   $E6
         LDA   $E4
         STA   $F0
         STX   $F2
         LDA   [$F0]
         AND   #$00FF
         STA   $E2
         TAY
         BEQ   L033678
         LDA   $E2
         CMP   #$0022
         BNE   L033676
         INC   $E4
         BNE   L03364A
         INC   $E6
L03364A  LDX   $E6
         LDA   $E4
         STA   $F0
         STX   $F2
         LDA   [$F0]
         AND   #$00FF
         CMP   #$0022
         BNE   L033674
         LDY   #$FFFF
L03365F  INY
         LDA   [$E4],Y
         XBA
         STA   [$E4],Y
         AND   #$00FF
         BNE   L03365F
         LDA   $E4
         BNE   L033670
         DEC   $E6
L033670  DEC   $E4
         BRA   L033676
L033674  BRA   L033678
L033676  BRA   L033625
L033678  BRA   L0336A1
L03367A  LDX   $E6
         LDA   $E4
         INC   $E4
         BNE   L033684
         INC   $E6
L033684  STA   $F0
         STX   $F2
         LDA   [$F0]
         AND   #$00FF
         STA   $E2
         CMP   #$0020
         BEQ   L0336A1
         LDA   $E2
         BEQ   L0336A1
         LDA   $E2
         CMP   #$0009
         BEQ   L0336A1
         BRA   L03367A
L0336A1  LDX   $E6
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
         BNE   L0336C9
         LDA   $E4
         BNE   L0336C7
         DEC   $E6
L0336C7  DEC   $E4
L0336C9  LDA   [$E4]
         AND   #$00FF
         STA   $E2
         CMP   #$0020
         BEQ   L0336DC
         LDA   $E2
         CMP   #$0009
         BNE   L0336E4
L0336DC  INC   $E4
         BNE   L0336E2
         INC   $E6
L0336E2  BRA   L0336C9
L0336E4  BRL   L033559
L0336E7  PEI   $EA
         PEI   $E8
         _HLock
         BCS   L0336F7
         LDA   #$0000
L0336F7  STAL  L05565D
         LDY   #$0002
         LDA   [$E8],Y
         TAX
         LDA   [$E8]
         STX   L055451
         STA   L05544F
         LDA   L0556D0
         LDX   #$0000
         TAY
         BPL   L033713
         DEX
L033713  STX   $F4
         ASL
         ROL   $F4
         ASL
         ROL   $F4
         LDX   $F4
         PHX
         PHA
         LDX   L055451
         LDA   L05544F
         JSL   L0338DC
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
         BNE   L033746
         BRL   L03379A
L033746  PEA   ^L0556C7
         PEA   L0556C7
         JSL   L0338E7
         PLY
         PLY
         STZ   $E2
         BRA   L03378D
L033756  LDA   $E2
         LDX   #$0000
         TAY
         BPL   L03375F
         DEX
L03375F  STX   $F4
         ASL
         ROL   $F4
         ASL
         ROL   $F4
         LDX   $F4
         PHX
         PHA
         LDX   L055451
         LDA   L05544F
         JSL   L0338DC
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
         JSL   L0338E7
         PLY
         PLY
         INC   $E2
L03378D  LDA   $E2
         SEC
         SBC   L0556D0
         BVS   L033798
         EOR   #$8000
L033798  BPL   L033756
L03379A  LDA   #$0000
L03379D  TAY
         TSC
         CLC
         ADC   #$0014
         TCS
         TYA
         PLD
         RTL

L0337A7  PHD
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

L0337C4  SEP   #$10
         PHX
         REP   #$10
         DEC
         PHA
         RTL

L0337CC  ENT
         PHD
         PHX
         PHA
         TSC
         TCD
         LDX   $0A
         LDA   $0C
         BEQ   L0337DA
         LDX   #$0021
L0337DA  TXY
         BEQ   L0337E7
         LDA   $01
L0337DF  ASL
         ROL   $03
         DEX
         BNE   L0337DF
         STA   $01
L0337E7  LDA   $01
         STA   $0A
         LDA   $03
         STA   $0C
         PLY
         PLY
         PLD
         RTL

L0337F3  ENT
         PHD
         TSC
         SEC
         SBC   #$00E7
         TCD
         ADC   #$00E0
         TCS
         PEA   $0000
         TDC
         CLC
         ADC   #$00F7
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$00ED
         PHA
         PEA   $0012
         _SANEElems816
         BCS   L03381F
         LDA   #$0000
L03381F  STAL  L05565D
         PEI   $F5
         PEI   $F3
         PEI   $F1
         PEI   $EF
         PEI   $ED
         PLA
         STAL  L055521
         PLA
         STAL  L055523
         PLA
         STAL  L055525
         PLA
         STAL  L055527
         PLA
         STAL  L055529
         LDA   #L055521
         LDX   #^L055521
         TAY
         TSC
         CLC
         ADC   #$0006
         TCS
         TYA
         PLD
         RTL

L033856  TSC
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
         BNE   L033885
         INC
L033885  PHX
         PLD
         RTL

L033888  ENT
         PHD
         TSC
         SEC
         SBC   #$00F9
         TCD
         ADC   #$00F2
         TCS
         PEI   $FF
         PEA   $0001
         _SANEFP816
         BCS   L0338A4
         LDA   #$0000
L0338A4  STAL  L05565D
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0338B0  ENT
         PHD
         TSC
         SEC
         SBC   #$00F7
         TCD
         ADC   #$00F0
         TCS
         PEA   $0003
         _SANEFP816
         BCS   L0338CA
         LDA   #$0000
L0338CA  STAL  L05565D
         JSL   L03392E
         STA   [$FD]
         TSC
         CLC
         ADC   #$0006
         TCS
         PLD
         RTL

L0338DC  ENT
         CLC
         ADC   $04,S
         STA   $04,S
         TXA
         ADC   $06,S
         STA   $06,S
         RTL

L0338E7  TSC
         PHD
         TCD
         LDY   #$0000
         SEP   #$20
         LDA   [$04],Y
         BEQ   L033906
         XBA
L0338F4  INY
         BEQ   L033900
         LDA   [$04],Y
         BEQ   L033900
         XBA
         STA   [$04],Y
         BRA   L0338F4
L033900  XBA
         STA   [$04],Y
         TYA
         STA   [$04]
L033906  REP   #$20
         LDX   $06
         LDA   $04
         PLD
         RTL

L03390E  TSC
         PHD
         TCD
         LDY   $0C
         BEQ   L033928
         BMI   L033928
         SEP   #$20
         BRA   L03391F
L03391B  LDA   [$08],Y
         STA   [$04],Y
L03391F  DEY
         BNE   L03391B
         LDA   [$08]
         STA   [$04]
         REP   #$20
L033928  LDA   $04
         LDX   $06
         PLD
         RTL

L03392E  TXA
         RTL

L033930  ENT
         PHD
         PHX
         PHA
         PEA   $0000
         PEA   $0000
         TSC
         TCD
         LDX   #$0000
         BCC   L03398B
         LDA   $10
         BIT   #$8000
         BEQ   L033959
         EOR   #$FFFF
         STA   $10
         LDA   $0E
         EOR   #$FFFF
         INC
         BNE   L033956
         INC   $10
L033956  STA   $0E
         INX
L033959  LDA   $07
         BIT   #$8000
         BEQ   L03398B
         EOR   #$FFFF
         STA   $07
         LDA   $05
         EOR   #$FFFF
         INC
         BNE   L03396F
         INC   $07
L03396F  STA   $05
         DEX
         BRA   L03398B
L033974  LSR   $07
         ROR   $05
         BCC   L033987
         LDA   $01
         CLC
         ADC   $0E
         STA   $01
         LDA   $03
         ADC   $10
         STA   $03
L033987  ASL   $0E
         ROL   $10
L03398B  LDA   $05
         ORA   $07
         BNE   L033974
         CPX   #$0000
         BEQ   L0339A9
         LDA   $01
         EOR   #$FFFF
         STA   $01
         LDA   $03
         EOR   #$FFFF
         INC   $01
         BNE   L0339A7
         INC
L0339A7  STA   $03
L0339A9  LDA   $01
         STA   $0E
         LDA   $03
         STA   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L0339B7  ENT
         BCC   L0339CB
         TAY
         LDA   $04,S
         TAX
         BEQ   L0339D7
         TYA
         BEQ   L0339D8
         BPL   L0339D2
L0339C4  SEC
         ROR
         DEX
         BNE   L0339C4
         BRA   L0339D8
L0339CB  TAY
         LDA   $04,S
         TAX
         BEQ   L0339D7
         TYA
L0339D2  LSR
         DEX
         BNE   L0339D2
         TAY
L0339D7  TYA
L0339D8  STA   $04,S
         RTL


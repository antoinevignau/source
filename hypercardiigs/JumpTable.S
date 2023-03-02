*
* HypercardGS (TO DO)
* segment: $16 JumpTable
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   JumpTable.l
         lst   off

*---------------------------------------

         use   JumpTable.E
         use   JumpTable.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

         DS    8
         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D0717
L160012  ENT
         JMPL  L1D0717

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D0935
L160020  ENT
         JMPL  L1D0935

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D0B61
L16002E  ENT
         JMPL  L1D0B61

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D0ECF
L16003C  ENT
         JMPL  L1D0ECF

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D1027
L16004A  ENT
         JMPL  L1D1027

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D1273
L160058  ENT
         JMPL  L1D1273

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D18E7
L160066  ENT
         JMPL  L1D18E7

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D1B02
L160074  ENT
         JMPL  L1D1B02

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D1B74
L160082  ENT
         JMPL  L1D1B74

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D1FD0
L160090  ENT
         JMPL  L1D1FD0

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D21C6
L16009E  ENT
         JMPL  L1D21C6

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D25A0
L1600AC  ENT
         JMPL  L1D25A0

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D29D5
L1600BA  ENT
         JMPL  L1D29D5

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D2BFB
L1600C8  ENT
         JMPL  L1D2BFB

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D2FB9
L1600D6  ENT
         JMPL  L1D2FB9

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D38AF
L1600E4  ENT
         JMPL  L1D38AF

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3C72
L1600F2  ENT
         JMPL  L1D3C72

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3B19
L160100  ENT
         JMPL  L1D3B19

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3B40
L16010E  ENT
         JMPL  L1D3B40

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3B67
L16011C  ENT
         JMPL  L1D3B67

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3B8E
L16012A  ENT
         JMPL  L1D3B8E

         DW    $0000
         DW    $0001
         DW    ^L1D0000
L160134  ADRL  L1D3BB0
L160138  ENT
         JMPL  L1D3BB0

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3BD7
L160146  ENT
         JMPL  L1D3BD7

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3BFE
L160154  ENT
         JMPL  L1D3BFE

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3C25
L160162  ENT
         JMPL  L1D3C25

         DW    $0000
         DW    $0001
         DW    ^L170000
         ADRL  L1718D9
L160170  ENT
         JMPL  L1718D9

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B07F5
L16017E  ENT
         JMPL  L1B07F5

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B0390
L16018C  ENT
         JMPL  L1B0390

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B0C27
L16019A  ENT
         JMPL  L1B0C27

L16019E  DW    $0000
L1601A0  DW    $0001
L1601A2  DW    ^L1B0000
         ADRL  L1B31DB
L1601A8  ENT
         JMPL  L1B31DB

         DW    $0000
         DW    $0001
         DW    ^L1C0000
L1601B2  ADRL  L1C0EEB
L1601B6  ENT
         JMPL  L1C0EEB

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C08F1
L1601C4  ENT
         JMPL  L1C08F1

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C3B67
L1601D2  ENT
         JMPL  L1C3B67

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L190CE5
L1601E0  ENT
         JMPL  L190CE5

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0000
L1601EE  ENT
         JMPL  L1F0000

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1E68
L1601FC  ENT
         JMPL  L1B1E68

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1DD8
L16020A  ENT
         JMPL  L1B1DD8

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C0F31
L160218  ENT
         JMPL  L1C0F31

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B64BB
L160226  ENT
         JMPL  L1B64BB

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B570C
L160234  ENT
         JMPL  L1B570C

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B617F
L160242  ENT
         JMPL  L1B617F

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C042E
L160250  ENT
         JMPL  L1C042E

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C043A
L16025E  ENT
         JMPL  L1C043A

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B618B
L16026C  ENT
         JMPL  L1B618B

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C02F4
L16027A  ENT
         JMPL  L1C02F4

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5FAE
L160288  ENT
         JMPL  L1B5FAE

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B58A4
L160296  ENT
         JMPL  L1B58A4

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C11CC
L1602A4  ENT
         JMPL  L1C11CC

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C0F45
L1602B2  ENT
         JMPL  L1C0F45

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C0D35
L1602C0  ENT
         JMPL  L1C0D35

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L19253C
L1602CE  ENT
         JMPL  L19253C

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C082C
L1602DC  ENT
         JMPL  L1C082C

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C26E1
L1602EA  ENT
         JMPL  L1C26E1

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C2513
L1602F8  ENT
         JMPL  L1C2513

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B58F5
L160306  ENT
         JMPL  L1B58F5

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C0148
L160314  ENT
         JMPL  L1C0148

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1947
L160322  ENT
         JMPL  L1C1947

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C345D
L160330  ENT
         JMPL  L1C345D

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1F67
L16033E  ENT
         JMPL  L1C1F67

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5A66
L16034C  ENT
         JMPL  L1B5A66

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C086B
L16035A  ENT
         JMPL  L1C086B

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C35CF
L160368  ENT
         JMPL  L1C35CF

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1D2A
L160376  ENT
         JMPL  L1B1D2A

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1EAE
L160384  ENT
         JMPL  L1C1EAE

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C32D7
L160392  ENT
         JMPL  L1C32D7

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C3162
L1603A0  ENT
         JMPL  L1C3162

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B2BBC
L1603AE  ENT
         JMPL  L1B2BBC

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B2920
L1603BC  ENT
         JMPL  L1B2920

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L1901D8
L1603CA  ENT
         JMPL  L1901D8

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B2DA9
L1603D8  ENT
         JMPL  L1B2DA9

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1AFE
L1603E6  ENT
         JMPL  L1C1AFE

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C19FB
L1603F4  ENT
         JMPL  L1C19FB

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C2F89
L160402  ENT
         JMPL  L1C2F89

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B318C
L160410  ENT
         JMPL  L1B318C

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B4BE7
L16041E  ENT
         JMPL  L1B4BE7

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B27C8
L16042C  ENT
         JMPL  L1B27C8

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B26EB
L16043A  ENT
         JMPL  L1B26EB

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1A44
L160448  ENT
         JMPL  L1B1A44

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C3F07
L160456  ENT
         JMPL  L1C3F07

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C2911
L160464  ENT
         JMPL  L1C2911

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5590
L160472  ENT
         JMPL  L1B5590

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C2E34
L160480  ENT
         JMPL  L1C2E34

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C2877
L16048E  ENT
         JMPL  L1C2877

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E01BE
L16049C  ENT
         JMPL  L1E01BE

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E11EA
L1604AA  ENT
         JMPL  L1E11EA

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0000
L1604B8  ENT
         JMPL  L1E0000

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C0DF5
L1604C6  ENT
         JMPL  L1C0DF5

         DW    $0000
         DW    $0001
         DW    ^L180000
         ADRL  L180072
L1604D4  ENT
         JMPL  L180072

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F2985
L1604E2  ENT
         JMPL  L1F2985

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F28CD
L1604F0  ENT
         JMPL  L1F28CD

         DW    $0000
         DW    $0001
         DW    ^L180000
         ADRL  L180415
L1604FE  ENT
         JMPL  L180415

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1E19
L16050C  ENT
         JMPL  L1B1E19

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B6341
L16051A  ENT
         JMPL  L1B6341

         DW    $0000
         DW    $0001
         DW    ^L180000
         ADRL  L1809C6
L160528  ENT
         JMPL  L1809C6

         DW    $0000
         DW    $0001
         DW    ^L1A0000
         ADRL  L1A2014
L160536  ENT
         JMPL  L1A2014

         DW    $0000
         DW    $0001
         DW    ^L180000
         ADRL  L180F82
L160544  ENT
         JMPL  L180F82

         DW    $0000
         DW    $0001
         DW    ^L180000
         ADRL  L181129
L160552  ENT
         JMPL  L181129

         DW    $0000
         DW    $0001
         DW    ^L180000
         ADRL  L180000
L160560  ENT
         JMPL  L180000

         DW    $0000
         DW    $0001
         DW    ^L180000
         ADRL  L181111
L16056E  ENT
         JMPL  L181111

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1382
L16057C  ENT
         JMPL  L1C1382

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5567
L16058A  ENT
         JMPL  L1B5567

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C16C4
L160598  ENT
         JMPL  L1C16C4

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5CAC
L1605A6  ENT
         JMPL  L1B5CAC

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B2F08
L1605B4  ENT
         JMPL  L1B2F08

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L194905
L1605C2  ENT
         JMPL  L194905

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L194DE8
L1605D0  ENT
         JMPL  L194DE8

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L19543D
L1605DE  ENT
         JMPL  L19543D

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L195964
L1605EC  ENT
         JMPL  L195964

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L195FCD
L1605FA  ENT
         JMPL  L195FCD

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L19660D
L160608  ENT
         JMPL  L19660D

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0A81
L160616  ENT
         JMPL  L1E0A81

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E1236
L160624  ENT
         JMPL  L1E1236

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E07B6
L160632  ENT
         JMPL  L1E07B6

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E12F2
L160640  ENT
         JMPL  L1E12F2

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E1293
L16064E  ENT
         JMPL  L1E1293

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0757
L16065C  ENT
         JMPL  L1E0757

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E1345
L16066A  ENT
         JMPL  L1E1345

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0647
L160678  ENT
         JMPL  L1E0647

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F25A0
L160686  ENT
         JMPL  L1F25A0

         DW    $0000
         DW    $0001
         DW    ^L170000
         ADRL  L1716A6
L160694  ENT
         JMPL  L1716A6

         DW    $0000
         DW    $0001
         DW    ^L170000
         ADRL  L171220
L1606A2  ENT
         JMPL  L171220

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1766
L1606B0  ENT
         JMPL  L1B1766

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0238
L1606BE  ENT
         JMPL  L1E0238

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E03BA
L1606CC  ENT
         JMPL  L1E03BA

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0598
L1606DA  ENT
         JMPL  L1E0598

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E1305
L1606E8  ENT
         JMPL  L1E1305

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0498
L1606F6  ENT
         JMPL  L1E0498

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0276
L160704  ENT
         JMPL  L1E0276

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E113C
L160712  ENT
         JMPL  L1E113C

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F2A1D
L160720  ENT
         JMPL  L1F2A1D

         DW    $0000
         DW    $0001
         DW    ^L1D0000
         ADRL  L1D3C47
L16072E  ENT
         JMPL  L1D3C47

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F2805
L16073C  ENT
         JMPL  L1F2805

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F2AD4
L16074A  ENT
         JMPL  L1F2AD4

         DW    $0000
         DW    $0001
         DW    ^L1E0000
         ADRL  L1E0434
L160758  ENT
         JMPL  L1E0434

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C0000
L160766  ENT
         JMPL  L1C0000

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1407
L160774  ENT
         JMPL  L1C1407

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C2622
L160782  ENT
         JMPL  L1C2622

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C01BE
L160790  ENT
         JMPL  L1C01BE

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C01EA
L16079E  ENT
         JMPL  L1C01EA

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C07FC
L1607AC  ENT
         JMPL  L1C07FC

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C03FE
L1607BA  ENT
         JMPL  L1C03FE

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1B6D
L1607C8  ENT
         JMPL  L1C1B6D

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1485
L1607D6  ENT
         JMPL  L1C1485

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C035E
L1607E4  ENT
         JMPL  L1C035E

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C3EDC
L1607F2  ENT
         JMPL  L1C3EDC

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C29BA
L160800  ENT
         JMPL  L1C29BA

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C2CB9
L16080E  ENT
         JMPL  L1C2CB9

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C23F6
L16081C  ENT
         JMPL  L1C23F6

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C054A
L16082A  ENT
         JMPL  L1C054A

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C36C7
L160838  ENT
         JMPL  L1C36C7

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C17D1
L160846  ENT
         JMPL  L1C17D1

         DW    $0000
         DW    $0001
         DW    ^L1C0000
         ADRL  L1C1D29
L160854  ENT
         JMPL  L1C1D29

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1EC2
L160862  ENT
         JMPL  L1B1EC2

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5835
L160870  ENT
         JMPL  L1B5835

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B31B9
L16087E  ENT
         JMPL  L1B31B9

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B321E
L16088C  ENT
         JMPL  L1B321E

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B2615
L16089A  ENT
         JMPL  L1B2615

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1E80
L1608A8  ENT
         JMPL  L1B1E80

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B17BA
L1608B6  ENT
         JMPL  L1B17BA

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5819
L1608C4  ENT
         JMPL  L1B5819

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5BAC
L1608D2  ENT
         JMPL  L1B5BAC

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B3617
L1608E0  ENT
         JMPL  L1B3617

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5B24
L1608EE  ENT
         JMPL  L1B5B24

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B5BD5
L1608FC  ENT
         JMPL  L1B5BD5

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1912
L16090A  ENT
         JMPL  L1B1912

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B17FD
L160918  ENT
         JMPL  L1B17FD

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1BDE
L160926  ENT
         JMPL  L1B1BDE

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B1BC7
L160934  ENT
         JMPL  L1B1BC7

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B06A4
L160942  ENT
         JMPL  L1B06A4

         DW    $0000
         DW    $0001
         DW    ^L1B0000
         ADRL  L1B0FD2
L160950  ENT
         JMPL  L1B0FD2

         DW    $0000
         DW    $0001
         DW    ^L250000
         ADRL  L250008
L16095E  ENT
         JMPL  L250008

         DW    $0000
         DW    $0001
         DW    ^L250000
         ADRL  L25013A
L16096C  ENT
         JMPL  L25013A

         DW    $0000
         DW    $0001
         DW    ^L200000
         ADRL  L20068E
L16097A  ENT
         JMPL  L20068E

         DW    $0000
         DW    $0001
         DW    ^L200000
         ADRL  L2004D9
L160988  ENT
         JMPL  L2004D9

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L223060
L160996  ENT
         JMPL  L223060

         DW    $0000
         DW    $0001
         DW    ^L250000
         ADRL  L2508EE
L1609A4  ENT
         JMPL  L2508EE

         DW    $0000
         DW    $0001
         DW    ^L250000
         ADRL  L250311
L1609B2  ENT
         JMPL  L250311

         DW    $0000
         DW    $0001
         DW    ^L250000
         ADRL  L250938
L1609C0  ENT
         JMPL  L250938

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0EEB
L1609CE  ENT
         JMPL  L1F0EEB

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0C9E
L1609DC  ENT
         JMPL  L1F0C9E

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F12DB
L1609EA  ENT
         JMPL  L1F12DB

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0E0A
L1609F8  ENT
         JMPL  L1F0E0A

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0D8C
L160A06  ENT
         JMPL  L1F0D8C

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0099
L160A14  ENT
         JMPL  L1F0099

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F111B
L160A22  ENT
         JMPL  L1F111B

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0E85
L160A30  ENT
         JMPL  L1F0E85

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F1362
L160A3E  ENT
         JMPL  L1F1362

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F1EBC
L160A4C  ENT
         JMPL  L1F1EBC

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F18DF
L160A5A  ENT
         JMPL  L1F18DF

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F01D8
L160A68  ENT
         JMPL  L1F01D8

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F1010
L160A76  ENT
         JMPL  L1F1010

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0881
L160A84  ENT
         JMPL  L1F0881

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0AE1
L160A92  ENT
         JMPL  L1F0AE1

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0D49
L160AA0  ENT
         JMPL  L1F0D49

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0A4D
L160AAE  ENT
         JMPL  L1F0A4D

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0B5B
L160ABC  ENT
         JMPL  L1F0B5B

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F268B
L160ACA  ENT
         JMPL  L1F268B

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0909
L160AD8  ENT
         JMPL  L1F0909

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F10BD
L160AE6  ENT
         JMPL  L1F10BD

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0D71
L160AF4  ENT
         JMPL  L1F0D71

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F1087
L160B02  ENT
         JMPL  L1F1087

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0F98
L160B10  ENT
         JMPL  L1F0F98

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L2209AF
L160B1E  ENT
         JMPL  L2209AF

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L2212AA
L160B2C  ENT
         JMPL  L2212AA

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L220A38
L160B3A  ENT
         JMPL  L220A38

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F185D
L160B48  ENT
         JMPL  L1F185D

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0F4A
L160B56  ENT
         JMPL  L1F0F4A

         DW    $0000
         DW    $0001
         DW    ^L230000
         ADRL  L23077C
L160B64  ENT
         JMPL  L23077C

         DW    $0000
         DW    $0001
         DW    ^L240000
         ADRL  L2401B8
L160B72  ENT
         JMPL  L2401B8

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F20FD
L160B80  ENT
         JMPL  L1F20FD

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F1F72
L160B8E  ENT
         JMPL  L1F1F72

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0E37
L160B9C  ENT
         JMPL  L1F0E37

         DW    $0000
         DW    $0001
         DW    ^L210000
         ADRL  L211972
L160BAA  ENT
         JMPL  L211972

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L221B88
L160BB8  ENT
         JMPL  L221B88

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L220CC0
L160BC6  ENT
         JMPL  L220CC0

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L221983
L160BD4  ENT
         JMPL  L221983

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L22189F
L160BE2  ENT
         JMPL  L22189F

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L220F5E
L160BF0  ENT
         JMPL  L220F5E

         DW    $0000
         DW    $0001
         DW    ^L190000
         ADRL  L191BC5
L160BFE  ENT
         JMPL  L191BC5

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F03F9
L160C0C  ENT
         JMPL  L1F03F9

         DW    $0000
         DW    $0001
         DW    ^L1F0000
         ADRL  L1F0CF8
L160C1A  ENT
         JMPL  L1F0CF8

         DW    $0000
         DW    $0001
         DW    ^L220000
         ADRL  L2212FB
L160C28  ENT
         JMPL  L2212FB

         DS    4

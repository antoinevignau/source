8000 REM  CHARGEMENT VARIABLES
8001 REM RESTORE
8010 V=70:DIM V$(V)
8020 FOR N=1 TO V
8030 READ KO$
8040 V$(N)=KO$
8050 NEXT
8060 DATA 01N,01NORD,02S,02SUD,03E,03EST,04O,04OUEST,05MONT,05GRIM,06DESC
8070 DATA 10PREN,10RAMA,11POSE,12OUVR,13FERM,14ENTR,14AVAN,15ALLU,16ETEI
8080 DATA 17REPA,17DEPA,18LIS,19REGA,20RETO,21RENI,21SENS,22REMP,23VIDE
8090 DATA 24INVE,24LIST,25RIEN,25ATTE,26POIG,27COUT,28TOUR,29LAMP,30CODE
8100 DATA 31ESCA,32PIST,33PLAC,34TORC,35TELE,36MONS,37PETR,38POT,18LIT
8110 DATA 39CLEF,40PAPI,41LIVR,42BRIQ,43COMB,44COFF,45ROUG,46BLEU,47VERT
8120 DATA 48TITR,49ROBI,50CISE,51PORT
8124 DATA 52ACTI,53JETE,53LANCE,54EAU,55ENFI,55PASS,56APPU,56ENFO,57ENLE
8126 DATA 58RENT
8130 O=25:DIM O(O):DIM O$(O)
8140 FOR N=1 TO O
8150 READ KO 
8160 O(N)=KO
8170 NEXT
8180 DATA 06,05,05,08,08,00,00,11,11
8190 DATA 13,20,18,16,16,16,16,00,21
8200 DATA 00,22,25,12,00,25,00
8210 FOR N=1 TO O
8220 READ KO$
8230 O$(N)=KO$
8240 NEXT
8250 DATA UNE TORCHE ELECTRIQUE,UN ROBINET,UN CISEAU,UN TOURNEVIS
8260 DATA UNE LAMPE A PETROLE,UNE LAMPE PLEINE,UNE LAMPE ALLUME,UN COUTEAU
8270 DATA UN PAPIER,UN LIVRE,DU PETROLE DANS UN LAVABO BOUCHE
8280 DATA UNE CLEF,UN BOUTON ROUGE,UN BOUTON BLEU
8290 DATA UN BOUTON VERT,UN TELEPORTEUR,UN TELEPORTEUR REPARE
8300 DATA UNE COMBINAISON ARGENTEE,UNE COMBINAISON ENFILEE,UN MONSTRE ALL'EST
8310 DATA UN PISTOLET,UN BRIQUET,UN BRIQUET ALLUME,UN POT,UN POT PLEIN D'EAU
8320 M=25:DIM M$(M)
8330 FOR N=1 TO M
8340 READ KO$
8350 M$(N)=KO$
8360 NEXT
8370 DATA 00,0403030400,030200,04020305010600,04040107032000,020400
8380 DATA 04080109020500,030700,04130207031000 
8390 DATA 0409021100,0110031200,041100,030900,0209031500,00,00
8400 DATA00,00,0122032100,040500,0125022200,012100 
8410 DATA 0124042200,022300,022100
8430 AB=128:DIM A$(AB)
8440 FOR N=1 TO AB
8450 READ KO$
8460 A$(N)=KO$
8470 NEXT
8480 DATA 1400A01.I02D02M.,0500A03D08.D03N.,0500A03E08E09D24.D04D05I19E02M.
8485 DATA 0500A03E08D24.D04D06N.
8490 DATA 0500A03E07.I19M.,0500A03E03.I19M.,0500A03.I19E02M.,0600A19D08.D03N.
8500 DATA0600A19E08E09D24.D04D05I03M.,0600A19E08D24.D04D06N.,0600A19.I03M.
8505 DATA 0100A09E07B22.D07N.
8510 DATA 0100A09E03B05.D07N.,0100A09.I14E02M.,0100A14.I16E02M.
8515 DATA 0200A16E07B22.D07N.,0200A16E03B05.D07N.
8520 DATA 0200A16.I14E02M.,0400A15E03B05.D07N.,0400A15E07B22.D07N.
8522 DATA 0400A15.I14E02M.,0100A15E03.I17M.,0100A15E07.I17M.,0100A15.I17E02M.
8525 DATA 0200A17.F01I15M.
8530 DATA 0300A17.D08N.,0400A17.D09K.,0300A18.D10F03E01E02I17M.
8531 DATA 0400A21E03.I19M.
8535 DATA 0400A21E07.I19M.,0400A21.I19E02M.,0200A22E03.I19M.,0200A22E07.I19M.
8540 DATA 0200A22.I19E02M.,0200A19.D11N.,0400A19.D11N.,0300A22.D12I23M.
8541 DATA 2500A01.D13.,2500I01.D14K.,1244A03.D15M.,1034B01.B01J.,1027B08.B08J.
8545 DATA 1028B04.B04J.,1029B05.B05J.,1032B21.B21J.,1038B24.B24J.
8548 DATA 1039B12.B12J.,1040B09.B09J.,1041B10.B10J.,1043B18.B18J.
8550 DATA 1050B03.B03J.,1042B22.B22J.,1037A20B05.H11P05E05D16K.,1037A20.D17K.
8553 DATA 1134.C01J.,1127.C08J.,1128.C04J.,1129.C05J.,1132.C21J.,1138.C24J.
8555 DATA 1143E09.D62K.
8556 DATA 1139.C12J.,1140.C09J.,1141.C10J.,1143.C18J.,1150.C03J.,1142.C22J.
8560 DATA 2400.A00L.,1249A05.E04D20G0405J.,1349A05.F04J.,2238A05E04.P24E08J.
8563 DATA 2338A05E08.F08P24J.,2338E08.D21N.,1848B10.D22L.,1841B10.D23N.
8566 DATA1840B09.D24K.,2040B09.D25K.,1951A02.D26M.,1951.D27K.,2100A14.D28K.
8570 DATA 2100.D29K.,1542C22.D33K.,1542E07.D30K.,1542A14.D07N.
8575 DATA 1542A17E01.D10K.,1542E02.F02E07E06P22M.,1542.E07P22J.
8580 DATA 1529C05.D33K.,1529E03.D30K.,1529F07.D31L.,1529F05.D32L.
8590 DATA 1529E02.F02E03E06P06P05M.,1529.E03P06P05J.
8595 DATA 1642C22.D33K.,1642F07.D30K.,1642E06E03.D36F07P22M.
8597 DATA 1642E06.E02F07F06P22M.
8600 DATA 1642.F07P22M.,1629C05.D33K.,1629F03.D30K.,1629E07E06.D34F03P05M.
8605 DATA 1629E06.E02F06F03P05M.,1629.F03P05M.,1534B01.D35N.
8610 DATA 1735I16.D45K.,1735E02.D43K.,1735F03.D44K.,1735C04.D46K.
8615 DATA 1735.P16E10J.,5600A16F10.D47K.,5646A16.D48N.,5647A16.D48N.
8620 DATA 5645A16F09.D50D06N.,5645A16.D49I18M.,5543D18E09.D30K.
8625 DATA 5543D18.P18E09J.,574& E AND18F09.D30K.,5743D18.P18F09J.
8630 DATA 1233A24C12.D51K.,1233A24C03.D52N.,1233A24.G0503E11D63K.
8635 DATA 2636E11.D54F11D55K.,5350E11.D54F11D55K.,5232B21.D56N.
8640 DATA 5830F08.D57.,5830.D58D59.,1233A06.D61M.
8650 DATA 1233A25.D64N.
8700 PL=INT(RND(1)*9000+1000)
8800 C=14:DIMC$(C) 
8810 FOR N=1 TO C
8820 READ KO$
8830 C$(N)=KO$
8840 NEXT N
8850 DATA G03E03.D00N.,G04E04.D01N.,I14I16I17I19.F02.,G07E07.D18N.,GO1.D19N.
8860 DATA H06C03C08.D37N.,H08D08.D39L.,H06D03.D38L.,G08E08B24.D40D21N.
8870 DATA H02.D41N.,G09E02.D42N.,G05E11.D52N.,I24E11.D53D52N.,.L.

8955 DIM P(13):P(11)=0:P(12)=0
8960 SAL=1
8970 FOR N=1 TO 10
8980 P(N)=0:C(N)=0
8985 NEXT
8990 C(3)=14:C(7)=12:C(1)=80:C(9)=12

9000 PRINT CHR$(4);"BLOAD CHAIN,A520"
9010 CALL 520"JEU"

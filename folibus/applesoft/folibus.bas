0  GOTO 9000
1  GOTO 10
10  HOME 
19  DIM S(10)
20  DIM C(10)
30 SALLE = 1
40  DIM P$(2)
50  DIM O(O)
60  FOR X = 1 TO O
70 O(X) = Q(X)
80  NEXT X
100  IF S(2) = 0 THEN 200
110  IF C(2) THEN C(2) = C(2) - 1
120  IF S(3) THEN 200
130  PRINT "On y voit rien. Mieux vaudrait allumer pour eviter les ennuis."
140  IF C(3) THEN C(3) = C(3) - 1
150  GOTO 1000
200  GOTO 210
210  PRINT 
215  IF SALLE > 11 THEN 230
220  ON SALLE GOSUB 8010,8020,8030,8040,8050,8060,8070,8080,8090,8100,8110: GOTO 300
230  ON SALLE GOSUB 0,0,0,0,0,0,0,0,0,0,0,8120,8130,8140,8150,8160,8170: GOTO 300
250  PRINT "Erreur de programme": STOP 
300 F = 0
310  FOR X = 1 TO O
315 RW = O(X)
320  IF RW <  > (SALLE) THEN  GOTO 500
330  IF F THEN 400
340  PRINT "Il y a aussi:"
350 F = 1
400  PRINT "   ";O$(X)
500  NEXT X
1000  GOTO 1010
1010 T = 1
1020  GOTO 2000
1100  IF C(1) THEN C(1) = C(1) - 1
1110  IF C(4) THEN C(4) = C(4) - 1
1120  INPUT "Que faites vous?>";Y$
1140  HOME 
1150 Y = 0
1160  PRINT ">";Y$
1170 P$(2) = "00"
1200  FOR W = 1 TO 2
1210  GOSUB 6000
1220  IF Y >  LEN (Y$) THEN 1300
1230  IF P$(W) = "00" THEN 1210
1240  NEXT W
1300  IF P$(1) <  > "00" THEN 1600
1310  PRINT "Pardon?"
1320  GOTO 100
1600  GOTO 1610
1610 Z = 1
1620 T$ =  MID$ (M$(SALLE),Z,2)
1630  IF T$ = "00" THEN 1900
1640  IF T$ <  > P$(1) THEN 1700
1650 SALLE =  VAL ( MID$ (M$(SALLE),Z + 2,2))
1660  GOTO 100
1700 Z = Z + 4
1710  GOTO 1620
1900 T = 0
1910 XX0 = 0
2000  GOTO 2010
2010 CP = 0
2100 CP = CP + 1
2110  IF T = 0 THEN 2300
2120 E$ = C$(CP)
2130  GOTO 2600
2300  IF CP <  = (A) THEN 2400
2310  IF XXO THEN 1000
2320  PRINT "Impossible ";
2330  IF  VAL (P$(1)) < 13 THEN  PRINT "prendre cette direction";
2340  PRINT "."
2350  GOTO 100
2400  IF  LEFT$ (A$(CP),2) <  > P$(1) THEN 2100
2410 Y$ =  MID$ (A$(CP),3,2)
2420  IF Y$ <  > "00" AND Y$ <  > P$(2) THEN 2100
2430 E$ =  MID$ (A$(CP),5)
2600  GOTO 2610
2610 E = 1
2700  IF  MID$ (E$,E,1) = "." THEN 3000
2710 TYPE =  ASC ( MID$ (E$,E,1)) - 64
2720 N =  VAL ( MID$ (E$,E + 1,2))
2800  ON (TYPE) GOSUB 2900,2910,2920,2930,2940,2950,2960,2970
2810  IF  NOT OK THEN  GOTO 2100
2820 E = E + 3
2830  GOTO 2700
2900 OK = (N = SALLE)
2905  RETURN 
2910 OK = (O(N) = SALLE OR O(N) < 0)
2915  RETURN 
2920 OK = (O(N) <  > SALLE AND O(N) >  = 0)
2925  RETURN 
2930 OK = (O(N) < 0)
2935  RETURN 
2940 OK = (S(N) <  > 0)
2945  RETURN 
2950 OK = (S(N) = 0)
2955  RETURN 
2960 OK = (C(N) = 1)
2965  RETURN 
2970 OK = ( INT ( RND (1) * 100) <  = N)
2975  RETURN 
3000  GOTO 3010
3010 XXO = 1
3020 E = E + 1
3100  IF  MID$ (E$,E,1) = "." THEN 2100
3105  IF  MID$ (E$,E,1) = "" THEN TYPE = 0: GOTO 3120
3110 TYPE =  ASC ( MID$ (E$,E,1)) - 64
3120  IF  MID$ (E$,E + 1,1) <  > "." THEN N =  VAL ( MID$ (E$,E + 1,2))
3200 BREAK = 0
3205  IF TYPE > 11 THEN  GOTO 3215
3210  ON TYPE GOSUB 4000,4100,4200,4300,4400,4500,4600,4700,4800,4900,5000: GOTO 3220
3215  ON TYPE GOSUB 0,0,0,0,0,0,0,0,0,0,0,5100,5200,5300,5400,5500,5600: GOTO 3220
3218  PRINT "Erreur de programme": STOP 
3220  IF BREAK = 100 THEN 100
3221  IF BREAK = 1000 THEN 1000
3222  IF BREAK = 1100 THEN 1100
3230 E = E + 3
3240  GOTO 3100
4000  PRINT 
4010  PRINT "Vous tenez:"
4020 F = 1
4030  FOR X = 1 TO O
4040  IF O(X) >  = 0 THEN 4070
4050  PRINT "   ";O$(X)
4060 F = 0
4070  NEXT X
4080  IF F THEN  PRINT "   Rien."
4090 BREAK = 100
4095  RETURN 
4100  IF S(1) < 5 THEN 4140
4110  PRINT "Vous ne pouvez porter plus."
4120 BREAK = 100
4130  RETURN 
4140  IF O(N) =  - 1 THEN 4180
4150 O(N) =  - 1
4160 S(1) = S(1) + 1
4170  RETURN 
4180  PRINT "Vous l'avez deja."
4190  GOTO 4120
4200  IF O(N) =  - 1 THEN 4240
4210  PRINT "Vous n'avez pas";O$(N)
4220 BREAK = 100
4230  RETURN 
4240 O(N) = SALLE
4250 S(1) = S(1) - 1
4260  RETURN 
4300  PRINT 
4302  IF N > 11 AND N < 22 THEN 4312
4303  IF N > 21 AND N < 32 THEN 4313
4304  IF N > 31 AND N < 41 THEN 4314
4305  IF N > 41 THEN 4315
4310  ON N GOSUB 7010,7020,7030,7040,7050,7060,7070,7080,7090,7100: GOTO 4320
4312  ON (N - 10) GOSUB 7110,7120,7130,7140,7150,7160,7170,7180,7190,7200: GOTO 4320
4313  ON (N - 20) GOSUB 7210,7220,7230,7240,7250,7260,7270,7280,7290,7300: GOTO 4320
4314  ON (N - 30) GOSUB 7310,7320,7330,7340,7350,7360,7370,7380,7390,7400: GOTO 4320
4315  ON (N - 40) GOSUB 7410,7420,7430,7440,7450,7460: GOTO 4320
4316  PRINT "Erreur de programme": STOP 
4320  RETURN 
4400 S(N) = 1
4410  RETURN 
4500 S(N) = 0
4510  RETURN 
4600 C(N) =  VAL ( MID$ (E$,E + 3,2))
4610 E = E + 2
4620  RETURN 
4700 X = O(N)
4710 O(N) = O(N + 1)
4720 O(N + 1) = X
4730  RETURN 
4800 O(N) = SALLE
4810  RETURN 
4900  IF O(N) < 0 THEN S(1) = S(1) - 1
4910 O(N) = 0
4920  RETURN 
5000 SALLE = N
5010  RETURN 
5100  PRINT "D'acccord."
5200 BREAK = 1000
5210  RETURN 
5300 BREAK = 1100
5310  RETURN 
5400 BREAK = 100
5410  RETURN 
5500  PRINT "Etes vous sur?";
5510  INPUT W$
5520  PRINT W$
5530  IF  LEFT$ (W$,1) <  > "O" THEN  RETURN 
5600  GOTO 9999
6000  GOTO 6010
6010 W$ = ""
6015 P$(W) = "00"
6020  GOSUB 6600
6025  IF (FIN) THEN  RETURN 
6030  FOR Q = 1 TO 4
6040 W$ = W$ +  MID$ (Y$,Y,1)
6050  GOSUB 6500
6060  IF (FIN) THEN 6100
6070  NEXT Q
6080  GOSUB 6500
6090  IF (FIN) = 0 THEN 6080
6100  IF W$ = "   " THEN  RETURN 
6110  FOR Q = 1 TO V
6120  IF W$ =  MID$ (V$(Q),3) THEN 6200
6130  NEXT Q
6140  RETURN 
6200 P$(W) =  LEFT$ (V$(Q),2)
6210  RETURN 
6500 Y = Y + 1
6510 FIN = (Y >  LEN (Y$))
6520  IF (FIN) THEN  RETURN 
6530 FIN = ( MID$ (Y$,Y,1) = " ")
6540  RETURN 
6600 Y = Y + 1
6610 FIN = (Y >  LEN (Y$))
6620  IF (FIN) THEN  RETURN 
6630  IF  MID$ (Y$,Y,1) = " " THEN 6600
6640  RETURN 
7010  PRINT "La generatrice vient d'exploser. La maison n'existe plus. Vous non plus."
7015  RETURN 
7020  PRINT "L'ascenseur ne bouge pas. Il faut peut-etre du courant?"
7025  RETURN 
7030  PRINT "La porte vient de se fermer. Impossible de l'ouvrir."
7035  RETURN 
7040  PRINT "Vous avez raison. La curiosite est un vilain defaut..."
7045  RETURN 
7050  PRINT "L'odeur que vous sentiez etait celle d'un gaz explosif. Vous etes mort."
7055  RETURN 
7060  PRINT "Il faudrait peut-etre du feu..."
7065  RETURN 
7070  PRINT "Ah, Ah...Vous etes mon prisonnier!"
7075  RETURN 
7080  PRINT "Vous avez dit papier? Quel papier?"
7085  RETURN 
7090  PRINT "Bravez les interdits!"
7095  RETURN 
7100  PRINT "Elle l'air de s'emballer..."
7105  RETURN 
7110  PRINT "La generatrice se met en marche."
7115  RETURN 
7120  PRINT "Impossible, elle ne veut rien savoir."
7125  RETURN 
7130  PRINT "Bravo. Je ne savais pas que vous aviez des dons d'electricien."
7135  RETURN 
7140  PRINT "Votre machine est reparee mais elle sent le chaud."
7145  RETURN 
7150  PRINT "La machine est reparee. Dommage qu'il n'y ait pas de courant."
7155  RETURN 
7160  PRINT "Il faudrait peut etre des outils."
7165  RETURN 
7170  PRINT "L'ascenseur semble monter..."
7175  RETURN 
7180  PRINT "L'ascenseur ne bouge pas."
7185  RETURN 
7190  PRINT "Le cable vient de casser. Vous vous ecrasez en bas. Mort."
7195  RETURN 
7200  PRINT "Il fait noir. Il faudrait allumer."
7205  RETURN 
7210  PRINT "Vous vous ecrasez au sol."
7215  RETURN 
7220  PRINT "Il y a une clef."
7225  RETURN 
7230  PRINT "La porte est fermee a clef."
7235  RETURN 
7240  PRINT "Tiens, la porte du placard se referme."
7245  RETURN 
7250  PRINT "La generatrice vient d'exploser, l'ascenseur est detruit.": PRINT "Vous vous en rechappez de justesse."
7255  RETURN 
7260  PRINT "Vous etes mort electrocute."
7265  RETURN 
7270  PRINT "Vous avez raison. Rien ne sert de courrir."
7275  RETURN 
7280  PRINT "Dehors il fait noir. On ne voit pas le sol."
7285  RETURN 
7290  PRINT "C'est deja fait."
7295  RETURN 
7300  PRINT "Vous etes au bout de la corde."
7305  RETURN 
7310  PRINT "Vraiment pas au point cette machine! Vous etes mort."
7315  RETURN 
7320  PRINT "Il faudrait peut-etre ouvrir la fenetre."
7325  RETURN 
7330  PRINT "Tant pis. On a essaye."
7335  RETURN 
7340  PRINT "Bravo, quel trait de genie!"
7345  RETURN 
7350  PRINT "Une trappe s'ouvre sous vos pieds. Vous etes mort."
7355  RETURN 
7360  PRINT "Sage precaution."
7365  RETURN 
7370  PRINT "C'est du poison. Vous etes mort."
7375  RETURN 
7380  PRINT "Vous apprenez a piloter une soucoupe en 1 lecon."
7385  RETURN 
7390  PRINT "Ca ne se pilote pas comme ca!"
7395  RETURN 
7400  PRINT "C'est de l'acide. Vous etes mort."
7405  RETURN 
7410  PRINT "Il y a de l'eau. Vous vous noyez."
7415  RETURN 
7420  PRINT "Ouf! Vous vous retrouvez dehors..."
7425  RETURN 
7430  PRINT "Sain et sauf..."
7435  RETURN 
7440  PRINT "Ca marche... Mais il n'y avait pas assez de carburant."
7445  RETURN 
7450  PRINT "Mais vous etes tout bleu! Ce doit etre les pillules."
7455  RETURN 
7460  PRINT "Et irradie. Vous mourez au bout de quelques jours."
7465  RETURN 
8010  PRINT "Vous etes devant une maison. La porte est ouverte."
8015  RETURN 
8020  PRINT "Vous etes dans le couloir. Il y a une porte a l'est et une porte a l'ouest."
8025  RETURN 
8030  PRINT "Vous etes dans le salon. Il y a une porte a l'ouest."
8035  RETURN 
8040  PRINT "Il y a une drole d'odeur."
8045  RETURN 
8050  PRINT "Il y a une grosse machine qui ressemble a une generatrice avec un bouton vert,": PRINT "un bouton rouge. Il y a une porte au nord."
8055  RETURN 
8060  PRINT "Une machinerie d'ascenseur. Une porte au nord."
8065  RETURN 
8070  PRINT "Il y a plein de materiel"
8075  RETURN 
8080  PRINT "Vous etes dans un ascenseur. Il y a un bouton HAUT, un bouton BAS."
8085  RETURN 
8090  PRINT "L'ascenseur vient de s'arreter."
8095  RETURN 
8100  PRINT "La piece est humide. Il ya a des fils qui trainent par terre.": PRINT "Il y a une fenetre et une porte au nord."
8105  RETURN 
8110  PRINT "La porte derriere vous vient de se refermer. Bonjour..Comment ecrivez": PRINT "vous ceci en 4 lettres?"
8115  RETURN 
8120  PRINT "PASSE,PRESENT,AVENIR": PRINT "PASSE,PRESENT ET AVENIR"
8125  RETURN 
8130  PRINT "Vous vous retrouvez dans le laboratoire du professeur. Il y a une porte": PRINT "en fer a l'ouest. Une porte au sud marquee <<DANGER>>."
8135  RETURN 
8140  PRINT "Il y a une douche. Un trou dans le sol."
8145  RETURN 
8150  PRINT "Il y a un cube noir d'au moins une tonne. Une echelle monte. Une porte a l'est."
8155  RETURN 
8160  PRINT "Vous etes dans une bibliotheque."
8165  RETURN 
8170  PRINT "Vous etes dans une soucoupe sur une terasse."
8175  RETURN 
9000 O = 20: DIM Q(20): DIM O$(20)
9010 Q(1) = 2:Q(2) = 0:Q(3) = 2:Q(4) = 0:Q(5) = 6:Q(6) = 7:Q(7) = 3:Q(8) = 6:Q(9) = 0:Q(10) = 10
9020 Q(11) = 16:Q(12) = 0:Q(13) = 13:Q(14) = 0:Q(15) = 13:Q(16) = 0:Q(17) = 13:Q(18) = 0
9030 Q(19) = 13:Q(20) = 16
9040 O$(1) = "BRIQUET":O$(2) = "BRIQUET ALLUME":O$(3) = "BOUGIE"
9050 O$(4) = "BOUGIE ALLUMEE":O$(5) = "PLACARD":O$(6) = "OUTILS":O$(7) = "PAPIER"
9060 O$(8) = "FILS ARRACHES":O$(9) = "FILS REPARES":O$(10) = "UNE CORDE"
9070 O$(11) = "GANTS CAOUTCHOUC":O$(12) = "GANTS ENFILES":O$(13) = "PILLULE K"
9080 O$(14) = "PILLULE K AVALEE":O$(15) = "PILLULE Z":O$(16) = "PILLULE Z AVALEE"
9090 O$(17) = "PILLULE Q":O$(18) = "PILLULE Q AVALEE":O$(19) = "PISTOLET LASER"
9100 O$(20) = "LIVRE"
9200 V = 72: DIM V$(72)
9205 V$(1) = "01N":V$(2) = "01NORD":V$(3) = "02E":V$(4) = "02EST":V$(5) = "03S"
9210 V$(6) = "03SUD":V$(7) = "04O":V$(8) = "04OUES":V$(9) = "05M":V$(10) = "05MONT"
9215 V$(11) = "06D":V$(12) = "06DESC":V$(13) = "07ENTR":V$(14) = "07AVAN"
9220 V$(15) = "05HAUT":V$(16) = "06BAS":V$(17) = "13LIT":V$(18) = "35REGA"
9225 V$(19) = "14TOUR":V$(20) = "14RETO":V$(21) = "15PREN":V$(22) = "15RAMA"
9230 V$(23) = "16PAPI":V$(24) = "17ALLU":V$(25) = "18BOUG":V$(26) = "19APPU"
9235 V$(27) = "19ENFO":V$(28) = "20VERT":V$(29) = "21ROUG":V$(30) = "22OUTI"
9240 V$(31) = "23OUVR":V$(32) = "55DOUC":V$(33) = "25PLAC":V$(34) = "26PORT"
9245 V$(35) = "27ASCE":V$(36) = "28BRIQ":V$(37) = "29REPA":V$(38) = "29DEPA"
9250 V$(39) = "30RIEN":V$(40) = "31MACH":V$(41) = "32POSE":V$(42) = "33QUIT"
9255 V$(43) = "35DECR":V$(44) = "34INVE":V$(45) = "36CLEF":V$(46) = "31FILS"
9260 V$(47) = "37CORD":V$(48) = "38FENE":V$(49) = "39ACCR":V$(50) = "40SAUT"
9265 V$(51) = "39ATTA":V$(52) = "41SORT":V$(53) = "42FERM":V$(54) = "43CECI"
9270 V$(55) = "44ATTE":V$(56) = "45TAPE":V$(57) = "46FRAP":V$(58) = "47PASS"
9275 V$(59) = "47AVEN":V$(60) = "48PRES":V$(61) = "49MET":V$(62) = "50AVAL"
9280 V$(63) = "51GANT":V$(64) = "52K":V$(65) = "53Q":V$(66) = "54Z":V$(67) = "49ENFI"
9285 V$(68) = "56LASE":V$(69) = "56PIST":V$(70) = "57LIVR":V$(71) = "58DEMA"
9290 V$(72) = "58PILO"
9300 R = 17: DIM M$(17)
9310 M$(1) = "00":M$(2) = "0204040500":M$(3) = "0405020200":M$(4) = "040200"
9320 M$(5) = "0106020300":M$(6) = "0108030500":M$(7) = "00":M$(8) = "030600"
9330 M$(9) = "00":M$(10) = "011100":M$(11) = "00":M$(12) = "00":M$(13) = "00"
9340 M$(14) = "021300":M$(15) = "05170216011300":M$(16) = "041500":M$(17) = "061500"
9400 C = 12:C = C + 1: DIM C$(13)
9410 C$(1) = "A04E05.D05Q.":C$(2) = "E04F10.G0405E10.":C$(3) = "G04A10.G0499F09D25."
9420 C$(4) = "A04F05.D20.":C$(5) = "E06F10.G0405E10.":C$(6) = "G04.D01Q."
9430 C$(7) = "A10E09.D26Q.":C$(8) = "A10E07.F06F07F04F08.":C$(9) = "A11F07.G0103E07."
9440 C$(10) = "A11G01.D35Q.":C$(11) = "A12.F06F04.":C$(12) = "A12.F08F05F07."
9450 C$(13) = ".N."
9500 A = 91: DIM A$(91)
9505 A$(1) = "0700A01.D03K02O.":A$(2) = "3000A01.D04Q.":A$(3) = "1528B01.B01L."
9510 A$(4) = "1518B03.B03L.":A$(5) = "1718B03C01.D06N."
9515 A$(6) = "1718B01B03.H03E05E03L.":A$(7) = "1728B01.H01E055E03L."
9520 A$(8) = "3400.A00.":A$(9) = "3300.P00.":A$(10) = "3500.O00."
9525 A$(11) = "3218B03.C03L."
9530 A$(12) = "3228B01.C01L.":A$(13) = "1316D07.D07N.":A$(14) = "1516B07.B07D22N."
9535 A$(15) = "1316C07.D08N.":A$(16) = "1416C07.D08N.":A$(17) = "1416D07.D09N."
9540 A$(18) = "1920A05F06F04.E04D11D10N.":A$(19) = "1921A05F06F04.D11E03E06N."
9545 A$(20) = "1921A05E04.D12N.":A$(21) = "1920A05E06.D12N."
9550 A$(22) = "1536A03F08.E08L.":A$(23) = "2325A06F08.D23N."
9555 A$(24) = "2325A06E08C06.K07F08O.":A$(25) = "1522A07B06.B06D24K06L."
9560 A$(26) = "2325A06E08B06.K06N.":A$(27) = "2931A06D06E06B08.D13E07H08N."
9563 A$(28) = "2931A06D06E04B08.D14H08E07N."
9565 A$(29) = "2931A06D06F04F06B08.D15H08E07N.":A$(30) = "2931A06C06B08.D16N."
9570 A$(31) = "0500A08E07E06.D17K09O.":A$(32) = "0500A08F07F08.D18E08N."
9575 A$(33) = "0600A08F07F08.D18E08N.":A$(34) = "0500A08F08F06.D18E08N."
9580 A$(35) = "0600A08F08F06.D18E08N.":A$(36) = "0500A08E08.D19Q."
9585 A$(37) = "0600A08F08.D19Q.":A$(38) = "0600A08E07E06.D19Q."
9590 A$(39) = "4100A09.E09K10O.":A$(40) = "0600A09.D19Q.":A$(41) = "3000A09.D27N."
9595 A$(42) = "2338A10F04.E04L.":A$(43) = "4238A10F04.D29N."
9600 A$(44) = "4238A10E04.F04L.":A$(45) = "4238A10F04.D29N."
9605 A$(46) = "3937A10E04F06.E06L.":A$(47) = "0600A10E06.E08D30N."
9610 A$(48) = "4000A10E07.D21Q.":A$(49) = "4000A10E04.D21Q."
9615 A$(50) = "4000A10F04.D23N.":A$(51) = "0500A10E08.F08D33N."
9620 A$(52) = "4400A09.D27N.":A$(53) = "4300A11.D34K12O.":A$(54) = "4543A11.D34K12O."
9625 A$(55) = "4643A11.D34K12O.":A$(56) = "3222B06.C06L.":A$(57) = "1947A12.D31Q."
9630 A$(58) = "1948A12.Q13O.":A$(59) = "4951B11F04.E04H11D36N."
9635 A$(60) = "0400A13F04.D26Q.":A$(61) = "0400A13E04.F04K14O."
9640 A$(62) = "5053B17.D37Q.":A$(63) = "5054F05B15.E05H15L.":A$(64) = "5054E05.D29N."
9645 A$(65) = "5052F08B13.E08H13L.":A$(66) = "5052E08.D29N.":A$(67) = "1552B13.B13L."
9650 A$(68) = "1553B17.B17L.":A$(69) = "1554B15.B15L.":A$(70) = "3252B13.C13L."
9655 A$(71) = "3253B17.C17L.":A$(72) = "3254B15.C15L.":A$(73) = "1556B15.B15L."
9660 A$(74) = "3256B15.C15L.":A$(75) = "0300A13.E06K15O.":A$(76) = "1557B20.B20L."
9665 A$(77) = "3257B20.C20L.":A$(78) = "1357B20F07.D38E07N."
9670 A$(79) = "1357B20E07.D29N.":A$(80) = "1551E11.B11L.":A$(81) = "3251B11.C11L."
9675 A$(82) = "5800A17F07.D39N.":A$(83) = "5800A17E07.D44D21Q."
9680 A$(84) = "1555A14F05.D40Q.":A$(85) = "1555A14E06E05F08.F06F05L."
9685 A$(86) = "0600A14F08.D41Q.":A$(87) = "1555A14E06E05E08.F06L."
9690 A$(88) = "0600A14E08F05F06.D42D43Q.":A$(89) = "0600A14E08E05E06.D42D45D46Q."
9695 A$(90) = "0600A14E08E05F06.D42D43D45Q.":A$(91) = "0600A14E08F05E06.D42D46Q."
9900  GOTO 1
9999  END 
29100 K = (O(N) = SALLE OR O(N) < 0)

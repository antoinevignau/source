2 REM LE MANOIR DU DOCTEUR GENIUS 
3 REM COPYRIGHT LORICIELS 83 L.BENES
4 REM VERSION VG5000 FRED_72 2021
5 REM VERSION APPLE II BRUTAL DELUXE 2023
6 REM
10 REM POKE -34 BECOMES 254
11 REM POKE -1 BECOMES 255
12 D$=CHR$(4)
20 REM CLEAR 300,-16385
30 PRINT "DISKLOAD CODE"
35 REM CALL -16384: POKE&"47FD",0
40 GOSUB 7600
45 HOME : & INIT0,0: & TX3,0,0: PRINT: PRINTSPC(10)"VEUILLEZ PATIENTER"
50 GOSUB 8000: REM CHARGEMENT VARIABLES
51 GOSUB 7500
55 & N: & INIT0,0: & TX0,0,0
57 DIM P(12): P(11) = 0: P(12) = 0
60 SALLE = 1
70 FOR N = 1 TO 10
80 P(N) = 0: C(N) = 0
85 NEXT N
90 C(3) = 14: C(7) = 12: C(1) = 80: C(9) = 12
100 IF SALLE <> 14 AND SALLE <> 16 AND SALLE <> 17 AND SALLE <> 19 THENP(2) = 0 
105 IF P(2) = 0 THEN 200 
106 IF O(22) = SA AND P(7) = 1 THEN 200
107 IF O(05) = SA AND P(3) = 1 THEN 200
110 IF C(9) > 1 THEN C(9) = C(9) - 1
130 & C: & N
140 HTAB 1: VTAB 18: PRINT "Il fait noir comme dans un four!"
145 PRINT "Il faudrait peut etre allumer."
150 GOTO 500

200 REM DESCRIPTION SALLE
210 & N: & C:  REM cadre+zone+dessin
215 DEST = SALLE
220 GOSUB 6900
230 & D
300 H = 0: N = 1
310 IF O(N) <> SALLE THEN 400
320 IF H = 1 THEN 350
330 & L: PRINT "Il y a dans la salle: ": & W,10
340 H = 1
350 & L: PRINT " ";O$(N);
360 & W,25
400 N = N + 1
410 IF N <= O THEN 310 
415 & L: PRINT

500 REM ACCEPTATION COMMANDE
510 T = 1: Y$(1) = "": Y$(2) = "": N = 0
520 GOTO 1000
530 IF C(7) > 1 AND P(7) = 1 THEN C(7) = C(7) - 1 
540 IF C(3) > 1 AND P(3) = 1 THEN C(3) = C(3) - 1
545 IF C(4) > 1 AND P(4) = 1 THEN C(4) = C(4) - 1
547 IF C(5) > 1 THEN C(5) = C(5) - 1
550 X$ = "": INPUT "Que faites vous ";X$
560 & N: PRINT ">";X$   
570 GOSUB 6000
580 & L: IF MO(1) = 0 THEN PRINT "Je ne comprends pas...": & W,50: GOTO 500

900 REM CONTROLE Mvt
905 & I,SALLE
910 IF PEEK(-4) = 0 THEN 980
920 SALLE = PEEK(-4): GOTO 100
980 T = 0
990 A1 = 0

1000 REM CONTROLE 
1010 NL = 0
1100 NL = NL + 1
1110 IF T = 0 THEN 1150
1120 E$ = C$(NL)
1130 GOTO 1400
1150 & A:  NL = PEEK(-33)
1151 IF PEEK(-32) = 0 THEN 1159
1152 AD = -32: E$ = ""
1153 IF PEEK(AD) = 255 THEN 1400
1154 E$ = E$ + CHR$(PEEK(AD)): AD = AD + 1
1155 GOTO 1153
1159 PY = 23: CO = 12
1160 IF A1 = 1 THEN 500 
1170 & L: PRINT "Impossible ";
1180 IF MO(1) < 10 THEN PRINT "de prendre ce chemin";

1190 PRINT "!": & W,100: GOTO 100

1400 REM CONDITIONS
1410 E = 1
1420 IF MID$(E$,E,1) = "." THEN 1700
1430 LI = ASC(MID$(E$,E,1))-65
1440 N = VAL(MID$(E$,E+1,2))
1450 ON (LI+1) GOSUB 1500,1510,1520,1530,1540,1550,1560,1570,1580
1460 IF OK = 0 THEN 1100
1470 E = E + 3: GOTO 1420
1500 IF N = SALLE THEN 1590
1505 GOTO 1585
1510 IF O(N) = -1 OR O(N) = SALLE THEN 1590
1515 GOTO 1585
1520 IF O(N) <> SALLE AND O(N) <> -1 THEN 1590
1525 GOTO 1585
1530 IF O(N) = -1 THEN 1590
1535 GOTO 1585
1540 IF P(N) = 1 THEN 1590
1545 GOTO 1585
1550 IF P(N) = 0 THEN 1590
1555 GOTO 1585
1560 IF C(N) = 1 THEN 1590
1565 GOTO 1585
1570 IF INT(RND(1)*99+1) < N THEN 1590
1575 GOTO 1585
1580 IF N <> SALLE THEN 1590
1585 OK = 0: RETURN
1590 OK = 1: RETURN

1700 REM ACTIONS
1705 E = E + 1: A1 = 1
1710 IF MID$(E$,E,1) = "." THEN 1100 
1720 LI = ASC(MID$(E$,E,1))-65
1730 IF MID$(E$,E+1,1) <> "." THEN N = VAL(MID$(E$,E+1,2)) 
1740 BREAK = 0
1750 ON (LI+1) GOSUB 1800,1900,2000,2100,2200,2300,2400,2500,2600,2700,2800,2900,3000,3100,3200,3300
1760 IF BREAK > 0 THEN ON BREAK GOTO 100,300,500,530,20000
1780 E = E + 3
1790 GOTO 1710
1800 G = 0: HH = 0
1810 G = G + 1
1820 IF O(G) = -1 THEN 1840
1830 IF G < O THEN 1810
1835 GOTO 1870
1840 & L: IF HH = 0 THEN PRINT "Vous detenez: "
1850 HH = 1
1860 & L: PRINT O$(G);: PRINT " ";: & W,30
1865 IF G < V THEN 1810
1870 & L: IF HH = 1 THEN PRINT ".": RETURN
1880 & L: PRINT "Vous ne detenez absolument rien!!!": RETURN
1900 IF S(1) < 5 THEN 1930
1910 & L: PRINT "Il parait evident que vous ne pouvez"
1915 & L: PRINT "porter tant de chose!!!"
1920 & W,200: BREAK = 1: RETURN
1930 IF O(N) <> -1 THEN 1960 
1935 REM
1940 & L: PRINT "Vous l'avez deja,vous etes etourdis et"
1945 & L: PRINT "dans cette maison ce n'est pas tres"
1950 & L: PRINT "conseille...": GOTO 1920
1960 O(N) = -1: S(1) = S(1) + 1: RETURN
2000 IF O(N) = -1 THEN 2030
2010 & L: PRINT "Comment voulez vous poser ce que vous"
2015 & L: PRINT "n'avez pas..."
2020 GOTO 1920
2030 O(N) = SALLE: S(1) = S(1) - 1: RETURN

2100 REM
2105 DEST = N + 1: GOSUB 3900
2110 RETURN
2200 P(N) = 1: RETURN
2300 P(N) = 0: RETURN

2400 C(N) = VAL(MID$(A$(N),E+3,2)): E = E + 2: RETURN 

2500 IF O(N) = -1 THEN S(1) = S(1) - 1 
2510 O(N) = 0: RETURN 
2600 SALLE = N: RETURN 
2700 & L: PRINT "D'accord..."
2710 & W,20: BREAK=2: RETURN
2800 BREAK = 3 
2810 RETURN
2900 BREAK = 4: RETURN
3000 BREAK = 1: RETURN
3100 BREAK = 5: RETURN
3200 O(N) = SALLE: RETURN
3300 X$=O$(N): O$(N)=O$(N+1): O$(N+1)=X$: RETURN

3900 IF DEST < 11 THEN ON DEST GOTO 4000,4010,4020,4030,4040,4050,4060,4070,4080,4090
3910 DEST = DEST - 10
3915 IF DEST < 11 THEN ON DEST GOTO 4100,4110,4120,4130,4140,4150,4160,4170,4180,4190
3920 DEST = DEST - 10
3925 IF DEST < 11 THEN ON DEST GOTO 4200,4210,4220,4230,4240,4250,4260,4270,4280,4290
3930 DEST = DEST - 10
3935 IF DEST < 11 THEN ON DEST GOTO 4300,4310,4320,4330,4340,4350,4360,4370,4380,4390
3940 DEST = DEST - 10
3945 IF DEST < 11 THEN ON DEST GOTO 4400,4410,4420,4430,4440,4450,4460,4470,4480,4490
3950 DEST = DEST - 10
3955 IF DEST < 11 THEN ON DEST GOTO 4500,4510,4520,4530,4540,4550,4560,4570,4580,4590
3960 DEST = DEST - 10
3965 IF DEST < 11 THEN ON DEST GOTO 4600,4610,4620,4630,4640

4000 & C: FOR N = 1 TO 20: & E: & W,4: NEXT N
4001 & N: PRINT "Vous avez garde la lampe allumee trop"
4002 & L: PRINT "longtemps, elle a explose!"
4005 & W,200: RETURN
4010 & C
4011 & N: PRINT "Vous avez oublie de fermer le robinet"
4012 & L: PRINT "vous mourez sous des tonnes d'eau!"
4015 & W,200: RETURN
4020 & C
4022 & N: PRINT "La porte vient de se refermer derriere"
4023 & L: PRINT "vous. Vous etes prisonnier..."
4025 & W,200: RETURN
4030 & C
4031 & N: PRINT "Vous avez trebuche dans l'escalier,vous"
4032 & L: PRINT "vous empallez sur le couteau!"
4035 & W,200: RETURN
4040 & C
4041 & N: PRINT "Vous renversez l'eau dans l'escalier,"
4042 & L: PRINT "ce qui provoque une decharge au niveau"
4043 & L: PRINT "de la prise electrique." 
4045 & W,200: RETURN
4050 & C 
4051 & N: PRINT "Vous etes sauf grace a la combinaison"
4052 & L: PRINT "que vous avez enfilee..!"
4055 & W,200: RETURN
4060 & L: PRINT "Vous mourez electrocute..."
4065 & W,200: RETURN
4070 & C: FORN=1TO20: & M,2,2,2,10: & P,3,7,4,80: & W,1: & E: & W,6: NEXTN
4071 & N: PRINT "La piece etait pleine de gaz explosif,"
4072 & L: PRINT "vous auriez du eteindre..."
4073 & W,200: PRINT "On ramassera vos morceaux un autre"
4074 & L: PRINT "jour..!"
4075 & W,200: RETURN
4080 & C 
4081 & N: PRINT "Vous mourez empalle sur des lances"
4082 & L: PRINT "sorties du mur...!" 
4085 & W,200: RETURN
4090 & L: PRINT "La porte ne s'ouvre pas de cette piece": & W,200: RETURN
4100 & C
4101 & L: PRINT "La lampe et le briquet refusent de"
4102 & L: PRINT "fonctionner dans cette piece!"
4109 & W,200: RETURN
4110 & C
4111 & L: PRINT "Vous tombez dans une trappe,vous vous"
4112 & L: PRINT "disloquez en arrivant au sol.."
4115 & W,200: RETURN
4120 & L: PRINT "Vous avez raison de passer,car ce"
4122 & L: PRINT "monstre n'etait qu'une projection"
4124 & L: PRINT "en 3 dimensions sur un ecran de fumee"
4125 & W,250: RETURN
4130 & L: PRINT "Vous avez raison,la curiosite est un"
4132 & L: PRINT "vilain defaut!!!"
4134 & W,250
4135 RUN 20040
4140 & L: PRINT "Vous avez raison d'attendre,mais cela"
4141 & L: PRINT "ne pourra pas durer eternellement.."
4142 & W,200: RETURN
4150 & L: PRINT "Vous avez de la chance car ce coffre"
4151 & L: PRINT "etait ouvert.": & W,100
4152 & L: PRINT "Un message a l'interieur dit: "
4153 & L: PRINTCHR$(34)+"Ne respectez pas les couleurs du code"
4154 & L: PRINT "de la route...?"+CHR$(34): & W,200 
4156 & L: PRINT "Tiens le coffre se referme!": & W,150: RETURN
4160 & L: PRINT "Maintenant,vous avez une lampe pleine"
4162 & L: PRINT "de petrole."
4165 & W,200: RETURN
4170 & L: PRINT "Vous n'avez rien pour transporter le"
4171 & L: PRINT "petrole.": & W,200: RETURN
4180 FOR N = 1 TO 10: & E: & W,6: NEXTN
4181 & C: & N: PRINT "Le briquet que vous aviez laisse"
4182 & L: PRINT "allume vient d'exploser!"
4185 & L: & W,200: PRINT "Ca tue l'etourderie.....": & W,150: RETURN
4190 & C: & N: PRINT "A force de marcher en long et en large"
4191 & L: PRINT "dans cette maison, vous sombrez dans"
4194 & L: PRINT "un coma des plus mortel...
4195 & W,300: RETURN
4200 PRINT "L'eau coule...": RETURN
4210 & C: & N: PRINT "Vous avez les pieds trempes,et cela"
4211 & L: PRINT "vous rend tres malade..."
4215 & W,100: & L: PRINT "Vous mourez d'une triple pneumonie...!": & W,200: RETURN
4220 & L: PRINT "Le titre est: "
4225 & L: PRINTCHR$(34)+"La mort a la 1ere page."+CHR$(34): & W,200: RETURN
4230 & C: FOR N=1 TO 20: & E: NEXTN
4233 & N: PRINT "Le livre a explose lorsque vous l'avez"
4235 & L: PRINT "ouvert...": & W,200: RETURN
4240 & L: PRINT "Le papier indique:  "+CHR$(34)+"Cherchez la clef."+CHR$(34)
4242 & W,200: RETURN
4250 & L: PRINT "La clef vous permettra de trouver le"
4252 & L: PRINT "code de la porte d'entree."
4255 & W,200: RETURN
4260 & L: PRINT "Il y a un clavier numerique permettant"
4261 & L: PRINT "d'entrer un code a côte de la porte.": & W,200: RETURN
4270 & L: PRINT "Pour faire quoi..?": & W,200: RETURN
4280 & L: PRINT "Il y a une odeur de gaz.": & W,200: RETURN
4290 & L: PRINT "Apparemment,il n'y a aucune odeur.": & W,200: RETURN
4300 & L: PRINT "C'est deja fait,espece de rigolo!": & W,200: RETURN
4310 & L: PRINT "Il faudrait peut etre du feu!": & W,200: RETURN
4320 & L: PRINT "La lampe ne contient pas de petrole!": & W,200: RETURN
4330 & L: PRINT "Vous ne l'avez pas!": & W,200: RETURN
4340 & L: PRINT "Le briquet est encore allume et il"
4342 & L: PRINT "eclaire la piece.": & W,200: RETURN
4350 FOR N = 1 TO 15: & E: & W,4: NEXT N
4355 & L: PRINT "La torche etait piegee,elle vous"
4356 & L: PRINT "a explose dans les mains.."
4357 & W,200: RETURN
4360 & L: PRINT "La lampe est encore allumee,et elle"
4362 & L: PRINT "vous eclaire.": & W,200: RETURN
4370 & L: PRINT "Un nain vient de vous lancer un"
4371 & L: PRINT "poignard en plein coeur.."
4375 & W,200: RETURN
4380 & L: PRINT "Un nain vient de se precipiter sur"
4385 & L: PRINT "vous, il s'empalle sur votre ciseau.": & W,200: RETURN
4390 & L: PRINT "Un nain vient de se precipiter sur"
4395 & L: PRINT "vous, il s'empalle sur votre couteau.": & W,200: RETURN
4400 & L: PRINT "Vous venez de renverser le pot.": & W,150: RETURN
4410 IF PEEK(255) = 1 THEN BREAK = 3: RETURN
4411 & C: & S,4,4,0: & P,0,1,1,5000
4412 & N: PRINT "La foudre vient de tomber sur la maison": & W,200
4413 & L: PRINT "La maison n'existe plus!": & W,100
4414 & L: PRINT "Vous non plus!": & W,100: & P,0,0,0,0: RETURN
4420 & C: & N: PRINT "A force de marcher dans le noir,vous"
4422 & L: PRINT "avez trebuche.": & W,100
4425 & L: PRINT "Vous mourez d'une fracture du crane...": & W,200: RETURN
4430 & L: PRINT "Vous ne pouvez pas travailler dans le"
4433 & L: PRINT "noir...": & W,200: RETURN
4440 & L: PRINT "La lumiere du briquet ne suffit pas"
4442 & L: PRINT "pour travailler...": & W,200: RETURN
4450 & L: PRINT "Impossible !": & W,100: RETURN
4460 & L: PRINT "Vous n'avez aucun outil...": & W,200: RETURN
4470 & L: PRINT "Le teleporteur est en panne,donc les"
4472 & L: PRINT "boutons ne fonctionnent pas."
4475 & W,400: RETURN
4480 FOR N = 1 TO 25: & E: & W,5: NEXT N
4484 & C: & N: PRINT "Le teleporteur vient d'exploser,"
4485 & L: PRINT "vous etes decompose..!": & W,200: RETURN
4490 & N: PRINT "Le teleporteur se met en marche"
4491 & L: PRINT "vous disparaissez...": & W,50
4492 & M,2,1,5,0: & P,2,1,3,1000
4493 & F
4494 & P,0,0,0,0
4495 FOR N = 500 TO 30 STEP -5
4497 & S,2,N,12: & P,2,0,0,100
4498 NEXT N
4499 & P,0,0,0,0: RETURN
4500 & C: & L: PRINT "Vous prenez du 30000 Volts dans les"
4502 & L: PRINT "doigts!": & W,200: RETURN
4510 & L: PRINT "Le placard est ferme a clef!": & W,200: RETURN
4520 & C: & N: PRINT "L'horrible monstre sorti du placard"
4522 & L: PRINT "vient de vous devorer!"
4525 & W,200: RETURN
4530 & L: PRINT "Il ne fallait pas fuir!": & W,200: RETURN
4540 & C: & L: PRINT "Vous avez raison d'utiliser le ciseau,"
4542 & L: PRINT "le monstre est mort!"
4545 & W,200: RETURN
4550 & D: & N: PRINT "A l'interieur du placard,le No "PL
4552 & L: PRINT "est inscrit": & W,200
4555 & L: PRINT "Le placard se referme.": & W,100: RETURN
4560 & C: FORN=1TO30: & E: & W,5: NEXTN
4562 & N: PRINT "le pistolet a explose!": & W,200
4565 RETURN

4570 IF SALLE = 2 THEN RETURN
4571 & L: PRINT "Impossible!": BREAK = 3: RETURN
4575 & C: FOR N = 1 TO 25: & E: & W,7: NEXTN
4576 & N: PRINT "le clavier numerique a explose!": & W,200: BREAK = 5: RETURN
4580 & N: PRINT "Le clavier numerique prend feu.": & W,200
4581 & L: IF O(24) <> -1 THEN 4586
4582 & L: PRINT "Heureusement,vous avez un pot plein"
4584 & L: PRINT "d'eau. Ce qui vous permet d'eteindre"
4585 & L: PRINT "ce feu.": & W,300: RETURN
4586 & L: PRINT "Malheureusement vous n'avez pas d'eau"
4587 & L: PRINT "pour l'eteindre.": & W,200
4588 GOTO 4575

4590 & N: INPUT"No DE CODE ";ZC
4595 IF ZC <> PL THEN 4575
4600 & W,100: & L: PRINT "Le code est exact...": & L: PRINT "La porte s'ouvre..."
4603 & W,150
4605 GOTO 11000
4610 & L: PRINT "A l'interieur du placard,il y a un mot"
4611 & L: PRINT "qui parle d'un teleporteur.": & W,200
4615 & L: PRINT "Tiens le placard se ferme tout seul...": & W,100: RETURN
4620 & L: PRINT "Avant de la poser par terre,il faudrait"
4621 & L: PRINT "peut etre l'enlever."
4625 & W,200: RETURN
4630 & C: & N: PRINT "Devant vous, il y a un horrible"
4631 & L: PRINT "monstre qui est sorti du placard."
4635 & W,200: RETURN
4640 & L: PRINT "Le placard etait piege,vous n'auriez"
4641 & L: PRINT "pas du l'ouvrir!"
4645 FOR N = 1 TO 30: & E: & W,7: NEXT N
4647 & W,200: RETURN

6000 REM ANALYSE DU MOT
6010 N = 0: GN = 0
6020 N = N + 1: IF MID$(X$,N,1) <> " " THEN 6040
6030 GOTO 6020
6040 GN = GN + 1: XX$ = MID$(X$,N+GN,1): IF XX$ = " " OR XX$ = "" OR GN = 20 THEN 6060
6050 GOTO 6040
6060 IF GN > 4 THEN GN = 4
6070 X$(1) = MID$(X$,N,GN)
6080 N = N + 1: XX$ = MID$(X$,N,1): IF XX$ = " " OR XX$ = "" THEN 6100
6090 GOTO 6080
6100 N = N + 1: IF MID$(X$,N,1) <> " " THEN 6115
6110 GOTO 6100
6115 GN = 0
6120 GN = GN + 1: XX$ = MID$(X$,N+GN,1): IF XX$ = " " OR XX$ = "" OR GN = 20 THEN 6140
6130 GOTO 6120
6140 IF GN > 4 THEN GN = 4 
6150 X$(2) = MID$(X$,N,GN)
6160 & U,X$(1): & V,X$(2)
6170 MO(1) = PEEK(-3)
6180 MO(2) = PEEK(-2)
6190 RETURN

6900 REM Chargement image salle
6902 & C: & N
6905 IF DEST < 11 THEN ON DEST GOTO 7000,7010,7020,7030,7040,7050,7060,7070,7080,7090
6910 DEST = DEST - 10
6915 IF DEST < 11 THEN ON DEST GOTO 7100,7110,7120,7130,7140,7150,7160,7170,7180,7190
6920 DEST = DEST - 10
6925 ON DEST GOTO 7200,7210,7220,7230,7240

7000 PRINT "DISKLOAD IMG_01"
7005 PRINT "Vous etes devant le manoir du defunt"
7006 PRINTSPC(14)"Dr  GENIUS"
7009 RETURN
7010 PRINT "DISKLOAD IMG_02"
7015 PRINT "Vous etes dans le hall d'entree."
7019 RETURN
7020 PRINT "DISKLOAD IMG_03"
7025 PRINT "Vous etes en bas de l'escalier menant"
7026 PRINT "au 2eme etage."
7029 RETURN
7030 PRINT "DISKLOAD IMG_04"
7035 PRINT "Vous etes dans la salle a manger."        
7039 RETURN
7040 PRINT "DISKLOAD IMG_05"
7045 PRINT "Vous etes dans une bibliotheque sans"
7046 PRINT "livre...!"         
7049 RETURN
7050 PRINT "DISKLOAD IMG_06"
7055 PRINT "Vous etes dans une buanderie."
7059 RETURN
7060 PRINT "DISKLOAD IMG_07"
7065 PRINT "Vous etes dans le salon."
7069 RETURN
7070 PRINT "DISKLOAD IMG_08"
7075 PRINT "Vous etes dans une chambre."
7079 RETURN 
7080 PRINT "DISKLOAD IMG_09"
7085 PRINT "Vous etes dans un corridor."
7089 RETURN
7090 PRINT "DISKLOAD IMG_10"
7095 PRINT "Vous etes dans une salle d'attente."
7099 RETURN
7100 PRINT "DISKLOAD IMG_11"
7105 PRINT "Vous etes dans le vestibule."
7109 RETURN 
7110 PRINT "DISKLOAD IMG_12"
7115 PRINT "Vous etes dans la chambre d'amis."
7119 RETURN
7120  PRINT "DISKLOAD IMG_13"
7125 PRINT "Vous etes dans une chambre."
7129 RETURN
7130 STOP
7140 PRINT "DISKLOAD IMG_14"
7145 PRINT "Vous etes dans une petite salle."
7149 RETURN
7150 PRINT "DISKLOAD IMG_15"
7155 PRINT "Vous etes dans le laboratoire du
7156 PRINT "Dr GENIUS." 
7159 RETURN 
7160 PRINT "DISKLOAD IMG_16"
7165 PRINT "Vous etes dans une petite piece vide."
7169 RETURN 
7170 PRINT "DISKLOAD IMG_17"
7175 PRINT "Vous ne savez pas où vous etes."
7179 RETURN  
7180 PRINT "DISKLOAD IMG_18"
7185 PRINT "Vous etes en haut de l'escalier."           
7189 RETURN
7190 PRINT "DISKLOAD IMG_19"
7195 PRINT "Vous etes dans la salle bain." 
7199 RETURN
7200 PRINT "DISKLOAD IMG_20"
7205 PRINT "Vous etes dans le living room."
7209 RETURN
7210 PRINT "DISKLOAD IMG_21"
7215 PRINT "Vous etes dans une piece enfumee...!"
7219 RETURN
7220 PRINT "DISKLOAD IMG_22"
7225 PRINT "Vous etes dans une grande piece."
7229 RETURN 
7230 PRINT "DISKLOAD IMG_23"
7235 PRINT "Vous etes dans une piece de rangement."
7239 RETURN
7240 PRINT "DISKLOAD IMG_24"
7245 PRINT "Vous etes dans le dressing."
7249 RETURN

7500 & TX7,0,0: VTAB 23: PRINTSPC(8)"APPUYEZ SUR UNE TOUCHE"
7510 N = RND(1)
7511 IF PEEK(-16384)<128 THEN 7510
7512 POKE -16368,0
7515 RETURN

7600 REM CONFIG JEU
7602 & INIT0,0: & TX3,0,0
7605 POKE 254,0: POKE 255,0
7610 INPUT "Carte SON (O/N)";X$
7620 IF X$ = "O" THEN POKE 254,1: GOTO 7630
7625 IF X$ <> "N" THEN 7610
7630 INPUT "Foudre (O/N)";X$
7640 IF X$ = "O" THEN POKE 255,1: GOTO 7650
7645 IF X$ <> "N" THEN 7630
7650 RETURN

8000 REM CHARGEMENT VARIABLES
8001 RESTORE
8010 V = 70
8130 O = 25: DIMO(25)
8140 FOR N = 1 TO 25
8150 READ O(N)
8170 NEXT N
8180 DATA 06,05,05,08,08,00,00,11,11
8190 DATA 13,20,18,16,16,16,16,00,21
8200 DATA 00,22,25,12,00,25,00

8205 DIM O$(25)
8210 FOR N = 1 TO 25
8220 READ O$(N)
8240 NEXT N
8250 DATA UNE TORCHE ELECTRIQUE,UN ROBINET,UN CISEAU,UN TOURNEVIS
8260 DATA UNE LAMPE A PETROLE,UNE LAMPE PLEINE,UNE LAMPE ALLUMEE,UN COUTEAU
8270 DATA UN PAPIER,UN LIVRE,DU PETROLE DANS UN LAVABO BOUCHE
8280 DATA UNE CLEF,UN BOUTON ROUGE,UN BOUTON BLEU
8290 DATA UN BOUTON VERT,UN TELEPORTEUR,UN TELEPORTEUR REPARE
8300 DATA UNE COMBINAISON ARGENTEE,UNE COMBINAISON ENFILEE,UN MONSTRE A L'EST
8310 DATA UN PISTOLET,UN BRIQUET,UN BRIQUET ALLUME,UN POT,UN POT PLEIN D'EAU

8320 M = 25: DIM M$(25)
8330 FOR N = 1TO 25
8340 READ M$(N)
8360 NEXT N
8370 DATA 00,0403030400,030200,04020305010600,04040107032000,020400
8380 DATA 04080109020500,030700,04130207031000 
8390 DATA 0409021100,0110031200,041100,030900,0209031500,00,00
8400 DATA 00,00,0122032100,040500,0125022200,012100 
8410 DATA 0124042200,022300,022100

8430 A = 128: DIM A$(128)
8440 FOR N = 1 TO 128
8450 READ A$(N)
8470 NEXT N
8480 DATA 1400A01.I02D02M.,0500A03D08.D03N.,0500A03E08E09D24.D04D05I19E02M.
8485 DATA 0500A03E08D24.D04D06N.
8490 DATA 0500A03E07.I19M.,0500A03E03.I19M.,0500A03.I19E02M.,0600A19D08.D03N.
8500 DATA 0600A19E08E09D24.D04D05I03M.,0600A19E08D24.D04D06N.,0600A19.I03M.
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

8566 DATA 1840B09.D24K.,2040B09.D25K.,1951A02.D26M.,1951.D27K.,2100A14.D28K.
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
8625 DATA 5543D18.P18E09J.,5743D18F09.D30K.,5743D18.P18F09J.
8630 DATA 1233A24C12.D51K.,1233A24C03.D52N.,1233A24.G0503E11D63K.
8635 DATA 2636E11.D54F11D55K.,5350E11.D54F11D55K.,5232B21.D56N.
8640 DATA 5830F08.D57.,5830.D58D59.,1233A06.D61M.
8650 DATA 1233A25.D64N.

8700 PL = INT(RND(1)*9000+1000)
8800 C = 14: DIMC$(14) 
8810 FOR N = 1 TO 14
8820 READ C$(N)
8840 NEXT N
8850 DATA G03E03.D00N.,G04E04.D01N.,I14I16I17I19.F02.,G07E07.D18N.,GO1.D19N.
8860 DATA H06C03C08.D37N.,H08D08.D39L.,H06D03.D38L.,G08E08B24.D40D21N.
8870 DATA H02.D41N.,G09E02.D42N.,G05E11.D52N.,I24E11.D53D52N.,.L.
8900 RETURN

9000 FOR IJ = 1 TO 100: NEXT IJ
9010 RETURN

11000 REM SUCCES
11020 PRINT "DISKLOAD IMG_01"
11030 & N: & C: & D
11040 PRINT "Vous voila en dehors de la maison..."
11050 & W,250
11055 & N
11060 PRINT " Cela est exceptionnel,vous etes le"
11065 PRINT "premier a sortir vivant de cette"
11070 PRINT "maison. Mais a votre place, je me"
11075 PRINT "mettrais a courir car un nain rode"
11080 PRINT "peut-etre dans les parages..."
11085 GOSUB 11100
11090 GOTO 20040

11100 REM TEA FOR TWO
11102 REM RESTORE 11125
11105 FOR N = 1 TO 110
11110 READ A1,A2,A3
11115 & M,1,A1,A2,10: & P,1,0,0,100: & W,A3
11120 & P,0,0,0,0
11122 NEXT N
11123 RETURN
11125 DATA 4,6,45,4,3,15,4,5,45,4,3,15,4,6,45,4,3,15,4,5,45 
11130 DATA 4,1,15,4,5,45,4,1,15,4,3,45,4,1,15,4,5,45,4,1,15
11135 DATA 4,3,45,4,1,15,4,6,45,4,3,15,4,5,45,4,3,15,4,6,45
11140 DATA 4,3,15,4,5,45,4,1,30,4,10,30,4,10,22,4,7,8,4,9,30,4,9,22,4,7,8
11145 DATA 4,10,30,4,10,22,4,7,8,4,9,30,4,9,22,4,5,8,4,9,30,4,7,22,4,5,8
11150 DATA 4,7,30,4,7,22,4,5,8,4,9,30,4,9,22,4,5,8,4,7,30,4,7,22,4,5,8
11155 DATA 4,10,30,4,10,22,4,7,8,4,9,30,4,9,22,4,7,8,4,10,30,4,10,22,4,7,8
11160 DATA 4,9,30,4,9,30,5,2,120,5,1,60,4,6,45,4,3,15,4,5,45,4,3,15,4,6,45
11165 DATA 4,3,15,4,5,45,4,1,15,4,5,45,4,1,15,4,3,45,4,1,15,4,5,45,4,1,15
11170 DATA 4,3,45,4,1,15,4,6,45,4,3,15,4,5,45,4,3,15,4,6,45,4,3,15,4,5,45
11175 DATA 4,1,30,5,3,45,5,3,15,5,1,45,5,1,15,4,11,45,4,11,15,4,10,45,4,10,15
11180 DATA 5,1,45,5,1,15,4,11,45,4,11,15,4,10,45,4,10,15,4,8,45,4,8,15
11185 DATA 4,6,45,4,3,15,4,5,45,4,3,15
11190 DATA 4,6,45,4,3,15,4,5,45,4,10,15,4,6,120

20000 REM TOMBE
20005 PRINT "DISKLOAD IMGTMB"
20010 & C: & D: & N
20020 PRINT "Vous etes mort !": & W,100
20030 IF PEEK(254)=1 THEN GOSUB 21000
20040 & L: PRINT: & L: X$="": INPUT "Voulez-vous rejouer ";X$
20050 IF X$ = "O" OR X$ = "o" THEN RUN 45
20060 IF X$ = "N" OR X$ = "n" THEN 20080
20070 GOTO 20040
20080 & N: PRINT "     AU REVOIR"
20090 END

21000 REM SARABANDE
21005 REM RESTORE 21040
21015 FOR N = 1 TO 75
21020 READ A1,A2,A3,A4,A5
21025 READ A6,A7,A8,A9,A0
21030 & M,1,A1,A2,A3: & M,2,A4,A5,A6: & M,3,A7,A8,A9: & P,7,0,0,100: & W,A0
21031 IF PEEK(-16384) > 128 THEN & P,0,0,0,0: RETURN
21032 IF N > 70 THEN NEXT N: & P,0,0,0,0: RETURN
21035 & P,0,0,0,0: NEXTN
21040 DATA 3,6,8,3,3,8,2,10,8,80
21045 DATA 3,6,8,3,3,8,2,10,8,80
21050 DATA 0,1,1,0,1,1,0,1,1,40
21055 DATA 3,8,8,3,5,8,0,1,1,40
21060 DATA 3,5,8,3,2,8,2,10,8,80
21065 DATA 3,5,8,3,2,8,2,10,8,40
21070 DATA 1,11,8,0,1,1,0,1,1,40
21075 DATA 1,10,8,0,1,1,0,1,1,40
21080 DATA 1,8,8,0,1,1,0,1,1,40
21085 DATA 3,10,8,3,6,9,3,1,8,80
21090 DATA 3,10,8,3,6,9,3,1,8,80
21095 DATA 0,1,1,0,1,1,0,1,1,40     
21100 DATA 3,11,8,3,8,8,0,1,1,40
21105 DATA 3,8,8,3,5,8,3,1,8,80
21110 DATA 3,8,8,3,5,8,3,1,8,40 
21115 DATA 2,1,8,0,1,1,0,1,1,40
21120 DATA 1,11,8,0,1,1,0,1,1,40 
21125 DATA 1,10,8,3,7,8,3,10,8,40
21130 DATA 3,11,8,3,8,8,3,3,8,80
21135 DATA 3,11,8,3,8,8,3,3,8,80
21140 DATA 1,8,8,0,1,1,0,1,1,40
21145 DATA 1,8,8,3,10,8,4,1,8,40
21150 DATA 3,10,8,3,6,8,3,3,8,80
21155 DATA 3,10,8,3,6,8,3,3,8,80
21160 DATA 0,1,1,0,1,1,0,1,1,40
21165 DATA 3,10,8,2,1,8,0,1,1,40
21170 DATA 4,3,8,3,10,8,1,11,8,80
21175 DATA 4,3,8,3,8,8,2,11,9,80
21180 DATA 0,1,1,0,1,1,0,1,1,40
21185 DATA 4,5,8,0,1,1,0,1,1,40
21190 DATA 4,2,8,3,10,8,3,5,8,80
21195 DATA 4,2,8,3,10,8,3,5,8,40
21200 DATA 2,8,8,0,1,1,0,1,1,40
21202 DATA 2,6,8,0,1,1,0,1,1,40
21203 DATA 2,5,8,0,1,1,0,1,1,40
21205 DATA 3,6,8,3,3,8,2,10,8,80
21210 DATA 3,6,8,3,3,8,2,10,8,80
21215 DATA 0,1,1,0,1,1,0,1,1,40 
21220 DATA 3,8,8,3,5,8,0,1,1,40 
21225 DATA 3,5,8,3,2,8,2,10,8,80
21230 DATA 3,5,8,3,2,8,2,10,8,40
21235 DATA 1,11,8,0,1,1,0,1,1,40
21240 DATA 1,10,8,0,1,1,0,1,1,40
21245 DATA 1,8,8,0,1,1,0,1,1,40
21250 DATA 3,10,8,3,6,9,3,1,8,80
21255 DATA 3,10,8,3,6,9,3,1,8,80
21260 DATA 0,1,1,0,1,1,0,1,1,40
21265 DATA 3,11,8,3,8,8,0,1,1,40
21270 DATA 3,8,8,3,5,8,3,1,8,80
21275 DATA 3,8,8,3,5,8,3,1,8,40
21280 DATA 2,1,8,0,1,1,0,1,1,40
21285 DATA 1,11,8,0,1,1,0,1,1,40
21290 DATA 1,10,8,3,7,8,3,10,8,40
21295 DATA 3,11,8,3,8,8,3,3,8,80
21300 DATA 2,8,8,0,1,1,0,1,1,40
21305 DATA 3,11,8,3,8,8,3,1,8,40
21310 DATA 2,8,8,0,1,1,0,1,1,40
21315 DATA 2,1,8,0,1,1,0,1,1,40
21320 DATA 4,1,8,2,5,8,0,1,1,40
21325 DATA 3,10,8,3,6,8,3,1,8,80
21330 DATA 3,10,8,2,3,8,0,1,1,40
21335 DATA 4,3,8,3,6,8,2,11,8,40
21340 DATA 4,2,8,0,1,1,0,1,1,40
21345 DATA 4,3,8,3,11,8,2,8,8,40
21350 DATA 4,5,8,0,1,1,0,1,1,40
21355 DATA 4,6,8,3,10,8,2,10,8,80
21360 DATA 4,5,8,3,8,8,1,10,8,40
21365 DATA 0,1,1,3,8,8,1,10,8,40
21370 DATA 4,3,8,0,1,1,0,1,1,40
21375 DATA 4,3,8,3,6,8,2,3,8,80
21380 DATA 3,3,8,3,10,8,3,6,8,40
21385 DATA 3,3,7,3,10,7,3,6,7,40
21390 DATA 3,3,6,3,10,6,3,6,6,40
21395 DATA 3,3,5,3,10,5,3,6,5,40
21400 DATA 3,3,4,3,10,4,3,6,5,40

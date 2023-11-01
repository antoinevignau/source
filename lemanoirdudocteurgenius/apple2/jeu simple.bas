10 & H
100 IF SAL<>14 AND SAL<>16 AND SAL<>17 AND SAL<>19 THEN P(2)=0 
105 IF P(2)=0 THEN 200 
106 IF O(22)=SAL AND P(7)=1 THEN 200
107 IF O(05)=SAL AND P(3)=1 THEN 200
110 IF C(9)>1 THEN C(9)=C(9)-1
130 & H
140 PRINT "Il fait noir comme dans un four,": PRINT "il faudrait peut etre allumer"
145 GOSUB 13000: GOTO 500

200 REM   DESCRIPTION SAL
210 PRINT
220 & G (7000+SAL*10)-10
300 H=0:N=1
310 IF O(N)<>SAL THEN 400
320 IF H=1 THEN GOTO 350 
330 PRINT "Il y a dans la salle:": & W  100
340 H=1
350 PRINT " ";O$(N);
360 & W  150
400 N=N+1
410 IF N<=O THEN 310 
420 PRINT "" 

500 REM ACCEPTATION COMMANDE
510 T=1: Y$(1)="": Y$(2)="": N=0
520 GOTO 1000
530 IF C(7)>1 AND P(7)=1 THEN C(7)=C(7)-1 
540 IF C(3)>1 AND P(3)=1 THEN C(3)=C(3)-1
545 IF C(4)>1 AND P(4)=1 THEN C(4)=C(4)-1
547 IF  C(5)>1 THEN C(5)=C(5)-1
550 INPUT "Que faites vous : ";X$
555 IF X$="" THEN GOSUB 13100: GOTO 550
560 HOME:PRINT X$
570 GOSUB 6000
580 IF MO$(1)="00" THEN PRINT "Je ne comprends pas...": & W  200:GOTO100
900 REM  CONTROLE Mvt
910 Z=1
920 T$=MID$(M$(SAL),Z,2) 
930 IF T$="00" THEN 980 
940 IF T$<>MO$(1) THEN 970
950 SAL=VAL(MID$(M$(SAL),Z+2,2))
960 GOTO 100
970 Z=Z+4:GOTO920 
980 T=0
990 A1=0

1000 REM  CONTROLE 
1010 NL=0
1100 NL=NL+1
1110 IF T=0 THEN GOTO 1150
1120 E$=C$(NL)
1130 GOTO 1400
1150 IF NL<=A THEN 1200
1159 PY=23:CO=12
1160 IF A1=1 THEN GOTO 500 
1170 PRINT "Impossible ";
1180 IF VAL(MO$(1))<10 THEN PRINT "de prendre ce chemin";
1190 PRINT "!":GOTO 100
1200 IF MID$(A$(NL),1,2)<>MO$(1) THEN 1100 
1210 Y$=MID$(A$(NL),3,2)
1220 IF Y$<>"00" AND Y$<>MO$(2) THEN 1100
1230 E$=MID$(A$(NL),5)
1400 REM  CONDITIONS
1410 E=1
1420 IF MID$(E$,E,1)="." THEN 1700
1430 LI=ASC(MID$(E$,E,1))-65
1440 N=VAL(MID$(E$,E+1,2))
1450 OK=0: & G 1500+LI*10 
1460 IF OK=0 THEN 1100
1470 E=E+3:GOTO1420
1500 IF N=SAL THEN OK=1
1505 RETURN
1510 IF O(N)=-1 OR O(N)=SAL THEN OK=1
1515 RETURN
1520 IF O(N)<>SAL AND O(N)<>-1 THEN OK=1
1525 RETURN
1530 IF O(N)=-1 THEN OK=1
1535 RETURN
1540 IF P(N)=1 THEN OK=1
1545 RETURN
1550 IF P(N)=0 THEN OK=1
1555 RETURN
1560 IF C(N)=1 THEN OK=1
1565 RETURN
1570 IF INT(RND(1)*99+1)<N THEN OK=1
1575 RETURN
1580 IF N<>SAL THEN OK=1
1585 RETURN
1700 REM    ACTIONS
1705 E=E+1:A1=1
1710 IF MID$(E$,E,1)="." THEN 1100 
1720 LI=ASC(MID$(E$,E,1))-65 
1730 IF MID$(E$,E+1,1)<>"." THEN N=VAL(MID$(E$,E+1,2)) 
1740 BREAK=0
1750 & G 1800+LI*100
1760 IF BREAK<>0 THEN & T BREAK
1780 E=E+3
1790 GOTO 1710
1800 G=0:HH=0
1810 G=G+1
1820 IF O(G)=-1 THEN GOTO 1840
1830 IF G<O THEN GOTO 1810
1835 GOTO 1870
1840 IF HH=0 THEN PRINT "Vous detenez:": & W  100
1850 HH=1
1860 PRINTO$(G);:PRINT " ";: & W 150
1865 IF G<V THEN 1810
1870 IF HH=1 THEN PRINT ".": RETURN
1880 PRINT "Vous ne detenez absolument rien!!!": & W  200: RETURN
1900 IF S(1)<5 THEN 1930
1910 PRINT "Il parait evident que vous ne pouvez  portez tant de chose!!"
1920 & W  250:BREAK=100: RETURN
1930 IF O(N)<>-1 THEN 1960 
1935 REM                  CE PROGRAMMEEST LA PROPRIETE DE L.WEILL LORICIELS
1940 PRINT "Vous l'avez deja,vous etes etourdit etdans cette maison ce n'est pas"
1945 & W 400
1950 PRINT "tres conseille...":GOTO1920
1960 O(N)=-1:S(1)=S(1)+1: RETURN
2000 IF O(N)=-1 THEN 2030
2010 PRINT "Comment voulez vous poser ce que vous n'avez pas"
2020 GOTO 1920
2030 O(N)=SAL:S(1)=S(1)-1: RETURN
2100 HOME: & G 4000+N*10 
2110 RETURN
2200 P(N)=1: RETURN
2300 P(N)=0: RETURN
2400 C(N)=VAL(MID$(A$(N),E+3,2)):E=E+2: RETURN 
2500 IF O(N)=-1 THEN S(1)=S(1)-1 
2510 O(N)=0 : RETURN 
2600 SAL=N: RETURN 
2700 PRINT "D'accord..."
2710 & W 150:BREAK=300: RETURN
2800 BREAK=500 
2810 RETURN
2900 BREAK=530: RETURN
3000 BREAK=100: RETURN
3100 PRINT CHR$(4)"RUN PERDU"
3200 O(N)=SAL: RETURN
3300 X$=O$(N):O$(N)=O$(N+1):O$(N+1)=X$: RETURN

4000 & H: FOR N = 1 TO 20: & E : & W 4: NEXT
4001 PRINT "Vous avez gardez la lampe trop        longtemps allumee,elle a explose"
4005 & W 400: RETURN
4010 & H
4011 PRINT "Vous avez oubliez de fermer le robinetvous mourez sous des tonnes d'eau"
4015 & W 500: RETURN
4020 & H
4022 PRINT "Lapporte vient de se refermer derrierevous,vous voila prisonnier..."
4025 & W 500: RETURN
4030 & H
4031 PRINT "Vous avez trebuche dans l'escalier,vous vous empallez sur le couteau!"
4035 & W 500: RETURN
4040 & H
4041 PRINT "Vous renversez l'eau dans l'escalier, ce qui provoque une decharge";
4042 PRINT " de la": & W 300:PRINT "prise electrique" 
4045 & W 300: RETURN
4050 & H 
4051 PRINT "Vous etes sauf grace a la combinaison que vous avez enfile..!"
4055 & W 500: RETURN
4060 PRINT "Vous mourrez electrocute..."
4065 & W 300: RETURN
4070 & H: REM FOR N=1 TO 20:MUSIC2,2,2,10:PLAY3,7,4,80: & W 1: & E : & W 6:NEXT
4071 PRINT "La piece etait pleine de gaz explosif,vous auriez du eteindre..."
4072 & W 500:HOME:PRINT "On ramassera vos morceaux un          autre jour..!"
4075 & W 300: RETURN
4080 & H 
4081 PRINT "Vous mourez empalle sur des lances    sorties du mur...!" 
4085 & W 400: RETURN
4090 REM
4091 PRINT "La porte ne s'ouvre pas de cette piece": & W 300: RETURN
4100 & H
4101 PRINT "La lampe et le briquet refusent de    marcher dans cette piece"
4105 & W 400: RETURN
4110 & H
4111 PRINT "Vous tombez dans une trappe,vous vous disloquez en arrivant au sol.."
4115 & W 500: RETURN
4120 REM  
4121 PRINT "Vous avez raison de passer,car ce     monstre n'etait qu'une projection"
4124 & W 400:PRINT "en 3 dimentions sur un ecran de fumee"
4125 & W 250: RETURN
4130 REM  
4131 PRINT "Vous avez raison,la curiosite est un  vilain defaut!!!"
4132 & W 400
4133 TEXT:PRINT:PRINT:PRINTSPC(12)"AU REVOIR"
4135 & W 200: PRINT CHR$(4)"RUN PERDU"
4140 PRINT "Vous avez raison d'attendre,mais cela ne pourra pas durer";
4141 PRINT " eternellement.."
4142 & W 450: RETURN
4150 : & H:PRINT "Vous avez de la chance car ce coffre  etait ouvert.": & W 400
4152 PRINT "Un message a l'interieur dit:": & W 250:PRINT "Ne respectez pas les ";
4154 PRINT "couleurs du":PRINT "code de la route...?": & W 500 
4156 PRINT "Tiens le coffre se referme": & W 200: RETURN
4160 PRINT "Maintenant,vous avez une lampe pleine de petrole"
4165 & W 400: RETURN
4170 PRINT "Vous n'avez rien pour transporter le  petrole": & W 400: RETURN
4180 & H:PRINT "Le briquet que vous aviez laisse      allume vient d'exploser"
4181 FOR N=1 TO 10: & E : & W 6:NEXT
4185 & W 300:PRINT "Ca tue l'etourderie.....": & W 200: RETURN
4190 & H:PRINT "A force de marcher en long et en      large dans cette maison,"
4195 & W 300:PRINT "vous sombrez dans un coma des plus    mortel...": & W 300: RETURN
4200 PRINT "L'eau coule...": RETURN
4210 & H:PRINT "Vous avez les pieds trempes,et cela   vous rend tres malade..."
4215 & W 400:PRINT "Vous mourez d'une triple pneumonie...!": & W 300: RETURN
4220 PRINT "Le titre est:": & W 200:PRINT "La mort a la premiere page.": & W 300: RETURN
4230 & H:FOR N=1 TO 20: & E :NEXT
4233 PRINT "Le livre a explose lorsque vous l'avezouvert...": & W 400: RETURN
4240 PRINT "Le papier indique:  Cherchez la clef.": & W 300: RETURN
4250 PRINT "La clef vous permettera de trouver le code de la porte d'entree."
4255 & W 400: RETURN
4260 & H:PRINT "Il y a , a cote de la porte,un claviernumerique permettant ";
4265 PRINT "d'entrer un code": & W 400: RETURN
4270 PRINT "Pour faire quoi..?": & W 200: RETURN
4280 PRINT "Il y a une odeur de gaz.": & W 300: RETURN
4290 PRINT "Apparement,il n'y a occune odeur      mais...": & W 300: RETURN
4300 PRINT "C'est deja fait,espece de rigolo": & W 300: RETURN
4310 PRINT "Il faudrait peut etre du feu": & W 300: RETURN
4320 PRINT "La lampe ne contient pas de petrole": & W 300: RETURN
4330 PRINT "Vous ne l'avez pas": & W 200: RETURN
4340 PRINT "Le briquet est encore allume et il    eclaire la piece."& W 300: RETURN
4350 FOR N=1 TO 15: & E : & W 4:NEXT
4355 PRINT "La torche etait piegee,elle vous      explose dans les mains.."
4357 & W 400: RETURN
4360 PRINT "La lampe est encore allumee,et elle   vous eclaire": & W 300: RETURN
4370 & H:PRINT "Un nain vient de vous lancer un       poignard en plein coeur.."
4375 & W 300: RETURN
4380 PRINT "Un nain vient de se precipiter sur    vous,il s'empalle sur votre";
4385 PRINT " ciseau": & W 400: RETURN
4390 PRINT "Un nain vient de se precipiter sur    vous,il s'empalle sur votre";
4395 PRINT " couteau": & W 400: RETURN
4400 & H:PRINT "Vous venez de renverser le pot": & W 150: RETURN
4410 & H:PRINT "La foudre vient de tomber sur la      maison": & W 200
4412 PRINT "La maison n'existe plus,vous non plus": & W 200: RETURN
4420 & H:PRINT "A force de marcher dans le noir,vous  avez trebuche": & W 200
4425 PRINT "Vous mourez d'une fracture du crane...": & W 200: RETURN
4430 PRINT "Vous ne pouvez pas travailler dans le noir...": & W 300: RETURN
4440 PRINT "La lumiere du briquet ne suffit pas   pour travaillez...": & W 400: RETURN
4450 PRINT "Impossible !": & W 100: RETURN
4460 PRINT "Vous n'avez aucun outil..": & W 250: RETURN
4470 PRINT "Le teleporteur est en panne,donc les  boutons ne fonctionnent pas."
4475 & W 400: RETURN
4480 FOR N=1 TO 25: & E : & W 5:NEXT
4484 PRINT "Le teleporteur vient d'exploser,vous  etes decompose..!": & W 400: RETURN
4490 PRINT "Le teleporteur se met en marche,vous  disparaissez"
4491 REM MUSIC2,1,5,0:PLAY2,1,3,1000
4492 FOR N=1 TO 12
4493 & P 4: & W 8: & P 1: & W 8: & P 3: & W 8: & P 4: & W 8: & P 1: & W 8
4494 NEXT: & P 0: REM PLAY0,0,0,0
4495 FOR N=500 TO 30 STEP-5
4497 NEXT: REM SOUND2,N,12:PLAY2,0,0,100:NEXT
4498 RETURN : REM PLAY0,0,0,0 : & H: RETURN
4500 & H:PRINT "Vous prenez du 30000 Volts dans les   doigts,": & W 300: RETURN
4510 PRINT "Le placard est ferme a clef": & W 150: RETURN
4520 & H:PRINT "L'horrible monstre sorti du placard   vient de vous devorer"
4525 & W 400: RETURN
4530 PRINT "Il ne fallait pas fuir": & W 200: RETURN
4540 & H:PRINT "Vous avez raison d'utiliser le ciseau,le monstre est mort"
4545 & W 400: RETURN
4550 PRINT "A l'interieur du placard,le No "PL"   est inscrit": & W 300
4555 PRINT "Le placard se referme.": & W 150: RETURN
4560 & H:FOR N=1 TO 30: & E : & W 5:NEXT:PRINT "le pistolet a explose": & W 200
4565 RETURN
4570 & H:FOR N=1 TO 25: & E : & W 7:NEXT:
4575 PRINT "le clavier numerique a explose": & W 250: RETURN
4580 & H:PRINT "Le clavier numerique prends feu,      heureusement,vous aviez ";
4582 & W 300:PRINT "un pot plein": & W 100
4585 PRINT "d'eau qui vous a permis d'eteindre ce feu"
4586 & W 400: RETURN
4590 & H:INPUT"No DE CODE";ZC
4595 IF ZC<>PL THEN GOTO 4570
4600 & W 200:PRINT "Le code est exact...":POP:PRINT "La porte s'ouvre..."
4603 & W 400
4605 GOSUB 10000: PRINT "Vous voila en dehors de la maison..."
4608 PRINT CHR$(4);"RUN GAGNE"
4610 & H:PRINT "A l'interieur du placard,il y a un motqui parle d'un teleporteur"
4615 & W 400:PRINT "Tiens le placard se ferme tout seul...": & W 150: RETURN
4620 PRINT "Avant de la poser par terre,il        faudrait peut etre l'enlever."
4625 & W 350: RETURN
4630 & H:PRINT "Il y a un horrible monstre devant vousqui est sortie du placart."
4635 & W 400: RETURN
4640 & H:PRINT "Le placard etait piege,vous n'auriez  pas du l'ouvrir"
4645 FOR N=1 TO 30: & E : & W 7:NEXT
4647 & W 150: RETURN

6000 REM    ANALYSE DU MOT
6010 N=0:GN=0
6020 REPEAT:N=N+1
6030 UNTIL MID$(X$,N,1)<>" "
6040 REPEAT:GN=GN+1
6050 UNTIL MID$(X$,N+GN,1)=" "OR MID$(X$,N+GN,1)="" OR GN=20
6060 IF GN>4 THEN GN=4
6070 X$(1)=MID$(X$,N,GN)
6080 REPEAT:N=N+1
6090 UNTIL MID$(X$,N,1)=" "OR MID$(X$,N,1)=""
6100 REPEAT:N=N+1
6110 UNTIL MID$(X$,N,1)<>" "
6115 GN=0
6120 REPEAT:GN=GN+1
6130 UNTIL MID$(X$,N+GN,1)=" "OR MID$(X$,N+GN,1)="" OR GN=20
6140 IF GN>4 THEN GN=4 
6150 X$(2)=MID$(X$,N,GN)
6160 FOR W=1 TO 2:N=0:MO$(W)="00"
6170 N=N+1
6180 IF N>V THEN W=3:GOTO 6300
6190 IF MID$(V$(N),3,4)=X$(W) THEN GOTO 6250
6200 GOTO 6170
6250 MO$(W)=MID$(V$(N),1,2)
6300 NEXT W
6310 RETURN

7000 GOSUB 10000
7005 PRINT "Vous etes devant le manoir du defunt":& W 250 
7006 PRINT SPC(12)"Dr  GENIUS"
7007 GOSUB 13000: RETURN
7010 GOSUB 10100 
7015 PRINT "Vous etes dans le hall d'entree."
7016 GOSUB 13000: RETURN
7020 GOSUB 10200
7024 PRINT "Vous etes en bas de l'escalier menant au 2eme etage"
7025 GOSUB 13000: RETURN
7030 F1=0: GOSUB 10300
7034 PRINT "Vous etes dans la salle a manger."        
7035 GOSUB 13000: RETURN
7040 F1=1: GOSUB 10300
7043 PRINT "Vous etes dans une biblioteque sans   livre...!"         
7045 GOSUB 13000: RETURN
7050 GOSUB 10500    
7053 PRINT "Vous etes dans une buanderie"
7055 GOSUB 13000: RETURN
7060 GOSUB 10600
7063 PRINT "Vous etes dans le salon"
7065 GOSUB 13000: RETURN
7070 LX=0: GOSUB 10700
7073 PRINT "Vous etes dans une chambre."
7075 GOSUB 13000: RETURN
7080 GOSUB 10800
7083 PRINT "Vous etes dans un corridor"
7085 GOSUB 13000: RETURN
7090 LX=0: GOSUB 10900
7093 PRINT "Vous etes dans une salle d'attente."
7095 GOSUB 13000: RETURN
7100 LX=0: GOSUB 11000
7103 PRINT "Vous etes dans le vestibules"
7105 GOSUB 13000: RETURN
7110 LX=2: GOSUB 10700
7113 PRINT "Vous etes dans la chambre d'amis."
7115 GOSUB 13000: RETURN
7120 LX=1: GOSUB 10700
7123 PRINT "Vous etes dans une chambre."
7125 GOSUB 13000: RETURN
7140 LX=2: GOSUB 12200
7143 PRINT "Vous etes dans une petite salle"
7145 GOSUB 13000: RETURN
7150 GOSUB 11500
7153 PRINT "Vous etes dans le laboratoire du                Dr GENIUS" 
7155 GOSUB 13000: RETURN
7160 LX=1: GOSUB 10900
7163 PRINT "Vous etes dans une petite piece vide."
7165 GOSUB 13000: RETURN
7170 GOSUB 11700
7173 PRINT "Vous etes...": & W 300:PRINT "Justement,vous ne savez pas ou vous   etes"
7175 GOSUB 13000: RETURN
7180 GOSUB 11800
7183 PRINT "Vous etes en haut de l'escalier"           
7185 GOSUB 13000: RETURN
7190 LX=2: GOSUB 10900
7193 PRINT "Vous etes dans la salle bain" 
7195 GOSUB 13000: RETURN
7200 LX=1: GOSUB 12200
7203 PRINT "Vous etes dans le living room"
7205 GOSUB 13000: RETURN
7210 LX=1: GOSUB 11000
7213 PRINT "Vous etes dans une piece enfumee...!"
7215 GOSUB 13000: RETURN
7220 LX=0: GOSUB 12200
7223 PRINT "Vous etes dans une grande piece"
7225 GOSUB 13000: RETURN
7230 GOSUB 12300
7233 PRINT "Vous etes dans une piece de rangement"
7235 GOSUB 13000: RETURN 
7240 GOSUB 12400
7243 PRINT "Vous etes dans le dressing"
7245 GOSUB 13000: RETURN

10000 RETURN
10100 RETURN
10200 RETURN
10300 RETURN
10400 RETURN 
10500 RETURN
10600 RETURN
10700 RETURN
10800 RETURN
10900 RETURN
11000 RETURN
11500 RETURN
11700 RETURN
11800 RETURN
12200 RETURN
12300 RETURN
12400 RETURN

13000 IF PEEK(-16384)<128 THEN 13020
13010 & W 300
13020 & W 100: POKE -16368,0: RETURN

13100 IF PEEK(49179)<128 THEN 13120
13110 POKE 49234,0: RETURN
13120 POKE 49235,0: RETURN

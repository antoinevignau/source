200 REM   DESCRIPTION SALLE
210 PRINT
220 GOSUB(7000+SALLE*10)-10
300 H=0:N=1
310 IF O(N)<>SALLE THEN 400
320 IF H=1 THEN GOTO 350 
330 PRINT"Il y a dans la salle:":WAIT 100
340 H=1
350 PRINT" ";O$(N);
360 WAIT 150
400 N=N+1
410 IF N<=O THEN 310 
420 PRINT"" 

500 REM ACCEPTATION COMMANDE
510 T=1:Y$(1) ="":Y$(2)="":N=0
520 GOTO 1000
530 IF C(7)>1 AND P(7)=1 THEN C(7)=C(7)-1 
540 IF C(3)>1 AND P(3)=1 THEN C(3)=C(3)-1
545 IF C(4)>1 AND P(4)=1 THEN C(4)=C(4)-1
547 IF  C(5)>1 THEN C(5)=C(5)-1
550 INPUT"Que faites vous";X$
560 CLS:PRINTX$   
570 GOSUB 6000
580 IF MO$(1)="00" THEN PRINT"Je ne comprends pas...":WAIT 200:GOTO100

1000 REM  CONTROLE 
1010 NL=0
1100 NL=NL+1
1110 IF T=0 THEN GOTO 1150
1120 E$=C$(NL)
1130 GOTO 1400
1150 IF NL<=A THEN 1200
1159 PY=23:CO=12
1160 IF A1=1 THEN GOTO 500 
1170 PRINT"Impossible ";
1180 IF VAL(MO$(1))<10 THEN PRINT"de prendre ce chemin";
1190 PRINT"!":GOTO 100
1200 IF MID$(A$(NL),1,2)<>MO$(1) THEN 1100 
1210 Y$=MID$(A$(NL),3,2)
1220 IF Y$<>"00" AND Y$<>MO$(2) THEN 1100
1230 E$=MID$(A$(NL),5)

4000 HIRES:FORN=1TO20:EXPLODE:WAIT4:NEXT
4001 PRINT"Vous avez gardez la lampe trop        longtemps allumee,elle a explose"
4005 WAIT400:RETURN

4010 HIRES
4011 PRINT"Vous avez oubliez de fermer le robinetvous mourez sous des tonnes d'eau"
4015 WAIT500:RETURN

4020 HIRES
4022 PRINT"Lapporte vient de se refermer derrierevous,vous voila prisonnier..."
4025 WAIT500:RETURN

4030 HIRES
4031 PRINT"Vous avez trebuche dans l'escalier,vous vous empallez sur le couteau!"
4035 WAIT500:RETURN

4040 HIRES
4041 PRINT"Vous renversez l'eau dans l'escalier, ce qui provoque une decharge";
4042 PRINT" de la":WAIT300:PRINT"prise electrique" 
4045 WAIT300:RETURN

4050 HIRES 
4051 PRINT"Vous etes sauf grace a la combinaison que vous avez enfile..!"
4055 WAIT500:RETURN

4060 PRINT"Vous mourrez electrocute..."
4065 WAIT300:RETURN

4070 HIRES:FOR N=1 TO 20:MUSIC2,2,2,10:PLAY3,7,4,80:WAIT1:EXPLODE:WAIT6:NEXT
4071 PRINT"La piece etait pleine de gaz explosif,vous auriez du eteindre..."
4072 WAIT500:CLS:PRINT"On ramassera vos morceaux un          autre jour..!"
4075 WAIT300:RETURN

4080 HIRES 
4081 PRINT"Vous mourez empalle sur des lances    sorties du mur...!" 
4085 WAIT400:RETURN

4090 REM
4091 PRINT"La porte ne s'ouvre pas de cette piece":WAIT300:RETURN

4100 HIRES
4101 PRINT"La lampe et le briquet refusent de    marcher dans cette piece"
4105 WAIT400:RETURN

4110 HIRES
4111 PRINT"Vous tombez dans une trappe,vous vous disloquez en arrivant au sol.."
4115 WAIT500:RETURN

4120 REM  
4121 PRINT"Vous avez raison de passer,car ce     monstre n'etait qu'une projection"
4124 WAIT400:PRINT"en 3 dimentions sur un ecran de fumee"
4125 WAIT250:RETURN

4130 REM  
4131 PRINT"Vous avez raison,la curiosite est un  vilain defaut!!!"
4132 WAIT400
4133 POP:TEXT:PRINT:PRINT:PRINTSPC(12)"AU REVOIR"
4135 WAIT200:GOTO20100

4140 PRINT"Vous avez raison d'attendre,mais cela ne pourra pas durer";
4141 PRINT" eternellement.."
4142 WAIT450:RETURN

4150 :HIRES:PRINT"Vous avez de la chance car ce coffre  etait ouvert.":WAIT400
4152 PRINT"Un message a l'interieur dit:":WAIT250:PRINT"Ne respectez pas les ";
4154 PRINT"couleurs du":PRINT"code de la route...?":WAIT500 
4156 PRINT"Tiens le coffre se referme":WAIT200:RETURN

4160 PRINT"Maintenant,vous avez une lampe pleine de petrole"
4165 WAIT400:RETURN

4170 PRINT"Vous n'avez rien pour transporter le  petrole":WAIT400:RETURN

4180 HIRES:PRINT"Le briquet que vous aviez laisse      allume vient d'exploser"
4181 FOR N=1 TO 10:EXPLODE:WAIT6:NEXT
4185 WAIT300:PRINT"Ca tue l'etourderie.....":WAIT200:RETURN

4190 HIRES:PRINT"A force de marcher en long et en      large dans cette maison,"
4195 WAIT300:PRINT"vous sombrez dans un coma des plus    mortel...":WAIT300:RETURN

4200 PRINT"L'eau coule...":RETURN

4210 HIRES:PRINT"Vous avez les pieds trempes,et cela   vous rend tres malade..."
4215 WAIT400:PRINT"Vous mourez d'une triple pneumonie...!":WAIT300:RETURN

4220 PRINT"Le titre est:":WAIT200:PRINT"La mort a la premiere page.":WAIT300:RETURN

4230 HIRES:FOR N=1 TO 20:EXPLODE:NEXT
4233 PRINT"Le livre a explose lorsque vous l'avezouvert...":WAIT400:RETURN

4240 PRINT"Le papier indique:  Cherchez la clef.":WAIT300:RETURN

4250 PRINT"La clef vous permettera de trouver le code de la porte d'entree."
4255 WAIT400:RETURN

4260 HIRES:PRINT"Il y a , a cote de la porte,un claviernumerique permettant ";
4265 PRINT"d'entrer un code":WAIT400:RETURN

4270 PRINT"Pour faire quoi..?":WAIT200:RETURN

4280 PRINT"Il y a une odeur de gaz.":WAIT300:RETURN

4290 PRINT"Apparement,il n'y a occune odeur      mais...":WAIT300:RETURN

4300 PRINT"C'est deja fait,espece de rigolo":WAIT300:RETURN

4310 PRINT"Il faudrait peut etre du feu":WAIT300:RETURN

4320 PRINT"La lampe ne contient pas de petrole":WAIT300:RETURN

4330 PRINT"Vous ne l'avez pas":WAIT200:RETURN

4340 PRINT"Le briquet est encore allume et il    eclaire la piece."WAIT300:RETURN

4350 FOR N=1 TO 15:EXPLODE:WAIT4:NEXT
4355 PRINT"La torche etait piegee,elle vous      explose dans les mains.."
4357 WAIT400:RETURN

4360 PRINT"La lampe est encore allumee,et elle   vous eclaire":WAIT300:RETURN

4370 HIRES:PRINT"Un nain vient de vous lancer un       poignard en plein coeur.."
4375 WAIT300:RETURN

4380 PRINT"Un nain vient de se precipiter sur    vous,il s'empalle sur votre";
4385 PRINT" ciseau":WAIT400:RETURN

4390 PRINT"Un nain vient de se precipiter sur    vous,il s'empalle sur votre";
4395 PRINT" couteau":WAIT400:RETURN

4400 HIRES:PRINT"Vous venez de renverser le pot":WAIT150:RETURN

4410 HIRES:PRINT"La foudre vient de tomber sur la      maison":WAIT200
4412 PRINT"La maison n'existe plus,vous non plus":WAIT200:RETURN

4420 HIRES:PRINT"A force de marcher dans le noir,vous  avez trebuche":WAIT200
4425 PRINT"Vous mourez d'une fracture du crane...":WAIT200:RETURN

4430 PRINT"Vous ne pouvez pas travailler dans le noir...":WAIT300:RETURN

4440 PRINT"La lumiere du briquet ne suffit pas   pour travaillez...":WAIT400:RETURN

4450 PRINT"Impossible !":WAIT100:RETURN

4460 PRINT"Vous n'avez aucun outil..":WAIT250:RETURN

4470 PRINT"Le teleporteur est en panne,donc les  boutons ne fonctionnent pas."
4475 WAIT400:RETURN

4480 FOR N=1 TO 25:EXPLODE:WAIT5:NEXT
4484 PRINT"Le teleporteur vient d'exploser,vous  etes decompose..!":WAIT400:RETURN

4490 PRINT"Le teleporteur se met en marche,vous  disparaissez"
4491 MUSIC2,1,5,0:PLAY2,1,3,1000
4492 FOR N=1 TO 12
4493 PAPER4:WAIT8:PAPER1:WAIT8:PAPER3:WAIT8:PAPER4:WAIT8:PAPER1:WAIT8
4494 NEXT:PAPER0:PLAY0,0,0,0
4495 FOR N=500 TO 30 STEP-5
4497 SOUND2,N,12:PLAY2,0,0,100:NEXT
4498 PLAY0,0,0,0 :HIRES:RETURN

4500 HIRES:PRINT"Vous prenez du 30000 Volts dans les   doigts,":WAIT300:RETURN
4510 PRINT"Le placard est ferme a clef":WAIT150:RETURN

4520 HIRES:PRINT"L'horrible monstre sorti du placard   vient de vous devorer"
4525 WAIT400:RETURN

4530 PRINT"Il ne fallait pas fuir":WAIT200:RETURN

4540 HIRES:PRINT"Vous avez raison d'utiliser le ciseau,le monstre est mort"
4545 WAIT400:RETURN

4550 PRINT"A l'interieur du placard,le No "PL"   est inscrit":WAIT300
4555 PRINT"Le placard se referme.":WAIT150:RETURN

4560 HIRES:FOR N=1 TO 30:EXPLODE:WAIT5:NEXT:PRINT"le pistolet a explose":WAIT200
4565 RETURN

4570 HIRES:FOR N=1 TO 25:EXPLODE:WAIT7:NEXT:
4575 PRINT"le clavier numerique a explose":WAIT250:RETURN

4580 HIRES:PRINT"Le clavier numerique prends feu,      heureusement,vous aviez ";
4582 WAIT300:PRINT"un pot plein":WAIT100
4585 PRINT"d'eau qui vous a permis d'eteindre ce feu"
4586 WAIT400:RETURN

4590 HIRES:INPUT"No DE CODE";ZC
4595 IF ZC<>PL THEN GOTO 4570

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
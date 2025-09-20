10 ' DESERT 1
20 MODE 1:BORDER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Desert1.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Le desert.":PRINT #1:PRINT #1,"Des dunes":PRINT #1,"a perte":PRINT #1,"de vue,":PRINT #1,"balayees"
125 PRINT #1,"par le":PRINT #1,"vent chaud":PRINT #1,"s'etirent":PRINT #1,"sous un":PRINT #1,"ciel":PRINT #1,"implacable."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3:LOCATE 4,21:PRINT "1-Retourner au Caire    2-Examiner"
150 PEN 2:LOCATE 4,22:PRINT "3-NORD  4-SUD  5-OUEST  6-S'assoir"
160 PEN 3:LOCATE 4,23:PRINT "7-Admirer le coucher de soleil"
170 PEN 2:LOCATE 4,24:PRINT "8-Faire semblant d'etre mort"
200 k$=INKEY$
210 IF k$="1"THEN RUN"Caire.bas"
220 IF k$="2"THEN GOTO 300
230 IF k$="3"THEN GOTO 400
240 IF k$="4"THEN RUN"Desert2.bas"
250 IF k$="5"THEN GOTO 500
260 IF k$="6"THEN GOTO 600
270 IF k$="7"THEN GOTO 700
280 IF k$="8"THEN GOTO 800
290 IF k$<"1"OR k$>"8" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 1:PRINT"Bienvenue dans le desert !"
320 PEN 3:PRINT:PRINT"Du sable partout : sous vos pieds,":PRINT"dans vos narines, et probablement":PRINT"jusque dans vos idees."
330 PEN 2:PRINT:PRINT"Les dunes s'etendent a perte de vue,":PRINT"au point qu'un GPS jetterait l'eponge":PRINT"en pleurnichant."
340 PEN 3:PRINT:PRINT"Bref, sans un plan precis, vous":PRINT"risquez moins de trouver une oasis que":PRINT"de finir comme une legende archeologique"
350 LOCATE 1,13:PRINT:PRINT"dont on rigolera dans 3000 ans."
360 PEN 1:PRINT:PRINT"TAREQ vous a surement laisse un indice":PRINT"pour trouver Qattara sans que":PRINT"vous ne finissiez perdu a tourner":PRINT"en rond dans ce tas infini de sable !"
370 PEN 2:PRINT:PRINT"Faites marcher votre memoire..."
380 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
390 GOTO 60
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT:PRINT"Certains chantaient qu'au nord c'etait":PRINT"les corons..."
420 PEN 1:PRINT:PRINT"Ici, c'est plutot les scorpions..."
430 PEN 2:PRINT:PRINT"Et en rang d'oignon, prets a bloquer":PRINT"le passage comme des videurs de":PRINT"discotheque."
440 PEN 3:PRINT:PRINT"Vous tentez bien d'en imiter un,":PRINT"histoire de passer incognito...":PRINT"Mais, soyez lucide, vous n'avez pas":PRINT"la queue assez longue pour etre":PRINT"credible !"
460 PEN 2:PRINT:PRINT"Conclusion :":PRINT"Le NORD, ca va pas etre possible.":LOCATE 4,18:PEN 3:PRINT"NORD"
470 PEN 1:PRINT:PRINT"Et il va par ailleurs falloir":PRINT"commencer a vous mefier serieusement":PRINT"de la faune locale si vous ne":PRINT"voulez pas finir en kebab."
480 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
490 GOTO 60    
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT:PRINT"Ah, l'OUEST... Sublime initiative !"
520 PEN 1:PRINT:PRINT"Comme toujours quand il s'agit de":PRINT"courir vers le danger !"
530 PEN 2:PRINT:PRINT"Vous etes si previsible."
540 PEN 3:PRINT:PRINT"La-bas, les sables mouvants vous":PRINT"attendent comme des fans hysteriques":PRINT"a un spectacle de claquettes :"
550 PEN 1:PRINT"prets a vous happer tout cru, en":PRINT"applaudissant vos derniers pas."
560 PEN 2:PRINT:PRINT"Bon, soyons clairs : l'OUEST, c'est":PRINT"le fast-pass express pour une mort":PRINT"ridicule.":LOCATE 24,15:PEN 3:PRINT"OUEST"
570 PEN 1:LOCATE 9,19:PRINT"Vous restez donc ici."
575 PEN 3:PRINT:PRINT"Et, un conseil : Ne posez pas vos":PRINT"orteilles n'importe ou a l'avenir..."
580 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
590 GOTO 60
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
610 PEN 3:PRINT:PRINT"Vous posez votre auguste et delicat":PRINT"croupion sur le sable brulant du":PRINT"desert."
620 PEN 2:PRINT:PRINT"Le contact, plutot confortable au":PRINT"debut, se fait tres clairement moins":PRINT"agreable lorsque la brulure au 3eme":PRINT"degre causee par la chaleur intense":PRINT"vient consteller de cloques votre":PRINT"jolie peau de bebe...
630 PEN 3:PRINT:PRINT"Allez, un peu de talc et c'est reparti !"
640 PEN 1:PRINT:PRINT"Petite chochotte, va !"
650 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
660 GOTO 60
700 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:PRINT:PRINT"Une soudaine envie de vous":PRINT"rememorer les moments nostalgiques":PRINT"passes avec Germaine, votre ex":PRINT"partie trop tot avec Gerard, le":PRINT"boucher-charcutier ?"
720 PEN 2:PRINT:PRINT"Vous etes un romantique vous,":PRINT"je le savais !"
730 PEN 1:PRINT:PRINT"C'est vrai que quand Germaine se":PRINT"dechaine, difficile de l'oublier..."
740 PEN 3:PRINT:PRINT"Bon, on arrete de pleurnicher":PRINT"comme une mauviette et on reprend":PRINT"l'aventure, hein ?"
750 PEN 2:PRINT:PRINT"On dit qu'on fait comme ca, ok ?"
760 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
770 GOTO 60
800 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT"Dans un eclair de genie...":PRINT"ou de deshydratation, vous vous":PRINT"allongez dans le sable, bras en croix,":PRINT"yeux mi-clos, telle une momie."
820 PEN 2:PRINT:PRINT"Une mouche inspecte votre oreille,":PRINT"repart decue.":PRINT"Un vautour vous trouve trop frais":PRINT"pour etre comestible."
830 PRINT"Des scarabees vous escaladent avec":PRINT"enthousiasme, pensant avoir trouve":PRINT"une nouvelle colline sacree."
840 PEN 1:PRINT:PRINT"Apres quelques minutes de cette":PRINT"performance digne d'un Oscar, vous":PRINT"vous relevez."
850 PEN 3:PRINT:PRINT"Bilan :":PRINT"        - Aucun ennemi.":PRINT"        - Vous etes encore vivant."
860 PEN 2:PRINT:PRINT"Si un esprit du desert vous a vu,":PRINT"Il a du bien se marrer !"
870 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
880 GOTO 60

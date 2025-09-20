10 ' DESERT 3
20 MODE 1:BORDER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Desert3.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Une oasis":PRINT #1,"surgit":PRINT #1,"comme un":PRINT #1,"mirage.":PRINT #1:PRINT #1,"Ici, le"
125 PRINT #1,"desert":PRINT #1,"s'incline":PRINT #1,"et offre":PRINT #1,"un souffle":PRINT #1,"de vie."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3:LOCATE 4,21:PRINT "1-NORD    2-SUD    3-OUEST   4-EST"
150 PEN 2:LOCATE 4,22:PRINT "5-Examiner  6-Plonger dans l'oasis"
160 PEN 3:LOCATE 4,23:PRINT "7-Fouiller la vegetation"
170 PEN 2:LOCATE 4,24:PRINT "8-Puiser de l'eau dans l'oasis"
200 k$=INKEY$
210 IF k$="1"THEN GOTO 300
220 IF k$="2"THEN GOTO 400
230 IF k$="3"THEN RUN"Desert4.bas"
240 IF k$="4"THEN RUN"Desert2.bas"
250 IF k$="5"THEN GOTO 500
255 IF k$="6" AND PEEK(&7004)=0 THEN GOTO 600
260 IF k$="6" AND PEEK(&7004)=1 THEN GOTO 700
270 IF k$="7"THEN GOTO 800
280 IF k$="8" AND PEEK(&7005)=0 THEN GOTO 900
285 IF k$="8" AND PEEK(&7005)=1 THEN GOTO 1000
290 IF k$<"1"OR k$>"8" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Vous allez au NORD."
320 PEN 2:PRINT:PRINT"Tout a coup les dunes semblent":PRINT"inexplicablement se lever..."
330 PEN 1:PRINT:PRINT"Hallucination ?"
340 PEN 3:PRINT:PRINT"Non, vous etes simplement en train":PRINT"de vous enfoncer petit a petit dans":PRINT"les sables mouvants..."
350 PEN 1:PRINT:PRINT"Impossible d'en sortir."
360 PEN 2:PRINT:PRINT"Votre derniere pensee est celle":PRINT"d'une scene de film avec Pierre Richard":PRINT"et Gerard Depardieu..."
370 PEN 1:PRINT:PRINT"Game Over !"
380 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
390 RUN"Mort.bas"
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT:PRINT"Vous filez vers le SUD, avec la":PRINT"fougue d'un explorateur...":PRINT:PRINT"Et l'intelligence d'un pigeon qui":PRINT"fonce dans une vitre."
420 PEN 1:PRINT:PRINT"En deux pas, bravo :":PRINT"vous avez trouve le parc d'attractions":PRINT"officiel des sables mouvants !"
430 PEN 2:PRINT:PRINT"Ticket unique, sortie definitive."
440 PEN 3:PRINT:PRINT"Vous agitez les bras, mais ca ne":PRINT"change rien : au mieux, vous ressemblez":PRINT"a un nageur en compote de sable."
450 PEN 1:PRINT:PRINT"Votre derniere bulle d'air s'echappe...":PRINT"et avec elle, votre dignite."
460 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
470 RUN"Mort.bas"
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT:PRINT"Une oasis !"
520 PEN 1:PRINT:PRINT"Miracle au milieu de ce grille-pain":PRINT"geant qu'on appelle le desert."
530 PEN 3:PRINT:PRINT"Quelques palmiers, histoire de faire":PRINT"joli sur la carte postale, un peu de":PRINT"verdure qui se bat en duel, et autour":PRINT"les dunes, toujours les dunes..."
540 PEN 2:PRINT:PRINT"Comme un public de sable qui vous":PRINT"observe transpirer."
550 PEN 3:PRINT:PRINT"Au centre, une eau cristalline qui vous":PRINT"fait de l'oeil, genre :"
560 PEN 2:PRINT:PRINT CHR$(34);"Allez, viens te baigner... qu'est ce":PRINT"qui pourrait mal se passer ?";CHR$(34)
570 PEN 1:PRINT:PRINT"(Spoiler : toujours TOUT !!!)"
580 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
590 GOTO 60
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
610 PEN 3:PRINT:PRINT"Ni une ni deux, vous plongez dans l'eau":PRINT"cristalline comme si vous etiez Tarzan":PRINT"en vacances."
620 PEN 1:LOCATE 16,6:PRINT"SPLONK !"
630 PEN 2:PRINT:PRINT"Votre crane percute un truc metallique":PRINT"planque sous la surface."
640 PEN 3:PRINT:PRINT"Bonne nouvelle : ce n'etait pas un":PRINT"sous-marin allemand, juste... une pelle.":LOCATE 31,12:PEN 1:PRINT"une pelle"
650 PEN 2:LOCATE 1,14:PRINT"Vous la sortez de l'eau, fier comme":PRINT"si vous aviez peche Excalibur."
660 PEN 1:PRINT:PRINT"Et avouez-le : une pelle dans le desert,":LOCATE 1,18:PRINT"ca fait tout de suite aventurier pro":PRINT"(ou fossoyeur du dimanche)."
670 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
680 POKE &7004,1:GOTO 60
700 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:PRINT:PRINT"Le coup de pelle en pleine tronche":PRINT"ne vous a pas suffit la premiere fois ?"
720 PEN 2:PRINT:PRINT"Il faut que vous plongiez a nouveau":PRINT"dans cet oasis, c'est plus fort que":PRINT"vous, hein ?"
730 PEN 1:PRINT:PRINT" Vous voici ENCORE au milieu de l'eau."
740 PEN 3:PRINT:PRINT"Vous remuez, grattez, fouillez...":PRINT"et tout ce que vous reussissez a faire,":PRINT"c'est buller comme une carpe constipee."
750 PEN 1:PRINT:PRINT"Resultat ?":PEN 2:PRINT:PRINT"Rien. Pas un tresor, pas une pelle":PRINT"magique numero 2, meme pas une vieille":PRINT"tong abandonnee."
760 PEN 1:PRINT:PRINT"Allez, on sort et on fait semblant":PRINT"d'etre mature, deux minutes."
770 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
780 GOTO 60
800 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT:PRINT"Vous decidez de fouiller la vegetation,":PRINT"convaincu que l'aventure vous sourit."
820 PEN 2:PRINT:PRINT"Vous ecartez les hautes herbes en":PRINT"quete d'un tresor cache."
830 PEN 1:PRINT:PRINT"Bravo ! Vous venez de trouver...":PRINT"un magnifique Datura, une plante":PRINT"toxique que l'on surnomme ici":PRINT:PRINT "          ";CHR$(34);"Herbe du Diable";CHR$(34)
840 LOCATE 15,9:PEN 3:PRINT"Datura":LOCATE 1,14:PRINT"Tout un programme !"
850 PEN 2:PRINT:PRINT"En moins de deux minutes, vous voyez":PRINT"trois soleils et un chameau violet."
860 PEN 1:PRINT:PRINT"Vous riez, vous pleurez, vous tombez,":PRINT"vous mourez."
870 PEN 2:PRINT:PRINT"Fin de l'exploration..."
880 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
890 RUN"Mort.bas"
900 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
910 PEN 3:PRINT:PRINT"Vous videz soigneusement le lait de":PRINT"votre jarre sur le sable."
920 PEN 2:PRINT:PRINT"Le desert vous remercie :":PRINT"il n'attendait que ca pour ouvrir une":PRINT"fromagerie locale..."
930 PEN 1:PRINT:PRINT"Puis, tel un sommelier en toc, vous":PRINT"remplissez votre precieuse jarre d'eau":PRINT"fraiche et cristalline de l'oasis."
940 PEN 3:PRINT:PRINT " ";CHR$(34);"Une eau rare,":PRINT"    prete a etancher votre soif...":PRINT"                         d'aventure !";CHR$(34):PEN 1:LOCATE 28,15:PRINT"aventure"
950 PEN 2:PRINT:PRINT:PRINT"Avouez, ca claque, hein ?":PRINT"Normal, c'est de moi."
960 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
970 POKE &7005,1:GOTO 60
1000 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1010 PEN 3:PRINT:PRINT"Ok..."
1020 PEN 2:PRINT:PRINT"Vous videz l'eau que vous aviez deja":PRINT"recueillie, juste pour remplir":PRINT"- A NOUVEAU - votre jarre.":PEN 3:LOCATE 3,6:PRINT"A NOUVEAU"
1030 PEN 1:PRINT:PRINT"Heu...":PRINT"Serieusement, c'est quoi le projet ?":PRINT"Assecher toute l'oasis a vous tout":PRINT"seul ?"
1040 PEN 3:PRINT:PRINT"Battre un record de gaspillage ou quoi ?"
1050 PEN 2:PRINT:PRINT"Quoi qu'il en soit, vous avez":PRINT"- A NOUVEAU - de l'eau fraiche...":PEN 3:LOCATE 3,17:PRINT"A NOUVEAU"
1060 PEN 1:PRINT:PRINT"Votre jarre est pleine, contrairement":PRINT"a votre sens de la reflexion qui,":PRINT"lui, est totalement vide."
1070 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1080 GOTO 60 

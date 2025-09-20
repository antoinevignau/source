10 ' PYRAMIDA
20 MODE 1:BORDER 0:PAPER 0:L=0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"PyramidA.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Un":PRINT #1,"sanctuaire":PRINT #1,"de savoir,":PRINT #1,"perdu":PRINT #1,"dans le"
130 PRINT #1,"silence":PRINT #1,"eternel":PRINT #1,"des":PRINT #1,"pierres."
140 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
150 PEN 3:LOCATE 4,21:PRINT "1-OUEST    2-EST    3-Examiner"
160 PEN 2:LOCATE 4,22:PRINT "4-Escalader la bibliotheque"
170 PEN 3:LOCATE 4,23:PRINT "5-Lire le livre"
180 PEN 2:LOCATE 4,24:PRINT "6-Lire les rouleaux de papyrus"
200 k$=INKEY$
210 IF k$="1"THEN RUN"Pyramid9.bas"
220 IF k$="2"THEN RUN"PyramidB.bas"
230 IF k$="3"THEN GOTO 300
240 IF k$="4"THEN GOTO 400
250 IF k$="5"THEN GOTO 600
260 IF k$="6"THEN GOTO 500
280 IF k$<"1"OR k$>"6" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Vous decouvrez une bibliotheque de":PRINT"pierre, massive et solide, qui semble":PRINT"rire du temps et des tempetes."
320 PEN 2:PRINT:PRINT"Des rouleaux de papyrus poussiereux sont":LOCATE 1,7:PRINT"enroules et semblent vous lancer un defi":LOCATE 1,8:PRINT"silencieux :"
330 PEN 1:PRINT:PRINT"Qui osera nous derouler sans tout":PRINT"dechirer ?"
340 PEN 3:PRINT:PRINT"Un livre ouvert trone au centre,":PRINT"ses pages mysterieuses vous invitant":PRINT"a lire... ou a hesiter, comme si elles":PRINT"savaient que vous aimez trop les":PRINT"enigmes."
350 PEN 2:LOCATE 4,13:PRINT"livre"
360 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
370 GOTO 60 
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT"Vous grimpez sur la bibliotheque, en":PRINT"en prenant soin de ne pas vous emmeler":PRINT"dans les rouleaux de papyrus."
420 PEN 2:PRINT:PRINT"Chaque etagere menace de protester sous":PRINT"votre poids, mais miracle :":PEN 3:PRINT:PRINT"        La pierre est solide !"
430 PEN 1:PRINT:PRINT"Arrive au sommet, vous decouvrez une":PRINT"trappe dissimulee au plafond."
440 PEN 3:PRINT:PRINT"Avec un petit effort, vous la poussez.":PRINT"Elle grince comme si elle se moquait":PRINT"de vous."
450 PEN 2:PRINT:PRINT"Et vous vous engouffrez dans la nouvelle":LOCATE 1,18:PRINT"piece, esperant que le sol, lui aussi,":PRINT"ne se moque pas de votre sens de":PRINT"l'aventure."
460 PEN 1:PRINT:PRINT"Vous accedez a l'etage superieur de la":PRINT"pyramide..."
470 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
480 RUN"PyramidC.bas"
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT"Vous decouvrez un rouleau de papyrus et,":LOCATE 1,2:PRINT"curieux, vous commencez a le derouler."
520 PEN 2:PRINT:PRINT"Trempant votre pouce pour mieux":PRINT"tourner les pages, vous ne vous doutez":PRINT"de rien..."
530 PEN 3:PRINT:PRINT"Jusqu'au frisson glacial qui remonte":PRINT"le long de votre bras :"
540 PEN 1:PRINT:PRINT"    Le papier etait... empoisonne !"
550 PEN 2:PRINT:PRINT"Le poison passe de votre pouce a votre":PRINT"bouche, et vous sentez votre langue":PRINT"virer au bleu, exactement comme ces":PRINT"pauvres moines d'une abbaye ancienne"
560 PRINT"que l'on dit morts pour avoir trop":PRINT"fouille les manuscrits."
570 PEN 3:PRINT:PRINT"Vous avez beau hurler, c'est trop tard :":PEN 1:PRINT"Votre aventure s'arrete ici, avec un":PRINT"style... colore, pour le moins unique."
580 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
590 RUN"Mort.bas"
600 IF PEEK(&7003)=0 THEN GOTO 700
610 IF PEEK(&7003)=1 THEN GOTO 800
620 IF PEEK(&7003)=2 THEN GOTO 900
630 IF PEEK(&7003)=3 OR PEEK(&7003)=4 THEN GOTO 1000
700 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:PRINT"Vous prenez le livre en main, et une":PRINT"chose saute aux yeux :"
720 PEN 1:PRINT:PRINT"Ce n'est pas une relique antique, mais":PRINT"un bel ouvrage qui sent la papeterie":PRINT"de luxe !"
730 PEN 2:PRINT:PRINT"La couverture, bien que poussiereuse,":PRINT"affiche un cuir parfaitement lisse,":PRINT"presque trop moderne pour etre":PRINT"honnete."
740 PEN 3:PRINT:PRINT"Et ce papier... blanc, epais, impeccable"
750 LOCATE 1,14:PRINT"comme si quelqu'un avait oublie ici":PRINT"son manuel de FAC hier soir..."
760 PEN 2:PRINT:PRINT"Cela ne ressemble ni a un grimoire":PRINT"sacre, ni a une maldiction, mais":PRINT"plutot a un cours magistral ennuyeux."
770 PEN 1:PRINT:PRINT"A moins que... son contenu ne cache":PRINT"bien autre chose ?"
780 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
790 POKE &7003,1:GOTO 60
800 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT:PRINT"Sur la premiere page, vous decouvrez":PRINT"une lecon de physique appliquee !"
820 PEN 2:PRINT:PRINT"Le texte traite de la congelation et":PRINT"des lois de la temperature, avec des":PRINT"formules que meme votre prof de lycee":PRINT"aurait trouve suspectes."
830 PEN 3:PRINT:PRINT"Apparemment, le zero absolu n'est pas":PRINT"seulement une idee, mais un mode de vie":PRINT"et la cryogenie semble etre le sujet":PRINT"favori de l'auteur."
840 PEN 1:PRINT:PRINT:PRINT"   Etrange...":PRINT:PRINT"            et intriguant..."
850 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
860 POKE &7003,2:GOTO 60 
900 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
910 PEN 3:PRINT"La seconde page du manuel vous fait":PRINT"lever un sourcil :":PEN 1:PRINT:PRINT"Graphiques, equations, et schemas":PRINT"dignes d'un laboratoire futuriste."
920 PEN 2:PRINT:PRINT"Ca parle de courbure temporelle, de":PRINT"distorsion spatiale et, au detour d'une":PRINT"note, quelqu'un a griffonne :"
930 PEN 1:PRINT:PRINT"      ";CHR$(34);"Hypothese E.T. plausible";CHR$(34)
940 PEN 3:PRINT:PRINT"Vous avez l'impression de lire a la":PRINT"fois un manuel scientifique et un":PRINT"script de film de science-fiction."
950 PEN 2:PRINT:PRINT"A ce stade, soit vous etes tombe sur":PRINT"un genie incompris, soit sur un alien":PRINT"qui preparait un PowerPoint."
960 PEN 3:PRINT:PRINT"Continuez, parce que, franchement,":PRINT"qui pourrait resister ?"
980 LOCATE 15,25:INPUT" ENTER  ",en$
990 POKE &7003,3:GOTO 60
1000 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1010 PEN 3:PRINT"La derniere page de ce livre est un":PRINT"lexique."
1020 PEN 1:PRINT:PRINT"Oui, un dictionnaire, mais pas":PRINT"n'importe lequel :"
1030 PEN 2:PRINT:PRINT"Il relie des hieroglyphes classiques a":PRINT"d'autres symboles totalement inconnus":PRINT"jusqu'ici."
1040 PEN 3:PRINT:PRINT"Felicitations, vous venez d'agrandir":PRINT"votre vocabulaire d'aventurier !":PRINT:PRINT"Desormais, vous comprenez des signes":PRINT"que meme les egyptologues n'oseraient":PRINT"pas prononcer."
1050 PEN 2:PRINT:PRINT"Certains glyphes sont si etranges":PRINT"qu'on dirait des emoticones inventes":PRINT"par un pharaon branche."
1060 PEN 1:PRINT:PRINT"Une chose est sure : vous n'oublierez":PRINT"jamais ces nouveaux mots."
1070 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1080 POKE &7003,4:GOTO 60 

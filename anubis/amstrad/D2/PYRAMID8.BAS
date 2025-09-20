10 ' PYRAMID8
20 MODE 1:BORDER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Pyramid8.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Une salle":PRINT #1,"silencieuse":PRINT #1,"ou un mur":PRINT #1,"de symboles":PRINT #1,"ancestraux"
130 PRINT #1,"veille":PRINT #1,"sous le":PRINT #1,"regard":PRINT #1,"impassible":PRINT #1,"d'un":PRINT #1,"pharaon":PRINT #1,"de pierre."           
140 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
150 PEN 3:LOCATE 4,21:PRINT "1-OUEST  2-Examiner  3-Fouiller"
160 PEN 2:LOCATE 4,22:PRINT "4-S'assoir sur la statue"
170 PEN 3:LOCATE 4,23:PRINT "5-Deplacer la statue"
180 PEN 2:LOCATE 4,24:PRINT "6-Dechiffrer les hieroglyphes"
200 k$=INKEY$
210 IF k$="1"THEN RUN"Pyramid7.bas"
220 IF k$="2"THEN GOTO 300
230 IF k$="3"THEN GOTO 400
240 IF k$="4"THEN GOTO 500
250 IF k$="5"THEN GOTO 600
260 IF k$="6" AND PEEK(&7003)<4 THEN GOTO 700
270 IF k$="6" AND PEEK(&7003)=4 THEN GOTO 800
280 IF k$<"1"OR k$>"6" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Vous scrutez la piece avec la meme":PRINT"intensite qu'un client cherchant le":PRINT"Wi-Fi gratuit dans un cafe desert..."
320 PEN 2:PRINT:PRINT"Devant vous, un mur couvert de":PRINT"hieroglyphes qui semblent raconter des":PRINT"histoires toutes plus tordues les":PRINT"unes que les autres."
330 PEN 3:PRINT:PRINT"A droite, une imposante statue de":PRINT"pharaon, assis avec un air solennel."
340 PRINT"Comme pour vous juger de votre curiosite":LOCATE 1,14:PRINT"maladive."
350 PEN 2:PRINT:PRINT"On pourrait presque entendre ses":PRINT"pensees :"
360 PEN 1:PRINT:PRINT "  ";CHR$(34);"Encore un qui va tout toucher...";CHR$(34)
370 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
380 GOTO 60 
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT:PRINT"Vous grattez, vous tatez, et reniflez":PRINT"meme un peu le mur..."
420 PEN 2:PRINT:PRINT"Vous cherchez partout, comme si la":PRINT"statue allait subitement vous filer un":PRINT"indice avec un petit post-it."
430 PEN 1:PRINT:PRINT"             Mais rien."
440 PEN 3:PRINT:PRINT"Si ce n'est une bonne couche de":PRINT"poussiere sur vos mains et":PRINT"l'impression de passer pour un":PRINT"fetichiste du mobilier antique."
450 PEN 2:PRINT:PRINT"Ha si ! Vous remarquez qu'un courant":PRINT"d'air frais, a lodeur noseabonde,":PRINT"s'echappe de sous la statue."
460 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
470 GOTO 60       
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT:PRINT"Vous escaladez la statue du pharaon":PRINT"et vous vous installez royalement sur":PRINT"ses genoux, tel un enfant qui attend":PRINT"son cadeau de Noel..."
520 PEN 2:PRINT:PRINT"Sauf que ce pharaon-la n'a pas l'air":PRINT"tres genereux."
530 PEN 1:PRINT:PRINT"           Rien ne se passe."
540 PEN 3:PRINT:PRINT"Pas de porte secrete, pas de musique":PRINT"mystique. Juste vous, assis comme un":PRINT"couillon sur une relique millenaire."
550 PEN 2:PRINT:PRINT"Avec ca, l'egyptologie va avancer a":PRINT"grands pas, c'est certain..."
560 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
570 GOTO 60
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
610 PEN 3:PRINT"Vous decalez la statue pour jeter un":PRINT"oeil derriere..."
620 PEN 2:PRINT:PRINT"Elle est incroyablement legere...":PRINT"Trop legere pour etre honnete."
630 PEN 1:PRINT:PRINT"         Et quelle surprise !"
640 PEN 3:PRINT:PRINT"Un vide abyssal vous attendait, bien":PRINT"planque."
650 PEN 2:PRINT:PRINT"Pas le temps de dire ";CHR$(34);"pyramide";CHR$(34);" que vous":LOCATE 1,13:PRINT"basculez dans le trou comme une figue":PRINT"trop mure."
660 PEN 3:PRINT:PRINT"Une seconde plus tard, vous imitez":PRINT"la feuille morte en chute libre."
670 PEN 1:PRINT:PRINT"Petit vent frais sur les joues,":PRINT"darkness, puis...SPLAT ! Game over."
680 PEN 2:PRINT:PRINT"Au moins, vous savez maintenant que":PRINT"derriere, c'etait pas du vide decoratif."
690 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
695 RUN"Mort.bas"
700 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:PRINT"Vous fixez les hieroglyphes avec la":PRINT"confiance d'un expert."
720 PEN 2:PRINT:PRINT"Jusqu'a tomber sur un symbole qui":PRINT"ressemble vaguement a un vaisseau...":PEN 3:PRINT"           ...SPATIAL !!!"
730 PEN 1:PRINT:PRINT"Heu... attendez, c'etait dans aucun":PRINT"manuel, ca !"
740 PEN 3:PRINT:PRINT"Vous essayez encore, mais non, rien":PRINT"a faire : ces gravures sont aussi":PRINT"comprehensibles qu'un ticket de caisse":PRINT"ecrit en klingon..."
750 PEN 2:PRINT:PRINT"Peut-etre qu'un petit complement de":PRINT"vocabulaire ne ferait pas de mal..."
760 PEN 1:PRINT:PRINT"Genre, un bon vieux manuel du":PRINT"hieroglyphe version 2.0"
770 PEN 3:PRINT:PRINT"Revenez donc tenter votre chance une":PRINT"fois votre lexique muscle."
780 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
790 GOTO 60
800 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT"Fort de vos nouvelles connaissances":PRINT"fraichement acquises en hieroglyphes":PRINT"exotiques grace au manuel trouve dans":PRINT"la pyramide, vous sentez que ce mur":PRINT"n'a plus aucun secret pour vous."
820 PEN 2:PRINT:PRINT"Il est temps de lever le voile sur":PRINT"son message !"
830 PEN 1:PRINT:PRINT"Ces symboles racontent une legende...":PRINT"Ancienne... TRES ancienne."
840 PEN 3:PRINT:PRINT"Genre, avant que le sable ne soit a":PRINT"la mode."
850 PEN 2:PRINT:PRINT"Il est question de Dieux puissants":PRINT"venus du ciel a bord d'un vaisseau":PRINT"mysterieux."
860 PEN 1:PRINT:PRINT"       Oui, oui, rien que ca !"
870 PEN 3:PRINT:PRINT"On est pile entre mythe egyptien et":PRINT"science-fiction discount."
880 LOCATE 15,25:INPUT" ENTER  ",en$
990 CLS
1000 PEN 3:LOCATE 1,11:PRINT"Vous decodez, symbole apres symbole,":PRINT"cette enigme millenaire."
1010 PEN 2:PRINT:PRINT"Leur secret finit par s'offrir a vous..."
1015 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1020 CLS:PEN 2:PRINT"Lorsque le Gardien au museau sombre":PRINT"descendit des cieux, le Roi des Hommes":PRINT"dressa quatre pyramides en son honneur."
1030 PEN 3:PRINT:PRINT"Dans sa main gauche, il fit reposer":PRINT"la terre du desert et la flamme du":PRINT"soleil :"
1040 PEN 2:PRINT:PRINT"   Une pyramide marron et une jaune"
1050 PEN 3:PRINT:PRINT"Dans sa main droite, il placa l'aube et":PRINT"le crepuscule cote a cote :"
1060 PEN 2:PRINT:PRINT"   Une pyramide jaune et une marron"
1070 PEN 3:PRINT:PRINT"Alors, le Seigneur des Ombres, en":PRINT"signe d'alliance, lui tendit en":PRINT"echange la pyramide de nuit, plus":PRINT"sombre que les profondeurs du desert,":PRINT"plus noire que la mort elle-meme."
1080 PEN 1:PRINT:PRINT"Vous savez quoi ? Si j'etais un indice,":PRINT"c'est ici que je me planquerais !"
1085 LOCATE 9,5:PEN 2:PRINT"main gauche":LOCATE 9,11:PRINT"main droite":LOCATE 6,20:PRINT"noire"
1090 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1100 GOTO 60

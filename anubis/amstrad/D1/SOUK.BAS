10 ' SOUK
20 MODE 1:BORDER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Souk.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Le souk :":PRINT #1:PRINT #1,"Un dedale":PRINT #1,"bruissant":PRINT #1,"d'epices":PRINT #1,"et de voix."
125 PRINT #1:PRINT #1,"La chaleur":PRINT #1,"y danse":PRINT #1,"entre ombre":PRINT #1,"et":PRINT #1,"poussiere":PRINT #1,"doree."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3:LOCATE 4,21:PRINT "1-Retourner au Caire    2-Examiner"
150 PEN 2:LOCATE 4,22:PRINT "3-Parler au marchand"
160 PEN 3:LOCATE 4,23:PRINT "4-Traverser le souk par le NORD"
170 PEN 2:LOCATE 4,24:PRINT "5-Gouter les epices     6-Chanter"
200 k$=INKEY$
210 IF k$="1"THEN RUN"Caire.bas"
220 IF k$="2"THEN GOTO 300
230 IF k$="3" AND PEEK(&7000)=0 THEN GOTO 700
240 IF k$="3" AND PEEK(&7000)=1 THEN GOTO 800
250 IF k$="3" AND PEEK(&7000)=2 THEN GOTO 900
260 IF k$="3" AND PEEK(&7000)=3 THEN GOTO 1000
270 IF k$="3" AND PEEK(&7000)=4 THEN GOTO 1100
280 IF k$="3" AND PEEK(&7000)=5 THEN GOTO 1300
290 IF k$="4"THEN GOTO 400
292 IF k$="5"THEN GOTO 500
294 IF k$="6"THEN GOTO 600
296 IF k$<"1"OR k$>"6" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Le Souk et ses marchands hauts en":PRINT"couleur qui essayent de vous vendre":PRINT"jusqu'a votre ombre..."
320 PEN 2:PRINT:PRINT"Entre tapis volants douteux et epices":PRINT"qui font eternuer, vous realisez que":PRINT"votre nez va finir par parler toutes":PRINT"les langues du marche si ca continue."
330 PEN 1:PRINT:PRINT"Vous remarquez ce vendeur de poteries":PRINT"qui vous fixe comme si vous etiez":PRINT"un vase rare."
340 PEN 3:PRINT:PRINT"Avec un peu de chance, il a en stock":PRINT"le dernier mug ";CHR$(34);"Made in Taiwan";CHR$(34)
350 LOCATE 17,16:PEN 2:PRINT"Made in Taiwan":PEN 3:PRINT"ultra tendance !"
360 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
370 GOTO 60
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT:PRINT"Vous tentez de filer vers le nord..."
420 PEN 1:PRINT:PRINT"Mais la foule a decide de former un mur":PRINT"humain digne d'un festival de rock."
430 PEN 2:PRINT:PRINT"Entre les bras qui s'agitent, les sacs":PRINT"qui volent et les vendeurs qui":PRINT"negocient avec vous comme si vous"
440 PRINT"etiez un tapis rare, il devient":PRINT"clair que traverser le souk par ici":PRINT"est aussi simple que de danser le":PRINT"tango dans un ascenseur plein."
450 PEN 3:PRINT:PRINT"Vous vous resignez a rebrousser":PRINT"chemin, la dignite un peu froissee":PRINT"mais intacte."
460 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
470 GOTO 60          
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT:PRINT"Vous plongez votre nez... et votre":PRINT"langue, dans un melange d'epices":PRINT"si puissant que votre bouche se":PRINT"met a faire des pirouettes dignes":PRINT"d'un cirque."
520 PEN 1:PRINT:PRINT"Vos papilles reclament un traite":PRINT"de paix, votre estomac menace de":PRINT"se declarer independant, tandis qu'un":PRINT"marchand voisin vous propose":PRINT"immediatement un antidote au":PRINT"gout douteux."
530 PEN 2:PRINT:PRINT"Vous commencez a vous demander si":PRINT"vous avez vraiment envie de gouter":PRINT"le paprika ou juste de survivre..."
540 PEN 3:PRINT:PRINT"Fini les epices !":PRINT"Votre intestin est plus taille pour le":PRINT"yaourt et son bifidus actif !"
550 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
560 GOTO 60           
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
610 PEN 3:PRINT:PRINT"Vous entamez votre chanson triomphale,":PRINT"quand une olive abimee, jetee par":PRINT CHR$(34);"inadvertance";CHR$(34);" par une acheteuse,":PRINT"plonge directement dans votre gorge."
620 PEN 1:PRINT:PRINT"Vos notes s'interrompent brusquement,":PRINT"vos yeux s'ecarquillent, et la foule":PRINT"continue son commerce comme si de rien":PRINT"n'etait."
630 PEN 2:PRINT:PRINT"Morale du jour :":PRINT:PRINT"Chanter au souk peut vraiment vous":PRINT"couter la peau !"
640 PEN 1:PRINT:PRINT:PRINT"           Fin du voyage..."
650 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
660 RUN"Mort.bas"          
700 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Bienvenue, etranger !":PRINT:PRINT"Ici, les poteries sont aussi vieilles":PRINT"que ma grand-mere...":PRINT:PRINT"     ...et sentent a peu pres pareil."
720 PEN 1:PRINT:PRINT"Vous:":PEN 3:PRINT:PRINT"Oh... euh...":PRINT"je suis juste la pour flaner...":PRINT"et peut-etre eviter de casser quoi":PRINT"que ce soit."
730 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Alors vous etes deja meilleur client":PRINT"que le dernier touriste !"
740 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
750 POKE &7000,1:GOTO 60
800 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Regardez cette jarre de lait !":PRINT:PRINT"Elle a survecu a trois tempetes de":PRINT"sable et a deux belles-meres.":PRINT:PRINT"Une affaire en or !"
820 PEN 3:LOCATE 1,12:INPUT"  Souhaitez-vous l'acheter (O/N) ";A$
830 IF UPPER$(A$)="O" THEN D=2:GOTO 890
840 IF UPPER$(A$)="N" THEN GOTO 860
850 IF UPPER$(A$)<>"O" OR UPPER$(A$)<>"N" THEN GOTO 820
860 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Ah... je vois que vous hesitez...":PRINT:PRINT"Pourtant, c'est la jarre ideale pour":PRINT"stocker le lait dont raffolent les":PRINT"chats en Egypte.":PRINT:PRINT "   Tant pis !"
870 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
880 GOTO 60
890 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Parfait !":PRINT:PRINT"Vous venez d'acheter un morceau":PRINT"d'histoire... ou au moins un":PRINT"morceau de terre cuite rempli de lait."
895 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
897 POKE &7000,2:GOTO 60
900 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
910 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"J'aime les clients qui ne se sauvent":PRINT"pas apres un achat.":PRINT:PRINT"Vous, je vous sens... curieux.
920 PEN 1:PRINT:PRINT"Vous:":PEN 3:PRINT:PRINT"Curieux, oui... mais pas au point":PRINT"de gouter vos epices suspectes !"
930 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Dommage, c'est gratuit...":PRINT"et legerement hallucinogene."
940 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
950 POKE &7000,3:GOTO 60
1000 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1010 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Vous savez...":PRINT"derriere mes poteries, je vends":PRINT"aussi... d'autres choses."
1020 PEN 1:PRINT:PRINT"Vous:":PEN 3:PRINT:PRINT"Des t-shirts ";CHR$(34);"I Love Qattara";CHR$(34);" ?"
1030 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Plus rare... plus ancien...":PRINT"et plus interdit."
1040 PEN 1:PRINT:PRINT"Vous:":PEN 3:PRINT:PRINT"Ah... comme mes photos de vacances":PRINT "en maillot de bain ?"
1050 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
1060 POKE &7000,4:GOTO 60
1100 IF PEEK(&7001)=0 THEN GOTO 1120
1110 IF PEEK(&7001)=1 THEN GOTO 1200
1120 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1130 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"J'ai trouve dans le desert 3 petites":PRINT"sculptures en forme de scarabees.":PRINT"Jaune, Orange, Marron..."
1140 PEN 1:PRINT:PRINT"Vous:":PEN 3:PRINT:PRINT"Parfait, j'aime beaucoup les objets":PRINT"qu'on n'ose pas poser sur la table":PRINT"du salon."
1150 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"On raconte qu'ils ouvrent des portes":PRINT"que nous n'etes pas pret a franchir."
1160 PEN 1:PRINT:PRINT"Vous:":PEN 3:PRINT:PRINT"Comme celle des WC de ma tante !"
1170 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
1180 CLS:PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Mais je ne les cederai pas contre":PRINT"de l'or, ni contre toutes les":PRINT"poteries du souk !"
1190 PRINT:PRINT"Non... Il me faut mon tresor perdu :":PRINT"Un minuscule fragment de papyrus que":PRINT"j'ai egare dans le desert."
1194 PRINT:PRINT"Ramene-le moi et ces 3 scarabees":PRINT"seront tiens...":PRINT:PRINT"Mais attention, si tu tardes trop,":PRINT"je risque de les echanger contre":PRINT"une brochette de falafels !"
1196 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
1198 GOTO 60
1200 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1210 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Par les moustaches d'Anubis !!!":PRINT:PRINT"Vous avez trouve mon Papyrus.":PRINT"Celui que j'avais perdu dans le":PRINT"desert lors d'une tempete de sable !"
1220 PRINT:PRINT"On se moquait de moi parce qu'il":PRINT"est minuscule, mais il contient un":PRINT"hieroglyphe secret..."
1230 PRINT:PRINT"A moins que ce ne soit une tache de":PRINT"the, je ne sais plus."
1240 PRINT:PRINT"Quoi qu'il en soit, je vous l'echange":PRINT"contre mes trois scarabees, etranger !"
1250 PEN 1:PRINT:PRINT"Vous:":PEN 3:PRINT:PRINT"Affaire conclue !"
1260 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1270 POKE &7000,5:GOTO 60
1300 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1310 PEN 1:PRINT:PRINT"Le marchand :":PEN 2:PRINT:PRINT"Ah, vous voila encore !"
1320 PRINT:PRINT"Vous voulez vraiment vider ma boutique,":PRINT"hein ?":PRINT:PRINT"Tout est vendu, il ne me reste que":PRINT"ma chevre, Sekhmeeeet...":PRINT:PRINT"Mais son lait est si puissant qu'on":PRINT"pourrait ressusciter une momie !"
1330 PRINT"Impossible de m'en separer."
1340 PRINT:PRINT"Revenez demain...":PRINT:PRINT"             ...ou dans un siecle !"
1350 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
1360 GOTO 60

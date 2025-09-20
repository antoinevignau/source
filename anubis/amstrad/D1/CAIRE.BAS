10 ' CAIRE
20 MODE 1:BORDER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Caire.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Le Caire.":PRINT #1:PRINT #1,"Aujourd'hui":PRINT #1,"ses rues":PRINT #1,"d'ordinaire":PRINT #1,"vivantes et":PRINT #1,"bruyantes":PRINT #1,"reposent":PRINT #1,"dans un":PRINT #1,"silence":PRINT #1,"inattendu."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3:LOCATE 4,21:PRINT "1-Se rendre a Qattara en voiture"
150 PEN 2:LOCATE 4,22:PRINT "2-Examiner     3-Chercher un chat" 
160 PEN 3:LOCATE 4,23:PRINT "4-Entrer dans la voiture    5-NORD"
170 PEN 2:LOCATE 4,24:PRINT "6-Parler a la femme assise  7-EST"
200 k$=INKEY$
210 IF k$="1" AND PEEK(&7003)=0 THEN GOTO 300
220 IF k$="1" AND PEEK(&7003)=1 THEN GOTO 400
230 IF k$="2" THEN GOTO 500
240 IF k$="3" THEN GOTO 600
250 IF k$="4" AND PEEK(&7003)=0 THEN GOTO 700
260 IF k$="4" AND PEEK(&7003)=1 THEN GOTO 800
265 IF k$="5" THEN RUN"Chat.bas"
270 IF k$="6" AND PEEK(&7002)=0 THEN GOTO 900
280 IF k$="6" AND PEEK(&7002)=1 THEN GOTO 1000
285 IF k$="7" THEN RUN"Souk.bas"
290 IF k$<"1"OR k$>"7" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Vous vous tenez devant la vieille":PRINT"voiture, admirant ses lignes...":PRINT"Enfin, ce qu'il en reste."
320 PEN 2:PRINT:PRINT"Helas, sans la clef, elle reste":PRINT"aussi inerte qu'une momie endormie":PRINT"depuis trois mille ans."
330 PEN 3:PRINT:PRINT"Vous avez beau la contempler,":PRINT"la caresser ou lui murmurer des":PRINT"encouragements, rien n'y fait :"
340 PEN 1:PRINT:PRINT"Pour l'instant, elle ne vous menera":PRINT"nulle part."
350 PEN 2:PRINT:PRINT"Il va falloir trouver cette fameuse":PRINT"clef avant de pouvoir filer en":PRINT"direction du desert de Qattara.":LOCATE 24,19:PEN 3:PRINT"Qattara"
360 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
370 GOTO 60
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT:PRINT"Clef en main, vous mettez le":PRINT"contact..."
420 PEN 1:PRINT:PRINT"le moteur tousse,":PRINT"la vieille voiture grogne comme un":PRINT"sphinx en colere, avant de filer":PRINT"vers le desert de Qattara !":LOCATE 19,8:PEN 3:PRINT"Qattara"
430 PEN 2:PRINT:PRINT"Vous priez pour qu'aucun chameau ne":PRINT"traverse la route en chemin tant":PRINT"les freins semblent plus symboliques":PRINT"qu'efficaces..."
440 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
450 RUN"Desert1.bas"
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT:PRINT"Le Caire s'etire devant vous,":PRINT"calme aujourd'hui, comme un chat":PRINT"qui fait la sieste."
520 PEN 1:PRINT:PRINT"A gauche, une vieille voiture repose,":PRINT"poussiereuse et fiere de son":PRINT"immobilite, comme un crocodile ":PRINT"endormi au soleil."
530 PEN 2:PRINT:PRINT"A droite, une femme est assise":PRINT"sur le trottoir, l'air contrarie,":PRINT"tricotant des pensees plus emmelees":PRINT"que sa pelote de laine."
540 PEN 3:PRINT:PRINT"Autour, la rue est tranquille,":PRINT"seulement ponctuee du clapotis des":PRINT"fontaines et du froissement des robes":PRINT"des passants."
550 PEN 2:PRINT:PRINT"De temps en temps, un miaulement":PRINT"lointain vient troubler ce calme."
560 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
570 GOTO 60
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
610 PEN 3:PRINT:PRINT"Vous scrutez chaque recoin, esperant":PRINT"voir un chat surgir..."
620 PEN 1:PRINT:PRINT"Mais rien."
630 PEN 2:PRINT:PRINT"A ce rythme, meme une poule en greve":PRINT"vous aurait echappe !"
640 PEN 3:PRINT:PRINT"Le chat doit se bidonner quelque part,":PRINT"en notant dans son journal secret :"
650 PEN 2:PRINT:PRINT "   ";CHR$(34);"Comment humilier un aventurier":PRINT"        sans lever la patte.";CHR$(34)
660 PEN 1:PRINT:PRINT"Franchement, vous commencez a croire":PRINT"que cet animal n'existe pas."
670 PEN 2:PRINT:PRINT"... Enfin, pas ici en tout cas."
680 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
690 GOTO 60
700 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:PRINT"Sans clef pour l'ouvrir, vous tentez":PRINT"de crocheter la portiere."
720 PEN 1:PRINT:PRINT"Et la, paf !"
730 PEN 2:PRINT:PRINT"Une sirene hurle, des lampes":PRINT"clignotent et un policier surgit comme":PRINT"un scarabee furieux !"
740 PEN 3:PRINT:PRINT"Vous tentez d'expliquer que vous n'etes":PRINT"pas un voleur, juste un aventurier":PRINT"presse, mais le policier ne veut":PRINT"rien entendre."
750 PEN 2:PRINT:PRINT"Quelques heures plus tard...":PRINT"enfin, plusieurs siecles plus tard":PRINT"selon le calendrier egyptien,":PRINT"vous comprenez :"
760 PEN 1:PRINT"Votre proces a ete oublie.":PRINT"Le juge est parti en retraite,":PRINT"le greffier s'est perdu dans le souk":PRINT"et vous, vous restez en prison pour":PRINT"l'eternite..."
770 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
780 RUN"Mort.bas"
800 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT:PRINT"Clef en main, vous ouvrez la portiere.":PEN 1:PRINT:PRINT"         Miracle, ca clique !"
820 PEN 2:PRINT:PRINT"Vous avez reussi !":PRINT"Oui, vous avez vraiment reussi a ouvrir":PRINT"une voiture..."
830 PEN 3:PRINT:PRINT"Et pas n'importe laquelle :":PRINT"Une relique capable de survivre a":PRINT"des siecles de poussiere et de sable !"
840 PEN 1:PRINT:PRINT"Faites attention, heros du jour :":PEN 2:PRINT:PRINT"Vous tenez entre vos mains le volant":PRINT"du destin.":PRINT:PRINT"Ou du moins, le levier de vitesses":PRINT"d'un antique tas de metal pres a":PRINT"rugir... ou a tousser."
850 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
860 GOTO 60
900 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
910 PEN 1:PRINT:PRINT"La vielle femme :":PEN 2:PRINT:PRINT"Toi !":PRINT:PRINT"Oui, toi avec ta tete d'aventurier":PRINT"fatigue.":PRINT:PRINT"Tu ne pourrais pas m'aider ?"
920 PRINT:PRINT"Ce demon a moustaches, ce voleur poilu,":PRINT"ce... chat, m'a chipe ma pelote de":PRINT"laine !"
930 PRINT:PRINT"Ramene-la-moi et en echange, je te":PRINT"filerai une clef que j'ai trouvee":PRINT"par terre."
940 PRINT:PRINT"Ca semble ouvrir une voiture... ou un":PRINT"sarcophage moderne, je ne sais pas."
950 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
960 GOTO 60
1000 IF PEEK(&7003)=0 THEN GOTO 1100
1010 IF PEEK(&7003)=1 THEN GOTO 1200
1100 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1110 PEN 1:PRINT:PRINT"La vielle femme :":PEN 2:PRINT:PRINT CHR$(34);"Ma pelote ! Tu l'as retrouvee !":PRINT:PRINT"Ce satane chat me l'avait bien vole !"
1115 PRINT:PRINT"Merci, etranger. Sans elle, j'etais":PRINT"obligee de tricoter du sable...":PRINT"et crois-moi, ca gratte !"
1120 PRINT:PRINT"Tiens, prends cette clef.":PRINT"Je n'ai pas de voiture...":PRINT"et je doute qu'une chevre demarre":PRINT"avec ca !";CHR$(34):LOCATE 21,12:PEN 3:PRINT"clef"
1130 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
1140 POKE &7003,1:GOTO 60
1200 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1210 PEN 1:PRINT:PRINT"La vielle femme vous regarde, les yeux":PRINT"plisses, la pelote a nouveau entre":PRINT"les mains :"
1220 PEN 2:PRINT:PRINT CHR$(34);"Eh ben dis donc, vous revenez encore ?":PRINT:PRINT"J'ai plus rien pour vous !":PRINT:PRINT"Allez, ouste !":PRINT:PRINT"Maintenant laissez-moi tricoter en":PRINT"paix !";CHR$(34)
1230 PEN 3:PRINT:PRINT:PRINT"Charmante..."
1240 LOCATE 15,24:INPUT" ENTER  ",en$
1250 GOTO 60

10 ' BUREAU
20 MODE 1:BORDER 0:T=0:L=0
25 POKE &7000,0:POKE &7001,0:POKE &7002,0:POKE &7003,0:POKE &7004,0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Bureau.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,35,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Vous etes":PRINT #1,"dans votre":PRINT #1,"petit":PRINT #1,"bureau...":PRINT #1:PRINT #1:PRINT #1,"L'odeur":PRINT #1,"du papier":PRINT #1,"ancien":PRINT #1,"y est":PRINT #1,"familiere."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3: LOCATE 4,21:PRINT "1-Examiner        2-Lire la lettre"
150 PEN 2:LOCATE 4,22:PRINT "3-Parcourir la carte"
160 PEN 3:LOCATE 4,23:PRINT "4-Ouvrir le tiroir"
170 PEN 2:LOCATE 4,24:PRINT "5-Fouiller la bibliotheque"
200 k$=INKEY$
210 IF k$="1"THEN GOTO 300
220 IF k$="2" AND T=0 THEN GOTO 400
230 IF k$="2" AND T=1 THEN GOTO 500
240 IF k$="3"THEN GOTO 1000
250 IF k$="4"THEN GOTO 1100
260 IF k$="5"THEN GOTO 1200
270 IF k$<"1"OR k$>"5" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT"Vous etes dans votre bureau, ou la ":PRINT"lumiere hesite a entrer depuis 1947."
320 PEN 2:PRINT:PRINT"Une bibliotheque croulante,":PRINT"garnie de livres fatigues,":PRINT"semble attendre qu'on l'acheve..."
330 PEN 1:PRINT:PRINT"Une vieille carte de l'Egypte trone au":PRINT"mur, comme pour rappeler que depuis":PRINT"quelques temps,vous ne voyagez plus":PRINT"que par procuration..."
340 PEN 3:PRINT:PRINT"La poussiere y est si presente,":PRINT"qu'elle pourrait reclamer un salaire."
350 PEN 2:PRINT:PRINT"Sur le bureau, une lettre toute propre":PRINT"detonne dans ce decor mortuaire...":PRINT:PRINT"Probablement une erreur de casting."
360 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
370 GOTO 60
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT"Vous depliez la lettre avec la":PRINT"solennite d'un homme qui espere":PRINT"un cheque..."
420 PEN 2:PRINT:PRINT"           ...et obtenez un code.":PEN 1:LOCATE 29,5:PRINT"code"
430 PEN 3:LOCATE 1,7:PRINT"Comme a son habitude, votre mecene vous":PRINT"indique la destination de votre":PRINT"prochaine expedition."
440 PEN 2:PRINT:PRINT"Sauf que cette fois, il a juge bon":PRINT"de la chiffrer comme si vous etiez":PRINT"en guerre."
450 PEN 3:PRINT:PRINT"Le nom du lieu ?"
460 PEN 1:PRINT:PRINT"               JZGGZIZ"
470 PEN 2:PRINT"Charmant...":PEN 1:PRINT:PRINT"      Pourquoi tout ce cinema ?":PEN 3:PRINT:PRINT"Qu'est-ce qui pouvait bien l'effrayer":PRINT"au point de chiffrer un simple nom de":PRINT "lieu ?"
480 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
490 L=1:GOTO 60
500 IF L=1 THEN GOTO 800
510 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
520 PEN 3:PRINT"Vous lisez la lettre avec attention."
530 PEN 2:PRINT:PRINT"Comme a son habitude, votre mecene vous":PRINT"indique la destination de votre":PRINT"prochaine expedition par voie postale."
540 PEN 3:PRINT:PRINT"D'ordinaire, il se contente de":PRINT"griffonner le nom du prochain coin":PRINT"paume ou vous envoyer."
550 PEN 1:PRINT:PRINT"Mais la, il a sorti l'artillerie":PRINT"cryptographique, comme si vous deviez":PRINT"infiltrer Berlin en 1943."
560 PEN 3:PRINT:PRINT"Le nom du lieu ?"
570 PEN 1:PRINT:PRINT"               JZGGZIZ"
580 PEN 2:PRINT:PRINT"Ca sonne comme l'eternuement d'un":PRINT"pharaon enrhume..."
590 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
600 CLS:PEN 3:LOCATE 1,6:PRINT"Ce mot etrange, JZGGZIZ, vous titille":PRINT"l'esprit comme un moustique en":PRINT"plein desert.":LOCATE 17,6:PEN 1:PRINT"JZGGZIZ"
610 PEN 2:LOCATE 1,10:PRINT"Vous sentez que la solution est a":PRINT"portee de reflexion, quelque part":PRINT"entre intuition et coup de chance."
620 PEN 1:LOCATE 3,17:PRINT"Souhaitez-vous tenter de dechiffrer"
630 LOCATE 12,18:INPUT"ce mot (O/N) ";d$
640 IF UPPER$(d$)="N" THEN GOTO 60
650 IF UPPER$(d$)="O" THEN GOTO 700
660 GOTO 620
700 CLS:PEN 3:LOCATE 1,1:INPUT"Quel est le mot decode ";Nom$
710 IF UPPER$(Nom$)<>"QATTARA" THEN GOTO 900
720 PEN 1:PRINT:PRINT"Bravo, Sherlock !":PRINT"Vous avez perce le mystere !"
730 PEN 2:PRINT:PRINT"Le mot QATTARA brille maintenant comme":PRINT"un phare dans la nuit.
740 PEN 3:PRINT:PRINT"Il est temps de troquer votre chaise":PRINT"miteuse contre une aventure bien":PRINT"plus epique."
750 PEN 1: PRINT:PRINT"Preparez votre chapeau, vos bottes,":PRINT"et un bon stock de creme solaire,":PRINT"parce que vous quittez votre taniere":PRINT"de loser."
760 PEN 2:PRINT:PRINT"En route pour QATTARA !":PEN 3:LOCATE 15,18:PRINT"QATTARA"
770 PEN 3:PRINT:PRINT"Ha, au fait... En reposant la lettre,":PRINT"vous lisez le mot ";CHR$(34);" SOON ";CHR$(34);" au dos.":LOCATE 21,21:PEN 1:PRINT"SOON"
780 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
790 RUN"Caire.bas"
800 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT"Vous relisez la lettre, cette fois avec":PRINT"une attention renouvelee."
820 PEN 2:PRINT:PRINT "Ce mot etrange, JZGGZIZ, vous titille":PRINT"l'esprit comme un moustique en plein":PRINT"desert.":PEN 1:LOCATE 17,4:PRINT"JZGGZIZ"
830 PEN 3:LOCATE 1,8:PRINT"Vous sentez que la solution est a":PRINT"portee de reflexion, quelque part":PRINT"entre intuition et coup de chance."
840 PEN 1:LOCATE 3,17:PRINT"Souhaitez-vous tenter de dechiffrer"
850 LOCATE 12,18:INPUT"ce mot (O/N) ";d$
860 IF UPPER$(d$)="N" THEN GOTO 60
870 IF UPPER$(d$)="O" THEN GOTO 700
880 GOTO 850
900 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
910 PEN 3:PRINT"Ah non, ce n'est pas ca !"
920 PEN 2:PRINT:PRINT"A moins que vous ne tentiez un":PRINT"nouveau dialecte egyptien tres":PRINT"avant-gardiste, ca ne colle pas..."
930 PEN 1:PRINT:PRINT"Peut-etre qu'un livre saura faire":PRINT"travailler vos deux neurones."
940 PEN 2:PRINT:PRINT"Ou simplement apprendre l'alphabet":PRINT"avant de jouer au detective..."
950 PEN 3:LOCATE 4,15:INPUT"Voulez-vous reessayer (O/N) ?",d$
960 IF UPPER$(d$)="N" THEN GOTO 60
970 IF UPPER$(d$)="O" THEN GOTO 700
980 GOTO 950
1000 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1010 PEN 3:PRINT"La carte represente l'Egypte dans":PRINT"toute sa splendeur :"
1020 PEN 2:PRINT"du Nil majestueux, aux pyramides":PRINT"pointues comme des critiques de these."
1030 PEN 1:PRINT:PRINT"A un endroit precis, le nom d'un":PRINT"lieu a ete soigneusement gratte,":PRINT"comme si quelqu'un avait voulu empecher":PRINT"un touriste de s'y rendre."
1040 PEN 3:PRINT:PRINT"Il ne reste qu'une lettre : ";"un ";CHR$(34)"Q";CHR$(34):PRINT"Cela evoque un lieu...":PEN 1:LOCATE 33,11:PRINT"Q"
1050 PEN 2:LOCATE 1,14:PRINT"En bas de la carte, une note":PRINT"manuscrite raturee indique :"
1060 PEN 1:PRINT:PRINT CHR$(34);"Les techniques militaires de Cesar":PRINT"n'ont jamais ete fructueuses en Egypte":PRINT"NE PAS LES UTILISER !";CHR$(34)
1070 PEN 2:PRINT:PRINT"Il faut croire que meme les generaux":PRINT"romains ont leurs jours sans."
1080 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1090 GOTO 60
1100 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1110 PEN 3:PRINT"Vous ouvrez le tiroir du bureau,":PRINT"esperant y trouver un indice mysterieux."
1120 PEN 1:PRINT"A la place, c'est une veritable boite":PRINT"a bazar intergalactique :"
1130 PEN 2:PRINT:PRINT"Une cuillere en plastique douteuse,":PRINT"une collection de cailloux tries par":PRINT"taille et couleur, un vieux poster":PRINT"de chat deguise en pharaon, et une":PRINT"ampoule grillee... sans douille."
1140 PEN 3:PRINT:PRINT"Oh, et une gomme en forme de banane,":PRINT"qui colle plus qu'elle n'efface..."
1150 PEN 1:PRINT:PRINT"Vous trouvez meme un mini scarabee":PRINT"en plastique qui clignote."
1160 PEN 2:PRINT:PRINT"Bref, vous repoussez delicatement":PRINT"le tiroir, sifflez, et priez pour que":PRINT"personne ne pose de questions."
1170 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1180 GOTO 60
1200 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1210 PEN 3:PRINT"Vous vous penchez sur la bibliotheque,":PRINT"esperant y denicher un secret":PRINT"ou au moins un marque-page oublie."
1220 PEN 1:PRINT:PRINT"Parmi les volumes poussiereux sur":PRINT"l'Egypte, 3 tomes tranchent etrangement"
1230 PRINT"car ils parlent tous de la guerre 39-45"
1240 PEN 3:PRINT:PRINT"- Premier tome :":PEN 2:PRINT"Les astuces de cryptage des messages.":PRINT"parce que, visiblement, decoder des":PRINT"messages, ca se maitrise."
1250 PEN 3:PRINT:PRINT"- Deuxieme tome :":PEN 2:PRINT"Les pieges inattendus de la guerre."
1260 PEN 3:PRINT:PRINT"- Troisieme tome :":PEN 2:PRINT"Les astuces de cryptage des":PRINT"deplacements des troupes."
1270 PEN 3:LOCATE 2,23:PRINT"Quel Tome voulez-vous lire (1/2/3/0) ?
1280 k$=INKEY$
1290 IF k$="1"THEN GOTO 1400
1300 IF k$="2"THEN GOTO 1500
1310 IF k$="3"THEN GOTO 1600
1320 IF k$="0"THEN MODE 1:GOTO 60
1330 IF k$<"0"OR k$>"3" THEN GOTO 1280
1400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24:T=1
1410 PEN 3:PRINT"Vous ouvrez le premier tome,":PRINT"pret a plonger dans les mysteres":PRINT"du cryptage militaire."
1420 PEN 2:PRINT:PRINT"A votre grande surprise,":PRINT"le livre detaille la fameuse technique":PRINT"de l'alphabet inverse."
1430 PEN 1:PRINT:PRINT"Oui, ce bon vieux A qui devient Z,":PRINT"B qui devient Y, et ainsi de suite..."
1440 PEN 3:PRINT:PRINT"Le tome explique aussi le fameux":PRINT"chiffre de Cesar.":PRINT"Une methode ou chaque lettre est":PRINT"decalee d'un certain nombre dans":PRINT "l'alphabet."
1450 PEN 1:PRINT:PRINT"Par exemple, avec un decalage de 3,":PRINT"A devient D, B devient E, etc..."
1460 PEN 3:LOCATE 2,23:PRINT"Quel Tome voulez-vous lire (1/2/3/0) ?
1470 GOTO 1280
1500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1510 PEN 3:PRINT"Vous ouvrez le deuxieme tome,":PRINT"pret a etudier les pieges de la":PRINT"guerre avec serieux."
1520 PEN 2:PRINT:PRINT"Mais a votre grande surprise,":PRINT"plusieurs pages ont ete arrachees et":PRINT"remplacees par des planches..":PRINT"d'une bande dessinee de Picsou !"
1530 PEN 3:PRINT:PRINT"Visiblement, quelqu'un a decide":PRINT"que la strategie militaire meritait":PRINT"une touche un peu plus pecuniaire":PRINT"et canardesque !"
1540 PEN 1:PRINT:PRINT"Pas sur que cette lecture vous aide":PRINT"a dejouer des pieges, mais au moins,":PRINT"vous avez droit a une pause detente":PRINT"inattendue."
1550 PEN 3:LOCATE 2,23:PRINT"Quel Tome voulez-vous lire (1/2/3/0) ?
1560 GOTO 1280
1600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1610 PEN 3:PRINT"Vous ouvrez le troisieme tome,":PRINT"plein d'espoir pour percer un secret":PRINT"militaire bien ficele."
1620 PEN 2:PRINT:PRINT"Il explique que les generaux":PRINT"codifiaient les dplacements des":PRINT"troupes en assemblant les initiales":PRINT"des points cardinaux :"
1630 PEN 1:PRINT:PRINT"S pour Sud, O pour Ouest,":PRINT"N pour Nord, E pour Est"
1640 PEN 3:PRINT"Et hop, un mot mysterieux naissait !"
1650 PEN 2:PRINT:PRINT"Par Exemple, le mot NES,":PRINT"qui pourrait evoquer une console,":PRINT"signifiait en realite Nord-Est-Sud !"
1660 PEN 1:PRINT:PRINT"Une technique aussi simple":PRINT"qu'ingnieuse, parfaite pour":PRINT"transmettre des ordres sans se faire":PRINT"griller par lennemi."
1670 PEN 3:LOCATE 2,23:PRINT"Quel Tome voulez-vous lire (1/2/3/0) ?
1680 GOTO 1280

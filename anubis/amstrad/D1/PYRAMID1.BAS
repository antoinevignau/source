10 ' PYRAMID1
20 MODE 1:BORDER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Pyramid1.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Une":PRINT #1,"pyramide":PRINT #1,"presque":PRINT #1,"engloutie":PRINT #1,"sous le"
125 PRINT #1,"sable,":PRINT #1,"dont":PRINT #1,"l'entree":PRINT #1,"scellee":PRINT #1,"garde":PRINT #1,"les":PRINT #1,"secrets..."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3:LOCATE 4,21:PRINT "1-NORD    2-SUD    3-OUEST   4-EST"
150 PEN 2:LOCATE 4,22:PRINT "5-Examiner la pyramide"
160 PEN 3:LOCATE 4,23:PRINT "6-Escalader la pyramide"
170 PEN 2:LOCATE 4,24:PRINT "7-Rouspeter  8-Uriner  9-Defequer"
200 k$=INKEY$
210 IF k$="1" OR k$="3" OR k$="4" THEN GOTO 300
220 IF k$="2"THEN RUN"Desert4.bas"
250 IF k$="5"THEN GOTO 600
260 IF k$="6"THEN GOTO 1100
265 IF k$="7"THEN GOTO 400
270 IF k$="8" AND PEEK(&7005)=0 THEN GOTO 1300
280 IF k$="8" AND PEEK(&7005)=1 THEN GOTO 1400
290 IF k$="9"THEN GOTO 500
295 IF k$<"1"OR k$>"9" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 1:PRINT:PRINT"Vous envisagez de quitter la pyramide ?"
320 PEN 2:PRINT:PRINT"Pas d'accord !!!":PRINT"Moi, je prefere rester ici, la ou se":PRINT"trouve le vrai scenario !"
330 PEN 3:PRINT:PRINT"TAREQ vous a envoye a Qattara pour ca,":PRINT"pas pour repertorier les dunes !"
340 PEN 2:PRINT:PRINT"A la limite, je veux bien retourner":PRINT"au SUD si vous pensez avoir oublie":PRINT"un truc.":PRINT:PEN 3:PRINT"On peut meme retourner au CAIRE":PRINT"si vous voulez..."
350 LOCATE 4,12:PEN 3:PRINT"SUD"
360 PEN 2:LOCATE 1,18:PRINT"Mais ailleurs ? Non merci !"
370 PEN 1:PRINT:PRINT"Non mais, c'est qui le chef ici ?!?"
380 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
390 GOTO 60
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT"Oh, ben alors, il est grognon notre":PRINT"egyptologue ?"
420 PEN 1:PRINT:PRINT"Il est pas content ?"
430 PEN 2:PRINT:PRINT"Il fait du boudin dans le desert ?":PEN 1:PRINT:PRINT"Il tape du pied, il fait sa moue ?"
440 PEN 3:PRINT:PRINT"C'est quoi le probleme ?":PRINT:PRINT"Trop de sable dans les sandales ?":PRINT:PRINT"Il galere dans son aventure ?"
450 PEN 2:PRINT:PRINT"Ou il aurait peut-etre prefere une":PRINT"croisiere sur le Nil avec buffet":PRINT"gratuit a volonte ?"
460 PEN 1:PRINT:PRINT"Allez, un bisou magique...":PRINT:PRINT"                ...et ca repart !"
470 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
480 GOTO 60
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 1:PRINT:PRINT"Heu... pardon ? Defequer ?"
520 PEN 3:PRINT:PRINT"Non mais ca va trop loin la, vous":PRINT"etes serieux ?"
530 PEN 2:PRINT:PRINT"Moi je suis narrateur, pas gardien de":PRINT"toilettes publiques !"
540 PEN 3:PRINT:PRINT"Je refuse de cautionner les delires":PRINT"malsains du programmeur !!!":PRINT:PRINT"Et encore moins vos lubies intestinales."
550 PEN 2:PRINT:PRINT"Je vous rappelle que vous etes cense":PRINT"explorer le desert, pas le fertiliser."
560 PEN 1:PRINT:PRINT:PRINT"           Honte sur vous !"
570 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
580 GOTO 60
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
605 IF PEEK(&7006)=1 THEN GOTO 1700
610 PEN 3:PRINT:PRINT"Une pyramide presque engloutie sous le":PRINT"sable, entree close."
620 PEN 2:PRINT:PRINT"On dirait que meme le vent a abandonne":PRINT"avant vous..."
630 PEN 1:PRINT:PRINT"Mais qui sait ce que des siecles":PRINT"de poussiere et de cailloux ont cache":PRINT"a l'interieur ?"
640 PEN 3:PRINT:PRINT"Une forte odeur d'urine de chat":PRINT"s'echappe du flanc gauche de la":PRINT"pyramide."
650 PEN 2:PRINT:PRINT"Trois orifices en forme de scarabees":PRINT"surplombent la porte, comme pour dire :"
660 PEN 1:PRINT:PRINT CHR$(34);"Entre si tu oses... ou reste a":PRINT"renifler les surprises felines !";CHR$(34)
670 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
680 IF PEEK(&7000)<5 THEN GOTO 60 
690 IF PEEK(&7000)>=5 THEN GOTO 700
700 CLS
710 PEN 3:PRINT:PRINT"En y regardant de plus pres, ces trois":PRINT"orifices en forme de scarabees vous":PRINT"semblent familiers..."
715 PEN 1:PRINT:PRINT"Mais oui, c'est ca !!!"
720 PEN 2:PRINT:PRINT"Ils ont exactement la meme silhouette":PRINT"que les scarabees que vous aviez":PRINT"recupere apres votre petite combine":PRINT"avec le marchand du souk !!!"
730 PEN 1:PRINT:PRINT"Par contre, chaque couleur doit etre":PRINT"placee dans le bon ordre..."
740 PEN 3:LOCATE 1,17:INPUT"Voulez-vous les inserer (O/N) ";sc$
750 IF UPPER$(sc$)="O" THEN GOTO 800
760 IF UPPER$(sc$)="N" THEN GOTO 60
770 IF UPPER$(sc$)<>"O" OR UPPER$(A$)<>"N" THEN GOTO 740
800 CLS
810 PEN 3:PRINT:PRINT"Dans quel ordre souhaitez-vous":PRINT"inserer les 3 scarabees ?"
820 PEN 2:PRINT:PRINT"1) Jaune - Marron - Orange"
830 PEN 3:PRINT"2) Jaune - Orange - Marron"
840 PEN 2:PRINT"3) Orange - Jaune - Marron"
850 PEN 3:PRINT"4) Orange - Marron - Jaune"
860 PEN 2:PRINT"5) Marron - Jaune - Orange"
870 PEN 3:PRINT"6) Marron - Orange - Jaune"
880 PEN 1:LOCATE 1,17:INPUT"Quel est votre choix (1-2-3-4-5-6) ";sc$
890 IF sc$="1" OR sc$="2" OR sc$="3" OR sc$="5" OR sc$="6" THEN GOTO 900
892 IF sc$="4" THEN GOTO 1000
895 GOTO 880
900 CLS:PEN 3:PRINT"Vous poussez le dernier scarabee en":PRINT"place avec un air confiant..."
910 PEN 1:PRINT:PRINT"Et immediatement, un grincement":PRINT"sinistre se fait entendre."
920 PEN 2:PRINT:PRINT"Avant meme de comprendre ce qui se":PRINT"passe, des pieux surgissent du sol":PRINT"et vous empalent avec une efficacite":PRINT"redoutable."
930 PEN 1:PRINT:PRINT"               Ouille."
940 PEN 3:PRINT:PRINT"Visiblement, vous navez pas suivi":PRINT"l'ordre exact... et il est probable que":PRINT"TAREQ, dans sa grande sagesse, ait":PRINT"laisse un indice subtil que vous":PRINT"avez joyeusement ignore."
950 PEN 2:PRINT:PRINT"Vous venez d'inventer une nouvelle":PRINT"facon d'explorer une pyramide :":PRINT"Version brochette d'aventurier !"
960 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
970 RUN"Mort.bas"
1000 CLS:PEN 3:PRINT:PRINT"Vous inserez le dernier scarabee en":PRINT"retenant votre souffle..."
1010 PEN 2:PRINT:PRINT"Un petit clic discret se fait entendre,":PRINT"puis une lueur timide s'allume sur le":PRINT"flanc gauche de la pyramide..."
1020 PEN 1:PRINT:PRINT"Felicitation, vous avez apparemment":PRINT"reussi a ne pas tout casser !"
1030 PEN 3:PRINT:PRINT"Mieux encore, vous venez de debloquer":PRINT"un mecanisme : une petite trappe":PRINT"s'ouvre lentement sur le flanc gauche,":PRINT"laissant apparaitre un receptacle":PRINT"capable d'accueillir un liquide."
1040 PEN 2:PRINT:PRINT"Un souffle de mystere plane autour de":PRINT"vous, et vous ne pouvez vous empecher":PRINT"de vous demander si cette trouvaille":PRINT"n'est pas la premiere etape vers":PRINT"l'ouverture de la pyramide !"
1080 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1090 POKE &7006,1:GOTO 60
1100 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1110 PEN 3:PRINT:PRINT"Vous essayez de gravir la pyramide":PRINT"avec toute la ferveur d'un champion."
1120 PEN 2:PRINT:PRINT"Vous grimpez de 10 cm,":PRINT"vous en glissez de 20...":PRINT"puis encore 10 et encore 20..."
1130 PEN 1:PRINT:PRINT"La moyenne est tres claire :":PRINT"vous etes nul !"
1140 PEN 3:PRINT:PRINT"A ce rythme, vous allez bientot creuser":PRINT"un tunnel a la verticale."
1150 PEN 2:PRINT:PRINT"Bref, la seule chose que vous":PRINT"gravissez, c'est le mur de la honte."
1160 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1170 GOTO 60
1300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1310 PEN 3:PRINT:PRINT"Faire Pipi ? Pourquoi pas..."
1320 PEN 1:PRINT:PRINT"Mais encore faudrait-il que vous ayez":PRINT"bu un minimum auparavant pour etre":PRINT"en mesure d'evacuer quoi que ce soit !"
1340 PEN 2:PRINT:PRINT"Pour l'instant, votre gosier est aussi":PRINT"sec qu'un haricot et votre vessie n'est":PRINT"guere plus inspirante."
1350 PEN 3:PRINT:PRINT"Un petit verre d'eau fraiche serait le":PRINT"bienvenu..."
1360 PEN 2:PRINT:PRINT"Mais pour l'instant, c'est niet :"
1370 PEN 1:PRINT:PRINT"Pas une goutte ne sort de votre (tout":PRINT"petit) oiseau."
1380 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1390 GOTO 60
1400 IF PEEK(&7006)=0 THEN GOTO 1500
1410 IF PEEK(&7006)=1 THEN GOTO 1600
1500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1510 PEN 3:PRINT"Un besoin soudain de laisser son odeur":PRINT"pour marquer son territoire ?"
1520 PEN 2:PRINT:PRINT"Parfait, vous debouchez votre jarre et":PRINT"prenez une gorgee d'eau fraiche":PRINT"precedemment recuperee dans l'oasis,":PRINT"histoire de reveiller la vessie."
1530 PEN 3:PRINT:PRINT"Deux minutes plus tard, l'envie est la.":PEN 1:PRINT:PRINT"Vous vous soulagez abondamment":PRINT"sur le mur de la pyramide, histoire"
1540 PRINT"de montrer a tous les chats":PRINT"environnants qui est le veritable boss":PRINT"ici !"
1550 PEN 3:PRINT:PRINT"Mais voila, rien ne se passe :":PRINT"Aucun mecanisme ne s'active, aucun":PRINT"secret ne se revele..."
1560 PEN 2:PRINT:PRINT"Un doute vous assaille alors :":PRINT"Auriez-vous oublie de faire quelque":PRINT"chose avant ?"
1570 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1580 GOTO 60 
1600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1610 PEN 3:PRINT"Vous vous dites que recuperer un peu":PRINT"d'eau de l'oasis dans votre jarre":PRINT"etait une excellente idee :"
1620 PEN 1:PRINT:PRINT"Une bonne gorgee pour reveiller la":PRINT"vessie et c'est parti !"
1630 PEN 2:PRINT:PRINT"Quelques minutes plus tard, vous vous":PRINT"tortillez sur le sable comme une":PRINT"anguille sous cafeine, incapable de":PRINT"tenir plus longtemps."
1640 PEN 1:PRINT:PRINT"Enfin, vous vous soulagez...":PEN 3:PRINT"Directement dans le petit receptacle":PRINT"qui est apparu plus tot sur le flanc":PRINT"gauche de la pyramide."
1650 PEN 2:PRINT:PRINT"Votre urine s'evapore alors comme si":PRINT"la pyramide elle-meme l'avalait !"
1660 PEN 1:PRINT:PRINT"  Lorsque...":PRINT"              TOUT A COUP..."
1670 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1680 GOTO 2000
1700 PEN 2:PRINT:PRINT"Bien alignes dans le bon ordre,":PRINT"vos trois scarabees":PRINT"surplombent la porte de la pyramide,":PRINT"comme pour dire :"
1710 PEN 1:PRINT:PRINT CHR$(34);"Entre si tu oses !";CHR$(34)
1720 PEN 3:PRINT:PRINT"En revanche, ca pue toujours autant la":PRINT"pisse de chat a gauche..."
1730 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1740 GOTO 60
2000 CLS:PEN 3:INK 1,6,0:PRINT"Une voix venue de nulle part retentit :"
2010 SOUND 1,200:PEN 1:PRINT:PRINT"ADN detecte...":FOR i=1 TO 1200:NEXT i
2020 SOUND 1,150:PEN 2:PRINT:PRINT"Analyse genetique en cours...":FOR i=1 TO 1200:NEXT i
2030 SOUND 1,100:PEN 1:PRINT:PRINT"Profil valide.":FOR i=1 TO 1200:NEXT i
2040 SOUND 1,50:PEN 2:PRINT:PRINT"Acces autorise.":FOR i=1 TO 1200:NEXT i
2050 PEN 3:PRINT:PRINT"Tandis que vous etes encore en train":PRINT"d'essayer de comprendre ce qui vient":PRINT"d'arriver, la porte de la pyramide":PRINT"s'ouvre enfin..."
2060 PEN 3:LOCATE 15,25:INPUT"  ENTER  ",en$
2100 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
2110 PEN 3:PRINT"Vous franchissez l'entree de la":PRINT"pyramide, guide par l'echo de vos":PRINT"propres pas."
2120 PEN 2:PRINT:PRINT"Un souffle glace s'eleve des tenebres,":PRINT"comme si des siecles d'histoire":PRINT"retenaient leur respiration."
2130 PEN 1:PRINT:PRINT"Soudain, le tonnerre de pierre resonne :"
2140 LOCATE 1,11:PEN 3:PRINT"la porte se referme derriere vous,":PRINT"emprisonnant la lumiere du desert":PRINT"et scellant votre sort a jamais."
2150 PEN 2:PRINT:PRINT"Il n'y a plus d'echappatoire : seul":PRINT"l'inconnu vous attend, dans les":PRINT"entrailles de la pyramide..."
2160 PEN 3:LOCATE 15,25:INPUT"  ENTER  ",en$
2170 CLS:LOCATE 12,12:PEN 1:PRINT"INSEREZ LA FACE B":PEN 3:LOCATE 8,14:PRINT"ET APPUYEZ SUR UNE TOUCHE"
2180 PEN 3:LOCATE 15,25:INPUT"  ENTER  ",en$
2185 POKE &7000,0:POKE &7001,0:POKE &7002,0:POKE &7003,0:POKE &7004,0:POKE &7005,0:POKE &7006,0
2190 RUN"Pyramid2.bas"

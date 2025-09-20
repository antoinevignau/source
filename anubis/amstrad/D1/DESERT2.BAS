10 ' DESERT 2
20 MODE 1:BORDER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Desert2.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1,"Un ancien":PRINT #1,"site":PRINT #1,"egyptien":PRINT #1,"surgit":PRINT #1,"du sable,"
125 PRINT #1,"avec ses":PRINT #1,"colonnes":PRINT #1,"brisees,":PRINT #1,"et ses":PRINT #1,"symboles":PRINT #1,"effaces":PRINT #1,"par le":PRINT #1,"temps..."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3:LOCATE 4,21:PRINT "1-NORD    2-SUD    3-OUEST   4-EST"
150 PEN 2:LOCATE 4,22:PRINT "5-Examiner    6-Creuser    7-Prier"
160 PEN 3:LOCATE 4,23:PRINT "8-Soulever la colonne brisee"
170 PEN 2:LOCATE 4,24:PRINT "9-Sacrifier quelque chose"
200 k$=INKEY$
210 IF k$="1"THEN RUN"Desert1.bas"
220 IF k$="2"THEN GOTO 300
230 IF k$="3"THEN RUN"Desert3.bas"
240 IF k$="4"THEN GOTO 400
250 IF k$="5"THEN GOTO 500
260 IF k$="6" AND PEEK(&7004)=1 THEN GOTO 600
265 IF k$="6" AND PEEK(&7004)=0 THEN GOTO 900
270 IF k$="7"THEN GOTO 1000
280 IF k$="8"THEN GOTO 1100
290 IF k$="9"THEN GOTO 1200
295 IF k$<"1"OR k$>"9" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Vous sautez gaiement vers le sud..."
320 PEN 1:PRINT:PRINT"BOING ! Premier serpent."
330 PEN 2:PRINT:PRINT"PLOP ! Deuxieme serpent."
340 PEN 3:PRINT:PRINT"PSSST ! Cinquante serpents plus tard,":PRINT"vous etes devenu un ballon de baudruche":PRINT"de venin pret a eclater."
350 PEN 1:PRINT:PRINT"Vous regrettez de ne pas avoir lu":PRINT"les avis sur TripadVenin..."
360 LOCATE 14,13:PEN 2:PRINT"TripadVenin"
370 PEN 3:PRINT:PRINT"Mais bon, il est desormais trop tard":PRINT"pour vous de toute facon."
380 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
390 RUN"Mort.bas"
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT:PRINT"Vous vous engagez vers l'EST, tete":PRINT"haute... et naive."
420 PEN 1:PRINT:PRINT"Un vent furieux surgit soudain et vous":PRINT"emporte dans un tourbillon":PRINT"incontrollable."
430 PEN 2:PRINT:PRINT"Quelques instants plus tard, le calme":PRINT"revenu, votre corps sans vie est":PRINT"retrouve, la tete malencontreusement":PRINT"coincee dans le derriere d'un chameau":PRINT"qui n'avait rien demande."
440 PEN 3:PRINT:PRINT"Pour une fois que vous ne mettiez pas":PRINT"volontairement votre nez dans les":PRINT"affaires des autres..."
450 PEN 1:PRINT:PRINT"Quelle ironie du sort !"
460 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
470 RUN"Mort.bas"
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT:PRINT"Ha, un site archeologique, ca c'est":PRINT"pile dans vos cordes !"
520 PEN 2:PRINT:PRINT"Devant vous, deux colonnes egyptiennes,":PRINT"brisees et a moitie ensevelies sous le":PRINT"sable gisent comme des geants fatigues."
530 PEN 1:PRINT:PRINT"Le vent souffle, emportant quelques":PRINT"grains de sable et votre sens de":PRINT"l'orientation."
540 PEN 3:PRINT:PRINT"Est-ce vraiment ici que TAREQ voulait":PRINT"m'envoyer ?"
550 PEN 1:LOCATE 19,14:PEN 1:PRINT"Peut-etre..."
560 PEN 2:PRINT:PRINT"Peut-etre que cette ancienne":PRINT"civilisation a laisse, quelque part":PRINT"sous ces ruines, quelques tresors":PRINT"oublies attendant patiemment un":PRINT"explorateur..."
570 PEN 2:PRINT:PRINT"... ou quelqu'un qui sait juste ne pas":PRINT"se casser la figure."
580 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
590 GOTO 60         
600 IF PEEK(&7001)=0 THEN GOTO 700
610 IF PEEK(&7001)=1 THEN GOTO 800
700 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:PRINT:PRINT"Vous pensez trouver quoi dans le sable ?"
715 LOCATE 1,3:PEN 2:PRINT:PRINT"Une vieille lampe magique ?":PRINT"Un rouage Inca oublie ?"
720 PEN 1:PRINT:PRINT"Muni de votre pelle, vous vous mettez":PRINT"a creuser..."
725 PEN 3:LOCATE 15,7:PRINT"pelle"
730 PEN 2:LOCATE 1,10:PRINT"       Cinq minutes plus tard :":PEN 3
740 PRINT:PRINT"- Un caillou.":PRINT:PRINT"- Un autre caillou.":PRINT:PRINT"- Un scarabee passablement enerve":PRINT"  que vous reposez en vous excusant."
742 PRINT:PRINT"- Un troisieme caillou qui, sans":PRINT"  surprise, ressemble beaucoup aux":PRINT"  deux premiers..."
745 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
747 CLS
750 PEN 3:PRINT:PRINT"Et, finalement, apres beaucoup de":PRINT"perseverance, et d'ampoules aux mains,":PRINT"vous trouvez un fragment de papyrus":PRINT"sur lequel 3 taches ont ete faites":PRINT"au crayon dans cet ordre :"
755 LOCATE 17,4:PEN 2:PRINT"fragment de papyrus"
760 LOCATE 1,7:PEN 1:PRINT:PRINT"        Orange - Marron - Jaune"
770 PEN 2:PRINT:PRINT"Vous le placez au fond de votre poche,":PRINT"pensant qu'il pourrait servir plus tard."
780 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
790 POKE &7001,1:GOTO 60
800 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT:PRINT"Vous vous acharnez a gratter le sable":PRINT"comme si des lingots etaient planques":PRINT"dessous."
820 PEN 1:PRINT:PRINT"Mauvaise nouvelle : il n y a que des":PRINT"cailloux et un vieux lezard mort..."
830 PEN 2:PRINT:PRINT"Vous avez deja degote un papyrus, ce":PRINT"qui est un exploit dans ce desert radin."
840 LOCATE 26,9:PEN 3:PRINT"papyrus"
850 LOCATE 1,12:PRINT"Serieusement, Vous esperiez quoi ?":PRINT"Une console Amstrad GX4000 edition":PRINT"pharaon ?"
860 PEN 2:PRINT:PRINT"Allez, rangez donc cette pelle !"
870 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
880 GOTO 60
900 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
910 PEN 3:PRINT:PRINT"Vous vous croyez a la plage et vous":PRINT"attaquez le sable a mains nues comme un":PRINT"enfant surexcite."
920 PEN 2:PRINT:PRINT"Vous creusez avec courage, persuade":PRINT"qu'un secret dort sous le sable."
930 PEN 3:PRINT:PRINT"Ce qui dort surtout, c'est votre":PRINT"cervelle :":PEN 1:PRINT:PRINT"     Le sable est a 70 degres !!!"
940 PEN 3:PRINT:PRINT"Vos doigts noircissent comme des toasts":PRINT"oublies au grille pain..."
950 PEN 2:PRINT:PRINT"Peut etre qu'un ustensile approprie ne":PRINT"serait pas superflu pour ce loisir."
960 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
970 GOTO 60
1000 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1010 PEN 3:PRINT:PRINT"Vous vous agenouillez et vous priez,":PRINT"convaincu d'etre digne d'une vision":PRINT"divine."
1020 PEN 2:PRINT:PRINT"Le ciel reste muet... sauf pour moi,":PRINT"qui contemple la scene avec classe."
1030 PEN 1:PRINT:PRINT"Eh oui, encore une replique brillante,":PRINT"c'est cadeau."
1040 PEN 3:PRINT:PRINT"Vous priez, je narre, et franchement :":PRINT"qui est le vrai dieu ici ?"
1050 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1060 GOTO 60
1100 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1110 PEN 3:PRINT:PRINT"Vous pensez vraiment pouvoir soulever":PRINT"cette colonne de pierre ?"
1120 PRINT:PRINT"Avec vos bras de nouilles et vos abdos":PRINT"facon flan ?"
1130 PEN 1:PRINT:PRINT"Allons, soyons serieux..."
1140 PEN 3:PRINT:PRINT"Vous tentez quand meme.":PEN 2:PRINT:PRINT"Resultat :":PRINT:PRINT"Trois secondes plus tard, vous avez":PRINT"la colonne... toujours au sol, et vous,":PRINT"une lombaire en moins."
1150 PEN 1:PRINT:PRINT"Bravo, hercule en carton !"
1160 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1170 GOTO 60
1200 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1210 PEN 3:PRINT"Vous choisissez fierement de sacrifier":PRINT"quelque chose..."
1220 PEN 2:PRINT:PRINT"Tres bien, tres noble."
1230 PEN 1:PRINT:PRINT"Alors ? Une offrande ? Un objet rare ?":PRINT"Une meche de cheveux ?"
1240 PEN 3:PRINT:PRINT"Ah non... vous hesitez.":PEN 1:PRINT:PRINT"Longtemps...":PRINT"         Tres longtemps...":PRINT"                      TROP longtemps..."
1250 PEN 2:PRINT:PRINT"La, c'est plutot moi qui sacrifie mon":PRINT"temps a regarder ce sketch pathetique !"
1260 PEN 3:PRINT:PRINT"Bon... vous posez un caillou par terre,":PRINT"l'air solennel.":PEN 2:PRINT:PRINT"Waouh. Quelle generosite.":PRINT"Les dieux doivent etre plies de rire."
1270 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1280 GOTO 60

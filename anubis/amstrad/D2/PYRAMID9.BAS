10 ' PYRAMID9
20 MODE 1:BORDER 0:PAPER 0
25 A=2:B=2:C=2:D=2:E=2
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Pyramid9.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 LOCATE 12,8:PEN A:PAPER 2:PRINT CHR$(244):LOCATE 13,8:PEN B:PAPER 2:PRINT CHR$(244):LOCATE 12,10:PEN C:PAPER 2:PRINT CHR$(244):LOCATE 13,10:PEN D:PAPER 2:PRINT CHR$(244):LOCATE 13,13:PEN E:PAPER 2:PRINT CHR$(244)
105 IF PEEK(&7001)=1 THEN LOCATE 12,8:PEN 1:PAPER 2:PRINT CHR$(244):LOCATE 13,8:PEN 3:PAPER 2:PRINT CHR$(244):LOCATE 12,10:PEN 3:PAPER 2:PRINT CHR$(244):LOCATE 13,10:PEN 1:PAPER 2:PRINT CHR$(244):LOCATE 13,13:PEN 0:PAPER 2:PRINT CHR$(244)
110 WINDOW #1,25,36,4,19
120 INK 0,0:INK 1,3:INK 2,15:INK 3,24:PAPER 0
130 PEN #1,3:PRINT #1:PRINT #1,"Deux":PRINT #1,"figures":PRINT #1,"sacrees":PRINT #1,"gravees":PRINT #1,"dans la"
140 PRINT #1,"pierre,":PRINT #1,"Ramses et":PRINT #1,"Anubis,":PRINT #1,"figes":PRINT #1,"dans un":PRINT #1,"duel":PRINT #1,"d'eternite."
150 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
160 PEN 3:LOCATE 4,22:PRINT "0-EST  1-SUD  2-Examiner  3-Aboyer"
170 PEN 2:LOCATE 4,24:PRINT "Appuyer sur le bouton :  4-5-6-7-8"
200 k$=INKEY$
210 IF k$="4" THEN A=A+1:SOUND 1,100:GOTO 300
220 IF k$="5" THEN B=B+1:SOUND 1,120:GOTO 400
230 IF k$="6" THEN C=C+1:SOUND 1,140:GOTO 500
240 IF k$="7" THEN D=D+1:SOUND 1,160:GOTO 600
250 IF k$="8" THEN E=E+1:SOUND 1,180:GOTO 700
260 IF K$="0"THEN RUN"PyramidA.bas"
265 IF K$="1"THEN RUN"Pyramid5.bas"
270 IF K$="2"THEN GOTO 1000
280 IF K$="3"THEN GOTO 1100
290 IF k$<"0"OR k$>"8"THEN GOTO 200
300 IF A>3 THEN A=0
310 LOCATE 12,8:PEN A:PAPER 2:PRINT CHR$(244)
320 GOTO 800
400 IF B>3 THEN B=0
410 LOCATE 13,8:PEN B:PAPER 2:PRINT CHR$(244)
420 GOTO 800
500 IF C>3 THEN C=0
510 LOCATE 12,10:PEN C:PAPER 2:PRINT CHR$(244)
520 GOTO 800
600 IF D>3 THEN D=0
610 LOCATE 13,10:PEN D:PAPER 2:PRINT CHR$(244)
620 GOTO 800
700 IF E>3 THEN E=0
710 LOCATE 13,13:PEN E:PAPER 2:PRINT CHR$(244)
720 GOTO 800
800 IF A=1 AND B=3 AND C=3 AND D=1 AND E=0 THEN SOUND 1,300:SOUND 1,250:SOUND 1,200:SOUND 1,150:SOUND 1,100:SOUND 1,50:GOTO 2000
810 GOTO 200
1000 IF PEEK(&7001)=1 THEN GOTO 1200
1010 INK 0,0:INK 1,6:INK 2,15:INK 3,24:PAPER 0:MODE 1
1020 PEN 3:PRINT:PRINT"Vous scrutez les hieroglyphes avec":PRINT"attention..."
1030 PEN 1:PRINT:PRINT"Pharaon et Anubis, figes dans une":PRINT"confrontation eternelle."
1040 PEN 2:PRINT:PRINT"Pourtant, a bien y regarder, on dirait":PRINT"moins un combat qu'un troc de brocante :"
1050 PEN 3:LOCATE 1,11:PRINT "Leurs bras tendus donnent l'impression":PRINT"qu'ils veulent s'echanger quelque chose."
1060 PEN 1:LOCATE 1,14:PRINT"Une jarre contre une tete de chacal ?":PRINT"Un papyrus collector contre un scarabee en toc ?"
1070 PEN 2:PRINT:PRINT"Difficile a dire...":PRINT"Mais une chose est sure : il manque":PRINT"des objets dans ce deal improbable."
1080 PEN 3:LOCATE 15,24:INPUT"  ENTER  ",en$
1090 GOTO 60
1100 INK 0,0:INK 1,6:INK 2,15:INK 3,24:PAPER 0:MODE 1
1110 PEN 3:PRINT:PRINT"Ah oui, evidemment !":PRINT"Aboyer, quelle idee de genie."
1120 PEN 2:PRINT:PRINT"Vous ne pensez pas que si Anubis ":PRINT"avait voulu un dialogue, il aurait":PRINT"grave OUAF sur le mur, non ?"
1130 PEN 1:LOCATE 7,7:PRINT"OUAF"
1140 PEN 3:PRINT:PRINT"Mais continuez, peut-etre qu'un jour il":PRINT"rapportera le baton... du sceptre."
1150 PEN 3:LOCATE 15,24:INPUT"  ENTER  ",en$
1160 GOTO 60
1200 INK 0,0:INK 1,6:INK 2,15:INK 3,24:PAPER 0:MODE 1
1210 PEN 3:PRINT:PRINT"Ah, vous revenez admirer votre chef":PRINT"d'oeuvre ?"
1220 PEN 2:PRINT:PRINT"Forcement, resoudre une enigme vieille":PRINT"de plusieurs millenaires, ca donne":PRINT"envie de s'auto-congratuler."
1230 PEN 1:PRINT:PRINT"Mais attention, contempler des gravures":PRINT"ne fait pas de vous un pharaon..."
1240 PEN 3:PRINT:PRINT"Spoiler :":PRINT"la trappe est toujours ouverte,":PRINT"la clef est toujours dans votre poche,":PRINT"et Anubis n'a toujours pas bouge":PRINT"d'un millimetre."
1250 PEN 2:PRINT:PRINT"Mais bon, si ca vous amuse de faire":PRINT"semblant de reflechir..."
1260 PEN 3:LOCATE 15,24:INPUT"  ENTER  ",en$
1270 GOTO 60         
2000 IF PEEK(&7001)=0 THEN GOTO 3000
2010 INK 0,0:INK 1,6:INK 2,15:INK 3,24:PAPER 0:MODE 1
2020 PEN 1:PRINT:PRINT"             Ah, bravo !"
2030 PEN 3:PRINT:PRINT"Vous avez encore resolu l'enigme !"
2040 PEN 1:PRINT:PRINT"             Incroyable !"
2050 PEN 2:PRINT:PRINT"Quelle performance, quel esprit":PRINT"brillant !"
2060 PEN 3:PRINT:PRINT"Bon, evidemment, ca ne sert a rien,":PRINT"puisque vous aviez deja recupere la":PRINT"clef..."
2070 PRINT:PRINT"Mais visiblement, vous adorez les":PRINT"enigmes, surtout quand elles sont deja":PRINT"resolues."
2080 PEN 2:PRINT:PRINT"Ca evite de se fatiguer les neurones,":PRINT"hein ?"
2090 PEN 3:LOCATE 15,24:INPUT"  ENTER  ",en$
2095 GOTO 60     
3000 INK 0,0:INK 1,6:INK 2,15:INK 3,24:PAPER 0:MODE 1
3010 PEN 3:PRINT:PRINT"Vous ajustez la derniere pyramide,":PRINT"le souffle retenu comme si vous alliez":PRINT"declencher la fin du monde..."
3020 PEN 1:PRINT:PRINT"         Et soudain un CLIC!"
3030 PEN 2:PRINT:PRINT"Suivi d'un grincement qui ferait fuir":PRINT"n'importe quel amateur d'ASMR."
3040 PEN 3:PRINT:PRINT"Les statues semblent enfin satisfaites":PRINT"de leur collection :"
3045 PEN 2:PRINT:PRINT"Pharaon exhibe fierement ses quatre":PRINT"pyramides jaunes et marrons, pendant":PRINT"qu'Anubis fait le malin avec sa petite":PRINT"pyramide noire."
3047 PEN 3:LOCATE 15,25:INPUT"  ENTER  ",en$
3050 CLS:PEN 2:PRINT:PRINT "Puis, miracle ou mecanisme bien huile :":PEN 3:PRINT:PRINT"Une trappe s'ouvre dans le mur,":PRINT"laissant glisser un objet brillant..."
3060 PEN 1:PRINT:PRINT"      Une clef en forme d'ankh !":PEN 2:PRINT:PRINT"Pas de musique triomphante, mais vous":PRINT"pouvez quand meme lever les bras et":PRINT"crier :":PEN 1:PRINT:PRINT"           JE SUIS UN GENIE !"
3070 PEN 3:PRINT:PRINT"...avant de la mettre dans votre":PRINT"inventaire."
3080 LOCATE 15,25:INPUT"  ENTER  ",en$
3090 POKE &7001,1:GOTO 60

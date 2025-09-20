10 ' PYRAMIDB
20 MODE 1:BORDER 0:PAPER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"PyramidB.cmp"
55 DIM Dieux(14)
56 RESTORE 800
57 FOR i=1 TO 7:READ A$(i),b$(i):NEXT i
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Le visage":PRINT #1,"fige dans":PRINT #1,"l'eternite,":PRINT #1,"le Sphinx":PRINT #1,"dort."
130 PRINT #1,:PRINT #1,"Mais son":PRINT #1,"regard,":PRINT #1,"jamais ne":PRINT #1,"s'eteint."
140 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
150 PEN 3:LOCATE 4,21:PRINT "1-OUEST      2-Descendre l'echelle"
160 PEN 2:LOCATE 4,22:PRINT "3-Examiner   4-Parler au Sphinx"
170 PEN 3:LOCATE 4,23:PRINT "5-Fouiller le Sphinx"
180 PEN 2:LOCATE 4,24:PRINT "6-Pousser le Sphinx  7-Crier"
200 k$=INKEY$
210 IF k$="1"THEN RUN"PyramidA.bas"
220 IF k$="2"THEN RUN"Pyramid7.bas"
230 IF k$="3"THEN GOTO 300
240 IF k$="4"THEN GOTO 400
250 IF k$="5"THEN GOTO 500
260 IF k$="6"THEN GOTO 600
270 IF k$="7" AND PEEK(&7005)=0 THEN GOTO 700
280 IF k$="7" AND PEEK(&7005)=1 THEN GOTO 1600
290 IF k$<"1"OR k$>"7" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT"Dans cette piece, la lumiere tamisee":PRINT"joue les dramatiques."
320 PEN 2:PRINT:PRINT"En son centre, le Sphinx.":PRINT"Majestueux, imposant... et aussi bavard":PRINT"qu'une enclume."
330 PEN 1:PRINT:PRINT"Il trone depuis des millenaires, sans":PRINT"se soucier des visites guidees."
340 PEN 3:PRINT:PRINT"Sous vos pieds, un dallage qui n'a":PRINT"pas vu de serpillere depuis Ramses II."
350 PEN 3:PRINT:PRINT"Et la, un trou avec une echelle qui":PRINT"descend...":PRINT:PRINT"Pourquoi descendre dans un trou":PRINT"sombre ? Parce que c'est une idee":PRINT"geniale, voyons !"
360 PEN 2:PRINT:PRINT"Ah, et pour info : aucune sortie a part":PRINT"l'OUEST. Donc, si vous comptiez ouvrir":PRINT"une fenetre pour aerer, oubliez."
370 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
380 GOTO 60  
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT"Vous vous plantez devant le Sphinx et":PRINT"engagez la conversation, convaincu que":PRINT"la pierre a beaucoup de choses a dire."
420 PEN 1:PRINT:PRINT"            Silence total."
430 PEN 2:PRINT:PRINT"Pas un souffle, pas un murmure..."
440 PEN 3:PRINT:PRINT"Juste deux yeux figes qui vous fixent":PRINT"sans emotion."
450 PEN 2:PRINT:PRINT"Vous tentez tout :":PRINT"La meteo, la meilleure recette de":PRINT"pigeon farci, le cours du papyrus et":PRINT"meme le debat ";CHR$(34);"sable ou gravier : qui"
460 PRINT"gratte le plus";CHR$(34)
470 PEN 1:PRINT:PRINT"                Rien."
480 PEN 3:PRINT:PRINT"Peut-etre qu'avec ses grandes oreilles":PRINT"de calcaire et son age canonique, il":PRINT"n'entend plus tres bien ? Qui sait...":PRINT"parler plus fort aiderait peut-etre."
490 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
495 GOTO 60
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT"Vous decidez de fouiller le Sphinx."
520 PEN 2:PRINT:PRINT"Normal, qui pourrait resister a l'envie":PRINT"de mettre les mains partout sur un":PRINT"monument vieux de 4000 ans ?"
530 PEN 3:PRINT:PRINT"Vous palpez les pattes, cherchez une":PRINT"cachette dans le croupion...":PRINT"quand soudain, un leger clic resonne."
540 PEN 1:PRINT:PRINT"Aie aie, aie..."
550 PEN 2:PRINT:PRINT"Vous venez d'activer le mecanisme":PRINT"anti-cambrioleurs le plus ancien du":PRINT"monde."
560 PEN 3:PRINT:PRINT"Le sol s'ouvre sous vos pieds et vous":PRINT"terminez votre descente a l'etage":PRINT"inferieur ...en version puzzle 3D":PRINT"premier prix."
570 PEN 1:PRINT:PRINT"Rideau."
580 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
590 RUN"Mort.bas" 
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
610 PEN 3:PRINT:PRINT"Vous prenez une grande inspiration,":PRINT"placez vos mains sur le Sphinx et":PRINT"poussez de toutes vos forces."
620 PEN 1:PRINT:PRINT"Au bout de deux secondes, une":PRINT"illumination fulgurante :"
630 PEN 2:PRINT:PRINT"Ce truc pese plus qu'un camion rempli":PRINT"de sarcophages, et vous, ben vous avez":PRINT"skippe la salle de muscu."
640 PEN 3:PRINT:PRINT"En revanche, en reprenant votre souffle,":LOCATE 1,14:PRINT"vous remarquez des chiffres graves sur":PRINT"le socle."
650 PEN 2:PRINT:PRINT"Des chiffres... etranges."
660 PEN 1:PRINT:PRINT"Le Sphinx aurait-il un petit faible":PRINT"pour les maths, entre deux enigmes":PRINT"existentielles ?"
670 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
680 GOTO 60
700 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:PRINT"Vous hurlez comme si le desert entier":PRINT"allait s'effondrer, et... miracle !"
720 PEN 2:PRINT:PRINT"Le Sphinx ouvre la bouche et un son":PRINT"etrangement metallique, sort de ses":PRINT"entrailles :"
730 PEN 3:PRINT:PRINT "- Analyse de frequence vocale...":PRINT:PRINT"- Correspondance utilisateur confirmee.":PRINT:PRINT"- Identite reconnue."
740 PRINT:PRINT"Pour acceder aux informations avancees":PRINT"concernant la pyramide et ses secrets,":PRINT"repondez a une question relative aux":PRINT"divinites egyptiennes."
750 PEN 2:PRINT:PRINT"Un Sphinx bavard qui analyse ma voix ?!":PRINT"Mais c'est quoi ce delire monumental ?!"
760 PEN 1:LOCATE 1,22:PRINT"       Souhaitez-vous repondre ":PRINT"     a l'enigme du Sphinx (O/N) ?"
770 k$=INKEY$
780 IF UPPER$(k$)="O" THEN GOTO 800
790 IF UPPER$(k$)="N" THEN GOTO 60
795 IF UPPER$(k$)<>"O" OR UPPER$(k$)<>"N" THEN GOTO 760
800 DATA SOBEK,Crocodile,THOT,Ibis,HORUS,Faucon,BASTET,Chat,MIYSIS,Lion,KHNOUM,Belier,ANUBIS,Chacal
850 RANDOMIZE TIME
860 j=INT(RND(1)*7)
870 IF j=0 THEN j=7
880 CLS:PEN 3:PRINT:PRINT"Dans la mythologie egyptienne, quel":PRINT"animal est associe au dieu ";A$(j);" ?"
890 PEN 2:PRINT:PRINT:PRINT "1-Crocodile":PRINT"2-Ibis":PRINT"3-Faucon":PRINT"4-Chat":PRINT"5-Lion":PRINT"6-Belier":PRINT"7-Chacal"
900 LOCATE 1,16:PEN 1:PRINT "Votre choix ?"
1200 KK$=INKEY$
1210 IF KK$="1"THEN C$="Crocodile"
1220 IF KK$="2"THEN C$="Ibis"
1230 IF KK$="3"THEN C$="Faucon"
1240 IF KK$="4"THEN C$="Chat"
1250 IF KK$="5"THEN C$="Lion"
1260 IF KK$="6"THEN C$="Belier"
1270 IF KK$="7"THEN C$="Chacal"
1280 IF KK$<"1"OR KK$>"7" THEN GOTO 1200
1300 IF C$=B$(j) THEN GOTO 1500
1400 CLS:INK 1,6,0:PEN 1:LOCATE 1,11:PRINT "           REPONSE ERRONEE !"
1410 PEN 1:PRINT:PRINT"    ACCES AUX INFORMATIONS REFUSE"
1420 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1490 GOTO 60
1500 CLS:PEN 3:PRINT:PRINT"REPONSE CORRECTE !"
1510 PEN 2:PRINT:PRINT"ACCES AUX INFORMATIONS AUTORISE"
1520 PEN 1:PRINT::PRINT:PRINT"Archive 6112-B"
1530 PEN 3:PRINT:PRINT:PRINT"Une legende ancienne raconte que":PRINT"lorsque les 5 dieux les plus":PRINT"puissants se joignirent aux 7 deesses":PRINT"les plus influentes du pantheon":PRINT"egyptien, les 12 divinites offrirent"
1540 PRINT"alors l'une des cles du savoir au":PRINT"peuple d'Egypte."
1550 PEN 1:LOCATE 13,11:PRINT"5":LOCATE 29,12:PRINT"7":LOCATE 15,14:PRINT"12"
1560 PEN 2:LOCATE 1,20:PRINT"Fin de l'archive."
1570 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1580 POKE &7005,1
1590 GOTO 60
1600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1610 PEN 3:PRINT"Vous prenez une grande inspiration et":PRINT"hurlez a nouveau, comme si votre":PRINT"carriere a l'Opera de Paris en":PRINT"dependait."
1620 PEN 1:PRINT:PRINT"Peut-etre avez-vous oublie l'indice que":PRINT"le sphinx vous a deja donne ?"
1630 PEN 2:PRINT:PRINT"Ou bien vous esperez qu'il vous donne":PRINT"le code du Wi-Fi cette fois ?"
1640 PEN 3:PRINT:PRINT"Resultat : vibration maximale, decibels":PRINT"dans le rouge... et le Sphinx qui se":PRINT"rallume en mode ";CHR$(34);"Encore toi ?";CHR$(34);" :"
1650 PEN 3:PRINT:PRINT"Pour acceder aux informations avancees":PRINT"concernant la pyramide et ses secrets,":PRINT"repondez a une question relative aux":PRINT"divinites egyptiennes."
1660 LOCATE 15,25:INPUT" ENTER  ",en$
1670 RESTORE 800
1680 FOR i=1 TO 7:READ A$(i),b$(i):NEXT i
1690 GOTO 850

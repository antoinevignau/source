20 MODE 1:BORDER 0:PAPER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Pyramid5.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,35,5,18
110 INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1,"Une salle":PRINT #1,"muette":PRINT #1,"ou les":PRINT #1,"Dieux":PRINT #1,"observent,":PRINT #1,"sous":PRINT #1,"l'ombre":PRINT #1,"d'un":PRINT #1,"plafond":PRINT #1,"fragilise":PRINT #1,"par le":PRINT #1,"temps."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3: LOCATE 4,21:PRINT "1-OUEST  2-EST  3-NORD  4-Examiner"
150 PEN 2:LOCATE 4,22:PRINT "5-Fouiller le tas de gravas au sol"
160 PEN 3:LOCATE 4,23:PRINT "6-Inspecter le bloc de calcaire"
170 PEN 2:LOCATE 4,24:PRINT "7-Se coucher     8-Invoquer Anubis"
200 k$=INKEY$
210 IF k$="1"THEN RUN"Pyramid4.bas"
220 IF k$="2"THEN RUN"Pyramid6.bas"
230 IF k$="3"THEN RUN"Pyramid9.bas"
240 IF k$="4"THEN GOTO 600
250 IF k$="5"THEN GOTO 700
260 IF k$="6"THEN GOTO 800
270 IF k$="7"THEN GOTO 900
280 IF k$="8"THEN GOTO 1000
290 IF k$<"1"OR k$>"8" THEN GOTO 200
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24:BORDER 0:PAPER 0
610 PEN 3:PRINT"Les murs sont couverts de grands":PRINT"hieroglyphes :"
620 PEN 2:PRINT:PRINT"Des dieux egyptiens vous regardent de":PRINT"leur oeil severe, tandis que quelques":PRINT"pharaons semblent epier vos moindres":PRINT"gestes."
630 PEN 3:PRINT:PRINT"Au sol, un enorme bloc de calcaire":PRINT"rectangulaire trone, voisinant avec des":PRINT"gravas qui semblent murmurer : ":PEN 1:PRINT:PRINT"         ";CHR$(34);"Ne nous touche pas";CHR$(34)
640 PEN 2:PRINT:PRINT"Plus loin au NORD, un escalier monte":PRINT"vers l'etage superieur, promettant de":PRINT"nouvelles aventures... et probablement":PRINT"d'autres dangers."
650 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
660 CLS:PEN 3:LOCATE 1,6:PRINT"Le plafond, lui, geint legerement sous":PRINT"le poids des siecles : fragile,":PRINT"grincant, et pret a vous rappeler que":PRINT"la gravite n'est pas votre amie."
670 PEN 2:PRINT:PRINT"Bref, un endroit parfait pour se sentir":PRINT"minuscule, prudent, et un brin foireux."
680 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
690 GOTO 60
700 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24:BORDER 0:PAPER 0
710 PEN 3:PRINT"Vous vous penchez sur le tas de gravas":PRINT"parce que les vieux cailloux, vous,":PRINT"vous adorez ca !"
720 PEN 2:PRINT:PRINT"Les pierres crissent sous vos doigts.":PEN 3:PRINT:PRINT"Ha, si, petit detail negligable :"
730 PEN 1:PRINT:PRINT"Juste au-dessus, le plafond semble un":PRINT"peu... fragile..."
740 PEN 2:PRINT:PRINT"Avant meme d'avoir le temps de jubiler":PRINT"sur votre super trouvaille, un enorme":PRINT"bloc de calcaire se detache et decide":PRINT"de participer a l'aventure..."
750 PEN 1:PRINT:PRINT"              PROUUUUUT !"
760 PEN 3:PRINT:PRINT"Vous voila aussi plat qu'une sole..."
770 PEN 2:PRINT:PRINT"C'est pas comme si le bloc deja tombe":PRINT"n'etait pas un indice evident, hein ?"
780 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
790 RUN"Mort.bas"
800 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24:BORDER 0:PAPER 0
810 PEN 3:PRINT:PRINT"Vous vous approchez du gros bloc de":PRINT"calcaire comme si c'etait un canape":PRINT"mal place."
820 PEN 2:PRINT:PRINT"Massif, rectangulaire, un vrai titan":PRINT"mineral parfaitement immobile maintenant":LOCATE 1,8:PRINT"qu'il a decide de se poser la, loin du":PRINT"plafond."
830 PEN 1:PRINT:PRINT"On devine qu'il a fait un petit plongeon":LOCATE 1,12:PRINT"depuis le sommet de la piece."
840 PEN 3:PRINT:PRINT"Il trone la, attendant tranquillement":PRINT"que ses copains de calcaire viennent le":PRINT"rejoindre pour former le club des gros":PRINT"blocs paresseux...."
850 LOCATE 15,25:INPUT" ENTER  ",en$
860 GOTO 60            
900 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24:BORDER 0:PAPER 0
910 PEN 3:PRINT:PRINT"Vous vous allongez sur le gros bloc de":PRINT"calcaire, comme si c'etait un transat":PRINT"de luxe."
920 PEN 1:PRINT:PRINT"Mauvaise nouvelle : le calcaire, niveau":PRINT"confort, c'est pas vraiment la plage."
930 PEN 2:PRINT:PRINT"Votre dos grince, mais vous vous dites":PRINT"que ca fera une bonne anecdote pour les":PRINT"diners mondains."
935 PRINT:PRINT"Enfin... si on vous y invite un jour..."
940 PEN 3:PRINT:PRINT"Le regard dans le vide, vous observez":PRINT"le plafond qui vous semble, comment":PRINT"dire... fragile."
942 PRINT:PRINT"Des fissures, des trous, bref, pas":PRINT"vraiment le gage d'un sommeil":PRINT"tranquille !"
945 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
947 CLS
950 PEN 2:PRINT"Puis vos yeux glissent vers les murs et":PRINT"leurs hieroglyphes majestueux :"
955 PRINT:PRINT"Vous y reperez quelques divinites :"
960 PEN 3:PRINT:PRINT"SOBEK, au museau de crocodile,":PRINT:PRINT"THOT, l'ibis erudit,":PRINT:PRINT"HORUS, le faucon vigilant,"
965 PRINT:PRINT"BASTET, la chatte divine,":PRINT:PRINT"MIYSIS, le lion feroce,":PRINT:PRINT"KHNOUM, le dieu belier,":PRINT:PRINT"et bien sur ANUBIS, le chacal eternel."
970 PEN 1:PRINT:PRINT:PRINT"Une revision express, offerte par la":PRINT"maison !"
980 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
990 GOTO 60
1000 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24:BORDER 0:PAPER 0
1010 PEN 3:PRINT"Vous appelez Anubis en vous prenant pour":LOCATE 1,2:PRINT"un grand pretre, bras tendus, voix":PRINT"solennelle, comme si tout le pantheon":PRINT"egyptien allait se pointer a votre appel"
1020 PEN 2:LOCATE 1,6:PRINT"Resultat ?":PRINT:PRINT"Zero manifestation divine,":PRINT"zero lumiere mystique, zero chacal":PRINT"spectral..."
1030 PEN 1:PRINT:PRINT"Juste vous, plante la, a declamer des":PRINT"invocations a un plafond qui semble":PRINT"vraiment tres peu impressionne..."
1040 PEN 3:PRINT:PRINT"Les pierres autour ne bougent pas,":PRINT"les hieroglyphes restent stoiques,":PRINT"et meme le petit courant d'air se":PRINT"contente de vous froler sans emotion."
1050 PEN 2:PRINT:PRINT"Allez, promis, on ne parlera a personne":PRINT"de ce moment de solitude genant."
1060 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
1070 GOTO 60   

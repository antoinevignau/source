10 ' PYRAMID3
20 MODE 1:BORDER 0:PAPER 0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Pyramid3.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"La Chambre":PRINT #1,"du Dernier":PRINT #1,"Souffle :":PRINT #1,:PRINT #1,"Ici repose":PRINT #1,"un secret"
130 PRINT #1,"drape":PRINT #1,"d'ombre et":PRINT #1,"de lumiere,":PRINT #1,"comme une":PRINT #1,"promesse":PRINT #1,"jamais":PRINT #1,"rompue."
140 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
150 PEN 3:LOCATE 4,21:PRINT "1-EST"
160 PEN 2:LOCATE 4,22:PRINT "2-Debrancher l'ordinateur a gauche"
170 PEN 3:LOCATE 4,23:PRINT "3-Debrancher l'ordinateur a droite"
180 PEN 2:LOCATE 4,24:PRINT "4-Fouiller le sarcophage"
200 k$=INKEY$
210 IF k$="1"THEN GOTO 300
220 IF k$="2"THEN GOTO 700
230 IF k$="3"THEN GOTO 700
240 IF k$="4"THEN GOTO 700
280 IF k$<"1"OR k$>"4" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Vous n'allez tout de meme pas repartir":PRINT"sans avoir trifouille quelque chose":PRINT"dans cette piece remplie de materiel":PRINT"totalement anachronique, quand meme !"
320 PEN 2:PRINT:PRINT"Faites donc preuve d'un peu de courage":PRINT"pour une fois..."
330 PEN 1:PRINT:PRINT"Allez, on y retourne !"
340 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
350 GOTO 60
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT"Dans la chambre funeraire, au coeur":PRINT"de la pyramide, vous decouvrez un":PRINT"sarcophage en verre, relie a des cables,":LOCATE 1,4:PRINT"eux-meme relies a des machines":PRINT"electroniques !!!"
420 PEN 2:PRINT:PRINT"Vous balayez la piece du regard."
430 PEN 1:PRINT:PRINT"Ambiance glaciale, eclairage facon":PRINT"fin du monde, et ce gros machin au":PRINT"centre..."
440 PEN 3:PRINT:PRINT"Serieusement, qui laisse trainer un":PRINT"cercueil futuriste dans une pyramide":PRINT"vieille de plusieurs millenaires ?"
450 PEN 2:PRINT:PRINT"On dirait un croisement entre":PRINT"Toutankhamon et une prise multiple !"
460 PEN 1:PRINT:PRINT"Pourtant, etrangement, ces lieux vous":PRINT"semblent familiers... comme si vous":PRINT"aviez deja habite ce sarcophage !"
470 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
480 CLS
490 PEN 1:LOCATE 1,4:PRINT"Soudain, une voix synthetique venue":PRINT"d'outre-tombe resonne :"
500 PEN 3:PRINT:PRINT"Bonjour, mon vieil ami."
510 PRINT:PRINT"Je suppose que tes souvenirs et tes":PRINT"pensees doivent etre extremement confus."
520 LOCATE 1,12:PRINT"Assieds-toi et ecoute attentivement, je":PRINT"vais TOUT t'expliquer..."
525 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
527 CLS
530 PEN 3:PRINT:PRINT"Tu n'es pas en 1951."
540 PRINT:PRINT"Tu n'es pas vraiment egyptologue non":PRINT"plus..."
550 PRINT:PRINT"En realite, tu es un scientifique du":PRINT"futur, place en sommeil cryogenique dans":LOCATE 1,9:PRINT"cette pyramide que tu as toi-meme":PRINT"construite avec une equipe scientifique,"
560 LOCATE 1,11:PRINT"afin de proteger un savoir interdit.
570 PRINT:PRINT"Un savoir destructeur que tu as":PRINT"decouvert... et scelle en ces lieux :":PEN 1:PRINT:PRINT"               L'ANUBIS."
580 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
590 CLS
600 PEN 3:LOCATE 3,13:PRINT"Mais reprenons depuis le debut..."
610 LOCATE 15,25:INPUT" ENTER  ",en$
620 RUN"Epilogue.bas"
700 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
710 PEN 3:LOCATE 1,13:PRINT"Etes-vous sur de vouloir faire ca (O/N)?"
720 k$=INKEY$
730 IF UPPER$(k$)="O" THEN GOTO 760
740 IF UPPER$(k$)="N" THEN GOTO 60
750 IF UPPER$(k$)<>"O" OR UPPER$(k$)<>"N" THEN GOTO 720
760 CLS:LOCATE 11,13:PRINT"VRAIMENT sur (O/N) ?"
770 k$=INKEY$
780 IF UPPER$(k$)="O" THEN GOTO 810
790 IF UPPER$(k$)="N" THEN GOTO 60
800 IF UPPER$(k$)<>"O" OR UPPER$(k$)<>"N" THEN GOTO 770
810 CLS:LOCATE 6,13:PRINT"Vraiment, VRAIMENT sur (O/N) ?"
820 k$=INKEY$
830 IF UPPER$(k$)="O" THEN GOTO 860
840 IF UPPER$(k$)="N" THEN GOTO 60
850 IF UPPER$(k$)<>"O" OR UPPER$(k$)<>"N" THEN GOTO 820
860 CLS:LOCATE 1,12:PRINT"Au moment ou vous vous approchez du":PRINT"dispositif, un phenomene se produit..."
870 LOCATE 15,25:INPUT" ENTER  ",en$
880 GOTO 400

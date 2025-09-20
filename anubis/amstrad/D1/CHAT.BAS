10 ' CHAT
20 MODE 1:BORDER 0:P=0
30 FOR i=0 TO 3:INK i,0:NEXT i
40 MEMORY &3FFF
50 LOAD"Chat.cmp"
60 FOR i=0 TO 3:INK i,0:NEXT i
70 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
80 POKE &C7F1,&C9:CALL &C7D0
90 CALL &A60B
100 WINDOW #1,25,36,4,19
110 INK 0,0:INK 1,3:INK 2,15:INK 3,24
120 PEN #1,3:PRINT #1:PRINT #1,"Rue Bastet.":PRINT #1:PRINT #1,"Des maisons":PRINT #1,"s'elevent,":PRINT #1,"et sur"
125 PRINT #1,"leurs":PRINT #1,"toits,":PRINT #1,"des chats":PRINT #1,"egyptiens":PRINT #1,"regnent en":PRINT #1,"pharaons":PRINT #1,"moustachus."
130 LOCATE 13,20:PEN 2:PRINT"QUE FAITES-VOUS ?"
140 PEN 3:LOCATE 4,21:PRINT "1-NORD      2-SUD      3-Examiner"
150 PEN 2:LOCATE 4,22:PRINT "4-S'approcher du chat de gauche" 
160 PEN 3:LOCATE 4,23:PRINT "5-S'approcher du chat de droite"
170 PEN 2:LOCATE 4,24:PRINT "6-Escalader les toits"
200 k$=INKEY$
210 IF k$="1" THEN GOTO 300
220 IF k$="2" THEN RUN"Caire.bas"
230 IF k$="3" THEN GOTO 400
240 IF k$="4" THEN GOTO 700
250 IF k$="5" THEN GOTO 500
260 IF k$="6" THEN GOTO 600
270 IF k$<"1"OR k$>"6" THEN GOTO 200
300 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
310 PEN 3:PRINT:PRINT"Vous essayez d'avancer vers le NORD..."
320 PEN 1:PRINT:PRINT"Mais une horde de chats egyptiens se":PRINT"dresse devant vous, moustaches au":PRINT"garde-a-vous !"
330 PEN 2:PRINT:PRINT"Impossible de passer :":PRINT:PRINT"C'est comme si ces boules de poils":PRINT"gardaient un secret millenaire."
340 PEN 3:PRINT:PRINT"Vous reculez, battu par une armee de":PRINT"ronrons..."
350 PEN 2:PRINT:PRINT"Oui, mais des ronrons qui sonnent comme":PRINT"un ";CHR$(34);"NON";CHR$(34);" ferme et velu, et croyez-moi,":PRINT"c'est plus intimidant qu'une porte":PRINT"en pierre gardee par un sphinx":PRINT"grincheux."
360 LOCATE 5,17:PEN 1:PRINT"NON"
370 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
380 GOTO 60
400 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
410 PEN 3:PRINT:PRINT"Vous examinez la scene."
420 PEN 2:PRINT:PRINT"Une ruelle tordue, des maisons":PRINT"bancales, et sur les toits...":PRINT"des chats egyptiens noirs."
430 PEN 3:PRINT:PRINT"Majestueux, elances, et clairement:":PRINT"plus intelligents que vous."
440 PEN 1:PRINT:PRINT"Ils vous fixent comme si vous veniez":PRINT"de marcher sur leur territoire sacre."
450 PEN 2:PRINT:PRINT"Vous esperiez des indices ?":PRINT"Vous recoltez du mepris felin et":PRINT"une lecon silencieuse :"
460 PEN 1:PRINT:PRINT"     Ici, c'est eux les boss !"
470 PEN 3:PRINT:PRINT"Mais bon, versez du lait et vous aurez":PRINT"paye votre protection. Vous serez":PRINT"alors tolere...":PEN 2:PRINT"       ...jusqu'a la prochaine tournee !"
480 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
490 GOTO 60
500 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
510 PEN 3:PRINT:PRINT"Vous approchez du chat de droite,":PRINT"l'air confiant..."
520 PEN 1:PRINT:PRINT"            Erreur fatale."
530 PEN 2:PRINT:PRINT"La creature vous fixe, l'oeil brillant":PRINT"comme une amulette maudite, puis decide":PRINT"soudain que votre visage est un":PRINT"griffoir."
540 PEN 3:PRINT:PRINT"Le chat saute de son perchoir":PRINT"et en une seconde, vous submerge de":PRINT"coups de griffes, de miaulements":PRINT"furieux et de poils volants."
550 PEN 2:PRINT:PRINT"On racontera plus tard qu'un aventurier":PRINT"inconnu a fini en offrande feline,":PRINT"empaquete dans des poils de chat":PRINT"plutot que dans des bandelettes."
560 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
570 RUN "Mort.bas"
600 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24
610 PEN 3:PRINT:PRINT"Comme tu sembles totalement demuni de":PRINT"bon sens, tu choisis de grimper sur des":PRINT"tuiles instables sous un soleil qui":PRINT"pourrait faire fondre un chameau."
620 PEN 1:PRINT:PRINT"Tu t'agrippes a une gouttiere rouillee,":PRINT"qui proteste bruyamment qu'elle n'a":PRINT"pas signe pour ca.
630 PEN 2:PRINT:PRINT"Ton pied glisse sur une tuile qui,":PRINT"visiblement, avait des projets de":PRINT"retraite anticipee."
640 PEN 3:PRINT:PRINT"Et apres une serie de contorsions":PRINT"dignes d'un ballet tragique, tu te":PRINT"retrouves a la case depart. Tu ne":PRINT"touches pas 20.000 Francs."
650 PEN 2:PRINT:PRINT "Juste un peu de poussiere,":PRINT"beaucoup de regrets, et le regard":PRINT"moqueur d'un pigeon qui t'a vu tomber."
680 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
690 GOTO 60
700 IF PEEK(&7002)=1 THEN GOTO 800
710 IF PEEK(&7002)=0 AND PEEK(&7000)<2 THEN GOTO 900
720 IF PEEK(&7002)=0 AND PEEK(&7000)>=2 THEN GOTO 1100
800 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
810 PEN 3:PRINT:PRINT"Vous vous approchez a nouveau du chat":PRINT"Mais ce dernier semble vous dire :"
820 PEN 2:PRINT:PRINT CHR$(34);"Ah... c'est ENCORE toi !"
830 PEN 1:PRINT:PRINT"Mais regarde-moi bien :":PRINT:PRINT"J'ai le ventre plein, la pelote ne":PRINT"m'amuse plus, et mes griffes sont en":PRINT"RTT."
840 PEN 2:PRINT:PRINT"Tu veux quoi, une medaille ? Un calin ?"
850 PEN 3:PRINT:PRINT"T'as eu la pelote, c'est deja plus":PRINT"que ce que la plupart obtiennent."
860 PEN 2:PRINT:PRINT"Maintenant, circule. Le soleil chauffe":PRINT"mon flanc gauche et j'ai un rendez-vous":PRINT"avec une sieste de niveau olympique.";CHR$(34)
870 PEN 3:LOCATE 15,25:INPUT" ENTER  ",en$
880 GOTO 60  
900 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
910 PEN 3:PRINT:PRINT"Le chat est la. Immobile.":PRINT"Trop immobile..."
920 PEN 1:PRINT:PRINT"Son regard est vide, presque tragique.":PRINT"Son ventre gargouille."
930 PEN 2:PRINT:PRINT"Vous vous approchez, pris d'un elan de":PRINT"compassion. Mais il ne bouge toujours":PRINT"pas."
940 PRINT:PRINT"Pas un clignement. Juste ce regard":PRINT"fixe, accusateur, comme s'il attendait":PRINT"que vous lui offriez un festin royal."
950 PEN 3:PRINT:PRINT"Mais vous n'avez rien...":PRINT"Rien pour le nourrir...":PRINT"Pas meme une croquette perimee..."
960 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
970 GOTO 60
1100 CLS:INK 0,0:INK 1,6:INK 2,15:INK 3,24
1110 PEN 3:PRINT:PRINT"Le chat de gauche vous fixe,":PRINT"le regard profond, presque solennel."
1115 PEN 2:PRINT:PRINT"Il a l'air affame.":PRINT"Son ventre grogne comme un tambour":PRINT"de guerre miniature."
1120 PEN 1:PRINT:PRINT"Ses moustaches fremissent a chaque":PRINT"oscillation de la jarre que vous avez":PRINT"rapportee du souk."
1130 PEN 3:PRINT:PRINT"Il a flaire le lait a l'intrieur, sans":PRINT"l'ombre d'un doute."
1140 PEN 1:LOCATE 1,17:INPUT"  Lui donnez-vous du lait (O/N) ";A$
1150 IF UPPER$(A$)="O" THEN GOTO 1200
1160 IF UPPER$(A$)="N" THEN GOTO 1300
1170 IF UPPER$(A$)<>"O" OR UPPER$(A$)<>"N" THEN GOTO 1140
1200 CLS:PEN 3:PRINT"Le chat hume le lait, l'air digne,":PRINT"presque hautain."
1210 PEN 2:PRINT:PRINT"Vous lui tendez la jarre.":PRINT"Il s'approche, lape avec grace...":PRINT"Et dans un soupir de satisfaction,":PRINT"laisse tomber la pelote de laine":PRINT"qu'il tenait entre ses griffes."
1220 PEN 1:PRINT:PRINT"Vous la ramassez, triomphant."
1230 PEN 3:PRINT:PRINT"Et dans son regard, un eclat malicieux.":PRINT"Ah, si le lait pouvait flatter autant":PRINT"que les mots, vous seriez roi des":PRINT"souks, cher donateur."
1240 PEN 2:PRINT:PRINT"Mais vous avez gagne une pelotte.":PRINT"Et lui son repas. Deux esprits ruses,":PRINT"un echange equitable.":PEN 1:PRINT:PRINT"Morale : tout flatteur obtient pelote,":PRINT"pourvu qu'il ait du lait !"
1250 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
1260 POKE &7002,1:GOTO 60
1300 PEN 2:PRINT:PRINT"Le chat vous regarde, le ventre vide":PRINT"et l'espoir brise. Pas de lait ?":PRINT"Il vous classe dans la categorie :":PEN 1:PRINT "         ";CHR$(34);"humains inutiles";CHR$(34)
1310 PEN 3:LOCATE 15,24:INPUT" ENTER  ",en$
1320 GOTO 60

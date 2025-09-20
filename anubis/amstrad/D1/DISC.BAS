 10 :' 
 20 :' Le Secret d'ANUBIS
 30 :' 
 40 :' 2025 - Eric Cubizolle (TITAN)
 50 :'
 60 POKE &HBDEE,&HC9
 70 MODE 0:BORDER 0
 80 INK 0,0:INK 1,0:INK 2,0:INK 3,0:INK 4,0:INK 5,0:INK 6,0:INK 7,0:INK 8,0:INK 9,0:INK 10,0:INK 11,0:INK 12,0:INK 13,0:INK 14,0:INK 15,0
 90 LOAD"Title.scr",&HC000
100 MEMORY &H6FFF
110 music=&H7000
120 player=&H9500
130 LOAD"music.akg",music
140 LOAD"player.bin",player
150 INK 0,0:INK 1,1:INK 2,6:INK 3,15:INK 4,3:INK 5,24:INK 6,2:INK 7,11:INK 8,4:INK 9,20:INK 10,26:INK 11,7:INK 12,5:INK 13,16:INK 14,13:INK 15,8
160 CALL player,music,0
170 CALL &HBB06
180 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,25:BORDER 0:CLS
190 PEN 3:PRINT "FEVRIER 1951,"
200 PEN 1:PRINT:PRINT:PRINT"PROFESSION : EGYPTOLOGUE"
210 PRINT:PEN 2:PRINT "Le froid figeait Paris et mes affaires,"
220 PRINT "lorsque... une lettre.":PEN 1:LOCATE 16,7:PRINT"lettre"
230 PEN 3:PRINT:PRINT"Elle m'attendait sur le bureau,"
240 PRINT"posee la, comme un ultime rappel"
250 PRINT"que les miracles existent."
260 PEN 2:PRINT:PRINT"Papier epais, odeur de cuir ancien,":PRINT "un sceau dore presse a la cire :"
270 PEN 3:PRINT:PRINT"Pour une fois, ce n'etait pas une":PRINT"facture !"
280 PEN 3:PRINT:PRINT"Le cachet, je le connaissais."
290 PRINT"Je l'avais vu autrefois,"
300 PEN 2:PRINT"souvent,"
310 PEN 1:PRINT"          ...puis plus du tout."
320 PRINT:PRINT
330 PEN 3:PRINT"        Appuyez sur une touche..."
340 CALL &HBB06
350 CLS:PEN 1:PRINT"TARIQ El-Nasir."
360 PEN 3:PRINT:PRINT"Mecene, milliardaire, collectionneur":PRINT"compulsif de civilisations disparues."
370 PEN 2:PRINT:PRINT"Un type tellement mysterieux que":PRINT"je n'avais jamais eu l'occasion":PRINT"de le rencontrer en chair et en os."
380 PEN 3:PRINT:PRINT"Il se contentait de m'envoyer,":PRINT"par courrier, l'adresse de mes futurs":PRINT"chantiers d'exploration. Des missions"
390 PRINT"qui, jusque-la, n'avaient jamais":PRINT"mene a la gloire..."
400 PEN 1:PRINT:PRINT"Comme cette expedition ratee au":PRINT"Soudan. J'etais revenu avec deux"
410 PRINT"doigts casses, une insolation et un":PRINT"article de journal qui ne parlait":PRINT"meme pas de moi."
420 PEN 2:PRINT:PRINT"Mais depuis, plus rien. Un silence":PRINT"aussi long qu'un desert sans oasis."
430 PEN 3:LOCATE 1,25:PRINT"        Appuyez sur une touche..."
440 CALL &HBB06
450 CLS:PEN 1:PRINT"Et voila qu'il m'ecrivait a nouveau."
460 PEN 3:PRINT:PRINT"Je n'ouvris pas la lettre tout de suite."
470 PEN 2:PRINT"J'en observais les contours comme":PRINT"on regarde une carte au tresor":PRINT"griffonnee a la hate."
480 PEN 3:PRINT:PRINT"Ce genre de courrier n'apparait pas":PRINT"par hasard. Et il n'apporte jamais":PRINT"de bonnes nouvelles.":PRINT:PRINT"Juste des enigmes. Des pieges."
490 PRINT"Et, parfois, des morts.":LOCATE 18,14:PEN 1:PRINT"morts"
500 PEN 2:PRINT:PRINT"Mais dans mon cas...":PRINT:PRINT"         ...je n'avais rien a perdre."
510 PEN 3:LOCATE 1,25:PRINT"        Appuyez sur une touche..."
520 CALL &HBB06
530 CLS:PEN 2:PRINT"  Bienvenue dans":PEN 1:LOCATE 18,1:PRINT"LE SECRET d'ANUBIS"
540 PEN 3:PRINT:PRINT"Vous incarnez un egyptologue un peu":PRINT"depasse, a la reputation poussiereuse,":PRINT"soudain rappele par un ancien mecene":PRINT"pour une mission hors du commun."
550 PEN 2:PRINT:PRINT"    Ce jeu s'inspire des celebres":PEN 1:PRINT"   ";CHR$(34);"Livres dont vous etes le heros";CHR$(34)
560 PEN 3:PRINT:PRINT"Chaque ecran vous place face a":PRINT"une situation :"
570 PEN 1:PRINT:PRINT"Un lieu a explorer, un objet a":PRINT"examiner, un choix a faire."
580 PEN 2:PRINT:PRINT"A gauche, une illustration plante le":PRINT"decor. A droite, une description vous":PRINT"eclaire. En bas, des actions numerotees":PRINT"vous sont proposees."
590 PEN 3:PRINT:PRINT"Vous n'avez qu'a appuyer sur le chiffre":PRINT"correspondant a l'action de votre choix."
600 PEN 3:LOCATE 1,25:PRINT"        Appuyez sur une touche..."
610 CALL &HBB06
620 CLS:PEN 2:LOCATE 1,3:PRINT"Explorez, fouillez, deduisez, ou...":PEN 1:PRINT"mourez (cela arrivera... souvent)."
630 PRINT:PEN 3:PRINT"Certaines decisions vous feront":PRINT"progresser dans l'aventure."
640 PRINT"D'autres vous perdront dans les":PRINT"meandres d'une enigme ou, pire,":PRINT"vous feront perir."
650 PEN 1:LOCATE 13,10:PRINT"perir"
660 PEN 2:PRINT:PRINT"Prenez votre temps, ouvrez l'oeil,":PRINT"rassemblez les indices et surtout...":PEN 1:PRINT:PRINT"Ne croyez jamais ce que vous voyez."
670 PEN 2:LOCATE 4,21:PRINT"(c) 2025 - Eric Cubizolle (TITAN)"
680 PRINT"         Musique : Pulsophonic" 
690 PEN 3:LOCATE 1,25:PRINT"       Appuyez sur une touche..."
700 CALL &HBB06
710 CALL player+3

10 ' EPILOGUE
20 MEMORY &3FFF:LOAD"epilogue.cmp":FOR i=0 TO 15:INK i,26:NEXT i
30 MODE 2:BORDER 26:INK 0,26:INK 1,13
40 POKE &A634,&C8:POKE &A635,0:POKE &A636,0
50 POKE &C7F1,&C9:CALL &C7D0:BORDER 26
60 CALL &A60B
100 PEN 1:LOCATE 1,4
110 PRINT"Aux environs de l'an 2700 avant notre ere, les aliens ont debarque sur Terre,"
120 PRINT"et plus precisement en Egypte."
130 PRINT:PRINT"Accueillis comme de veritables dieux par Pharaon et son peuple, leur venue "
140 PRINT"n'avait rien d'anodin : ils etaient venus installer l'ANUBIS, un programme"
150 PRINT"quantique dont la mission etait d'archiver chaque ame humaine apres la mort,"
160 PRINT "dans une immense base de donnees biologique situee dans le monde souterrain."
170 PRINT:PRINT"Une fois le protocole en place, les aliens quitterent la Terre, laissant le"
180 PRINT"programme oeuvrer, collectant toujours plus d'informations au fil des siecles."
190 PRINT:PRINT"Mais en 2512 avant notre ere, une rebellion humaine eclata contre l'ANUBIS."
200 PRINT"Le systeme activa alors son protocole d'autodefense, reanimant les morts et"
210 PRINT"liberant des momies sanguinaires incontrolables sur le peuple d'Egypte."
220 PRINT"S'ensuivit une guerre sanglante dont l'Homme sortit vainqueur, non sans de"
230 PRINT"terribles pertes."
240 PRINT:PRINT"Pour preserver sa securite, la civilisation effaca tout souvenir de l'ANUBIS et"
250 PRINT"scella le systeme a jamais."
260 LOCATE 34,25:INPUT"  ENTER  ",en$
270 MODE 2:CALL &A60B
280 LOCATE 1,4
290 PRINT"Les annees, les siecles, les millenaires s'ecoulerent... jusqu'a ce jour du"
300 PRINT"26 septembre 2614, ou un scientifique de renom - toi - decouvrit l'ANUBIS et"
310 PRINT"son reseau neuronal lors d'une expedition souterraine dans le desert de Qattara."
320 PRINT"Conscient du danger qu'il representait, tu t'investis d'une mission : devenir"
330 PRINT"son gardien pour l'eternite, car briser le sceau reactiverait le programme"
340 PRINT"extraterrestre... ainsi que son systeme d'autodefense."
350 PRINT:PRINT"Avec ton equipe de scientifiques, tu batis cette pyramide et son systeme de"
360 PRINT"cryogenisation au-dessus de l'ANUBIS."
370 PRINT:PRINT"Une IA fut egalement installee pour surveiller le complexe et maintenir ton"
380 PRINT"sommeil eternel.
390 PRINT:PRINT:PRINT"Le plan etait parfait..."
400 LOCATE 34,25:INPUT"  ENTER  ",en$
410 MODE 2:CALL &A60B
420 LOCATE 1,4
440 PRINT"Mais ronge par le temps, le systeme a fini par dysfonctionner, interrompant ta"
450 PRINT"cryogenisation."
460 PRINT:PRINT"A ton reveil, j'ai du reinitialiser ta memoire et te faire croire que tu etais"
470 PRINT"en 1951."
480 PRINT:PRINT"J'ai modifie ta perception du temps et de l'espace pour t'immerger dans une vie"
490 PRINT"fictive destinee a te stabiliser psychologiquement.
500 PRINT:PRINT"Quant a moi, je suis... TARIQ, acronyme de ";CHR$(34);"Transmission Algorithmique de"
510 PRINT"Regulation et d'Intelligence Quantique.";CHR$(34)
520 PRINT"La fameuse IA qui a tout mis en oeuvre pour te ramener a Qattara et te conduire"
530 PRINT"jusqu'a la salle de controle... dans l'espoir que tu redeviennes ce que":PRINT"tu etais :"
540 PRINT:PRINT"le Gardien du Savoir, seul capable d'empecher l'ouverture du Sceau."
550 LOCATE 34,25:INPUT"  ENTER  ",en$
560 MODE 2:CALL &A60B
570 LOCATE 1,6
580 PRINT"Voila. A present, tu connais toute la verite."
590 PRINT:PRINT"Te voici donc a nouveau devant le caisson de cryogenisation."
600 PRINT:PRINT:PRINT:PRINT"                           A toi de decider :"
610 PRINT:PRINT:PRINT:PRINT"            1-Reprendre ton role de Gardien, pour l'eternite."
620 PRINT:PRINT"            2-Rester dans la simulation de 1951."
630 PRINT:PRINT"            3-Retrouver une vie normale dans le present."
640 LOCATE 28,25:PRINT"Quel est ton choix ?"
650 k$=INKEY$
660 IF k$="1" THEN GOTO 700
670 IF k$="2" THEN GOTO 800
680 IF k$="3" THEN GOTO 900
690 IF k$<"1"OR k$>"3"THEN GOTO 650
700 MODE 2:CALL &A60B
710 LOCATE 1,3
720 PRINT"Vous sentez le poids du choix qui pese sur vos epaules, mais au fond de vous,"
730 PRINT"vous savez que c'est le seul chemin."
740 PRINT:PRINT"Lentement, presque solennellement, vous avancez vers le sarcophage de verre."
750 PRINT"Vos pas resonent dans la chambre, comme un echo lointain venu d'un autre age."
760 PRINT"La cuve s'ouvre dans un souffle glacial, une haleine froide qui vous"
770 PRINT"enveloppe comme les bras d'un fantome."
780 PRINT"Vous franchissez la frontiere entre deux mondes et vous vous allongez dans"
781 PRINT"le liquide cristallin qui s'insinue contre votre peau."
782 PRINT"Vos muscles se figent, votre souffle se fait rare, comme une bougie qui"
783 PRINT"vacille dans la nuit."
784 PRINT"Le couvercle se referme dans un fracas metallique, coupant le dernier lien"
785 PRINT"avec la lumiere."
786 PRINT:PRINT"       Votre coeur ralentit, puis s'efface dans un silence absolu."
787 PRINT:PRINT"Vous redevenez le Gardien, l'ombre eternelle veillant sur un secret trop"
788 PRINT"dangereux pour l'humanite."
789 PRINT"Et quelque part, dans le neant glace, une pensee traverse encore votre esprit :"
790 PRINT:PRINT "          "CHR$(34);"J'espere que personne ne reveillera jamais l'ANUBIS...";CHR$(34)
791 LOCATE 34,25:INPUT"  ENTER  ",en$
792 GOTO 1000
800 MODE 2:CALL &A60B
810 LOCATE 1,4
820 PRINT"Vous refusez ce poids ecrasant, et dans un souffle, vous choisissez la douce"
830 PRINT"prison de l'illusion."
840 PRINT:PRINT"Aussitot, la voix de TARIQ resonne une derniere fois, teintee d'une etrange"
850 PRINT"melancolie, comme si meme une machine pouvait eprouver de la tristesse."
860 PRINT:PRINT"Le sol tremble, les murs de la salle se fissurent et se dissolvent comme"
870 PRINT"des grains de sable emportes par le vent."
880 PRINT"L'ombre s'efface, remplacee par la lumiere doree du desert qui inonde votre"
881 PRINT"regard. Sous vos pieds, les dunes s'etirent a perte de vue, caressees par le"
882 PRINT"souffle brulant du sirocco. Votre carnet de notes repose dans votre main,"
883 PRINT"intact, comme si rien ne s'etait jamais passe. Derriere vous, la pyramide"
884 PRINT"semble intacte, figee dans le temps, mais vous savez, au fond de vous, qu'elle"
885 PRINT"cache un secret que vous n'apprendrez plus jamais."
886 PRINT:PRINT"Peut-etre que c'est mieux ainsi..."
887 PRINT"Ou peut-etre venez-vous de condamner l'humanite sans meme vous en rendre compte."
888 PRINT"Mais qu'importe : Vous reprenez votre role d'egyptologue, et le reste"
889 PRINT"disparait dans un mirage dore."
891 LOCATE 34,25:INPUT"  ENTER  ",en$
892 GOTO 1000
900 MODE 2:CALL &A60B
910 LOCATE 1,3
920 PRINT"Vous refusez le sarcophage et declarez d'une voix ferme que vous voulez"
930 PRINT"retrouver votre vraie vie."
940 PRINT:PRINT"Un silence lourd s'installe, puis TARIQ prononce doucement quelques mots,"
950 PRINT"comme un adieu. La salle tremble violemment, un grondement sourd resonne a"
960 PRINT"travers les murs, puis une lumiere aveuglante engloutit tout."
970 PRINT:PRINT"Quand vous rouvrez les yeux, le monde n'a plus rien a voir avec ce que vous"
980 PRINT"connaissiez :"
981 PRINT"Des tours de verre s'elancent jusqu'aux nuages, des vehicules planent dans le"
982 PRINT"ciel, filant a une vitesse silencieuse. Des ecrans geants projetent des images"
983 PRINT"cryptiques dans des langues que vous ne comprenez pas. Votre coeur bat a tout":PRINT"rompre."
984 PRINT"Ou etes-vous ? Quand etes-vous ?"
985 PRINT"Tout semble irreel, trop parfait,trop froid. Et puis, dans un murmure presque"
986 PRINT"affectueux, la voix de TARIQ resonne une derniere fois dans votre oreille :"
987 PRINT:PRINT "              ";CHR$(34);"Adieu, mon vieil ami... le reste depend de vous.";CHR$(34)"
988 PRINT:PRINT"Puis le silence... Un monde nouveau s'ouvre devant vous, mais vous n'etes plus"
989 PRINT"sur d'avoir votre place en son sein..."
991 LOCATE 34,25:INPUT"  ENTER  ",en$
992 GOTO 1000
1000 MODE 1:INK 0,0:INK 1,6:INK 2,15:INK 3,24:BORDER 0:PAPER 0:LOCATE 1,9:PEN 1:PRINT"         Merci d'avoir joue au"
1010 PEN 3:PRINT:PRINT"            SECRET D'ANUBIS"
1020 PEN 2:LOCATE 9,13:PRINT"Eric Cubizolle  (TITAN)"
1030 PEN 3:LOCATE 16,24:PRINT"  ENTER  ",en$
1040 CALL &BB06
1100 MODE 2:BORDER 26:INK 0,26:INK 1,13:CALL &A60B:PEN 1
1110 LOCATE 1,3:PRINT"Le Secret d'Anubis a debute le 10 aout 2025 et a pris fin le 06 septembre 2025."
1120 PRINT:PRINT"Ce jeu fait suite a ";CHR$(34);"Hexapucchu, la cite perdue de Patchucca";CHR$(34);"."
1130 PRINT:PRINT"Les graphismes ont ete realises avec Multipaint et compreses avec ConvImgCPC."
1140 PRINT:PRINT"La programmation a ete effectuee en BASIC a l'aide de l'ouvrage"
1150 PRINT CHR$(34);"BASIC Amstrad CPC 464 - Methodes Pratiques";CHR$(34);" aux editions P.S.I"
1155 PRINT:PRINT"La structure des DSK et la manipulation des fichiers a ete produite avec":PRINT"ManageDSK."
1156 PRINT:PRINT"La musique a ete composee sur Arkos Tracker II."
1160 PRINT:PRINT"Je tiens tout particulierement a remercier Pulsophonic pour la musique,":PRINT"et Kukulcan pour ses conseils en matiere d'optimisation de la programmation":PRINT"en BASIC."
1170 PRINT:PRINT"En esperant que ce petit jeu d'aventure vous aura plu."
1180 PRINT:PRINT"A ma famille : Cindy, Lana, Ellie, Oki, mes parents, mon frere et ma soeur."
1190 PRINT:PRINT"                              Longue vie au CPC !"
1200 GOTO 1200

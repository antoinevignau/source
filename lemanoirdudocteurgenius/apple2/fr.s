*
* Le manoir du Dr Genius
*
* (c) 1983, Loriciels (Oric)
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	lst	off

* Les caractères en standard : @ { } ] ! (pipe)
* Les caractères en français : à é è ç ù
* Les équivalents en ASCII   : C0 FB FD DC FC

*-----------------------------------
* LES CHAINES
*-----------------------------------

strVOUSDETENEZ
	asc	8D"Vous detenez : "00
strVOUSRIEN
	asc	8D"Vous ne detenez absolument rien !!!"00
strPOINT
	asc	"."00
	
strEVIDENT
	asc	8D"Il parait evident que vous ne pouvez"8D
	asc	"pas porter tant de choses !!"00
strVOUSLAVEZ
	asc	8D"Vous l"A7"avez deja. Voues etes etourdi"8D
	asc	"et dans cette maison, ce n"A7"est pas"00
strCONSEILLE
	asc	8D"tres conseille"00
	
strNOTOWNED
	asc	8D"Comment voulez-vous poser ce que vous"8D
	asc	"n"A7"avez pas ?"00

strDACCORD
	asc	8D"D"A7"accord"00
	
*-----------------------------------
* 4000 - LES REPONSES
*-----------------------------------

str4000	asc	"Vous avez garde la lampe trop longtemps"8D
	asc	"allumee, elle a explose"00

str4010	asc	"Vous aviez oublie de fermer le robinet,"8D
	asc	"vous mourez sous des tonnes d"A7"eau"00

str4020	asc	"La porte vient de se refermer derriere"8D
	asc	"vous, vous voila prisonnier..."00

str4030	asc	"Vous avez trebuche dans l"A7"escalier, vous"
	asc	"vous empalez sur le couteau !"00

str4040	asc	"Vous renversez l"A7"eau dans l"A7"escalier,"8D
	asc	"ce qui provoque une decharge de la"00
str4042	asc	8D"prise electrique"00

str4050	asc	"Vous etes sauf grace a la combinaison"8D
	asc	"que vous avez enfilee...!"00

str4060	asc	"Vous mourez electrocute..."00

str4070	asc	"La piece etait pleine de gaz explosif,"8D
	asc	"vous auriez du eteindre..."00
str4072	asc	8D"On ramassera vos morceaux un autre"8D
	asc	"jour...!"00

str4080	asc	"Vous mourez empale sur des lances"8D
	asc	"sorties du murs... !"00

str4090	asc	"La porte ne s"A7"ouvre pas de cette piece"00

str4100	asc	"La lampe et le briquet refusent de"8D
	asc	"marcher dans cette piece"00

str4110	asc	"Vous tombes dans une trappe, vous vous"8D
	asc	"disloquez en arrivant au sol..."00

str4120	asc	"Vous avez raison de passer, car ce"8D
	asc	"monstre n"A7"etait qu"A7"une projection"00
str4124	asc	8D"en 3 dimension sur un ecran de fumee"00

str4130	asc	"Vous avez raison, la curiosite est un"8D
	asc	"vilain defaut"00
str4133	asc	8D"            Au revoir"00

str4140	asc	"Vous avez raison d"A7"attendre, mais cela"
	asc	"ne pourra pas durer eternellement..."00

str4150	asc	"Vous avez de la chance car ce coffre"8D
	asc	"etait ouvert."00
str4152	asc	8D"Un message a l"A7"interieur dit : ne"8D
	asc	"respectez pas les couleurs du code de la"8D
	asc	"route...?"00
str4156	asc	8D"Tiens le coffre se referme"00

str4160	asc	"Maintenant, vous avez une lampe pleine"8D
	asc	"de petrole"00

str4170	asc	"Vous n"A7"avez rien pour transporter le"8D
	asc	"petrole"00

str4180	asc	"Le briquet que vous aviez laisse allume"8D
	asc	"vient d"A7"exploser"00
str4185	asc	8D"Ca tue l"A7"etourderie..."00

str4190	asc	"A force de marcher en long et en large"8D
	asc	"dans cette maison,"00
str4195	asc	8D"vous sombrez dans un coma des plus"8D
	asc	"mortels..."00

str4200	asc	"L"A7"eau coule..."00

str4210	asc	"Vous avez les pieds trempes et cela vous"
	asc	"rend tres malade..."00
str4215	asc	8D"Vous mourez d"A7"une triple pneumonie...!"00

str4220	asc	"Le titre est : "00
str4225	asc	8D"La mot a la premiere page."00

str4230	asc	"Le livre a explose lorsque vous l"A7"avez"8D
	asc	"ouvert..."00

str4240	asc	"Le papier indique : cherchez la clef."00

str4250	asc	"La clef vous permettra de trouver le"8D
	asc	"code de la porte d"A7"entree."00

str4260	asc	"Il y a, a cote de la porte, un clavier"8D
	asc	"numerique permettant d"A7"entrer un code"00

str4270	asc	"Pour quoi faire...?"00

str4280	asc	8D"Il y a une odeur de gaz."00

str4290	asc	"Apparemment, Il n"A7"y a aucune odeur"8D
	asc	"mais..."00

str4300	asc	"C"A7"est deja fait, espece de rigolo"00

str4310	asc	"Il faudrait peut-etre du feu"00

str4320	asc	"La lampe ne contient pas de petrole"00

str4330	asc	"Vous ne l"A7"avez pas"00

str4340	asc	"Le briquet est encore allume et il"8D
	asc	"eclaire la piece."00
	
str4350	asc	"La torche etait piegee, elle vous"8D
	asc	"explose dans les mains..."00
	
str4360	asc	"La lampe est encore allumee et elle vous"
	asc	"eclaire"00

str4370	asc	"Un nain vient de vous lancer un poignard"
	asc	"en plein coeur..."00
	
str4380	asc	"Un nain vient de se precipiter sur vous,"
	asc	"il s"A7"empale sur votre ciseau"00

str4390	asc	"Un nain vient de se precipiter sur vous,"
	asc	"il s"A7"empale sur votre couteau"00

str4400	asc	"Vous venez de renverser le pot"00

str4410	asc	"La foudra vient de tomber sur la maison"00
str4412	asc	8D"La maison n"A7"existe plus, vous non plus"00

str4420	asc	"A force de marcher dans le noir, vous"8D
	asc	"avez trebuche"00
str4425	asc	8D"Vous mourez d"A7"une fracture du crane"00

str4430	asc	"Vous ne pouvez pas travailler dans le"8D
	asc	"noir..."00

str4440	asc	"La lumiere du briquet ne suffit pas"8D
	asc	"pour travailler..."00

str4450	asc	"Impossible !"8D00

str4460	asc	"Vous n"A7"avez aucun outil..."

str4470	asc	"Le teleporteur est en panne, les boutons"
	asc	"ne fonctionnent pas."00

str4480	asc	"Le teleporteur vient d"A7"exploser, vous"8D
	asc	"etes decompose... !"00
	
str4490	asc	"Le teleporteur se met en marche, vous"8D
	asc	"disparaissez"00
	
str4500	asc	"Vous prenez du 30000 Volts dans les"8D
	asc	"doigts"00

str4510	asc	"Le placard est ferme a clef"00

str4520	asc	"L"A7"horrible monstre sorti du placard"8D
	asc	"vient de vous devorer"00

str4530	asc	"Il ne fallait pas fuir"00

str4540	asc	"Vous avez raison d"A7"utiliser le ciseau,"8D
	asc	"le monstre est mort"00

str4550	asc	"A l"A7"interieur du placard, le No "00
str4552	asc	8D" est inscrit"00
str4555	asc	8D"Le placard se referme."00

str4560	asc	"Le pistolet a explose"00

str4570	asc	"Le clavier numerique a explose"00

str4580	asc	"Le clavier numerique prend feu,"8D
	asc	"heureusement, vous aviez "00
str4582	asc	"un pot plein"00
str4585	asc	8D"d"A7"eau qui vous permet d"A7"eteindre le feu"00

str4590	asc	8D"No de code ? "00

strCODEEXACT
	asc	"Le code est exact... La porte s"A7"ouvre..."00
strENDEHORS
	asc	8D"Vous voila en dehors de la maison..."

str4610	asc	"A l"A7"interieur du placard, il y a un mot"8D
	asc	"qui parle d"A7"un teleporteur"00
str4615	asc	8D"Tiens le placard se ferme tout seul..."00

str4620	asc	"Avant de la poser a terre, il faudrait"8D
	asc	"peut-etre l"A7"enlever"00

str4630	asc	"Il y a un horrible monstre devant vous"8D
	asc	"qui est sorti du placard."00

str4640	asc	"Le placard etait piege, vous n"A7"auriez"8D
	asc	"pas du l"A7"ouvrir"00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

strVOUS	asc	8D"Vous etes "00
str7000	asc	"devant le manoir du defunt"00
str7001	asc	8D"            Dr Genius"00
str7010	asc	"dans le hall d"A7"entree"00
str7020	asc	"en bas de l"A7"escalier menant au2e etage"00
str7030	asc	"dans la salle a manger"00
str7040	asc	"dans une bibliotheque sans livre...!"00
str7050	asc	"dans une buanderie"00
str7060	asc	"dans le salon"00
str7070	asc	"dans une chambre"00
str7080	asc	"dans un corridor"00
str7090	asc	"dans une salle d"A7"attente"00
str7100	asc	"dans le vestibule"00
str7110	asc	"dans la chambre d"A7"amis"00
str7120	asc	"dans une chambre"00
str7130	asc	""00	; nada
str7140	asc	"dans une petite salle"00
str7150	asc	"dans le laboratoire du"00	; + :7001
str7160	asc	"dans une petite piece vide"00
str7170	asc	"! justement, vous ne savez pasou vous etes"00
str7180	asc	"en haut de l"A7"escalier"00
str7190	asc	"dans la salle de bains"00
str7200	asc	"dans le living room"00
str7210	asc	"dans une piece enfumee"00
str7220	asc	"dans une grande piece"00
str7230	asc	"dans une piece de rangement"00
str7240	asc	"dans le dressing"00

strREPLAY	asc	8D"Voulez-vous rejouer ? "00
	
strGAGNE	asc	"Cela est exceptionnel. Vous etes le "8D8D
	asc	"premier a etre sorti vivant de cette"8D8D
	asc	"maison, mais si j"A7"etais vous, je me "8D8D
	asc	"mettrais a courir car un nain rode"8D8D
	asc	"peut-etre dans les parages..."00
	
*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

strINSTR	asc	8D"La liste des instructions ? "00

strINSTR2	asc	8D8D
	asc	"Vous voici arrive dans le manoir du"8D
	asc	"            Dr Genius..."8D
	asc	8D
	asc	"Pour converser avec l"A7"ordinateur, il"8D
	asc	"faut rentrer les ordres en 1 ou 2 mots"8D
	asc	"tels que :"8D
	asc	"           NORD"8D
	asc	"           PRENDS PILULE"8D
	asc	8D
	asc	"ou pour commencer :"8D
	asc	"           ENTRE"8D
	asc	8D8D
	asc	"Si vous voulez faire durer la phrase"8D
	asc	"décrivant la salle, tapez une touche"8D
	asc	8D
	asc	"Un dernier conseil : il peut parfois y"8D
	asc	"avoir une porte derriere vous. "00

*-----------------------------------
* 51000 - DISCLAIMER
*-----------------------------------

strDISCLAIMER
	asc	"L"A7"utilisation de ce programme"8D8D
	asc	"deconseillee aux personnes sensibles,"8D8D
	asc	"aux enfants en bas age, ainsi qu"A7"a"8D8D
	asc	"tout personne susceptible d"A7"avoir"8D8D
	asc	"des malaises cardiaques."8D8D
	asc	8D8D
	asc	"Nous ne pourrions etre tenus responsa-"8D8D
	asc	"-bles des troubles physiques ou mentaux"8D8D
	asc	"provoques par votre echec dans"8D8D
	asc	"le manoir du Dr Genius ............."00
	
*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

strLORICIELS
	asc	"LORICIELS est fier de presenter :"00

strLEMANOIR
	asc	"   @   @@@   @   @ @@@ @  @ @@@ @ @@@"8D
	asc	"   @   @     @@ @@ @ @ @@ @ @ @ @ @ @"8D
	asc	"   @   @@    @ @ @ @@@ @@@@ @ @ @ @@@"8D
	asc	"   @   @     @   @ @ @ @ @@ @ @ @ @@"8D
	asc	"   @@@ @@@   @   @ @ @ @  @ @@@ @ @ @"8D
	asc	8D
	asc	"      @@  @ @     @@"8D
	asc	"      @ @ @ @     @ @ @"8D
	asc	"      @ @ @ @     @ @ @@"8D
	asc	"      @ @ @ @     @ @ @ @"8D
	asc	"      @@@ @@@     @@@ @"8D
	asc	8D8D
	asc	"   @@@@  @@@@  @@  @  @  @  @  @@@@"8D
	asc	"   @  @  @     @@  @  @  @  @  @"8D
	asc	"   @     @     @@@ @  @  @  @  @"8D
	asc	"   @     @@@   @ @ @  @  @  @  @@@@"8D
	asc	"   @ @@  @     @ @@@  @  @  @     @"8D
	asc	"   @  @  @     @  @@  @  @  @     @"8D
	asc	"   @@@@  @@@@  @  @@  @  @@@@  @@@@ @ @"00

strINTRO1	asc	"     Version Apple II par     "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"        Merci Fred_72         "00
strINTRO4	asc	"(C) 1983, L. BENES & LORICIELS"00
	
*-----------------------------------
* VOCABULAIRE
*-----------------------------------

V$1	str	"N"
V$2	str	"NORD"
V$3	str	"S"
V$4	str	"SUD"
V$5	str	"E"
V$6	str	"EST"
V$7	str	"O"
V$8	str	"OUEST"
V$9	str	"MONT"
V$10	str	"GRIM"
V$11	str	"DESC"
V$12	str	"PREN"
V$13	str	"RAMA"
V$14	str	"POSE"
V$15	str	"OUVR"
V$16	str	"FERM"
V$17	str	"ENTR"
V$18	str	"AVAN"
V$19	str	"ALLU"
V$20	str	"ETEI"
V$21	str	"REPA"
V$22	str	"DEPA"
V$23	str	"LIS"
V$24	str	"REGA"
V$25	str	"RETO"
V$26	str	"RENI"
V$27	str	"SENS"
V$28	str	"REMP"
V$29	str	"VIDE"
V$30	str	"INVE"
V$31	str	"LIST"
V$32	str	"RIEN"
V$33	str	"ATTE"
V$34	str	"POIG"
V$35	str	"COUT"
V$36	str	"TOUR"
V$37	str	"LAMP"
V$38	str	"CODE"
V$39	str	"ESCA"
V$40	str	"PIST"
V$41	str	"PLAC"
V$42	str	"TORC"
V$43	str	"TELE"
V$44	str	"MONS"
V$45	str	"PETR"
V$46	str	"POT"
V$47	str	"LIT"
V$48	str	"CLEF"
V$49	str	"PAPI"
V$50	str	"LIVR"
V$51	str	"BRIQ"
V$52	str	"COMB"
V$53	str	"COFF"
V$54	str	"ROUG"
V$55	str	"BLEU"
V$56	str	"VERT"
V$57	str	"TITR"
V$58	str	"ROBI"
V$59	str	"CISE"
V$60	str	"PORT"
V$61	str	"ACTI"
V$62	str	"JETE"
V$63	str	"LANCE"
V$64	str	"EAU"
V$65	str	"ENFI"
V$66	str	"PASS"
V$67	str	"APPU"
V$68	str	"ENFO"
V$69	str	"ENLE"
V$70	str	"RENT"
V$71	str	"TEMPO"	; Apple II
V$72	str	"QUITTER"	; Apple II
V$73	str	"CASSE"	; Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"une torche electrique"00
O$2	asc	"un robinet"00
O$3	asc	"un ciseau"00
O$4	asc	"un tournevis"00
O$5	asc	"une lampe a petrole"00
O$6	asc	"une lampe pleine"00
O$7	asc	"une lampe allumee"00
O$8	asc	"un couteau"00
O$9	asc	"un papier"00
O$10	asc	"un livre"00
O$11	asc	"du petrole dans un lavabo bouche"00
O$12	asc	"une clef"00
O$13	asc	"un bouton rouge"00
O$14	asc	"un bouton bleu"00
O$15	asc	"un bouton vert"00
O$16	asc	"un teleporteur"00
O$17	asc	"un teleporteur repare"00
O$18	asc	"une combinaison argentee"00
O$19	asc	"une combinaison enfilee"00
O$20	asc	"un monstre a l"A7"est"00
O$21	asc	"un pistolet"00
O$22	asc	"un briquet"00
O$23	asc	"un briquet allume"00
O$24	asc	"un pot"00
O$25	asc	"un pot plein d"A7"eau"00

*-----------------------------------
* STRINGS
*-----------------------------------

strILFAITNOIR
	asc	"Il fait noir comme dans un four, il"8D
	asc	"faudrait peut-etre allumer"00

strILYA	asc	8D"Il y a dans la salle :"00
strCOMMA	asc	","00
strSPACE	asc	" "00
strRETURN	asc	8D00

strCOMMANDE
	asc	8D"Que faites-vous ? "00

strJENECOMPRENDS
	asc	8D"Je ne comprends pas..."00
	
strIMPOSSIBLE
	asc	8D"Impossible "00
strCECHEMIN
	asc	"de prendre ce chemin"00
strEXCLAM
	asc	" !"00
	

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

str4000	asc	"VOUS AVEZ GARDE LA LAMPE TROP LONGTEMPS"8D
	asc	"ALLUMEE, ELLE A EXPLOSE"00

str4010	asc	"VOUS AVEZ OUBLIE DE FERMER LE ROBINET"8D
	asc	"VOUS MOUREZ SOUS DES TONNES D"A7"EAU"00

str4020	asc	"LA PORTE VIENT DE SE REFERMER DERRIERE"8D
	asc	"VOUS, VOUS VOILA PRISONNIER..."00

str4030	asc	"VOUS AVEZ TREBUCHE DANS L"A7"ESCALIER, VOUS"
	asc	"VOUS EMPALEZ SUR LE COUTEAU !"00

str4040	asc	"VOUS RENVERSEZ L"A7"EAU DANS L"A7"ESCALIER,"8D
	asc	"CE QUI PROVOQUE UNE DECHARGE DE LA"00
str4042	asc	8D"PRISE ELECTRIQUE"00

str4050	asc	"VOUS ETES SAUF GRACE A LA COMBINAISON"8D
	asc	"QUE VOUS AVEZ ENFILEE...!"00

str4060	asc	"VOUS MOUREZ ELECTROCUTE..."00

str4070	asc	"LA PIECE ETAIT PLEINE DE GAZ EXPLOSIF,"8D
	asc	"VOUS AURIEZ DU ETEINDRE..."00
str4072	asc	8D"ON RAMASSERA VOS MORCEAUX UN AUTRE"8D
	asc	"JOUR...!"00

str4080	asc	"VOUS MOUREZ EMPALE SUR DES LANCES"8D
	asc	"SORTIES DU MUR... !"00

str4090	asc	"LA PORTE NE S"A7"OUVRE PAS DE CETTE PIECE"00

str4100	asc	"LA LAMPE ET LE BRIQUET REFUSENT DE"8D
	asc	"MARCHER DANS CETTE PIECE"00

str4110	asc	"VOUS TOMBEZ DANS UNE TRAPPE, VOUS VOUS"8D
	asc	"DISLOQUEZ EN ARRIVANT AU SOL..."00

str4120	asc	"VOUS AVEZ RAISON DE PASSER, CAR CE"8D
	asc	"MONSTRE N"A7"ETAIT QU"A7"UNE PROJECTION"00
str4124	asc	8D"EN 3 DIMENSIONS SUR UN ECRAN DE FUMEE"00

str4130	asc	"VOUS AVEZ RAISON, LA CURIOSITE EST UN"8D
	asc	"VILAIN DEFAUT"00
str4133	asc	8D"            AU REVOIR"00

str4140	asc	"VOUS AVEZ RAISON D"A7"ATTENDRE, MAIS CELA"
	asc	"NE POURRA PAS DURER ETERNELLEMENT..."00

str4150	asc	"VOUS AVEZ DE LA CHANCE CAR CE COFFRE"8D
	asc	"ETAIT OUVERT."00
str4152	asc	8D"UN MESSAGE A L"A7"INTERIEUR DIT : NE"8D
	asc	"RESPECTEZ PAS LES COULEURS DU CODE DE LA"8D
	asc	"ROUTE...?"00
str4156	asc	8D"TIENS LE COFFRE SE REFERME"00

str4160	asc	"MAINTENANT, VOUS AVEZ UNE LAMPE PLEINE"8D
	asc	"DE PETROLE"00

str4170	asc	"VOUS N"A7"AVEZ RIEN POUR TRANSPORTER LE"8D
	asc	"PETROLE"00

str4180	asc	"LE BRIQUET QUE VOUS AVIEZ LAISSE ALLUME"8D
	asc	"VIENT D"A7"EXPLOSER"00
str4185	asc	8D"CA TUE L"A7"ETOURDIE..."00

str4190	asc	"A FORCE DE MARCHER EN LONG ET EN LARGE"8D
	asc	"dans CETTE MAISON,"00
str4195	asc	8D"VOUS SOMBREZ DANS UN COMA DES PLUS"8D
	asc	"MORTELS..."00

str4200	asc	"L"A7"EAU COULE..."00

str4210	asc	"VOUS AVEZ LES PIEDS TREMPES ET CELA VOUS"
	asc	"REND TRES MALADE..."00
str4215	asc	8D"VOUS MOUREZ D"A7"UNE TRIPLE PNEUMONIE...!"00

str4220	asc	"LE TITRE EST : "00
str4225	asc	8D"LA MORT A LA PREMIERE PAGE."00

str4230	asc	"LE LIVRE A EXPLOSE LORSQUE VOUS L"A7"AVEZ"8D
	asc	"OUVERT..."00

str4240	asc	"LE PAPIER INDIQUE : CHERCHEZ LA CLEF."00

str4250	asc	"LA CLEF VOUS PERMETTRA DE TROUVER LE"8D
	asc	"CODE DE LA PORTE D"A7"ENTREE."00

str4260	asc	"IL Y A, A COTE DE LA PORTE, UN CLAVIER"8D
	asc	"NUMERIQUE PERMETTANT D"A7"ENTRER UN CODE"00

str4270	asc	"POUR FAIRE QUOI...?"00

str4280	asc	8D"IL Y A UNE ODEUR DE GAZ."00

str4290	asc	"APPAREMMENT, IL N"A7"Y A AUCUNE ODEUR"8D
	asc	"MAIS..."00

str4300	asc	"C"A7"EST DEJA FAIT, ESPECE DE RIGOLO"00

str4310	asc	"IL FAUDRAIT PEUT-ETRE DU FEU"00

str4320	asc	"LA LAMPE NE CONTIENT PAS DE PETROLE"00

str4330	asc	"VOUS NE L"A7"AVEZ PAS"00

str4340	asc	"LE BRIQUET EST ENCORE ALLUME ET IL"8D
	asc	"ECLAIRE LA PIECE."00
	
str4350	asc	"LA TORCHE ETAIT PIEGEE, ELLE VOUS"8D
	asc	"EXPLOSE DANS LES MAINS..."00
	
str4360	asc	"LA LAMPE EST ENCORE ALLUMEE ET ELLE VOUS"
	asc	"ECLAIRE"00

str4370	asc	"UN NAIN VIENT DE VOUS LANCER UN POIGNARD"
	asc	"EN PLEIN COEUR..."00
	
str4380	asc	"UN NAIN VIENT DE SE PRECIPITER SUR VOUS,"
	asc	"IL S"A7"EMPALE SUR VOTRE CISEAU"00

str4390	asc	"UN NAIN VIENT DE SE PRECIPITER SUR VOUS,"
	asc	"IL S"A7"EMPALE SUR VOTRE COUTEAU"00

str4400	asc	"VOUS VENEZ DE RENVERSER LE POT"00

str4410	asc	"LA FOUDRE VIENT DE TOMBER SUR LA MAISON"8D
str4412	asc	8D"LA MAISON N"A7"EXISTE PLUS, VOUS NON PLUS"00

str4420	asc	"A FORCE DE MARCHER DANS LE NOIR, VOUS"8D
	asc	"AVEZ TREBUCHE"00
str4425	asc	8D"VOUS MOUREZ D"A7"UNE FRACTURE DU CRANE"00

str4430	asc	"VOUS NE POUVEZ PAS TRAVAILLER DANS LE"8D
	asc	"NOIR..."00

str4440	asc	"LA LUMIERE DU BRIQUE NE SUFFIT PAS"8D
	asc	"POUR TRAVAILLER..."00

str4450	asc	"IMPOSSIBLE !"8D00

str4460	asc	"VOUS N"A7"AVEZ AUCUN OUTIL..."

str4470	asc	"LE TELEPORTEUR EST EN PANNE, LES BOUTONS"
	asc	"NE FONCTIONNENT PAS."00

str4480	asc	"LE TELEPORTEUR VIENT D"A7"EXPLOSER, VOUS"8D
	asc	"ETES DECOMPOSEE... !"00
	
str4490	asc	"LE TELEPORTEUR SE MET EN MARCHE, VOUS"8D
	asc	"DISPARAISSEZ"00
	
str4500	asc	"VOUS PRENEZ DU 30000 VOLTS DANS LES"8D
	asc	"DOIGTS"00

str4510	asc	"LE PLACARD EST FERME A CLEF"00

str4520	asc	"L"A7"HORRIBLE MONSTRE SORTI DU PLACARD"8D
	asc	"VIENT DE VOUS DEVORER"00

str4530	asc	"IL NE FALLAIT PAS FUIR"00

str4540	asc	"VOUS AVEZ RAISON D"A7"UTILISER LE CISEAU,"8D
	asc	"LE MONSTRE EST MORT"00

str4550	asc	"A L"A7"INTERIEUR DU PLACARD, LE NO "00
str4552	asc	8D" EST INSCRIT"00
str4555	asc	8D"LE PLACARD SE REFERME."00

str4560	asc	"LE PISTOLET A EXPLOSE"00

str4570	asc	"LE CLAVIER NUMERIQUE A EXPLOSE"00

str4580	asc	"LE CLAVIER NUMERIQUE PREND FEU,"8D
	asc	"HEUREUSEMENT, VOUS AVIEZ "00
str4582	asc	"UN POT PLEIN"00
str4585	asc	8D"D"A7"EAU QUI VOUS PERMET D"A7"ETEINDRE LE FEU"00

str4590	asc	8D"NO DE CODE? "00

strCODEEXACT
	asc	"LE CODE EST EXACT... LA PORTE S"A7"OUVRE..."00
strENDEHORS
	asc	8D"VOUS VOILA EN DEHORS DE LA MAISON..."

str4610	asc	"A L"A7"INTERIEUR DU PLACARD, IL Y A UN MOT"8D
	asc	"PARLE D"A7"UN TELEPORTEUR"00
str4615	asc	8D"TIENS LE PLACARD SE FERME TOUT SEUL..."00

str4620	asc	"AVANT DE LA POSER A TERRE, IL FAUDRAIT"8D
	asc	"PEUT-ETRE L"A7"ENLEVER"00

str4630	asc	"IL Y A UN HORRIBLE MONSTRE DEVANT VOUS"8D
	asc	"QUI EST SORTI DU PLACARD."00

str4640	asc	"LE PLACARD ETAIT PIEGE, VOUS N"A7"AURIEZ"8D
	asc	"PAS DU L"A7"OUVRIR"00

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
str7020	asc	"EN BAS DE L"A7"ESCALIER MENANT AU2E ETAGE"00
str7030	asc	"dans LA SALLE A MANGER"00
str7040	asc	"dans UNE BIBLIOTHEQUE SANS LIVRE...!"00
str7050	asc	"dans UNE BUANDERIE"00
str7060	asc	"dans LE SALON"00
str7070	asc	"dans UNE CHAMBRE"00
str7080	asc	"dans UN CORRIDOR"00
str7090	asc	"dans UNE SALLE D"A7"ATTENTE"00
str7100	asc	"dans LE VESTIBULE"00
str7110	asc	"dans LA CHAMBRE D"A7"AMIS"00
str7120	asc	"dans UNE CHAMBRE"00
str7130	asc	""00	; nada
str7140	asc	"dans UNE PETITE SALLE"00
str7150	asc	"dans LE LABORATOIRE DU"00	; + :7001
str7160	asc	"dans UNE PETITE PIECE VIDE"00
str7170	asc	"! JUSTEMENT, VOUS NE SAVEZ PASOU VOUS ETES"00
str7180	asc	"EN HAUT DE L"A7"ESCALIER"00
str7190	asc	"dans LA SALLE DE BAINS"00
str7200	asc	"dans LE LIVING ROOM"00
str7210	asc	"dans UNE PIECE ENFUMEE"00
str7220	asc	"dans UNE GRANDE PIECE"00
str7230	asc	"dans UNE PIECE DE RANGEMENT"00
str7240	asc	"dans LE DRESSING"00

strREPLAY	asc	8D"Voulez-vous rejouer ? "00
	
strGAGNE	asc	"CELA EST EXCEPTIONNEL. VOUS ETES LE"8D8D
	asc	"PREMIER A ETRE SORTI VIVANT DE CETTE"8D8D
	asc	"MAISON, MAIS SI J"A7"ETAIS VOUS, JE ME"8D8D
	asc	"METTRAIS A COURIR CAR UN NAIN RODE"8D8D
	asc	"PEUT-ETRE DANS LES PARAGES..."00
	
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
	asc	"L"A7"UTLISATION DE CE PROGRAMME EST"8D8D
	asc	"DECONSEILLEE AUX PERSONNES SENSIBLES,"8D8D
	asc	"AUX ENFANTS EN BAS AGE, AINSI QU"A7"A"8D8D
	asc	"TOUTE PERSONNE SUSCEPTIBLE D"A7"AVOIR"8D8D
	asc	"DES MALAISES CARDIAQUES."8D8D
	asc	8D8D
	asc	"NOUS NE POURRIONS ETRE TENUS RESPONSA-"8D8D
	asc	"-BLES DES TROUBLES PHYSIQUES OU MENTAUX"8D8D
	asc	"PROVOQUES PAR VOTRE ECHEC DANS"8D8D
	asc	"LE MANOIR DU DR GENIUS ............."00
	
*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

strLORICIELS
	asc	" LORICIELS is proud to present: "00

strLEMANOIR
	asc	" @@@ @ @ @@@  @   @ @@@ @  @ @@@ @@@"8D
	asc	"  @  @ @ @    @@ @@ @ @ @@ @ @ @ @ @"8D
	asc	"  @  @@@ @@   @ @ @ @@@ @@@@ @ @ @@@"8D
	asc	"  @  @ @ @    @   @ @ @ @ @@ @ @ @@"8D
	asc	"  @  @ @ @@@  @   @ @ @ @  @ @@@ @ @"8D
	asc	8D
	asc	"      @@@ @@@     @@"8D
	asc	"      @ @ @       @ @ @"8D
	asc	"      @ @ @@      @ @ @@"8D
	asc	"      @ @ @       @ @ @ @"8D
	asc	"      @@@ @       @@@ @"8D
	asc	8D8D
	asc	"   @@@@  @@@@  @@  @  @  @  @  @@@@"8D
	asc	"   @  @  @     @@  @  @  @  @  @"8D
	asc	"   @     @     @@@ @  @  @  @  @"8D
	asc	"   @     @@@   @ @ @  @  @  @  @@@@"8D
	asc	"   @ @@  @     @ @@@  @  @  @     @"8D
	asc	"   @  @  @     @  @@  @  @  @     @"8D
	asc	"   @@@@  @@@@  @  @@  @  @@@@  @@@@ @ @"00

strINTRO1	asc	"     Apple II version by      "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"       Thanks Fred_72         "00
strINTRO4	asc	"(C) 1983, L. BENES & LORICIELS"00
	
*-----------------------------------
* VOCABULAIRE
*-----------------------------------

V$1	str	"N"
V$2	str	"NORTH"
V$3	str	"S"
V$4	str	"SOUTH"
V$5	str	"E"
V$6	str	"EAST"
V$7	str	"W"
V$8	str	"WEST"
V$9	str	"UP"	; MONTER
V$10	str	"CLIM"	; MONTER
V$11	str	"DOWN"	; DESCENDRE
V$12	str	"TAKE"	; PRENDRE
V$13	str	"RAMA"	; RAMASSER
V$14	str	"POSE"	; POSER
V$15	str	"OPEN"	; OUVRIR
V$16	str	"CLOS"	; FERMER
V$17	str	"ENTE"	; ENTRER
V$18	str	"MOVE"	; AVANCER
V$19	str	"LIGH"	; ALLUMER
V$20	str	"ETEI"	; ETEINDRE
V$21	str	"REPA"	; REPARER
V$22	str	"DEPA"	; DEPANNER
V$23	str	"LIS"	; LIS
V$24	str	"REGA"	; REGARDER
V$25	str	"RETO"	; RETOURNER
V$26	str	"RENI"	; RENIFLER
V$27	str	"SENS"	; SENS ?
V$28	str	"REMP"	; REMPLIT
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
	

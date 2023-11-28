*
* La maison du Professeur Folibus
*
* (c) 1982, Alain Brégéon
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
	asc	8D"Vous ne pouvez porter plus"00

strVOUSLAVEZ
	asc	8D"Vous l"A7"avez deja."00

strNOTOWNED
	asc	8D"Vous n"A7"avez pas"00

strDACCORD
	asc	"D"A7"accord"00
	
*-----------------------------------
* 7000 - LES REPONSES
*-----------------------------------

str7000	asc	"La generatrice vient d"A7"exploser. La"8D
	asc	"maison n"A7"existe plus, vous non plus."00
str7010	asc	"L"A7"ascenseur ne bouge pas. Il faudrait"8D
	asc	"peut-etre du courant ?"00
str7020	asc	"La porte vient de se fermer. Impossible"8D
	asc	"de l"A7"ouvrir..."00
str7030	asc	"Vous avez raison. La curiosite est un"8D
	asc	"vilain defaut..."00
str7040	asc	"L"A7"odeur que vous sentiez etait celle d"A78D
	asc	"un gaz explosif. Vous etes mort."00
str7050	asc	"Il faudrait peut-etre du feu..."00
str7060	asc	"Ah, ah... Vous etes prisonnier"00
str7070	asc	"Vous avez dit papier ? Quel papier ?"00
str7080	asc	"Bravez les interdits."00
str7090	asc	"Elle a l"A7"air de s"A7"emballer..."00
str7100	asc	"La generatrice se met en marche"00
str7110	asc	"Impossible, elle ne veut rien savoir"00
str7120	asc	"Bravo, je ne savais pas que vous aviez"8D
	asc	"des dons d"A7"electricien."00
str7130	asc	"Votre machine est reparee. Mais elle"8D
	asc	"sent le chaud."00
str7140	asc	"La machine est reparee. Dommage qu"A7"il"8D
	asc	"n"A7"y ait pas de courant."00
str7150	asc	"Il faudrait peut-etre des outils."00
str7160	asc	"L"A7"ascenseur semble monter..."00
str7170	asc	"L"A7"ascenseur ne bouge pas"00
str7180	asc	"Le cable vient de casser. Vous vous"8D
	asc	"ecrasez en bas : mort"00
str7190	asc	"Il faut noir. Il faut allumer"00
str7200	asc	"Vous vous ecrasez au sol"00
str7210	asc	"Il y a une clef."00
str7220	asc	"La porte est fermee a clef"00
str7230	asc	"Tiens, la porte du placard se referme."00
str7240	asc	"La generatrice vient d"A7"exploser,"8D
	asc	"l"A7"ascenseur est detruit. Vous en echap-"8D
	asc	"-pez de justesse"00
str7250	asc	"Vous etes mort electrocute"00
str7260	asc	"Vous avez raison, rien ne sert de courir"00
str7270	asc	"Dehors il fait noir, on ne voit pas le"8D
	asc	"sol."00
str7280	asc	"C"A7"est deja fait."00
str7290	asc	"Vous etes au bout de la corde."00
str7300	asc	"Vraiment pas au point cette machine."8D
	asc	"Vous etes mort"00
str7310	asc	"Il faudrait peut-etre ouvrir la fenetre."00
str7320	asc	"Tant pis. On a essaye."00
str7330	asc	"Bravo, quel trait de genie."00
str7340	asc	"Une trappe s"A7"ouvre sous vos pieds."8D
	asc	"Vous etes mort."00
str7350	asc	"Sage precaution."00
str7360	asc	"C"A7"est du poison. Vous etes mort."00
str7370	asc	"Vous apprenez a piloter une soucoupe en"8D
	asc	"une lecon"00
str7380	asc	"Ca ne se pilote pas comme ca"00
str7390	asc	"C"A7"est de l"A7"acide. Vous etes mort."00
str7400	asc	"Il y a de l"A7"eau. Vous vous noyez"00
str7410	asc	"Ouf, vous vous retrouvez dehors.."00
str7420	asc	"Sain et sauf..."00
str7430	asc	"Ca marche... Mais il n"A7"y avait pas assez"
	asc	"de carburant"00
str7440	asc	"Mais. Vous etes tout bleu, ce doit etre"8D
	asc	"les pilules"00
str7450	asc	"Et irradie. Vous mourez au bout de"8D
	asc	"quelques jours"00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8000	asc	"Vous etes devant une maison, la porte"8D
	asc	"est ouverte."00
str8010	asc	"Vous etes dans un couloir. Il y a une"8D
	asc	"porte a l"A7"est et une porte a l"A7"ouest."00
str8020	asc	"Vous etes dans un salon. Il y a une"8D
	asc	"porte a l"A7"ouest."00
str8030	asc	"Il y a une drole d"A7"odeur."00
str8040	asc	"Il y a une grosse machine qui ressemble"8D
	asc	"a 1 generatrice avec un bouton vert, un"8D
	asc	"bouton rouge. Il y a une porte au nord."00
str8050	asc	"Une machinerie d"A7"ascenseur. Une porte"8D
	asc	"au nord."00
str8060	asc	"Il y a plein de materiel."00
str8070	asc	"Vous etes dans un ascenseur. Il y a un"8D
	asc	"bouton haut, un bouton bas."00
str8080	asc	"L"A7"ascenseur vient de s"A7"arreter."00
str8090	asc	"La piece est humide, il y a des fils qui"
	asc	"trainent par terre. Il y a une fenetre"8D
	asc	"et une porte au nord."00
str8100	asc	"La porte vient de se refermer. Bonjour.."
	asc	"Comment ecrivez-vous ceci en 4 lettres ?"00
str8110	asc	"Vous etes dans une machine a remonter le"
	asc	"temps. Trois boutons : passe, present et"
	asc	"avenir."00
str8120	asc	"Vous vous retrouvez dans le laboratoire"8D
	asc	"du Professeur. Il y a une porte en fer a"
	asc	"l"A7"ouest, porte au sud marque danger."00
str8130	asc	"Il y a une douche. Un trou dans le sol."00
str8140	asc	"Il y a un cube noir d"A7"au moins une"8D
	asc	"tonne, une echelle monte. Une porte a"8D
	asc	"l"A7"est."00
str8150	asc	"Vous etes dans une bibliotheque."00
str8160	asc	"Vous etes dans une soucoupe sur une"8D
	asc	"terrasse."00

strREPLAY	asc	8D"Voulez-vous rejouer ? "00
	
strGAGNE	asc	"Cela est exceptionnel. Vous etes le "8D8D
	asc	"premier a etre sorti vivant de la"8D8D
	asc	"maison du Professeur Folibus"00
	
*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

strINSTR	asc	8D"La liste des instructions ? "00

strINSTR2	asc	8D8D
	asc	"Vous voici arrive dans la maison du"8D
	asc	"            Pr Folibus..."8D
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
	asc	"decrivant la salle, tapez une touche"8D
	asc	8D
	asc	"Un dernier conseil : il peut parfois y"8D
	asc	"avoir une porte derriere vous. "00

*-----------------------------------
* 51000 - DISCLAIMER
*-----------------------------------

strDISCLAIMER
	asc	"L"A7"utilisation de ce programme est"8D8D
	asc	"deconseillee aux personnes sensibles,"8D8D
	asc	"aux enfants en bas age, ainsi qu"A7"a"8D8D
	asc	"tout personne susceptible d"A7"avoir"8D8D
	asc	"des malaises cardiaques."8D8D
	asc	8D8D
	asc	"Nous ne pourrions etre tenus responsa-"8D8D
	asc	"-bles des troubles physiques ou mentaux"8D8D
	asc	"provoques par votre echec dans"8D8D
	asc	"la maison du Pr Folibus ............."00
	
*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

strLORICIELS
	asc	"MICRO-SYSTEMES est fier de presenter"00

strLEMANOIR
	asc	"  @    @    @   @ @@@ @ @@@ @@@ @  @"8D
	asc	"  @   @ @   @@ @@ @ @ @ @   @ @ @@ @"8D
	asc	"  @   @@@   @ @ @ @@@ @ @@@ @ @ @@@@"8D
	asc	"  @   @ @   @   @ @ @ @   @ @ @ @ @@"8D
	asc	"  @@@ @ @   @   @ @ @ @ @@@ @@@ @ @@"8D
	asc	8D
	asc	"      @@  @ @     @@@"8D
	asc	"      @ @ @ @     @ @ @"8D
	asc	"      @ @ @ @     @@@ @@"8D
	asc	"      @ @ @ @     @   @ @"8D
	asc	"      @@@ @@@     @   @"8D
	asc	8D8D
	asc	" @@@  @@@  @    @  @@@   @  @  @@@"8D
	asc	" @    @ @  @    @  @  @  @  @  @"8D
	asc	" @    @ @  @    @  @  @  @  @  @"8D
	asc	" @@@  @ @  @    @  @@@   @  @  @@@"8D
	asc	" @    @ @  @    @  @  @  @  @    @"8D
	asc	" @    @ @  @    @  @  @  @  @    @"8D
	asc	" @    @@@  @@@  @  @@@   @@@@  @@@ @ @"00

strINTRO1	asc	"     Version Apple II par     "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"   (C) 1982, Alain Bregeon    "00
	
*-----------------------------------
* VOCABULAIRE
*-----------------------------------

V$1	str	"N"
V$2	str	"NORD"
V$3	str	"E"
V$4	str	"EST"
V$5	str	"S"
V$6	str	"SUD"
V$7	str	"O"
V$8	str	"OUES"
V$9	str	"H"
V$10	str	"MONT"
V$11	str	"D"
V$12	str	"DESC"
V$13	str	"ENTR"
V$14	str	"AVAN"
V$15	str	"HAUT"
V$16	str	"BAS "
V$17	str	"LIT "
V$18	str	"REGA"
V$19	str	"TOUR"
V$20	str	"RETO"
V$21	str	"PREN"
V$22	str	"RAMA"
V$23	str	"PAPI"
V$24	str	"ALLU"
V$25	str	"BOUG"
V$26	str	"APPU"
V$27	str	"ENFO"
V$28	str	"VERT"
V$29	str	"ROUG"
V$30	str	"OUTI"
V$31	str	"OUVR"
V$32	str	"DOUC"
V$33	str	"PLAC"
V$34	str	"PORT"
V$35	str	"ASCE"
V$36	str	"BRIQ"
V$37	str	"REPA"
V$38	str	"DEPA"
V$39	str	"RIEN"
V$40	str	"MACH"
V$41	str	"POSE"
V$42	str	"QUIT"
V$43	str	"DECR"
V$44	str	"INVE"
V$45	str	"CLEF"
V$46	str	"FILS"
V$47	str	"CORD"
V$48	str	"FENE"
V$49	str	"ACCR"
V$50	str	"SAUT"
V$51	str	"ATTA"
V$52	str	"SORT"
V$53	str	"FERM"
V$54	str	"CECI"
V$55	str	"ATTE"
V$56	str	"TAPE"
V$57	str	"FRAP"
V$58	str	"PASS"
V$59	str	"AVEN"
V$60	str	"PRES"
V$61	str	"MET "
V$62	str	"AVAL"
V$63	str	"GANT"
V$64	str	"K"
V$65	str	"Q"
V$66	str	"Z"
V$67	str	"ENFI"
V$68	str	"LASE"
V$69	str	"PIST"
V$70	str	"LIVR"
V$71	str	"DEMA"
V$72	str	"PILO"
V$73	str	"TEMPO"	; Apple II
V$74	str	"QUITTER"	; Apple II
V$75	str	"CASSE"	; Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"briquet"00
O$2	asc	"briquet allume"00
O$3	asc	"bougie"00
O$4	asc	"bougie allumee"00
O$5	asc	"placard"00
O$6	asc	"outils"00
O$7	asc	"papier"00
O$8	asc	"fils arraches"00
O$9	asc	"fils repares"00
O$10	asc	"une corde"00
O$11	asc	"gants caoutchouc"00
O$12	asc	"gants enfiles"00
O$13	asc	"pilule K"00
O$14	asc	"pilule K avalee"00
O$15	asc	"pilule Z"00
O$16	asc	"pilule Z avalee"00
O$17	asc	"pilule Q"00
O$18	asc	"pilule Q avalee"00
O$19	asc	"pistolet laser"00
O$20	asc	"livre"00
O$21	asc	"briquet"00
O$22	asc	"briquet allume"00
O$23	asc	"bougie"00
O$24	asc	"bougie allumee"00
O$25	asc	"placard"00

*-----------------------------------
* STRINGS
*-----------------------------------

*	asc	"1234567890123456789012345678901234567890"

strILFAITNOIR
	asc	"On n"A7"y voit rien, mieux vaudrait allumer"
	asc	"pour eviter les ennuis."00

strILYA	asc	8D"Il y a aussi :"00
strCOMMA	asc	","00
strSPACE	asc	" "00
strRETURN	asc	8D00

strCOMMANDE
	asc	8D"Que faites-vous ? "00

strJENECOMPRENDS
	asc	"Pardon ?"8D00
	
strIMPOSSIBLE
	asc	"Impossible "00
strCECHEMIN
	asc	"de prendre ce chemin"00
strEXCLAM
	asc	" !"00
	

*
* Cauchemard House
*
* (c) 198?, Auteur inconnu
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

str7010	asc	"Une trappe s"A7"ouvre. Vous vous empalez"8D
	asc	"sur des piques"00
str7020	asc	"Une fleche vous traverse"00
str7030	asc	"Le rayon revient sur vous et vous"8D
	asc	"desintegre"00
str7040	asc	"Ce n"A7"etait qu"A7"une projection. Il dispa-"8D
	asc	"-rait"00
str7050	asc	"Un troll apparait"00
str7060	asc	"Vous vous etes electrocute"00
str7070	asc	"Vous explosez"00
str7080	asc	"Le train s"A7"est mis en marche"00
str7090	asc	"Vous tombez dans le vide. Vous vous"8D
	asc	"ecrasez"00
str7100	asc	"Il y a le vide autour de la voie. Vous"8D
	asc	"apercevez et apprenez un code pour"8D
	asc	"clavier"00
str7110	asc	"Le moteur explose. Vous aussi."00
str7120	asc	"Une douche vous envoie de l"A7"acide"00
str7130	asc	"Vous etes desintegre."00
str7140	asc	"La boite explose. Vous aussi."00
str7150	asc	"Une trappe s"A7"ouvre..."00
str7153	asc	8D"Vous vous retrouvez dehors."8D
	asc	"Vous avez gagne."00
str7160	asc	"Vous attrapez la peste. Vous mourez."00
str7170	asc	"Deux lames de rasoir geantes se refer-"8D
	asc	"-ment sur vous."00
str7180	asc	"La bouteille fuyait. Vos mains sont ron-"
	asc	"-gees. Vous attrapez aussitot la leptre."
	asc	"La maladie vous emporte"00
str7190	asc	"La porte s"A7"est ouverte."00
str7200	asc	"Vous glissez. Vous vous ecrasez."00
str7210	asc	"L"A7"eau envahit la salle. Vous vous noyez."00
str7220	asc	""00
str7230	asc	"C"A7"est blinde.."00
str7240	asc	""00
str7250	asc	"Cela cree un parasite. La machine"8D
	asc	"explose. Vous aussi."00
str7260	asc	"Vous avez efface la K7"00
str7270	asc	"Les piles de la lampe sont mortes."00
str7280	asc	"Avec quoi ???..."00
str7290	asc	"Tricheur... Vous ne l"A7"avez jamais lu."00
str7300	asc	"La momie se met en marche et vous"8D
	asc	"devore."00
str7310	asc	"Une voix vous dit : "A7"Prenez toujours le"8D
	asc	"deuxieme."A7""00
str7320	asc	"-O-"00
str7330	asc	"-O-"00
str7340	asc	"Il y a un haut-parleur branche"00
str7350	asc	"Il y a un haut-parleur debranche"00
str7360	asc	"   "00
str7370	asc	"   "00
str7380	asc	"Le train s"A7"arrete. Vous etes ejecte sur "
	asc	"le quai."00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"Vous etes dans une piece vide."00
str8020	asc	"A l"A7"est il y a une porte avec un magneto"
	asc	"rive au mur avec deux touches et au sud "
	asc	"un bouton rouge"00
str8030	asc	"Vous etes dans une mini gare."8D
	asc	"Il y a 3 wagons."00
str8040	asc	"Le train s"A7"est arrete. Il fait noir."00
str8050	asc	"Un rayon est oriente N-S."8D
	asc	"Il y a une porte a l"A7"ouest avec un oeil "
	asc	"electronique"00
str8060	asc	"Un trou avec une echelle rivee descend. "
	asc	"Il y a une vitrine qui donne sur la mer "
	asc	"avec un levier."00
str8070	asc	"Il y a une momie couchee. Au nord il y a"
	asc	"un levier, un bouton et un ecran."8D
	asc	"A l"A7"ouest, une manette."00
str8080	asc	"Au nord il y a une porte avec un clavier"
	asc	"Il y a une machine qui ronronne."00

strREPLAY	asc	8D"Voulez-vous rejouer ? "00
	
strGAGNE	asc	"Cela est exceptionnel. Vous etes le "8D8D
	asc	"premier a etre sorti vivant de"8D8D
	asc	"Cauchemard House"00
	
*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

strINSTR	asc	8D"La liste des instructions ? "00

strINSTR2	asc	8D8D
	asc	"Vous voici arrive dans"8D
	asc	"      Cauchemard House..."8D
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
	asc	"Cauchemard House ............."00
	
*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

strLORICIELS
	asc	"XavSnap et Brutal Deluxe presentent "00
	asc	"MICRO-SYSTEMES est fier de presenter"00

strLEMANOIR
	asc	"Un maniaque, fou et sans scrupules,"8D
	asc	" vous a enleve pour vous faire tester..."
	asc	8D8D
	
	asc	"@@@ @@@ @ @ @@@ @ @ @@@ @  @ @@@ @@@ @@ "
	asc	"@   @ @ @ @ @   @ @ @   @@@@ @ @ @ @ @ @"
	asc	"@   @@@ @ @ @   @@@ @@  @ @@ @@@ @@  @ @"
	asc	"@   @ @ @ @ @   @ @ @   @  @ @ @ @ @ @ @"
	asc	"@@@ @ @ @@@ @@@ @ @ @@@ @  @ @ @ @ @ @@ "
	asc	8D
	asc	"            @ @ @@@ @ @ @@@ @@@"8D
	asc	"            @ @ @ @ @ @ @   @  "8D
	asc	"            @@@ @ @ @ @ @@@ @@ "8D
	asc	"            @ @ @ @ @ @   @ @  "8D
	asc	"            @ @ @@@ @@@ @@@ @@@"8D
	asc	8D8D
	asc	"        MAISON TRUFFEE DE PIEGES"00

strINTRO1	asc	"     Version Apple II par     "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"       Merci a XavSnap        "00
strINTRO4	asc	"   (C) 198?, Auteur inconnu   "00
	
*-----------------------------------
* VOCABULAIRE
*-----------------------------------

V$1	str	"NORD"
V$2	str	"OUES"
V$3	str	"EST"
V$4	str	"SUD"
V$5	str	"VAIS"
V$6	str	"1"
V$7	str	"2"
V$8	str	"3"
V$9	str	"TIRE"
V$10	str	"BRAN"
V$11	str	"PRIS"
V$12	str	"APPU"
V$13	str	"BOUT"
V$14	str	"INTR"
V$15	str	"CASS"
V$16	str	"RIEN"
V$17	str	"VOIE"
V$18	str	"DESC"
V$19	str	"PREN"
V$20	str	"FLAC"
V$21	str	"GOUR"
V$22	str	"COMB"
V$23	str	"PIST"
V$24	str	"OUTI"
V$25	str	"KKKK"
V$26	str	"ALLU"
V$27	str	"LAMP"
V$28	str	"MANE"
V$29	str	"LEVI"
V$30	str	"BOIT"
V$31	str	"ECLA"
V$32	str	"OEIL"
V$33	str	"TAPE"
V$34	str	"FORM"
V$35	str	"REPA"
V$36	str	"MOTE"
V$37	str	"ORQU"
V$38	str	"DECR"
V$39	str	"INVE"
V$40	str	"POSE"
V$41	str	"LANC"
V$42	str	"ENFI"
V$43	str	"ETEI"
V$44	str	"BOIS"
V$45	str	"POUS"
V$46	str	"AMEN"
V$47	str	"CODE"
V$73	str	"TEMPO"	; Apple II
V$74	str	"QUITTER"	; Apple II
V$75	str	"CASSE"	; Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	""00
O$2	asc	""00
O$3	asc	""00
O$4	asc	""00
O$5	asc	""00
O$6	asc	""00
O$7	asc	""00
O$8	asc	""00
O$9	asc	""00
O$10	asc	""00

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
	

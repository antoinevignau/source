*
* Alzan
*
* (c) 1981, The pocket ZX81 book
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	lst	off

* Les caractres en standard : @ { } ] ! (pipe)
* Les caractres en franais : ˆ Ž   
* Les Žquivalents en ASCII   : C0 FB FD DC FC

*-----------------------------------
* LES CHAINES
*-----------------------------------

strVOUSDETENEZ
	asc	8D"Vous d"fb"tenez : "00

strVOUSRIEN
	asc	8D"Vous ne d"fb"tenez absolument rien."00

strPOINT
	asc	"."00
	
strEVIDENT
	asc	8D"Vous ne pouvez pas porter plus."00

strVOUSLAVEZ
	asc	8D"Vous l"a7"avez d"fb"j"c0"."00

strNOTOWNED
	asc	8D"Vous n"a7"avez pas "00

strDACCORD
	asc	" D"a7"accord."00
	
*-----------------------------------
* 7000 - LES REPONSES
*-----------------------------------

str7010	asc	"Oh l"c0" l"c0". Vous avez du attraper la"8d
	asc	"peste dans le tombeau. Il semble que"8d
	asc	"vous soyez mort."00
str7020	asc	"            --- Vlan ---"8d
	asc	"El Grabbo, le voleur du coin, vous sub-"8d
	asc	"tilise votre argent et disparait dans"8d
	asc	"la brume marine."00
str7030	asc	A2"AU VOLEUR"A2" crie l"a7"ouvreur, mais"8d
	asc	"vous parvenez "c0" vous "fb"chapper."00
str7040	asc	"La plaque est d"fb"ja ouverte."00
str7050	asc	"Cela est plus cher que ce que vous"8d
	asc	"pouvez vous permettre"00
str7060	asc	"Cela fera l"a7"affaire, Monsieur"00
str7070	asc	"La plaque d"a7fb"gout est ouverte."00
str7080	asc	"La plaque d"a7fb"gout est ferm"fb"e."00
str7090	asc	"le commercant est plus costaud que vous"8d
	asc	"vous..."00
str7100	asc	"Il vous faudra une "fb"chelle pour"8d
	asc	"franchir ces murs."00
str7110	asc	"C"a7"est d"fb"j"c0" allum"fb"."00
str7120	asc	"Quel coup de g"fb"nie !"00
str7130	asc	"Vous surprenez les gardes et parvenez "c08d
	asc	"subtiliser une liasse de billets."8d
	asc	"Personne n"a7"a rien remarqu"fb" (quelle"8d
	asc	"drole de bande, ces Alzans)."00
str7140	asc	"Vous avez pris tout ce qu"a7"il y avait."00
str7150	asc	"Je ne vois pas de lampe-torche !"00
str7160	asc	"Le cin"fb"ma est r"fb"serv"fb" pour une s"fb"ance"8d
	asc	"priv"fb"e."00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"        Bienvenue "c0" Alzan"8d8d8d
	asc	"Vous devez escalader les murs si vous"8d
	asc	"souhaitez vous "fb"chapper de cette ville"8d
	asc	"de voleurs et d"a7"assassins."00
str8020	asc	"Vous etes dans la rue principale, devant"
	asc	"une quincaillerie. La rue s"a7fb"tend d"a7"est"8d
	asc	"en ouest et une petite ruelle part vers"8d
	asc	"le nord, le long du magasin."00
str8030	asc	"Vous etes "c0" l"a7"int"fb"rieur du magasin. Le"8d
	asc	"commercant a l"a7"air louche mais il expose"
	asc	"de nombreux articles de qualit"fb"."00
str8040	asc	"Vous etes dans une ruelle derri"fd"re de"8d
	asc	"hauts batiments. Il y a de nombreuses"8d
	asc	"poubelles pleines sous l"a7"escalier de"8d
	asc	"secours."00
str8050	asc	"Vous etes sur l"a7"escalier de secours qui"8d
	asc	"passe devant une porte du batiment."00
str8060	asc	"Vous etes descendu par un escalier"8d
	asc	"secret pour arriver dans le batiment."00
str8070	asc	"Vous etes sur des passerelles entre les"8d
	asc	"batiments."00
str8080	asc	"C"a7"est une partie des remparts de la"8d
	asc	"ville. Il y a une porte inutilis"fb"e dans"8d
	asc	"le mur "c0" cet endroit."00
str8090	asc	"Vous vous trouvez "c0" un carrefour."00
str8100	asc	"Voici une partie des remparts de la"8d
	asc	"ville. La brume marine est assez "fb"paisse"
	asc	"et empeche de voir au loin."00
str8110	asc	"Vous plongez depuis le rempart et vous"8d
	asc	"vous "fb"crasez sur les rochers 150 m"fd"tres"8d
	asc	"plus bas. Tant pis, ce sera pour une"8d
	asc	"prochaine fois."00
str8120	asc	"Vous etes devant la banque de la ville."00
str8130	asc	"A l"a7"int"fb"rieur de la banque, de nombreux"8d
	asc	"gardes semblent s"a7"ennuyer fermement."00
str8140	asc	"Vous arrivez dans une impasse mais il y "
	asc	"a une plaque d"a7fb"gout sur la chauss"fb"e."00
str8150	asc	"Vous etes dans une petite alcove sous la"
	asc	"plaque d"a7fb"gout."8d
	asc	"Un passage m"fd"ne vers le sud."00
str8160	asc	"Le passage m"fd"ne "c0" une tombe antique o"fc8d
	asc	"gisent de nombreux sarcophages "fb"parpil-"8d
	asc	"l"fb"s "dcc0" et l"c0"."00
str8170	asc	"L"a7"ouvreur refuse de vous laisser entrer"8d
	asc	"car la s"fb"ance a d"fb"ja commenc"fb". Il vous"8d
	asc	"barre la route avec sa lampe-torche."00
str8180	asc	"Vous etes devant le cin"fb"ma. Des bruits"8d
	asc	"de coups de feu proviennent de"8d
	asc	"l"a7"int"fb"rieur."00
strGAGNE
str8190	asc	"      ***  FELICITATIONS ***"8d
	asc	"Vous avez r"fb"ussi "c0" sortir de l"a7"enceinte"8d
	asc	"de la ville. Cela n"a7"arrive pas souvent."8d
	asc	"Bravo !"00

strREPLAY	asc	8D"Voulez-vous rejouer ? "00
	
*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------
*
*strINSTR	asc	8D"La liste des instructions ? "00
*
*strINSTR2	asc	8D8D
*	asc	"Vous voici arrive dans"8D
*	asc	"      Cauchemard House..."8D
*	asc	8D
*	asc	"Pour converser avec l"A7"ordinateur, il"8D
*	asc	"faut rentrer les ordres en 1 ou 2 mots"8D
*	asc	"tels que :"8D
*	asc	"           NORD"8D
*	asc	"           PRENDS PILULE"8D
*	asc	8D
*	asc	"ou pour commencer :"8D
*	asc	"           ENTRE"8D
*	asc	8D8D
*	asc	"Si vous voulez faire durer la phrase"8D
*	asc	"decrivant la salle, tapez une touche"8D
*	asc	8D
*	asc	"Un dernier conseil : il peut parfois y"8D
*	asc	"avoir une porte derriere vous. "00
*
*-----------------------------------
* 51000 - DISCLAIMER
*-----------------------------------
*
*strDISCLAIMER
*	asc	"L"A7"utilisation de ce programme est"8D8D
*	asc	"deconseillee aux personnes sensibles,"8D8D
*	asc	"aux enfants en bas age, ainsi qu"A7"a"8D8D
*	asc	"toute personne susceptible d"A7"avoir"8D8D
*	asc	"des malaises cardiaques."8D8D
*	asc	8D8D
*	asc	"Nous ne pourrions etre tenus responsa-"8D8D
*	asc	"-bles des troubles physiques ou mentaux"8D8D
*	asc	"provoques par votre echec dans"8D8D
*	asc	"Cauchemard House ............."00
*	
*-----------------------------------
* introPIC - la picture GR
*-----------------------------------
*
*strLORICIELS
*	asc	" Les Editions du P.S.I. presentent"00

strLEMANOIR
	asc	"City of Alzan"8d
	asc	"de Trevor Toms"8d
	asc	"(c) 1981, Phipps Associates"8d
	asc	8d
	asc	"L"a7"histoire se d"fb"roule dans la ville"8d
	asc	"fictive d"a7"Alzan, batie au sommet de"8d
	asc	"falaises surplombant la mer et peupl"fb"e"8d
	asc	"de voleurs et d"a7"assassins."8d
	asc	8d
	asc	"Votre quete consiste "c0" trouver comment"8d
	asc	"quitter la ville avant d"a7"etre attrap"fb8d
	asc	"ou que la peste ne vous frappe."8d
	asc	8d
	asc	"Malheureusement, la ville est entour"fb"e"8d
	asc	"de murailles immenses, vous devrez donc"8d
	asc	"d"a7"abord trouver comment les escalader."8d
	asc	8d
	asc	8d
	asc	"Version Apple II r"fb"alis"fb"e en 2026"8d
	asc	"par Brutal Deluxe Software"8d
	asc	"Antoine Vignau & Olivier Zardini"00

*	asc	"1234567890123456789012345678901234567890"
*
*strINTRO1	asc	"       Apple II version       "00
*strINTRO2	asc	"    Brutal Deluxe Software    "00
*strINTRO3	asc	"     The ZX81 Pocket Book     "00
*strINTRO4	asc	"  (c) 1981 Phipps Associates  "00
	
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
V$10	str	"HAUT"
V$11	str	"B"
V$12	str	"BAS"
V$13	str	"PREN"	; TAKE
V$13B	str	"PREN"	; GET
V$14	str	"POSE"	; PUT
V$15	str	"LACH"	; DROP
V$16	str	"ENTR"	; ENTER
V$17	str	"ENTR"	; IN
V$18	str	"SORT"	; OUT
V$19	str	"SORT"	; EXIT
V$20	str	"PART"	; LEAVE
V$21	str	"TORC"	; TORCH
V$21B	str	"LAMP"	; TORCH (LAMPE-TORCHE)
V$22	str	"ECHE"	; LADDER
V$23	str	"MART"	; HAMMER
V$24	str	"LIAS"	; WAD
V$25	str	"BILL"	; NOTE
V$26	str	"SAC"	; BAG
V$27	str	"CLOU"	; NAILS
V$28	str	"CART"	; BARCLAY CARD
V$29	str	"ESCA"	; SCALE (ESCALADER)
V$30	str	"MONT"	; CLIMB
V$31	str	"OUVR"	; OPEN
V$32	str	"SOUL"	; LIFT
V$33	str	"FAIR"	; MAKE
V$34	str	"CONS"	; BUILD
V$35	str	"TOUR"	; SWITCH
V$36	str	"ALLU"	; LIGHT
V$37	str	"ACHE"	; BUY
V$37B	str	"ACHE"	; PURCHASE
V$38	str	"BOIS"	; WOOD
V$39	str	"VOLE"	; ROB
V$40	str	"VOLE"	; STEAL
V$41	str	"INVE"	; INVENTORY
V$42	str	"QUIT"	; QUIT
V$43	str	"LOOK"	; LOOK
V$73	str	"TEMP"	; Apple II
V$74	str	"QUIT"	; Apple II
V$75	str	"CASS"	; Apple II CASE / CASSE

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"torche allumee"00
O$2	asc	"torche"00
O$3	asc	"echelle"00
O$4	asc	"marteau"00
O$5	asc	"marteau"00
O$6	asc	"liasse de billets"00
O$7	asc	"plaque d'egout"00
O$8	asc	"sac de clous"00
O$9	asc	"carte bancaire"00
O$10	asc	"echelle rudimentaire"00
O$11	asc	"du bois"00

*-----------------------------------
* STRINGS
*-----------------------------------

*	asc	"1234567890123456789012345678901234567890"

strILFAITNOIR	asc	"On ne voit rien, mieux vaudrait allumer"8d"pour eviter les ennuis."00

strILYA	asc	8D"Il y a aussi :"00
strCOMMA	asc	","00
strSPACE	asc	" "00
strRETURN	asc	8D00

strCOMMANDE
	asc	8D"> "00

strJENECOMPRENDS
	asc	" Comment ?"8D00
	
strIMPOSSIBLE
	asc	"Impossible "00
strCECHEMIN
	asc	"de prendre ce chemin "00
strEXCLAM
	asc	"!"8d00
	

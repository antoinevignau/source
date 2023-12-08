*
* Alzan
*
* (c) 1981, The pocket ZX81 book
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

str7010	asc	"La porte est coincee"00
str7020	asc	"La porte est ouverte"00
str7030	asc	"C"A7"est deja allume"00
str7040	asc	"Vous reussissez tant bien que mal a"8D
	asc	"ouvrir la porte."00
str7050	asc	"C"A7"est trop dur a ouvrir pour vous."00
str7060	asc	"Vous avez reussi. Bravo."00
str7070	asc	"Vous ne pouvez pas franchir la porte"00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"Vous etes au bord d"A7"un gouffre."00
str8020	asc	"Vous etes dans un labyrinth avec des"8D
	asc	"passages menant vers est, sud, ouest."8D
	asc	"Un passage obscur grimpe derriere vous."00
str8030	asc	"Cette cave contient seulement une mare"8D
	asc	"d"A7"huile."00
str8040	asc	"Voici une grande porte rouillee."00
str8050	asc	"Vous etes dans la chambre ouest."00
str8060	asc	"Vous etes dan la cave au tresor"00

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
	asc	"toute personne susceptible d"A7"avoir"8D8D
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
	asc	" Les Editions du P.S.I. presentent"00

strLEMANOIR
	asc	"ALZAN"00
	
strINTRO1	asc	"     Version Apple II par     "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"     The ZX81 Pocket Book     "00
strINTRO4	asc	"  (C) 1983, Editions du PSI   "00
	
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
V$9	str	"M"
V$10	str	"MONT"
V$11	str	"D"
V$12	str	"DESC"
V$13	str	"PREN"
V$14	str	"POSE"
V$15	str	"VASE"
V$16	str	"OR"
V$17	str	"PORT"
V$18	str	"OUVR"
V$19	str	"LAMP"
V$20	str	"ALLU"
V$21	str	"REMP"
V$22	str	"HUIL"
V$23	str	"INVE"
V$24	str	"QUIT"
V$25	str	"REGA"
V$73	str	"TEMPO"	; Apple II
V$74	str	"QUITTER"	; Apple II
V$75	str	"CASSE"	; Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"une lampe"00
O$2	asc	"une lampe allumee"00
O$3	asc	"un vase chinois"00
O$4	asc	"un vase d"A7"huile"00
O$5	asc	"un lingot d"A7"or"00

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
	

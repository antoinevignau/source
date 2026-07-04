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
	asc	8D"You are holding:"00

strVOUSRIEN
	asc	8D"You are carrying nothing."00

strPOINT
	asc	"."00
	
strEVIDENT
	asc	8D"You cannot carry more."00

strVOUSLAVEZ
	asc	8D"You already have it."00

strNOTOWNED
	asc	8D"You don"a7"t have "00

strDACCORD
	asc	" Okay."00
	
*-----------------------------------
* 7000 - LES REPONSES
*-----------------------------------

str7010	asc	"Oh dear. You must have caught"8d"the plague in the tomb. It"8d"seems that you have died."00
str7020	asc	"            ---Whoosh---"8d"El Grabbo, the local thief,"8d"snatches your money and dis-"8d"appears into the sea mist."00
str7030	asc	A2"STOP THIEF"A2" shouts the usher,"8d"but you manage to escape."00
str7040	asc	"The cover is already open."00
str7050	asc	"It costs more than you can afford."00
str7060	asc	"That"A7"ll do nicely, Sir"00
str7070	asc	"The manhole cover is open."00
str7080	asc	"The manhole cover is shut."00
str7090	asc	"The shopkeeper is bigger than"8d"you..."00
str7100	asc	"You will need a ladder to get"8d"over these walls."00
str7110	asc	"It is already on."00
str7120	asc	"What a stroke of genius"00
str7130	asc	"You catch the guards unaware and"8d"manage to snatch a wad of notes."8d"No-one has noticed (funny lot,"8d"these Alzans)"00
str7140	asc	"You have taken all there is."00
str7150	asc	"I don"A7"t see a torch?"00
str7160	asc	"The cinema is booked for a"8d"private function."00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"        Welcome to Alzan"8d8d8d"You must scale the walls if"8d"you wish to escape from this"8d"city of thieves and cut-throats."00
str8020	asc	"You are in the main street out-"8d"side a hardware shop. The street"8d"stretches east/west and a small"8d"alley leads north beside the"8d"shop."00
str8030	asc	"You are inside the shop. The"8d"shopkeeper looks shifty, but he"8d"has many fine good on display."00
str8040	asc	"You are in an alley behind the"8d"tall buildings. There are many"8d"full dustbins under the fire"8d"escape."00
str8050	asc	"You are on the fire escape,"8d"which leads past a door in the"8d"buildings."00
str8060	asc	"You have come down a secret"8d"staircase into the shop."00
str8070	asc	"You are on some catwalks between"8d"the buildings."00
str8080	asc	"This is part of the city walls."8d"There is an unused door in the"8d"wall here."00
str8090	asc	"You are at a crossroads."00
str8100	asc	"Here is part of the city walls."8d"The sea mist is quite thick,"8d"making it hard to see far."00
str8110	asc	"You plunge from the wall - Right"8d"down onto the rocks by the sea"8d"500ft below. Well, never mind,"8d"better luck next time."00
str8120	asc	"You are outside the town bank."00
str8130	asc	"Inside the town bank there are many"8d"guards who seem rather bored."00
str8140	asc	"You have arrived at a dead end,"8d"but there is a manhole in the"8d"road..."00
str8150	asc	"You are in small alcove under-"8d"neath the manhole. A passage"8d"leads south."00
str8160	asc	"The passage leads to an ancient"8d"tomb, where many sarcophagi lie"8d"scattered about."00
str8170	asc	"The usher will not let you in as"8d"the programme has started. He"8d"blocks your path with his torch."00
str8180	asc	"You are outside the cinema."8d"Sounds of gunfire come from"8d"within."00
strGAGNE
str8190	asc	"      *** CONGRATULATIONS ***"8d"You made it outside the city walls."8d"This is indeed a rare occasion."8d"Well done."00

strREPLAY	asc	8D"Do you want to play again? "00
	
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
	asc	"by Trevor Toms"8d
	asc	"(c) 1981, Phipps Associates"8d
	asc	8d
	asc	"The plot takes place in a fictitious"8d
	asc	"city named Alzan, which is built on top"8d
	asc	"of the sea cliffs and is inhabited by"8d
	asc	"thieves and cut-throaths."8d
	asc	8d
	asc	"Your quest is to find a way out of the"8d
	asc	"city before they grab you, or before"8d
	asc	"the plage takes hold of you."8d
	asc	8d
	asc	"Unfortunately, the city is surrounded"8d
	asc	"by extremely high walls and so you must"8d
	asc	"find a way to scale them."8d
	asc	8d
	asc	8d
	asc	"Apple II version in 2026"8d
	asc	"by Brutal Deluxe Software"00

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
V$2	str	"NORT"
V$3	str	"E"
V$4	str	"EAST"
V$5	str	"S"
V$6	str	"SOUT"
V$7	str	"W"
V$8	str	"WEST"
V$9	str	"U"
V$10	str	"UP"
V$11	str	"D"
V$12	str	"DOWN"
V$13	str	"TAKE"
V$13B	str	"GET"
V$14	str	"PUT"
V$15	str	"DROP"
V$16	str	"ENTE"
V$17	str	"IN"
V$18	str	"OUT"
V$19	str	"EXIT"
V$20	str	"LEAV"
V$21	str	"TORC"
V$22	str	"LADD"
V$23	str	"HAMM"
V$24	str	"WAD"
V$25	str	"NOTE"
V$26	str	"BAG"
V$27	str	"NAIL"
V$28	str	"BARC"
V$29	str	"SCAL"
V$30	str	"CLIM"
V$31	str	"OPEN"
V$32	str	"LIFT"
V$33	str	"MAKE"
V$34	str	"BUIL"
V$35	str	"SWIT"
V$36	str	"LIGH"
V$37	str	"BUY"
V$37B	str	"PURC"
V$38	str	"WOOD"
V$39	str	"ROB"
V$40	str	"STEA"
V$41	str	"INVE"
V$42	str	"QUIT"
V$43	str	"LOOK"
V$73	str	"TEMP"	; Apple II
V$74	str	"QUIT"	; Apple II
V$75	str	"CASE"	; Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"a lighted torch"00
O$2	asc	"a torch"00
O$3	asc	"a ladder"00
O$4	asc	"a hammer"00
O$5	asc	"a hammer"00
O$6	asc	"a wad of notes"00
O$7	asc	"manhole cover"00
O$8	asc	"a bag of nails"00
O$9	asc	"a barclaycard"00
O$10	asc	"a rough ladder"00
O$11	asc	"some wood"00

*-----------------------------------
* STRINGS
*-----------------------------------

*	asc	"1234567890123456789012345678901234567890"

strILFAITNOIR	asc	"It is dark - Better get some"8d"light or you may be in trouble."00

strILYA	asc	8D"There is also:"00
strCOMMA	asc	","00
strSPACE	asc	" "00
strRETURN	asc	8D00

strCOMMANDE
	asc	8D"> "00

strJENECOMPRENDS
	asc	" Pardon?"8D00
	
strIMPOSSIBLE
	asc	"You can"a7"t "00
strCECHEMIN
	asc	"go that way"00
strEXCLAM
	asc	"!"00
	

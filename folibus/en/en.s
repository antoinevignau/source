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
	asc	8D"You carry: "00

strVOUSRIEN
	asc	8D"You carry absolutely nothing!!!"00

strPOINT
	asc	"."00
	
strEVIDENT
	asc	8D"You cannot carry more"00

strVOUSLAVEZ
	asc	8D"You already have it."00

strNOTOWNED
	asc	8D"You do not carry"00

strDACCORD
	asc	"OK"00
	
*-----------------------------------
* 7000 - LES REPONSES
*-----------------------------------

str7010	asc	"The generator just exploded. The house"8D
	asc	"no longer exists, neither do you."00
str7020	asc	"The elevator does not move. Perhaps we"8D
	asc	"need power?"00
str7030	asc	"The door has just closed."8D
	asc	"Cannot open it..."00
str7040	asc	"You are right. Curiosity killed the cat"00
str7050	asc	"The odor you smelled was that of explo-"8D
	asc	"-sive gas. You are dead."00
str7060	asc	"Maybe we need a fire..."00
str7070	asc	"Ah, ah... You are a prisoner."00
str7080	asc	"Did you say paper? What paper?"00
str7090	asc	"Ban the bans"00
str7100	asc	"It seems to be getting carried away..."00
str7110	asc	"The generator starts"00
str7120	asc	"Impossible, it does not start at all"00
str7130	asc	"Well done, I did not know you had"8D
	asc	"electrician skills."00
str7140	asc	"Your machine is repaired. But it feels"8D
	asc	"hot."00
str7150	asc	"The machine is repaired. Too bad there"8D
	asc	"is no power."00
str7160	asc	"Maybe we need some tools."00
str7170	asc	"The elevator seems to go up..."00
str7180	asc	"The elevator does not move"00
str7190	asc	"The cable has just broken. You crash"8D
	asc	"down: deaed"00
str7200	asc	"It is dark. It should be lit"00
str7210	asc	"You crash to the ground"00
str7220	asc	"There is a key."00
str7230	asc	"The door is locked"00
str7240	asc	"Here, the closet door closes."8D00
str7250	asc	"The generator just exploded. The eleva-"8D
	asc	"-tor is destroyed. You narrowly escape"8D00
str7260	asc	"You died electrocuted"00
str7270	asc	"You are right, there is no rush. Smoke"8D
	asc	"rises from the ground. You have to go"8D
	asc	"out anyway."00
str7280	asc	"It is dark outside, you cannot see the"8D
	asc	"ground"00
str7290	asc	"It is already done."00
str7300	asc	"You are at the end of the ropoe."00
str7310	asc	"The machine is really not up to par."8D
	asc	"You are dead"00
str7320	asc	"Perhaps we should open the window."00
str7330	asc	"Too bad. We tried."00
str7340	asc	"Well done. What a stroke of genius."00
str7350	asc	"A trapdoor opens beneath your feet."8D
	asc	"You are dead."00
str7360	asc	"Wise precaution."00
str7370	asc	"It is poison. You are dead."00
str7380	asc	"You learn to fly a saucer in one lesson"00
str7390	asc	"It is not the way to drive it"00
str7400	asc	"It is acid. You are dead."00
str7410	asc	"There is water. You are drowing"00
str7420	asc	"Phew, you find yourself outside..."00
str7430	asc	"Safe and sound..."00
str7440	asc	"It works... But there was not enough"8D
	asc	"fuel"00
str7450	asc	"But. You are all blue. It must be the"8D
	asc	"pills"00
str7460	asc	"And radiates. You die after a few days"00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"You are in front of a house, the door is"
	asc	"open."00
str8020	asc	"You are in a corridor. There is a door"8D
	asc	"to the east and a door to the west."00
str8030	asc	"You are in a living room. There is a"8D
	asc	"door to the west."00
str8040	asc	"There is a funny smell."00
str8050	asc	"There is a big machine that looks like"8D
	asc	"a generator with a green button, a red"8D
	asc	"button. There is a door to the north."00
str8060	asc	"Elevator machinery. A door to the north"00
str8070	asc	"There is plenty of material."00
str8080	asc	"You are in an elevator. There is a up"8D
	asc	"button, a down button."00
str8090	asc	"The elevator has just stopped"00
str8100	asc	"The room is damp, there are wires lying"8D
	asc	"around on the floor. There is a window"8D
	asc	"and a door to the north."00
str8110	asc	"The door has just closed. Hello.."8D
	asc	"How do you write this in 4 letters?"00
str8120	asc	"You are in a time machine. With three"8D
	asc	"buttons: past, present and future."00
str8130	asc	"You find yourself in the Professor"A7"s"8D
	asc	"laboratory. There is an iron door to the"
	asc	"west, door to the south marked danger"00
str8140	asc	"There is a shower. A hole in the ground"00
str8150	asc	"There is a black cube of at least a ton,"
	asc	"a ladder going up. A door to the east"00
str8160	asc	"You are in a library."00
str8170	asc	"You are in a saucer on a terrace."00

strREPLAY	asc	8D"Do you want to play again? "00
	
s*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

strINSTR	asc	8D"Instructions (Y/N)? "00

strINSTR2	asc	8D8D
	asc	"You have arrived in the house of"8D
	asc	"            Pr Folibus..."8D
	asc	8D
	asc	"To converse with the computer, you"8D
	asc	"must enter orders in 1 or 2 words"8D
	asc	"such as"8D
	asc	"           NORTH"8D
	asc	"           TAKE PILL"8D
	asc	8D
	asc	"or to start:"8D
	asc	"           ENTER"8D
	asc	8D8D
	asc	"If you want to make the sentence"8D
	asc	"describing the room last, type a key"8D
	asc	8D
	asc	"One last advice: sometimes, there may"8D
	asc	"be a door behind you. "00

*-----------------------------------
* 51000 - DISCLAIMER
*-----------------------------------

strDISCLAIMER
	asc	"The use of this program is not"8D8D
	asc	"recommended to sensitive people,"8D8D
	asc	"young children, as well as"8D8D
	asc	"anyone who have heart diseases."8D8D
	asc	8D8D
	asc	"We cannot be held responsible for any"8D8D
	asc	"physical or mental disorder caused"8D8D
	asc	"by your failure in"8D8D
	asc	"The House of Pr Folibus ............."00
	
*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

strLORICIELS
	asc	" MICRO-SYSTEMES is proud to present "00

strLEMANOIR
	asc	" @@@ @ @ @@@   @ @ @@@ @ @ @@@ @@@"8D
	asc	"  @  @ @ @     @ @ @ @ @ @ @   @  "8D
	asc	"  @  @@@ @@    @@@ @ @ @ @ @@@ @@ "8D
	asc	"  @  @ @ @     @ @ @ @ @ @   @ @  "8D
	asc	"  @  @ @ @@@   @ @ @@@ @@@ @@@ @@@"8D
	asc	8D
	asc	"      @@@ @@@     @@@"8D
	asc	"      @ @ @       @ @ @"8D
	asc	"      @ @ @@      @@@ @@"8D
	asc	"      @ @ @       @   @ @"8D
	asc	"      @@@ @       @   @"8D
	asc	8D8D
	asc	" @@@  @@@  @    @  @@@   @  @  @@@"8D
	asc	" @    @ @  @    @  @  @  @  @  @"8D
	asc	" @    @ @  @    @  @  @  @  @  @"8D
	asc	" @@@  @ @  @    @  @@@   @  @  @@@"8D
	asc	" @    @ @  @    @  @  @  @  @    @"8D
	asc	" @    @ @  @    @  @  @  @  @    @"8D
	asc	" @    @@@  @@@  @  @@@   @@@@  @@@ @ @"00

strINTRO1	asc	"     Apple II version by      "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"        Thanks XavSnap        "00
strINTRO4	asc	"   (C) 1982, Alain Bregeon    "00
	
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
V$13	str	"ENTE"	; ENTRER
V$14	str	"ADVA"	; AVANCER
V$15	str	"TOP"	; HAUT
V$16	str	"BOTT"	; BAS
V$17	str	"BED"	; LIT
V$18	str	"LOOK"	; REGARDER
V$19	str	"TURN"	; TOURNER
V$20	str	"RETU"	; RETOURNER
V$21	str	"TAKE"	; PRENDRE
V$22	str	"PICK"	; PRENDRE
V$23	str	"PAPE"	; PAPIER
V$24	str	"LIGH"	; ALLUMER
V$25	str	"CAND"	; BOUGIE
V$26	str	"PUSH"	; APPUYER
V$27	str	"PUSH"	; POUSSER
V$28	str	"GREE"	; VERT
V$29	str	"RED"	; ROUGE
V$30	str	"TOOL"	; OUTILS
V$31	str	"OPEN"	; OUVRIR
V$32	str	"SHOW"	; DOUCHE
V$33	str	"CLOS"	; PLACARD
V$34	str	"CARR"	; PORTER
V$35	str	"ELEV"	; ASCENSEUR
V$36	str	"FIRE"	; BRIQUET
V$37	str	"REPA"	; REPARER
V$38	str	"HELP"	; DEPANNER
V$39	str	"NOTH"	; RIEN
V$40	str	"MACH"	; MACHINERIE
V$41	str	"DROP"	; POSER
V$42	str	"QUIT"	; QUITTER
V$43	str	"DECR"	; DECR
V$44	str	"INVE"	; INVENTAIRE
V$45	str	"KEY"	; CLEF
V$46	str	"WIRE"	; FILS
V$47	str	"ROPE"	; CORDE
V$48	str	"WIND"	; FENETRE
V$49	str	"INCR"	; ACCROITRE
V$50	str	"JUMP"	; SAUTER
V$51	str	"ATTA"	; ATTAQUER
V$52	str	"EXIT"	; SORTIR
V$53	str	"SHUT"	; FERMER
V$54	str	"THIS"	; CECI
V$55	str	"WAIT"	; ATTENDRE
V$56	str	"HIT"	; TAPER
V$57	str	"HIT"	; FRAPPER
V$58	str	"PAST"	; PASSE
V$59	str	"FUTU"	; AVENIR
V$60	str	"PRES"	; PRESENT
V$61	str	"WEAR"	; METTRE
V$62	str	"SWAL"	; AVALER
V$63	str	"GLOV"	; GANT
V$64	str	"KK"	; KK
V$65	str	"QQ"	; QQ
V$66	str	"ZZ"	; ZZ
V$67	str	"WEAR"	; PORTER
V$68	str	"LASE"	; LASER
V$69	str	"GUN"	; PISTOLET
V$70	str	"BOOK"	; LIVRE
V$71	str	"STAR"	; DEMARRER
V$72	str	"DRIV"	; AVANCER
V$73	str	"TEMPO"	; Apple II
V$74	str	"QUIT"	; Apple II
V$75	str	"CASE"	; Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"fire"00
O$2	asc	"lighted light"00
O$3	asc	"candle"00
O$4	asc	"lighted candle"00
O$5	asc	"closet"00
O$6	asc	"tools"00
O$7	asc	"paper"00
O$8	asc	"torn wires"00
O$9	asc	"repaired wires"00
O$10	asc	"a rope"00
O$11	asc	"rubber gloves"00
O$12	asc	"gloves put on"00
O$13	asc	"KK pill"00
O$14	asc	"KK pill swallowed"00
O$15	asc	"ZZ pill"00
O$16	asc	"ZZ pill swallowed"00
O$17	asc	"QQ pill"00
O$18	asc	"QQ pill swallowed"00
O$19	asc	"laser gun"00
O$20	asc	"book"00

*-----------------------------------
* STRINGS
*-----------------------------------

*	asc	"1234567890123456789012345678901234567890"

strILFAITNOIR
	asc	"It is very dark, perhaps you should"8D
	asc	"turn on the lights"00

strILYA	asc	8D"There is also:"00
strCOMMA	asc	","00
strSPACE	asc	" "00
strRETURN	asc	8D00

strCOMMANDE
	asc	8D"Command? "00

strJENECOMPRENDS
	asc	"Sorry?"8D00
	
strIMPOSSIBLE
	asc	"Not possible "00
strCECHEMIN
	asc	"to take this path"00
strEXCLAM
	asc	" !"00
	

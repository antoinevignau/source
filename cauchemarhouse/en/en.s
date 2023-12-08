*
* Cauchemar House
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
	asc	8D"You carry: "00
strVOUSRIEN
	asc	8D"You carry absolutely nothing!!!"00
strPOINT
	asc	"."00
	
strEVIDENT
	asc	8D"It seems abvious that you can only"8D
	asc	"carry so much stuff!!"00
strVOUSLAVEZ
	asc	8D"You already have it. You are dizzy"8D
	asc	"and in this house, it is not"00
strCONSEILLE
	asc	8D"very advisable"00
	
strNOTOWNED
	asc	8D"How do you want to drop what you"8D
	asc	"do not carry?"00

strDACCORD
	asc	8D"OK"00
	
*-----------------------------------
* 7000 - LES REPONSES
*-----------------------------------

str7010	asc	"A trap door opens. You impale yourself"8D
	asc	"on pikes"00
str7020	asc	"An arrow crosses you"00
str7030	asc	"The ray returns to you and disintegrates"
	asc	"you"00
str7040	asc	"It was just a projection. It disappears"00
str7050	asc	"A troll appears"00
str7060	asc	"You electrocuted yourself"00
str7070	asc	"Vous explode"00
str7080	asc	"The train started moving"00
str7090	asc	"You faill into the void. You crash"00
str7100	asc	"There is emptiness around the track. You"
	asc	"see and learn a keyboard code"00
str7110	asc	"The engine explodes. You too."00
str7120	asc	"A shower sends you acid"00
str7130	asc	"You are disintegrated."00
str7140	asc	"The box explodes. You too."00
str7150	asc	"A trapdoor opens..."00
str7153	asc	8D"You find yourself outside."8D
	asc	"You have won."00
str7160	asc	"You catch the plague. You die."00
str7170	asc	"Two giant razor blades close on you."00
str7180	asc	"The bootle was leaking. Your hands are"8D
	asc	"eaten away. You immediately catch"8D
	asc	"leprosy. The illness takes you away"00
str7190	asc	"The door opended."00
str7200	asc	"You slip. You crash."00
str7210	asc	"Water invades the room. You drown."00
str7220	asc	""00
str7230	asc	"It is armored.."00
str7240	asc	""00
str7250	asc	"This creates a parasite. The machine"8D
	asc	"explodes. You too."00
str7260	asc	"You have erased the cassette."00
str7270	asc	"The lamp batteries are dead."00
str7280	asc	"With what???..."00
str7290	asc	"Cheater... You have never read it."00
str7300	asc	"The mummy turns to you and devours you."00
str7310	asc	"A voice says, always take the second.'"00
str7320	asc	"-O-"00
str7330	asc	"-O-"00
str7340	asc	"There is a speaker pluggin in."00
str7350	asc	"There is an unplugged speaker."00
str7360	asc	"   "00
str7370	asc	"   "00
str7380	asc	"The train stops. You are thrown onto the"
	asc	"platform"00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"You are in an empty room."00
str8020	asc	"To the east, there is a door with a tape"
	asc	"recorder attached to the wall, with two "
	asc	"buttons and to the south a red button."00
str8030	asc	"You are in a mini train station."8D
	asc	"There are 3 wagons."00
str8040	asc	"The train has stopped. It is dark."00
str8050	asc	"A ray is oriented N-S."8D
	asc	"There is a door to the west with an"8D
	asc	"electronic eye"00
str8060	asc	"A hole with a riveted ladder goes down. "
	asc	"There is a window overlooking the sea"8D
	asc	"with a lever."00
str8070	asc	"There is a mummy lying down. To the"8D
	asc	"north, there is a lever, a button and a "
	asc	"screen. To the west, a stick."00
str8080	asc	"To the north, there is a door with a"8D
	asc	"keypad. There is a machine whirring."00

strREPLAY	asc	8D"Do you want to play again? "00
	
strGAGNE	asc	8D"This is exceptional, you are the first"8D
	asc	"to get out of Cauchemar House alive"00
	
*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

strINSTR	asc	8D"Do you want the instructions? "00

strINSTR2	asc	8D8D
	asc	"You have arrived in"8D
	asc	"      Cauchemar House..."8D
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
	asc	"Cauchemar House ............."00

*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

strLORICIELS
	asc	"An author is really proud to present"00

strLEMANOIR
	asc	"A crazy and unscrupulous maniac"8D 
	asc	"kidnapped you to have you tested..."8D
	asc	8D8D
		
	asc	"@@@ @@@ @ @ @@@ @ @ @@@ @   @ @@@ @@@"8D
	asc	"@   @ @ @ @ @   @ @ @   @@ @@ @ @ @ @"8D
	asc	"@   @@@ @ @ @   @@@ @@  @ @ @ @@@ @@ "8D
	asc	"@   @ @ @ @ @   @ @ @   @   @ @ @ @ @"8D
	asc	"@@@ @ @ @@@ @@@ @ @ @@@ @   @ @ @ @ @"8D
	asc	8D
	asc	"            @ @ @@@ @ @ @@@ @@@"8D
	asc	"            @ @ @ @ @ @ @   @  "8D
	asc	"            @@@ @ @ @ @ @@@ @@ "8D
	asc	"            @ @ @ @ @ @   @ @  "8D
	asc	"            @ @ @@@ @@@ @@@ @@@"8D
	asc	8D8D
	asc	"           A HOUSE FULL OF TRAPS"00

strINTRO1	asc	"     Apple II version by      "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"        Thanks XavSnap        "00
strINTRO4	asc	"   (C) 198?, Unknown author   "00
	
*-----------------------------------
* VOCABULAIRE
*-----------------------------------

V$1	str	"NORTH"
V$2	str	"WEST"
V$3	str	"EAST"
V$4	str	"SOUTH"
V$5	str	"GO"
V$6	str	"1"
V$7	str	"2"
V$8	str	"3"
V$9	str	"PULL"	; TIRE
V$10	str	"PLUG"	; BRAN
V$11	str	"SOCKET"	; PRIS
V$12	str	"PUSH"	; APPU
V$13	str	"BUTTON"	; BOUT
V$14	str	"INSERT"	; INTR
V$15	str	"CASS"	; CASS
V$16	str	"NOTHING"	; RIEN
V$17	str	"LOOK"	; VOIE
V$18	str	"DOWN"	; DESC
V$19	str	"TAKE"	; PREN
V$20	str	"ACID"	; FLAC
V$21	str	"BOTTLE"	; GOUR
V$22	str	"SUIT"	; COMB
V$23	str	"GUN"	; PIST
V$24	str	"TOOL"	; OUTI
V$25	str	"KKKK"	; KKKK
V$26	str	"LIGHT"	; ALLU
V$27	str	"LAMP"	; LAMP
V$28	str	"STICK"	; MANE
V$29	str	"LEVE"	; LEVI
V$30	str	"BOX"	; BOIT
V$31	str	"BREAK"	; ECLA
V$32	str	"EYE"	; OEIL
V$33	str	"HIT"	; TAPE
V$34	str	"FORM"	; FORM
V$35	str	"REPA"	; REPA
V$36	str	"MOTE"	; MOTE
V$37	str	"ORQU"	; ORQU
V$38	str	"DECR"	; DECR
V$39	str	"INVE"	; INVE
V$40	str	"DROP"	; POSE
V$41	str	"THROW"	; LANC
V$42	str	"WEAR"	; ENFI
V$43	str	"ETEI"	; ETEI
V$44	str	"DRINK"	; BOIS
V$45	str	"PUSH"	; POUS
V$46	str	"AMEN"	; AMEN
V$47	str	"CODE"	; CODE
V$73	str	"TEMPO"	; Apple II
V$74	str	"QUIT"	; Apple II
V$75	str	"CASE"	; Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"laser gun"00
O$2	asc	"tools"00
O$3	asc	"suit"00
O$4	asc	"worn suit"00
O$5	asc	"acid flask"00
O$6	asc	"black box"00
O$7	asc	"bottle"00
O$8	asc	"empty bottle"00
O$9	asc	"cassette"00
O$10	asc	"erased cassette"00
O$11	asc	"lamp"00
O$12	asc	"lighted lamp"00

*-----------------------------------
* STRINGS
*-----------------------------------

*	asc	"1234567890123456789012345678901234567890"

strILFAITNOIR
	asc	"It is very dark, perhaps you should"8D
	asc	"switch on the lights"00

strILYA	asc	8D"The room contains:"00
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
	

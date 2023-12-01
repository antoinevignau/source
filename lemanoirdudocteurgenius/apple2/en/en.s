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
* 4000 - LES REPONSES
*-----------------------------------

str4000	asc	"You kept the lamp on too long,"8D
	asc	"it exploded"00

str4010	asc	"You forgot to close the faucet"8D
	asc	"You die under tons of water"00

str4020	asc	"The door has just closed behind you"8D
	asc	"You are a prisoner..."00

str4030	asc	"You triped on the stairs,"8D
	asc	"you are impaled on the knife!"00

str4040	asc	"You spill the water down the stairs,"8D
	asc	"causing a discharge of the"00
str4042	asc	8D"electrical outlet"00

str4050	asc	"You are safe thanks to the suit"8D
	asc	"you have put on...!"00

str4060	asc	"You die of electric shot..."00

str4070	asc	"The room was full of explosive gas,"8D
	asc	"you should have extinguished..."00
str4072	asc	8D"We will pick up your pieces"8D
	asc	"another day...!"00

str4080	asc	"You die impalted on spears of the"8D
	asc	"wall...!"00

str4090	asc	"The door does not open from this room"00

str4100	asc	"The lamp and the fire refuse to"8D
	asc	"work in this room"00

str4110	asc	"You fall into a trap, you dislocate"8D
	asc	"arriving on the ground..."00

str4120	asc	"You are right to pass, because this"8D
	asc	"monster was only a 3D projection"00
str4124	asc	8D"on a smoken screen"00

str4130	asc	"You are right, curiosity killed the cat"00
str4133	asc	8D"            Bye"00

str4140	asc	"You are right to wait, but this"
	asc	"cannot last forever..."00

str4150	asc	"You are lucky because this chest was open"00
str4152	asc	8D"A message inside says: do not"8D
	asc	"respect the colors of the Highway code?"00
str4156	asc	8D"Hold on, the chest closes"00

str4160	asc	"Now you have a lamp full of oil"00

str4170	asc	"You have nothing to carry the oil"00

str4180	asc	"The fire you left lit exploded"00
str4185	asc	8D"It kills thoughtlessness..."00

str4190	asc	"Walking long and large in this house"00
str4195	asc	8D"you fall into a deadly coma"00

str4200	asc	"Water flows..."00

str4210	asc	"Your feet are soaked and it makes you"8D
	asc	"very sick..."00
str4215	asc	8D"You die of triple pneumonia...!"00

str4220	asc	"The title is: "00
str4225	asc	8D"Death on the first page."00

str4230	asc	"The book exploded when you opened it..."00

str4240	asc	"The paper says: search the key."00

str4250	asc	"The key will allow you to find the"8D
	asc	"entrance door code."00

str4260	asc	"There is, next to the door, a numerical"8D
	asc	"keypad for entering a code"00

str4270	asc	"To do what...?"00

str4280	asc	8D"There is a smell of gas."00

str4290	asc	"Apparently, there is no smell but..."00

str4300	asc	"It is already done, you funny fool"00

str4310	asc	"Maybe you need a fire"00

str4320	asc	"The lamp does not contain oil"00

str4330	asc	"You do not have it"00

str4340	asc	"The fire is still lit and"8D
	asc	"it lights up the room."00
	
str4350	asc	"The torch was trapped, it"8D
	asc	"exploded in your hands..."00
	
str4360	asc	"The lamp is still lit and it"8D
	asc	"enlightened"00

str4370	asc	"A dwarf just throwed a stab at you"8D
	asc	"in the heart..."00
	
str4380	asc	"A dwarf just rushed at you, it impales"8D
	asc	"on your scissor"00

str4390	asc	"A dwarf just rushed at you, it impales"8D
	asc	"on your knife"00

str4400	asc	"You just spilled the pot"00

str4410	asc	"The lighting just fell on the house"00
str4412	asc	8D"The house no longer exists, neither you"00

str4420	asc	"Walking in the dark, you tripped"00
str4425	asc	8D"you die of a skull fracture"00

str4430	asc	"You cannot work in the dark"00

str4440	asc	"The light of the fire is not enough"8D
	asc	"to work..."00

str4450	asc	"Impossible!"8D00

str4460	asc	"You have no tools..."

str4470	asc	"The teleporter is broken, the buttons"8D
	asc	"do not work."00

str4480	asc	"The teleporter just exploded, you"8D
	asc	"are decomposed...!"00
	
str4490	asc	"The teleporter stars, you disappear"00
	
str4500	asc	"You take 30,0000 Volts in your fingers"00

str4510	asc	"The closet is locked"00

str4520	asc	"The horrible monster out of the closet"8D
	asc	"just devoured you"00

str4530	asc	"You should not flee"00

str4540	asc	"You are right to use the scissors,"8D
	asc	"the monster is dead"00

str4550	asc	8D"Inside the closet, number "00
str4552	asc	" is registered"00
str4555	asc	8D"The closet closes."00

str4560	asc	"The gun exploded"00

str4570	asc	"The numeric keyboard exploded"00

str4580	asc	"The numeric keyboard caught fire,"8D
	asc	"Luckily, you had "00
str4582	asc	"a pot full of ware"00
str4585	asc	8D"that allows you extinguish the fire"00

str4590	asc	8D"Code number? "00

strCODEEXACT
	asc	"The code is exact... The door opens......"00
strENDEHORS
	asc	8D"You are now outside the house..."

str4610	asc	"Inside the closet, there is a word"8D
	asc	"talking about a teleporter"00
str4615	asc	8D"Hold on, the closed closes by itself..."00

str4620	asc	"Before putting it on the ground, you"8D
	asc	"may need to remove it"00

str4630	asc	"Thee is a horrible monster in front of you"8D
	asc	"that came out of the closet."00

str4640	asc	"The closet was trapped, you should not"8D
	asc	"have opened it"00

*-----------------------------------
* LIEUX
*-----------------------------------

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

strVOUS	asc	8D"You are "00
str7000	asc	"in front of the manor of"00
str7001	asc	8D"            Dr Genius"00
str7010	asc	"in the entrance hall"00
str7020	asc	"at the bottom of the stairs to"8D
	asc	"the 2nd floor"00
str7030	asc	"in the dining room"00
str7040	asc	"in a library without books...!"00
str7050	asc	"in a laundry room"00
str7060	asc	"in the living room"00
str7070	asc	"in a bedroom"00
str7080	asc	"in a corridor"00
str7090	asc	"in a waiting room"00
str7100	asc	"in a vestibule"00
str7110	asc	"in the guest room"00
str7120	asc	"in a bedroom"00
str7130	asc	""00	; nada
str7140	asc	"in a small room"00
str7150	asc	"in the laboratory of"00	; + :7001
str7160	asc	"in a small empty room"00
str7170	asc	"! You actually do not know"8D
	asc	"where you are"00
str7180	asc	"at the top of the stairs"00
str7190	asc	"in the bathroom"00
str7200	asc	"in the living room"00
str7210	asc	"in a somky room"00
str7220	asc	"in a large room"00
str7230	asc	"in a storage room"00
str7240	asc	"in the dressing room"00

strREPLAY	asc	8D"Do you want to play again? "00

*		"0123456789012345678901234567890123456789"
	
strGAGNE	asc	"This is exceptional, you are the first"8D8D
	asc	"to get out of this house alive, but"8D8D
	asc	"if I were you, I would start to flee"8D8D
	asc	"because a dwarf may be lurking around..."00
	
*-----------------------------------
* 40000 - LISTE DES INSTRUCTIONS
*-----------------------------------

strINSTR	asc	8D"Do you want to know how to play? "00

strINSTR2	asc	8D8D
	asc	"You have arrived in the mansion of"8D
	asc	"            Dr Genius..."8D
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
	asc	"The Manor of Dr Genius ............."00
	
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
V$13	str	"PICK"	; RAMASSER
V$14	str	"DROP"	; POSER
V$15	str	"OPEN"	; OUVRIR
V$16	str	"SHUT"	; FERMER
V$17	str	"ENTE"	; ENTRER
V$18	str	"MOVE"	; AVANCER
V$19	str	"LIGH"	; ALLUMER
V$20	str	"EXTI"	; ETEINDRE
V$21	str	"REPA"	; REPARER
V$22	str	"HELP"	; DEPANNER
V$23	str	"READ"	; LIS (LIRE)
V$24	str	"LOOK"	; REGARDER
V$25	str	"TURN"	; RETOURNER
V$26	str	"SNIF"	; RENIFLER
V$27	str	"SMEL"	; SENS (SENTIR)
V$28	str	"FILL"	; REMPLIT
V$29	str	"EMPT"	; VIDER
V$30	str	"INVE"	; INVENTAIRE
V$31	str	"LIST"	; LISTE
V$32	str	"NOTH"	; RIEN
V$33	str	"WARN"	; ATTENTION
V$34	str	"DAGG"	; POIGNARD
V$35	str	"KNIF"	; COUTEAU
V$36	str	"SCRE"	; TOURNEVIS
V$37	str	"LAMP"	; LAMPE
V$38	str	"CODE"	; CODE
V$39	str	"STAI"	; ESCALIER
V$40	str	"GUN"	; PISTOLET
V$41	str	"CLOS"	; PLACARD
V$42	str	"TORC"	; TORCHE
V$43	str	"TELE"	; TELEPORTEUR
V$44	str	"MONS"	; MONSTRE
V$45	str	"OIL"	; PETROLE
V$46	str	"POT"	; POT
V$47	str	"BED"	; LIT
V$48	str	"KEY"	; CLEF
V$49	str	"PAPE"	; PAPIER
V$50	str	"BOOK"	; LIVRE
V$51	str	"FIRE"	; BRIQUET
V$52	str	"SUIT"	; COMBINAISON
V$53	str	"CHES"	; COFFRE
V$54	str	"RED"	; ROUGE
V$55	str	"BLUE"	; BLEU
V$56	str	"GREE"	; VERT
V$57	str	"TITL"	; TITRE
V$58	str	"FAUC"	; ROBINET
V$59	str	"SCIS"	; CISEAU
V$60	str	"CARR"	; PORTER
V$61	str	"ENAB"	; ACTIVER
V$62	str	"DISC"	; JETER
V$63	str	"THRO"	; LANCER
V$64	str	"WATE"	; EAU
V$65	str	"WEAR"	; ENFILER
V$66	str	"PASS"	; PASSER
V$67	str	"PUSH"	; APPUYER
V$68	str	"BURY"	; ENFOUIR
V$69	str	"REMO"	; ENLEVER
V$70	str	"TYPE"	; RENTRER (CODE)
V$71	str	"TEMPO"	; TEMPO - Apple II
V$72	str	"QUIT"	; QUITTER - Apple II
V$73	str	"CASE"	; CASSE - Apple II

*-----------------------------------
* OBJETS
*-----------------------------------

O$1	asc	"an electric torch"00
O$2	asc	"a tap"00
O$3	asc	"scissors"00
O$4	asc	"a screwdriver"00
O$5	asc	"an oil lamp"00
O$6	asc	"a full lamp"00
O$7	asc	"a lighted lamp"00
O$8	asc	"a knife"00
O$9	asc	"a paper"00
O$10	asc	"a book"00
O$11	asc	"oil in a sink"00
O$12	asc	"a key"00
O$13	asc	"a red button"00
O$14	asc	"a blue button"00
O$15	asc	"a green button"00
O$16	asc	"a teleporter"00
O$17	asc	"a repaired teleporter"00
O$18	asc	"a silver suit"00
O$19	asc	"a coated suit"00
O$20	asc	"a monster to the east"00
O$21	asc	"a gun"00
O$22	asc	"a fire"00
O$23	asc	"a lighted fire"00
O$24	asc	"a pot"00
O$25	asc	"a pot full of water"00

*-----------------------------------
* STRINGS
*-----------------------------------

strILFAITNOIR
	asc	"It is very dark, perhaps you should"8D
	asc	"turn on the lights"00

strILYA	asc	8D"The room contains:"00
strCOMMA	asc	","00
strSPACE	asc	" "00
strRETURN	asc	8D00

strCOMMANDE
	asc	8D"Command? "00

strJENECOMPRENDS
	asc	8D"I do not understand..."00
	
strIMPOSSIBLE
	asc	8D"Not possible "00
strCECHEMIN
	asc	"to take this path"00
strEXCLAM
	asc	" !"00
	

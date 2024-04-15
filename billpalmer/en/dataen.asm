*
* Bill Palmer
*

nombre_icones	=	30

* TABLEAUX DE COORDONNEES DES ICONES

icones_coordonnees
	dw	4,117,25,137
	dw	26,117,47,137
	dw	48,117,69,137
	dw	70,117,91,137
	dw	92,117,113,137
	dw	114,117,135,137
	dw	136,117,157,137
	dw	158,117,179,137
	dw	180,117,201,137
	dw	202,117,223,137
	dw	4,138,25,158
	dw	26,138,47,158
	dw	48,138,69,158
	dw	70,138,91,158
	dw	92,138,113,158
	dw	114,138,135,158
	dw	136,138,157,158
	dw	158,138,179,158
	dw	180,138,201,158
	dw	202,138,223,158

* ces icônes font 22 x 23 soit 16h x 17h

	dw	230,112,250,134	; haut	 E6, 70, FA, 86	 - E6 70 FC 87
	dw	254,112,274,134	; bas	 FE, 70, 112, 86 - FE 70 114 87
	dw	230,137,250,159	; gauche E6, 89, FA, 9F	 - E6 89 FC A0
	dw	254,137,274,159	; droite FE, 89, 112, 9F - FE 89 114 A0

* ces icônes font 40 x 27 soit 28h x 1Bh

	dw	277,74,317,100	; main	 - 278,  74, 318, 101 => 4A, 116, 65, 13E
	dw	277,103,317,129	; oeil	 - 278, 103, 318, 130 => 67, 116, 82, 13E
	dw	277,132,317,158	; bouche - 278, 132, 318, 159 => 84, 116, 9F, 13E

	dw	277,2,317,13	; about	- 2, 116, D, 13E
	dw	277,16,317,42	; save	- 10, 116, 2B, 13E
	dw	277,45,317,71	; load	- 2E, 116, 49, 13E

* CHAINES CONTENANT LES BLOCS DES ICONES

icones	ds	nombre_icones

* VARIABLES CONTENANT LES NUMEROS DES ICONES

photo	=	1
billet_davion	=	2
carte_de_credit	=	3
passeport	=	4
brindilles	=	5
machette	=	6
fetiche	=	7
briquet	=	8
carte_didentite	=	9
laitue	=	10
souris_mecanique	=	11
boite_de_conserve	=	12
ouvre_boite	=	13
livre	=	14
bombe	=	15
journal	=	16
mitraillette	=	17
appeau	=	18
revolver	=	19
*
animation	=	20
*
nord	=	21
sud	=	22
gauche	=	23
droite	=	24
main	=	25
oeil	=	26
bouche	=	27
copyright	=	28
sauvegarde	=	29
chargement	=	30

* INDICATEURS

nombre_indicateurs	=	17	; LOGO - was 16 in original source code

indicateur	ds	nombre_indicateurs

train_arrete	=	1
controleur_passe	=	2
livre_donne	=	3
elephant_enfuis	=	4
elephant_arrive	=	5
mechant	=	6
mechant_assome	=	7
bill_desert	=	8
feu_allume	=	9
photo_montree	=	10
camera_mort	=	11
professeur_parti	=	12
canon	=	13
destruction_base	=	14
compte_a_rebours	=	15
lieutenant	=	16
homme_attaque	=	17

* TABLEAU DE L'ETAT DES OBJETS

nombre_objets	=	20

objet	ds	nombre_objets
objet_apparu	ds	nombre_objets

objet_pris	=	99
objet_inexistant	=	98
objet_detruit	=	97

* DESCRIPTION DES OBJETS

description_objet
	da	descr_objet1
	da	descr_objet2
	da	descr_objet3
	da	descr_objet4
	da	descr_objet5
	da	descr_objet6
	da	descr_objet7
	da	descr_objet8
	da	descr_objet9
	da	descr_objet10
	da	descr_objet11
	da	descr_objet12
	da	descr_objet13
	da	descr_objet14
	da	descr_objet15
	da	descr_objet16
	da	descr_objet17
	da	descr_objet18
	da	descr_objet19
	da	descr_objet20

descr_objet1	str	'A photo of Professor X.!'
descr_objet2	str	'A plane ticket to N'27'Gwanal'8e'l'8e
descr_objet3	str	'A credit card. There must be some money left in the account.'
descr_objet4	str	'Passport. Inseparable companion of the Adventurer'
descr_objet5	str	'Twigs. It must be able to burn easily'
descr_objet6	str	'A machete (calm down!)'
descr_objet7	str	'The famous fetish so coveted!!'
descr_objet8	str	'Click click, a lighter'
descr_objet9	str	'Bill'27's ID card when he takes the subway.'
descr_objet10	str	'An old salad. Not edible for a civilized being...'
descr_objet11	str	'A mechanical mouse. It shakes a few seconds after being raised'
descr_objet12	str	'A box of paella. No time to eat...'
descr_objet13	str	'A can opener'
descr_objet14	str	'The Perfect Adventurer'27's Guide. Bill hasn'27't needed it for a long time!'
descr_objet15	str	'The bomb seems to be disarmed'
descr_objet16	str	'The Adventurer'27's Gazette. A freelance writer reveals that a fetish was stolen from N'27'Gwanal'8e'l'8e' by Professor X., this scholar of sad renown'
descr_objet17	str	'Let'27's keep calm: this submachine gun is loaded ...'
descr_objet18	str	'A call. It makes a weird noise when you blow in it'
descr_objet19	str	'This gun should only be used for a good cause!'
descr_objet20	str	''

* COORDONNEES DES ZONES, COMMENTAIRES ET DIRECTIONS

nombre_salles	=	56
nombre_zones	=	10

* ATARI ST
* zones (nombre de zones cliquables dans la salle)
* x1(nombre_salles, nombre_zones)
* x2(nombre_salles, nombre_zones)
* y1(nombre_salles, nombre_zones)
* y2(nombre_salles, nombre_zones)
* commentaire_main(nombre_salles, nombre_zones)
* commentaire_oeil(nombre_salles, nombre_zones)
* commentaire_bouche(nombre_salles, nombre_zones)
* directions(nombre_salles, 4)
*
* APPLE IIGS
* 1 word for number of zones
* 4 word for directions
* For each zone
*  4 word for zone area
*  1 ptr to commentaire main
*  1 ptr to commentaire oeil
*  1 ptr to commentaire bouche

table_salle
	da	salle1,salle2,salle3,salle4,salle5,salle6,salle7,salle8,salle9,salle10
	da	salle11,salle12,salle13,salle14,salle15,salle16,salle17,salle18,salle19,salle20
	da	salle21,salle22,salle23,salle24,salle25,salle26,salle27,salle28,salle29,salle30
	da	salle31,salle32,salle33,salle34,salle35,salle36,salle37,salle38,salle39,salle40
	da	salle41,salle42,salle43,salle44,salle45,salle46,salle47,salle48,salle49,salle50
	da	salle51,salle52,salle53,salle54,salle55,salle56

salle1
	dw	7			; +00
	dw	2,4,0,0			; +02
	dw	123,84,138,106		; +10 - chaque zone fait 14 octets
	da	salle1_zone1_main	; +18
	da	salle1_zone1_oeil	; +20
	da	salle1_zone1_bouche	; +22
	dw	54,71,68,84		; +24
	da	salle1_zone2_main
	da	salle1_zone2_oeil
	da	salle1_zone2_bouche
	dw	79,68,117,108
	da	salle1_zone3_main
	da	salle1_zone3_oeil
	da	salle1_zone3_bouche
	dw	19,43,54,98
	da	salle1_zone4_main
	da	salle1_zone4_oeil
	da	salle1_zone4_bouche
	dw	77,23,150,57
	da	salle1_zone5_main
	da	salle1_zone5_oeil
	da	salle1_zone5_bouche
	dw	158,37,247,108
	da	salle1_zone6_main
	da	salle1_zone6_oeil
	da	salle1_zone6_bouche
	dw	27,54,42,59
	da	salle1_zone7_main
	da	salle1_zone7_oeil
	da	salle1_zone7_bouche
salle1_zone1_main	str	''
salle1_zone1_oeil	str	'An old packing box'
salle1_zone1_bouche	str	''
salle1_zone2_main	str	''
salle1_zone2_oeil	str	'The mailbox'
salle1_zone2_bouche	str	''
salle1_zone3_main	str	'Disgusting...'
salle1_zone3_oeil	str	'A tramp'
salle1_zone3_bouche	str	d2'A little politeness! I was an adventurer game developer, me Sir!'d3
salle1_zone4_main	str	''
salle1_zone4_oeil	str	'What if Bill was looking out the window?'
salle1_zone4_bouche	str	''
salle1_zone5_main	str	'How about you walk in through the door?'
salle1_zone5_oeil	str	'It is inside Bill'27's apartment'
salle1_zone5_bouche	str	''
salle1_zone6_main	str	'Don'27't touch!'
salle1_zone6_oeil	str	'He is Bill Palmer, hero of heroes on the way to a new adventure'
salle1_zone6_bouche	str	''
salle1_zone7_main	str	'Bill is not going to tear the plate off!'
salle1_zone7_oeil	str	d2'Bill Palmer. Adventurer. On appointment.'d3
salle1_zone7_bouche	str	''

salle2
	dw	7
	dw	3,1,0,0
	dw	77,26,98,51
	da	salle2_zone1_main
	da	salle2_zone1_oeil
	da	salle2_zone1_bouche
	dw	82,53,89,61
	da	salle2_zone2_main
	da	salle2_zone2_oeil
	da	salle2_zone2_bouche
	dw	2,20,55,47
	da	salle2_zone3_main
	da	salle2_zone3_oeil
	da	salle2_zone3_bouche
	dw	22,60,84,85
	da	salle2_zone4_main
	da	salle2_zone4_oeil
	da	salle2_zone4_bouche
	dw	187,49,203,72
	da	salle2_zone5_main
	da	salle2_zone5_oeil
	da	salle2_zone5_bouche
	dw	71,8,97,23
	da	salle2_zone6_main
	da	salle2_zone6_oeil
	da	salle2_zone6_bouche
	dw	172,44,179,50
	da	salle2_zone7_main
	da	salle2_zone7_oeil
	da	salle2_zone7_bouche
salle2_zone1_main	str	'Bill is already sporting his leather jacket'
salle2_zone1_oeil	str	''
salle2_zone1_bouche	str	''
salle2_zone2_main	str	''
salle2_zone2_oeil	str	'The pocket'
salle2_zone2_bouche	str	''
salle2_zone3_main	str	''
salle2_zone3_oeil	str	'A shelf full of old books and computer magazines'
salle2_zone3_bouche	str	''
salle2_zone4_main	str	'A little soggy'
salle2_zone4_oeil	str	'The couch'
salle2_zone4_bouche	str	''
salle2_zone5_main	str	'Be careful, it is fragile!'
salle2_zone5_oeil	str	'A worthless old Ming vase'
salle2_zone5_bouche	str	''
salle2_zone6_main	str	'The hole is already big enough'
salle2_zone6_oeil	str	'Hey Bill! Should see to redo the plasters!'
salle2_zone6_bouche	str	''
salle2_zone7_main	str	'Damn! The blind is stuck. We will have to find another trick to watch the neighbor get dressed'
salle2_zone7_oeil	str	'The blind zipper'
salle2_zone7_bouche	str	''

salle3
	dw	3
	dw	2,2,2,2
	dw	138,68,153,81
	da	salle3_zone1_main
	da	salle3_zone1_oeil
	da	salle3_zone1_bouche
	dw	86,91,104,103
	da	salle3_zone2_main
	da	salle3_zone2_oeil
	da	salle3_zone2_bouche
	dw	205,0,227,21
	da	salle3_zone3_main
	da	salle3_zone3_oeil
	da	salle3_zone3_bouche
salle3_zone1_main	str	''
salle3_zone1_oeil	str	'The lock. Currently open.'
salle3_zone1_bouche	str	''
salle3_zone2_main	str	''
salle3_zone2_oeil	str	''
salle3_zone2_bouche	str	''
salle3_zone3_main	str	'Not yet the time to draw the curtains'
salle3_zone3_oeil	str	'Not very clean. Should see to wash it all, Bill!'
salle3_zone3_bouche	str	''

salle4
	dw	3
	dw	6,1,0,0
	dw	201,39,270,97	; LOGO - original code is 101,
	da	salle4_zone1_main
	da	salle4_zone1_oeil
	da	salle4_zone1_bouche
	dw	2,53,157,109
	da	salle4_zone2_main
	da	salle4_zone2_oeil
	da	salle4_zone2_bouche
	dw	177,58,187,67
	da	salle4_zone3_main
	da	salle4_zone3_oeil
	da	salle4_zone3_bouche
salle4_zone1_main	str	''
salle4_zone1_oeil	str	'It was a nice car...'
salle4_zone1_bouche	str	'Do you speak car language?'
salle4_zone2_main	str	'It would leave fingerprints!'
salle4_zone2_oeil	str	'No, no. Not this one. The other one!!!'
salle4_zone2_bouche	str	'We would eat...'
salle4_zone3_main	str	''
salle4_zone3_oeil	str	'The hood open there'
salle4_zone3_bouche	str	''

salle5
	dw	2
	dw	4,4,4,4
	dw	144,53,188,73
	da	salle5_zone1_main
	da	salle5_zone1_oeil
	da	salle5_zone1_bouche
	dw	44,80,118,107
	da	salle5_zone2_main
	da	salle5_zone2_oeil
	da	salle5_zone2_bouche
salle5_zone1_main	str	'Fix it? To do what?'
salle5_zone1_oeil	str	''
salle5_zone1_bouche	str	''
salle5_zone2_main	str	''
salle5_zone2_oeil	str	'Just for a few extra parts...'
salle5_zone2_bouche	str	''

salle6
	dw	4
	dw	4,4,4,4
	dw	222,49,233,62
	da	salle6_zone1_main
	da	salle6_zone1_oeil
	da	salle6_zone1_bouche
	dw	209,51,217,61
	da	salle6_zone2_main
	da	salle6_zone2_oeil
	da	salle6_zone2_bouche
	dw	234,56,265,74
	da	salle6_zone3_main
	da	salle6_zone3_oeil
	da	salle6_zone3_bouche
	dw	188,64,201,76
	da	salle6_zone4_main
	da	salle6_zone4_oeil
	da	salle6_zone4_bouche
salle6_zone1_main	str	''
salle6_zone1_oeil	str	'The ignition key'
salle6_zone1_bouche	str	''
salle6_zone2_main	str	''
salle6_zone2_oeil	str	'The altimeter'
salle6_zone2_bouche	str	''
salle6_zone3_main	str	''
salle6_zone3_oeil	str	'The glove box'
salle6_zone3_bouche	str	''
salle6_zone4_main	str	'It is okay, it is stalled'
salle6_zone4_oeil	str	'The gear lever'
salle6_zone4_bouche	str	''

salle7
	dw	3
	dw	9,0,0,4
	dw	2,72,77,96
	da	salle7_zone1_main
	da	salle7_zone1_oeil
	da	salle7_zone1_bouche
	dw	95,23,134,36
	da	salle7_zone2_main
	da	salle7_zone2_oeil
	da	salle7_zone2_bouche
	dw	177,44,271,109
	da	salle7_zone3_main
	da	salle7_zone3_oeil
	da	salle7_zone3_bouche
salle7_zone1_main	str	'It cannot be taken like that'
salle7_zone1_oeil	str	'Quickly, he leaves to N'27'Gwanal'8e'l'8e'!'
salle7_zone1_bouche	str	''
salle7_zone2_main	str	'Would take a lot of moment to jump'
salle7_zone2_oeil	str	'Too late for that one'
salle7_zone2_bouche	str	''
salle7_zone3_main	str	''
salle7_zone3_oeil	str	'She does not get better with age'
salle7_zone3_bouche	str	''

salle8
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle8_zone1_main
	da	salle8_zone1_oeil
	da	salle8_zone1_bouche
salle8_zone1_main	str	''
salle8_zone1_oeil	str	''
salle8_zone1_bouche	str	''

salle9
	dw	4
	dw	0,7,0,0
	dw	19,15,70,61
	da	salle9_zone1_main
	da	salle9_zone1_oeil
	da	salle9_zone1_bouche
	dw	143,14,192,60
	da	salle9_zone2_main
	da	salle9_zone2_oeil
	da	salle9_zone2_bouche
	dw	184,50,210,61
	da	salle9_zone3_main
	da	salle9_zone3_oeil
	da	salle9_zone3_bouche
	dw	194,16,226,23
	da	salle9_zone4_main
	da	salle9_zone4_oeil
	da	salle9_zone4_bouche
salle9_zone1_main	str	'Let'27's see, a little discretion!!!'
salle9_zone1_oeil	str	'Glup!!'
salle9_zone1_bouche	str	'Schmack!'
salle9_zone2_main	str	'Instead, keep your hand on the mouse'
salle9_zone2_oeil	str	'Bill should first think about his mission...'
salle9_zone2_bouche	str	d2'We have special promotions for tickets to South Africa!'d3
salle9_zone3_main	str	'Above all, you are not embarrassed...'
salle9_zone3_oeil	str	'A telephone'
salle9_zone3_bouche	str	''
salle9_zone4_main	str	''
salle9_zone4_oeil	str	'Credit cards are accepted'
salle9_zone4_bouche	str	''

salle10
	dw	5
	dw	0,0,0,9
	dw	192,28,224,98
	da	salle10_zone1_main
	da	salle10_zone1_oeil
	da	salle10_zone1_bouche
	dw	121,60,153,108
	da	salle10_zone2_main
	da	salle10_zone2_oeil
	da	salle10_zone2_bouche
	dw	24,21,74,100
	da	salle10_zone3_main
	da	salle10_zone3_oeil
	da	salle10_zone3_bouche
	dw	239,10,267,106
	da	salle10_zone4_main
	da	salle10_zone4_oeil
	da	salle10_zone4_bouche
	dw	4,16,24,50
	da	salle10_zone5_main
	da	salle10_zone5_oeil
	da	salle10_zone5_bouche
salle10_zone1_main	str	d2'It is very nice to help me my good sir!'d3
salle10_zone1_oeil	str	'Too bad he is White. He looked like Stevie Wonder'
salle10_zone1_bouche	str	d2'Sorry, is this the soccer game here?'d3
salle10_zone2_main	str	'Come on!!! At her age!!!'
salle10_zone2_oeil	str	'If you are already looking at little girls...'
salle10_zone2_bouche	str	d2'You want my photo?'d3
salle10_zone3_main	str	''
salle10_zone3_oeil	str	'Be careful, it is the customs officer!'
salle10_zone3_bouche	str	'Show your passport, please!'
salle10_zone4_main	str	''
salle10_zone4_oeil	str	'It must be a diplomat coming home'
salle10_zone4_bouche	str	d2'Anothe'27' one who thinks he is Ha'27'ison Fowd...'d3
salle10_zone5_main	str	'Stop!'
salle10_zone5_oeil	str	d2'Stop'd3
salle10_zone5_bouche	str	'Re-stop'

salle11
	dw	4
	dw	0,0,10,12
	dw	39,76,107,91
	da	salle11_zone1_main
	da	salle11_zone1_oeil
	da	salle11_zone1_bouche
	dw	47,55,82,91
	da	salle11_zone2_main
	da	salle11_zone2_oeil
	da	salle11_zone2_bouche
	dw	129,17,191,87
	da	salle11_zone3_main
	da	salle11_zone3_oeil
	da	salle11_zone3_bouche
	dw	190,8,262,63
	da	salle11_zone4_main
	da	salle11_zone4_oeil
	da	salle11_zone4_bouche
salle11_zone1_main	str	'Bill already has his ticket'
salle11_zone1_oeil	str	'It is a plane ticket to Auckland. A one-way ticket is enough!'
salle11_zone1_bouche	str	''
salle11_zone2_main	str	''
salle11_zone2_oeil	str	'Is he the pilot?!?!'
salle11_zone2_bouche	str	d2'Think that there is only one parachute for the whole plane...'d3
salle11_zone3_main	str	'To push him??'
salle11_zone3_oeil	str	'What if Bill did the same before he encountered the worst?'
salle11_zone3_bouche	str	d2'Argh!!'d3
salle11_zone4_main	str	'Don'27't be afraid...'
salle11_zone4_oeil	str	d2'Weight without load: 213 Kg'd3
salle11_zone4_bouche	str	d2'Aren'27't you gonna get off on our honeymoon!?'d3

salle12
	dw	4
	dw	0,13,0,0
	dw	6,79,35,91
	da	salle12_zone1_main
	da	salle12_zone1_oeil
	da	salle12_zone1_bouche
	dw	43,64,54,79
	da	salle12_zone2_main
	da	salle12_zone2_oeil
	da	salle12_zone2_bouche
	dw	41,82,61,98
	da	salle12_zone3_main
	da	salle12_zone3_oeil
	da	salle12_zone3_bouche
	dw	71,14,104,49
	da	salle12_zone4_main
	da	salle12_zone4_oeil
	da	salle12_zone4_bouche
salle12_zone1_main	str	''
salle12_zone1_oeil	str	'Mecca'
salle12_zone1_bouche	str	''
salle12_zone2_main	str	''
salle12_zone2_oeil	str	'Alaska 13583 km'
salle12_zone2_bouche	str	''
salle12_zone3_main	str	''
salle12_zone3_oeil	str	'Maubeuge (city center) : first left'
salle12_zone3_bouche	str	''
salle12_zone4_main	str	'Be careful, it cuts!!!'
salle12_zone4_oeil	str	'A helix'
salle12_zone4_bouche	str	''

salle13
	dw	3
	dw	15,12,12,14
	dw	150,12,173,24
	da	salle13_zone1_main
	da	salle13_zone1_oeil
	da	salle13_zone1_bouche
	dw	178,25,206,37
	da	salle13_zone2_main
	da	salle13_zone2_oeil
	da	salle13_zone2_bouche
	dw	28,91,89,101
	da	salle13_zone3_main
	da	salle13_zone3_oeil
	da	salle13_zone3_bouche
salle13_zone1_main	str	''
salle13_zone1_oeil	str	d2'Dromacar dealer'd3
salle13_zone1_bouche	str	''
salle13_zone2_main	str	''
salle13_zone2_oeil	str	d2'Walk this way!!!!'d3
salle13_zone2_bouche	str	''
salle13_zone3_main	str	''
salle13_zone3_oeil	str	'Hum! There seems to be something under these stones!'
salle13_zone3_bouche	str	''

salle14
	dw	3
	dw	0,13,0,0
	dw	195,22,225,60
	da	salle14_zone1_main
	da	salle14_zone1_oeil
	da	salle14_zone1_bouche
	dw	231,33,245,59
	da	salle14_zone2_main
	da	salle14_zone2_oeil
	da	salle14_zone2_bouche
	dw	2,60,60,106
	da	salle14_zone3_main
	da	salle14_zone3_oeil
	da	salle14_zone3_bouche
salle14_zone1_main	str	''
salle14_zone1_oeil	str	'He is the curator of the museum'
salle14_zone1_bouche	str	d2'If you bring the Stolen Fetish back to us, you will get a big reward right now!'d3
salle14_zone2_main	str	'It would be too easy if that was the one to find!'
salle14_zone2_oeil	str	'A fetish'
salle14_zone2_bouche	str	''
salle14_zone3_main	str	''
salle14_zone3_oeil	str	'It was either that or end up in cat food'
salle14_zone3_bouche	str	'Either way, it is not now that he is gonna start talking'

salle15
	dw	3
	dw	16,13,0,0
	dw	69,62,121,108
	da	salle15_zone1_main
	da	salle15_zone1_oeil
	da	salle15_zone1_bouche
	dw	2,14,68,56
	da	salle15_zone2_main
	da	salle15_zone2_oeil
	da	salle15_zone2_bouche
	dw	103,11,194,57
	da	salle15_zone3_main
	da	salle15_zone3_oeil
	da	salle15_zone3_bouche
salle15_zone1_main	str	''
salle15_zone1_oeil	str	'A seller of dromedaries'
salle15_zone1_bouche	str	d2'I only deal with real adventurers there!'d3
salle15_zone2_main	str	'Did you hope he was going to purr?'
salle15_zone2_oeil	str	'Un cam... No, a dromadary'
salle15_zone2_bouche	str	'Dromedaries do not speak, even in adventure games'
salle15_zone3_main	str	'Good boy...'
salle15_zone3_oeil	str	'He must be malnourished...'
salle15_zone3_bouche	str	''

salle16
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle16_zone1_main
	da	salle16_zone1_oeil
	da	salle16_zone1_bouche
salle16_zone1_main	str	''
salle16_zone1_oeil	str	''
salle16_zone1_bouche	str	''

salle17
	dw	1
	dw	0,0,18,0
	dw	0,0,0,0
	da	salle17_zone1_main
	da	salle17_zone1_oeil
	da	salle17_zone1_bouche
salle17_zone1_main	str	''
salle17_zone1_oeil	str	''
salle17_zone1_bouche	str	''

salle18
	dw	4
	dw	20,0,0,19
	dw	4,52,39,77
	da	salle18_zone1_main
	da	salle18_zone1_oeil
	da	salle18_zone1_bouche
	dw	36,32,117,86
	da	salle18_zone2_main
	da	salle18_zone2_oeil
	da	salle18_zone2_bouche
	dw	117,36,226,97
	da	salle18_zone3_main
	da	salle18_zone3_oeil
	da	salle18_zone3_bouche
	dw	235,36,264,97
	da	salle18_zone4_main
	da	salle18_zone4_oeil
	da	salle18_zone4_bouche
salle18_zone1_main	str	''
salle18_zone1_oeil	str	'It must be the fourth class wagon'
salle18_zone1_bouche	str	''
salle18_zone2_main	str	''
salle18_zone2_oeil	str	'The adventurer class wagon'
salle18_zone2_bouche	str	''
salle18_zone3_main	str	''
salle18_zone3_oeil	str	'The reformed model 1865 locomotive 1917 is just waiting for Bill to leave'
salle18_zone3_bouche	str	''
salle18_zone4_main	str	''
salle18_zone4_oeil	str	'A hitchhiker no doubt'
salle18_zone4_bouche	str	d2'Tchou tchou!! T'27'wain is going to leav'27d3

salle19
	dw	2
	dw	0,0,18,0
	dw	171,24,270,77
	da	salle19_zone1_main
	da	salle19_zone1_oeil
	da	salle19_zone1_bouche
	dw	181,89,235,107
	da	salle19_zone2_main
	da	salle19_zone2_oeil
	da	salle19_zone2_bouche
salle19_zone1_main	str	'Slowly, it might wake him up!'
salle19_zone1_oeil	str	'He sells tickets. But the break seems long...'
salle19_zone1_bouche	str	d2'Later, coco, later...'d3
salle19_zone2_main	str	'Ugh! Human bones...'
salle19_zone2_oeil	str	'Well, some people eat rabbit'
salle19_zone2_bouche	str	''

salle20
	dw	5
	dw	0,0,0,0
	dw	169,15,219,108
	da	salle20_zone1_main
	da	salle20_zone1_oeil
	da	salle20_zone1_bouche
	dw	225,10,271,107
	da	salle20_zone2_main
	da	salle20_zone2_oeil
	da	salle20_zone2_bouche
	dw	199,2,209,8
	da	salle20_zone3_main
	da	salle20_zone3_oeil
	da	salle20_zone3_bouche
	dw	91,16,104,26
	da	salle20_zone4_main
	da	salle20_zone4_oeil
	da	salle20_zone4_bouche
	dw	12,15,82,68
	da	salle20_zone5_main
	da	salle20_zone5_oeil
	da	salle20_zone5_bouche
salle20_zone1_main	str	''
salle20_zone1_oeil	str	'Blistering barnacles! Would we be in the Congo?'
salle20_zone1_bouche	str	d2'By crikey!'d3
salle20_zone2_main	str	''
salle20_zone2_oeil	str	'So what? The first class is also allowed to Black people.'
salle20_zone2_bouche	str	''
salle20_zone3_main	str	''
salle20_zone3_oeil	str	d2'Eat at Joe'27's. On the menu: missionnary, businessman, freelance writer. Ketchup extra'd3
salle20_zone3_bouche	str	''
salle20_zone4_main	str	''
salle20_zone4_oeil	str	'The alarm signal'
salle20_zone4_bouche	str	''
salle20_zone5_main	str	''
salle20_zone5_oeil	str	''
salle20_zone5_bouche	str	''

salle21
	dw	1
	dw	0,0,0,20
	dw	0,0,0,0
	da	salle21_zone1_main
	da	salle21_zone1_oeil
	da	salle21_zone1_bouche
salle21_zone1_main	str	''
salle21_zone1_oeil	str	''
salle21_zone1_bouche	str	''

salle22
	dw	1
	dw	0,23,23,20
	dw	0,0,0,0
	da	salle22_zone1_main
	da	salle22_zone1_oeil
	da	salle22_zone1_bouche
salle22_zone1_main	str	''
salle22_zone1_oeil	str	''
salle22_zone1_bouche	str	''

salle23
	dw	1
	dw	0,0,24,0
	dw	80,79,108,90
	da	salle23_zone1_main
	da	salle23_zone1_oeil
	da	salle23_zone1_bouche
salle23_zone1_main	str	''
salle23_zone1_oeil	str	'What if this stone was hiding something?'
salle23_zone1_bouche	str	''

salle24
	dw	2
	dw	28,23,25,0
	dw	60,75,82,105
	da	salle24_zone1_main
	da	salle24_zone1_oeil
	da	salle24_zone1_bouche
	dw	117,15,156,48
	da	salle24_zone2_main
	da	salle24_zone2_oeil
	da	salle24_zone2_bouche
salle24_zone1_main	str	''
salle24_zone1_oeil	str	d2'Warning: elephants'd3
salle24_zone1_bouche	str	''
salle24_zone2_main	str	''
salle24_zone2_oeil	str	'The top of this mountain is hiding something...'
salle24_zone2_bouche	str	''

salle25
	dw	1
	dw	0,0,0,0
	dw	162,2,263,75
	da	salle25_zone1_main
	da	salle25_zone1_oeil
	da	salle25_zone1_bouche
salle25_zone1_main	str	'Is that reasonable?'
salle25_zone1_oeil	str	'In my opinion, the self control of this pachyderm seems to be seriously damaged'
salle25_zone1_bouche	str	d2'Slow down, buddy!'d3

salle26
	dw	1
	dw	0,24,0,24
	dw	238,74,272,108
	da	salle26_zone1_main
	da	salle26_zone1_oeil
	da	salle26_zone1_bouche
salle26_zone1_main	str	'Cannot pull twigs by hand'
salle26_zone1_oeil	str	'A rare variety of an African herb renowned for its ease of combustion'
salle26_zone1_bouche	str	''

salle27
	dw	3
	dw	0,0,0,24
	dw	1,2,96,110
	da	salle27_zone1_main
	da	salle27_zone1_oeil
	da	salle27_zone1_bouche
	dw	225,71,259,109
	da	salle27_zone2_main
	da	salle27_zone2_oeil
	da	salle27_zone2_bouche
	dw	121,77,212,106
	da	salle27_zone3_main
	da	salle27_zone3_oeil
	da	salle27_zone3_bouche
salle27_zone1_main	str	''
salle27_zone1_oeil	str	''
salle27_zone1_bouche	str	''
salle27_zone2_main	str	'No need, no one is in sight'
salle27_zone2_oeil	str	'The stone that comes to knock this wretch down'
salle27_zone2_bouche	str	''
salle27_zone3_main	str	''
salle27_zone3_oeil	str	'He is dead!'
salle27_zone3_bouche	str	'And you imagined he was going to answer?'

salle28
	dw	1
	dw	0,0,0,24
	dw	1,2,96,110
	da	salle28_zone1_main
	da	salle28_zone1_oeil
	da	salle28_zone1_bouche
salle28_zone1_main	str	''
salle28_zone1_oeil	str	'We will have to climb all that'
salle28_zone1_bouche	str	'It is not a sacred mountain!'

salle29
	dw	3
	dw	32,0,0,0
	dw	2,17,36,49
	da	salle29_zone1_main
	da	salle29_zone1_oeil
	da	salle29_zone1_bouche
	dw	40,45,56,57
	da	salle29_zone2_main
	da	salle29_zone2_oeil
	da	salle29_zone2_bouche
	dw	95,93,139,109
	da	salle29_zone3_main
	da	salle29_zone3_oeil
	da	salle29_zone3_bouche
salle29_zone1_main	str	'What about the SPCA?'
salle29_zone1_oeil	str	'You never know, sometimes Bill dies...'
salle29_zone1_bouche	str	''
salle29_zone2_main	str	''
salle29_zone2_oeil	str	'It would probably make a nice catch'
salle29_zone2_bouche	str	''
salle29_zone3_main	str	''
salle29_zone3_oeil	str	'Warning! It is chasing Bill!'
salle29_zone3_bouche	str	d2'Urk Urk!'d3

salle30
	dw	2
	dw	31,27,0,27
	dw	2,17,36,49
	da	salle30_zone1_main
	da	salle30_zone1_oeil
	da	salle30_zone1_bouche
	dw	40,45,56,57
	da	salle30_zone2_main
	da	salle30_zone2_oeil
	da	salle30_zone2_bouche
salle30_zone1_main	str	'What about the SPCA?'
salle30_zone1_oeil	str	'You never know, sometimes Bill dies...'
salle30_zone1_bouche	str	''
salle30_zone2_main	str	''
salle30_zone2_oeil	str	'It would probably make a nice catch'
salle30_zone2_bouche	str	''

salle31
	dw	1
	dw	40,30,33,0
	dw	0,0,0,0
	da	salle31_zone1_main
	da	salle31_zone1_oeil
	da	salle31_zone1_bouche
salle31_zone1_main	str	''
salle31_zone1_oeil	str	''
salle31_zone1_bouche	str	''

salle32
	dw	1
	dw	0,0,0,0
	dw	162,43,188,70
	da	salle32_zone1_main
	da	salle32_zone1_oeil
	da	salle32_zone1_bouche
salle32_zone1_main	str	''
salle32_zone1_oeil	str	't seems to be able to be moved easily'
salle32_zone1_bouche	str	''

salle33
	dw	2
	dw	36,31,0,0
	dw	3,4,27,27
	da	salle33_zone1_main
	da	salle33_zone1_oeil
	da	salle33_zone1_bouche
	dw	200,3,233,21
	da	salle33_zone2_main
	da	salle33_zone2_oeil
	da	salle33_zone2_bouche
salle33_zone1_main	str	'Cannot tear off this camera!'
salle33_zone1_oeil	str	'A surveillance camera'
salle33_zone1_bouche	str	'To mist the lens?'
salle33_zone2_main	str	'Ouch! It is hot!'
salle33_zone2_oeil	str	'Dazzling'
salle33_zone2_bouche	str	''

salle34
	dw	3
	dw	0,0,0,36
	dw	70,61,112,81
	da	salle34_zone1_main
	da	salle34_zone1_oeil
	da	salle34_zone1_bouche
	dw	2,66,27,105
	da	salle34_zone2_main
	da	salle34_zone2_oeil
	da	salle34_zone2_bouche
	dw	176,24,218,58
	da	salle34_zone3_main
	da	salle34_zone3_oeil
	da	salle34_zone3_bouche
salle34_zone1_main	str	''
salle34_zone1_oeil	str	'Some embers still hot'
salle34_zone1_bouche	str	''
salle34_zone2_main	str	'Some dressers must not contain anything. It would not be fun!'
salle34_zone2_oeil	str	''
salle34_zone2_bouche	str	''
salle34_zone3_main	str	'No time to make pancakes!'
salle34_zone3_oeil	str	'Stoves (you really have to tell him everything...)'
salle34_zone3_bouche	str	''

salle35
	dw	3
	dw	0,0,0,36
	dw	70,61,112,81
	da	salle35_zone1_main
	da	salle35_zone1_oeil
	da	salle35_zone1_bouche
	dw	2,66,27,105
	da	salle35_zone2_main
	da	salle35_zone2_oeil
	da	salle35_zone2_bouche
	dw	176,24,218,58
	da	salle35_zone3_main
	da	salle35_zone3_oeil
	da	salle35_zone3_bouche
salle35_zone1_main	str	''
salle35_zone1_oeil	str	'The fire gives off smoke which escapes through the flue'
salle35_zone1_bouche	str	''
salle35_zone2_main	str	'Some dressers must not contain anything. It would not be fun!'
salle35_zone2_oeil	str	''
salle35_zone2_bouche	str	''
salle35_zone3_main	str	'No time to make pancakes!'
salle35_zone3_oeil	str	'Stoves (you really have to tell him everything...)'
salle35_zone3_bouche	str	''

salle36
	dw	2
	dw	0,33,34,39
	dw	74,12,136,94
	da	salle36_zone1_main
	da	salle36_zone1_oeil
	da	salle36_zone1_bouche
	dw	212,2,239,93
	da	salle36_zone2_main
	da	salle36_zone2_oeil
	da	salle36_zone2_bouche
salle36_zone1_main	str	''
salle36_zone1_oeil	str	'Shall we open it?'
salle36_zone1_bouche	str	d2'Someone there?'d3
salle36_zone2_main	str	'Too heavy to be moved'
salle36_zone2_oeil	str	d2'Fernand loves Georgette'd3' is engraved with a pocket knife'
salle36_zone2_bouche	str	''

salle37
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle37_zone1_main
	da	salle37_zone1_oeil
	da	salle37_zone1_bouche
salle37_zone1_main	str	''
salle37_zone1_oeil	str	''
salle37_zone1_bouche	str	''

salle38
	dw	5
	dw	0,0,36,0
	dw	146,38,168,45
	da	salle38_zone1_main
	da	salle38_zone1_oeil
	da	salle38_zone1_bouche
	dw	146,55,167,62
	da	salle38_zone2_main
	da	salle38_zone2_oeil
	da	salle38_zone2_bouche
	dw	172,39,187,58
	da	salle38_zone3_main
	da	salle38_zone3_oeil
	da	salle38_zone3_bouche
	dw	222,40,236,59
	da	salle38_zone4_main
	da	salle38_zone4_oeil
	da	salle38_zone4_bouche
	dw	242,45,272,85
	da	salle38_zone5_main
	da	salle38_zone5_oeil
	da	salle38_zone5_bouche
salle38_zone1_main	str	''
salle38_zone1_oeil	str	'What if I tell you it iss a drawer?'
salle38_zone1_bouche	str	''
salle38_zone2_main	str	''
salle38_zone2_oeil	str	'However, it is not complicated to open it...'
salle38_zone2_bouche	str	''
salle38_zone3_main	str	''
salle38_zone3_oeil	str	'We could drink it well...'
salle38_zone3_bouche	str	''
salle38_zone4_main	str	'It is the fetish that must be brought back!'
salle38_zone4_oeil	str	'Maybe a predecessor...'
salle38_zone4_bouche	str	'Not very talkative...'
salle38_zone5_main	str	'Better not to touch it'
salle38_zone5_oeil	str	'Barely more complex than an Atari..'
salle38_zone5_bouche	str	''

salle39
	dw	3
	dw	36,0,0,0
	dw	203,4,247,50
	da	salle39_zone1_main
	da	salle39_zone1_oeil
	da	salle39_zone1_bouche
	dw	234,52,241,60
	da	salle39_zone2_main
	da	salle39_zone2_oeil
	da	salle39_zone2_bouche
	dw	203,62,247,94
	da	salle39_zone1_main
	da	salle39_zone1_oeil
	da	salle39_zone1_bouche
salle39_zone1_main	str	'Nothing to do, it remains closed'
salle39_zone1_oeil	str	'We open it up?'
salle39_zone1_bouche	str	''
salle39_zone2_main	str	''
salle39_zone2_oeil	str	'Bill sees through the keyhole dozens of people bustling around the fetish plugged into electrodes!'
salle39_zone2_bouche	str	''

salle40
	dw	2
	dw	0,31,0,0
	dw	21,3,98,47
	da	salle40_zone1_main
	da	salle40_zone1_oeil
	da	salle40_zone1_bouche
	dw	76,75,154,92
	da	salle40_zone2_main
	da	salle40_zone2_oeil
	da	salle40_zone2_bouche
salle40_zone1_main	str	''
salle40_zone1_oeil	str	'It seems to lose interest in Bill'
salle40_zone1_bouche	str	'Chip chip?'
salle40_zone2_main	str	''
salle40_zone2_oeil	str	''
salle40_zone2_bouche	str	''

salle41
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle41_zone1_main
	da	salle41_zone1_oeil
	da	salle41_zone1_bouche
salle41_zone1_main	str	''
salle41_zone1_oeil	str	''
salle41_zone1_bouche	str	''

salle42
	dw	4
	dw	0,0,0,0
	dw	9,15,52,67
	da	salle42_zone1_main
	da	salle42_zone1_oeil
	da	salle42_zone1_bouche
	dw	64,25,107,76
	da	salle42_zone2_main
	da	salle42_zone2_oeil
	da	salle42_zone2_bouche
	dw	167,37,216,66
	da	salle42_zone3_main
	da	salle42_zone3_oeil
	da	salle42_zone3_bouche
	dw	227,11,272,107
	da	salle42_zone4_main
	da	salle42_zone4_oeil
	da	salle42_zone4_bouche
salle42_zone1_main	str	'Bill should not attempt hand-to-hand combat'
salle42_zone1_oeil	str	'He looks very aggressive...'
salle42_zone1_bouche	str	d2'Say your prayers, rascal!'d3
salle42_zone2_main	str	''
salle42_zone2_oeil	str	'If you want my opinion...'
salle42_zone2_bouche	str	d2'You are living your last hour'd3
salle42_zone3_main	str	''
salle42_zone3_oeil	str	''
salle42_zone3_bouche	str	d2'The Professor instructed us to come and give you flowers!'d3
salle42_zone4_main	str	''
salle42_zone4_oeil	str	''
salle42_zone4_bouche	str	d2'Hurk Hurk!'d3

salle43
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle43_zone1_main
	da	salle43_zone1_oeil
	da	salle43_zone1_bouche
salle43_zone1_main	str	''
salle43_zone1_oeil	str	''
salle43_zone1_bouche	str	''

salle44
	dw	3
	dw	45,0,0,0
	dw	21,8,79,107
	da	salle44_zone1_main
	da	salle44_zone1_oeil
	da	salle44_zone1_bouche
	dw	87,33,129,107
	da	salle44_zone2_main
	da	salle44_zone2_oeil
	da	salle44_zone2_bouche
	dw	133,29,213,92
	da	salle44_zone3_main
	da	salle44_zone3_oeil
	da	salle44_zone3_bouche
salle44_zone1_main	str	''
salle44_zone1_oeil	str	'That guy is completely bugged'
salle44_zone1_bouche	str	d2'Do not push!'d3
salle44_zone2_main	str	''
salle44_zone2_oeil	str	'The SOS Adventurers team! It was time!'
salle44_zone2_bouche	str	d2'Go north if you want to follow us to the rest of the adventure and meet the Professeur!'d3
salle44_zone3_main	str	''
salle44_zone3_oeil	str	''
salle44_zone3_bouche	str	d2'We are the members of SOS Adventurers. We are here to help keep the game going!'d3

salle45
	dw	3
	dw	0,0,0,0
	dw	33,8,88,104
	da	salle45_zone1_main
	da	salle45_zone1_oeil
	da	salle45_zone1_bouche
	dw	199,1,215,19
	da	salle45_zone2_main
	da	salle45_zone2_oeil
	da	salle45_zone2_bouche
	dw	128,61,177,107
	da	salle45_zone3_main
	da	salle45_zone3_oeil
	da	salle45_zone3_bouche
salle45_zone1_main	str	'He does very well on his own'
salle45_zone1_oeil	str	'What the hell is he doing here?'
salle45_zone1_bouche	str	d2'It is not Leader Board here!!'d3
salle45_zone2_main	str	''
salle45_zone2_oeil	str	'The flag indicating the golf hole'
salle45_zone2_bouche	str	''
salle45_zone3_main	str	d2'Pass me the Iron 5 while you are at it!'d3
salle45_zone3_oeil	str	d2'Not very Mediterranean all that'd3
salle45_zone3_bouche	str	d2'Put put put'd3

salle46
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle46_zone1_main
	da	salle46_zone1_oeil
	da	salle46_zone1_bouche
salle46_zone1_main	str	''
salle46_zone1_oeil	str	''
salle46_zone1_bouche	str	''

salle47
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle47_zone1_main
	da	salle47_zone1_oeil
	da	salle47_zone1_bouche
salle47_zone1_main	str	''
salle47_zone1_oeil	str	''
salle47_zone1_bouche	str	''

salle48
	dw	5
	dw	0,0,0,0
	dw	96,58,115,71
	da	salle48_zone1_main
	da	salle48_zone1_oeil
	da	salle48_zone1_bouche
	dw	235,5,271,109
	da	salle48_zone2_main
	da	salle48_zone2_oeil
	da	salle48_zone2_bouche
	dw	1,21,83,91
	da	salle48_zone3_main
	da	salle48_zone3_oeil
	da	salle48_zone3_bouche
	dw	162,1,203,98
	da	salle48_zone4_main
	da	salle48_zone4_oeil
	da	salle48_zone4_bouche
	dw	145,25,157,34
	da	salle48_zone5_main
	da	salle48_zone5_oeil
	da	salle48_zone5_bouche
salle48_zone1_main	str	''
salle48_zone1_oeil	str	'Bill has already managed to free his hand'
salle48_zone1_bouche	str	''
salle48_zone2_main	str	''
salle48_zone2_oeil	str	'The Professor visibly uses the energy of the fetish'
salle48_zone2_bouche	str	d2'You are lost, Palmer!! This fetish contains an unkonwn material which will allow me to become the master of the world!!'d3
salle48_zone3_main	str	''
salle48_zone3_oeil	str	'Hurry up!!'
salle48_zone3_bouche	str	''
salle48_zone4_main	str	''
salle48_zone4_oeil	str	'A lieutenant of the Professor'
salle48_zone4_bouche	str	d2'Shut up!'d3
salle48_zone5_main	str	'Cannot reach it while being tied up!'
salle48_zone5_oeil	str	'The electric switch'
salle48_zone5_bouche	str	''

salle49
	dw	3
	dw	0,0,0,0
	dw	145,25,157,34
	da	salle49_zone1_main
	da	salle49_zone1_oeil
	da	salle49_zone1_bouche
	dw	235,5,271,109
	da	salle49_zone2_main
	da	salle49_zone2_oeil
	da	salle49_zone2_bouche
	dw	162,1,203,98
	da	salle49_zone3_main
	da	salle49_zone3_oeil
	da	salle49_zone3_bouche
salle49_zone1_main	str	''
salle49_zone1_oeil	str	'The electric switch'
salle49_zone1_bouche	str	''
salle49_zone2_main	str	''
salle49_zone2_oeil	str	'Luckily je did not spot Bill'
salle49_zone2_bouche	str	d2'Evil will finally triumph! Gniark gniark!'d3
salle49_zone3_main	str	''
salle49_zone3_oeil	str	'Luckily the bad guys do not care...'
salle49_zone3_bouche	str	''

salle50
	dw	3
	dw	0,0,51,0
	dw	133,41,156,52
	da	salle50_zone1_main
	da	salle50_zone1_oeil
	da	salle50_zone1_bouche
	dw	50,44,76,55
	da	salle50_zone2_main
	da	salle50_zone2_oeil
	da	salle50_zone2_bouche
	dw	224,59,245,69
	da	salle50_zone3_main
	da	salle50_zone3_oeil
	da	salle50_zone3_bouche
salle50_zone1_main	str	''
salle50_zone1_oeil	str	'Bill'27's beautiful eyes'
salle50_zone1_bouche	str	''
salle50_zone2_main	str	''
salle50_zone2_oeil	str	'The Professor'27's henchman'
salle50_zone2_bouche	str	''
salle50_zone3_main	str	''
salle50_zone3_oeil	str	'Professor X.'
salle50_zone3_bouche	str	''

salle51
	dw	9
	dw	0,0,0,0
	dw	56,61,61,63
	da	salle51_zone1_main
	da	salle51_zone1_oeil
	da	salle51_zone1_bouche
	dw	60,61,72,63
	da	salle51_zone2_main
	da	salle51_zone2_oeil
	da	salle51_zone2_bouche
	dw	64,65,70,67
	da	salle51_zone3_main
	da	salle51_zone3_oeil
	da	salle51_zone3_bouche
	dw	74,64,79,67
	da	salle51_zone4_main
	da	salle51_zone4_oeil
	da	salle51_zone4_bouche
	dw	127,44,143,59
	da	salle51_zone5_main
	da	salle51_zone5_oeil
	da	salle51_zone5_bouche
	dw	64,74,87,93
	da	salle51_zone6_main
	da	salle51_zone6_oeil
	da	salle51_zone6_bouche
	dw	27,2,114,36
	da	salle51_zone7_main
	da	salle51_zone7_oeil
	da	salle51_zone7_bouche
	dw	85,56,120,65
	da	salle51_zone8_main
	da	salle51_zone8_oeil
	da	salle51_zone8_bouche
	dw	5,74,44,102
	da	salle51_zone9_main
	da	salle51_zone9_oeil
	da	salle51_zone9_bouche
salle51_zone1_main	str	'Nothing happens'
salle51_zone1_oeil	str	d2'Coffee, (out of service)'d3
salle51_zone1_bouche	str	''
salle51_zone2_main	str	''
salle51_zone2_oeil	str	d2'Immediate self-destruction'd3
salle51_zone2_bouche	str	''
salle51_zone3_main	str	d2'Self-destruction engaged'd3' says a synthetic voice'
salle51_zone3_oeil	str	d2'Deferred self-destruction'd3
salle51_zone3_bouche	str	''
salle51_zone4_main	str	''
salle51_zone4_oeil	str	d2'Ejecting'd3
salle51_zone4_bouche	str	''
salle51_zone5_main	str	''
salle51_zone5_oeil	str	'A microphone'
salle51_zone5_bouche	str	d2'One, two, one, two, three, four!'d3
salle51_zone6_main	str	''
salle51_zone6_oeil	str	'Just enough to store your small personal effects'
salle51_zone6_bouche	str	''
salle51_zone7_main	str	''
salle51_zone7_oeil	str	'And says that Professor X. wants to become the master of all this...'
salle51_zone7_bouche	str	''
salle51_zone8_main	str	'Pfff... Does one know GFA BASIC?'
salle51_zone8_oeil	str	'Not even from RAtariS'
salle51_zone8_bouche	str	''
salle51_zone9_main	str	''
salle51_zone9_oeil	str	'The next Atari streamer?'
salle51_zone9_bouche	str	''

salle52
	dw	10
	dw	0,0,0,0
	dw	56,61,61,63
	da	salle52_zone1_main
	da	salle52_zone1_oeil
	da	salle52_zone1_bouche
	dw	60,61,72,63
	da	salle52_zone2_main
	da	salle52_zone2_oeil
	da	salle52_zone2_bouche
	dw	64,65,70,67
	da	salle52_zone3_main
	da	salle52_zone3_oeil
	da	salle52_zone3_bouche
	dw	74,64,79,67
	da	salle52_zone4_main
	da	salle52_zone4_oeil
	da	salle52_zone4_bouche
	dw	127,44,143,59
	da	salle52_zone5_main
	da	salle52_zone5_oeil
	da	salle52_zone5_bouche
	dw	64,74,87,93
	da	salle52_zone6_main
	da	salle52_zone6_oeil
	da	salle52_zone6_bouche
	dw	27,2,114,36
	da	salle52_zone7_main
	da	salle52_zone7_oeil
	da	salle52_zone7_bouche
	dw	201,5,247,87
	da	salle52_zone8_main
	da	salle52_zone8_oeil
	da	salle52_zone8_bouche
	dw	85,56,120,65
	da	salle52_zone9_main
	da	salle52_zone9_oeil
	da	salle52_zone9_bouche
	dw	5,74,44,102
	da	salle52_zone10_main
	da	salle52_zone10_oeil
	da	salle52_zone10_bouche
salle52_zone1_main	str	'Nothing happens'
salle52_zone1_oeil	str	d2'Coffee, (out of service)'d3
salle52_zone1_bouche	str	''
salle52_zone2_main	str	''
salle52_zone2_oeil	str	d2'Immediate self-destruction'd3
salle52_zone2_bouche	str	''
salle52_zone3_main	str	d2'Self-destruction engaged'd3' says a synthetic voice'
salle52_zone3_oeil	str	d2'Deferred self-destruction'd3
salle52_zone3_bouche	str	''
salle52_zone4_main	str	''
salle52_zone4_oeil	str	d2'Ejecting'd3
salle52_zone4_bouche	str	''
salle52_zone5_main	str	''
salle52_zone5_oeil	str	'A microphone'
salle52_zone5_bouche	str	d2'One, two, one, two, three, four!'d3
salle52_zone6_main	str	''
salle52_zone6_oeil	str	'Just enough to store your small personal effects'
salle52_zone6_bouche	str	''
salle52_zone7_main	str	''
salle52_zone7_oeil	str	'And says that Professor X. wants to become the master of all this...'
salle52_zone7_bouche	str	''
salle52_zone8_main	str	''
salle52_zone8_oeil	str	'Quick! Bill has to do something!!'
salle52_zone8_bouche	str	d2'You will not espace me this time around, Palmer!'d3
salle52_zone9_main	str	'Pfff... Does one know GFA BASIC?'
salle52_zone9_oeil	str	'Not even from 'd2'Atari'd3
salle52_zone9_bouche	str	''
salle52_zone10_main	str	''
salle52_zone10_oeil	str	'The next Atari streamer?'
salle52_zone10_bouche	str	''

salle53
	dw	10
	dw	0,0,0,0
	dw	56,61,61,63
	da	salle53_zone1_main
	da	salle53_zone1_oeil
	da	salle53_zone1_bouche
	dw	60,61,72,63
	da	salle53_zone2_main
	da	salle53_zone2_oeil
	da	salle53_zone2_bouche
	dw	64,65,70,67
	da	salle53_zone3_main
	da	salle53_zone3_oeil
	da	salle53_zone3_bouche
	dw	74,64,79,67
	da	salle53_zone4_main
	da	salle53_zone4_oeil
	da	salle53_zone4_bouche
	dw	127,44,143,59
	da	salle53_zone5_main
	da	salle53_zone5_oeil
	da	salle53_zone5_bouche
	dw	64,74,87,93
	da	salle53_zone6_main
	da	salle53_zone6_oeil
	da	salle53_zone6_bouche
	dw	27,2,114,36
	da	salle53_zone7_main
	da	salle53_zone7_oeil
	da	salle53_zone7_bouche
	dw	201,5,247,87
	da	salle53_zone8_main
	da	salle53_zone8_oeil
	da	salle53_zone8_bouche
	dw	85,56,120,65
	da	salle53_zone9_main
	da	salle53_zone9_oeil
	da	salle53_zone9_bouche
	dw	5,74,44,102
	da	salle53_zone10_main
	da	salle53_zone10_oeil
	da	salle53_zone10_bouche
salle53_zone1_main	str	'Nothing happens'
salle53_zone1_oeil	str	d2'Coffee, (out of service)'d3
salle53_zone1_bouche	str	''
salle53_zone2_main	str	''
salle53_zone2_oeil	str	d2'Immediate self-destruction'd3
salle53_zone2_bouche	str	''
salle53_zone3_main	str	d2'Self-destruction engaged'd3' says a synthetic voice'
salle53_zone3_oeil	str	d2'Deferred self-destruction'd3
salle53_zone3_bouche	str	''
salle53_zone4_main	str	''
salle53_zone4_oeil	str	d2'Ejecting'd3
salle53_zone4_bouche	str	''
salle53_zone5_main	str	''
salle53_zone5_oeil	str	'A microphone'
salle53_zone5_bouche	str	d2'One, two, one, two, three, four!'d3
salle53_zone6_main	str	''
salle53_zone6_oeil	str	'Just enough to store your small personal effects'
salle53_zone6_bouche	str	''
salle53_zone7_main	str	''
salle53_zone7_oeil	str	'And says that Professor X. wants to become the master of all this...'
salle53_zone7_bouche	str	''
salle53_zone8_main	str	''
salle53_zone8_oeil	str	'Bill has the situation well in hand!'
salle53_zone8_bouche	str	d2'You will not get away with this, Palmer!!'d3
salle53_zone9_main	str	'Pfff... Does one know GFA BASIC?'
salle53_zone9_oeil	str	'Not even from 'd2'Atari'd3
salle53_zone9_bouche	str	''
salle53_zone10_main	str	''
salle53_zone10_oeil	str	'The next Atari streamer?'
salle53_zone10_bouche	str	''

salle54
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle54_zone1_main
	da	salle54_zone1_oeil
	da	salle54_zone1_bouche
salle54_zone1_main	str	''
salle54_zone1_oeil	str	''
salle54_zone1_bouche	str	''

salle55
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle55_zone1_main
	da	salle55_zone1_oeil
	da	salle55_zone1_bouche
salle55_zone1_main	str	''
salle55_zone1_oeil	str	''
salle55_zone1_bouche	str	''

salle56
	dw	1
	dw	0,0,0,0
	dw	0,0,0,0
	da	salle56_zone1_main
	da	salle56_zone1_oeil
	da	salle56_zone1_bouche
salle56_zone1_main	str	''
salle56_zone1_oeil	str	''
salle56_zone1_bouche	str	''

* VARIABLE CONTENANT LE COPYRIGHT

nombre_messages	=	11
message
	da	message1
	da	message2
	da	message3
	da	message4
	da	message5
	da	message6
	da	message7
	da	message8
	da	message9
	da	message10
	da	message11
	
message1	str	0d'BILL PALMER. Copyright 1987. ARCAN'
message2	str	0d'A game by FRANCOIS COULON'
message3	str	0d'Graphics by DOMINIQUE PETTER'
message4	str	0d'Music by Alain Krausz'
message5	str	0d'Coproduced by Emmanuel Lasmezas'
message6	str	0d'Used programs and tools..'
message7	str	0d'GFA Basic and GFA Compiler (GfA Systemtechnik/Franck Ostrowski)'
message8	str	0d'Degas Elite (Batteries Included/Tom Hudson), CRP graphic tablet'
message9	str	'Yamaha and Akai musical hardware, ST Replay digitizer (2 bits System/A. Racine)'
message10	str	'Apple IIgs version written in 2021'0D'by Brutal Deluxe Software'0D'Antoine Vignau & Olivier Zardini'
message11	str	' '

* DIVERSES CHAINES

strVIDE	str	''
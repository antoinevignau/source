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

descr_objet1	str	'Une photo du Professeur X. !'
descr_objet2	str	'Un billet d'27'avion pour le N'27'Gwanal'8e'l'8e
descr_objet3	str	'Une carte de cr'8e'dit. Il doit bien rester un peu d'27'argent sur le compte'
descr_objet4	str	'Le passeport. Ins'8e'parable compagnon de l'27'Aventurier'
descr_objet5	str	'Des brindilles. Ca doit pouvoir br'9e'ler facilement'
descr_objet6	str	'Une machette (du calme !)'
descr_objet7	str	'Le fameux f'8e'tiche tant convoit'8e' ! !'
descr_objet8	str	'Click click, un briquet'
descr_objet9	str	'La carte d'27'identit'8e' de Bill, quand il prend le m'8e'tro.'
descr_objet10	str	'Une vieille salade. Inavalable pour un '90'tre un civilis'8e'...'
descr_objet11	str	'Une souris m'8e'canique. Elle s'27'agite quelques secondes apr'8f's avoir '8e't'8e' remont'8e'e'
descr_objet12	str	'Une bo'94'te de pa'91'lla. Pas le moment de manger...'
descr_objet13	str	'Un ouvre-bo'94'te'
descr_objet14	str	'Le Guide du Parfait Aventurier. Bill n'27'en a plus besoin depuis longtemps !'
descr_objet15	str	'La bombe semble '90'tre d'8e'sarmorc'8e'e'
descr_objet16	str	'La Gazette des Aventuriers. Un pigiste r'8e'v'8f'le qu'27'un f'8e'tiche a '8e't'8e' d'8e'rob'8e' au N'27'Gwanal'8e'l'8e' par le Professeur X., ce savant de triste renomm'8e'e'
descr_objet17	str	'Gardons notre calme : cette mitraillette est charg'8e'e...'
descr_objet18	str	'Un appeau. Il '8e'met un bruit bizarre quand on souffle dedans'
descr_objet19	str	'Ce pistolet doit '90'tre utilis'8e' uniquement pour la bonne cause !'
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
salle1_zone1_oeil	str	'Une vieille caisse d'27'emballage'
salle1_zone1_bouche	str	''
salle1_zone2_main	str	''
salle1_zone2_oeil	str	'La bo'94'te aux lettres'
salle1_zone2_bouche	str	''
salle1_zone3_main	str	'D'8e'go'9e'tant...'
salle1_zone3_oeil	str	'Un clochard'
salle1_zone3_bouche	str	d2'Un peu de politesse! J'27'ai '8e't'8e' d'8e'veloppeur de jeux d'27'aventures, moi Monsieur !'d3
salle1_zone4_main	str	''
salle1_zone4_oeil	str	'Et si Bill regardait par la fen'90'tre ?'
salle1_zone4_bouche	str	''
salle1_zone5_main	str	'Et si vous entriez par la porte ?'
salle1_zone5_oeil	str	'C'27'est bien l'27'int'8e'rieur de Bill'
salle1_zone5_bouche	str	''
salle1_zone6_main	str	'Pas touche !'
salle1_zone6_oeil	str	'C'27'est Bill Palmer, h'8e'ros des h'8e'ros en route vers une nouvelle aventure'
salle1_zone6_bouche	str	''
salle1_zone7_main	str	'Bill ne va tout de m'90'me pas arracher la plaque !'
salle1_zone7_oeil	str	d2'Bill Palmer. Aventurier. Sur rendez-vous.'d3
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
salle2_zone1_main	str	'Bill arbore d'8e'j'88' son cuir'
salle2_zone1_oeil	str	''
salle2_zone1_bouche	str	''
salle2_zone2_main	str	''
salle2_zone2_oeil	str	'La poche'
salle2_zone2_bouche	str	''
salle2_zone3_main	str	''
salle2_zone3_oeil	str	'Une '8e'tag'8f're pleine de vieux bouquins et de magazines d'27'informatique'
salle2_zone3_bouche	str	''
salle2_zone4_main	str	'Un peu ramoli'
salle2_zone4_oeil	str	'Le canap'8e
salle2_zone4_bouche	str	''
salle2_zone5_main	str	'Attention, c'27'est fragile !'
salle2_zone5_oeil	str	'Une vieux vase Ming sans aucune valeur'
salle2_zone5_bouche	str	''
salle2_zone6_main	str	'Le trou est d'8e'j'88' assez grand'
salle2_zone6_oeil	str	'H'8e' Bill ! Faudrait voir '88' refaire les platres !'
salle2_zone6_bouche	str	''
salle2_zone7_main	str	'Zut ! Le store est coinc'8e'. Faudra trouver une autre combine pour regarder la voisine se d'8e'shabiller'
salle2_zone7_oeil	str	'La tirette du store'
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
salle3_zone1_oeil	str	'Le cadenas. Pr'8e'sentement ouvert'
salle3_zone1_bouche	str	''
salle3_zone2_main	str	''
salle3_zone2_oeil	str	''
salle3_zone2_bouche	str	''
salle3_zone3_main	str	'Pas encore l'27'heure de tirer les rideaux'
salle3_zone3_oeil	str	'Pas tr'8f's propre. Faudrait voir '88' laver tout '8d'a Bill !'
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
salle4_zone1_oeil	str	'Ce fut une belle voiture...'
salle4_zone1_bouche	str	'Vous parlez le langage voiture ?'
salle4_zone2_main	str	'Ca laisserait des traces de doigts !'
salle4_zone2_oeil	str	'Non, non. Pas celle l'88'. L'27'autre ! !'
salle4_zone2_bouche	str	'On en mangerait...'
salle4_zone3_main	str	''
salle4_zone3_oeil	str	'Le capot s'27'ouvre par l'88
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
salle5_zone1_main	str	'La r'8e'parer ? Pour quoi faire...'
salle5_zone1_oeil	str	''
salle5_zone1_bouche	str	''
salle5_zone2_main	str	''
salle5_zone2_oeil	str	'Juste pour quelques pi'8f'ces en trop'
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
salle6_zone1_oeil	str	'La cl'8e' de contact'
salle6_zone1_bouche	str	''
salle6_zone2_main	str	''
salle6_zone2_oeil	str	'L'27'altim'8f'tre'
salle6_zone2_bouche	str	''
salle6_zone3_main	str	''
salle6_zone3_oeil	str	'La bo'94'te '88' gants'
salle6_zone3_bouche	str	''
salle6_zone4_main	str	'Ca va, c'27'est au point mort'
salle6_zone4_oeil	str	'Le levier de vitesse'
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
salle7_zone1_main	str	'Ca ne se prend pas comme '8d'a..'
salle7_zone1_oeil	str	'Vite, il part pour le N'27'Gwanal'8e'l'8e'!'
salle7_zone1_bouche	str	''
salle7_zone2_main	str	'Faudrait prendre beaucoup d'27''8e'lan'
salle7_zone2_oeil	str	'Trop tard pour celui l'88''
salle7_zone2_bouche	str	''
salle7_zone3_main	str	''
salle7_zone3_oeil	str	'Elle s'27'arrange pas avec l'2789'ge'
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
salle9_zone1_main	str	'Voyons, un peu de discr'8e'tion ! !'
salle9_zone1_oeil	str	'Glup ! !'
salle9_zone1_bouche	str	'Schmack !'
salle9_zone2_main	str	'Gardez plut'99't la main sur la souris'
salle9_zone2_oeil	str	'Bill devrait d'27'abord penser '88' sa mission...'
salle9_zone2_bouche	str	d2'Nous avons des promotions sp'8e'ciales pour les billets vers l'27'Afrique du Sud !'d3
salle9_zone3_main	str	'Vous g'90'nez pas surtout...'
salle9_zone3_oeil	str	'Un t'8e'l'8e'phone'
salle9_zone3_bouche	str	''
salle9_zone4_main	str	''
salle9_zone4_oeil	str	'Les cartes de cr'8e'dit sont accept'8e'es'
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
salle10_zone1_main	str	d2'C'27'est bien gentil de m'27'aider mon brave Monsieur !'d3
salle10_zone1_oeil	str	'Dommage qu'27'il soit blanc. On aurait cru Stevie Wonder'
salle10_zone1_bouche	str	d2'Pardon, c'27'est bien ici le match de football ?'d3
salle10_zone2_main	str	'Voyons ! ! ! A son '89'ge ! !'
salle10_zone2_oeil	str	'Si vous regardez d'8e'j'88' les petites filles...'
salle10_zone2_bouche	str	d2'Tu veux ma photo ?'d3
salle10_zone3_main	str	''
salle10_zone3_oeil	str	'Attention, c'27'est le douanier !'
salle10_zone3_bouche	str	'Pr'8e'sentez votre passeport s'27'il vous plait !'
salle10_zone4_main	str	''
salle10_zone4_oeil	str	'Ca doit '90'tre un diplomate qui rentre au pays'
salle10_zone4_bouche	str	d2'Encow'27' un qui se pwend pou'27' Ha'27'isson Fowd...'d3
salle10_zone5_main	str	'Stop !'
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
salle11_zone1_main	str	'Bill a d'8e'j'88' son billet'
salle11_zone1_oeil	str	'C'27'est un billet d'27'avion pour Auckland. Un aller simple, '8d'a suffit'
salle11_zone1_bouche	str	''
salle11_zone2_main	str	''
salle11_zone2_oeil	str	'C'27'est '8d'a le pilote ? ! ? !'
salle11_zone2_bouche	str	d2'Et dire qu'27'il n'27'y a qu'27'un parachute pour tout l'27'avion...'d3
salle11_zone3_main	str	'Pour le pousser ? ?'
salle11_zone3_oeil	str	'Et si Bill en faisait autant avant de rencontrer le pire ?'
salle11_zone3_bouche	str	d2'Argh ! !'d3
salle11_zone4_main	str	'Z'27'avez pas peur...'
salle11_zone4_oeil	str	d2'Poids total hors charge: 213 Kg'd3
salle11_zone4_bouche	str	d2'Tu vas pas te tirer pour notre lune de miel ! ?'d3

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
salle12_zone1_oeil	str	'La Mecque'
salle12_zone1_bouche	str	''
salle12_zone2_main	str	''
salle12_zone2_oeil	str	'Alaska 13583 km'
salle12_zone2_bouche	str	''
salle12_zone3_main	str	''
salle12_zone3_oeil	str	'Maubeuge (centre ville) : premi'8f're '88' gauche'
salle12_zone3_bouche	str	''
salle12_zone4_main	str	'Attention '8d'a coupe ! !'
salle12_zone4_oeil	str	'Une h'8e'lice'
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
salle13_zone1_oeil	str	d2'Concessionnaire Dromacar'd3
salle13_zone1_bouche	str	''
salle13_zone2_main	str	''
salle13_zone2_oeil	str	d2'Walk this way! ! ! !'d3
salle13_zone2_bouche	str	''
salle13_zone3_main	str	''
salle13_zone3_oeil	str	'Tiens ! Il semble y avoir quelque chose sous ces pierres !'
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
salle14_zone1_oeil	str	'C'27'est le conservateur du mus'8e'e'
salle14_zone1_bouche	str	d2'Si vous nous rapportez le F'8e'tiche vol'8e', vous aurez droit '88' une forte r'8e'compense, pr'8e'sentement!'d3
salle14_zone2_main	str	'Ca serait bien trop facile si c'27''8e'tait celui-l'88' qu'27'il fallait retrouver !'
salle14_zone2_oeil	str	'Un f'8e'tiche'
salle14_zone2_bouche	str	''
salle14_zone3_main	str	''
salle14_zone3_oeil	str	'C'27''8e'tait '8d'a ou finir en aliment pour chats'
salle14_zone3_bouche	str	'De toutes les fa'8d'ons, ce n'27'est pas maintenant qu'27'il va se mettre '88' parler'

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
salle15_zone1_oeil	str	'Un vendeur de dromadaires'
salle15_zone1_bouche	str	d2'J'27'y traite qu'27'avec li vrais aventuriers moi !'d3
salle15_zone2_main	str	'Vous esp'8e'riez qu'27'il allait ronronner ?'
salle15_zone2_oeil	str	'Un cham... Non un dromadaire'
salle15_zone2_bouche	str	'Les dromadaires ne parlent pas, m'90'me dans les jeux d'27'aventure'
salle15_zone3_main	str	'Brave b'90'te..'
salle15_zone3_oeil	str	'Il doit '90'tre mal nourri...'
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
salle18_zone1_oeil	str	'Ca doit '90'tre le wagon quatri'8f'me classe'
salle18_zone1_bouche	str	''
salle18_zone2_main	str	''
salle18_zone2_oeil	str	'Le wagon classe aventuriers'
salle18_zone2_bouche	str	''
salle18_zone3_main	str	''
salle18_zone3_oeil	str	'La locomotive mod'8f'le 1865 reform'8e' 1917 n'27'attend plus que Bill pour partir'
salle18_zone3_bouche	str	''
salle18_zone4_main	str	''
salle18_zone4_oeil	str	'Un auto-stoppeur sans doute'
salle18_zone4_bouche	str	d2'Tchou tchou ! ! T'27'wain va pa'27'tiw'27d3

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
salle19_zone1_main	str	'Doucement, '8d'a pourrait le r'8e'veiller !'
salle19_zone1_oeil	str	'Il vend des billets. Mais la pause a l'27'air longue...'
salle19_zone1_bouche	str	d2'Plus tard coco, plus tard...'d3
salle19_zone2_main	str	'Pouah ! Des os humains...'
salle19_zone2_oeil	str	'Certains mangent bien du lapin'
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
salle20_zone1_oeil	str	'Mille sabords ! Serions-nous au Congo ?'
salle20_zone1_bouche	str	d2'Saperlipopette !'d3
salle20_zone2_main	str	''
salle20_zone2_oeil	str	'Et alors ? La premi'8f're classe est aussi autoris'8e'e aux Noirs...'
salle20_zone2_bouche	str	''
salle20_zone3_main	str	''
salle20_zone3_oeil	str	d2'Eat at Joe'27's. Au menu: missionnaire, homme d'27'affaire, pigiste. Ketchup en suppl'8e'ment'd3
salle20_zone3_bouche	str	''
salle20_zone4_main	str	''
salle20_zone4_oeil	str	'Le signal d'27'alarme'
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
salle23_zone1_oeil	str	'Et si cette pierre cachait quelque chose ?'
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
salle24_zone1_oeil	str	d2'Danger: '8e'l'8e'phants'd3
salle24_zone1_bouche	str	''
salle24_zone2_main	str	''
salle24_zone2_oeil	str	'Le sommet de cette montagne cache quelque chose...'
salle24_zone2_bouche	str	''

salle25
	dw	1
	dw	0,0,0,0
	dw	162,2,263,75
	da	salle25_zone1_main
	da	salle25_zone1_oeil
	da	salle25_zone1_bouche
salle25_zone1_main	str	'Est-ce bien raisonnable ?'
salle25_zone1_oeil	str	'A mon avis, le self control de ce pachyderme semble s'8e'rieusement entam'8e
salle25_zone1_bouche	str	d2'Tout doux petit !'d3

salle26
	dw	1
	dw	0,24,0,24
	dw	238,74,272,108
	da	salle26_zone1_main
	da	salle26_zone1_oeil
	da	salle26_zone1_bouche
salle26_zone1_main	str	'Impossible d'27'arracher des brindilles '88' la main'
salle26_zone1_oeil	str	'Une vari'8e't'8e' rare d'27'une herbe africaine r'8e'put'8e'e pour sa facilit'8e' de combustion'
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
salle27_zone2_main	str	'Pas la peine, personne n'27'est en vue'
salle27_zone2_oeil	str	'La pierre qui vient d'27'assommer ce mis'8e'rable'
salle27_zone2_bouche	str	''
salle27_zone3_main	str	''
salle27_zone3_oeil	str	'Il a son compte !'
salle27_zone3_bouche	str	'Et vous imaginiez qu'27'il allait r'8e'pondre ?'

salle28
	dw	1
	dw	0,0,0,24
	dw	1,2,96,110
	da	salle28_zone1_main
	da	salle28_zone1_oeil
	da	salle28_zone1_bouche
salle28_zone1_main	str	''
salle28_zone1_oeil	str	'Et dire qu'27'il va falloir grimper tout '8d'a'
salle28_zone1_bouche	str	'C'27'est pas un sol sacr'8e' !'

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
salle29_zone1_main	str	'Et la SPA alors ?'
salle29_zone1_oeil	str	'On ne sait jamais, des fois que Bill meure...'
salle29_zone1_bouche	str	''
salle29_zone2_main	str	''
salle29_zone2_oeil	str	'Ca ferait sans doute une bonne prise'
salle29_zone2_bouche	str	''
salle29_zone3_main	str	''
salle29_zone3_oeil	str	'Attention ! Il poursuit Bill !'
salle29_zone3_bouche	str	d2'Urk Urk !'d3

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
salle30_zone1_main	str	'Et la SPA alors ?'
salle30_zone1_oeil	str	'On ne sait jamais, des fois que Bill meure...'
salle30_zone1_bouche	str	''
salle30_zone2_main	str	''
salle30_zone2_oeil	str	'Ca ferait sans doute une bonne prise'
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
salle32_zone1_oeil	str	'Elle semble pouvoir '90'tre d'8e'plac'8e'e facilement'
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
salle33_zone1_main	str	'Impossible d'27'arracher cette cam'8e'ra !'
salle33_zone1_oeil	str	'Une cam'8e'ra de surveillance'
salle33_zone1_bouche	str	'Pour faire de la bu'8e'e sur l'27'objectif ?'
salle33_zone2_main	str	'Ouille ! C'27'est chaud !'
salle33_zone2_oeil	str	'Eblouissant'
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
salle34_zone1_oeil	str	'Quelques braises encore chaudes'
salle34_zone1_bouche	str	''
salle34_zone2_main	str	'Faut bien que certaines commodes ne contiennent rien. Ca ne serait pas rigolo...'
salle34_zone2_oeil	str	''
salle34_zone2_bouche	str	''
salle34_zone3_main	str	'Pas le moment de faire des cr'90'pes !'
salle34_zone3_oeil	str	'Des po'90'les (faut vraiment tout lui dire celui l'88'...)'
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
salle35_zone1_oeil	str	'Le feu d'8e'gage de la fum'8e'e qui s'27''8e'chappe par le conduit'
salle35_zone1_bouche	str	''
salle35_zone2_main	str	'Faut bien que certaines commodes ne contiennent rien. Ca ne serait pas rigolo...'
salle35_zone2_oeil	str	''
salle35_zone2_bouche	str	''
salle35_zone3_main	str	'Pas le moment de faire des cr'90'pes !'
salle35_zone3_oeil	str	'Des po'90'les (faut vraiment tout lui dire celui l'88'...)'
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
salle36_zone1_oeil	str	'On se l'27'ouvre ?'
salle36_zone1_bouche	str	d2'Y'27'a quelqu'27'un ?'d3
salle36_zone2_main	str	'Trop solide pour '90'tre d'8e'plac'8e'e'
salle36_zone2_oeil	str	d2'Fernand aime Georgette'd3' y est grav'8e' au canif'
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
salle38_zone1_oeil	str	'Et si je vous dis que c'27'est un tiroir ?'
salle38_zone1_bouche	str	''
salle38_zone2_main	str	''
salle38_zone2_oeil	str	'C'27'est pourtant pas compliqu'8e' de l'27'ouvrir...'
salle38_zone2_bouche	str	''
salle38_zone3_main	str	''
salle38_zone3_oeil	str	'On en boirait bien...'
salle38_zone3_bouche	str	''
salle38_zone4_main	str	'C'27'est le F'8e'tiche qu'27'il faut rapporter !'
salle38_zone4_oeil	str	'Peut-'90'tre un pr'8e'd'8e'cesseur...'
salle38_zone4_bouche	str	'Pas tr'8f's causant...'
salle38_zone5_main	str	'Mieux vaut ne pas trop y toucher'
salle38_zone5_oeil	str	'A peine plus complexe qu'27'un Atari...'
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
salle39_zone1_main	str	'Rien '88' faire, elle reste ferm'8e'e'
salle39_zone1_oeil	str	'On se l'27'ouvre ?'
salle39_zone1_bouche	str	''
salle39_zone2_main	str	''
salle39_zone2_oeil	str	'Bill aper'8d'oit par le trou de la serrure des dizaines de personnes s'27'activant autour du F'8e'tiche branch'8e' sur des '8e'lectrodes !'
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
salle40_zone1_oeil	str	'Il semble se d'8e'sint'8e'resser de Bill'
salle40_zone1_bouche	str	'Cui cui ?'
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
salle42_zone1_main	str	'Bill ne devrait pas tenter le combat '88' mains nues'
salle42_zone1_oeil	str	'Il a l'27'air agressif...'
salle42_zone1_bouche	str	d2'Fais tes pri'8f'res, rascal !'d3
salle42_zone2_main	str	''
salle42_zone2_oeil	str	'Si vous voulez mon avis...'
salle42_zone2_bouche	str	d2'Tu vis ta derni'8f're heure'd3
salle42_zone3_main	str	''
salle42_zone3_oeil	str	''
salle42_zone3_bouche	str	d2'Le Professeur nous a charg'8e's de venir t'27'offrir des fleurs !'d3
salle42_zone4_main	str	''
salle42_zone4_oeil	str	''
salle42_zone4_bouche	str	d2'Hurk Hurk !'d3

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
salle44_zone1_oeil	str	'Compl'8f'tement bugg'8e', le mec...'
salle44_zone1_bouche	str	d2'Poussez pas !'d3
salle44_zone2_main	str	''
salle44_zone2_oeil	str	'L'27''8e'quipe d'27'intervention de SOS Aventuriers ! Il '8e'tait temps !'
salle44_zone2_bouche	str	d2'Va au nord si tu veux nous suivre vers la suite de l'27'aventure et rejoindre le Professeur X. !'d3
salle44_zone3_main	str	''
salle44_zone3_oeil	str	''
salle44_zone3_bouche	str	d2'Nous sommes les membres de SOS Aventuriers. Nous sommes l'88' pour t'27'aider '88' continuer le jeu !'d3

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
salle45_zone1_main	str	'Il se d'8e'brouille tr'8f's bien tout seul'
salle45_zone1_oeil	str	'Mais qu'27'est-ce qu'27'il vient foutre ici celui-l'88' ?'
salle45_zone1_bouche	str	d2'C'27'est par Leader Board ici ! !'d3
salle45_zone2_main	str	''
salle45_zone2_oeil	str	'Le drapeau indiquant le trou'
salle45_zone2_bouche	str	''
salle45_zone3_main	str	d2'Passez-moi le fer de 5 pendant que vous y '90'tes !'d3
salle45_zone3_oeil	str	d2'Pas tr'8f's m'8e'diterrann'8e'en tout '8d'a'd3
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
salle48_zone1_oeil	str	'Bill est d'8e'j'88' parvenu '88' lib'8e'rer sa main'
salle48_zone1_bouche	str	''
salle48_zone2_main	str	''
salle48_zone2_oeil	str	'Le Professeur utilise visiblement l'27''8e'nergie du F'8e'tiche'
salle48_zone2_bouche	str	d2'Vous '90'tes perdu Palmer ! ! Ce F'8e'tiche contient une mati'8f're inconnue qui va me permettre de devenir le ma'94'tre du Monde ! !'d3
salle48_zone3_main	str	''
salle48_zone3_oeil	str	'Grouillez-vous ! !'
salle48_zone3_bouche	str	''
salle48_zone4_main	str	''
salle48_zone4_oeil	str	'Un lieutenant du Professeur'
salle48_zone4_bouche	str	d2'La ferme!'d3
salle48_zone5_main	str	'Impossible de l'27'atteindre attach'8e' !'
salle48_zone5_oeil	str	'L'27'interrupteur'
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
salle49_zone1_oeil	str	'L'27'interrupteur'
salle49_zone1_bouche	str	''
salle49_zone2_main	str	''
salle49_zone2_oeil	str	'Une chance! Il n'27'a pas rep'8e'r'8e' Bill !'
salle49_zone2_bouche	str	d2'Le Mal va enfin triompher ! Gniark gniark !'d3
salle49_zone3_main	str	''
salle49_zone3_oeil	str	'Heureusement que les m'8e'chants ne font pas attention...'
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
salle50_zone1_oeil	str	'Les beautiful eyes de Bill'
salle50_zone1_bouche	str	''
salle50_zone2_main	str	''
salle50_zone2_oeil	str	'L'27'homme de main du Professeur'
salle50_zone2_bouche	str	''
salle50_zone3_main	str	''
salle50_zone3_oeil	str	'Le Professeur'
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
salle51_zone1_main	str	'Rien ne se passe'
salle51_zone1_oeil	str	d2'Caf'8e', (en panne)'d3
salle51_zone1_bouche	str	''
salle51_zone2_main	str	''
salle51_zone2_oeil	str	d2'Auto-destruction imm'8e'diate'd3
salle51_zone2_bouche	str	''
salle51_zone3_main	str	d2'Auto destruction enclench'8e'e'd3' annonce une voix synth'8e'tique'
salle51_zone3_oeil	str	d2'Auto-destruction diff'8e'r'8e'e'd3
salle51_zone3_bouche	str	''
salle51_zone4_main	str	''
salle51_zone4_oeil	str	d2'Ejection'd3
salle51_zone4_bouche	str	''
salle51_zone5_main	str	''
salle51_zone5_oeil	str	'Un micro'
salle51_zone5_bouche	str	d2'Un, deux, un, deux, trois !'d3
salle51_zone6_main	str	''
salle51_zone6_oeil	str	'Juste de quoi ranger ses petits effets personnels'
salle51_zone6_bouche	str	''
salle51_zone7_main	str	''
salle51_zone7_oeil	str	'Et dire que le Professeur X. veut devenir ma'94'tre de tout '8d'a..'
salle51_zone7_bouche	str	''
salle51_zone8_main	str	'Pfff... Ca connait le GFA '8d'a ?'
salle51_zone8_oeil	str	'M'90'me pas de l'27'Atari'd3
salle51_zone8_bouche	str	''
salle51_zone9_main	str	''
salle51_zone9_oeil	str	'Le prochain streamer Atari ?'
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
salle52_zone1_main	str	'Rien ne se passe'
salle52_zone1_oeil	str	d2'Caf'8e', (en panne)'d3
salle52_zone1_bouche	str	''
salle52_zone2_main	str	''
salle52_zone2_oeil	str	d2'Auto-destruction imm'8e'diate'd3
salle52_zone2_bouche	str	''
salle52_zone3_main	str	d2'Auto destruction enclench'8e'e'd3' annonce une voix synth'8e'tique'
salle52_zone3_oeil	str	d2'Auto-destruction diff'8e'r'8e'e'd3
salle52_zone3_bouche	str	''
salle52_zone4_main	str	''
salle52_zone4_oeil	str	d2'Ejection'd3
salle52_zone4_bouche	str	''
salle52_zone5_main	str	''
salle52_zone5_oeil	str	'Un micro'
salle52_zone5_bouche	str	d2'Un, deux, un, deux, trois!'d3
salle52_zone6_main	str	''
salle52_zone6_oeil	str	'Juste de quoi ranger ses petits effets personnels'
salle52_zone6_bouche	str	''
salle52_zone7_main	str	''
salle52_zone7_oeil	str	'Et dire que le Professeur X. veut devenir ma'94'tre de tout '8d'a...'
salle52_zone7_bouche	str	''
salle52_zone8_main	str	''
salle52_zone8_oeil	str	'Vite ! Bill doit faire quelque chose ! !'
salle52_zone8_bouche	str	d2'Vous ne m'27''8e'chapperez plus cette fois-ci Palmer !'d3
salle52_zone9_main	str	'Pfff... Ca connait le GFA '8d'a ?'
salle52_zone9_oeil	str	'M'90'me pas de l'27'Atari'd3
salle52_zone9_bouche	str	''
salle52_zone10_main	str	''
salle52_zone10_oeil	str	'Le prochain streamer Atari ?'
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
salle53_zone1_main	str	'Rien ne se passe'
salle53_zone1_oeil	str	d2'Caf'8e', (en panne)'d3
salle53_zone1_bouche	str	''
salle53_zone2_main	str	''
salle53_zone2_oeil	str	d2'Auto-destruction imm'8e'diate'd3
salle53_zone2_bouche	str	''
salle53_zone3_main	str	d2'Auto destruction enclench'8e'e'd3' annonce une voix synth'8e'tique'
salle53_zone3_oeil	str	d2'Auto-destruction diff'8e'r'8e'e'd3
salle53_zone3_bouche	str	''
salle53_zone4_main	str	''
salle53_zone4_oeil	str	d2'Ejection'd3
salle53_zone4_bouche	str	''
salle53_zone5_main	str	''
salle53_zone5_oeil	str	'Un micro'
salle53_zone5_bouche	str	d2'Un, deux, un, deux, trois !'d3
salle53_zone6_main	str	''
salle53_zone6_oeil	str	'Juste de quoi ranger ses petits effets personnels'
salle53_zone6_bouche	str	''
salle53_zone7_main	str	''
salle53_zone7_oeil	str	'Et dire que le Professeur X. veut devenir ma'94'tre de tout '8d'a...'
salle53_zone7_bouche	str	''
salle53_zone8_main	str	''
salle53_zone8_oeil	str	'Bill a la situation bien en main !'
salle53_zone8_bouche	str	d2'Vous ne vous en tirerez pas comme '8d'a, Palmer ! !'d3
salle53_zone9_main	str	'Pfff... Ca connait le GFA '8d'a ?'
salle53_zone9_oeil	str	'M'90'me pas de l'27'Atari'd3
salle53_zone9_bouche	str	''
salle53_zone10_main	str	''
salle53_zone10_oeil	str	'Le prochain streamer Atari ?'
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
message2	str	0d'Un jeu de FRANCOIS COULON'
message3	str	0d'Dessins de DOMINIQUE PETTER'
message4	str	0d'Musique d'27' Alain Krausz'
message5	str	0d'Coproduit par Emmanuel Lasmezas'
message6	str	0d'Programmes et outils utilis'8e's...'
message7	str	0d'Basic GFA et Compilateur GFA (GfA Systemtechnik/Franck Ostrowski)'
message8	str	0d'Degas Elite (Batteries Included/Tom Hudson), Tablette graphique CRP'
message9	str	'Mat'8e'riel musical Yamaha et Akai, digitaliseur ST Replay (2 bits System/A. Racine)'
message10	str	'Version Apple IIgs '8e'crite en 2021'0d'par Brutal Deluxe Software'0d'Antoine Vignau & Olivier Zardini'
message11	str	' '

* DIVERSES CHAINES

strVIDE	str	''
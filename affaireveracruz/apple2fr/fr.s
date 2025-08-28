*
* L'affaire Vera Cruz
*
* (c) Gilles Blancon
* (c) 1985, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* TEXTES EN FRANCAIS
*-------------------------------

* Les accents (encore et toujours)
*
* à	88
* â	89
* ä	8a
* ç	8d
* é	8e
* è	8f
* ê	90
* ë	91
* î	94
* ï	95
* ô	99
* ù	9d
* û	9e
* (c) 	a9 (only c)
* oe	cf
* "	22

* Allumettes	44,70 to 91,145
* Bouton	48,72 to 79,103
* Carnet	32,63 to 107,149
* Cendrier	28,51 to 119,118
* Douille	50,52 to 79,99
* Lettre	30,56 to 109,175
* Main gauche	16,53 to 115,119
* Piqure
* Pistolet	18,51 to 117,112
* Rothmans	28,51 to 103,179
* Sac à main	24,52 to 119,103

texte1FR	da	texteALLUMETTES
	da	texteBOUTON
	da	texteCARNET	; +4 ou texteCARNET2
	da	texteCENDRIER
	da	texteDOUILLE
	da	texteLETTRE
	da	texteMAINGAUCHE
	da	textePIQURE
	da	textePISTOLET
	da	texteROTHMANS
	da	texteSACAMAIN
	da	texteCARNET2

texteALLUMETTES	asc	''00	; allumettes  & bouton

texteBOUTON	asc	'Un bouton de '0d
	asc	'couleur noire'00

texteCARNET	asc	''00	; carnet 1 & 2...

texteCARNET2	asc	'EVA Resto des'0d
	asc	'   routiers '880d
	asc	'    GIVORS 69'0d
	asc	''0d
	asc	'Nadine       '0d
	asc	'LAFEUILLE    '0d
	asc	'2 rue Balay  '0d
	asc	'ST-ETIENNE   '0d
	asc	''0d
	asc	'HUB  78031846'0d
	asc	''0d
	asc	''0d
	asc	'Le Fris'8e'     '0d
	asc	'Bar des      '0d
	asc	'peupliers    '00
	
texteCENDRIER	asc	'Cendrier avec'0d
	asc	'deux m'8e'gots :'0d
	asc	''0d
	asc	'-1 Rothmans  '0d
	asc	'-1 Camel avec'0d
	asc	'des traces de'0d
	asc	'rouge '88'      '0d
	asc	'l'8f'vres       '00
	
texteDOUILLE	asc	'Douille      '0d
	asc	''0d
	asc	'Calibre 9 mm,'0d
	asc	'percut'8e'e et  '0d
	asc	'marqu'8e'e TE 9 '0d
	asc	'F 3-79.      '00
	
texteLETTRE	asc	''00

texteMAINGAUCHE	asc	''0d
	asc	'Main gauche  '0d
	asc	''0d
	asc	'Pr'8e'sence sous'0d
	asc	'un ongle d'27'un'0d
	asc	'fil coton de '0d
	asc 	'couleur noire'00

textePIQURE	asc	'Bras gauche  '0d
	asc	''0d
	asc	'Des traces de'0d
	asc	'piq'9e'res      '0d
	asc	'r'8e'centes plus'0d
	asc	'ou moins bien'0d
	asc	'cicatris'8e'es  '00

textePISTOLET	asc	''0d
	asc	'Pistolet     '0d
	asc	'Automatique  '0d
	asc	''0d
	asc	'Type : MAC 50'0d
	asc	'Cal. : 9 mm  '0d
	asc	'No   : G56743'00

texteROTHMANS	asc	''00

texteSACAMAIN	asc	'Sac '88' main   '0d
	asc	'contenant des'0d
	asc	'pi'8f'ces au nom'0d
	asc	'de V'8e'ra CRUZ,'0d
	asc	'un paquet de '0d
	asc	'Camel, des ef'0d
	asc	'fets de  toi-'0d
	asc	'lette, etc.  '00
	

* Partie 2 - Les menus

texte31FR	asc	'M = message'00	; 7,175,181
texte32FR	asc	'E = examen'00	; 7,183,189
texte33FR	asc	'D = d'8e'position'00	; 231,175,181
texte34FR	asc	'C = comparaison'00	; 231,183,189
texte35FR	asc	'I = imprimante'00	; 480,175,181
texte36FR	asc	'A = accusation'00	; 480,183,189

* Coordonnees 7,181

texte41FR	asc	'DEPOSITION DE QUELLE PERSONNE ?  '00
texte42FR	asc	'OU TROUVEZ-VOUS CETTE PERSONNE ?  '00
texte43FR	asc	'COMPARAISON DES ELEMENTS CONNUS AVEC QUI ?  '00
texte44FR	asc	'QUELLE PERSONNE SOUPCONNEZ-VOUS ?  '00
texte45FR	asc	'IL VOUS MANQUE DES ELEMENTS POUR MOTIVER CETTE ARRESTATION'0d'UNE ERREUR JUDICIAIRE SERAIT INADMISSIBLE'00
texte45FR_2	asc	'CETTE ARRESTATION EST INSUFFISANTE'00
texteCONCERNE	asc	'DESTINATAIRE NON CONCERNE.STOP.'00
texte47FR	asc	'QUEL EXAMEN ?  '00
texte48FR	asc	'INVESTIGATION SANS INTERET'00
texte49FR	asc	'SUITE ->'00
texteINCONNU	asc	'DESTINATAIRE INCONNU.STOP.'00
texteREVEILLE	asc	'HO ! CHEF ! T'27'ES PAS REVEILLE.'00
texteORIG	asc	'ORIG '00
texteORIGCFD	asc	'ORIG GIE ST-ETIENNE'0d
	asc	'DEST '0d
	asc	'-------------------------------'00
texteDESTCFD	asc	'DEST GIE ST-ETIENNE'00
texteGIESTC	asc	'GIE ST-CHELY'00
texteSTOP	asc	'.STOP.'00
pvAUDITION	asc	'  AUDITION'00
pvAUTOPSIE	asc	'  AUTOPSIE'00
pvGRAPHOLOGIE	asc	' GRAPHOLOGIE'00
pvFELICITATION	asc	'FELICITATION'00

* Curseur cadre bas : 271,182
* Curseur 

*	asc	'ORIG GIE CLERMONT-FD'00

texteENTETE1	asc	'Brigade de    GENDARMERIE NATIONALE'00
texteENTETE2	asc	'Recherches          --------'00
texteENTETE3	asc	'ST-ETIENNE        '00	; '  AUDITION'0d
texteENTETE4	asc	'----------          --------'00

*--- Présentation des personnages

presABDOULAH	asc	'ABDOULAH'0d
	asc	'HOCINE'0d
	asc	''0d
	asc	'DIT LE FRISE'0d
	asc	''0d
	asc	'NE LE 23.4.55'0d
	asc	'A MEKNES (MAR)'00

presZIEGLER	asc	'ZIEGLER'0d
	asc	'PHILIBERT'0d
	asc	''0d
	asc	'LE MANOUCHE'0d
	asc	''0d
	asc	'NE LE 17.08.59'0d
	asc	'A LYON 69'00

presKOWALSKI	asc	'KOWALSKI'0d
	asc	'STANISLAS'0d
	asc	''0d
	asc	'NE LE 14.12.52'0d
	asc	'A VARSOVIE'0d
	asc	'(POL)'0d
	asc	''00

presGBLANC	asc	'BLANC'0d
	asc	'GILLES'0d
	asc	''0d
	asc	'NE LE 2.11.60'0d
	asc	'A LYON 2EME'0d
	asc	''0d
	asc	''00

presDELARUE	asc	'DELARUE'0d
	asc	'EVA'0d
	asc	''0d
	asc	'NEE LE 23.1.57'0d
	asc	'A PARIS 75'0d
	asc	''0d
	asc	''00

presCRUZ	asc	'CRUZ'0d
	asc	'VERA'0d
	asc	''0d
	asc	'NEE LE 12.5.54'0d
	asc	'A ST-ETIENNE'0d
	asc	''0d
	asc	''00

presPBLANC	asc	'BLANC'0d
	asc	'PHILIPPE'0d
	asc	''0d
	asc	'NE LE 21.7.62'0d
	asc	'A CLERMONT 63'0d
	asc	''0d
	asc	''00

*--- Les textes du jeu

data1510	asc	'SEAT 1234 AA 75,'
	asc	'DUPOND JEAN,'
	asc	'15 RUE MINANTE,'
	asc	'PARIS 75'00
	
data1520	asc	'BMW 9111 CD 69,'
	asc	'BLANC PHILIPPE,'
	asc	'32 PL DES TERREAUX,'
	asc	'LYON 69'00

data1530	asc	'ABDOULAH HOCINE,'
	asc	'CONDAMNE LE 3.1.80 A 2 ANS PRISON,'
	asc	'POUR TRAFIC DE DROGUE.'00

data1540	asc	'ZIEGLER PHILIBERT,'
	asc	'CONDAMNE LE 9.9.82 A 2 ANS PRISON,'
	asc	'POUR DETENTION ARME 4EME CAT. ET,'
	asc	'COUPS ET BLESSURES VOLONTAIRES (A,'
	asc	'FF TRAITEE PAR GIE ST-GALMIER 42),'
	asc	'A ETE INCARCERE PRIS ST-PAUL LYON'00

data1550	asc	'KOWALSKI STANISLAS,'
	asc	'JAMAIS CONDAMNE. A ETE SOUPCONNE,'
	asc	'POUR CAMBRIOLAGES EN 1983 (AFF TR,'
	asc	'AITEE PAR GIE MONTBRISON 42).'00

data1560	asc	'LAFEUILLE Nadine,'
	asc	'n'8e'e le 1.2.56 '88' VALENCE (26),'
	asc	'demeurant 2 rue Balay '88' ST-ETIENNE.,'
	asc	' ,'
	asc	'--Je suis une amie d'27'enfance de Vera,'
	asc	'CRUZ.Je l'27'ai rencontr'8e'e la veille de,'
	asc	'son d'8e'c'8f's. Elle m'27'a dit qu'27'elle en sa,'
	asc	'vait trop sur une sale affaire et,'
	asc	'avait peur d'27'un certain '27'manouche'27'.'00

data1580	asc	'PISTOLET MAC 50 No G56743 VOLE LE,'
	asc	'11.1.85 DANS ARMURERIE CASERNE 92,'
	asc	'RI CLERMONT-FERRAND 63 AVEC LOT D,'
	asc	'E MUNITIONS 9MM TE9F3-79(AFF TRAI,'
	asc	'TEE PAR GIE CLERMONT).'00

data1590	asc	'DANS AFF. VOL PA MAC 50 No G56743,'
	asc	'ENQUETE INFRUCTUEUSE. UN VEHICULE,'
	asc	'BMW EN 69 AVAIT ETE VU SUR PLACE,'
	asc	'SANS AUTRE PRECISION. EN RAISON,'
	asc	'CONNAISSANCE DES LIEUX AUTEUR PRO,'
	asc	'BABLEMENT ANCIEN MILITAIRE AU 92.'00

data1600	asc	'BLANC GILLES,'
	asc	'CONDAMNE EN 1981 A 2 ANS PRISON P,'
	asc	'OUR RECEL DE BIJOUX VOLES. SOUPCO,'
	asc	'NNE D'27'AVOIR PARTICIPE A DEUX BRAQ,'
	asc	'UAGES DE BANQUES.(AFF TRAITEE PAR,'
	asc	'CIAT LYON)'00

data1610	asc	'BLANC PHILIPPE,'
	asc	'JAMAIS CONDAMNE. VOIR BDRJ - FAIT,'
	asc	'L'27'OBJET D'27'UNE FICHE DE RECHERCHES'00

data1620	asc	'DANS AFF RECEL DE BIJOUX COMMIS P,'
	asc	'AR BLANC GILLES LE 22.O6.81 IL A,'
	asc	'ETE DEMONTRE QUE L'27'INTERESSE NE S'27','
	asc	'OCCUPE QUE DE BIJOUX QU'27'IL ECOUL,'
	asc	'AIT EN SUISSE GRACE A UNE FILIERE,'
	asc	'QUI N'27'A PU ETRE DEMANTELEE. L'27'UN,'
	asc	'DES PASSEURS SERAIT SURNOMME STAN,'
	asc	'SANS AUTRE PRECISION. ILS TRAVAIL,'
	asc	'LERAIENT TOUJOURS ENSEMBLE.'00

data1640	asc	'KOWALSKI STANISLAS A ETE APPREHEN,'
	asc	'DE PAR NOTRE UNITE LE 30.02.83 SU,'
	asc	'ITE A UN CAMBRIOLAGE DANS RESIDEN,'
	asc	'CE PRINCIPALE.A ETE RELACHE FAUTE,'
	asc	' DE PREUVE. S'27'ETAIT SEPARE DES BIJ,'
	asc	'OUX VOLES AVANT SON ARRESTATION.,'
	asc	'SEMBLE NE S'27'INTERESSER QU'27'AUX BIJ,'
	asc	'OUX DE VALEUR. CONSIDERE COMME UN,'
	asc	'TRES BON PERCEUR DE COFFRES DANS,'
	asc	'LE MILIEU LYONNAIS.'00

data1660	asc	'DUPLAT Simone - n'8e'e le 21.4.51 '88' ST-,'
	asc	'ETIENNE - concierge de la r'8e'sidence,'
	asc	'du Forez rue Bergson '88' ST-ETIENNE 42.,'
	asc	' ,'
	asc	'--le 5.10.85 je suis rentr'8e'e chez moi,'
	asc	'vers 23h00 environ. Dans le hall j'27'ai,'
	asc	'crois'8e' 2 hommes qui descendaient les,'
	asc	'escaliers en courant et qui sont mon-,'
	asc	't'8e's dans une BMW dont les premiers,'
	asc	'chiffres sont 9111.,'
	asc	'--L'27'un des hommes '8e'tait brun et por-,'
	asc	'tait une moustache '8e'paisse. J'27'ai mal,'
	asc	'vu le second.'00

data1680	asc	'MARTIN Nestor - n'8e' le 30.2.37 '88' LYON,'
	asc	'demeurant r'8e'sidence du Forez - rue,'
	asc	'Bergson '88' ST-ETIENNE.,'
	asc	' ,'
	asc	'--Je suis le voisin de palier de Mlle,'
	asc	'CRUZ que je connaissais peu. Le 5.10,'
	asc	'85 vers 22H30 j'27'ai entendu un claque-,'
	asc	'ment venant de son appartement mais,'
	asc	'sur le moment je n'27'ai pas r'8e'alis'8e' qu'27','
	asc	'il s'27'agissait d'27'un coup de feu.,'
	asc	'--Je me souviens avoir entendu pro-,'
	asc	'noncer le diminutif Phil.'00

data1700	asc	'DELROCHE Hubert - n'8e' le 21.4.30 '88','
	asc	'LYON - bijoutier - demeurant Place,'
	asc	'du Peuple '88' ST-ETIENNE.,'
	asc	' ,'
	asc	'--J'27'ai fr'8e'quent'8e' Mlle Vera assez assi,'
	asc	'd'9e'ment mais depuis l'27'assassinat de ma,'
	asc	'femme je ne l'27'ai pas revue.,'
	asc	'--Personnellement j'27'ai '8e't'8e' braqu'8e','
	asc	'le 2.10.85 par 3 hommes dont l'27'un a,'
	asc	'abattu ma femme qui tentait d'27'appeler,'
	asc	88' l'27'aide. Les malfaiteurs ont pris l'88','
	asc	'fuite. C'27'est le commissariat de ST-,'
	asc	'ETIENNE qui s'27'occupe de cela.'00

data1720	asc	'AFF.HOLD-UP BIJOUTERIE DELROCHE N,'
	asc	'ON SOLUTIONNEE A CE JOUR. MEURTRI,'
	asc	'ER MM DELROCHE REPOND AU SURNOM D,'
	asc	'E PHIL.IL A ETE RETROUVE UNE DOUI,'
	asc	'LLE 9 MM MARQUEE TE 9 F 3-79. MAL,'
	asc	'FAITEURS MASQUES ONT PRIS LA FUIT,'
	asc	'E A BORD VEHICULE BMW.LES AUTEURS,'
	asc	'ETAIENT TRES BIEN INFORMES SUR LA,'
	asc	'BIJOUTERIE.'00

data1740	asc	'ZIEGLER Philibert - n'8e' le 17.8.59,'
	asc	88' LYON - Demeurant 5 pl Carnot '88','
	asc	'ST-ETIENNE - sans profession.,'
	asc	' ,'
	asc	'--Je connaissais Vera qui '8e'tait une,'
	asc	'amie. Je savais qu'27'elle se livrait '88','
	asc	'la prostitution mais elle n'27'a jamais,'
	asc	8e't'8e' ma prot'8e'g'8e'e m'90'me si de temps en,'
	asc	'temps elle me donnait un peu d'27'argent,'
	asc	'--Je ne sais rien sur sa mort et je,'
	asc	'n'27'ai rien d'27'autre '88' d'8e'clarer.'00

data1760	asc	'ABDOULAH Hocine - n'8e' le 23.4.55 '88','
	asc	'MEKNES (Maroc) - sans domicile fixe,'
	asc	'ni profession.,'
	asc	' ,'
	asc	'--Je reconnais que je fournissais un,'
	asc	'peu d'27'h'8e'ro'95'ne '88' Vera mais si vous ou,'
	asc	'bliez '8d'a je peux peut-'90'tre vous ren-,'
	asc	'seigner.,'
	asc	'--Elle faisait le tapin pour un nomm'8e','
	asc	'ZIEGLER Philibert que l'27'on n'27'a pas re,'
	asc	'vu depuis la mort de Vera. Parait qu'27','
	asc	'il a peur de se faire descendre par,'
	asc	'un nomm'8e' BLANC. J'27'en sais pas plus.'00

data1780	asc	'LE 8.6.82 NOTRE UNITE A ARRETE LE,'
	asc	'NOMME ZIEGLER PHILIBERT QUI AVAIT,'
	asc	'ROSSE UN CLIENT D'27'UNE PROSTITUEE,'
	asc	'NOMMEE EVA DELARUE QUI N'27'AURAIT,'
	asc	'PAS VOULU PAYER. FAUTE DE PREUVES,'
	asc	'SUFFISANTES ZIEGLER N'27'A PU ETRE,'
	asc	'INCULPE DE PROXENETISME.'00

data1790	asc	'DELARUE Eva - n'8e'e le 23.1.57 '88' PARIS,'
	asc	'sans profession - demeurant,'
	asc	'110 cours Fauriel '88' ST-ETIENNE,'
	asc	' ,'
	asc	'--Vera ne s'27'est pas suicid'8e'e.,'
	asc	'--Dans le milieu j'27'ai entendu dire qu,'
	asc	'elle en savait trop sur un braquage.,'
	asc	'Et comme elle avait un bijoutier dans,'
	asc	'ses habitu'8e's; un Mr DELROCHE Hubert,'
	asc	'de ST-ETIENNE et que celui-ci a '8e't'8e','
	asc	'braqu'8e' derni'8f'rement.A vous d'27'en,'
	asc	'tirer les conclusions.'00

data1810	asc	'DELARUE EVA'00

data1820	asc	'PROSTITUEE NOTOIRE PLUSIEURS FOIS,'
	asc	'APPREHENDEE POUR RACOLAGE SUR LA,'
	asc	'VOIE PUBLIQUE.N'27'A JAMAIS DONNE LE,'
	asc	'NOM DE SON PROXENETE.'00

data1830	asc	'CRUZ VERA'00

data1840	asc	'BLANC PHILIPPE,'
	asc	'NE LE 21.7.62 A CLERMONT (63),'
	asc	' ,'
	asc	'RECHERCHE POUR TENTATIVE D'27'HOMICI,'
	asc	'DE SUR BRIGADIER LEROUX LE 12.04.,'
	asc	'84 A PARIS. (AFF TRAITEE PAR CIAT,'
	asc	'PARIS).INDIVIDUS TRES DANGEREUX.'00

data1850	asc	'LE 12.4.84 AU COURS D'27'UN CONTROLE,'
	asc	'NOCTURNE LE BRIGADIER LEROUX EST,'
	asc	'GRIEVEMENT BLESSE PAR UN AUTOMO-,'
	asc	'BILISTE QUI LUI A FONCE DESSUS EN,'
	asc	'PRENANT LA FUITE. IL A ETE ETABLI,'
	asc	'AVEC CERTITUDE QU'27'IL S'27'AGIT DU NO,'
	asc	'MME BLANC PHILIPPE - RECHERCHE.'00

data1860	asc	'DURANT SON INCARCERATION ZIEGLER,'
	asc	'PHILIBERT A EU POUR COMPAGNONS DE,'
	asc	'CELLULES LES NOMMES LERAT GEORGES,'
	asc	'PUIS BLANC GILLES.,'
	asc	'ADRESSE DECLAREE A LA LIBERATION,'
	asc	'PLACE CARNOT A ST-ETIENNE.'00

data1870	asc	'BLANC Gilles - n'8e' le 2.11.60 a,'
	asc	'LYON (69) - sans domicile fixe,'
	asc	' ,'
	asc	'--Je ne suis pour rien dans cette af-,'
	asc	'faire. Je n'27'ai jamais mis les pieds,'
	asc	'dans l'27'immeuble de Vera CRUZ et je n'27','
	asc	'ai pas de BMW.,'
	asc	'--D'27'ailleurs le 5.10.85 j'27'ai pass'8e' la,'
	asc	'soir'8e'e '88' jouer aux cartes chez un ami,'
	asc	'KOWALSKI Stanislas qui habite 310 bis,'
	asc	'cours E.Zola '88' VILLEURBANNE 69.,'
	asc	'--Je n'27'ai rien d'27'autre '88' d'8e'clarer.'00

data1890	asc	'BLANC Philippe - n'8e' le 21.7.62 '88','
	asc	'CLERMONT-FERRAND 63 - demeurant 32,'
	asc	'pl des Terreaux '88' LYON 69.,'
	asc	' ,'
	asc	'--Je n'27'ai rien '88' voir avec la mort de,'
	asc	'Vera CRUZ. Je ne la connais m'90'me pas.,'
	asc	'De toute facon je ne d'8e'clarerai rien,'
	asc	'tant que vous n'27'aurez pas plus d'278e'l-,'
	asc	'lements.'00

data1910	asc	'KOWALSKI Stanislas - n'8e' le 14.12.52,'
	asc	88' VARSOVIE (Pol) - demeurant 310 bis,'
	asc	'cours E.Zola '88' VILLEURBANNE 69.,'
	asc	' ,'
	asc	'--J'27'affirme que je ne suis pour rien,'
	asc	'dans la mort de Vera CRUZ que je ne,'
	asc	'connaissais d'27'ailleurs pas.,'
	asc	'--Le 5.10.85 j'27'ai jou'8e' aux cartes '88','
	asc	'mon domicile toute la soir'8e'e avec mon,'
	asc	'ami BLANC Gilles.'00

data1930	asc	'KOWALSKI Stanislas,'
	asc	' ,'
	asc	'--Puisque vous avez arr'90't'8e' Philippe,'
	asc	'je reconnais que j'27'ai particip'8e' au,'
	asc	'braquage de la bijouterie DELROCHE en,'
	asc	'compagnie des fr'8f'res BLANC mais c'27'est,'
	asc	'Philippe qui a tir'8e'. Je ne sais rien,'
	asc	'sur la mort de Vera sinon que les fr'8f','
	asc	'res BLANC sont all'8e's chez elle le 5.,'
	asc	'10.85. J'27'ignore ce qui s'27'est pass'8e' la,'
	asc	'-bas. C'27'est Gilles qui m'27'a demand'8e' de,'
	asc	'lui fournir un alibi.'00

data1950	asc	'ZIEGLER Philibert,'
	asc	'--Je reconnais avoir '8e't'8e' le souteneur,'
	asc	'de Vera. Celle-ci avait eu des rensei,'
	asc	'gnements sur la bijouterie DELROCHE,'
	asc	'gr'89'ce '88' des confidences d'27'oreiller et,'
	asc	'm'27'en avait parl'8e'. Connaissant BLANC,'
	asc	'Gilles je lui ai propos'8e' le coup mais,'
	asc	'Je n'27'ai pas particip'8e' au braquage et,'
	asc	'celui-ci a mal tourn'8e' lorsque Philip-,'
	asc	'pe a tu'8e' Mm DELROCHE.Lorsque Vera l'27'a,'
	asc	'appris elle m'27'a t'8e'l'8e'phon'8e' en me mena-,'
	asc	8d'ant de tout raconter aux flics.J'27'ai,'
	asc	'donc averti Gilles mais je ne sais,'
	asc	'pas ce qui s'27'est pass'8e' chez elle.'00

data1980	asc	'BLANC Gilles,'
	asc	' ,'
	asc	'--Je reconnais que j'27'ai particip'8e' au,'
	asc	'braquage de la bijouterie DELROCHE,'
	asc	'mais je ne sais pas qui a tir'8e'; pas,'
	asc	'moi en tout cas. J'278e'tais avec mon fr'8f','
	asc	're Philippe et KOWALSKI Stanislas.,'
	asc	'--Lorsque Manouche m'27'a dit que Vera,'
	asc	'voulait moucharder aux flics; je suis,'
	asc	'all'8e' chez elle avec mon fr'8f're pour la,'
	asc	'raisonner. Elle a '8e't'8e' tr'8f's compr'8e'hen-,'
	asc	'sive et lorsque nous sommes partis,'
	asc	'elle '8e'tait encore vivante. A mon avis,'
	asc	'elle s'27'est suicid'8e'e.'00

data2000	asc	'BLANC Philippe,'
	asc	' ,'
	asc	'--C'27'est bien moi qui ai tir'8e' sur la,'
	asc	'bijouti'8f're avec le MAC 50 que j'27'avais,'
	asc	'vol'8e' au 92 RI. Lorsque mon fr'8f're m'27'a,'
	asc	'dit que Vera voulait nous donner nous,'
	asc	'sommes all'8e's chez elle. Gilles ne vou,'
	asc	'lait que lui faire peur mais j'27'ai,'
	asc	'pr'8e'f'8e'r'8e' l'278e'liminer. J'27'ai tir'8e' '88' bout,'
	asc	'touchant. Elle s'27'est accroch'8e'e '88' ma,'
	asc	'chemise; la d'8e'chirant. Gilles a alors,'
	asc	'eu l'27'id'8e'e de maquiller cela en suici-,'
	asc	'de. Il a donc '8e'crit la lettre et j'27'ai,'
	asc	'abondonn'8e' l'27'arme sur place.'00

*--- Examen

autopsieVERA	asc	'RESULTAT D'27'AUTOPSIE,'
	asc	' ,'
	asc	'La mort de Vera Cruz est due '88' la,'
	asc	'perforation du poumon gauche et du,'
	asc	'coeur par un projectile de gros,'
	asc	'calibre tir'8e' '88' bout touchant.'00

graphoGILLES	asc	'RESULTAT DE GRAPHOLOGIE,'
	asc	' ,'
	asc	'L'278e'criture de Gilles Blanc correspond,'
	asc	88' celle de l'278e'crit.'00
	
graphoVERA	asc	'RESULTAT DE GRAPHOLOGIE,'
	asc	' ,'
	asc	'L'278e'criture de Vera Cruz ne correspond,'
	asc	'pas '88' celle de l'278e'crit.'00

*--- Comparaison

data1240	asc	'-Vera Cruz avait peur de lui,'
	asc	'(le manouche)'00
data1250	asc	'-Phil correspond '88' Philibert'00

data1270	asc	'-Il fume des Rothmans'00
data1280	asc	'-Il est formellement reconnu par,'
	asc	'Mme Duplat comme '8e'tant le,'
	asc	'brun '88' moustaches'00
data1290	asc	'-Son '8e'criture correspond '88' celle,'
	asc	'de l'278e'crit'00

data1310	asc	'-Le fil noir correspond '88' sa,'
	asc	'chemise d'8e'chir'8e'e au niveau de,'
	asc	'la boutonni'8f're'00
data1320	asc	'-Le bouton correspond '88' ceux de,'
	asc	'sa chemise dont l'27'un a '8e't'8e' arrach'8e00
data1330	asc	'-Il poss'8f'de des cartouches 9mm,'
	asc	'du m'90'me lot que la douille'00
data1340	asc	'-Il a effectu'8e' son service,'
	asc	'militaire au 92 RI '88','
	asc	'Clermont-Ferrand 63'00

*--- Accusation
	
dataGAGNE	asc	'BRAVO ! C'27'est effectivement Philippe,'
	asc	'Blanc qui a froidement assassin'8e','
	asc	'Vera.,'
	asc	' ,'
	asc	'Votre acharnement '88' d'8e'nouer cette,'
	asc	'intrigue m'8e'rite mes f'8e'licitations.,'
	asc	' ,'
	asc	'J'27'esp'8f're que cette enqu'90'te vous aura,'
	asc	'donn'8e' l'27'envie d'27'en mener d'27'autres.,'
	asc	' ,'
	asc	'A bient'99't...,'
	asc	'                       Gilles BLANCON'00

*--- Le référentiel

dataNOMS	asc	'ABDOULAH,HOCINE,FRISE,'	; 1-3
	asc	'ZIEGLER,PHILIBERT,MANOUCHE,'	; 4-6
	asc	'KOWALSKI,STANISLAS,'	; 7-8
	asc	'BLANC,GILLES,PHILIPPE,'	; 9-11
	asc	'DELARUE,EVA,'		; 12-13
	asc	'CRUZ,VERA,'		; 14-15
	asc	'LAFEUILLE,NADINE,'	; 16-17
	asc	'DELROCHE,HUBERT,'	; 18-19
	asc	'MARTIN,NESTOR,VOISIN,'	; 20-22
	asc	'DUPLAT,SIMONE,CONCIERGE,'	; 23-25
	asc	'6151 SZ 42,9111 CD 69,'	; 26-27
	asc	'MAC,DOUILLE,56743,'	; 28-30
	asc	'TE 9,3.79,3-79'00	; 31-33

dataADRESSES	asc	'BALAY,BIJOUTERIE,CARNOT,GARE,PEUPLIERS,ROUTIER,TERREAUX,ZOLA,'	; 40-47
	asc	'CLERMONT,ETIENNE,GALMIER,LYON,MONTBRISSON,PAUL,PARIS,'	; 48-54
	asc	'CIAT,GIE,PREF,CRRJ,BDRJ,PRIS,'		; 55-60
	asc	'AUTOPSIE,GRAPHOLOGIE'00			; 61-62
	

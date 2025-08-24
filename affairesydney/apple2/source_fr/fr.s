*
* L'affaire Sydney
*
* (c) 1986, Gilles Blancon
* (c) 1986, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* TEXTES EN FRANCAIS
*-------------------------------

table1FR	da	texte11FR
	da	texte12FR
	da	texte13FR
	da	texte14FR
	da	texte15FR
	da	texte16FR

texte11FR	asc	'Un IMPACT de'0d
	asc	'balle contre'0d
	asc	'le mur de la'0d
	asc	'maison.'00

texte12FR	asc	'Une CLEF aux'0d
	asc	'initiales SJ.'00

texte13FR	asc	'PORTEFEUILLE'0d
	asc	'contenant'0d
	asc	0d
	asc	'permis-carte'0d
	asc	'd'27'identit'8e' et'0d
	asc	'carte bleue'0d
	asc	0d
	asc	'au nom de'0d
	asc	0d
	asc	'SYDNEY James'0d
	asc	0d
	asc	'Mari'8e0d
	asc	'deux enfants'0d
	asc	'5 pl J.Jaur'8f's'0d
	asc	88' CLERMONT'00

texte14FR	asc	'Une SACOCHE'0d
	asc	'ferm'8e'e '88' clef'0d
	asc	'marqu'8e'e SJ.'00

texte15FR	asc	'Ouverture de'0d
	asc	'la sacoche'0d
	asc	'avec la clef'0d
	asc	0d
	asc	'Contient un'0d
	asc	'carnet avec'0d
	asc	'informations'0d
	asc	'suivantes'0d
	asc	0d
	asc	'Ma'94'tre DECOL'0d
	asc	'PL de Jaude'0d
	asc	88' CLERMONT'0d
	asc	0d
	asc	'J.RENARD'0d
	asc	'78 03 18 46'00

texte16FR	asc	'Une PHOTO en'0d
	asc	'noir et blanc'0d
	asc	'qui ne permet'0d
	asc	'pas d'27'identi-'0d
	asc	'fier les deux'0d
	asc	'personnes'0d
	asc	's'27'embras-'0d
	asc	'sent'00

table2FR	da	texte21FR
	da	texte22FR
	da	texte23FR
	
texte21FR	asc	'Un M'8e'GOT de'0d
	asc	'marque CAMEL'0d
	asc	8e'cras'8e' dans'0d
	asc	'le vase.'00

texte22FR	asc	'Une DOUILLE'0d
	asc	'de calibre'0d
	asc	'7x64 sentant'0d
	asc	'encore la'0d
	asc	'poudre.'00

texte23FR	asc	'EMPREINTE'0d
	asc	'exploitable'0d
	asc	'laiss'8e'e sur'0d
	asc	'la vitre.'00

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
texte44FR	asc	'QUI ARRETEZ-VOUS ?  '00
texte45FR	asc	'IL VOUS MANQUE DES ELEMENTS POUR MOTIVER CETTE ARRESTATION'0d'UNE ERREUR JUDICIAIRE SERAIT INADMISSIBLE'00
texte45FR_2	asc	'CETTE ARRESTATION EST INSUFFISANTE'00
texteCONCERNE	asc	'DESTINATAIRE NON CONCERNE.STOP.'00
texte47FR	asc	'QUEL EXAMEN ?  '00
texte48FR	asc	'INVESTIGATION SANS INTERET'00
texte49FR	asc	'SUITE ->'00
texteINCONNU	asc	'DESTINATAIRE INCONNU.STOP.'00
texteREVEILLE	asc	'HO ! CHEF ! T'27'ES PAS REVEILLE.'00
texteORIG	asc	'ORIG '00
texteORIGCFD	asc	'ORIG GIE CLERMONT-FD'0d
	asc	'DEST '0d
	asc	'-------------------------------'00
texteDESTCFD	asc	'DEST GIE CLERMONT-FD'00
texteGIESTC	asc	'GIE ST-CHELY'00
texteSTOP	asc	'.STOP.'00
*pvAUDITION	asc	'  AUDITION         '00
pvAUDITION	asc	'  AUDITION'00
pvAUTOPSIE	asc	'  AUTOPSIE'00
pvBALISTIQUE	asc	' BALISTIQUE'00
pvFELICITATION	asc	'FELICITATION'00

* Curseur cadre bas : 271,182
* Curseur 

*	asc	'ORIG GIE CLERMONT-FD'00

texteENTETE1	asc	'Brigade de    GENDARMERIE NATIONALE'00
texteENTETE2	asc	'Recherches          --------'00
texteENTETE3	asc	' CLERMONT         '00	; '  AUDITION'0d
texteENTETE4	asc	'----------          --------'00

*---

data1810	asc	'-La victime -SYDNEY James- est morte,par perforation de la bo'94'te cranienne,et destruction partielle du cerveau.,-P'8e'n'8e'tration frontale d'27'un projectile,qui est ressorti au niveau du bulbe,rachidien - provoquant la mort.,'
	asc	'-L'27'absence de br'9e'lure et de trace de,poudre autour de la blessure indique,que le coup de feu a '8e't'8e' tir'8e' d'27'une,distance sup'8e'rieure '88' 5m., '00
data1830	asc	'Des '8e'l'8e'ments recueillis nous pouvons,'8e'tablir que le coup de feu a '8e't'8e',tir'8e' de l'27'appartement situ'8e' au 4'8f'me,'8e'tage de l'27'immeuble sis au 9 place,de la R'8e'publique., '00
data1840	asc	'L'27'autopsie de la victime '8e'tablissant,qu'27'il s'27'agit d'27'un tir plongeant,confirme notre '8e'tude balistique., '00
data1850	asc	'La douille de calibre 7x64 d'8e'couverte,sur place a '8e't'8e' tir'8e'e par une arme,longue '88' '8e'jection automatique., '00
data1860	asc	'La douille de calibre 7x64 d'8e'couverte,dans l'27'appartement a '8e't'8e' tir'8e'e par la,carabine REMINGTON de LANGUILLE., '00
data1870	asc	'ESTRADE Jeannot - pl. de la,R'8e'publique '88' CLERMONT-FD (63), '00
data1880	asc	'--J'27'ai entendu une d'8e'tonation et j'27'ai,vu un homme s'278e'crouler '88' terre sur le,trottoir d'27'en face.,--Quelques instants plus tard j'27'ai,'
	asc	'remarqu'8e' un homme sortant du no 9 en,courant. il portait un grand sac de,sport et s'27'est '8e'loign'8e' en direction,du boulevard p'8e'riph'8e'rique., '00
data1900	asc	'--Je reconnais formellement le nomm'8e',Patrick LANGUILLE comme '8e'tant l'27'homme,que j'27'ai vu sortir du no 9 quelques,instants apr'8f's l'27'assassinat., '00
data1910	asc	'RENARD Robert - 336 bis rue Blatin '88',CLERMONT-FD (63) - d'8e'tective-priv'8e', ,--Monsieur SYDNEY m'27'avait engag'8e' pour,surveiller sa femme qu'27'il soup'8d'onnait,d'27'infid'8e'lit'8e'., '00
data1920	asc	'--Jusqu'2788' pr'8e'sent je n'27'avais rien qui,puisse confirmer ses soup'8d'ons., '00
data1930	asc	'--C'27'est bien moi qui ai pris la photo,que vous avez d'8e'couverte.Il s'27'agit de,Mm SYDNEY en compagnie de son amant., '00
data1940	asc	'DUPUIS Marianne '8e'p SYDNEY - place,J.Jaur'8f's '88' CLERMONT-FERRAND (63), '00
data1950	asc	'--J'27'ignore pourquoi et par qui mon,mari a '8e't'8e' assassin'8e'. Il se rendait '88',son travail lorsque cela est arriv'8e'.,--Je ne lui connais pas d'27'ennemi., '00
data1960	asc	'--Je n'27'ai rien d'27'autre '88' d'8e'clarer et,je suis tr'8f's fatigu'8e'e depuis le d'8e'c'8f's,de mon mari. N'27'insistez pas., '00
data1970	asc	'--Effectivement j'27'avais demand'8e' '88' mon,mari qu'27'il accepte le divorce; ce qu'27',il refusait obstin'8e'ment., '00
data1980	asc	'--La photo que vous me pr'8e'sentez ne,me concerne pas. D'27'ailleurs il est,ais'8e' de constater que la jeune femme,porte des cheveux longs alors que je,les porte tr'8f's courts.,--Je n'27'ai pas d'27'amant., '00
data1990	asc	'--J'27'ignorais qu'27'un d'8e'tective priv'8e',avait '8e't'8e' engag'8e' par mon mari pour,me surveiller., '00
data2000	asc	'SYDNEY Sylvie - place J.Jaur'8f's '88',CLERMONT-FD(63), '00
data2010	asc	'--Je ne peux pas croire que mon p'8f're,ait '8e't'8e' assassin'8e'. C'278e'tait un homme,calme qui ne d'8e'sirait que le bonheur,de son foyer., '00
data2020	asc	'--Je ne reconnais pas les personnes,que l'27'on distingue en ombre chinoise,sur la photo que vous me pr'8e'sentez., '00
data2030	asc	'--Sur la photo que vous me pr'8e'sentez,je reconnais bien ma m'8f're avec un ami,de la famille ; Tino DI NALLO., '00
data2040	asc	'DECOL Hubert - place de Jaude '88',CLERMONT-FD (63)- avocat -, '00
data2050	asc	'--M. SYDNEY m'27'avait charg'8e' de son,dossier de divorce.,--C'27'est sa femme qui en a fait la,demande et M. SYDNEY voulait faire,durer la proc'8e'dure., '00
data2060	asc	'--J'27'ai cru comprendre que M. SYDNEY,voulait engager un d'8e'tective priv'8e',mais j'27'ignore dans quel but., '00
data2070	asc	'GACHET Peggy - employ'8e'e de maison -,pl J.Jaur'8f's '88' CLERMONT-FD (63), '00
data2080	asc	'--Je suis au service de la famille,SYDNEY depuis un an environ et je ne,vois pas qui aurait int'8e'r'90't '88' assas-,siner Monsieur., '00
data2090	asc	'-Mm SYDNEY est peut-'90'tre la femme que,l'27'on distingue sur la photo que vous,me pr'8e'sentez car il y a peu de temps,qu'27'elle a fait couper ses cheveux., '00
data2100	asc	'LAJOIE Henri - concierge -,pl. J.Jaur'8f's '88' CLERMONT-FD (63), ,'
	asc	'--M. SYDNEY '8e'tait un homme tranquille,qui me donnait un pourboire lorsque,je lui appelais un taxi de chez moi.'00
data2120	asc	'--Avant-hier il avait appel'8e' un taxi,pour se rendre rue Blatin '88' CLERMONT., '00
data2130	asc	'--Effectivement je fr'8e'quente Tino DI,NALLO depuis 6 mois mais cela n'27'a,rien '88' voir avec la mort de mon mari.,--Tino habite pl. des Dores '88' COURNON, '00

*--- 1..25, 26.. (GIE = 31) .. (LYON = 36) .. 39

data2140	asc	'TEMOIN,JEANNOT,ESTRADE,RENARD,ROBERT,MADAME,SYDNEY,MARIANNE,FILLE,SYLVIE,FILS,LUDOVIC,TINO,NALLO,DECOL,HUBERT,PATRICK,LANGUILLE,SERGENT,PEGGY,GACHET,SERVANTE,RECHERCHE,LAJOIE,CONCIERGE'00
data2150	asc	'JAURES,BLATIN,JAUDE,DORES,CIAT,GIE,CRRJ,BDRJ,CLERMONT,CHELY,LYON,AUTOPSIE,BALISTIQUE,DG'00

data2160	asc	'LANGUILLE Patrick - sans profession,H'99'tel "G'8e'vaudan" '88' ST-CHELY (48), '00
data2170	asc	'--Je ne connais pas Tino DI NALLO et,encore moins SYDNEY James. Je n'27'ai,rien '88' voir avec votre enqu'90'te.'00
data2180	asc	'--Je n'27'ai rien '88' d'8e'clarer concernant,cette affaire.'00
data2190	asc	'--Vous m'27'informez que vous avez,trouv'8e' mes empreintes sur une vitre,dans l'27'appartement d'27'o'9d' a '8e't'8e' tir'8e',le coup de feu.'00
data2200	asc	'--Vous affirmez que la douille d'8e'cou-,verte a '8e't'8e' tir'8e'e par ma carabine.'00
data2210	asc	'--Je n'27'ai pas '88' m'27'expliquer sur la,provenance de la somme de 20000 frs,que j'27'ai d'8e'pos'8e'e sur mon compte.'00
data2220	asc	'--Puisque Tino a parl'8e' j'27'avoue.,--C'27'est moi qui ai jet'8e' le m'8e'got de,Camel dans le vase et la douille a,bien '8e't'8e' tir'8e'e par ma carabine.,--Tino m'27'avait propos'8e' 30000 frs pour,abattre SYDNEY.,'
	asc	'--N'27'ayant pas de travail j'27'ai accept'8e'.,--J'27'ai rep'8e'r'8e' un appartement inoccup'8e',devant lequel SYDNEY passait '88' pied,tous les jours. j'27'ai forc'8e' la serrure,et j'27'ai attendu que SYDNEY arrive.'00
data2240	asc	'--Ma carabine '8e'tant equip'8e'e d'27'une,lunette je n'27'ai eu aucun mal '88' le,tuer d'27'une seule balle.,--Je me suis enfui '88' pied en cachant,mon arme dans un sac de sport.,--J'27'ai d'8e'pos'8e' une partie de l'27'argent,'
	asc	'sur mon compte bancaire et garde le,reste pour me mettre au '27'vert'27'.'00
data2260	asc	'DI NALLO Tino - repr'8e'sentant,pl. des Dores '88' COURNON (63), '00
data2270	asc	'--Je reconnais avoir une liaison avec,Marianne depuis plusieurs mois.,--Je n'27'ai aucune int'8e'r'90't dans la mort,de son mari puisque Marianne avait,demand'8e' le divorce.,--Au moment du meurtre je me trouvais,'
	asc	88' LYON chez des clients.'00
data2280	asc	'--J'27'ai fait mon service militaire au,92 RI '88' CLERMONT en 1975.'00
data2290	asc	'--Vous m'27'avez d'8e'j'88' interrog'8e' et je,n'27'ai rien d'27'autre '88' dire.'00
data2300	asc	'--Ludovic dit n'27'importe quoi. Je ne,connais pas le sergent dont il veut,parler.'00
data2310	asc	'--Effectivement je connais LANGUILLE,de longue date. N'8e'anmoins cela fait,tr'8f's longtemps que je ne l'27'ai pas,rencontr'8e' et je ne vois pas comment,celui-ci puisse '90'tre impliqu'8e' dans,le meurtre de M. SYDNEY.'00
data2320	asc	'--Effectivement j'27'ai retir'8e' la somme,de 30000 francs sur mon compte quel-,ques jours avant le meurtre.,J'27'avais des dettes de jeux '88' r'8e'gler,et je ne peux pas vous en dire plus.'00
data2330	asc	'--Je suis l'27'instigateur du meurtre,du mari de Marianne. Celui-ci ne vou-,lait pas accorder le divorce.,--De ma propre initiative j'27'ai d'8e'cid'8e',de l'278e'liminer. j'27'ai alors contact'8e','
	asc	'Patrick qui m'27'avait dit '88' plusieurs,reprises que pour de l'27'argent il ac-,ceptait de tuer quelqu'27'un. Je lui ai,donc donn'8e' 30000 frs pour qu'27'il tue,le mari de Marianne le jour o'9d' je me,'
	asc	'trouvais '88' LYON. Ce qu'27'il a fait.'00
data2350	asc	'SYDNEY Ludovic - '8e'tudiant,pl. J.Jaur'8f's '88' CLERMONT-FD (63), '00
data2360	asc	'--Je ne peux pas comprendre pourquoi,mon p'8f're a '8e't'8e' assassin'8e'. Peut-'90'tre,s'27'agit-il d'27'une erreur.'00
data2370	asc	'--Je connais tr'8f's bien Tino qui est,souvent '88' la maison. Je m'27'entends,bien avec lui. Il me parle de son,service militaire ou de moto.'00
data2380	asc	'--Je n'27'ai aucun renseignement qui,puisse vous aider dans votre enqu'90'te.'00
data2390	asc	'--Un jour Tino m'27'a parle d'27'un de ses,copains de r'8e'giment qu'27'il appelait,sergent. D'27'apres Tino c'278e'tait le,meilleur tireur de la compagnie.'00
data2400	asc	'COMPARAISON AVEC LANGUILLE PATRICK'00
data2410	asc	'-IL A EFFECTUE SON SERVICE DANS LA,MEME COMPAGNIE QUE TINO DI NALLO'00
data2420	asc	'-IL EST RECONNU FORMELLEMENT PAR,LE TEMOIN ESTRADE.'00
data2430	asc	'-IL DETIENT UNE CARABINE REMINGTON,AUTOMATIQUE 7x64.'00
data2440	asc	'-L'27'EXAMEN BALISTIQUE DESIGNE CETTE,CARABINE COMME L'27'ARME DU CRIME.'00
data2450	asc	'-L'27'EMPREINTE DECOUVERTE CORRESPOND,A CELLE DE SON POUCE GAUCHE.'00
data2460	asc	'-IL FUME DES CAMELS.'00
data2470	asc	'-LE 24 SEPTEMBRE IL A DEPOSE LA,SOMME DE 20000 FRS EN LIQUIDE,SUR SON COMPTE.'00
data2480	asc	'COMPARAISON AVEC TINO DI NALLO'00
data2490	asc	'-AU MOMENT DU MEURTRE IL ETAIT,BIEN A LYON'00
data2500	asc	'-IL A ETE CAMARADE DE CHAMBREE,AVEC PATRICK LANGUILLE'00
data2510	asc	'-IL A RETIRE 30000 FRS EN LIQUIDE,LE 20 SEPTEMBRE SUR SON COMPTE'00
data2520	asc	'LANGUILLE PATRICK ALIAS SERGENT,CONDAMNE LE 22.8.82 PAR T.C. RIOM,POUR DETENTION D'27'ARMES DE LA 4 EME,CATEGORIE A 1 AN D'27'EMPRISONNEMENT.,AFFAIRE TRAITEE PAR CIAT CLERMONT.'00
data2530	asc	'LE NOMME LANGUILLE PATRICK A ETE,INTERPELLE A LA SUITE D'27'UNE RIXE,SUR LA VOIE PUBLIQUE.,IL AVAIT ETE TROUVE PORTEUR D'27'UN,REVOLVER 357 MAGNUM DONT IL N'27'A,JAMAIS AVOUE LA PROVENANCE.'00
data2540	asc	'LANGUILLE PATRICK,NE FAIT ACTUELLEMENT L'27'OBJET,D'27'AUCUNE RECHERCHE.'00
data2550	asc	'NOTRE UNITE VIENT D'27'INTERPELLER LE,NOMME LANGUILLE PATRICK AU COURS,D'27'UN CONTROLE ROUTIER.,INTERESSE EST A VOTRE DISPOSITION,DANS NOS LOCAUX.'00
data2560	asc	'-        L'27'auteur a l'27'honneur de vous,adresser ses plus vives f'8e'licitations,pour  avoir su  mener avec  autant de,pers'8e'v'8e'rance et  d'27'intelligence cette,affaire SYDNEY.,'
data2570	asc	'-        Vous exercerez vos fonctions,prochainement   dans  votre  nouvelle,affectation au grade sup'8e'rieur.'00

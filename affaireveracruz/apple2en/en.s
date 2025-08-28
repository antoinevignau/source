*
* laffaire Vera Cruz
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

texteALLUMETTES	asc	''0d
	asc	''0d
	asc	''0d
	asc	''0d
	asc	'Bar Le Sympa '0d
	asc	'2 Station St.'0d
	asc	'ST-ETIENNE   '00

texteBOUTON	asc	'A button of  '0d
	asc	'black color  '00

texteCARNET	asc	''00	; carnet 1 & 2...

texteCARNET2	asc	'EVA Routiers'0d
	asc	'Caf'8e'         '0d
	asc	'    GIVORS 69'0d
	asc	''0d
	asc	'Nadine       '0d
	asc	'LAFEUILLE    '0d
	asc	'2 Balay Str. '0d
	asc	'ST-ETIENNE   '0d
	asc	''0d
	asc	'HUB  77523977'0d
	asc	''0d
	asc	''0d
	asc	'Fuzzy        '0d
	asc	'Bar of       '0d
	asc	'poplars      '00
	
texteCENDRIER	asc	'Ashtray with '0d
	asc	'2 cigarettes '0d
	asc	'ends:'0d
	asc	''0d
	asc	'-1 Rothmans  '0d
	asc	'-1 Camel with'0d
	asc	'traces of    '0d
	asc	'lipstick     '00
	
texteDOUILLE	asc	'Cartridge    '0d
	asc	'case'0d
	asc	' 9 mm caliber'0d
	asc	' incisive and'0d
	asc	' identifiable'0d
	asc	' TE 9 F 3-79.'00
	
texteLETTRE	asc	''0d
	asc	'I'27'm fed up   '0d
	asc	'with this    '0d
	asc	'boring life. '00

texteMAINGAUCHE	asc	''0d
	asc	'Left hand    '0d
	asc	''0d
	asc	'Thread of    '0d
	asc	'black cotton '0d
	asc	'present under'0d
	asc 	'a fingernail '00

textePIQURE	asc	'Left arm     '0d
	asc	''0d
	asc	'Traces of    '0d
	asc	'recent needle'0d
	asc	'marks more or'0d
	asc	'less healed  '00

textePISTOLET	asc	''0d
	asc	'Automatic    '0d
	asc	'Revolver     '0d
	asc	''0d
	asc	'Model: MAC 50'0d
	asc	'Cal.  : 9 mm  '0d
	asc	'Nx    : G56743'00

texteROTHMANS	asc	''00

texteSACAMAIN	asc	'Hand bag     '0d
	asc	'containing   '0d
	asc	'items bearing'0d
	asc	'the name Vera'0d
	asc	'Cruz, a      '0d
	asc	'packet of    '0d
	asc	'Camel, and   '0d
	asc	'toiletries   '00
	

* Partie 2 - Les menus

texte31FR	asc	'M = message'00	; 7,175,181
texte32FR	asc	'E = examination'00	; 7,183,189
texte33FR	asc	'S = statement'00	; 231,175,181
texte34FR	asc	'C = comparison'00	; 231,183,189
texte35FR	asc	'P = printer'00	; 480,175,181
texte36FR	asc	'A = arrest'00	; 480,183,189

* Coordonnees 7,181

texte41FR	asc	'WHOSE STATEMENT?  '00
texte42FR	asc	'ADDRESS?  '00
texte43FR	asc	'COMPARISON WITH WHOM?  '00
texte44FR	asc	'WHO DO YOU SUSPECT?  '00
texte45FR	asc	'YOU LACK CERTAIN ELEMENTS TO SUPPORT YOUR SUSPICIONS.'00
texte45FR_2	asc	'IT IS NOT SUFFICIENT'00
texteCONCERNE	asc	'ADDRESSEE NOT APPLICABLE.STOP.'00
texte47FR	asc	'WHICH EXAMINATION?  '00
texte48FR	asc	'WITHOUT INTEREST'00
texte49FR	asc	'NEXT ->'00
texteINCONNU	asc	'ADDRESSEE NOT KNOWN.STOP.'00
texteREVEILLE	asc	'HE! BOSS! WAKE UP!'00
texteORIG	asc	'ORIG '00
texteORIGCFD	asc	'ORIG GIE ST-ETIENNE'0d
	asc	'DEST '0d
	asc	'-------------------------------'00
texteDESTCFD	asc	'DEST GIE ST-ETIENNE'00
texteGIESTC	asc	'GIE ST-CHELY'00
texteSTOP	asc	'.STOP.'00
pvAUDITION	asc	'  STATEMENT '00
pvAUTOPSIE	asc	'   AUTOPSY  '00
pvGRAPHOLOGIE	asc	' GRAPHOLOGY '00
pvFELICITATION	asc	'CONGRATULATION'00

* Curseur cadre bas : 271,182
* Curseur 

*	asc	'ORIG GIE CLERMONT-Fd00

texteENTETE1	asc	' Research     NATIONAL CONSTABULARY'00
texteENTETE2	asc	'Brigade of       ---------------'00
texteENTETE3	asc	'ST-ETIENNE        '00	; '  AUDITION'0d
texteENTETE4	asc	'----------       ---------------'00

*--- Présentation des personnages

presABDOULAH	asc	'ABDOULAH'0d
	asc	'HOCINE'0d
	asc	''0d
	asc	'THE FUZZY'0d
	asc	''0d
	asc	'BORN 23.4.55'0d
	asc	'MEKNES (MAR)'00

presZIEGLER	asc	'ZIEGLER'0d
	asc	'PHILIBERT'0d
	asc	''0d
	asc	'THE GIPSY'0d
	asc	''0d
	asc	'BORN 17.08.59'0d
	asc	'LYON 69'00

presKOWALSKI	asc	'KOWALSKI'0d
	asc	'STANISLAS'0d
	asc	''0d
	asc	'BORN 14.12.52'0d
	asc	'WARSAW'0d
	asc	'(POL)'0d
	asc	''00

presGBLANC	asc	'BLANC'0d
	asc	'GILLES'0d
	asc	''0d
	asc	'BORN 2.11.60'0d
	asc	'LYON 2ND'0d
	asc	''0d
	asc	''00

presDELARUE	asc	'DELARUE'0d
	asc	'EVA'0d
	asc	''0d
	asc	'BORN 23.1.57'0d
	asc	'PARIS 75'0d
	asc	''0d
	asc	''00

presCRUZ	asc	'CRUZ'0d
	asc	'VERA'0d
	asc	''0d
	asc	'BORN 12.5.54'0d
	asc	'ST-ETIENNE'0d
	asc	''0d
	asc	''00

presPBLANC	asc	'BLANC'0d
	asc	'PHILIPPE'0d
	asc	''0d
	asc	'BORN 21.7.62'0d
	asc	'CLERMONT 63'0d
	asc	''0d
	asc	''00

*--- Les textes du jeu

data1510	asc	'SEAT 1234 AA 75,'
	asc	'BLANCON GILLES,'
	asc	'GENDARMERIE GAST-JUST,'
	asc	'ST-RAMBERT'00
	
data1520	asc	'BMW 9111 CD 69,'
	asc	'BLANC PHILIPPE,'
	asc	'32 TERREAUX SQUARE,'
	asc	'LYON 69'00

data1530	asc	'ABDOULAH HOCINE,'
	asc	'CONVICTED 3.1.80 TO TWO YEARS,'
	asc	'IMPRISONMENT FOR DRUG PUSHING.'00

data1540	asc	'ZIEGLER PHILIBERT,'
	asc	'CONVICTED 9.9.82 TO TWO YEARS,'
	asc	'IMPRISONMENT FOR POSSESSION OF,'
	asc	'ARMS ASSAULT AND BATTERY (DEALT,'
	asc	'WITH BY GIE ST-GALMIER 42),'
	asc	'IMPRISONED NEAR ST-PAUL (LYON)'00

data1550	asc	'KOWALSKI STANISLAS,'
	asc	'SUSPECTED OF HOUSE BREAKING IN,'
	asc	'1983 (GIE MONTBRISON 42),'
	asc	'NO PREVIOUS CONVICTION.'00

data1560	asc	'LAFEUILLE Nadine,'
	asc	'Born 1.2.56 in VALENCE (26),'
	asc	'Lives 2 Balay St in ST-ETIENNE.,'
	asc	' ,'
	asc	'--I am a childhood friend of Vera,'
	asc	'CRUZ. I met her the day before she,'
	asc	'died. She told me she knew too much,'
	asc	'about a dirty business and was,'
	asc	'afraid of a certain '22'Gipsy'2200
	
data1580	asc	'REVOLVER MAC 50 Nx G56743 STOLEN,'
	asc	'ON THE 11.1.85 FROM THE BARRACKS,'
	asc	'OF GUNSMITH (92 IR CLERMONT),'
	asc	'A BATCH OF MUNITION 9MM TE9F3-79,'
	asc	'(DEALT WITH BY GIE CLERMONT)'00
	
data1590	asc	'CONC. ROBBERY MAC 50 Nx G56743,'
	asc	'A BMW MARKED 69 HAD BEEN SEEN.,'
	asc	'THE SUSPECT IS AN EX-SOLDIER OF,'
	asc	'THE 92 IR CLERMONT.'00

data1600	asc	'BLANC GILLES,'
	asc	'CONVICTED IN 1981 TO 2 YEARS,'
	asc	'IMPRISONMENT FOR RECEIVING,'
	asc	'STOLEN JEWELS. SUSPECTED TO HAVE,'
	asc	'PARTICIPATED IN BANK HOLD-UPS,'
	asc	'(DEALT WITH BY CIAT LYON)'00

data1610	asc	'BLANC PHILIPPE,'
	asc	'NO PREVIOUS CONVICTION. SEE BDRJ.,'
	asc	'SEARCH WARRANT EMITTED.'00

data1620	asc	'THE OFFENCE OF RECEIVING STOLEN,'
	asc	'JEWELS WAS COMMITTED BY BLANC,'
	asc	'GILLES. IT WAS PROVEN HE WAS,'
	asc	'SPECIALIZED IN THIS TYPE OF,'
	asc	'AFFAIR WHICH HE SOLD IN SWITZER-,'
	asc	'LAND THROUGH A NETWORK THAT COULD,'
	asc	'NOT BE DISMANTLED. ONE OF HIS,'
	asc	'ACCOMPLICE NICKNAMED STAN COULD,'
	asc	'NOT HAVE BEEN IDENTIFIED.,'
	asc	'THEY REPORTEDLY STILL WORKED,'
	asc	'TOGETHER.'00

data1640	asc	'KOWALSKI STANISLAS HAS BEEN,'
	asc	'APPREHENDED 30.2.83 FOLLOWING,'
	asc	'THE BURGLARY OF A LARGE HOUSE.,'
	asc	'RELEASED THROUGH LACK OF EVIDENCE,'
	asc	'HAD PARTED WITH THE STOLEN,'
	asc	'JEWELRY BEFORE HIS ARREST.,'
	asc	'SEEMS ONLY TO BE INTERESTED IN,'
	asc	'VALUEABLE JEWELS. CONSIDERED A,'
	asc	'VERY GOOD SAFECRACKER IN LYON,'
	asc	'CIRCLES.'00

data1660	asc	'DUPLAT Simone - born 21.4.51 in ST-,'
	asc	'ETIENNE - Caretaker for the Forez,'
	asc	'in ST-ETIENNE 42.,'
	asc	' ,'
	asc	'--On the 5.10.85 I returned home,'
	asc	'about 11.00pm. In the hall,'
	asc	'I passed two men who ran down,'
	asc	'the stairs and got into a BMW.,'
	asc	'The first registration numbers,'
	asc	'are 9111.,'
	asc	'--One of the men had a thick,'
	asc	'moustache. I saw the second,'
	asc	'man with difficulty.'00

data1680	asc	'MARTIN Nestor - born 30.2.37 in,'
	asc	'LYON. Lives at the FOREZ Residence,'
	asc	'on Bergson Street in ST-ETIENNE.,'
	asc	' ,'
	asc	'--I am the next-door neighbor of,'
	asc	'Miss CRUZ whom I didn'27't know well.,'
	asc	'On 5.10.85 around 10:30pm I heard a,'
	asc	'bang coming from her apartement but,'
	asc	'at the time I did not realize it,'
	asc	'was a gunshot.,'
	asc	'--I remember hearing the nickname,'
	asc	'Phil.'00

data1700	asc	'DELROCHE Hubert - born 21.4.30 in,'
	asc	'LYON - Jeweller - Lives at People,'
	asc	'Square in ST-ETIENNE.,'
	asc	' ,'
	asc	'--I used to see Miss Vera quite,'
	asc	'assiduously but since my wife'27','
	asc	'murder I have not seen her again.,'
	asc	'--I was robbed on 2.10.85 by three,'
	asc	'men - one of them shot my wife dead,'
	asc	'as she tried to call hor help. The,'
	asc	'criminals fled.,'
	asc	'The Police Office of ST-ETIENNE,'
	asc	'takes care of this affair.'00

data1720	asc	'IN THE HOLD-UP OF DELROCHE,'
	asc	'JEWELLERS THE MURDERER OF MRS,'
	asc	'DELROCHE ANSWERS TO THE NICKNAME,'
	asc	22'PHIL'22'. A 9 MM CARTRIDGE CASE,'
	asc	'MARKED TE 9 F 3-79 WAS FOUND.,'
	asc	'THE CRIMINALS ESCAPED IN A BMW.,'
	asc	'THE PERPETRATORS WERE WELL,'
	asc	'INFORMED OF THE JEWELLERS.'00
	
data1740	asc	'ZIEGLER Philibert - born 17.8.59,'
	asc	'in LYON. Lives at 5 Carnot Square,'
	asc	'ST-ETIENNE - Unemployed.,'
	asc	' ,'
	asc	'--I knew Vera as a friend. I knew,'
	asc	'Vera made her living by prostitu-,'
	asc	'tion. She was never my prot'8e'g'8e' even,'
	asc	'if from time to time she gave me a,'
	asc	'little money.,'
	asc	'--I know nothing about her death and,'
	asc	'I have nothing else to report.'00

data1760	asc	'ABDOULAH Hocine - born 23.4.55 in,'
	asc	'MEKNES (Morocco) - Homeless and,'
	asc	'unemployed.,'
	asc	' ,'
	asc	'--I admit that I supplied Vera,'
	asc	'with a little heroine but if you,'
	asc	'forget that I can perhaps give,'
	asc	'you some information.,'
	asc	'--She was a prostitute of Philibert,'
	asc	'ZIEGLER who nobody has seen since,'
	asc	'Vera'27's death. It appears that he,'
	asc	'is afraid of being killed by,'
	asc	'someone named '22'BLANC'22'.'00

data1780	asc	'ON THE 8.6.82 OUR ORGANISATION,'
	asc	'ARRESTED ZIEGLER PHILIBERT WHO,'
	asc	'HAD BEATEN A CLIENT OF PROSTI-,'
	asc	'TUTE DELARUE EVA WHO WOULD NOT,'
	asc	'PAY. ZIEGLER COULD NOT BE CHARGED,'
	asc	'WITH PIMPING BECAUSE OF INSUFFI-,'
	asc	'CIENT EVIDENCE.'00
	
data1790	asc	'DELARUE Eva - born 23.1.57 in PARIS,'
	asc	'unemployed. Lives 110 cours Fauriel,'
	asc	'in ST-ETIENNE,'
	asc	' ,'
	asc	'--Vera did not commit suicide.,'
	asc	'--I have heard that she knew a lot,'
	asc	'about a burglary and that she had,'
	asc	'a jeweller among her customers;,'
	asc	'a certain Mr Hubert DELROCHE and,'
	asc	'that his property was broken into,'
	asc	'recently in ST-ETIENNE. It is up to,'
	asc	'you to draw your own conclusions.'00

data1810	asc	'DELARUE EVA'00

data1820	asc	'NOTORIOUS PROSTITUTE. OFTEN,'
	asc	'APPREHENDED FOR SOLITICING,'
	asc	'ON PUBLIC STREETS. HAS NEVER,'
	asc	'GIVEN THE NAME OF HER PIMP.'00
	
data1830	asc	'CRUZ VERA'00

data1840	asc	'BLANC PHILIPPE,'
	asc	'BORN 21.7.62 IN CLERMONT (63),'
	asc	' ,'
	asc	'WANTED FOR ATTEMPTED HOMICIDE OF,'
	asc	'BRIGADIER LEROUX ON 12.4.84 IN,'
	asc	'PARIS (DEALT WITH BY CIAT PARIS),'
	asc	'VERY DANGEROUS INDIVIDUAL.'00

data1850	asc	'ON THE 12.4.84 WHILE NIGHT PATROL,'
	asc	'BRIGADIER LEROUX WAS SERIOUSLY,'
	asc	'INJURED BY A HIT-AND-RUN DRIVER.,'
	asc	'IT WAS ESTABLISHED WITHOUT,'
	asc	'DOUBT THAT IT HAD TO BE,'
	asc	'BLANC PHILIPPE.'00

data1860	asc	'WHILE LYING IN PRISON ZIEGLER,'
	asc	'PHILIBERT HAD FOR HIS CELL MATES,'
	asc	'LERAT GEORGES AND BLANC GILLES.,'
	asc	'ADDRESS GIVEN WHEN HE WAS,'
	asc	'RELEASED: CARNOT SQUARE IN,'
	asc	'ST-ETIENNE'00

data1870	asc	'BLANC Gilles - born 2.11.60,'
	asc	'LYON (69) - homeless,'
	asc	' ,'
	asc	'--I had no part in this business.,'
	asc	'I have never set foot in Vera'27's,'
	asc	'home and I haven'27't got a BMW.,'
	asc	'--Furthermore on the 5.10.85 I spent,'
	asc	'the evening playing cards at,'
	asc	'Stanislas KOWALSKI'27's home at 310,'
	asc	'bis cours E. Zola VILLEURBANNE 69.,'
	asc	'--I have nothing further to declare.'00
	
data1890	asc	'BLANC Philippe - born 21.7.62 a,'
	asc	'CLERMONT-FERRAND 63,'
	asc	'32 Terreaux Square - LYON 69.,'
	asc	' ,'
	asc	'--I have nothing to gain from the,'
	asc	'death of Vera CRUZ. I don'27't even know,'
	asc	'her. In any case I won'27't make any,'
	asc	'statements until you have more,'
	asc	'information.'00

data1910	asc	'KOWALSKI Stanislas - born 14.12.52,'
	asc	'WARSAW (Pol),'
	asc	'310b crs E.Zola VILLEURBANNE 69.,'
	asc	' ,'
	asc	'--I assert I have no hand in the,'
	asc	'death of Vera CRUZ I didn'27't know.,'
	asc	'--On the 5.10.85 I stayed at home,'
	asc	'all the evening long playing cards,'
	asc	'with my friend Gilles BLANC.'00

data1930	asc	'KOWALSKI Stanislas,'
	asc	' ,'
	asc	'As you have arrested Philippe I admit,'
	asc	'that I took part in the burglary,'
	asc	'of the DELROCHE jewellers together,'
	asc	'with the BLANC brothers.,'
	asc	'It was Philippe who used the gun.,'
	asc	'I know nothing about Vera'27's death,'
	asc	'except that the BLANC brothers went,'
	asc	'to her house on the 5.10.85. I don'27't,'
	asc	'know what went on down there. Gilles,'
	asc	'asked me to provide him with an alibi.'00

data1950	asc	'ZIEGLER Philibert,'
	asc	' ,'
	asc	'--I admit being Vera'27's pimp.,'
	asc	'Courtesy of some pillow talk she had,'
	asc	'information on the DELROCHE jewel-,'
	asc	'lers and she told me about it.,'
	asc	'--Knowing Gilles BLANC I proposed,'
	asc	'the idea but I did not take part in,'
	asc	'the burglary and that went wrong,'
	asc	'when Philippe killed Mrs DELROCHE.,'
	asc	'When Vera found out she phoned me,'
	asc	'and threatened to tell everything.,'
	asc	'I therefore warned Gilles but I did,'
	asc	'not know what happened at her home.'00

data1980	asc	'BLANC Gilles,'
	asc	' ,'
	asc	'--I admit that I took part in the,'
	asc	'burglary of the DELROCHE jewellers.,'
	asc	'I don'27't know who shot - not me,'
	asc	'anyway. My brother Philippe and,'
	asc	'Stanislas KOWALSKI were with me.,'
	asc	'--When Gipsy told me that Vera,'
	asc	'wanted to inform the cops I went,'
	asc	'to her place with my brother to,'
	asc	'reason with her. She understood,'
	asc	'and when we left she wall still,'
	asc	'alive. In my opinion she commit-,'
	asc	'ted suicide.'00

data2000	asc	'BLANC Philippe,'
	asc	'--I was the shooter at the jewel-,'
	asc	'lers with the MAC 50 I had stolen,'
	asc	'from the 92 IR.,'
	asc	'--When my brother told me that Vera,'
	asc	'wanted to turn us in we went to her,'
	asc	'house. Gilles only wanted to scare,'
	asc	'her but I preferred to kill her.,'
	asc	'I shot a point blank range. She,' 
	asc	'clung to my shirt ripping it. It,'
	asc	'was then that Gilles had the idea,'
	asc	'of making it look like a suicide.,'
	asc	'He wrote the letter and I left the,'
	asc	'gun at the scene.'00

*--- Examen

autopsieVERA	asc	'AUTOPSY RESULT,'
	asc	' ,'
	asc	'Vera Cruz'27's death was caused by a,'
	asc	'puncture of her left lung and heart,'
	asc	'by a large-caliber projectile fired,'
	asc	'at close range.'00

graphoGILLES	asc	'GRAPHOLOGY RESULT,'
	asc	' ,'
	asc	'Gilles Blanc'27's handwriting matches,'
	asc	'that of the written note.'00
	
graphoVERA	asc	'GRAPHOLOGY RESULT,'
	asc	' ,'
	asc	'Vera Cruz'27's handwriting does not,'
	asc	'match that of the written note.'00

*--- Comparaison

data1240	asc	'-Vera Cruz was afraid of him,'
	asc	'(the Gipsy)'00
data1250	asc	'-Phil stands for Philibert'00

data1270	asc	'-He smokes Rothmans cigarettes'00
data1280	asc	'-He is formally recognized by,'
	asc	'Mrs Duplat as being the brown-,'
	asc	'haired man with the mustache'00
data1290	asc	'-His handwriting matches that,'
	asc	'of the written note'00

data1310	asc	'-The black thread matches,'
	asc	'his shirt which is torn at,'
	asc	'the buttonhole'00
data1320	asc	'-The button matches those on his,'
	asc	'shirt, one of which was torn off'00
data1330	asc	'-He owns 9mm cartridges from,'
	asc	'the same batch as the case'00
data1340	asc	'-He completed his military,'
	asc	'service with the 92 IR in,'
	asc	'Clermont-Ferrand 63'00

*--- Accusation
	
dataGAGNE	asc	'BRAVO ! It was indeed Philippe,'
	asc	'Blanc who murdered Vera in,'
	asc	'cold blood.,'
	asc	' ,'
	asc	'Your determination to unravel this,'
	asc	'mystery deserves my congratulations.,'
	asc	' ,'
	asc	'I hope this investigation has,'
	asc	'inspired you to pursue others.,'
	asc	' ,'
	asc	'See you soon...,'
	asc	'                       Gilles BLANCON'00

*--- Le référentiel

dataNOMS	asc	'ABDOULAH,HOCINE,FUZZY,'	; 1-3
	asc	'ZIEGLER,PHILIBERT,GIPSY,'	; 4-6
	asc	'KOWALSKI,STANISLAS,'	; 7-8
	asc	'BLANC,GILLES,PHILIPPE,'	; 9-11
	asc	'DELARUE,EVA,'		; 12-13
	asc	'CRUZ,VERA,'		; 14-15
	asc	'LAFEUILLE,NADINE,'	; 16-17
	asc	'DELROCHE,HUBERT,'	; 18-19
	asc	'MARTIN,NESTOR,NEIGHBOR,'	; 20-22
	asc	'DUPLAT,SIMONE,CARETAKER,'	; 23-25
	asc	'6151 SZ 42,9111 CD 69,'	; 26-27
	asc	'MAC,BULLET,56743,'	; 28-30
	asc	'TE 9,3.79,3-79'00	; 31-33

dataADRESSES	asc	'BALAY,JEWELRY,CARNOT,STATION,POPLARS,ROUTIER,TERREAUX,ZOLA,'	; 40-47
	asc	'CLERMONT,ETIENNE,GALMIER,LYON,MONTBRISSON,PAUL,PARIS,'	; 48-54
	asc	'CIAT,GIE,PREF,CRRJ,BDRJ,PRIS,'		; 55-60
	asc	'AUTOPSY,GRAPHOLOGY'00			; 61-62
	

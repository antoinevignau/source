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

texte11FR	asc	'A bullet'0d
	asc	'hole in the'0d
	asc	'wall of the'0d
	asc	'house.'00

texte12FR	asc	'A key with'0d
	asc	'the initials'0d
	asc	'SJ.'00

texte13FR	asc	'A wallet'0d
	asc	'containing'0d
	asc	0d
	asc	'driving'0d
	asc	'license, ID'0d
	asc	'card, visa'0d
	asc	'card in the'0d
	asc	'name of'0d
	asc	'James SYDNEY'0d
	asc	0d
	asc	'Married,'0d
	asc	'two children'0d
	asc	'5 St. James'0d
	asc	'Sq. CLERMONT'00

texte14FR	asc	'A locked'0d
	asc	'briefcase'0d
	asc	'marked SJ.'00

texte15FR	asc	'The key'0d
	asc	'opens the'0d
	asc	'briefcase'0d
	asc	'and within'0d
	asc	'is a diary'0d
	asc	'which con-'0d
	asc	'tains:'0d
	asc	0d
	asc	'Ma'94'tre DECOL'0d
	asc	'Jade Place'0d
	asc	'CLERMONT'0d
	asc	0d
	asc	'R. RENARD'0d
	asc	'(7) 803 1846'00

texte16FR	asc	'A black and'0d
	asc	'white photo'0d
	asc	'of a kissing'0d
	asc	'couple, but'0d
	asc	'you can'27't'0d
	asc	'make out who'00

table2FR	da	texte21FR
	da	texte22FR
	da	texte23FR
	
texte21FR	asc	'A Camel'0d
	asc	'cigarette'0d
	asc	'butt,'0d
	asc	'stubbed out'0d
	asc	'in the vase.'00

texte22FR	asc	'A spent'0d
	asc	'cartridge,'0d
	asc	'7x64, still'0d
	asc	'smelling of'0d
	asc	'powder.'00

texte23FR	asc	'Fingerprint'0d
	asc	'on the'0d
	asc	'window.'00

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
texteORIGCFD	asc	'ORIG GIE CLERMONT-FD'0d
	asc	'DEST '0d
	asc	'-------------------------------'00
texteDESTCFD	asc	'DEST GIE CLERMONT-FD'00
texteGIESTC	asc	'GIE ST-CHELY'00
texteSTOP	asc	'.STOP.'00
pvAUDITION	asc	'  STATEMENT '00
pvAUTOPSIE	asc	'   AUTOPSY  '00
pvBALISTIQUE	asc	'  BALLISTIC '00
pvFELICITATION	asc	'CONGRATULATION'00

* Curseur cadre bas : 271,182
* Curseur 

*	asc	'ORIG GIE CLERMONT-FD'00

texteENTETE1	asc	' Research     NATIONAL CONSTABULARY'00
texteENTETE2	asc	'Brigade of       ---------------'00
texteENTETE3	asc	' CLERMONT         '00	; '  AUDITION'0d
texteENTETE4	asc	'----------       ---------------'00

*---

data1810	asc	'The victim -James SYDNEY- is dead.,'	; 10
	asc	'His death was caused by a bullet,'
	asc	'perforating his cranium and par-,'
	asc	'tially destroying his brain. The,'
	asc	'projectile pierced the front and,'
	asc	'exited close to the Rachidean Bulb.,'
	asc	'Death was instantaneous. The absence,'
	asc	'of powder marks around the point of,'
	asc	'entry indicates that the weapon was,'
	asc	'fired at a distance in excess of 5m.,'00
data1830	asc	'From the information we have we are,'	; 5
	asc	'able to deduce that the shot was,'
	asc	'fired from the fourth floor flat,'
	asc	'No. 9 Republic Square.,'
	asc	' ,'00
data1840	asc	'The autopsy of the victim concludes,'	; 3
	asc	'that is was a long range shot con-,'
	asc	'firmed by the ballistic reports.,'00
data1850	asc	'The 7x64 caliber cartridge case,'	; 3
	asc	'had been fired from a long-range,'
	asc	'automatic weapon.,'00
data1860	asc	'The 7x64 caliber cartridge case,'	; 3
	asc	'had been fired from a REMINGTON,'
	asc	'rifle belonging to LANGUILLE.,'00
data1870	asc	'Jeannot ESTRADE      Republic Square,'	; 3
	asc	'CLERMONT (63),'
	asc	' ,'00
data1880	asc	'--I heard a gunshot and saw a man,'	; 8
	asc	'fall down. A few minutes later I saw,'
	asc	'a man running from No. 9 carrying,'
	asc	'a large sports holdall.,'
	asc	' ,'
	asc	'--He ran off in the direction of,'
	asc	'the main road.,'
	asc	' ,'00
data1900	asc	'--I am convinced that the man coming,'	; 4
	asc	'out from No. 9 a few minutes after,'
	asc	'the murder was Patrick LANGUILLE.,'
	asc	' ,'00
data1910	asc	'Robert RENARD      336 Blatin Street,'	; 6
	asc	'CLERMONT (63)      Private detective,'
	asc	' ,'
	asc	'--Mr SYDNEY hired me to watch his,'	; 2
	asc	'wife as he suspected her of having,'
	asc	'a lover.,'00
data1920	asc	'--Up till now I have been unable to,'	; 3
	asc	'confirm his suspicion.'00
data1930	asc	'--I did take the picture you found.,'
	asc	'--It is Mrs SYDNEY with her lover.,'
	asc	' ,'00
data1940	asc	'Marianne SYDNEY          Born DUPUIS,'
	asc	'St. James Square       CLERMONT (63),'
	asc	' ,'00
data1950	asc	'--I don'27't know who could have,'
	asc	'murdered my husband or why. He was,'
	asc	'on his way to work when it happened.,'
	asc	'He didn'27't have enemies.,'00
data1960	asc	'--I have nothing more to say. I am,'
	asc	'very tired. Please don'27't insist.,'
	asc	' ,'00
data1970	asc	'--I asked my husband for a divorce.,'
	asc	'But he refused.,'
	asc	' ,'
data1980	asc	'--This photo doesn'27't bother me at,'
	asc	'all. It is easy to see that this,'
	asc	'young lady has long hair while,'
	asc	'mine is short.,'
	asc	'--I have no lover.,'
	asc	' ,'00
data1990	asc	'--I ignored the fact that my husband,'
	asc	'hired a private eye to watch me.,'
	asc	' ,'00
data2000	asc	'Sylvie SYDNEY       St. James Square,'
	asc	'CLERMONT (63),'
	asc	' ,'00
data2010	asc	'--I can'27't believe that my father has,'
	asc	'been murdered. He was such a quiet,'
	asc	'man. All he  wanted was to have,'
	asc	'a happy family life.,'00
data2020	asc	'--I don'27't recognise the people in,'
	asc	'the shade in this photo.,'
	asc	' ,'00
data2030	asc	'--In this photo I recognise my,'
	asc	'mother with a family friend,'
	asc	'Tino DI NALLO,'00
data2040	asc	'Hubert DECOL               Solicitor,'
	asc	'Jade Place                  CLERMONT,'
	asc	' ,'00
data2050	asc	'--Mr SYDNEY placed his divorce file,'
	asc	'with me.,'
	asc	'--It was suggested by his wife and,'
	asc	'he asked me to draw it out.,'
	asc	' ,'00
data2060	asc	'--I think Mr SYDNEY wanted to hire,'
	asc	'a private detective but I don'27't,'
	asc	'know why.,'00
data2070	asc	'Peggy GACHET            House keeper,'
	asc	'St. James Square       CLERMONT (63),'
	asc	' ,'00
data2080	asc	'--I have been in service for over a,'
	asc	'year with the SYDNEY family and I,'
	asc	'can'27't see anyone wanting to kill,'
	asc	'my employer.,'00
data2090	asc	'--Mrs SYDNEY could be the lady in,'
	asc	'this photo because she has recently,'
	asc	'had her hair cut.,'
	asc	' ,'00
data2100	asc	'Henri LAJOIE               Caretaker,'
	asc	'St. James Square       CLERMONT (63),'
	asc	' ,'
	asc	'--Mr SYDNEY was a quiet man who,'
	asc	'always gave me a tip when I called a,'
	asc	'cab for him from my house.,'00
data2120	asc	'--The day before yesterday he called,'
	asc	'a cab to take him to Blatin Street,'
	asc	'in CLERMONT.,'00
data2130	asc	'--I have seen Tino DI NALLO quite,'
	asc	'often during the last six  months,'
	asc	'but it has nothing to do with death,'
	asc	'of my husband. Tino lives in Dores,'
	asc	'Square in COURNON.,'00

*--- 1..25, 26.. (GIE = 31) .. (LYON = 36) .. 39

data2140	asc	'WITNESS,JEANNOT,ESTRAD,RENARD,ROBERT,MRS,SYDNEY,MARIANNE,DAUGHTER,SYLVIE,SON,LUDOVIC,TINO,NALLO,DECOL,HUBERT,PATRICK,LANGUILLE,SERGEANT,PEGGY,GACHET,SERVANT,SEEK,LAJOIE,CARETAKER'00
data2150	asc	'JAMES,BLATIN,JADE,DORES,CIAT,GIE,CRRJ,BDRJ,CLERMONT,CHELY,LYON,AUTOPSY,BALLISTIC,DG'00

data2160	asc	'Patrick LANGUILLE         Unemployed,'
	asc	'H'99'tel "G'8e'vaudan"       ST-CHELY (48),'
	asc	' '00
data2170	asc	'--I don'27't know Tino DI NALLO and I,'
	asc	'don'27't know James SYDNEY. I have,'
	asc	'nothing to do with your inquiries.,'00
data2180	asc	'--I have nothing to say about this,'
	asc	'affair.'00
data2190	asc	'--You are telling me that you have,'
	asc	'found  my fingerprints on a window,'
	asc	'in the flat from where the shot,'
	asc	'was fired.'00
data2200	asc	'--You insist that the cartridge,'
	asc	'found in the room came from my rifle'00
data2210	asc	'--I don'27't have to explain to you,'
	asc	'where the 20000 Francs came from,',
	asc	'that were credited to my account.'00
data2220	asc	'--Since Tino has told you so I,'
	asc	'admit that I did throw the Camel,'
	asc	'cigarette butt into the vase and,'
	asc	'that my rifle was used.,'
	asc	'--Tino offered me 30000 Francs,'
	asc	'to kill SYDNEY.,'
	asc	'--I had no job or money so I,'
	asc	'accepted. ,'
	asc	'I found an unoccupied flat opposite,'
	asc	'SYDNEY'27'S route to work and broke in.,'
	asc	'Then I waited.'00
data2240	asc	'--With sights on my rifle I had no,'
	asc	'trouble hitting the target with one,'
	asc	'bullet.,'
	asc	'--Then I ran away with my rifle in,'
	asc	'a sports holdall.,'
	asc	'--I put some money in the bank and,'
	asc	'kept the rest for a good time.,'
	asc	' ,'00

data2260	asc	'Tino DI NALLO               Salesman,'
	asc	'Dores Square            COURNON (63),'
	asc	' '00
data2270	asc	'--I admit to having had an affair,'
	asc	'with Marianne for a few months.,'
	asc	'--Since Marianne had asked her,'
	asc	'husband for a divorce I had no need,'
	asc	'to kill her husband.,'
	asc	'--At the time of his death I was,'
	asc	'with some customers in LYON.'00
data2280	asc	'--I did my National Service in 1975,'
	asc	'with the 91st Division at Clermont.'00
data2290	asc	'--You have already interrogated me,'
	asc	'and I have nothing further to say.'00
data2300	asc	'--Ludovic is talking rubbish.,'
	asc	'I don'27't know the Sergeant he is'
	asc	'talking about.'00
data2310	asc	'--I have known LANGUILLE for a long,'
	asc	'time although I haven'27't seen him,'
	asc	'for ages.,'
	asc	'--I don'27't see how he could be,'
	asc	'involved in the murder of SYDNEY.'00
data2320	asc	'--A short time before the murder,'
	asc	'I had 30000 Francs in my account,'
	asc	'but I had gamblings debts that I,'
	asc	'don'27't wish to discuss.'00
data2330	asc	'--I am the person responsible for,'
	asc	'the murder of Marianne'27's husband.,'
	asc	'--He didn'27't want the divorce to,'
	asc	'happen so I decided to kill him.,'
	asc	'--I contacted Patrick who had told,'
	asc	'me on many occasions that he was,'
	asc	'prepared to kill for money.,'
	asc	'--I gave him 30000 Francs to kill,'
	asc	'Sydney on the day I was in Lyon.,'
	asc	'Which is what happened.'00

data2350	asc	'Ludovic SYDNEY               Student,'
	asc	'St. James Square       CLERMONT (63),'
	asc	' ,'00
data2360	asc	'--I can'27't understand why my father,'
	asc	'has been killed.,'
	asc	'Perhaps it was a mistake.,'00
data2370	asc	'--I know Tino very well. He is quite,'
	asc	'often at home. I get on well with,'
	asc	'him and he often speaks about his,'
	asc	'National Service and motorcycles.'00
data2380	asc	'--I have no information which could,'
	asc	'be of use in your inquiry.,'00
data2390	asc	'One day Tino told me about a friend,'
	asc	'of his from the Division. His name,'
	asc	'was the Sergeant. He was the best,'
	asc	'shot in the Company.,'00

data2400	asc	'COMPARISON WITH PATRICK LANGUILLE'00
data2410	asc	'-HE WAS IN THE SAME DIVISION AS,'
	asc	'TINO DI NALLO'00
data2420	asc	'-HE HAS BEEN FORMALLY RECOGNISED,'
	asc	'BY THE WITNESS ESTRAD.'00
data2430	asc	'-HE OWNS AN AUTOMATIC 7x64,'
	asc	'REMINGTON RIFLE.'00
data2440	asc	'-THE BALISTIC REPORT CONFIRMS THAT,'
	asc	'IT IS THE WEAPON USED IN THE,'
	asc	'SYDNEY SHOOTING.'00
data2450	asc	'-HIS FINGERPRINTS CORRESPOND TO,'
	asc	'THOSE FOUND IN THE FLAT.'00
data2460	asc	'-HE SMOKES CAMEL CIGARETTES.'00
data2470	asc	'-ON THE 24TH SEPTEMBER HE PAID,'
	asc	'20000 FRENCH INTO HIS BANK ACCOUNT.'00
data2480	asc	'COMPARISON WITH TINO DI NALLO'00
data2490	asc	'-AT THE TIME OF THE MURDER,'
	asc	'HE WAS IN LYON.'00
data2500	asc	'-HE WAS A ROOM-MATE WITH PATRICK,'
	asc	'LANGUILLE.'00
data2510	asc	'-HE WITHDREW 30000 FRANCS IN CASH,'
	asc	'FROM HIS BANK ACCOUNT ON THE 20TH,'
	asc	'OF SEPTEMBER.'00
data2520	asc	'PATRICK LANGUILLE AKA SERGEANT,'
	asc	'SENTENCED TO ONE YEAR IMPRISONMENT,'
	asc	'FOR ILLEGAL POSSESSION OF ARMS,'
	asc	'(4TH CATEGORY),'
	asc	'AFFAIR DEALT BY CIAT CLERMONT.'00
data2530	asc	'PATRICK LANGUILLE WAS DETAINED FOR,'
	asc	'STREET FIGHTING.,'
	asc	'HE WAS FOUND TO BE CARRYING A 357,'
	asc	'MAGNUM AND HE NEVER REVEALED WHERE,'
	asc	'HE GOT THE GUN FROM.'00
data2540	asc	'PATRICK LANGUILLE IS NOT WANTED BY,'
	asc	'ANY FORCE AT PRESENT.'00
data2550	asc	'OUR UNIT HAS JUST QUESTIONED,'
	asc	'PATRICK LANGUILLE WHILE CARRYING,'
	asc	'ROUTINE TRAFFIC INQUIRY. HE IS,'
	asc	'AVAILABLE AT OUR STATION IF YOU,'
	asc	'REQUIRE HIM.'00

data2560	asc	'-        The author congratulates you,'	; 5
	asc	'         on solving this mystery. You,'
	asc	' showed perseverance and intelligence,'
	asc	'    and an ability for police work in,'
	asc	'     clearing up '27'The Sydney Affair'27'.'00
data2570	asc	'-           You will now be promoted.,'	; 3
	asc	'-           Ready for your next case.,'
	asc	' '00
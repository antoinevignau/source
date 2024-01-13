*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

*
* Les chaines standards
*

strVOUSDETENEZ
	asc	'Vous avez en votre possession : '00

strVOUSRIEN
	asc	'Vous ne devez pas '90'tre fatigu'8e', vous'0D
	asc	'n'27'avez rien sur vous'00

strPOINT
	asc	'.'00
	
strVOUSLAVEZ
	asc	0D'Vous avez d'8e'j'88' cela... Etourdi !'0D00

strNOTOWNED
	asc	0D'Je ne savais pas qu'27'on pouvait poser'0D
	asc	'ce qu'27'on ne poss'8f'de pas...'0D00

strDACCORD
	asc	'D'27'accord'00

strILFAITNOIR
	asc	'La salle n'27'est pas '8e'clair'8e'e.'0D00

strVOSYEUX	asc	'Vos yeux ne voient plus rien.'0D00

strNIVEAU	asc	'NIVEAU 0'00	; +7 pour le niveau
strTEMPS	asc	'00:00'00

strILYA	asc	0D'Il y a aussi :'00
strCOMMA	asc	','00
strSPACE	asc	0D' '00
strRETURN	asc	0D00

strCOMMANDE	asc	0D'Ordre ? '00

strJENECOMPRENDS
	asc	'Je ne comprends pas'00
	
strIMPOSSIBLE
	asc	0D'Impossible '00
strCECHEMIN
	asc	'de prendre ce chemin'00
strEXCLAM
	asc	' !'0D00

strREPLAY	asc	0D'Voulez-vous rejouer ? '00

strPERDU	asc	0d'Comme je le pensais, vous vous '90'tes'0d
	asc	'stupidement fait avoir, et votre cadavre'
	asc	'(ou ce qu'27'il en reste) reposera '88' jamais'
	asc	'dans l'27'espace...'0d00

strGAGNE	asc	0d'D'27'accord,'0d
	asc	'vous m'27'avez battu, mais c'27'est un coup'0d
	asc	'de chance, et la prochaine fois ma'0d
	asc	'vengeance sera terrible.'0d
	asc	'Prenez peur, car le jour o'9d' je serai'0d
	asc	88' nouveau l'88', ma puissance n'27'aura plus'0d
	asc	'de limites, alors l'27'heure de la souf-'0d
	asc	'-france aura sonn'8e'...'0d
	asc	'                     Dr GENIUS.'0d00

strINTRO	asc	'     LE RETOUR DU Dr GENIUS'0d
	asc	'     Vous avez 20 minutes et'0d
	asc	'    400 unit'8e's de force pour'0d
	asc	'     remplir votre mission...'00

*-----------------------------------
* LES DONNEES
*-----------------------------------

*
* Les actions version hexadecimale
*

newA$	hex	0100411246012E4931394DFF
	hex	0300411245012E4931314DFF
	hex	010041122E4430334EFF
	hex	030041122E4430334EFF
	hex	190045112E4438354BFF
	hex	020041022E4430344EFF
	hex	020041312E4430354BFF
	hex	0400412E2E4430364BFF
	hex	0A1342012E4230314AFF
	hex	0A1242032E4230334AFF
	hex	0A0E42052E4230354AFF
	hex	0A2142062E4230364AFF
	hex	0A2A42082E4230384AFF
	hex	0A2B42092E4230394AFF
	hex	0A36420A2E4231304AFF
	hex	0A35420B2E4231314AFF
	hex	0A2D420C2E4231324AFF
	hex	0A2E420E2E4231344AFF
	hex	0A2F420F2E4430374AFF
	hex	0A10412E46092E4530394231364AFF
	hex	0A3042112E4231374430384BFF
	hex	0A3142122E4231384AFF
	hex	0A29451142022E4230324AFF
	hex	0A2942022E4430394531374230324DFF
	hex	0A2142072E4230374AFF
	hex	0B292E4330324AFF
	hex	0B132E4330314AFF
	hex	0B122E4330334AFF
	hex	0B2E2E4331344AFF
	hex	0B2142072E4330374AFF
	hex	0B212E4330364AFF
	hex	194A41152E4438394BFF
	hex	0B2A2E4330384AFF
	hex	0B2B2E4330394AFF
	hex	0B362E4331304AFF
	hex	0B352E4331314AFF
	hex	0B2D440D2E4F31324331334831334AFF
	hex	0B2D2E4331324AFF
	hex	0B102E4331364AFF
	hex	0B302E4331374AFF
	hex	0B312E4331384AFF
	hex	0A1142042E4230344AFF
	hex	0A1142132E4331394831394230354230344AFF
	hex	0B1144042E4330344AFF
	hex	0B1144132E4331394831394230354F30344AFF
	hex	052E440E2E4431324EFF
	hex	322E440E2E4431324EFF
	hex	4B2E440E2E4431324EFF
	hex	0F2F41142E4431334EFF
	hex	3435420B2E4431344EFF
	hex	2823410F2E4530384431364BFF
	hex	282343072E4431374BFF
	hex	28232E4431384EFF
	hex	2A0044082E4431394EFF
	hex	342A44082E4431394EFF
	hex	343144122E4432304EFF
	hex	0C4C41122E4432314EFF
	hex	0A1042102E4231364AFF
	hex	28002E4431354BFF
	hex	0F4D41312E4430354BFF
	hex	0F4D412E2E4430354BFF
	hex	0F4D2E4432324BFF
	hex	0F112E4432334EFF
	hex	0F44410F2E4432344BFF
	hex	4344410F2E4432354BFF
	hex	0F49411E2E4935334DFF
	hex	1949411E2E4935334DFF
	hex	0F1A412C2E4432374BFF
	hex	431A412C2E4432374BFF
	hex	434941352E4933304DFF
	hex	191A412C2E4432364BFF
	hex	5253412C2E4432384BFF
	hex	1C1E412C2E4432394BFF
	hex	1C1F412C2E4433304BFF
	hex	1C20412C2E4433314BFF
	hex	1C1D412C2E4433324BFF
	hex	2221410F42062E4330364830364230374AFF
	hex	2221410F42072E4433334BFF
	hex	0A0E42132E4231394AFF
	hex	0B0E42132E4331394AFF
	hex	0B0E2E4330354AFF
	hex	141744012E4433344EFF
	hex	141644014931492E2E4433354BFF
	hex	1416440141312E4433364934364DFF
	hex	14164401412E2E4433364934394DFF
	hex	14154401490E49144917491D49262E4433354BFF
	hex	14154401410E2E4433374630344DFF
	hex	1415440141142E4433374630354DFF
	hex	1415440141172E4433374630334DFF
	hex	14154401411D2E4433374630364DFF
	hex	141544012E4433374630374DFF
	hex	3412420346122E47303130344531384AFF
	hex	341242032E4433334BFF
	hex	322D440D2E4433334BFF
	hex	322D440C2E4331324831324231334AFF
	hex	342B4209460B2E4433384BFF
	hex	342B42092E4433394BFF
	hex	242C4209450B2E4631314AFF
	hex	242C4209460B2E4531314AFF
	hex	4B3044112E4434304BFF
	hex	323044112E4434304BFF
	hex	333044112E4AFF
	hex	332D440D2E4331334831334231324AFF
	hex	3436440A490449114916493049332E4433354BFF
	hex	3436440A2E4434314BFF
	hex	37002E4434324BFF
	hex	38002E4434334BFF
	hex	39002E4434344BFF
	hex	3A002E4434354BFF
	hex	3B002E4434364BFF
	hex	3C3B2E4434364BFF
	hex	3D002E4434374BFF
	hex	4E002E41FF

* 1714D04D05.C04C05H04H05B19J.	=> TUBE GLAC
* $11 = TUBE / $0E = GLACE
* $5A = METT / $11 = TUBE
*	hex	110E440444052E4330344330354830344830354231394AFF
	hex	5A11440444052E4330344330354830344830354231394AFF

	hex	502144072E4330374830374230364AFF
	hex	3F002E443438FF	; QUIT - D48
	hex	40002E4434394EFF
	hex	14182E4435304BFF
	hex	14424122450C2E4435314BFF
	hex	14414122450C2E4435314BFF
	hex	144241222E4435324EFF
	hex	144141222E4531334435374BFF
	hex	4546450C2E44353345313447303230354BFF
	hex	4546460C4932460D2E4435344EFF
	hex	4546460C450D2E44353345313447303230354BFF
	hex	4546460C41322E44353345313447303230354BFF
	hex	474A4115450F2E4433334BFF
	hex	474A41152E45313544353547303430374BFF
	hex	564A4115450F2E46313547303430304435364DFF
	hex	564A41152E4435334BFF
	hex	5758451041152E4631364435374BFF
	hex	575841152E4436364BFF
	hex	54002E443539FF	; SAVE - D59
	hex	55002E443630FF	; LOAD - D60
	hex	2526411D4410460C2E443631FF
	hex	2526411D460C2E4438364EFF
	hex	2526411D2E4436324EFF
	hex	1C1B412C2E4436384BFF
	hex	3E002E4436344BFF
	hex	3C3E2E4436344BFF
	hex	51002E4436334BFF
	hex	3C512E4436334BFF
	hex	241044102E4436394BFF
	hex	521044102E4436394BFF
	hex	470D412E2E4436374935314DFF
	hex	190D412E2E4437304BFF
	hex	192B42092E4437314BFF
	hex	194841322E4437324BFF
	hex	191342012E4439304BFF
	hex	010041082E4439314EFF
	hex	192741352E4933304DFF
	hex	19272E4DFF
	hex	19002E4437334BFF
	hex	0B592E4438374BFF
	hex	3C002E4438384BFF
	hex	00

*
* Les objets dans les salles
*

nbO	=	19

refO	dfb	$bd
	dfb	40,33,41,53,43,10,00,21,22,26
	dfb	01,06,00,17,20,00,47,19,00

tblO$	da	$bdbd
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9,O$10
	da	O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19
	
O$1	asc	'Un pistolet laser'00
O$2	asc	'Des gants ensanglant'8e's'00
O$3	asc	'Une bombe '88' retardement'00
O$4	asc	'Un tube'00
O$5	asc	'Une glaci'8f're'00
O$6	asc	'Une bo'94'te vide'00
O$7	asc	'Une bo'94'te pleine d'27'eau'00
O$8	asc	'Un vaporisateur'00
O$9	asc	'Un magn'8e'tophone'00
O$10	asc	'Un compteur Geiger'00
O$11	asc	'Un ventilateur'00
O$12	asc	'Un casque'00
O$13	asc	'Un casque enfil'8e00
O$14	asc	'Des '8e'chasses'00
O$15	asc	'Des conteneurs'00
O$16	asc	'Une radiocommande'00
O$17	asc	'Des lunettes de soleil'00
O$18	asc	'Une tron'8d'onneuse'00
O$19	asc	'La glaci'8f're avec le tube '88' l'27'int'8e'rieur'00

*
* Les directions
*

M	=	53

tblM$	da	$bdbd
	da	M$1,M$2,M$3,M$4,M$5,M$6,M$7,M$8,M$9,M$10
	da	M$11,M$12,M$13,M$14,M$15,M$16,M$17,M$18,M$19,M$20
	da	M$21,M$22,M$23,M$24,M$25,M$26,M$27,M$28,M$29,M$30
	da	M$31,M$32,M$33,M$34,M$35,M$36,M$37,M$38,M$39,M$40
	da	M$41,M$42,M$43,M$44,M$45,M$46,M$47,M$48,M$49,M$50
	da	M$51,M$52,M$53

M$1	dfb	2,02,3,03,00
M$2	dfb	3,04,4,01,00
M$3	dfb	1,01,2,04,3,19,00
M$4	dfb	1,02,2,05,4,03,00
M$5	dfb	3,06,4,04,5,38,00
M$6	dfb	1,05,4,07,00
M$7	dfb	2,06,3,16,4,08,00
M$8	dfb	2,07,3,09,00
M$9	dfb	1,08,2,13,3,10,4,11,00
M$10	dfb	1,09,0
M$11	dfb	1,18,2,09,3,17,00
M$12	dfb	3,13,6,27,00
M$13	dfb	1,12,4,09,00
M$14	dfb	3,15,0
M$15	dfb	1,14,4,16,00
M$16	dfb	1,07,2,15,00
M$17	dfb	1,11,0
M$18	dfb	00
M$19	dfb	1,03,2,20,3,18,00
M$20	dfb	4,19,0
M$21	dfb	3,23,0
M$22	dfb	2,23,4,25,00
M$23	dfb	1,21,3,24,4,22,00
M$24	dfb	1,23,0
M$25	dfb	2,22,6,49,00
M$26	dfb	1,27,0
M$27	dfb	3,26,4,28,5,12,00
M$28	dfb	2,27,4,29,00
M$29	dfb	2,28,4,30,00
M$30	dfb	2,29,0
M$31	dfb	2,40,3,32,00
M$32	dfb	1,31,2,44,3,33,00
M$33	dfb	1,32,3,49,00
M$34	dfb	1,41,4,43,00
M$35	dfb	2,36,3,43,00
M$36	dfb	1,37,2,48,4,35,00
M$37	dfb	1,38,3,36,00
M$38	dfb	1,39,2,47,3,37,4,45,6,05,00
M$39	dfb	3,38,4,40,00
M$40	dfb	2,39,4,31,00
M$41	dfb	3,34,0
M$42	dfb	1,50,2,43,00
M$43	dfb	1,35,2,34,4,42,00
M$44	dfb	4,32,0
M$45	dfb	2,38,0
M$46	dfb	00
M$47	dfb	3,48,4,38,00
M$48	dfb	1,47,4,36,00
M$49	dfb	1,33,3,50,5,25,00
M$50	dfb	1,49,3,42,00
M$51	dfb	3,46,0
M$52	dfb	00
M$53	dfb	2,29,0

*
* Les mots de passe
*

tblMP$	da	MP$1,MP$2,MP$3,MP$4,MP$5

MP$1	asc	'ORIC1'
MP$2	asc	'ATMOS'
MP$3	asc	'GENIS'
MP$4	asc	'ECHEC'
MP$5	asc	'ARGON'

MDP$	asc	'MANOIR'	; LOGO - Shorten it for the English version

*
* Le vocabulaire
* on fera index-1 b/c 8-bits
*

V	=	139+2

tblVL$	dfb	$bd
	dfb	<V$1,<V$2,<V$3,<V$4,<V$5,<V$6,<V$7,<V$8,<V$9,<V$10
	dfb	<V$11,<V$12,<V$13,<V$14,<V$15,<V$16,<V$17,<V$18,<V$19,<V$20
	dfb	<V$21,<V$22,<V$23,<V$24,<V$25,<V$26,<V$27,<V$28,<V$29,<V$30
	dfb	<V$31,<V$32,<V$33,<V$34,<V$35,<V$36,<V$37,<V$38,<V$39,<V$40
	dfb	<V$41,<V$42,<V$43,<V$44,<V$45,<V$46,<V$47,<V$48,<V$49,<V$50
	dfb	<V$51,<V$52,<V$53,<V$54,<V$55,<V$56,<V$57,<V$58,<V$59,<V$60
	dfb	<V$61,<V$62,<V$63,<V$64,<V$65,<V$66,<V$67,<V$68,<V$69,<V$70
	dfb	<V$71,<V$72,<V$73,<V$74,<V$75,<V$76,<V$77,<V$78,<V$79,<V$80
	dfb	<V$81,<V$82,<V$83,<V$84,<V$85,<V$86,<V$87,<V$88,<V$89,<V$90
	dfb	<V$91,<V$92,<V$93,<V$94,<V$95,<V$96,<V$97,<V$98,<V$99,<V$100
	dfb	<V$101,<V$102,<V$103,<V$104,<V$105,<V$106,<V$107,<V$108,<V$109,<V$110
	dfb	<V$111,<V$112,<V$113,<V$114,<V$115,<V$116,<V$117,<V$118,<V$119,<V$120
	dfb	<V$121,<V$122,<V$123,<V$124,<V$125,<V$126,<V$127,<V$128,<V$129,<V$130
	dfb	<V$131,<V$132,<V$133,<V$134,<V$135,<V$136,<V$137,<V$138,<V$139
	dfb	<V$200,<V$201
	
tblVH$	dfb	$bd
	dfb	>V$1,>V$2,>V$3,>V$4,>V$5,>V$6,>V$7,>V$8,>V$9,>V$10
	dfb	>V$11,>V$12,>V$13,>V$14,>V$15,>V$16,>V$17,>V$18,>V$19,>V$20
	dfb	>V$21,>V$22,>V$23,>V$24,>V$25,>V$26,>V$27,>V$28,>V$29,>V$30
	dfb	>V$31,>V$32,>V$33,>V$34,>V$35,>V$36,>V$37,>V$38,>V$39,>V$40
	dfb	>V$41,>V$42,>V$43,>V$44,>V$45,>V$46,>V$47,>V$48,>V$49,>V$50
	dfb	>V$51,>V$52,>V$53,>V$54,>V$55,>V$56,>V$57,>V$58,>V$59,>V$60
	dfb	>V$61,>V$62,>V$63,>V$64,>V$65,>V$66,>V$67,>V$68,>V$69,>V$70
	dfb	>V$71,>V$72,>V$73,>V$74,>V$75,>V$76,>V$77,>V$78,>V$79,>V$80
	dfb	>V$81,>V$82,>V$83,>V$84,>V$85,>V$86,>V$87,>V$88,>V$89,>V$90
	dfb	>V$91,>V$92,>V$93,>V$94,>V$95,>V$96,>V$97,>V$98,>V$99,>V$100
	dfb	>V$101,>V$102,>V$103,>V$104,>V$105,>V$106,>V$107,>V$108,>V$109,>V$110
	dfb	>V$111,>V$112,>V$113,>V$114,>V$115,>V$116,>V$117,>V$118,>V$119,>V$120
	dfb	>V$121,>V$122,>V$123,>V$124,>V$125,>V$126,>V$127,>V$128,>V$129,>V$130
	dfb	>V$131,>V$132,>V$133,>V$134,>V$135,>V$136,>V$137,>V$138,>V$139
	dfb	>V$200,>V$201
	
tblV	dfb	$bd
	dfb	01,01,02,02,03,03,04,04,05,05	; 1
	dfb	05,05,06,06,10,10,10,11,12,12
	dfb	13,13,14,15,16,17,17,17,18,19	; 21
	dfb	19,20,20,21,22,23,24,25,25,25
	dfb	26,27,28,29,30,31,32,33,34,35	; 41
	dfb	35,36,37,37,38,38,38,39,39,39
	dfb	40,41,42,43,43,44,45,46,47,48	; 61
	dfb	49,50,50,50,51,51,52,52,52,53
	dfb	54,54,55,55,56,56,57,58,58,59	; 81
	dfb	60,61,62,62,63,63,64,65,66,67	; 91
	dfb	68,69,69,70,70,71,72,73,73,74	; 101
	dfb	75,76,77,77,78,78,79,80,80,80
	dfb	81,81,82,83,83,84,84,84,85,85	; 121
	dfb	85,86,87,87,88,88,89,89,90	; last was 00, now 90
	dfb	200,201
	
V$1	str	'N'
V$2	str	'NORD'
V$3	str	'E'
V$4	str	'EST'
V$5	str	'S'
V$6	str	'SUD'
V$7	str	'O'
V$8	str	'OUES'
V$9	str	'G'
V$10	str	'GRIM'
V$11	str	'M'
V$12	str	'MONT'
V$13	str	'D'
V$14	str	'DESC'
V$15	str	'PREN'
V$16	str	'SAIS'
V$17	str	'RAMA'
V$18	str	'POSE'
V$19	str	'SAUT'
V$20	str	'ENJA'
V$21	str	'TELE'
V$22	str	'TV'
V$23	str	'GLAC'
V$24	str	'OUVR'
V$25	str	'RADI'
V$26	str	'FLAC'
V$27	str	'TUBE'
V$28	str	'NITR'
V$29	str	'BOMB'
V$30	str	'LASE'
V$31	str	'PIST'
V$32	str	'APPU'
V$33	str	'ENFO'
V$34	str	'ROUG'
V$35	str	'BLEU'
V$36	str	'JAUN'
V$37	str	'BOUT'
V$38	str	'APPR'
V$39	str	'EXAM'
V$40	str	'REGA'
V$41	str	'BIBL'
V$42	str	'LIVR'
V$43	str	'LIS'
V$44	str	'MATH'
V$45	str	'DALL'
V$46	str	'ARLE'
V$47	str	'MEMO'
V$48	str	'BOIT'
V$49	str	'REMP'
V$50	str	'EAU'
V$51	str	'H2O'
V$52	str	'RETO'
V$53	str	'ENTR'
V$54	str	'ABOR'
V$55	str	'VAIS'
V$56	str	'SOUC'
V$57	str	'ASTR'
V$58	str	'SALL'
V$59	str	'PIEC'
V$60	str	'LIEU'
V$61	str	'BOIS'
V$62	str	'GANT'
V$63	str	'VAPO'
V$64	str	'MAGN'
V$65	str	'LECT'
V$66	str	'CASS'
V$67	str	'CASQ'
V$68	str	'ECHA'
V$69	str	'CONT'
V$70	str	'LUNE'
V$71	str	'TRON'
V$72	str	'ENFI'
V$73	str	'PASS'
V$74	str	'METS'
V$75	str	'ENLE'
V$76	str	'DEPO'
V$77	str	'ENCL'
V$78	str	'DECL'
V$79	str	'ACTI'
V$80	str	'VENT'
V$81	str	'GEIG'
V$82	str	'COMP'
V$83	str	'REFL'
V$84	str	'PENS'
V$85	str	'RIEN'
V$86	str	'ATTE'
V$87	str	'DORS'
V$88	str	'AIDE'
V$89	str	'SECO'
V$90	str	'CONS'
V$91	str	'DEMA'
V$92	str	'ECOU'
V$93	str	'CHRO'
V$94	str	'TEMP'
V$95	str	'QUIT'	; 63 (3F)
V$96	str	'ABAN'
V$97	str	'SUIC'
V$98	str	'MANU'
V$99	str	'AUTO'
V$100	str	'FERM'
V$101	str	'ROBI'
V$102	str	'RETI'
V$103	str	'ARRE'
V$104	str	'RESP'
V$105	str	'SOUF'
V$106	str	'ALLU'
V$107	str	'TABL'
V$108	str	'REFR'
V$109	str	'FRIG'
V$110	str	'ORDI'
V$111	str	'ESSA'
V$112	str	'FLAQ'
V$113	str	'PORT'
V$114	str	'SAS '
V$115	str	'LIST'
V$116	str	'INVE'
V$117	str	'ESCA'
V$118	str	'VIDE'
V$119	str	'VERS'
V$120	str	'RENV'
V$121	str	'FORC'
V$122	str	'ENER'
V$123	str	'TOUR'
V$124	str	'PAGE'
V$125	str	'FEUI'
V$126	str	'SAVE'	; 84 (54)
V$127	str	'SAUV'
V$128	str	'CSAV'
V$129	str	'LOAD'	; 85 (55)
V$130	str	'ENRE'
V$131	str	'CLOA'
V$132	str	'ETEI'
V$133	str	'RETA'
V$134	str	'CORR'
V$135	str	'DIRE'
V$136	str	'TRAJ'
V$137	str	'TOUT'
V$138	str	'TOTA'
V$139	str	'RANG'	; RANGER (TUBE DANS GLACE => RANG TUBE)

V$200	str	'STOP'	; STOP coupe toutes les interruptions
V$201	str	'MUSI'

*
* Les reponses (str7xxx)
*

*		'0         1         2         3         '
*		'0123456789012345678901234567890123456789'
*		'----------------------------------------'

str4010	asc	'Une boule d'27'acier tomb'8e'e du plafond'0d
	asc	'vient de s'278e'craser sur votre casque.'00
str4020	asc	'Une boule d'27'acier vient de tomber du'0d
	asc	'plafond, vous avez le cr'89'ne d'8e'fonc'8e'...'00
str4030	asc	'Vous venez de tomber dans une flaque d'270d
	asc	'acide, '8d'a cr'8e'pite...'00
str4040	asc	'Vous venez de rentrer dans le r'8e'acteur'0d
	asc	'atomique du vaisseau..!'00
str4050	asc	'La porte ne veut pas s'27'ouvrir'00
str4060	asc	'Un peu de m'8e'moire... Comment '90'tes-vous'0d
	asc	'entr'8e' ?'00
str4070	asc	'Je ne vous savais pas assez muscl'8e' pour '
	asc	'soulever une tonne.'00
str4080	asc	'Vous avez raison, la vue c'27'est la vie !'00
str4090	asc	'Les gants '8e'taient radioactifs, vous'0d
	asc	'perdez la vue.'00
str4100	asc	'Vous l'27'avez d'8e'j'88' sur vous.'00
str4110	asc	'Impossible, je ne vois pas ceci ici.'00
str4120	asc	'Vous vous arrachez la t'90'te en tombant'0d
	asc	'des '8e'chasses.'00
str4130	asc	'Des monstres sortis des containers vous '
	asc	'd'8e'vorent tout cru !'00
str4140	asc	'L'27'air frais vous fait du bien. Dommage'0d
	asc	'que l'27'h'8e'lice vous ait coup'8e' la t'90'te.'00
str4150	asc	'Qu'27'est-ce que vous voulez boire ???'00
str4160	asc	'Ah oui...l'27'eau est bonne.'00
str4170	asc	'Il n'27'y a pas d'27'eau ici.'00
str4180	asc	'L'27'eau '8e'tait contamin'8e'e par les bo'94'tes'0d
	asc	'radioactives.'00
str4190	asc	'Vous r'8e'trecissez..petit..petit..et une'0d
	asc	'araign'8e'e vous mange !'00
str4200	asc	'Ca coupe une tron'8d'onneuse, comme le'0d
	asc	'prouve votre t'90'te au sol.'00
str4210	asc	'Vous glissez et tombez dans la flaque.'0d
	asc	'L'27'acide cr'8e'pite.'00
str4220	asc	'Il n'27'y a pas ici de porte verrouill'8e'e'
str4230	asc	'En secouant le tube pour l'27'ouvrir,'0d
	asc	'la nitroglyc'8e'rine a explos'8e'.'00
str4240	asc	'Pourquoi ouvrir un robinet qui ne ferme '
	asc	'pas !'00
str4250	asc	'Le robinet ne se ferme pas.'00
str4260	asc	''00
str4270	asc	'La biblioth'8f'que n'27'a pas de porte...'00
str4280	asc	'Il n'27'y a rien de mieux sur les autres'0d
	asc	'pages.'00
str4290	asc	'...c'27'est toi J.R qui a pris ma femme et '
	asc	'mon p'8e'trole, tu es inf'89'me.'00
str4300	asc	'Collection Arlepin, tout un r'90've'0d
	asc	'd'278e'vasion.'00
str4310	asc	'...et c'27'est moi Genius le grand qui cr'8e'a'
	asc	'un superbe manoir...'00
str4320	asc	'1031141221242713182310291430271214232927102110272718311427103023141427142324303114212114'00
str4321	asc	' <tapez une touche> '00
str4330	asc	'Vous l'27'avez d'8e'j'88' fait.'00
str4340	asc	'Le laser vient d'27'exploser.'00
str4350	asc	'Il ne se passe rien.'00
str4360	asc	'Le sas s'27'ouvre, vous passez dans la'0d
	asc	'salle '88' c'99't'8e'.'00
str4370	asc	'Cela agit sur un contacteur '88' infrarouge'
	asc	'qui commande l'278e'clairage.'00
str4380	asc	'Allons enfants de la patrie...'00
str4390	asc	'Vous entendez : '27'Le laser ouvrira la'0d
	asc	'porte'2700
str4400	asc	'Les lunettes sont trop fortes, vous'0d
	asc	'voyez trouble.'00
str4410	asc	'La salle est radioactive.'00
str4420	asc	'Vous avez quelque chose pour ?'00
str4430	asc	'C'27'est votre probl'8f'me, mais le temps'0d
	asc	'passe.'00
str4440	asc	'Avez-vous si sommeil que ca ?'00
str4450	asc	'Et puis quoi encore !'00
str4460	asc	'Faites un plan...'00
str4470	asc	'Vous entendez le ronronnement des'0d
	asc	'moteurs.'00
str4480	asc	'J'278e'tais s'9e'r que vous '8e'tiez un l'89'che.'00
str4490	asc	'Vous passez la t'90'te '88' travers un sas,'00
str4491	asc	'et appuyez sur le bouton de fermeture'00
str4500	asc	'Quel bouton ?'00
str4510	asc	'Les boutons ne fonctionnent pas car'0d
	asc	'l'27'ordinateur central les contr'99'le.'00
str4520	asc	'Le syst'8f'me automatique est d'8e'r'8e'gl'8e', il'0d
	asc	'met du gaz carbonique '88' la place de'0d
	asc	'l'27'oxyg'8f'ne.'00
str4530	asc	'Vous respirez un grand coup.'00
str4540	asc	'Que voulez-vous respirer ? Il n'27'y a plus'
	asc	'd'27'oxyg'8f'ne.'00

str4550	asc	'Vous avez 2 essais'00
str4552	asc	'pour entrer le mot'00
str4553	asc	'FAUX!'00
str4554	asc	'Encore rat'8e'.'0d
	asc	'L'27'ordinateur vous explose '88' la figure.'00
str4556	asc	'de passe '00
str4558	asc	'Exact, vous '90'tes perspicace !'00
str4559	asc	0d'Le mot de passe du retour est '00
str4559_1	asc	'UIN LOI QRU ILD ESP ECU TAS'00
str4559_2	asc	'ASU VIE RAL HOU MEA NOI THE'00

str4560	asc	'C'27'est d'27'accord.'00
str4570	asc	'Il '8e'tait temps, vous alliez mourir.'00
str4580	asc	'Vous mourrez d'8e'shydrat'8e'.'00
str4590	asc	''00
str4595	asc	'Slot 1-9 (0=sortir) ? '00
str4600	asc	''00
str4610	asc	'Le sas se referme derri'8f're vous,'0d
	asc	'le tableau de contr'99'le s'27'allume et'0d
	asc	'l'27'ordinateur de bord vous demande le'0d
	asc	'mot de passe pour le retour '00
str4615	asc	0d'Le vaisseau de secours s'278e'loigne,'0d
	asc	'au loin vous voyez Genius qui pleure'0d
	asc	'derri'8f're un hublot'00
str4616	asc	0d'          VOUS AVEZ GAGNE'00
str4618_1	asc	0d'Mais, que se passe-t-il, vous avez d'9e0d
	asc	'vous tromper de mot de passe, votre'0d
	asc	'vaisseau de poche fonce sur le soleil.'00
str4618_2	asc	0d'Vous venez de r'8e'aliser que Genius'0d
	asc	'pleurait de JOIE...!'00

str4620	asc	'La soucoupe a explos'8e' au d'8e'collage.'00
str4630	asc	'Energie restante : '00
strFORCE	asc	'20000'00
str4640	asc	'Petit dr'99'le... Le chronom'8f'tre est'0d
	asc	'affich'8e' en permanence'00
str4650	asc	0d'Le temps que vous aviez pour votre'0d
	asc	'mission est '8e'coul'8e', vous avez '8e'chou'8e'.'00
str4660	asc	'Votre trajectoire est bonne, pourquoi la'
	asc	'corriger ?'00
str4670	asc	'Le mur au nord coulisse, vous avancez'0d
	asc	'dans cette salle.'00
str4680	asc	'Quel livre ?'00
str4690	asc	'Au dos du bo'94'tier est marqu'8e' :'00
str4692	asc	'        '27'PROTEGEZ MOI'A700
str4700	asc	'Vous remarquez un bo'94'tier de radio-'0d
	asc	'commande.'00
str4710	asc	''00
str4720	asc	''00
str4730	asc	'Que regardez vous ?'00
str4740	asc	0d'Le tube de nitroglyc'8e'rine vient d'270d
	asc	'exploser, vous '90'tes pulv'8e'ris'8e'.'00
str4750	asc	'La bombe '88' retardement vient d'270d
	asc	'exploser, vous '90'tes pulv'8e'ris'8e'.'00
str4760	asc	'La bombe '88' retardement a explos'8e', elle a'
	asc	'endommag'8e' le syst'8f'me de chauffage,'0d
	asc	'vous '90'tes carbonis'8e00
str4770	asc	'La bombe a explos'8e', vous '8e'tiez trop pr'8f's'
	asc	'et '90'tes devenu fou...'00
str4780	asc	'La bombe '88' retardement n'278e'tait pas assez'
	asc	'forte, l'27'ordinateur central n'27'est qu'270d
	asc	'endommag'8e', il vous fait exploser...'00
str4790	asc	'Bravo! L'27'ordinateur central est d'8e'truit,'
	asc	'mais le syst'8f'me d'27'oxyg'8e'nation ne fonc-'0d
	asc	'-tionne plus, de plus la trajectoire du'0d
	asc	'vaisseau a chang'8e'.'00
str4800	asc	'Vous n'27'avez plus de souffle,'0d
	asc	'vous '90'tes mort asphyxi'8e'.'00
str4810	asc	'Vous auriez d'9e' corriger la trajectoire,'0d
	asc	'vous avez percut'8e' le soleil.'00
str4820	asc	'A force de traverser les salles radio-'0d
	asc	'-actives, vous '90'tes mort contamin'8e'.'00
str4830	asc	0d'Il fait de plus en plus chaud...'00
str4840	asc	'L'27'ordinateur vient d'27'exploser !'00
str4845	asc	'Vous avez d'9e' le laisser allum'8e'.'00
str4850	asc	'Comment !!! Vous '90'tes aveugle.'00
str4860	asc	'Vous n'27'aviez pas pris la radiocommande'0d
	asc	'qui a explos'8e' quand le vaisseau a percu-'
	asc	'-te le soleil, son explosion a d'8e'clench'8e
	asc	'la fin du monde.'00
str4870	asc	'Non ! pas de strip-tease.'00
str4874	asc	'Vous avez pos'8e' tout ce que vous'
	asc	'transportiez.'00
str4880	asc	'Ca ne se demande pas.'00
str4890	asc	'Il y a effectivement un ordinateur parmi'
	asc	'le tableau de contr'99'le.'00
str4891	asc	'L'27'ordinateur n'27'est pas en fonction.'00
str4900	asc	'Sur le laser, vous voyez trois boutons :'
	asc	'jaune, rouge et bleu.'00
str4910	asc	'Vous '90'tes entre dans le d'8e'sint'8e'grateur'0d
	asc	'de particules...'00
str4920	asc	'Vous '90'tes entr'8e' dans le vaisseau par le '
	asc	'sas '88' l'27'ouest qui ne s'27'ouvre pas de'0d
	asc	'l'27'int'8e'rieur.'00

str5500	asc	0d'Etes-vous s'9e'r (O/N) ? '00

str19050	asc	'   Merci d'27'avoir essay'8e'...!'00
str19060	asc	'  R'8e'veillez-vous , c'27'est fini !'00


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
	asc	'You carry: '00

strVOUSRIEN
	asc	'You mustn'27't be tired. You carry nothing.'00

strPOINT
	asc	'.'00
	
strVOUSLAVEZ
	asc	0D'You already have this... Stunned!'0D00

strNOTOWNED
	asc	0D'I didn'27't know you could drop something'0D
	asc	'you don'27't own...'0D00

strDACCORD
	asc	'OK'00

strILFAITNOIR
	asc	'The room is not lit.'0D00

strVOSYEUX	asc	'Your eyes no longer see anything.'0D00

strNIVEAU	asc	'LEVEL 0'00		; +6 pour le niveau
strTEMPS	asc	'00:00'00

strILYA	asc	0D'There is also:'00
strCOMMA	asc	','00
strSPACE	asc	0D' '00
strRETURN	asc	0D00

strCOMMANDE	asc	0D'Command? '00

strJENECOMPRENDS
	asc	'I don'27't understand'00
	
strIMPOSSIBLE
	asc	0D'Not possible '00
strCECHEMIN
	asc	'to take this path'00
strEXCLAM
	asc	'!'0D00

strREPLAY	asc	0D'Play again? '00

strPERDU
	asc	0d'As I thought, you were stupidly fooled,'0d
	asc	'and your corpse (or what'27's left of it)'0d
	asc	'will lie in space forever...'00
	
strGAGNE	asc	0d'All right,'0d
	asc	'You beat me, but it was a stroke of'0d
	asc	'luck, and next time my revenge will be'0d
	asc	'terrible.'0d
	asc	'Be afraid, because I will be back and'0d
	asc	'my power will have no limits,'0d
	asc	'then the hour of suffering'0d
	asc	'will have come...'0d
	asc	'                     Dr GENIUS.'0d00

strINTRO	asc	'     THE RETURN OF Dr GENIUS'0d
	asc	'     You have 20 minutes and'0d
	asc	'      400 units of force to'0d
	asc	'     complete your mission..'00

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
	
O$1	asc	'A laser gun'00
O$2	asc	'Bloody gloves'00
O$3	asc	'A time bomb'00
O$4	asc	'A tube'00
O$5	asc	'A cooler'00
O$6	asc	'An empty box'00
O$7	asc	'A box full of water'00
O$8	asc	'A vaporizer'00
O$9	asc	'A tape recorder'00
O$10	asc	'A Geiger counter'00
O$11	asc	'A fan'00
O$12	asc	'A helmet'00
O$13	asc	'A helmet on'00
O$14	asc	'Stilts'00
O$15	asc	'Containers'00
O$16	asc	'A radio control'00
O$17	asc	'Sunglasses'00
O$18	asc	'A chainsaw'00
O$19	asc	'The cooler with the tube inside'00

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
MP$4	asc	'CHESS'
MP$5	asc	'ARGON'

MDP$	asc	'MANOR'	; LOGO - Shorten it for the English version

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
V$2	str	'NORT'
V$3	str	'E'
V$4	str	'EAST'
V$5	str	'S'
V$6	str	'SOUT'
V$7	str	'W'
V$8	str	'WEST'
V$9	str	'C'
V$10	str	'CLIM'
V$11	str	'U'
V$12	str	'UP'
V$13	str	'D'
V$14	str	'DOWN'
V$15	str	'TAKE'
V$16	str	'GRAB'
V$17	str	'PICK'
V$18	str	'DROP'
V$19	str	'JUMP'
V$20	str	'ENJA'
V$21	str	'TELE'
V$22	str	'TV'
V$23	str	'COOL'
V$24	str	'OPEN'
V$25	str	'RADI'
V$26	str	'FLAS'
V$27	str	'TUBE'
V$28	str	'NITR'
V$29	str	'BOMB'
V$30	str	'LASE'
V$31	str	'GUN'
V$32	str	'PUSH'
V$33	str	'PRES'
V$34	str	'RED'
V$35	str	'BLUE'
V$36	str	'YELL'
V$37	str	'BUTT'
V$38	str	'LEAR'
V$39	str	'EXAM'
V$40	str	'LOOK'
V$41	str	'LIBR'
V$42	str	'BOOK'
V$43	str	'READ'
V$44	str	'MATH'
V$45	str	'DALL'
V$46	str	'ARLE'
V$47	str	'MEMO'
V$48	str	'BOX'
V$49	str	'FILL'
V$50	str	'WATE'
V$51	str	'H2O'
V$52	str	'RETU'
V$53	str	'ENTE'
V$54	str	'ABOA'
V$55	str	'SHIP'
V$56	str	'SAUC'
V$57	str	'SAUC'
V$58	str	'ROOM'
V$59	str	'PIEC'
V$60	str	'PLAC'
V$61	str	'DRIN'
V$62	str	'GLOV'
V$63	str	'VAPO'
V$64	str	'RECO'
V$65	str	'RECO'
V$66	str	'CASS'
V$67	str	'HELM'
V$68	str	'STIL'
V$69	str	'CONT'
V$70	str	'GLAS'
V$71	str	'CHAI'
V$72	str	'WEAR'
V$73	str	'PASS'
V$74	str	'PUT'
V$75	str	'REMO'
V$76	str	'DEPO'
V$77	str	'ENGA'
V$78	str	'DECL'
V$79	str	'ACTI'
V$80	str	'FAN'
V$81	str	'GEIG'
V$82	str	'COUN'
V$83	str	'REFL'
V$84	str	'THIN'
V$85	str	'NOTH'
V$86	str	'WAIT'
V$87	str	'SLEE'
V$88	str	'HELP'
V$89	str	'HELP'
V$90	str	'CONS'
V$91	str	'STAR'
V$92	str	'LIST'
V$93	str	'CHRO'
V$94	str	'TEMP'
V$95	str	'QUIT'	; 63 (3F)
V$96	str	'WITH'
V$97	str	'SUIC'
V$98	str	'MANU'
V$99	str	'AUTO'
V$100	str	'CLOS'
V$101	str	'TAP'
V$102	str	'RETI'
V$103	str	'ARRE'
V$104	str	'BREA'
V$105	str	'BLOW'
V$106	str	'LIGH'
V$107	str	'TABL'
V$108	str	'FRID'
V$109	str	'FRID'
V$110	str	'COMP'
V$111	str	'TRY'
V$112	str	'PUDD'
V$113	str	'DOOR'
V$114	str	'SAS'
V$115	str	'INVE'
V$116	str	'INVE'
V$117	str	'STAI'
V$118	str	'EMPT'
V$119	str	'POUR'
V$120	str	'RENV'
V$121	str	'FORC'
V$122	str	'ENER'
V$123	str	'TURN'
V$124	str	'PAGE'
V$125	str	'SHEE'
V$126	str	'SAVE'	; 84 (54)
V$127	str	'SAVE'
V$128	str	'CSAV'
V$129	str	'LOAD'	; 85 (55)
V$130	str	'LOAD'
V$131	str	'CLOA'
V$132	str	'SWIT'
V$133	str	'REST'
V$134	str	'CORR'
V$135	str	'DIRE'
V$136	str	'TRAJ'
V$137	str	'ALL'
V$138	str	'ALL'
V$139	str	'STOR'	; RANGER (TUBE DANS GLACE => RANG TUBE)
V$200	str	'STOP'	; STOP coupe toutes les interruptions
V$201	str	'MUSI'

*
* Les reponses (str7xxx)
*

*		'0         1         2         3         '
*		'0123456789012345678901234567890123456789'
*		'----------------------------------------'

str4010	asc	'A steel ball fell from the ceiling and'0d
	asc	'crashed into your helmet.'00
str4020	asc	'A steel ball has just fallen from the'0d
	asc	'ceiling, your head is smashed...'00
str4030	asc	'You just fell in a puddle of acid,'0d
	asc	'it crackles...'00
str4040	asc	'You have just entered the ship'27's atomic'0d
	asc	'reactor...!'00
str4050	asc	'The door won'27't open'00
str4060	asc	'A little memory... How did you get in?'00
str4070	asc	'I didn'27't know you were muscular enough'0d
	asc	'to lift a ton.'00
str4080	asc	'You are right, sight is life!'00
str4090	asc	'The gloves were radioactive, you lose'0d
	asc	'your sight.'00
str4100	asc	'You already have it on you.'00
str4110	asc	'Impossible, I don'27't see this here.'00
str4120	asc	'You tear your head off when you fall off'
	asc	'the stilts.'00
str4130	asc	'Monsters coming out of containers devour'
	asc	'you alive!'00
str4140	asc	'Fresh air does you good. Too bad the'0d
	asc	'propeller cut your head off.'00
str4150	asc	'What do you want to drink???'00
str4160	asc	'Ah yes...the water is good.'00
str4170	asc	'There is no water here.'00
str4180	asc	'The water was contaminated by radio-'0d
	asc	'-active boxes.'00
str4190	asc	'You shrink..small..small..'0d
	asc	'and a spider eats you!'00
str4200	asc	'A chainsaw cuts, as evidenced by your'0d
	asc	'head on the ground.'00
str4210	asc	'You slip and fall into the puddle.'0d
	asc	'Acid crackles.'00
str4220	asc	'There are no locked doors here'00
str4230	asc	'Shaking the tube open caused the nitro-'0d
	asc	'-glycerin to explode.'00
str4240	asc	'Why open a tap that won'27't close!'00
str4250	asc	'The tap does not close.'00
str4260	asc	''00
str4270	asc	'The library has no door...'00
str4280	asc	'There is nothing better on the other'0d
	asc	'pages.'00
str4290	asc	'...it was you J.R who took my wife and'0d
	asc	'my oil, you are infamous.'00
str4300	asc	'Arlepin collection, a dream of escape.'00
str4310	asc	'...and it was me Genius the great who'0d
	asc	'created a superb mansion...'00
str4320	asc	'1031141221242713182310291430271214232927102110272718311427103023141427142324303114212114'00
str4321	asc	' <press a key> '00
str4330	asc	'You already did it.'00
str4340	asc	'The laser just exploded.'00
str4350	asc	'Nothing happens.'00
str4360	asc	'The airlock opens, you pass into the'0d
	asc	'next room.'00
str4370	asc	'This acts on an infrared contactor'0d
	asc	'which controls the lighting.'00
str4380	asc	'Let'27's go, children of the homeland...'00
str4390	asc	'You hear: '27'The laser will open the door'2700
str4400	asc	'The glasses are too strong, your vision'0d
	asc	'is blurry.'00
str4410	asc	'The room is radioactive.'00
str4420	asc	'Do you have anything for?'00
str4430	asc	'It'27's your problem, but time passes.'00
str4440	asc	'Are you that sleepy?'00
str4450	asc	'And then what else!'00
str4460	asc	'Make a plan...'00
str4470	asc	'You hear the purring of the engines.'00
str4480	asc	'I knew you were a coward.'00
str4490	asc	'You stick your head through an airlock,'00
str4491	asc	'and press the close button'00
str4500	asc	'Which button?'00
str4510	asc	'The buttons don'27't work because the'0d
	asc	'central computer controls them.'00
str4520	asc	'The automatic system is out of adjust-'0d
	asc	'-ment, it uses carbon dioxide instead'0d
	asc	'of oxygen.'00
str4530	asc	'You take a deep breath.'00
str4540	asc	'What do you want to breathe?'0d
	asc	'There is no more oxygen.'00

str4550	asc	'You have 2 tries'00
str4552	asc	'to enter the pass-'00
str4553	asc	'WRONG!'00
str4554	asc	0d'Missed twice!'0d
	asc	'The computer explodes in your face.'00
str4556	asc	'-word '00
str4558	asc	0d'Correct, you are insightful!'00
str4559	asc	0d'The return password is '00
str4559_1	asc	'UIN LOI QRU ILD ESP ECU TAS'00
str4559_2	asc	'ASU VIE RAL HOU MEA NOI THE'00
str4560	asc	'It'27's okay.'00
str4570	asc	'It'27's about time, you were going to die.'00
str4580	asc	'You will die dehydrated.'00
str4590	asc	''00
str4595	asc	'Slot 1-9 (0=exit)? '00
str4600	asc	''00

str4610	asc	'The airlock closes behind you, the'0d
	asc	'control panel lights up and the on-board'
	asc	'computer asks you for the password for'0d
	asc	'return '00
str4615	asc	0d'The rescue ship is moving away, in the'0d
	asc	'distance you see Genius crying behind a'0d
	asc	'porthole'00
str4616	asc	0d'          YOU HAVE WON'00
str4618_1	asc	0d'But what'27's happening, you must have'0d
	asc	'entered a wrong password, your pocket'0d
	asc	'ship is heading towards the sun.'00
str4618_2	asc	0d'You just realized that Genius was crying'
	asc	'with JOY...!'00
str4620	asc	'The saucer exploded on takeoff.'00
str4630	asc	'Remaining energy: '00
strFORCE	asc	'20000'00
str4640	asc	'You funny... The time is permanently'0d
	asc	'displayed'00
str4650	asc	0d'The time you had for your mission is'0d
	asc	'over, you have failed.'00
str4660	asc	'Your trajectory is good, why correct it?'00
str4670	asc	'The wall to the north slides, you move'0d
	asc	'forward in this room.'00
str4680	asc	'What book?'00
str4690	asc	'On the back of the case is marked: '00
str4692	asc	'         '27'PROTECT ME'2700
str4700	asc	'You notice a radio control box.'00
str4710	asc	''00
str4720	asc	''00
str4730	asc	'What are you looking at?'00
str4740	asc	0d'The nitroglycerin tube has just'0d
	asc	'exploded, you are pulverized.'00
str4750	asc	'The time bomb has just exploded,'0d
	asc	'you are pulverized.'00
str4760	asc	'The time bomb exploded, it damaged the'0d
	asc	'heating system, you are charred'00
str4770	asc	'The bomb exploded, you were too close'0d
	asc	'and went crazy...'00
str4780	asc	'The time bomb wasn'27't strong enough, the'0d
	asc	'central computer is only damaged,'0d
	asc	'it blows you up...'00
str4790	asc	'Well done! The central computer is'0d
	asc	'destroyed, but the oxygenation system no'
	asc	'longer works, and the trajectory of the'0d
	asc	'ship has changed.'00
str4800	asc	'You no longer have any breath, you died'0d
	asc	'of asphyxiation.'00
str4810	asc	'You should have corrected your'0d
	asc	'trajectory, you hit the sun.'00
str4820	asc	'By dint of crossing the radioactive'0d
	asc	'rooms, you died contaminated.'00
str4830	asc	0d'It'27's getting hotter and hotter...'00
str4840	asc	'The computer just exploded!'00
str4845	asc	'You must have left it on.'00
str4850	asc	'How !!! You are blind.'00
str4860	asc	'You hadn'27't taken the radio control which'
	asc	'exploded when the ship hit the sun, its'0d
	asc	'explosion triggered the world end.'00
str4870	asc	'No ! no striptease.'00
str4874	asc	'You dropped all you were carrying.'00
str4880	asc	'No wonder.'00
str4890	asc	'There is indeed a computer among the'0d
	asc	'control panel.'00
str4891	asc	'The computer is not working.'00
str4900	asc	'On the laser you see three buttons:'0d
	asc	'yellow, red and blue.'00
str4910	asc	'You have entered the particle'0d
	asc	'disintegrator...'00
str4920	asc	'You entered the ship through the west'0d
	asc	'airlock which does not open from the'0d
	asc	'inside.'00

str5500	asc	0d'Are you sure (Y/N) ? '00

str19050	asc	'   Thanks for trying...!'00
str19060	asc	'  Wake up, it is over!'00

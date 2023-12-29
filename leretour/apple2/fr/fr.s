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
	asc	8D"Vous avez en votre possession : "00

strVOUSRIEN
	asc	8D"Pas la peine de regarder, vous n"A7"avez"8D
	asc	"rien sur vous"00

strPOINT
	asc	"."00
	
strEVIDENT
	asc	8D"Vous vous prenez pour HULK..., vous ne"8D
	asc	"pouvez porter tant de choses !"8D00

strVOUSLAVEZ
	asc	8D"Vous l"A7"avez deja. Si votre memoire"8D
	asc	"est mauvaise, faites une liste"8D00
	
strNOTOWNED
	asc	8D"Jusqu"A7"a nouvel ordre, on ne peut poser"8D
	asc	"ce que l"A7"on ne possede pas..."8D00

strDACCORD
	asc	"D"A7"accord"00

strILFAITNOIR
	asc	"Il fait trop sombre pour voir quelque"8D
	asc	"chose, il faudrait peut-etre allumer"8D00

strILYA	asc	8D"Ici, il y a egalement :"00
strCOMMA	asc	","00
strSPACE	asc	8D" "00
strRETURN	asc	8D00

strCMD	asc	8D"Votre commande ? "00

strCOMMANDE	asc	8D"Commande ("
strTEMPS	asc	"5000) ? "00

tbl580	da	$bdbd
	da	str581,str582,str583,str584,str585
	da	str586,str587,str588,str589,str590
	
str581	asc	8D"Ne racontez pas n"A7"importe quoi"8D00
str582	asc	8D"Pardon"8D00
str583	asc	8D"Comment"8D00
str584	asc	8D"Je ne comprends pas"8D00
str585	asc	8D"Sorry, I don"A7"t understand"8D00
str586	asc	8D"Les rigolos qui m"A7"ont programme ne m"A7"ont"
	asc	"pas appris ce vocabulaire"8D00
str587	asc	8D"Je n"A7"ai pas compris"8D00
str588	asc	8D"OK"8D00
str589	asc	8D"Ca marche"8D00
str590	asc	8D"D"A7"accord"8D00

strIMPOSSIBLE
	asc	8D"Impossible "00
strCECHEMIN
	asc	"de prendre ce chemin"00
strEXCLAM
	asc	" !"8D00

strREPLAY	asc	8D"Voulez-vous rejouer ? "00

strPERDU
	asc	"EN CETTE HEURE PENIBLE, MOI APPLE ]["8D8D
	asc	"J"A7"ai le terrible devoir de vous"8D
	asc	"annoncer la mort tragique de votre"8D
	asc	"propre personne dans la redoutable"8D
	asc	"KIKEKANKOI, mais peut-etre vous en"8D
	asc	"etiez vous rendu compte...?"8D
	asc	8D
	asc	"Vos funerailles furent respectables,"8D
	asc	"de par la preuve de courage que vous"8D
	asc	"aviez donnee et pour la personne qui"8D
	asc	"a cette heure-ci est encore prison-"8D
	asc	"niere de la cite mysterieuse... "00

strPERDU2
	asc	8D8D"OUF..... oui je sais, c"A7"est toujours"8D
	asc	"trop long les sepultures..."8D8D00

strGAGNE
	asc	"Quelle classe..., ressortir vivant de"8D
	asc	"KIKEKANKOI, il fallait le faire,"8D
	asc	"d"A7"autant plus que vous ne vous etes"8D
	asc	"meme pas ecorche un doigt! Mais ne"8D
	asc	"restez pas trop dans les parages, car"8D
	asc	"le savant fou a peut-etre encore"8D
	asc	"quelques experiences a faire sur vous,"8D
	asc	"comme vous greffer une tete de singe"8D
	asc	"ou un cerveau electronique de 64 Ko..."8D
	asc	8D
	asc	"Merci d"A7"etre reste si longtemps a"8D
	asc	"votre clavier et encore toutes mes"8D
	asc	"felicitations"8D8D00

*-----------------------------------
* LES DONNEES
*-----------------------------------

*
* Les conditions
*

AA	=	155

tblAL$	dfb	$bd
	dfb	<A$1,<A$2,<A$3,<A$4,<A$5,<A$6,<A$7,<A$8,<A$9,<A$10
	dfb	<A$11,<A$12,<A$13,<A$14,<A$15,<A$16,<A$17,<A$18,<A$19,<A$20
	dfb	<A$21,<A$22,<A$23,<A$24,<A$25,<A$26,<A$27,<A$28,<A$29,<A$30
	dfb	<A$31,<A$32,<A$33,<A$34,<A$35,<A$36,<A$37,<A$38,<A$39,<A$40
	dfb	<A$41,<A$42,<A$43,<A$44,<A$45,<A$46,<A$47,<A$48,<A$49,<A$50
	dfb	<A$51,<A$52,<A$53,<A$54,<A$55,<A$56,<A$57,<A$58,<A$59,<A$60
	dfb	<A$61,<A$62,<A$63,<A$64,<A$65,<A$66,<A$67,<A$68,<A$69,<A$70
	dfb	<A$71,<A$72,<A$73,<A$74,<A$75,<A$76,<A$77,<A$78,<A$79,<A$80
	dfb	<A$81,<A$82,<A$83,<A$84,<A$85,<A$86,<A$87,<A$88,<A$89,<A$90
	dfb	<A$91,<A$92,<A$93,<A$94,<A$95,<A$96,<A$97,<A$98,<A$99,<A$100
	dfb	<A$101,<A$102,<A$103,<A$104,<A$105,<A$106,<A$107,<A$108,<A$109,<A$110
	dfb	<A$111,<A$112,<A$113,<A$114,<A$115,<A$116,<A$117,<A$118,<A$119,<A$120
	dfb	<A$121,<A$122,<A$123,<A$124,<A$125,<A$126,<A$127,<A$128,<A$129,<A$130
	dfb	<A$131,<A$132,<A$133,<A$134,<A$135,<A$136,<A$137,<A$138,<A$139,<A$140
	dfb	<A$141,<A$142,<A$143,<A$144,<A$145,<A$146,<A$147,<A$148,<A$149,<A$150
	dfb	<A$151,<A$152,<A$153,<A$154,<A$155	

tblAH$	dfb	$bd
	dfb	>A$1,>A$2,>A$3,>A$4,>A$5,>A$6,>A$7,>A$8,>A$9,>A$10
	dfb	>A$11,>A$12,>A$13,>A$14,>A$15,>A$16,>A$17,>A$18,>A$19,>A$20
	dfb	>A$21,>A$22,>A$23,>A$24,>A$25,>A$26,>A$27,>A$28,>A$29,>A$30
	dfb	>A$31,>A$32,>A$33,>A$34,>A$35,>A$36,>A$37,>A$38,>A$39,>A$40
	dfb	>A$41,>A$42,>A$43,>A$44,>A$45,>A$46,>A$47,>A$48,>A$49,>A$50
	dfb	>A$51,>A$52,>A$53,>A$54,>A$55,>A$56,>A$57,>A$58,>A$59,>A$60
	dfb	>A$61,>A$62,>A$63,>A$64,>A$65,>A$66,>A$67,>A$68,>A$69,>A$70
	dfb	>A$71,>A$72,>A$73,>A$74,>A$75,>A$76,>A$77,>A$78,>A$79,>A$80
	dfb	>A$81,>A$82,>A$83,>A$84,>A$85,>A$86,>A$87,>A$88,>A$89,>A$90
	dfb	>A$91,>A$92,>A$93,>A$94,>A$95,>A$96,>A$97,>A$98,>A$99,>A$100
	dfb	>A$101,>A$102,>A$103,>A$104,>A$105,>A$106,>A$107,>A$108,>A$109,>A$110
	dfb	>A$111,>A$112,>A$113,>A$114,>A$115,>A$116,>A$117,>A$118,>A$119,>A$120
	dfb	>A$121,>A$122,>A$123,>A$124,>A$125,>A$126,>A$127,>A$128,>A$129,>A$130
	dfb	>A$131,>A$132,>A$133,>A$134,>A$135,>A$136,>A$137,>A$138,>A$139,>A$140
	dfb	>A$141,>A$142,>A$143,>A$144,>A$145,>A$146,>A$147,>A$148,>A$149,>A$150
	dfb	>A$151,>A$152,>A$153,>A$154,>A$155

A$1	str	"A18F01.I19M."
A$2	str	"A18E01.I11M."
A$3	str	"A18.D03N."
A$4	str	"A18.D03N."
A$5	str	"E17.D85K."
A$6	str	"A02.D04N."
A$7	str	"A49.D05K."
A$8	str	"A46.D06K."
A$9	str	"B01.B01J."
A$10	str	"B03.B03J."
A$11	str	"B05.B05J."
A$12	str	"B06.B06J."
A$13	str	"B08.B08J."
A$14	str	"B09.B09J."
A$15	str	"B10.B10J."
A$16	str	"B11.B11J."
A$17	str	"B12.B12J."
A$18	str	"B14.B14J."
A$19	str	"B15.D07J."
A$20	str	"A46F09.E09B16J."
A$21	str	"B17.B17D08K."
A$22	str	"B18.B18J."
A$23	str	"E17B02.B02J."
A$24	str	"B02.D09E17B02M."
A$25	str	"B07.B07J."
A$26	str	".C02J."
A$27	str	".C01J."
A$28	str	".C03J."
A$29	str	".C14J."
A$30	str	"B07.C07J."
A$31	str	".C06J."
A$32	str	"A21.D89K."
A$33	str	".C08J."
A$34	str	".C09J."
A$35	str	".C10J."
A$36	str	".C11J."
A$37	str	"D13.O12C13H13J."
A$38	str	".C12J."
A$39	str	".C16J."
A$40	str	".C17J."
A$41	str	".C18J."
A$42	str	"B04.B04J."
A$43	str	"B19.C19H19B05B04J."
A$44	str	"D04.C04J."
A$45	str	"D19.C19H19B05O04J."
A$46	str	"D14.D12N."
A$47	str	"D14.D12N."
A$48	str	"D14.D12N."
A$49	str	"A20.D13N."
A$50	str	"B11.D14N."
A$51	str	"A15.E08D16K."
A$52	str	"C07.D17K."
A$53	str	".D18N."
A$54	str	"D08.D19N."
A$55	str	"D08.D19N."
A$56	str	"D18.D20N."
A$57	str	"A18.D21N."
A$58	str	"B16.B16J."
A$59	str	".D15K."
A$60	str	"A49.D05K."
A$61	str	"A46.D05K."
A$62	str	".D22K."
A$63	str	".D23N."
A$64	str	"A15.D24K."
A$65	str	"A15.D25K."
A$66	str	"A30.I53M."
A$67	str	"A30.I53M."
A$68	str	"A44.D27K."
A$69	str	"A44.D27K."
A$70	str	"A53.I30M."
A$71	str	"A44.D26K."
A$72	str	"A44.D28K."
A$73	str	"A44.D29K."
A$74	str	"A44.D30K."
A$75	str	"A44.D31K."
A$76	str	"A44.D32K."
A$77	str	"A15B06.C06H06B07J."
A$78	str	"A15B07.D33K."
A$79	str	"B19.B19J."
A$80	str	"B19.C19J."
A$81	str	".C05J."
A$82	str	"D01.D34N."
A$83	str	"D01I49I46.D35K."
A$84	str	"D01A49.D36I46M."
A$85	str	"D01A46.D36I49M."
A$86	str	"D01I14I20I23I29I38.D35K."
A$87	str	"D01A14.D37F04M."
A$88	str	"D01A20.D37F05M."
A$89	str	"D01A23.D37F03M."
A$90	str	"D01A29.D37F06M."
A$91	str	"D01.D37F07M."
A$92	str	"B03F18.G0104E18J."
A$93	str	"B03.D33K."
A$94	str	"D13.D33K."
A$95	str	"D12.C12H12B13J."
A$96	str	"B09F11.D38K."
A$97	str	"B09.D39K."
A$98	str	"B09E11.F11J."
A$99	str	"B09F11.E11J."
A$100	str	"D17.D40K."
A$101	str	"D17.D40K."
A$102	str	"D17.J."
A$103	str	"D13.C13H13B12J."
A$104	str	"D10I04I17I22I48I51.D35K."
A$105	str	"D10.D41K."
A$106	str	".D42K."
A$107	str	".D43K."
A$108	str	".D44K."
A$109	str	".D45K."
A$110	str	".D46K."
A$111	str	".D46K."
A$112	str	".D47K."
A$113	str	".A."
A$114	str	"D04D05.C04C05H04H05B19J."
A$115	str	"D07.C07H07B06J."
A$116	str	".D48."
A$117	str	".D49N."
A$118	str	".D50K."
A$119	str	"A34E12.D51K."
A$120	str	"A34E12.D51K."
A$121	str	"A34.D52N."
A$122	str	"A34.E13D57K."
A$123	str	"E12.D53E14G0205K."
A$124	str	"F12I50F13.D54N."
A$125	str	"F12E13.D53E14G0205K."
A$126	str	"F12A50.D53E14G0205K."
A$127	str	"A21E15.D33K."
A$128	str	"A21.E15D55G0407K."
A$129	str	"A21E15.F15G0400D56M."
A$130	str	"A21.D53K."
A$131	str	"E16A21.F16D57K."
A$132	str	"A21.D66K."
A$133	str	".D59."
A$134	str	".D60."
A$135	str	"A29D16F12.D61."
A$136	str	"A29F12.D86N."
A$137	str	"A29.D62N."
A$138	str	"A44.D68K."
A$139	str	".D64K."
A$140	str	".D64K."
A$141	str	".D63K."
A$142	str	".D63K."
A$143	str	"D16.D69K."
A$144	str	"D16.D69K."
A$145	str	"A46.D67I51M."
A$146	str	"A46.D70K."
A$147	str	"B09.D71K."
A$148	str	"A50.D72K."
A$149	str	"B01.D90K."
A$150	str	"A08.D91N."
A$151	str	"A53.I30M."
A$152	str	".M."
A$153	str	".D73K."
A$154	str	".D87K."
A$155	str	".D88K"

tblA1	dfb	$bd
	dfb	01,03,01,03,25,02,02,04,10,10
	dfb	10,10,10,10,10,10,10,10,10,10
	dfb	10,10,10,10,10,11,11,11,11,11
	dfb	11,25,11,11,11,11,11,11,11,11
	dfb	11,10,10,11,11,05,50,75,15,52
	dfb	40,40,40,42,52,52,12,10,40,15
	dfb	15,15,15,15,67,15,25,15,67,67
	dfb	25,82,28,28,28,28,34,34,10,11
	dfb	11,20,20,20,20,20,20,20,20,20
	dfb	20,52,52,50,50,52,52,36,36,75
	dfb	50,51,51,52,52,55,56,57,58,59
	dfb	60,61,78,17,80,63,64,20,20,20
	dfb	20,20,69,69,69,69,71,71,86,86
	dfb	87,87,84,85,37,37,37,28,62,60
	dfb	81,60,36,82,71,25,25,25,25,01
	dfb	25,25,25,11,60
	
tblA2	dfb	$bd
	dfb	00,00,00,00,00,00,00,00,19,18
	dfb	14,33,42,43,54,53,45,46,47,16
	dfb	48,49,41,41,33,41,19,18,46,33
	dfb	33,74,42,43,54,53,45,45,16,48
	dfb	49,17,17,17,17,46,46,46,47,53
	dfb	35,35,35,00,42,49,76,16,00,77
	dfb	77,77,17,68,68,73,73,26,26,73
	dfb	26,83,30,31,32,29,33,33,14,14
	dfb	14,23,22,22,22,21,21,21,21,21
	dfb	21,18,18,45,45,43,43,44,44,48
	dfb	48,48,45,54,54,00,00,00,00,00
	dfb	59,00,00,14,33,00,00,24,66,65
	dfb	66,65,70,70,70,70,74,74,74,74
	dfb	88,88,00,00,38,38,38,27,00,62
	dfb	00,81,16,16,13,13,43,72,19,00
	dfb	39,39,00,89,00

*
* Les conditions
*

*C	=	10

tblC$	da	$bdbd
	da	C$1,C$2,C$3,C$4,C$5,C$6,C$7,C$8,C$9,C$10
	
C$1	str	""
C$2	str	""
C$3	str	""
C$4	str	""
C$5	str	""
C$6	str	""
C$7	str	""
C$8	str	""
C$9	str	""
C$10	str	""

*
* Les objets dans les salles
*

nbO	=	19

refO	dfb	$bd
	dfb	40,33,41,53,43,10,00,21,22,26
	dfb	01,06,00,17,20,00,47,19,00

O	dfb	$bd
	dfb	40,33,41,53,43,10,00,21,22,26
	dfb	01,06,00,17,20,00,47,19,00

refO$	da	$bdbd
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9,O$10
	da	O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19

tblO$	da	$bdbd
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9,O$10
	da	O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19
	
O$1	asc	"Un pistolet laser"00
O$2	asc	"Des gants ensanglantes"00
O$3	asc	"Une bombe a retardement"00
O$4	asc	"Un tube"00
O$5	asc	"Une glaciere"00
O$6	asc	"Une boite vide"00
O$7	asc	"Une boite pleine d"A7"eau"00
O$8	asc	"Un vaporisateur"00
O$9	asc	"Un magnetophone"00
O$10	asc	"Un compteur Geiger"00
O$11	asc	"Un ventilateur"00
O$12	asc	"Un casque"00
O$13	asc	"Un casque enfile"00
O$14	asc	"Des echasses"00
O$15	asc	"Des containers"00
O$16	asc	"Une radiocommande"00
O$17	asc	"Des lunettes de soleil"00
O$18	asc	"Une tronconneuse"00
O$19	asc	"La glaciere avec le tube a l"A7"interieur"00

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

M$1	dfb	20230300
M$2	dfb	30440100
M$3	dfb	10120431900
M$4	dfb	10220540300
M$5	dfb	30640453800
M$6	dfb	10540700
M$7	dfb	20631640800
M$8	dfb	20730900
M$9	dfb	10821331041100
M$10	dfb	1090
M$11	dfb	11820931700
M$12	dfb	31362700
M$13	dfb	11240900
M$14	dfb	3150
M$15	dfb	11441600
M$16	dfb	10721500
M$17	dfb	1110
M$18	dfb	00
M$19	dfb	10322031800
M$20	dfb	4190
M$21	dfb	3230
M$22	dfb	22342500
M$23	dfb	12132442200
M$24	dfb	1230
M$25	dfb	22264900
M$26	dfb	1270
M$27	dfb	32642851200
M$28	dfb	22742900
M$29	dfb	22843000
M$30	dfb	2290
M$31	dfb	24033200
M$32	dfb	13124433300
M$33	dfb	13234900
M$34	dfb	14144300
M$35	dfb	23634300
M$36	dfb	13724843500
M$37	dfb	13833600
M$38	dfb	13924733744560500
M$39	dfb	33844000
M$40	dfb	23943100
M$41	dfb	3340
M$42	dfb	15024300
M$43	dfb	13523444200
M$44	dfb	4320
M$45	dfb	2380
M$46	dfb	00
M$47	dfb	34843800
M$48	dfb	14743600
M$49	dfb	13335052500
M$50	dfb	14934200
M$51	dfb	3460
M$52	dfb	00
M$53	dfb	2290

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
	dfb	<V$201,<V$202
	
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
	dfb	<V$121,<V$122,<V$123,<V$124,<V$125,<V$126,<V$127,<V$128,<V$129,<V$130
	dfb	>V$131,>V$132,>V$133,>V$134,>V$135,>V$136,>V$137,>V$138,>V$139
	dfb	>V$201,>V$202
	
tblV	dfb	$bd
	dfb	01,01,02,02,03,03,04,04,05,05
	dfb	05,05,06,06,10,10,10,11,12,12
	dfb	13,13,14,15,16,17,17,17,18,19
	dfb	19,20,20,21,22,23,24,25,25,25
	dfb	26,27,28,29,30,31,32,33,34,35
	dfb	35,36,37,37,38,38,38,39,39,39
	dfb	40,41,42,43,43,44,45,46,47,48
	dfb	49,50,50,50,51,51,52,52,52,53
	dfb	54,54,55,55,56,56,57,58,58,59
	dfb	60,61,62,62,63,63,64,65,66,67
	dfb	68,69,69,70,70,71,72,73,73,74
	dfb	75,76,77,77,78,78,79,80,80,80
	dfb	81,81,82,83,83,84,84,84,85,85
	dfb	85,86,87,87,88,88,89,89,00
	dfb	201,202
	
V$1	str	"N"
V$2	str	"NORD"
V$3	str	"E"
V$4	str	"EST "
V$5	str	"S"
V$6	str	"SUD "
V$7	str	"O"
V$8	str	"OUES"
V$9	str	"G"
V$10	str	"GRIM"
V$11	str	"M"
V$12	str	"MONT"
V$13	str	"D"
V$14	str	"DESC"
V$15	str	"PREN"
V$16	str	"SAIS"
V$17	str	"RAMA"
V$18	str	"POSE"
V$19	str	"SAUT"
V$20	str	"ENJA"
V$21	str	"TELE"
V$22	str	"TV"
V$23	str	"GLAC"
V$24	str	"OUVR"
V$25	str	"RADI"
V$26	str	"FLAC"
V$27	str	"TUBE"
V$28	str	"NITR"
V$29	str	"BOMB"
V$30	str	"LASE"
V$31	str	"PIST"
V$32	str	"APPU"
V$33	str	"ENFO"
V$34	str	"ROUG"
V$35	str	"BLEU"
V$36	str	"JAUN"
V$37	str	"BOUT"
V$38	str	"APPR"
V$39	str	"EXAM"
V$40	str	"REGA"
V$41	str	"BIBL"
V$42	str	"LIVR"
V$43	str	"LIS"
V$44	str	"MATH"
V$45	str	"DALL"
V$46	str	"ARLE"
V$47	str	"MEMO"
V$48	str	"BOIT"
V$49	str	"REMP"
V$50	str	"EAU"
V$51	str	"H2O"
V$52	str	"RETO"
V$53	str	"ENTR"
V$54	str	"ABOR"
V$55	str	"VAIS"
V$56	str	"SOUC"
V$57	str	"ASTR"
V$58	str	"SALL"
V$59	str	"PIEC"
V$60	str	"LIEU"
V$61	str	"BOIS"
V$62	str	"GANT"
V$63	str	"VAPO"
V$64	str	"MAGN"
V$65	str	"LECT"
V$66	str	"CASS"
V$67	str	"CASQ"
V$68	str	"ECHA"
V$69	str	"CONT"
V$70	str	"LUNE"
V$71	str	"TRON"
V$72	str	"ENFI"
V$73	str	"PASS"
V$74	str	"METS"
V$75	str	"ENLE"
V$76	str	"DEPO"
V$77	str	"ENCL"
V$78	str	"DECL"
V$79	str	"ACTI"
V$80	str	"VENT"
V$81	str	"GEIG"
V$82	str	"COMP"
V$83	str	"REFL"
V$84	str	"PENS"
V$85	str	"RIEN"
V$86	str	"ATTE"
V$87	str	"DORS"
V$88	str	"AIDE"
V$89	str	"SECO"
V$90	str	"CONS"
V$91	str	"DEMA"
V$92	str	"ECOU"
V$93	str	"CHRO"
V$94	str	"TEMP"
V$95	str	"QUIT"
V$96	str	"ABAN"
V$97	str	"SUIC"
V$98	str	"MANU"
V$99	str	"AUTO"
V$100	str	"FERM"
V$101	str	"ROBI"
V$102	str	"RETI"
V$103	str	"ARRE"
V$104	str	"RESP"
V$105	str	"SOUF"
V$106	str	"ALLU"
V$107	str	"TABL"
V$108	str	"REFR"
V$109	str	"FRIG"
V$110	str	"ORDI"
V$111	str	"ESSA"
V$112	str	"FLAQ"
V$113	str	"PORT"
V$114	str	"SAS"
V$115	str	"LIST"
V$116	str	"INVE"
V$117	str	"ESCA"
V$118	str	"VIDE"
V$119	str	"VERS"
V$120	str	"RENV"
V$121	str	"FORC"
V$122	str	"ENER"
V$123	str	"TOUR"
V$124	str	"PAGE"
V$125	str	"FEUI"
V$126	str	"SAVE"
V$127	str	"SAUV"
V$128	str	"CSAV"
V$129	str	"LOAD"
V$130	str	"CLOA"
V$131	str	"ENRE"
V$132	str	"ETEI"
V$133	str	"RETA"
V$134	str	"CORR"
V$135	str	"DIRE"
V$136	str	"TRAJ"
V$137	str	"TOUT"
V$138	str	"TOTA"
V$139	str	"    "

V$201	str	"CASE"
V$201	str	"TIME"

*
* Les lieux (str8xxx)
*

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	""00
str8020	asc	""00
str8030	asc	""00
str8040	asc	""00
str8050	asc	""00
str8060	asc	""00
str8070	asc	""00
str8080	asc	""00
str8090	asc	""00
str8100	asc	""00
str8110	asc	""00
str8120	asc	""00
str8130	asc	""00
str8140	asc	""00
str8150	asc	""00
str8160	asc	""00
str8170	asc	""00
str8180	asc	""00
str8190	asc	""00
str8200	asc	""00
str8210	asc	""00
str8220	asc	""00
str8230	asc	""00
str8240	asc	""00
str8250	asc	""00
str8260	asc	""00
str8270	asc	""00
str8280	asc	""00
str8290	asc	""00
str8300	asc	""00
str8310	asc	""00
str8320	asc	""00
str8330	asc	""00
str8340	asc	""00
str8350	asc	""00
str8360	asc	""00
str8370	asc	""00
str8380	asc	""00
str8390	asc	""00
str8400	asc	""00
str8410	asc	""00
str8420	asc	""00
str8430	asc	""00
str8440	asc	""00
str8450	asc	""00
str8460	asc	""00
str8470	asc	""00
str8480	asc	""00
str8490	asc	""00
str8500	asc	""00
str8510	asc	""00
str8520	asc	""00
str8530	asc	""00
str8540	asc	""00
str8550	asc	""00
str8560	asc	""00
str8570	asc	""00
str8580	asc	""00
str8590	asc	""00
str8600	asc	""00

*
* Les reponses (str7xxx)
*

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str4010	asc	""00
str4020	asc	""00
str4030	asc	""00
str4040	asc	""00
str4050	asc	""00
str4060	asc	""00
str4070	asc	""00
str4080	asc	""00
str4090	asc	""00
str4100	asc	""00
str4110	asc	""00
str4120	asc	""00
str4130	asc	""00
str4140	asc	""00
str4150	asc	""00
str4160	asc	""00
str4170	asc	""00
str4180	asc	""00
str4190	asc	""00
str4200	asc	""00
str4210	asc	""00
str4220	asc	""00
str4230	asc	""00
str4240	asc	""00
str4250	asc	""00
str4260	asc	""00
str4270	asc	""00
str4280	asc	""00
str4290	asc	""00
str4300	asc	""00
str4310	asc	""00
str4320	asc	""00
str4330	asc	""00
str4340	asc	""00
str4350	asc	""00
str4360	asc	""00
str4370	asc	""00
str4380	asc	""00
str4390	asc	""00
str4400	asc	""00
str4410	asc	""00
str4420	asc	""00
str4430	asc	""00
str4440	asc	""00
str4450	asc	""00
str4460	asc	""00
str4470	asc	""00
str4480	asc	""00
str4490	asc	""00
str4500	asc	""00
str4510	asc	""00
str4520	asc	""00
str4530	asc	""00
str4540	asc	""00
str4550	asc	""00
str4560	asc	""00
str4570	asc	""00
str4580	asc	""00
str4590	asc	""00
str4600	asc	""00
str4610	asc	""00
str4620	asc	""00
str4630	asc	""00
str4640	asc	""00
str4650	asc	""00
str4670	asc	""00
str4680	asc	""00
str4690	asc	""00
str4700	asc	""00
str4710	asc	""00
str4720	asc	""00
str4730	asc	""00
str4740	asc	""00
str4750	asc	""00

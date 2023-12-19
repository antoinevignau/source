*
* Kikekankoi
*
* (c) 1985, Loriciels (Oric/CPC)
* (c) 2023, Brutal Deluxe Software (Apple II)
*

*
* Les chaines standards
*

strVOUSDETENEZ
	asc	8D"Vous avez en votre possession : "8D00

strVOUSRIEN
	asc	8D"Pas la peine de regarder, vous n"A7"avez"8D
	asc	"rien sur vous"00

strPOINT
	asc	"."00
	
strEVIDENT
	asc	8D"Vous vous prenez pour HULK..., vous ne"8D
	asc	"porter tant de choses !"00

strVOUSLAVEZ
	asc	8D"Vous l"A7"avez deja. Si votre memoire"8D
	asc	"est mauvaise, faites la liste"00
	
strNOTOWNED
	asc	8D"Jusqu"A7"a nouvel ordre, on ne peut poser"8D
	asc	"ce que l"A7"on ne possede pas..."00

strDACCORD
	asc	"D"A7"accord"00

strILFAITNOIR
	asc	"Il fait trop sombre pour voir quelque"8D
	asc	"chose, il faudrait peut-etre allumer"00

strILYA	asc	8D"Ici, il y a egalement :"00
strCOMMA	asc	","00
strSPACE	asc	" "00
strRETURN	asc	8D00

strCOMMANDE
	asc	8D"Votre commande ? "00

strJENECOMPRENDS
	asc	8D"Je ne comprends pas..."00
	
strIMPOSSIBLE
	asc	8D"Impossible "00
strCECHEMIN
	asc	"de prendre ce chemin"00
strEXCLAM
	asc	" !"00

strREPLAY	asc	8D"Voulez-vous rejouer ? "00

strPERDU
	asc	"EN CETTE HEURE PENIBLE, MOI APPLE ]["8D8D
	asc	"J"A7"ai le terrible devoir de vous"8D
	asc	"annoncer la mort tragique de votre"8D
	asc	"propre personne dans la redoutable"8D
	asc	"KIKEKANKOI, mais peut-etre vous en"8D
	asc	"etiez vous rendu compte...?"8D
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
	asc	"Merci d"A7"etre reste si longtemps a"8D
	asc	"votre clavier et encore toutes mes"8D
	asc	"felicitations"8D8D00

*-----------------------------------
* introPIC - la picture GR
*-----------------------------------

strLORICIELS
	asc	"LORICIELS presente"00

strLEMANOIR
	asc	"@   @@@   @   @ @ @ @@@ @@@ @@@ @@@ @@@ "
	asc	"@   @     @@ @@ @ @ @    @  @   @ @ @   "
	asc	"@   @@    @ @ @ @@@ @@@  @  @@  @@  @@  "
	asc	"@   @     @   @   @   @  @  @   @ @ @   "
	asc	"@@@ @@@   @   @  @@ @@@  @  @@@ @ @ @@@ "
	asc	8D
	asc	"    @@  @@@"8D
	asc	"    @ @ @  "8D
	asc	"    @ @ @@ "8D
	asc	"    @ @ @  "8D
	asc	"    @@  @@@"8D
	asc	8D
	asc	"@ @ @@@ @ @ @@@ @ @ @@@ @ @ @ @ @@@ @@@ "
	asc	"@ @  @  @ @ @   @ @ @ @ @@  @ @ @ @  @  "
	asc	"@@   @  @@  @@  @@  @@@ @ @ @@  @ @  @  "
	asc	"@ @  @  @ @ @   @ @ @ @ @ @ @ @ @ @  @  "
	asc	"@ @ @@@ @ @ @@@ @ @ @ @ @ @ @ @ @@@ @@@"00
	
strINTRO1	asc	"     Version Apple II par     "00
strINTRO2	asc	"    Brutal Deluxe Software    "00
strINTRO3	asc	"     Merci Herve & Xavier     "00
strINTRO4	asc	"(C) 1985, L. BENES & LORICIELS"00
	
*
* Les conditions
*

AA	=	181

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
	dfb	<A$151,<A$152,<A$153,<A$154,<A$155,<A$156,<A$157,<A$158,<A$159,<A$160
	dfb	<A$161,<A$162,<A$163,<A$164,<A$165,<A$166,<A$167,<A$168,<A$169,<A$170
	dfb	<A$171,<A$172,<A$173,<A$174,<A$175,<A$176,<A$177,<A$178,<A$179,<A$180
	dfb	<A$181

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
	dfb	>A$151,>A$152,>A$153,>A$154,>A$155,>A$156,>A$157,>A$158,>A$159,>A$160
	dfb	>A$161,>A$162,>A$163,>A$164,>A$165,>A$166,>A$167,>A$168,>A$169,>A$170
	dfb	>A$171,>A$172,>A$173,>A$174,>A$175,>A$176,>A$177,>A$178,>A$179,>A$180
	dfb	>A$181

A$1	str	"A25.D41N."
A$2	str	"A02.D01N."
A$3	str	"A13.D02N."
A$4	str	"A16.D04N."
A$5	str	"A16.D05G0207K."
A$6	str	"A16.D06L."
A$7	str	"A08.D07N."
A$8	str	".D37K."
A$9	str	"A05.D08N."
A$10	str	"B13C23.D09N."
A$11	str	"B13.J."
A$12	str	"A21.D10N."
A$13	str	"A12D16E13.D11N."
A$14	str	"A12E13.I28M."
A$15	str	"A10F01F03.D12N."
A$16	str	"A10F03D08E01.D13N."
A$17	str	"A10E03.D59I36M."
A$18	str	"A14C18C17.D03N."
A$19	str	"A14D18C17.D14N."
A$20	str	"A14D17E04.D16N."
A$21	str	"A14D17.D15N."
A$22	str	"A30.D17N."
A$23	str	"A31.D18N."
A$24	str	"A29F05.G0107I34M."
A$25	str	"A29.I34M."
A$26	str	"A28D19.D19N."
A$27	str	"A28.I12M."
A$28	str	"C02D08.D38K."
A$29	str	"D10.D26K."
A$30	str	"D08.D39K."
A$31	str	"D09.G0313C09H09B10M."
A$32	str	"C02D09.D38K."
A$33	str	"C10.D40K."
A$34	str	".C10H10B09M."
A$35	str	"D05A08.C05H05B06J."
A$36	str	"D05A09.C05H05B07J."
A$37	str	"D05A05.C05H05B07J."
A$38	str	"D05A18.C05H05B07J."
A$39	str	"B01.B01J."
A$40	str	"A05.F10I18M."
A$41	str	"A09.E10I18M."
A$42	str	"B06.B06J."
A$43	str	"B07.B07J."
A$44	str	"B05.B05J."
A$45	str	"B09.B09J."
A$46	str	"B10.B10J."
A$47	str	"B08.B08J."
A$48	str	"B11.B11J."
A$49	str	"E09B12.B12J."
A$50	str	"B13.B13J."
A$51	str	"B14.B14J."
A$52	str	"B15.B15J."
A$53	str	"B16.B16J."
A$54	str	"B17.B17J."
A$55	str	"B18.B18J."
A$56	str	"B19.B19J."
A$57	str	"B21.B21J."
A$58	str	"B20.B20J."
A$59	str	"D02.D27K."
A$60	str	".C01J."
A$61	str	"A18E10.I09O03M."
A$62	str	"A18.I05O03M."
A$63	str	"D05.C05J."
A$64	str	"D06.C06J."
A$65	str	"D07.C07J."
A$66	str	"D02.D27K."
A$67	str	"D09.C09J."
A$68	str	"D10.C10J."
A$69	str	".C08J."
A$70	str	".C11J."
A$71	str	".C12J."
A$72	str	".C13J."
A$73	str	".C14J."
A$74	str	".C15J."
A$75	str	".C16J."
A$76	str	".C17J."
A$77	str	".C18J."
A$78	str	".C19J."
A$79	str	".C21J."
A$80	str	".C20J."
A$81	str	"A18E10.F10J."
A$82	str	"A18.E10J."
A$83	str	"D07I05I18I09.D20N."
A$84	str	"D07.B05C07H07J."
A$85	str	"D06.B05C06H06J."
A$86	str	"D05.D21N."
A$87	str	"D07I05I18I09I10.D20N."
A$88	str	"D07A10.D22N."
A$89	str	"D07.B05C07H07J."
A$90	str	"D06I10.B05C06H06J."
A$91	str	"D06.E03B05C06H06D23K."
A$92	str	"D06.B05C06H06J."
A$93	str	"D09D01.C01H01B02J."
A$94	str	"B11.E11J."
A$95	str	"B19.D24N."
A$96	str	"D08D01.C01H01B02J."
A$97	str	"B10.D56N."
A$98	str	"D02.C02H02B01J."
A$99	str	"B11F11F05.E05J."
A$100	str	"B13C23.D09N."
A$101	str	"B14.J."
A$102	str	"B14.D28E04K."
A$103	str	"B14.C13H13J."
A$104	str	"B17.D29K."
A$105	str	"B19.D24N."
A$106	str	"B11.D30K."
A$107	str	"D20D08.C20H20C08H08B09A."
A$108	str	"D20.C20H20J."
A$109	str	"B20.C20H20J."
A$110	str	"B21D15.D31N."
A$111	str	"A12C12C15.D34K."
A$112	str	"A12C12.D35K."
A$113	str	"A12.E13J."
A$114	str	"A18F09.E09O12D32K."
A$115	str	"A18E09.D33N."
A$116	str	"A24.D36N."
A$117	str	".A."
A$118	str	"B35.F14H35J."
A$119	str	"B37.B37J."
A$120	str	"B23.B23J."
A$121	str	"B29.B29J."
A$122	str	"B32.B32G0603J."
A$123	str	"B30.B30J."
A$124	str	"B33.B33J."
A$125	str	"B28.B28G0405J."
A$126	str	"B31.B31J."
A$127	str	"A46B26.D46K."
A$128	str	"B26.B26J."
A$129	str	"A44B27.D46K."
A$130	str	"B27.B27J."
A$131	str	".C37J."
A$132	str	"E16.F16C23J."
A$133	str	".C23J."
A$134	str	".C32J."
A$135	str	".C29J."
A$136	str	".C30J."
A$137	str	".C33J."
A$138	str	"F14.E14O35J."
A$139	str	".C31J."
A$140	str	".C26J."
A$141	str	".C27J."
A$142	str	"B17A52.C17H17B34A."
A$143	str	"A52.D62K."
A$144	str	"D34A46.B26J."
A$145	str	"D34A44.B27J."
A$146	str	"A37.I42M."
A$147	str	"A39.I47M."
A$148	str	"A39.I46M."
A$149	str	"A36.I45M."
A$150	str	"A38.I52M."
A$151	str	"A37.D47N."
A$152	str	"A36.I44M."
A$153	str	"A48.I49M."
A$154	str	"A51F14.D48N."
A$155	str	"A51E14.I56M."
A$156	str	"A57C31.D49N."
A$157	str	"A57.I58M."
A$158	str	"A58D29D37F15.D50N."
A$159	str	"A58D29D37F17.D54N."
A$160	str	"A58D29D37.D51K."
A$161	str	"B23F16.E16J."
A$162	str	"B13D23F16.D52N."
A$163	str	"B13I53E16.C13H13O22M."
A$164	str	"B13E16.D53N."
A$165	str	"B22.B22J."
A$166	str	"A53B22F15.E15H36D65K."
A$167	str	"A53F15.D55K."
A$168	str	".C22J."
A$169	str	"D26D27E15F17.E17C26H26C27H27J."
A$170	str	"D27E15F19.E19C27H27J."
A$171	str	"D27E15F19.E19C27H27J."
A$172	str	"D26E15F18.E18C26H26J."
A$173	str	"B25.B25J."
A$174	str	"D25.C25H25E20J."
A$175	str	"B25.H25E20J."
A$176	str	"B24.B24J."
A$177	str	"B24.D61N."
A$178	str	"A52.D63K."
A$179	str	".D64K."
A$180	str	".C25J."
A$181	str	".C24J."

tblA1	dfb	$bd
	dfb	01,02,02,25,25,25,01,64,10,12
	dfb	12,23,06,06,04,04,04,02,02,02
	dfb	02,01,03,04,04,05,05,14,14,14
	dfb	14,14,15,15,10,10,10,10,10,10
	dfb	10,10,10,10,10,10,10,10,10,10
	dfb	10,10,10,10,10,10,10,10,11,11
	dfb	11,11,11,11,11,11,11,11,11,11
	dfb	11,11,11,11,11,11,11,11,11,11
	dfb	63,63,19,19,19,19,24,24,24,24
	dfb	24,11,51,19,19,51,56,56,26,57
	dfb	12,16,24,58,12,59,54,57,24,12
	dfb	12,12,12,62,62,12,20,10,10,10
	dfb	10,10,10,10,10,10,10,10,10,10
	dfb	11,11,11,11,11,11,11,11,11,11
	dfb	11,76,76,77,77,07,07,07,07,07
	dfb	07,07,07,07,07,02,02,78,78,78
	dfb	95,57,57,57,10,93,93,11,74,74
	dfb	74,74,10,25,25,10,25,21,21,11
	dfb	11

tblA2	dfb	$bd
	dfb	00,00,00,45,46,47,00,00,28,29
	dfb	29,44,00,00,00,00,00,00,00,00
	dfb	00,00,00,00,00,00,00,35,35,35
	dfb	35,35,35,35,49,55,55,55,36,27
	dfb	27,31,31,31,35,35,35,37,42,29
	dfb	32,34,39,38,33,53,41,40,36,36
	dfb	27,27,31,31,31,35,35,35,35,37
	dfb	42,29,32,34,39,38,33,53,41,40
	dfb	00,00,31,31,31,31,55,55,55,49
	dfb	49,49,36,37,53,36,36,36,37,29
	dfb	32,32,32,38,53,37,40,40,40,41
	dfb	48,48,48,61,61,60,00,67,65,66
	dfb	70,81,71,82,69,72,80,80,68,68
	dfb	65,66,66,81,70,71,82,67,72,80
	dfb	68,38,00,80,68,84,85,67,87,88
	dfb	89,90,91,92,92,00,00,79,79,79
	dfb	66,29,29,29,96,94,94,96,75,75
	dfb	68,80,97,97,97,98,98,00,00,97
	dfb	98

*
* Les conditions
*

*C	=	11

tblC$	da	$bdbd
	da	C$1,C$2,C$3,C$4,C$5,C$6,C$7,C$8,C$9,C$10
	da	C$11
	
C$1	str	"G01.D42N."
C$2	str	"G02.D43N."
C$3	str	"G03B10.D44N."
C$4	str	"G09.D45N."
C$5	str	"E18E19F21.E21E17L."
C$6	str	"G04.D57N."
C$7	str	"G06.D58N."
C$8	str	"H20E14F20.D60N."
C$9	str	"D26D27D34.C34H34L."
C$10	str	"H08.D66L."
C$11	str	".L."

*
* Les objets dans les salles
*

nbO	=	37

refO	dfb	$bd
	dfb	02,00,05,00,14,00,00,19,00,00
	dfb	20,00,18,15,17,26,27,28,33,34
	dfb	35,00,47,47,47,46,44,50,50,49
	dfb	54,42,45,00,00,53,40

O	dfb	$bd
	dfb	02,00,05,00,14,00,00,19,00,00
	dfb	20,00,18,15,17,26,27,28,33,34
	dfb	35,00,47,47,47,46,44,50,50,49
	dfb	54,42,45,00,00,53,40

refO$	da	$bdbd
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9,O$10
	da	O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19,O$20
	da	O$21,O$22,O$23,O$24,O$25,O$26,O$27,O$28,O$29,O$30
	da	O$31,O$32,O$33,O$34,O$35,O$36,O$37

tblO$	da	$bdbd
	da	O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9,O$10
	da	O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19,O$20
	da	O$21,O$22,O$23,O$24,O$25,O$26,O$27,O$28,O$29,O$30
	da	O$31,O$32,O$33,O$34,O$35,O$36,O$37

O$1	asc	"Une batterie"00
O$2	asc	"Une batterie branchee"00
O$3	asc	"Une barque"00
O$4	asc	"x"00
O$5	asc	"Un seau"00
O$6	asc	"Un seau plein de sable"00
O$7	asc	"Un seau plein d"A7"eau"00
O$8	asc	"Une lampe electrique"00
O$9	asc	"Une lampe avec une ampoule"00
O$10	asc	"Une lampe allume"00
O$11	asc	"Une fiole"00
O$12	asc	"Une clef"00
O$13	asc	"Une bouteille"00
O$14	asc	"Un livre"00
O$15	asc	"Un passe partout"00
O$16	asc	"Un tournevis"00
O$17	asc	"Un delta plane"00
O$18	asc	"Une echelle de corde"00
O$19	asc	"Un tube de colle"00
O$20	asc	"Une ampoule"00
O$21	asc	"Une boite"00
O$22	asc	"Des debris de verre"00
O$23	asc	"Un masque a gaz"00
O$24	asc	"De la quinine"00
O$25	asc	"Un aspirine"00
O$26	asc	"Des espadrilles"00
O$27	asc	"Une robe"00
O$28	asc	"Un portefeuille"00
O$29	asc	"Une broche"00
O$30	asc	"Un harnais"00
O$31	asc	"Une bombe insecticide"00
O$32	asc	"Une hache"00
O$33	asc	"Un pot de creme"00
O$34	asc	"Une liasse de billets"00
O$35	asc	"Vos chaussures"00
O$36	asc	"Une super jolie fille ligotee... et nue qui plus est."00
O$37	asc	"Un maillet"00

*
* Les directions
*

M	=	58

tblM$	da	$bdbd
	da	M$1,M$2,M$3,M$4,M$5,M$6,M$7,M$8,M$9,M$10
	da	M$11,M$12,M$13,M$14,M$15,M$16,M$17,M$18,M$19,M$20
	da	M$21,M$22,M$23,M$24,M$25,M$26,M$27,M$28,M$29,M$30
	da	M$31,M$32,M$33,M$34,M$35,M$36,M$37,M$38,M$39,M$40
	da	M$41,M$42,M$43,M$44,M$45,M$46,M$47,M$48,M$49,M$50
	da	M$51,M$52,M$53,M$54,M$55,M$56,M$57,M$58

M$1	dfb	04,02,03,04,06,05,00
M$2	dfb	03,01,00
M$3	dfb	00	; X
M$4	dfb	04,01,03,13,00
M$5	dfb	05,01,04,08,03,07,00
M$6	dfb	00	; X
M$7	dfb	04,05,03,15,00
M$8	dfb	03,05,00
M$9	dfb	06,12,04,10,03,11,00
M$10	dfb	03,09,00
M$11	dfb	04,09,03,22,00
M$12	dfb	05,09,01,25,00
M$13	dfb	04,04,03,14,00
M$14	dfb	04,13,03,16,00
M$15	dfb	04,07,01,21,03,20,00
M$16	dfb	04,14,01,19,03,17,00
M$17	dfb	04,16,00
M$18	dfb	00
M$19	dfb	02,16,00
M$20	dfb	04,15,00
M$21	dfb	02,15,00
M$22	dfb	04,11,01,24,03,23,00
M$23	dfb	04,22,00
M$24	dfb	01,27,02,22,00
M$25	dfb	02,12,03,26,00
M$26	dfb	04,25,03,27,00
M$27	dfb	04,26,02,24,00
M$28	dfb	04,29,01,30,02,32,03,31,00
M$29	dfb	03,28,00
M$30	dfb	02,28,00
M$31	dfb	04,28,02,35,00
M$32	dfb	01,28,02,33,00
M$33	dfb	01,32,00
M$34	dfb	03,29,00
M$35	dfb	01,31,00
M$36	dfb	01,37,03,10,00
M$37	dfb	02,36,01,38,03,48,04,39,00
M$38	dfb	01,41,02,37,04,40,07,52,00
M$39	dfb	01,40,03,37,00
M$40	dfb	03,38,02,39,00
M$41	dfb	02,38,00
M$42	dfb	09,37,00
M$43	dfb	00
M$44	dfb	09,36,00
M$45	dfb	09,36,00
M$46	dfb	09,39,00
M$47	dfb	09,39,00
M$48	dfb	04,37,03,50,07,49,00
M$49	dfb	09,48,00
M$50	dfb	01,51,04,48,00
M$51	dfb	02,50,00
M$52	dfb	09,38,00
M$53	dfb	02,56,00
M$54	dfb	03,56,00
M$55	dfb	04,56,03,57,00
M$56	dfb	01,53,03,55,02,51,04,54,09,51,00
M$57	dfb	04,55,00
M$58	dfb	01,57,00

*
* Le vocabulaire
* on fera index-1 b/c 8-bits
*

V	=	129+3

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
	dfb	<V$121,<V$122,<V$123,<V$124,<V$125,<V$126,<V$127,<V$128,<V$129
	dfb	<V$130,<V$131,<V$132
	
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
	dfb	>V$121,>V$122,>V$123,>V$124,>V$125,>V$126,>V$127,>V$128,>V$129
	dfb	>V$130,>V$131,>V$132
	
tblV	dfb	$bd
	dfb	01,01,02,02,03,03,04,04,05,05
	dfb	05,06,06,07,08,10,10,11,11,12
	dfb	13,14,14,15,15,16,16,17,18,19
	dfb	20,21,21,22,22,22,23,23,24,25
	dfb	25,26,24,27,28,29,30,31,32,32
	dfb	33,34,35,35,36,37,38,39,40,41
	dfb	42,43,44,45,46,47,48,49,50,53
	dfb	54,55,57,58,59,59,61,62,60,63
	dfb	53,64,20,51,00,09,25,65,66,67
	dfb	68,69,70,71,72,95,95,95,74,76
	dfb	77,78,78,78,79,79,79,80,81,82
	dfb	83,84,85,86,87,88,89,90,91,92
	dfb	93,93,94,94,96,97,98,99,75
	dfb	100,101,102

V$1	str	"N"
V$2	str	"NORD"
V$3	str	"S"
V$4	str	"SUD"
V$5	str	"E"
V$6	str	"EST"
V$7	str	"O"
V$8	str	"OUES"
V$9	str	"M"
V$10	str	"MONT"
V$11	str	"GRIM"
V$12	str	"DESC"
V$13	str	"D"
V$14	str	"ENTR"
V$15	str	"AVAN"
V$16	str	"PREN"
V$17	str	"RAMA"
V$18	str	"POSE"
V$19	str	"LAIS"
V$20	str	"OUVR"
V$21	str	"FERM"
V$22	str	"ALLU"
V$23	str	"ECLA"
V$24	str	"ETEI"
V$25	str	"ARRE"
V$26	str	"LIS"
V$27	str	"LIT"
V$28	str	"REGA"
V$29	str	"REMP"
V$30	str	"VIDE"
V$31	str	"INVE"
V$32	str	"RIEN"
V$33	str	"ATTE"
V$34	str	"FRAP"
V$35	str	"ASSO"
V$36	str	"ATTA"
V$37	str	"POUS"
V$38	str	"TIRE"
V$39	str	"JETT"
V$40	str	"MANG"
V$41	str	"GOUT"
V$42	str	"BOIS"
V$43	str	"LANC"
V$44	str	"BARQ"
V$45	str	"RADE"
V$46	str	"BOUT"
V$47	str	"MESS"
V$48	str	"SEAU"
V$49	str	"MANU"
V$50	str	"LIVR"
V$51	str	"ECHE"
V$52	str	"PASS"
V$53	str	"LAMP"
V$54	str	"TORC"
V$55	str	"BATT"
V$56	str	"FIOL"
V$57	str	"DELT"
V$58	str	"TOUR"
V$59	str	"AMPO"
V$60	str	"BOIT"
V$61	str	"CLEF"
V$62	str	"MARM"
V$63	str	"ANNE"
V$64	str	"ROUG"
V$65	str	"VERT"
V$66	str	"BLEU"
V$67	str	"TRAP"
V$68	str	"SABL"
V$69	str	"ROBO"
V$70	str	"COLL"
V$71	str	"VISS"
V$72	str	"EAU"
V$73	str	"CASS"
V$74	str	"ESSA"
V$75	str	"SENS"
V$76	str	"RENI"
V$77	str	"ADHE"
V$78	str	"DECO"
V$79	str	"PLAC"
V$80	str	"RAME"
V$81	str	"TUBE"
V$82	str	"CHRO"
V$83	str	"LIST"
V$84	str	"BRAN"
V$85	str	"ESCA"
V$86	str	"SORS"
V$87	str	"AVAL"
V$88	str	"MAIL"
V$89	str	"MASQ"
V$90	str	"CHAU"
V$91	str	"ROBE"
V$92	str	"PORT"
V$93	str	"BROC"
V$94	str	"HARN"
V$95	str	"BOMB"
V$96	str	"METS"
V$97	str	"ENFI"
V$98	str	"PASS"
V$99	str	"DONN"
V$100	str	"VEND"
V$101	str	"ACHE"
V$102	str	"ENLE"
V$103	str	"ARRA"
V$104	str	"CREU"
V$105	str	"PIER"
V$106	str	"BLOC"
V$107	str	"MUR"
V$108	str	"ESPA"
V$109	str	"HACH"
V$110	str	"POT"
V$111	str	"LIAS"
V$112	str	"TABA"
V$113	str	"MEDE"
V$114	str	"CHAU"
V$115	str	"CREM"
V$116	str	"TRAI"
V$117	str	"BOUL"
V$118	str	"TAIL"
V$119	str	"DROG"
V$120	str	"TEMP"
V$121	str	"DELI"
V$122	str	"LIBE"
V$123	str	"FEMM"
V$124	str	"FILL"
V$125	str	"DEBR"
V$126	str	"ASPI"
V$127	str	"QUIN"
V$128	str	"FIN"
V$129	str	"VETE"

V$130	str	"TEMP"
V$131	str	"QUIT"
V$132	str	"CASS"

*
* Les lieux (str8xxx)
*

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"L"A7"antre du demon."00
str8020	asc	"Le repere du chirurgien."00
str8030	asc	"8030"00	; X la mort
str8040	asc	"L"A7"antre du sorcier."00
str8050	asc	"Au bord du lac."00
str8060	asc	"8060"00	; X la fin
str8070	asc	"Le repere du lecteur."00
str8080	asc	"Au nord,un banc de sable."00
str8090	asc	"Le bout du lac."00
str8100	asc	"La salle mecanique."00
str8110	asc	"Une grotte vide."00
str8120	asc	"La trappe des enrages."00
str8130	asc	"Une porte EXIT au sud."00
str8140	asc	"Une issue au sud."00
str8150	asc	"L"A7"antre du lecteur."00
str8160	asc	"Des soupes colorees, dans des marmites."00
str8170	asc	"L"A7"atelier."00
str8180	asc	"Une barque consolidee a l"A7"adhesif..!"00
str8190	asc	"La chambre des lumieres."00
str8200	asc	"Le refuge de l"A7"alchimiste."00
str8210	asc	"Le gite du fakir."00
str8220	asc	"L"A7"antre de la verite."00
str8230	asc	"L"A7"antre du fou."00
str8240	asc	"L"A7"antre du maigre."00
str8250	asc	"Le repere de l"A7"embaumeur."00
str8260	asc	"Le gite du bricoleur."00
str8270	asc	"Le repere du fuyard."00
str8280	asc	"Le refuge du montagnard."00
str8290	asc	"Le chemin des rongeurs."00
str8300	asc	"L"A7"antichambre de la mort."00
str8310	asc	"Du bruit a l"A7"est."00
str8320	asc	"De la lumiere au sud."00
str8330	asc	"L"A7"antre du maniaque."00
str8340	asc	"Le repere des rats."00
str8350	asc	"La salle des survivants."00
str8360	asc	"La cremerie et le tailleur."00
str8370	asc	"Le tabac et la boulangerie."00
str8380	asc	"Le traiteur."00
str8390	asc	"Le medecin et le chausseur."00
str8400	asc	"Le coin nord-ouest de la ville."00
str8410	asc	"La fin de la ville !"00
str8420	asc	"Dans le tabac."00
str8430	asc	"8430"00	; X rien
str8440	asc	"Chez le tailleur."00
str8450	asc	"Dans la cremerie."00
str8460	asc	"Chez le chausseur."00
str8470	asc	"Chez le medecin."00
str8480	asc	"La droguerie."00
str8490	asc	"Dans la droguerie."00
str8500	asc	"Le coin sud-est de la ville."00
str8510	asc	"Devant un monument..?"00
str8520	asc	"Que vendez-vous ?"00
str8530	asc	"La salle de la B.A."00
str8540	asc	"Le mausolee de l"A7"exterminateur."00
str8550	asc	"Le choeur du Temple."00
str8560	asc	"L"A7"antre du venere."00
str8570	asc	"Le chemin des dipteres."00
str8580	asc	"L"A7"antre du victorieux."00
str8590	asc	"8590"00
str8600	asc	"8600"00

*
* Les reponses (str7xxx)
*

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str4010	asc	"Vous etes arrive dans la salle de dis- "
	asc	" section, et vous n"A7"avez pas fait de   "
	asc	"  vieux os..."00
str4020	asc	"Vous etes tombe dans l"A7"incinerateur    "
	asc	" d"A7"organes ..."00
str4030	asc	"Vous venez de faire une chute dans un  "
	asc	" precipice d"A7"au moins 200 m."00
str4040	asc	"Cette soupe etait un acide sulfurique  "
	asc	" parfume... Hum! Douce mort."00
str4050	asc	"Il ne se passe rien, cela fait toujours"
	asc	" un repas de gagne."00
str4060	asc	"La soupe est euphorisante, vous avez la"
	asc	" vision d"A7"une ville doree."00
str4070	asc	"Vous mourez etouffe dans les sables    "
	asc	" mouvants..."00
str4080	asc	"Vous trebuchez en l"A7"abordant....       "
	asc	" Miam, miam (les piranhas)."00
str4090	asc	"Des gaz mortels s"A7"echappent de la      "
	asc	" bouteille... c"A7"est triste."00
str4100	asc	"Un panneau du mur pivote, des COBRAS en"
	asc	" sortent... Adieu !"00
str4110	asc	"Vous trebuchez et vous vous empallez su"
	asc	"rle tournevis."00
str4120	asc	"Vous avez ete broye !!!"00
str4130	asc	"Le robot vous broie les os..."00
str4140	asc	"Un barreau de l"A7"echelle se detache."00
str4150	asc	"Vous ne saviez pas piloter le DELTA    "
	asc	" PLANE... Adieu !"00
str4160	asc	"J"A7"ai toujours pense qu"A7"en 10 lecons le "
	asc	" DELTA c"A7"est juste."00
str4170	asc	"Vous avez ete happe par une presse     "
	asc	" hydraulique..."00
str4180	asc	"Vous grillez sur le generateur de la   "
	asc	" salle d"A7"operation."00
str4190	asc	"Vous glissez en montant, la colle gicle"
	asc	" dans vos yeux."00
str4200	asc	"L"A7"eau touche le systeme electrique...  "
	asc	" Vous grillez..."00
str4210	asc	"La folie vous a pris (vider un seau    "
	asc	" vide), vous vous suicidez."00
str4220	asc	"Vous electrocutez le robot, mais vous  "
	asc	" aussi par la meme occasion."00
str4230	asc	"Petit genie, hein ? Vous avez enraye le"
	asc	" mecanisme du robot."00
str4240	asc	"Vous vous etes colles les doigts, et en"
	asc	" voulant les separer a la lame de rasoi"
	asc	"r,vous vous etes tranche la gorge."00
str4250	asc	"Oh merci, merci beaucoup... SMACK !"00
str4260	asc	"Vous l"A7"avez deja fait."00
str4270	asc	"Il faudrait peut-etre debrancher la    "
	asc	" batterie."00
str4280	asc	"Ce livre apprend le DELTA-PLANE en 10  "
	asc	" lecons."00
str4290	asc	"L"A7"endroit est un peu trop exigu pour   "
	asc	" essayer une telle chose."00
str4300	asc	"Vous avez l"A7"intention de vous shooter ?"00
str4310	asc	"La boite explose !"00
str4320	asc	"Il y a une clef sous l"A7"adhesif."00
str4330	asc	"Cette fois vous en avez trop enleve, la"
	asc	" barque part en miettes."00
str4340	asc	"La trappe est fermee a clef."00
str4350	asc	"Le passe partout ne fonctionne pas avec"
	asc	" cette serrure."00
str4360	asc	"Les murs se rapprochent les uns des    "
	asc	" autres, vous etes aplati."00
str4370	asc	"Il ne vous reste plus de temps !"00
str4380	asc	"Il faudrait peut etre de l"A7"electricite."
	asc	"."00
str4390	asc	"Il faudrait peut etre y visser une     "
	asc	" ampoule."00
str4400	asc	"IMPOSSIBLE"00
str4410	asc	"Vous tombez dans un cercueil qui se    "
	asc	" referme sur vous."00
str4420	asc	"Vous avez du attraper la rage aupres de"
	asc	" rats..."00
str4430	asc	"Vous avez mal digere la soupe, c"A7"est   "
	asc	" une intoxication."00
str4440	asc	"Vous avez ete electrocute par la lampe."00
str4450	asc	"A force de rester dans le noir, vous   "
	asc	" etes devenu fou !"00
str4460	asc	"Vous ne pouvez prendre, il faut acheter"
	asc	"."00
str4470	asc	"Le marchand est fou, il se jette sur   "
	asc	" vous et vous tue."00
str4480	asc	"He! he! On ne rentre pas dans un temple"
	asc	" avec ses chaussures, les gardes vous t"
	asc	"uent"00
str4490	asc	"La piece etait pleine de mouches......."
	asc	".tse-tse !!!"00
str4500	asc	"Les murs s"A7"ecroulent sur vous, vous    "
	asc	" n"A7"auriez pas du la laisser, grand lach"
	asc	"e."00
str4510	asc	"Toutes mes felicitations."00
str4520	asc	"Il aurait fallu mettre le masque, les  "
	asc	" gaz vous tuent !"00
str4530	asc	"La fille n"A7"avait pas de masque, elle   "
	asc	" meurt et vous aussi (le remord...)."00
str4540	asc	"La fille etait nue, elle ne pouvait vou"
	asc	"ssuivre. Pour se venger elle vous tranc"
	asc	"hela gorge avec les debris."00
str4550	asc	"Vous n"A7"avez rien pour trancher les     "
	asc	" cordes."00
str4560	asc	"Vous auriez du eteindre la lampe avant "
	asc	" de debrancher. Quel court circuit !!!"00
str4570	asc	"Le possesseur du portefeuille devait   "
	asc	" avoir la lepre..."00
str4580	asc	"Vous trebuchez sur la hache...         "
	asc	" Que de sang..."00
str4590	asc	"Voici enfin la ville des mutiles.      "
	asc	" Pauvres survivants des experiences    "
	asc	"  cruelles du savant fou."00
str4600	asc	"Vous avez du prendre mal par les pieds."00
str4610	asc	"La quinine etait trop forte, vous moure"
	asc	"zempoisonne..."00
str4620	asc	"Je ne suis pas interesse."00
str4630	asc	"Alors, que faites vous la ?"00
str4640	asc	"Si cela vous plait de perdre du temps"00
str4650	asc	"Oh merci,merci beaucoup..."A7" SMACK "A700

tbl4660	da	$bdbd
	da	str4670,str4680,str4690,str4700
	da	str4710,str4720,str4730,str4740
	da	str4750
	
str4670	asc	"Courage, pensez a la recompense..."00
str4680	asc	"Hum! Il y a de l"A7"idee dans ce que vous faites."00 
str4690	asc	"Je n"A7"aurais pas pense a faire cela."00
str4700	asc	"Vous etes un habitue des jeux d"A7"aventures ?"00 
str4710	asc	"Quelle drole d'idee ?"00 
str4720	asc	"Pourquoi pas ?"00
str4730	asc	"Quel aventurier vous faites...fiiuuue"00
str4740	asc	"A ce train la, vous finirez bien par y arriver"00
str4750	asc	"Vous, vous avez pas de petrole, mais  vous avez des idees"00

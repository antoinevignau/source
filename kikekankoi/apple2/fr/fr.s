*
* Les objets dans les salles
*

L7F00       HEX   00,02,00,00,00,0E,00,00,13,00,00,14,00,12,0F,11
            HEX   1A,1B,1C,21,22,23,00,2F,2F,2F,2E,2C,32,32,31,36
            HEX   2A,2D,00,00,00,28,00,00,00,00,00,00,00,00,00,00

nbO	=	37

refO	dfb	$bd
	dfb	02,00,00,00,14,00,00,19,00,00
	dfb	20,00,18,15,17,26,27,28,33,34
	dfb	35,00,47,47,47,46,44,50,50,49
	dfb	54,42,45,00,00,00,40

O	dfb	$bd
	dfb	02,00,00,00,14,00,00,19,00,00
	dfb	20,00,18,15,17,26,27,28,33,34
	dfb	35,00,47,47,47,46,44,50,50,49
	dfb	54,42,45,00,00,00,40

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
O$3	asc	"x"00
O$4	asc	"x"00
O$5	asc	"Un seau"00
O$6	asc	"Un seau plein de sable"00
O$7	asc	"Un seau plein d'eau"00
O$8	asc	"Une lampe"00
O$9	asc	"Une lampe avec une ampoule"00
O$10	asc	"Une lampe allume"00
O$11	asc	"Une fiole"00
O$12	asc	"Une clef"00
O$13	asc	"Une bouteille"00
O$14	asc	"Un livre"00
O$15	asc	"Un passe partout"00
O$16	asc	"Un tournevis"00
O$17	asc	"Un deltaplane"00
O$18	asc	"Une echelle de corde"00
O$19	asc	"Un tube de colle"00
O$20	asc	"Une ampoul"00
O$21	asc	"Une boite"00
O$22	asc	"Des debris de verre"00
O$23	asc	"Un masque a gaz"00
O$24	asc	"De la quinine"00
O$25	asc	"Une aspirine"00
O$26	asc	"Des espadrilles"00
O$27	asc	"Une robe"00
O$28	asc	"Un portefeuille"00
O$29	asc	"Une broche"00
O$30	asc	"Un harnai"00
O$31	asc	"Une bombe insecticide"00
O$32	asc	"Une hache"00
O$33	asc	"Un pot de creme"00
O$34	asc	"Une liasse de billets"00
O$35	asc	"Vos chaussures"00
O$36	asc	"x"00
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

M$1	dfb	4,02,3,04,6,05,0
M$2	dfb	3,01,0
M$3	dfb	0	; X
M$4	dfb	4,01,3,13,0
M$5	dfb	5,01,4,08,3,07,0
M$6	dfb	0	; X
M$7	dfb	4,05,3,15,0
M$8	dfb	3,05,0
M$9	dfb	6,12,4,10,3,11,0
M$10	dfb	3,09,0
M$11	dfb	4,09,3,22,0
M$12	dfb	5,09,1,25,0
M$13	dfb	4,04,3,14,0
M$14	dfb	4,13,3,16,0
M$15	dfb	4,07,1,21,3,20,0
M$16	dfb	4,14,1,19,3,17,0
M$17	dfb	4,16,0
M$18	dfb	0
M$19	dfb	2,16,0
M$20	dfb	4,15,0
M$21	dfb	2,15,0
M$22	dfb	4,11,1,24,3,23,0
M$23	dfb	4,22,0
M$24	dfb	1,27,2,22,0
M$25	dfb	2,12,3,26,0
M$26	dfb	4,25,3,27,0
M$27	dfb	4,26,2,24,0
M$28	dfb	4,29,1,30,2,32,3,31,0
M$29	dfb	3,28,0
M$30	dfb	2,28,0
M$31	dfb	4,28,2,35,0
M$32	dfb	1,28,2,33,0
M$33	dfb	1,32,0
M$34	dfb	3,29,0
M$35	dfb	1,31,0
M$36	dfb	1,37,3,10,0
M$37	dfb	2,36,1,38,3,48,4,39,0
M$38	dfb	1,41,2,37,4,40,7,52,0
M$39	dfb	1,40,3,37,0
M$40	dfb	3,38,2,39,0
M$41	dfb	2,38,0
M$42	dfb	9,37,0
M$43	dfb	0
M$44	dfb	9,36,0
M$45	dfb	9,36,0
M$46	dfb	9,39,0
M$47	dfb	9,39,0
M$48	dfb	4,37,3,50,7,49,0
M$49	dfb	9,48,0
M$50	dfb	1,51,4,48,0
M$51	dfb	2,50,0
M$52	dfb	9,38,0
M$53	dfb	2,56,0
M$54	dfb	3,56,0
M$55	dfb	4,56,3,57,0
M$56	dfb	1,53,3,55,2,51,4,54,9,51,0
M$57	dfb	4,55,0
M$58	dfb	1,57,0

*
* Le vocabulaire
* on fera index-1 b/c 8-bits
*

V	=	126+3

tblV$	da	V$1,V$2,V$3,V$4,V$5,V$6,V$7,V$8,V$9,V$10
	da	V$11,V$12,V$13,V$14,V$15,V$16,V$17,V$18,V$19,V$20
	da	V$21,V$22,V$23,V$24,V$25,V$26,V$27,V$28,V$29,V$30
	da	V$31,V$32,V$33,V$34,V$35,V$36,V$37,V$38,V$39,V$40
	da	V$41,V$42,V$43,V$44,V$45,V$46,V$47,V$48,V$49,V$50
	da	V$51,V$52,V$53,V$54,V$55,V$56,V$57,V$58,V$59,V$60
	da	V$61,V$62,V$63,V$64,V$65,V$66,V$67,V$68,V$69,V$70
	da	V$71,V$72,V$73,V$74,V$75,V$76,V$77,V$78,V$79,V$80
	da	V$81,V$82,V$83,V$84,V$85,V$86,V$87,V$88,V$89,V$90
	da	V$91,V$92,V$93,V$94,V$95,V$96,V$97,V$98,V$99,V$100
	da	V$101,V$102,V$103,V$104,V$105,V$106,V$107,V$108,V$109,V$110
	da	V$111,V$112,V$113,V$114,V$115,V$116,V$117,V$118,V$119,V$120
	da	V$121,V$122,V$123,V$124,V$125,V$126
	da	V$127,V$128,V$129
	
tblV	dfb	$01,$01,$02,$02,$03,$03,$04,$04,$05,$05
	dfb	$05,$06,$06,$07,$08,$0A,$0A,$0B,$0B,$0C
	dfb	$0D,$0E,$0E,$0F,$0F,$10,$10,$12,$13,$14
	dfb	$15,$15,$16,$16,$16,$17,$17,$18,$19,$19
	dfb	$1A,$18,$1B,$1C,$1D,$1E,$1F,$20,$20,$21
	dfb	$22,$23,$23,$24,$25,$26,$27,$28,$29,$2A
	dfb	$2B,$2C,$2D,$2E,$2F,$30,$31,$32,$35,$36
	dfb	$37,$39,$3A,$3B,$3B,$3D,$3E,$3C,$3F,$35
	dfb	$14,$33,$00,$09,$19,$41,$42,$43,$44,$45
	dfb	$46,$47,$48,$5F,$5F,$5F,$4A,$4C,$4D,$4E
	dfb	$4E,$4E,$4F,$4F,$4F,$50,$51,$52,$53,$54
	dfb	$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5D
	dfb	$5E,$5E,$60,$61,$62,$4B
	dfb	$63,$64,$65	; Apple II

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
V$28	str	"REMP"
V$29	str	"VIDE"
V$30	str	"INVE"
V$31	str	"RIEN"
V$32	str	"ATTE"
V$33	str	"FRAP"
V$34	str	"ASSO"
V$35	str	"ATTA"
V$36	str	"POUS"
V$37	str	"TIRE"
V$38	str	"JETT"
V$39	str	"MANG"
V$40	str	"GOUT"
V$41	str	"BOIS"
V$42	str	"LANC"
V$43	str	"BARQ"
V$44	str	"RADE"
V$45	str	"BOUT"
V$46	str	"MESS"
V$47	str	"SEAU"
V$48	str	"MANU"
V$49	str	"LIVR"
V$50	str	"ECHE"
V$51	str	"PASS"
V$52	str	"LAMP"
V$53	str	"TORC"
V$54	str	"BATT"
V$55	str	"FIOL"
V$56	str	"DELT"
V$57	str	"TOUR"
V$58	str	"AMPO"
V$59	str	"BOIT"
V$60	str	"CLEF"
V$61	str	"MARM"
V$62	str	"ANNE"
V$63	str	"ROUG"
V$64	str	"ORAN"
V$65	str	"JAUN"
V$66	str	"TRAP"
V$67	str	"SABL"
V$68	str	"ROBO"
V$69	str	"COLL"
V$70	str	"VISS"
V$71	str	"EAU "
V$72	str	"CASS"
V$73	str	"ESSA"
V$74	str	"SENS"
V$75	str	"RENI"
V$76	str	"ADHE"
V$77	str	"DECO"
V$78	str	"PLAC"
V$79	str	"RAME"
V$80	str	"TUBE"
V$81	str	"LIST"
V$82	str	"BRAN"
V$83	str	"ESCA"
V$84	str	"SORS"
V$85	str	"AVAL"
V$86	str	"MAIL"
V$87	str	"MASQ"
V$88	str	"CHAU"
V$89	str	"ROBE"
V$90	str	"PORT"
V$91	str	"BROC"
V$92	str	"HARN"
V$93	str	"BOMB"
V$94	str	"METS"
V$95	str	"ENFI"
V$96	str	"PASS"
V$97	str	"DONN"
V$98	str	"VEND"
V$99	str	"ACHE"
V$100	str	"ENLE"
V$101	str	"ARRA"
V$102	str	"CREU"
V$103	str	"PIER"
V$104	str	"BLOC"
V$105	str	"MUR "
V$106	str	"ESPA"
V$107	str	"HACH"
V$108	str	"POT "
V$109	str	"LIAS"
V$110	str	"TABA"
V$111	str	"MEDE"
V$112	str	"CHAU"
V$113	str	"CREM"
V$114	str	"TRAI"
V$115	str	"BOUL"
V$116	str	"TAIL"
V$117	str	"DROG"
V$118	str	"TEMP"
V$119	str	"DELI"
V$120	str	"LIBE"
V$121	str	"FEMM"
V$122	str	"FILL"
V$123	str	"DEBR"
V$124	str	"ASPI"
V$125	str	"QUIN"
V$126	str	"VETE"
V$127	str	"CASSE"
V$128	str	"TEMPO"
V$129	str	"QUITTER"

*
* Les lieux (str8xxx)
*

*		"0         1         2         3         "
*		"0123456789012345678901234567890123456789"
*		"----------------------------------------"

str8010	asc	"L"A7"antre du demon."00
str8020	asc	"Le repere du chirurgien."00
str8030	asc	"X"00
str8040	asc	"L"A7"antre du sorcier."00
str8050	asc	"Au bord du lac."00
str8060	asc	"X"00
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
str8430	asc	"X"00
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
str8590	asc	""00
str8600	asc	""00

*
* Les reponses (str7xxx)
*

str7010	asc	"Vous etes arrive dans la salle de dis- "
	asc	" section, et vous n"A7"avez pas fait de   "
	asc	"  vieux os..."00
str7020	asc	"Vous etes tombe dans l"A7"incinerateur    "
	asc	" d"A7"organes ..."00
str7030	asc	"Vous venez de faire une chute dans un  "
	asc	" precipice d"A7"au moins 200 m."00
str7040	asc	"Cette soupe etait un acide sulfurique  "
	asc	" parfume... Hum! Douce mort."00
str7050	asc	"Il ne se passe rien, cela fait toujours"
	asc	" un repas de gagne."00
str7060	asc	"La soupe est euphorisante, vous avez la"
	asc	" vision d"A7"une ville doree."00
str7070	asc	"Vous mourez etouffe dans les sables    "
	asc	" mouvants..."00
str7080	asc	"Vous trebuchez en l"A7"abordant....       "
	asc	" Miam, miam (les piranhas)."00
str7090	asc	"Des gaz mortels s"A7"echappent de la      "
	asc	" bouteille... c"A7"est triste."00
str7100	asc	"Un panneau du mur pivote, des COBRAS en"
	asc	" sortent... Adieu !"00
str7110	asc	"Vous trebuchez et vous vous empallez su"
	asc	"rle tournevis."00
str7120	asc	"Vous avez ete broye !!!"00
str7130	asc	"Le robot vous broie les os..."00
str7140	asc	"Un barreau de l"A7"echelle se detache."00
str7150	asc	"Vous ne saviez pas piloter le DELTA    "
	asc	" PLANE... Adieu !"00
str7160	asc	"J"A7"ai toujours pense qu"A7"en 10 lecons le "
	asc	" DELTA c"A7"est juste."00
str7170	asc	"Vous avez ete happe par une presse     "
	asc	" hydraulique..."00
str7180	asc	"Vous grillez sur le generateur de la   "
	asc	" salle d"A7"operation."00
str7190	asc	"Vous glissez en montant, la colle gicle"
	asc	" dans vos yeux."00
str7200	asc	"L"A7"eau touche le systeme electrique...  "
	asc	" Vous grillez..."00
str7210	asc	"La folie vous a pris (vider un seau    "
	asc	" vide), vous vous suicidez."00
str7220	asc	"Vous electrocutez le robot, mais vous  "
	asc	" aussi par la meme occasion."00
str7230	asc	"Petit genie, hein ? Vous avez enraye le"
	asc	" mecanisme du robot."00
str7240	asc	"Vous vous etes colles les doigts, et en"
	asc	" voulant les separer a la lame de rasoi"
	asc	"r,vous vous etes tranche la gorge."00
str7250	asc	"Oh merci, merci beaucoup... SMACK !"00
str7260	asc	"Vous l"A7"avez deja fait."00
str7270	asc	"Il faudrait peut-etre debrancher la    "
	asc	" batterie."00
str7280	asc	"Ce livre apprend le DELTA-PLANE en 10  "
	asc	" lecons."00
str7290	asc	"L"A7"endroit est un peu trop exigu pour   "
	asc	" essayer une telle chose."00
str7300	asc	"Vous avez l"A7"intention de vous shooter ?"00
	asc	"La boite explose !"00
str7310	asc	"Il y a une clef sous l"A7"adhesif."00
str7320	asc	"Cette fois vous en avez trop enleve, la"
	asc	" barque part en miettes."00
str7330	asc	"La trappe est fermee a clef."00
str7340	asc	"Le passe partout ne fonctionne pas avec"
	asc	" cette serrure."00
str7350	asc	"Les murs se rapprochent les uns des    "
	asc	" autres, vous etes aplati."00
str7360	asc	"Si cela vous plait de perdre du temps !"00
str7370	asc	"Il faudrait peut etre de l"A7"electricite."
	asc	"."00
str7380	asc	"Il faudrait peut etre y visser une     "
	asc	" ampoule."00
str7390	asc	"IMPOSSIBLE"00
str7400	asc	"Vous tombez dans un cercueil qui se    "
	asc	" referme sur vous."00
str7410	asc	"Vous avez du attraper la rage aupres de"
	asc	" rats..."00
str7420	asc	"Vous avez mal digere la soupe, c"A7"est   "
	asc	" une intoxication."00
str7430	asc	"Vous avez ete electrocute par la lampe."00
str7440	asc	"A force de rester dans le noir, vous   "
	asc	" etes devenu fou !"00
str7450	asc	"Vous ne pouvez prendre, il faut acheter"
	asc	"."00
str7460	asc	"Le marchand est fou, il se jette sur   "
	asc	" vous et vous tue."00
str7470	asc	"He! he! On ne rentre pas dans un temple"
	asc	" avec ses chaussures, les gardes vous t"
	asc	"ue"00
str7480	asc	"La piece etait pleine de mouches......."
	asc	".tse-tse !!!"00
str7490	asc	"Les murs s"A7"ecroulent sur vous, vous    "
	asc	" n"A7"auriez pas du la laisser, grand lach"
	asc	"e."00
str7500	asc	"Toutes mes felicitations."00
str7510	asc	"Il aurait fallu mettre le masque, les  "
	asc	" gaz vous tue !"00
str7520	asc	"La fille n"A7"avait pas de masque, elle   "
	asc	" meurt et vous aussi (le remord...)."00
str7530	asc	"La fille etait nue, elle ne pouvait vou"
	asc	"ssuivre. Pour se venger elle vous tranc"
	asc	"hela gorge avec les debris."00
str7540	asc	"Vous n"A7"avez rien pour trancher les     "
	asc	" cordes."00
str7550	asc	"Vous auriez du eteindre la lampe avant "
	asc	" de debrancher. Quel court circuit !!!"00
str7560	asc	"Le possesseur du portefeuille devait   "
	asc	" avoir la lepre..."00
str7570	asc	"Vous trebuchez sur la hache...         "
	asc	" Que de sang..."00
str7580	asc	"Voici enfin la ville des mutiles.      "
	asc	" Pauvres survivants des experiences    "
	asc	"  cruelles du savant fou."00
str7590	asc	"Vous avez du prendre mal par les pieds."00
str7600	asc	"La quinine etait trop forte, vous moure"
	asc	"zempoisonne..."00
str7610	asc	"Je ne suis pas interesse."00
str7620	asc	"Alors, que faites vous la ?"00

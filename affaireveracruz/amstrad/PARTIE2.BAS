  10 ON ERROR GOTO 2020:ON BREAK GOSUB @19184:visa=&H7035:deb=&H7029
  20 SYMBOL 255,0,0,0,255,3,3,3,3:SYMBOL 254,0,0,0,255,192,192,192,192:SYMBOL 253,0,0,0,255,0,0,0,0:BORDER 26:PAPER 0:MODE 1:CALL deb:CALL &HA4A6:TAG:PLOT 72,304,2:PRINT"2eme PARTIE";;:TAGOFF:PEN 1 
  30 LOCATE 3,23:PRINT "Auteur:":LOCATE 3,25:PRINT "BLANCON Gilles    "+CHR$(164)+" INFOGRAMES - 1985"
  40 CALL visa:ORG$="DEST GIE ST-ETIENNE":MODE 2:GOTO 60
  50 z=z+495:POKE &HA4AA,z-INT(z/256)*256:POKE &HA4AB,INT(z/256):CALL &HA4A6:RETURN
  60 WINDOW#1,2,40,1,20:PAPER#1,0:PEN#1,1:WINDOW#2,46,76,3,14:PAPER#2,1:PEN#2,0:WINDOW#3,1,80,22,25:PAPER#3,1:PEN#3,0:WINDOW#4,61,76,3,12:PAPER#4,0:WINDOW#5,60,77,2,13:PAPER#5,1:WINDOW#6,1,80,1,21:PAPER#6,0:WINDOW#7,3,39,14,20:PAPER#7,0:PEN#7,1
  70 GOSUB 1030:CLS#1:CLS#2:GOSUB 80:GOSUB 90:GOTO 110
  80 z=36666:GOSUB 50:z=40961:GOSUB 50:CLS#1:LOCATE#1,2,21:z=41386:GOSUB 500:GOSUB 50:FOR t=1 TO 90:NEXT:PRINT#1:z=41497:GOSUB 500:GOSUB 50:RETURN
  90 FOR buz=23480 TO 23486:READ busy:POKE buz,busy:NEXT:DEFINT D:x0Bx00x00DTTROFF =0:RETURN
 100 DATA &AF,&CD,&2B,&BD,&17,&12,&C9

** saisie **

 110 B$=UPPER$(INKEY$):IF B$=""THEN 110
 120 x=0:IF B$="M" THEN CLS#2:GOSUB 80:GOSUB 260:GOTO 510
 130 IF B$="D" THEN CLS#6:z=40961:GOSUB 50:z=36467:GOSUB 50:GOTO 840
 140 IF B$="E" THEN 1390
 150 IF b$="I" THEN GOSUB 210
 160 IF B$="C" THEN 1120
 170 IF b$="A" THEN 1460
 180 GOTO 110
 190 CLS#3:LOCATE#3,2,2:PRINT#3,"M = message";?E5?(17);"D = deposition":GOSUB 230
 200 LOCATE#3,2,3:PRINT#3,"E = examen";?E5?(18);"C = comparaison";?E5?(16);"A = auteur":RETURN
 
 ** imprimante **
 
 210 CALL 23480,@DTR:IF DTR =0 THEN RETURN
 220 i=i+1 
 230 IF I=2 OR i=0 THEN I=0:GOTO 250
 240 LOCATE#3,61,2:PRINT#3,CHR$(24);"I = imprimante";CHR$(24);:RETURN
 250 LOCATE#3,61,2:PRINT#3,"I = imprimante":RETURN

 ** saisie **
 B$ = destinataire
 C$ = mot recherché
 
 260 PRINT#2,"ORIG GIE ST-ETIENNE","DEST",,"-------------------------------":LOCATE#2,6,2:B$="":C$="":X1=6
 270 LOCATE#2,X1,2:PRINT#2,CHR$(143)
 280 A$=UPPER$(INKEY$):IF A$="" THEN 280
 290 SOUND 1,100,3
 300 IF A$=CHR$(13) THEN LOCATE#2,X1,2:PRINT#2,CHR$(128):GOTO 350
 310 IF a$=CHR$(127) THEN 280
 320 B$=B$+A$:LOCATE#2,X1,2:PRINT#2,A$
 330 X1=X1+1
 340 IF LEN(B$)<>26 THEN 270
 350 X1=1:Y1=4
 360 LOCATE#2,X1,Y1:PRINT#2,CHR$(143)
 370 A$=UPPER$(INKEY$):IF A$="" THEN 370
 380 SOUND 1,100,3
 390 IF A$=CHR$(13) THEN LOCATE#2,X1,Y1:PRINT#2,".STOP.":RETURN
 400 IF a$=CHR$(127) THEN 360
 410 IF X1=32 OR X1=63 OR X1=94 OR X1=125 OR X1=156 OR X1=187 OR X1=218 THEN X1=1:Y1=Y1+1
 420 C$=C$+A$:LOCATE#2,X1,Y1:PRINT#2,A$:X1=X1+1
 430 IF LEN(C$)=242 THEN LOCATE#2,X1,Y1:PRINT#2,".STOP.":RETURN:ELSE 360
 440 IF X=1 THEN X=0:GOTO 470
 450 LOCATE#1,4,21:PRINT#1,A$:Z=41574:GOSUB 50:X=1:IF I=1 THEN PRINT#8,A$
 460 RETURN
 470 LOCATE#1,4,21:PRINT#1,A$:Z=41497:GOSUB 50:IF I=1 THEN PRINT#8,A$
 480 RETURN
 490 FOR t=1 TO 30:SOUND 2,400,0.500000,7:SOUND 2,0,2:NEXT
 500 SOUND 2,1,9,5,1,1,1:FOR T=1 TO 90:NEXT:RETURN 
 
 ** messagerie ** DONE
 
	 B$ = adresse
	 C$ = recherche
	 
 510 FOR t=1 TO 1000:NEXT
 520 IF INSTR(B$,"CIAT")>0 THEN 590			- 54 	CIAT
 530 IF INSTR(B$,"GIE")>0 THEN 640			- 55 	GIE
 540 IF INSTR(B$,"PREF")>0 THEN 680			- 56 	PREFECTURE
 550 IF INSTR(B$,"CRRJ")>0 THEN 700			- 57 	CRJJ
 560 IF INSTR(B$,"BDRJ")>0 THEN 790			- 58 	BDRJ
 570 IF INSTR(B$,"PRIS")>0 THEN 800			- 59 	PRISON
 580 X=0:A$="DESTINATAIRE INCONNU.STOP.":GOTO 630

	-- CIAT --

 590 IF INSTR(B$,"TIE")>0 AND INSTR(C$,"ELR")>0 THEN 		- 49,18-19	ST-ETIENNE, DELROCHE
 	GOSUB 810:P1=1:M=9:RESTORE 1720:GOSUB 1110:GOTO 820
 600 IF INSTR(B$,"YO")>0 AND INSTR(C$,"ANC")>0 THEN 		- 51, 9-10	LYON, GILLES BLANC
 	GOSUB 810:M=9:RESTORE 1620:GOSUB 1110:GOTO 820
 610 IF INSTR(B$,"ARI")>0 AND INSTR(C$,"LIP")>0 THEN 		- 52, 9-11	PARIS, PHILIPPE BLANC
 	GOSUB 810:M=7:RESTORE 1850:GOSUB 1110:GOTO 820

 620 X=0:A$="DESTINATAIRE NON CONCERNE.STOP."
 630 GOSUB 490:GOSUB 440:A$="":GOSUB 500:GOSUB 440:GOTO 110

	-- GIE --
	
 640 IF INSTR(B$,"TIE")>0 THEN 				- 49	ST-ETIENNE
 	X=0:A$="HO! CHEF, T'ES PAS REVEILLE.":GOTO 630
 650 IF INSTR(B$,"ONT")>0 AND INSTR(C$,"WAL")>0 THEN 		- 48, 7-8	MONTBRISSON, KOWALSKI
 	GOSUB 810:M=10:RESTORE 1640:GOSUB 1110:GOTO 820
 660 IF INSTR(B$,"ALM")>0 AND INSTR(C$,"ZI")>0 THEN  		- 50, 4-6	SAINT-GALMIER, ZIEGLER
 	GOSUB 810:M=7:RESTORE 1780:GOSUB 1110:GOTO 820
 670 IF INSTR(B$,"CLE")>0 THEN  			- 48	CLERMONT
 	GOSUB 810:AR=1:M=6:RESTORE 1590:GOSUB 1110:GOTO 820::ELSE 620

	-- PREFECTURE --
	
 680 IF INSTR(B$,"TIE")>0 AND INSTR(C$,"6151 SZ 42")>0 THEN 		- 49, 26	PREFECTURE SAINT-ETIENNE, 6151 SZ 42
 	GOSUB 810:M=4:RESTORE 1510:GOSUB 1110:GOTO 820
 690 IF INSTR(B$,"YO")>0 AND INSTR(C$,"9111 CD 69")>0 THEN 		- 51, 27	PREFECTURE LYON, 9111 CD 69
 	GOSUB 810:M=4:ID=1:RESTORE 1520:GOSUB 1110:GOTO 820::ELSE 620

	-- CRRJ --

 700 IF INSTR(B$,"YO")>0 THEN 				- 51
 	710:
     ELSE 
     	620
 710 IF INSTR(C$,"ABD")>0 OR INSTR(C$,"FRI")>0 THEN 				- 1-3	ABDOULAH, FRISE
 	CLS#2:PRINT#2,"ABDOULAH",,"HOCINE",,,,"DIT LE FRISE",,,,"NE LE 23.4.55","A MEKNES (MAR)":
	CLS#4:Z=32325:GOSUB 50:GOSUB 810:M=3:RESTORE 1530:GOSUB 1110:GOTO 820
 720 IF INSTR(C$,"ZI")>0 OR INSTR(C$,"MANOU")>0 THEN 				- 4-6	ZIEGLER, MANOUCHE
 	CLS#2:PRINT#2,"ZIEGLER",,"PHILIBERT",,,,"DIT LE MANOUCHE",,,"NE LE 17.08.59","A LYON 69":
	CLS#4:Z=31213:GOSUB 50:GOSUB 810:M=6:RESTORE 1540:GOSUB 1110:GOTO 820
 730 IF INSTR(c$,"TANI")>0 AND INSTR(C$,"KO")>0 THEN 				- 7-8	STANISLAS, KOWALSKI
 	CLS#2:PRINT#2,"KOWALSKI",,"STANISLAS",,,,"NE LE 14.12.52","A VARSOVIE(POL)":
	CLS#4:Z=29698:GOSUB 50:GOSUB 810:M=4:RESTORE 1550:GOSUB 1110:GOTO 820
 740 IF INSTR(C$,"GIL")>0 AND INSTR(C$,"LANC")>0 THEN 				- 9-11	GILLES, BLANC
 	CLS#2:PRINT#2,"BLANC",,"GILLES",,,,"NE LE 2.11.60","A LYON 2EME":
	CLS#4:Z=28224:GOSUB 50:Z=29605:GOSUB 50:GOSUB 810:M=6:RESTORE 1600:GOSUB 1110:GOTO 820
 750 IF (INSTR(C$,"MAC")>0 OR INSTR(C$,"DOUI")>0) AND (INSTR(C$,"56743")>0 OR INSTR(C$,"TE 9")>0 OR INSTR(C$,"3.79")>0 OR INSTR(C$,"3-79")>0) THEN 
 	GOSUB 810:M=5:RESTORE 1580:GOSUB 1110:GOTO 820				- 28-33	MAC, DOUILLE, 56743, TE 9, 3.79, 3-79
 760 IF INSTR(C$,"ELA")>0 THEN 						- 12-13	DELARUE
 	CLS#2:CLS#4:Z=25658:GOSUB 50:PRINT#2,"DELARUE",,"EVA",,,,"NEE LE 23.1.57","A PARIS 75":
	GOSUB 810:M=5:RESTORE 1810:GOSUB 1110:GOTO 820
 770 IF INSTR(C$,"UZ")>0 THEN 						- 14-15	CRUZ
 	CLS#2:CLS#4:Z=24220:GOSUB 50:PRINT#2,"CRUZ",,"VERA",,,,"NEE LE 12.5.54","A ST-ETIENNE":
	GOSUB 810:M=1:RESTORE 1830:GOSUB 1110:M=4:RESTORE 1820:GOSUB 1110:GOTO 820
 780 IF INSTR(C$,"ILIP")>0 AND INSTR(C$,"LANC")>0 THEN 				- 9, 11	PHILIPPE, BLANC
 	CLS#2:CLS#4:Z=28224:GOSUB 50:PRINT#2,"BLANC",,"PHILIPPE",,,,"NE LE 21.7.62","A CLERMONT (63)":
	GOSUB 810:M=3:RESTORE 1610:GOSUB 1110:GOTO 820::ELSE 620

	-- BDRJ --

 790 IF INSTR(B$,"ETIE")>0 AND INSTR(C$,"LANC")>0 AND INSTR(C$,"ILIP")>0 THEN 			; 49, 9, 11	SAINT-ETIENNE, BLANC, PHILIPPE
 	GOSUB 810:M=7:RESTORE 1840:GOSUB 1110:GOTO 820::ELSE 620

	-- PRISON --
	
 800 IF INSTR(B$,"PAUL")>0 AND INSTR(C$,"ZI")>0 THEN 				; 52, 4-6	SAINT-PAUL, ZIEGLER
 	GOSUB 810:M=6:RESTORE 1860:GOSUB 1110:GOTO 820::ELSE 620

	-- fin de sous-routine --
	
 810 A$="ORIG "+B$:GOSUB 490:GOSUB 440:A$=ORG$:GOSUB 490:GOSUB 440:A$="":GOSUB 500:GOSUB 440:RETURN
 820 A$="":GOSUB 500:GOSUB 440:GOTO 110
 830 GOSUB 490:GOSUB 440:RETURN
 
 ** deposition ** DONE
 
 	B$ = personne
	C$ = adresse
 
 840 CLS#1:CLS#5:CLS#4:GOSUB 960:CLS#3:
     LOCATE#3,2,2:INPUT#3,"DEPOSITION DE QUELLE PERSONNE ";b$:b$=UPPER$(b$):
     CLS#3:
     LOCATE#3,2,2:INPUT#3,"OU TROUVEZ-VOUS CETTE PERSONNE ";c$:c$=UPPER$(c$)

 850 IF INSTR(b$,"EUIL")>0 AND INSTR(c$,"LAY")>0 THEN 		- LAFEUILLE, BALAY
	z=23000:GOSUB 50:NA=1:RESTORE 1560:M=9:GOSUB 990:GOTO 950
 860 IF INSTR(b$,"ELR")>0 AND INSTR(c$,"ETIE")>0 THEN 		- DELROCHE, ST-ETIENNE
 	Z=35173:GOSUB 50:HU=1:RESTORE 1700:M=13:GOSUB 990:GOTO 950
 870 IF INSTR(b$,"ART")>0 OR INSTR(b$,"VOIS")>0 THEN 		- MARTIN/VOISIN, sans adresse
 	Z=33821:GOSUB 50:RESTORE 1680:MA=1:M=12:GOSUB 990:GOTO 950
 880 IF INSTR(b$,"UPL")>0 OR INSTR(b$,"CONC")>0 		- DUPLAT/CONCIERGE, sans adresse
 	THEN z=26950:GOSUB 50:RESTORE 1660:DU=1:M=13:GOSUB 990:GOTO 950
 890 IF INSTR(b$,"ZI")>0 AND INSTR(c$,"CARN")>0 THEN 		- ZIEGLER, CARNOT
	Z=31213:GOSUB 50:ZI=1:
	IF ph=1 THEN 
		RESTORE 1950:zi1=1:M=14:GOSUB 990:GOTO 950::
	ELSE 
		RESTORE 1740:M=11:GOSUB 990:GOTO 950
 900 IF INSTR(b$,"ABD")>0 AND INSTR(c$,"PEUP")>0 THEN 		- ABDOULAH, PEUPLIERS
 	Z=32325:GOSUB 50:RESTORE 1760:ME=1:M=13:GOSUB 990:GOTO 950
 910 IF INSTR(b$,"ELA")>0 AND INSTR(c$,"OUTIE")>0 THEN		- DELARUE, ROUTIER
 	Z=25658:GOSUB 50:RESTORE 1790:DE=1:M=12:GOSUB 990:GOTO 950
 920 IF INSTR(b$,"GIL")>0 AND INSTR(c$,"GARE")>0 THEN 		- GILLES BLANC, GARE
 	Z=28224:GOSUB 50:Z=29605:GOSUB 50:GI=1:
	IF ph=1 AND zi1=1 AND ko1=1 THEN 
		RESTORE 1980:gi1=1:M=14:GOSUB 990:GOTO 950::
	ELSE
		RESTORE 1870:M=12:GOSUB 990:GOTO 950
 930 IF INSTR(b$,"PPE")>0 AND INSTR(c$,"TERR")>0 AND ID=1 THEN 		- PHILIPPE BLANC, TERREAUX
 	Z=28224:GOSUB 50:PH=1:
	IF gi1=1 THEN 
		RESTORE 2000:ph1=1:M=14:GOSUB 990:GOTO 950::
	ELSE 
		RESTORE 1890:M=9:GOSUB 990:GOTO 950
 940 IF INSTR(b$,"KO")>0 AND INSTR(c$,"ZOL")>0 THEN 		- KOWALSKI, ZOLA
 	Z=29698:GOSUB 50:KO=1:
	IF ph=1 THEN 
		RESTORE 1930:ko1=1:M=12:GOSUB 990:GOTO 950::
	ELSE 
		RESTORE 1910:M=10:GOSUB 990:GOTO 950
 950 GOSUB 190:GOTO 110

 ** impression entête papier **

 960 LOCATE#1,1,20:PRINT#1," ";:
     LOCATE#1,1,21:PRINT#1,CHR$(254);:
     FOR t=1 TO 37:PRINT#1,CHR$(253);:NEXT:
     LOCATE#1,39,20:PRINT#1,CHR$(255);:
     LOCATE#1,1,21:PRINT#1,CHR$(211);"Brigade de    GENDARMERIE NATIONALE  ";CHR$(209);
 970 LOCATE#1,1,21:PRINT#1,CHR$(211);"Recherches          --------         ";CHR$(209);:
     LOCATE#1,1,21:PRINT#1,CHR$(211);"ST-ETIENNE        ";PV$;CHR$(209);
 980 LOCATE#1,1,21:PRINT#1,CHR$(211);"----------          --------         ";CHR$(209);:
     LOCATE#1,1,21:PRINT#1,CHR$(211);:
     LOCATE#1,39,20:PRINT#1,CHR$(209);:RETURN

 ** impression de tous les DATA **
 
 990 FOR T=1 TO M:READ A$:LOCATE#1,1,21:PRINT#1,CHR$(211);A$;:LOCATE#1,39,20:PRINT#1,CHR$(209);
1000 IF I=1 THEN PRINT#8,A$
1010 NEXT
1020 m=0:RETURN

 ** point d'entrée du programme **
 
1030 PV$="CONSTATATION       ":GOSUB 190:z=40961:GOSUB 50:z=36467:GOSUB 50:GOSUB 960:
     FOR T=1 TO 10:LOCATE#1,1,21:PRINT#1,CHR$(211);:LOCATE#1,39,20:PRINT#1,CHR$(209);:NEXT
1040 LOCATE#1,2,11:PRINT#1,"Sur les lieux, nous avons decouvert":
     LOCATE#1,2,12:PRINT#1,"les objets suivants :":
     INPUT#7,b$:b$=UPPER$(b$)
1050 IF INSTR(b$," FIL")>0 THEN OG=1		- FIL NOIR
1060 IF INSTR(b$,"PIST")>0 OR INSTR(b$,"DOUI")>0 THEN DO=1	- PISTOLET / DOUILLE
1070 IF INSTR(b$,"BOUT")>0 THEN BO=1		- BOUTON
1080 IF INSTR(b$,"ROTH")>0 THEN RO=1		- ROTHMANS
1090 IF INSTR(b$,"LETT")>0 OR INSTR(b$,"ECRI")>0 THEN EC=1	- LETTRE / ECRIT
1100 PV$="  AUDITION         ":RETURN

 ** impression de tous les DATA **

1110 FOR n=1 TO M:READ A$:GOSUB 830:NEXT:RETURN

** comparaison ** DONE

1120 CLS#3:LOCATE#3,2,2:INPUT#3,"COMPARAISON DES ELEMENTS CONNUS AVEC QUI ";b$:b$=UPPER$(b$)
1130 IF INSTR(b$,"FEUI")>0 AND NA=1 THEN 1370		- LAFEUILLE	<- inutile
1140 IF INSTR(b$,"ART")>0 AND MA=1 THEN 1370		- MARTIN	<- inutile
1150 IF INSTR(b$,"UPL")>0 AND DU=1 THEN 1370		- DUPLAT	<- inutile
1160 IF INSTR(b$,"ELA")>0 AND DE=1 THEN 1370		- DELARUE	<- inutile
1170 IF INSTR(b$,"ABD")>0 AND ME=1 THEN 1370		- ABDOULAH	<- inutile
1180 IF INSTR(b$,"ELR")>0 AND HU=1 THEN 1370		- DELROCHE	<- inutile
1190 IF INSTR(b$,"KO")>0 AND KO=1 THEN 1370		- KOWALSKI	<- inutile
1200 IF INSTR(b$,"ZI")>0 AND ZI=1 THEN CLS#3:GOTO 1240	- ZIEGLER
1210 IF INSTR(b$,"GIL")>0 AND GI=1 THEN CLS#3:GOTO 1270	- GILLES BLANC
1220 IF INSTR(b$,"IPPE")>0 AND PH=1 THEN CLS#3:GOTO 1310	- PHILIPPE BLANC
1230 GOTO 1370

	-- ZIEGLER

1240 IF NA=1 THEN LOCATE#3,2,2:PRINT#3,"Vera CRUZ avait peur de lui (Le manouche)"
1250 IF MA=1 OR P1=1 THEN LOCATE#3,2,3:PRINT#3,"Phil correspond a Philibert"
1260 IF MA=0 AND NA=0 AND P1=0 THEN 1370:ELSE 1380

	-- GILLES BLANC
	
1270 IF RO=1 THEN LOCATE#3,2,2:PRINT#3,"Il fume des Rothmans"
1280 IF du=1 THEN LOCATE#3,2,3:PRINT#3,"Il est formellement reconnu par Mm DUPLAT comme etant le brun a moustaches"
1290 IF GR=1 THEN LOCATE#3,2,4:PRINT#3,"Son ecriture correspond a celle de l'ecrit"
1300 IF du=0 AND ro=0 AND gr=0 THEN 1370:ELSE 1380

	-- PHILIPPE BLANC

1310 tot=0:IF OG=1 THEN tot=tot+1:LOCATE#3,2,2:PRINT#3,"Le fil noir correspond a sa chemise dechiree au niveau de la boutonniere"
1320 IF bo=1 THEN tot=tot+1:LOCATE#3,2,3:PRINT#3,"Le bouton correspond a ceux de sa chemise dont l'un a ete arrache"
1330 IF do=1 THEN tot=tot+1:LOCATE#3,2,1:PRINT#3,"Il possede des cartouches 9mm du meme lot que la douille"
1340 IF ar=1 THEN tot=tot+1:LOCATE#3,2,4:PRINT#3,"Il a effectue son service Militaire au 92 RI a CLERMONT-FERRAND 63"
1350 IF tot>2 THEN ga=1
1360 IF tot=0 THEN 1370:ELSE 1380

1370 CLS#3:LOCATE#3,2,2:PRINT#3,"SANS INTERET"
1380 LOCATE#3,72,4:PRINT#3,"SUITE ";CHR$(154);CHR$(243):CALL &HBB18:GOSUB 190:GOTO 110

** examen ** DONE

	B$ = réponse
		AUTOPSIE VERA CRUZ
		GRAPHOLOGIE GILLES BLANC

1390 CLS#3:LOCATE#3,2,2:INPUT#3,"QUEL EXAMEN ";b$:b$=UPPER$(b$)
1400 IF INSTR(b$,"UTO")>0 AND INSTR(b$,"ERA")>0 THEN 1420
1410 IF INSTR(b$,"GRAP")>0 AND EC=1 THEN 1430:ELSE 1370
1420 CLS#3:LOCATE#3,30,1:PRINT#3,"RESULTAT D'AUTOPSIE":LOCATE#3,2,2:PRINT#3,"La mort de Vera CRUZ est due a la perforation du poumon gauche et du coeur par":LOCATE#3,2,3:PRINT#3,"un projectile de gros calibre tire a bout touchant.":GOTO 1380
1430 CLS#3:LOCATE#3,2,2:INPUT#3,"L'ECRITURE DE QUELLE PERSONNE ";b$:CLS#3:b$=UPPER$(b$)
1440 IF INSTR(b$,"GIL")>0 AND GI=1 THEN gr=1:LOCATE#3,2,2:PRINT#3,"L'ecriture de BLANC Gilles correspond a celle de l'ecrit":GOTO 1380
1450 IF INSTR(b$,"ERA")>0 THEN LOCATE#3,2,2:PRINT#3,"L'ecriture de Vera CRUZ ne correspond pas a celle de l'ecrit":GOTO 1380::ELSE 1370

** accusation ** DONE
	B$ = personne
	
1460 CLS#3:LOCATE#3,2,2:INPUT#3,"QUELLE PERSONNE SOUPCONNEZ-VOUS ";b$:b$=UPPER$(b$)
1470 IF INSTR(b$,"IPPE")>0 AND ga=1 AND PH1=1 THEN 1490
1480 CLS#3:LOCATE#3,2,2:PRINT#3,"IL VOUS MANQUE DES ELEMENTS POUR APPUYER VOS SOUPCONS":LOCATE#3,2,3:PRINT#3,"UNE ERREUR JUDICIAIRE SERAIT INADMISSIBLE":GOTO 1380
1490 CLS#3:LOCATE#3,2,1:PRINT#3,"BRAVO ! C'EST EFFECTIVEMENT BLANC PHILIPPE QUI A FROIDEMENT ASSASSINE VERA."
1500 LOCATE#3,2,2:PRINT#3,"VOTRE ACHARNEMENT A DENOUER CETTE INTRIGUE MERITE MES FELICITATIONS - J'ESPERE":LOCATE#3,2,3:PRINT#3,"QUE CETTE ENQUETE VOUS AURA DONNE L'ENVIE D'EN MENER D'AUTRES. A BIENTOT...":LOCATE#3,50,4:PRINT#3,"Gilles BLANCON":GOTO 1380

** donnees **
          
1510 DATA SEAT 1234 AA 75
          DUPOND JEAN
          15 RUE MINANTE
          PARIS 75
1520 DATA BMW 9111 CD 69
          BLANC PHILIPPE
          32 PL DES TERREAUX
          LYON 69
1530 DATA ABDOULAH HOCINE
          CONDAMNE LE 3.1.80 A 2 ANS PRISON
          POUR TRAFIC DE DROGUE.
1540 DATA ZIEGLER PHILIBERT
          CONDAMNE LE 9.9.82 A 2 ANS PRISON
          POUR DETENTION ARME 4EME CAT. ET
          COUPS ET BLESSURES VOLONTAIRES (A
          FF TRAITEE PAR GIE ST-GALMIER 42)
          A ETE INCARCERE PRIS ST-PAUL LYON
1550 DATA KOWALSKI STANISLAS
          JAMAIS CONDAMNE. A ETE SOUPCONNE
          POUR CAMBRIOLAGES EN 1983 (AFF TR
          AITEE PAR GIE MONTBRISON 42).
1560 DATA LAFEUILLE Nadine
          nee le 1.2.56 a VALENCE (26)
          demeurant 2 rue Balay a ST-ETIENNE.
          
          --Je suis une amie d'enfance de Vera
          CRUZ.Je l'ai rencontree la veille de
          son deces. Elle m'a dit qu'elle en sa
          vait trop sur une sale affaire et a-
          vait peur d'un certain 'manouche'.
1580 DATA PISTOLET MAC 50 No G56743 VOLE LE
          11.1.85 DANS ARMURERIE CASERNE 92
          RI CLERMONT-FERRAND 63 AVEC LOT D
          E MUNITIONS 9MM TE9F3-79(AFF TRAI
          TEE PAR GIE CLERMONT).
1590 DATA DANS AFF. VOL PA MAC 50 No G56743
          ENQUETE INFRUCTUEUSE. UN VEHICULE
          BMW EN 69 AVAIT ETE VU SUR PLACE
          SANS AUTRE PRECISION. EN RAISON
          CONNAISSANCE DES LIEUX AUTEUR PRO
          BABLEMENT ANCIEN MILITAIRE AU 92.
1600 DATA BLANC GILLES
          CONDAMNE EN 1981 A 2 ANS PRISON P
          OUR RECEL DE BIJOUX VOLES. SOUPCO
          NNE D'AVOIR PARTICIPE A DEUX BRAQ
          UAGES DE BANQUES.(AFF TRAITEE PAR
          CIAT LYON)
1610 DATA BLANC PHILIPPE
          JAMAIS CONDAMNE. VOIR BDRJ - FAIT
          L'OBJET D'UNE FICHE DE RECHERCHES
1620 DATA DANS AFF RECEL DE BIJOUX COMMIS P
          AR BLANC GILLES LE 22.O6.81 IL A
          ETE DEMONTRE QUE L'INTERESSE NE S
          'OCCUPE QUE DE BIJOUX QU'IL ECOUL
          AIT EN SUISSE GRACE A UNE FILIERE
          QUI N'A PU ETRE DEMANTELEE. L'UN
          DES PASSEURS SERAIT SURNOMME STAN
          SANS AUTRE PRECISION. ILS TRAVAIL
          LERAIENT TOUJOURS ENSEMBLE.
1640 DATA KOWALSKI STANISLAS A ETE APPREHEN
          DE PAR NOTRE UNITE LE 30.02.83 SU
          ITE A UN CAMBRIOLAGE DANS RESIDEN
          CE PRINCIPALE.A ETE RELACHE FAUTE
           DE PREUVE. S'ETAIT SEPARE DES BIJ
          OUX VOLES AVANT SON ARRESTATION.
          SEMBLE NE S'INTERESSER QU'AUX BIJ
          OUX DE VALEUR. CONSIDERE COMME UN
          TRES BON PERCEUR DE COFFRES DANS
          LE MILIEU LYONNAIS.
1660 DATA DUPLAT Simone - nee le 21.4.51 a ST-
          ETIENNE - concierge de la residence
          du Forez rue Bergson a ST-ETIENNE 42.
          
          --le 5.10.85 je suis rentree chez moi
          vers 23h00 environ. Dans le hall j'ai
          croise 2 hommes qui descendaient les
          escaliers en courant et qui sont mon-
          tes dans une BMW dont les premiers
          chiffres sont 9111.
          --L'un des hommes etait brun et por-
          tait une moustache epaisse. J'ai mal
          vu le second.
1680 DATA MARTIN Nestor - ne le 30.2.37 a LYON
          demeurant residence du Forez - rue
          bergson a ST-ETIENNE.
          
          --Je suis le voisin de palier de Mlle
          CRUZ que je connaissais peu. Le 5.10
          85 vers 22H30 j'ai entendu un claque-
          ment venant de son appartement mais
          sur le moment je n'ai pas realise qu'
          il s'agissait d'un coup de feu.
          --Je me souviens avoir entendu pronon
          cer le diminutif Phil.
1700 DATA DELROCHE Hubert - ne le 21.4.30 a
          LYON - bijoutier - demeurant Place
          du peuple a ST-ETIENNE.
          
          --J'ai frequente Mlle Vera assez assi
          dument mais depuis l'assassinat de ma
          femme je ne l'ai pas revue.
          --Personnellement j'ai ete braque
          le 2.10.85 par 3 hommes dont l'un a
          abattu ma femme qui tentait d'appeler
          a l'aide. Les malfaiteurs ont pris la
          fuite. C'est le commissariat de ST-
          ETIENNE qui s'occupe de cela.
1720 DATA AFF.HOLD-UP BIJOUTERIE DELROCHE N
          ON SOLUTIONNEE A CE JOUR. MEURTRI
          ER MM DELROCHE REPOND AU SURNOM D
          E PHIL.IL A ETE RETROUVE UNE DOUI
          LLE 9 MM MARQUEE TE 9 F 3-79. MAL
          FAITEURS MASQUES ONT PRIS LA FUIT
          E A BORD VEHICULE BMW.LES AUTEURS
          ETAIENT TRES BIEN INFORMES SUR LA
          BIJOUTERIE.
1740 DATA ZIEGLER Philibert - ne le 17.8.59
          a LYON - Demeurant 5 pl carnot a
          ST-ETIENNE - sans profession.
          
          --Je connaissais Vera qui etait une
          amie. Je savais qu'elle se livrait a
          la prostitution mais elle n'a jamais
          ete ma protegee meme si de temps en
          temps elle me donnait un peu d'argent
          --Je ne sais rien sur sa mort et je
          n'ai rien d'autre a declarer.
1760 DATA ABDOULAH Hocine - ne le 23.4.55 a
          MEKNES (maroc) - sans domicile fixe
          ni profession.
          
          --Je reconnais que je fournissais un
          peu d'heroine a Vera mais si vous ou
          bliez ca je peux peut-etre vous ren-
          seigner.
          --Elle faisait le tapin pour un nomme
          ZIEGLER Philibert que l'on n'a pas re
          vu depuis la mort de Vera. Parait qu'
          il a peur de se faire descendre par
          un nomme BLANC. J'en sais pas plus.
1780 DATA LE 8.6.82 NOTRE UNITE A ARRETE LE
          NOMME ZIEGLER PHILIBERT QUI AVAIT
          ROSSE UN CLIENT D'UNE PROSTITUEE
          NOMMEE EVA DELARUE QUI N'AURAIT
          PAS VOULU PAYER. FAUTE DE PREUVES
          SUFFISANTES ZIEGLER N'A PU ETRE
          INCULPE DE PROXENETISME.
1790 DATA DELARUE Eva - nee le 23.1.57 a PARIS
          sans profession - demeurant
          110 cours Fauriel a ST-ETIENNE
          
          --Vera ne s'est pas suicidee.
          --Dans le milieu j'ai entendu dire qu
          elle en savait trop sur un braquage.
          Et comme elle avait un bijoutier dans
          ses habitues; un Mr DELROCHE Hubert
          de ST-ETIENNE et que celui-ci a ete
          braque dernierement.A vous d'en tirer
          les conclusions.
1810 DATA DELARUE EVA
1820 DATA PROSTITUEE NOTOIRE PLUSIEURS FOIS
          APPREHENDEE POUR RACOLLAGE SUR LA
          VOIE PUBLIQUE.N'A JAMAIS DONNE LE
          NOM DE SON PROXENETE.
1830 DATA CRUZ VERA
1840 DATA BLANC PHILIPPE
          NE LE 21.7.62 A CLERMONT (63)
          
          RECHERCHE POUR TENTATIVE D'HOMICI
          DE SUR BRIGADIER LEROUX LE 12.04.
          84 A PARIS. (AFF TRAITEE PAR CIAT
          PARIS).INDIVIDUS TRES DANGEREUX.
1850 DATA LE 12.4.84 AU COURS D'UN CONTROLE
          NOCTURNE LE BRIGADIER LEROUX EST
          GRIEVEMENT BLESSE PAR UN AUTOMO-
          BILISTE QUI LUI A FONCE DESSUS EN
          PRENANT LA FUITE. IL A ETE ETABLI
          AVEC CERTITUDE QU'IL S'AGIT DU NO
          MME BLANC PHILIPPE - RECHERCHE.
1860 DATA DURANT SON INCARCERATION ZIEGLER
          PHILIBERT A EU POUR COMPAGNONS DE
          CELLULES LES NOMMES LERAT GEORGES
          PUIS BLANC GILLES.
          ADRESSE DECLAREE A LA LIBERATION
          PLACE CARNOT A ST-ETIENNE.
1870 DATA BLANC Gilles - ne le 2.11.60 a
          LYON (69) - sans domicile fixe
          
          --Je ne suis pour rien dans cette af-
          faire. Je n'ai jamais mis les pieds
          dans l'immeuble de Vera CRUZ et je n
          'ai pas de BMW.
          --D'ailleurs le 5.10.85 j'ai passe la
          soiree a jouer aux cartes chez un ami
          KOWALSKI Stanislas qui habite 310 bis
          cours E.Zola a VILLEURBANNE 69.
          --Je n'ai rien d'autre a declarer.
1890 DATA BLANC Philippe - ne le 21.7.62 a
          CLERMONT-FERRAND 63 - demeurant 32
          pl des terreaux a LYON 69.
          
          --Je n'ai rien a voir avec la mort de
          Vera CRUZ. Je ne la connais meme pas.
          De toute facon je ne declarerai rien
          tant que vous n'aurez pas plus d'el-
          lements.
1910 DATA KOWALSKI Stanislas - ne le 14.12.52
          a VARSOVIE (Pol) - demeurant 310 bis
          cours E.Zola a VILLEURBANNE 69.
          
          --J'affirme que je ne suis pour rien
          dans la mort de Vera CRUZ que je ne
          connaissais d'ailleurs pas.
          --Le 5.10.85 j'ai joue aux cartes a
          mon domicile toute la soiree avec mon
          ami BLANC Gilles.
1930 DATA KOWALSKI Stanislas
          
          --Puisque vous avez arrete Philippe
          je reconnais que j'ai participe au
          braquage de la bijouterie DELROCHE en
          compagnie des freres BLANC mais c'est
          Philippe qui a tire. Je ne sais rien
          sur la mort de Vera sinon que les fre
          res BLANC sont alles chez elle le 5.
          10.85. J'ignore ce qui s'est passe la
          -bas. C'est Gilles qui m'a demande de
          lui fournir un alibi.
1950 DATA ZIEGLER Philibert
          --Je reconnais avoir ete le souteneur
          de Vera. Celle-ci avait eu des rensei
          gnements sur la bijouterie DELROCHE
          grace a des confidences d'oreiller et
          m'en avait parle. Connaissant BLANC
          Gilles je lui ai propose le coup mais
          Je n'ai pas participe au braquage et
          celui-ci a mal tourne lorsque Philip-
          pe a tue Mm DELROCHE.Lorsque Vera l'a
          appris elle m'a telephone en me mena-
          cant de tout raconter aux flics.J'ai
          donc averti Gilles mais je ne sais
          pas ce qui s'est passe chez elle.
1980 DATA BLANC Gilles
          
          --Je reconnais que j'ai participe au
          braquage de la bijouterie DELROCHE
          mais je ne sais pas qui a tire; pas
          moi en tout cas. J'etais avec mon fre
          re Philippe et KOWALSKI Stanislas.
          --Lorsque Manouche m'a dit que Vera
          voulait moucharder aux flics; je suis
          alle chez elle avec mon frere pour la
          raisonner. Elle a ete tres comprehen-
          sive et lorsque nous sommes partis
          elle etait encore vivante. A mon avis
          elle s'est suicidee.
2000 DATA BLANC philippe
          
          --C'est bien moi qui ai tire sur la
          bijoutiere avec le MAC 50 que j'avais
          vole au 92 RI. Lorsque mon frere m'a
          dit que Vera voulait nous donner nous
          sommes alles chez elle. Gilles ne vou
          lait que lui faire peur mais j'ai
          prefere l'eliminer. J'ai tire a bout
          touchant. Elle s'est accrochee a ma
          chemise;la dechirant. Gilles a alors
          eu l'idee de maquiller cela en suici-
          de.Il a donc ecrit la lettre et j'ai
          abondonne l'arme sur place.

2020 RESUME
2030 RETURN
	# BASIC ORIC FILE.
	# NAME: RETOUR
	#
	0 TRUECONT CALL 
	0 num TO PLAY ro28*juin1985
	0 
	0 CAHIERDESAS
	0 -------------------------------------------------------------
	0 W OR DRACE
	1303 
	17209 ,#423B:CALL #86F5
	30 TEXT:HIMEM #4569:DOKE998,9985:POKE #26A,10:GOSUB 24000
	35 HIRES:POKE 618,10:PRINT:PRINT SPC(11)"ATTENDEZ S.V.P":CH=4000
	40 FOR N=1 TO PEEK(#305):ZZ=RND(1):NEXT 
	43 A$="1031141221242713182310291430271214232927102110272718311427103023141427"
SALLE, P+N	50 POKE #BFFF,11:FOR N=#480 TO #4FF:POKE N,0:NEXT 
C+xxx	51 POKE #4A8,10:POKE #4A5,18:POKE #4A3,10:POKE #4A6,22:POKE #4A7,9
	60 GOSUB 8000:WW=100
P+N	70 FOR N=#483 TO #488:POKE N,1:NEXT 
P+$C	75 POKE #48C,1
	99 CALL #96C9
fgTIM P+$11	100 POKE #4BF,1:IF PEEK(#491)=1 THEN 140
P,3	101 SA=PEEK(#BFFF):IF SA=23 AND PEEK(#483)=1 THEN 130
P,4	102 IF SA=14 AND PEEK(#484)=1 THEN 130
P,5	104 IF SA=20 AND PEEK(#485)=1 THEN 130
P,6	106 IF SA=29 AND PEEK(#486)=1 THEN 130
P,7	108 IF SA=38 AND PEEK(#487)=1 THEN 130
	110 GOTO 200
	130 HIRES:A$="La salle n'est pas eclairee.":X=12:Y=190:GOSUB 30000:GOTO 500
	140 HIRES:PRINT "Vos yeux ne voient plus rien.":GOTO 500
	200 HIRES:INK 0:CALL #9292:CALL #9245
cadre	205 A=PEEK(#400):GOSUB 12000+A*10
	206 IF PP=0 AND SA=11 THEN PP=1:GOSUB 4920
	210 A$="":IF SA<21 THEN A$="1":GOTO 270
	220 IF SA<26 THEN A$="3":GOTO 270
	230 IF SA<31 THEN A$="0":GOTO 270
	240 IF SA<52 THEN A$="2":GOTO 270
	270 IF A$="" THEN 300
	280 A$="NIVEAU: "+A$:FOR N=1 TO 9:CURSET 6+6*N,190,0:CHAR ASC(MID$(A$,N,1)),0,1:NEXT 
	300 H=0:N=1
O,N	310 IF PEEK(#4C0+N)<>SA THEN 400
	320 IF H=1 THEN 350
--	325 POKE #4BF,0:WAIT 50:CLS
	330 PRINT "Il y a aussi ";:H=1
	350 PRINT ", ";O$(N);:WAIT 100
	400 N=N+1:IF N<=O THEN 310
	450 IF H=1 THEN PRINT:WAIT 100
fgTIME	500 POKE #4BF,0
	505 SA=PEEK(#BFFF):IF SA<>51 AND SA<>48 AND SA<>22 AND SA<>4 AND SA<>17 THEN 3500
C,3	510 A=PEEK(#4A3):POKE #4A3,A-1:IF A=1 THEN 4820
	520 GOTO 3500
$269	530 POKE #4BF,1:IF PEEK(617)<>0 THEN PRINT 				; CURS_X in the ORIC firmware
	531 X$=KEY$:K=S(1)/5:IF K<.5 THEN K=.5
>0 & <9	532 FOR N=#BFB3 TO #BFB7:IF PEEK(N)<58 AND PEEK(N)>47 THEN POKE N,32
: -> ' '	533 NEXT:IF PEEK(#BFB5)=58 THEN POKE #BFB5,32
	552 PRINT CHR$(27)"P"CHR$(27)"FOrdre:"CHR$(27)"C";:X$=""			; the ESCape character
	553 A$=KEY$:CH=CH-K:WW=WW-K:IF A$=CHR$(13) THEN 579
	554 IF A$<>"" THEN AA=ASC(A$) ELSE AA=33
	555 IF AA<32 THEN 553
	556 IF A$=CHR$(127) AND X$<>"" THEN 558
	557 IF A$=CHR$(127) THEN 553 ELSE 564
	558 XX=LEN(X$):IF XX=1 THEN X$="":GOTO 560
	559 X$=LEFT$(X$,XX-1)
CURS_X	560 IF PEEK(617)<>2 THEN 563
	561 PRINT CHR$(8)CHR$(8)CHR$(8)" "CHR$(8);:GOTO 553
	563 PRINT CHR$(8)" "CHR$(8);:GOTO 553
	564 IF LEN(X$)=26 THEN 553 ELSE X$=X$+A$
	565 IF WW<0 THEN WW=WW+100:MUSIC 1,3,5,7:PLAY 1,0,0,0:WAIT 8:PLAY 0,0,0,0
	566 IF CH<0 THEN CH=0:PRINT:GOSUB 4630:WAIT 200:GOTO 18000
00:00	568 IF DEEK(#4FB)=12336 AND DEEK(#4FE)=12336 THEN 4650
	578 PRINT A$;:GOTO 553
	579 IF X$="" THEN CLS:PRINT " Tres drole...":WAIT 50:GOTO 530
	580 PRINT FRE(""):CLS:PRINT X$:GOSUB 6000
	581 IF X1$="AVAN" THEN X1$=X2$:X2$=""
	585 L=LEN(X1$):FOR N=1 TO 4:IF N<=L THEN POKE #BFDF+N,ASC(MID$(X1$,N,1))
	590 IF N>L THEN POKE #BFDF+N,32
	600 NEXT:POKE #BFE5,0:CALL #9500
	610 IF PEEK(#BFE5)=0 THEN CLS:PRINT "JE NE COMPRENDS PAS '";X1$"'":GOTO 3500
1st char	615 K=PEEK(#BFE5):POKE #80,K
2nd char	620 IF X2$="" THEN POKE #81,0:GOTO 900
	630 L=LEN(X2$):FOR N=1 TO 4:IF N<=L THEN POKE #BFDF+N,ASC(MID$(X2$,N,1))
	640 IF N>L THEN POKE #BFDF+N,32
	650 NEXT:POKE #BFE5,0:CALL #9500
char index	660 IF PEEK(#BFE5)=0 THEN CLS:PRINT "JE NE COMPRENDS PAS '";X2$"'":GOTO 3500
	665 K=PEEK(#BFE5):POKE #81,K
direction	900 IF PEEK(#80)>9 THEN 1000
salle	910 Z=1:SA=PEEK(#BFFF):T=PEEK(#80):MO$=MID$(STR$(T),2,1)
	920 T$=MID$(M$(SA),Z,1):IF T$="0" THEN 1000
	940 IF T$<>MO$ THEN 970 ELSE SA=VAL(MID$(M$(SA),Z+1,2)):POKE #BFFF,SA:GOTO 100
	970 Z=Z+3:GOTO 920
	1000 POKE #BFF0,10:CALL #9533
	1010 IF PEEK(#BFF0)<>0 THEN 1700
	1020 PRINT "IMPOSSIBLE ";
	1030 IF PEEK(#80)<9 THEN PRINT "DE PRENDRE CETTE DIRECTION" ELSE PRINT 
	1040 GOTO 500
	1700 E$="":N=#BFE0:E=1
	1705 E$=E$+CHR$(PEEK(N)):N=N+1:IF PEEK(N-1)<>255 THEN 1705
	1710 LI=ASC(MID$(E$,E,1))-65
	1720 IF LI=190 THEN 1740
	1730 N=VAL(MID$(E$,E+1,2))
	1740 BR=0:GOSUB 1800+LI*100
	1760 IF BR<>0 THEN GOTO BR
	1780 E=E+3:GOTO 1710
fgTIME	1800 POKE #4BF,0:G=0:HH=0:BR=500:CLS
	1810 G=G+1
O+G	1820 IF PEEK(#4C0+G)=255 THEN 1840
	1830 IF G<O THEN 1810 ELSE 1870
	1840 IF HH=0 THEN PRINT "Vous avez en votre possession ";:WAIT 50:HH=1
	1860 PRINT ", "O$(G);:WAIT 100
	1865 IF G<O THEN 1810
	1870 IF HH=1 THEN PRINT ".":RETURN 
	1880 PRINT "Vous ne devez pas etre fatigue,vous n'avez rien sur vous":WAIT 33:RETURN 
O+N	1900 IF PEEK(#4C0+N)<>255 THEN 1960
fgTIME	1940 POKE #4BF,0:CLS:PRINT CHR$(27)"R"CHR$(27)"@Vous avez deja cela...etourdi!"
	1950 WAIT 150:BR=500:RETURN 
	1960 POKE #4C0+N,255:S(1)=S(1)+1:RETURN 
O+N	2000 IF PEEK(#4C0+N)=255 THEN 2030
fgTIME	2010 POKE #4BF,0:CLS:PRINT CHR$(27)"T Je ne savais pas qu'on pouvait poser"
	2020 PRINT CHR$(27)"T ce qu'on ne possede pas..."
	2025 BR=500:RETURN 
SALLE, O+N	2030 SA=PEEK(#BFFF):POKE #4C0+N,SA:S(1)=S(1)-1:RETURN 
fgTIME	2100 POKE #4BF,0:CLS:GOSUB 4000+N*10:WAIT 200:RETURN 
P+N	2200 POKE #480+N,1:RETURN 
P+N	2300 POKE #480+N,0:RETURN 
	2400 C=VAL(MID$(E$,E+3,2)):E=E+2:POKE #4A0+N,C:RETURN 
O+N	2500 POKE #4C0+N,0:RETURN 
SALLE	2600 POKE #BFFF,N:RETURN 
	2700 PRINT "D'ACCORD"
	2710 WAIT 35:BR=500:RETURN 
	2800 BR=500:RETURN 
	2900 BR=530:RETURN 
	3000 BR=100:RETURN 
I'm dead	3100 POP:WAIT 30:GOTO 18000
O+N,SA	3200 SA=PEEK(#BFFF):POKE #4C0+N,SA:RETURN 
P+1	3500 IF PEEK(#BFFF)=11 THEN POKE #481,1
P+1	3502 IF PEEK(#BFFF)=19 THEN POKE #481,0
P+2	3504 IF PEEK(#BFFF)<>36 OR PEEK(#482)=1 THEN 3510
O+D, P+2	3506 IF PEEK(#4CD)=255 THEN WAIT 100:GOSUB 4010:POKE #482,1:GOTO 3510 
	3508 WAIT 100:GOTO 4020
O+4	3510 IF PEEK(#4C4)<>255 THEN 3516
C+8	3512 A=PEEK(#4A8)-1:POKE #4A8,A
C+8	3514 IF PEEK(#4A8)=0 THEN 4740
C+1	3516 IF PEEK(#4A1)=0 THEN 3534
C+1	3518 A=PEEK(#4A1)-1:POKE #4A1,A
	3520 IF A>0 THEN 3534
C+3	3522 IF PEEK(#4C3)=255 THEN 4750
C+3	3524 IF PEEK(#4C3)<>51 THEN 4760
	3526 A=PEEK(#BFFF):IF A=51 THEN 4750
C+4	3528 IF PEEK(#4C4)<>51 AND PEEK(#4D3)<>51 THEN 4780
	3530 IF A=46 OR A=49 THEN 4770
P+$C, P+$10	3532 POKE #48C,0:GOSUB 4790:POKE #490,1:GOTO 3540
P+$E	3534 IF PEEK(#48E)=0 THEN 3537
C+2	3535 A=PEEK(#4A2)-1:POKE #4A2,A:IF A>0 THEN 3540
P+$E	3536 POKE #48E,0
P+$C..$D	3537 IF DEEK(#48C)>0 THEN 3540
SALLE	3538 IF PEEK(#BFFF)=50 THEN 3540 ELSE 4800
P+$10	3540 IF PEEK(#490)=0 THEN 3544
C+5	3542 A=PEEK(#4A5)-1:POKE #4A5,A:IF A=1 THEN 4810
C+6	3544 IF PEEK(#4A6)=0 THEN 3548
C+6	3546 A=PEEK(#4A6)-1:POKE #4A6,A:IF A=0 THEN GOSUB 4830:POKE #488,0
P+8	3548 IF PEEK(#488)=1 THEN 3552
C+7	3550 A=PEEK(#4A7)-1:POKE #4A7,A:IF A=0 THEN GOSUB 4580:GOTO 18E3
C+4	3552 IF PEEK(#4A4)=0 THEN 3556
C+4	3554 A=PEEK(#4A4)-1:POKE #4A4,A:IF A=1 THEN 4840
	3556 GOTO 530
	4010 PRINT "Une boule d'acier tombee du plafond"
	4011 PRINT "vient de s'ecraser sur votre casque.":RETURN 
	4020 PRINT "Une boule d'acier vient de tomber du"
	4021 PRINT "plafond,vous avez le crane defonce...":GOTO 18000
	4030 PRINT "Vous venez de tomber dans une flaque  d'acide,ca crepite...":RETURN 
	4040 PRINT "Vous venez de rentrer dans le reacteuratomique du vaisseau..!":RETURN 
	4050 PRINT "La porte ne veut pas s'ouvrir":RETURN 
	4060 PRINT "Un peu de memoire...comment etes-vous entre ?":RETURN 
	4070 PRINT "Je ne vous savais pas assez muscle    pour soulever une tonne.":RETURN 
	4080 PRINT "Vous avez raison,la vue c'est la vie!":RETURN 
	4090 PRINT "Les gants etaient radioactifs,vous    perdez la vue.":RETURN 
	4100 PRINT "Vous l'avez deja sur vous.":RETURN 
	4110 PRINT "Impossible,je ne vois pas ceci ici.":RETURN 
	4120 PRINT "Vous vous arrachez la tete en tombant des echasses.":RETURN 
	4130 PRINT "Des monstres sortis des containers    vous devorent tout cru!":RETURN 
	4140 PRINT "L'air frais vous fait du bien. Dommageque l'helice vous ait coupe la ";
	4141 PRINT "tete.":RETURN 
	4150 PRINT "Qu'est ce que vous voulez boire ???":RETURN 
	4160 PRINT "Ah oui...l'eau est bonne.":RETURN 
	4170 PRINT "Il n'y a pas d'eau ici.":RETURN 
	4180 PRINT "L'eau etait contaminee par les boites radioactives.":RETURN 
	4190 PRINT "Vous retrecissez..petit..petit..et unearaignee vous mange!":RETURN 
	4200 PRINT "Ca coupe une tronconneuse,comme le    prouve votre tete au sol.":RETURN 
	4210 PRINT "Vous glissez et tombez dans la flaque.L'acide crepite.":RETURN 
	4220 PRINT "Il n'y a pas ici de porte verrouillee";:RETURN 
	4230 EXPLODE:WAIT 10:EXPLODE:PRINT "En secouant le tube pour l'ouvrir,la"
	4232 PRINT "la nitroglycerine a explose.":RETURN 
	4240 PRINT "Pourquoi ouvrir un robinet qui ne     ferme pas!":RETURN 
	4250 PRINT "Le robinet ne se ferme pas.":RETURN 
SALLE	4260 POKE #BFFF,57:HIRES:INK 0:CALL #9292:POKE #BFFF,44:RETURN 
	4270 PRINT "La bibliotheque n'a pas de porte...":RETURN 
	4280 PRINT "Il n'y a rien de mieux sur les autres pages.":RETURN 
	4290 PRINT "...c'est toi J.R qui a pris ma femme  et mon petrole , tu es infame."
	4291 RETURN 
	4300 PRINT "Collection Arlepin,tout un reve":PRINT "d'evasion.":RETURN 
	4310 PRINT "...et c'est moi Genius le grand qui   crea un superbe manoir...":RETURN 
	4320 A$="10311412212427131823102914302712142329271021102727183114271030231414"
	4321 A$=A$+"27142324303114212114":PRINT A$" <tapez une touche>";:GET K$:RETURN 
	4330 PRINT "Vous l'avez deja fait.":RETURN 
	4340 EXPLODE:PRINT "Le laser vient d'exploser.":RETURN 
	4350 PRINT "Il ne se passe rien.":RETURN 
	4360 PRINT "Le sas s'ouvre,vous passez dans la    salle a cote.":RETURN 
	4370 PRINT "Cela agit sur un contacteur a infra-  rouge qui commande l'eclairage."
	4371 RETURN 
	4380 PRINT "Allons enfants de la patrie...":RETURN 
	4390 PRINT "Vous entendez: 'Le laser ouvrira la   porte'":RETURN 
	4400 PRINT "Les lunettes sont trop fortes , vous  voyez trouble.":RETURN 
	4410 PRINT "La salle est radioactive.":RETURN 
	4420 PRINT "Vous avez quelque chose pour ?":RETURN 
	4430 PRINT "C'est votre probleme, mais le temps   passe.":RETURN 
	4440 PRINT "Avez-vous si sommeil que ca ?":RETURN 
	4450 PRINT "Et puis quoi encore !":RETURN 
	4460 PRINT "Faites un plan...":RETURN 
	4470 PRINT "Vous entendez le ronronnement des     moteurs.":RETURN 
	4480 GOSUB 5500:IF A$="N" THEN 500
	4481 PRINT "J'etais sur que vous etiez un lache.":GOTO 19E3
	4490 PRINT "Vous passez la tete a travers un sas,"
	4491 PRINT "et appuyez sur le bouton de fermeture":RETURN 
	4500 PRINT "Quel bouton ?":RETURN 
	4510 PRINT "Les boutons ne fonctionnent pas car"
	4511 PRINT "l'ordinateur central les controle.":RETURN 
	4520 PRINT "Le systeme automatique est deregle,il"
	4521 PRINT "met du gaz carbonique a la place de   l'oxygene.";:RETURN 
	4530 PRINT "Vous respirez un grand coup.":RETURN 
	4540 PRINT "Que voulez-vous respirer,il n'y a plusd'oxygene.":RETURN 
	4550 HIRES:POKE #BFFF,56:INK 0:CALL #9292:GOSUB 12020:POKE #BFFF,21
	4551 A$="Vous avez deux essais pour":X=43:Y=21:GOSUB 3E4
	4552 A$="entrer le mot de passe.":X=43:Y=29:GOSUB 3E4
	4553 INPUT "Mot de passe ";MO$:IF MO$="MANOIR" THEN 4558 ELSE PRINT "FAUX!"
	4554 INPUT "Mot de passe ";MO$:IF MO$="MANOIR" THEN 4558
	4556 PRINT "Encore rate.L'ordinateur vous";:EXPLODE:PRINT "  explosea la figure."
	4557 WAIT 100:GOTO 18E3
	4558 A$="Exact,vous etes perspicace!":X=43:Y=42:GOSUB 3E4:A$="UIN LOI QRU ILD "
	4559 A$=A$+"ESP ECU TAS":X=43:Y=56:GOSUB 3E4:A$="ASU VIE RAL HOU MEA":GOTO 4655
	4560 PRINT "C'est d'accord.":RETURN 
	4570 PRINT "Il etait temps,vous alliez mourir.":RETURN 
	4580 PRINT "Vous mourrez deshydrate.":RETURN 
	4590 GOSUB 5500:IF A$="N" THEN 500
	4591 PRINT "Appuyez sur 'S' quand vous etes pres.":SA=PEEK(#BFFF):POKE #4FA,SA
	4592 GET A$:IF A$<>"S" THEN 4592
force	4593 CALL #96FC:POKE #400,96:POKE #4F9,S(1):DOKE#4F7,CH
password	4594 FOR I=1 TO 5:POKE #479+I,ASC(MID$(MP$,I,1)):NEXT 
	4595 CSAVE"MEMOIRE",A#400,E#4FF,AUTO
	4596 RUN 
	4600 GOSUB 5500:IF A$="N" THEN 500
	4601 PRINT "Appuyez sur 'L' quand vous etes pres."
	4602 GET A$:IF A$<>"L" THEN 4602
	4603 CALL #96FC
	4604 DOKE#BFEA,DEEK(#9C):CLOAD"MEMOIRE":DOKE#9C,DEEK(#BFEA)
SALLE, CH	4605 SA=PEEK(#4FA):POKE #BFFF,SA:CH=DEEK(#4F7):S(1)=PEEK(#4F9)
	4606 MP$="":FOR N=#47A TO #47E:MP$=MP$+CHR$(PEEK(N)):NEXT:CALL #90F9
	4607 GOTO 100
	4610 TEXT:PAPER 4:INK 2:PRINT "Le sas se referme derriere vous ,"
	4611 PRINT:PRINT "le tableau de controle s'allume et"
	4612 PRINT:PRINT "l'ordinateur de bord vous demande le"
	4613 PRINT:PRINT "mot de passe pour le retour ?"
	4614 PRINT:PRINT:PRINT:INPUT "MOT DE PASSE";MO$:IF MO$=MP$ THEN 20000
	4615 POKE #26A,10::PRINT:PRINT:PRINT "Le vaisseau de secour s'eloigne , au"
	4616 PRINT "loin vous voyez Genius qui pleure"
	4617 PRINT "derriere un hublot":ZAP:ZAP:PRINT:PRINT SPC(10)"VOUS AVEZ GAGNE":WAIT 999
	4618 PRINT:PRINT "Mais , que se passe-t-il,vous avez du"
	4619 PRINT "vous tromper de mot de passe,votre":GOTO 16000
	4620 EXPLODE:PRINT "La soucoupe a explose au decollage.":RETURN 
	4630 PRINT "Energie restante :";INT(CH*10+.5)/100:RETURN 
	4640 PRINT "Petit drole...Le chronometre est":PRINT "affhche en permanence":RETURN 
	4650 PRINT:PRINT "Le temps que vous aviez pour votre    ";
	4651 PRINT "mission est ecoule,vous avez echoue.":GOTO 19000
	4655 A$=A$+" NOI THE":X=43:Y=67:GOSUB 3E4
	4656 A$="Le mot de passe pour le":X=43:Y=80:GOSUB 3E4:A$="retour est : "+MP$
	4657 X=43:Y=88:GOSUB 3E4:RETURN 
	4660 PRINT "Votre trajectoire est bonne,potrquoi  la corriger >":RETURN 
	4670 PRINT "Le mur au nnrd coulisse,vous avancez  dans cette salle.":RETURN 
	4680 PRINT "Quel livre ?":RETURN 
	4690 PRINT "au dos du boitier est marque :":PRINT SPC(8)"'PROTEGEZ MOI'":RETURN 
	4700 PRINT "Vous remarquez un boitier de":PRINT "radiocommande.":RETURN 
	4710 SA=PEEK(#BFFF):POKE #BFFF,54:HIRES:INK 0:CALL #9292:POKE #BFFF,SA:RETURN 
	4720 POKE #BFFF,55:HIRES:INK 0:CALL #9292:POKE #BFFF,50:RETURN 
	4730 PRINT "Que regardez vous ?":RETURN 
	4740 EXPLODE:WAIT 5:EXPLODE:PRINT "Le tube de nitroglycerine vient"
	4742 PRINT "d'exploser,vous etes pulverise.":WAIT 200:GOTO 18E3
	4750 EXPLODE:WAIT 5:EXPLODE:PRINT "La bombe a retardement vient":GOTO 4742
	4760 EXPLODE:WAIT 5:EXPLODE:PRINT "La bombe a retardement a explose,elle"
	4762 PRINT "a endommage le systeme de chauffage , vous etes carbonise";:GOTO 18E3
	4770 EXPLODE:WAIT 5:EXPLODE:PRINT "La bombe a explose,vous etiez trop"
	4772 PRINT "pres et etes devenu fou...":GOTO 18E3
	4780 EXPLODE:WAIT 5:EXPLODE:PRINT "La bombe a retardement n'etait pas"
	4782 PRINT "assez forte,l'ordinateur central n'est";
	4784 PRINT "qu'endommage,il vous fait exploser...";:GOTO 18E3
	4790 EXPLODE:WAIT 15:EXPLODE:PRINT "Bravo! L'ordinateur central est"
	4792 PRINT "detruit,mais le systeme d'oxygenation"
	4794 PRINT "ne fonctionne plus,de plus la";:WAIT 300
	4796 PRINT:PRINT "trajectoire du vaisseau a change.";:WAIT 250:RETURN 
	4800 PRINT "Vous n'avez plus de souffle,vous etes mort asphyxie.":WAIT 200:GOTO 18E3
	4810 PRINT "Vous auriez du corriger la trajectoirevous avez percute le soleil."
	4812 WAIT 200:GOTO 18E3
	4820 PRINT "A force de traverser les salles radio-";
	4822 PRINT "actives,vous etes mort contamine.":WAIT 200:GOTO 18E3
	4830 PRINT "Il fait de plus en plus chaud...";:RETURN 
	4840 EXPLODE:PRINT "L'ordinateur vient d'exploser!"
	4845 PRINT "Vous avez du le laisser allume.":WAIT 150:GOTO 18E3
	4850 PRINT "Comment !!! Vous etes aveugle.":RETURN 
	4860 PRINT "Vous n'aviez pas pris la radiocommande";
	4861 PRINT "qui a explose quand le vaisseau a per-";
	4862 PRINT "cute le soleil,son explosion a declen";:WAIT 250
	4863 PRINT "-che la fin du monde.";:RETURN 
	4870 IF S(1)=0 THEN PRINT "Non! pas de strip-tease.":RETURN 
	4871 SA=PEEK(#BFFF)
	4872 IF PEEK(#4CD)=255 THEN POKE #4CC,255:POKE #4CD,0
	4873 FOR N=#4C1 TO #4D3:IF PEEK(N)=255 THEN POKE N,SA
	4874 NEXT:S(1)=0:PRINT "Vous avez pose tout ce que vous":PRINT "transportiez.":RETURN 
	4880 PRINT "Ca ne se demande pas.":RETURN 
	4890 PRINT "Il y a effectivement un ordinateur    parmi le tableau de controle."
	4891 PRINT "L'ordinateur n'est pas en fonction.";:RETURN 
	4900 PRINT "Sur le laser,vous voyez trois boutons:jaune , rouge et bleu.":RETURN 
	4910 PRINT "Vous etes entre dans le desintegrateurde particules..."
	4911 PLAY 1,0,0,0:FOR N=300 TO 50 STEP -5:SOUND 1,N,10:NEXT:PLAY 0,0,0,0:RETURN 
	4920 PRINT "Vous etes entre dans le vaisseau par  ";
	4922 PRINT "le sas a l'ouest qui ne s'ouvre pas de";
	4924 PRINT "l'interieur.";:WAIT 200:RETURN 
	5500 PRINT "Etes-vous sur (O/N) ?"
	5510 GET A$:IF A$<>"O" AND A$<>"N" THEN 5510
	5520 RETURN 
	6000 N=0:GN=0:L=0:X1$="":X2$="":K1=LEN(X$)
	6010 REPEAT:N=N+1:UNTIL MID$(X$,N,1)=" " OR N=K1
	6015 K=N:IF K>4 THEN K=4
	6020 X1$=MID$(X$,1,K):IF N=K1 THEN RETURN 
	6030 REPEAT:GN=GN+1:UNTIL MID$(X$,N+1+GN,1)=" " OR GN+N=K1
	6040 K=GN:IF K>4 THEN K=4
	6050 X2$=MID$(X$,N+1,K):IF GN+N=K1 THEN RETURN 
	6060 IF X2$<>"BOUT" AND X2$<>"LIVR" AND X2$<>"DANS" THEN RETURN 
	6070 REPEAT:L=L+1:UNTIL GN+N+L=K1 OR L=4
	6090 X2$=MID$(X$,GN+N+2,L):RETURN 
	8000 RESTORE 
	8010 DIM M$(53):FOR N=1 TO 53:READ M$(N):NEXT 
	8020 DATA 2023030,3044010,1012043190,1022054030,3064045380,1054070,2063164080
	8030 DATA 2073090,1082133104110,1090,1182093170,3136270,1124090,3150,1144160
	8040 DATA 1072150,1110,0,1032203180,4190,3230,2234250,1213244220,1230,2226490
	8050 DATA 1270,3264285120,2274290,2284300,2290,2403320,1312443330,1323490
	8060 DATA 1414430,2363430,1372484350,1383360,1392473374456050,3384400,2394310
	8070 DATA 3340,1502430,1352344420,4320,2380,0,3484380,1474360,1333505250
	8080 DATA 1493420,3460,0,2290
	8100 O=19:DIM O$(O):FOR N=1 TO O:READ O$(N):READ A:POKE (#4C0+N),A:NEXT 
	8110 DATA "UN PISTOLET LASER",40,"DES GANTS ENSANGLANTES",33
	8120 DATA "UNE BOMBE A RETARDEMENT",41,"UN TUBE",53,"UNE GLACIERE",43
	8130 DATA "UNE BOITE VIDE",10,"UNE BOITE PLEINE D'EAU",0,"UN VAPORISATEUR",21
	8140 DATA "UN MAGNETOPHONE",22,"UN COMPTEUR GEIGER",26,"UN VENTILATEUR",1
	8150 DATA "UN CASQUE",6,"UN CASQUE ENFILE",0,"DES ECHASSES",17,"DES CONTAINERS"
	8160 DATA 20,"UNE RADIOCOMMANDE",00,"DES LUNETTES DE SOLEIL",47
	8170 DATA "UNE TRONCONNEUSE",19,"LA GLACIERE AVEC LE TUBE A L'INTERIEUR",0
	8180 A=INT(RND(1)*5+1):FOR N=1 TO A:READ MP$:NEXT 
	8190 DATA ORIC1,ATMOS,GENIE,ECHEC,ARGON
	8200 IF A=5 THEN 8500
	8210 FOR N=A TO 4:READ A$:NEXT 
	8500 FOR N=1 TO 57:READ A$:A=VAL("#"+A$):DOKE#3FF+N*2,A:NEXT 
	8530 DATA 786F,7974,4F61,4E95,7CC8,6BDC,5EFA,7DE2,7F38,62EF,57EA,5925,63F6
	8540 DATA 47C3,5A21,5021,4DFF,64EF,4700,5D77,52CA,4E41,6AF2,81EA,827B,61DF
	8550 DATA 497F,4C16,4A8D,4CEE,5B40,6FDD,6F05,65FF,8088,7A40,774C,7B63,5CC6
	8560 DATA 5BEE,50F6,6D58,6C6E,74D2,70F6,487A,71E0,4DAB,55C8,72CA,6958,0000
	8570 DATA 5F6B,60EB,6812,6E33,8367
	12000 RETURN 
	12010 FOR N=0 TO 13:CURSET 111+N*2,93,1:NEXT:FOR N=0 TO 16:CURSET 108+N*2,95,1:NEXT 
	12015 CURSET 96,93,0:FILL 3,1,1:INK 6:RETURN 
	12020 A=-10:FOR N=0 TO 9:CURSET 40+N*17,129,1:DRAW A,11,1:DRAW 12,0,1:A=A+1
	12022 DRAW -A,-11,1:DRAW -11,0,1:A=A+1:NEXT:A=-11
	12024 FOR N=0 TO 8:CURSET 30+N*21,146,1:DRAW INT(A),13,1:DRAW 14,0,1:A=A+1.20
	12026 DRAW -INT(A),-13,1:DRAW -13,0,1:A=A+1.20:NEXT:INK 6:RETURN 
	16000 PRINT "vaisseau de poche fonce sur le soleil,"
	16010 WAIT 600:PRINT "Vous venez de realiser que Genius":WAIT 300
	16020 PRINT "pleurait de JOIE...!":WAIT 200:GOTO 18000
	18000 CALL #96FC:WAIT 200:TEXT:CLS:POKE #26A,10:INK 3
	18003 POKE #30E,64:PING:PLAY 0,0,0,0:POKE #30E,192
	18005 CLS:PRINT:PRINT "Comme je le pensais , vous vous etes"
	18010 PRINT:PRINT "stupidement fait avoir , et votre"
	18020 PRINT:PRINT "cadavre (ou ce qu'il en reste) repo-"
	18030 PRINT:PRINT "sera a jamais dans l'espace..."
	18500 AD=#8520:FOR N=1 TO 70:A1=PEEK(AD):A2=PEEK(AD+1):A3=PEEK(AD+2):A4=PEEK(AD+3)
	18510 A5=PEEK(AD+4):A6=PEEK(AD+5):MUSIC 1,A1,A2,VO:MUSIC 2,A3,A4,VO
	18520 PLAY A5,0,0,0:WAIT A6:AD=AD+6:NEXT:PLAY 0,0,0,0
	19000 WAIT 300:TEXT:POKE 618,10:PRINT:PRINT CHR$(4):CLS
	19005 PRINT:PRINT CHR$(27)"P"CHR$(27)"C";CHR$(27)"J";
	19010 PRINT "  Voulez-vous rejouer (O ou N) ?"
	19020 A=4:B=2:D=0:REPEAT:PLOT 3,3,A:PLOT 3,4,B:C=A:A=B:B=C:D=D+1
	19030 X$=KEY$:UNTIL X$="N" OR X$="O" OR D=300
	19040 IF X$="O" THEN RUN 
	19050 IF X$="N" THEN PRINT:PRINT CHR$(4):PRINT "   Merci d'avoir essaye...!":END
	19060 PRINT CHR$(4):CLS:PING:PRINT:PRINT:PRINT "  Reveillez-vous , c'est fini !":GOTO 19000
	20000 WAIT 200:TEXT:CLS:POKE #26A,10:INK 6:PRINT:PRINT:PRINT "   D'accord,"
	20010 PRINT "vous m'avez battu, mais c'est un coup"
	20020 PRINT "de chance, et la prochaine fois ma"
	20030 PRINT "vengeance sera terrible."
	20040 PRINT "Prenez peur , car le jour ou je serais";
	20050 PRINT "a nouveau la, ma puissance n'aura plus";
	20060 PRINT "de limites, alors l'heure de la souf-"
	20070 PRINT "france aura sonne..."
	20080 PRINT:PRINT:PRINT SPC(20)" Dr GENIUS."
	20100 WAIT 100:GOSUB 20500:GOTO 19E3
	20500 AD=#9100:FOR N=0 TO 48:A1=PEEK(AD):AD=AD+1:IF A1=0 THEN PLAY 4,0,0,0:NEXT 
	20510 A2=PEEK(AD):A3=PEEK(AD+1):A4=PEEK(AD+2):A5=PEEK(AD+3):A6=PEEK(AD+4)
	20520 A7=PEEK(AD+5):MUSIC 1,A1,A2,VO:MUSIC 2,A3,A4,VO:MUSIC 3,A5,A6,VO
	20530 PLAY A7,0,0,0:WAIT 12:AD=AD+6:NEXT:WAIT 12:PLAY 0,0,0,0:RETURN 
	24000 CLS:PAPER 0:INK 6:PRINT:PRINT:PRINT CHR$(4)
	24010 A$=CHR$(27)+"P"+CHR$(27)+"A"+CHR$(27)+"J"
	24020 PRINT:PRINT:PRINT:PRINT:PRINT A$;"     LE RETOUR DU Dr GENIUS"
	24040 FOR I=1 TO 7:PRINT CHR$(4):NEXT:PRINT "     Vous avez 20 minutes , et"
	24050 PRINT "     400 unites de force pour"
	24060 PRINT "     remplir votre mission..."
	24080 PLOT 7,25,"APPUYEZ SUR UNE TOUCHE":X$=KEY$
	24090 A=1:B=2:REPEAT:PLOT 5,7,A:PLOT 5,8,B:C=A:A=B:B=C:WAIT 5:UNTIL KEY$<>""
	24100 CLS:PRINT:PRINT:PRINT:POKE 618,10
	24105 PRINT SPC(5);CHR$(4)CHR$(27)"JVOLUME (1 a 5) :";
	24110 GET A$:IF PEEK(#35)<49 OR PEEK(#35)>53 THEN PING:GOTO 24100
	24120 PRINT A$:PRINT CHR$(4):A=VAL(A$):VO=A*2:WAIT 100:RETURN 
	30000 FOR N=1 TO LEN(A$):CURSET X+6*N-6,Y,0:CHAR ASC(MID$(A$,N,1)),0,1:NEXT:RETURN 
	
0  ONERR  GOTO 10000
1  POKE 791,32: REM  ENABLE RESET TRAP
3  REM  MENU1
5  REM  MOPTOWN 1 MENU, COPYRIGHT 1982, LESLIE GRIMM
10 B$ = "FIRST VARIABLE ASSIGNED": REM  FOR CHARACTER GENERATOR
12 YY = 16777:XX = 16778:CC = 16779:WM = 16779: REM  LINE, COLUMN, COLOR, WHICH MOPPET
14 LG = 16384:SG = 16387:MG = 16390: REM  LARGE, SMALL, AND MOPPET GENERATORS
20 SOUND = 771:YES = 48:NO = 32: REM  IN MUSICRESETMOVESHAPE
22  POKE 32,0: POKE 33,40: POKE 34,20: POKE 35,24: REM  RESET TEXT WINDOW
31 B$(1) = "1 " +  CHR$ (114) + "EPRODUIS MON " +  CHR$ (106) + "UMEAU"
32 B$(2) = "2 " +  CHR$ (113) + "UI EST " +  CHR$ (100) + "IFFERENT ?"
33 B$(3) = "3 " +  CHR$ (113) + "UELLE EST LA " +  CHR$ (114) + "ESSEMBLANCE ?"
34 B$(4) = "4 " +  CHR$ (114) + "EPRESENTE MON " +  CHR$ (99) + "ONTRAIRE"
35 B$(5) = "5 " +  CHR$ (113) + "UI VIENT " +  CHR$ (101) + "NSUITE ?"
36 B$(6) = "6 " +  CHR$ (112) + "ARADE DES " +  CHR$ (109) + "ARIONNETTES"
37 B$(7) = "7 " +  CHR$ (99) + "LUB DES " +  CHR$ (109) + "ARIONNETTES"
38 B$(8) = "8 " +  CHR$ (115) + "ON "
39 B$(9) = "9 " +  CHR$ (102) + CHR$ (105) + CHR$(110): REM END
41 NA$(1) = "REPRODUIS MON JUMEAU"
42 NA$(2) = "QUI EST DIFFERENT"
43 NA$(3) = "QUELLE EST LA RESSEMBLANCE"
44 NA$(4) = "REPRESENTE MON CONTRAIRE"
45 NA$(5) = "QUI VIENT ENSUITE"
46 NA$(6) = "PARADE DES MARIONNETTES"
47 NA$(7) = "CLUB DES MARIONNETTES"
50  POKE  - 16368,0: GOTO 1000
200  REM  ** PRINTER **
210  POKE XX,X: POKE YY,Y: POKE CC,C: CALL LG: REM  LARGE CHARACTERS
212  RETURN 
220  POKE XX,X: POKE YY,Y: POKE WM,M: CALL MG: REM  MOPPETS
222  RETURN 
230  POKE XX,X: POKE YY,Y: POKE CC,C: CALL SG: REM  SMALL CHARACTERS
232  RETURN 
400  REM  ** MUSIC FOR MENU **
402 SF = 0
410  IF  PEEK (SOUND) = (NO) THEN  POKE SOUND,YES:SF = 1: REM  SOUND FLAG
420  POKE 768,N: POKE 769,T: CALL 770: RETURN 
430 T1 = 10:T2 = 20:T3 = 40: IF MUSIC = YES THEN 440
434 N = 96:T = T1: GOSUB 400:N = 85:T = T1: GOSUB 420:N = 76:T = T1: GOSUB 420
436  IF SF = 1 THEN SF = 0: POKE SOUND,NO
438  RETURN 
440 N = 76:T = T1: GOSUB 400:N = 85:T = T1: GOSUB 420:N = 96:T = T1: GOSUB 420
442  IF SF = 1 THEN SF = 0: POKE SOUND,NO
444  RETURN 
448  RETURN 
500  REM  ** PRINT TITLES **
510 X = 2:Y = 48:C = 3:XS = X
512  FOR I = 1 TO 7:B$ = B$(I): GOSUB 230
514 Y = Y + 16
516  NEXT I
518 B$ = B$(8):C = 1:X = 2:Y = 172: GOSUB 200:YS = Y
520 B$ = B$(9):Y = Y + 16:C = 6: GOSUB 210
522 B$ =  CHR$ (102) + "AIS TON CHOIX :":X = 2:Y = 26:C = 0: GOSUB 200
523  HCOLOR= 3: HPLOT 14,10 TO 237,10
524  HCOLOR= 1: HPLOT 1,0 TO 279,0 TO 279,191 TO 1,191 TO 1,0: HPLOT 3,1 TO 277,1 TO 277,190 TO 3,190 TO 3,1
530 X = XS + 12:Y = YS: IF  PEEK (SOUND) = (NO) THEN 540
532 B$ = CHR$(109) + CHR$(97) + CHR$(114):C = 0: GOSUB 210
534 B$ = "/" + CHR$(97) + CHR$(114) + CHR$(114):C = 3:X = X + 6: GOSUB 210
536  RETURN 
540 B$ = CHR$(109) + CHR$(97) + CHR$(114) + "/":C = 3: GOSUB 210
542 B$ = CHR$(97) + CHR$(114) + CHR$(114):C = 0:X = X + 8: GOSUB 210
544  RETURN 
900  REM  ** SLOT FINDER **
910 NS = 0: FOR I = 7 TO 1 STEP  - 1
920 SLOTADDRESS = 49153 + 256 * I
930  IF  PEEK (SL) = 32 THEN  IF  PEEK (SL + 2) = 0 THEN  IF  PEEK (SL + 4) = 3 THEN  IF  PEEK (SL + 6) = 60 THEN NS = I
940  NEXT I: RETURN 
1000  REM  ** MAIN PROGRAM **
1010  HGR : POKE  - 16302,0: REM  FULL SCREEN GRAPHICS
1012  GOSUB 500
1020  POKE  - 16368,0: GET IN$
1022  IF IN$ = "9" THEN 1500: REM END
1024  IF IN$ = "8" THEN 1050: REM CHANGE SOUND  
1030 IN =  VAL (IN$): IF IN < 1 OR IN > 7 THEN 1020
1032  GOTO 1100: REM  LOAD PROGRAM
1050  REM   ** TOGGLE SOUND **
1052 MUSIC =  PEEK (SOUND): IF MUSIC = YES THEN  POKE SOUND,NO
1054  IF MUSIC = (NO) THEN  POKE SOUND,YES
1056  GOSUB 530: GOSUB 430
1058  GOTO 1020
1100  HOME : POKE 34,20: HOME 
1102  HCOLOR= 0: FOR I = 146 TO 160: HPLOT 0,I TO 279,I: NEXT 
1106  POKE  - 16301,0
1110  FLASH : PRINT "CHARGEMENT";: NORMAL : PRINT " : ";NA$(IN)
1120  PRINT : HTAB 2: PRINT "<ESC> POUR ARRETER UN JEU,": HTAB 2: PRINT "'?' TE MONTRERA LES INSTRUCTIONS.";
1130  VTAB 1: PRINT 
1140  POKE 791,2: PRINT  CHR$ (4);"RUN";NA$(IN)
1500  REM  ** END OF PROGRAM **
1510  TEXT : HOME : POKE 32,5: VTAB 8
1512  PRINT "POUR FINIR, INSERE UN AUTRE DISQUE,"
1514  PRINT : PRINT "PUIS APPUIE SUR <ESC>."
1520  VTAB 18: PRINT "POUR RETOURNER AUX JEUX,"
1522  PRINT : PRINT "APPUIE SUR <RETURN>. ";
1530  GET IN$: IF IN$ =  CHR$ (27) THEN 1550
1532  IF IN$ <  >  CHR$ (13) THEN 1530
1534  TEXT : HOME : POKE  - 16302,0: POKE  - 16304,0: GOTO 1020
1550  GOSUB 900: REM  FIND SLOT 
1560  TEXT : HOME : PRINT : POKE 791,2: PRINT  CHR$ (4);"PR#";NS
10000  REM  ** ERROR ROUTINE **
10010  CALL 37632

10 D$ =  CHR$ (4): PRINT D$"PR#3"
20  PRINT D$"BLOAD DHGR.TO.SHGR"
30  PRINT D$"PREFIX": INPUT P$
40  HOME 
50  PRINT "Sprite dhgr to shgr                                      (c) 1992 Hellfire club"
60  PRINT "_______________________________________________________________________________"
70  PRINT : PRINT 
80  PRINT "Prefixe: ";P$
90  PRINT : PRINT "1- Mettre un nouveau pr{fixe"
100  PRINT : PRINT "2- Convertir un sprite"
110  PRINT : PRINT "3- Quitter le programme"
120  VTAB 13: HTAB 1: PRINT "Votre choix ";
130  INPUT "";A$
140  IF A$ = "" THEN 120
150 A =  VAL (A$)
160  IF A = 3 THEN  END 
170  IF A > 3 THEN 120
180  ON A GOTO 200,300
190  REM 
Pr{fixe

200  VTAB 15: HTAB 1: INPUT "Pr{fixe: /";A$
210  IF A$ = "" THEN 40
220  ONERR  GOTO 250
230  PRINT D$"PREFIX";"/";A$
240 P$ = A$
250  GOTO 40
290  REM 
Conversion

300  HOME 
310  ONERR  GOTO 330
320  PRINT D$"CATALOG"
330  INPUT "Nom: SP.";A$
340  IF A$ = "" THEN 300
350  IF A$ = "Q" THEN 40
360  PRINT D$"BLOAD SP.";A$;",A$2000"
370  CALL 4096
380  PRINT D$"BSAVE SS.";A$;",A$3000,L128"
390  GOTO 300
490  REM 
500  REM   (c) Hellfire club
510  REM   by Deckard & LoGo
520  REM    Happy new year!
530  REM 

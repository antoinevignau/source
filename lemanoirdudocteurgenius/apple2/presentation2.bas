1 REM
2 REM COPYRIGHT LORICIELS 83 L.BENES
3 REM  LE MANOIR DU DOCTEUR GENIUS 
4 REM VERSION APPLE II REALISEE EN 2023
5 REM PAR BRUTAL DELUXE SOFTWARE : ANTOINE VIGNAU & OLIVIER ZARDINI

6 HOME: TEXT: NORMAL: HTAB 4: VTAB 12: PRINT "LORICIELS EST FIER DE PRESENTER :"
7 PRINT CHR$(4)"BLOAD AMPERSAND,A$1800": CALL 6144: REM $1800
8 HOME
9 REM ... COPYRIGHT LORICIELS TOUT      DROIT DE REPRODUCTION INTERDIT .....

10 HTAB  3: VTAB  1: PRINT "@   @@@   @   @ @@@ @  @ @@@ @ @@@"
11 HTAB  3: VTAB  2: PRINT "@   @     @@ @@ @ @ @@ @ @ @ @ @ @"
12 HTAB  3: VTAB  3: PRINT "@   @@    @ @ @ @@@ @@@@ @ @ @ @@@"
13 HTAB  3: VTAB  4: PRINT "@   @     @   @ @ @ @ @@ @ @ @ @@"
14 HTAB  3: VTAB  5: PRINT "@@@ @@@   @   @ @ @ @  @ @@@ @ @ @"

15 HTAB  6: VTAB  7: PRINT "@@  @ @     @@"
16 HTAB  6: VTAB  8: PRINT "@ @ @ @     @ @ @"
17 HTAB  6: VTAB  9: PRINT "@ @ @ @     @ @ @@"
18 HTAB  6: VTAB 10: PRINT "@ @ @ @     @ @ @ @"
19 HTAB  6: VTAB 11: PRINT "@@@ @@@     @@@ @"

20 HTAB  3: VTAB 14: PRINT "@@@@  @@@@  @@  @  @  @  @  @@@@"
21 HTAB  3: VTAB 15: PRINT "@  @  @     @@  @  @  @  @  @"
22 HTAB  3: VTAB 16: PRINT "@     @     @@@ @  @  @  @  @"
23 HTAB  3: VTAB 17: PRINT "@     @@@   @ @ @  @  @  @  @@@@"
24 HTAB  3: VTAB 18: PRINT "@ @@  @     @ @@@  @  @  @     @"
25 HTAB  3: VTAB 19: PRINT "@  @  @     @  @@  @  @  @     @"
26 HTAB  3: VTAB 20: PRINT "@@@@  @@@@  @  @@  @  @@@@  @@@@ @ @"

30 HTAB  6: VTAB 22: PRINT "     VERSION APPLE II PAR     ": & W 1000
31 HTAB  6: VTAB 22: PRINT "    BRUTAL DELUXE SOFTWARE    ": & W 1000
32 HTAB  6: VTAB 22: PRINT "        MERCI FRED_72         ": & W 1000
33 HTAB  6: VTAB 22: PRINT "(C) 1983, L. BENES & LORICIELS"
34 GOSUB 31000: GOSUB 51000

40 HOME: PRINT: PRINT: PRINT: PRINT
41 PRINT "   La liste des instructions  (O/N) ?"
42 GET V$
43 IF V$="O" THEN 50
44 IF V$="N" THEN 60
45 GOTO 42

50 HOME: PRINT: PRINT "Vous voici arrive dans le manoir du             Dr Genius..."
51 & W 350: PRINT: PRINT "Pour converser avec l'ordinateur,il   faut rentrer les ordres"
52 & W 300: PRINT: PRINT "en 1 ou 2 mots tels que:": PRINT: & W 200: PRINT "     NORD"
53 & W 200: PRINT: PRINT "     PRENDS PILLULE"
54 & W 200: PRINT: PRINT "ou pour commencer:";: & W 150: PRINT "ENTRE"
55 & W 300: PRINT: PRINT: PRINT "Si vous voulez faire durer la phrase  decrivant";
56 PRINT " la salle taper une touche": & W 400
57 PRINT: PRINT: PRINT: PRINT: PRINT "        pressez une touche": GET X$

58 HOME: PRINT: PRINT "  Un dernier conseil:";: & W 200: PRINT "Il peut parfois": PRINT
59 PRINT "y avoir une porte derriere vous.": & W 1000

60 HOME: HTAB 12: VTAB 12: FLASH: PRINT "VEUILLEZ PATIENTER": NORMAL
61 POKE 16384,0: POKE 103,1: POKE 104,64: REM $4001
62 PRINT CHR$(4);"RUN JEU"

31000 REM      BADINERIE
31005 RETURN: REM RESTORE
31010 FOR N=1 TO 148:READ Y$,Y$,Y$,Y$,Y$,Y$,Y$:NEXT
31012 READ Y$
31015 FOR N=1 TO 97
31020 READ A1,A2,A3
31022 REM MUSIC1,A1,A2,10:PLAY1,0,0,100:& W  A3
31025 REM PLAY 0,0,0,0:NEXT
31026 NEXT
31030 DATA 4,12,20,5,3,10,4,12,10,4,7,20
31035 DATA 4,12,10,4,7,10,4,3,20,4,7,10
31040 DATA 4,3,10,3,12,40,3,7,10,3,12,10
31045 DATA 4,3,10,3,12,10,4,2,10,3,12,10
31050 DATA 4,2,10,3,12,10,3,11,10,4,2,10
31055 DATA 4,5,10,4,2,10,4,3,20,3,12,20
31060 DATA 4,12,20,5,3,10,4,12,10,4,7,20
31065 DATA 4,12,10,4,7,10,4,3,20,4,7,10
31070 DATA 4,3,10,3,12,40,4,3,20,4,3,20
31075 DATA 4,3,20,4,3,20,4,12,20,4,3,20
31080 DATA 4,3,7,4,5,7,4,3,7
31085 DATA 4,2,20,4,7,20,4,7,20,4,7,20
31090 DATA 4,7,20,5,3,20,4,7,20,4,7,7
31100 DATA 4,8,7,4,7,7,4,6,20,4,2,10
31105 DATA 4,7,10,4,10,10,4,7,10,4,9,10
31115 DATA 4,7,10,4,6,10,4,9,10,4,12,10
31120 DATA 4,9,10,4,10,10,4,9,10,4,10,10
31125 DATA 4,9,10,4,7,10,4,10,10,4,7,10
31130 DATA 4,6,10,4,7,10,4,12,10,4,7,10
31145 DATA 4,6,10,4,7,10,5,2,10,4,7,10
31150 DATA 4,6,10,4,7,10,5,3,10,4,7,10
31155 DATA 4,6,10,4,7,10,5,3,10,5,2,10
31160 DATA 4,12,10,5,2,10,4,10,10,4,9,10
31165 DATA 4,7,10,4,10,10,4,9,7,4,10,7,4,9,7,4,7,20
31170 RETURN

51000 HOME: PRINT: PRINT: PRINT "ATTENTION .................
51005 PRINT: PRINT "L'utilisation de ce programme est"
51010 PRINT: PRINT "deconseillee aux personnes sensibles"
51020 PRINT: PRINT "aux enfants en bas age,ainsi qu'a"
51030 PRINT: PRINT "toute personne susceptible d'avoir"
51040 PRINT: PRINT "des malaises cardiaques."
51050 PRINT: PRINT "Nous ne pourrions etre tenu responsa-"
51060 PRINT: PRINT "bles,des troubles physiques ou mentaux"
51070 PRINT: PRINT "provoques par votre echec dans"
51080 PRINT: PRINT "le Manoir du Dr GENIUS ............."
51099 & W 1000
51100 RETURN
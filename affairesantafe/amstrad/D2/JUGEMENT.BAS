10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!jugement.bin",26051:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,11:INK 3,15:AD=35068:GOSUB 3010:RESTORE 10070:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:po=3:GOSUB 5010:ON t GOTO 10020,10030,10040
10020 ad=26051:GOSUB 3010:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10030 RESTORE 10120:GOSUB 4010:CALL &BB18:ad=28026:GOSUB 3010:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10040 ad=32159:GOSUB 3010:RESTORE 10130:GOSUB 4010:GOSUB 9000
10050 IF chance<>1 OR jugement THEN GOSUB 4010:CALL &BB18:ad=30465:GOSUB 3010:ad=30241:GOSUB 3010:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10060 RESTORE 10160:GOSUB 4010:CALL &BB18:GOSUB 4010:nb=1:jugement=1:cha$="reno":GOTO 2010
10070 DATA"~~~je~me~retrouvais~a~~reno~~~le~juge~~mac~allister~avait~lareputation~~detre~tres~severe"
10080 DATA"~il~ouvrit~la~~seance~de~deux~~~coups~de~maillet~et~fit~la~~~lecture~du~chef~daccusation"
10090 DATA"jetais~tout~simplement~accuse~dassassinat~~et~la~legitime~~defense~netait~pas~reconnue"
10100 DATA"je~plaidais~coupable","je~plaidais~noncoupable","je~tentais~de~fuir"
10110 DATA"~jetais~condamne~aux~travaux~~~~~~forces~a~~perpetuite","je~finissais~au~penitencier~de~~yuma~a~casser~des~cailloux~~~jusqua~la~fin~~de~mes~jours"
10120 DATA"jetais~condamne~a~~etre~pendu","je~terminais~mon~aventure~avec~~~une~corde~~autour~du~cou"
10130 DATA"~~~je~me~jettais~~par~lune~~~~~~des~fenetres~du~tribunal"
10140 DATA"javais~commis~~lerreur~de~me~~~~prendre~pour~un~oiseau"
10150 DATA"la~malchance~etait~toujours~la~je~faisais~une~chute~de~huit~~metres~et~me~~cassais~le~cou"
10160 DATA"~par~miracle~je~reussissais~a~~ne~pas~me~casser~le~cou~dans~ma~chute~et~a~prendre~la~fuite"
10170 DATA"je~me~retrouvais~~dans~la~memesituation~que~lannee~derniere~~~~je~devais~~encore~fuir"

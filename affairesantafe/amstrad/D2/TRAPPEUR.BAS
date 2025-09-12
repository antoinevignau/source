10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!trappeur.bin",25077:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,6:INK 3,15:ad=35740:GOSUB 3010:RESTORE 10150:GOSUB 4010:CALL &BB18:ad=33266:GOSUB 3010:GOSUB 4010
10020 IF argent=1 THEN po=3 ELSE po=2
10030 GOSUB 5010
10040 ON t GOTO 10050,10060,10070
10050 ad=31185:GOSUB 3010:GOSUB 5120:RESTORE 10180:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10060 RESTORE 10200:GOSUB 4010:CALL &BB18:GOSUB 4010:cha$="desert":GOTO 2010
10070 ad=29136:GOSUB 3010:RESTORE 10220:GOSUB 4010:CALL &BB18:GOSUB 4010
10080 a$=INKEY$:IF a$=""THEN temp=100:ad=29057:GOSUB 3010:GOSUB 9110:ad=28978:GOSUB 3010:GOSUB 9110:ad=28899:GOSUB 3010:GOSUB 9110:ad=28820:GOSUB 3010:GOSUB 9110:GOTO 10080
10090 GOSUB 4010:ad=26346:GOSUB 3010
10100 a$=INKEY$:IF a$=""THEN temp=300:ad=25732:GOSUB 3010:GOSUB 9110:ad=25077:GOSUB 3010:GOSUB 9110:GOTO 10100
10110 po=2:GOSUB 5010
10120 ON t GOTO 10130,10140
10130 cha$="cabane":GOTO 2010
10140 RESTORE 10210:GOSUB 4010:cha$="desert":GOTO 2010
10150 DATA"~la~nuit~allait~me~surprendre~~~~sans~que~jai~pu~trouver~~~~~~~~~~~~un~abri~sur"
10160 DATA"soudain~je~me~retrouvais~face~a~un~trappeur~menacant~qui~me~~~~~~~barrait~le~passage"
10170 DATA"je~degainais","je~demandais~lhospitalite","je~proposais~de~largent"
10180 DATA"je~navais~pas~encore~touche~a~mon~arme~lorsque~la~balle~a~~~bison~me~fracassait~la~tete"
10190 DATA"~cest~ainsi~que~je~finissais~ma~vie~de~malchance~en~tachant~~~~~la~neige~de~mon~sang"
10200 DATA"~~il~navait~que~faire~de~ma~~~compagnie~et~je~reprenais~ma~~~~descente~vers~la~vallee"
10210 DATA"jarrivais~dans~la~vallee~deux~~jours~plus~tard~et~prenais~~~~~la~direction~du~mexique"
10220 DATA"~~en~echange~de~cent~dollars~~~~il~acceptait~de~mheberger~~~~~~~~jusquau~printemps"
10230 DATA"~~je~passais~ainsi~lhiver~a~~~~~apprendre~le~dur~travail~~~~~~~~~~~~de~trappeur"
10240 DATA"~au~printemps~je~quittais~mon~~~compagnon~et~reprenais~mon~~~~~~chemin~vers~la~liberte"
10250 DATA"je~passais~le~col","je~preferais~redescendre"

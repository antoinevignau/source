10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!montagne.bin",24375:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 3,11:INK 2,15:ad=34902:GOSUB 3010:RESTORE 10140:GOSUB 4010:CALL &BB18
10020 ad=32325:GOSUB 3010:GOSUB 4010
10030 po=3:AFTER 200 GOSUB 10260:GOSUB 5010
10040 ON t GOTO 10050,10060,10070
10050 ad=29973:GOSUB 3010:RESTORE 10170:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10060 ad=27642:GOSUB 3010:GOSUB 5120:RESTORE 10180:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOTO 10080
10070 RESTORE 10200:GOSUB 4010:CALL &BB18
10080 ad=25889:GOSUB 3010:RESTORE 10210:GOSUB 4010
10090 po=2:RESTORE 10220:GOSUB 5010
10100 ON t GOTO 10110,10130
10110 GOSUB 4010:CALL &BB18
10120 ad=24375:GOSUB 3010:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10130 RESTORE 10250:GOSUB 4010:cha$="trappeur":GOTO 2010
10140 DATA"le~deuxieme~jour~je~commencais~~~~a~progresser~dans~une~~~~~~~~~~~~~neige~epaisse"
10150 DATA"soudain~je~me~~retrouvais~face~~~~~~a~un~puma~menacant"
10160 DATA"jùattendais~sa~reaction","je~tentais~de~lùabattre","je~reculais~prudemment"
10170 DATA"le~puma~me~sautait~dessus~avecune~rapidite~stupefiante~et~me~~~~~dechiquetait~la~gorge","~~~cùest~dans~ces~montagnes~~~~~~~inhospitalieres~que~ce~~~~~~~~terminait~mon~aventure"
10180 DATA"~jùepaulais~ma~~winchester~et~~lùabattais~dùune~seule~balle"
10190 DATA"~~~~apres~lùavoir~depouille~~~~~je~continuais~mon~ascention"
10200 DATA"le~puma~ne~me~quittait~pas~des~~yeux~mais~me~laissait~mùen~~~~~~~aller~tranquillement~
10210 DATA"~~en~cette~periode~le~col~me~~~~~semblait~infranchissable"
10220 DATA"je~tentais~le~passage","je~cherchais~un~refuge"
10230 DATA"~je~continuais~avec~une~neige~~de~plus~en~plus~epaisse~dans~~laquelle~jùusais~~mes~forces"
10240 DATA"apres~mon~cheval~je~succombais~~~~au~froid~et~a~la~faim~~~~~~terminant~ainsi~mon~aventure"
10250 DATA"~je~me~mettais~a~la~recherche~~dùun~refuge~pour~y~attendre~~~~~~~~~~~le~printemps"
10260 a$=CHR$(13):t=1:RETURN

10000 CLS#1:argent=1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!reno.bin",23537:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,11:INK 3,15:AD=33290:GOSUB 3010:RESTORE 10210:GOSUB 4010
10020 CALL &BB18:GOSUB 4010
10030 IF nb=0 THEN RESTORE 10230:po=4:GOSUB 5010:ELSE RESTORE 10230:po=3:GOSUB 5010
10040 ON t GOTO 10050,10060,10070,10080
10050 RESTORE 10270:GOSUB 4010:cha$="desert":GOTO 2010
10060 RESTORE 10280:GOSUB 4010:cha$="montagne":GOTO 2010
10070 RESTORE 10290:GOSUB 4010:cha$="gold":GOTO 2010
10080 ad=29381:GOSUB 3010:RESTORE 10250:GOSUB 4010:nb=1:po=3:GOSUB 5010
10090 ON t GOTO 10110,10110,10100
10100 ad=33290:GOSUB 3010:RESTORE 10240:GOSUB 4010:GOTO 10030
10110 ad=30965:GOSUB 3010:RESTORE 10300:GOSUB 4010:CALL &BB18
10120 IF t=2 THEN 10160
10130 po=2:RESTORE 10310:GOSUB 5010
10140 ON t GOTO 10160,10150
10150 GOSUB 3030:IF (mot(28) AND mot(29)) OR (MOT(2)) OR (MOT(3) AND (MOT(30)OR mot(31))) THEN ad=27018:GOSUB 3010:RESTORE 10320:GOSUB 4010:CALL &BB18:GOTO 10170:ELSE 10130
10160 ad=25247:GOSUB 3010:GOSUB 5120:RESTORE 10330:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10170 RESTORE 10350:GOSUB 4010:po=2:GOSUB 5010
10180 ON t GOTO 10190,10200
10190 ad=25247:GOSUB 3010:GOSUB 5120:RESTORE 10370:GOSUB 4010:CALL &BB18:RESTORE 10340:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10200 ad=23537:GOSUB 3010:RESTORE 10380:GOSUB 4010:CALL &BB18:cha$="jugement":GOTO 2010
10210 DATA "~je~devais~fuir~le~pays~si~je~~~ne~voulais~pas~me~balancer~~~~~~~au~bout~dune~corde"
10220 DATA "~~je~sortais~ma~carte~de~son~~~~~~~etuis~et~letudiais~
10230 DATA "je~me~dirigeais~vers~le~sud","vers~louest","vers~le~nord","vers~lest"
10240 DATA"~~~je~navais~plus~le~choix~~~~il~fallait~fuir~au~plus~vite"
10250 DATA"a~l~est~un~nuage~de~poussiere~~~mindiquait~larrivee~de~~~~~~~~plusieurs~cavaliers"
10260 DATA"javancais~tranquillement","jattendais~colt~au~poing","je~faisais~demitour"
10270 DATA"~~~je~partais~en~direction~~~~~~~~~~~~~~du~mexique"
10280 DATA"~~je~commencais~lascension~~~~~~~des~montagnes~blanches"
10290 DATA"~~~je~partais~en~direction~~~~~~~~~~~~~de~goldcity"
10300 DATA "cetait~le~marshall~de~reno~et~~ses~suppleants~lances~a~ma~~~~~~~~~~~~poursuite"
10310 DATA "je~tentais~de~degainer","jessayais~autre~chose"
10320 DATA "~~~je~levais~les~bras~et~me~~~~~~~~~laissais~desarmer"
10330 DATA "~jarrivais~a~en~etendre~deux~~~avant~de~prendre~une~balle~~~~~~~~en~pleine~poitrine"
10340 DATA"decidement~ma~mere~~ne~mavait~~pas~mis~au~monde~pour~vivre~~~~~et~mourir~dans~louest"
10350 DATA "~le~marshall~me~conduisait~en~~ville~ou~un~juge~mattendait"
10360 DATA "je~prenais~la~fuite","je~me~laissais~conduire"
10370 DATA "javais~oublie~~qua~la~course~cetait~la~balle~qui~gagnait~~~~~~~~devant~le~cheval"
10380 DATA "~~~jattendais~mon~heure~ou~~~~plutot~celle~de~mon~jugement"

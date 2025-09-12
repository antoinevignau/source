10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!gold.bin",20750:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,3:INK 3,15:ad=36326:GOSUB 3010:RESTORE 10210:GOSUB 4010
10020 po=2:GOSUB 5010
10030 ON t GOTO 10090,10040
10040 ad=22942:GOSUB 3010:RESTORE 10230:GOSUB 4010
10050 po=2:RESTORE 10240:GOSUB 5010
10060 ON t GOTO 10090,10070
10070 argent=1:ad=29572:GOSUB 3010:RESTORE 10250:GOSUB 4010:CALL &BB18
10080 RESTORE 10260:GOSUB 4010:GOTO 10170
10090 ad=34290:GOSUB 3010:RESTORE 10300:GOSUB 4010
10100 po=3:RESTORE 10310:GOSUB 5010
10110 ON t GOTO 10120,10130,10160
10120 ad=32305:GOSUB 3010:temp=100:ad=31443:GOSUB 3010:GOSUB 9110:ad=32305:GOSUB 3010:boire=boire+1:IF boire=5 THEN 10200 ELSE 10100
10130 ad=20750:GOSUB 3010:RESTORE 10330:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:po=2:GOSUB 5010:ON t GOTO 10140,10150
10140 GOSUB 5120:GOSUB 5120:ad=25565:GOSUB 3010:RESTORE 10360:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10150 RESTORE 10380:GOSUB 4010:GOTO 10170
10160 ad=27034:GOSUB 3010:RESTORE 10390:GOSUB 4010:CALL &BB18:GOSUB 4010
10170 po=2:RESTORE 10270:GOSUB 5010:ON t GOTO 10180,10190
10180 RESTORE 10280:GOSUB 4010:cha$="sherif":GOTO 2010
10190 RESTORE 10290:GOSUB 4010:cha$="montagne":GOTO 2010
10200 RESTORE 10320:GOSUB 4010:CALL &BB18:GOTO 10170
10210 DATA"~~~~jarrivais~a~goldcity~~~~~~~~a~la~tombee~de~la~nuit"
10220 DATA"jentrais~au~saloon","je~cherchais~une~ecurie"
10230 DATA"je~trouvais~une~vieille~grangeabandonnee~au~bout~de~la~ville~~ou~je~parquais~ma~monture"
10240 DATA"jallais~au~saloon","je~mendormais~dans~un~coin"
10250 DATA"~je~me~couchais~sur~un~tas~de~~~~foin~et~passais~une~nuit~~~~~~~remplie~de~cauchemars"
10260 DATA"~~~au~matin~je~me~reveillais~~~~~neanmoins~en~pleine~forme"
10270 DATA"je~restais~en~ville","je~poursuivais~ma~route"
10280 DATA"~~~je~me~mis~a~la~recherche~~~~~~~~~~~dune~cantine"
10290 DATA"~~jarnachais~mon~cheval~et~~~~~~~~prenais~la~direction~~~~~~~~~~~~~des~montagnes"
10300 DATA"~jentrais~dans~un~saloon~ou~~regnait~une~ambiance~de~tripot"
10310 DATA"je~buvais~un~verre","je~faisais~un~poker","je~montais~avec~une~fille"
10320 DATA"au~matin~je~me~reveillais~dans~une~ruelle~la~tete~lourde~et~~~~~~~~les~poches~vides"
10330 DATA"je~minstallais~a~une~table~de~~ranchers~qui~jouaient~gros"
10340 DATA"~~~je~perdais~regulierement~~~~~~~~il~me~fallait~reagir"
10350 DATA"je~tentais~un~coup","jattendais~ma~chance"
10360 DATA"~ils~connaissaient~le~coup~et~ne~me~laisserent~aucune~chance"
10370 DATA"je~finissais~mon~aventure~sous~~~un~petit~tas~de~terre~au~~~~~~~cimetiere~de~goldcity"
10380 DATA"~~je~me~faisais~completement~~~ratisser~et~au~petit~matin~~~~~~~~jetais~sans~le~sou"
10390 DATA"la~fille~avait~~du~temperament~~~et~me~mis~sur~les~genoux~~~~~~je~succombais~au~sommeil"
10400 DATA"au~matin~je~me~reveillais~dansson~lit~plus~leger~de~quelques~dollars~mais~en~pleine~forme"

10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!sherif.bin",28930:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,11:INK 3,15:AD=35453:GOSUB 3010:RESTORE 10080:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:ad=33461:GOSUB 3010:GOSUB 4010
10020 po=3:GOSUB 5010:ON t GOTO 10030,10050,10060
10030 GOSUB 4010
10040 ad=29063:GOSUB 3010:ad=28930:GOSUB 3010:GOSUB 5120:CALL &BB18:RESTORE 10110:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10050 GOSUB 3030:IF (mot(4) OR MOT(5) OR MOT(8)) AND (mot(6) OR MOT(7)) THEN ad=32709:GOSUB 3010:RESTORE 10120:GOSUB 4010:CALL &BB18:GOSUB 4010:cha$="montagne":GOTO 2010:ELSE 10020
10060 RESTORE 10140:GOSUB 4010:po=2:GOSUB 5010:ON t GOTO 10030,10070
10070 ad=30740:GOSUB 3010:RESTORE 10170:GOSUB 4010:CALL &BB18:cha$="jugement":GOTO 2010
10080 DATA"~je~voyais~~soudain~plusieurs~~~cavaliers~entrant~en~ville","~cetait~le~~marshall~de~reno~~~~et~sa~horde~qui~avait~du~~~~~suivre~ma~trace~~jusquici","~ils~allaient~~me~reconnaitre"
10090 DATA"je~prenais~la~fuite","jessayais~autre~chose","je~ne~bougeais~pas"
10100 DATA"~~~ils~me~~repererent~et~me~~~~~~~~criblerent~~de~plomb"
10110 DATA"~cest~ainsi~que~se~terminait~~mon~periple~~vers~la~liberte~~~~le~nez~dans~la~poussiere"
10120 DATA"ils~passerent~~devant~moi~sansme~reconnaitre~et~continuerent~~~vers~le~bureau~du~sherif"
10130 DATA"jen~profitais~pour~sauter~sur~~~mon~cheval~et~prendre~la~~~~~~direction~des~~montagnes"
10140 DATA"~arrives~a~ma~~hauteur~ils~me~~~reconnurent~~et~braquerent~~leurs~armes~dans~~ma~direction"
10150 DATA"je~degainais","je~me~rendais~sans~resister"
10160 DATA"ils~ne~me~laisserent~~meme~pasle~temps~de~toucher~a~mon~colt"
10170 DATA"ils~me~passerent~des~braceletsaux~poignets~et~me~jeterent~en~~prison~jusqua~~mon~proces"

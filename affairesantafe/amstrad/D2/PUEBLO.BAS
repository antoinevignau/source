10000 CLS#1:eau=0:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD "!pueblo.bin",21343:CALL INITMUS:CALL JOUMUS:INTER=1 
10010 INK 2,11:INK 3,15:ad=35238:GOSUB 3010:RESTORE 10200:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:po=3:GOSUB 5010
10020 ON t GOTO 10060,10030,10120
10030 IF eau=0 THEN 10050 ELSE RESTORE 10260:GOSUB 4010:GOSUB 9000
10040 IF chance THEN RESTORE 10270:GOSUB 4010:cha$="indien":GOTO 2010
10050 ad=21343:GOSUB 3010:RESTORE 10250:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10060 ad=32568:GOSUB 3010:RESTORE 10280:GOSUB 4010
10070 phase=100
10080 a$=INKEY$:IF a$=""THEN temp=phase*2:ad=31808:GOSUB 3010:GOSUB 9110:temp=phase:ad=32190:GOSUB 3010:GOSUB 9110:temp=phase*2:ad=31466:GOSUB 3010:GOSUB 9110:temp=phase:ad=32190:GOSUB 3010:GOSUB 9110:phase=phase-5: ELSE 10120
10090 IF phase<30 THEN CALL &BB18:GOTO 10100:ELSE 10080
10100 GOSUB 4010:po=2:GOSUB 5010:ON t GOTO 10110,10150
10110 ad=23426:GOSUB 3010:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10120 eau=1:ad=28809:GOSUB 3010:RESTORE 10240:GOSUB 4010
10130 a$=INKEY$:IF a$=""THEN temp=100:ad=28115:GOSUB 3010:GOSUB 9110:ad=28463:GOSUB 3010:GOSUB 9110:GOTO 10130
10140 RESTORE 10230:po=2:GOSUB 5010:GOTO 10020
10150 INK 2,6:ad=25989:GOSUB 3010:RESTORE 10320:GOSUB 4010
10160 a$=INKEY$:IF a$=""THEN temp=200:ad=25665:GOSUB 3010:GOSUB 9110:ad=25017:GOSUB 3010:GOSUB 9110:ad=25341:GOSUB 3010:GOSUB 9110:GOTO 10160
10170 GOSUB 4010:po=2:GOSUB 5010:ON t GOTO 10180,10190
10180 cha$="indien":GOTO 2010
10190 cha$="cabane":GOTO 2010
10200 DATA"~~~~~~~enfin~le~mexique~~~~~~~~jentrais~avec~mefiance~dans~~le~premier~~pueblo~rencontre"
10210 DATA"le~village~avait~~lair~desertmais~je~sentais~~une~multitude~~~de~regards~poses~sur~moi"
10220 DATA"~~jhesitais~a~marreter~ici~~~je~sentais~un~danger~obscur~
10230 DATA"je~penetrais~dans~la~cantina","je~passais~mon~chemin","je~faisais~boire~ma~monture"
10240 DATA"~jen~profitais~~pour~remplir~~~ma~gourde~dans~la~fontaine"
10250 DATA"epuise~par~cette~longue~marche~~je~narrivais~pas~jusquau~~~~~~~prochain~point~deau","~les~vautours~~connaissent~le~dicton~le~malheur~des~uns~fait~~~~le~bonheur~~des~autres"
10260 DATA"~~~~je~quittais~~le~pueblo~~~~~~~~sans~perdre~un~instant"
10270 DATA"~~je~continuais~~vers~le~sud"
10280 DATA"~je~mangeais~~copieusement~et~~~~achetais~~des~provisions"
10290 DATA"~~~~la~nuit~allait~arriver~~~~~devaisje~profiter~~dun~bon~~~lit~~ou~reprendre~la~route"
10300 DATA"je~prenais~une~chambre","je~repartais"
10310 DATA"~~jaurais~du~~me~fier~a~mon~~~~~instinct~et~me~mefier~du~~~~tenancier~a~lair~si~servile","au~cours~de~la~nuit~~quelquun~~penetrait~~dans~ma~chambre~~~~~~et~mepinglait~~au~lit"
10320 DATA"~~je~minstallais~a~quelques~~~~miles~du~pueblo~et~passais~~~~~~~une~nuit~~tranquille"
10330 DATA"le~lendemain~matin~~jhesitais~~sur~la~direction~a~prendre"
10340 DATA"je~poursuivais~vers~le~sud","je~revenais~vers~louest"

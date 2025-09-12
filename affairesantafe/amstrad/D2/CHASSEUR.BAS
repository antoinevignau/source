10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD "!chasseur.bin",22728:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,11:INK 3,15:ad=36030:GOSUB 3010
10020 IF maggy=1 THEN RESTORE 10090 ELSE RESTORE 10100
10030 GOSUB 4010:CALL &BB18:ad=33448:GOSUB 3010:RESTORE 10110:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:po=2:GOSUB 5010:ON t GOTO 10040,10080
10040 ad=29604:GOSUB 3010:GOSUB 4010:IF maggy=1 THEN 10060 ELSE CALL &BB18
10050 GOSUB 4010:CALL &BB18:GOSUB 4010:cha$="jugement":GOTO 2010
10060 GOSUB 9000:IF chance THEN 10050 ELSE RESTORE 10200:GOSUB 4010:CALL &BB18:ad=31407:GOSUB 3010:GOSUB 5120:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18 
10070 WINDOW 5,36,19,25:CLS:WINDOW 6,35,20,24:PLOT 68,4,0:DRAWR 0,102:DRAWR 502,0:DRAWR 0,-102:DRAWR -502,0:RESTORE 10230:GOSUB 4010:CALL &BB18:ad=22728:GOSUB 3010:BORDER 11:WINDOW 23,39,5,6:PAPER 2:GOSUB 4010:CALL &BB18:MODE 1:CALL FINMUS:RUN 1070
10080 ad=33201:GOSUB 3010:temp=300:GOSUB 9110:ad=33074:GOSUB 3010:GOSUB 5120:temp=100:GOSUB 9110:ad=33201:GOSUB 3010:temp=2000:GOSUB 9110:ad=33448:GOSUB 3010:RESTORE 10180:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10090 DATA"~apres~deux~~longues~journees~~~~de~trajet~nous~arrivions~~~~~~~~~~~~a~pecosècity"
10100 DATA"~apres~deux~~longues~journees~~~de~trajet~jùarrivais~enfin~~~~~~~~~~~a~pecosècity"
10110 DATA"alors~que~je~~venais~de~mettre~pied~a~terre~~devant~lùhotel~~un~homme~sùapprochait~de~moi"
10120 DATA"~~il~mùordonnait~~de~ne~plus~~~faire~un~geste~si~je~voulais~~~~~~~~~rester~en~vie"
10130 DATA"cùetait~un~~chasseur~de~primeset~il~mùapprenait~~que~jùetais~~~~recherche~~mort~ou~vif"
10140 DATA"je~me~laissais~ligoter","je~tentais~de~lùabattre"
10150 DATA"apres~mùavoir~~attache~sur~moncheval~il~prenait~la~direction~~~~~du~bureau~du~~sherif"
10160 DATA"~il~touchait~sa~prime~de~cinq~~~cents~dollars~~pendant~que~~~~~jùetais~jete~en~prison"
10170 DATA"~~~au~cours~du~mois~suivant~~~jùetais~conduit~a~~reno~ou~mon~~~~~~proces~mùattendait"
10180 DATA"~cùetait~la~premiere~fois~que~~~je~voyais~un~type~degainer~~~~~~~et~tirer~~aussi~vite"
10190 DATA"~en~mùecroulant~~au~sol~je~me~~disais~que~~cùetait~aussi~la~derniere~fois~que~je~voyais~ca"
10200 DATA"~lorsquùil~me~~ligotait~il~ne~pretait~plus~attention~a~maggy","~elle~sùemparait~~de~ma~winch~~et~descendait~~proprement~le~~~~~~~chasseur~de~primes"
10210 DATA"~~~~la~fuite~a~nouveau~mais~~~~cette~fois~~nous~etions~deux"
10220 DATA"trois~ans~plus~tard~~nous~nous~~retrouvions~en~oregon~sous~~~~~~de~faux~noms~et~maries"
10230 DATA"~~~jùavais~rase~ma~barbe~et~~~~~jùexploitais~maintenant~un~~~~petit~ranch~avec~maggy~qui~~~mùavait~deja~donne~un~garcon~~~~~peutèetre~le~bonheurèèè"
10240 DATA"fin~de~lùepisode"

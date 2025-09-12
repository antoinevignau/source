10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD "!indien.bin",24703:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,6:INK 3,15:ad=35903:GOSUB 3010:RESTORE 10070:GOSUB 4010:CALL &BB18:ad=33566:GOSUB 3010:GOSUB 4010:po=3:GOSUB 5010:ON t GOTO 10020,10030,10040
10020 ad=28880:GOSUB 3010:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10030 ad=30857:GOSUB 3010:RESTORE 10120:GOSUB 4010:CALL &BB18:GOTO 10060
10040 ad=26769:GOSUB 3010:temp=1500:GOSUB 9110:temp=100:ad=26225:GOSUB 3010:GOSUB 9110:ad=25745:GOSUB 3010:GOSUB 9110:ad=25356:GOSUB 3010:GOSUB 9110:ad=24703:GOSUB 3010:RESTORE 10130:GOSUB 4010:CALL &BB18
10050 po=2:GOSUB 5010:ON t GOTO 10030,10060
10060 RESTORE 10150:GOSUB 4010:cha$="village":GOTO 2010
10070 DATA"~~je~menfoncais~plus~encore~~dans~cette~~etendue~desertique"
10080 DATA"~~~soudain~je~me~retrouvais~~~~~entoure~de~~cinq~guerriers~~apaches~manifestement~hostiles"
10090 DATA"je~prenais~la~fuite","je~sortais~mon~arme","je~faisais~le~signe~de~paix"
10100 DATA"~~je~navais~pas~eu~le~temps~~~~~de~faire~un~yard~lorsque~~~~~~la~fleche~~me~transperca"
10110 DATA"la~vie~tient~a~si~peu~de~chose~quun~simple~morceau~de~bois~~~~mettait~fin~~a~la~mienne"
10120 DATA"les~apaches~sattendaient~a~ca~apres~une~courte~lutte~je~me~~retrouvais~solidement~ligote"
10130 DATA"~~celui~qui~semblait~etre~le~~chef~me~rendait~le~salut~et~me~~~~demandait~de~le~suivre"
10140 DATA"je~refusais","jacceptais"
10150 DATA"~~~ils~mamenaient~alors~en~~~~~direction~de~~leur~village"

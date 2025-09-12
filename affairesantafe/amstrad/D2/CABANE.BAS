10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!cabane.bin",24751:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,11:INK 3,15:AD=36713:GOSUB 3010:RESTORE 10160:GOSUB 4010
10020 a$=INKEY$:IF a$=""THEN temp=150:ad=36538:GOSUB 3010:GOSUB 9110:ad=36363:GOSUB 3010:GOSUB 9110:ad=36188:GOSUB 3010:GOSUB 9110:GOTO 10020
10030 GOSUB 4010:po=2:GOSUB 5010
10040 ON t GOTO 10050,10060
10050 cha$="chasseur":GOTO 2010
10060 maggy=1:GOSUB 4010:CALL &BB18:ad=33585:GOSUB 3010:GOSUB 4010
10070 po=2:RESTORE 10210:GOSUB 5010:ON t GOTO 10080,10100
10080 GOSUB 4010:ad=24751:GOSUB 3010:CALL &BB18
10090 GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:ad=26463:GOSUB 3010:GOSUB 4010:CALL &BB18:cha$="chasseur":GOTO 2010
10100 GOSUB 3030:IF mot(8)OR mot(9)THEN 10110 ELSE 10070
10110 ad=33205:GOSUB 3010:temp=500:GOSUB 9110:ad=32506:GOSUB 3010:RESTORE 10270:GOSUB 4010:CALL &BB18:GOSUB 4010
10120 ad=30197:GOSUB 3010:CALL &BB18:GOSUB 4010
10130 ad=29371:GOSUB 3010:temp=200:GOSUB 9110:ad=28598:GOSUB 3010:temp=500:GOSUB 9110:IF nb<4 THEN nb=nb+1:GOTO 10130
10140 CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10150 FOR te=1 TO temp:NEXT:RETURN
10160 DATA "~~~a~la~sortie~dun~bois~je~~~~decouvrais~une~cabane~brulee"
10170 DATA"~cetait~de~la~besogne~apache~~et~il~ne~faisait~pas~bon~de~~~~~~~~sattarder~par~la"
10180 DATA "je~passais~mon~chemin","je~mapprochais"
10190 DATA"~javancais~prudemment~entre~~~~~~les~corps~tortures~et~~~~~~~~~~~les~debris~fumants"
10200 DATA"~~~a~larriere~de~la~grange~~~~je~decouvrais~une~jeune~femme~~~miraculeusement~epargnee"
10210 DATA"je~la~detachais","javais~une~autre~idee~en~tete"
10220 DATA"~apres~lui~avoir~donne~a~boire~elle~me~racontait~ce~quelle~~~~~~~~venait~de~vivre"
10230 DATA"les~apaches~etaient~arrives~en~plein~midi~et~avaient~tue~et~~~~torture~toute~sa~famille"
10240 DATA "~elle~setait~agenouillee~et~~avait~prie~le~bon~dieu~a~voie~~~~~~haute~et~en~chantant"
10250 DATA "les~apaches~lavaient~surement~~~~~prise~pour~une~folle~~~~~ce~qui~lui~avait~~sauve~la~vie"
10260 DATA "~~~apres~avoir~enterre~les~~~~parents~de~~maggy~et~son~frere~~~je~la~prenais~en~croupe"
10270 DATA "~elle~etait~appetissante~et~ne~~~~semblait~pas~farouche","~apres~lavoir~detachee~je~la~couchais~a~terre~et~la~violais"
10280 DATA "~~je~ne~me~rendais~pas~compte~~~~~quelle~avait~reussi~a~~~~~~semparer~de~mon~coutelas"
10290 DATA"~elle~me~plantait~le~coutelas~~~en~pleine~poitrine~puis~me~~~~~~~~regardait~agoniser"
10300 DATA "~je~me~souvenais~alors~de~ma~~mere~qui~me~recommandait~de~me~~~~~~~mefier~des~femmes"

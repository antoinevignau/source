10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD "!village.bin",20052:CALL INITMUS:CALL JOUMUS:INTER=1
10010 INK 2,6:INK 3,15:ad=34095:GOSUB 3010:RESTORE 10080:GOSUB 4010:CALL &BB18:ad=32272:GOSUB 3010:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:GOSUB 4010:po=2:GOSUB 5010:ON t GOTO 10030,10020
10020 ad=27955:GOSUB 3010:RESTORE 10140:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10030 RESTORE 10160:GOSUB 4010:CALL &BB18:GOSUB 4010:GOSUB 9000
10040 IF chance THEN RESTORE 10180:GOSUB 4010:CALL &BB18:GOTO 10020 
10050 ad=29643:GOSUB 3010:RESTORE 10190:GOSUB 4010:CALL &BB18:GOSUB 4010:po=2:GOSUB 5010:ON t GOTO 10060,10070
10060 GOSUB 4010:cha$="cabane":GOTO 2010
10070 WINDOW 5,36,19,25:CLS:WINDOW 6,35,20,24:PLOT 68,4,0:DRAWR 0,102:DRAWR 502,0:DRAWR 0,-102:DRAWR -502,0:RESTORE 10230:GOSUB 4010:CALL &BB18:GOSUB 4010:CALL &BB18:ad=20052:GOSUB 3010:WINDOW 29,36,10,13:GOSUB 4010:CALL &BB18:MODE 1:CALL FINMUS:RUN 1070
10080 DATA"~jùetais~accueilli~au~village~~~par~des~regards~~farouches"
10090 DATA"on~me~faisait~entrer~~sous~une~~~~tente~ou~~je~decouvrais~~~~~~~un~vieillard~~fievreux"
10100 DATA"~il~sùagissait~du~~grand~chef~~~~~~que~lùhomme~medecine~~~~~~ne~reussissait~pas~~a~guerir"
10110 DATA"~je~comprenais~alors~pourquoi~~~~~je~nùavais~pas~ete~tue"
10120 DATA"les~apaches~esperaient~me~voir~faire~mieux~que~leur~sorcier"
10130 DATA"jùessayais~de~le~soigner","je~refusais"
10140 DATA"des~guerriers~~sùemparerent~demoi~et~ne~me~laisserent~pas~le~loisir~de~voir~~le~lendemain"
10150 DATA"~~~lùun~dùeux~~venait~de~se~~~procurer~un~~nouvel~objet~tres~~decoratif~~pour~sa~tunique"
10160 DATA"~~~je~lui~faisais~boire~une~~~~tisane~dont~ma~mere~~mùavait~~~~~~~~revele~le~secret"
10170 DATA"~~~~les~soins~et~lùattente~~~~~duraient~depuis~~une~dizaine~~~~~~~de~jours~lorsqueèèè"
10180 DATA"~~~~le~grand~chef~decedait"
10190 DATA"le~grand~chef~~se~sentit~mieux~et~me~remerciait~~de~lùavoir~retenu~contre~le~grand~manitou"
10200 DATA"~~~il~me~proposait~alors~de~~~~~~rester~dans~la~~tribu~si~~~~~~~~~~~je~le~desirais"
10210 DATA"je~repartais","je~restais~avec~les~apaches"
10220 DATA"~apres~avoir~~fait~mes~adieux~~~~je~partais~~vers~lùouest"
10230 DATA"~je~venais~de~~trouver~ce~que~~inconsciemment~~je~cherchais~~è~une~vie~calme~~et~paisible~~au~milieu~~dùun~peuple~plein~de~sagesse~et~de~joie~de~vivre"
10240 DATA"on~mùappelait~dorenavant~grandours~en~raison~de~~ma~barbe~etje~prenais~pour~femme~fleur~de~printemps~qui~ne~tardait~pas~~a~me~donner~de~beaux~enfants"
10250 DATA"f~i~n"

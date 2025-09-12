10000 CLS#1:PEN#1,3:POKE &BE78,1:ON ERROR GOTO 2530:LOAD"!desert.bin",22220:CALL INITMUS:CALL JOUMUS:INTER=1
10010 eau=0:INK 2,11:INK 3,15:AD=34319:GOSUB 3010:RESTORE 10130:GOSUB 4010
10020 RESTORE 10140:IF eau=1 THEN po=1:GOSUB 5010 ELSE po=2:GOSUB 5010
10030 ON t GOTO 10040,10050
10040 ad=29503:GOSUB 3010:RESTORE 10150:GOSUB 4010:CALL &BB18:IF eau=0 THEN 10070 ELSE 10080
10050 GOSUB 3030:IF mot(1) AND mot(33) THEN eau=1:ad=31795:GOSUB 3010:RESTORE 10160:GOSUB 4010:CALL &BB18:GOTO 10020 ELSE 10020
10060 RESTORE 10180:GOSUB 4010:CALL &BB18
10070 RESTORE 10190:GOSUB 4010:CALL &BB18:ad=22220:GOSUB 3010:GOSUB 4010:CALL &BB18:CALL FINMUS:RUN 1070
10080 ad=27232:GOSUB 3010:RESTORE 10210:GOSUB 4010:po=3:GOSUB 5010
10090 ON t GOTO 10060,10100,10110
10100 RESTORE 10240:GOSUB 4010:CALL &BB18:GOSUB 4010:cha$="pueblo":GOTO 2010
10110 ad=24936:GOSUB 3010:temp=500:GOSUB 9110:GOSUB 5120
10120 a$=INKEY$:IF a$=""THEN temp=100:ad=24603:GOSUB 3010:GOSUB 9110:ad=24269:GOSUB 3010:GOSUB 9110:ad=23937:GOSUB 3010:GOSUB 9110:ad=24269:GOSUB 3010:GOSUB 9110:GOTO 10120 ELSE RESTORE 10230:GOSUB 4010:cha$="indien":GOTO 2010
10130 DATA "pour~me~refugier~au~mexique~il~~~me~fallait~traverser~le~~~~~~~~~~territoire~apache"
10140 DATA "je~traversais~a~gue","javais~autre~chose~a~faire"
10150 DATA "je~traversais~~le~fleuve~et~menfoncais~en~territoire~apache"
10160 DATA "~~~~pendant~que~mon~cheval~~~~sabreuvait~je~remplissais~ma~~~~~gourde~dans~le~fleuve"
10170 DATA "ok~ca~marche"
10180 DATA "malgre~mes~soins~le~malheureux~~rendait~son~dernier~soupir~~~~~je~reprenais~mon~chemin"
10190 DATA "~javais~oublie~~quici~leau~~etait~une~denree~rare~et~qu~~~elle~valait~plus~que~lor"
10200 DATA"je~finissais~mon~aventure~dans~~ce~desert~torride~interdit~~~~~~~~~~aux~imprudents"
10210 DATA "le~deuxieme~jour~je~decouvrais~un~homme~en~train~dagoniser~les~apaches~lavaient~torture"
10220 DATA "je~lui~donnais~a~boire","je~continuais~mon~chemin","jabregeais~ses~souffrances"
10230 DATA "je~continuais~mon~chemin~apres~avoir~enterre~le~malheureux"
10240 DATA"~~il~valait~mieux~quitter~le~~coin~avant~de~prendre~la~place~~~~~~~de~ce~malheureux"
10250 DATA "~~~~jarrivais~au~mexique~~~~~~le~troisieme~jour~sans~avoir~~~~rencontre~un~seul~apache"

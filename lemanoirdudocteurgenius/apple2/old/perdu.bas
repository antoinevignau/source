10 GOSUB 13000: REM TOMBE
20 GOSUB 30000: REM SARABANDE
30 TEXT: PRINT: PRINT: PRINT: PRINT: PRINT "Voulez-vous rejouer ?":GET X$
40 IF X$="O" THEN PRINT CHR$(4);"RUN PRESENTATION"
50 IF X$="N" THEN GOTO 70
60 GOTO 30
70 HOME: PRINT: PRINT: PRINT: PRINT "     AU REVOIR"
80 END

13000 & H: & I 0: & S 75,62,1: & D -5,0,1: & D -55,108,1: & D 37,-10,1
13005 & D 30,-90,1: & D -19,5,1: & D 19,-5,1: & D 20,5,1: & D -12,94,1
13007 & D -38,-10,1: & D 38,10,1: & D 0,20,1: & D -75,0,1: & D 0,-20,1
13010 & D 0,20,1: & D 75,0,1: & D 15,-112,1: & D 0,-15,1
13012 & D -3,14,1: & D 3,-14,1: & D -13,0,1
13015 & D 0,-12,1: & D 0,12,1: & D -4,10,1: & D 0,-22,1: & D 12,0,1
13020 & D 4,-7,1: & D 0,-15,1: & D -4,6,1: & D 0,16,1: & D 0,-16,1: & D -12,0,1
13025 & D 4,-6,1: & D 12,0,1: & D -12,0,1: & D 0,-16,1: & D -4,6,1: & D 0,16,1
13030 & D 0,-16,1: & D -12,0,1: & D 4,-6,1: & D 12,0,1: & D -12,0,1: & D -4,6,1
13035 & D 0,16,1: & D -12,0,1: & D 4,-6,1: & D 7,0,1: & D -7,0,1: & D -4,6,1
13040 & D 0,16,1: & D 12,0,1: & D 0,22,1
13045 & I 3: RETURN

30000 REM      SARABANDE
30001 RETURN
30005 & R 30000: REM RESTORE
30010 FOR N=1 TO 41:READ Y$,Y$,Y$,Y$,Y$,Y$,Y$:NEXT
30015 FOR N=1 TO 75
30020 READ A1,A2,A3,A4,A5
30025 READ A6,A7,A8,A9,A0
30030 REM MUSIC1,A1,A2,A3:MUSIC2,A4,A5,A6:MUSIC3,A7,A8,A9:PLAY7,0,0,100: & W A0
30032 REM IF N>70 THEN NEXT:PLAY0,0,0,0: RETURN
30035 REM PLAY0,0,0,0:NEXT
30040 DATA 3,6,8,3,3,8,2,10,8,80
30045 DATA 3,6,8,3,3,8,2,10,8,80
30050 DATA 0,1,1,0,1,1,0,1,1,40
30055 DATA 3,8,8,3,5,8,0,1,1,40
30060 DATA 3,5,8,3,2,8,2,10,8,80
30065 DATA 3,5,8,3,2,8,2,10,8,40
30070 DATA 1,11,8,0,1,1,0,1,1,40
30075 DATA 1,10,8,0,1,1,0,1,1,40
30080 DATA 1,8,8,0,1,1,0,1,1,40
30085 DATA 3,10,8,3,6,9,3,1,8,80
30090 DATA 3,10,8,3,6,9,3,1,8,80
30095 DATA 0,1,1,0,1,1,0,1,1,40     
30100 DATA 3,11,8,3,8,8,0,1,1,40
30105 DATA 3,8,8,3,5,8,3,1,8,80
30110 DATA 3,8,8,3,5,8,3,1,8,40 
30115 DATA 2,1,8,0,1,1,0,1,1,40
30120 DATA 1,11,8,0,1,1,0,1,1,40 
30125 DATA 1,10,8,3,7,8,3,10,8,40
30130 DATA 3,11,8,3,8,8,3,3,8,80
30135 DATA 3,11,8,3,8,8,3,3,8,80
30140 DATA 1,8,8,0,1,1,0,1,1,40
30145 DATA 1,8,8,3,10,8,4,1,8,40
30150 DATA 3,10,8,3,6,8,3,3,8,80
30155 DATA 3,10,8,3,6,8,3,3,8,80
30160 DATA 0,1,1,0,1,1,0,1,1,40
30165 DATA 3,10,8,2,1,8,0,1,1,40
30170 DATA 4,3,8,3,10,8,1,11,8,80
30175 DATA 4,3,8,3,8,8,2,11,9,80
30180 DATA 0,1,1,0,1,1,0,1,1,40
30185 DATA 4,5,8,0,1,1,0,1,1,40
30190 DATA 4,2,8,3,10,8,3,5,8,80
30195 DATA 4,2,8,3,10,8,3,5,8,40
30200 DATA 2,8,8,0,1,1,0,1,1,40
30202 DATA 2,6,8,0,1,1,0,1,1,40
30203 DATA 2,5,8,0,1,1,0,1,1,40
30205 DATA 3,6,8,3,3,8,2,10,8,80
30210 DATA 3,6,8,3,3,8,2,10,8,80
30215 DATA 0,1,1,0,1,1,0,1,1,40 
30220 DATA 3,8,8,3,5,8,0,1,1,40 
30225 DATA 3,5,8,3,2,8,2,10,8,80
30230 DATA 3,5,8,3,2,8,2,10,8,40
30235 DATA 1,11,8,0,1,1,0,1,1,40
30240 DATA 1,10,8,0,1,1,0,1,1,40
30245 DATA 1,8,8,0,1,1,0,1,1,40
30250 DATA 3,10,8,3,6,9,3,1,8,80
30255 DATA 3,10,8,3,6,9,3,1,8,80
30260 DATA 0,1,1,0,1,1,0,1,1,40
30265 DATA 3,11,8,3,8,8,0,1,1,40
30270 DATA 3,8,8,3,5,8,3,1,8,80
30275 DATA 3,8,8,3,5,8,3,1,8,40
30280 DATA 2,1,8,0,1,1,0,1,1,40
30285 DATA 1,11,8,0,1,1,0,1,1,40
30290 DATA 1,10,8,3,7,8,3,10,8,40
30295 DATA 3,11,8,3,8,8,3,3,8,80
30300 DATA 2,8,8,0,1,1,0,1,1,40
30305 DATA 3,11,8,3,8,8,3,1,8,40
30310 DATA 2,8,8,0,1,1,0,1,1,40
30315 DATA 2,1,8,0,1,1,0,1,1,40
30320 DATA 4,1,8,2,5,8,0,1,1,40
30325 DATA 3,10,8,3,6,8,3,1,8,80
30330 DATA 3,10,8,2,3,8,0,1,1,40
30335 DATA 4,3,8,3,6,8,2,11,8,40
30340 DATA 4,2,8,0,1,1,0,1,1,40
30345 DATA 4,3,8,3,11,8,2,8,8,40
30350 DATA 4,5,8,0,1,1,0,1,1,40
30355 DATA 4,6,8,3,10,8,2,10,8,80
30360 DATA 4,5,8,3,8,8,1,10,8,40
30365 DATA 0,1,1,3,8,8,1,10,8,40
30370 DATA 4,3,8,0,1,1,0,1,1,40
30375 DATA 4,3,8,3,6,8,2,3,8,80
30380 DATA 3,3,8,3,10,8,3,6,8,40
30385 DATA 3,3,7,3,10,7,3,6,7,40
30390 DATA 3,3,6,3,10,6,3,6,6,40
30395 DATA 3,3,5,3,10,5,3,6,5,40
30400 DATA 3,3,4,3,10,4,3,6,5,40

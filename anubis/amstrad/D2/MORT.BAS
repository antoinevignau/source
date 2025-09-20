10 ' MORT (B)
20 MODE 1:BORDER 0
30 POKE &7000,0:POKE &7001,0:POKE &7002,0:POKE &7003,0:POKE &7004,0:POKE &7005,0:POKE &7006,0
40 FOR i=0 TO 15:INK i,0:NEXT i
50 MEMORY &3FFF:LOAD"Mort.cmp"
60 POKE &A634,&C8:POKE &A635,0:POKE &A636,0:CALL &A60B
70 POKE &C7F1,&C9:CALL &C7D0
80 CALL &A60B
85 LOCATE 8,21:PEN 3:PRINT"Voulez-vous rejouer (O/N) ?"
90 k$=INKEY$
100 IF k$="O" OR k$="o" THEN GOTO 200
110 IF k$="N" OR k$="n" THEN CALL 0
120 IF k$<>"O" OR k$<>"o" OR k$<>"N" OR k$<>"n" THEN GOTO 90
200 INK 0,0:INK 1,6:INK 2,15:INK 3,24:MODE 1:BORDER 0:
210 PEN 3:LOCATE 1,8:PRINT"       Retour a la case depart !":PEN 2:PRINT:PRINT"  Vous voici de nouveau dans la piece":PRINT"      initiale de la pyramide..."
220 PEN 1:LOCATE 1,16:PRINT"ATTENTION : Vous perdez tous les objets,":LOCATE 1,17:PRINT"indices et connaissances que vous aviez":PRINT"precedemment acquis dans la":PRINT"pyramide."
230 PEN 3:LOCATE 15,25:INPUT"  ENTER  ",en$
240 RUN"Pyramid2.bas"

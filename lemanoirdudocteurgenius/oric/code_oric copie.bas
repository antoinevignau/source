4150 :HIRES:PRINT"Vous avez de la chance car ce coffre  etait ouvert.":WAIT400
4152 PRINT"Un message a l'interieur dit:":WAIT250:PRINT"Ne respectez pas les ";
4154 PRINT"couleurs du":PRINT"code de la route...?":WAIT500 
4156 PRINT"Tiens le coffre se referme":WAIT200:RETURN

4210 HIRES:PRINT"Vous avez les pieds trempes,et cela   vous rend tres malade..."
4215 WAIT400:PRINT"Vous mourez d'une triple pneumonie...!":WAIT300:RETURN

4220 PRINT"Le titre est:":WAIT200:PRINT"La mort a la premiere page.":WAIT300:RETURN

4230 HIRES:FOR N=1 TO 20:EXPLODE:NEXT
4233 PRINT"Le livre a explose lorsque vous l'avezouvert...":WAIT400:RETURN

4240 PRINT"Le papier indique:  Cherchez la clef.":WAIT300:RETURN

4250 PRINT"La clef vous permettera de trouver le code de la porte d'entree."
4255 WAIT400:RETURN

4260 HIRES:PRINT"Il y a , a cote de la porte,un claviernumerique permettant ";
4265 PRINT"d'entrer un code":WAIT400:RETURN

4270 PRINT"Pour faire quoi..?":WAIT200:RETURN

4280 PRINT"Il y a une odeur de gaz.":WAIT300:RETURN

4290 PRINT"Apparement,il n'y a occune odeur      mais...":WAIT300:RETURN

4500 HIRES:PRINT"Vous prenez du 30000 Volts dans les   doigts,":WAIT300:RETURN

4510 PRINT"Le placard est ferme a clef":WAIT150:RETURN

4520 HIRES:PRINT"L'horrible monstre sorti du placard   vient de vous devorer"
4525 WAIT400:RETURN

4530 PRINT"Il ne fallait pas fuir":WAIT200:RETURN

4540 HIRES:PRINT"Vous avez raison d'utiliser le ciseau,le monstre est mort"
4545 WAIT400:RETURN

4550 PRINT"A l'interieur du placard,le No "PL"   est inscrit":WAIT300
4555 PRINT"Le placard se referme.":WAIT150:RETURN

4560 HIRES:FOR N=1 TO 30:EXPLODE:WAIT5:NEXT:PRINT"le pistolet a explose":WAIT200
4565 RETURN

4570 HIRES:FOR N=1 TO 25:EXPLODE:WAIT7:NEXT:
4575 PRINT"le clavier numerique a explose":WAIT250:RETURN

4580 HIRES:PRINT"Le clavier numerique prends feu,      heureusement,vous aviez ";
4582 WAIT300:PRINT"un pot plein":WAIT100
4585 PRINT"d'eau qui vous a permis d'eteindre ce feu"
4586 WAIT400:RETURN

4590 HIRES:INPUT"No DE CODE";ZC
4595 IF ZC<>PL THEN GOTO 4570
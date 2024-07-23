*----------------------------------------
* True Convert : Palette
*----------------------------------------

mePALEDIT rts

*----------------------------------------

mePALLOAD jsr stdOPEN
 bcc mePALLOAD1
 rts
mePALLOAD1 jsr doPALETTE
 rts

*----------------------------------------

mePALSAVE jsr stdSAVE
 bcc mePALSAVE1
 rts
mePALSAVE1 jsr doPALETTE
 rts

*--------------

doPALETTE sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20
 rts

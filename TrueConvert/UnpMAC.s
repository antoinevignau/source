*----------------------------------------
* True Convert : Unpackers : MAC
*----------------------------------------

* lst off
* rel
* dsk unpMAC.l

*----------------------------------------

*unpMAC ENT

unpMAC phb
 phk
 plb

 sep #$20
 ldal $c034
 inc
 stal $c034
 rep #$20

 plb
 clc
 rtl

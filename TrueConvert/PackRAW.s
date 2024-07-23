*----------------------------------------
* True Convert : Packers : RAW
*----------------------------------------

* lst off
* rel
* dsk packRAW.l

*----------------------------------------

*packRAW ENT

packRAW phb
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

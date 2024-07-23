*----------------------------------------
* True Convert : Packers : TIF
*----------------------------------------

* lst off
* rel
* dsk packTIF.l

*----------------------------------------

*packTIF ENT

packTIF phb
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

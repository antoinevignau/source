*----------------------------------------
* True Convert : Packers : PCX
*----------------------------------------

* lst off
* rel
* dsk packPCX.l

*----------------------------------------

*packPCX ENT

packPCX phb
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

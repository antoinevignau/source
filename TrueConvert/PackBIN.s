*----------------------------------------
* True Convert : Packers : BIN
*----------------------------------------

* lst off
* rel
* dsk packBIN.l

*----------------------------------------

*packBIN ENT

packBIN phb
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

*----------------------------------------
* True Convert : Packers : BMP
*----------------------------------------

* lst off
* rel
* dsk packBMP.l

*----------------------------------------

*packBMP ENT

packBMP phb
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

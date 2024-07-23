*----------------------------------------
* True Convert : Unpackers : BMP
*----------------------------------------

* lst off
* rel
* dsk unpBMP.l

*----------------------------------------

*unpBMP ENT

unpBMP phb
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

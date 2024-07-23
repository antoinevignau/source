*----------------------------------------
* True Convert : Unpackers : IFF
*----------------------------------------

* lst off
* rel
* dsk unpIFF.l

*----------------------------------------

*unpIFF ENT

unpIFF phb
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

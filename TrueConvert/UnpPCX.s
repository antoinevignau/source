*----------------------------------------
* True Convert : Unpackers : PCX
*----------------------------------------

* lst off
* rel
* dsk unpPCX.l

*----------------------------------------

*unpPCX ENT

unpPCX phb
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

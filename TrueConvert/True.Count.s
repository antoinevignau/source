*----------------------------------------
* True Convert : Count Colors
*----------------------------------------


meCOUNT PushLong #65536
 PushLong #strZERO
 PushWord #5
 PushWord #0
 _Long2Dec

 PushLong #255
 PushLong #strONE
 PushWord #5
 PushWord #0
 _Long2Dec

 pha
 PushWord #4
 PushLong #strARRAY
 PushLong #2 ; Count colors
 _AlertWindow
 pla
 rts

strARRAY adrl strZERO,strONE
strZERO asc '     '00
strONE asc '     '00

*----------------------------------------
* True Convert : Linker
*----------------------------------------

 lkv $02

 asm True.Main
 asm unp/unpGS

 knd $1100
 lnk TC.l
 knd $1000
 lnk unpGS.l
 sav TC

 cmd Xpress TC
 cmd Crunch TC

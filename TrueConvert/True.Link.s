*----------------------------------------
* True Convert : Linker
*----------------------------------------

 lkv $02

 asm True.Main
 asm unpGS
 asm unpBMP
 asm unpGIF
 asm unpIFF
 asm unpPCX
 asm unpTIF
 asm unpBIN
 asm unpST
 asm unpMAC

 asm packGS
 asm packBMP
 asm packPCX
 asm packTIF
 asm packBIN
 asm packRAW

 knd $1100
 lnk TC.l
 sav TC

 knd $1000
 lnk unpGS.l
 sav TC
 knd $1000
 lnk unpBMP.l
 sav TC
 knd $1000
 lnk unpGIF.l
 sav TC
 knd $1000
 lnk unpIFF.l
 sav TC
 knd $1000
 lnk unpPCX.l
 sav TC
 knd $1000
 lnk unpTIF.l
 sav TC
 knd $1000
 lnk unpBIN.l
 sav TC
 knd $1000
 lnk unpST.l
 sav TC
 knd $1000
 lnk unpMAC.l
 sav TC

 knd $1000
 lnk packGS.l
 sav TC
 knd $1000
 lnk packBMP.l
 sav TC
 knd $1000
 lnk packPCX.l
 sav TC
 knd $1000
 lnk packTIF.l
 sav TC
 knd $1000
 lnk packBIN.l
 sav TC
 knd $1000
 lnk packRAW.l
 sav TC

 cmd Xpress TC
 cmd Crunch TC

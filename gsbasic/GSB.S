*
* GS BASIC
*
* (c) 1987, Apple Computer, Inc.
* (m) 2014-2019, Brutal Deluxe Software
*  ^- m means modernized
*
* Visit http://www.brutaldeluxe.fr/
*

         xc
         xc
         mx    %00
         lst   off

         rel
         dsk   GSBD.L

*--------------------------------------
* Versions
*
* 20190128 - AV
*  BASIC@
*   Output ILLEGAL QUANTITY ERROR if asked variable
*   is above the max number of variables
*  TYPO
*   "destroy" was written "destory"
*  VERSION
*   changed to 1.0 Beta 5
    
*--------------------------------------

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Load.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/SANE.Macs
         use   4/Text.Macs
         use   4/Window.Macs
         use   4/Util.Macs

*--------------------------------------

SOFTEV   EQU   $03F2
PWREDUP  EQU   $03F4
PADDL0   EQU   $C064
PADDL1   EQU   $C065
DISPATCH1 EQU	$E10000
GSOS     EQU   $E100A8
GSOS2    EQU   $E100B0

*--------------------------------------

L0000    BRL   L36DC

*--------------------------------------

L0003    DB    $80
L0004    DB    $00
L0005    DB    $00
L0006    DB    $00
L0007    DB    $00
L0008    DB    $00
         DB    $00
L000A    DB    $00
L000B    DB    $00
L000C    DB    $00
L000D    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L004C    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L007F    DB    $00
         DB    $00
L0081    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0087    DB    $00
L0088    DB    $00
L0089    DB    $00
L008A    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L00A7    DB    $00
L00A8    ASC   'GSB.HELLO'
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         ASC   '11-SEP-87 15:29 '

L00F7    JMP   LE772
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         JMPL  L40D8
         JMPL  L36DC

L0108    DB    $00
L0109    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L01AA    DB    $00
L01AB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L022A    DB    $00
         DB    $00
L022C    DB    $00
         DB    $00
L022E    DB    $50
L022F    DB    $20
L0230    DB    $20
L0231    DB    $20
L0232    DB    $20
L0233    DB    $20
L0234    DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
L023F    DB    $20
         DB    $20
         DB    $20
         DB    $20
L0243    DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
L0257    DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
L025D    DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
L026D    DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
L027E    DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20

L032F    DB    $00
         DB    $00
L0331    DB    $00
         DB    $00
L0333    DB    $00
         DB    $00
L0335    DB    $00
L0336    DB    $00
L0337    DB    $00
         DB    $00
L0339    DB    $00
L033A    DB    $00
         DB    $00
L033C    DB    $00
L033D    DB    $00
L033E    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0343    DB    $00
L0344    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L034B    DB    $00
         DB    $00
L034D    DB    $00
         DB    $00
L034F    DB    $00
L0350    DB    $00
L0351    DB    $00
L0352    DB    $00
L0353    DB    $00
         DB    $00
L0355    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L036E    DB    $00
         DB    $00
L0370    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L037B    DB    $00
L037C    DB    $00
L037D    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L039B    DB    $00
L039C    DB    $00
L039D    DB    $00
L039E    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L03B1    DB    $00
L03B2    DB    $00
L03B3    DB    $00
L03B4    DB    $00
         DB    $00
         DB    $00
         DB    $00
L03B8    DB    $00
L03B9    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L03BE    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L03D2    DB    $00
L03D3    DB    $00
L03D4    DB    $00
         DB    $00
L03D6    DB    $00
L03D7    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L03EF    DB    $00
         DB    $00
         DB    $00
         DB    $00
L03F3    DB    $00
L03F4    DB    $00
L03F5    DB    $00
L03F6    DB    $00
L03F7    DB    $00
L03F8    DB    $00
L03F9    DB    $00
L03FA    DB    $00
L03FB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L04F8    DB    $00
L04F9    DB    $00
L04FA    DB    $00
L04FB    DB    $00
L04FC    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L05F7    DB    $00
         DB    $00
L05F9    DB    $00
L05FA    DB    $00
L05FB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0639    DB    $00
L063A    DB    $00
L063B    DB    $00
L063C    DB    $00
L063D    DB    $00
L063E    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L06E9    DB    $00
         DB    $00
L06EB    DB    $00
L06EC    DB    $00
         DB    $00
         DB    $00
         DB    $00
L06F0    DB    $00
L06F1    DB    $00
L06F2    DB    $00
L06F3    DB    $00
L06F4    DB    $00
L06F5    DB    $00
L06F6    DB    $00
L06F7    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L07E7    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L07F0    DB    $00
L07F1    DB    $00
L07F2    DB    $00
L07F3    DB    $00
L07F4    DB    $00
L07F5    DB    $00
L07F6    DB    $00
L07F7    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L08E7    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L08F0    DB    $00
L08F1    DB    $00
L08F2    DB    $00
L08F3    DB    $00
L08F4    DB    $00
L08F5    DB    $00
L08F6    DB    $00
L08F7    DB    $00
L08F8    DB    $00
L08F9    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0902    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L09ED    DB    $00
L09EE    DB    $00
L09EF    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0AEE    DB    $00
L0AEF    DB    $00
L0AF0    DB    $00
L0AF1    DB    $00
L0AF2    DB    $00
L0AF3    DB    $00
L0AF4    DB    $00
         DB    $00
L0AF6    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0AFE    DB    $00
L0AFF    DB    $00
L0B00    DB    $00
         DB    $00
L0B02    DB    $00
         DB    $00
L0B04    DB    $00
         DB    $00
L0B06    DB    $00
         DB    $00
         DB    $00
         DB    $00
L0B0A    DB    $00
         DB    $00
L0B0C    DB    $00
         DB    $00
L0B0E    DB    $01
         DB    $00
L0B10    DB    $00
         DB    $00
L0B12    DB    $00
         DB    $00
L0B14    DB    $00
         DB    $00
L0B16    DB    $00
         DB    $00
L0B18    DB    $00
         DB    $00
L0B1A    DB    $00
         DB    $00
L0B1C    DB    $00
         DB    $00
L0B1E    DB    $00
         DB    $00
L0B20    DB    $07
         DB    $00
L0B22    DB    $10
L0B23    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0B2C    DB    $F1
L0B2D    DB    $3A
         DB    $D6
         DB    $10
L0B30    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0B3A    DB    $35
         DB    $C2
         DB    $68
         DB    $21
         DB    $A2
         DB    $DA
         DB    $0F
         DB    $C9
         DB    $00
L0B43    DB    $40
L0B44    DB    $FF
         DB    $FF
         DB    $FF
         DB    $7F
L0B48    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0B51    DB    $00
L0B52    DB    $00
         DB    $00
L0B54    DB    $00
L0B55    DB    $00
L0B56    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0B5C    DB    $00
         DB    $00
L0B5E    DB    $00
         DB    $00
L0B60    ADRL  L82C1
L0B64    ADRL  L4067
L0B68    DB    $00
         DB    $00
L0B6A    DB    $00
         DB    $00
L0B6C    DB    $00
         DB    $00
L0B6E    DB    $00
         DB    $00
L0B70    DB    $00
         DB    $00
L0B72    DB    $00
         DB    $00
L0B74    DB    $00
         DB    $00
L0B76    DB    $00
         DB    $00
L0B78    DB    $00
         DB    $00
L0B7A    DB    $00
         DB    $00
         DB    $00
         DB    $00
L0B7E    DB    $2F
         DB    $00
L0B80    DB    $00
         DB    $80
L0B82    DB    $00
         DB    $00
L0B84    DB    $00
         DB    $00
L0B86    DB    $00
         DB    $00
L0B88    DB    $00
         DB    $00

L0B8A    JMPL  LE80F
         DB    $00
L0B8F    JMPL  DISPATCH1
         DB    $00        ; <= Mandatory!
	 
* GSBASIC VARIABLES (see BASIC@)

L0B94    DA    L2DFD      ; 00 (L0BF4-L0B94) / 2 = 48
         DA    L2E0D      ; 01
         DA    L2E70      ; 02
         DA    L0007      ; 03
         DA    L00A8      ; 04
         DA    L022F      ; 05
         DA    L03D3      ; 06
         DA    L03F7      ; 07
         DA    L04FA      ; 08
         DA    L06E9      ; 09
         DA    L0AF0      ; 10
         DA    L0B00      ; 11
         DA    L0B1A      ; 12
         DA    L0B1C      ; 13
         DA    L0B1E      ; 14
         DA    L0B20      ; 15
         DA    L0B22      ; 16
         DA    L0B2C      ; 17
         DA    L0B30      ; 18
         DA    L0B60      ; 19
         DA    L0B64      ; 20
         DA    L0B78      ; 21
         DA    L0B80      ; 22
         DA    L0B8A      ; 23
         DA    L0C2B      ; 24
         DA    L1030      ; 25
         DA    L104C      ; 26
         DA    L10A3      ; 27
         DA    L10C5      ; 28
         DA    L10D1      ; 29
         DA    L16ED      ; 30
         DA    L16EE      ; 31
         DA    L1701      ; 32
         DA    L1707      ; 33
         DA    L1717      ; 34
         DA    L17D5      ; 35
         DA    L1897      ; 36
         DA    L18B5      ; 37
         DA    L18C3      ; 38
         DA    L1928      ; 39
         DA    L1A38      ; 40
         DA    L1BA2      ; 41
         DA    L1BE4      ; 42
         DA    L1C8E      ; 43
         DA    L1D4D      ; 44
         DA    L1E01      ; 45
         DA    L1E3D      ; 46
         DA    L1E6F      ; 47
L0BF4    DA    $0000      ;
         DA    $0000      ;
L0BF8    DB    ^L2DFD     ; SEGMENT NUM
         DB    ^L2E0D
         DB    ^L2E70
         DB    ^L0007
         DB    ^L00A8
         DB    ^L022F
         DB    ^L03D3
         DB    ^L03F7
         DB    ^L04FA
         DB    ^L06E9
         DB    ^L0AF0
         DB    ^L0B00
         DB    ^L0B1A
         DB    ^L0B1C
         DB    ^L0B1E
         DB    ^L0B20
         DB    ^L0B22
         DB    ^L0B2C
         DB    ^L0B30
         DB    ^L0B60
         DB    ^L0B64
         DB    ^L0B78
         DB    ^L0B80
         DB    ^L0B8A
         DB    ^L0C2B
         DB    ^L1030
         DB    ^L104C
         DB    ^L10A3
         DB    ^L10C5
         DB    ^L10D1
         DB    ^L16ED
         DB    ^L16EE
         DB    ^L1701
         DB    ^L1707
         DB    ^L1717
         DB    ^L17D5
         DB    ^L1897
         DB    ^L18B5
         DB    ^L18C3
         DB    ^L1928
         DB    ^L1A38
         DB    ^L1BA2
         DB    ^L1BE4
         DB    ^L1C8E
         DB    ^L1D4D
         DB    ^L1E01
         DB    ^L1E3D
         DB    ^L1E6F
         DB    $00
         DB    $00

L0C2A    DB    $00
L0C2B    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L102B    DB    $00
L102C    DB    $00
L102D    DB    $00
         DB    $04
         DB    $08
L1030    DB    $00
         DB    $00
L1032    DB    $00
         DB    $00
L1034    DB    $00
         DB    $00
L1036    DB    $00
         DB    $00
L1038    DB    $00
         DB    $00
L103A    DB    $00
         DB    $00
L103C    DB    $00
         DB    $00
L103E    DB    $00
         DB    $00
L1040    DB    $00
L1041    DB    $80
L1042    DB    $00
         DB    $00
L1044    DB    $00
L1045    DB    $02
L1046    DB    $00
         DB    $00
L1048    DB    $00
L1049    DB    $02
L104A    DB    $00
         DB    $00
L104C    DB    $20
         DB    $00
         DB    $00
         DB    $00
L1050    DB    $08
         DB    $00
         DB    $00
         DB    $00
L1054    DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
L1060    DB    $00
L1061    DB    $00
L1062    DB    $00
         DB    $00
L1064    DB    $00
         DB    $00
L1066    DB    $00
         DB    $00
L1068    DB    $00
L1069    DB    $00
L106A    DB    $00
         DB    $00
L106C    DB    $00
L106D    DB    $00
L106E    DB    $00
         DB    $00
L1070    DB    $00
L1071    DB    $00
L1072    DB    $00
         DB    $00
L1074    DB    $00
         DB    $00
L1076    DB    $00
         DB    $00
L1078    DB    $00
L1079    DB    $00
L107A    DB    $00
         DB    $00
L107C    DB    $00
L107D    DB    $00
L107E    DB    $00
         DB    $00
L1080    DB    $00
         DB    $00
L1082    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $7E
         DB    $00
L1088    DB    $00
L1089    DB    $00
L108A    DB    $00
L108B    DB    $00
L108C    DB    $00
         DB    $00
L108E    DB    $00
         DB    $00
         DB    $00
         DB    $00
L1092    DB    $00
L1093    DB    $00
L1094    DB    $00
L1095    DB    $00
L1096    DB    $00
         DB    $00
L1098    DB    $00
         DB    $00
L109A    DB    $00
L109B    DB    $00
L109C    DB    $00
L109D    DB    $00
         DB    $00
L109F    DB    $00
L10A0    DB    $00
L10A1    DB    $00
         DB    $00
L10A3    DB    $00
L10A4    DB    $00
L10A5    DB    $00
         DB    $00
L10A7    DB    $00
L10A8    DB    $00
L10A9    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10C5    DB    $00        ;  path name
         DB    $00
L10C7    DB    $00
         DB    $00
         DW    $0000      ;  flags
         DB    $00
         DB    $00
L10CD    DW    $0000      ;  ref num
L10CF    DB    $00
         DB    $00
L10D1    DB    $00
L10D2    DB    $00
L10D3    DW    $0000      ; event code
L10D5    ADRL  $00000000  ; event message
         ADRL  $00000000  ; tick count
         DW    $0000      ; mouse location
         DW    $0000
L10E1    DW    $0000      ; modifiers
L10E3    DB    $00
         DB    $00
L10E5    DB    $00
         DB    $00
L10E7    DB    $FF
         DB    $0F
L10E9    DB    $00
         DB    $00
L10EB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L11EB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L12EB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L13EB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L14E9    DB    $00
         DB    $00
L14EB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L15E9    DB    $00
         DB    $00
L15EB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L16ED    DB    $03
L16EE    DB    $00
L16EF    DB    $00
         DB    $00
L16F1    DB    $00
         DB    $00
L16F3    DB    $00
         DB    $00
L16F5    DB    $00
         DB    $00
L16F7    DB    $00
         DB    $00
L16F9    DB    $00
         DB    $00
L16FB    DB    $00
L16FC    DB    $00
L16FD    DB    $00
L16FE    DB    $00
L16FF    DB    $00
         DB    $00
L1701    DB    $00
L1702    DB    $00
L1703    DB    $00
         DB    $00
L1705    DB    $00
         DB    $00
L1707    DB    $00
         DB    $00
L1709    DB    $00
         DB    $00
L170B    DB    $00
         DB    $00
L170D    DB    $00
         DB    $00
L170F    DB    $00
         DB    $00
L1711    DB    $00
         DB    $00
L1713    DB    $00
         DB    $00
L1715    DB    $00
         DB    $00
L1717    DB    $00
L1718    DB    $00
L1719    DB    $00
         DB    $00
L171B    DB    $00
         DB    $00
L171D    DB    $00
         DB    $00
L171F    DB    $00
L1720    DB    $00
L1721    DW    $0000      ;  ref num
L1723    ADRL  $00000000  ;  buffer ptr

*

L1727    ADRL  $00000000  ;  request count
L172B    ADRL  $00000000  ;  transfer count
L172F    DW    $0000      ;  ref num
         DW    $0000      ;  flags
L1733    DW    $0001      ;  base
L1735    DW    $0001      ;  displacement
         ADRL  L0003      ;  file name
         DW    $0000      ;  entry num
L173D    DW    $0000      ;  file type
L173F    ADRL  $00000000  ;  end of file
L1743    ADRL  $00000000  ;  blocks used
L1747    DS    8          ;  creation date
         DS    8          ;  modification date
L1757    DW    $0000      ;  access
L1759    ADRL  $00000000  ;  aux type
         DW    $0000      ;  file system

L175F    DW    $0000

L1761    DW    $0000      ;  ref num
         ADRL  L176F      ;  resource eof
         ADRL  $00000001  ;  resource blocks
         ADRL  $00000000  ;  transfer count
L176F    DB    $00
         DB    $00

L1771    DB    $00
L1772    DB    $00
L1773    DB    $00
         DB    $00
L1775    DB    $00
         DB    $00
L1777    DW    $0000      ;  ref num
         ADRL  L04FA      ;  buffer ptr
         ADRL  $000000FF  ;  request count
L1781    ADRL  $00000000  ;  transfer count
L1785    DB    $00
         DB    $00
L1787    DB    $FF
L1788    DB    $FF
L1789    DW    $0000      ;  version number
L178B    DB    $00
         DB    $00
L178D    DW    $0000      ;  prefix num
L178F    ADRL  L0230      ;  prefix ptr
         DB    $00
         DB    $00
         DB    L0230
         DB    $02
         DB    $01
         DB    $00
L1799    DW    $0000      ;  prefix num
         ADRL  L0007      ;  prefix ptr
L179F    DW    $0000      ;  prefix num
         ADRL  L0007      ;  prefix ptr
L17A5    DW    $0000      ;  prefix num
L17A7    ADRL  L01AA      ;  prefix ptr
L17AB    DW    $0000      ;  ref num
         DW    $00FF      ;  enable mask
         DW    $000D      ;  newline char
L17B1    DW    $0000      ;  ref num
         DW    $0000      ;  enable mask
         DW    $0000      ;  newline char
         DB    L0007
         DB    $00
         DB    $01
         DB    $00
L17BB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L17C5    DB    $00
         DB    $00
L17C7    DB    $00
         DB    $00
L17C9    STR   'DICTIONARY'
         DB    $00
L17D5    STR   '.CONSOLE'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         STR   '.PRINTER'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         STR   '.MODEM'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         STR   '.NETPTR1'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         STR   '.NULL'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         STR   '.MEMBUFR'
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
L1897    DB    $03
L1898    DB    $02
         DB    $01
         DB    $03
         DB    $02
         DB    $02
         DB    $07
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $10
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L18AB    DB    $00
         DB    $00
L18AD    DB    $00
         DB    $00
L18AF    DB    $00
         DB    $00
L18B1    DB    $00
         DB    $00
L18B3    DB    $00
         DB    $00
L18B5    DB    $00
         DB    $C1
         DB    $00
         DB    $C2
L18B9    DB    $00
         DB    $C3
         DB    $00
         DB    $C4
         DB    $00
         DB    $C5
         DB    $00
         DB    $C6
L18C1    DB    $00
         DB    $C7
L18C3    DB    $00
         DB    $C1
         DB    $00
         DB    $C2
L18C7    DB    $00
         DB    $C3
         DB    $00
         DB    $C4
         DB    $00
         DB    $C5
         DB    $00
         DB    $C6
         DB    $00
         DB    $C7

L18D1    JSL   GSOS
L18D5    DW    $0000
L18D7    ADRL  $00000000
         RTS

L18DC    DW    $0000      ;  ref num

L18DE    DB    $00
L18DF    DB    $00
L18E0    DB    $00
L18E1    DB    $00
L18E2    DB    $00
L18E3    DB    $00
L18E4    DB    $00
L18E5    DB    $00
L18E6    DB    $00
         DB    $00
         DB    $00
         DB    $00
L18EA    DB    $00
         DB    $00
L18EC    DB    $00
L18ED    DB    $00
L18EE    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L18F4    ADRL  L0007      ;  device name
L18F8    ADRL  $00000000  ;  volume name
L18FC    DW    $0000      ;  file system
L18FE    DA    $0000
L1900    DW    $0000      ;  storage
L1902    DS    4          ;  creation date
         DS    4          ;  modification date
L190A    ADRL  $00000000  ;  blocks used
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1916    ADRL  L0007      ;  device name
         ADRL  L039B      ;  volume name
         ADRL  $00000000  ;  total blocks
L1922    ADRL  $00000000  ;  free blocks
L1926    DW    $0000      ;  file system

L1928    JMPL  L8D0F
         JMPL  L8D0F
         JMPL  L8D0F
         JMPL  L8D0F

L1938    DB    $00
         DB    $00
L193A    DB    $00
         DB    $00
L193C    DB    $01
L193D    DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $02
         DB    $01
         DB    $03
         DB    $80
         DB    $04
         DB    $00
         DB    $05
         DB    $04
         DB    $0D
         DB    $04
         DB    $0B
         DB    $00
         DB    $0F
         DB    $00
         DB    $06
         DB    $00
         DB    $07
         DB    $00
         DB    $09
         DB    $80
         DB    $0A
         DB    $00
         DB    $10
         DB    $01
         DB    $11
         DB    $80
         DB    $12
         DB    $00
         DB    $22
         DB    $00
         DB    $32
         DB    $80
         DB    $13
         DB    $00
         DB    $23
         DB    $00
         DB    $33
         DB    $80
         DB    $14
         DB    $00
         DB    $24
         DB    $00
         DB    $34
         DB    $80
         DB    $15
         DB    $00
         DB    $25
         DB    $00
         DB    $35
         DB    $80
         DB    $16
         DB    $00
         DB    $26
         DB    $00
         DB    $36
         DB    $80
         DB    $17
         DB    $00
         DB    $27
         DB    $00
         DB    $37
         DB    $80
         DB    $18
         DB    $00
         DB    $28
         DB    $00
         DB    $38
         DB    $80
         DB    $19
         DB    $00
         DB    $29
         DB    $00
         DB    $39
         DB    $80
         DB    $1A
         DB    $00
         DB    $2A
         DB    $00
         DB    $3A
         DB    $80
         DB    $1B
         DB    $00
         DB    $2B
         DB    $00
         DB    $3B
         DB    $80
         DB    $1C
         DB    $00
         DB    $2C
         DB    $00
         DB    $3C
         DB    $80
         DB    $1D
         DB    $00
         DB    $2D
         DB    $00
         DB    $3D
         DB    $80
         DB    $1E
         DB    $00
         DB    $2E
         DB    $00
         DB    $3E
         DB    $80
         DB    $1F
         DB    $00
         DB    $2F
         DB    $00
         DB    $3F
         DB    $80
         DB    $20
         DB    $00
         DB    $30
         DB    $00
         DB    $40
         DB    $80
         DB    $21
         DB    $00
         DB    $31
         DB    $00
         DB    $41
L19BA    DB    $FF
         DB    $00
         DB    $4F
         DB    $00
         DB    $17
         DB    $00
         DB    $FE
         DB    $00
         DB    $7F
         DB    $00
         DB    $01
         DB    $00
         DB    $FF
         DB    $7F
         DB    $FF
         DB    $7F
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $0F
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
         DB    $7F
         DB    $00
         DB    $FF
         DB    $00
         DB    $01
         DB    $00
L1A38    ADRL  L9D1A
L1A3C    DB    $00
L1A3D    DB    $00
L1A3E    DB    $00
L1A3F    DB    $FE
L1A40    DB    $20
L1A41    DB    $00
L1A42    DB    $00
L1A43    DB    $00
         DB    $00
L1A45    DB    $01
L1A46    DB    $20
L1A47    DB    $00
L1A48    DB    $00
L1A49    DB    $00
L1A4A    DB    $00
L1A4B    DB    $24
         DB    $00
L1A4D    DB    $02
L1A4E    DB    $0D
L1A4F    DB    $1B
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1A5E    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1A6E    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1A7E    DB    $00
         DB    $00
L1A80    DB    $00
         DB    $00
L1A82    DB    $00
         DB    $00
L1A84    DB    $00
         DB    $00
L1A86    DB    $00
         DB    $00
L1A88    DB    $00
         DB    $00
L1A8A    DB    $00
         DB    $00
L1A8C    DB    $00
L1A8D    DB    $00
L1A8E    DB    $00
L1A8F    DB    $00
L1A90    DB    $00
L1A91    DB    $00
L1A92    DB    $00
L1A93    DB    $00
L1A94    DB    $00
L1A95    DB    $00
L1A96    DB    $00
L1A97    DB    $49
L1A98    DB    $00
L1A99    DB    $00
L1A9A    DB    $00
L1A9B    DB    $00
         DB    $00
L1A9D    DB    $00
L1A9E    DB    $00
L1A9F    DB    $00
L1AA0    DB    $00
L1AA1    DB    $00
L1AA2    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1BA2    DB    $EF
L1BA3    DB    $00
L1BA4    DB    $00
         DB    $F0
         DB    $20
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $01
         DB    $20
         DB    $00
         DB    $03
         DB    $80
         DB    $01
         DB    $24
         DB    $00
         DB    $02
         DB    $0D
         DB    $1B
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1BE4    DB    $EF
L1BE5    DB    $00
L1BE6    DB    $00
         DB    $F0
         DB    $20
L1BE9    DB    $01
         DB    $01
         DB    $00
         DB    $00
         DB    $01
         DB    $20
         DB    $00
         DB    $03
         DB    $80
         DB    $01
         DB    $24
         DB    $00
L1BF5    DB    $02
         DB    $0D
         DB    $03
         DB    $0A
         DB    $0B
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1C26    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1C76    DB    $08
         DB    $20
         DB    $08
         DB    $00
L1C7A    DB    $00
         DB    $00
L1C7C    DB    $00
         DB    $00
L1C7E    DB    $00
L1C7F    DB    $00
         DB    $01
         DB    $02
         DB    $04
         DB    $05
         DB    $06
         DB    $10
         DB    $11
         DB    $13
         DB    $12
         DB    $14
         DB    $16
         DB    $17
         DB    $18
         DB    $19

*---------------------------------------

L1C8E    DA    L3CBE-1
         DA    L3CC8-1
         DA    L6311-1
         DA    L64A8-1
         DA    L8057-1
         DA    L3AF0-1
         DA    L3AF6-1
         DA    L8B5A-1
         DA    L8B65-1
         DA    L7AE7-1
         DA    L9045-1
         DA    L903F-1
         DA    L6D7E-1
         DA    L3FA4-1
         DA    L3F75-1
         DA    L5D47-1
         DA    L5D69-1
         DA    L72CA-1
         DA    LB755-1
         DA    LB222-1
         DA    L790C-1
         DA    L670D-1
         DA    LE558-1
         DA    L8C81-1
         DA    L6E97-1
         DA    L5E5F-1
         DA    L5E13-1
         DA    LE1DA-1
         DA    L5812-1

L1CC8    DA    L5889-1
         DA    L5801-1
L1CCC    DA    L23FE-1
         DA    L25BD-1
         DA    L3C08-1
         DA    L3BEF-1

L1CD4    DB    $02
         DB    $00
         DB    $04
         DB    $05
         DB    $07
         DB    $01
         DB    $03
L1CDB    DB    $C0
         DB    $C1
         DB    $C2
         DB    $C3
         DB    $84
         DB    $85
         DB    $06
         DB    $87
L1CE3    DB    $40
         DB    $41
         DB    $42
         DB    $43
         DB    $04
         DB    $05
         DB    $06
         DB    $87
L1CEB    DB    $41
         DB    $58
         DB    $22
         DB    $2B
         DB    $2D
         DB    $26
         DB    $24
         DB    $2E
         DB    $45
         DB    $43
         DB    $52
         DB    $2F
         DB    $23
         DB    $5A
         DB    $2A
L1CFA    DB    $FF
         DB    $80
         DB    $80
         DB    $21
         DB    $20
         DB    $44
         DB    $10
         DB    $04
         DB    $08
         DB    $FF
         DB    $FF
         DB    $80
         DB    $42
         DB    $41
         DB    $02
         DB    $30
         DB    $20
         DB    $20
         DB    $20
         DB    $00
         DB    $00
         DB    $00
         DB    $80
L1D11    DB    $00
         DB    $08
         DB    $10
         DB    $18
         DB    $20
         DB    $28
         DB    $30
         DB    $38
         DB    $40
         DB    $48
         DB    $50
         DB    $58
         DB    $60
         DB    $68
         DB    $70
         DB    $78
         DB    $80
         DB    $88
         DB    $90
         DB    $98
         DB    $A0
         DB    $A8
         DB    $A8
         DB    $B0
         DB    $B8
         DB    $C0
         DB    $C8
         DB    $D0
         DB    $E0
         DB    $E8
         DB    $F0
         DB    $F8
L1D31    DB    $00
L1D32    DB    $02
         DB    $02
         DB    $04
         DB    $08
         DB    $04
         DB    $08
         DB    $01
         DB    $00
         DB    $01
         DB    $02
         DB    $04
         DB    $08
         DB    $04
         DB    $08
         DB    $01

L1D41    DA    LC3D3-1
         DA    LC3F5-1
         DA    LC3E9-1
         DA    LC4AB-1
         DA    LC8B7-1
         DA    LC3E9-1

L1D4D    ASC   'UNKBADPCDPTXTXTPDABINFNTFOTBA3DA3WPFSOS$'
         ASC   '0D$0EDIRRPDRPIAFDAFMAFRSCLADBAWPASPGSBTD'
         ASC   'FBDFSRCOBJLIBS16RTLEXEPPIPTINDACDATOLDVR'
         ASC   '$BC$BD$BEDOC$C0PIC$E0WAVDTSR16PASCMDDSKO'
         ASC   '.SINTIVRBASVARRELSYS'

L1E01    HEX   000102030405060708090A0B0C0D0E0F
         HEX   101112131415191A1BABACADB0B1B2B3
         HEX   B4B5B6B7B8B9BABBBCBDBEBFC0C1E0E1
         HEX   E2EEEFF0F1F9FAFBFCFDFEFF

L1E3D    ASC   'Jan-Feb-Mar-Apr-May-Jun-Jul-Aug-Sep-Oct-Nov-Dec-'
         DB    $00
         DB    $00
L1E6F    ASC   'Sun,Mon,Tue,Wed,Thu,Fri,Sat,'
         DB    $00
         DB    $00
L1E8D    ASC   '[No Date]'
L1E96    HEX   804020000201
L1E9C    ASC   'DNB WR'

L1EA2    HEX   AB205B
         HEX   AC205D
         HEX   AD5A5E
         HEX   042056
         HEX   FF2041
         HEX   0C2041
         HEX   F92040
         HEX   0F5859
         HEX   B32055
         HEX   062047
         DB    $00
L1EC1    HEX   0404030502010007
L1EC9    HEX   0102040804080A03
L1ED1    HEX   4040404000000080
L1ED9    HEX   0080028240C142C2
L1EE1    HEX   00FF00FFFF00FF00

L1EE9    DB    $00
         CLC
         XCE
         JMPL  L415B
         DB    $00

L1EF1    PHP
         SEP   #$30
         LDX   #$20
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$21
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$22
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$23
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$24
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$25
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$26
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$27
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$28
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$29
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$2A
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$2B
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$2C
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$2D
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$2E
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$2F
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$30
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$31
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$32
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$33
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$34
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$35
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$36
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$37
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$38
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$39
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$3A
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$3B
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$3C
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$3D
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$3E
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$3F
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$40
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$41
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$42
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$43
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$44
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$45
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$46
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$47
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$48
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$49
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$4A
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$4B
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$4C
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$4D
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$4E
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$4F
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$50
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$51
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$52
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$53
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$54
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$55
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$56
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$57
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$58
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$59
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$5A
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$5B
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$5C
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$5D
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$5E
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$5F
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$60
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$61
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$62
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$63
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$64
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$65
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$66
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$67
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$68
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$69
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$6A
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$6B
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$6C
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$6D
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$6E
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$6F
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$70
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$71
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$72
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$73
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$74
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$75
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$76
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$77
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$78
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$79
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$7A
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$7B
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$7C
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$7D
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$7E
         BRL   L21F1
         PHP
         SEP   #$30
         LDX   #$7F
         BRL   L21F1

L21F1    PHB
         PHD
         LDA   #^L06EB
         PHA
         PLB
         LDA   L06EC
         XBA
         LDA   L06EB
         TCD
         TXA
         JSL   L9205
         PLD
         PLB
         PLP
         RTL

         SEP   #$30
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

*---------------------------------------
* GS BASIC TOKENS: VERBS
*---------------------------------------

* The first six are direct commands and cannot be in source code
* The others are verbs
* DF is reserved for nouns
* Where are adverbs and operators?

L2210    DA    L4274-1	; 80 AUTO*
         DA    L490B-1	; 81 DEL*
         DA    L4329-1	; 82 EDIT*
         DA    L41CA-1	; 83 HLIST*
         DA    L41D0-1	; 84 LIST*
         DA    L4F9E-1	; 85 RENUM*

         DA    L352C-1	; 86 BREAK
         DA    L8324-1	; 87 FN
         DA    L852D-1	; 88 PROC
         DA    L8B0D-1	; 89 GOSUB
         DA    L8B5A-1	; 8A GOTO
         DA    L8A02-1	; 8B FOR
         DA    L8C79-1	; 8C THEN
         DA    L8C79-1	; 8D ELSE
         DA    L8D56-1	; 8E NEXT
         DA    L81E2-1	; 8F OFF
         DA    L8CDC-1	; 90 ON
         DA    L7DB1-1	; 91 INPUT
         DA    LA888-1	; 92 OUTPUT
         DA    L752A-1	; 93 TEXT
         DA    L32A3-1	; 94 TIMER
         DA    L80F0-1	; 95 EXCEPTION

L223C    DA    LC1E4-1	; 96 CAT
         DA    LBABF-1	; 97 COPY
         DA    LBC74-1	; 98 INIT
         DA    LCCAE-1	; 99 INVOKE
         DA    LCA89-1	; 9A LIBRARY
         DA    LBF82-1	; 9B PREFIX
         DA    LC0D3-1	; 9C TYPE
         DA    LBE50-1	; 9D LOAD
         DA    LBCFE-1	; 9E SAVE
         DA    LBF7A-1	; 9F DELETE
         DA    L38B1-1	; A0 RUN
         DA    LBF11-1	; A1 RENAME
         DA    LBC12-1	; A2 CREATE
         DA    LBF61-1	; A3 LOCK
         DA    LBF5D-1	; A4 UNLOCK
         DA    LA89C-1	; A5 EXEC
         DA    LBA70-1	; A6 CHAIN
         DA    LC1E8-1	; A7 CATALOG
         DA    LAFBF-1	; A8 OPEN
         DA    L3E73-1	; A9 QUIT
         DA    LC1C8-1	; AA DIR
         DA    L6442-1	; AB DIM
         DA    L7FA4-1	; AC READ
         DA    LB3F8-1	; AD WRITE
         DA    LAC81-1	; AE CLOSE
         DA    L918F-1	; AF TASKPOLL
         DA    LABFA-1	; B0 LOCATE
         DA    L9138-1	; B1 EVENTDEF
         DA    L90B7-1	; B2 MENUDEF
         DA    LC037-1	; B3 VOLUMES
         DA    LD3D2-1	; B4 CALL%
         DA    LD522-1	; B5 CALL
         DA    LD522-1	; B6 _
         DA    LAB7D-1	; B7 TEXTPORT
         DA    LD592-1	; B8 PERFORM
         DA    L7446-1	; B9 GRAF
         DA    L7AA5-1  ; BA DBUG
         DA    L8C3B-1	; BB POP
         DA    L7545-1	; BC HOME
         DA    L71E7-1	; BD SUB$(
         DA    L750F-1	; BE TRACE
         DA    L7523-1	; BF NOTRACE
         DA    L7505-1	; C0 NORMAL
         DA    L750A-1	; C1 INVERSE
         DA    L8061-1	; C2 RESUME
         DA    L5DD8-1	; C3 LET
         DA    L8E11-1	; C4 IF
         DA    L3D84-1	; C5 RESTORE
         DA    L7709-1	; C6 SWAP
         DA    L8BEE-1	; C7 RETURN
         DA    L8C7C-1	; C8 REM
         DA    L3DFB-1	; C9 STOP
         DA    L8C79-1	; CA DATA
         DA    L8C79-1	; CB IMAGE
         DA    LD0C2-1	; CC LIBFIND
         DA    L82FD-1	; CD DEF
         DA    L93BE-1	; CE PRINT
         DA    L5990-1	; CF CLEAR
         DA    L7494-1	; D0 RANDOMIZE
         DA    L59EC-1	; D1 NEW
         DA    L7AC5-1	; D2 POKE
         DA    L754C-1	; D3 ASSIGN
         DA    LB37E-1	; D4 GET
         DA    LB3D6-1	; D5 PUT
         DA    L5F0E-1	; D6 SET
         DA    L7ACF-1	; D7 ERROR
         DA    L69DC-1	; D8 ERASE
         DA    L8901-1	; D9 LOCAL
         DA    L8944-1	; DA WHILE
         DA    L3E35-1	; DB CONT
         DA    L89EC-1	; DC DO
         DA    L89C8-1	; DD UNTIL
         DA    L85EE-1	; DE END
         DA    L6356-1	; DF * EVERYTHING BUT VERBS
* E0-E9 - weird verbs
         DA    L74D4-1	; E0 
         DA    L74F3-1	; E1 
         DA    L6F8C-1	; E2 
         DA    L6F9B-1	; E3 
         DA    L7102-1	; E4 
         DA    L7135-1	; E5 
         DA    L74C0-1	; E6 
         DA    L74C7-1	; E7 
         DA    L7472-1	; E8 
         DA    L74B9-1	; E9 
         DA    L3F9A-1	; EA NOT IMPLEMENTED
         DA    L3F9A-1	; EB NOT IMPLEMENTED
         DA    L3F9A-1	; EC NOT IMPLEMENTED
         DA    L3F9A-1	; ED NOT IMPLEMENTED
         DA    L3F9A-1	; EE NOT IMPLEMENTED
         DA    L3F9A-1	; EF NOT IMPLEMENTED
         DA    L3F9A-1	; F0 NOT IMPLEMENTED
         DA    L3F9A-1	; F1 NOT IMPLEMENTED
         DA    L3F9A-1	; F2 NOT IMPLEMENTED
         DA    L3F9A-1	; F3 NOT IMPLEMENTED
         DA    L3F9A-1	; F4 NOT IMPLEMENTED
         DA    L3F9A-1	; F5 NOT IMPLEMENTED

*---------------------------------------
* GS BASIC TOKENS: NOUNS (DF) WITH A (
*---------------------------------------

L22FC    DA    L7A8A	; DF 80 TAB()
L22FE    DA    L7A9D	; DF 81 TO
         DA    L6F56	; DF 82 SPC()
         DA    L6F5C	; DF 83 USING
         DA    L70DE	; DF 84 APPEND
         DA    L711E	; DF 85 MOD
         DA    L7C01	; DF 86 REMDR
         DA    L7C06	; DF 87 STEP
         DA    L747B	; DF 88 AND
         DA    L7BFC	; DF 89 OR
         DA    LB630	; DF 8A XOR
         DA    LD5AD	; DF 8B DIV
         DA    L793F	; DF 8C SRC
         DA    L77C4	; DF 8D NOT
         DA    L7BEC	; DF 8E DIR
         DA    L7C14	; DF 8F UPDATE
         DA    L7C0B	; DF 90 TXT
         DA    L7C10	; DF 91 BDF
         DA    L7BA5	; DF 92 FILTYP=
         DA    L7BAB	; DF 93 AS
         DA    L7481	; DF 94 AUTO
         DA    L748D	; DF 95 ' '

         DA    LDF01-1	; 96 SGN(
         DA    LDF18-1	; 97 INT(
         DA    LDF70-1	; DF 98 ABS(
         DA    LB64F-1	; 99 TYP(
         DA    LB684-1	; 9A REC(
         DA    L7B48-1	; 9B JOYX(
         DA    L7B04-1	; 9C PDL(
         DA    L7BB4-1	; 9D BTN(
         DA    L78FC-1	; 9E R.STACK%(
         DA    L78D1-1	; 9F R.STACK@(
         DA    L78A9-1	; A0 R.STACK&(
         DA    LDF61-1	; A1 SQR(
         DA    LE115-1	; A2 RND(
         DA    LE0DE-1	; A3 LOG(
         DA    LE0E3-1	; A4 LOG1(
         DA    LE0E8-1	; A5 LOG2(
         DA    LE0ED-1	; A6 LOGB%(
         DA    LE0F2-1	; A7 EXP(
         DA    LE0F7-1	; A8 EXP1(
         DA    LE0FC-1	; A9 EXP2(
         DA    LE101-1	; AA COS(
         DA    LE106-1	; AB SIN(
         DA    LE10B-1	; AC TAN(
         DA    LE110-1	; AD ATN(
         DA    L791E-1	; AE BASIC@(
         DA    L6FF9-1	; AF DATE( 
         DA    LB6B1-1	; B0 EOFMARK(
         DA    LB640-1	; B1 FILTYP(
         DA    LDF66-1	; B2 FIX(
         DA    L77E3-1	; B3 FREMEN(
         DA    LDF83-1	; B4 NEGATE(
         DA    L7AAE-1	; B5 PEEK(
         DA    LDF57-1	; B6 ROUND(
         DA    L92D4-1	; B7 TASKREC%(
         DA    L92EA-1	; B8 TASKREC@(
         DA    L7031-1	; B9 TIME(
         DA    L7D9B-1	; BA UIR(
         DA    L6F50-1	; BB STR$(
         DA    L76D2-1	; BC HEX$(
         DA    L70B6-1	; BD PFX$(
         DA    L7079-1	; BE SPACE$(
         DA    L7047-1	; BF ERRTXT$(
         DA    L72E4-1	; C0 CHR$(
         DA    LDC74-1	; C1 RELATION(
         DA    LE193-1	; C2 ANU(
         DA    LE197-1	; C3 COMPI(
         DA    LDEF6-1	; C4 SCALB(
         DA    L6356-1	; C5 SCALE(
         DA    L737D-1	; C6 LEN(
         DA    L73E4-1	; C7 VAL(
         DA    L73AD-1	; C8 ASC(
         DA    L71C5-1	; C9 UCASE$(
         DA    L765A-1	; CA TEN(
         DA    LE1A5-1	; CB CONV#(
         DA    LE1C0-1	; CC CONV@(
         DA    LE1AE-1	; CD CONV(
         DA    LE1B7-1	; CE CONV&(
         DA    LE1DA-1	; CF CONV$(
         DA    LE1C9-1	; D0 CONV%(
         DA    L72F6-1	; D1 LEFT$(
         DA    L732B-1	; D2 RIGHT$(
         DA    L7096-1	; D3 REP$(
         DA    L7336-1	; D4 MID$(
         DA    L713B-1	; D5 INSTR(
         DA    L7A39-1	; D6 VARPTR(
         DA    L7A5F-1	; D7 VARPTR$(
         DA    L79FF-1	; D8 VAR$(
         DA    L7954-1	; D9 VAR(
         DA    L6979-1	; DA UBOUND(
         DA    L75DB-1	; DB FILE(
         DA    L762A-1	; DC EXEVENT@(

L23B6    DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $04
         DB    $09
         DB    $03
         DB    $02
         DB    $02
         DB    $06
         DB    $06
         DB    $07
         DB    $08
         DB    $08
         DB    $05
         DB    $05
         DB    $01

L23C9    DA    LDC91
         DA    LDC91
         DA    LDC91
         DA    LDC91
         DA    LDC91
         DA    LDC91
         DA    LDC91
         DA    LDB73
         DA    LDD5C
         DA    LDD6C
         DA    LDD7A
         DA    LD9E0
         DA    LDB69
         DA    LD92C
         DA    LDB6E
         DA    LDA7A
         DA    LD8A6
         DA    LD821
         DB    $00

L23EE    DB    $00
         DB    $3E
         DB    $3D
         DB    $3C
         DB    $5E
         DB    $88
         DB    $89
         DB    $8A
         DB    $85
         DB    $86
         DB    $8B
         DB    $2F
         DB    $2A
         DB    $2D
         DB    $2B
         DB    $00

L23FE    DCI   'AUTO'     ; 80 ADDRESS FOUND
         DCI   'DEL'      ; 81
         DCI   'EDIT'     ; 82
         DCI   'HLIST'    ; 83
         DCI   'LIST'     ; 84
         DCI   'RENUM'    ; 85

L2417    DCI   'BREAK'    ; 86 - ADDRESS FOUND
         DCI   'FN'       ; 87
         DCI   'PROC'     ; 88
         DCI   'GOSUB'    ; 89
         DCI   'GOTO'     ; 8A
         DCI   'FOR'      ; 8B
         DCI   'THEN'     ; 8C
         DCI   'ELSE'     ; 8D
         DCI   'NEXT'     ; 8E
         DCI   'OFF'      ; 8F
         DCI   'ON'       ; 90
         DCI   'INPUT'    ; 91
         DCI   'OUTPUT'   ; 92
         DCI   'TEXT'     ; 93
         DCI   'TIMER'    ; 94
         DCI   'EXCEPTION' ; 95
         DCI   'CAT'      ; 96
         DCI   'COPY'     ; 97
         DCI   'INIT'     ; 98
         DCI   'INVOKE'   ; 99
         DCI   'LIBRARY'  ; 9A
         DCI   'PREFIX'   ; 9B
         DCI   'TYPE'     ; 9C
         DCI   'LOAD'     ; 9D
         DCI   'SAVE'     ; 9E
         DCI   'DELETE'   ; 9F
         DCI   'RUN'      ; A0
         DCI   'RENAME'   ; A1
         DCI   'CREATE'   ; A2
         DCI   'LOCK'     ; A3
         DCI   'UNLOCK'   ; A4
         DCI   'EXEC'     ; A5
         DCI   'CHAIN'    ; A6
         DCI   'CATALOG'  ; A7
         DCI   'OPEN'     ; A8
         DCI   'QUIT'     ; A9

L24BD    DCI   'DIR'      ; AA - ADDRESS FOUND
         DCI   'DIM'      ; AB
         DCI   'READ'     ; AC
         DCI   'WRITE'    ; AD
         DCI   'CLOSE'    ; AE
         DCI   'TASKPOLL' ; AF
         DCI   'LOCATE'   ; B0
         DCI   'EVENTDEF' ; B1
         DCI   'MENUDEF'  ; B2
         DCI   'VOLUMES'  ; B3
         DCI   'CALL%'    ; B4
         DCI   'CALL'     ; B5
         DCI   '_'        ; B6
         DCI   'TEXTPORT' ; B7
         DCI   'PERFORM'  ; B8
         DCI   'GRAF'     ; B9
         DCI   'DBUG'     ; BA
         DCI   'POP'      ; BB
         DCI   'HOME'     ; BC
         DCI   'SUB$('    ; BD
         DCI   'TRACE'    ; BE
         DCI   'NOTRACE'  ; BF
         DCI   'NORMAL'   ; C0
         DCI   'INVERSE'  ; C1
         DCI   'RESUME'   ; C2
         DCI   'LET'      ; C3
         DCI   'IF'       ; C4
         DCI   'RESTORE'  ; C5
         DCI   'SWAP'     ; C6
         DCI   'RETURN'   ; C7
         DCI   'REM'      ; C8
         DCI   'STOP'     ; C9
         DCI   'DATA'     ; CA
         DCI   'IMAGE'    ; CB
         DCI   'LIBFIND'  ; CC
         DCI   'DEF'      ; CD
         DCI   'PRINT'    ; CE
         DCI   'CLEAR'    ; CF
         DCI   'RANDOMIZE' ; D0
         DCI   'NEW'      ; D1
         DCI   'POKE'     ; D2
         DCI   'ASSIGN'   ; D3
         DCI   'GET'      ; D4
         DCI   'PUT'      ; D5
         DCI   'SET'      ; D6
         DCI   'ERROR'    ; D7
         DCI   'ERASE'    ; D8
         DCI   'LOCAL'    ; D9
         DCI   'WHILE'    ; DA
         DCI   'CONT'     ; DB
         DCI   'DO'       ; DC
         DCI   'UNTIL'    ; DD
         DCI   'END'      ; DE
         DCI   ' '        ; EVERYTHING BUT VERBS

L25BD    DCI   'HPOS'     ; DF E0
         DCI   'VPOS'     ; DF E1
         DCI   'TIME$'    ; DF E2
         DCI   'DATE$'    ; DF E3
         DCI   'PREFIX$'  ; DF E4
         DCI   'PROGNAM$' ; DF E5
         DCI   'OUTREC'   ; DF E6
         DCI   'INDENT'   ; DF E7
         DCI   'SHOWDIGITS' ; DF E8
         DCI   'LISTTAB'  ; DF E9
         DCI   'AUXID@'   ; DF EA
         DCI   'EXFN'     ; DF EB
         DCI   'SECONDS@' ; DF EC
         DCI   'FRE'      ; DF ED
         DCI   'ERRLIN'   ; DF EE
         DCI   'ERR'      ; DF EF
         DCI   'KBD'      ; DF F0
         DCI   'EOF'      ; DF F1
         DCI   'JOYY'     ; DF F2
         DCI   'PDL9'     ; DF F3
         DCI   'PI'       ; DF F4
         DCI   'ERRTOOL'  ; DF F5
         DCI   'TAB('     ; DF 80
         DCI   'TO'       ; DF 81
         DCI   'SPC('     ; DF 82
         DCI   'USING'    ; DF 83
         DCI   'APPEND'   ; DF 84
         DCI   'MOD'      ; DF 85
         DCI   'REMDR'    ; DF 86
         DCI   'STEP'     ; DF 87
         DCI   'AND'      ; DF 88
         DCI   'OR'       ; DF 89
         DCI   'XOR'      ; DF 8A
         DCI   'DIV'      ; DF 8B
         DCI   'SRC'      ; DF 8C
         DCI   'NOT'      ; DF 8D
         DCI   'DIR'      ; DF 8E
         DCI   'UPDATE'   ; DF 8F
         DCI   'TXT'      ; DF 90
         DCI   'BDF'      ; DF 91
         DCI   'FILTYP='  ; DF 92
         DCI   'AS'       ; DF 93
         DCI   'AUTO'     ; DF 94
         DCI   ' '        ; DF 95
         DCI   'SGN('     ; DF 96 - ADDRESS FOUND
         DCI   'INT('     ; DF 97
         DCI   'ABS('     ; DF 98
         DCI   'TYP('     ; DF 99
         DCI   'REC('     ; DF 9A
         DCI   'JOYX('    ; DF 9B
         DCI   'PDL('     ; DF 9C
         DCI   'BTN('     ; DF 9D
         DCI   'R.STACK%(' ; DF 9E
         DCI   'R.STACK@(' ; DF 9F
         DCI   'R.STACK&(' ; DF A0
         DCI   'SQR('     ; DF A1
         DCI   'RND('     ; DF A2
         DCI   'LOG('     ; DF A3
         DCI   'LOG1('    ; DF A4
         DCI   'LOG2('    ; DF A5
         DCI   'LOGB%('   ; DF A6
         DCI   'EXP('     ; DF A7
         DCI   'EXP1('    ; DF A8
         DCI   'EXP2('    ; DF A9
         DCI   'COS('     ; DF AA
         DCI   'SIN('     ; DF AB
         DCI   'TAN('     ; DF AC
         DCI   'ATN('     ; DF AD
         DCI   'BASIC@('  ; DF AE
         DCI   'DATE('    ; DF AF
         DCI   'EOFMARK(' ; DF B0
         DCI   'FILTYP('  ; DF B1
         DCI   'FIX('     ; DF B2
         DCI   'FREMEM('  ; DF B3
         DCI   'NEGATE('  ; DF B4
         DCI   'PEEK('    ; DF B5
         DCI   'ROUND('   ; DF B6
         DCI   'TASKREC%(' ; DF B7
         DCI   'TASKREC@(' ; DF B8
         DCI   'TIME('    ; DF B9
         DCI   'UIR('     ; DF BA
         DCI   'STR$('    ; DF BB
         DCI   'HEX$('    ; DF BC
         DCI   'PFX$('    ; DF BD
         DCI   'SPACE$('  ; DF BE
         DCI   'ERRTXT$(' ; DF BF
         DCI   'CHR$('    ; DF C0
         DCI   'RELATION(' ; DF C1
         DCI   'ANU('     ; DF C2
         DCI   'COMPI('   ; DF C3
         DCI   'SCALB('   ; DF C4
         DCI   'SCALE('   ; DF C5
         DCI   'LEN('     ; DF C6
         DCI   'VAL('     ; DF C7
         DCI   'ASC('     ; DF C8
         DCI   'UCASE$('  ; DF C9
         DCI   'TEN('     ; DF CA
         DCI   'CONV#('   ; DF CB
         DCI   'CONV@('   ; DF CC
         DCI   'CONV('    ; DF CD
         DCI   'CONV&('   ; DF CE
         DCI   'CONV$('   ; DF CF
         DCI   'CONV%('   ; DF D0
         DCI   'LEFT$('   ; DF D1
         DCI   'RIGHT$('  ; DF D2
         DCI   'REP$('    ; DF D3
         DCI   'MID$('    ; DF D4
         DCI   'INSTR('   ; DF D5
         DCI   'VARPTR('  ; DF D6
         DCI   'VARPTR$(' ; DF D7
         DCI   'VAR$('    ; DF D8
         DCI   'VAR('     ; DF D9
         DCI   'UBOUND('  ; DF DA
         DCI   'FILE('    ; DF DB
         DCI   'EXEVENT@(' ; DF DC

         ASC   00

L280F    ASC   'APPEND '

L2816    DCI   'NEXT w/o FOR'
         DCI   'SYNTAX'
         DCI   'RETURN w/o GOSUB'
         DCI   'OUT of DATA'
         DCI   'ILLEGAL QUANTITY'
         DCI   'INVALID DATA'
         DCI   'ILLEGAL LINE NUMBER/LABEL'
         DCI   'DUPLICATE LABEL'
         DCI   'OVERFLOW'
         DCI   'OUT of MEMORY'
         ASC   'UNDEF'27
         DCI   'D STATEMENT'
         DCI   'BAD SUBSCRIPT'
         DCI   'RANGE'
         DCI   'STACK OVERFLOW'
         DCI   'DUPLICATE DEFINITION'
         DCI   'DIVISION by ZERO'
         DCI   'ILLEGAL DIRECT'
         DCI   'TYPE MISMATCH'
         DCI   'STRING TOO LONG'
         DCI   'FORMULA TOO COMPLEX'
         ASC   'CAN'27
         DCI   'T CONTINUE'
         ASC   'UNDEF'27
         DCI   'D PROC/FUNCTION'
         DCI   'VARIABLE'
         DCI   'TOOLSET CALL'
         DCI   'ProDOS CALL'
         DCI   'FILE OPEN'
         DCI   'VOLUME TYPE'
         DCI   'DRIVE EMPTY'
         DCI   'FILE TYPE'
         DCI   'I/O'
         DCI   'FILE TOO LARGE'
         DCI   'WRITE PROTECT'
         DCI   'VOLUME SWITCHED'
         DCI   'BAD PATH'
         DCI   'FILE NOT FOUND'
         DCI   'PATH NOT FOUND'
         DCI   'VOLUME NOT FOUND'
         DCI   'DUPLICATE FILE'
         DCI   'DISK FULL'
         DCI   'FILE LOCKED'
         DCI   'FILE NOT OPEN'
         DCI   'DEVICE NOT CONNECTED'
         DCI   'INT/FCB/VCB TBL FULL'
         DCI   'DIRECTORY FULL'
         DCI   'DUPLICATE VOLUME'
         DCI   ' = ADRS: INTERNAL'
         DCI   'FOR w/o NEXT'
         DCI   'POSITION RANGE'
         DCI   'FILE CREATE'
         DCI   'DIFFERENT VOLUMES'
         DCI   'DAMAGED DIRECTORY'
         DCI   'LINE TOO LONG'
         DCI   'RESERVED WORD'
         DCI   'ARGUMENT COUNT'
         DCI   'ARGUMENT TYPE MISMATCH'
         DCI   'UNDEFINED ARRAY'
         DCI   'WHILE w/o UNTIL'
         DCI   'UNTIL w/o WHILE'
         DCI   'MULTI STATEMENT'
         DCI   'MISSING OPERAND'
         DCI   'NESTED DEF'
         DCI   'RECURSION'
         DCI   'MISSING END PROC/FN'
         DCI   'END PROC/FN w/o DEF'
         DCI   'MISSING RETURN'

         ASC   'DAMAGE REPORT SCOTTY?'0D'CAP'27
         DCI   'N, THE LITERAL POOL IS COMPLETELY FRIED!!'

         DCI   'NOT LOCAL'
         DCI   'MULTI-LINE FN REF'
         DCI   'PROC NAME'
         DCI   'INPUT USING PARM'
         DCI   'UNCLAIMED EVENT'
         DCI   'SANE INVALID'
         DCI   'INEXACT'
         DCI   'UNDERFLOW'
         DCI   'NOT A NUMBER'
         DCI   'NO SEGMENT'
         DCI   'NO LIBRARY/INVOKE'
         DCI   'STRING SPACE'
         DCI   'MENU or EVENT'
         DCI   'TASKPOLL INIT &/ WINDSTARTUP'
         DCI   'DEVICE NOT FOUND'
         DCI   'INVALID DEVICE'
         DCI   'ProDOS VERSION'
         DCI   'RETURN 0'
         DCI   'DIR PATTERN'
         DCI   'CAN'27'T RENUMBER'
         DCI   'STRING TEMP OVERFLOW'
         DCI   'CLOSED FCB'
         DCI   'NOT IMPLEMENTED'
L2D0D    DCI   'PROGRAM'
L2D14    ASC   ' ERROR'0700
         ASC   0D
         ASC   'Please Press SPACE BAR'00
L2D34    ASC   ' IN '00
L2D39    ASC   'PROGRAM INTERRUPTED'0700
L2D4E    ASC   'EXTRA INPUT IGNORED!'00
L2D63    ASC   '?REENTER'0D00

* BD 201901 - Typo: destroy, was destory

L2D6D    ASC   'Press Y if you want to destroy '00
L2D8D    ASC   '.!'00

L2D90    STR   'GS BASIC CAN'27'T RESET '
L2DA6    STR   'GS BASIC ABORT: LOADTOOLS ERROR '
L2DC7    STR   'GS BASIC ABORT: MEM ALLOC ERROR '
L2DE8    STR   'GS BASIC CAN'27'T QUIT '

* BD 201901 - Added a space after a comma

L2DFD    STR   'John O. Arkley'
         ASC   00
L2E0D    STR   'David Eyes, Taylor Pohlman, Dan Wendin, Clayton Lewis, Bill Goldberg, Jim Merritt, Tom Chavez, Doug Thom, Brutal Deluxe Software'
         ASC   00
L2E70    STR   'Don Dennman, Charles S. Mauro, JOA, Randy Wigginton'
         ASC   00

L2EA2    DB    $10
         DB    $51
         DB    $11
         DB    $52
         DB    $25
         DB    $2B
         DB    $27
         DB    $1E
         DB    $28
         DB    $2A
         DB    $2B
         DB    $20
         DB    $2E
         DB    $21
         DB    $2F
         DB    $1C
         DB    $40
         DB    $22
         DB    $41
         DB    $1D
         DB    $42
         DB    $2B
         DB    $44
         DB    $24
         DB    $45
         DB    $25
         DB    $46
         DB    $23
         DB    $47
         DB    $26
         DB    $48
         DB    $27
         DB    $49
         DB    $2C
         DB    $4D
         DB    $30
         DB    $4E
         DB    $28
         DB    $4F
         DB    $31
         DB    $50
         DB    $1A
         DB    $51
         DB    $33
         DB    $52
         DB    $1B
         DB    $54
         DB    $0A
         DB    $55
         DB    $2B
         DB    $57
         DB    $2D
         DB    $58
         DB    $12
         DB    $5B
         DB    $32
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

*-----------------------
* GRAF INIT
*-----------------------

L2F00    JSR   L742D
         XBA
         TYA
         XBA
         REP   #$30
         TAX
         BEQ   L2F1C
         CMP   #$0140	; 320
         BEQ   L2F1C
         CMP   #$0280	; 640
         BEQ   L2F1C
         SEP   #$30
         BRL   L6708
         REP   #$30
L2F1C    PHA
         LDA   L1030
         STA   $9B
         LDA   L1032
         STA   $9D
         LDA   [$9B]
         STA   $9B
         PEA   $0000
         PEA   $0000
         _GetTick
         BCS   L2F53
         PLA
         STA   $9D
         PLX
L2F3E    PEA   $0000
         PEA   $0000
         _GetTick
         BCS   L2F53
         PLA
         PLX
         CMP   $9D
         BEQ   L2F3E
L2F53    STZ   $9D
         LDA   L102B
         BEQ   L2F63
         _QDShutDown
         BCS   L2F88
L2F63    PLX
         STX   L102B
         BNE   L2F6C
         BRL   L3026
L2F6C    LDA   #$0000
         CPX   #$0140
         BEQ   L2F77
         LDA   #$0080
L2F77    PEI   $9B
         PHA
         PEA   $00A0
         PEI   $07
         _QDStartUp
         BCC   L2F8B
L2F88    BRL   L3029
L2F8B    _GrafOff
         BCS   L2FD9
         PEA   $0000
         LDX   L102B
         LDA   #$013F
         CPX   #$0140
         BEQ   L2FA5
         LDA   #$027F
L2FA5    PHA
         PEA   $0000
         PEA   $00C7
         _ClampMouse
         BCS   L302C
         _HomeMouse
         PEA   $0000
         _WindStatus
         BCC   L2FCD
         CMP   #$0003
         BCS   L2FD9
L2FCD    PLA
         STA   $9D
         BEQ   L2FDB
         _WindNewRes
L2FD9    BCS   L302C
L2FDB    PEA   $0000
         _MenuStatus
         BCC   L2FEC
         CMP   #$0003
         BCS   L302C
L2FEC    PLA
         BEQ   L2FF8
         _MenuNewRes
         BCS   L302C
L2FF8    PEA   $0000
         _CtlStatus
         BCC   L3009
         CMP   #$0003
         BCS   L302C
L3009    PLA
         BEQ   L3015
         _CtlNewRes
         BCS   L302C
L3015    LDA   $9D
         BEQ   L3026
         PEA   $0000
         PEA   $0000
         _RefreshDesktop
L3026    SEP   #$30
         RTS

L3029    STZ   L102B
L302C    SEP   #$30
         BRL   L3F6A
L3031    REP   #$30
         _TLStartUp
         BCS   L3091
         PEA   $0000
         _MMStartUp
         BCS   L3091
         PLA
         STA   $07
         _MTStartUp
         BCS   L3091
         PEA   ^L3187
         PEA   L3187
         _LoadTools
         BCS   L3091
         _TextStartUp
         BCS   L3091
         _IMStartUp
         BCS   L3091
         LDA   $04
         AND   #$FF00
         ADC   #$0100
         PHA
         _SANEStartUp
         BCS   L3091
         JSL   GSOS
         DW    $002A      ; GetVersion
         ADRL  L1789
L3091    BCS   L30BF
         LDA   L1789
         AND   #$7F00
         CMP   #$0200
         BCC   L30A1
         DEC   L178B
L30A1    PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0A00
         PEI   $07
         PEA   $4015
         PEA   $0000
         PEA   $0000
         _NewHandle
L30BF    BCS   L310A
         PLA
         STA   L1030
         STA   $9B
         PLA
         STA   L1032
         STA   $9D
         LDA   [$9B]
         STA   $9B
         STZ   $9D
         STZ   $F1
         STZ   $F3
         LDA   $9B
         CLC
         ADC   #$0300
         PHA
         PEA   $0014
         PEA   $0000
         PEA   $0280
         PEA   $0000
         PEA   $00C8
         PEI   $07
         _EMStartUp
         BCS   L310A
         PEA   $0000
         _LoaderStatus
         BCS   L310A
         PLA
         BNE   L310C
         LDA   #$1102
L310A    BRA   L3175
L310C    PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000A
         _GetTSPtr
         BCS   L3175
         PLA
         STA   $9B
         PLA
         STA   $9D
         LDY   #$002E
         LDX   #$000B
L312D    LDA   [$9B],Y
         DEX
         STA   L0B68,X
         DEY
         DEY
         DEX
         BPL   L312D
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $000A
         _GetWAP
         BCS   L3175
         PLA
         STA   L0B74
         PLA
         STA   L0B76
         PEA   ^L0B8A
         PEA   L0B8A
         PEA   $0005
         LDX   #$0000
         JSL   L00F7
         PEA   $001F
         PEA   $0001
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         RTS

L3175    REP   #$30
         PHA
         PEA   ^L2DA6
         PEA   L2DA6
         _SysFailMgr
         BRK   $B0

L3187    DW    $0002      ; Number of tools
         DW    $0008      ; Tool 8
         DW    $0100      ;  version 1
         DW    $000A      ; Tool 10
         DW    $0100      ;  version 1

L3191    REP   #$30
         PHX
         LDY   L1040,X
         LDA   L1042,X
         PEA   $0000
         PEA   $0000
         PHA
         PHY
         PEI   $07
         LDA   L1054,X
         PHA
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L321A
         PLA
         PLY
         PLX
         PHX
         PEA   $0000
         PEA   $0000
         PHY
         PHA
         STA   L1034,X
         STA   $EB
         TYA
         STA   L1036,X
         STA   $ED
         _GetHandleSize
         BCS   L321A
         PLA
         PLY
         PLX
         PHX
         STA   L1040,X
         TYA
         STA   L1042,X
         PEI   $ED
         PEI   $EB
         _HLock
         BCS   L321A
         PLX
         LDY   #$0002
         LDA   [$EB],Y
         TAY
         LDA   [$EB]
         STA   L1060,X
         TYA
         STA   L1062,X
         LDA   L1060,X
         CLC
         ADC   L1040,X
         STA   L106C,X
         LDA   L1062,X
         ADC   L1042,X
         STA   L106E,X
         SEP   #$30
         RTS

         REP   #$30
         LDA   #$BB01
L321A    PHA
         PEA   ^L2DC7
         PEA   L2DC7
         _SysFailMgr
         BRK   $B1

         SEP   #$30
L322C    LDX   #$08
L322E    JSR   L3191
         DEX
         DEX
         DEX
         DEX
         CPX   #$FC
         BNE   L322E
         LDA   L106C
         STA   $6F
         LDA   L1062
         STA   $62
         LDA   L1066
         STA   $74
         REP   #$30
         LDA   L106D
         DEC
         STA   $70
         LDA   L1060
         STA   $60
         LDA   L1064
         STA   $72
         LDA   L1074
         BNE   L3262
         DEC   L1076
L3262    DEC
         STA   L1074
         LDA   L1070
         BNE   L326E
         DEC   L1072
L326E    DEC
         STA   L1070
         LDA   L1068
         STA   $4E
         LDX   L106A
         STX   $50
         SEC
         ADC   #$0004
         BCC   L3283
         INX
L3283    STA   $4B
         SEP   #$30
         STX   $4D
         LDA   #$04
         STA   [$4E]
         LDY   #$01
         LDA   #$10
         STA   [$4E],Y
         INY
         LDA   L0B1E
         STA   [$4E],Y
         INY
         LDA   L0B1C
         STA   [$4E],Y
         RTS

L32A0    BRL   L6356

*-----------------------
* TIMER
*-----------------------

L32A3    BEQ   L32A0
         JSR   L6306
         CMP   #$90
         BEQ   L32B3
         CMP   #$8F
         BNE   L32A0
         BRL   L332E
L32B3    LDA   L170B
         BNE   L32BE
         DEC   L170B
         JSR   L3358
L32BE    REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _ReadTimeHex
         STZ   $C1
         STZ   L1707
         STZ   L1709
         SEP   #$30
         PLA
         STA   L1707
         LDA   #$3C
         STA   $C0
         PLA
         STA   $EF
         STZ   $F0
         JSR   L694C
         REP   #$30
         LDA   $C0
         CLC
         ADC   L1707
         STA   L1707
         LDA   #$0E10
         STA   $C0
         SEP   #$30
         PLA
         STA   $EF
         STZ   $F0
         JSR   L694C
         REP   #$30
         LDA   $C0
         CLC
         ADC   L1707
         STA   L1707
         SEP   #$30
         LDA   $C2
         ADC   L1709
         STA   L1709
         PLA
         REP   #$30
         PLA
         PLA
         PEA   $0006
         _IntSource
         SEP   #$30
         RTS

L332E    LDA   L170B
         BNE   L3334
         RTS

L3334    REP   #$30
         STZ   L170B
         PEA   $0007
         _IntSource
         PEA   $0015
         LDA   L1711
         PHA
         LDA   L170F
         PHA
         _SetVector
         SEP   #$30
         RTS

L3358    REP   #$30
         PEA   $0000
         _GetIRQEnable
         PLA
         AND   #$0010
         STA   L170D
         PEA   $0000
         PEA   $0000
         PEA   $0015
         _GetVector
         PLA
         STA   L170F
         PLX
         STX   L1711
         TAY
         BNE   L3387
         DEX
L3387    DEC
         STA   L1713
         STX   L1715
         PEA   $0015
         PEA   ^L33A1
         PEA   L33A1
         _SetVector
         SEP   #$30
         RTS

L33A1    LDAL  L16FF
         BPL   L33C8
         REP   #$30
         LDAL  L1701
         DEC
         STAL  L1701
         BNE   L33CA
         LDAL  L1703
         BEQ   L33C1
         DEC
         STAL  L1702
         BRA   L33CA
L33C1    LDA   #$0040
         STAL  L16FF
L33C8    REP   #$30
L33CA    LDAL  L1707
         INC
         STAL  L1707
         BNE   L33DE
         LDAL  L1709
         INC
         STAL  L1709
L33DE    SEP   #$30
         LDAL  $E1C032
         AND   #$BF
         STAL  $E1C032
         LDAL  L170D
         BEQ   L33FE
         LDAL  L1715
         PHA
         REP   #$30
         LDAL  L1713
         PHA
         SEP   #$30
L33FE    CLC
         RTL

L3400    CMP   L18AB
         BEQ   L342E
         REP   #$30
         AND   #$00FF
         BEQ   L342F
         STA   L18AB
         PEA   $0000
         PEA   $0000
         PHA
         _SetOutputDevice
         LDA   L18AB
         ASL
         STA   L18AD
         TAX
         LDA   L18C1,X
         STAL  $000036
         SEP   #$30
L342E    RTS

L342F    JSR   L3F4C
L3432    REP   #$30
         LDX   L18AD
         LDAL  $000036
         STA   L18C1,X
         SEP   #$30
         RTS

L3441    REP   #$30
         LDX   L18B1
         LDAL  $000038
         STA   L18B3,X
         SEP   #$30
         RTS

L3450    CMP   L18AF
         BEQ   L342E
         REP   #$30
         AND   #$00FF
         BEQ   L342F
         STA   L18AF
         PEA   $0000
         PEA   $0000
         PHA
         _SetInputDevice
         LDA   L18AF
         ASL
         STA   L18B1
         TAX
         LDA   L18B3,X
         STAL  $000038
         SEP   #$30
         RTS

         CMP   L18B3
         BEQ   L342E
L3484    REP   #$30
         AND   #$00FF
         BEQ   L342F
         STA   L18B3
         PEA   $0000
         PEA   $0000
         PHA
         _SetErrorDevice
         LDA   L18B3
         CMP   #$0003
         BEQ   L34AE
         PEA   $0002
         _InitTextDev
L34AE    SEP   #$30
L34B0    RTS

         JSR   LB1FA
L34B4    SEP   #$30
         JSR   L34C1
         JSR   L18D1
         BCC   L34B0
         BRL   L3F75
L34C1    LDA   L1C7F,Y
         STA   L18D5
         LDY   #L18F4
         CMP   #$10
         BCC   L34D9
         BNE   L34D3
         LDY   #L18EA
         BRA   L34D9
L34D3    CMP   #$20
         BCS   L34D9
         LDY   #L18DC
L34D9    LDA   #>L18DC
         STY   L18D7
         STA   L18D7+1
         LDA   #^L18DC
         STA   L18D7+2
         RTS

L34E7    STZ   $0B
         LDY   #$00
L34EB    STY   $0D
         LDA   L17D5,Y
         BEQ   L3511
         BMI   L351D
         CMP   L0007
         BNE   L3511
         LDX   #$00
L34FB    INX
         INY
         LDA   L0007,X
         JSR   L664D
         CMP   L17D5,Y
         BNE   L3511
         CPX   L0007
         BCC   L34FB
         LDX   $0B
         SEC
         RTS

L3511    INC   $0B
         INC   $0B
         LDA   $0D
         CLC
         ADC   #$10
         TAY
         BRA   L34EB
L351D    CLC
         RTS

L351F    LDA   #$FF
         BRA   L3525
L3523    LDA   #$00
L3525    STA   L1787
         STA   L1788
         RTS

*-----------------------
* BREAK
*-----------------------

L352C    BEQ   L354D
         PHA
         JSR   L3CBE
         PLA
         CMP   #$90
         BEQ   L3543
         CMP   #$8F
         BNE   L354D
         STZ   $D1
L353D    LDA   #$40
         TRB   L16F1
         RTS

L3543    LDA   #$40
         STA   $D1
L3547    LDA   $D1
         TSB   L16F1
         RTS

L354D    BRL   L6356
L3550    LDA   L0008
         LDY   L022A
         BNE   L355A
         LDA   #$30
L355A    JSR   L4F89
         BCS   L3565
         CMP   #$2F
         BEQ   L358D
         LDA   #$30
L3565    AND   #$0F
         CMP   #$07
         BEQ   L358D
         BCS   L35A4
         STA   L17A5
         JSL   GSOS
         DW    $000A      ; GetPrefix
         ADRL  L17A5
         BCS   L35A4
         LDA   #$07
         STA   L17A5
         JSL   GSOS
         DW    $0009      ; SetPrefix
         ADRL  L17A5
         BCS   L35A4
L358D    JSR   L35A7
         BCS   L35A3
         LDA   #$07
         STA   L17A5
         JSL   GSOS
         DW    $0009      ; SetPrefix
         ADRL  L17A5
         BCS   L35A4
L35A3    RTS

L35A4    BRL   L3F75
L35A7    LDX   L022A
         BNE   L35AE
L35AC    SEC
         RTS

L35AE    TXY
         STX   L01AA
         LDA   L0008
         CMP   #$2F
         BEQ   L35D7
         JSR   L4F89
         BCC   L35C4
         CPX   #$02
         BEQ   L35AC
         BRA   L35C6
L35C4    INY
         INY
L35C6    STY   L01AA
         JSR   L35D7
         REP   #$30
         LDA   #$2F37
         STA   L01AB
         SEP   #$30
         RTS

L35D7    LDA   L0007,X
         STA   L01AA,Y
         DEY
         DEX
         BNE   L35D7
         CLC
         RTS

L35E3    LDY   L0007
         STY   L022A
         BEQ   L3615
         LDX   #$01
L35ED    LDA   L0007,Y
         CMP   #$2F
         BEQ   L35F8
         INX
         DEY
         BNE   L35ED
L35F8    INX
         STY   L022A
         JSR   L3616
L35FF    INY
         LDA   L0007,Y
         JSR   L664D
         INX
         STA   L0087,X
         CPY   L0007
         BCC   L35FF
         STX   L0087
         STZ   L0088,X
L3615    RTS

L3616    LDA   #$37
         STA   L0088
         LDA   #$2F
         STA   L0089
         LDX   #$02
         RTS

L3623    LDA   L0007
         BEQ   L3647
         LDA   L0008
         CMP   #$2E
         BNE   L3647
         JSL   GSOS
         DW    $0008      ; Volume
         ADRL  L1916
         BCS   L3648
L363B    LDY   L039B
L363E    LDA   L039B,Y
         STA   L0007,Y
         DEY
         BPL   L363E
L3647    RTS

L3648    BRL   L3F75
L364B    REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0100
         PEI   $07
         PEA   $0201
         PEA   $0000
         PEA   $0000
         _NewHandle
         BCS   L36C9
         PLA
         STA   $47
         PLX
         STX   $49
         JSR   L36CC
         REP   #$30
         LDA   #$0002
         PHA
         LDA   #$0001
         PHA
         PEI   $49
         PEI   $47
         _MessageCenter
         BCS   L36BC
         SEP   #$30
         LDY   #$08
         LDA   [$9B],Y
         BEQ   L36A5
         CLC
         ADC   #$08
         BCS   L36A5
         TAY
L369B    LDA   [$9B],Y
         STA   L03EF,Y
         DEY
         CPY   #$08
         BCS   L369B
L36A5    REP   #$30
         LDA   #$0003
         PHA
         LDA   #$0001
         PHA
         PEI   $49
         PEI   $47
         _MessageCenter
         BCS   L36BC
L36BC    REP   #$30
         PEI   $49
         PEI   $47
         _DisposeHandle
L36C9    SEP   #$30
         RTS

L36CC    REP   #$30
         LDY   #$0002
         LDA   [$47],Y
         STA   $9D
         LDA   [$47]
         STA   $9B
         SEP   #$30
         RTS

*
* ENTRY POINT
*

L36DC    SEP   #$30
         LDA   #^L0003
         PHA
         PLB
         LDX   #$00
L36E4    STZ   $00,X
         INX
         BNE   L36E4

         REP   #$30
         TSC
         SEC
         SBC   #$0006
         STAL  SOFTEV
         DEC
         STA   $47
         DEC
         STA   L06E9
         TDC
         STA   L06EB
         STA   L0BF4
         SEP   #$30
         LDY   #$07
L3706    LDA   L1EE9,Y
         STA   [$47],Y
         DEY
         BPL   L3706
         LDAL  SOFTEV+1
         EOR   #$A5
         STAL  PWREDUP
         LDA   L06EC
         STA   $05
         PHB
         PLA
         STA   $06
         PHK
         PLA
         STA   $00
         JSR   L3031
         JSR   L322C
         STZ   $2F
         STZ   $1A
         STZ   $19
         LDA   #$80
         STA   $C4
         LDA   #$40
         STA   $D0
         LDA   L0B7E
         STA   L0B84
         LDA   $71
         STA   $6E
         STA   $6B
         REP   #$30
         LDA   $6F
         STA   $6C
         STA   $69
         LDA   $72
         STA   L1078
         SEP   #$30
         LDA   $74
         STA   L107A
         LDAL  $E0C02E
         AND   #$7F
         STA   L0B2D
         LDAL  $E0C02F
         STA   L0B2C
         REP   #$30
         PEA   ^L0B2C
         PEA   L0B2C
         PEA   ^L0B30
         PEA   L0B30
         LDA   #$0300
         ORA   #$000E
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         JSR   L39CF
         LDA   #$03
         JSR   L3484
         REP   #$30
         PEA   $0002
         _InitTextDev
         SEP   #$30
         JSR   L3A87
         JSR   L38EE
         REP   #$30
         PEA   $0001
         _InitTextDev
         SEP   #$30
         LDA   #L3954
         LDY   #>L3954
         LDX   #^L3954
         JSR   LAB58
         JSR   L5AEE
         STZ   $76
         JSR   L5A7B
         JSR   L3432
         JSR   L3441

         LDA   #$00
         STA   L17A5
         JSL   GSOS
         DW    $000A      ; GetPrefix
         ADRL  L17A5
         BCS   L37DE
         LDA   L01AA
         BNE   L380D

L37DE    LDA   #$01
         STA   L17A5
         JSL   GSOS
         DW    $000A      ; GetPrefix
         ADRL  L17A5
         BCS   L37F4
         LDA   L01AA
         BNE   L37FE
L37F4    JSL   GSOS
         DW    $0028      ; GetBootVol
         ADRL  L17A7
L37FE    LDA   #$00
         STA   L17A5
         JSL   GSOS
         DW    $0009      ; SetPrefix
         ADRL  L17A5
L380D    LDA   #$07
         STA   L17A5
         JSL   GSOS
         DW    $0009      ; SetPrefix
         ADRL  L17A5
         STZ   L03F7
         JSR   L364B
         LDY   L03F7
         STY   $0B
         BNE   L3838
L3829    INY
         LDA   L00A7,Y
         STA   L03F7,Y
         BNE   L3829
         DEY
         STY   L03F7
         BEQ   L385D
L3838    DEC   $76
         REP   #$30
         LDA   #L03F7
         STA   L18F4
         LDA   #^L03F7
         STA   L18F4+2
         SEP   #$30
         JSL   GSOS
         DW    $0006      ; GetFileInfo
         ADRL  L18F4
         BCC   L3863
         LDX   $0B
         BEQ   L385D
         BRL   L3F75
L385D    JSR   L3543
         BRL   L40D8
L3863    LDA   #$01
         STA   $30
         STZ   $31
         LDX   L03F7
         STZ   L03F8,X
         STZ   L03FA,X
         STZ   L03FB,X
         STA   L03F9,X
         LDA   #^L03F8
         STA   $50
         REP   #$30
         LDA   #L03F8
         STA   $4E
         SEP   #$30
         LDA   L18F8+2
         CMP   #$B0
         BNE   L38AE
         LDX   L18FC+1
         BNE   L38AE
         LDA   L18FC
         CMP   #$BA
         BNE   L38AE
         JSR   L3CC8
         JSR   LA89C
         LDX   $1A
         LDY   L1D11,X
         LDA   L06F3,Y
         AND   #$DF
         STA   L06F3,Y
         BRL   L3BEF
L38AE    JSR   L3CC8

*-----------------------
* RUN
*-----------------------

L38B1    BNE   L38C3
         STZ   $76
         JSR   L5A78
         JSR   L8358
         JSR   L5AEE
         STZ   $E7
         BRL   L3BEF
L38C3    BCC   L38DC
         CMP   #$2C
         BEQ   L38D9
         JSR   LBA9D
         JSR   LBD9F
         JSR   L5A78
         LDA   #$80
         STA   $C4
         JMP   LBA79      ; BRL LBA79
L38D9    JSR   L6346
L38DC    JSR   L3AF0
         BNE   L38ED
         JSR   L5A78
         JSR   L8358
         JSR   L8B85
         BRL   L3BEF
L38ED    RTS

L38EE    REP   #$30
         PEA   $00FF
         PEA   $0000
         _SetInGlobals
         PEA   $00FF
         PEA   $0080
         _SetOutGlobals
         SEP   #$30
         JSR   L3925
         STZ   L18AF
         STZ   L18B9
         STZ   L18C7
         LDA   #$03
         JSR   L3450
         STZ   L18AB
         LDA   #$03
         BRL   L3400
L3925    LDA   L1897
         LDY   #$23
         LDX   #$00
         STA   L06F1,X
         LDA   L1898
         STA   L06F0,X
         TYA
         STA   L06F3,X
         PHX
         LDY   #$00
L393C    STZ   L06F4,X
         INX
         INY
         CPY   #$04
         BCC   L393C
         PLX
         PHX
         LDY   #$00
L3949    STZ   L07F0,X
         INX
         INY
         CPY   #$08
         BCC   L3949
         PLX
         RTS

L3954    ASC   120E180C
*        ASC   '     Apple IIGS BASIC V1.0 B4 11-SEP-87'0D0A
*        ASC   'Copyright by Apple Computer, Inc. 1980-83,87'0D0A
         ASC   '    Apple IIGS BASIC V1.0B5 28-JAN-2019'0D0A
         ASC   'Copyright by Apple Computer, Inc. 1980-2019'0D0A
         ASC   '          All Rights Reserved'0D0A00

L39CF    LDX   #$FF
         STX   $76
         STX   $18
         STZ   $19
         JSR   L40C8
         LDA   #$5C
         STA   $01
         LDA   #^L3F19
         STA   $04
         LDA   #>L3F19
         STA   $03
         LDA   #L3F19
         STA   $02
         REP   #$30
         LDA   #L0AF0
         STA   $9F
         LDA   #^L0AF0
         STA   $A1
         LDA   #L0B00
         STA   $AF
         LDA   #^L0B00
         STA   $B1
         LDA   #$000A
         STA   L0B10
         STA   L0B14
         STZ   L0B16
         LDA   #L82C1
         STA   L0B60
         SEP   #$30
         LDA   #^L82C1
         STA   L0B60+2
         STZ   $CF
         LDX   #$34
         STX   $32
         LDA   #$50
         STA   L0B1A
         LDA   #$02
         STA   L0B1C
         LDA   #$05
         STA   L0B1E
         LDA   #$80
         STA   $C4
         STZ   $C5
         STZ   L10CF
         JSR   L92BF
         STZ   L16FF
         LDX   #$FF
L3A3F    STZ   L06F0,X
         STZ   L07F0,X
         DEX
         CPX   #$08
         BCS   L3A3F
         LDX   #$0C
L3A4C    STZ   L18B3,X
         STZ   L18C1,X
         DEX
         DEX
         BPL   L3A4C
         LDA   L1060
         STA   $60
         LDA   L1061
         STA   $61
         LDA   L1062
         STA   $62
         LDA   #$00
         LDY   #$1E
L3A69    STA   [$4B],Y
         DEY
         BNE   L3A69
         LDA   #$01
         STA   [$4B]
         LDA   $4B
         CLC
         ADC   #$04
         STA   L107C
         REP   #$30
         LDA   $4C
         ADC   #$0000
         STA   L107D
         SEP   #$30
         RTS

L3A87    REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $000F
         _GetVector
         PLA
         STA   L0B8F+1
         PLA
         STA   L0B8F+3
         STZ   L16F1
         PEA   $000F
         PEA   ^L3AB7
         PEA   L3AB7
         _SetVector
         SEP   #$30
         RTS

L3AB7    LDAL  L16F1
         BMI   L3ADF
         BIT   #$40
         BEQ   L3AE9
         LDAL  $E0C000
         AND   #$7F
         CMPL  L16ED
         BNE   L3AE9
         LDAL  $E0C025
         BIT   #$C0
         BNE   L3AE9
         AND   #$11
         EORL  L16EE
         BNE   L3AE9
         LDA   #$40
L3ADF    STAL  L16EF
         LDA   #$00
         STAL  L16F1
L3AE9    JMPL  L0B8F

L3AED    JSR   L3CC8
L3AF0    STZ   L03D3
L3AF3    STZ   L03D4
L3AF6    STZ   $30
         STZ   $31
         BCS   L3B3A
L3AFC    SBC   #$2F
         STA   $0C
         LDA   $31
         STA   $40
         LDA   $30
         ASL
         ROL   $40
         ASL
         ROL   $40
         CLC
         ADC   $30
         STA   $30
         LDA   $40
         ADC   $31
         STA   $31
         ASL   $30
         ROL   $31
         LDA   $30
         ADC   $0C
         STA   $30
         BCC   L3B25
         INC   $31
L3B25    LDA   $31
         INC
         BEQ   L3BA0
         JSR   L3CBE
         BCC   L3AFC
         PHP
         XBA
         LDA   $30
         ORA   $31
         BEQ   L3BA0
         XBA
         PLP
         RTS

L3B3A    BMI   L3B68
         LDX   #$00
         JSR   L6638
         BCC   L3B5E
L3B43    INX
         CPX   #$1F
         BCS   L3BA0
         JSR   L664D
         STA   L03D3,X
         JSR   L3CBE
         BEQ   L3B5E
         BCC   L3B43
         CMP   #$2E
         BEQ   L3B43
         JSR   L6638
         BCS   L3B43
L3B5E    INX
         STZ   L03D3,X
         STX   L03D3
         BRL   L3CC8
L3B68    LDX   #$00
         CMP   #$E0
         BCC   L3B5E
         CMP   #$F0
         BCS   L3B80
         AND   #$0F
         STA   $31
         JSR   L3D09
         STA   $30
L3B7B    JSR   L6306
         BRA   L3B5E
L3B80    CMP   #$FA
         BEQ   L3B88
         BCC   L3B98
         BCS   L3BA0
L3B88    JSR   L3D09
         STA   $30
         JSR   L3D09
         STA   $31
         CMP   #$FF
         BCC   L3B7B
         BRA   L3BA0
L3B98    AND   #$0F
         STA   $30
         STZ   $31
         BNE   L3B7B
L3BA0    LDX   #$07
         BRL   L3FA4
L3BA5    SEP   #$30
         BRL   L6356
L3BAA    REP   #$30
         PEA   $0000
         LDA   L10D1
         PHA
         PEA   ^L10D3
         PEA   L10D3
         _TaskMaster
         BCC   L3BC8
         STZ   L10CF
         BRL   L3F6A
L3BC8    PLA
         SEP   #$30
         BNE   L3BCE
         RTL

L3BCE    BIT   $E7
         BMI   L3BE0
         LDX   $C4
         BMI   L3BE0
         DEX
         STX   $18
         LDX   #$40
         PHA
         JSR   L3D22
         PLA
L3BE0    JMP   L9205      ;BRL L9205
L3BE3    BRL   L8296
L3BE6    BRL   L82A3
L3BE9    JSR   L3CBE
L3BEC    JSR   L3C91
L3BEF    REP   #$10
         TSX
         STX   $D4
         SEP   #$30
         LDX   $09
         STX   $0A
         LDA   #$FF
         STA   $18
         JSR   L3CC8
         BNE   L3BA5
         LDX   $76
         INX
L3C06    BEQ   L3C19
L3C08    REP   #$30
         LDA   $4E
         STA   $79
         SEP   #$30
         LDA   $50
         STA   $7B
         BIT   L16FF
         BVS   L3BE3
L3C19    BIT   L16EF
         BMI   L3BE6
         BVS   L3C83
         BIT   L10CF
         BPL   L3C29
         JSL   L3BAA
L3C29    LDA   [$4E]
         BNE   L3C4A
         LDY   #$01
         LDA   [$4E],Y
         TAY
         INY
         REP   #$30
         LDA   [$4E],Y
         BEQ   L3C74
         INY
         LDA   [$4E],Y
         STA   $75
         TYA
         SEC
         ADC   $4E
         STA   $4E
         SEP   #$30
         BCC   L3C4A
         INC   $50
L3C4A    REP   #$10
         TSX
         STX   $D4
         SEP   #$30
         LDX   $09
         STX   $0A
         BIT   $C4
         BMI   L3BE9
         LDX   $76
         INX
         BEQ   L3BE9
         LDA   $C4
         DEC
         STA   $18
         LDA   $76
         XBA
         LDA   $75
         LDX   #$23
         JSR   L3D22
         LDA   #$FF
         STA   $18
         BRL   L3BE9
L3C74    SEP   #$30
         CLC
         LDA   #$FF
         STA   $76
         JSR   L3DFD
         DB    $00
         DB    $B3
L3C80    BRL   L5DD8
L3C83    JSR   L80D4
         LDA   #$03
         STA   L16F3
         STZ   L16F5
         JSR   L3DBD
L3C91    BEQ   L3CD8
         ASL
         LDX   #$34
         STX   $32
         BCC   L3C80
         CMP   #$BD
         BCC   L3CB5
         CMP   #$BE
         BNE   L3CDE
         INC   $4E
         BNE   L3CAC
         REP   #$30
         INC   $4F
         SEP   #$30
L3CAC    LDA   [$4E]
         BPL   L3CD9
         CMP   #$E0
         BCC   L3CD9
         ASL
L3CB5    TAY
         LDA   L2210+1,Y
         PHA
         LDA   L2210,Y
L3CBD    PHA
L3CBE    INC   $4E
         BNE   L3CC8
         INC   $4F
         BNE   L3CC8
L3CC6    INC   $50
L3CC8    LDA   [$4E]
         CMP   #$3A
         BCS   L3CD8
         CMP   #$20
         BEQ   L3CBE
         SEC
         SBC   #$30
         SEC
         SBC   #$D0
L3CD8    RTS

L3CD9    SEP   #$30
         BRL   L6356
L3CDE    CMP   #$FE
         BNE   L3CD9
         INC   $4E
         REP   #$30
         BNE   L3CEA
         INC   $4F
L3CEA    LDA   [$4E]
         BPL   L3CD9
         AND   #$8001
         TAY
         LDA   $F2
         BEQ   L3CD9
         INC   $4E
         SEP   #$20
         BNE   L3CFE
         INC   $50
L3CFE    LDX   #$0000
         PEI   $F3
         PEI   $F1
         JSR   L3CBE
         RTL

L3D09    INC   $4E
         BNE   L3D13
         INC   $4F
         BNE   L3D13
         INC   $50
L3D13    LDA   [$4E]
         RTS

L3D16    JSR   L3CBE
         RTL

L3D1A    JSR   L3CC8
         RTL

L3D1E    JSR   L3D09
         RTL

L3D22    PHX
         REP   #$30
         PHA
         PEA   ^L03B3
         PEA   L03B3
         PEA   $0006
         PEA   $0000
         _Int2Dec
         SEP   #$30
         LDA   #$20
         STA   L03B9
         LDX   #$00
         LDA   #$20
L3D44    INX
         CMP   L03B3,X
         BEQ   L3D44
         DEX
         PLA
         STA   L03B3,X
         JSR   LE6F0
         STA   $40
         STY   $41
         STX   $42
         LDA   #$07
         JSR   LAA74
         INC   $C5
         LDA   $C5
         CMP   #$0A
         BCC   L3D83
         STZ   $C5
         LDA   #$0D
         JSR   LA9B6
         LDX   $18
         BPL   L3D72
         LDX   $19
L3D72    LDY   L1D11,X
         LDA   L06F0,Y
         BMI   L3D83
         BIT   #$01
         BEQ   L3D83
         LDA   #$0A
         JSR   LA9B6
L3D83    RTS

*-----------------------
* RESTORE
*-----------------------

L3D84    BEQ   L3DA5
         JSR   L3AF0
         JSR   L903F
         BCS   L3D91
L3D8E    BRL   L8BE9
L3D91    LDA   [$97]
         CLC
         ADC   #$03
         TAY
         LDA   [$97],Y
         CMP   #$CA
         BNE   L3D8E
         LDX   $99
         LDA   $97
         LDY   $98
         BRA   L3DAB
L3DA5    LDX   $4D
         LDA   $4B
         LDY   $4C
L3DAB    SEC
         SBC   #$01
         BCS   L3DB6
         DEY
         CPY   #$FF
         BNE   L3DB6
         DEX
L3DB6    STA   $7E
         STX   $80
         STY   $7F
         RTS

L3DBD    LDA   L16EF
L3DC0    AND   #$BF
         STA   L16EF
         LDX   #$FF
         LDY   $76
         INY
         BEQ   L3DF6
         DEY
         STY   $C8
         STX   $CC
         LDY   $75
         STY   $C7
         BIT   L16F9
         BPL   L3DF6
         REP   #$10
         LDX   $D4
         TXS
         SEP   #$30
         LDX   $0A
         STX   $09
         REP   #$30
         LDA   $79
         STA   $C9
         SEP   #$30
         LDA   $7B
         STA   $CB
         LDX   #$A0
         BRL   L82C2
L3DF6    STX   $18
         SEC
         BRA   L3DFD

*-----------------------
* STOP
*-----------------------

L3DFB    BNE   L3E72
L3DFD    LDA   #$FF
         STA   $18
         STZ   $19
         LDA   $4E
         LDY   $4F
         LDX   $76
         INX
         BEQ   L3E1C
         STA   $79
         STY   $7A
         LDA   $50
         STA   $7B
         LDA   $75
         LDY   $76
         STA   $77
         STY   $78
L3E1C    PLA
         PLA
         BCC   L3E32
         JSR   L80D4
         JSR   L933A
         LDA   #L2D39
         LDX   #^L2D39
         LDY   #>L2D39
         JSR   L93FB
         BRL   L406B
L3E32    BRL   L40D8

*-----------------------
* CONT
*-----------------------

L3E35    BNE   L3E72
         LDX   $76
         INX
         BNE   L3E72
         LDA   L16FF
         BNE   L3E47
         LDA   L1705
         STA   L16FF
L3E47    STZ   L16EF
         LDA   L16F7
         ORA   $D1
         STA   L16F1
         LDX   #$15
         LDY   $7B
         BNE   L3E5B
         BRL   L3FA4
L3E5B    LDA   $79
         STA   $4E
         STY   $50
         LDA   $7A
         STA   $4F
         LDA   $77
         LDY   $78
         STA   $75
         STY   $76
         PLA
         PLA
         BRL   L3C08
L3E72    RTS

*-----------------------
* QUIT
*-----------------------

L3E73    BEQ   L3E88
         JSR   LB755
         REP   #$30
         LDA   #L0007
         STA   L10C5
         LDA   #^L0007
         STA   L10C7
         BRA   L3E90
L3E88    REP   #$30
         STZ   L10C5
         STZ   L10C7
L3E90    SEP   #$30
         JSR   LACAA
         REP   #$30
         _EMShutDown
         LDA   L102B
         BEQ   L3EAA
         _QDShutDown
L3EAA    PEI   $07
         _HUnlockAll
         JSR   L3F02
         JSR   L3334
         STZ   L0087
         REP   #$30
         LDA   #L0087
         STA   L18F4
         LDA   #^L0087
         STA   L18F4+2
         _SANEShutDown
         _DeskShutDown
         PEI   $07
         _MMShutDown
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L10C5
         REP   #$30
         LDA   #$BB03
         PHA
         PEA   ^L2DE8
         PEA   L2DE8
         _SysFailMgr
L3EFE    BRA   L3EFE
         SEP   #$30
L3F02    REP   #$30
         PEA   $000F
         LDA   L0B8F+3
         PHA
         LDA   L0B8F+1
         PHA
         _SetVector
         SEP   #$30
         RTS

L3F19    SEP   #$30
         STA   $F5
         STX   $F6
         PLX
         CPX   #$46
         BCS   L3F35
         JSR   L3F28
         RTL

L3F28    LDA   L1C8E+1,X
         PHA
         LDA   L1C8E,X
         PHA
         LDX   $F6
         LDA   $F5
         RTS

L3F35    JSR   L3F4C
L3F38    PHA
         LSR
         LSR
         LSR
         LSR
         JSR   L76FB
         JSR   LA9BF
         PLA
         AND   #$0F
         JSR   L76FB
         JMP   LA9BF      ;BRL LA9BF
L3F4C    SEP   #$30
         LDA   #$0D
         JSR   LA9BF
         LDA   #$24
         JSR   LA9BF
         PLA
         STA   $CD
         TAY
         PLA
         STA   $CE
         JSR   L3F38
         TYA
         JSR   L3F38
         LDX   #$2E
         BRA   L3FA4
L3F6A    SEP   #$30
         STA   $CD
         XBA
         STA   $CE
         LDX   #$18
L3F73    BRA   L3FA4
L3F75    SEP   #$30
         LDX   #$00
L3F79    CMP   L2EA2,X
         BEQ   L3F8C
         INX
         INX
         BCS   L3F79
         STA   $CD
         LDA   #$0D
         STA   $CE
         LDX   #$19
         BRA   L3FA4
L3F8C    INX
         LDA   L2EA2,X
         TAX
L3F91    BRA   L3FA4
         JSR   L5AC4
         LDX   #$54
         BRA   L3FA4

L3F9A    LDX   #$35
         BRA   L3FA4
L3F9E    LDX   #$12
L3FA0    BRA   L3FA4
L3FA2    LDX   #$0A
L3FA4    SEP   #$30
         STX   $CC
         LDA   #$FF
         STA   $18
         STZ   L171D
L3FAF    LDA   $33
         LDY   $05
         LDX   #$00
         JSR   L7389
         LDA   #$34
         CMP   $32
         BCC   L3FAF
         REP   #$10
         LDX   $D4
         TXS
         SEP   #$30
         LDX   $0A
         STX   $09
         LDX   $CC
         LDY   $76
         INY
         BEQ   L3FF9
         DEY
         STY   $C8
         STY   $78
         LDY   $75
         STY   $C7
         STY   $77
         BIT   $CF
         BPL   L3FF6
         LDA   L0B60+2
         PHA
         REP   #$30
         LDA   L0B60
         PHA
         LDA   $79
         STA   $C9
         SEP   #$30
         LDA   $7B
         STA   $CB
         LDX   #$A5
         RTL

L3FF6    BRL   L4068
L3FF9    LDA   L0B64+2
         PHA
         REP   #$30
         LDA   L0B64
         PHA
         SEP   #$30
         RTL

L4006    LDA   #$FF
         STA   $18
         STZ   $19
         JSR   L933A
         JSR   L93B9
         LDX   $CC
         CPX   #$5A
         BCC   L4027
         REP   #$30
         LDA   #L2D0D
         STA   $40
         SEP   #$30
         LDA   #^L2D0D
         STA   $42
         BRA   L402A
L4027    JSR   L409C
L402A    JSR   L4088
         LDA   #$34
         STA   $32
         LDA   #L2D14
         LDY   #>L2D14
         LDX   #^L2816
         JSR   L93FB
         LDX   $CC
         CPX   #$5A
         BCS   L4048
         CPX   #$19
         BEQ   L4048
         CPX   #$18
         BNE   L4067
L4048    LDA   #$3D
         JSR   LA9BF
         LDA   #$24
         JSR   LA9BF
         LDX   $CC
         TXA
         CPX   #$5A
         BCS   L4064
         CPX   #$18
         BNE   L4062
         LDA   $CE
         JSR   L3F38
L4062    LDA   $CD
L4064    JSR   L3F38
L4067    RTS

L4068    JSR   L4006
L406B    LDY   $76
         INY
         BEQ   L407C
         LDA   #L2D34
         LDY   #>L2D34
         LDX   #^L2D34
         JSR   L93FB
         JSR   L47FE
L407C    JSR   L933A
         LDY   $1A
         BEQ   L40D8
         JSR   LAD3E
         BRA   L40D8
L4088    LDA   [$40],Y
         INY
         BNE   L408F
         INC   $41
L408F    PHA
         JSR   LA9B4
         PLA
         CMP   #$80
         BCC   L4088
         INY
         BEQ   L408F
         RTS

* GET ERROR MESSAGE (X IS THE ERROR INDEX)

L409C    LDA   #^L2816
         STA   $42
         REP   #$30
         LDA   #L2816
         STA   $40
         SEP   #$30
         LDY   #$00
L40AB    DEX
         BEQ   L40BF
L40AE    LDA   [$40],Y
         INY
         BNE   L40B9
         REP   #$30
         INC   $41
         SEP   #$30
L40B9    CMP   #$80
         BCC   L40AE
         BRA   L40AB
L40BF    RTS

L40C0    LDX   #^L4407
         LDY   #>L4407-1
         LDA   #L4407-1
         BRA   L40CE
L40C8    LDX   #^L4068
         LDY   #>L4068-1
         LDA   #L4068-1
L40CE    STX   L0B64+2
         STY   L0B64+1
         STA   L0B64
         RTS

L40D8    SEP   #$30       ; LOGO
         JSL   GSOS
         DW    $0015      ; Flush
         ADRL  L10CD
         JSR   L3543
         JSR   LD491
         JSR   L92B8
L40ED    LDA   #$80
         STA   $E7
         TRB   L16FF
         TRB   L10CF
         LDA   #$FF
         STA   $76
         JSR   L7BDC
         LDA   L16FD
         STA   $2F
         BEQ   L4108
         JSR   L933A
L4108    LDA   #$80
         TRB   L16F1
         STZ   L16EF
         JSR   LA4F6
         JSR   L418A
         XBA
         BEQ   L40ED
         LDX   L03F7
         CPX   L16ED
         BEQ   L40ED
         JSR   L4198
         JSR   L3CBE
         TAX
         BEQ   L40ED
         LDX   #$FF
         STX   $76
         STX   $75
         STX   $98
         STZ   L03D3
         BCS   L4155
         INC   $98
         STZ   $7B
         JSR   L49A9
         BCC   L4143
         JSR   L4A65
L4143    JSR   L4A89
L4146    LDA   $7B
         BNE   L414D
         JSR   L833A
L414D    JSR   L5AEE
         JSR   L5AC1
         BRA   L40ED
L4155    JSR   L4B09
         BRL   L3C4A
L415B    JSL   GSOS
         DW    $002A      ; GetVersion
         ADRL  L1789
         BCC   L417E
L4167    REP   #$30
         LDA   #$BB02
         PHA
         PEA   ^L2D90
         PEA   L2D90
         _SysFailMgr
         BRK   $B2
         SEP   #$30
L417E    LDAL  $E100FF
         BNE   L4167
         JSR   L5A78
         BRL   L40D8
L418A    LDA   #^L03F6
         STA   $50
         REP   #$30
         LDX   #L03F6
         STX   $4E
         SEP   #$30
         RTS

L4198    TAX
L4199    DEX
         BEQ   L41A8
         LDA   L03F7,X
         CMP   #$20
         BNE   L41A8
         STZ   L03F7,X
         BRA   L4199
L41A8    INX
         STX   L03F5
         STX   L03F4
         RTS

L41B0    LDA   [$97]
         TAY
         INY
         REP   #$30
         LDA   [$97],Y
         STA   $30
         SEP   #$30
         RTS

L41BD    LDA   $97
         STA   $1F
         LDA   $98
         STA   $20
         LDA   $99
         STA   $21
         RTS

*-----------------------
* HLIST
*-----------------------

L41CA    JSR   L7547
         JSR   L3CC8

*-----------------------
* LIST
*-----------------------

L41D0    PHP
         JSR   L47A6
         STZ   $1C
         STZ   $12
         JSR   L3AED
         LDA   $30
         ORA   $31
         ORA   L03D4
         BNE   L41E6
         INC   $30
L41E6    JSR   L903F
         LDA   L03D4
         BEQ   L41F8
         BCC   L41F5
         JSR   L41B0
         BRA   L41F8
L41F5    BRL   L3BA0
L41F8    PLP
         BNE   L41FF
L41FB    LDA   #$FF
         STA   $31
L41FF    JSR   L3CC8
         BEQ   L4234
         CMP   #$2D
         BEQ   L420F
         CMP   #$2C
         BEQ   L420F
L420C    BRL   L6356
L420F    JSR   L3CBE
         BEQ   L41FB
         JSR   L3AF0
         BNE   L420C
         LDA   $30
         ORA   $31
         ORA   L03D4
         BEQ   L420C
         LDA   L03D4
         BEQ   L4234
         JSR   L41BD
         JSR   L903F
         BCC   L41F5
         JSR   L41B0
         BRA   L4237
L4234    JSR   L41BD
L4237    LDA   #$80
         STA   L16F1
L423C    LDA   [$1F]
         TAY
         LDA   [$1F],Y
         BNE   L4253
L4243    STZ   L16F1
         STZ   L16EF
         JSR   L80D4
         LDA   #$FF
         STA   $18
         JMP   L933A      ;BRL L933A
L4253    JSR   L933A
         JSR   LC2B5
         BCS   L4243
         LDA   [$1F]
         TAY
         INY
         REP   #$30
         LDA   [$1F],Y
         CMP   $30
         SEP   #$30
         BEQ   L426C
         BCC   L426C
         RTS

L426C    JSR   L4692
         JSR   L4597
         BRA   L423C

*-----------------------
* AUTONUM 
*-----------------------

L4274    JSR   L47A6
         LDA   #$80
         STA   $8A
         REP   #$30
         CLC
         LDA   L0B16
         ADC   #$000A
         STA   L0B10
         LDA   #$000A
         STA   L0B14
         SEP   #$30
         JSR   L3CC8
         BEQ   L4302
         CMP   #$2C
         BEQ   L42E9
         CMP   #$2D
         BEQ   L42E9
         JSR   L3AF0
         LDA   $30
         ORA   $31
         ORA   L03D4
         BEQ   L42DB
         REP   #$30
         LDA   $30
         BEQ   L42B5
         SEC
         SBC   #$000A
         STA   L0B16
L42B5    SEP   #$30
         JSR   L903F
         BCC   L42CD
         LDA   [$97]
         TAY
         INY
         REP   #$30
         LDA   [$97],Y
         STA   L0B10
         SEP   #$30
         STZ   $8A
         BRA   L42DB
L42CD    LDA   L03D4
         BNE   L42F1
         REP   #$30
         LDA   $30
         STA   L0B10
         SEP   #$30
L42DB    JSR   L3CC8
         BEQ   L4302
         CMP   #$2D
         BEQ   L42E9
         JSR   L6346
         BRA   L42EC
L42E9    JSR   L3CBE
L42EC    JSR   L3AF6
         BEQ   L42F4
L42F1    BRL   L3BA0
L42F4    REP   #$30
         LDA   $30
         BEQ   L4302
         CMP   #$03E9
         BCS   L4302
         STA   L0B14
L4302    SEP   #$30
         BIT   $8A
         BMI   L4315
         REP   #$30
         LDA   L0B14
         CLC
         ADC   L0B10
         STA   $30
         BRA   L431C
L4315    REP   #$30
         LDA   #$FFFF
         STA   $30
L431C    REP   #$30
         LDA   L0B14
         STA   L0B18
         SEP   #$30
         BRL   L43D1

*-----------------------
* EDIT
*-----------------------

L4329    PHP
         JSR   L47A6
         STZ   $8A
         LDA   #$12
         JSR   LA9BF
         LDA   #$18
         JSR   LA9BF
         JSR   L752F
         LDA   #$81
         JSR   L80A8
         BNE   L4365
         JSR   L933A
         JSR   L6306
         JSR   LB71C
         BNE   L4351
         JMP   LB6AC      ;BRL LB6AC
L4351    TXA
         ORA   #$40
         STA   $8A
         REP   #$30
         LDA   #$FFFF
         STA   $30
         STZ   L0B10
         SEP   #$30
         PLP
         BRA   L43D1
L4365    REP   #$30
         LDA   #$0001
         STA   L0B18
         SEP   #$30
         JSR   L3AED
         LDA   $30
         ORA   $31
         ORA   L03D4
         BNE   L437D
         INC   $30
L437D    JSR   L903F
         LDA   L03D4
         BEQ   L438F
         BCC   L438C
         JSR   L41B0
         BRA   L438F
L438C    BRL   L3BA0
L438F    REP   #$30
         LDA   $30
         STA   L0B10
         SEP   #$30
         PLP
         BNE   L43A1
L439B    LDA   #$FF
         STA   $31
         STZ   $30
L43A1    JSR   L3CC8
         BEQ   L43D1
         CMP   #$2D
         BEQ   L43B1
         CMP   #$2C
         BEQ   L43B1
L43AE    BRL   L6356
L43B1    JSR   L3CBE
         BEQ   L439B
         JSR   L3AF0
         BNE   L43AE
         LDA   $30
         ORA   $31
         ORA   L03D4
         BEQ   L43AE
         LDA   L03D4
         BEQ   L43D1
         JSR   L903F
         BCC   L438C
         JSR   L41B0
L43D1    REP   #$30
         LDA   $30
         STA   L0B12
         SEP   #$30
         JSR   L4578
         JSR   LA38A
         JSR   L40C0
         JSR   L45A7
         CPY   #$14
         BCC   L43F7
         LDY   #$15
         STY   L193A
         LDA   #$17
         JSR   LA9BF
         JSR   LA9BF
L43F7    BRA   L4416

L43F9    JSR   L45C9
         JSR   L4B09
         JSR   L3CBE
         JSR   L3C91
         BRA   L440D

L4407    JSR   L4006
         JSR   L933A
L440D    JSR   L45A7
         JSR   L45B1
         JSR   L4578
L4416    BRA   L442B
L4418    REP   #$30
         LDA   L0B10
         BEQ   L442B
         CLC
         ADC   L0B18
         CMP   #$FF00
         BCS   L4470
         STA   L0B10
L442B    SEP   #$30
         JSR   L45B1
         LDA   #$0C
         JSR   LA9BF
         REP   #$30
         LDA   L0B10
         STA   $30
         SEP   #$30
         BEQ   L446B
         JSR   L903F
         LDA   [$97]
         TAY
         BCS   L4450
         BIT   $8A
         BMI   L446B
         LDA   [$97],Y
         BEQ   L4470
L4450    STZ   $8A
         INY
         REP   #$30
         LDA   #$0001
         STA   L0B18
         LDA   [$97],Y
         CMP   L0B12
         STA   L0B10
         STA   $30
         SEP   #$30
         BEQ   L446B
         BCS   L4470
L446B    JSR   L45E5
         BCC   L4475
L4470    SEP   #$30
         BRL   L4513
L4475    LDX   L04F9
         BEQ   L4418
         BIT   $8A
         BVC   L4481
         BRL   L4545
L4481    JSR   LA5EB
         JSR   L418A
         LDA   L03F6
         JSR   L4198
         JSR   L3CBE
         TAX
         BEQ   L4418
         LDX   #$FF
         STX   $76
         STZ   $75
         STZ   L03D3
         STX   $98
         BCC   L44A3
         BRL   L43F9
L44A3    INC   $98
         STZ   $7B
         LDY   #$01
L44A9    LDA   [$4E],Y
         BEQ   L44B9
         INY
         CMP   #$20
         BEQ   L44A9
         JSR   L4F89
         BCS   L44A9
         BRA   L44D4
L44B9    JSR   L3CC8
         JSR   L3AF6
         REP   #$30
         LDA   $30
         STA   L0B10
         CMP   L0B12
         BCC   L44D1
         LDX   #$FF00
         STX   L0B12
L44D1    BRL   L442B
L44D4    JSR   L45C9
         JSR   L3CC8
         JSR   L49A9
         BCC   L44E2
         JSR   L4A65
L44E2    JSR   L4A89
         LDA   $99
         STA   $21
         REP   #$30
         LDA   $97
         STA   $1F
         SEP   #$30
         LDA   [$1F]
         TAY
         INY
         REP   #$30
         LDA   [$1F],Y
         STA   $30
         STA   L0B16
         SEP   #$30
         STZ   $2F
         LDX   L1938
         STX   $1C
         JSR   L4692
         JSR   L933A
         JSR   L45A7
         BRL   L4418
L4513    SEP   #$30
         JSR   L80D4
         LDA   #$FF
         STA   $18
         LDX   #$1F
         LDY   L1D11,X
         TYX
         STZ   L06F0,X
         STZ   L06F1,X
         STZ   L06F3,X
         JSR   LA38A
         STZ   L03F7
         STZ   L03F6
         JSR   L40C8
         JSR   L752F
         JSR   L45DC
         LDA   #$0B
         JSR   LA9BF
         BRL   L4146
L4545    JSR   L45C9
         LDA   $8A
         AND   #$1F
         STA   $18
         JSR   L4567
         JSR   LAA74
         JSR   L933A
         LDA   #$FF
         STA   $18
         JSR   L4567
         JSR   LAA74
         JSR   L933A
         BRL   L440D
L4567    LDA   #^L04FA
         STA   $42
         REP   #$30
         LDA   #L04FA
         STA   $40
         SEP   #$30
         LDA   L04F9
         RTS

L4578    LDX   #$1F
         LDY   L1D11,X
         LDA   #$10
         STA   L06F0,Y
         LDA   #$00
         STA   L06F1,Y
         LDA   #$04
         STA   L07F0,Y
         LDA   #$00
         STA   L06F2,Y
         LDA   #$02
         STA   L06F3,Y
         RTS

L4597    INY
L4598    TYA
         CLC
         ADC   $1F
         STA   $1F
         BCC   L45A6
         REP   #$30
         INC   $20
         SEP   #$30
L45A6    RTS

L45A7    JSR   LA2A1
         STX   L1938
         STY   L193A
         RTS

L45B1    LDA   #$01
         STA   $2B
         LDA   #$15
         STA   $2D
         LDA   #$50
         STA   $2C
         LDA   #$18
         STA   $2E
         JSR   LABC0
         LDA   #$0C
         JMP   LA9BF      ;BRL LA9BF
L45C9    LDA   #$01
         STA   $2B
         LDA   #$01
         STA   $2D
         LDA   #$50
         STA   $2C
         LDA   #$14
         STA   $2E
         JSR   LABC0
L45DC    LDX   L1938
         LDY   L193A
         JMP   LA2BA      ;BRL LA2BA
L45E5    LDX   #$1F
         STX   $18
         BIT   $8A
         BPL   L4612
         REP   #$30
         PEI   $30
         PEA   ^L022F
         PEA   L022F
         PEA   $0005
         PEA   $0000
         _Int2Dec
         SEP   #$30
         LDA   #$20
         STA   L0234
         LDX   #$06
         STX   L022C
         BRA   L464F
L4612    STZ   L022C
         LDA   L0B1A
         PHA
         LDA   L0B1C
         PHA
         LDA   L0B1E
         PHA
         STZ   L0B1A
         STZ   L0B1C
         STZ   L0B1E
         STZ   $1C
         STZ   $12
         STZ   $2F
         LDA   $99
         STA   $21
         REP   #$30
         LDA   $97
         STA   $1F
         LDA   $30
         SEP   #$30
         BEQ   L4643
         JSR   L4692
L4643    PLA
         STA   L0B1E
         PLA
         STA   L0B1C
         PLA
         STA   L0B1A
L464F    LDX   L022C
         STZ   L022F,X
         STZ   L0230,X
         LDX   #$FF
         STX   $18
         JSR   LA2A1
         STX   L1BA3
         STY   L1BA4
         JSR   LA362
         STZ   L1A43
         STZ   L1A8C
         LDA   #$01
         STA   L1A8A
         LDA   #^L022F
         STA   $42
         REP   #$30
         LDA   #L022F
         STA   $40
         SEP   #$30
         LDA   L022C
         JSR   L9D1D
         CMP   #$02
         RTS

         LDA   #L022F
         LDY   #>L022F
         LDX   #^L022F
         JMP   L93FB      ;BRL L93FB

L4692    PHY
         REP   #$30
         PHA
         PEA   ^L03B3
         PEA   L03B3
         PEA   $0005
         PEA   $0000
         _Int2Dec
         STZ   L03B9
         SEP   #$30
         LDA   L0B1E
         BMI   L46D9
         LDA   #$20
         STA   L03B8
         JSR   LE6F0
         STA   $40
         STY   $41
         STX   $42
         LDA   L0B1E
         AND   #$7F
         BNE   L46D6
L46C8    LDA   [$40]
         CMP   #$20
         BNE   L46D6
         INC   $40
         BNE   L46C8
         INC   $41
         BRA   L46C8
L46D6    JSR   L9401
L46D9    LDA   [$1F]
         STA   $1E
         DEC
         BEQ   L46F3
         LDY   #$00
L46E2    INY
         CPY   $1E
         BCS   L46EE
         LDA   [$1F],Y
         JSR   L9415
         BRA   L46E2
L46EE    LDA   #$3A
         JSR   L9415
L46F3    LDA   L0B1E
         AND   #$7F
         BEQ   L4712
         CMP   $2F
         BCC   L4705
         BEQ   L4705
         JSR   LA9B2
         BRA   L46F3
L4705    LDY   L0B1A
         BEQ   L4712
         CMP   L0B1A
         BCC   L4712
         BRL   L82F8
L4712    PLY
         JSR   L4598
         LDY   #$02
         LDA   [$1F],Y
         BIT   $12
         BPL   L472B
         CMP   #$8C
         BEQ   L472B
         CMP   #$8D
         BEQ   L472B
         STZ   $12
         JSR   L479F
L472B    CMP   #$DD
         BEQ   L474A
         CMP   #$8E
         BNE   L474D
         STY   $13
L4735    DEC   $1C
         BPL   L473B
         STZ   $1C
L473B    INY
         LDA   [$1F],Y
         BEQ   L474D
         CMP   #$3A
         BEQ   L474D
         CMP   #$2C
         BEQ   L4735
         BRA   L473B
L474A    JSR   L479F
L474D    LDX   L0B1C
         BEQ   L475F
L4752    LDY   $1C
         BEQ   L475F
L4756    JSR   LA9B2
         DEY
         BNE   L4756
         DEX
         BNE   L4752
L475F    LDY   $2F
         STY   $1D
         LDY   #$02
         LDA   [$1F],Y
         CMP   #$DA
         BEQ   L4775
         CMP   #$8B
         BEQ   L4775
         CMP   #$C4
         BNE   L4777
         STA   $12
L4775    INC   $1C
L4777    LDA   #$3A
         STA   $15
         BRA   L4793
L477D    CMP   #$22
         BNE   L478D
L4781    JSR   L9415
         INY
         LDA   [$1F],Y
         BEQ   L479E
         CMP   #$22
         BNE   L4781
L478D    JSR   L9415
L4790    STA   $15
         INY
L4793    LDA   [$1F],Y
         BPL   L479C
         JSR   L487D
         BRA   L4790
L479C    BNE   L477D
L479E    RTS

L479F    DEC   $1C
         BPL   L47A5
         STZ   $1C
L47A5    RTS

L47A6    LDX   $76
         INX
         BEQ   L47B5
         BRL   L6356
L47AE    INY
         BNE   L47B3
         INC   $A4
L47B3    LDA   [$A3],Y
L47B5    RTS

L47B6    LDY   #L22FE
         STY   $A3
         LDY   #>L22FE
         STY   $A4
         LDY   #^L22FE
         STY   $A5
         CPX   #$DF	; not a noun
         BNE   L47DC
         LDY   #L24BD
         STY   $A3
         LDY   #>L24BD
         STY   $A4
         LDY   #^L24BD
         STY   $A5
         CMP   #$E0
         BCC   L47DA
         EOR   #$60
         BRA   L47DC
L47DA    ADC   #$16
L47DC    AND   #$7F
         TAX
         LDY   #$FF
L47E1    DEX
         BMI   L47EF
L47E4    INY
         BNE   L47E9
         INC   $A4
L47E9    LDA   [$A3],Y
         BPL   L47E4
         BRA   L47E1
L47EF    TYA
         CLC
         ADC   $A3
         STA   $A3
         BCC   L47FD
         REP   #$30
         INC   $A4
         SEP   #$30
L47FD    RTS

L47FE    REP   #$30
         LDA   $75
         REP   #$30
         TAX
         LDA   #$0000
L4808    JSR   L4811
         PHY
         JSR   L9401
         PLY
         RTS

L4811    PHY
         PHA
         PHX
         PEA   ^L03B3
         PEA   L03B3
         PEA   $000B
         PEA   $FFFF
         _Long2Dec
         STZ   L03BE
         SEP   #$30
         JSR   LE6F0
         STA   $40
         STY   $41
         STX   $42
L4835    LDA   [$40]
         CMP   #$20
         BNE   L4843
         INC   $40
         BNE   L4835
         INC   $41
         BRA   L4835
L4843    PLY
         PLA
         RTS

L4846    INY
         REP   #$30
         LDA   [$1F],Y
         TAX
         INY
         INY
         LDA   [$1F],Y
L4850    JSR   L4808
         INY
         BRA   L487A
         MX    %11
L4856    CMP   #$FC
         BEQ   L4846
         BCS   L4861
         INY
         INY
         INY
         BRA   L487A
L4861    TYA
         CLC
         ADC   #$08
         TAY
         BRA   L487A
L4868    INY
         STY   $84
         REP   #$30
         LDA   [$1F],Y
L486F    TAX
         LDA   #$0000
         BRA   L4850
         MX    %11
L4875    AND   #$3F
         JSR   L9415
L487A    LDA   $14
         RTS

L487D    LDX   #$00
         STA   $14
         CMP   #$DF
         BCC   L48A9
         BEQ   L48A3
         CMP   #$FF
         BNE   L488F
         JMPL  L6356

L488F    CMP   #$FA
         BEQ   L4868
         BCS   L4856
         CMP   #$F0
         BCS   L4875
         REP   #$30
         LDA   [$1F],Y
         XBA
         AND   #$0FFF
         BRA   L486F
         MX    %11
L48A3    STZ   $14
         TAX
         INY
         LDA   [$1F],Y
L48A9    STA   $86
         STY   $84
         JSR   L47B6
         LDY   $84
         CPY   #$03
         BEQ   L48DB
         BIT   $14
         BMI   L48C0
         LDA   $86
         CMP   #$96
         BCS   L48DB
L48C0    LDA   $15
         CMP   #$FF
         BEQ   L48DB
         CMP   #$DF
         BEQ   L48DB
         BCS   L48D8
         CMP   #$80
         BCS   L48DB
         CMP   #$3A
         BEQ   L48DB
         CMP   #$20
         BEQ   L48DB
L48D8    JSR   L9413
L48DB    LDY   #$00
L48DD    JSR   L47AE
         BMI   L48E7
         JSR   L9415
         BRA   L48DD
L48E7    AND   #$7F
         JSR   L9415
         LDY   $84
         JSR   L6638
         BCC   L4905
         INY
         LDA   [$1F],Y
         BMI   L4901
         CMP   #$22
         BEQ   L4901
         JSR   L4F80
         BCC   L4904
L4901    JSR   L9413
L4904    DEY
L4905    LDA   $14
         RTS

L4908    BRL   L6356

*-----------------------
* DEL
*-----------------------

L490B    JSR   L47A6
         JSR   L3AED
         LDA   $30
         ORA   $31
         ORA   L03D4
         BNE   L491C
         INC   $30
L491C    JSR   L903F
         BCS   L4929
         LDX   L03D4
         BEQ   L4929
L4926    BRL   L3BA0
L4929    REP   #$30
         LDA   $97
         PHA
         SEP   #$30
         LDA   $99
         PHA
         JSR   L3CC8
         BEQ   L495E
         CMP   #$2C
         BEQ   L4940
         CMP   #$2D
         BNE   L4908
L4940    JSR   L3CBE
         BEQ   L4908
         JSR   L3AF0
         LDA   $30
         ORA   $31
         ORA   L03D4
         BEQ   L4926
         LDA   L03D4
         BEQ   L495E
         JSR   L903F
         BCC   L4926
         JSR   L41B0
L495E    INC   $30
         BNE   L4964
         INC   $31
L4964    JSR   L903F
         LDA   $97
         STA   $40
         LDA   $98
         STA   $41
         LDA   $99
         STA   $42
         PLA
         STA   $99
         REP   #$30
         PLA
         STA   $97
         LDA   $40
         SEC
         SBC   $97
         STA   $1C
         SEP   #$30
         LDA   $42
         SBC   $99
         STA   $1E
         ORA   $1C
         ORA   $1D
         BNE   L4991
         RTS

L4991    JSR   L55D0
         BRL   L5AC1
L4997    CPX   L1076
         BCC   L49A6
         BNE   L49A5
         REP   #$20
         CMP   L1074
         BCC   L49A6
L49A5    SEC
L49A6    SEP   #$30
         RTS

L49A9    JSR   L3AF6
         JSR   L6638
         BCC   L49EF
         XBA
         LDA   $4E
         SBC   #L03F7
         PHA
         XBA
         LDY   #$00
L49BA    INY
         JSR   L664D
         STA   L03D3,Y
         LDA   [$4E],Y
         BEQ   L49EE
         CMP   #$3A
         BEQ   L49D0
         JSR   L4F80
         BCS   L49BA
         BRA   L49EE
L49D0    INY
         STY   L03F3
         PLX
         PHX
         JSR   L4ECA
         BCS   L49EE
         PLX
         JSR   L4EB8
         BCC   L49E4
         BRL   L3BA0
L49E4    PHA
         LDY   L03F3
         STY   L03D3
         JSR   L8C60
L49EE    PLA
L49EF    JSR   L4B09
         TYA
         CLC
         ADC   #$03
         STA   $0B
         STA   L03F4
         REP   #$30
         LDA   $30
         STA   L03F5
         SEP   #$30
         LDA   L03D3
         BNE   L4A0C
         INC   L03D3
L4A0C    JSR   L4A33
         PHP
         LDY   #$20
         LDX   L03D3
L4A15    LDA   L03D2,X
         STA   L03D3,Y
         DEY
         DEX
         BNE   L4A15
         STZ   L03D4
         REP   #$30
         TYA
         CLC
         ADC   #L03D3
         STA   $81
         SEP   #$30
         LDA   #^L03D3
         STA   $83
         PLP
         RTS

L4A33    LDA   L03D3
         DEC
         BEQ   L4A61
         REP   #$30
         LDA   $30
         PHA
         STZ   $30
         SEP   #$30
         JSR   L903F
         REP   #$30
         PLA
         STA   $30
         SEP   #$30
         BCC   L4A61
         LDA   [$97]
         TAY
         INY
         REP   #$30
         LDA   [$97],Y
         CMP   $30
         SEP   #$30
         BEQ   L4A64
         LDX   #$08
         BRL   L3FA4
L4A61    JSR   L903F
L4A64    RTS

L4A65    LDA   [$97]
         TAY
         STZ   $1E
         LDA   [$97],Y
         REP   #$30
         STY   $1C
         CLC
         AND   #$00FF
         ADC   $1C
         STA   $1C
         CLC
         ADC   $97
         STA   $40
         SEP   #$30
         LDA   $99
         ADC   #$00
         STA   $42
         JSR   L55D0
L4A88    RTS

L4A89    LDA   L03F7
         BEQ   L4A88
         STZ   $1E
         STZ   $0C
         REP   #$30
         LDA   $0B
         CLC
         ADC   L03D3
         STA   $0B
         STA   $1C
         SEP   #$30
L4AA0    JSR   L4AB1
         REP   #$10
         LDY   $0B
L4AA7    LDA   [$81],Y
         DEY
         STA   [$97],Y
         BNE   L4AA7
         SEP   #$30
         RTS

L4AB1    REP   #$30
         LDA   L107C
         STA   $91
         CLC
         ADC   $1C
         STA   $8B
         SEP   #$30
         LDA   L107E
         STA   $93
         ADC   $1E
         STA   $8D
         TAX
         LDA   $8B
         JSR   L4997
         BCC   L4AF8
         REP   #$30
         LDA   $97
         SEC
         SBC   $4B
         TAX
         SEP   #$30
         LDA   $99
         SBC   $4D
         PHA
         XBA
         PHA
         PHX
         LDX   #$08
         JSR   L5603
         REP   #$30
         PLA
         CLC
         ADC   $4B
         STA   $97
         SEP   #$30
         PLA
         ADC   $4D
         STA   $99
         BRA   L4AB1
L4AF8    STX   L107E
         STA   L107C
         XBA
         STA   L107D
         JSR   L5812
         RTS

L4B06    BRL   L4CA4
L4B09    LDA   $4E
         SEC
         SBC   #L03F7
         TAX
         STZ   L03F6,X
         STZ   $C0
         DEX
L4B15    STZ   $11
         STZ   $EA
         STZ   $0C
L4B1B    INX
         LDA   L03F7,X
         BEQ   L4B06
         CMP   #$20
         BEQ   L4B1B
         JSR   L6638
         BCS   L4B4B
         CMP   #$3F
         BNE   L4B32
         LDA   #$CE
         BRA   L4B38
L4B32    CMP   #$21
         BNE   L4B40
         LDA   #$C8
L4B38    STA   $0B
         STA   $15
         INX
L4B3D    BRL   L4BBE
L4B40    CMP   #$5F
         BEQ   L4B9A
         INX
L4B45    DEX
         LDA   #$02
         BRL   L4CE2
L4B4B    JSR   L4ECA
         BCS   L4B58
         JSR   L4EB8
         BCC   L4B6C
L4B55    BRL   L4CDF
L4B58    LDA   $0B
         STA   $15
         CMP   #$B5
         BEQ   L4B9F
         BIT   $98
         BMI   L4B3D
         LDA   $0B
         CMP   #$86
         BCS   L4B3D
         BRA   L4B55
L4B6C    STX   $BE
L4B6E    LDA   L03F7,X
         BEQ   L4B45
         INX
         CMP   #$20
         BEQ   L4B6E
         JSR   L4F80
         BCS   L4B6E
         JSR   L4F93
         BCS   L4B86
         CMP   #$21
         BNE   L4B90
L4B86    LDA   L03F7,X
         BEQ   L4B45
         INX
         CMP   #$20
         BEQ   L4B86
L4B90    CMP   #$3D
         BEQ   L4BA2
         CMP   #$28
         BEQ   L4BA2
         BRA   L4B45
L4B9A    LDA   #$B6
         STA   $0B
         INX
L4B9F    JSR   L4D4C
L4BA2    LDX   $BE
L4BA4    DEX
         LDY   $C0
L4BA7    INX
         LDA   L03F7,X
         JSR   L4F80
         BCC   L4BBA
         STA   L03F7,Y
         ORA   #$00
         BEQ   L4BBA
         INY
         BRA   L4BA7
L4BBA    STY   $C0
         BRA   L4C06
L4BBE    JSR   L4E8A
         CMP   #$C8
         BEQ   L4BD1
         CMP   #$CA
         BEQ   L4BD1
         CMP   #$AA
         BEQ   L4BFE
         CMP   #$CB
         BNE   L4BD5
L4BD1    DEX
         BRL   L4CC2
L4BD5    LDY   $98
         INY
         BNE   L4C06
         CMP   #$99
         BEQ   L4BFE
         CMP   #$9A
         BEQ   L4BFE
         CMP   #$9B
         BEQ   L4BFE
         CMP   #$96
         BCC   L4C06
         CMP   #$AB
         BCS   L4C06
         CMP   #$97
         BEQ   L4BFA
         CMP   #$98
         BEQ   L4BFE
         CMP   #$A1
         BNE   L4C02
L4BFA    LDA   #$A0
         BRA   L4C04
L4BFE    LDA   #$C0
         BRA   L4C04
L4C02    LDA   #$80
L4C04    STA   $11
L4C06    DEX
L4C07    INX
         LDA   L03F7,X
         BNE   L4C10
         BRL   L4CA4
L4C10    CMP   #$3A
         BEQ   L4C20
         CMP   #$2C
         BNE   L4C2A
         BIT   $11
         BEQ   L4C26
         TRB   $11
         BRA   L4C79
L4C20    JSR   L4EAB
         BRL   L4B15
L4C26    BVS   L4C2A
         STZ   $11
L4C2A    BIT   $11
         BMI   L4C79
         CMP   #$20
         BEQ   L4C07
         CMP   #$22
         BNE   L4C3C
         JSR   L4EAB
         BRL   L4CC4
L4C3C    CMP   #$2E
         BEQ   L4C45
         JSR   L4F89
         BCC   L4C4A
L4C45    JSR   L4D8F
         BRA   L4C06
L4C4A    CMP   #$5F
         BNE   L4C69
         LDY   $EA
         CPY   #$DF
         BNE   L4C5A
         LDY   $E9
         CPY   #$EB
         BEQ   L4C79
L4C5A    INX
         LDA   #$B6
         STA   $0B
         STZ   $0C
         JSR   L4D4C
         LDX   $BE
L4C66    BRL   L4BA4
L4C69    JSR   L6638
         BCS   L4C7F
         CMP   #$3F
         BNE   L4C79
         LDA   #$CE
         STA   $0B
         INX
         BRA   L4C8F
L4C79    JSR   L4EAB
         BRL   L4C07
L4C7F    JSR   L4EB3
         BCC   L4C8A
         JSR   L4E8A
         BRL   L4C06
L4C8A    JSR   L4ECA
         BCC   L4C66
L4C8F    LDA   $15
         CMP   #$C4
         BEQ   L4CA1
         CMP   #$8C
         BEQ   L4CA1
         CMP   #$8D
         BEQ   L4CA1
         CMP   #$90
         BNE   L4CDF
L4CA1    BRL   L4BBE
L4CA4    LDY   $C0
         STA   L03F7,Y
         STA   L03F9,Y
         STA   L03FA,Y
         LDA   #$01
         STA   L03F8,Y
         LDA   #^L03F6
         STA   $50
         LDA   #>L03F6
         STA   $4F
         LDA   #L03F6
         STA   $4E
         INY
         RTS

L4CC2    LDA   #$00
L4CC4    STA   $0D
         LDY   $C0
         DEY
L4CC9    INY
         INX
         LDA   L03F7,X
         STA   L03F7,Y
         STY   $C0
         BEQ   L4CA4
         CMP   $0D
         BNE   L4CC9
         INY
         STY   $C0
         BRL   L4C07
L4CDF    DEX
         LDA   #$35
L4CE2    PHA
         LDY   $76
         INY
         BNE   L4D48
         LDY   $75
         BEQ   L4D48
         STX   $0C
         TXA
         LDX   #$01
         CMP   #$9F
         BCC   L4CFA
         SBC   #$9F
         DEX
         BRA   L4D03
L4CFA    CMP   #$4F
         BCC   L4D02
         SBC   #$4F
         INX
         DEC
L4D02    INC
L4D03    TAY
         STX   $0D
         LDX   #$9F
         CPX   L03F4
         BCC   L4D14
         LDX   #$4F
         CPX   L03F4
         BCS   L4D18
L4D14    CPX   $0C
         BCS   L4D1A
L4D18    STZ   $0D
L4D1A    LDX   #$5E
         STX   $0C
         LDA   $0D
         BEQ   L4D2F
         ORA   #$30
         STA   $0D
         CPY   #$4F
         BCC   L4D2F
         DEY
         STA   $0C
         STX   $0D
L4D2F    TYA
         BEQ   L4D3C
         BMI   L4D3C
L4D34    JSR   LA9B2
         DEY
         BMI   L4D3C
         BNE   L4D34
L4D3C    LDA   $0C
         JSR   LA9B4
         LDA   $0D
         BEQ   L4D48
         JSR   LA9B4
L4D48    PLX
         BRL   L3FA4
L4D4C    STX   $BE
         LDA   $C0
         CLC
         ADC   #$05
         BCS   L4D62
         CMP   $BE
         BCC   L4D7A
         LDA   L03F5
         TAY
         CLC
         ADC   #$05
         BCC   L4D67
L4D62    LDX   #$34
         BRL   L3FA4
L4D67    STA   L03F5
         TAX
L4D6B    LDA   L03F7,Y
         STA   L03F7,X
         DEX
         DEY
         CPY   $BE
         BCS   L4D6B
         INX
         STX   $BE
L4D7A    JSR   L4E8A
         LDA   #$FB
         JSR   L4EAB
         LDA   #$FF
         PHX
         LDX   #$03
L4D87    JSR   L4EAB
         DEX
         BNE   L4D87
         PLX
         RTS

L4D8F    STX   $BE
         DEX
         LDY   #$00
L4D94    INX
         LDA   L03F7,X
         JSR   L4F89
         BCC   L4DF3
         INY
         CPY   #$0A
         BCC   L4D94
L4DA2    STZ   $0B
         STZ   $0C
         LDX   $BE
         LDY   $C0
         DEX
         BRA   L4DB1
L4DAD    STA   L03F7,Y
         INY
L4DB1    INX
         LDA   L03F7,X
         BEQ   L4DED
         CMP   #$20
         BEQ   L4DB1
         JSR   L4F89
         BCS   L4DAD
         BIT   $0C
         BMI   L4DD0
         BIT   $0B
         BMI   L4DD0
         CMP   #$2E
         BNE   L4DD0
L4DCC    DEC   $0B
         BRA   L4DAD
L4DD0    BIT   $0C
         BMI   L4DE1
         JSR   L664D
         CMP   #$45
         BNE   L4DED
         DEC   $0C
         STZ   $0B
         BRA   L4DAD
L4DE1    BIT   $0B
         BMI   L4DED
         CMP   #$2B
         BEQ   L4DCC
         CMP   #$2D
         BEQ   L4DCC
L4DED    STY   $C0
         STZ   $0C
         CLC
         RTS

L4DF3    CMP   #$23
         BEQ   L4DA2
         CMP   #$2E
         BNE   L4E0E
         CPY   #$00
         BNE   L4DA2
         INX
         LDA   L03F7,X
         JSR   L4F89
         BCS   L4DA2
         LDA   #$2E
         JSR   L4EAB
         RTS

L4E0E    JSR   L664D
         CMP   #$45
         BEQ   L4DA2
         LDA   $BE
         STX   $BE
         REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   ^L03F7
         AND   #$00FF
         CLC
         ADC   #L03F7
         PHA
         PHY
         PEA   $FFFF
         _Dec2Long
         PLA
         STA   $47
         PLA
         STA   $49
         SEP   #$30
         BEQ   L4E54
         LDA   #$FC
         JSR   L4EAB
         LDX   #$00
L4E48    LDA   $47,X
         JSR   L4EAB
         INX
         CPX   #$04
         BCC   L4E48
         BRA   L4E86
L4E54    LDA   $48
         BNE   L4E62
         LDA   $47
         CMP   #$0A
         BCS   L4E6D
         ORA   #$F0
         BRA   L4E83
L4E62    REP   #$30
         LDA   $47
         CMP   #$1000
         SEP   #$30
         BCS   L4E77
L4E6D    LDY   $47
         LDA   $48
         STY   $48
         ORA   #$E0
         BRA   L4E7E
L4E77    LDA   #$FA
         JSR   L4EAB
         LDA   $47
L4E7E    JSR   L4EAB
         LDA   $48
L4E83    JSR   L4EAB
L4E86    LDX   $BE
         SEC
         RTS

L4E8A    LDA   $0B
         STA   $E9
         LDA   $0C
         STA   $EA
         BMI   L4E96
         LDA   $0B
L4E96    LDY   $C0
         STA   L03F7,Y
         INY
         CMP   #$DF
         BNE   L4EA8
         LDA   $0B
         STA   L03F7,Y
         INY
         LDA   #$00
L4EA8    STY   $C0
         RTS

L4EAB    LDY   $C0
         STA   L03F7,Y
         INC   $C0
         RTS

L4EB3    JSR   L4EE9
         BCS   L4EC9
L4EB8    JSR   L4EDB
         BCC   L4EC9
         LDA   $0B
         SBC   #$16
         BMI   L4EC6
         CLC
         ADC   #$76
L4EC6    STA   $0B
         SEC
L4EC9    RTS

L4ECA    JSR   L4EF7
         BCC   L4EDA
         LDA   #$DF
         CMP   $0B
         BCS   L4EDA
         LDA   #$DF
         STA   $0C
         SEC
L4EDA    RTS

L4EDB    LDA   #$DF
         STA   $0C
         LDA   #$FE
         PHA
         REP   #$30
         LDA   #L25BD
         BRA   L4F01
         MX    %11
L4EE9    STZ   $0C
         LDA   #$9A
         PHA
         LDY   #$86
         REP   #$30
         LDA   #L2417
         BRA   L4F04
         MX    %11
L4EF7    STZ   $0C
         LDA   #$E9
         PHA
         REP   #$30
         LDA   #L23FE
L4F01    LDY   #$0080
L4F04    STA   $A3
         SEP   #$30
         STY   $0B
         LDA   #^L23FE
         STA   $A5
         PLA
         STX   $BE
         INC
         PHA
         LDY   #$00
L4F15    LDX   $BE
L4F17    LDA   L03F7,X
         AND   #$7F
         JSR   L664D
         EOR   [$A3],Y
         INY
         INX
         ASL
         BNE   L4F30
         BCC   L4F17
         JSR   L4F55
         BCS   L4F30
         SEC
         PLA
         RTS

L4F30    DEY
         BCS   L4F39
L4F33    INY
         LDA   [$A3],Y
         BPL   L4F33
         SEC
L4F39    TYA
         ADC   $A3
         STA   $A3
         BCC   L4F42
         INC   $A4
L4F42    LDY   #$00
         INC   $0B
         LDA   $0B
         CMP   $01,S
         BCS   L4F50
         LDA   [$A3],Y
         BNE   L4F15
L4F50    CLC
         LDX   $BE
         PLA
         RTS

L4F55    LDA   L03F7,X
         AND   #$7F
         JSR   L4F80
         BCC   L4F7F
         DEY
         LDA   [$A3],Y
         INY
         AND   #$7F
         JSR   L4F80
         BCC   L4F7F
         LDA   $0B
         BIT   $0C
         BMI   L4F7A
         CMP   #$87
         BEQ   L4F78
         CMP   #$88
         BNE   L4F7E
L4F78    CLC
         RTS

L4F7A    CMP   #$8B
         BEQ   L4F78
L4F7E    SEC
L4F7F    RTS

L4F80    JSR   L6638
         BCS   L4F92
         CMP   #$2E
         BEQ   L4F92
L4F89    CMP   #$3A
         BCS   L4F91
         CMP   #$30
         BCS   L4F92
L4F91    CLC
L4F92    RTS

L4F93    CMP   #$40
         BEQ   L4F9D
         CMP   #$27
         BCS   L4F91
         CMP   #$23
L4F9D    RTS

*-----------------------
* RENUMBER
*-----------------------

L4F9E    JSR   L47A6
         REP   #$30
         LDA   #$000A
         STA   $B3
         STA   $B9
         LDA   #$0001
         STA   $B5
         LDA   #$FEFF
         STA   $B7
         SEP   #$30
         JSR   L3CC8
         BEQ   L5023
         CMP   #$2C
         BNE   L4FC4
         JSR   L6306
         BRA   L4FDE
L4FC4    JSR   L3CC8
         JSR   L3AF6
         REP   #$30
         LDA   $30
         STA   $B3
         SEP   #$30
         JSR   L3CC8
         BEQ   L5023
         JSR   L6346
         CMP   #$2C
         BEQ   L4FF1
L4FDE    JSR   L3CC8
         JSR   L3AF6
         REP   #$30
         LDA   $30
         BEQ   L4FF1
         CMP   #$03E9
         BCS   L4FF1
         STA   $B9
L4FF1    SEP   #$30
         JSR   L3CC8
         BEQ   L5023
         JSR   L6346
         JSR   L3AF6
         REP   #$30
         LDA   $30
         STA   $B5
         SEP   #$30
         JSR   L3CC8
         BEQ   L5023
         LDA   #$2D
         JSR   L6348
         JSR   L3AF6
         REP   #$30
         LDA   $30
         STA   $B7
         SEP   #$30
         JSR   L3CC8
         BEQ   L5023
         BRL   L6356
L5023    SEP   #$30
         JSR   L5A7B
         JSR   L5204
         BCC   L502E
         RTS

L502E    JSR   L528B
         JSR   L50DD
         LDA   $4D
         STA   $C2
         STA   $50
         REP   #$30
         LDA   $4B
         STA   $4E
         STA   $C0
         SEP   #$30
         LDA   #$80
         JSR   L52FF
         REP   #$30
         LDA   $C0
         SEC
         SBC   L107C
         STA   $1C
         SEP   #$30
         LDA   $C2
         SBC   L107E
         BEQ   L5062
         STZ   $1C
         LDA   #$02
         STA   $1D
L5062    LDA   $1C
         STZ   $1C
         BEQ   L506A
         INC   $1D
L506A    STZ   $1E
         LDX   L107E
         REP   #$30
         LDA   $1C
         CLC
         ADC   L107C
         SEP   #$30
         BCC   L507C
         INX
L507C    JSR   L4997
         BCC   L5096
         REP   #$30
         LDA   $1C
         PHA
         SEP   #$30
         STZ   $1E
         LDX   #$08
         JSR   L5603
         REP   #$30
         PLA
         STA   $1C
         SEP   #$30
L5096    LDA   $24
         BEQ   L50AB
         REP   #$30
         LDA   $1C
         PHA
         SEP   #$30
         JSR   L515B
         REP   #$30
         PLA
         STA   $1C
         SEP   #$30
L50AB    STZ   $1E
         LDA   $4D
         STA   $99
         REP   #$30
         LDA   $4B
         STA   $97
         SEP   #$30
         JSR   L4AB1
         REP   #$30
         LDA   $97
         STA   $C0
         LDA   $8B
         STA   $4E
         SEP   #$30
         LDA   $99
         STA   $C2
         LDA   $8D
         STA   $50
         LDA   #$00
         JSR   L52FF
         JSR   L5A7B
         STZ   $7B
         BRL   L4146
L50DD    STZ   $24
         REP   #$30
         LDA   $22
         ORA   $28
         BEQ   L511A
         LDA   $22
         BEQ   L50F1
         CMP   $B3
         BEQ   L511D
         BCS   L50FD
L50F1    LDA   $28
         BEQ   L511A
         CMP   $A6
         BCC   L50FD
         BEQ   L511D
         BRA   L511A
L50FD    LDA   $B3
         STA   $30
         SEP   #$30
         JSR   L903F
         BCS   L511D
         TXA
         BEQ   L5116
         INY
         REP   #$30
         LDA   [$97],Y
         CMP   $A6
         BCC   L511D
         BEQ   L511D
L5116    SEP   #$30
         DEC   $24
L511A    SEP   #$30
         RTS

L511D    SEP   #$30
         LDX   #$56
         BRL   L3FA4
L5124    LDA   $4D
         STA   $99
         REP   #$30
         LDA   $4B
         STA   $97
L512E    SEP   #$30
         LDA   [$97]
         TAY
         LDA   [$97],Y
         TAX
         BEQ   L5157
         INY
         REP   #$30
         LDA   [$97],Y
         DEY
         CMP   $30
         BEQ   L5158
         TXA
         CLC
         ADC   $97
         BCC   L514B
         INC   $99
         CLC
L514B    STY   $97
         ADC   $97
         STA   $97
         BCC   L512E
         INC   $99
         BRA   L512E
L5157    CLC
L5158    SEP   #$30
         RTS

L515B    REP   #$30
         LDA   $B5
         STA   $B9
         LDA   $A6
         STA   $30
         SEP   #$30
         JSR   L903F
         BCC   L516F
         JSR   L3F4C
L516F    LDA   [$97]
         TAY
         INY
         REP   #$30
         LDA   [$97],Y
         BNE   L517A
         DEC
L517A    STA   $25
L517C    REP   #$30
         LDA   $B9
         STA   $30
         SEP   #$30
         JSR   L5124
         BCS   L518C
         JSR   L3F4C
L518C    LDA   [$97]
         TAY
         LDA   [$97],Y
         STY   $BE
         CLC
         ADC   $BE
         REP   #$30
         AND   #$00FF
         BCC   L51A0
         ORA   #$0100
L51A0    CLC
         STA   $0B
         ADC   $97
         STA   $44
         SEP   #$30
         LDA   $99
         BCC   L51AE
         INC
L51AE    STA   $46
         LDA   [$44]
         TAY
         INY
         REP   #$30
         LDA   [$44],Y
         STA   $B9
         SEP   #$20
         LDY   $0B
L51BE    DEY
         BMI   L51C8
         LDA   [$97],Y
         STA   L03D7,Y
         BRA   L51BE
L51C8    SEP   #$30
         JSR   L4A65
         REP   #$30
         LDA   $0B
         STA   $1C
         LDA   $25
         STA   $30
         SEP   #$30
         JSR   L5124
         BCS   L51E6
         LDA   $31
         INC
         BEQ   L51E6
         JSR   L3F4C
L51E6    LDA   #^L03D6
         STA   $83
         REP   #$30
         LDA   #L03D6
         STA   $81
         SEP   #$30
         JSR   L4AA0
         REP   #$30
         LDA   $B9
         CMP   $B7
         BEQ   L5200
         BCS   L5203
L5200    BRL   L517C
L5203    RTS

L5204    LDA   $62
         STA   $42
         REP   #$30
         LDA   $60
         STA   $40
         LDA   #$0001
         STA   $30
         STZ   $28
         STZ   $22
         SEP   #$30
         JSR   L903F
         TXA
         BNE   L5221
         SEC
         RTS

L5221    INY
         REP   #$30
         LDA   [$97],Y
         STA   $30
         INC   $30
         CMP   $B5
         BCS   L5232
         STA   $22
         BRA   L525C
L5232    CMP   $B7
         BCC   L523C
         BEQ   L523C
         STA   $28
         BRA   L526C
L523C    STA   [$40]
         LDY   #$0002
         LDA   #$0000
         STA   [$40],Y
         SEP   #$30
         LDA   #$04
         CLC
         ADC   $40
         STA   $40
         REP   #$30
         LDA   $41
         BCC   L5256
         INC
L5256    STA   $41
         CMP   $70
         BCS   L5286
L525C    SEP   #$30
         LDY   $99
         LDX   $98
         LDA   $97
         JSR   L9045
         BCS   L5221
         TXA
         BNE   L5221
L526C    REP   #$30
         LDA   #$0000
         STA   [$40]
         LDA   $40
         CLC
         ADC   #$0004
         STA   $5A
         SEP   #$30
         LDA   $42
         BCC   L5282
         INC
L5282    STA   $5C
         CLC
         RTS

L5286    SEP   #$30
         BRL   L3FA2
L528B    LDA   $62
         STA   $42
         REP   #$30
         LDA   $60
         STA   $40
         LDA   [$40]
         STA   $B5
         LDX   $B3
         LDY   #$0002
L529E    LDA   [$40]
         BEQ   L52BF
         STA   $B7
         TXA
         STA   [$40],Y
         STA   $A6
         CLC
         ADC   $B9
         TAX
         LDA   #$0004
         CLC
         ADC   $40
         STA   $40
         BCC   L529E
         SEP   #$30
         INC   $42
         REP   #$30
         BRA   L529E
L52BF    SEP   #$30
         RTS

L52C2    INY
         LDA   [$4E],Y
         JSR   L53FE
         BEQ   L52DB
         BPL   L52C2
         JSR   L53E9
         LDA   [$4E]
         CMP   #$DF
         BEQ   L52D8
         BCS   L52E1
         DEY
L52D8    INY
         SEC
         RTS

L52DB    INY
         JSR   L53E9
         CLC
         RTS

L52E1    CMP   #$F0
         BCC   L52FC
         CMP   #$FA
         BCC   L52FD
         BEQ   L52FB
         CMP   #$FC
         BCC   L52FA
         BEQ   L52F9
         CMP   #$FF
         BEQ   L52FB
         INY
         INY
         INY
         INY
L52F9    INY
L52FA    INY
L52FB    INY
L52FC    INY
L52FD    SEC
         RTS

L52FF    STA   $15
L5301    LDA   [$4E]
         TAY
         LDA   [$4E],Y
         BNE   L532A
         INY
         INY
L530A    LDA   [$4E],Y
         JSR   L53FE
         DEY
         BPL   L530A
         LDA   #$04
         JSR   L53EE
         BIT   $15
         BMI   L5327
         LDA   $C2
         STA   L107E
         REP   #$30
         LDA   $C0
         STA   L107C
L5327    SEP   #$30
         RTS

L532A    PHY
L532B    LDA   [$4E],Y
         JSR   L53FE
         DEY
         BPL   L532B
         PLY
         JSR   L53E9
         REP   #$30
         LDA   $C0
         STA   $DA
         SEP   #$30
         LDA   $C2
         STA   $DC
         LDY   #$02
         LDA   [$4E],Y
         XBA
         DEY
         LDA   [$4E],Y
         JSR   L5407
         LDY   #$01
         JSR   L53FE
         XBA
         INY
         JSR   L53FE
L5358    JSR   L52C2
         BCS   L537E
L535D    REP   #$30
         LDA   $C0
         SEC
         SBC   $DA
         SEP   #$30
         XBA
         BNE   L5372
         XBA
         BIT   $15
         BMI   L5370
         STA   [$DA]
L5370    BRA   L5301
L5372    BIT   $15
         BPL   L537B
         LDX   #$34
         BRL   L3FA4
L537B    JSR   L3F4C
L537E    PHY
         CMP   #$89
         BEQ   L5394
         CMP   #$8A
         BEQ   L5394
         CMP   #$B2
         BEQ   L538F
         CMP   #$B1
         BNE   L5399
L538F    JSR   L54FC
         BCC   L535D
L5394    JSR   L549F
         BRA   L53E3
L5399    CMP   #$C5
         BEQ   L53BD
         CMP   #$C7
         BEQ   L53BD
         CMP   #$A0
         BEQ   L53BD
         CMP   #$8D
         BEQ   L53BD
         CMP   #$8C
         BEQ   L53BD
         CMP   #$DF
         BNE   L53C2
         LDA   [$4E],Y
         CMP   #$83
         BNE   L53C2
         JSR   L53FE
         JSR   L53E9
L53BD    JSR   L54E6
         BRA   L53E3
L53C2    CMP   #$97
         BNE   L53D3
         JSR   L555C
         BCC   L53D0
         JSR   L555C
         BCS   L53E3
L53D0    BRL   L535D
L53D3    TYA
         BEQ   L53E3
L53D6    LDA   [$4E],Y
         JSR   L53FE
         DEY
         BNE   L53D6
         PLY
         PHY
         JSR   L53E9
L53E3    PLY
         LDY   #$00
         BRL   L5358
L53E9    PHY
         JSR   L8C60
         PLA
L53EE    LDY   #$00
         CLC
         ADC   $C0
         STA   $C0
         REP   #$30
         BCC   L53FB
         INC   $C1
L53FB    SEP   #$30
         RTS

L53FE    PHP
         BIT   $15
         BMI   L5405
         STA   [$C0],Y
L5405    PLP
         RTS

L5407    REP   #$30
         PHA
         LDA   $62
         AND   #$00FF
         STA   $42
         LDA   $60
         STA   $40
         LDY   #$0000
L5418    LDA   [$40],Y
         BEQ   L5435
         CMP   $01,S
         BCS   L542A
         INY
         INY
         INY
         INY
         BNE   L5418
         INC   $42
         BRA   L5418
L542A    BNE   L5435
         PLX
         INY
         INY
         LDA   [$40],Y
         SEP   #$30
         SEC
         RTS

L5435    PLA
         CLC
         SEP   #$30
         RTS

L543A    PHY
         BCS   L544E
         AND   #$0F
         XBA
         INY
         LDA   [$4E],Y
L5443    JSR   L6306
L5446    JSR   L6306
         JSR   L5407
         PLY
         RTS

L544E    CMP   #$FA
         BEQ   L545C
         BCS   L5469
         AND   #$0F
         XBA
         LDA   #$00
         XBA
         BRA   L5446
L545C    INY
         LDA   [$4E],Y
         XBA
         INY
         LDA   [$4E],Y
         XBA
         JSR   L6306
         BRA   L5443
L5469    LDX   #$56
         BRL   L3FA4
L546E    REP   #$30
         CMP   #$000A
         BCS   L547D
         SEP   #$30
         ORA   #$F0
         BRA   L5498
         REP   #$30
L547D    CMP   #$1000
         BCS   L5489
         XBA
         SEP   #$30
         ORA   #$E0
         BRA   L5493
L5489    SEP   #$30
         TAX
         LDA   #$FA
         JSR   L53FE
         INY
         TXA
L5493    JSR   L53FE
         XBA
         INY
L5498    JSR   L53FE
         TYA
         BRL   L53EE
L549F    INY
         LDA   [$4E],Y
         CMP   #$E0
         BCS   L54C8
         JSR   L6638
         BCC   L54E5
L54AB    JSR   L53FE
         INY
         LDA   [$4E],Y
         BEQ   L54E1
         JSR   L4F80
         BCS   L54AB
         CMP   #$3A
         BEQ   L54E1
         CMP   #$2C
         BNE   L54E1
L54C0    JSR   L53FE
         JSR   L53E9
         BRA   L549F
L54C8    CMP   #$F0
         BEQ   L54E5
         JSR   L543A
         JSR   L546E
         LDY   #$01
         LDA   [$4E],Y
         BEQ   L54E5
         CMP   #$3A
         BEQ   L54E5
         CMP   #$2C
         BEQ   L54C0
         RTS

L54E1    DEY
         JSR   L53E9
L54E5    RTS

L54E6    INY
         LDA   [$4E],Y
         CMP   #$E0
         BCC   L54FB
         CMP   #$FB
         BCS   L54FB
         CMP   #$F0
         BEQ   L54FB
         JSR   L543A
         JSR   L546E
L54FB    RTS

L54FC    STZ   $DD
         LDY   #$00
L5500    INY
         LDA   [$4E],Y
         JSR   L53FE
         BEQ   L551D
         CMP   #$28
         BNE   L5510
         INC   $DD
         BRA   L5500
L5510    CMP   #$2C
         BNE   L5523
         LDX   $DD
         BNE   L5500
         JSR   L53E9
         SEC
         RTS

L551D    INY
         JSR   L53E9
         CLC
         RTS

L5523    CMP   #$29
         BNE   L552F
         DEC   $DD
         BPL   L5500
         STZ   $DD
         BRA   L5500
L552F    CMP   #$DF
         BCC   L5500
         BNE   L5547
         INY
         LDA   [$4E],Y
         JSR   L53FE
         CMP   #$96
         BCC   L5500
         CMP   #$DD
         BCS   L5500
         INC   $DD
         BRA   L5500
L5547    STY   $BE
         JSR   L52E1
         PHY
L554D    LDA   [$4E],Y
         JSR   L53FE
         DEY
         CPY   $BE
         BEQ   L5559
         BCS   L554D
L5559    PLY
         BRA   L5500
L555C    STZ   $DD
         LDY   #$00
L5560    INY
         LDA   [$4E],Y
         JSR   L53FE
         BEQ   L558F
         CMP   #$22
         BNE   L557A
L556C    INY
         LDA   [$4E],Y
         JSR   L53FE
         BEQ   L558F
         CMP   #$22
         BNE   L556C
         BRA   L5560
L557A    CMP   #$28
         BNE   L5582
         INC   $DD
         BRA   L5560
L5582    CMP   #$2C
         BNE   L5595
         LDX   $DD
         BNE   L5560
         JSR   L53E9
         SEC
         RTS

L558F    INY
         JSR   L53E9
         CLC
         RTS

L5595    CMP   #$29
         BNE   L55A1
         DEC   $DD
         BPL   L5560
         STZ   $DD
         BRA   L5560
L55A1    CMP   #$DF
         BCC   L5560
         BNE   L55B9
         INY
         LDA   [$4E],Y
         JSR   L53FE
         CMP   #$96
         BCC   L5560
         CMP   #$DD
         BCS   L5560
         INC   $DD
         BRA   L5560
L55B9    STY   $BE
         JSR   L52E1
         PHY
L55BF    LDA   [$4E],Y
         JSR   L53FE
         DEY
         CPY   $BE
         BEQ   L55CB
         BCS   L55BF
L55CB    PLY
         BRA   L5560
         SEP   #$30
L55D0    REP   #$30
         LDA   $63
         PHA
         LDA   L107C
         STA   $63
         SEP   #$30
         LDA   $65
         PHA
         LDA   L107E
         STA   $65
         JSR   L5889
         PLA
         STA   $65
         LDA   L107C
         SEC
         SBC   $1C
         STA   L107C
         REP   #$30
         LDA   L107D
         SBC   $1D
         STA   L107D
         PLA
         STA   $63
         SEP   #$30
         RTS

L5603    LDY   $1C
         STZ   L1092
         STZ   L1095
         REP   #$30
         LDA   $1D
         CPY   #$0000
         BNE   L5615
         INC
L5615    INC
         STA   L1093
         STA   L108E
         LDA   L1040,X
         CLC
         ADC   L1092
         STA   L1092
         LDA   L1042,X
         ADC   L1094
         STA   L1094
L562F    SEP   #$30
L5631    PHX
         LDA   #$FF
         STA   L102D
         JSR   L5B24
         JSR   L5B6A
         PLX
         PHX
         REP   #$30
         LDY   L1092
         LDA   L1094
         PHA
         PHY
         LDA   L1036,X
         PHA
         LDA   L1034,X
         PHA
         _SetHandleSize
         BCC   L5670
         CMP   #$0201
         BEQ   L5662
         BRL   L3F6A
L5662    SEP   #$30
         LDA   L108E
         STZ   L102D
         JSR   L5D47
         PLX
         BRA   L5631
L5670    SEP   #$30
         JSR   L5B6E
         JSR   L5B28
         STZ   L102D
         PLX
         REP   #$30
         LDA   L1092
         LDY   L1094
         STA   L1040,X
         TYA
         STA   L1042,X
         LDA   L1060,X
         STA   L1096
         LDA   L1062,X
         STA   L1098
         SEP   #$30
         JSR   L56A0
         JSR   L5758
         RTS

L56A0    LDA   $76
         INC
         BEQ   L56AA
         LDX   #$4E
         JSR   L5744
L56AA    LDX   #$79
         JSR   L5744
         LDX   #$C9
         JSR   L5744
         LDX   #$7E
         JSR   L5744
         REP   #$30
         LDA   L107C
         SEC
         SBC   L1068
         STA   L107C
         LDA   L107E
         SBC   L106A
         STA   L107E
         LDY   L103E
         LDA   L103C
         STA   $EB
         STY   $ED
         LDY   #$0002
         LDA   [$EB],Y
         TAY
         LDA   [$EB]
         STA   L1068
         STY   L106A
         CLC
         ADC   L1048
         TAX
         TYA
         ADC   L104A
         CPX   #$0000
         BNE   L56F5
         DEC
L56F5    DEX
         STX   L1074
         STA   L1076
         LDA   L1068
         STA   $EB
         SEP   #$30
         STY   $ED
         LDA   [$EB]
         SEC
         ADC   $EB
         STA   $4B
         REP   #$30
         LDA   $EC
         ADC   #$0000
         STA   $4C
         LDA   L107C
         CLC
         ADC   L1068
         STA   L107C
         LDA   L107E
         ADC   L106A
         STA   L107E
         SEP   #$30
         LDX   #$7E
         JSR   L5744
         LDX   #$79
         JSR   L5744
         LDX   #$C9
         JSR   L5744
         LDA   $76
         INC
         BEQ   L5743
         LDX   #$4E
         JSR   L5744
L5743    RTS

L5744    REP   #$30
         LDA   L1068
         SEC
         SBC   $00,X
         STA   $00,X
         SEP   #$30
         LDA   L106A
         SBC   $02,X
         STA   $02,X
         RTS

L5758    LDA   L1078
         SEC
         SBC   $72
         STA   L1078
         REP   #$30
         LDA   L1079
         SBC   $73
         STA   L1079
         LDY   L103A
         LDA   L1038
         STA   $EB
         STY   $ED
         LDY   #$0002
         LDA   [$EB],Y
         TAY
         LDA   [$EB]
         STA   $72
         STA   L1064
         STY   L1066
         CLC
         ADC   L1044
         TAX
         TYA
         ADC   L1046
         CPX   #$0000
         BNE   L5794
         DEC
L5794    DEX
         STX   L1070
         STA   L1072
         LDA   L1078
         CLC
         ADC   $72
         STA   L1078
         SEP   #$30
         STY   $74
         LDA   L107A
         ADC   $74
         STA   L107A
         RTS

         LDY   #$02
         LDX   $53
         REP   #$30
         LDA   $51
         BRA   L57DD
         SEP   #$30
L57BD    LDY   #$0B
         LDX   $5C
         REP   #$30
         LDA   $5A
         BRA   L57DD
         SEP   #$30
L57C9    LDY   #$0E
         LDX   $5F
         REP   #$30
         LDA   $5D
         BRA   L57DD
         SEP   #$30
L57D5    LDY   #$08
         LDX   $59
         REP   #$30
         LDA   $57
L57DD    STA   $97
         SEP   #$30
         STX   $99
         REP   #$30
         LDA   $63
         STA   $91
         CLC
         ADC   $1C
         STA   $8B
         SEP   #$30
         LDA   $65
         STA   $93
         ADC   $1E
         STA   $8D
         TAX
         LDA   $8B
         JSR   L5801
L57FE    BRL   L592C
L5801    JSR   L594C
         REP   #$30
         STA   $63
         SEP   #$30
         STX   $65
         PHY
         JSR   L5812
         PLX
L5811    RTS

L5812    SEP   #$30
         LDA   $91
         CMP   $97
         REP   #$30
         LDA   $92
         SBC   $98
         BEQ   L5862
         CMP   #$0100
         BCS   L5841
         STA   $5833
         STA   $583B
         XBA
         TAY
         DEY
         DEY
         LDA   $8C
         SEC
         SBC   #$FF00
         STA   $8C
         LDA   $92
         SEC
         SBC   #$FF00
         STA   $92
         BRA   L5854
L5841    SEC
         LDA   $8C
         SBC   #$0100
         STA   $8C
         LDA   $92
         SEC
         SBC   #$0100
         STA   $92
         LDY   #$FFFE
L5854    LDA   [$91],Y
         STA   [$8B],Y
         DEY
         DEY
         BNE   L5854
         LDA   [$91],Y
         STA   [$8B],Y
         BRA   L5812
L5862    LDX   $8D
         LDA   $91
         SEC
         SBC   $97
         BEQ   L5886
         TAY
         LDA   $8B
         STY   $8B
         SEC
         SBC   $8B
         STA   $8B
         SEP   #$30
         TXA
         SBC   #$00
         STA   $8D
         DEY
L587D    LDA   [$97],Y
         STA   [$8B],Y
         DEY
         CPY   #$FF
         BNE   L587D
L5886    SEP   #$30
L5888    RTS

L5889    LDA   $97
         PHA
         LDA   $98
         PHA
         LDA   $99
         PHA
L5892    SEP   #$30
         LDA   $63
         CMP   $40
         REP   #$30
         LDA   $64
         SBC   $41
         BEQ   L58DD
         CMP   #$0100
         BCC   L58BE
         XBA
         AND   #$00FF
         TAX
         LDY   #$0000
L58AD    LDA   [$40],Y
         STA   [$97],Y
         INY
         INY
         BNE   L58AD
         INC   $99
         INC   $42
         DEX
         BNE   L58AD
         BRA   L5892
L58BE    PHA
         XBA
         TAX
         LDY   #$0000
L58C4    LDA   [$40],Y
         STA   [$97],Y
         INY
         INY
         DEX
         DEX
         BNE   L58C4
         PLA
         PHA
         CLC
         ADC   $98
         STA   $98
         PLA
         CLC
         ADC   $41
         STA   $41
         BRA   L5892
L58DD    SEP   #$30
         SEC
         LDA   $63
         SBC   $40
         BEQ   L58F1
         TAX
         LDY   #$00
L58E9    LDA   [$40],Y
         STA   [$97],Y
         INY
         DEX
         BNE   L58E9
L58F1    PLA
         STA   $99
         PLA
         STA   $98
         PLA
         STA   $97
         RTS

L58FB    LDX   #$0B
         BRA   L5905
L58FF    LDX   #$08
         BRA   L5905
L5903    LDX   #$0E
L5905    PHX
         LDA   $97
         SEC
         SBC   $40
         STA   $1C
         REP   #$30
         LDA   $98
         SBC   $41
         STA   $1D
         SEP   #$30
         JSR   L5889
         LDA   $63
         CLC
         ADC   $1C
         STA   $63
         REP   #$30
         LDA   $64
         ADC   $1D
         STA   $64
         SEP   #$30
         PLX
L592C    CPX   #$15
         BCC   L5933
         JSR   L3F4C
L5933    CLC
         LDA   $4F,X
         ADC   $1C
         STA   $4F,X
         LDA   $50,X
         ADC   $1D
         STA   $50,X
         LDA   $51,X
         ADC   $1E
         STA   $51,X
         DEX
         DEX
         DEX
         BPL   L5933
         RTS

L594C    CPX   $6B
         BCC   L596F
         BNE   L5958
         REP   #$20
         CMP   $69
         BCC   L596F
L5958    SEP   #$30
         PHY
         PHA
         PHX
         JSR   L5977
         PLX
         PLA
         PLY
         CPX   $6B
         BCC   L596F
         BNE   L5972
         REP   #$20
         CMP   $69
         BCS   L5972
L596F    SEP   #$30
         RTS

L5972    SEP   #$30
         BRL   L3FA2
L5977    LDX   #$10
         XBA
L597A    PHA
         LDA   $8B,X
         DEX
         BPL   L597A
         JSR   L6B5C
         LDX   #$00
L5985    PLA
         STA   $8B,X
         INX
         CPX   #$10
         BCC   L5985
         PLA
         XBA
         RTS

*-----------------------
* CLEAR
*-----------------------

L5990    BNE   L5995
         BRL   L5A78
L5995    CMP   #$9A
         BNE   L599C
         JMP   LD15E      ;BRL LD15E
L599C    CMP   #$99
         BNE   L59A3
         JMP   LD180      ;BRL LD180
L59A3    JSR   L608F
         JSR   LE440
         LDA   L0AF3
         BEQ   L59B1
L59AE    BRL   L6708
L59B1    LDA   L0AF0
         BEQ   L59C1
         STZ   L0AF0
         INC   L0AF1
         BNE   L59C1
         INC   L0AF2
L59C1    LDA   L0AF2
         BMI   L59AE
         BEQ   L59D1
         CMP   #$7F
         BCS   L59AE
         LDA   L0AF1
         BRA   L59D9
L59D1    LDA   L0AF1
         CMP   L104C
         BCC   L59AE
L59D9    STA   L1089
         STZ   L1088
         LDA   L0AF2
         STA   L108A
         JSR   L6B5C
         JSR   L5BAA
         RTS

*-----------------------
* NEW
*-----------------------

L59EC    BEQ   L5A4E
         JSR   L608F
         JSR   LE440
         LDA   L0AF3
         BEQ   L59FC
L59F9    BRL   L6708
L59FC    LDA   L0AF0
         BEQ   L5A0B
         STZ   L0AF0
         REP   #$30
         INC   L0AF1
         SEP   #$30
L5A0B    LDA   L0AF2
         BEQ   L5A19
         CMP   #$10
         BCS   L59F9
         LDA   L0AF1
         BRA   L5A20
L5A19    LDA   L0AF1
         CMP   #$02
         BCC   L59F9
L5A20    STA   L1093
         STZ   L1092
         LDA   L0AF2
         STA   L1094
         STZ   L1095
         LDA   L107C
         CMP   L1068
         REP   #$30
         LDA   L107D
         SBC   L1069
         INC
         CMP   L1093
         BCC   L5A46
         STA   L1093
L5A46    SEP   #$30
         LDX   #$08
         JSR   L562F
         RTS

L5A4E    STZ   $12
         LDX   #$1F
         STX   $1A
L5A54    LDX   $1A
         JSR   LB742
         LDA   L06F0,Y
         BEQ   L5A61
         JSR   LACC4
L5A61    DEC   $1A
         BNE   L5A54
         JSR   LAC95
         JSR   L39CF
         JSR   L5AEE
         STZ   $76
         STZ   L0087
         STZ   L0088
         BRA   L5A7B
L5A78    JSR   LACAA
L5A7B    LDA   $6C
         LDX   $6E
         LDY   $6D
         STA   $69
         STY   $6A
         STX   $6B
         LDA   $60
         LDY   $61
         LDX   $62
         STA   $5D
         STY   $5E
         STX   $5F
         STZ   $D9
         STA   $5A
         STY   $5B
         STX   $5C
         STA   $57
         STY   $58
         STX   $59
         STA   $54
         STY   $55
         STX   $56
         STA   $51
         STY   $52
         STX   $53
         STA   $63
         STY   $64
         STX   $65
         STZ   L16F3
         STZ   $CC
         STZ   $C7
         STZ   $C8
         STZ   $D2
         STZ   L17BB
L5AC1    JSR   L3DA5
L5AC4    REP   #$30
         PLA
         LDX   L06E9
         TXS
         PHK
         LDX   #L3F91+1
         PHX
         TSX
         STX   $D4
         PHA
         SEP   #$30
         LDA   #$01
         STA   L0B0E
         LDA   #$FD
         STA   $09
         STZ   L09ED
         STZ   L09EE
         LDA   #$00
         STZ   L05FB
         STZ   L0B0C
         RTS

L5AEE    SEC
         LDA   $4B
         SBC   #$01
         STA   $4E
         LDA   $4C
         SBC   #$00
         STA   $4F
         LDA   $4D
         SBC   #$00
         STA   $50
         LDY   #$00
         TYA
         STA   [$4E],Y
L5B06    JSR   L822B
         JSR   L8207
         JSR   L8217
         JSR   L820D
         JSR   L8223
         STZ   L16EF
         LDX   #$91
L5B1A    STZ   L0639,X
         DEX
         BNE   L5B1A
         TXY
         STZ   $CB
         RTS

L5B24    LDA   #$22
         BRA   L5B2A
L5B28    LDA   #$20
L5B2A    PHA
         LDA   #$02
         PHA
         STZ   $12
         LDX   #$1D
L5B32    LDY   L1D11,X
         LDA   L06F0,Y
         BEQ   L5B5D
         LDA   L06F3,Y
         BIT   #$40
         BEQ   L5B5D
         PHX
         REP   #$30
         LDA   $02,S
         TAX
         LDA   L06F6,Y
         AND   #$00FF
         PHA
         LDA   L06F4,Y
         PHA
         JSL   DISPATCH1
         SEP   #$30
         BCC   L5B5C
         STA   $12
L5B5C    PLX
L5B5D    DEX
         BNE   L5B32
         PLA
         PLA
         LDA   $12
         BEQ   L5B69
         BRL   L3F6A
L5B69    RTS

L5B6A    LDA   #$22
         BRA   L5B70
L5B6E    LDA   #$20
L5B70    PHA
         LDA   #$02
         PHA
         STZ   $12
         LDX   #$03
L5B78    LDA   L102C,X
         BMI   L5B97
         PHX
         TAY
         REP   #$30
         LDA   $02,S
         TAX
         LDA   L1036,Y
         PHA
         LDA   L1034,Y
         PHA
         JSL   DISPATCH1
         SEP   #$30
         BCS   L5B96
         STA   $12
L5B96    PLX
L5B97    DEX
         BNE   L5B78
         PLA
         PLA
         LDA   $12
         BEQ   L5BA6
         STZ   L102D
         BRL   L3F6A
L5BA6    RTS

L5BA7    JSR   L5977
L5BAA    STZ   $44
         LDA   $69
         CMP   $63
         REP   #$30
         LDA   $6A
         SBC   $64
         STZ   $45
         BEQ   L5BC4
         CMP   L1050
         BCC   L5BC4
         SBC   L1050
         STA   $45
L5BC4    SEP   #$30
         LDA   $6F
         SEC
         SBC   $44
         TAX
         REP   #$30
         LDA   $70
         SBC   $45
         XBA
         SEP   #$30
         TAY
         TXA
         SEC
         SBC   $60
         TAX
         TYA
         REP   #$30
         XBA
         SBC   $61
         CMP   L1089
         BCC   L5BEE
         STA   L1089
         SEP   #$30
         STX   L1088
L5BEE    SEP   #$30
         SEP   #$30
         JSR   L5CEF
         LDA   $6F
         SEC
         SBC   $60
         STA   $9B
         REP   #$30
         LDA   $70
         SBC   $61
         STA   $9C
         SEP   #$30
         STZ   $9E
         JSR   L5B24
         JSR   L5B6A
         REP   #$30
         STZ   L108C
         LDA   L108A
         PHA
         LDA   L1088
         PHA
         LDA   L1036
         PHA
         LDA   L1034
         PHA
         _SetHandleSize
         BCC   L5C40
         CMP   #$0201
         BNE   L5C70
         DEC   L108C
         LDA   L1040
         STA   L1088
         LDA   L1042
         STA   L108A
L5C40    LDA   $9B
         STA   L1040
         LDA   $9D
         STA   L1042
         _CompactMem
         BCS   L5C70
         SEP   #$30
         JSR   L5B6E
         JSR   L5B28
         JSR   L5C73
         JSR   L56A0
         JSR   L5758
         JSR   L5D81
         BIT   L108C
         BPL   L5C6F
         BRL   L3FA2
L5C6F    RTS

L5C70    BRL   L3F6A
L5C73    REP   #$30
         LDA   L1036
         STA   $9D
         LDA   L1034
         STA   $9B
         LDA   [$9B]
         TAX
         LDY   #$0002
         LDA   [$9B],Y
         TAY
         TXA
         SEC
         SBC   L1060
         STA   $47
         TYA
         SBC   L1062
         STA   $49
         STX   L1060
         STY   L1062
         ORA   $47
         SEP   #$30
         BEQ   L5CDC
         LDX   #$5D
         JSR   L5CDD
         LDX   #$5A
         JSR   L5CDD
         LDX   #$57
         JSR   L5CDD
         LDX   #$54
         JSR   L5CDD
         LDX   #$51
         JSR   L5CDD
         LDX   #$63
         JSR   L5CDD
         LDX   #$69
         JSR   L5CDD
         LDX   #$6C
         JSR   L5CDD
         LDX   #$6F
         JSR   L5CDD
         REP   #$30
         LDA   L1060
         STA   $60
         SEP   #$30
         LDA   L1062
         STA   $62
L5CDC    RTS

L5CDD    REP   #$30
         LDA   $00,X
         CLC
         ADC   $47
         STA   $00,X
         SEP   #$30
         LDA   $02,X
         ADC   $49
         STA   $02,X
         RTS

L5CEF    LDA   $69
         STA   $40
         STA   $97
         REP   #$30
         LDA   $6A
         STA   $41
         SEC
         SBC   $45
         STA   $98
         LDA   $63
         PHA
         LDA   $6F
         STA   $63
         SEP   #$30
         LDA   $65
         PHA
         LDA   $71
         STA   $65
         JSR   L5889
         LDA   $6F
         SEC
         SBC   $44
         STA   $6F
         REP   #$30
         LDA   $70
         SBC   $45
         STA   $70
L5D22    SEP   #$30
         LDA   $6C
         SEC
         SBC   $44
         STA   $6C
         PLA
         STA   $65
         REP   #$30
         PLA
         STA   $63
         LDA   $97
         STA   $69
         LDA   $6D
         SBC   $45
         STA   $6D
         SEP   #$30
         LDA   $99
         STA   $6B
         RTS

L5D44    BRL   L3F6A
L5D47    REP   #$30
         AND   #$00FF
         XBA
         STA   L1088
         LDA   L1040
         SEC
         SBC   L1088
         STA   L1088
         LDA   L1042
         SBC   #$0000
         STA   L108A
         SEP   #$30
         JSR   L5BA7
         RTS

L5D69    REP   #$30
         AND   #$00FF
         CLC
         ADC   L1041
         STA   L1089
         SEP   #$30
         STZ   L1088
         STZ   L108B
         JSR   L5BA7
         RTS

L5D81    LDA   L1088
         SEC
         SBC   L1040
         STA   $1C
         REP   #$30
         LDA   L1089
         SEC
         SBC   L1041
         DEC
         STA   $1D
         SEP   #$30
         LDA   $6F
         STA   $91
         STA   $8B
         REP   #$30
         LDA   $70
         STA   $92
         CLC
         ADC   $1D
         STA   $70
         STA   $8C
         LDA   $6D
         CLC
         ADC   $1D
         STA   $6D
         LDA   $69
         STA   $97
         SEP   #$30
         LDA   $6B
         STA   $99
         JSR   L5812
         LDA   $8B
         STA   $69
         REP   #$30
         LDA   $8C
         STA   $6A
         LDA   L1088
         STA   L1040
         LDA   L108A
         STA   L1042
         SEP   #$30
L5DD7    RTS

*-----------------------
* LET
*-----------------------

L5DD8    JSR   L649E
         JSR   L633A
         LDA   $0F
         PHA
         LDA   $D3
         PHA
L5DE4    LDX   #$84
         JSR   L603B
         LDA   $86
         PHA
         REP   #$30
         LDA   $84
         PHA
         SEP   #$30
         INC   $D8
         LDA   $10
         AND   #$80
         JSR   L60AD
         STZ   $D8
         REP   #$30
         PLA
         STA   $84
         SEP   #$30
         PLA
         STA   $86
         PLA
         PLX
         STA   $D3
         STX   $0F
         LDX   #$84
L5E10    JSR   L603B
L5E13    LDX   $0F
         LDA   L1ED1,X
         STA   $10
         BIT   $A5
         BMI   L5E5F
L5E1E    LDY   $86
         REP   #$30
         LDA   $84
         SEP   #$30
L5E26    REP   #$30
         STA   $40
         SEP   #$30
         STY   $42
         CPX   $A4
         BEQ   L5E35
         JSR   LE44E
L5E35    LDX   $A4
         BIT   $A5
         BVC   L5E4D
         CPX   #$00
         BNE   L5E4D
         LDA   L0AF1
         BEQ   L5E47
         BRL   L6708
L5E47    LDA   L0AF0
         STA   [$40]
         RTS

L5E4D    LDY   $A6
         REP   #$30
L5E51    DEY
         DEY
         BMI   L5E5C
         LDA   L0AF0,Y
         STA   [$40],Y
         BRA   L5E51
L5E5C    SEP   #$30
L5E5E    RTS

L5E5F    TDC
         LDA   #$00
         XBA
         REP   #$30
         CMP   $A7
         SEP   #$30
         BEQ   L5E73
         LDA   [$A6]
         JSR   L6DD5
         JSR   L6EED
L5E73    LDA   $A6
         LDY   $A7
         LDX   $A8
         STA   $87
         STX   $89
         STY   $88
         JSR   L6DB5
         LDA   $84
         LDY   $85
         LDX   $86
         JSR   L6D67
         JSR   L6D9F
         LDY   #$02
L5E90    LDA   [$87],Y
         STA   [$84],Y
         DEY
         BPL   L5E90
         TAX
         BEQ   L5EC2
L5E9A    LDX   #$84
         JSR   L603B
         LDX   $D3
         BMI   L5EA9
         LDA   $86
         CMP   #$FF
         BNE   L5EC3
L5EA9    LDY   #$02
         LDA   $85
         STA   [$8B],Y
         DEY
         LDA   $84
         STA   [$8B],Y
         TXA
         BPL   L5EBB
         LDA   $86
         ORA   #$80
L5EBB    BNE   L5EBF
         LDA   #$60
L5EBF    DEY
         STA   [$8B],Y
L5EC2    RTS

L5EC3    LDX   #$17
         BRL   L3FA4
L5EC8    JSR   L6475
         BCC   L5EC3
         CPX   #$00
         BNE   L5F08
         JSR   L803D
         LDA   $8A
         CLC
         ADC   #$03
         STA   $20
         JSR   L6730
         PHA
         SEP   #$30
         JSR   L804A
         JSR   L691D
         BCC   L5F02
         STA   $84
         STY   $85
         STX   $86
         DEC   $0B
         JSR   L66CF
         REP   #$30
         LDA   [$8B]
         SEC
         SBC   $01,S
         PLX
         PLX
         PHA
         PHX
         SEP   #$30
         RTS

L5F02    BRL   L69D1
L5F05    BRL   L6356
L5F08    BRL   L3F9E
L5F0B    BRL   L6548

*-----------------------
* SET
*-----------------------

L5F0E    CMP   #$28
         BNE   L5F05
         JSR   L6306
         JSR   L5EC8
         LDX   $0F
         LDA   L1ED1,X
         STA   $10
         JSR   L3CC8
         CMP   #$29
         BEQ   L5F46
         JSR   L6346
         JSR   L6089
         JSR   L670D
         XBA
         TYA
         REP   #$30
         CMP   $01,S
         BCS   L5F39
         STA   $01,S
L5F39    SEP   #$30
         BCC   L5F3F
         BNE   L5F0B
L5F3F    REP   #$30
         TAY
         SEP   #$30
         BEQ   L5F79
L5F46    JSR   L6332
         JSR   L633A
         CMP   #$5E
         BNE   L5F7C
         JSR   L6306
         JSR   L60A7
         JSR   L6D61
         TAX
         REP   #$30
         TXA
         CMP   $01,S
         BCC   L5F66
         LDA   $01,S
         DEC
         STA   $01,S
L5F66    SEP   #$30
         BEQ   L5F79
         STA   [$84]
         INC   $84
         BNE   L5F76
         REP   #$30
         INC   $85
         SEP   #$30
L5F76    BRL   L5FFE
L5F79    BRL   L6708
L5F7C    CMP   #$2A
         BNE   L5FC0
         JSR   L6306
         JSR   L608F
         JSR   LE440
         REP   #$30
         LDA   L0AF0
         STA   $40
         LDA   L0AF2
         CMP   #$0100
         SEP   #$30
         BCS   L5F79
         STA   $42
         JSR   L3CC8
         BEQ   L5FB2
         JSR   L6346
         JSR   L6089
         JSR   L670D
         XBA
         TYA
         REP   #$30
         BRA   L600B
         SEP   #$30
L5FB2    LDA   [$40]
         REP   #$30
         INC   $40
         SEP   #$30
         BNE   L6006
         INC   $42
         BRA   L6006
L5FC0    JSR   L60A1
         BIT   $A5
         BMI   L5FFE
         REP   #$30
         LDA   #L0AF0
         STA   $40
         SEP   #$30
         LDA   #^L0AF0
         STA   $42
         LDA   $A4
         CMP   #$06
         BCC   L5FF8
         LDX   #$04
         REP   #$30
         LDA   $02,S
         CMP   #$000A
         BEQ   L5FF8
         CMP   #$0004
         BEQ   L5FF3
         INX
         CMP   #$0008
         BEQ   L5FF3
         BRL   L82F8
L5FF3    SEP   #$30
         JSR   LE44E
L5FF8    SEP   #$30
         LDA   $A6
         BRA   L6006
L5FFE    JSR   L6D6F
         PHA
         JSR   L6D9D
         PLA
L6006    REP   #$30
         AND   #$00FF
L600B    AND   #$FFFF
         BEQ   L6036
         LDY   #$0000
         CMP   $01,S
         BEQ   L601B
         BCC   L601B
         LDA   $01,S
L601B    SEP   #$30
         TAX
         XBA
L601F    XBA
L6020    LDA   [$40]
         STA   [$84],Y
         INC   $40
         BNE   L602E
         REP   #$30
         INC   $41
         SEP   #$30
L602E    INY
         DEX
         BNE   L6020
         XBA
         DEC
         BPL   L601F
L6036    SEP   #$30
         PLA
         PLA
         RTS

L603B    LDA   $D3
L603D    BPL   L6053
         LDA   $60
         SEC
         SBC   $00,X
         STA   $00,X
         LDA   $61
         SBC   $01,X
         STA   $01,X
         LDA   $62
         SBC   $02,X
         STA   $02,X
         RTS

L6053    BEQ   L606D
         CMP   #$01
         BEQ   L6080
L6059    LDA   $57
         SEC
         SBC   $00,X
         STA   $00,X
         LDA   $58
         SBC   $01,X
         STA   $01,X
         LDA   $59
         SBC   $02,X
         STA   $02,X
         RTS

L606D    LDA   $5A
         SEC
         SBC   $00,X
         STA   $00,X
         LDA   $5B
         SBC   $01,X
         STA   $01,X
         LDA   $5C
         SBC   $02,X
         STA   $02,X
L6080    RTS

L6081    LDA   #$80
         JSR   L6313
         SEC
         BRA   L6095
L6089    JSR   L608F
         JMP   LE43C      ; BRL LE43C
L608F    LDA   #$00
         JSR   L6313
         CLC
L6095    BIT   $A5
         BMI   L609C
         BCS   L609E
L609B    RTS

L609C    BCS   L609B
L609E    BRL   L3F9E
L60A1    LDA   #$F0
         STZ   $A5
         BRA   L60AD
L60A7    LDA   #$80
         BRA   L60AD
L60AB    LDA   #$00
L60AD    CMP   #$F0
         BEQ   L60B3
         STA   $A5
L60B3    LDX   L0B0A
         STX   $E6
         LDX   L0B0C
         STX   $D6
         LDX   L0B0E
         STZ   L05FA,X
         INX
         STX   $D7
L60C6    PHA
         JSR   L6363
L60CA    JSR   L61F8
         JSR   L3CC8
         LDY   #$00
         LDX   #$0F
         CMP   #$80
         BCC   L60DF
         CMP   #$DF
         BNE   L60E7
         INY
         LDA   [$4E],Y
L60DF    CMP   L23EE,X
         BEQ   L60EA
         DEX
         BNE   L60DF
L60E7    LDX   #$0F
         DEY
L60EA    INX
         INX
         INX
         INX
         DEY
         BMI   L60F4
         JSR   L3CBE
L60F4    CPX   #$08
         BCS   L611D
         STZ   $15
L60FA    CMP   #$3F
         BCS   L6118
         CMP   #$3C
         BCC   L6118
         EOR   #$3F
         CMP   #$03
         ADC   #$00
         EOR   $15
         CMP   $15
         BCC   L6115
         STA   $15
         JSR   L3CBE
         BRA   L60FA
L6115    BRL   L6356
L6118    JSR   L6363
         LDX   $15
L611D    LDY   $D7
         LDA   L05F9,Y
         AND   #$0F
         CMP   L23B6-1,X
         BCS   L618A
         LDA   $A5
         AND   #$F0
         ORA   L23B6-1,X
         STA   L05FB,Y
         TXA
         STA   L05FA,Y
         INY
         INY
         CMP   #$13
         BNE   L6142
         LDA   L05F7,Y
         BEQ   L617B
L6142    STY   $D7
         CPY   #$40
         BCC   L614B
         BRL   L6351
L614B    LDA   $D6
         ADC   #$0B
         STA   $D6
         TAY
         BIT   $A5
         BPL   L6167
         LDX   #$A6
         LDA   $A9
         JSR   L603D
         LDX   #$03
L615F    LDA   $A6,X
         STA   L0AF0,X
         DEX
         BPL   L615F
L6167    LDX   #$09
L6169    LDA   L0AF0,X
         STA   L09EF,Y
         DEY
         DEX
         BPL   L6169
         LDA   $A4
         STA   L09EF,Y
         BRL   L60CA
L617B    PLA
         CMP   #$F0
         BEQ   L6186
         EOR   $A5
         AND   #$80
         BNE   L6187
L6186    RTS

L6187    BRL   L3F9E
L618A    PHX
         JSR   LDDB4
         LDA   $D6
         TAY
         SBC   #$0B
         STA   $D6
         LDX   #$0A
L6197    LDA   L09EF,Y
         STA   L0AEF,X
         DEY
         DEX
         BNE   L6197
         LDA   L09EF,Y
         TAX
         JSR   LE24E
         BIT   $A5
         BPL   L61BF
         LDX   #$03
L61AE    LDA   L0AF0,X
         STA   $A6,X
         DEX
         BPL   L61AE
         LDX   #$A6
         LDA   $A9
         JSR   L603D
         BRA   L61C2
L61BF    JSR   LE460
L61C2    LDY   $D7
         DEY
         DEY
         STY   $D7
         LDA   L05FB,Y
         EOR   $B5
         AND   #$80
         BNE   L6187
         LDA   L05FA,Y
         STA   $15
         ASL
         TAX
         BIT   $A5
         BMI   L61E3
         JSR   (L23C9-2,X)
L61DF    PLX
         BRL   L611D
L61E3    CPX   #$24
         BEQ   L61F0
         CMP   #$0F
         BCS   L61F5
         JSR   L63EB
         BRA   L61DF
L61F0    JSR   L6CD8
         BRA   L61DF
L61F5    BRL   L6356
L61F8    JSR   L3CBE
         BCC   L6225
         CMP   #$2B
         BEQ   L6220
         CMP   #$2D
         BNE   L620B
         JSR   $6220
         JMP   LDF83      ; BRL LDF83
L620B    CMP   #$DF
         BNE   L622B
         LDY   #$01
         LDA   [$4E],Y
         CMP   #$8D
         BNE   L6233
         JSR   L6306
         JSR   $6220
         JMP   LDD96      ; BRL LDD96
L6220    JSR   L3CBE
         BCS   L622B
L6225    JSR   LE558
         BCC   L61F5
         RTS

L622B    CMP   #$80
         BCC   L623F
         CMP   #$DF
         BNE   L6236
L6233    BRL   L62EB
L6236    BCS   L626B
         CMP   #$87
         BEQ   L6252
         BRL   L6356
L623F    JSR   L6638
         BCC   L6247
         BRL   L635B
L6247    CMP   #$2E
         BEQ   L6225
         CMP   #$22
         BEQ   L6257
         BRL   L632C
L6252    JSL   L86EC
         RTS

L6257    LDA   $4E
         LDX   $50
         LDY   $4F
         ADC   #$00
         BCC   L6265
         INY
         BNE   L6265
         INX
L6265    JSR   L6E5F
         BRL   L7407
L626B    JSR   LE28B
         CMP   #$F0
         BCS   L627C
         AND   #$0F
         TAX
         JSR   L3D09
         TAY
         TXA
         BRA   L6287
L627C    CMP   #$FA
         BEQ   L628D
         BCS   L62A1
         AND   #$0F
         TAY
         LDA   #$00
L6287    JSR   L6306
         BRL   L790C
L628D    JSR   L3D09
         TAY
         JSR   L3D09
         BPL   L6287
         STA   L0AF1
         STY   L0AF0
         JSR   L6306
         BRA   L62BB
L62A1    CMP   #$FC
         BEQ   L62A9
         BCS   L62C1
         BRA   L62E8
L62A9    LDX   #$00
         JSR   L6306
L62AE    LDA   [$4E]
         STA   L0AF0,X
         JSR   L6306
         INX
         CPX   #$04
         BCC   L62AE
L62BB    JSR   LE248
         JMP   LE460      ; BRL LE460
L62C1    CMP   #$FF
         BEQ   L62E8
         TAY
         LDX   #$00
         JSR   L6306
L62CB    LDA   [$4E]
         STA   L0AF0,X
         JSR   L6306
         INX
         CPX   #$08
         BCC   L62CB
         CPY   #$FD
         BEQ   L62E2
         JSR   LE23C
         JMP   LE460      ;BRL LE460
L62E2    JSR   LE238
         JMP   LE460      ;BRL LE460
L62E8    BRL   L6356
L62EB    JSR   L3CBE
         CMP   #$E0
         BCS   L62FA
         TAX
         JSR   L3CBE
         TXA
         BRL   L6372
L62FA    CMP   #$F6
         BCS   L62E8
         ASL
         TAX
         JSR   L3CBE
         JMP   (L223C,X)

L6306    INC   $4E
         BNE   L6310
         REP   #$30
         INC   $4F
         SEP   #$30
L6310    RTS

L6311    LDA   #$F0
L6313    STA   $A5
L6315    LDX   $D7
         INX
         STZ   L05FA,X
         INX
         STX   $D7
         CPX   #$40
         BCS   L6351
         LDA   $A5
         JSR   L60C6
         DEC   $D7
         DEC   $D7
         RTS

L632C    JSR   L6342
L632F    JSR   L6315
L6332    LDA   #$29
         BRA   L6348
L6336    LDA   #$3B
         BRA   L6348
L633A    LDA   #$3D
         BRA   L6348
L633E    LDA   #$23
         BRA   L6348
L6342    LDA   #$28
         BRA   L6348
L6346    LDA   #$2C
L6348    LDY   #$00
         CMP   [$4E]
         BNE   L6356
         BRL   L3CBE
L6351    LDX   #$14
L6353    BRL   L3FA4

*-----------------------
* SCALE( / NOUNS/ADVERBS
*-----------------------

L6356    LDX   #$02
         BRL   L3FA4
L635B    LDX   #$FF
         JSR   L64AA
         JMP   LDE7E      ;BRL LDE7E
L6363    LDA   $4E
         BNE   L636F
         LDA   $4F
         BNE   L636D
         DEC   $50
L636D    DEC   $4F
L636F    DEC   $4E
         RTS

L6372    ASL
         CMP   #$AC
         BCC   L637A
         BRL   L63E1
L637A    CMP   #$2C
         BCC   L6356
         PHA
         TAX
         CPX   #$A1
         BCC   L63BA
         JSR   L6081
         JSR   L6346
         PLX
         LDA   $A8
         PHA
         LDA   $A7
         PHA
         LDA   $A6
         PHA
         PHX
         CPX   #$AA
         BNE   L63B3
         JSR   L6081
         PLX
         LDA   $A8
         PHA
         LDA   $A7
         PHA
         LDA   $A6
         PHA
         PHX
         JSR   L3CC8
         LDX   #$01
         CMP   #$2C
         BNE   L63B6
         JSR   L3CBE
L63B3    JSR   L73D3
L63B6    PLY
         PHX
         BRA   L63E2
L63BA    CPX   #$81
         BCC   L63D9
         CPX   #$8C
         BCS   L63CD
         JSR   L608F
         JSR   L6346
         JSR   LDDB4
         BRA   L63D9
L63CD    CPX   #$96
         BCC   L63D5
         LDA   #$F0
         BRA   L63DB
L63D5    LDA   #$80
         BRA   L63DB
L63D9    LDA   #$00
L63DB    STA   $A5
         JSR   L632F
         PLA
L63E1    TAY
L63E2    REP   #$30
         LDA   L22FC,Y
         PHA
         SEP   #$30
         RTS

L63EB    LDA   $B6
         LDY   $B7
         LDX   $B8
         JSR   L6D75
         PHP
         STA   $AB
         STX   $B6
         STY   $B7
         LDX   $42
         STX   $B8
         PLP
         JSR   L6D9D
         JSR   L6D6F
         PHA
         JSR   L6D9D
         PLA
         TAX
         SEC
         SBC   $AB
         BEQ   L6419
         LDA   #$01
         BCC   L6419
         LDX   $AB
         LDA   #$FF
L6419    STA   $AA
         LDY   #$FF
         INX
L641E    INY
         DEX
         BNE   L6429
         LDX   $AA
         BMI   L6435
         CLC
         BRA   L6435
L6429    LDA   [$40],Y
         CMP   [$B6],Y
         BEQ   L641E
         LDX   #$FF
         BCS   L6435
         LDX   #$01
L6435    INX
         TXA
         ROL
         AND   $15
         BEQ   L643E
         LDA   #$01
L643E    TAY
L643F    BRL   L7A91

*-----------------------
* DIM
*-----------------------

L6442    JSR   L6475
         BCC   L649B
         LDA   $8A
         CLC
         ADC   #$03
         STA   $20
         JSR   L671B
         STY   $0B
         JSR   L6332
         JSR   L674D
         LDX   #$0F
         BCC   L6460
         BRL   L3FA4
L6460    LDX   $0F
         LDA   L1CDB,X
         STA   $10
         JSR   L67AA
         JSR   L3CC8
         BEQ   L6474
         JSR   L6346
         BRA   L6442
L6474    RTS

L6475    STZ   $D3
         LDA   #$3F
         STA   $10
L647B    JSR   L3CC8
         LDA   $4E
         STA   $DE
         LDA   $4F
         STA   $DF
         LDA   $50
         STA   $E0
         JSR   L65FB
         STY   $8A
         LDY   L1CD4,X
         TYX
         LDY   L1EC9,X
         STY   $1F
         STX   $0F
         RTS

L649B    BRL   L6356
L649E    JSR   L64A8
         STA   $84
         STY   $85
         STX   $86
L64A7    RTS

L64A8    LDX   #$00
L64AA    STX   $11
         JSR   L6475
         BCS   L64E5
         JSR   L6555
         BCC   L64BC
         LDA   #$40
         STA   $D3
         BRA   L64CB
L64BC    JSR   L658F
         BCS   L64CB
         LDX   $0F
         LDA   L1CDB,X
         STA   $10
         JSR   L668E
L64CB    SEC
         TYA
         ADC   $97
         BCC   L64D6
         INX
         BNE   L64D6
         INC   $99
L64D6    STX   $23
         TXY
         STA   $22
         XBA
         LDA   $D3
         XBA
         LDX   $99
         STX   $24
         SEC
         RTS

L64E5    LDA   $8A
         CLC
         ADC   #$03
         STA   $20
         JSR   L671B
         STY   $0B
         JSR   L6332
         JSR   L674D
         BCS   L652C
         LDA   $11
         BEQ   L6515
         LDA   #L0B48
         LDY   #>L0B48
         STA   $22
         STY   $23
         LDA   #^L0B48
         STA   $24
         LDX   $0B
         REP   #$30
L650D    PLA
         DEX
         BNE   L650D
         SEP   #$30
         BRA   L653B
L6515    LDX   $0B
         REP   #$30
         LDA   #$000B
L651C    PHA
         DEX
         BNE   L651C
         SEP   #$30
         LDX   $0F
         LDA   L1CDB,X
         STA   $10
         JSR   L67AA
L652C    CLC
         LDA   #$00
         JSR   L66D3
         LDA   $0B
         CMP   [$8B]
         BNE   L6548
         JSR   L6892
L653B    LDA   #$80
         STA   $D3
         XBA
         LDA   $22
         LDY   $23
         LDX   $24
         SEC
         RTS

L6548    LDX   #$0C
         BRL   L3FA4
L654D    BIT   $10
         BPL   L6552
         RTS

L6552    BRL   L3F9E
L6555    REP   #$30
         LDA   $51
         LDX   $52
         CPX   $55
         BNE   L6563
         CMP   $54
         BEQ   L6573
L6563    STA   $94
         SEP   #$30
         LDA   $53
         STA   $96
         LDA   $54
         LDX   $55
         LDY   $56
         BRA   L65A1
L6573    STA   $97
         STX   $98
         SEP   #$30
         CLC
         RTS

L657B    REP   #$30
         LDA   $5A
         STA   $94
         SEP   #$30
         LDA   $5C
         STA   $96
         LDA   $5D
         LDX   $5E
         LDY   $5F
         BRA   L65A1
L658F    REP   #$30
         LDA   $57
         STA   $94
         SEP   #$30
         LDA   $59
         STA   $96
         LDA   $5A
         LDX   $5B
         LDY   $5C
L65A1    STY   $99
         BRA   L65B1
L65A5    CLC
         LDA   $20
         ADC   $97
         BCC   L65B3
         INX
         BNE   L65B1
         INC   $99
L65B1    STX   $98
L65B3    STA   $97
         CMP   $94
         BNE   L65C5
         CPX   $95
         BNE   L65C5
         LDY   $99
         CPY   $96
         BNE   L65C5
         CLC
         RTS

L65C5    LDY   #$00
         LDA   [$97]
         STA   $20
L65CB    LDA   [$DE],Y
         INY
         CMP   #$2E
         BEQ   L65DD
         BCC   L65E1
         CMP   #$40
         BEQ   L65E1
         BCC   L65DD
         JSR   L664D
L65DD    CMP   [$97],Y
         BEQ   L65CB
L65E1    LDA   [$97],Y
         BPL   L65A5
         AND   $10
         CMP   $0F
         BNE   L65A5
         CPY   $8A
         BNE   L65A5
         LDA   [$97],Y
         CMP   #$87
         BEQ   L65F7
         AND   #$7F
L65F7    SEC
         STA   $10
         RTS

L65FB    LDY   #$00
         JSR   L3CC8
         JSR   L6638
         BCS   L6608
L6605    BRL   L6356
L6608    INY
         CPY   #$1E
         BCS   L6605
         JSR   L3CBE
         BCC   L6608
         JSR   L4F80
         BCS   L6608
         PHA
         AND   #$0F
         TAX
         PLA
         INY
         JSR   L4F93
         BCS   L662A
         CMP   #$21
         BEQ   L662A
         LDX   #$02
         BRA   L662D
L662A    JSR   L3CBE
L662D    CMP   #$28
         BNE   L6632
         RTS

L6632    CPX   #$01
         BEQ   L6605
         CLC
         RTS

L6638    CMP   #$41
         BCC   L664C
         SBC   #$5B
         SEC
         SBC   #$A5
         BCS   L664C
         CMP   #$61
         BCC   L664C
         SBC   #$7B
         SEC
         SBC   #$85
L664C    RTS

L664D    CMP   #$61
         BCC   L6657
         CMP   #$7B
         BCS   L6657
         AND   #$5F
L6657    RTS

L6658    SEC
         LDA   $8A
         STA   $20
         ADC   $1F
         PHA
         LDX   $65
         REP   #$30
         AND   #$00FF
         ADC   $63
         SEP   #$30
         BCC   L666E
         INX
L666E    JSR   L594C
         REP   #$30
         STA   $63
         SEP   #$30
         STX   $65
         BRA   L669F
L667B    SEC
         LDA   $8A
         STA   $20
         ADC   $1F
         PHA
         STA   $1C
         STZ   $1D
         STZ   $1E
         JSR   L57BD
         BRA   L669F
L668E    SEC
         LDA   $8A
         STA   $20
         ADC   $1F
         PHA
         STA   $1C
         STZ   $1D
         STZ   $1E
         JSR   L57D5
L669F    PLA
         LDY   #$00
         STA   [$97],Y
         TAY
         DEY
         LDX   $1F
         LDA   #$00
L66AA    STA   [$97],Y
         DEY
         DEX
         BNE   L66AA
         LDA   $10
         STA   [$97],Y
         CMP   #$87
         BEQ   L66BC
         AND   #$7F
         STA   $10
L66BC    DEY
         DEY
         BMI   L66CA
         LDA   [$DE],Y
         JSR   L664D
         INY
         STA   [$97],Y
         BRA   L66BC
L66CA    LDX   $98
         LDY   $20
         RTS

L66CF    LDA   $0B
         ASL
L66D2    SEC
L66D3    ADC   $20
         ADC   $97
         LDY   $98
         LDX   $99
         BCC   L66E1
         INY
         BNE   L66E1
         INX
L66E1    STA   $8B
         STY   $8C
         STX   $8D
         RTS

L66E8    JSR   L3CBE
         LDA   $DE
         PHA
         LDA   $DF
         PHA
         LDA   $E0
         PHA
         LDA   $11
         PHA
         JSR   L608F
         PLA
         STA   $11
         PLA
         STA   $E0
         PLA
         STA   $DF
         PLA
         STA   $DE
         BRA   L670D

*-----------------------
* DISPLAY ILLEGAL QUANTITY ERROR
*-----------------------

L6708    LDX   #$05
         BRL   L3FA4

L670D    LDA   $AA
         BMI   L6708
         JSR   LE43C
         LDA   L0AF1
         LDY   L0AF0
         RTS

L671B    LDY   #$00
L671D    JSR   L6730
         INC
         TAX
         PLA
         PHX
         PHA
         SEP   #$30
         INY
         JSR   L3CC8
         CMP   #$2C
         BEQ   L671D
         RTS

L6730    REP   #$30
         PHY
         LDA   $0F
         PHA
         LDA   $1F
         PHA
         SEP   #$30
         JSR   L66E8
         REP   #$30
         PLA
         STA   $1F
         PLA
         STA   $0F
         PLY
         LDA   L0AF0
         RTS

         SEP   #$30
L674D    LDA   $61
         LDX   $60
         LDY   $62
L6753    STA   $98
         STX   $97
         STY   $99
         CPY   $5F
         BNE   L6767
         CMP   $5E
         BNE   L6767
         CPX   $5D
         BNE   L6767
         CLC
         RTS

L6767    LDY   #$02
L6769    DEY
         DEY
         LDA   [$DE],Y
         INY
         INY
         INY
         JSR   L664D
         CMP   [$97],Y
         BEQ   L6769
         LDA   [$97],Y
         BPL   L6786
         AND   $10
         CMP   $0F
         BNE   L6786
         INY
         CPY   $20
         BEQ   L679D
L6786    LDY   #$00
         LDA   [$97],Y
         CLC
         ADC   $97
         TAX
         INY
         LDA   [$97],Y
         ADC   $98
         XBA
         INY
         LDA   [$97],Y
         ADC   $99
         TAY
         XBA
         BRA   L6753
L679D    DEY
         LDA   [$97],Y
         CMP   #$87
         BEQ   L67A6
         AND   #$7F
L67A6    SEC
         STA   $10
         RTS

L67AA    LDA   $0B
         STA   $40
         LDA   $1F
         STA   $C0
         STZ   $C2
         STZ   $C1
         LDA   #$03
         STA   $41
         STZ   $42
         TSC
         STA   $8B
         XBA
         STA   $8C
         STZ   $8D
L67C4    REP   #$30
         LDY   $41
         LDA   [$8B],Y
         INY
         INY
         STY   $41
         SEP   #$30
         TAY
         XBA
         TAX
         JSR   L6939
         DEC   $40
         BNE   L67C4
         LDX   $C2
         LDY   $C1
         LDA   $0B
         ASL
         SEC
         ADC   $20
         ADC   $C0
         STA   $C0
         BCC   L67EE
         INY
         BNE   L67EE
         INX
L67EE    CPX   #$80
         BCC   L67F5
         BRL   L3FA2
L67F5    STY   $C1
         STX   $C2
         STX   $1E
         STY   $1D
         LDA   $C0
         STA   $1C
         JSR   L57C9
         LDA   $0B
         STA   $41
         STZ   $42
         LDA   #$00
         JSR   L66D2
         REP   #$30
         PLX
         LDY   #$0000
L6815    PLA
         STA   [$8B],Y
         INY
         INY
         DEC   $41
         BNE   L6815
         PHX
         SEP   #$30
         LDA   $C0
         STA   [$97]
         LDA   $C1
         LDY   #$01
         STA   [$97],Y
         LDA   $C2
         INY
         STA   [$97],Y
         LDA   $20
         SEC
         SBC   #$02
         STA   $40
L6837    DEY
         DEY
         LDA   [$DE],Y
         INY
         INY
         INY
         JSR   L664D
         STA   [$97],Y
         CPY   $40
         BCC   L6837
         LDA   $10
         INY
         STA   [$97],Y
         CMP   #$87
         BEQ   L6854
         AND   #$7F
         STA   $10
L6854    INY
         LDA   $0B
         STA   [$97],Y
         JSR   L66CF
         LDA   $5D
         SEC
         SBC   $8B
         STA   $C0
         LDA   $5E
         SBC   $8C
         STA   $C1
         LDA   $5F
         SBC   $8D
         STA   $C2
         REP   #$30
         LDX   $C1
         BEQ   L6886
         LDA   #$0000
L6878    LDY   #$0100
L687B    DEY
         DEY
         STA   [$8B],Y
         BNE   L687B
         INC   $8C
         DEX
         BNE   L6878
L6886    SEP   #$30
         LDY   $C0
         BEQ   L6891
L688C    DEY
         STA   [$8B],Y
         BNE   L688C
L6891    RTS

L6892    LDA   $0B
         STA   $41
         LDA   #$00
         JSR   L66D2
         LDY   #$00
         STY   $C0
         STY   $C1
         STY   $C2
L68A3    REP   #$30
         PLA
         PLX
         DEX
         STX   L0AF0
         PHA
         TXA
         CMP   [$8B],Y
         SEP   #$30
         BCC   L68B6
         BRL   L6548
L68B6    INY
         LDA   $C1
         ORA   $C2
         ORA   $C0
         CLC
         BEQ   L68D7
         STY   $40
         LDA   [$8B],Y
         TAX
         DEY
         LDA   [$8B],Y
         TAY
         JSR   L6939
         CLC
         LDA   $C0
         ADC   L0AF0
         TAX
         LDA   $C1
         LDY   $40
L68D7    ADC   L0AF1
         STX   $C0
         STA   $C1
         BCC   L68E2
         INC   $C2
L68E2    INY
         DEC   $41
         BNE   L68A3
         JSR   L66CF
         LDY   $1F
         LDX   #$00
         JSR   L6939
         REP   #$30
         LDA   $C0
         CLC
         ADC   $8B
         STA   $22
         SEP   #$30
         LDA   $C2
         ADC   $8D
         STA   $24
         RTS

L6903    JSR   L6475
         BCS   L6916
         JSR   L6555
         BCS   L6912
         JSR   L658F
         BCC   L6915
L6912    BRL   L64CB
L6915    RTS

L6916    LDA   $8A
         CLC
         ADC   #$03
         STA   $20
L691D    JSR   L671B
         STY   $0B
         JSR   L6332
         JSR   L674D
         BCC   L692D
         BRL   L652C
L692D    LDX   $0B
         REP   #$30
L6931    PLA
         DEX
         BNE   L6931
         SEP   #$30
         CLC
         RTS

L6939    STY   $EF
         STX   $F0
         JSR   L694C
         XBA
         BNE   L6949
         XBA
         CMP   #$80
         BCS   L6949
         RTS

L6949    BRL   L3FA2
L694C    STZ   $C3
         REP   #$20
         STZ   $EB
         STZ   $ED
         LDY   #$10
L6956    ASL   $EB
         ROL   $ED
         ASL   $EF
         BCC   L696B
         CLC
         LDA   $C0
         ADC   $EB
         STA   $EB
         LDA   $C2
         ADC   $ED
         STA   $ED
L696B    DEY
         BNE   L6956
         LDA   $EB
         STA   $C0
         LDA   $ED
         STA   $C2
         SEP   #$30
         RTS

*-----------------------
* UBOUND()
*-----------------------

L6979    JSR   L6475
         BCC   L6984
         JSR   L6306
         JSR   L6332
L6984    JSR   L3CC8
         BNE   L6990
         REP   #$30
         LDA   #$0001
         BRA   L699E
	 
	 MX    %11
	 
L6990    CMP   #$2C
         BNE   L69D9
	 LDA   $8A
	 CLC
	 ADC   #$03
	 STA   $20
	 JSR   L6730
L699E    PHA
         SEP   #$30
         JSR   L6332
         JSR   L674D
         BCC   L69D1
         PLA
         BEQ   L69BE
         PLX
         BNE   L69BE
         STA   $0B
         LDA   #$00
         CLC
         JSR   L66D3
         LDA   [$8B]
         SEC
         SBC   $0B
         BCS   L69C1
L69BE    BRL   L6708
L69C1    STA   $0B
         JSR   L66CF
         REP   #$30
         LDA   [$8B]
         SEP   #$30
         TAY
         XBA
         BRL   L790C
L69D1    LDX   #$38
         BRL   L3FA4
L69D6    BRL   L5EC3
L69D9    BRL   L6356

*-----------------------
* ERASE
*-----------------------

L69DC    BEQ   L69D9
L69DE    JSR   L6475
         BCS   L6A12
         JSR   L658F
         BCC   L69D6
         LDA   [$97]
         REP   #$30
         AND   #$00FF
         CLC
         ADC   $97
         STA   $40
         SEP   #$30
         LDA   $99
         BCC   L69FB
         INC
L69FB    STA   $42
         JSR   L58FF
         JSR   L6AF9
L6A03    JSR   L3CC8
         BNE   L6A09
         RTS

L6A09    CMP   #$2C
         BNE   L69D9
         JSR   L6306
         BRA   L69DE
L6A12    LDA   $8A
         CLC
         ADC   #$03
         STA   $20
         JSR   L6306
         JSR   L6332
         JSR   L674D
         BCC   L69D1
         LDY   #$03
L6A26    INY
         LDA   [$97],Y
         BPL   L6A26
         CMP   #$87
         BNE   L6A45
         JSR   L6ACF
L6A32    LDA   [$A6]
         BEQ   L6A3C
         JSR   L6D61
         JSR   L6D9F
L6A3C    JSR   L6AB9
         BCC   L6A32
         CMP   $94
         BNE   L6A32
L6A45    REP   #$30
         LDA   [$97]
         CLC
         ADC   $97
         STA   $40
         SEP   #$30
         LDY   #$02
         LDA   [$97],Y
         ADC   $99
         STA   $42
         JSR   L5903
         JSR   L6A60
         BRA   L6A03
L6A60    REP   #$30
         LDA   $98
         SEP   #$30
         LDX   $97
L6A68    STX   $97
         REP   #$30
         CMP   $5E
         SEP   #$30
         BNE   L6A77
         CPX   $5D
         BNE   L6A77
         RTS

L6A77    LDY   #$03
L6A79    INY
         LDA   [$97],Y
         BPL   L6A79
         CMP   #$87
         BEQ   L6A96
         LDY   #$01
         LDA   [$97]
         CLC
         ADC   $97
         TAX
         REP   #$30
         LDA   [$97],Y
         ADC   $98
         STA   $98
         SEP   #$30
         BRA   L6A68
L6A96    JSR   L6ACF
L6A99    LDA   [$A6]
         BEQ   L6AAD
         JSR   L6D61
         TAY
         INY
         REP   #$30
         LDA   [$40],Y
         SEC
         SBC   $1C
         STA   [$40],Y
         SEP   #$30
L6AAD    JSR   L6AB9
         BCC   L6A99
         CMP   $94
         BNE   L6A99
         BRL   L6A68
L6AB9    LDA   $A6
         CLC
         ADC   #$03
         STA   $A6
         BCC   L6AC6
         REP   #$30
         INC   $A7
L6AC6    REP   #$30
         LDX   $A7
         CPX   $95
         SEP   #$30
         RTS

L6ACF    INY
         LDA   [$97],Y
         STA   $0B
         STY   $20
         LDY   #$01
         LDA   [$97]
         CLC
         ADC   $97
         STA   $94
         REP   #$30
         LDA   [$97],Y
         ADC   $98
         STA   $95
         SEP   #$30
         JSR   L66CF
         LDA   $8D
         STA   $A8
         REP   #$30
         LDA   $8B
         STA   $A6
         SEP   #$30
         RTS

L6AF9    REP   #$30
         LDA   $94
         CLC
         ADC   $1C
         STA   $94
         SEP   #$30
         LDA   $96
         ADC   $1E
         STA   $96
         LDA   $97
         BRA   L6B1B
L6B0E    LDA   $20
         CLC
         ADC   $97
         BCC   L6B1B
         REP   #$30
         INC   $98
         SEP   #$30
L6B1B    STA   $97
         CMP   $94
         BNE   L6B2C
         REP   #$30
         LDA   $98
         CMP   $95
         SEP   #$30
         BNE   L6B2C
         RTS

L6B2C    LDA   [$97]
         STA   $20
         LDY   #$01
L6B32    INY
         LDA   [$97],Y
         BPL   L6B32
         CMP   #$87
         BNE   L6B0E
         INY
         TYA
         CLC
         LDY   $98
         LDX   $99
         ADC   $97
         BCC   L6B4A
         INY
         BNE   L6B4A
         INX
L6B4A    JSR   L6D67
         TAY
         REP   #$30
         INY
         LDA   [$40],Y
         SEC
         SBC   $1C
         STA   [$40],Y
         SEP   #$30
         BRA   L6B0E
L6B5C    STZ   $14
         STZ   $16
         STZ   $17
         LDA   $6C
         LDX   $6E
         LDY   $6D
         STA   $8B
         STX   $8D
         STY   $8C
         BRL   L6C33
L6B71    LDA   [$94]
         STA   $BE
         STA   $DC
         LDY   #$01
         LDA   [$94],Y
         STA   $DA
         INY
         LDA   [$94],Y
         STA   $DB
         STA   $21
         LDA   $BE
         CMP   #$00
         BNE   L6BB5
         LDA   $16
         LDY   $17
         CLC
         ADC   $21
         BCC   L6B94
         INY
L6B94    CLC
         ADC   #$03
         BCC   L6B9A
         INY
L6B9A    STA   $16
         STY   $17
         LDX   $14
         STZ   $14
         BEQ   L6C22
         LDA   $66
         STA   $97
         LDA   $68
         STA   $99
         LDA   $67
         STA   $98
         JSR   L5812
         BRA   L6C22
L6BB5    LDX   $14
         STA   $14
         BNE   L6BC7
         LDA   $66
         STA   $91
         LDA   $67
         STA   $92
         LDA   $68
         STA   $93
L6BC7    LDA   $BE
         CMP   #$50
         BNE   L6BD2
         JSR   L6C79
         BRA   L6C12
L6BD2    CMP   #$60
         BEQ   L6BF3
         CMP   #$80
         BCS   L6BE3
         CMP   #$40
         BEQ   L6BEB
         LDX   #$42
         BRL   L3FA4
L6BE3    LDY   $61
         LDX   $62
         LDA   $60
         BRA   L6BFF
L6BEB    LDY   $58
         LDX   $59
         LDA   $57
         BRA   L6BF9
L6BF3    LDY   $5B
         LDX   $5C
         LDA   $5A
L6BF9    XBA
         LDA   #$FF
         STA   $DC
         XBA
L6BFF    SEC
         SBC   $DA
         STA   $DA
         TYA
         SBC   $DB
         STA   $DB
         TXA
         SBC   $DC
         STA   $DC
         LDA   [$DA]
         STA   $21
L6C12    LDY   #$01
         SEC
         LDA   [$DA],Y
         SBC   $16
         STA   [$DA],Y
         INY
         LDA   [$DA],Y
         SBC   $17
         STA   [$DA],Y
L6C22    LDA   $94
         LDY   $95
         LDX   $96
         SEC
         SBC   $21
         BCS   L6C33
         LDY   $95
         BNE   L6C32
         DEX
L6C32    DEY
L6C33    STA   $66
         STY   $67
         STX   $68
         CPX   $6B
         BNE   L6C55
         CPY   $6A
         BNE   L6C55
         CMP   $69
         BNE   L6C55
         LDA   $14
         CMP   #$00
         BEQ   L6C6C
         LDA   $69
         STA   $97
         STX   $99
         STY   $98
         BRA   L6C69
L6C55    SEC
         SBC   #$03
         BCS   L6C60
         LDY   $67
         BNE   L6C5F
         DEX
L6C5F    DEY
L6C60    STX   $96
         STY   $95
         STA   $94
         BRL   L6B71
L6C69    JSR   L5812
L6C6C    LDA   $8B
         STA   $69
         LDA   $8C
         STA   $6A
         LDA   $8D
         STA   $6B
         RTS

L6C79    LDA   #$00
         STA   $DC
         LDA   #$34
         LDX   $05
         STA   $DA
         STX   $DB
L6C85    CMP   $32
         BEQ   L6CCD
         LDY   #$00
         LDA   [$DA],Y
         BEQ   L6CC4
         STA   $21
         INY
         LDA   $6C
         SEC
         SBC   [$DA],Y
         STA   $97
         INY
         LDA   $6D
         SBC   [$DA],Y
         STA   $98
         LDA   $6E
         SBC   #$00
         STA   $99
         LDA   $21
         CLC
         ADC   $97
         STA   $97
         LDX   $99
         LDY   $98
         BCC   L6CB7
         INY
         BNE   L6CB7
         INX
L6CB7    CPX   $96
         BNE   L6CC4
         CPY   $95
         BNE   L6CC4
         CMP   $94
         BNE   L6CC4
         RTS

L6CC4    LDA   #$03
         CLC
         ADC   $DA
         STA   $DA
         BRA   L6C85
L6CCD    JSR   L3F4C
         BRL   L5EC3
L6CD3    LDX   #$13
         BRL   L3FA4
L6CD8    LDY   #$00
         LDA   [$A6],Y
         CLC
         ADC   [$B6],Y
         BCC   L6CE6
         JSR   L6D1A
         BRA   L6CD3
L6CE6    JSR   L6DD5
         LDX   $A6
         LDY   $A7
         STX   $BB
         STY   $BC
         LDX   $A8
         STX   $BD
         JSR   L6D3C
         CLC
         ADC   $66
         STA   $66
         BCC   L6D05
         INC   $67
         BNE   L6D05
         INC   $68
L6D05    LDX   $B6
         LDY   $B7
         STX   $BB
         STY   $BC
         LDX   $B8
         STX   $BD
         JSR   L6D3C
         JSR   L6D1A
         BRL   L6EAA
L6D1A    LDA   $B6
         LDY   $B7
         LDX   $B8
         JSR   L7389
         BRL   L72CA
L6D26    PHA
         LDA   $6C
         SEC
         SBC   $40
         STA   $40
         LDA   $6D
         SBC   $41
         STA   $41
         LDA   $6E
         SBC   $42
         STA   $42
         PLA
         RTS

L6D3C    LDY   #$00
         LDA   [$BB],Y
         PHA
         INY
         LDA   [$BB],Y
         STA   $40
         INY
         LDA   [$BB],Y
         STA   $41
         LDA   #$00
         STA   $42
         JSR   L6D26
         PLA
L6D53    TAY
         BEQ   L6D60
         PHA
L6D57    DEY
         LDA   [$40],Y
         STA   [$66],Y
         TYA
         BNE   L6D57
         PLA
L6D60    RTS

L6D61    LDA   $A6
         LDY   $A7
         LDX   $A8
L6D67    STA   $40
         STY   $41
         STX   $42
         BRA   L6D7E
L6D6F    LDA   $A6
         LDX   $A8
         LDY   $A7
L6D75    STA   $40
         STX   $42
         STY   $41
L6D7B    JSR   L6DB5
L6D7E    PHP
         LDY   #$00
         LDA   [$40],Y
         PHA
         INY
         LDA   [$40],Y
         TAX
         INY
         LDA   [$40],Y
         LDY   #$00
         STY   $42
         STA   $41
         STX   $40
         JSR   L6D26
         LDX   $40
         LDY   $41
         PLA
         PLP
         RTS

L6D9D    BNE   L6DB4
L6D9F    CMP   #$00
         BEQ   L6DB4
         TAY
         REP   #$10
         XBA
         LDA   #$00
         STA   [$40],Y
         INY
         STA   [$40],Y
         XBA
         INY
         STA   [$40],Y
         SEP   #$30
L6DB4    RTS

L6DB5    PHA
         LDA   #$34
         CMP   $32
         PLA
         BCC   L6DC0
         LDA   #$FF
         RTS

L6DC0    CPX   #$00
         BNE   L6DD4
         CPY   $05
         BNE   L6DD4
         CMP   $33
         BNE   L6DD4
         STA   $32
         SBC   #$03
         STA   $33
         LDY   #$00
L6DD4    RTS

L6DD5    LDX   $A8
         STX   $89
         LDX   $A6
         LDY   $A7
L6DDD    STX   $87
         STY   $88
L6DE1    JSR   L6E01
         STX   $AC
         LDX   $68
         STX   $AE
         STY   $AD
         STA   $AB
         TAX
         BEQ   L6E00
         LDY   #$02
         STA   [$8B],Y
         DEY
         LDA   #$00
         STA   [$8B],Y
         DEY
         LDA   #$50
         STA   [$8B],Y
         TXA
L6E00    RTS

L6E01    AND   #$FF
         BEQ   L6E5E
         PHA
         BRA   L6E0D
L6E08    LDX   #$0A
         JSR   L6B5C
L6E0D    LDA   $69
         LDY   $6A
         LDX   $6B
         SEC
         SBC   #$03
         BCS   L6E1E
         LDY   $6A
         BNE   L6E1D
         DEX
L6E1D    DEY
L6E1E    STY   $8C
         STX   $8D
         STA   $8B
         SEC
         SBC   $01,S
         BCS   L6E2F
         LDY   $8C
         BNE   L6E2E
         DEX
L6E2E    DEY
L6E2F    CPX   $65
         BCC   L6E08
         BNE   L6E3D
         DEY
         CPY   $64
         BCC   L6E08
         BEQ   L6E08
         INY
L6E3D    STA   $66
         STY   $67
         STX   $68
         PHA
         CLC
         SBC   $6C
         TYA
         SBC   $6D
         TXA
         SBC   $6E
         CLC
         ADC   #$01
         PLA
         BCC   L6E08
         STX   $6B
         STA   $69
         STY   $6A
         LDX   $66
         LDY   $67
         PLA
L6E5E    RTS

L6E5F    PHA
         LDA   #$22
         STA   $0C
         STA   $0D
         PLA
L6E67    STA   $BB
         STY   $BC
         STX   $BD
         LDY   #$FF
L6E6F    INY
         LDA   [$BB],Y
         BEQ   L6E80
         CMP   $0C
         BEQ   L6E7C
         CMP   $0D
         BNE   L6E6F
L6E7C    CMP   #$22
         BEQ   L6E81
L6E80    CLC
L6E81    STY   $AB
         TYA
         ADC   $BB
         STA   $C0
         LDX   $BD
         STX   $C2
         LDX   $BC
         BCC   L6E95
         INX
         BNE   L6E95
         INC   $C2
L6E95    STX   $C1
L6E97    TYA
         JSR   L6DD5
         LDX   $BB
         LDY   $BC
         STX   $40
         STY   $41
         LDX   $BD
         STX   $42
         JSR   L6D53
L6EAA    LDX   $32
         CPX   #$44
         BNE   L6EB5
         LDX   #$57
         BRL   L3FA4
L6EB5    LDA   $AB
         STA   $00,X
         BEQ   L6ED1
         SEC
         LDA   $6C
         SBC   $AC
         STA   $01,X
         LDA   $6D
         SBC   $AD
         STA   $02,X
         LDA   $6E
         SBC   $AE
         BEQ   L6ED5
         JSR   L3F4C
L6ED1    STZ   $01,X
         STZ   $02,X
L6ED5    STX   $A6
         LDY   $05
         STY   $A7
         LDY   #$00
         STY   $A8
         LDY   #$01
         STY   $A9
         STX   $33
         INX
         INX
         INX
         STX   $32
         JMP   LE234      ;BRL LE234
L6EED    LDA   $87
         LDY   $88
         LDX   $89
         STA   $BB
         STY   $BC
         STX   $BD
         JSR   L6D3C
         BRA   L6EAA
L6EFE    LDA   $56
         STA   $99
         REP   #$30
         LDA   $54
         STA   $97
         SEP   #$30
         BRA   L6F19
L6F0C    LDA   $20
         CLC
         ADC   $97
         BCC   L6F19
         REP   #$30
         INC   $98
         SEP   #$30
L6F19    STA   $97
         CMP   $51
         BNE   L6F2A
         REP   #$30
         LDA   $98
         CMP   $52
         SEP   #$30
         BNE   L6F2A
         RTS

L6F2A    LDA   [$97]
         STA   $20
         LDY   #$01
L6F30    INY
         LDA   [$97],Y
         BPL   L6F30
         CMP   #$87
         BNE   L6F0C
         INY
         TYA
         CLC
         LDY   $98
         LDX   $99
         ADC   $97
         BCC   L6F48
         INY
         BNE   L6F48
         INX
L6F48    JSR   L6D67
         JSR   L6D9F
L6F4E    BRA   L6F0C

*-----------------------
* STR$()
*-----------------------

L6F50    JSR   LE658
         BRL   L6E5F
L6F56    LDY   #$09
         LDA   #$0B
         BRA   L6F60
L6F5C    LDA   #$08
         LDY   #$00
L6F60    PHY
         PHA
         REP   #$30
         PEA   ^L0231
         PEA   L0231
         _ReadAsciiTime
         SEP   #$30
         PLA
         PLY
         STA   $0B
         LDX   #$00
L6F79    LDA   L0231,Y
         AND   #$7F
         STA   L0231,X
         INX
         INY
         CPX   $0B
         BCC   L6F79
         LDA   $0B
         BRL   L70F2

*-----------------------
* E2 - LOGO
*-----------------------

L6F8C    JSR   L6FC8
         LDX   #$03
L6F91    LDA   $BF,X
         STA   L0B56,X
         DEX
         BNE   L6F91
         BRA   L6FB1

*-----------------------
* E3 - LOGO
*-----------------------

L6F9B    JSR   L6FC8
         DEC   $C1
         DEC   $C2
         LDA   $C0
         STA   L0B56
         LDA   $C1
         STA   L0B54
         LDA   $C2
         STA   L0B55
L6FB1    LDX   #$00
L6FB3    LDA   L0B54,X
         PHA
         INX
         CPX   #$06
         BCC   L6FB3
         REP   #$30
         _WriteTimeHex
         SEP   #$30
         RTS

L6FC8    JSR   L73D3
         STX   $C0
         JSR   L6346
         JSR   L73D3
         STX   $C1
         JSR   L6346
         JSR   L73D3
         STX   $C2
L6FDD    REP   #$30
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         _ReadTimeHex
         SEP   #$30
         LDX   #$08
L6FF1    PLA
         STA   L0B51,X
         DEX
         BNE   L6FF1
         RTS

*-----------------------
* DATE()
*-----------------------

L6FF9    JSR   L73D6
         CPX   #$01
         BCC   L700A
         BEQ   L7012
         CPX   #$04
         BCC   L702A
         BEQ   L7025
         BRA   L7036
L700A    JSR   L6FDD
         LDY   L0B56
         BRA   L702E
L7012    LDA   L0B56
         REP   #$30
         AND   #$00FF
         CLC
         ADC   #$076C
         SEP   #$30
         TAY
         XBA
         BRL   L790C
L7025    LDY   L0B52
         BRA   L702E
L702A    LDY   L0B52,X
         INY
L702E    BRL   L7A91

*-----------------------
* TIME()
*-----------------------

L7031    JSR   L73D6
         CPX   #$04
L7036    BCS   L7094
         CPX   #$01
         BCS   L7041
         JSR   L6FDD
         LDX   #$01
L7041    LDY   L0B56,X
         BRL   L7A91

*-----------------------
* ERRTXT$()
*-----------------------

L7047    JSR   L73D6
         CPX   #$5A
         BCS   L7094
         JSR   L409C
         TYA
         LDX   $42
         LDY   $41
         CLC
         ADC   $40
         STA   $BB
         BCC   L7061
         INY
         BNE   L7061
         INX
L7061    STX   $BD
         STY   $BC
         LDY   #$FF
L7067    INY
         LDA   [$BB],Y
         BPL   L7067
         PHY
         INY
         JSR   L6E97
         PLY
         LDA   [$66],Y
         AND   #$7F
         STA   [$66],Y
         RTS

*-----------------------
* SPACE$()
*-----------------------

L7079    JSR   L73D6
         LDA   #$20
L707E    PHA
         TXA
         JSR   L6DE1
         TAY
         PLA
         TYX
         BEQ   L7091
L7088    DEY
         BEQ   L708F
         STA   [$AC],Y
         BRA   L7088
L708F    STA   [$AC]
L7091    BRL   L6EAA
L7094    BRA   L70CC

*-----------------------
* REP$()
*-----------------------

L7096    JSR   L7361
         PHA
         LDA   [$87]
         BNE   L70A3
         LDA   #$3F
         PLX
         BRA   L707E
L70A3    LDA   $87
         LDY   $88
         LDX   $89
         JSR   L6D67
         LDA   [$40]
         PHA
         JSR   L7383
         PLA
         PLX
         BRA   L707E

*-----------------------
* PFX$()
*-----------------------

L70B6    JSR   L73D6
         TXA
         CMP   #$08
         BCC   L70E0
         BNE   L70CC
         JSL   GSOS
         DW    $0028      ; GetBootVol
         ADRL  L178F
         BCC   L70EF
L70CC    BRL   L6708
         JSR   L73D3
         CPX   #$08
         BCS   L70CC
         STX   L1799
         JSR   L6332
         BRA   L7105
L70DE    LDA   #$00
L70E0    STA   L178D
         JSL   GSOS
         DW    $000A      ; GetPrefix
         ADRL  L178D
         BCS   L711B
L70EF    LDA   L0230
L70F2    TAY
         LDA   #L0231
         STA   $BB
         LDA   #>L0231
         STA   $BC
         LDA   #^L0231
         STA   $BD
L70FF    BRL   L6E97

*-----------------------
* E4 - LOGO
*-----------------------

L7102    STZ   L1799
L7105    JSR   L633A
         JSR   LB755
         JSR   L3623
         JSL   GSOS
         DW    $0009      ; SetPrefix
         ADRL  L1799
         BCS   L711B
         RTS

L711B    BRL   L3F75
L711E    LDY   L0087
         BEQ   L7125
         DEY
         DEY
L7125    LDA   #^L008A
         STA   $BD
         REP   #$30
         LDA   #L008A
         STA   $BB
         SEP   #$30
         BRL   L6E97

*-----------------------
* E5 - LOGO
*-----------------------

L7135    JSR   L633A
         BRL   LB749

*-----------------------
* INSTR()
*-----------------------

L713B    PLA
         STA   $BE
         JSR   L6332
         PLA
         STA   $40
         STA   $A6
         PLA
         STA   $41
         STA   $A7
         PLA
         STA   $42
         STA   $A8
         PLA
         STA   $B6
         PLA
         STA   $B7
         PLA
         STA   $B8
         JSR   L6D7E
         STA   $13
         LDY   #$00
         LDA   [$B6],Y
         CMP   $13
         BCC   L71AF
         SEC
         SBC   $13
         STA   $0E
         DEC   $BE
         INY
         REP   #$30
         LDA   [$B6],Y
         STA   $44
         SEP   #$30
         STZ   $46
         JSR   L72D0
         LDA   $BE
         CLC
         ADC   $44
         STA   $44
         BCC   L718A
         INC   $45
         BNE   L718A
         INC   $46
L718A    LDA   $0E
         CMP   $BE
         BCC   L71AF
         LDY   #$00
L7192    LDA   [$44],Y
         CMP   [$40],Y
         BNE   L71A1
         INY
         CPY   $13
         BCC   L7192
         LDY   $BE
         BRA   L71B1
L71A1    INC   $BE
         INC   $44
         BNE   L718A
         REP   #$30
         INC   $45
         SEP   #$30
         BRA   L718A
L71AF    LDY   #$FF
L71B1    INY
         TYA
         PHA
         JSR   L72CA
         LDX   $B8
         LDA   $B6
         LDY   $B7
         JSR   L7389
         PLA
         TAY
         BRL   L7A91

*-----------------------
* UCASE$()
*-----------------------

L71C5    LDA   $A9
         CMP   #$01
         BEQ   L71D5
         LDA   [$A6]
         BEQ   L71E6
         JSR   L6DD5
         JSR   L6EED
L71D5    JSR   L6D61
         TAY
L71D9    TYA
         BEQ   L71E6
         DEY
         LDA   [$40],Y
         JSR   L664D
         STA   [$40],Y
         BRA   L71D9
L71E6    RTS

*-----------------------
* SUB$(
*-----------------------

L71E7    JSR   L64A8
         JSR   L654D
         LDX   #$22
         JSR   L603B
         LDA   $22
         PHA
         LDA   $23
         PHA
         LDA   $24
         PHA
         LDA   $D3
         PHA
         JSR   L6346
         JSR   L73D3
         PHX
         JSR   L3CC8
         CMP   #$2C
         BNE   L7214
         JSR   L3CBE
         JSR   L73D3
         BRA   L7216
L7214    LDX   #$FF
L7216    PHX
         JSR   L6332
         JSR   L633A
         JSR   L60A7
         PLA
         STA   $1C
         PLA
         STA   $13
         BEQ   L725A
         DEC   $13
         LDA   [$A6]
         CMP   $1C
         BCS   L7232
         STA   $1C
L7232    PLA
         STA   $D3
         PLA
         STA   $86
         PLA
         STA   $85
         PLA
         STA   $84
         LDX   #$84
         JSR   L603B
         LDA   [$84]
         STA   $1D
         LDY   #$01
         REP   #$30
         LDA   [$84],Y
         STA   $44
         SEP   #$30
         STZ   $46
         LDA   $13
         CLC
         ADC   $1C
         BCC   L725D
L725A    BRL   L6708
L725D    CMP   $1D
         BCC   L72A8
         BEQ   L72A8
         LDX   $86
         STX   $89
         LDX   $84
         LDY   $85
         JSR   L6DDD
         TAY
         DEY
         LDA   #$20
L7272    STA   [$66],Y
         DEY
         BNE   L7272
         STA   [$66],Y
         LDA   $1C
         PHA
         LDA   $13
         PHA
         LDA   $A6
         PHA
         LDA   $A7
         PHA
         LDA   $A8
         PHA
         JSR   L6EED
         PLA
         STA   $A8
         PLA
         STA   $A7
         PLA
         STA   $A6
         PLA
         STA   $13
         PLA
         STA   $1C
         LDA   $AD
         STA   $45
         LDA   $AC
         STA   $44
         LDA   $AE
         STA   $46
         BRA   L72AB
L72A8    JSR   L72D0
L72AB    LDA   $13
         CLC
         ADC   $44
         STA   $44
         BCC   L72BA
         INC   $45
         BNE   L72BA
         INC   $46
L72BA    JSR   L6D61
         LDY   #$00
         BEQ   L72C6
L72C1    LDA   [$40],Y
         STA   [$44],Y
         INY
L72C6    CPY   $1C
L72C8    BCC   L72C1
L72CA    JSR   L6D6F
         BRL   L6D9D
L72D0    SEC
         LDA   $6C
         SBC   $44
         STA   $44
         LDA   $6D
         SBC   $45
         STA   $45
         LDA   $6E
         SBC   $46
         STA   $46
         RTS

*-----------------------
* CHR$()
*-----------------------

L72E4    JSR   L73D6
         TXA
L72E8    PHA
         LDA   #$01
         JSR   L6DE1
         PLA
         LDY   #$00
         STA   [$AC],Y
         BRL   L6EAA

*-----------------------
* LEFT$()
*-----------------------

L72F6    JSR   L7361
         CMP   [$87],Y
         TYA
L72FC    BCC   L7302
         LDA   [$87],Y
         TAX
         TYA
L7302    PHA
L7303    TXA
L7304    PHA
         JSR   L6DE1
         LDA   $87
         LDX   $89
         LDY   $88
         JSR   L6D67
         PLA
         TAY
         PLA
         CLC
         ADC   $40
         STA   $40
         BCC   L7321
         INC   $41
         BNE   L7321
         INC   $42
L7321    TYA
         JSR   L6D53
         JSR   L7383
         BRL   L6EAA

*-----------------------
* RIGHT$()
*-----------------------

L732B    JSR   L7361
         CLC
         SBC   [$87],Y
         EOR   #$FF
         BRL   L72FC

*-----------------------
* MID$()
*-----------------------

L7336    LDA   #$FF
         STA   L0AF0
         JSR   L3CC8
         CMP   #$29
         BEQ   L7348
         JSR   L6346
         JSR   L73D3
L7348    JSR   L7361
         DEX
         TXA
         PHA
         CLC
         LDX   #$00
         SBC   [$87],Y
         BCS   L7303
         EOR   #$FF
         CMP   L0AF0
         BCC   L7304
         LDA   L0AF0
         BRA   L7304
L7361    JSR   L6332
         JSR   LE234
         PLY
         PLA
         XBA
         PLX
         PLA
         STA   $87
         PLA
         STA   $88
         PLA
         STA   $89
         XBA
         PHA
         PHY
         LDY   #$00
         TXA
         BEQ   L73C8
         RTS

*-----------------------
* LEN()
*-----------------------

L737D    JSR   L738F
         JSR   L7A91
L7383    LDA   $87
         LDX   $89
         LDY   $88
L7389    JSR   L6D75
         BRL   L6D9D
L738F    LDA   $A6
         STA   $40
         STA   $87
         LDA   $A7
         STA   $41
         STA   $88
         LDA   $A8
         STA   $42
         STA   $89
         JSR   L6D7E
         TAY
         JSR   LE24C
         JSR   LE28B
         TYA
         RTS

*-----------------------
* ASC()
*-----------------------

L73AD    JSR   L738F
         BNE   L73BD
         LDA   #$01
         STA   $A4
         JSR   LE298
         JSR   LDF83
         RTS

L73BD    LDY   #$00
         LDA   [$40],Y
         TAY
         JSR   L7A91
         BRL   L7383
L73C8    BRL   L6708

L73CB    JSR   L6346	; check for comma
         BRA   L73D3
L73D0    JSR   L3CBE
L73D3    JSR   L608F
L73D6    JSR   L670D
         LDX   L0AF1
         BNE   L73C8
         LDX   L0AF0
L73E1    BRL   L3CC8

*-----------------------
* VAL()
*-----------------------

L73E4    JSR   L737D
         BEQ   L7413
         LDX   $4E
         LDY   $4F
         STX   $C0
         STY   $C1
         LDX   $50
         STX   $C2
         LDX   $40
         STX   $4E
         LDX   $42
         STX   $50
         LDY   $41
         STY   $4F
         JSR   L3CC8
         JSR   LE558
L7407    LDX   $C0
         LDY   $C1
         STX   $4E
         STY   $4F
         LDX   $C2
         STX   $50
L7413    RTS

L7414    JSR   L6089
         LDA   L0AF0
         ROL
         LDA   #$00
         ADC   L0AF1
         BEQ   L7424
         BRA   L7443
L7424    LDX   L0AF0
         BRL   L3CC8
         JSR   L3CBE
L742D    JSR   L608F
         JSR   LE440
         REP   #$30
         LDA   L0AF2
         SEP   #$30
         BNE   L7443
         LDA   L0AF0
         LDY   L0AF1
         RTS

L7443    BRL   L6708

*-----------------------
* GRAF
*-----------------------

L7446    BEQ   L7465	; exit if direct
         JSR   L6306
         CMP   #$8F	; OFF
         BEQ   L7466
         CMP   #$90	; ON
         BEQ   L745A
         CMP   #$98	; INIT
         BNE   L7465
         BRL   L2F00

L745A    REP   #$30
         _GrafOn
         SEP   #$30
L7465    RTS

L7466    REP   #$30
         _GrafOff
         SEP   #$30
         RTS

*-----------------------
* E8 - LOGO
*-----------------------

L7472    JSR   L74CE
         CPX   #$02
         STX   L0B20
         RTS

L747B    LDY   L0B20
         BRL   L7A91
L7481    LDA   #$06
         XBA
         LDA   #L0B3A
         LDY   #>L0B3A
         LDX   #^L0B3A
         BRL   LDE84
L748D    LDA   $CE
         LDY   $CD
L7491    BRL   L790C

*-----------------------
* RANDOMIZE
*-----------------------

L7494    JSR   L60AB
         JSR   LE440
         REP   #$30
         PEA   ^L0AF0
         PEA   L0AF0
         PEA   ^L0B30
         PEA   L0B30
         LDA   #$0300
         ORA   #$000E
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         RTS

*-----------------------
* E9 - LOGO
*-----------------------

L74B9    JSR   L74CE
         STX   L0B1E
         RTS

*-----------------------
* E6 - LOGO
*-----------------------

L74C0    JSR   L74CE
         STX   L0B1A
         RTS

*-----------------------
* E7 - LOGO
*-----------------------

L74C7    JSR   L74CE
         STX   L0B1C
         RTS

L74CE    JSR   L633A
L74D1    BRL   L73D3

*-----------------------
* E0 - LOGO
*-----------------------

L74D4    JSR   L74DD
         STA   $2F
         RTS

L74DA    BRL   L6708
L74DD    LDAL  $0005FB
         STA   $2C
         JSR   L74CE
         TXA
         BEQ   L74EA
         DEC
L74EA    STA   $2B
         JSR   LAC26
         LDA   $2B
         INC
         RTS

*-----------------------
* DF E1 - VPOS
*-----------------------

L74F3    LDAL  $00057B
         STA   $2B
         JSR   L74CE
         TXA
         BEQ   L7500
         DEC
L7500    STA   $2C
L7502    BRL   LAC26

*-----------------------
* NORMAL
*-----------------------

L7505    LDA   #$0E
L7507    BRL   LA9C4

*-----------------------
* INVERSE
*-----------------------

L750A    LDA   #$0F
L750C    BRL   LA9C4

*-----------------------
* TRACE
*-----------------------

L750F    BEQ   L751E
         LDA   #$81
         JSR   L80C3
         JSR   LB71C
         BNE   L7520
         BRL   LB6AC
L751E    LDX   #$FF
L7520    INX
L7521    BRA   L7527

*-----------------------
* NOTRACE
*-----------------------

L7523    BNE   L7529
         LDX   #$80
L7527    STX   $C4
L7529    RTS

*-----------------------
* TEXT
*-----------------------

L752A    BNE   L7544
         JSR   L7466
L752F    STZ   $2B
         STZ   $2D
         LDA   #$50	; 80 columns
         STA   $2C
         LDA   #$18	; 24 lines
         STA   $2E
         JSR   LABE4
         JSR   LA2D1
         JSR   L933A
L7544    RTS

*-----------------------
* HOME
*-----------------------

L7545    BNE   L7544
L7547    LDA   #$0C
         BRL   LA9C4

*-----------------------
* ASSIGN
*-----------------------

L754C    JSR   LB755
         JSR   L6346
         JSR   L60AB
         JSR   LE440
         BIT   $AA
         BMI   L75CD
         JSR   L34E7
         BCC   L7567
         LDX   #$26
L7563    TXA
         BRL   L3FA4
L7567    LDY   #$00
         LDX   #$2B
L756B    LDA   L17D5,Y
         BMI   L7563
         BEQ   L7579
         TYA
         CLC
         ADC   #$10
         TAY
         BRA   L756B
L7579    TYA
         LSR
         LSR
         LSR
         STA   $0B
         LDX   #$00
L7581    LDA   L0007,X
         JSR   L664D
         STA   L17D5,Y
         INY
         INX
         CPX   L0007
         BCC   L7581
         BEQ   L7581
         LDA   #$02
         STA   $BE
         JSR   L3CC8
         BEQ   L75A6
         JSR   L6346
         LDA   #$94
         JSR   L80C3
         INC   $BE
L75A6    LDA   L0AF2
         ORA   L0AF1
         BNE   L75CA
         LDA   L0AF0
         BNE   L75B7
         LDA   #$08
         STA   $BE
L75B7    CMP   #$08
         BCC   L75BE
         BRL   L6708
L75BE    LDX   $0B
         STA   L1897,X
         LDA   $BE
         STA   L1898,X
         BRA   L75DA
L75CA    BRL   LD58D
L75CD    JSR   L34E7
         BCC   L75DA
         LDX   $0D
         STZ   L17D5,X
         STZ   L17D5+1,X
L75DA    RTS

*-----------------------
* FILE()
*-----------------------

L75DB    STZ   $77
         STZ   $78
         STZ   $84
         JSR   LB7AE
         JSR   L3CC8
         CMP   #$29
         BEQ   L7601
         JSR   L6346
         LDX   #$01
         LDA   #$92
         JSR   L80A8
         BEQ   L7627
         JSR   L6306
         JSR   LB5E4
         STX   $78
         DEC   $77
L7601    JSR   L6332
         JSR   LB219
         BCC   L7613
         CMP   #$46
         BNE   L7610
L760D    BRL   LDD9D
L7610    BRL   L3F75
L7613    BIT   $77
         BPL   L761E
         LDA   $78
         CMP   L18F8+2
         BNE   L760D
L761E    LDA   L18F8+2
         STA   L07F0
         BRL   LDDA6
L7627    BRL   L6356

*-----------------------
* EXEVENT@()
*-----------------------

L762A    JSR   L73D3
         JSR   L6332
         CPX   #$80
         BCC   L7637
L7634    BRL   L6708
L7637    CPX   #$20
         BCC   L7634
         TXA
         SBC   #$20
         ASL
         JSR   LE28F
         REP   #$30
         ASL
         ASL
         AND   #$03FF
         CLC
         ADC   #L1EF1
         STA   L0AF0
         SEP   #$30
         LDX   #^L1EF1
         STX   L0AF2
         BRL   L78F3

*-----------------------
* TEN()
*-----------------------

L765A    JSR   L738F
         LDX   #$08
         LDA   #$30
L7661    STA   L0B23,X
         DEX
         BNE   L7661
         LDX   #$08
L7669    TYA
         BEQ   L768D
         DEY
         LDA   [$40],Y
         CMP   #$24
         BEQ   L768D
         CMP   #$20
         BEQ   L768D
         JSR   L4F89
         BCS   L7687
         JSR   L664D
         CMP   #$41
         BCC   L768D
         CMP   #$47
         BCS   L768D
L7687    STA   L0B23,X
         DEX
         BNE   L7669
L768D    LDY   #$08
         LDX   #$00
L7691    LDA   L0B23,Y
         JSR   L76B8
         ORA   L0AF0,X
         STA   L0AF0,X
         DEY
         LDA   L0B23,Y
         JSR   L76B8
         ASL
         ASL
         ASL
         ASL
         ORA   L0AF0,X
         STA   L0AF0,X
         INX
         DEY
         BNE   L7691
         JSR   L7383
         BRL   L78F3
L76B8    CMP   #$5B
         BCC   L76BE
         AND   #$5F
L76BE    SEC
         SBC   #$30
         BCC   L7704
         CMP   #$0A
         BCC   L76D1
         SBC   #$07
         CMP   #$10
         BCS   L7704
         CMP   #$0A
         BCC   L7704
L76D1    RTS

*-----------------------
* HEX$()
*-----------------------

L76D2    JSR   LE440
         LDA   #$08
         JSR   L6DE1
         LDY   #$07
         LDX   #$00
L76DE    LDA   L0AF0,X
         PHA
         AND   #$0F
         JSR   L76FB
         STA   [$AC],Y
         DEY
         PLA
         LSR
         LSR
         LSR
         LSR
         JSR   L76FB
         STA   [$AC],Y
         INX
         DEY
         BPL   L76DE
         BRL   L6EAA
L76FB    ORA   #$30
         CMP   #$3A
         BCC   L7703
         ADC   #$06
L7703    RTS

L7704    LDX   #$05
         BRL   L3FA4

*-----------------------
* SWAP
*-----------------------

L7709    JSR   L64A8
         PHA
         PHY
         LDA   $24
         PHA
         LDA   $D3
         PHA
         LDX   $10
         PHX
         JSR   L6346
         JSR   L64A8
         PLA
         CMP   $10
         BEQ   L7725
         BRL   L3F9E
L7725    PLA
         STA   $BE
         PLA
         STA   $42
         PLA
         STA   $41
         PLA
         STA   $40
         LDY   $1F
         DEY
         JSR   L778F
         LDY   #$00
         LDA   [$40],Y
         BNE   L7752
         LDA   [$22],Y
         BEQ   L778E
         LDA   $22
         PHA
         LDA   $23
         PHA
         LDA   $24
         PHA
         LDA   $D3
         PHA
         JSR   L779D
         BRA   L7762
L7752    LDA   [$22],Y
         BNE   L7780
         LDA   $40
         PHA
         LDA   $41
         PHA
         LDA   $42
         PHA
         LDA   $BE
         PHA
L7762    JSR   L77B3
         LDA   $40
         STA   $8B
         LDA   $41
         STA   $8C
         LDA   $42
         STA   $8D
         PLA
         STA   $D3
         PLA
         STA   $86
         PLA
         STA   $85
         PLA
         STA   $84
         BRL   L5E9A
L7780    JSR   L77B3
         JSR   L779D
         JSR   L77B3
         LDY   #$02
         JSR   L778F
L778E    RTS

L778F    LDA   [$40],Y
         TAX
         LDA   [$22],Y
         STA   [$40],Y
         TXA
         STA   [$22],Y
         DEY
         BPL   L778F
         RTS

L779D    LDX   #$01
L779F    LDA   $40,X
         LDY   $22,X
         STY   $40,X
         STA   $22,X
         DEX
         BPL   L779F
         LDA   $42
         LDY   $24
         STY   $42
         STA   $24
         RTS

L77B3    JSR   L6D7E
         CLC
         ADC   $40
         STA   $40
         BCC   L77C3
         INC   $41
         BNE   L77C3
         INC   $42
L77C3    RTS

L77C4    JSR   L6B5C
L77C7    JSR   LE28F
         SEC
         LDA   $69
         SBC   $63
         STA   L0AF0
         LDA   $6A
         SBC   $64
         STA   L0AF1
         LDA   $6B
         SBC   $65
         STA   L0AF2
         BRL   L78F3

*-----------------------
* FREMEN()
*-----------------------

L77E3    JSR   L73D6
         TXA
         JSR   LE28F
         CMP   #$01
         BCC   L77C7
         BEQ   L780E
         CMP   #$03
         BCC   L781B
         BEQ   L7832
         CMP   #$05
         BCC   L7842
         BEQ   L7856
         CMP   #$07
         BCC   L7862
         BEQ   L786C
         CMP   #$09
         BCC   L787D
         BEQ   L780B
         BRL   L6708
L780B    BRL   L788E
L780E    JSR   L6B5C
         LDX   L1040
         REP   #$30
         LDA   L1041
         BRA   L7827
L781B    SEC
         LDA   $5D
         SBC   $60
         TAX
         REP   #$30
         LDA   $5E
         SBC   $61
L7827    STA   L0AF1
         SEP   #$30
         STX   L0AF0
L782F    BRL   L78F3
L7832    SEC
         LDA   $57
         SBC   $5A
         TAX
         REP   #$30
         LDA   $58
         SBC   $5B
         BRA   L7827
         SEP   #$30
L7842    SEC
         LDA   L107C
         SBC   L1068
         TAX
         REP   #$30
         LDA   L107D
         SBC   L1069
         BRA   L7827
         SEP   #$30
L7856    LDX   L1048
         REP   #$30
         LDA   L1049
         BRA   L7827
         SEP   #$30
L7862    LDX   L1044
         REP   #$30
         LDA   L1045
         BRA   L7827
L786C    REP   #$30
         PEA   $0000
         PEA   $0000
         _FreeMem
         BRA   L789D
L787D    REP   #$30
         PEA   $0000
         PEA   $0000
         _MaxBlock
         BRA   L789D
L788E    REP   #$30
         PEA   $0000
         PEA   $0000
         _TotalMem
L789D    PLA
         STA   L0AF0
         PLA
         STA   L0AF2
         SEP   #$30
         BRA   L782F

*-----------------------
* R.STACK&()
*-----------------------

L78A9    JSR   L73D6
         CPX   #$0E
         BCS   L78F9
         TXA
         JSR   LE28F
         ASL
         TAY
         LDX   #$00
         REP   #$30
L78BA    LDA   L10A3,Y
         STA   L0AF0,X
         INY
         INY
         INX
         INX
         CPX   #$0008
         BCC   L78BA
         SEP   #$30
         JSR   LE238
         JMP   LE460      ;BRL LE460

*-----------------------
* R.STACK@()
*-----------------------

L78D1    JSR   L73D6
         CPX   #$10
         BCS   L78F9
         TXA
         JSR   LE28F
         ASL
         TAY
         LDX   #$00
         REP   #$30
L78E2    LDA   L10A3,Y
         STA   L0AF0,X
         INY
         INY
         INX
         INX
         CPX   #$0004
         BCC   L78E2
         SEP   #$30
L78F3    JSR   LE248
         JMP   LE460      ;BRL LE460
L78F9    BRL   L6708

*-----------------------
* R.STACK%()
*-----------------------

L78FC    JSR   L73D6
         CPX   #$10
         BCS   L78F9
         TXA
         ASL
         TAX
         LDY   L10A3,X
L7909    LDA   L10A4,X
L790C    PHX
         JSR   LE28F
         STA   L0AF1
         STY   L0AF0
         JSR   LE24C
         JSR   LE460
         PLX
         RTS

*-----------------------
* BASIC@(
*-----------------------

L791E    JSR   L73D6	; BASIC@
         TXY
         JSR   LE28F
         REP   #$30
         TYA
         TYX
         ASL
         TAY
	 cpy   #L0BF4-L0B94	; BD 201901 - over max variable
	 bcs   errL791E
         LDA   L0B94,Y
         STA   L0AF0
         SEP   #$30
         LDA   L0BF8,X
         STA   L0AF2
         STZ   L0AF3
         BRL   L78F3

errL791E sep   #$30	; switch back to 8-bit native because of a
	 brl   L6708	; non existing basic variable, output an error
	 
L793F    JSR   LE28F
         REP   #$30
         LDA   L1707
         STA   L0AF0
         LDA   L1709
         STA   L0AF2
         SEP   #$30
         BRA   L78F3

*-----------------------
* VAR()
*-----------------------

L7954    JSR   L647B
         PHP
         LDA   $E0
         STA   $50
         REP   #$30
         LDA   $DE
         STA   $4E
         SEP   #$30
         PLP
         BCS   L7974
         JSR   L7AE7
         REP   #$30
         LDA   #$00FF
         PHA
         SEP   #$30
         BRA   L7977
L7974    JSR   L5EC8
L7977    JSR   L6346
         JSR   L73D3
         JSR   L3CC8
         CMP   #$29	; ) TO END COMMAND
         BEQ   L799A
         PHX
         JSR   L73CB
         TXA
         BEQ   L7997
         PLX
         PHA
         JSR   L6332
         PLA
         CPX   #$07
         BEQ   L79BB
         BCC   L79B1
L7997    BRL   L6708
L799A    JSR   L6306
         CPX   #$07
         BCC   L79B1
         BNE   L7997
         LDA   [$84]
         INC   $84
         BNE   L79B1
         REP   #$30
         INC   $85
         SEP   #$30
         BRA   L79BB
L79B1    LDA   #$0A
         DEX
         BMI   L7997
         BEQ   L79BB
         LDA   L1D32,X
L79BB    TAY
         REP   #$30
         PLA
         STA   $DE
         CPY   $DE
         SEP   #$30
         BCC   L79CC
         BEQ   L79CC
         BRL   LB67F
L79CC    CPX   #$07
         BEQ   L79F0
         TXA
         BNE   L79D5
         LDX   #$06
L79D5    STX   $A4
         JSR   LE28F
         REP   #$10
L79DC    DEY
         BMI   L79E6
         LDA   [$84],Y
         STA   L0AF0,Y
         BRA   L79DC
L79E6    SEP   #$30
         LDX   $A4
         JSR   LE24E
         JMP   LE460      ;BRL LE460
L79F0    LDA   $84
         STA   $BB
         REP   #$30
         LDA   $85
         STA   $BC
         SEP   #$30
         BRL   L6E97

*-----------------------
* VAR$()
*-----------------------

L79FF    JSR   L7AE7
         JSR   L3CC8
         CMP   #$29
         BNE   L7A1B
         JSR   L6306
         LDA   [$84]
         TAY
         INC   $84
         BNE   L79F0
         REP   #$30
         INC   $85
         SEP   #$30
         BRA   L79F0
L7A1B    JSR   L73CB
         STX   L0AF0
         JSR   L6332
         LDY   #$00
L7A26    LDA   [$84],Y
         BEQ   L7A32
         INY
         BNE   L7A26
L7A2D    LDY   L0AF0
         BRA   L7A37
L7A32    CPY   L0AF0
         BCS   L7A2D
L7A37    BRA   L79F0

*-----------------------
* VARPTR()
*-----------------------

L7A39    JSR   L6903
         BCS   L7A44
L7A3E    STZ   $24
         LDY   #$00
         LDA   #$00
L7A44    PHA
         PHY
         JSR   L6332
         PLY
         PLA
         LDX   $24
L7A4D    STZ   L0AF3
L7A50    STX   L0AF2
         STY   L0AF1
         STA   L0AF0
         JSR   LE248
         JMP   LE460      ;BRL LE460

*-----------------------
* VARPTR$()
*-----------------------

L7A5F    JSR   L6903
         BCC   L7A3E
         BIT   $10
         BPL   L7A87
         STA   $A6
         STY   $A7
         LDX   $24
         STX   $A8
         LDY   #$00
         LDA   [$22],Y
         BEQ   L7A84
         JSR   L6D61
         JSR   L6332
         LDX   $42
         LDY   $41
         LDA   $40
         BRA   L7A4D
L7A84    BRL   L5EC3
L7A87    BRL   L3F9E
L7A8A    JSR   L7BDC
         LDY   L16FD
L7A90    INY
L7A91    JSR   LE28F
         STY   L0AF0
         JSR   LE24C
         JMP   LE460      ;BRL LE460
L7A9D    JSR   L7BDC
         LDY   L16FE
L7AA3    BRA   L7A90

*-----------------------
* DBUG
*-----------------------

L7AA5    PLA
         PLA
         BRK   $DB

         SEP   #$30
         BRL   L40D8

*-----------------------
* PEEK
*-----------------------

L7AAE    JSR   LE440
         REP   #$30
         LDA   L0AF0
         STA   $40
         SEP   #$30
         LDA   L0AF2
         STA   $42
         LDA   [$40]
         TAY
         BRL   L7A91

*-----------------------
* POKE
*-----------------------

L7AC5    JSR   L7AE7	; Get address
         JSR   L73CB	; Get value
         TXA
         STA   [$84]
         RTS

*-----------------------
* ERROR
*-----------------------

L7ACF    JSR   L742D
         CPY   #$00
         BEQ   L7ADD
         CPY   #$0D
         BNE   L7AE1
         BRL   L3F75
L7ADD    TAX
         BRL   L3FA4
L7AE1    XBA
         TYA
         XBA
L7AE4    BRL   L3F6A

L7AE7    JSR   L608F
         JSR   LE440
         REP   #$30
         LDA   L0AF0
         STA   $84
         LDA   L0AF2
         CMP   #$0100	; must be <256
         SEP   #$30
         BCC   L7B01
         BRL   L6708
L7B01    STA   $86
         RTS

*-----------------------
* PDL()
*-----------------------

L7B04    JSR   L73D6
         CPX   #$04
         BCS   L7B45
         LDAL  $E0C070
         INC   L16FB
         DEC   L16FB
         INC   L16FB
         DEC   L16FB
         PHB
         LDA   #$E0
         PHA
         PLB
         REP   #$10
         LDY   #$0200
L7B25    LDAL  PADDL0,X
         BPL   L7B2E
         DEY
         BNE   L7B25
L7B2E    PLB
         STY   L16FB
         REP   #$30
         LDA   #$0200
         SEC
         SBC   L16FB
         STA   L16FB
         ASL
         SEP   #$30
         TAY
         BRL   L7A91

L7B45    BRL   L6708

*-----------------------
* JOYX
*-----------------------

L7B48    JSR   L73D6
         CPX   #$03
L7B4D    BCS   L7B45
         LDAL  $E0C070
         STZ   L16FB
         STZ   L16FC
         PHB
         LDA   #$E0
         PHA
         PLB
L7B5E    LDAL  PADDL0,X
         ANDL  PADDL0,X
         BPL   L7B71
         INC   L16FB
         NOP
         NOP
         BNE   L7B5E
         BRA   L7B9E
L7B71    LDA   L16FB
         STA   L16FC
         LDAL  PADDL0,X
         BPL   L7B99
         BRA   L7B89
L7B7F    LDAL  PADDL0,X
         ANDL  PADDL0,X
         BPL   L7B9E
L7B89    INC   L16FB
         BNE   L7B7F
         RTS

L7B8F    LDAL  PADDL0,X
         ANDL  PADDL0,X
         BPL   L7B9E
L7B99    INC   L16FC
         BNE   L7B8F
L7B9E    PLB
         LDY   L16FB
         BRL   L7A91

L7BA5    LDY   L16FC
         BRL   L7A91

L7BAB    LDY   L16FB
         LDA   L16FC
         BRL   L790C

*-----------------------
* BTN()
*-----------------------

L7BB4    JSR   L73D6
         CPX   #$03
         BCS   L7B4D
         LDA   #$80
         CPX   #$00
         BEQ   L7BCB
         CPX   #$01
         BEQ   L7BD1
         ANDL  $E0C063
         BRA   L7BD5
L7BCB    ANDL  $E0C061
         BRA   L7BD5
L7BD1    ANDL  $E0C062
L7BD5    CLC
         ROL
         ROL
         TAY
         BRL   L7A91

*-----------------------
* 
*-----------------------

L7BDC    LDAL  $00057B
         STA   L16FD
         LDAL  $0005FB
         TAY
         STY   L16FE
         RTS

L7BEC    JSR   LE28B
         LDA   $C8
         LDY   $C7
         STA   L0AF1
         STY   L0AF0
         JMP   LE248      ;BRL LE248
L7BFC    LDY   L0B1E
         BRA   L7C16
L7C01    LDY   L0B1A
         BRA   L7C16
L7C06    LDY   L0B1C
         BRA   L7C16
L7C0B    LDY   L16F3
         BRA   L7C16
L7C10    LDY   $D2
         BRA   L7C16
L7C14    LDY   $CC
L7C16    BRL   L7A91
L7C19    JSR   L3CBE
         CMP   #$23
         BNE   L7C30
         JSR   L73D0
         JSR   LB725
         JSR   LB809
         LDX   $1B
         STX   $18
         JSR   L6336
L7C30    JSR   L649E
         JSR   L3CC8
         BNE   L7C4A
         JSR   L3523
         JSR   LA7CF
         PHA
         JSR   L351F
         PLA
         JSR   L72E8
         JSR   L5E5F
         RTS

L7C4A    BRL   L6356
L7C4D    CMP   #$F0
         BNE   L7C5A
         JSR   L6306
         JSR   L6336
         BRL   L7D55
L7C5A    JSR   L959B
         JSR   L6336
         LDA   $50
         PHA
         REP   #$30
         LDA   $4E
         PHA
         LDA   $BB
         STA   $4E
         SEP   #$30
         LDA   $BD
         STA   $50
         LDA   #$FE
         STA   L033C
         STZ   L1A4D
L7C7A    INC   L033C
         INC   L033C
         LDX   L033C
         CPX   #$7E
         BCC   L7C8A
         BRL   L7D2A
L7C8A    LDA   L193C,X
         BMI   L7CA3
         CMP   #$02
         BCC   L7C98
         JSR   L6089
         BRA   L7CD0
L7C98    JSR   L73D3
         STX   L0AF0
         STZ   L0AF1
         BRA   L7CD0
L7CA3    JSR   L3CC8
         TAY
         BEQ   L7CC5
         BCC   L7C98
         CMP   #$22
         BNE   L7CC7
         JSR   L6306
         LDA   [$4E]
         BEQ   L7CC5
         STA   L0AF0
         STZ   L0AF1
         JSR   L3CBE
         BEQ   L7CC5
         CMP   #$22
         BEQ   L7CCD
L7CC5    BRA   L7D0F
L7CC7    STA   L0AF0
         STZ   L0AF1
L7CCD    JSR   L6306
L7CD0    LDX   L033C
         LDA   L193C,X
         BMI   L7D08
         CMP   #$02
         BCS   L7CF2
         LSR
         LDA   L0AF1
         BNE   L7D0F
         LDA   L0AF0
         BNE   L7CE9
         BCS   L7D0F
L7CE9    CMP   L19BA,X
         BCC   L7D19
         BEQ   L7D19
         BRA   L7D0F
L7CF2    LDY   L193D,X
         REP   #$30
         LDA   L0AF0
         CMP   L19BA,X
         BCC   L7D01
         BNE   L7D0F
L7D01    STA   L1A3C,Y
         SEP   #$30
         BRA   L7D1F
L7D08    LDA   L0AF0
         CMP   #$80
         BCC   L7D19
L7D0F    SEP   #$30
         LDX   #$46
         BRL   L3FA4
L7D16    BRL   L6356
L7D19    LDY   L193D,X
         STA   L1A3C,Y
L7D1F    JSR   L3CC8
         BEQ   L7D2A
         JSR   L6346
         BRL   L7C7A
L7D2A    LDX   L033C
         CPX   #$22
         BCS   L7D34
         BRL   L84C3
L7D34    LDA   L1A3D
         BEQ   L7D3A
         DEC
L7D3A    STA   L1A3D
         LDA   L1A3E
         BEQ   L7D43
         DEC
L7D43    STA   L1A3E
         REP   #$30
         PLA
         STA   $4E
         SEP   #$30
         PLA
         STA   $50
         LDA   #$01
         STA   L1A8A
L7D55    JSR   L649E
         LDX   $0F
         CPX   #$07
         BEQ   L7D61
         BRL   L3F9E
L7D61    JSR   L3CC8
         BNE   L7D16
         LDA   $84
         LDY   $85
         LDX   $86
         JSR   L6D67
         PHA
         STZ   L1A8C
         LDA   L1A40
         CMP   #$20
         BCS   L7D7D
         INC   L1A8C
L7D7D    PLA
         JSR   L9D1D
         JSR   L72CA
         LDY   L04F9
         REP   #$30
         LDA   #L04FA
         STA   $BB
         SEP   #$30
         LDA   #^L04FA
         STA   $BD
         JSR   L6E97
         JSR   L5E5F
         RTS

*-----------------------
* UIR()
*-----------------------

L7D9B    JSR   L8057
         JSR   L73D6
         CPX   #$07
         BCC   L7DA8
         BRL   L6708
L7DA8    TXA
         ASL
         TAX
         LDY   L1A7E,X
         BRL   L7A91

*-----------------------
* INPUT
*-----------------------

L7DB1    LDA   #$83
         JSR   L80A8
         BNE   L7DBB
         BRL   L7C4D
L7DBB    JSR   L3CC8
         CMP   #$22
         BNE   L7DD6
         JSR   L6257
         JSR   L3CC8
         CMP   #$2C
         BEQ   L7DCE
         LDA   #$3B
L7DCE    JSR   L6348
         JSR   L93A6
         BRA   L7E13
L7DD6    CMP   #$23
         BNE   L7E10
         LDA   #$80
         STA   $E8
         JSR   L6306
         JSR   L73D3
         CPX   #$1F
         BCS   L7DF9
         JSR   LB729
         JSR   LB8A2
         JSR   LB7D4
         JSR   L3CC8
         CMP   #$3B
         BEQ   L7DFC
         RTS

L7DF9    BRL   L6708
L7DFC    LDA   $1B
         STA   $18
         JSR   L3CBE
         JSR   LA63F
         JSR   L7F8B
         LDA   #$2C
         STA   L04F9
         BRA   L7E32
L7E10    JSR   L93B9
L7E13    LDX   #$00
         STX   $DD
         DEX
         STX   $18
         JSR   L7F85
         LDA   #$2C
         STA   L04F9
         LDA   L04FA
         CMP   L16ED
         BNE   L7E32
L7E2A    JSR   L7F97
         LDA   #$40
         BRL   L3DC0
L7E32    STX   $81
         STY   $82
         LDX   $13
         STX   $83
L7E3A    JSR   L649E
         JSR   L3CC8
         BEQ   L7E46
         CMP   #$3B
         BNE   L7E4A
L7E46    LDA   #$80
         STA   $DD
L7E4A    JSR   L7F2C
         LDA   [$4E]
         BNE   L7E76
         BIT   $18
         BMI   L7E5D
         JSR   LA63F
         JSR   L7F8B
         BRA   L7E6E
L7E5D    JSR   L933A
         JSR   L93B9
         JSR   L7F82
         LDA   L04FA
         CMP   L16ED
         BEQ   L7E2A
L7E6E    STX   $4E
         STY   $4F
         LDX   $13
         STX   $50
L7E76    JSR   L6306
         BIT   $10
         BPL   L7E82
         JSR   L7F3C
         BRA   L7E90
L7E82    LDA   [$4E]
         BEQ   L7E99
         JSR   LE558
         BCC   L7E99
         LDX   $0F
         JSR   L5E1E
L7E90    JSR   L3CC8
         BEQ   L7E9B
         CMP   #$2C
         BEQ   L7E9B
L7E99    BRA   L7EF1
L7E9B    JSR   L7F1A
         BEQ   L7EB1
         CMP   #$3B
         BNE   L7EAC
         JSR   L3CBE
         BEQ   L7EC5
         BRL   L6356
L7EAC    JSR   L6346
         BRA   L7E3A
L7EB1    BIT   $18
         BPL   L7EC5
         LDA   #$0D
         JSR   LA9C4
         LDA   L06F0
         LSR
         BCC   L7EC5
         LDA   #$0A
         JSR   LA9C4
L7EC5    STZ   $DD
         LDY   #$00
         LDA   [$81],Y
         BEQ   L7EEE
         BIT   $CF
         BPL   L7EDE
         JSR   L8038
         LDX   #$FD
         LDY   $76
         INY
         BEQ   L7EDE
         BRL   L3FA4
L7EDE    BIT   $18
         BPL   L7EEE
         LDA   #L2D4E
         LDX   #^L2D4E
         LDY   #>L2D4E
         JSR   L93FB
         JSR   L933A
L7EEE    BRL   L8038
L7EF1    BIT   $18
         BMI   L7EF8
         BRL   L3F9E
L7EF8    BIT   $CF
         BPL   L7F06
         LDY   $76
         INY
         BEQ   L7F06
         LDX   #$FE
         BRL   L3FA4
L7F06    JSR   L933A
         LDA   #L2D63
         LDX   #^L2D63
         LDY   #>L2D63
         JSR   L93A3
         JSR   L7F97
         PLA
         PLA
         BRL   L3C08
L7F1A    LDA   $4E
         LDX   $50
         LDY   $4F
         STA   $81
         STX   $83
         STY   $82
         JSR   L804A
         BRL   L3CC8
L7F2C    JSR   L803D
         LDX   $81
         LDY   $82
         LDA   $83
         STA   $50
         STX   $4E
         STY   $4F
         RTS

L7F3C    LDY   #$00
         LDA   [$4E],Y
         STA   $0C
         BIT   $DD
         BVS   L7F4E
         BPL   L7F52
         LDA   #$00
         STA   $0C
         BRA   L7F5A
L7F4E    CMP   #$27
         BEQ   L7F5B
L7F52    CMP   #$22
         BEQ   L7F5B
         LDA   #$2C
         STA   $0C
L7F5A    CLC
L7F5B    STA   $0D
         LDA   $4E
         LDY   $4F
         LDX   $50
         ADC   #$00
         BCC   L7F6B
         INY
         BNE   L7F6B
         INX
L7F6B    JSR   L6E67
         JSR   L7407
         JSR   L5E5F
         BIT   $DD
         BVC   L7F81
         LDA   $0C
         CMP   #$27
         BNE   L7F81
         JSR   L6306
L7F81    RTS

L7F82    JSR   L93B9
L7F85    JSR   LA4E8
         JSR   LA646
L7F8B    STZ   L04FA,X
         LDA   #^L04F9
         STA   $13
         LDX   #L04F9
         LDY   #>L04F9
         RTS

L7F97    LDA   $79
         LDY   $7A
         LDX   $7B
         STX   $50
         STA   $4E
         STY   $4F
         RTS

*-----------------------
* READ
*-----------------------

L7FA4    CMP   #$23
         BNE   L7FAB
         BRL   LB2BE
L7FAB    LDX   #$40
         STA   $DD
         LDX   $7E
         LDY   $7F
         STX   $81
         STY   $82
         LDX   $80
         STX   $83
L7FBB    JSR   L649E
         JSR   L7F2C
L7FC1    LDA   [$4E]
         BEQ   L7FD1
         JSR   L6306
         JSR   L3CC8
         BIT   $10
         BPL   L8006
         BRA   L8001
L7FD1    JSR   L8C81
         INY
         TAX
         BNE   L7FF2
         JSR   L8C60
         LDX   #$04
         LDA   [$4E]
         TAY
         LDA   [$4E],Y
         BNE   L7FE7
         BRL   L3FA4
L7FE7    INY
         LDA   [$4E],Y
         STA   $7C
         INY
         LDA   [$4E],Y
         INY
         STA   $7D
L7FF2    LDA   [$4E],Y
         TAX
         JSR   L8C60
         CPX   #$CA
         BNE   L7FD1
         JSR   L6306
         BRA   L7FC1
L8001    JSR   L7F3C
         BRA   L800E
L8006    JSR   LE558
         LDX   $0F
         JSR   L5E1E
L800E    JSR   L3CC8
         BEQ   L8022
         CMP   #$2C
         BEQ   L8022
         LDA   $7C
         LDY   $7D
         STA   $75
         STY   $76
         BRL   L6356
L8022    JSR   L7F1A
         BEQ   L802D
         JSR   L6346
         BRL   L7FBB
L802D    STZ   $DD
         LDA   $81
         LDY   $82
         LDX   $83
         BRL   L3DB6
L8038    LDA   #$FF
         STA   $18
         RTS

L803D    LDA   $4E
         LDY   $4F
         LDX   $50
         STX   $27
         STA   $25
         STY   $26
         RTS

L804A    LDA   $25
         STA   $4E
         LDA   $26
         STA   $4F
         LDA   $27
         STA   $50
L8056    RTS

L8057    LDX   $76
         INX
         BNE   L8056
         LDX   #$11
L805E    BRL   L3FA4

*-----------------------
* RESUME
*-----------------------

L8061    BEQ   L8074
         JSR   L8057
         CMP   #$97
         BNE   L806D
         PLA
         PLA
         RTS

L806D    CMP   #$8E
         BNE   L80A7
         JSR   L6306
L8074    TAY
         JSR   L8057
         LDA   $CB
         BEQ   L80A7
         STA   $50
         LDA   $C7
         STA   $75
         LDA   $C8
         STA   $76
         LDA   $C9
         STA   $4E
         LDA   $CA
         STA   $4F
         CPY   #$8E
         BNE   L80A7
         LDA   [$4E]
         BNE   L80A1
         LDY   #$01
         LDA   [$4E],Y
         CLC
         ADC   #$03
         TAY
         JSR   L8C60
L80A1    JSR   L6306
         JSR   L8C5D
L80A7    RTS

L80A8    STY   $13
         LDY   #$01
         CMP   [$4E],Y
         BNE   L80BB
         LDA   [$4E]
         CMP   #$DF
         BNE   L80BB
         JSR   L6306
         LDA   #$00
L80BB    PHP
         JSR   L3CC8
         LDY   $13
         PLP
         RTS

L80C3    PHA
         LDA   #$DF
         JSR   L6348
         PLA
         BRL   L6348
L80CD    REP   #$30
         LDA   #$0020
         BRA   L80D9
L80D4    REP   #$30
         LDA   #$0028
L80D9    PEA   $0000
         PHA
         PEA   $0000
         _FlushEvents
         BCC   L80EC
         BRL   L3F6A
L80EC    PLA
         SEP   #$30
         RTS

*-----------------------
* EXCEPTION
*-----------------------

L80F0    BNE   L80F5
         BRL   L6356
L80F5    JSR   L6306
         CMP   #$8F
         BNE   L8101
         LDX   L0B7E
         BRA   L8111
L8101    CMP   #$90
         BNE   L8119
         JSR   L3CC8
         BEQ   L811F
         JSR   L73D3
         CPX   #$40
         BCS   L8120
L8111    STX   L0B84
         LDA   #$40
         STA   $D0
         RTS

L8119    CMP   #$F0
         BNE   L811F
         STZ   $D0
L811F    RTS

L8120    BRL   L6708
L8123    JSR   L8057
         LDA   #$80
         STA   $CF
         LDX   #$A5
         BRA   L81A9
L812E    JSR   L8057
         LDA   #$80
         STA   L16F9
         LDX   #$A0
         BRA   L81A9
L813A    JSR   L8057
         LDA   #$80
         STA   $D0
         LDX   #$96
         BRA   L81A9
L8145    JSR   L8057
         JSR   L80D4
         LDA   #$80
         STA   L16F7
         TSB   L16F1
         LDX   #$00
         BRA   L81A9
L8157    JSR   L6306
         JSR   L8057
         LDA   #$00
         STA   $A5
         JSR   L632C
         JSR   LE440
         REP   #$30
         LDA   L0AF1
         STA   L1702
         CMP   #$0151
         SEP   #$30
         BCC   L8182
         BEQ   L817B
L8178    BRL   L6708
L817B    LDA   L0AF0
         CMP   #$80
         BCS   L8178
L8182    LDA   L0AF0
         STA   L1701
         LDA   #$80
         STA   L1705
         STA   L16FF
         LDX   #$1F
         BRA   L819D
L8194    JSR   L3CBE
         JSR   L8057
         JSR   LB71C
L819D    JSR   L6363
         TXA
         PHA
         ASL
         ASL
         CLC
         ADC   $01,S
         TAX
         PLA
L81A9    JSR   L81CE
         LDA   $4E
         STA   L063A,X
         LDA   $4F
         STA   L063B,X
         LDA   $50
         STA   L063C,X
         JSR   L81CE
         LDA   $75
         STA   L063D,X
         LDA   $76
         STA   L063E,X
         JSR   L8C85
         BRL   L8C60
L81CE    SEC
         LDA   $4B
         SBC   $4E
         STA   $4E
         LDA   $4C
         SBC   $4F
         STA   $4F
         LDA   $4D
         SBC   $50
         STA   $50
L81E1    RTS

*-----------------------
* OFF
*-----------------------

L81E2    JSR   L6306
         CMP   #$94
         BEQ   L820D
         CMP   #$95
         BEQ   L8223
         CMP   #$86
         BEQ   L8217
         CMP   #$DF
         BNE   L81E1
         JSR   L3CC8
         JSR   L6306
         CMP   #$F0
         BEQ   L822B
         CMP   #$F1
         BEQ   L823A
         CMP   #$EF
         BNE   L81E1
L8207    STZ   $CF
         LDX   #$21
         BRA   L823D
L820D    STZ   L1705
         STZ   L16FF
         LDX   #$1F
         BRA   L823D
L8217    STZ   L16F9
         LDA   #$40
         TRB   L16EF
         LDX   #$20
         BRA   L823D
L8223    LDA   #$40
         STA   $D0
         LDX   #$1E
         BRA   L823D
L822B    LDA   #$80
         TRB   L16F1
         STZ   L16F7
         TRB   L16EF
         LDX   #$00
         BRA   L823D
L823A    JSR   LB71C
L823D    TXA
         PHA
         ASL
         ASL
         CLC
         ADC   $01,S
         TAX
         PLA
         LDA   #$00
         STZ   L063A,X
         STZ   L063B,X
         STZ   L063C,X
         STZ   L063D,X
         STZ   L063E,X
         RTS

L8258    STZ   L16EF
         REP   #$30
         PEA   $0000
         PEA   $0428
         PEA   ^L10D3
         PEA   L10D3
         _GetNextEvent
         BCS   L8293
         PLA
         BNE   L827E
         SEP   #$30
         STA   L16F3
         STA   L16F5
         RTS

L827E    LDA   L10E1
         ASL
         ASL
         XBA
         SEP   #$30
         EOR   #$03
         STA   L16F5
         TAX
         LDA   L10D5
         STA   L16F3
         RTS

L8293    BRL   L3F6A
L8296    STZ   L16FF
         STZ   L1705
         JSR   L8AD8
         LDX   #$9B
         BRA   L82C2
L82A3    JSR   L8258
         JSR   L8AD8
         LDX   #$00
         BRA   L82C2
L82AD    LDA   $1B
         STA   $D2
         ASL
         ASL
         CLC
         ADC   $1B
         REP   #$10
         LDX   $D4
         TXS
         SEP   #$30
         LDX   $0A
         STX   $09
L82C1    TAX
L82C2    LDA   #$FF
         STA   $18
         LDA   L063C,X
         BEQ   L82E7
         STA   $50
         LDA   L063A,X
         STA   $4E
         LDA   L063B,X
         STA   $4F
         LDA   L063D,X
         STA   $75
         LDA   L063E,X
         STA   $76
         JSR   L81CE
         BRL   L3C4A
L82E7    CPX   #$96
         BCC   L82F0
L82EB    LDX   #$47
         BRL   L3FA4
L82F0    TXA
         BEQ   L82EB
         LDX   #$04
         BRL   L3FA4
L82F8    LDX   #$0D
L82FA    BRL   L3FA4

*-----------------------
* DEF
*-----------------------

L82FD    JSR   L8057
         LDY   #$00
L8302    INY
         LDA   [$4E],Y
         BEQ   L830F
         CMP   #$3D
         BEQ   L8321
         CMP   #$3A
         BNE   L8302
L830F    LDA   #$DE	; LOGO
         STA   $0D
         LDA   #$87
         STA   $0C
         LDX   #$00
         JSR   L8EDD
         BCS   L8321
         BRL   L85EE
L8321    BRL   L8C7C

*-----------------------
* FN
*-----------------------

L8324    JSR   L649E
         JSR   L633A
         LDX   $D3
         LDA   $0F
         CPX   #$40
         BEQ   L8335
         BRL   L8916
L8335    PHA
         PHX
         BRL   L5DE4
L833A    LDA   $D9
         STZ   $D9
         BMI   L8341
         RTS

L8341    LDA   $5F
         STA   $99
         LDA   $5C
         STA   $42
         REP   #$30
         LDA   $5D
         STA   $97
         LDA   $5A
         STA   $40
         SEP   #$30
         BRL   L58FB
L8358    JSR   L833A
         REP   #$30
         LDA   $4B
         STA   $4E
         SEP   #$30
         LDA   $4D
         STA   $50
         BRA   L8373
L8369    INC   $4E
         BNE   L8373
         REP   #$30
         INC   $4F
         SEP   #$30
L8373    LDA   [$4E]
         TAY
         LDA   [$4E],Y
         BNE   L837B
         RTS

L837B    TAX
         TYA
         CLC
         ADC   $4E
         STA   $4E
         BCC   L838A
         REP   #$30
         INC   $4F
         SEP   #$30
L838A    LDY   #$01
         REP   #$30
         LDA   [$4E],Y
         STA   $75
         SEP   #$30
         INY
         INY
         LDA   [$4E],Y
         CMP   #$CD
         BEQ   L83AC
         REP   #$30
         TXA
         CLC
         ADC   $4E
         STA   $4E
         SEP   #$30
         BCC   L8373
         INC   $50
         BRA   L8373
L83AC    JSR   L8C60
         JSR   L3CBE
         STA   $BE
         JSR   L8412
         LDA   $BE
         BNE   L83C0
         JSR   L8C7C
         BRA   L8369
L83C0    LDA   #$DE
         STA   $0D
         LDA   #$CD
         STA   $0C
         LDX   #$00
         JSR   L8EDD
         BCS   L83D4
L83CF    LDX   #$3F
L83D1    BRL   L3FA4
L83D4    LDA   $0B
         BEQ   L83DC
         LDX   #$3D
         BRA   L83D1
L83DC    JSR   L3CBE
         CMP   $BE
         BNE   L83CF
         LDY   #$00
L83E5    JSR   L3CBE
         BEQ   L83F6
         JSR   L664D
         EOR   [$DE],Y
         AND   #$DF
         BNE   L83CF
         INY
         BRA   L83E5
L83F6    CPY   #$00
         BEQ   L8406
         LDA   [$DE],Y
         BEQ   L8406
         CMP   #$28
         BEQ   L8406
         CMP   #$3A
         BNE   L83CF
L8406    LDA   [$4E]
         BNE   L840D
         BRL   L8369
L840D    LDX   #$3B
         BRL   L3FA4
L8412    TAX
         JSR   L3CBE
         STZ   $BF
         LDY   #$10
         CPX   #$87
         BEQ   L8427
         DEC   $BF
         LDY   #$20
         CPX   #$88
         BEQ   L8427
         RTS

L8427    TYA
         JSR   L84CE
         BCC   L8432
         LDX   #$0F
         BRL   L3FA4
L8432    LDA   #$06
         STA   $1F
         LDA   $0F
         AND   #$30
         STA   $10
         ORA   #$80
         TSB   $D9
         LDA   $0F
         AND   #$0F
         STA   $0F
         TAX
         LDA   L1CDB,X
         ORA   $10
         STA   $10
         JSR   L667B
         JSR   L8500
         PEI   $75
         LDA   $50
         PHA
         REP   #$30
         LDA   $4E
         PHA
         SEP   #$30
         JSR   L84B1
         LDA   #$00
         PHA
         JSR   L3CC8
         BEQ   L84A5
         JSR   L6342
L846E    JSR   L65FB
         BCC   L8476
L8473    BRL   L6356
L8476    TAX
         LDA   $01,S
         INC
         STA   $01,S
         CPX   #$2C
         BNE   L8485
         JSR   L6306
         BRA   L846E
L8485    JSR   L6332
         BNE   L8498
         BIT   $BF
         BMI   L84A5
         LDA   $10
         AND   #$0F
         CMP   #$07
         BEQ   L8515
         BRA   L84A5
L8498    BIT   $BF
         BMI   L8473
         CMP   #$3D
         BNE   L8473
         JSR   L8C5D
         STZ   $BE
L84A5    LDX   #$05
         LDY   #$FF
L84A9    INY
         PLA
         STA   [$28],Y
         DEX
         BPL   L84A9
         RTS

L84B1    REP   #$30
         LDA   $4B
         SEC
         SBC   $03,S
         STA   $03,S
         SEP   #$30
         LDA   $4D
         SBC   $05,S
         STA   $05,S
         RTS

L84C3    LDX   #$3C
         BRL   L3FA4
L84C8    LDA   #$20
         BRA   L84CE
L84CC    LDA   #$10
L84CE    PHA
         JSR   L6475
         LDA   $01,S
         BIT   #$20
         BCS   L84DA
         BEQ   L84C3
L84DA    BEQ   L84E7
         LDX   $0F
         CPX   #$04
         BEQ   L84E7
         LDX   #$45
         BRL   L3FA4
L84E7    LDX   $0F
         BEQ   L8515
         CPX   #$06
         BEQ   L8515
         PLA
         ORA   $0F
         STA   $0F
         CLC
         BIT   $D9
         BPL   L8514
         BEQ   L8514
         JSR   L657B
         BCC   L8514
L8500    PHP
         TYA
         SEC
         ADC   $97
         LDY   $99
         BCC   L850D
         INX
         BNE   L850D
         INY
L850D    PLP
         STA   $28
         STY   $2A
         STX   $29
L8514    RTS

L8515    BRL   L3F9E
         BRL   L6356
L851B    REP   #$30
         LDA   $57
         SEC
         SBC   $03,S
         STA   $03,S
         SEP   #$30
         LDA   $59
         SBC   $05,S
         STA   $05,S
         RTS

*-----------------------
* PROC
*-----------------------

L852D    LDA   $65
         STA   $8D
         REP   #$30
         LDA   $63
         STA   $8B
         SEP   #$30
         JSR   L8896
         LDA   [$4E]
         CMP   #$FB
         BNE   L856E
         LDY   #$03
         LDA   [$4E],Y
         TAX
         LDY   #$01
         REP   #$30
         LDA   [$4E],Y
         CLC
         ADC   $5D
         STA   $28
         SEP   #$30
         TXA
         ADC   $5F
         STA   $2A
         LDA   #$04
         CLC
         ADC   $4E
         STA   $4E
         BCC   L8568
         REP   #$30
         INC   $4F
         SEP   #$30
L8568    LDA   #$24
         STA   $0F
         BRA   L8579
L856E    JSR   L84C8
         BCS   L8579
         BRL   L8703
L8576    BRL   L8887
L8579    JSR   L3CC8
         BEQ   L8589
         LDX   #$02
         CMP   #$28
         BNE   L8576
         JSR   L8782
         BRA   L85A7
L8589    JSR   L803D
         LDY   #$03
         LDA   [$28],Y
         PHA
         LDY   #$01
         REP   #$30
         LDA   [$28],Y
         PHA
         SEP   #$30
         JSR   L84B1
         REP   #$30
         PLA
         STA   $4E
         SEP   #$30
         PLA
         STA   $50
L85A7    LDX   #$88
L85A9    LDA   $50
         PHA
         REP   #$30
         LDA   $4E
         PHA
         SEP   #$30
         JSR   L804A
         PHX
         JSR   L8AD8
         PLA
         LDX   $09
         STA   L08F1,X
         TAX
         JSR   L8694
         LDY   #$04
         REP   #$30
         LDA   [$28],Y
         STA   $75
L85CC    REP   #$30
         PLA
         STA   $4E
         SEP   #$30
         PLA
         STA   $50
         CPX   #$87
         BEQ   L85DB
         RTS

L85DB    LDA   $D6
         STA   L0B0C
         LDA   $E6
         STA   L0B0A
         LDA   $D7
         INC
         STA   L0B0E
L85EB    BRL   L3BEF

*-----------------------
* END
*-----------------------

L85EE    BNE   L85F4
         CLC
         BRL   L3DFD
L85F4    CMP   #$88
         BEQ   L85FF
         CMP   #$87
         BEQ   L85FF
         BRL   L6356
L85FF    PHA
         JSR   L866A
         TXA
         CLC
         ADC   #$06
         STA   $09
         PLA
         CMP   L08F1,X
         BEQ   L8612
         BRL   L3F9E
L8612    JSR   L6306
         PHX
         CMP   #$87
         BEQ   L8624
         JSR   L6EFE
         JSR   L86A9
         PLX
         BRL   L8C12
L8624    JSR   L6475
         JSR   L6555
         BCS   L862F
         JSR   L3F4C
L862F    JSR   L64CB
         XBA
         LDA   $D3
         XBA
         JSR   LDE7E
         LDA   L0B0C
         STA   $D6
         LDA   L0B0A
         STA   $E6
         LDA   L0B0E
         DEC
         STA   $D7
         JSR   L6EFE
         JSR   L86A9
         PLX
         JSR   L8C1A
         PLA
         PLA
         LDA   $03,S
         CMP   $00
         BNE   L8664
         REP   #$30
         LDA   $01,S
         CMP   #L6252+3
         BEQ   L8667
L8664    JSR   L3F4C
L8667    SEP   #$30
         RTL

L866A    LDX   $09
L866C    LDA   L08F1,X
         BEQ   L868B
         CMP   #$88
         BEQ   L86A8
         CMP   #$87
         BEQ   L86A8
         CMP   #$89
         BEQ   L868F
         CMP   #$8B
         BNE   L8688
         TXA
         CLC
         ADC   #$19
         TAX
         BRA   L866C
L8688    JSR   L3F4C
L868B    LDX   #$40
         BRA   L8691
L868F    LDX   #$41
L8691    BRL   L3FA4
L8694    LDA   $8D
         STA   $56
         LDA   $65
         STA   $53
         REP   #$30
         LDA   $8B
         STA   $54
         LDA   $63
         STA   $51
         SEP   #$30
L86A8    RTS

L86A9    LDY   #$0C
         LDA   [$54],Y
         STA   $D8
         DEY
         LDA   [$54],Y
         STA   L0B0A
         DEY
         LDA   [$54],Y
         STA   L0B0C
         DEY
         LDA   [$54],Y
         STA   L0B0E
         LDX   #$02
L86C3    DEY
         LDA   $54,X
         STA   $63,X
         LDA   [$54],Y
         STA   $51,X
         DEX
         CPY   #$07
         BCS   L86C3
         LDX   #$51
         JSR   L6059
         DEY
         LDA   [$54],Y
         TAX
         DEY
         DEY
         REP   #$30
         LDA   [$54],Y
         STA   $54
         SEP   #$30
         STX   $56
         LDX   #$54
         JSR   L6059
         RTS

L86EC    LDA   $65
         STA   $8D
         REP   #$30
         LDA   $63
         STA   $8B
         SEP   #$30
         JSR   L8896
         JSR   L6306
         JSR   L84CC
         BCS   L8708
L8703    LDX   #$16
L8705    BRL   L8887
L8708    LDA   $0F
         AND   #$07
         TAX
         LDA   L1CDB,X
         STA   $10
         JSR   L88F2
         LDX   #$02
         JSR   L3CC8
         CMP   #$28
         BNE   L8705
         JSR   L8782
         JSR   L3CC8
         BNE   L8735
         LDA   $D8
         STZ   $D8
         BNE   L8730
         LDX   #$44
         BRA   L8705
L8730    LDX   #$87
         BRL   L85A9
L8735    CMP   #$3D
         BEQ   L873C
         BRL   L8703
L873C    LDA   $27
         PHA
         REP   #$30
         LDA   $25
         PHA
         SEP   #$30
         JSR   L84B1
         JSR   L8694
         JSR   L6306
         JSR   L6311
         JSR   L3CC8
         BEQ   L875A
         BRL   L6356
L875A    JSR   L84B1
         REP   #$30
         PLA
         STA   $4E
         SEP   #$30
         PLA
         STA   $50
         JSR   L86A9
         LDA   $03,S
         CMP   $00
         BNE   L8779
         REP   #$30
         LDA   $01,S
         CMP   #L6252+3
         BEQ   L877C
L8779    JSR   L3F4C
L877C    SEP   #$30
         JSR   L3CC8
         RTL

L8782    LDA   $8D
         PHA
         REP   #$30
         LDA   $8B
         PHA
         SEP   #$30
         JSR   L851B
         LDA   [$28]
         BNE   L8796
         BRL   L887D
L8796    LDA   #$00
         PHA
         LDY   #$03
L879B    LDA   [$28],Y
         PHA
         DEY
         BNE   L879B
L87A1    LDX   #$28
         JSR   L606D
         LDA   $2A
         PHA
         REP   #$30
         LDA   $28
         PHA
         SEP   #$30
         JSR   L6306
         JSR   L6311
         JSR   L803D
         REP   #$30
         PLA
         STA   $28
         SEP   #$30
         PLA
         STA   $2A
         LDX   #$28
         JSR   L606D
         JSR   L84B1
         REP   #$30
         PLA
         STA   $4E
         SEP   #$30
         PLA
         STA   $50
         JSR   L6306
         JSR   L647B
         LDA   L1CDB,X
         STA   $10
         LDA   L1CE3,X
         EOR   $A5
         AND   #$80
         BEQ   L87EE
         LDX   #$37
         BRL   L8887
L87EE    JSR   L88F2
         JSR   L64CB
         XBA
         TYA
         XBA
         TXY
         LDX   $0F
         CPX   #$07
         BNE   L8829
         LDA   $D3
         XBA
         LDA   $86
         REP   #$30
         PHA
         LDA   $84
         PHA
         LDA   $22
         STA   $84
         SEP   #$30
         LDA   $24
         STA   $86
         LDA   #$40
         STA   $D3
         JSR   L5E5F
         REP   #$30
         PLA
         STA   $84
         PLA
         SEP   #$30
         STA   $86
         XBA
         STA   $D3
         BRA   L882C
L8829    JSR   L5E26
L882C    PLA
         INC
         CMP   [$28]
         BCS   L884D
         PHA
         LDA   $50
         PHA
         REP   #$30
         LDA   $4E
         PHA
         SEP   #$30
         JSR   L84B1
         JSR   L804A
         JSR   L3CC8
         CMP   #$2C
         BNE   L887D
         BRL   L87A1
L884D    JSR   L3CC8
         CMP   #$29
         BNE   L8881
         JSR   L3CBE
         LDA   [$25]
         CMP   #$29
         BNE   L8881
         INC   $25
         BNE   L886F
         REP   #$30
         INC   $26
         SEP   #$30
         LDA   [$25]
         BEQ   L886F
         CMP   #$3A
         BNE   L8881
L886F    JSR   L851B
         REP   #$30
         PLA
         STA   $8B
         SEP   #$30
         PLA
         STA   $8D
         RTS

L887D    LDX   #$36
         BRA   L8887
L8881    LDX   #$02
         CMP   #$2C
         BEQ   L887D
L8887    REP   #$30
         LDA   $51
         STA   $63
         SEP   #$30
         LDA   $53
         STA   $65
         BRL   L3FA4
L8896    LDA   $D8
         PHA
         LDA   L0B0A
         PHA
         LDA   L0B0C
         PHA
         LDA   L0B0E
         PHA
         LDA   $53
         PHA
         REP   #$30
         LDA   $51
         PHA
         SEP   #$30
         JSR   L851B
         LDA   $56
         PHA
         REP   #$30
         LDA   $54
         PHA
         LDA   #L2D8D
         STA   $DE
         SEP   #$30
         JSR   L851B
         LDA   #^L2D8D
         STA   $E0
         LDA   #$0A
         STA   $1F
         LDA   #$02
         STA   $8A
         LDA   #$90
         STA   $10
         JSR   L88F2
         TYA
         SEC
         ADC   $97
         STA   $97
         BCC   L88E4
         INX
         BNE   L88E4
         INC   $99
L88E4    STX   $98
         LDX   $1F
         LDY   #$FF
L88EA    INY
         PLA
         STA   [$97],Y
         DEX
         BNE   L88EA
         RTS

L88F2    REP   #$30
         LDA   $63
         STA   $97
         SEP   #$30
         LDA   $65
         STA   $99
         BRL   L6658

*-----------------------
* LOCAL
*-----------------------

L8901    REP   #$30
         LDA   $54
         CMP   $51
         SEP   #$30
         BEQ   L8916
L890B    JSR   L891B
         BEQ   L8915
         JSR   L6346
         BRA   L890B
L8915    RTS

L8916    LDX   #$43
         BRL   L3FA4
L891B    JSR   L6475
         BCC   L8923
         BRL   L5EC3
L8923    JSR   L6555
         BCC   L892B
         BRL   L69D1
L892B    LDX   $0F
         LDA   L1CDB,X
         STA   $10
         JSR   L6658
         LDA   $65
         STA   $53
         REP   #$30
         LDA   $63
         STA   $51
         SEP   #$30
         BRL   L3CC8

*-----------------------
* WHILE
*-----------------------

L8944    PHP
         JSR   L803D
         LDA   #$01
         STA   $DD
         PLP
         BEQ   L8954
         JSR   L89AF
         BEQ   L8978
L8954    LDA   $50
         PHA
         REP   #$30
         LDA   $4E
         PHA
         SEP   #$30
         LDX   $09
         LDA   L08F1,X
         CMP   #$DC
         BEQ   L8974
         JSR   L804A
         JSR   L8AD8
         LDX   $09
         LDA   #$DA
         STA   L08F1,X
L8974    TAX
         BRL   L85CC
L8978    LDA   #$DD
         STA   $0D
         LDA   #$DA
         STA   $0C
L8980    LDX   #$00
         JSR   L8EDD
         BCS   L898C
         LDX   #$39
         BRL   L3FA4
L898C    DEC   $DD
         LDA   $0B
         CLC
         ADC   $DD
         STA   $DD
         BEQ   L899C
         JSR   L6306
         BRA   L8980
L899C    JSR   L8C5D
         LDX   $09
         LDA   L08F1,X
         CMP   #$DC
         BNE   L89AB
         JSR   L8C56
L89AB    RTS

L89AC    BRL   L6356
L89AF    JSR   L60A1
         BIT   $A5
         BPL   L89C0
         LDA   [$A6]
         PHA
         JSR   L72CA
         PLY
         JSR   L7A91
L89C0    JSR   L3CC8
         BNE   L89AC
         LDA   $A9
         RTS

*-----------------------
* UNTIL
*-----------------------

L89C8    BEQ   L89CF
         JSR   L89AF
         BNE   L89E7
L89CF    JSR   L803D
         LDA   #$DA
         JSR   L8B9F
         JSR   L8C1A
         JSR   L3CC8
         BEQ   L89F8
         JSR   L89AF
         BNE   L89F8
         JSR   L804A
L89E7    LDA   #$DA
         BRL   L8C53

*-----------------------
* DO
*-----------------------

L89EC    BNE   L89AC
         JSR   L8AD8
         LDX   $09
         LDA   #$DC
         STA   L08F1,X
L89F8    RTS

L89F9    LDX   #$09
         BRA   L89FF
L89FD    LDX   #$0E
L89FF    BRL   L3FA4

*-----------------------
* FOR
*-----------------------

L8A02    PLA
         PLA
         LDA   $50
         PHA
         LDA   $4F
         PHA
         LDA   $4E
         PHA
         JSR   L5DD8
         LDA   $A4
         BEQ   L8A18
         CMP   #$06
         BCC   L8A1B
L8A18    BRL   L3F9E
L8A1B    ORA   $D3
         STA   $C6
         LDX   #$84
         LDA   $D3
         BPL   L8A28
         BRL   L6548
L8A28    JSR   L603B
         LDY   $86
         CPY   #$FF
         BEQ   L8A34
         BRL   L5EC3
L8A34    LDY   #$FF
         JSR   L8FCC
         BEQ   L8A3E
         TXY
         BRA   L8A55
L8A3E    TXA
         CLC
         ADC   #$19
         TAY
         CPX   $09
         BEQ   L8A53
L8A47    LDA   L08F0,X
         STA   L08F0,Y
         DEX
         DEY
         CPX   $09
         BNE   L8A47
L8A53    STY   $09
L8A55    CPY   #$19
         BCC   L89FD
         LDA   #$81
         JSR   L80C3
         JSR   L608F
         LDA   $C6
         AND   #$0F
         TAX
         JSR   LE44E
         JSR   L8ABD
         JSR   LE298
         LDA   #$87
         JSR   L80A8
         BNE   L8A84
         JSR   L3CBE
         JSR   L608F
         LDA   $C6
         AND   #$0F
         TAX
         JSR   LE44E
L8A84    JSR   L8ABD
         JSR   L803D
         PLA
         STA   $44
         PLA
         STA   $45
         PLA
         STA   $46
         JSR   L8F3D
         JSR   L804A
         JSR   L8AD8
         INC   $09
         LDA   $09
         SEC
         SBC   #$04
         STA   $09
         TAX
         LDA   $85
         STA   L08F4,X
         LDA   $84
         STA   L08F3,X
         LDA   $C6
         STA   L08F2,X
         LDA   #$8B
         STA   L08F1,X
         BRL   L3BEF
L8ABD    LDA   $09
         TAY
         SEC
         SBC   #$08
         STA   $09
         LDX   #$08
         REP   #$30
L8AC9    LDA   L0AEE,X
         DEY
         STA   L08F0,Y
         DEY
         DEX
         DEX
         BNE   L8AC9
         SEP   #$30
         RTS

L8AD8    LDA   $09
         CMP   #$06
         BCS   L8AE1
         BRL   L89FD
L8AE1    SEC
         SBC   #$06
         STA   $09
         TAX
         SEC
         LDA   $4E
         SBC   $4B
         STA   L08F6,X
         LDA   $4F
         SBC   $4C
         STA   L08F5,X
         LDA   $50
         SBC   $4D
         STA   L08F4,X
         LDA   $76
         STA   L08F3,X
         LDA   $75
         STA   L08F2,X
         LDA   #$89
         STA   L08F1,X
         RTS

*-----------------------
* GOSUB
*-----------------------

L8B0D    JSR   L803D
         LDA   [$4E]
         CMP   #$FB
         BNE   L8B2B
         LDA   $4E
         CLC
         ADC   #$04
         STA   $4E
         BCC   L8B25
         REP   #$30
         INC   $4F
         SEP   #$30
L8B25    JSR   L3CC8
         BEQ   L8B30
L8B2A    RTS

L8B2B    JSR   L3AED
         BNE   L8B2A
L8B30    JSR   L8AD8
         JSR   L804A
         LDA   [$4E]
         CMP   #$FB
         BNE   L8B65
         PHP
L8B3D    PLP
         LDA   #$80
         TRB   $E7
         LDY   #$03
         LDA   [$4E],Y
         TAX
         LDY   #$01
         REP   #$30
         LDA   [$4E],Y
         CLC
         ADC   $4E
         STA   $4E
         SEP   #$30
         TXA
         ADC   $50
         STA   $50
L8B59    RTS

*-----------------------
* GOTO
*-----------------------

L8B5A    PHP
         CMP   #$FB
         BEQ   L8B3D
         PLP
         JSR   L3AF0
L8B63    BNE   L8B9E
L8B65    JSR   L8C85
         REP   #$30
         LDA   $75
         CMP   $30
         SEP   #$30
         BCS   L8B85
         TYA
         LDY   $50
         SEC
         ADC   $4E
         LDX   $4F
         BCC   L8B80
         INX
         BNE   L8B80
         INY
L8B80    JSR   L9045
         BRA   L8B88
L8B85    JSR   L903F
L8B88    BCC   L8BE9
         LDA   #$80
         TRB   $E7
         REP   #$20
         LDY   $99
         LDA   $97
         BNE   L8B97
         DEY
L8B97    DEC
         STA   $4E
         STY   $50
         SEP   #$30
L8B9E    RTS

L8B9F    PHA
         LDX   $09
L8BA2    LDA   L08F1,X
         BEQ   L8BDA
         CMP   $01,S
         BEQ   L8BD3
         CMP   #$88
         BEQ   L8BE5
         CMP   #$87
         BEQ   L8BE5
         CMP   #$8B
         BNE   L8BBE
         TXA
         CLC
         ADC   #$19
         TAX
         BRA   L8BA2
L8BBE    CMP   #$DA
         BNE   L8BC9
L8BC2    TXA
         CLC
         ADC   #$06
         TAX
         BRA   L8BA2
L8BC9    CMP   #$DC
         BNE   L8BD7
         LDA   #$DA
         CMP   $01,S
         BNE   L8BC2
L8BD3    PLA
         LDA   #$00
         RTS

L8BD7    JSR   L3F4C
L8BDA    PLA
         LDX   #$03
         CMP   #$89
         BEQ   L8BEB
         LDX   #$3A
         BRA   L8BEB
L8BE5    LDX   #L3F4C
         BRA   L8BEB
L8BE9    LDX   #$0B
L8BEB    BRL   L3FA4

*-----------------------
* RETURN
*-----------------------

L8BEE    BEQ   L8C0F
         CMP   #$F0
         BNE   L8C06
         PLA
         PLA
         LDA   L10CF
         AND   #$40
         ASL
         TSB   L10CF
         JSR   L8C51
         JSR   L8C1A
         RTL

L8C06    JSR   L8C51
         JSR   L3CC8
         BRL   L8B5A
L8C0F    JSR   L8C51
L8C12    PLA
         PLA
         JSR   L8C1A
         BRL   L3C08
L8C1A    LDA   L08F2,X
         STA   $75
         LDA   L08F3,X
         STA   $76
         LDA   $4B
         CLC
         ADC   L08F6,X
         STA   $4E
         LDA   $4C
         ADC   L08F5,X
         STA   $4F
         LDA   $4D
         ADC   L08F4,X
         STA   $50
         RTS

*-----------------------
* POP
*-----------------------

L8C3B    BNE   L8C75
         LDX   $09
         LDA   L08F1,X
         BNE   L8C49
         LDX   #$0E
         BRL   L3FA4
L8C49    CMP   #$DC
         BEQ   L8C56
         CMP   #$DA
         BEQ   L8C56
L8C51    LDA   #$89
L8C53    JSR   L8B9F
L8C56    TXA
         CLC
         ADC   #$06
         STA   $09
         RTS

L8C5D    JSR   L8C81
L8C60    TYA
         CLC
         ADC   $4E
         STA   $4E
         BCC   L8C75
         LDA   $4F
         LDY   $4D
         ADC   #$00
         STA   $4F
         BNE   L8C75
         INY
         STY   $4D
L8C75    RTS

L8C76    BRL   L6356

*-----------------------
* THEN / ELSE / DATA / IMAGE
*-----------------------

L8C79    JSR   L8057

*-----------------------
* REM
*-----------------------

L8C7C    JSR   L8C85
L8C7F    BRA   L8C60
L8C81    LDX   #$3A
         BRA   L8C87
L8C85    LDX   #$00
L8C87    STX   $0C
         LDY   #$00
         STY   $0D
L8C8D    LDA   $0D
         LDX   $0C
         STA   $0C
         STX   $0D
L8C95    LDA   [$4E],Y
         BEQ   L8C75
         BMI   L8CAC
         CMP   $0D
         BEQ   L8C75
         BRA   L8CA5
L8CA1    INY
L8CA2    INY
L8CA3    INY
L8CA4    INY
L8CA5    INY
         CMP   #$22
         BNE   L8C95
         BEQ   L8C8D
L8CAC    CMP   #$DF
         BCC   L8CA5
         BEQ   L8CA4
         CMP   #$F0
         BCC   L8CA4
         CMP   #$FA
         BCC   L8CA5
         BEQ   L8CA3
         CMP   #$FC
         BCC   L8CA2
         BEQ   L8CA1
         CMP   #$FF
         BEQ   L8CA3
         TYA
         SEC
         ADC   #$08
         TAY
         BRA   L8C95
L8CCD    BRL   L8123
L8CD0    BRL   L8145
L8CD3    BRL   L8157
L8CD6    BRL   L813A
L8CD9    BRL   L812E

*-----------------------
* ON
*-----------------------

L8CDC    CMP   #$80
         BCC   L8D0F
         CMP   #$94
         BEQ   L8CD3
         CMP   #$95
         BEQ   L8CD6
         CMP   #$86
         BEQ   L8CD9
         CMP   #$DF
         BNE   L8D08
         LDA   #$F0
         JSR   L80A8
         BEQ   L8CD0
         LDA   #$F1
         JSR   L80A8
         BNE   L8D01
         BRL   L8194
L8D01    LDA   #$EF
         JSR   L80A8
         BEQ   L8CCD
L8D08    CMP   #$FF
         BNE   L8D0F
         JMP   L1928

L8D0F    JSR   L73D3
         PHA
         CMP   #$89
         BEQ   L8D1E
         CMP   #$8A
         BEQ   L8D1E
         BRL   L8C76
L8D1E    DEC   L0AF0
         BNE   L8D38
         PLA
         CMP   #$89
         BNE   L8D44
         JSR   L803D
         JSR   L8C5D
         JSR   L8AD8
         JSR   L804A
         JSR   L8D44
         RTS

L8D38    JSR   L3CBE
         JSR   L3AF0
         CMP   #$2C
         BEQ   L8D1E
         PLA
         RTS

L8D44    JSR   L3CBE
         PHP
         CMP   #$FB
         BNE   L8D4F
         BRL   L8B3D
L8D4F    PLP
         JSR   L3AF0
         BRL   L8B65

*-----------------------
* NEXT
*-----------------------

L8D56    BNE   L8D5E
         STZ   $85
         STZ   $84
         BRA   L8D73
L8D5E    JSR   L649E
         LDX   #$84
         LDA   $D3
         BPL   L8D6A
         BRL   L6548
L8D6A    JSR   L603D
         LDA   $0F
         ORA   $D3
         STA   $C6
L8D73    LDY   #$00
         JSR   L8FCC
         BEQ   L8D7E
         TAX
         BRL   L3FA4
L8D7E    STX   $09
         PLA
         PLA
         LDA   $C6
         AND   #$0F
         XBA
         TXA
         CLC
         ADC   #$0A
         CLC
         LDY   #>L08F0
         ADC   #L08F0
         BCC   L8D93
         INY
L8D93    LDX   #^L08F0
         JSR   LDEBD
         LDA   #$40
         BIT   $BA
         BMI   L8D9F
         ASL
L8D9F    PHA
         LDA   #$FF
         STA   $86
         LDX   #$84
         JSR   L603B
         LDA   $C6
         AND   #$0F
         JSR   LDE73
         JSR   LD821
         JSR   L5E13
         LDA   $C6
         AND   #$0F
         XBA
         LDA   $09
         CLC
         LDY   #>L0902
         LDX   #^L0902
         ADC   #L0902
         BCC   L8DC7
         INY
L8DC7    JSR   LDEBD
         JSR   LDB86
         TXA
         LDX   $09
         CMP   #$01
         BEQ   L8DD9
         SEC
         SBC   $01,S
         BNE   L8DED
L8DD9    PLA
         TXA
         CLC
         ADC   #$19
         STA   $09
         JSR   L3CC8
         CMP   #$2C
         BNE   L8E0E
         JSR   L3CBE
         JSR   L8D5E
L8DED    PLA
         LDA   L08F5,X
         STA   $75
         LDA   L08F6,X
         STA   $76
         LDA   L08F9,X
         CLC
         ADC   $4B
         STA   $4E
         LDA   L08F8,X
         ADC   $4C
         STA   $4F
         LDA   $4D
         ADC   L08F7,X
         STA   $50
L8E0E    BRL   L3BEF

*-----------------------
* IF
*-----------------------

L8E11    LDA   #$01
         STA   $DD
         JSR   L60A1
         BIT   $A5
         BPL   L8E26
         LDA   [$A6]
         PHA
         JSR   L72CA
         PLY
         JSR   L7A91
L8E26    LDA   [$4E]
         BNE   L8E47
         LDY   #$01
         LDA   [$4E],Y
         TAY
         INY
         LDA   [$4E],Y
         BNE   L8E37
L8E34    BRL   L6356
L8E37    TYA
         CLC
         ADC   #$03
         TAY
         LDA   [$4E],Y
         CMP   #$8C
         BNE   L8E34
         JSR   L8C60
         BRA   L8E26
L8E47    CMP   #$8A
         BEQ   L8E52
         CMP   #$8C
         BNE   L8E34
         JSR   L6306
L8E52    LDA   $A9
         BNE   L8E95
         LDA   #$8D
         STA   $0D
         LDA   #$C4
         STA   $0C
L8E5E    LDX   #$FF
         JSR   L8EDD
         BCS   L8E87
         BEQ   L8E81
         INY
         REP   #$30
         LDA   [$4E],Y
         STA   $75
         SEP   #$30
         INY
         INY
         LDA   [$4E],Y
         CMP   #$8D
         BEQ   L8E84
         CMP   #$8C
         BNE   L8E81
         JSR   L8C60
         BRA   L8E89
L8E81    BRL   L6363
L8E84    JSR   L8C60
L8E87    DEC   $DD
L8E89    JSR   L6306
         LDA   $0B
         CLC
         ADC   $DD
         STA   $DD
         BNE   L8E5E
L8E95    JSR   L3CC8
         BCC   L8EB4
         TAX
         BMI   L8EA9
         JSR   L6638
         BCC   L8EB7
         JSR   L8EBF
         BCC   L8EB7
         BRA   L8EB1
L8EA9    CMP   #$FF
         BEQ   L8EB7
         CMP   #$E0
         BCC   L8EB7
L8EB1    JSR   L3CC8
L8EB4    BRL   L8B5A
L8EB7    PLA
         PLA
         JSR   L6363
         BRL   L3C08
L8EBF    LDY   #$00
L8EC1    INY
         LDA   [$4E],Y
         BEQ   L8ED9
         JSR   L4F80
         BCS   L8EC1
         CMP   #$3A
         BEQ   L8EDA
         CMP   #$3B
         BEQ   L8ED7
         CMP   #$2C
         BNE   L8EDB
L8ED7    ORA   #$00
L8ED9    SEC
L8EDA    RTS

L8EDB    CLC
         RTS

L8EDD    STZ   $0B
         LDY   #$00
         LDA   [$4E],Y
         BEQ   L8EE9
         BPL   L8EFC
         BRA   L8EFD
L8EE9    INY
         JSR   L8C60
         LDA   [$4E]
         TAY
         LDA   [$4E],Y
         BEQ   L8F15
         TXA
         BMI   L8F15
         JSR   L8C60
         LDY   #$02
L8EFC    INY
L8EFD    LDA   [$4E],Y
         BEQ   L8EE9
         BPL   L8EFC
         CMP   #$DF
         BEQ   L8F35
         BCS   L8F17
         CMP   $0D
         BEQ   L8F38
         CMP   $0C
         BNE   L8EFC
         INC   $0B
         BNE   L8EFC
L8F15    CLC
         RTS

L8F17    CMP   #$F0
         BCC   L8F35
         CMP   #$FA
         BCC   L8EFC
         BEQ   L8F34
         CMP   #$FC
         BCC   L8F33
         BEQ   L8F32
         CMP   #$FF
         BEQ   L8F34
         TYA
         CLC
         ADC   #$08
         TAY
         BRA   L8EFC
L8F32    INY
L8F33    INY
L8F34    INY
L8F35    INY
         BRA   L8EFC
L8F38    JSR   L8C60
         SEC
         RTS

L8F3D    LDA   #$8E
         STA   $0D
         LDA   #$8B
         STA   $0C
         STZ   $DD
L8F47    LDX   #$00
         JSR   L8EDD
         LDA   $DD
         BMI   L8FAD
         BCC   L8FBE
         CLC
         ADC   $0B
         STA   $DD
         DEC   $DD
         BMI   L8F78
L8F5B    LDA   [$4E]
         BMI   L8F69
         JSR   L3CBE
         BEQ   L8FC8
         JSR   L6638
         BCC   L8FC8
L8F69    JSR   L3CBE
         BEQ   L8F47
         CMP   #$2C
         BNE   L8F69
         DEC   $DD
         BPL   L8F5B

*

         BRA   L8F81
L8F78    JSR   L3CBE
         BEQ   L8FCB
         LDY   #$FF
         BRA   L8F8A
L8F81    LDY   #$FF
L8F83    STZ   $0B
         JSR   L3CBE
         BEQ   L8F8F
L8F8A    JSR   L664D
         STA   $0B
L8F8F    INY
         LDA   [$44],Y
         JSR   L664D
         CMP   $0B
         BEQ   L8F83
         CMP   #$3D
         BEQ   L8FA3
         LDX   $0B
         BEQ   L8F47
         BRA   L8F69
L8FA3    LDA   $0B
         BEQ   L8FCB
         CMP   #$2C
         BEQ   L8FCB
         BRA   L8F47
L8FAD    DEC   $DD
         LDA   $0B
         BNE   L8FBE
         LDA   $DD
         CMP   #$F6
         BCC   L8FBE
         JSR   L3CBE
         BNE   L8F8A
L8FBE    LDX   #$2F
         JMP   L3FA4      ;BRL L3FA4
         JSR   L3CBE
         BEQ   L8FCB
L8FC8    BRL   L6356
L8FCB    RTS

L8FCC    LDX   $09
L8FCE    JSR   L900D
         BEQ   L8FEC
         LDA   L08F1,X
         BEQ   L8FE3
         CMP   #$8B
         BNE   L8FE6
         TXA
         CLC
         ADC   #$19
         TAX
         BRA   L8FCE
L8FE3    LDA   #$01
         RTS

L8FE6    CMP   #$89
         BNE   L8FED
         LDA   #$41
L8FEC    RTS

L8FED    CMP   #$88
         BNE   L8FF4
L8FF1    LDA   #$3F
         RTS

L8FF4    CMP   #$87
         BEQ   L8FF1
         CMP   #$DA
         BEQ   L9000
         CMP   #$DC
         BNE   L900A
L9000    TYA
         BNE   L8FEC
         TXA
         CLC
         ADC   #$06
         TAX
         BRA   L8FCE
L900A    JSR   L3F4C
L900D    LDA   L08F1,X
         CMP   #$8B
         BNE   L9026
         LDA   $84
         ORA   $85
         BEQ   L9027
         LDA   $85
         CMP   L08F4,X
         BNE   L9026
         LDA   $84
         CMP   L08F3,X
L9026    RTS

L9027    LDA   L08F3,X
         STA   $84
         LDA   L08F4,X
         STA   $85
         LDA   L08F2,X
         PHA
         AND   #$40
         STA   $D3
         PLA
         STA   $C6
         CMP   $C6
L903E    RTS

L903F    LDA   $4B
         LDX   $4C
L9043    LDY   $4D
L9045    STY   $99
         STX   $98
         STA   $97
         LDA   $30
         ORA   $31
         BEQ   L907F
L9051    SEP   #$30
         LDA   [$97]
         TAY
         LDA   [$97],Y
         TAX
         BEQ   L907B
         INY
         REP   #$30
         LDA   [$97],Y
         DEY
         CMP   $30
         BCS   L9079
         TXA
         ADC   $97
         BCC   L906D
         INC   $99
         CLC
L906D    STY   $97
         ADC   $97
         STA   $97
         BCC   L9051
         INC   $99
         BRA   L9051
L9079    BEQ   L907C
L907B    CLC
L907C    SEP   #$30
         RTS

L907F    LDA   [$97]
         TAY
         CMP   L03D3
         BNE   L9097
L9087    DEY
         BEQ   L90B6
         LDA   [$97],Y
         JSR   L664D
         CMP   L03D3,Y
         BEQ   L9087
         LDY   L03D3
L9097    LDA   [$97],Y
         BEQ   L90B5
         REP   #$31
         AND   #$00FF
         ADC   $97
         BCC   L90A7
         INC   $99
         CLC
L90A7    STY   $97
         ADC   $97
         STA   $97
         SEP   #$30
         BCC   L907F
         INC   $99
         BRA   L907F
L90B5    CLC
L90B6    RTS

*-----------------------
* MENUDEF
*-----------------------

L90B7    JSR   L8057
         JSR   L73D3
         TXA
         BMI   L910B
         ASL
         STA   $DD
L90C3    JSR   L6346
         CMP   #$FB
         BNE   L90F2
         LDY   #$03
         LDA   [$4E],Y
         LDX   $DD
         LDY   #$01
         REP   #$30
         ORA   #$FF00
         STA   L15EB,X
         STA   L11EB,X
         LDA   [$4E],Y
         STA   L13EB,X
         LDA   #$0004
         CLC
         ADC   $4E
         STA   $4E
         SEP   #$30
         BCC   L9100
         INC   $50
         BRA   L9100
L90F2    JSR   L9113
         LDX   $DD
         REP   #$30
         LDA   $30
         STA   L11EB,X
         SEP   #$30
L9100    JSR   L3CC8
         BEQ   L9137
         INC   $DD
         INC   $DD
         BNE   L90C3
L910B    BRL   L6708
L910E    SEP   #$30
         JMP   L3BA0      ;BRL L3BA0
L9113    CMP   #$F0
         BNE   L911F
         JSR   L6306
         STZ   $30
         STZ   $31
         RTS

L911F    JSR   L3AED
         JSR   L903F
         BCC   L910E
         LDA   [$97]
         TAY
         INY
         REP   #$30
         LDA   $30
         BNE   L9135
         LDA   [$97],Y
         STA   $30
L9135    SEP   #$30
L9137    RTS

*-----------------------
* EVENTDEF
*-----------------------

L9138    JSR   L8057
         JSR   L73D3
         TXA
         BMI   L910B
         ASL
         STA   $DD
L9144    JSR   L6346
         CMP   #$FB
         BNE   L9173
         LDY   #$03
         LDA   [$4E],Y
         LDX   $DD
         LDY   #$01
         REP   #$30
         ORA   #$FF00
         STA   L14EB,X
         STA   L10EB,X
         LDA   [$4E],Y
         STA   L12EB,X
         LDA   #$0004
         CLC
         ADC   $4E
         STA   $4E
         SEP   #$30
         BCC   L9181
         INC   $50
         BRA   L9181
L9173    JSR   L9113
         LDX   $DD
         REP   #$30
         LDA   $30
         STA   L10EB,X
         SEP   #$30
L9181    JSR   L3CC8
         BEQ   L9137
         INC   $DD
         INC   $DD
         BNE   L9144
L918C    BRL   L6708

*-----------------------
* TASKPOLL
*-----------------------

L918F    JSR   L8057
         CMP   #$8F
         BNE   L919F
         JSR   L6306
         LDA   #$C0
         TRB   L10CF
         RTS

L919F    CMP   #$90
         BNE   L91B8
         JSR   L6306
         LDA   L10CF
         BIT   #$20
         BNE   L91B2
         LDX   #$50
         JMP   L3FA4      ;BRL L3FA4
L91B2    LDA   #$C1
         TSB   L10CF
         RTS

L91B8    CMP   #$98
         BNE   L9201
         JSR   L6306
         JSR   L60AB
         JSR   LE440
         REP   #$30
         LDA   L0AF0
         STA   L10E7
         LDA   L0AF2
         STA   L10E9
         SEP   #$30
         JSR   L6346
         JSR   L60AB
         JSR   LE440
         REP   #$30
         LDA   L0AF0
         STA   L10D1
         PEA   $0000
         _WindStatus
         BCC   L91F7
         CMP   #$0003
         BCS   L9202
L91F7    PLA
         SEP   #$30
         BEQ   L9201
         LDA   #$20
         STA   L10CF
L9201    RTS

L9202    JMP   L3F6A      ;BRL L3F6A

L9205    TAX
         BPL   L920D
         LDX   #$47
         JMP   L3FA4      ;BRL L3FA4
L920D    ASL
         TAX
         REP   #$30
         LDA   L10EB,X
         BNE   L9248
         CPX   #$0022
         BEQ   L9233
         SEP   #$30
         RTL

L921E    REP   #$30
         PEA   $0000
         LDA   L10E5
         PHA
         Tool  $2C14      ; LOGO - LineEdit does not have such a tool call
         SEP   #$30
         RTL

         REP   #$30
L9233    LDA   L10E3
         CMP   #$0100
         BCC   L921E
         AND   #$007F
         ASL
         ORA   #$0100
         TAX
         LDA   L10EB,X
         BEQ   L921E

L9248    LDA   L14EB,X
         BPL   L9274
         PHX
         SEP   #$30
         JSR   L8AD8
         REP   #$30
         PLX
         LDA   L10EB,X
         STA   $75
         LDA   L12EB,X
         STA   $4E
         LDA   L14EB,X
         SEP   #$30
         STA   $50
L9267    JSR   L81CE
         LDA   #$80
         TRB   L10CF
         JMP   L3C4A      ;BRL L3C4A
         REP   #$30
L9274    LDA   L10EB,X
         STA   $30
         PHX
         SEP   #$30
         JSR   L903F
         BCS   L9286
         LDX   #$4F
         JMP   L3FA4      ;BRL L3FA4
L9286    JSR   L8AD8
         LDA   [$97]
         INC
         INC
         CLC
         ADC   $97
         STA   $4E
         REP   #$30
         LDA   $98
         BCC   L9299
         INC
L9299    STA   $4F
         SEP   #$30
         JSR   L81CE
         LDA   $50
         REP   #$30
         PLX
         ORA   #$FF00
         STA   L14EB,X
         LDA   $4E
         STA   L12EB,X
         LDA   $30
         STA   $75
         SEP   #$30
         BRA   L9267
L92B8    LDA   #$01
         TRB   L10CF
         BEQ   L92D3
L92BF    REP   #$30
         LDY   #$0100
         LDA   #$0000
L92C7    STA   L14E9,Y
         STA   L15E9,Y
         DEY
         DEY
         BNE   L92C7
         SEP   #$30
L92D3    RTS

*-----------------------
* TASKREC%()
*-----------------------

L92D4    JSR   L73D6
         CPX   #$0D
         BCS   L92E7
         TXA
         ASL
         TAX
         LDY   L10D1,X
         LDA   L10D2,X
         BRL   L790C
L92E7    BRL   L6708

*-----------------------
* TASKREC@()
*-----------------------

L92EA    JSR   L73D6
         CPX   #$0C
         BCS   L92E7
         TXA
         ASL
         TAX
         REP   #$30
         LDA   L10D3,X
         STA   L0AF2
         LDA   L10D1,X
         STA   L0AF0
         SEP   #$30
         BRL   L78F3
L9307    JSR   L93A6
         JSR   L3CC8
L930D    BEQ   L933A
L930F    BEQ   L9362
         LDA   #$80
         JSR   L80A8
         BEQ   L9377
         LDA   #$82
         JSR   L80A8
         CLC
         BEQ   L9377
         CMP   #$2C
         BEQ   L936A
         CMP   #$3B
         BNE   L932B
         BRL   L9398
L932B    JSR   L60A1
         BIT   $A5
         BMI   L9307
         JSR   LE658
         JSR   L6E5F
         BRA   L9307
L933A    LDA   #$0D
         JSR   LA9B4
         STX   $BE
         STY   $0E
         LDX   $18
         BPL   L9349
         LDX   $19
L9349    LDY   L1D11,X
         LDA   L06F0,Y
         BMI   L935A
         BIT   #$01
         BEQ   L935A
         LDA   #$0A
         JSR   LA9B4
L935A    LDX   #$00
         STX   $2F
         LDX   $BE
         LDY   $0E
L9362    RTS

L9363    BIT   $A5
         BPL   L9362
         BRL   L72CA
L936A    LDA   $2F
         ADC   #$0F
         AND   #$F0
         SEC
         SBC   $2F
         TAX
         BRL   L939E
L9377    PHP
         JSR   L73D0
         STX   $BE
         JSR   L6332
         JSR   L6363
         PLP
         LDX   $BE
         BCC   L9394
         BNE   L938D
         BRL   L74DA
L938D    DEX
         TXA
         SBC   $2F
         BCC   L9398
         TAX
L9394    INX
L9395    DEX
         BNE   L939E
L9398    JSR   L3CBE
         BRL   L930F
L939E    JSR   LA9B2
         BRA   L9395
L93A3    JSR   L6E5F
L93A6    JSR   L6D61
         TAX
L93AA    TXA
         BEQ   L93B6
         CLC
         ADC   $2F
         STA   $2F
         TXA
         JSR   LAA74
L93B6    BRL   L9363
L93B9    LDA   #$3F
L93BB    BRL   LA9B4

*-----------------------
* PRINT
*-----------------------

L93BE    CMP   #$23
         BEQ   L93D0
         BIT   $18
         BPL   L93EE
         JSR   L7BDC
         LDA   L16FD
         STA   $2F
         BRA   L93EE
L93D0    STZ   $E8
         JSR   LB71C
         JSR   LB8A2
         JSR   LB5C6
         JSR   LB7D4
         LDA   $1B
         STA   $18
         JSR   L3CC8
         BEQ   L93F5
         CMP   #$3B
         BNE   L93EE
         JSR   L3CBE
L93EE    LDA   #$83
         JSR   L80A8
         BEQ   L943D
L93F5    JSR   L3CC8
         BRL   L930D
L93FB    STA   $40
         STY   $41
         STX   $42
L9401    LDY   #$FF
L9403    INY
         LDA   [$40],Y
         BNE   L9403
         TYA
         TAX
         LDA   #$00
         STA   $A5
         STZ   $A4
         BRL   L93AA
L9413    LDA   #$20
L9415    PHA
         LDA   L0B1A
         BEQ   L9436
         CLC
         SBC   $2F
         BEQ   L9422
         BCS   L9436
L9422    JSR   L933A
L9425    JSR   LA9B2
         LDA   $1D
         CMP   $2F
         BCS   L9425
         CMP   L0B1A
         BCC   L9436
         BRL   L82F8
L9436    PLA
         BRL   LA9B4
L943A    BRL   L6356
L943D    JSR   L959B
         JSR   L3CC8
         CMP   #$3B
         BNE   L943A
         LDX   #$FF
         STX   $AD
         JSR   L96DC
         BEQ   L943A
         STX   $AD
         INX
         STX   $AE
         JSR   L6306
L9458    JSR   L3CC8
         BNE   L9461
         LDA   #$00
         BRA   L946E
L9461    CMP   #$2C
         BNE   L946A
         JSR   L6306
         BRA   L9458
L946A    CMP   #$3B
         BNE   L9495
L946E    STA   $A3
         TAX
         BEQ   L947B
         JSR   L3CBE
         BEQ   L947B
         BRL   L6356
L947B    LDA   #$20
         JSR   L6E01
         JSR   L9643
         JSR   L96C0
         DEC   $B3
         BEQ   L948D
         BRL   L9589
L948D    LDA   $A3
         BNE   L9494
         BRL   L933A
L9494    RTS

L9495    LDA   $AD
         PHA
         LDA   $2E
         PHA
         LDA   $BB
         PHA
         LDA   $BC
         PHA
         LDA   $AE
         PHA
         LDA   #$00
         PHA
         LDA   #$C5
         JSR   L80A8
         BNE   L94CC
         JSR   L3CBE
         JSR   L7414
         PLA
         PHX
         JSR   L6346
         JSR   L60A1
         JSR   L6332
         BEQ   L94CF
         CMP   #$2C
         BEQ   L94CF
         CMP   #$3B
         BEQ   L94CF
         BRL   L6356
L94CC    JSR   L60A1
L94CF    BIT   $A5
         BPL   L94DA
         JSR   L6D61
         STA   $B5
         BRA   L9549
L94DA    LDX   #$1C
         REP   #$30
         STX   L0331
         STZ   L032F
         LDA   $A2
         PEA   ^L032F
         PEA   L032F
         PEI   $A1
         PEI   $9F
         PEA   ^L034D
         PEA   L034D
         ORA   #$000B
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         LDX   L0351
         CPX   #$1C
         BEQ   L952B
         LDA   L0352
         CMP   #$30
         BEQ   L951F
         CMP   #$49
         BEQ   L951C
         CMP   #$4E
         BEQ   L951C
         JSR   L3F4C
L951C    STZ   L0351
L951F    REP   #$30
         LDA   #$FFE4
         STA   L034F
         SEP   #$30
         LDX   #$1C
L952B    STZ   L039E,X
L952E    DEX
         BMI   L953B
         LDA   L0352,X
         AND   #$0F
         STA   L039D,X
         BRA   L952E
L953B    REP   #$30
         LDA   #$001C
         CLC
         ADC   L034F
         STA   L034F
         SEP   #$30
L9549    STZ   L033E
         PLA
         STA   L033D
         BPL   L9555
         DEC   L033E
L9555    PLA
         STA   $AE
         PLA
         STA   $BC
         PLA
         STA   $BB
         PLA
         STA   $2E
         PLA
         STA   $AD
         LDA   #$20
         JSR   L6E01
L9569    JSR   L9643
         LDX   $B3
         BEQ   L957A
         BMI   L957A
         LDA   $AE
         BEQ   L9586
         STA   $AD
         BRA   L9569
L957A    LDA   #$FF
         STA   $AE
         SEC
         LDA   $A5
         TAX
         EOR   $B3
         BPL   L958C
L9586    JSR   L96C0
L9589    JMP   L3F9E      ;BRL L3F9E
L958C    TXA
         BPL   L9592
         BRL   L9669
L9592    JSR   L99CB
L9595    JSR   L96C0
         BRL   L9458
L959B    JSR   L3CBE
         BCC   L9601
         BMI   L9601
         CMP   #$22
         BEQ   L95D3
         JSR   L6638
         BCC   L95FB
         JSR   L8EBF
         BCS   L9601
         LDX   #$FF
         JSR   L64AA
         LDX   $0F
         CPX   #$07
         BNE   L95FB
         STA   $40
         STY   $41
         LDA   $24
         STA   $42
         JSR   L6D7E
         STA   $2E
         STX   $BB
         STY   $BC
         LDA   $42
         STA   $BD
         BRL   L9642
L95D3    LDY   #$00
L95D5    JSR   L3CBE
         BEQ   L95FB
         CPY   #$00
         BNE   L95EA
         LDX   $4E
         STX   $BB
         LDX   $4F
         STX   $BC
         LDX   $50
         STX   $BD
L95EA    CMP   #$22
         BEQ   L95F1
         INY
         BNE   L95D5
L95F1    STY   $2E
         TYA
         BEQ   L95FB
         JSR   L3CBE
         BNE   L9642
L95FB    BRL   L6356
L95FE    BRL   L8BE9
L9601    JSR   L3AED
         LDA   $50
         PHA
         REP   #$30
         LDA   $4E
         PHA
         SEP   #$30
         JSR   L8B65
         LDA   [$97]
         CLC
         ADC   #$03
         TAY
         JSR   L8C60
         JSR   L3CBE
         TAX
         CPX   #$CB
         BNE   L95FE
         JSR   L3CBE
         BEQ   L95FE
         LDA   $4E
         STA   $BB
         LDA   $4F
         STA   $BC
         LDA   $50
         STA   $BD
         JSR   L8C85
         STY   $2E
         REP   #$30
         PLA
         STA   $4E
         SEP   #$30
         PLA
         STA   $50
L9642    RTS

L9643    LDY   #$1F
         LDA   #$00
L9647    STA   [$66],Y
         DEY
         BPL   L9647
         JSR   L975B
         BIT   $B3
         BMI   L9654
L9653    RTS

L9654    BVS   L9653
L9656    LDY   #$00
         LDX   $2D
L965A    LDA   [$97],Y
         JSR   LA9B4
         INY
         DEX
         BNE   L965A
         DEC   $0B
         BNE   L9656
         BRA   L9643
L9669    LDA   $B5
         STA   $2D
         LDA   $0B
         SEC
         SBC   $2D
         BEQ   L969F
         BCS   L967C
         LDX   $0B
         STX   $2D
         BRA   L969F
L967C    LDY   $AA
         CPY   #$41
         BEQ   L969F
         CPY   #$61
         BEQ   L969F
         CPY   #$43
         BEQ   L968E
         CPY   #$63
         BNE   L9693
L968E    LDX   $2D
         BEQ   L9693
         LSR
L9693    TAX
         INX
L9695    DEX
         BEQ   L969F
         JSR   LA9B2
         DEC   $0B
         BNE   L9695
L969F    LDY   #$00
         LDX   $2D
         BEQ   L96B0
L96A5    LDA   [$40],Y
         JSR   LA9B4
         INY
         DEC   $0B
         DEX
         BNE   L96A5
L96B0    LDX   $0B
L96B2    BEQ   L96BA
         JSR   LA9B2
         DEX
         BRA   L96B2
L96BA    JSR   L72CA
         BRL   L9595
L96C0    LDA   #$20
         LDY   $67
         LDX   $66
         STX   $40
         STY   $41
         LDX   $68
         STX   $42
         BRL   L6D9F
L96D1    PLA
L96D2    JSR   L96DC
         PHP
         CMP   #$20
         BEQ   L96D1
         PLP
         RTS

L96DC    INC   $AD
L96DE    LDY   $AD
         LDA   #$00
         CPY   #$FF
         BNE   L96EA
         DEC   $AD
         BRA   L9706
L96EA    CPY   $2E
         BCS   L9706
         LDA   [$BB],Y
         CMP   #$2C
         BEQ   L9707
         CMP   #$41
         BCC   L96FC
         CMP   #$5B
         BCC   L9709
L96FC    CMP   #$3A
         BCS   L9706
         SEC
         SBC   #$30
         SEC
         SBC   #$D0
L9706    TAY
L9707    CLV
         RTS

L9709    SEP   #$40
         CMP   #$40
         RTS

L970E    LDY   $B9
         INY
         CPY   #$20
         BCS   L971A
         STA   [$66],Y
         STY   $B9
         RTS

L971A    BRL   L6356
L971D    PHA
         LDY   $B4
         BEQ   L9753
         LDX   #$01
         LDA   #$04
         BIT   $B7
         PHP
         BNE   L9736
         LDA   $B6
         CMP   #$41
         BNE   L9735
         LDA   $B8
         BNE   L971A
L9735    DEX
L9736    TYA
         STA   $AB,X
         LDX   $B6
         BEQ   L971A
         CPX   #$44
         BNE   L9745
         CMP   #$05
         BCC   L971A
L9745    LDA   #$00
L9747    JSR   L970E
         DEC   $B4
         BNE   L9747
         PLP
         BNE   L9753
         STY   $BE
L9753    LDY   #$02
         LDA   #$00
         STA   $B6
         PLA
         RTS

L975B    LDY   #$01
         STY   $B3
         STZ   $BF
         STZ   $AB
         STZ   $AC
         STZ   $B8
         STZ   $B4
         STZ   $B7
         STZ   $B6
         LDY   #$FF
         STZ   L0339
         STY   $BE
         STY   $B9
         JSR   L993C
         BPL   L97E0
         STA   $B3
         BIT   $B3
         BVS   L97B7
         LDA   $AA
         CMP   #$2F
         BEQ   L97C0
         CMP   #$58
         BEQ   L97CA
         CMP   #$78
         BEQ   L97CA
         LDA   $AD
         SEC
         ADC   $BB
         LDX   $BD
         LDY   $BC
         BCC   L979E
         INY
         BNE   L979E
         INX
L979E    STA   $97
         STY   $98
         STX   $99
         LDX   #$FF
L97A6    INX
         JSR   L96DC
         CMP   #$00
         BEQ   L97BD
         CMP   #$22
         BNE   L97A6
         STX   $2D
         JSR   L96D2
L97B7    JSR   L96DE
         BNE   L97BD
         RTS

L97BD    BRL   L6356
L97C0    LDA   #$0A
         STA   $0D
         LDY   #$02
         LDA   #$0D
         BRA   L97CE
L97CA    LDA   #$20
         LDY   #$01
L97CE    STA   $0C
         LDX   #$00
         STX   $99
         LDX   $05
         LDA   #$0C
         STA   $97
         STX   $98
         STY   $2D
         BRA   L97B7
L97E0    LDY   #$02
         CMP   #$02
         BNE   L982F
         CPY   $0B
         BNE   L9858
         LDA   #$10
         STA   $B8
         LDA   $AA
         STA   $BF
         JSR   L990E
         BRA   L982F
L97F7    CMP   #$10
         BEQ   L97FC
         RTS

L97FC    BIT   $B7
         BNE   L9858
         ORA   $B7
         STA   $B7
         CPY   $0B
         BNE   L980E
         LDA   $B8
         BNE   L9858
         BRA   L9817
L980E    DEY
         CPY   $0B
         BNE   L9858
         LDA   $B8
         BEQ   L9827
L9817    CMP   #$40
         LDA   #$20
         BCC   L981F
         LDA   #$80
L981F    ORA   $B8
         STA   $B8
         INC   $B9
         BRA   L982C
L9827    LDA   $AA
         JSR   L970E
L982C    BRL   L990E
L982F    JSR   L97F7
         BIT   #$20
         BEQ   L9863
         ORA   $B7
         STA   $B7
         CPY   $0B
         BNE   L9844
         LDA   $B8
         BNE   L9858
         BRA   L984D
L9844    DEY
         CPY   $0B
         BNE   L9858
         LDA   $B8
         BEQ   L985B
L984D    LDA   #$40
         ORA   $B8
         STA   $B8
         INC   $B9
         BRL   L9860
L9858    BRL   L6356
L985B    LDA   $AA
         JSR   L970E
L9860    JSR   L990E
L9863    JSR   L97F7
L9866    CMP   #$41
         BCC   L98A1
         TAX
         BMI   L9858
         LDA   #$80
         ORA   $B7
         STA   $B7
         LDA   $0B
         CLC
         ADC   $B4
         STA   $B4
         CPX   $B6
         BCS   L9880
         LDX   $B6
L9880    LDA   #$04
         BIT   $B7
         BEQ   L988A
         LDX   #$41
         BRA   L989A
L988A    LDA   $BF
         AND   #$7F
         CMP   #$2A
         BEQ   L9895
         LDA   L1CC8,X
L9895    ORA   L1CCC,X
         STA   $BF
L989A    STX   $B6
L989C    JSR   L9915
         BRA   L9866
L98A1    JSR   L971D
         CMP   #$04
         BNE   L98C1
         BIT   $B7
         BNE   L9858
         DEY
         CPY   $0B
         BNE   L9858
         ORA   $B7
         STA   $B7
         LDA   $AA
         JSR   L970E
         LDA   $B9
         STA   L0339
         BRA   L989C
L98C1    BIT   #$20
         BEQ   L98DA
         DEY
         CPY   $0B
         BNE   L9936
         BIT   $B7
         BNE   L9936
         ORA   $B7
         STA   $B7
         LDA   $AA
         JSR   L970E
         JSR   L9915
L98DA    CMP   #$08
         BNE   L9936
         CPY   $0B
         BCS   L9936
         LDY   #$06
         CPY   $0B
         BCC   L9936
         ORA   $B7
         STA   $B7
         LDA   $AA
L98EE    JSR   L970E
         DEC   $0B
         BNE   L98EE
         LDA   #$F0
         LDX   $AB
         BEQ   L9904
         DEX
         BEQ   L9904
         CPX   #$02
         BNE   L9936
         LDA   #$B0
L9904    AND   $B8
         BNE   L9936
         JSR   L97B7
         JSR   L9920
L990E    JSR   L96DE
         BEQ   L9936
         BRA   L991A
L9915    JSR   L96DE
         BEQ   L9920
L991A    JSR   L993C
         LDY   #$02
         RTS

L9920    LDA   $B7
         BPL   L9936
         JSR   L971D
         LDA   $B8
         BEQ   L992F
         LDA   $AB
         BEQ   L9936
L992F    LDA   #$00
         STA   $B3
         PLA
         PLA
         RTS

L9936    JSR   L96C0
         BRL   L6356
L993C    LDY   #$00
         STY   $AA
         STY   $0B
L9942    JSR   L96D2
         BNE   L994E
         CMP   #$2C
         BEQ   L9942
         PLA
         PLA
         RTS

L994E    BCS   L99A3
         LDX   $AA
         BEQ   L9958
         CPX   #$39
         BNE   L9985
L9958    LDY   $0B
         CPY   #$1A
         BCC   L9964
L995E    JSR   L96C0
         BRL   L6708
L9964    LDX   #$39
         STX   $AA
         TYA
         ASL
         ASL
         ASL
         ADC   $0B
         ADC   $0B
         STA   $0B
         LDY   $AD
         LDA   [$BB],Y
         AND   #$0F
         ADC   $0B
         BCS   L995E
         STA   $0B
L997E    JSR   L96D2
         BEQ   L9987
         BNE   L994E
L9985    DEC   $AD
L9987    LDA   $AA
         CMP   #$5B
         BCC   L998F
         SBC   #$20
L998F    LDY   #$0E
L9991    CMP   L1CEB,Y
         BEQ   L999F
         DEY
         BPL   L9991
L9999    JSR   L96C0
         BRL   L6356
L999F    LDA   L1CFA,Y
         RTS

L99A3    LDY   $AA
         BEQ   L99B1
         CPY   #$39
         BNE   L99BD
         LDY   $0B
         BEQ   L995E
         BNE   L99B5
L99B1    LDY   #$01
         STY   $0B
L99B5    STA   $AA
         CMP   #$22
         BEQ   L9987
         BNE   L997E
L99BD    CMP   $AA
         BNE   L9985
         CMP   #$22
         BEQ   L9999
         INC   $0B
         BNE   L997E
         BRA   L9999
L99CB    INC   $B9
         LDA   L0351
         BNE   L99E0
         LDX   L0352
         LDA   #$3F
         CPX   #$4E
         BEQ   L99DD
         LDA   #$5E
L99DD    BRL   L9A53
L99E0    LDA   L034D
         CMP   #$01
         ROR   L034D
         REP   #$30
         LDA   L034F
         SEC
         SBC   #$0001
         CLC
         ADC   L033D
         STA   L034F
         CMP   #$ECA9
         BCS   L9A0A
         CMP   #$1345
         BCC   L9A0A
         SEP   #$30
         JSR   L96C0
         BRL   L6708
L9A0A    SEP   #$30
         JSR   L9C6D
         LDY   #$00
         STY   $BA
         STY   $B4
         LDA   #$08
         BIT   $B7
         BEQ   L9A1E
         BRL   L9BB2
L9A1E    BIT   $BF
         BPL   L9A39
         LDA   $AB
         AND   #$03
         CMP   #$01
         LDA   $AB
         TAX
         BCC   L9A2F
         SBC   #$01
L9A2F    LSR
         LSR
         STA   $AB
         TXA
         SEC
         SBC   $AB
         STA   $AB
L9A39    LDA   #$FF
         SEC
         SBC   $AC
         TAX
         JSR   L9CD0
         JSR   L9C94
         LDA   L0335
         BIT   L034F
         BMI   L9A5F
         CMP   $AB
         BCC   L9A5F
L9A51    LDA   #$21
L9A53    LDY   $B9
L9A55    DEY
         BMI   L9A5C
         STA   [$66],Y
         BNE   L9A55
L9A5C    BRL   L9B8D
L9A5F    LDA   $AB
         BNE   L9A66
         BRL   L9AEC
L9A66    LDX   #$FF
         LDY   $BE
L9A6A    INX
         CPX   $AB
         BCS   L9AAC

         JSR   L9C4B
         BPL   L9A79
         TXA
         BNE   L9A95
         LDA   #$30
L9A79    BIT   $BF
         BPL   L9A90
         PHA
         LDA   $BA
         CMP   #$03
         BCC   L9A8D
         LDA   #$2C
         STA   [$66],Y
         DEY
         LDA   #$00
         STA   $BA
L9A8D    INC   $BA
         PLA
L9A90    STA   [$66],Y
         DEY
         BPL   L9A6A
L9A95    LDA   #$20
         BIT   $B7
         BNE   L9AAC
         BIT   L034D
         BPL   L9AAC
         TYA
         BMI   L9A51
         LDA   [$66],Y
         BNE   L9A51
         LDA   #$2D
         STA   [$66],Y
         DEY
L9AAC    LDA   $B8
         AND   #$E0
         BEQ   L9ADA
         ASL
         BCC   L9ABC
         TAX
         LDA   #$24
         STA   [$66],Y
         DEY
         TXA
L9ABC    ASL
         BCC   L9AD2
         TAX
         LDA   $B7
         LSR
         LDA   #$2D
         BIT   L034D
         BMI   L9ACE
         BCC   L9AD1
         LDA   #$2B
L9ACE    STA   [$66],Y
         DEY
L9AD1    TXA
L9AD2    ASL
         BCC   L9ADA
         LDA   #$24
         STA   [$66],Y
         DEY
L9ADA    TYA
         BMI   L9AEC
         LDA   $BF
         AND   #$7F
         TAX
L9AE2    LDA   [$66],Y
         BNE   L9AEC
         TXA
         STA   [$66],Y
         DEY
         BPL   L9AE2
L9AEC    LDA   $AC
         BEQ   L9B18
         LDY   L0339
         INY
         LDX   #$00
         TXA
         SEC
         SBC   $AC
         STA   $AC
L9AFC    DEX
         CPX   $AC
         BCC   L9B18
         LDA   #$08
         BIT   $B7
         BNE   L9B10
         JSR   L9C4B
         BPL   L9B13
         LDA   #$30
         BPL   L9B13
L9B10    JSR   L9C63
L9B13    STA   [$66],Y
         INY
         BRA   L9AFC
L9B18    LDA   #$08
         BIT   $B7
         BEQ   L9B8D
         LDY   #$00
L9B20    LDA   [$66],Y
         AND   #$DF
         INY
         CMP   #$45
         BNE   L9B20
         DEY
         STA   [$66],Y
         INY
         LDA   #$2B
         BIT   L0350
         BPL   L9B36
         LDA   #$2D
L9B36    STA   [$66],Y
         PHY
         REP   #$30
         LDA   L0335
         PHA
         PEA   ^L0344
         PEA   L0344
         PEA   $0004
         PEA   $0000
         _Int2Dec
         SEP   #$30
         BCS   L9B77
         LDY   #$04
         LDX   #$00
L9B5A    LDA   L0344,X
         CMP   #$20
         BNE   L9B6A
         DEY
         LDA   #$30
         STA   L0344,X
         INX
         BNE   L9B5A
L9B6A    STY   L0343
         PLY
         TYA
         CLC
         ADC   L0343
         CMP   $B9
         BCC   L9B7A
L9B77    JSR   L9BA4
L9B7A    INY
         STY   $40
         LDY   $B9
         DEY
         LDX   #$04
L9B82    DEX
         LDA   L0344,X
         STA   [$66],Y
         DEY
         CPY   $40
         BCS   L9B82
L9B8D    LDA   #$00
         STA   $A5
         STZ   $A4
         LDA   $66
         STA   $40
         LDA   $67
         STA   $41
         LDA   $68
         STA   $42
         LDX   $B9
         BRL   L93AA
L9BA4    LDA   #$21
         LDX   #$04
         STX   L0343
L9BAB    STA   L0343,X
         DEX
         BNE   L9BAB
         RTS

L9BB2    LDA   $AB
         CLC
         ADC   $AC
         TAX
         JSR   L9CDA
         JSR   L9C94
         LDX   $AB
         BEQ   L9BDA
         DEX
         BNE   L9BE1
         LDY   #$00
         LDA   [$66],Y
         BEQ   L9BCC
         INY
L9BCC    LDA   $AB
         BEQ   L9BDE
         JSR   L9C63
         STA   [$66],Y
         DEC   $AB
         INY
         BNE   L9BCC
L9BDA    SEC
         JSR   L9C94
L9BDE    BRL   L9AEC
L9BE1    REP   #$30
         LDA   L034F
L9BE6    BPL   L9BEE
         CLC
         ADC   #$0003
         BMI   L9BE6
L9BEE    CMP   #$0003
         BCC   L9BF8
         SBC   #$0003
         BNE   L9BE6
L9BF8    STA   L033A
         SEP   #$30
         STA   $AB
         REP   #$30
         LDA   L034F
         SEC
         SBC   L033A
         STA   L034F
         SEP   #$30
         JSR   L9CA6
         LDA   #$02
         SEC
         SBC   $AB
         STA   L033A
         INC   $AB
         LDY   L033A
         LDA   $B8
         BEQ   L9C34
         INC   L033A
         LDA   $B7
         LSR
         LDA   #$2D
         BIT   L034D
         BMI   L9C32
         BCC   L9C34
         LDA   #$2B
L9C32    STA   [$66],Y
L9C34    DEY
         BMI   L9C45
         LDA   $BF
         AND   #$7F
         TAX
L9C3C    LDA   [$66],Y
         BNE   L9C45
         TXA
         STA   [$66],Y
         BNE   L9C3C
L9C45    LDY   L033A
         BRL   L9BCC
L9C4B    JSR   L9CB7
         BMI   L9C56
L9C50    CMP   #$16
         BCC   L9C57
         LDA   #$30
L9C56    RTS

L9C57    TAX
         LDA   L039D,X
         ORA   #$30
         LDX   L0337
         AND   #$7F
         RTS

L9C63    STX   L0337
         LDA   $B4
         INC   $B4
         BRL   L9C50
L9C6D    LDA   #$20
         BIT   $B7
         BEQ   L9C93
         LDY   #$FF
L9C75    INY
         CPY   $B9
         BEQ   L9C93
         LDA   [$66],Y
         CMP   #$2D
         BEQ   L9C88
         CMP   #$2B
         BNE   L9C75
         LDA   #$2B
         BNE   L9C8A
L9C88    LDA   #$20
L9C8A    BIT   L034D
         BPL   L9C91
         LDA   #$2D
L9C91    STA   [$66],Y
L9C93    RTS

L9C94    LDA   #$01
         BCC   L9CA6
         STA   $0B
         REP   #$30
         CLC
         AND   #$00FF
         ADC   L034F
         STA   L034F
L9CA6    REP   #$30
         LDA   L034F
         BPL   L9CB1
         EOR   #$FFFF
         INC
L9CB1    STA   L0335
         SEP   #$30
         RTS

L9CB7    LDA   #$FF
         CPX   #$80
         BCS   L9CBF
         LDA   #$00
L9CBF    XBA
         TXA
         REP   #$30
         STA   L0337
         LDA   L034F
         SEC
         SBC   L0337
         SEP   #$30
         RTS

L9CD0    JSR   L9CB7
         BMI   L9CF8
         CMP   #$16
         BCS   L9CF8
         TAX
L9CDA    LDA   L039D,X
         CMP   #$05
         BCC   L9CF9
         LDA   #$09
         BCS   L9CEB
L9CE5    DEX
         BMI   L9CFA
         LDA   L039D,X
L9CEB    SED
         ADC   #$00
         CLD
         CMP   #$10
         AND   #$0F
         STA   L039D,X
         BCS   L9CE5
L9CF8    CLC
L9CF9    RTS

L9CFA    LDA   #$01
         STA   L039D
         RTS

L9D00    LDA   L1A38+2
         PHA
         REP   #$30
         LDA   L1A38
         DEC
         PHA
         LDX   #L1A3C
         LDY   #^L1A3C
         SEP   #$20
         LDA   L1A82
         XBA
         LDA   L1A80
L9D1A    RTL

         SEP   #$30
L9D1D    STA   L04F9
         TAY
L9D21    DEY
         CPY   #$FF
         BEQ   L9D3B
         LDA   [$40],Y
         STA   L04FA,Y
         BRA   L9D21
L9D2D    LDX   #$00
         STX   L1A7E
         LDX   #$02
         STX   L1A84
         JSL   L9D00
L9D3B    LDX   L1A84
         BEQ   L9D5A
         LDX   L1A86
         LDY   L1A88
         JSR   LA2B4
         LDX   L1A84
         CPX   #$02
         BNE   L9D5A
         LDA   L1A80
         ORA   L1A82
         BNE   L9D83
         BRA   L9D77
L9D5A    JSR   L9D9E
         LDX   L1A84
         BNE   L9D74
         JSR   L9E25
         LDA   L1A43
         BEQ   L9D77
         LDX   #$00
         STZ   L1A80
         STZ   L1A82
         BRA   L9D2D
L9D74    JSR   L9E57
L9D77    JSR   LA319
         LDA   L1A43
         BEQ   L9D83
         BIT   $E7
         BPL   L9D2D
L9D83    JSR   L9F1B
         BMI   L9D77
         BEQ   L9D96
         DEX
         LDA   L1A6E,X
         BEQ   L9D93
         BRL   LA34D
L9D93    BRL   LA340
L9D96    JSR   LA18E
         JSR   L9ED9
         BRA   L9D77
L9D9E    LDX   L1A3F
         CPX   #$FF
         BCC   L9DA8
         DEC   L1A3F
L9DA8    LDAL  $000021
         TAX
         LDAL  $000023
         SEC
         SBC   L1A3E
         TAY
         STX   L1A93
         STY   L1A94
         LDX   L1A3D
         INX
         STX   L1A9D
         STZ   L1A9E
         LDA   L1A93
         STA   L1A9F
         STZ   L1AA0
         LDY   L1A94
         REP   #$20
         LDA   #$0000
L9DD7    CLC
         ADC   L1A9F
         DEY
         BNE   L9DD7
         SEC
         SBC   L1A9D
         STA   L1AA0
         SEP   #$30
         XBA
         BNE   L9DF7
         LDX   L1AA0
         DEX
         DEX
         CPX   L1A3F
         BCS   L9DF7
         STX   L1A3F
L9DF7    LDX   L1A3C
         CPX   L1A3F
         BCS   L9E02
         STX   L1A3F
L9E02    LDA   L04F9
         STA   L1A8E
         CMP   L1A3F
         BEQ   L9E15
         BCC   L9E15
         LDA   L1A3F
         STA   L1A8E
L9E15    CMP   L1A8A
         BCS   L9E1F
         TAX
         INX
         STX   L1A8A
L9E1F    LDA   #$FF
         STA   L1A90
         RTS

L9E25    JSR   LA2AE
         LDA   L1A40
         LDX   #$00
         CMP   #$20
         BCS   L9E32
         INX
L9E32    STX   L1A8C
         LDA   L1A8E
         STA   L1A8D
         STA   L1A8F
         BEQ   L9E4C
         TAY
L9E41    LDA   L04F9,Y
         STA   L1AA2,Y
         DEY
         CPY   #$FF
         BNE   L9E41
L9E4C    JSR   LA26F
         LDX   #$01
         STX   L1A8A
         BRL   LA212
L9E57    JSR   LA26F
         BRL   LA210
L9E5D    LDA   L1A90
         BMI   L9E8F
         BEQ   L9E8A
         JSR   L9ECC
         BNE   L9ECB
         JSR   L9EED
         JSR   LA292
         LDX   L1A47
         LDY   L1A48
         LDA   L1A41
         BEQ   L9E80
         LDX   L1A49
         LDY   L1A4A
L9E80    STX   L1A91
         STY   L1A92
         LDA   #$00
         BRA   L9EC8
L9E8A    JSR   L9ECC
         BNE   L9ECB
L9E8F    JSR   L9ED9
         LDA   L1A41
         BEQ   L9EB1
         LDA   L1A95
         LDX   L1A8A
         CPX   L1A8E
         BEQ   L9EA6
         BCC   L9EA6
         LDA   #$20
L9EA6    JSR   LA2DE
         LDX   L1A47
         LDY   L1A48
         BRA   L9EBF
L9EB1    LDA   #$5F
         STA   L1A96
         JSR   LA294
         LDX   L1A49
         LDY   L1A4A
L9EBF    STX   L1A91
         STY   L1A92
         JSR   LA292
L9EC8    STA   L1A90
L9ECB    RTS

L9ECC    REP   #$30
         LDA   L1A91
         BEQ   L9ED6
         DEC   L1A91
L9ED6    SEP   #$30
         RTS

L9ED9    LDY   L1A8A
         LDA   L04F9,Y
         CPY   L1A3F
         BEQ   L9EE9
         BCC   L9EE9
         LDA   L1A46
L9EE9    STA   L1A95
         RTS

L9EED    LDX   L1A8C
         BEQ   L9F09
         LDX   L1A8E
         CPX   L1A8A
         BCS   L9F07
         CPX   L1A3F
         BEQ   L9F07
         JSR   LA2C4
         LDX   #$01
         BRL   L9F09
L9F07    LDX   #$00
L9F09    STX   L1A9B
         JSR   L9ED9
         JSR   LA294
         LDX   L1A9B
         BEQ   L9F1A
         JSR   LA2D1
L9F1A    RTS

L9F1B    JSR   L9EED
         JSR   LA292
         JSR   L9ED9
         LDA   L1A80
         LDX   L1A82
         JSR   L664D
         LDY   #$FF
L9F2F    INY
         CPY   L1A4D
         BCS   L9F50
         CMP   L1A4E,Y
         BNE   L9F2F
         XBA
         TXA
         AND   L1A4B
         CMP   L1A5E,Y
         BEQ   L9F47
         XBA
         BRA   L9F2F
L9F47    TYX
         INX
         STX   L1A7E
         LDA   L1A80
         RTS

L9F50    TXA
         AND   #$24
         BEQ   L9F82
         CMP   #$20
         LDA   L1A80
         BCS   L9FB8
         CMP   #$08
         BNE   L9F63
         BRL   LA08D
L9F63    CMP   #$15
         BNE   L9F6A
         BRL   LA0C8
L9F6A    CMP   #$3C
         BEQ   L9F72
         CMP   #$2C
         BNE   L9F75
L9F72    BRL   LA079
L9F75    CMP   #$3E
         BEQ   L9F7F
         CMP   #$2E
         BEQ   L9F7F
         BRA   L9FB8
L9F7F    BRL   LA087
L9F82    LDA   L1A80
         CMP   #$05
         BNE   L9F8C
         BRL   LA125
L9F8C    CMP   #$18
         BNE   L9F93
         BRL   LA133
L9F93    CMP   #$19
         BNE   L9F9A
         BRL   LA14A
L9F9A    CMP   #$1A
         BNE   L9FA1
         BRL   LA156
L9FA1    CMP   #$06
         BNE   L9FA8
         BRL   LA074
L9FA8    CMP   #$08
         BEQ   L9FFB
         CMP   #$15
         BEQ   LA015
         CMP   #$7F
         BEQ   LA020
         CMP   #$04
         BEQ   LA020
L9FB8    CMP   #$20
         BCC   L9FC3
         TXA
         AND   #$04
         BNE   L9FEF
         BRA   L9FDA
L9FC3    LDX   L1A42
         BEQ   L9FEF
         LDA   L1A82
         AND   #$64
         CMP   #$60
         BNE   L9FEF
         LDA   L1A80
         CMP   #$11
         BEQ   L9FEF
         LDA   #$80
L9FDA    ORA   L1A80
         LDY   L1A8A
         CPY   L1A3F
         BEQ   L9FEC
         BCC   L9FEC
         JSR   LA333
         BRA   L9FF2
L9FEC    LDX   #$00
         RTS

L9FEF    JSR   LA336
L9FF2    JSR   L9ED9
         LDX   #$FF
         STX   L1A90
         RTS

L9FFB    LDX   #$01
         CPX   L1A8A
         BNE   LA007
         JSR   LA333
         BRA   L9FF2
LA007    JSR   L9EED
         DEC   L1A8A
         JSR   LA292
         JSR   LA294
         BRA   L9FF2
LA015    JSR   LA17C
         JSR   L9EED
         INC   L1A8A
         BRA   L9FF2
LA020    LDX   #$01
         CPX   L1A8A
         BNE   LA02C
         JSR   LA333
         BRA   L9FF2
LA02C    JSR   L9EED
         JSR   LA292
         JSR   LA294
         DEC   L1A8A
LA038    LDY   L1A8A
         INY
LA03C    BEQ   LA050
         CPY   L1A3C
         BEQ   LA047
         BCC   LA047
         BRA   LA050
LA047    LDA   L04F9,Y
         STA   L04F8,Y
         INY
         BRA   LA03C
LA050    DEC   L1A8D
         LDX   L1A8E
         CPX   L1A8D
         BCC   LA071
         BEQ   LA060
         DEC   L1A8E
LA060    LDA   L1A40
         LDY   L1A8C
         BEQ   LA06B
         LDA   L1A97
LA06B    LDY   L1A3C
         STA   L04F9,Y
LA071    BRL   LA144
LA074    JSR   LA17C
         BRA   LA038
LA079    JSR   L9EED
LA07C    LDA   #$01
         STA   L1A8A
         JSR   LA2AE
         BRL   LA147
LA087    JSR   L9EED
         BRL   LA16E
LA08D    JSR   L9EED
         JSR   LA292
         JSR   LA292
         LDY   L1A8A
         DEY
         BEQ   LA0AC
LA09C    LDA   L04F9,Y
         JSR   LA0FB
         BNE   LA0AE
         PHY
         JSR   LA292
         PLY
         DEY
         BNE   LA09C
LA0AC    BRA   LA07C
LA0AE    DEY
         BEQ   LA07C
         LDA   L04F9,Y
         JSR   LA0FB
         BEQ   LA0C0
         PHY
         JSR   LA292
         PLY
         BRA   LA0AE
LA0C0    INY
LA0C1    TYA
         STY   L1A8A
         BRL   L9FF2
LA0C8    JSR   L9EED
         JSR   LA292
         LDY   L1A8A
LA0D1    LDA   L04F9,Y
         JSR   LA0FB
         BEQ   LA0E6
         PHY
         JSR   LA28E
         PLY
         INY
         CPY   L1A8E
         BCC   LA0D1
         BRA   LA0C1
LA0E6    PHY
         JSR   LA28E
         PLY
         INY
         CPY   L1A8E
         BCS   LA0C1
         LDA   L04F9,Y
         JSR   LA0FB
         BEQ   LA0E6
         BRA   LA0C1
LA0FB    CMP   #$20
         BEQ   LA121
         BIT   $E7
         BPL   LA122
         CMP   #$5F
         BEQ   LA121
         CMP   #$5E
         BEQ   LA121
         CMP   #$3F
         BCS   LA122
         CMP   #$3A
         BCS   LA11F
         CMP   #$2F
         BEQ   LA121
         CMP   #$2E
         BCS   LA122
         CMP   #$28
         BCC   LA121
LA11F    LDA   #$00
LA121    RTS

LA122    ORA   #$00
         RTS

LA125    LDA   #$00
         LDX   L1A41
         BNE   LA12E
         LDA   #$01
LA12E    STA   L1A41
         BRA   LA147
LA133    STZ   L1A8E
         STZ   L1A8D
         LDX   #$01
         STX   L1A8A
         JSR   LA2AE
LA141    JSR   LA26F
LA144    JSR   LA210
LA147    BRL   L9FF2
LA14A    LDY   L1A8A
         DEY
         STY   L1A8E
         STY   L1A8D
         BRA   LA141
LA156    LDA   L1A8F
         STA   L1A8E
         STA   L1A8D
         BEQ   LA16B
         TAY
LA162    LDA   L1AA2,Y
         STA   L04F9,Y
         DEY
         BPL   LA162
LA16B    JSR   LA26F
LA16E    JSR   LA2AE
         LDX   #$01
         STX   L1A8A
         JSR   LA212
LA179    BRL   L9FF2
LA17C    LDY   L1A8A
         CPY   L1A8E
         BCC   LA18D
         BEQ   LA18D
         JSR   LA333
         PLA
         PLA
         BRA   LA179
LA18D    RTS

LA18E    STA   L1A9F
         LDY   L1A8D
         LDA   L1A41
         BEQ   LA1A0
         CPY   L1A8A
         BCC   LA1AE
         BRA   LA1C4
LA1A0    CPY   L1A8A
         BCC   LA1AE
         LDA   L04F9,Y
         STA   L04FA,Y
         DEY
         BRA   LA1A0
LA1AE    LDY   L1A8D
         CPY   L1A3C
         BCS   LA1B9
         INC   L1A8D
LA1B9    LDY   L1A3F
         CPY   L1A8E
         BEQ   LA1C4
         INC   L1A8E
LA1C4    LDY   L1A8A
         LDA   L1A9F
         STA   L04F9,Y
         CPY   L1A8E
         BCC   LA1D7
         BEQ   LA1D7
         STY   L1A8E
LA1D7    LDA   L1A41
         BNE   LA1E8
         JSR   LA1F7
         LDX   L1A86
         LDY   L1A88
         JSR   LA2B4
LA1E8    LDA   L1A9F
         JSR   LA294
         INC   L1A8A
         LDA   L1A9F
         BRL   LA297
LA1F7    CLC
         LDA   #L04F9
         ADC   L1A8A
         XBA
         LDA   #$00
         ADC   #>L04F9
         TAY
         SEC
         LDA   L1A8E
         SBC   L1A8A
         INC
         TAX
         XBA
         BRL   LA30D
LA210    LDX   #$00
LA212    STX   L1A9D
         LDX   L1A86
         LDY   L1A88
         STX   L1AA0
         STY   L1AA1
         JSR   LA1F7
         LDX   L1A9D
         BEQ   LA232
         JSR   LA297
         STX   L1AA0
         STY   L1AA1
LA232    LDA   L1A8C
         BEQ   LA23A
         JSR   LA2C4
LA23A    SEC
         LDA   #L04F9
         LDY   #>L04F9
         ADC   L1A8E
         XBA
         BCC   LA246
         INY
LA246    SEC
         LDA   L1A3F
         SBC   L1A8E
         TAX
         XBA
         JSR   LA30D
         LDA   L1A8C
         BEQ   LA25A
         JSR   LA2D1
LA25A    LDX   L1A9D
         BEQ   LA266
         LDY   L1A8E
         INY
         STY   L1A8A
LA266    LDX   L1AA0
         LDY   L1AA1
         BRL   LA2B4
LA26F    LDY   L1A8D
         INY
         BEQ   LA28D
         LDA   L1A40
         LDX   L1A8C
         BEQ   LA280
         LDA   L1A97
LA280    STA   L04F9,Y
         INY
         BEQ   LA28D
         CPY   L1A3C
         BEQ   LA280
         BCC   LA280
LA28D    RTS

LA28E    LDA   #$1C
         BRA   LA294
LA292    LDA   #$08
LA294    JSR   LA9BF
LA297    JSR   LA2A1
         STX   L1A86
         STY   L1A88
         RTS

LA2A1    PHA
         LDAL  $00057B
         TAX
         LDAL  $0005FB
         TAY
         PLA
         RTS

LA2AE    LDX   L1A3D
         LDY   L1A3E
LA2B4    STX   L1A86
         STY   L1A88
LA2BA    PHA
         STX   $2B
         STY   $2C
         JSR   LAC26
         PLA
         RTS

LA2C4    PHA
         LDA   #$1B
         JSR   LA9BF
         LDA   #$0F
         JSR   LA9BF
         PLA
         RTS

LA2D1    PHA
         LDA   #$0E
         JSR   LA9BF
         LDA   #$18
         JSR   LA9BF
         PLA
         RTS

LA2DE    STA   L1A99
         PHX
         PHY
         LDX   #$0F
         LDY   #$0E
         LDAL  $000032
         BMI   LA2F0
         TXY
         LDX   #$0E
LA2F0    STX   L1A98
         STY   L1A9A
         LDA   #L1A98
         STA   $40
         LDA   #>L1A98
         STA   $41
         LDA   #^L1A98
         STA   $42
         LDA   #$03
         JSR   LAA7D
         LDA   L1A99
         PLY
         PLX
         RTS

LA30D    STA   $40
         STY   $41
         LDA   #^L04FA
         STA   $42
         TXA
         BRL   LAA7D
LA319    JSR   L8258
         BNE   LA32A
         JSR   L9E5D
         LDA   L1A43
         BEQ   LA319
         LDA   #$00
         LDX   #$00
LA32A    AND   #$7F
         STA   L1A80
         STX   L1A82
LA332    RTS

LA333    JSR   L80CD
LA336    LDA   L1A45
         BEQ   LA332
         LDA   #$07
         BRL   LA294
LA340    JSR   L9EED
         LDA   #$01
         STA   L1A8A
         STZ   L1A84
         BRA   LA355
LA34D    JSR   L9EED
         LDA   #$01
         STA   L1A84
LA355    JSR   LA292
         LDX   L1A8E
         STX   L04F9
         LDA   L1A7E
         RTS

LA362    LDY   #$40
         REP   #$30
LA366    LDA   L1BA2,Y
         STA   L1A3C,Y
         DEY
         DEY
         BPL   LA366
         SEP   #$30
         RTS

LA373    LDY   #$40
         REP   #$30
LA377    LDA   L1BE4,Y
         STA   L1A3C,Y
         DEY
         DEY
         BPL   LA377
         SEP   #$30
         LDA   L16ED
         STA   L1A4F
         RTS

LA38A    LDY   #$4E
         PHA
         REP   #$30
LA38F    LDA   L1A3C,Y
         TAX
         LDA   L1C26,Y
         STA   L1A3C,Y
         TXA
         STA   L1C26,Y
         DEY
         DEY
         BPL   LA38F
         SEP   #$30
         PLA
         RTS

LA3A5    STX   L1C7C
         STA   L1C7E
         STY   L1C7A
         LDA   L18AF
         CMP   #$03
         BNE   LA41A
LA3B5    JSR   LA2A1
         STX   L1BE5
         STY   L1BE6
         TYA
         INC
         INC
         SEC
         SBCL  $000023
         BCC   LA3DC
         TAY
LA3C9    LDA   #$17
         JSR   LA9BF
         LDA   #$1F
         JSR   LA9BF
         TYA
         LDY   #$00
         CMP   #$00
         BNE   LA3C9
         BRA   LA3B5
LA3DC    JSR   LA38A
         JSR   LA373
         STZ   L1A43
         STZ   L1A8C
         LDA   #$01
         STA   L1A8A
         LDA   [$40]
         BEQ   LA3FB
         INC   $40
         BNE   LA3FB
         REP   #$30
         INC   $41
         SEP   #$30
LA3FB    JSR   L9D1D
         PHA
         LDA   L1A80
         JSR   LA38A
         PLX
         CPX   #$01
         BNE   LA414
         LDA   #$0D
         LDX   L04F9
         STA   L04FA,X
         INX
         RTS

LA414    STA   L04FA
         LDX   #$01
         RTS

LA41A    JSR   L3523
         LDA   #$05
         JSR   LA9BF
LA422    LDX   L1C7C
LA425    STZ   L04FA,X
         DEX
         BNE   LA425
         STZ   L04FA
         LDX   #$00
         BRA   LA442
LA432    STA   L04FA,X
         INX
         JSR   LA4DF
         CPX   L1C7C
         BCC   LA442
LA43E    JSR   L351F
         RTS

LA442    PHX
         JSR   LA7D7
         PLX
         AND   L1C7A
         CMP   #$7F
         BEQ   LA49E
         CMP   #$20
         BCS   LA432
         CMP   #$15
         BNE   LA45F
         LDA   L04FA,X
         BNE   LA432
         LDA   #$20
         BRA   LA432
LA45F    CMP   #$0D
         BNE   LA469
         STA   L04FA,X
         INX
         BRA   LA43E
LA469    CMP   #$07
         BEQ   LA432
         CMP   #$1A
         BNE   LA476
         JSR   LA4C1
         BRA   LA422
LA476    CMP   #$0B
         BNE   LA485
LA47A    LDA   L04FA,X
         BEQ   LA442
         JSR   LA4DF
         INX
         BRA   LA47A
LA485    CMP   #$0A
         BEQ   LA48D
         CMP   #$19
         BNE   LA49A
LA48D    PHX
LA48E    STZ   L04FA,X
         INX
         CPX   L1C7C
         BCC   LA48E
         PLX
         BRA   LA442
LA49A    CMP   #$08
         BNE   LA4AF
LA49E    CPX   #$00
         BEQ   LA442
         DEX
         LDA   L04FA,X
         CMP   #$20
         BCC   LA442
         JSR   LA4CE
         BRA   LA442
LA4AF    CMP   #$18
         BNE   LA4B9
         JSR   LA4C1
         BRL   LA442
LA4B9    LDA   #$07
         JSR   LA4DF
         BRL   LA442
LA4C1    CPX   #$00
         BEQ   LA4CD
LA4C5    PHX
         JSR   LA4CE
         PLX
         DEX
         BNE   LA4C5
LA4CD    RTS

LA4CE    BIT   L1C7E
         BPL   LA4DE
         PHX
         LDX   #^L1C76
         LDA   #L1C76
         LDY   #>L1C76
         JSR   LAB58
         PLX
LA4DE    RTS

LA4DF    BIT   L1C7E
         BPL   LA4E7
         JMP   LA9C4
LA4E7    RTS

LA4E8    LDA   #^L0B48
         STA   $42
         REP   #$30
         LDA   #L0B48
         STA   $40
         SEP   #$30
         RTS

LA4F6    LDA   #$04
         STA   L1BF5
         STZ   L1771
         STZ   L1772
         LDA   #$01
LA503    STA   L1BE9
         LDX   #^L0C2A
         REP   #$30
         LDA   L1771
         CLC
         ADC   #L0C2A
         STA   $40
         SEP   #$30
         BCC   LA518
         INX
LA518    STX   $42
         LDX   $1A
         BNE   LA52C
LA51E    LDA   #$29
         JSR   LA9C4
LA523    JSR   LA646
         BCC   LA53E
         LDX   $1A
         BEQ   LA523
LA52C    LDY   L1D11,X
         LDA   L06F3,Y
         BIT   #$20
         BNE   LA51E
         JSR   LA646
         BCS   LA503
         BRL   LA5EB
LA53E    CPX   #$01
         BCC   LA58B
         BNE   LA59C
         LDA   L04FA
         CMP   #$0A
         BNE   LA573
         REP   #$30
         LDA   L1771
         BNE   LA556
         DEX
         BRL   LA5D9
LA556    LDA   #$0000
LA559    TAY
         LDA   L0C2A,Y
         AND   #$00FF
         STY   L1775
         SEC
         ADC   L1775
         CMP   L1771
         BCC   LA559
         STY   L1771
         BRA   LA58B
         SEP   #$30
LA573    CMP   #$0B
         BNE   LA59C
         LDY   L1771
         LDA   L0C2A,Y
         SEC
         ADC   L1771
         CMP   L1773
         BCC   LA588
         LDA   #$00
LA588    STA   L1771
LA58B    SEP   #$30
         LDX   L1BE5
         DEX
         LDY   L1BE6
         JSR   LA2B4
         LDA   #$00
         BRL   LA503
LA59C    REP   #$30
LA59E    TXA
         SEC
         ADC   L1773
         CMP   #$0400
         BCC   LA5AD
         JSR   LA60B
         BRA   LA59E
LA5AD    LDY   L1773
         STA   L1773
         PHX
         BEQ   LA5C3
         TAX
         SEP   #$20
LA5B9    LDA   L0C2A,Y
         STA   L0C2A,X
         DEX
         DEY
         BNE   LA5B9
LA5C3    SEP   #$20
         LDA   $01,S
         LDY   #$0000
LA5CA    STA   L0C2B,Y
         TYA
         CMP   $01,S
         BEQ   LA5D8
         LDA   L04FA,Y
         INY
         BRA   LA5CA
LA5D8    PLX
LA5D9    SEP   #$30
         LDA   #$0D
         JSR   LA9C4
         LDA   L06F0
         LSR
         BCC   LA5EB
         LDA   #$0A
         JSR   LA9BF
LA5EB    CPX   #$00
         BEQ   LA5FB
         PHX
LA5F0    DEX
         LDA   L04FA,X
         STA   L03F7,X
         TXA
         BNE   LA5F0
         PLX
LA5FB    STZ   L03F7,X
         STX   L03F6
         LDA   #$02
         STA   L1BF5
         TXA
         XBA
         RTS

         REP   #$30
LA60B    LDA   #$0000
LA60E    TAY
         LDA   L0C2B,Y
         AND   #$00FF
         STY   L1775
         SEC
         ADC   L1775
         CMP   L1773
         BCC   LA60E
         LDA   #$0000
         STA   L0C2B,Y
         STY   L1773
         RTS

         SEP   #$30
LA62D    CPX   $1A
         BNE   LA633
         STZ   $1A
LA633    CPX   $18
         BNE   LA63A
         JSR   L8038
LA63A    LDX   #$58
         JMP   L3FA4      ;BRL L3FA4
LA63F    JSR   LA4E8
         LDX   $18
         BPL   LA648
LA646    LDX   $1A
LA648    JSR   LB742
         LDA   L06F0,Y
         BEQ   LA62D
         BMI   LA6B1
         CMP   #$10
         BEQ   LA697
         JSR   L353D
         LDA   L06F3,Y
         STZ   L1785
         BIT   #$20
         BEQ   LA666
         INC   L1785
LA666    BIT   #$10
         BNE   LA678
         LDA   L06F1,Y
         BNE   LA67D
LA66F    LDA   #$0D
         STA   L04FA
         LDX   #$01
         BRA   LA691
LA678    LDA   L06F2,Y
         BEQ   LA66F
LA67D    JSR   L3450
         LDA   L1785
         AND   L1787
         BEQ   LA68A
         LDA   #$FF
LA68A    LDX   #$FF
         LDY   #$7F
         JSR   LA3A5
LA691    JSR   L3547
         BRL   LA724
LA697    LDY   L022C
         LDX   #$00
LA69C    LDA   L022F,Y
         STA   L04FA,X
         INX
         INY
         BEQ   LA6AC
         CMP   #$0D
         BNE   LA69C
         LDY   #$00
LA6AC    STY   L022C
         BRA   LA724
LA6B1    LDA   L07F0,Y
         CMP   #$0F
         BNE   LA6BF
         JSR   LA995
         BCS   LA6FF
         BRA   LA722
LA6BF    JSR   LB8AB
         JSR   LB5C2
         LDA   L18DC
         STA   L1777
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L1777
         LDY   $2B
         LDX   L1781
         BCC   LA702
         PHA
         LDA   L06F0,Y
         BIT   #$40
         BEQ   LA6FA
         LDA   L06F2,Y
         STA   $1A
         BNE   LA6EE
         STZ   L0108
LA6EE    JSR   LAD3E
         PLA
         CMP   #$4C
         BNE   LA6F7
         RTS

LA6F7    JMP   L3F75      ;BRL L3F75
LA6FA    PLA
         CMP   #$4C
         BNE   LA6F7
LA6FF    BRL   L82AD
LA702    LDA   L06F0,Y
         BIT   #$40
         BEQ   LA710
         PHX
         PHY
         JSR   LA73B
         PLY
         PLX
LA710    LDA   L06F3,Y
         BIT   #$20
         BEQ   LA724
         JSR   LA724
         STZ   L04FA,X
         PHX
         JSR   LA732
         PLX
LA722    CLC
         RTS

LA724    LDA   L04F9,X
         CMP   #$0D
         BEQ   LA72C
         INX
LA72C    DEX
         CLC
         RTS

         JMP   L3F75      ;BRL L3F75
LA732    LDX   #^L04FA
         LDY   #>L04FA
         LDA   #L04FA
         BRL   LAB58
LA73B    LDA   L0108
         BEQ   LA74F
         LDX   #$00
LA742    LDA   L04FA,X
         CMP   #$7B
         BEQ   LA750
LA749    INX
         TXA
         CMP   $04,S
         BCC   LA742
LA74F    RTS

LA750    LDA   L04FC,X
         CMP   #$7D
         BNE   LA749
         BNE   LA749
         LDA   L04FB,X
         JSR   L4F89
         BCC   LA749
         SBC   #$30
         BEQ   LA74F
         XBA
         LDY   #$00
LA768    XBA
         DEC
         BEQ   LA77C
         XBA
LA76D    LDA   L0109,Y
         INY
         CMP   #$2C
         BEQ   LA768
         CPY   L0108
         BCC   LA76D
         BRA   LA74F
LA77C    PHX
         PHY
         TXY
         INY
         INY
         INY
LA782    LDA   L04FA,Y
         STA   L04FA,X
         INY
         INX
         TYA
         CMP   $06,S
         BCC   LA782
         LDA   $06,S
         SEC
         SBC   #$03
         STA   $06,S
         PLY
         PHY
         LDX   #$00
LA79A    INX
         INY
         LDA   L0109,Y
         CMP   #$2C
         BNE   LA79A
         TXA
         CLC
         ADC   $06,S
         STA   $06,S
         TXA
         EOR   #$FF
         TAX
         LDY   #$FF
LA7AF    LDA   L04FA,X
         STA   L04FA,Y
         DEY
         DEX
         TXA
         CMP   $02,S
         BCS   LA7AF
         PLY
         PLX
LA7BE    LDA   L0109,Y
         CMP   #$2C
         BEQ   LA7CC
         STA   L04FA,X
         INY
         INX
         BRA   LA7BE
LA7CC    BRL   LA742
LA7CF    BIT   $18
         BMI   LA7DB
         LDX   $18
         BRA   LA7DD
LA7D7    LDX   #$00
         BRA   LA7DD
LA7DB    LDX   $1A
LA7DD    JSR   LB742
         LDA   L06F0,Y
         BNE   LA7E8
         BRL   LA62D
LA7E8    BMI   LA843
         CMP   #$10
         BEQ   LA836
         JSR   L353D
         LDA   L06F3,Y
         STZ   L1785
         BIT   #$20
         BEQ   LA7FE
         INC   L1785
LA7FE    BIT   #$10
         BNE   LA809
         LDA   L06F1,Y
         BNE   LA812
         BRA   LA80E
LA809    LDA   L06F2,Y
         BNE   LA812
LA80E    LDA   #$0D
         BRA   LA82B
LA812    JSR   L3450
         REP   #$30
         PEA   $0000
         LDA   L1785
         AND   L1787
         PHA
         _ReadChar
         PLA
         SEP   #$30
LA82B    STA   L176F
         JSR   L3547
         JSR   L3441
         BRA   LA884
LA836    LDY   L022C
         LDA   L022F,Y
         STA   L176F
         INC   L022C
         RTS

LA843    JSR   LB8A2
         JSR   LB5C2
         REP   #$30
         LDA   L18DC
         STA   L175F+2
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L1761
         SEP   #$30
         BCC   LA884
         PHA
         LDY   $2B
         LDA   L06F0,Y
         BIT   #$40
         BEQ   LA87C
         LDA   L06F2,Y
         STA   $1A
         JSR   LAD3E
         PLA
         CMP   #$4C
         BNE   LA879
         BRL   LA7DB
LA879    JMP   L3F75      ;BRL L3F75
LA87C    PLA
         CMP   #$4C
         BNE   LA879
         BRL   L82AD
LA884    LDA   L176F
         RTS

*-----------------------
* OUTPUT
*-----------------------

LA888    JSR   L633E
         JSR   L73D3
         JSR   LB725
         TXA
         BEQ   LA899
         JSR   LB8A2
         LDA   $1B
LA899    STA   $19
         RTS

*-----------------------
* EXEC
*-----------------------

LA89C    CMP   #$23
         BNE   LA8AE
         JSR   LB71C
         JSR   LB8C6
         LDX   $1B
         LDA   $1A
         STZ   $1A
         BRA   LA8C8
LA8AE    LDX   $1A
         BEQ   LA8BA
         LDY   L1D11,X
         STZ   $1A
         JSR   LAD3E
LA8BA    STZ   $1A
         JSR   LB755
         LDX   #$1E
         STX   $1B
         STZ   L0108
         LDA   #$00
LA8C8    STA   $0B
         LDY   L1D11,X
         STY   $2B
         LDA   #$01
         LDX   #$00
         JSR   LB222
         LDA   L18F8+2
         CMP   #$04
         BEQ   LA8E7
         CMP   #$B0
         BEQ   LA8E7
         JSR   LAD4A
         BRL   LCCA6
LA8E7    LDY   $2B
         STA   L07F0,Y
         LDA   $0B
         STA   L06F2,Y
         LDA   L18DC
         STA   L06F1,Y
         LDA   #$C0
         STA   L06F0,Y
         LDX   #$20
         JSR   L3CC8
         BEQ   LA914
         JSR   L6346
         CMP   #$8F
         BNE   LA914
         LDX   #$00
         JSR   L3CBE
         BEQ   LA914
         JSR   L6346
LA914    TXA
         ORA   #$01
         LDY   $2B
         STA   L06F3,Y
         JSR   L3CC8
         BEQ   LA972
         LDX   $0B
         BNE   LA946
         CMP   #$22
         BEQ   LA949
         JSR   L60A7
         JSR   L6D6F
         PHA
         JSR   L6D9D
         PLY
         CPY   #$A0
         BCC   LA93A
         LDY   #$A0
LA93A    TYX
LA93B    DEY
         LDA   [$40],Y
         STA   L0109,Y
         TYA
         BNE   LA93B
         BRA   LA965
LA946    BRL   L6356
LA949    LDX   #$00
LA94B    JSR   L3CBE
         BEQ   LA96A
         CMP   #$22
         BNE   LA95D
         JSR   L6306
         LDA   [$4E]
         CMP   #$22
         BNE   LA96A
LA95D    STA   L0109,X
         INX
         CPX   #$9F
         BCC   LA94B
LA965    JSR   L3CBE
         BNE   LA965
LA96A    STX   L0108
         LDA   #$2C
         STA   L0109,X
LA972    JSR   LA97A
         LDA   $1B
         STA   $1A
         RTS

LA97A    LDA   L18DC
         STA   L17AB
         JSL   GSOS
         DW    $0011      ; NewLine
         ADRL  L17AB
         BCS   LA98D
         RTS

LA98D    PHA
         JSR   LAD4A
         PLA
         JMP   L3F75      ;BRL L3F75
LA995    JSR   LC3AE
         BCS   LA9A9
         LDX   #$00
LA99C    LDA   L022F,X
         STA   L04FA,X
         INX
         CPX   #$4F
         BCC   LA99C
         DEX
         RTS

LA9A9    BRL   L82AD
         DEC
         BPL   LA9B0
         INC
LA9B0    BRA   LA9BF
LA9B2    LDA   #$20
LA9B4    INC   $2F
LA9B6    BIT   $18
         BMI   LA9C4
         PHX
         LDX   $18
         BRA   LA9C7
LA9BF    PHX
         LDX   #$00
         BRA   LA9C7
LA9C4    PHX
         LDX   $19
LA9C7    PHY
         PHA
         JSR   LB742
         LDA   L06F0,Y
         BNE   LA9D4
         BRL   LA63A
LA9D4    BMI   LAA50
         CMP   #$10
         BEQ   LAA3C
         CMP   #$04
         BCC   LAA1F
         LDA   L07F5,Y
         TAX
         REP   #$30
         LDA   L07F3,Y
         PHX
         PHA
         LDA   L06F0,Y
         LDX   #$1B04     ; SetPort
         BIT   #$0004
         BNE   LA9F7
         LDX   #$4D0E     ; StartDrawing
LA9F7    JSL   DISPATCH1
         BCC   LAA00
         JMP   L3F6A      ;BRL L3F6A
LAA00    SEP   #$30
         LDY   $2B
         LDA   L06F7,Y
         XBA
         LDA   L06F1,Y
         REP   #$30
         TAX
         PLA
         PHA
         AND   #$00FF
         PHA
         JSL   DISPATCH1
         SEP   #$30
         BCC   LAA38
         JMP   L3F6A      ;BRL L3F6A
LAA1F    LDA   L06F1,Y
         BEQ   LAA38
         JSR   L3400
         REP   #$30
         PLA
         PHA
         PHA
         _WriteChar
         SEP   #$30
         JSR   L3432
LAA38    PLA
         PLY
         PLX
         RTS

LAA3C    LDY   L022C
         LDA   $01,S
         STA   L022F,Y
         INC   L022C
         CMP   #$0D
         BNE   LAA38
         STZ   L022C
         BRA   LAA38
LAA50    JSR   LB8AB
         JSR   LB5C6
         PLA
         PHA
         STA   L176F
         REP   #$30
         LDA   L18DC
         STA   L175F+2
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L1761
         SEP   #$30
         BCC   LAA38
         JMP   L3F75      ;BRL L3F75
LAA74    BIT   $18
         BMI   LAA7D
         PHX
         LDX   $18
         BRA   LAA80
LAA7D    PHX
         LDX   $19
LAA80    PHY
         PHA
         JSR   LB742
         LDA   L06F0,Y
         BPL   LAA8D
         BRL   LAB2C
LAA8D    BNE   LAA92
         BRL   LA63A
LAA92    CMP   #$10
         BEQ   LAB0A
         CMP   #$04
         BCC   LAAE3
         LDA   L07F5,Y
         TAX
         REP   #$30
         LDA   L07F3,Y
         PHX
         PHA
         LDA   L06F0,Y
         LDX   #$1B04     ; SetPort
         BIT   #$0004
         BNE   LAAB3
	 LDX   #$4D0E     ; StartDrawing
LAAB3    JSL   DISPATCH1
         BCC   LAABC
         JMP   L3F6A      ;BRL L3F6A
LAABC    SEP   #$30
         LDY   $2B
         LDA   L06F7,Y
         CLC
         ADC   #$03
         XBA
         LDA   L06F1,Y
         PLY
         PHY
         REP   #$30
         TAX
         LDA   $42
         AND   #$00FF
         PHA
         PEI   $40
         PHY
         JSL   DISPATCH1
         SEP   #$30
         BCC   LAB08
         JMP   L3F6A      ;BRL L3F6A
LAAE3    LDA   L06F1,Y
         BEQ   LAB08
         JSR   L3400
         PLX
         PHX
         REP   #$30
         LDA   $42
         AND   #$00FF
         PHA
         LDA   $40
         PHA
         PEA   $0000
         PHX
         _TextWriteBlock
         SEP   #$30
         JSR   L3432
LAB08    BRA   LAB52
LAB0A    LDX   L022C
         PLA
         PHA
         BEQ   LAB52
         LDY   #$00
LAB13    LDA   [$40],Y
         STA   L022F,X
         INX
         BEQ   LAB52
         CMP   #$0D
         BNE   LAB21
         LDX   #$00
LAB21    STX   L022C
         INY
         TYA
         CMP   $01,S
         BCC   LAB13
         BRA   LAB52
LAB2C    JSR   LB8AB
         JSR   LB5C6
         LDA   $42
         STA   L18E0
         STZ   L18E1
         PLA
         PHA
         STA   L18E2
         REP   #$30
         LDA   $40
         STA   L18DE
         STZ   L18E3
         STZ   L18E4
         LDY   #$0008
         JSR   L34B4
LAB52    SEP   #$30
         PLA
         PLY
         PLX
         RTS

LAB58    XBA
         TYA
         XBA
         REP   #$30
         PHX
         PHA
         SEP   #$30
         LDA   L06F0
         BMI   LAB7C
         LDA   L06F1
         BEQ   LAB7C
         JSR   L3400
         REP   #$30
         _WriteCString
         SEP   #$30
         JSR   L3432
LAB7C    RTS

*-----------------------
* TEXTPORT
*-----------------------

LAB7D    JSR   L73D3
         TXA
         BNE   LAB84
         INC
LAB84    STA   $2B
         JSR   L6346
         JSR   L73D3
         TXA
         BNE   LAB90
         INC
LAB90    STA   $2D
         LDA   #$81
         JSR   L80C3
         JSR   L73D3
         TXA
         BNE   LAB9E
         INC
LAB9E    STA   $2C
         CMP   $2B
         BCS   LABAA
         LDX   $2B
         STA   $2B
         STX   $2C
LABAA    JSR   L6346
         JSR   L73D3
         TXA
         BNE   LABB4
         INC
LABB4    STA   $2E
         CMP   $2D
         BCS   LABC0
         LDX   $2D
         STA   $2D
         STX   $2E
LABC0    LDA   $2B
         CMP   #$51
         BCS   LABF7
         LDA   $2C
         CMP   #$51
         BCS   LABF7
         LDA   $2D
         CMP   #$19
         BCS   LABF7
         LDA   $2E
         CMP   #$19
         BCS   LABF7
         DEC   $2B
         DEC   $2D
         JSR   LABE4
         LDA   #$19
         BRL   LA9BF
LABE4    LDA   $2C
         SEC
         SBC   $2B
         STA   $2C
         LDX   #$03
LABED    LDA   $2B,X
         STAL  $000020,X
         DEX
         BPL   LABED
         RTS

LABF7    BRL   L6708

*-----------------------
* LOCATE
*-----------------------

LABFA    LDAL  $00057B
         STA   $2B
         LDAL  $0005FB
         STA   $2C
         LDA   [$4E]
         CMP   #$2C
         BEQ   LAC1A
         JSR   L73D3
         TXA
         BEQ   LAC13
         DEC
LAC13    STA   $2C
         JSR   L3CC8
         BEQ   LAC26
LAC1A    JSR   L6346
         JSR   L73D3
         TXA
         BEQ   LAC24
         DEC
LAC24    STA   $2B
LAC26    LDX   $2B
         TXA
         CMPL  $000021
         BCC   LAC35
         LDAL  $000021
         DEC
         TAX
LAC35    LDA   $2C
         CMPL  $000023
         BCC   LAC42
         LDAL  $000023
         DEC
LAC42    STAL  $000025
         STAL  $0005FB
         TXA
         STAL  $000024
         STAL  $00057B
         REP   #$30
         PEA   $FC22
         JSR   LAC5E
         PLA
         PLA
         RTS

LAC5E    REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PHA
         PHX
         PHY
         LDA   $11,S
         PHA
         _FWEntry
         PLY
         PLX
         PLA
         PLP
         PLP
         SEP   #$30
         RTS

*-----------------------
* CLOSE
*-----------------------

LAC81    BEQ   LACA2
         JSR   L633E
         JSR   L73D3
         CPX   #$1F
         BCS   LAC9F
         JSR   LB742
         STZ   $12
         JSR   LACC4
LAC95    LDA   $12
         STZ   $12
         BNE   LAC9C
         RTS

LAC9C    JMP   L3F75      ;BRL L3F75
LAC9F    BRL   L6708

LACA2    LDA   $C4
         BMI   LACAA
         BEQ   LACAA
         STZ   $C4
LACAA    STZ   $12
         LDX   #$1F
LACAE    PHX
         JSR   LB742
         LDA   L06F0,Y
         BEQ   LACBE
         CMP   #$C0
         BEQ   LACBE
         JSR   LACC4
LACBE    PLX
         DEX
         BNE   LACAE
         BRA   LAC95
LACC4    CPX   $19
         BNE   LACCE
         LDA   #$FF
         STA   $18
         STZ   $19
LACCE    STY   $13
         JSR   LB95E
         BCC   LACD7
         STA   $12
LACD7    LDY   $13
         LDA   L06F0,Y
         BNE   LACE1
         BRL   LB6AC
LACE1    LDA   L06F2,Y
         BEQ   LACFF
         BMI   LACFC
         PHY
         TAY
         LDA   L1D11,Y
         TAY
         LDA   L06F2,Y
         DEC
         BMI   LACF6
         LDA   #$00
LACF6    STA   L06F2,Y
         PLY
         BRA   LACFF
LACFC    JSR   LAD90
LACFF    LDA   L06F3,Y
         BIT   #$40
         BEQ   LAD37
         REP   #$30
         LDA   L06F6,Y
         AND   #$00FF
         PHA
         TAX
         LDA   L06F4,Y
         PHA
         PHX
         PHA
         _HUnlock
         BCS   LAD2A
         _DisposeHandle
         SEP   #$30
         BCC   LAD2D
LAD2A    JMP   L3F6A      ;BRL L3F6A
LAD2D    LDY   $13
         LDA   L06F3,Y
         AND   #$BF
         STA   L06F3,Y
LAD37    LDY   $13
         LDA   L06F0,Y
         BPL   LAD4F
LAD3E    LDA   L06F1,Y
         STA   L18DC
         STZ   L18DC+1
         JSR   LAD82
LAD4A    LDY   #$0A
         JMP   L34B4      ;BRL L34B4
LAD4F    AND   #$7E
         CMP   #$02
         BNE   LAD5A
         BIT   L178B
         BMI   LAD3E
LAD5A    CMP   #$08
         BNE   LAD82
         LDA   L07F5,Y
         TAX
         REP   #$30
         PHX
         LDA   L07F3,Y
         PHA
         _CloseWindow
         BCC   LAD7E
         PHA
         SEP   #$30
         JSR   LAD80
         REP   #$30
         PLA
         JMP   L3F6A      ;BRL L3F6A
LAD7E    SEP   #$30
LAD80    LDY   $13
LAD82    LDA   #$08
         TYX
LAD85    STZ   L06F0,X
         STZ   L07F0,X
         INX
         DEC
         BNE   LAD85
         RTS

LAD90    TAX
         TYA
         LSR
         LSR
         LSR
         PHA
         PHX
         LDX   #$00
LAD99    INX
         CPX   #$1E
         BCS   LADCC
         LDY   L1D11,X
         LDA   L06F2,Y
         CMP   $02,S
         BNE   LAD99
         LDA   $01,S
         DEC
         BMI   LADAF
         LDA   #$00
LADAF    STA   L06F2,Y
         BEQ   LADCC
         PLA
         PHX
LADB6    INX
         CPX   #$1E
         BCS   LADCC
         LDY   L1D11,X
         LDA   L06F2,Y
         CMP   $02,S
         BNE   LADB6
         LDA   $01,S
         STA   L06F2,Y
         BRA   LADB6
LADCC    PLA
         PLA
         LDY   $13
         RTS

LADD1    JSR   LB71C
         BNE   LADD9
         BRL   LB6AC
LADD9    PHY
         JSR   L6346
         CMP   #$8B
         BEQ   LADE4
LADE1    BRL   L6356
LADE4    JSR   L3CBE
         LDX   #$01
         CMP   #$91
         BEQ   LADFC
         LDX   #$02
         CMP   #$92
         BEQ   LADFC
         LDX   #$03
         LDA   #$8F
         JSR   L80A8
         BNE   LADE1
LADFC    STX   $77
         JSR   L6306
         LDA   #$93
         JSR   L80C3
         JSR   LB71C
         BEQ   LAE13
         PHX
         JSR   LACC4
         PLX
         JSR   LB742
LAE13    PLX
         LDA   L06F0,X
         EOR   L06F0,Y
         AND   #$FE
         BEQ   LAE21
LAE1E    JMP   L3F9E      ;BRL L3F9E
LAE21    LDA   L06F0,X
         CMP   #$80
         BCC   LAE37
         BEQ   LAE2C
         BRA   LAE1E
LAE2C    LDA   $77
         CMP   #$01
         BNE   LAE37
         LDA   #$4E
         JMP   L3F75      ;BRL L3F75
LAE37    LDA   L06F0,X
         STA   L06F0,Y
         LDA   $77
         ORA   #$08
         STA   L06F3,Y
         LDA   L07F0,X
         STA   L07F0,Y
         STA   $78
         LDA   #$00
         STA   L07F1,Y
         REP   #$30
         LDA   L07F6,X
         STA   L07F6,Y
         STA   L18FC
         SEP   #$30
         LDA   L06F2,X
         BMI   LAE65
         LDA   #$7F
LAE65    INC
         STA   L06F2,X
         TXA
         STA   L06F2,Y
         JSR   LB925
         LDY   $2B
         LDA   $E9
         ORA   $EA
         BEQ   LAE84
         REP   #$30
         LDA   $E9
         STA   L07F6,Y
         STA   L18FC
         SEP   #$30
LAE84    BRL   LB10D
LAE87    JSR   L6363
         JSR   L60AB
         LDX   L0AF2
         STX   $83
         REP   #$30
         LDA   L0AF0
         STA   $81
         SEP   #$30
         LDA   [$81]
         STA   $77
         JSR   L6346
         LDX   #$01
         LDA   #$92
         JSR   L80A8
         BNE   LAEB1
         JSR   L6306
         JSR   L73D3
LAEB1    STX   $78
         JSR   L3CC8
         CMP   #$8B
         BEQ   LAEBD
LAEBA    BRL   L6356
LAEBD    JSR   L3CBE
         CMP   #$92
         BNE   LAEBA
         JSR   L6306
         LDA   #$93
         JSR   L80C3
         JSR   LB71C
         BEQ   LAED9
         PHX
         JSR   LACC4
         PLX
         JSR   LB742
LAED9    LDA   #$02
         STA   L06F3,Y
         LDA   $78
         STA   L07F0,Y
         LDY   #$02
         LDA   [$81],Y
         XBA
         INY
         LDA   [$81],Y
         LDY   $2B
         STA   L06F7,Y
         XBA
         STA   L06F1,Y
         LDA   $77
         AND   #$0F
         STA   L06F0,Y
         CMP   #$08
         BEQ   LAF10
         LDY   #$06
         LDA   [$81],Y
         TAX
         LDY   #$04
         REP   #$30
         LDA   [$81],Y
         SEP   #$30
         JSR   LAFB1
         RTS

LAF10    LDA   #$10
         BIT   $77
         BEQ   LAF2B
         LDX   #^L06F0
         REP   #$30
         TYA
         CLC
         ADC   #L06F0
         LDY   #$0010
         STA   [$81],Y
         INY
         INY
         TXA
         STA   [$81],Y
         SEP   #$30
LAF2B    LDA   #$20
         BIT   $77
         BEQ   LAF5D
         LDA   #$09
         XBA
         LDY   #$02
         LDA   [$81],Y
         CMP   #$04
         BEQ   LAF5D
         REP   #$30
         TAX
         JSL   DISPATCH1
         BCC   LAF53
LAF45    PHA
         SEP   #$30
         LDY   $2B
         JSR   LAD82
         REP   #$30
         PLA
         JMP   L3F6A      ;BRL L3F6A
LAF53    PLA
         PLX
         LDY   #$0042
         STA   [$81],Y
         TXA
         STA   [$81],Y
LAF5D    SEP   #$30
         LDX   $83
         REP   #$30
         LDA   $81
         CLC
         ADC   #$0008
         BCC   LAF6C
         INX
LAF6C    PHX
         PHA
         _NewWindow
         BCS   LAF45
         PLA
         PLX
         SEP   #$30
         JSR   LAFB1
         STZ   $78
         JSR   LB925
         LDY   $2B
         LDA   $E9
         ORA   $EA
         BEQ   LAFAE
         REP   #$30
         LDA   $E9
         STA   L07F6,Y
         STA   L18FC
         SEP   #$30
         JSR   LB10D
         BIT   $77
         BPL   LAFAE
         JSR   LB8D5
         LDA   #$20
         REP   #$10
         LDY   L18FC
LAFA8    DEY
         STA   [$8E],Y
         TYX
         BNE   LAFA8
LAFAE    SEP   #$30
         RTS

LAFB1    LDY   $2B
         STA   L07F3,Y
         XBA
         STA   L07F4,Y
         TXA
         STA   L07F5,Y
         RTS

*-----------------------
* OPEN
*-----------------------

LAFBF    CMP   #$23
         BNE   LAFC6
         BRL   LADD1
LAFC6    LDA   #$D6
         JSR   L80A8
         BNE   LAFD0
         BRL   LAE87
LAFD0    JSR   LB755
         JSR   L6346
         LDX   #$01
         LDA   #$92
         JSR   L80A8
         BNE   LAFE5
         JSR   L6306
         JSR   LB5E4
LAFE5    STX   $78
         LDY   #$03
         CMP   #$8B
         BNE   LB016
         JSR   L3CBE
         CMP   #$91
         BNE   LAFF8
         LDY   #$01
         BRA   LB013
LAFF8    CMP   #$92
         BNE   LB000
         LDY   #$02
         BRA   LB013
LB000    LDA   #$84
         JSR   L80A8
         BEQ   LB011
         LDA   #$8F
         JSR   L80A8
         BEQ   LB013
         BRL   L6356
LB011    LDY   #$06
LB013    JSR   L6306
LB016    STY   $77
         LDA   #$93
         JSR   L80C3
         JSR   LB71C
         BEQ   LB02A
         PHX
         JSR   LACC4
         PLX
         JSR   LB742
LB02A    LDA   $77
         ORA   #$08
         STA   L06F3,Y
         BIT   L178B
         BMI   LB064
         LDA   L0008
         CMP   #$2E
         BNE   LB064
         JSR   L34E7
         BCC   LB064
         LDY   $2B
         LDA   L1897,X
         STA   L06F1,Y
         LDA   #$03
         STA   L06F3,Y
         LDA   L1898,X
         STA   L06F0,Y
         LDA   #$04
         STA   L18F8+2
         LDA   #$01
         STA   $E9
         STZ   $EA
         LDA   #$00
         BRA   LB09C
LB064    JSR   LB93B
         LDY   $2B
         LDA   $78
         STA   L07F0,Y
         CMP   #$01
         BNE   LB074
         STZ   $78
LB074    LDX   $E9
         LDY   $EA
         CMP   #$AD
         BNE   LB084
         TYA
         BNE   LB084
         TXA
         BNE   LB084
         LDY   #$02
LB084    STX   L18FC
         STY   L18FC+1
         JSR   LB228
         LDY   $2B
         LDA   L18EA
         STA   L06F1,Y
         LDA   #$80
         STA   L06F0,Y
         AND   $77
LB09C    STA   L07F1,Y
         LDA   L18F8+2
         CMP   #$0F
         BNE   LB0AC
         STA   L07F0,Y
         BRL   LC32B
LB0AC    LDA   L07F0,Y
         BEQ   LB0CA
         CMP   #$01
         BNE   LB0D0
         LDA   L18F8+2
         CMP   #$B0
         BEQ   LB0CD
         CMP   #$AD
         BEQ   LB0CD
         CMP   #$04
         BEQ   LB0CD
         JSR   LAD3E
         BRL   LCCA6
LB0CA    LDA   L18F8+2
LB0CD    STA   L07F0,Y
LB0D0    STA   $78
         JSR   LB928
         LDA   $78
         CMP   #$AD
         BNE   LB0E3
         LDY   L18FC
         LDX   L18FC+1
         BRA   LB0FD
LB0E3    LDX   #$02
         LDY   #$00
         CMP   #$B0
         BEQ   LB0EF
         CPY   #$04
         BNE   LB0F3
LB0EF    LDX   #$00
         LDY   #$01
LB0F3    LDA   $E9
         ORA   $EA
         BEQ   LB0FD
         LDY   $E9
         LDX   $EA
LB0FD    TYA
         LDY   $2B
         STA   L07F6,Y
         STA   L18FC
         TXA
         STA   L07F7,Y
         STA   L18FC+1
LB10D    LDA   $78
         CMP   #$B0
         BEQ   LB117
         CMP   #$04
         BNE   LB11A
LB117    BRL   LB1B4
LB11A    STZ   L108C
LB11D    LDY   L18FC+1
         LDX   L18FC
         TYA
         XBA
         TXA
         REP   #$30
         BIT   #$0001
         BEQ   LB12E
         INC
LB12E    PEA   $0000
         PEA   $0000
         PEA   $0000
         PHA
         PEI   $07
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _NewHandle
         SEP   #$30
         BCC   LB16A
         CMP   #$01
         BNE   LB167
         BIT   L108C
         BPL   LB15A
         JMP   L3FA2      ;BRL L3FA2
LB15A    LDA   L18FC+1
         INC
         DEC   L108C
         JSR   L5D47
         BRL   LB11D
LB167    JMP   L3F6A      ;BRL L3F6A
LB16A    LDX   $2B
         REP   #$30
         PLA
         STA   L06F4,X
         STA   $9B
         TAY
         PLA
         STA   $9D
         STA   L06F6,X
         PHA
         PHY
         _HLock
         BCS   LB167
         LDA   [$9B]
         TAX
         LDY   #$0002
         LDA   [$9B],Y
         STA   $9D
         STX   $9B
         LDA   L18FC
         BIT   #$0001
         BNE   LB19B
         DEC
LB19B    DEC
         TAY
         LDA   #$0000
LB1A0    STA   [$9B],Y
         DEY
         DEY
         BPL   LB1A0
         SEP   #$30
         LDX   $2B
         LDA   L06F3,X
         ORA   #$40
         STA   L06F3,X
         BRA   LB1C7
LB1B4    LDX   $2B
         LDA   L06F3,X
         AND   #$F7
         STA   L06F3,X
         LDA   L06F0,X
         BMI   LB1C4
         RTS

LB1C4    JSR   LA97A
LB1C7    LDX   $2B
         LDA   L07F1,X
         STZ   L07F1,X
         TAY
         LDA   L06F3,X
         BIT   #$04
         BEQ   LB1F9
         TYA
         BMI   LB1F9
         LDY   #$0E
         JSR   LB6DA
         REP   #$30
         LDA   $ED
         BEQ   LB1E6
         DEC
LB1E6    PHA
         SEP   #$30
         SEC
         ROR   $E8
         JSR   LBA0D
         LDY   $2B
         REP   #$30
         PLA
         STA   L07F1,Y
         SEP   #$30
LB1F9    RTS

LB1FA    LDA   #L0007
         LDY   #>L0007
         LDX   #^L0007
         STZ   L18F4+3
         STA   L18EC
         STY   L18ED
         STX   L18EE
         STA   L18F4
         STY   L18F4+1
         STX   L18F4+2
         RTS

LB216    JSR   LB1FA
LB219    LDY   #$05
         JSR   L34C1
         JSR   L18D1
LB221    RTS

LB222    AND   #$03
         STA   $77
         STX   $78
LB228    JSR   LB216
         BCS   LB28F
         LDA   L18FC
         STA   L1717
         LDA   L18FC+1
         STA   L1718
         LDA   $78
         BEQ   LB246
         CMP   L18F8+2
         BEQ   LB246
         LDA   #$41
         BRA   LB25E
LB246    LDA   $77
         AND   #$03
         STA   L18DC
         LDA   $77
         AND   L18F8
         AND   #$03
         CMP   L18DC
         STZ   L18DC
         BEQ   LB260
         LDA   #$4E
LB25E    BRA   LB2BB
LB260    LDA   #$02
         STA   L108C
LB265    LDY   #$06
         JSR   L34C1
         JSR   L18D1
         BCC   LB282
         CMP   #$54
         BNE   LB2BB
         BIT   L108C
         BMI   LB2BB
         DEC   L108C
         LDA   #$04
         JSR   L5D47
         BRA   LB265
LB282    LDX   L18EA
         STX   L18DC
         CLC
         STZ   L18DC+1
         LDA   $77
         RTS

LB28F    CMP   #$46
         BNE   LB2BB
         LDX   $78
         BEQ   LB2BB
         LDA   $77
         AND   #$03
         CMP   #$01
         BEQ   LB2B9
         LDA   $77
         CMP   #$C3
         BNE   LB2A9
         LDA   #$4F
         BRA   LB2BB
LB2A9    LDA   #$C3
         STA   $77
         LDX   $78
         LDY   #$00
         JSR   LBC4D
         BCS   LB2BB
         BRL   LB228
LB2B9    LDA   #$46
LB2BB    JMP   L3F75      ;BRL L3F75
LB2BE    SEC
         ROR   $E8
         JSR   LB71C
         JSR   LB8B7
         JSR   LB5C2
         JSR   LB809
         JSR   LB7ED
         JSR   L3CC8
         CMP   #$3B
         BNE   LB2DC
         JSR   L6306
         BRA   LB2E5
LB2DC    RTS

LB2DD    JSR   L3CC8
         BEQ   LB2DC
         JSR   L6346
LB2E5    LDY   $2B
         REP   #$30
         LDA   L07F1,Y
         CMP   L07F6,Y
         SEP   #$30
         BCC   LB2F8
LB2F3    JSR   LB864
         BCS   LB303
LB2F8    JSR   LB8D5
         LDA   [$8E]
         CMP   #$00
         BNE   LB306
         BRA   LB2F3
LB303    BRL   L82AD
LB306    JSR   LB5D5
         TAX
         JSR   LE24E
         BPL   LB312
         BRL   LB34E
LB312    PHX
         JSR   L649E
         BIT   $10
         BMI   LB34B
         PLX
         PEI   $0F
         STX   $0F
         LDA   L1ED1,X
         STA   $10
         LDA   $8E
         LDY   $8F
         LDX   $90
         INC
         BNE   LB331
         INY
         BNE   LB331
         INX
LB331    JSR   LDE7E
         PLX
         PLA
         STX   $0F
         JSR   L5E13
LB33B    JSR   LB8D5
         LDA   [$8E]
         STA   $0D
         JSR   LB571
         JSR   LB916
         BRL   LB2DD
LB34B    JMP   L3F9E      ;BRL L3F9E
LB34E    JSR   L649E
         BIT   $10
         BPL   LB34B
         LDX   $0F
         JSR   LE24E
         LDY   #$01
         LDA   [$8E],Y
         PHA
         INY
         TYA
         CLC
         ADC   $8E
         STA   $BB
         LDA   $8F
         ADC   #$00
         STA   $BC
         LDA   $90
         ADC   #$00
         STA   $BD
         PLA
         TAY
         CLC
         JSR   L6E81
         JSR   L5E5F
         BRL   LB33B

*-----------------------
* GET
*-----------------------

LB37E    CMP   #$24
         BNE   LB385
         BRL   L7C19
LB385    SEC
         JSR   LB4C1
         PHP
         JSR   LB5C2
         PLP
         JSR   LB50F
         STZ   L17B1
         LDY   $2B
         LDA   L07F0,Y
         CMP   #$04
         BEQ   LB3A1
         CMP   #$B0
         BNE   LB3B3
LB3A1    LDA   L18DC
         STA   L17B1
         JSL   GSOS
         DW    $0011      ; NewLine
         ADRL  L17B1
         BCS   LB3D3
LB3B3    JSR   LB87D
         BCS   LB3D0
         JSR   LB3EC
         LDA   L17B1
         BEQ   LB3CF
         STA   L17AB
         JSL   GSOS
         DW    $0011      ; NewLine
         ADRL  L17AB
         BCS   LB3D3
LB3CF    RTS

LB3D0    BRL   L82AD
LB3D3    JMP   L3F75      ;BRL L3F75

*-----------------------
* PUT
*-----------------------

LB3D6    CLC
         JSR   LB4C1
         PHP
         JSR   LB5C6
         PLP
         JSR   LB50F
         LDY   #$08
         JSR   L34C1
         JSR   L18D1
         BCS   LB3D3
LB3EC    REP   #$30
         LDA   L18E6
         STA   $E9
         SEP   #$30
         BRL   LB916

*-----------------------
* WRITE
*-----------------------

LB3F8    LSR   $E8
         JSR   LB71C
         JSR   LB8B7
         JSR   LB5C6
         JSR   LB809
         BNE   LB40B
         JSR   LBA04
LB40B    JSR   L3CC8
         CMP   #$3B
         BNE   LB417
         JSR   L6306
         BRA   LB420
LB417    RTS

LB418    JSR   L3CC8
         BEQ   LB417
         JSR   L6346
LB420    JSR   LB58D
LB423    LDX   $2B
         REP   #$30
         LDA   L07F1,X
         SEP   #$30
         BNE   LB43C
         JSR   LBA0D
         JSR   LB9A2
         LDY   #$08
         JSR   L34B4
         JSR   LBA0D
LB43C    JSR   LB8D5
         JSR   LB571
         JSR   LB903
         BCS   LB45C
         LDY   $2B
         REP   #$30
         LDA   L07F6,Y
         CMP   $E9
         SEP   #$30
         BCC   LB459
         JSR   LB864
         BRA   LB423
LB459    BRL   LB303
LB45C    REP   #$10
         LDY   #$0000
         LDX   $E9
         DEX
         LDA   $0D
         CMP   #$08
         BCC   LB46D
         JSR   L3F4C
LB46D    STA   [$8E],Y
         INY
         CMP   #$07
         BCC   LB48A
         BEQ   LB483
         DEX
         DEX
         REP   #$30
         LDA   $0B
         STA   [$8E],Y
         SEP   #$20
         INY
         BRA   LB489
LB483    DEX
         TXA
         STA   [$8E],Y
         BEQ   LB49C
LB489    INY
LB48A    LDA   [$22]
         STA   [$8E],Y
         INY
         INC   $22
         BNE   LB499
         INC   $23
         BNE   LB499
         INC   $24
LB499    DEX
         BNE   LB48A
LB49C    SEP   #$30
         JSR   LB916
         LDY   $2B
         LDA   L06F3,Y
         ORA   #$80
         STA   L06F3,Y
         JSR   LB8FD
         BCC   LB4B7
         JSR   LB8D5
         LDA   #$00
         STA   [$8E]
LB4B7    BIT   $A5
         BPL   LB4BE
         JSR   L72CA
LB4BE    BRL   LB418
LB4C1    ROR   $E8
         JSR   LB71C
         PHP
         PLX
         REP   #$30
         LDA   L07F6,Y
         PLY
         PHA
         PHY
         SEP   #$30
         PHX
         JSR   L3CC8
         CMP   #$3B
         BNE   LB4E0
         PLP
         BNE   LB4FB
LB4DD    BRL   LB6AC
LB4E0    JSR   L6346
         CMP   #$2C
         BEQ   LB4F5
         JSR   L6089
         JSR   L670D
         XBA
         TYA
         REP   #$30
         STA   $04,S
         SEP   #$30
LB4F5    PLP
         BEQ   LB4DD
         JSR   LB809
LB4FB    PHP
         JSR   L6336
         JSR   L5EC8
         REP   #$30
         PLA
         CMP   $04,S
         BCS   LB50B
         STA   $04,S
LB50B    SEP   #$30
         PLP
         RTS

LB50F    BEQ   LB551
         LDX   $2B
         REP   #$30
         LDA   L07F1,X
         BEQ   LB551
         TAY
         LDA   L07F6,X
         CMP   #$0001
         BEQ   LB529
         TYA
         CMP   L07F6,X
         BCS   LB547
LB529    PHY
         SEP   #$30
         JSR   LB9DD
         REP   #$30
         PLA
         CLC
         ADC   L18DE
         STA   L18DE
         BCC   LB53E
         INC   L18E0
LB53E    SEP   #$30
         JSR   LBA10
         BRA   LB556
         REP   #$30
LB547    INC   L07F3,X
         BNE   LB551
         SEP   #$30
         INC   L07F3,X
LB551    SEP   #$30
         JSR   LBA04
LB556    JSR   LB9C6
         REP   #$30
         PLX
         PLA
         PHX
         STA   L18E2
         STZ   L18E4
         LDA   $84
         STA   L18DE
         SEP   #$30
         LDA   $86
         STA   L18E0
         RTS

LB571    STZ   $EA
         LDY   $0D
         LDA   L1D31,Y
         CPY   #$07
         BCC   LB584
         BEQ   LB581
         BRL   LD58D
LB581    LDA   [$A6]
         SEC
LB584    ADC   #$01
         STA   $E9
         BCC   LB58C
         INC   $EA
LB58C    RTS

LB58D    JSR   L60A1
         LDA   #L0AF0
         LDY   #>L0AF0
         LDX   #^L0AF0
         BIT   $A5
         BPL   LB5A3
         JSR   L6D61
         LDA   $40
         LDY   $41
         LDX   $42
LB5A3    STA   $22
         STY   $23
         STX   $24
         BIT   $A5
         BMI   LB5B8
         BVS   LB5B8
         LDX   $A4
         CMP   #$06
         BNE   LB5B8
         JSR   LE44C
LB5B8    LDX   $A4
         BIT   $A5
         BMI   LB5BF
         INX
LB5BF    STX   $0D
         RTS

LB5C2    LDA   #$01
         BRA   LB5C8
LB5C6    LDA   #$02
LB5C8    LDY   $2B
         AND   L06F3,Y
         BEQ   LB5D0
         RTS

LB5D0    LDA   #$4E
         JMP   L3F75      ;BRL L3F75
LB5D5    CMP   #$08
         BCS   LB5E1
         AND   #$07
         CMP   #$07
         BEQ   LB5E0
         DEC
LB5E0    RTS

LB5E1    BRL   LB67F
LB5E4    LDX   #$01
         JSR   L3CC8
         BNE   LB5EE
LB5EB    BRL   L6356
LB5EE    CMP   #$DF
         BEQ   LB602
         BCS   LB62D
         CMP   #$93
         BEQ   LB612
         CMP   #$A7
         BEQ   LB609
         CMP   #$96
         BEQ   LB609
         BRA   LB626
LB602    LDA   #$8E
         JSR   L80A8
         BNE   LB60B
LB609    LDX   #$0F
LB60B    LDA   #$90
         JSR   L80A8
         BNE   LB614
LB612    LDX   #$04
LB614    LDA   #$91
         JSR   L80A8
         BNE   LB61D
         LDX   #$AD
LB61D    LDA   #$8C
         JSR   L80A8
         BNE   LB626
         LDX   #$B0
LB626    CPX   #$01
         BEQ   LB5EB
         JMP   L3CBE      ;BRL L3CBE
LB62D    BRL   L73D3
LB630    JSR   LE28F
         REP   #$30
         LDA   L1717
         STA   L0AF0
         SEP   #$30
         BRL   L78F3

*-----------------------
* FILTYP()
*-----------------------

LB640    JSR   L73D6
         JSR   LB742
         BEQ   LB6AC
         LDA   L07F0,Y
         TAY
         BRL   L7A91

*-----------------------
* TYP()
*-----------------------

LB64F    JSR   L73D6
         JSR   LB722
         SEC
         ROR   $E8
         JSR   LB8B7
         JSR   LB7EF
LB65E    JSR   LB8D5
         LDA   [$8E]
         CMP   #$00
         BNE   LB677
         LDY   $2B
         REP   #$30
         LDA   L07F1,Y
         SEP   #$30
         BEQ   LB677
         JSR   LB864
         BRA   LB65E
LB677    CMP   #$08
         BCS   LB67F
         TAY
         BRL   L7A91
LB67F    LDX   #$06
         JMP   L3FA4      ;BRL L3FA4

*-----------------------
* REC()
*-----------------------

LB684    JSR   L73D6
         JSR   LB722
         BEQ   LB6AC
         LDA   L07F0,Y
         CMP   #$B0
         BEQ   LB697
         CMP   #$04
         BNE   LB69A
LB697    JSR   LB6D0
LB69A    LDY   $2B
         LDA   L07F5,Y
         TAX
         LDA   L07F3,Y
         XBA
         LDA   L07F4,Y
         TAY
         XBA
         BRL   L7A4D
LB6AC    LDX   #$29
         JMP   L3FA4      ;BRL L3FA4

*-----------------------
* EOFMARK()
*-----------------------

LB6B1    JSR   L73D6
         JSR   LB722
         BEQ   LB6AC
         LDY   #$0E
         JSR   L34B4
         LDA   L18E1
         STA   L0AF3
         LDX   L18E0
         LDY   L18DF
         LDA   L18DE
         BRL   L7A50
LB6D0    LDY   $2B
         LDA   L06F1,Y
         STA   L18DC
         LDY   #$0C
LB6DA    JSR   L34B4
         LDY   $2B
         REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L18E0
         PHA
         LDA   L18DE
         PHA
         LDA   #$0000
         PHA
         LDA   L07F6,Y
         PHA
         _LongDivide
         SEP   #$30
         LDY   $2B
         REP   #$30
         PLA
         STA   L07F3,Y
         PLX
         PLA
         STA   $ED
         PLA
         STA   $EF
         SEP   #$30
         TXA
         STA   L07F5,Y
         RTS

LB71C    JSR   L633E
         JSR   L73D3
LB722    TXA
         BEQ   LB746
LB725    CPX   #$1E
         BCS   LB746
LB729    STX   $1B
         LDY   L1D11,X
         STY   $2B
         LDA   L06F0,Y
         STZ   L18DC
         BPL   LB73E
         LDA   L06F1,Y
         STA   L18DC
LB73E    STZ   L18DC+1
         RTS

LB742    CPX   #$20
         BCC   LB729
LB746    JMP   L6708      ;BRL L6708
LB749    JSR   LB755
         JSR   L35E3
         JSR   L3550
         LDX   $84
LB754    RTS

LB755    LDX   #$00
LB757    LDY   $76
         STX   $84
         INY
         BNE   LB7AE
         JSR   L3CC8
         CMP   #$80
         BCS   LB7AE
         CMP   #$22
         BEQ   LB7AE
         DEY
LB76A    INY
         INX
         LDA   [$4E],Y
         BMI   LB781
         CMP   #$3A
         BEQ   LB781
         CMP   #$2C
         BEQ   LB781
         CMP   #$20
         BCC   LB781
         STA   L0007,X
         BRA   LB76A
LB781    TYA
         PHA
         JSR   L8C60
         PLA
LB787    LDY   $84
LB789    STA   L0007,Y
         CLC
         TYA
         ADC   #L0007
         STA   L18F4
         STA   L18EC
         LDA   #$00
         ADC   #>L0007
         STA   L18F4+1
         STA   L18ED
         LDA   #^L0007
         STA   L18F4+2
         STA   L18EE
         STZ   L18F4+3
         JMP   L3CC8      ;BRL L3CC8
LB7AE    JSR   L60A7
         JSR   L6D61
         LDX   $84
         PHA
         JSR   LB787
         PLA
         STA   $84
         BEQ   LB7CC
         LDY   #$FF
LB7C1    INY
         INX
         LDA   [$40],Y
         STA   L0007,X
         DEC   $84
         BNE   LB7C1
LB7CC    STX   $84
         JSR   L72CA
         LDX   $84
LB7D3    RTS

LB7D4    JSR   L3CC8
         CMP   #$2C
         BNE   LB7D3
         LDY   $2B
         LDA   L06F0,Y
         BMI   LB7E5
         BRL   LCCA6
LB7E5    JSR   LB809
         BNE   LB7D3
         BRL   LBA04
LB7ED    BEQ   LB7F8
LB7EF    LDY   $2B
         LDA   L06F3,Y
         BIT   #$08
         BEQ   LB808
LB7F8    JSR   LBA04
         JSR   LB87A
         LDY   $2B
         LDA   L06F3,Y
         AND   #$F7
         STA   L06F3,Y
LB808    RTS

LB809    JSR   L3CC8
         CMP   #$2C
         BNE   LB860
         JSR   L6346
         JSR   L608F
         JSR   LE440
         LDX   $AA
         BPL   LB820
LB81D    JMP   L6708      ;BRL L6708
LB820    LDY   $2B
         LDA   L06F0,Y
         BPL   LB847
         LDA   L06F3,Y
         BIT   #$40
         BNE   LB842
         LDA   L06F1,Y
         STA   L18DC
         JSL   GSOS
         DW    $0015      ; Flush
         ADRL  L18DC
         BCS   LB861
         BRA   LB847
LB842    JSR   LB95E
         BCS   LB861
LB847    LDY   $2B
         REP   #$30
         LDA   L0AF0
         STA   L07F3,Y
         LDA   L0AF2
         CMP   #$0080
         SEP   #$30
         BCS   LB81D
         STA   L07F5,Y
         LDA   #$00
LB860    RTS

LB861    JMP   L3F75      ;BRL L3F75
LB864    JSR   LB95E
         BCS   LB861
         LDX   $2B
         INC   L07F3,X
         BNE   LB877
         REP   #$30
         INC   L07F4,X
         SEP   #$30
LB877    JSR   LBA04
LB87A    JSR   LB9A2
LB87D    LDY   #$09
         JSR   L34C1
         JSR   L18D1
         BCC   LB8A1
         CMP   #$4C
         BEQ   LB88E
         JMP   L3F75      ;BRL L3F75
LB88E    LDY   $2B
         LDA   L06F3,Y
         BIT   #$40
         BEQ   LB89E
         JSR   LB8D5
         LDA   #$00
         STA   [$8E]
LB89E    LDA   #$4C
         SEC
LB8A1    RTS

LB8A2    LDY   $2B
         LDA   L06F0,Y
         BEQ   LB8D2
         BPL   LB8B6
LB8AB    LDA   L07F0,Y
         CMP   #$B0
         BEQ   LB8B6
         CMP   #$04
         BNE   LB8CF
LB8B6    RTS

LB8B7    LDY   $2B
         LDA   L06F0,Y
         BPL   LB8CD
         LDA   #$AD
         CMP   L07F0,Y
         BNE   LB8CF
         RTS

LB8C6    LDY   $2B
         LDA   L06F0,Y
         BMI   LB8AB
LB8CD    BEQ   LB8D2
LB8CF    BRL   LCCA6
LB8D2    BRL   LB6AC
LB8D5    LDX   $2B
         STZ   $9E
         LDA   L06F4,X
         STA   $9B
         REP   #$30
         LDA   L06F5,X
         STA   $9C
         LDA   [$9B]
         CLC
         ADC   L07F1,X
         STA   $8E
         SEP   #$30
         LDY   #$02
         LDA   [$9B],Y
         ADC   #$00
         STA   $90
         LDY   #$00
         RTS

         JMP   L3F6A      ;BRL L3F6A
LB8FD    LDA   #$01
         STA   $E9
         STZ   $EA
LB903    LDY   $2B
         REP   #$31
         LDA   $E9
         ADC   L07F1,Y
         STA   $DE
         LDA   L07F6,Y
         CMP   $DE
         SEP   #$30
         RTS

LB916    LDY   $2B
         REP   #$31
         LDA   $E9
         ADC   L07F1,Y
         STA   L07F1,Y
         SEP   #$30
         RTS

LB925    JSR   LB93B
LB928    LDX   $78
         CPX   #$AD
         BNE   LB93A
         LDA   $EA
         BNE   LB93A
         LDA   $E9
         BEQ   LB93A
         CMP   #$03
         BCC   LB95B
LB93A    RTS

LB93B    STZ   $E9
         STZ   $EA
         JSR   L3CC8
         BEQ   LB95A
         JSR   L6346
         JSR   L608F
         JSR   L670D
         LDA   $A9
         BEQ   LB95B
         REP   #$30
         LDA   L0AF0
         STA   $E9
         SEP   #$30
LB95A    RTS

LB95B    JMP   L6708      ;BRL L6708
LB95E    LDY   $2B
         CLC
         LDA   L06F3,Y
         BPL   LB95A
         REP   #$30
         LDA   L07F1,Y
         PHA
         SEP   #$30
         BEQ   LB97B
         JSR   LB8FD
         PHP
         JSR   LBA0D
         JSR   LB9A2
         PLP
LB97B    REP   #$30
         PLA
         ADC   #$0000
         STA   L18E2
         SEP   #$30
         LDY   #$08
         JSR   L34C1
         JSR   L18D1
         BCS   LB9A1
         LDX   $2B
         LDA   L06F3,X
         AND   #$7F
         STA   L06F3,X
         REP   #$30
         STZ   L07F1,X
         SEP   #$30
LB9A1    RTS

LB9A2    LDX   $2B
         STZ   $9E
         LDA   L06F4,X
         STA   $9B
         REP   #$30
         LDA   L06F5,X
         STA   $9C
         LDA   [$9B]
         STA   L18DE
         LDA   L07F6,X
         STA   L18E2
         SEP   #$30
         LDY   #$02
         LDA   [$9B],Y
         STA   L18E0
LB9C6    STZ   L18E1
         STZ   L18E4
         STZ   L18E5
         LDY   $2B
         LDA   L06F1,Y
         BEQ   LB9DA
         STA   L18DC
         RTS

LB9DA    JSR   L3F4C
LB9DD    LDY   $2B
         REP   #$30
         LDA   L07F4,Y
         STA   $C1
         LDA   L07F6,Y
         STA   $EF
         SEP   #$30
         LDA   L07F3,Y
         STA   $C0
         JSR   L694C
         REP   #$30
         LDA   $EB
         STA   L18DE
         LDA   $ED
         STA   L18E0
         SEP   #$30
LBA03    RTS

LBA04    LDX   $2B
         REP   #$30
         STZ   L07F1,X
         SEP   #$30
LBA0D    JSR   LB9DD
LBA10    LDY   #$0B
         JSR   L34C1
         JSR   L18D1
         BCC   LBA03
         CMP   #$4D
         BEQ   LBA21
         JMP   L3F75      ;BRL L3F75
LBA21    BIT   $E8
         BMI   LBA5E
         JSR   LB5C6
         LDX   $2B
         REP   #$30
         LDA   L07F6,X
         CLC
         ADC   L18DE
         STA   L18DE
         SEP   #$30
         BCC   LBA3D
         INC   L18E0
LBA3D    LDY   #$0D
         JSR   L34B4
         LDX   $2B
         REP   #$30
         LDA   L18DE
         SEC
         SBC   L07F6,X
         STA   L18DE
         SEP   #$30
         BCS   LBA10
         LDA   L18E0
         SBC   #$00
         STA   L18E0
         BRA   LBA10
LBA5E    LDY   $2B
         LDA   L06F3,Y
         BIT   #$40
         BEQ   LBA6D
         JSR   LB8D5
         TYA
         STA   [$8E]
LBA6D    BRL   L82AD

*-----------------------
* CHAIN
*-----------------------

LBA70    JSR   LBA9D
         JSR   LBD9F
         JSR   L5AC1
LBA79    JSR   L8358
         JSR   L5AEE
         JSR   L5AC4
         LDA   $30
         ORA   $31
         ORA   L03D4
         BEQ   LBA98
         JSR   L8B85
         BCS   LBA98
         LDA   L03D4
         BEQ   LBA98
         BRL   L8BE9
LBA98    STZ   $E7
         JMP   L3BEF      ;BRL L3BEF
LBA9D    JSR   LB749
         LDA   #$01
         LDX   #$AB
         JSR   LB222
         JSR   L3CC8
         BEQ   LBAB2
         JSR   L6346
         JMP   L3FA0      ;BRL L3AF0
LBAB2    LDA   #$00
         STZ   $30
         STZ   $31
         STZ   L03D3
         STZ   L03D4
         RTS

*-----------------------
* COPY
*-----------------------

LBABF    LDA   L171D
         BEQ   LBAC9
         LDX   #$3E
         JMP   L3FA4      ;BRL L3FA4
LBAC9    REP   #$30
         LDA   $6A
         SEC
         SBC   $64
         DEC
         BMI   LBAD8
         CMP   #$0005
         BCS   LBADB
LBAD8    JMP   L3FA2      ;BRL L3FA2
LBADB    CMP   #$00FF
         BCC   LBAE3
         LDA   #$00FE
LBAE3    STA   L1727+1
         LDA   $64
         INC
         STA   L1723+1
         SEP   #$30
         STZ   L1723
         STZ   L1727
         JSR   LBEE2
         LDA   #$FF
         STA   L171D
         JSR   L3CC8
         BEQ   LBB42
         JSR   L6346
         JSR   L3AF0
         BNE   LBB15
         LDA   $30
         ORA   $31
         ORA   L03D4
         BNE   LBB16
         JMP   L3BA0      ;BRL L3BA0
LBB15    RTS

LBB16    JSR   L903F
         BCS   LBB1E
         BRL   L8BE9
LBB1E    JSR   L8AD8
         LDA   [$97]
         INC
         TAY
         INC
         CLC
         ADC   $97
         STA   $4E
         REP   #$30
         LDA   $98
         BCC   LBB32
         INC
LBB32    STA   $4F
         LDA   [$97],Y
         STA   $75
         SEP   #$30
         STY   L171D
         LDX   #$AA
         JSR   L81A9
LBB42    REP   #$30
         LDA   L18F8
         STA   L1719
         LDA   L18F8+2
         STA   L171B
         SEP   #$30
         JSR   LBC07
         LDX   #$00
         LDA   #$01
         JSR   LB222
         LDA   #$41
         LDX   L18F8+2
         CPX   #$0F
         BEQ   LBB9A
         LDA   L18DC
         STA   L171F
         JSR   LBC07
         REP   #$30
         LDA   L1719
         STA   L18EC
         STA   L18F4
         LDA   L171B
         STA   L18F4+2
         STA   L18EE
         SEP   #$30
         LDX   L18F8+2
         LDA   #$C3
         LDY   #$01
         JSR   LBC4D
         BCS   LBB9A
         LDY   #$06
         JSR   L34C1
         JSR   L18D1
         BCC   LBBA0
LBB9A    BRL   LA98D
LBB9D    JMP   L3F75      ;BRL L3F75
LBBA0    LDA   L18EA
         STA   L1720
LBBA6    JSR   LBC07
         LDA   L171F
         STA   L1721
         JSL   GSOS
         DW    $0012      ; Read
         ADRL  L1721
         BCS   LBBDA
         REP   #$30
         LDA   L172B
         STA   L1727
         SEP   #$30
         JSR   LBC07
         LDA   L1720
         STA   L1721
         JSL   GSOS
         DW    $0013      ; Write
         ADRL  L1721
         BCC   LBBA6
LBBDA    PHA
         LDA   L171F
         STA   L18DC
         JSR   LAD4A
         LDA   L1720
         STA   L18DC
         JSR   LAD4A
         STZ   L171F
         STZ   L1720
         PLA
         CMP   #$4C
         BNE   LBB9D
         BIT   L171D
         BMI   LBC03
         JSR   L8C51
         JSR   L8C1A
LBC03    STZ   L171D
         RTS

LBC07    BIT   L171D
         BMI   LBC11
         LDX   #$AA
         BRL   L82C2
LBC11    RTS

*-----------------------
* CREATE
*-----------------------

LBC12    JSR   LB755
         JSR   L6346
         LDA   #$92
         JSR   L80C3
         JSR   LB5E4
         STX   $78
         JSR   LB925
         LDX   $78
         REP   #$30
         LDA   $E9
         BNE   LBC35
         CPX   #$00AD
         BNE   LBC35
         LDA   #$0200
LBC35    STA   L18FC
         SEP   #$30
         LDY   #$00
         LDA   #$C3
         CPX   #$0F
         BNE   LBC44
         LDY   #$0D
LBC44    JSR   LBC4D
         BCS   LBC4A
         RTS

LBC4A    JMP   L3F75      ;BRL L3F75
LBC4D    STX   L18F8+2
         STY   L1900
         STA   L18F8
         STZ   L1900+1
         STZ   L18F8+3
         STZ   L18F8+1
         REP   #$30
         STZ   L1902+2
         STZ   L1902
         STZ   L18FE
         SEP   #$30
         LDY   #$01
         JSR   L34C1
         JMP   L18D1      ;BRL L18D1

*-----------------------
* INIT 
*-----------------------

LBC74    JSR   LBEE2
         LDA   #$01
         STA   L18FC
         STZ   L18FC+1
         JSL   GSOS
         DW    $0008      ; Volume
         ADRL  L1916
         BCS   LBCAB
         LDA   L1926
         CMP   #$01
         BNE   LBCC9
         LDA   $76
         INC
         BNE   LBCAF
         JSR   L933A
         LDA   #L2D6D
         LDY   #>L2D6D
         LDX   #^L2D6D
         JSR   LBCCE
         PHP
         JSR   L933A
         PLP
         BEQ   LBCAF
         RTS

LBCAB    CMP   #$27
         BNE   LBCCB
LBCAF    LDAL  $0197C9
         PHA
         JSL   GSOS
         DW    $0024      ; Format
         ADRL  L18F4
         PLX
         PHA
         TXA
         STAL  $0197C9
         PLA
         BCS   LBCCB
         RTS

LBCC9    LDA   #$52
LBCCB    JMP   L3F75      ;BRL L3F75
LBCCE    JSR   L93FB
         LDX   L039B
         STZ   L039C,X
         LDA   #L039C
         LDY   #>L039C
         LDX   #^L039C
         JSR   L93FB
         JSR   L93B9
         JSR   L80D4
         STZ   L16F1
         STZ   L16EF
         JSR   L351F
         JSR   LA7DB
         CMP   #$59
         BEQ   LBCF8
         CMP   #$79
LBCF8    RTS

LBCF9    LDA   #$40
LBCFB    JMP   L3F75      ;BRL L3F75

*-----------------------
* SAVE
*-----------------------

LBCFE    BNE   LBD10
         LDY   L0087
         BEQ   LBCF9
LBD05    LDA   L0087,Y
         STA   L0007,Y
         DEY
         BPL   LBD05
         BRA   LBD4E
LBD10    BPL   LBD1C
         LDA   #$93
         JSR   L80C3
         BEQ   LBD3F
LBD19    BRL   LB749
LBD1C    JSR   L664D
         CMP   #$41
         BNE   LBD4B
         LDY   #$02
         LDA   [$4E],Y
         BEQ   LBD2D
         CMP   #$20
         BNE   LBD4B
LBD2D    DEY
         LDA   [$4E],Y
         JSR   L664D
         CMP   #$53
         BNE   LBD4B
         JSR   L6306
         JSR   L3CBE
         BNE   LBD19
LBD3F    LDA   #L0088
         LDY   #>L0088
         LDX   #^L0088
         JSR   L93FB
         BRL   L933A
LBD4B    JSR   LB749
LBD4E    LDA   #$02
         LDX   #$AB
         JSR   LB222
         LDA   L107C
         SEC
         SBC   L1068
         STA   $C0
         REP   #$30
         LDA   L107D
         SBC   L1069
         STA   $C1
         SEP   #$30
         STZ   $C3
         REP   #$30
         LDA   L1068
         STA   $40
         SEP   #$30
         LDA   L106A
         STA   $42
         LDY   #$01
         LDA   #$10
         STA   [$40],Y
         INY
         LDA   L0B1E
         STA   [$40],Y
         INY
         LDA   L0B1C
         STA   [$40],Y
         STZ   $E8
         JSR   LBE6B
         LDY   #$0C
         JSR   L34B4
         LDY   #$0D
         JSR   L34B4
         JSR   LAD4A
         RTS

LBD9F    JSR   L5B06
         LDY   #$0E
         JSR   L34B4
         LDX   $C0
         STZ   L1092
         REP   #$30
         LDA   L18DE
         STA   $C0
         LDA   L18E0
         STA   $C2
         LDA   $C1
         CPX   #$0000
         BEQ   LBDC0
         INC
LBDC0    INC
         STA   L1093
         CMP   L1049
         BCC   LBDFD
         BEQ   LBDFD
         LDX   $75
         CPX   #$FF00
         BCC   LBDE5
         LDX   $19
         CPX   #$0100
         BCS   LBDE5
         LDA   $C1
         LSR
         LSR
         LSR
         CLC
         ADC   L1093
         STA   L1093
LBDE5    LDA   L1092
         SEC
         SBC   L1048
         STA   $1C
         SEP   #$30
         LDA   L1094
         SBC   L104A
         STA   $1E
         LDX   #$08
         JSR   L562F
LBDFD    REP   #$30
         LDA   L1068
         STA   $40
         CLC
         ADC   $C0
         STA   L107C
         SEP   #$30
         LDA   L106A
         STA   $42
         ADC   $C2
         STA   L107E
         LDA   #$01
         STA   $E8
         JSR   LBE6B
         LDA   L106A
         STA   $42
         REP   #$30
         LDA   L1068
         STA   $40
         SEP   #$30
         LDY   #$02
         LDA   [$40],Y
         STA   L0B1E
         INY
         LDA   [$40],Y
         STA   L0B1C
         LDA   [$40]
         SEC
         ADC   $40
         STA   $4B
         REP   #$30
         LDA   $41
         BCC   LBE46
         INC
LBE46    STA   $4C
         SEP   #$30
         BRL   LAD4A
LBE4D    JMP   L3FA2      ;BRL L3FA2

*-----------------------
* LOAD
*-----------------------

LBE50    JSR   LB749
         LDA   #$01
         LDX   #$AB
         JSR   LB222
         JSR   L5A7B
         JSR   LBD9F
         LDA   #$80
         STA   $C4
         JMP   L40D8      ;BRL L40D8

LBE67    HEX   00FE0000

LBE6B    LDA   $C2
         BEQ   LBEAB
LBE6F    LDX   #$03
LBE71    LDA   LBE67,X
         STA   L18E2,X
         DEX
         BPL   LBE71
         JSR   LBEC2
         LDA   $40
         CLC
         ADC   LBE67
         STA   $40
         LDA   $41
         ADC   LBE67+1
         STA   $41
         LDA   $42
         ADC   LBE67+2
         STA   $42
         LDA   $C0
         SEC
         SBC   LBE67
         STA   $C0
         LDA   $C1
         SBC   LBE67+1
         STA   $C1
         LDA   $C2
         SBC   LBE67+2
         STA   $C2
         BRA   LBE6B
LBEAB    LDA   $C1
         CMP   LBE67+1
         BCS   LBE6F
         LDA   $C1
         STA   L18E3
         LDA   $C0
         STA   L18E2
         STZ   L18E4
         STZ   L18E5
LBEC2    LDX   $42
         REP   #$30
         LDA   $40
         STA   L18DE
         STX   L18E0
         SEP   #$30
         LDA   $E8
         CLC
         ADC   #$08
         TAY
         JSR   L34C1
         JSR   L18D1
         BCC   LBEE1
         BRL   LA98D
LBEE1    RTS

LBEE2    JSR   LB755
         REP   #$30
         LDA   L18F4+2
         PHA
         LDA   L18F4
         PHA
         SEP   #$30
         JSR   L6346
         INX
         JSR   LB757
         REP   #$30
         LDA   L18F4
         STA   L18F8
         LDA   L18F4+2
         STA   L18F8+2
         PLA
         STA   L18F4
         PLA
         STA   L18F4+2
         SEP   #$30
         RTS

*-----------------------
* RENAME
*-----------------------

LBF11    JSR   LBEE2
         JSR   L3CC8
         BNE   LBF1B
         LDA   #$00
LBF1B    STA   $0D
         BEQ   LBF33
         CMP   #$2C
         BEQ   LBF26
         JMP   L6356      ;BRL L6356
LBF26    JSR   L3CBE
         LDA   #$92
         JSR   L80C3
         JSR   LB5E4
         STX   $78
LBF33    LDY   #$03
         JSR   L34B4
         LDA   $0D
         BNE   LBF3D
         RTS

LBF3D    REP   #$30
         LDA   L18F8
         STA   L18F4
         LDA   L18F8+2
         STA   L18F4+2
         SEP   #$30
         JSR   LB219
         BCC   LBF55
         JMP   L3F75      ;BRL L3F75
LBF55    LDA   $78
         STA   L18F8+2
LBF5A    BRL   LBF72

*-----------------------
* UNLOCK
*-----------------------

LBF5D    LDA   #$C3
         BRA   LBF63

*-----------------------
* LOCK
*-----------------------

LBF61    LDA   #$01
LBF63    STA   $77
         JSR   LB755
         JSR   LB216
         BCS   LBF77
         LDA   $77
         STA   L18F8
LBF72    LDY   #$04
         JMP   L34B4      ;BRL L34B4
LBF77    JMP   L3F75      ;BRL L3F75

*-----------------------
* DELETE
*-----------------------

LBF7A    JSR   LB755
         LDY   #$02
         JMP   L34B4      ;BRL L34B4

*-----------------------
* PREFIX 
*-----------------------

LBF82    BEQ   LBFB5
         CMP   #$24
         BEQ   LBFAF
         CMP   #$3F
         BNE   LBFE1
         JSR   L6306
         LDA   #$00
         STA   L179F
LBF94    LDA   L179F
         ORA   #$30
         JSR   L9415
         JSR   L9413
         JSR   LBFBA
         INC   L179F
         LDA   L179F
         CMP   #$08
         BCC   LBF94
         BRL   L933A
LBFAF    JSR   L6306
         BRL   L7102
LBFB5    LDA   #$00
         STA   L179F
LBFBA    JSL   GSOS
         DW    $000A      ; GetPrefix
         ADRL  L179F
         BCS   LC034
         LDX   L0007
         STZ   L0008,X
         JSR   LBFD8
LBFCF    LDX   $76
         INX
         BNE   LBFD7
         BRL   L933A
LBFD7    RTS

LBFD8    LDA   #L0008
         LDY   #>L0008
         LDX   #^L0008
         BRL   L93FB
LBFE1    STZ   L179F
         CMP   #$F0
         BCC   LBFF0
         CMP   #$F8
         BCS   LBFFB
         AND   #$0F
         BRA   LBFFE
LBFF0    JSR   L4F89
         BCC   LC01D
         SBC   #$30
         CMP   #$08
         BCC   LBFFE
LBFFB    JMP   L6708      ;BRL L6708
LBFFE    STA   L179F
         JSR   L3CBE
         BEQ   LBFBA
         CMP   #$2C
         BNE   LC00F
         JSR   L6306
         BRA   LC01D
LC00F    CMP   #$2F
         BEQ   LC017
         LDA   #$40
         BRA   LC034
LC017    JSR   L6363
         JSR   L6363
LC01D    JSR   LB755
         JSR   L3623
         JSL   GSOS
         DW    $0009      ; SetPrefix
         ADRL  L179F
         BCS   LC034
         BIT   $E7
         BMI   LBFBA
         RTS

LC034    JMP   L3F75      ;BRL L3F75

*-----------------------
* VOLUMES
*-----------------------

LC037    LDA   #$01
LC039    STA   $0B
         ORA   #$30
         STA   L000A	; n
         REP   #$30
         LDA   #$442E	; .D
         STA   L0008
         LDA   #$2020	; SPC SPC 
         STA   L000B
         SEP   #$30
         STZ   L000D
         LDA   #$03
         STA   L0007
         JSL   GSOS
         DW    $0008      ; Volume
         ADRL  L1916
         BCC   LC094
         CMP   #$11
         BEQ   LC0C2
         LDX   #$51
         CMP   #$10
         BEQ   LC087
         LDX   #$2A
         CMP   #$28
         BEQ   LC087
         LDX   #$1B
         CMP   #$52
         BEQ   LC087
         LDX   #$1C
         CMP   #$27
         BEQ   LC087
         CMP   #$2F
         BEQ   LC087
         JMP   L3F75      ;BRL L3F75
LC087    PHX
         JSR   LBFD8
         PLX
         JSR   L409C
         JSR   L4088
         BRA   LC0B3
LC094    JSR   LBFD8
         JSR   L363B
         LDX   L0007
         STZ   L0008,X
         JSR   LBFD8
         LDA   #$16
         JSR   LC0C5
         REP   #$30
         LDA   L1922+2
         LDX   L1922
         JSR   L4808
LC0B3    SEP   #$30
         JSR   LBFCF
         LDA   $0B
         INC
         CMP   #$0A
         BCS   LC0C2
         BRL   LC039
LC0C2    BRL   L933A
LC0C5    PHA
LC0C6    LDA   $2F
         CMP   $01,S
         BCS   LC0D1
         JSR   L9413
         BRA   LC0C6
LC0D1    PLA
         RTS

*-----------------------
* TYPE
*-----------------------

LC0D3    JSR   LB755
         LDA   #$01
         LDX   #$00
         JSR   LB222
         LDA   L18F8+2
         CMP   #$04
         BEQ   LC0EE
         CMP   #$B0
         BEQ   LC0EE
LC0E8    JSR   LAD4A
         BRL   LCCA6
LC0EE    JSR   LA97A
         LDA   #$00
         STA   $0B
         JSR   L3CC8
         BEQ   LC13B
         CMP   #$2C
         BNE   LC130
         JSR   L6306
         LDA   #$81
         JSR   L80A8
         BNE   LC136
         JSR   L6306
         JSR   L633E
         JSR   L73D3
         JSR   LB725
         STX   $18
         TXA
         BEQ   LC124
         LDA   L07F0,Y
         CMP   #$04
         BEQ   LC124
         CMP   #$B0
         BNE   LC0E8
LC124    JSR   L3CC8
         BEQ   LC13B
         JSR   L6306
         CMP   #$2C
         BEQ   LC136
LC130    JSR   LAD4A
         JMP   L6356      ;BRL L6356
LC136    JSR   L73D3
         STX   $0B
LC13B    LDA   #$80
         STA   L16F1
LC140    REP   #$30
         LDA   #L0007
         STA   L18DE
         LDA   #^L0007
         STA   L18E0
         LDA   #$00FF
         STA   L18E2
         STZ   L18E4
         LDA   L17AB
         STA   L18DC
         SEP   #$30
         LDY   #$09
         JSR   L34C1
         JSR   L18D1
         BCC   LC170
         CMP   #$4C
         BEQ   LC1AF
         BRL   LA98D
LC170    LDY   L18E6
         LDA   L0006,Y
         STA   $0C
         CMP   #$0D
         BEQ   LC180
         CMP   #$8D
         BNE   LC183
LC180    DEC   L18E6
LC183    LDX   $0B
         BEQ   LC18C
         CPX   L18E6
         BCC   LC18F
LC18C    LDX   L18E6
LC18F    STZ   L0007,X
         LDA   #L0007
         LDY   #>L0007
         LDX   #^L0007
         JSR   L93FB
         LDA   $0C
         CMP   #$0D
         BEQ   LC1A5
         CMP   #$8D
         BNE   LC140
LC1A5    JSR   L933A
         JSR   LC2B5
         BCS   LC1AF
         BRA   LC140
LC1AF    LDA   #$FF
         STA   $18
         JSR   L933A
         STZ   L16F1
         STZ   L16EF
         JSR   L80D4
         LDA   L17AB
         STA   L18DC
         BRL   LAD4A

*-----------------------
* DIR 
*-----------------------

LC1C8    JSR   L7505
         LDA   #$FF
         STA   L175F
         LDA   #$01
         STA   L037B
         LDA   #$3D
         STA   L037C
         STZ   L037D
         STZ   L0370
         LDA   #$50
         BRA   LC1ED

*-----------------------
* CAT 
*-----------------------

LC1E4    LDA   #$28
         BRA   LC1EA

*-----------------------
* CATALOG 
*-----------------------

LC1E8    LDA   #$50
LC1EA    STZ   L175F
LC1ED    STA   L022E
         JSR   L3CC8
         BEQ   LC228
         BCC   LC201
         CMP   #$F9
         BCS   LC239
         CMP   #$F0
         BCC   LC20A
         AND   #$3F
LC201    XBA
         JSR   L3CBE
         BEQ   LC21C
         JSR   L6363
LC20A    JSR   LB755
         BIT   L175F
         BPL   LC217
         JSR   LC5C1
         BCS   LC228
LC217    JSR   L3623
         BRA   LC23C
LC21C    XBA
         SEC
         SBC   #$30
         CMP   #$08
         BCC   LC22A
         LDA   #$40
         BRA   LC239
LC228    LDA   #$00
LC22A    STA   L179F
         JSL   GSOS
         DW    $000A      ; GetPrefix
         ADRL  L179F
         BCC   LC23C
LC239    JMP   L3F75      ;BRL L3F75
LC23C    LDX   L0007
         LDY   #$00
         TXA
         JSR   LB789
         LDA   #$01
         LDX   #$00
         JSR   LB222
         LDY   #$08
         LDA   #$00
LC250    STA   L07E7,Y
         STA   L08E7,Y
         DEY
         BNE   LC250
         LDY   #$F8
         STY   $2B
         JSR   LC32B
         LDA   L18DC
         STA   L06F1,Y
         LDA   #$80
         STA   L06F0,Y
         LDA   #$80
         STA   L16F1
         BIT   L175F
         BPL   LC284
         JSR   L3CC8
         BEQ   LC284
         CMP   #$2C
         BEQ   LC281
         JMP   L6356      ;BRL L6356
LC281    JSR   LC60B
LC284    JSR   L933A
         JSR   LC2B5
         BCS   LC297
         LDY   #$F8
         STY   $2B
         JSR   LC2DA
         BCS   LC2A6
         BRA   LC284
LC297    JSR   L933A
         LDX   #$F8
         STX   $2B
         LDA   #$04
         STA   L06F7,X
         JSR   LC2DA
LC2A6    JSR   L933A
         STZ   L16F1
         STZ   L16EF
         JSR   L80D4
         BRL   LC938
LC2B5    BIT   L16EF
         BPL   LC2D6
         JSR   L8258
         LDA   #$80
         STA   L16F1
         LDA   L16F3
         CMP   L16ED
         BEQ   LC2D8
         CMP   #$20
         BNE   LC2D6
         JSR   L80CD
LC2D1    LDA   L16EF
         BPL   LC2D1
LC2D6    CLC
         RTS

LC2D8    SEC
         RTS

LC2DA    JSR   LC3AE
         BCC   LC2E0
         RTS

LC2E0    LDX   L022E
         CPX   #$50
         BCS   LC2EA
         STZ   L022F,X
LC2EA    BIT   L175F
         BPL   LC320
         LDA   L0230
         BPL   LC320
         AND   #$7F
         STA   L0230
         LDA   L022F
         CMP   #$20
         BNE   LC308
         JSR   L9413
         JSR   LA2C4
         BRA   LC311
LC308    JSR   LA2C4
         LDA   L022F
         JSR   L9415
LC311    LDA   L0230
         JSR   L9415
         JSR   LA2D1
         LDA   #L0231
         LDY   #>L0231
         BRA   LC324
LC320    LDY   #>L022F
         LDA   #L022F
LC324    LDX   #^L022F
         JSR   L93A3
         CLC
         RTS

LC32B    LDY   $2B
         LDA   #$01
         STA   L06F3,Y
         LDA   #$00
         STA   L06F7,Y
         STA   L07F1,Y
         STA   L07F2,Y
         LDX   L1900
         CPX   #$0F
         BNE   LC368
         LDA   L18FC
         STA   L07F5,Y
         LDA   L18FC+1
         STA   L07F6,Y
         LDA   L18FE
         STA   L07F7,Y
         LDA   L190A
         STA   L06F4,Y
         LDA   L190A+1
         STA   L06F5,Y
         LDA   L190A+2
         STA   L06F6,Y
LC368    RTS

LC369    XBA
         TYA
         REP   #$30
         TAY
LC36E    REP   #$30
LC370    LDA   #$0000
LC373    STY   L0333
         STA   L0335
         LDA   #$0000
         STA   L0331
         LDA   #$0001
         STA   L032F
         PEA   ^L032F
         PEA   L032F
         PEA   ^L0333
         PEA   L0333
         PEA   ^L034D
         PEA   L034D
         LDA   #$0300
         ORA   #$000B
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         LDX   L0351
         STZ   L0352,X
         RTS

LC3AE    LDY   #$50
         LDA   #$20
LC3B2    STA   L022E,Y
         DEY
         BNE   LC3B2
         STY   L027E
         LDX   $2B
         INC   L07F3,X
         BNE   LC3C5
         INC   L07F4,X
LC3C5    LDA   L06F7,X
         ASL
         TAY
         LDA   L1D41+1,Y
         PHA
         LDA   L1D41,Y
         PHA
         RTS

LC3D3    STZ   L1733
         LDA   #$01
         STA   L1735
         LDY   L0007
LC3DE    LDA   L0007,Y
         STA   L022F,Y
         DEY
         BNE   LC3DE
         BRA   LC3E9

LC3E9    LDX   $2B
         INC   L06F7,X
         TXY
         LDA   L06F7,Y
         CMP   #$06
         RTS

LC3F5    LDY   #LC45D-LC40E
         BIT   L175F
         BMI   LC3FE
         LDY   #$00
LC3FE    LDX   #$00
LC400    LDA   LC40E,Y
         BEQ   LC40C
         STA   L0230,X
         INY
         INX
         BRA   LC400
LC40C    BRA   LC3E9

LC40E    ASC   'NAME           TYPE  KBYTES  MODIFIED  '
         ASC   '       CREATED          ENDFILE SUBTYPE'00

LC45D    ASC   '   FILE NAME                       TYPE'
         ASC   '  SIZE  LAST MODIFIED           ACCESS'00

LC4AB    JSR   LC907
         LDA   #$01
         STA   L1733
         BCC   LC4B8
         BRL   LC3E9
LC4B8    BIT   L175F
         BPL   LC4C0
         BRL   LC73B
LC4C0    LDA   L1757
         AND   #$C3
         CMP   #$01
         BNE   LC4CD
         LDA   #$2A
         BNE   LC4D3
LC4CD    CMP   #$C3
         BEQ   LC4D6
         LDA   #$2B
LC4D3    STA   L022F
LC4D6    LDY   L0005
         CPY   #$10
         BCC   LC4DF
         LDY   #$0F
LC4DF    LDA   L0006,Y
         STA   L022F,Y
         DEY
         BNE   LC4DF
         LDA   L0005
         CMP   #$10
         BCC   LC4F4
         LDA   #$2B
         STA   L023F
LC4F4    LDY   #$11
         JSR   LC7F7
         REP   #$30
         LDY   L173F
         LDA   L173F+2
         AND   #$00FF
         JSR   LC373
         MX    %11
         LDX   #$08
         LDY   L0351
LC50C    LDA   L0351,Y
         STA   L026D,X
         DEX
         DEY
         BNE   LC50C
         REP   #$30
         LDA   L1743
         LSR
         TAY
         JSR   LC370
         MX    %11
         LDY   L0351
         LDX   #$05
         LDA   L1743
         LSR
         BCC   LC539
         LDA   #$2E
         STA   L0352,Y
         LDA   #$35
         STA   L0353,Y
         INY
         INY
         INX
         INX
LC539    LDA   L0351,Y
         STA   L0243,X
         DEX
         DEY
         BNE   LC539
         LDX   #$08
         LDY   #$1E
         JSR   LC946
         LDX   #$00
         LDY   #$2F
         JSR   LC946
         LDX   #$08
         LDY   #$28
         JSR   LC9FD
         LDX   #$00
         LDY   #$39
         JSR   LC9FD
         LDY   #$48
         LDA   L173D
         CMP   #$AB
         BEQ   LC590
         CMP   #$06
         BEQ   LC590
         CMP   #$04
         BEQ   LC578
         CMP   #$B0
         BEQ   LC578
         CMP   #$AD
         BNE   LC5BF
LC578    LDA   #$52
         STA   L022F,Y
         LDA   #$3D
         STA   L0230,Y
         INY
         INY
         TYX
         LDA   L1759+1
         LDY   L1759
         JSR   LCA3B
         BRA   LC5BF
LC590    LDA   #$41
         STA   L022F,Y
         LDA   #$24
         STA   L0231,Y
         REP   #$30
         PHY
         PEA   $0000
         PEA   $0000
         LDA   L1759
         PHA
         _HexIt
         PLX
         PLA
         PLY
         STA   L0234,Y
         TXA
         STA   L0232,Y
         SEP   #$30
         LDA   #$3D
         STA   L0230,Y
LC5BF    CLC
         RTS

LC5C1    LDX   L0007
         BEQ   LC609
         STZ   $0B
         INX
LC5C9    DEX
         BEQ   LC5E3
         LDA   L0007,X
         CMP   #$2F
         BEQ   LC5E3
         CMP   #$2D
         BEQ   LC5DF
         CMP   #$23
         BEQ   LC5DF
         CMP   #$3D
         BNE   LC5C9
LC5DF    INC   $0B
         BRA   LC5C9
LC5E3    LDA   $0B
         BEQ   LC609
         LDA   L0007
         STA   L037B
         STX   L0007
         LDY   #$00
LC5F2    INX
         LDA   L0007,X
         STA   L037C,Y
         INY
         CPX   L037B
         BCC   LC5F2
         STY   L037B
         LDX   L0007
         BNE   LC609
         SEC
         RTS

LC609    CLC
         RTS

LC60B    STZ   L0370
         STZ   L036E
LC611    JSR   L3CC8
         BNE   LC617
         RTS

LC617    CMP   #$2C
         BEQ   LC61E
         JMP   L6356      ;BRL L6356
LC61E    JSR   L3CBE
         CMP   #$2D
         BNE   LC62D
         JSR   L3CBE
         LDA   #$FF
         STA   L036E
LC62D    LDA   [$4E]
         CMP   #$DF
         BEQ   LC642
         TAX
         BMI   LC63D
         JSR   L664D
         CMP   #$41
         BCS   LC642
LC63D    JSR   L73D3
         BRA   LC645
LC642    JSR   LC858
LC645    TXA
         INC   L0370
         LDX   L0370
         STA   L0370,X
         BRA   LC611
LC651    LDY   #$00
         LDX   #$01
LC655    LDA   L037B,X
         CMP   #$23
         BNE   LC68A
         LDA   L0007,Y
         JSR   L4F89
         BCS   LC66E
         BRA   LC66C
LC666    INY
         CPY   L0005
         BEQ   LC6A8
LC66C    CLC
         RTS

LC66E    INX
         CPX   L037B
         BEQ   LC676
         BCS   LC666
LC676    INY
         CPY   L0005
         BCC   LC655
         CPX   L037B
         BNE   LC66C
         LDA   L037B,X
         CMP   #$3D
         BNE   LC66C
         BRA   LC6A8
LC68A    CMP   #$2D
         BEQ   LC66E
         CMP   #$3D
         BEQ   LC6A3
         JSR   L664D
         STA   $B6
         LDA   L0007,Y
         JSR   L664D
         CMP   $B6
         BEQ   LC66E
         BRA   LC66C
LC6A3    CPX   L037B
         BCC   LC6AA
LC6A8    SEC
         RTS

LC6AA    INX
         STX   $B7
         LDA   L037B,X
         CMP   #$3D
         BEQ   LC711
         CMP   #$2D
         BEQ   LC711
         LDA   L037B,X
         JSR   L664D
         STA   $B6
LC6C0    LDX   $B7
         JSR   LC716
         BCC   LC66C
         STY   $B8
LC6C9    INX
         CPX   L037B
         BEQ   LC6D9
         BCC   LC6D9
         INY
         CPY   L0005
         BCC   LC6FD
         BRA   LC6A8
LC6D9    LDA   L037B,X
         CMP   #$3D
         BEQ   LC676
         CMP   #$2D
         BEQ   LC676
         INY
         CPY   L0005
         BCS   LC66C
         CMP   #$23
         BEQ   LC707
         JSR   L664D
         STA   $B3
         LDA   L0007,Y
         JSR   L664D
         CMP   $B3
         BEQ   LC6C9
LC6FD    LDY   $B8
         INY
         CPY   L0005
         BCC   LC6C0
         CLC
         RTS

LC707    LDA   L0007,Y
         JSR   L4F89
         BCS   LC6C9
         BRA   LC6FD
LC711    LDX   #$55
         JMP   L3FA4      ;BRL L3FA4
LC716    PHY
LC717    LDA   $B6
         CMP   #$23
         BEQ   LC731
         LDA   L0007,Y
         JSR   L664D
         CMP   $B6
         BEQ   LC739
LC727    INY
         CPY   L0005
         BCC   LC717
         CLC
         PLY
         INY
         RTS

LC731    LDA   L0007,Y
         JSR   L4F89
         BCC   LC727
LC739    PLA
         RTS

LC73B    LDX   L0370
         BEQ   LC758
         LDA   L173D
LC743    CMP   L0370,X
         BEQ   LC753
         DEX
         BNE   LC743
         LDA   L036E
         BMI   LC758
LC750    BRL   LC4AB
LC753    LDA   L036E
         BMI   LC750
LC758    LDX   L037B
         BEQ   LC76D
         CPX   #$01
         BNE   LC768
         LDA   L037B,X
         CMP   #$3D
         BEQ   LC76D
LC768    JSR   LC651
         BCC   LC750
LC76D    LDY   L0005
         CPY   #$21
         BCC   LC776
         LDY   #$20
LC776    LDA   L0006,Y
         STA   L0232,Y
         DEY
         BNE   LC776
         LDX   #$FD
LC781    INX
         INX
         INX
         LDA   L1EA2,X
         BEQ   LC79C
         CMP   L173D
         BNE   LC781
         LDA   L1EA2+1,X
         STA   L022F
         LDA   L1EA2+2,X
         ORA   #$80
         STA   L0230
LC79C    LDY   #$25
         JSR   LC7F7
         REP   #$30
         LDA   L1743
         LSR
         BCC   LC7AA
         INC
LC7AA    TAY
         JSR   LC370
         SEP   #$30
         LDY   L0351
         LDX   #$05
LC7B5    LDA   L0351,Y
         STA   L0257,X
         DEX
         DEY
         BNE   LC7B5
         LDA   #$4B
         STA   L025D
         LDY   #$30
         LDX   #$08
         JSR   LC9E7
         LDY   #$35
         LDX   #$08
         JSR   LC99C
         LDY   #$42
         LDX   #$08
         JSR   LC9FD
         LDY   #$48
         LDX   #$00
LC7DD    LDA   L1E96,X
         AND   L1757
         BEQ   LC7EA
         LDA   L1E9C,X
         BRA   LC7EC
LC7EA    LDA   #$20
LC7EC    STA   L022F,Y
         INY
         INX
         CPX   #$06
         BCC   LC7DD
         CLC
         RTS

LC7F7    PHY
         LDA   L173D
         JSR   LC838
         PLY
         BCS   LC811
         LDA   #$03
LC803    XBA
         LDA   L1D4D,X
         STA   L022F,Y
         INX
         INY
         XBA
         DEC
         BNE   LC803
         RTS

LC811    LDA   #$24
         STA   L022F,Y
         LDA   L173D
         AND   #$0F
         INY
         INY
         LDX   #$02
LC81F    ORA   #$30
         CMP   #$3A
         BCC   LC827
         ADC   #$06
LC827    STA   L022F,Y
         DEY
         DEX
         BEQ   LC837
         LDA   L173D
         LSR
         LSR
         LSR
         LSR
         BRA   LC81F
LC837    RTS

LC838    XBA
         LDA   #$3C
         TAX
         CLC
         ADC   #$3C
         ADC   #$3C
         XBA
LC842    XBA
         SEC
         SBC   #$03
         XBA
         DEX
         CPX   #$FF
         BEQ   LC856
         CMP   L1E01,X
         BNE   LC842
         XBA
         TAX
         XBA
         CLC
         RTS

LC856    SEC
         RTS

LC858    LDX   #$0F
         LDA   #$8E
         JSR   L80A8
         BEQ   LC873
         LDX   #$04
         LDA   #$90
         JSR   L80A8
         BEQ   LC873
         LDX   #$B0
         LDA   #$8C
         JSR   L80A8
         BNE   LC877
LC873    JSR   L6306
         RTS

LC877    STZ   $0B
         JSR   L3CC8
         LDX   #$FD
LC87E    INX
         INX
         INX
         INC   $0B
         LDA   L1D4D,X
         BEQ   LC8B4
         LDA   [$4E]
         JSR   L664D
         CMP   L1D4D,X
         BNE   LC87E
         LDY   #$01
         LDA   [$4E],Y
         JSR   L664D
         CMP   L1D4D+1,X
         BNE   LC87E
         INY
         LDA   [$4E],Y
         JSR   L664D
         CMP   L1D4D+2,X
         BNE   LC87E
         INY
         JSR   L8C60
         LDX   $0B
         LDA   L1E01-1,X
         TAX
         RTS

LC8B4    BRL   LCCA6

LC8B7    LDA   L07F5,X
         ORA   L07F6,X
         ORA   L07F7,X
         BEQ   LC901
         LDY   #$3A
LC8C4    LDA   LCA4E,Y
         STA   L022F,Y
         DEY
         BNE   LC8C4
         LDA   L07F5,X
         TAY
         LDA   L07F6,X
         LDX   #$36
         JSR   LCA3B
         LDX   $2B
         LDA   L06F4,X
         TAY
         LDA   L06F5,X
         LDX   #$21
         JSR   LCA3B
         LDX   $2B
         LDA   L07F5,X
         SEC
         SBC   L06F4,X
         TAY
         LDA   L07F6,X
         SBC   L06F5,X
         LDX   #$0E
         JSR   LCA3B
         LDX   $2B
         DEC   L06F7,X
LC901    INC   L06F7,X
         BRL   LC3E9
LC907    LDY   $2B
         LDA   L06F1,Y
         STA   L172F
         JSL   GSOS
         DW    $001C      ; GetDirEntry
         ADRL  L172F
         BCS   LC91C
LC91B    RTS

LC91C    CMP   #$4A
         BEQ   LC930
         CMP   #$61
         BEQ   LC91B
         CMP   #$01
         BNE   LC932
         JSR   LC938
         LDX   #$53
         JMP   L3FA4      ;BRL L3FA4
LC930    LDA   #$44
LC932    JSR   LC938
         JMP   L3F75      ;BRL L3F75
LC938    PHA
         STZ   L0370
         STZ   L037B
         LDY   #$F8
         JSR   LAD3E
         PLA
         RTS

LC946    STX   L007F
         STY   L0081
         LDA   L1747+3,X
         BNE   LC959
         ORA   L1747+5,X
         ORA   L1747+4,X
         BEQ   LC98D
LC959    LDY   L1747+4,X
         LDA   #$00
         JSR   LCA18
         LDA   #$2D
         STA   L0231,Y
         LDX   L007F
         LDY   L1747+3,X
         LDA   #$07
         JSR   LCA19
         LDY   L0081
         INY
         INY
         INY
LC977    LDX   L007F
         LDA   L1747+5,X
         ASL
         ASL
         TAX
LC980    LDA   L1E3D,X
         STA   L022F,Y
         INY
         INX
         CMP   #$2D
         BNE   LC980
         RTS

LC98D    LDX   #$00
LC98F    LDA   L1E8D,X
         STA   L022F,Y
         INY
         INX
         CPX   #$09
         BCC   LC98F
         RTS

LC99C    STX   L007F
         STY   L0081
         LDA   L1747+3,X
         BNE   LC9AF
         ORA   L1747+5,X
         ORA   L1747+4,X
         BEQ   LC98D
LC9AF    JSR   LC977
         LDA   #$20
         STA   L022E,Y
         LDX   L007F
         LDY   L1747+4,X
         LDA   #$04
         JSR   LCA18
         LDA   #$2C
         STA   L0231,Y
         LDX   L007F
         LDA   L1747+3,X
         CMP   #$64
         REP   #$30
         LDA   #$3931
         BCC   LC9D9
         LDA   #$3032
LC9D9    STA   L0233,Y
         SEP   #$30
         LDY   L1747+3,X
         LDA   #$0A
         JSR   LCA19
         RTS

LC9E7    LDA   L1747+7,X
         BEQ   LC9FC
         DEC
         ASL
         ASL
         TAX
LC9F0    LDA   L1E6F,X
         STA   L022F,Y
         INY
         INX
         CMP   #$2C
         BNE   LC9F0
LC9FC    RTS

LC9FD    STX   L007F
         STY   L0081
         LDY   L1747+2,X
         LDA   #$00
         JSR   LCA19
         LDA   #$3A
         STA   L0231,Y
         LDX   L007F
         LDY   L1747+1,X
         LDA   #$03
LCA18    INY
LCA19    PHA
         JSR   LC36E
         PLA
         CLC
         ADC   L0081
         TAY
         LDA   L0352
         STA   L022F,Y
         STA   L0230,Y
         LDA   L0353
         BEQ   LCA35
         STA   L0230,Y
         RTS

LCA35    LDA   #$30
         STA   L022F,Y
         RTS

LCA3B    PHX
         JSR   LC369
         LDY   #$00
         PLX
LCA42    LDA   L0352,Y
         BEQ   LCA4E
         STA   L022F,X
         INY
         INX
         BRA   LCA42
LCA4E    RTS

LCA4F    ASC   'BLOCKS FREE:       BLOCKS USED:        '
         ASC   'TOTAL BLOCKS:      '

*-----------------------
* LIBRARY
*-----------------------

LCA89    CMP   #$DF
         BNE   LCA99
         LDA   #$84
         JSR   L80A8
         BNE   LCA99
         JSR   L6306
         BRA   LCAA6
LCA99    JSR   LCBF8
         BCS   LCAA6
         BIT   L0B5E
         BPL   LCAA6
         JSR   LCC46
LCAA6    JSR   L3CC8
         BNE   LCAAC
         RTS

LCAAC    JSR   LB755
         LDA   #$01
         LDX   #$AC
         JSR   LB222
         REP   #$30
         LDA   #L0007
         STA   L18DE
         LDA   #^L0007
         STA   L18E0
         LDA   #$0074
         STA   L18E2
         STZ   L18E4
         SEP   #$30
         LDY   #$09
         JSR   L34C1
         JSR   L18D1
         BCC   LCADC
LCAD9    BRL   LA98D
LCADC    REP   #$30
         STZ   L18DE
         STZ   L18E0
         SEP   #$30
         LDY   #$0B
         JSR   L34C1
         JSR   L18D1
         BCS   LCAD9
         BIT   L0B5E
         BPL   LCB00
         JSR   LCC17
         BCC   LCB00
         JSR   LAD4A
         BRL   LCBEA
LCB00    LDY   #$0E
         JSR   L34B4
         LDA   L18E0
         ORA   L18E1
         BEQ   LCB12
         LDX   #$1F
         JMP   L3FA4      ;BRL L3FA4
LCB12    LDA   L18DE
         CMP   #$01
         REP   #$30
         LDA   L18DF
         ADC   L1079
         INC
         CMP   L1071
         BCC   LCB34
         SBC   L1071
         INC
         STA   $1D
         SEP   #$30
         STZ   $1C
         LDX   #$04
         JSR   L5603
LCB34    SEP   #$30
         JSR   LCE44
         BIT   L0B5C
         BPL   LCB62
         LDX   L107A
         STX   $93
         REP   #$30
         LDA   L1078
         STA   $91
         CLC
         ADC   L18DE
         STA   $8B
         LDA   $81
         STA   $97
         BCC   LCB57
         INX
LCB57    SEP   #$30
         STX   $8D
         LDA   $83
         STA   $99
         JSR   L5812
LCB62    REP   #$30
         LDA   L1080
         CLC
         ADC   L18DE
         STA   L1080
         BCC   LCB73
         INC   L1082
LCB73    LDA   L1078
         CLC
         ADC   L18DE
         STA   L1078
         BCC   LCB82
         INC   L107A
LCB82    SEP   #$30
         LDX   $83
         REP   #$30
         LDA   L18DE
         STA   L18E2
         LDA   $81
         STA   L18DE
         STX   L18E0
         SEP   #$30
         LDA   #$80
         STA   L0B5E
         LDY   #$09
         JSR   L34C1
         JSR   L18D1
         BCC   LCBAA
         BRL   LA98D
LCBAA    JSR   LAD4A
         LDY   #$29
LCBAF    CLC
         TYA
         ADC   #$19
         TAY
         LDA   [$81],Y
         BIT   #$01
         BEQ   LCBDC
         STY   $0B
         INY
         INY
         INY
         REP   #$20
LCBC1    LDA   [$81],Y
         PHA
         DEY
         DEY
         CPY   $0B
         BCS   LCBC1
         REP   #$30
         _LoadOneTool
         SEP   #$30
         BCC   LCBDA
         JMP   L3F6A      ;BRL L3F6A
LCBDA    LDY   $0B
LCBDC    LDA   [$81],Y
         BPL   LCBAF
         JSR   LCE44
         REP   #$30
         LDA   #$0000
         STA   [$81]
LCBEA    SEP   #$30
         JSR   L3CC8
         BEQ   LCBF7
         JSR   L6346
         BRL   LCAAC
LCBF7    RTS

LCBF8    BIT   $E7
         BPL   LCC15
         LDY   #$06
LCBFE    LDA   [$4E],Y
         JSR   L664D
         CMP   L280F,Y
         BNE   LCC15
         DEY
         BPL   LCBFE
         LDY   #$07
         JSR   L8C60
         JSR   L3CC8
         SEC
         RTS

LCC15    CLC
         RTS

LCC17    LDA   $74
         STA   $83
         REP   #$30
         LDA   $72
         STA   $81
LCC21    SEP   #$30
         LDY   #$45
         LDA   [$81],Y
         CMP   L004C
         BNE   LCC2D
         RTS

LCC2D    REP   #$30
         LDA   [$81]
         CLC
         ADC   $81
         STA   $81
         BCC   LCC3E
         SEP   #$30
         INC   $83
         REP   #$30
LCC3E    LDA   [$81]
         BNE   LCC21
         CLC
         SEP   #$30
         RTS

LCC46    STZ   $1C
         STZ   $1D
         BIT   L0B5C
         BPL   LCC86
         JSR   LCE44
         LDA   $83
         STA   $42
         LDA   $74
         STA   $99
         REP   #$30
         LDA   $63
         PHA
         LDA   L1078
         STA   $63
         SEC
         SBC   $81
         STA   $1C
         LDA   $81
         STA   $40
         LDA   $72
         STA   $97
         SEP   #$30
         LDA   $65
         PHA
         LDA   L107A
         STA   $65
         JSR   L5889
         PLA
         STA   $65
         REP   #$30
         PLA
         STA   $63
LCC86    REP   #$30
         LDA   $72
         CLC
         ADC   $1C
         STA   L1078
         STZ   L1080
         STZ   L1082
         SEP   #$30
         LDA   $74
         ADC   #$00
         STA   L107A
         STZ   L0B5E
         RTS

LCCA3    JMP   L3FA2      ;BRL L3FA2
LCCA6    LDA   #$41
         JMP   L3F75      ;BRL L3F75
LCCAB    JMP   L3F6A      ;BRL L3F6A

*-----------------------
* INVOKE
*-----------------------

LCCAE    CMP   #$DF
         BNE   LCCBE
         LDA   #$84
         JSR   L80A8
         BNE   LCCBE
         JSR   L6306
         BRA   LCCDB
LCCBE    JSR   LCBF8
         BCS   LCCDB
         BIT   L0B5C
         BPL   LCCDB
         JSR   LCD96
         PHP
         JSR   LCDFC
         PLP
         BCC   LCCDB
         REP   #$30
         LDA   L17C5
         BRA   LCCAB
         SEP   #$30
LCCDB    JSR   L3CC8
         BNE   LCCE4
         STZ   L0B5C
         RTS

LCCE4    JSR   LCE44
         BIT   L0B5C
         BMI   LCD22
         REP   #$30
         LDA   #$0200
         STA   $1C
         LDA   $82
         INC
         CMP   L1071
         SEP   #$30
         BCC   LCD07
         STZ   $1E
         LDX   #$04
         JSR   L5603
         JSR   LCE44
LCD07    LDA   #$00
         TAY
LCD0A    STA   [$81],Y
         INY
         CPY   #$42
         BCC   LCD0A
         REP   #$30
         TYA
         CLC
         ADC   L1078
         STA   L1078
         SEP   #$30
         BCC   LCD22
         INC   L107A
LCD22    JSR   LCF5C
         LDA   $6F
         SEC
         SBC   #$0A
         STA   $E1
         REP   #$30
         LDA   $70
         SBC   #$0000
         STA   $E2
         LDY   #$0008
         LDA   #$0000
LCD3B    STA   [$E1],Y
         DEY
         DEY
         BPL   LCD3B
         LDA   $E1
         SEC
         SBC   $6C
         STA   $8E
         SEP   #$30
         LDA   #$80
         STA   L0B5C
         JSR   LB755
         JSR   LCE5C
         REP   #$30
         LDA   $07
         ORA   #$0300
         LDX   L17C7
         PHA
         PHX
         PEA   $0001
         PEA   $0000
         PEA   $0000
         PHA
         PHX
         PEA   $0001
         _LoadSegNum
         BCC   LCD7B
         BRL   LCE88
LCD7B    LDY   #$0000
         LDX   #$0005
LCD81    PLA
         STA   [$E1],Y
         INY
         INY
         DEX
         BNE   LCD81
         SEP   #$30
         JSR   L3CC8
         BEQ   LCD95
         JSR   L6346
         BRA   LCD22
LCD95    RTS

LCD96    LDX   $6E
         STX   $E3
         LDY   #$08
         REP   #$30
         STZ   L17C5
         LDA   $6C
         STA   $E1
LCDA5    LDA   [$E1],Y
         PHA
         DEY
         DEY
         CPY   #$0004
         BCS   LCDA5
         TAX
         BEQ   LCDC3
         _UnloadSegNum
         BCC   LCDC3
         LDX   L17C5
         BNE   LCDC3
         STA   L17C5
LCDC3    LDY   #$0008
         LDA   #$0000
LCDC9    STA   [$E1],Y
         DEY
         DEY
         BPL   LCDC9
         LDA   #$000A
         CLC
         ADC   $E1
         STA   $E1
         SEP   #$30
         BCC   LCDDD
         INC   $E3
LCDDD    REP   #$30
         LDY   #$0008
         LDX   $E2
         LDA   $E1
         CPX   $70
         BCC   LCDA5
         BNE   LCDF9
         CMP   $6F
         BNE   LCDA5
         LDA   L17C5
         CMP   #$0001
         SEP   #$30
         RTS

LCDF9    JSR   L3F4C
LCDFC    LDA   $71
         STA   $8D
         LDA   $6E
         STA   $93
         LDA   $6B
         STA   $99
         REP   #$30
         LDA   $6F
         STA   $8B
         LDA   $6C
         STA   $91
         LDA   $69
         STA   $97
         SEP   #$30
         JSR   L5812
         LDA   $8D
         STA   $6B
         REP   #$30
         LDA   $8B
LCE23    STA   $69
         LDA   $6F
         STA   $6C
         SEP   #$30
         LDA   $71
         STA   $6E
         STZ   L0B5C
         JSR   LCE44
         REP   #$30
         LDA   $81
         STA   L1078
         SEP   #$30
         LDA   $83
         STA   L107A
         RTS

LCE44    REP   #$30
         LDA   L1080
         CLC
         ADC   $72
         STA   $81
         SEP   #$30
         LDA   $74
         ADC   #$00
         STA   $83
         RTS

LCE57    LDX   #$4C
         JMP   L3FA4      ;BRL L3FA4

LCE5C    REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   $07
         ORA   #$0300
         PHA
         PEA   ^L0007
         PEA   L0007
         PEA   ^L17C9
         PEA   L17C9
         _LoadSegName
         BCC   LCEA4
LCE88    CMP   #$0100
         BCC   LCEA1
LCE8D    CMP   #$1104
         BNE   LCE97
         SEP   #$30
         BRL   LCCA6

	 MX    %00
	 
LCE97    CMP   #$1101
         SEP   #$30
	 BEQ   LCE57
	 JMP   L3F6A	;BRL L3F6A
LCEA1    JMP   L3F75	;BRL L3F75

LCEA4    REP   #$30
         LDA   $01,S
         STA   $44
         SEP   #$30
         LDA   $03,S
         STA   $46
         LDY   #$01
         LDA   [$44],Y
         CMP   #$01
         BEQ   LCEBE
         JSR   LCF36
         BRL   LB67F
LCEBE    LDX   L107A
         REP   #$30
         INY
         LDA   [$44],Y
         CLC
         ADC   L1078
         STA   $1C
         BCC   LCECF
         INX
LCECF    SEP   #$30
         STX   $1E
         REP   #$30
         LDA   $1D
         CMP   L1071
         BCC   LCEEC
         LDA   $1C
         SBC   L1070
         STA   $1C
         SEP   #$30
         STZ   $1E
         LDX   #$04
         JSR   L5603
LCEEC    REP   #$30
         LDA   L1078
         STA   $84
         LDA   $44
         CLC
         ADC   #$0004
         STA   $40
         LDA   $03,S
         BCC   LCF00
         INC
LCF00    TAX
         LDY   #$0002
         LDA   [$44],Y
         TAY
         SEP   #$20
         TXA
         STA   $42
         LDA   L107A
         STA   $86
LCF11    DEY
         LDA   [$40],Y
         STA   [$84],Y
         TYX
         BNE   LCF11
         LDA   [$44]
         STA   $0B
         LDY   #$0002
         REP   #$30
         LDA   [$44],Y
         CLC
         ADC   L1078
         STA   L1078
         BCC   LCF30
         INC   L107A
LCF30    JSR   LCF36
         BRL   LCF8D
LCF36    PLA
         STA   $44
         PLA
         PLA
         LDA   $01,S
         TAX
         LDA   $05,S
         STA   $01,S
         TXA
         STA   $05,S
         LDA   $03,S
         STA   L17C7
         _UnloadSegNum
         BCS   LCF59
         LDA   $44
         PHA
         SEP   #$30
         RTS

LCF59    JMP   L3F6A      ;BRL L3F6A
LCF5C    LDA   #$0A
         STA   $44
         STZ   $45
         STZ   $46
         REP   #$30
         LDA   $63
         PHA
         LDA   $6F
         STA   $63
         LDA   $69
         STA   $40
         SEC
         SBC   $44
         STA   $97
         SEP   #$30
         LDA   $6B
         STA   $42
         SBC   $46
         STA   $99
         LDA   $65
         PHA
         LDA   $6E
         STA   $65
         JSR   L5889
         JMP   L5D22      ;BRL L5D22
LCF8D    JSR   L803D
         LDY   #$0E
         REP   #$30
         TYA
         CLC
         ADC   $84
         STA   $4E
         SEP   #$30
         LDA   $86
         BCC   LCFA1
         INC
LCFA1    STA   $50
         JSR   LD076
         JSR   L804A
         JSR   LCFED
         BCC   LCFB3
         LDX   #$0F
         JMP   L3FA4      ;BRL L3FA4
LCFB3    LDA   [$84]
         LDY   #$02
         STA   [$84],Y
         LDY   #$05
         REP   #$30
         LDA   $8E
         STA   [$84],Y
         LDA   $84
         SEC
         SBC   $97
         STA   [$97]
         LDA   [$84]
         TAX
         LDA   #$0000
         STA   [$84]
         TXA
         CLC
         ADC   $84
         STA   $84
         SEP   #$30
         BCC   LCFDC
         INC   $86
LCFDC    DEC   $0B
         BNE   LCF8D
         RTS

LCFE1    LDA   $74
         STA   $83
         REP   #$30
         LDA   $72
         STA   $81
         BRA   LD000
LCFED    REP   #$30
         LDA   $72
         CLC
         ADC   L1080
         STA   $81
         SEP   #$30
         LDA   $74
         ADC   L1082
         STA   $83
LD000    SEP   #$30
         LDA   $8A
         AND   #$1F
         INC
         ASL
         CLC
         ADC   $81
         STA   $97
         REP   #$30
         LDA   $82
         BCC   LD014
         INC
LD014    STA   $98
         BRA   LD06D
LD018    LDA   [$81]
         CLC
         ADC   $81
         STA   $81
         BCC   LD027
         SEP   #$30
         INC   $83
         REP   #$30
LD027    LDA   [$81]
         BNE   LD000
         SEP   #$30
         CLC
         RTS

         REP   #$30
LD031    CLC
         ADC   $97
         STA   $97
         BCC   LD03A
         INC   $99
LD03A    LDY   #$000D
         LDA   $1F
         CMP   [$97],Y
         BNE   LD06D
         AND   #$00FF
         TAX
         INY
         TYA
         CLC
         ADC   $97
         STA   $94
         SEP   #$30
         LDA   $99
         BCC   LD055
         INC
LD055    STA   $96
         LDY   #$00
LD059    LDA   [$DE],Y
         CMP   #$61
         BCC   LD061
         AND   #$DF
LD061    CMP   [$94],Y
         BNE   LD06B
         INY
         DEX
         BNE   LD059
         SEC
         RTS

LD06B    REP   #$30
LD06D    LDA   [$97]
         BEQ   LD018
         BRA   LD031
LD073    JMP   L6356      ;BRL L6356

         MX    %11
LD076    LDY   #$00
         LDA   [$4E]
         CMP   #$61
         BCC   LD080
         AND   #$5F
LD080    STA   $20
         STZ   $8A
         BRA   LD090
         CLC
LD087    ADC   $8A
         STA   $8A
         INY
         CPY   #$15
         BCS   LD073
LD090    LDA   [$4E],Y
         BMI   LD0A8
         BEQ   LD0A8
         CMP   #$3A
         BEQ   LD0A8
         CMP   #$29
         BCC   LD0A8
         CMP   #$61
         BCC   LD0A4
         AND   #$5F
LD0A4    CMP   #$41
         BRA   LD087
LD0A8    STY   $1F
         LDA   $4E
         STA   $DE
         TYA
         CLC
         ADC   $4E
         STA   $4E
         REP   #$30
         LDA   $4F
         STA   $DF
         BCC   LD0BF
         INC
         STA   $4F
LD0BF    SEP   #$30
         RTS

*-----------------------
* LIBFIND
*-----------------------

LD0C2    JSR   L60A7
         JSR   L6346
         JSR   L6D6F
         STA   $0B
         JSR   L6D9D
         LDA   $0B
         BEQ   LD116
         BIT   L0B5E
         BPL   LD116
         STZ   $8A
         LDA   [$40]
         JSR   L664D
         STA   $20
         LDY   #$00
         BRA   LD0F4
LD0E6    CLC
LD0E7    ADC   $8A
         STA   $8A
         INY
         CPY   $0B
         BCS   LD103
         CPY   #$15
         BCS   LD157
LD0F4    LDA   [$40],Y
         JSR   L664D
         JSR   L4F89
         BCS   LD0E6
         JSR   L6638
         BCS   LD0E7
LD103    STY   $1F
         LDA   $42
         STA   $E0
         REP   #$30
         LDA   $40
         STA   $DE
         SEP   #$30
         JSR   LCFE1
         BCS   LD123
LD116    LDA   #^L0B43
         STA   $99
         REP   #$30
         LDA   #L0B43
         STA   $97
         SEP   #$30
LD123    REP   #$30
         LDA   $97
         STA   $81
         SEP   #$30
         LDA   $99
         STA   $83
         LDA   #$05
         STA   $0B
LD133    JSR   L64A8
         LDX   $0F
         CPX   #$01
         BNE   LD15B
         LDY   $0B
         INC   $0B
         LDA   [$81],Y
         REP   #$30
         AND   #$00FF
         STA   [$22]
         SEP   #$30
         JSR   L3CC8
         BEQ   LD15A
         JSR   L6306
         CMP   #$2C
         BEQ   LD133
LD157    JMP   L6356      ;BRL L6356
LD15A    RTS

LD15B    JMP   L3F9E      ;BRL L3F9E
LD15E    JSR   L6306
         BIT   L0B5E
         BPL   LD169
         JSR   LCC46
LD169    BIT   L0B5C
         BMI   LD1A1
LD16E    REP   #$30
         LDA   #$0200
         STA   L1092
         STZ   L1094
         SEP   #$30
         LDX   #$04
         JMP   L562F      ;BRL L562F
LD180    JSR   L6306
         BIT   L0B5C
         BPL   LD1A1
         JSR   LCD96
         PHP
         JSR   LCDFC
         PLP
         BCC   LD19C
         REP   #$30
         LDA   L17C5
         JMP   L3F6A      ;BRL L3F6A
         SEP   #$30
LD19C    BIT   L0B5E
         BPL   LD16E
LD1A1    RTS

LD1A2    JSR   L6342
         LDA   $E6
         CLC
         ADC   #$06
         STA   $E6
LD1AC    JSR   L6311
         LDX   $E6
         LDA   L0004,X
         STA   $83
         REP   #$30
         LDA   L0000+2,X
         STA   $81
         SEP   #$30
         LDY   L0005,X
         LDA   [$81],Y
         BPL   LD210
         LDX   $A4
         CPX   #$07
         BEQ   LD1D5
         CPX   #$02
         BNE   LD231
         BRL   LD2BD
         BNE   LD231
LD1D5    JSR   LD308
         LDA   [$A6]
         CMP   #$FF
         BCC   LD1E1
         JMP   L6CD3      ;BRL L6CD3
LD1E1    JSR   L6D6F
         INC
         JSR   L6DE1
         TAX
         LDA   #$00
         STA   [$8B]
         DEX
         TXA
         STA   [$66]
         REP   #$30
         INC   $66
         SEP   #$30
         BNE   LD1FB
         INC   $68
LD1FB    JSR   L6D53
         LDX   $AE
         REP   #$30
         PLY
         TXA
         PHA
         PEI   $AC
         PHY
         SEP   #$30
         BRL   LD2CB
LD20D    BRL   LD2BA
LD210    CMP   $A4
         BEQ   LD236
         LDX   $A4
         CPX   #$07
         BEQ   LD231
         CMP   #$06
         BEQ   LD289
         CMP   #$02
         BCC   LD27A
         BEQ   LD20D
         CMP   #$04
         BCC   LD290
         BEQ   LD267
         CMP   #$05
         BEQ   LD2A5
         BRL   LB67F
LD231    LDX   #$37
         JMP   L3FA4      ;BRL L3FA4
LD236    LDA   $A4
         CMP   #$06
         BEQ   LD28C
         CMP   #$02
         BCC   LD27D
         BEQ   LD2BD
         CMP   #$04
         BCC   LD293
         BEQ   LD26A
         CMP   #$05
         BEQ   LD2A8
         CMP   #$07
         BEQ   LD253
         JSR   L3F4C
LD253    JSR   LD308
         REP   #$30
         PLY
         LDA   $A8
         AND   #$00FF
         PHA
         LDA   $A6
         PHA
         PHY
         SEP   #$30
         BRA   LD2CB
LD267    JSR   LE1AE
LD26A    REP   #$30
         PLY
         LDA   L0AF2
         PHA
         LDA   L0AF0
         PHA
         PHY
         SEP   #$30
         BRA   LD2CB
LD27A    JSR   LE1C9
LD27D    REP   #$30
         PLY
         LDA   L0AF0
         PHA
         PHY
         SEP   #$30
         BRA   LD2CB
LD289    JSR   LE361
LD28C    LDX   #$08
         BRA   LD295
LD290    JSR   LE1B7
LD293    LDX   #$06
LD295    REP   #$30
         PLY
LD298    LDA   L0AF0,X
         PHA
         DEX
         DEX
         BPL   LD298
         PHY
         SEP   #$30
         BRA   LD2CB
LD2A5    JSR   LE1A5
LD2A8    LDX   #$06
         REP   #$30
         PLY
LD2AD    LDA   L0AF0,X
         PHA
         DEX
         DEX
         BPL   LD2AD
         PHY
         SEP   #$30
         BRA   LD2CB
LD2BA    JSR   LE1C0
LD2BD    REP   #$30
         PLY
         LDA   L0AF2
         PHA
         LDA   L0AF0
         PHA
         PHY
         SEP   #$30
LD2CB    LDX   $E6
         LDA   L0005,X
         INC
         STA   L0005,X
         LDA   L0006,X
         INC
         STA   L0006,X
         LDY   #$0B
         CMP   [$81],Y
         BEQ   LD2F9
         JSR   L3CC8
         JSR   L6306
         CMP   #$2C
         BNE   LD2EE
         BRL   LD1AC
LD2EE    CMP   #$29
         BEQ   LD303
         CMP   #$2C
         BEQ   LD303
         JMP   L6356      ;BRL L6356
LD2F9    JSR   L3CC8
         CMP   #$29
         BNE   LD2EE
         JMP   L3CBE      ;BRL L3CBE
LD303    LDX   #$36
         JMP   L3FA4      ;BRL L3FA4
LD308    BIT   $E4
         BMI   LD329
         REP   #$30
         LDA   $6A
         SEC
         SBC   L0B22
         CMP   $64
         BCC   LD321
         ADC   #$00FF
         CMP   $6D
         SEP   #$30
         BCS   LD326
LD321    SEP   #$30
         JSR   L5977
LD326    DEC   $E4
         RTS

LD329    REP   #$30
         LDA   $6A
         DEC
         CMP   $64
         BCC   LD340
         BEQ   LD340
         ADC   #$00FE
         CMP   $6D
         SEP   #$30
         BEQ   LD340
         BCC   LD340
         RTS

LD340    SEP   #$30
         LDX   #$4E
         JMP   L3FA4      ;BRL L3FA4
LD347    JSR   L6342
         LDA   $E6
         CLC
         ADC   #$06
         STA   $E6
LD351    JSR   L6311
         LDA   $A4
         CMP   #$07
         BCC   LD390
         JSR   LD308
         LDA   [$A6]
         CMP   #$FF
         BCC   LD366
         JMP   L6CD3      ;BRL L6CD3
LD366    JSR   L6D6F
         INC
         JSR   L6DE1
         TAX
         LDA   #$00
         STA   [$8B]
         TXA
         STA   [$66]
         REP   #$30
         INC   $66
         SEP   #$30
         BNE   LD37F
         INC   $68
LD37F    JSR   L6D53
         LDX   $AE
         REP   #$30
         PLY
         TXA
         PHA
         PEI   $AC
         PHY
         SEP   #$30
         BRA   LD3BC
LD390    CMP   #$02
         BCC   LD3A2
         BEQ   LD3A6
         CMP   #$04
         BCC   LD3AE
         BEQ   LD3A6
         CMP   #$06
         BCC   LD3AE
         BRA   LD3AA
LD3A2    LDX   #$00
         BRA   LD3B0
LD3A6    LDX   #$02
         BRA   LD3B0
LD3AA    LDX   #$08
         BRA   LD3B0
LD3AE    LDX   #$06
LD3B0    REP   #$30
         PLY
LD3B3    LDA   L0AF0,X
         PHA
         DEX
         DEX
         BPL   LD3B3
         PHY
LD3BC    SEP   #$30
         JSR   L3CC8
         CMP   #$29
         BEQ   LD3CF
         JSR   L6306
         CMP   #$2C
         BEQ   LD351
         JMP   L6356      ;BRL L6356
LD3CF    JMP   L3CBE      ;BRL L3CBE

*-----------------------
* CALL%
*-----------------------

LD3D2    BNE   LD3D7
         JMP   L6356      ;BRL L6356
LD3D7    JSR   L73D3
         STX   L109B
         JSR   L6346
         JSR   L73D3
         STX   L109A
         JSR   L6346
         JSR   L73D3
         TXA
         AND   #$1F
         STA   L109D
         TXA
         AND   #$E0
         LSR
         LSR
         LSR
         LSR
         STA   L109C
         LDA   L109D
         BEQ   LD40B
         TAX
         REP   #$30
         LDA   #$0000
LD407    PHA
         DEX
         BNE   LD407
LD40B    SEP   #$30
         JSR   L3CC8
         BEQ   LD43C
         STZ   $E4
         LDY   #$00
         LDX   L0B0A
         STX   $E6
LD41B    LDA   L109A,Y
         STA   L0007,X
         INX
         INY
         CPY   #$04
         BCC   LD41B
         JSR   LD347
         LDX   $E6
         DEX
         DEX
         LDY   #$03
LD430    DEX
         LDA   L0007,X
         STA   L109A,Y
         DEY
         BPL   LD430
         STX   $E6
LD43C    REP   #$30
         LDX   L109A
         JSL   DISPATCH1
         STZ   L10A3
         BCC   LD478
         CMP   #$01FF
         BCS   LD45F
         REP   #$10
         LDX   $D4
         TXS
         SEP   #$30
         LDX   $0A
         STX   $09
         JMP   L3F6A      ;BRL L3F6A
         REP   #$30
LD45F    STA   L109F
         STX   L10A1
         INC   L10A3
         LDA   #L1094
         STA   $81
         LDA   #>L1094
         STA   $82
         LDA   L10A3
         BRL   LD7B4
LD478    LDY   L109D
         BEQ   LD48E
         LDX   #$0000
LD480    PLA
         CPX   #$0020
         BCS   LD48B
         STA   L10A5,X
         INX
         INX
LD48B    DEY
         BNE   LD480
LD48E    SEP   #$30
         RTS

LD491    LDA   $E7
         BPL   LD496
LD495    RTS

LD496    BEQ   LD495
         LDA   $4D
         STA   $50
         REP   #$30
         LDA   $4B
         STA   $4E
         SEP   #$30
         JSR   L6363
LD4A7    LDA   #$B6
         STA   $0D
         LDA   #$B5
         STA   $0C
         LDA   $50
         STA   $96
         REP   #$30
         LDA   $4E
         STA   $94
         SEP   #$30
         LDX   #$00
         JSR   L8EDD
         BCC   LD4D5
         JSR   L6306
         LDA   [$4E]
         CMP   #$FB
         BNE   LD4D5
         LDA   #$FF
         LDY   #$03
LD4CF    STA   [$4E],Y
         DEY
         BNE   LD4CF
         SEC
LD4D5    LDA   $0B
         BEQ   LD50A
         JSR   LD50D
         PHP
         LDA   $0B
LD4DF    PHA
         LDA   #$B5
         STA   $0D
         LDA   #$B6
         STA   $0B
         LDX   #$00
         JSR   L8EDD
         BCC   LD505
         JSR   L6306
         LDA   [$4E]
         CMP   #$FB
         BNE   LD501
         LDY   #$03
         LDA   #$FF
LD4FC    STA   [$4E],Y
         DEY
         BNE   LD4FC
LD501    PLA
         DEC
         BNE   LD4DF
LD505    JSR   LD50D
         PLA
         PLP
LD50A    BCS   LD4A7
         RTS

LD50D    LDA   $96
         LDX   $50
         STA   $50
         STX   $96
         REP   #$30
         LDA   $94
         LDX   $4E
         STA   $4E
         STX   $94
         SEP   #$30
         RTS

*-----------------------
* CALL / _
*-----------------------

LD522    BEQ   LD59F
         LDY   #$03
         LDA   [$4E],Y
         BMI   LD568
         LDY   #$01
         TAX
         REP   #$30
         LDA   [$4E],Y
         CLC
         ADC   $72
         STA   $97
         SEP   #$30
         TXA
         ADC   $74
         STA   $99
         LDY   #$04
LD53F    INY
         LDA   [$4E],Y
         BEQ   LD54E
         CMP   #$28
         BEQ   LD54E
         CMP   #$3A
         BEQ   LD54E
         BRA   LD53F
LD54E    TYA
         CLC
         ADC   $4E
         STA   $4E
         BCC   LD55C
         REP   #$30
         INC   $4F
         SEP   #$30
LD55C    STZ   $E5
         STZ   $E4
         LDA   L0B0A
         STA   $E6
         BRL   LD638
LD568    LDX   #$83
         BIT   $E7
         BMI   LD57C
         LDA   $50
         STA   $E3
         REP   #$30
         LDA   $4E
         STA   $E1
         SEP   #$30
         LDX   #$C3
LD57C    LDA   #$04
         CLC
         ADC   $4E
         STA   $4E
         BCC   LD58B
         REP   #$30
         INC   $4F
         SEP   #$30
LD58B    BRA   LD596
LD58D    LDX   #$59
LD58F    JMP   L3FA4      ;BRL L3FA4

*-----------------------
* PERFORM
*-----------------------

LD592    BEQ   LD59F
         LDX   #$01
LD596    STZ   $E4
         LDA   L0B0A
         STA   $E6
         BRA   LD5E0
LD59F    JMP   L6356      ;BRL L6356
LD5A2    BRL   L84C3
LD5A5    BRL   L8703
LD5A8    LDX   #$4D
         JMP   L3FA4      ;BRL L3FA4
LD5AD    BEQ   LD5A2
         TAX
         REP   #$30
         PLA
         PHA
         CMP   #L60CA+2
         SEP   #$30
         BNE   LD5A5
         CPX   #$41
         BCS   LD5C5
         JSR   L3CBE
         TAX
         BEQ   LD5A2
LD5C5    TXA
         LDX   #$12
         CMP   #$5F
         BNE   LD5D3
         JSR   L3CBE
         BEQ   LD5A2
         LDX   #$93
LD5D3    LDA   $E6
         CMP   L0B0A
         BNE   LD5DC
         STZ   $E4
LD5DC    JSR   LD5E0
         RTS

LD5E0    STX   $E5
         JSR   LD076
         BIT   $E5
         BMI   LD602
         BIT   L0B5C
         BPL   LD5A8
         JSR   LCFED
         BCC   LD5A5
         LDY   #$09
         LDA   $E5
         AND   #$0F
         AND   [$97],Y
         BNE   LD638
LD5FD    JMP   L3F9E      ;BRL L3F9E
         BRA   LD5A5
LD602    BIT   L0B5E
         BPL   LD5A8
         JSR   LCFE1
         BCC   LD5A5
         LDA   $E5
         AND   #$0F
         LDY   #$09
         AND   [$97],Y
         BEQ   LD5FD
         BIT   $E5
         BVC   LD638
         LDY   #$01
         REP   #$30
         LDA   $97
         SEC
         SBC   $72
         STA   [$E1],Y
         SEP   #$30
         INY
         INY
         LDA   $99
         SBC   $74
         BPL   LD632
         JSR   L3F4C
LD632    STA   [$E1],Y
         LDA   #$01
         TSB   $E7
LD638    LDY   #$07
         LDA   [$97],Y
         BEQ   LD648
         TAY
         REP   #$30
         LDA   #$0000
LD644    PHA
         DEY
         BNE   LD644
LD648    SEP   #$30
         LDA   $E5
         AND   #$10
         LDY   #$09
         ORA   [$97],Y
         STA   $E5
         BIT   #$C0
         BNE   LD663
         LDA   #^LD71C
         PHA
         REP   #$30
         LDA   #LD71C
         PHA
         SEP   #$30
LD663    LDA   [$4E]
         CMP   #$28
         BEQ   LD67E
         LDA   $97
         STA   $81
         REP   #$30
         LDA   $98
         STA   $82
         SEP   #$30
         LDY   #$0B
         LDA   [$81],Y
         BEQ   LD6AE
         BRL   LD303
LD67E    LDX   $E6
         LDA   $99
         STA   L000A,X
         REP   #$30
         LDA   $97
         STA   L0008,X
         SEP   #$30
         LDY   #$0C
         LDA   [$97],Y
         STA   L000B,X
         STZ   L000C,X
         LDA   $E5
         STA   L0007,X
         JSR   LD1A2
         LDA   $E6
         SEC
         SBC   #$06
         STA   $E6
         LDX   $E6
         LDA   L0007,X
         STA   $E5
LD6AE    BIT   $E5
         BMI   LD6DE
         BVC   LD700
         LDY   #$07
         LDA   [$81],Y
         CMP   #$21
         BCC   LD6BF
         BRL   LB67F
LD6BF    ASL
         TAX
         REP   #$30
LD6C3    PLA
         STA   L10A3,X
         DEX
         DEX
         BNE   LD6C3
         PEA   ^L10A5
         PEA   L10A5
         LDY   #$0005
         LDA   [$81],Y
         PHA
         JSL   GSOS2
         BRL   LD71D
         MX    %11
LD6DE    LDY   #$05
         REP   #$30
         LDA   [$81],Y
         TAX
         JSL   DISPATCH1
         BCC   LD71D
         CMP   #$01FF
         BCS   LD71D
         REP   #$10
         LDX   $D4
         TXS
         SEP   #$30
         LDX   $0A
         STX   $09
         JMP   L3F6A      ;BRL L3F6A
         SEP   #$30
LD700    LDY   #$05
         REP   #$30
         LDA   [$81],Y
         TAY
         LDA   [$6C],Y
         TAX
         SEP   #$20
         INY
         INY
         LDA   [$6C],Y
         PHA
         REP   #$30
         TXA
         CLC
         LDY   #$0003
         ADC   [$81],Y
         DEC
         PHA
LD71C    RTL

LD71D    STA   L10A5
         STA   L109F
         STX   L10A7
         STX   L10A1
         STY   L10A9
         STZ   L10A3
         SEP   #$30
         BCC   LD736
         INC   L10A3
LD736    LDY   #$07
         LDA   [$81],Y
         BEQ   LD751
         TAY
         LDX   #$00
         REP   #$30
LD741    PLA
         CPX   #$0020
         BCS   LD74C
         STA   L10A5,X
         INX
         INX
LD74C    DEY
         BNE   LD741
         SEP   #$30
LD751    LDA   L10A3
         BEQ   LD759
         BRL   LD7B4
LD759    LDA   $E5
         BIT   #$10
         BEQ   LD7B3
         LDY   #$0A
         LDA   [$81],Y
         CLC
         BEQ   LD7B4
         CMP   #$07
         BCS   LD776
         XBA
         LDA   #L10A5
         LDY   #>L10A5
         LDX   #^L10A5
         JSR   LDE84
         BRA   LD7B3
LD776    LDX   L10A7
         STX   $42
         REP   #$30
         LDX   L10A5
         STX   $40
         SEP   #$30
         CMP   #$07
         BEQ   LD7A7
         CMP   #$0F
         BEQ   LD799
         LDY   #$00
LD78E    LDA   [$40],Y
         BEQ   LD796
         INY
         BNE   LD78E
         DEY
LD796    TYA
         BRA   LD7AA
LD799    LDA   [$40]
         REP   #$30
         INC   $40
         SEP   #$30
         BNE   LD7AA
         INC   $42
         BRA   LD7AA
LD7A7    LDA   L10A8
LD7AA    JSR   L6DE1
         JSR   L6D53
         JMP   L6EAA      ;BRL L6EAA
LD7B3    RTS

LD7B4    SEP   #$30
         LDY   #$08
         LDA   [$81],Y
         TAX
         CPX   #$0F
         BCC   LD7C2
         BRL   LB67F
LD7C2    JSR   (LD80C,X)
LD7C5    RTS

LD7C6    LDX   L10A1
         STX   L10A3
         JMP   L3FA4      ;BRL L3FA4
LD7CF    LDA   L109F
         STA   L10A3
         JMP   L3F75      ;BRL L3F75
LD7D8    REP   #$30
         LDA   L109F
         STA   L10A3
         JMP   L3F6A      ;BRL L3F6A
         SEP   #$30
LD7E5    LDY   L10A3
         BRL   L7A91
LD7EB    LDY   L10A1
         STY   L10A3
         BRL   L7A91
LD7F4    LDY   L109F
         STY   L10A3
         BRL   L7A91
LD7FD    LDA   L10A0
         LDY   L109F
         STA   L10A4
         STY   L10A3
         BRL   L790C

LD80C    DA    LD7C5
         DA    LD7C6
         DA    LD7CF
         DA    LD7D8
         DA    LD7E5
         DA    LD7EB
         DA    LD7F4
         DA    LD7FD
LD81C    LDX   #$00
         BRL   LE494
LD821    LDX   $A4
         LDY   $B4
         CPX   #$02
         BCS   LD831
         CPY   #$02
         BCC   LD840
         BEQ   LD862
         BRA   LD81C
LD831    BEQ   LD838
         CPX   #$07
         BCC   LD81C
         RTS

LD838    CPY   #$02
         BEQ   LD86A
         BCS   LD81C
         BCC   LD867
LD840    REP   #$30
         LDA   L0AF0
         CLC
         ADC   L0B00
         STA   L0AF0
         BVC   LD85D
         STZ   L0AF2
         BMI   LD856
         DEC   L0AF2
LD856    SEP   #$30
         LDX   #$02
         JSR   LE24E
LD85D    SEP   #$30
         BRL   LE460
LD862    JSR   LE2AF
         BRA   LD86A
LD867    JSR   LE2D2
LD86A    REP   #$30
         LDA   L0AF0
         CLC
         ADC   L0B00
         STA   L0AF0
         LDA   L0AF2
         ADC   L0B02
         STA   L0AF2
         BVC   LD899
         STZ   L0AF4
         STZ   L0AF6
         BMI   LD88F
         DEC   L0AF4
         DEC   L0AF6
LD88F    SEP   #$30
         LDX   #$03
         JSR   LE24E
         BRL   LE460
LD899    SEP   #$30
         JSR   LE636
         BRL   LE460
LD8A1    LDX   #$02
         BRL   LE494
LD8A6    LDX   $A4
         CPX   #$07
         BCC   LD8AD
         RTS

LD8AD    LDY   $B4
         CPX   #$03
         BCS   LD8A1
         CPY   #$03
         BCS   LD8A1
         CPX   #$02
         BEQ   LD8E6
         CPY   #$02
         BEQ   LD8E1
         REP   #$30
         LDA   L0AF0
         SEC
         SBC   L0B00
         STA   L0AF0
         BVC   LD8DC
         STZ   L0AF2
         BMI   LD8D5
         DEC   L0AF2
LD8D5    SEP   #$30
         LDX   #$02
         JSR   LE24E
LD8DC    SEP   #$30
         BRL   LE460
LD8E1    JSR   LE2AF
         BRA   LD8E9
LD8E6    JSR   LE2D2
LD8E9    REP   #$30
         LDA   L0AF0
         SEC
         SBC   L0B00
         STA   L0AF0
         LDA   L0AF2
         SBC   L0B02
         STA   L0AF2
         BVC   LD918
         STZ   L0AF4
         STZ   L0AF6
         BMI   LD90E
         DEC   L0AF4
         DEC   L0AF6
LD90E    SEP   #$30
         LDX   #$03
         JSR   LE24E
         BRL   LE460
LD918    SEP   #$30
         JSR   LE636
         BRL   LE460
LD920    JSR   LDF57
         JSR   LDF5C
         JSR   LDB6E
         BRL   LDF66
LD92C    LDX   $A4
         CPX   #$07
         BCC   LD933
         RTS

LD933    LDY   $B4
         CPX   #$03
         BCS   LD920
         CPY   #$03
         BCS   LD920
         CPX   #$02
         BEQ   LD96C
         CPY   #$02
         BEQ   LD966
         REP   #$30
         PEA   $0000
         PEA   $0000
         LDA   L0AF0
         PHA
         LDA   L0B00
         PHA
         _SDivide
         PLA
         PLX
         STA   L0AF0
         SEP   #$30
         BRL   LE460
LD966    JSR   LE2AF
         BRL   LD96F
LD96C    JSR   LE2D2
LD96F    JSR   LE077
         BEQ   LD920
         JSR   LE049
         BEQ   LD920
         BIT   $AA
         BPL   LD980
         JSR   LE087
LD980    BIT   $BA
         BPL   LD987
         JSR   LE059
LD987    REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L0AF2
         PHA
         LDA   L0AF0
         PHA
         LDA   L0B02
         PHA
         LDA   L0B00
         PHA
         _LongDivide
         PLA
         STA   L0AF0
         PLA
         STA   L0AF2
         PLA
         PLA
         SEP   #$30
         LDA   $AA
         EOR   $BA
         BPL   LD9C1
         JSR   LE087
LD9C1    BRL   LE460
LD9C4    LDA   $B9
         BEQ   LD9DF
         JSR   LDF57
         JSR   LDF5C
         LDA   $AA
         PHA
         JSR   LDB69
         PLA
         EOR   $AA
         BPL   LD9DF
         JSR   LDFE2
         JSR   LD81C
LD9DF    RTS

LD9E0    LDX   $A4
         CPX   #$07
         BCC   LD9E7
         RTS

LD9E7    LDY   $B4
         CPX   #$03
         BCS   LD9C4
         CPY   #$03
         BCS   LD9C4
         CPX   #$02
         BEQ   LDA1F
         CPY   #$02
         BEQ   LDA1A
         REP   #$30
         PEA   $0000
         PEA   $0000
         LDA   L0AF0
         PHA
         LDA   L0B00
         PHA
         _SDivide
         PLX
         PLA
         STA   L0AF0
         SEP   #$30
         BRL   LE460
LDA1A    JSR   LE2AF
         BRA   LDA22
LDA1F    JSR   LE2D2
LDA22    JSR   LE077
         BEQ   LD9C4
         JSR   LE049
         BEQ   LD9C4
         BIT   $AA
         BPL   LDA33
         JSR   LE087
LDA33    BIT   $BA
         BPL   LDA3A
         JSR   LE059
LDA3A    REP   #$30
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDA   L0AF2
         PHA
         LDA   L0AF0
         PHA
         LDA   L0B02
         PHA
         LDA   L0B00
         PHA
         _LongDivide
         PLA
         PLA
         PLA
         STA   L0AF0
         PLA
         STA   L0AF2
         SEP   #$30
         LDA   $AA
         BPL   LDA72
         JSR   LE087
LDA72    BRL   LE460
LDA75    LDX   #$04
         BRL   LE494
LDA7A    LDX   $A4
         LDY   $B4
         CPX   #$02
         BCS   LDA8A
         CPY   #$02
         BCC   LDA99
         BEQ   LDAFD
         BRA   LDA75
LDA8A    BEQ   LDA91
         CPX   #$07
         BCC   LDA75
         RTS

LDA91    CPY   #$02
         BEQ   LDB05
         BCC   LDB02
         BRA   LDA75
LDA99    REP   #$30
         LDA   L0AF0
         BPL   LDAA9
         CMP   #$8000
         BEQ   LDAF8
         EOR   #$FFFF
         INC
LDAA9    TAX
         LDA   L0B00
         BPL   LDAB8
         CMP   #$8000
         BEQ   LDAF8
         EOR   #$FFFF
         INC
LDAB8    PEA   $0000
         PEA   $0000
         PHA
         PHX
         _Multiply
         PLX
         PLY
         LDA   L0AF0
         EOR   L0B00
         BPL   LDAE7
         TYA
         EOR   #$FFFF
         STA   L0AF2
         TXA
         EOR   #$FFFF
         INC
         STA   L0AF0
         BNE   LDAED
         INC   L0AF2
         BRA   LDAED
LDAE7    STX   L0AF0
         STY   L0AF2
LDAED    SEP   #$30
         JSR   LE248
         JSR   LE636
         BRL   LE460
LDAF8    SEP   #$30
         JSR   LE2D2
LDAFD    JSR   LE2AF
         BRA   LDB05
LDB02    JSR   LE2D2
LDB05    JSR   LE077
         BNE   LDB0D
LDB0A    BRL   LDA75
LDB0D    JSR   LE049
         BEQ   LDB0A
         BIT   $AA
         BPL   LDB19
         JSR   LE087
LDB19    BIT   $BA
         BPL   LDB20
         JSR   LE059
LDB20    REP   #$30
         LDY   L0B02
         LDA   L0AF2
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         LDX   L0AF0
         PHA
         PHX
         LDA   L0B00
         PHY
         PHA
         _LongMul
         PLA
         STA   L0AF0
         PLA
         STA   L0AF2
         PLA
         STA   L0AF4
         PLA
         STA   L0AF6
         LDA   $A9
         EOR   $B9
         BPL   LDB5E
         JSR   LE0A5
LDB5E    SEP   #$30
         JSR   LE238
         JSR   LE2F6
         BRL   LE460
LDB69    LDX   #$0C
         BRL   LE494
LDB6E    LDX   #$06
         BRL   LE494
LDB73    LDX   $B4
         CPX   #$02
         BCS   LDB81
         LDX   #$10
         JSR   LE3D3
         BRL   LE460
LDB81    LDX   #$12
         BRL   LE49C
LDB86    LDX   $A4
         LDY   $B4
         CPX   #$02
         BCS   LDB97
         CPY   #$02
         BCC   LDBA0
         BEQ   LDBBA
LDB94    BRL   LDC6B
LDB97    BEQ   LDBAF
         CPX   #$07
         BCC   LDBEA
         JMP   L63EB      ;BRL L63EB
LDBA0    REP   #$30
         LDA   L0AF0
         SEC
         SBC   L0B00
         STA   $47
         BRA   LDBD0
         SEP   #$30
LDBAF    CPY   #$02
         BEQ   LDBBD
         BCS   LDB94
         JSR   LE2D2
         BRA   LDBBD
LDBBA    JSR   LE2AF
LDBBD    REP   #$30
         LDA   L0AF0
         SEC
         SBC   L0B00
         STA   $47
         LDA   L0AF2
         SBC   L0B02
         STA   $49
LDBD0    PHP
         ORA   $47
         SEP   #$30
         BNE   LDBDB
         PLA
         LDX   #$02
         RTS

LDBDB    PLA
         AND   #$C0
         BEQ   LDBE7
         CMP   #$C0
         BEQ   LDBE7
         LDX   #$40
         RTS

LDBE7    LDX   #$80
         RTS

LDBEA    LDA   L0B78
         BEQ   LDC6B
         CPY   #$04
         BCC   LDC6B
         CPX   #$03
         BEQ   LDC6B
         CPX   $B4
         BEQ   LDC6B
         PHP
         REP   #$30
         PEA   ^L0B7A
         PEA   L0B7A
         PEA   $0017
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         LDA   #$80
         LDX   $B4
         PLP
         PHP
         BCS   LDC1A
         LDX   $A4
LDC1A    CPX   #$04
         BEQ   LDC1F
         LSR
LDC1F    LDY   #$00
         PHY
         PHA
         LDA   L0B7A
         AND   #$C0
         BEQ   LDC32
         CMP   $01,S
         BCC   LDC32
         BEQ   LDC32
         STA   $01,S
LDC32    REP   #$30
         LDA   L0B7A
         AND   #$FF3F
         ORA   $01,S
         STA   $01,S
         PEA   $0001
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         PLP
         BCC   LDC54
         LDA   $A3
         JSR   LE367
         BRA   LDC59
LDC54    LDA   $B3
         JSR   LE31E
LDC59    REP   #$30
         LDA   L0B7A
         PHA
         PEA   $0001
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
LDC6B    LDX   #$08
         JSR   LE361
         JSR   LE3B5
         RTS

*-----------------------
* RELATION()
*-----------------------

LDC74    JSR   LDC6B
         TYA
         BEQ   LDC86
         BMI   LDC8A
         LDY   #$01
         CPX   #$40
         BEQ   LDC8C
         LDY   #$04
         BRA   LDC8C
LDC86    LDY   #$03
         BRA   LDC8C
LDC8A    LDY   #$02
LDC8C    BRL   L7A91
         STA   $15
LDC91    JSR   LDB86
         STX   $AA
         LDA   $15
         AND   #$07
         TAY
         BNE   LDCA0
         JSR   L3F4C
LDCA0    CPX   #$01
         BNE   LDCB1
         LDA   L1EE1,Y
         BEQ   LDCB1
         LDA   #$20
         STA   L0B82
         JSR   LE4FF
LDCB1    LDA   L1ED9,Y
         BIT   $AA
         BEQ   LDCBB
         BRL   LDDA6
LDCBB    BRL   LDD9D
LDCBE    LDX   $A4
         CPX   #$03
         BCS   LDCF1
         REP   #$30
         LDA   #$0000
         CPX   #$0001
         BEQ   LDCD0
         BCS   LDCE1
LDCD0    LDX   L0AF0
         BEQ   LDCDA
         BPL   LDCD9
LDCD7    SEC
         ROL
LDCD9    INC
LDCDA    STA   $A9
         SEP   #$30
         RTS

         REP   #$30
LDCE1    LDX   L0AF2
         BMI   LDCD7
         BNE   LDCD9
         LDX   L0AF0
         BEQ   LDCDA
         BRA   LDCD9
         SEP   #$30
LDCF1    CPX   #$07
         BCC   LDD00
         LDA   [$A6]
         BEQ   LDCFB
         LDA   #$01
LDCFB    STA   $A9
         STZ   $AA
         RTS

LDD00    SEP   #$30
         LDX   #$1C
         JSR   LE39B
         INX
         STX   $A9
         STY   $AA
         RTS

LDD0D    LDX   $B4
         CPX   #$03
         BCS   LDD40
         REP   #$30
         LDA   #$0000
         CPX   #$0001
         BEQ   LDD1F
         BCS   LDD30
LDD1F    LDX   L0B00
         BEQ   LDD29
         BPL   LDD28
LDD26    SEC
         ROL
LDD28    INC
LDD29    STA   $B9
         SEP   #$30
         RTS

         REP   #$30
LDD30    LDX   L0B02
         BMI   LDD26
         BNE   LDD28
         LDX   L0B00
         BEQ   LDD29
         BRA   LDD28
         SEP   #$30
LDD40    CPX   #$07
         BCC   LDD00
         LDA   [$B6]
         BEQ   LDD4A
         LDA   #$01
LDD4A    STA   $B9
         STZ   $BA
         RTS

         SEP   #$30
         LDX   #$1C
         JSR   LE347
         INX
         STX   $B9
         STY   $BA
         RTS

LDD5C    JSR   LDCBE
         JSR   LDD0D
         LDA   $A9
         BEQ   LDD9D
         LDA   $B9
         BEQ   LDD9D
         BRA   LDDA6
LDD6C    JSR   LDCBE
         JSR   LDD0D
         LDA   $A9
         ORA   $B9
         BNE   LDDA6
         BRA   LDD9D
LDD7A    JSR   LDCBE
         JSR   LDD0D
         LDA   #$01
         LDX   $A9
         BNE   LDD87
         DEC
LDD87    STA   $A9
         LDA   #$01
         LDX   $B9
         BNE   LDD90
         DEC
LDD90    EOR   $A9
         BNE   LDDA6
         BRA   LDD9D
LDD96    JSR   LE460
         LDA   $A9
         BEQ   LDDA6
LDD9D    JSR   LE28B
         JSR   LE24C
         BRL   LE460
LDDA6    JSR   LE28B
         LDA   #$01
         STA   L0AF0
         JSR   LE24C
         BRL   LE460
LDDB4    LDX   #$06
         REP   #$30
LDDB8    LDA   $A3,X
         STA   $B3,X
         DEX
         DEX
         BPL   LDDB8
         BIT   $A5
         BMI   LDDD6
         LDX   #$0008
LDDC7    LDA   L0AF0,X
         STA   L0B00,X
         DEX
         DEX
         BPL   LDDC7
         SEP   #$30
         RTS

         REP   #$30
LDDD6    LDA   $A6
         STA   $B6
         SEP   #$30
         LDA   $A8
         STA   $B8
         RTS

         LDX   #$06
         REP   #$30
LDDE5    LDA   $B3,X
         STA   $A3,X
         DEX
         DEX
         BPL   LDDE5
         BIT   $B5
         BMI   LDE03
         LDX   #$0008
LDDF4    LDA   L0B00,X
         STA   L0AF0,X
         DEX
         DEX
         BPL   LDDF4
         SEP   #$30
         RTS

         REP   #$30
LDE03    LDA   $B6
         STA   $A6
         SEP   #$30
         LDA   $B8
         STA   $A8
         RTS

LDE0E    LDX   $A4
         LDA   $B4
         CPX   #$07
         BCC   LDE1B
         CMP   #$07
         BEQ   LDE53
LDE1A    RTS

LDE1B    CMP   #$07
         BCS   LDE1A
         PHY
         JSR   $DE3D
         LDX   #$08
         REP   #$30
LDE27    LDA   L0B00,X
         TAY
         LDA   L0AF0,X
         STA   L0B00,X
         TYA
         STA   L0AF0,X
         DEX
         DEX
         BPL   LDE27
         SEP   #$30
         PLY
         RTS

         REP   #$30
         LDX   #$0006
LDE42    LDA   $B3,X
         TAY
         LDA   $A3,X
         STA   $B3,X
         TYA
         STA   $A3,X
         DEX
         DEX
         BPL   LDE42
         SEP   #$30
         RTS

LDE53    REP   #$30
         LDA   $B6
         LDX   $A6
         STX   $B6
         STA   $A6
         SEP   #$30
         LDA   $B8
         LDX   $A8
         STX   $B8
         STA   $A8
         RTS

LDE68    LDA   $D3
         XBA
         LDA   $22
         LDY   $23
         LDX   $24
         BRA   LDE7E
LDE73    STA   $0F
         LDA   $D3
         XBA
         LDA   $84
         LDY   $85
         LDX   $86
LDE7E    XBA
         STA   $A9
         LDA   $0F
         XBA
LDE84    STA   $A6
         STY   $A7
         STX   $A8
         XBA
         TAX
         STX   $A4
         CPX   #$07
         BNE   LDE95
         BRL   LE24E
LDE95    TXY
         JSR   LE28F
         TYX
         CPX   #$00
         BNE   LDEA5
         LDA   [$A6]
         STA   L0AF0
         BRA   LDEB7
LDEA5    LDY   L1EC9,X
         REP   #$30
LDEAA    DEY
         DEY
         BMI   LDEB5
         LDA   [$A6],Y
         STA   L0AF0,Y
         BRA   LDEAA
LDEB5    SEP   #$30
LDEB7    JSR   LE24E
         BRL   LE460
LDEBD    STA   $B6
         STY   $B7
         STX   $B8
         XBA
         TAX
         STX   $B4
         CPX   #$07
         BNE   LDECE
         BRL   LE266
LDECE    TXY
         JSR   LE282
         TYX
         CPX   #$00
         BNE   LDEDE
         LDA   [$B6]
         STA   L0B00
         BRA   LDEF0
LDEDE    LDY   L1EC9,X
         REP   #$30
LDEE3    DEY
         DEY
         BMI   LDEEE
         LDA   [$B6],Y
         STA   L0B00,Y
         BRA   LDEE3
LDEEE    SEP   #$30
LDEF0    JSR   LE266
         BRL   LE4D3

*-----------------------
* SCALB()
*-----------------------

LDEF6    JSR   LE4AF
LDEF9    LDX   #$18
         JSR   LE390
LDEFE    BRL   LE460

*-----------------------
* SGN()
*-----------------------

LDF01    JSR   LE460
         LDA   $A9
         BEQ   LDF14
         LDA   $AA
         PHA
         JSR   LE298
         PLA
         BPL   LDF17
         BRL   LDF83
LDF14    JSR   LE28B
LDF17    RTS

*-----------------------
* INT()
*-----------------------

LDF18    REP   #$30
         PEA   ^L0B7A
         PEA   L0B7A
         PEA   $0017
         LDX   #$0000
         JSL   L00F7
         LDA   #$801F
         PHA
         PEA   $0001
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         LDX   #$14
         JSR   LE48C
         REP   #$30
         LDA   L0B7A
         PHA
         PEA   $0019
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         BCC   LDF56
         JSR   LE4FF
LDF56    RTS

*-----------------------
* ROUND()
*-----------------------

LDF57    LDX   #$14
         BRL   LE48C
LDF5C    LDX   #$14
         BRL   LE4CD

*-----------------------
* SQL()
*-----------------------

LDF61    LDX   #$12
         BRL   LE48C

*-----------------------
* FIX()
*-----------------------

LDF66    LDX   #$16
         BRL   LE48C
LDF6B    LDX   #$0F
         BRL   LE48C

*-----------------------
* ABS()
*-----------------------

LDF70    LDX   $A4
         CPX   #$03
         BCS   LDF6B
         LDX   $A6
         CPX   #$01
         BNE   LDF7D
         INX
LDF7D    LDA   L0AEF,X
         BMI   LDF83
         RTS

*-----------------------
* NEGATE()
*-----------------------

LDF83    LDX   $A4
         CPX   #$02
         BEQ   LDFAC
         BCS   LDFD3
         REP   #$30
         LDA   L0AF0
         CMP   #$8000
         BEQ   LDFA1
         EOR   #$FFFF
         INC
         STA   L0AF0
         SEP   #$30
         BRL   LE460
LDFA1    STZ   L0AF2
         SEP   #$30
         JSR   LE248
         BRL   LE460
LDFAC    REP   #$30
         LDA   L0AF0
         BNE   LDFCB
         LDA   L0AF2
         BPL   LDFCB
         CMP   #$8000
         BNE   LDFCB
         STZ   L0AF4
         STZ   L0AF6
         SEP   #$30
         JSR   LE238
         BRL   LE460
LDFCB    SEP   #$30
         JSR   LE087
         BRL   LE460
LDFD3    CPX   #$07
         BCC   LDFD8
         RTS

LDFD8    LDX   #$0D
         BRL   LE48C
LDFDD    LDX   #$0F
         BRL   LE4CD
LDFE2    LDX   $B4
         CPX   #$03
         BCS   LDFDD
         LDX   $B6
         CPX   #$01
         BNE   LDFEF
         INX
LDFEF    LDA   L0AFF,X
         BMI   LDFF5
         RTS

LDFF5    LDX   $B4
         CPX   #$02
         BEQ   LE019
         BCS   LE03F
         REP   #$30
         LDA   L0B00
         CMP   #$8000
         BEQ   LE013
         EOR   #$FFFF
         INC
         STA   L0B00
         SEP   #$30
         BRL   LE4D3
LE013    STZ   L0B02
         BRL   LE2EC
LE019    REP   #$30
         LDA   L0B00
         BNE   LE037
         LDA   L0B02
         BPL   LE037
         CMP   #$8000
         BNE   LE037
         STZ   L0B04
         STZ   L0B06
         SEP   #$30
         LDX   #$03
         BRL   LE2F0
LE037    SEP   #$30
         JSR   LE059
         BRL   LE4D3
LE03F    CPX   #$07
         BCC   LE044
         RTS

LE044    LDX   #$0D
         BRL   LE4CD
LE049    REP   #$30
         LDA   L0B02
         CMP   #$8000
         BNE   LE056
         LDA   L0B00
LE056    SEP   #$30
         RTS

LE059    CLC
         REP   #$30
         LDA   L0B02
         EOR   #$FFFF
         STA   L0B02
         LDA   L0B00
         EOR   #$FFFF
         INC
         STA   L0B00
         BNE   LE074
         INC   L0B02
LE074    SEP   #$30
         RTS

LE077    REP   #$30
         LDA   L0AF2
         CMP   #$8000
         BNE   LE084
         LDA   L0AF0
LE084    SEP   #$30
         RTS

LE087    CLC
         REP   #$30
         LDA   L0AF2
         EOR   #$FFFF
         STA   L0AF2
         LDA   L0AF0
         EOR   #$FFFF
         INC
         STA   L0AF0
         BNE   LE0A2
         INC   L0AF2
LE0A2    SEP   #$30
         RTS

LE0A5    REP   #$30
         LDA   L0AF6
         EOR   #$FFFF
         STA   L0AF6
         LDA   L0AF4
         EOR   #$FFFF
         STA   L0AF4
         LDA   L0AF2
         EOR   #$FFFF
         STA   L0AF2
         LDA   L0AF0
         EOR   #$FFFF
         INC
         STA   L0AF0
         BNE   LE0DB
         INC   L0AF2
         BNE   LE0DB
         INC   L0AF4
         BNE   LE0DB
         INC   L0AF6
LE0DB    SEP   #$30
         RTS

*-----------------------
* LOG()
*-----------------------

LE0DE    LDX   #$00
         BRL   LE4A7

*-----------------------
* LOG1()
*-----------------------

LE0E3    LDX   #$04
         BRL   LE4A7

*-----------------------
* LOG2()
*-----------------------

LE0E8    LDX   #$02
         BRL   LE4A7

*-----------------------
* LOGB%()
*-----------------------

LE0ED    LDX   #$1A
         BRL   LE48C

*-----------------------
* EXP()
*-----------------------

LE0F2    LDX   #$08
         BRL   LE4A7

*-----------------------
* EXP1()
*-----------------------

LE0F7    LDX   #$0C
         BRL   LE4A7

*-----------------------
* EXP2()
*-----------------------

LE0FC    LDX   #$0A
         BRL   LE4A7

*-----------------------
* COS()
*-----------------------

LE101    LDX   #$1C
         BRL   LE4A7

*-----------------------
* SIN()
*-----------------------

LE106    LDX   #$1A
         BRL   LE4A7

*-----------------------
* TAN()
*-----------------------

LE10B    LDX   #$1E
         BRL   LE4A7

*-----------------------
* ATN()
*-----------------------

LE110    LDX   #$18
         BRL   LE4A7

*-----------------------
* RND()
*-----------------------

LE115    LDA   $A9
         BEQ   LE15F
         BIT   $AA
         BPL   LE15A
         JSR   LDF57
         JSR   LDF83
         JSR   LDDB4
         JSR   LE0ED
         JSR   LE43C
         JSR   LDE0E
         REP   #$30
         LDA   #$001E
         SEC
         SBC   L0B00
         BVS   LE13E
         BMI   LE147
         BRA   LE140
LE13E    BPL   LE147
LE140    AND   #$7FF0
         BEQ   LE152
         BRA   LE14A
LE147    AND   #$FFF0
LE14A    STA   L0B00
         SEP   #$30
         JSR   LDEF9
LE152    SEP   #$30
         JSR   LE180
         JSR   LE180
LE15A    JSR   LE17D
         BRA   LE162
LE15F    JSR   LE171
LE162    LDA   #$02
         XBA
         LDA   #L0B44
         LDY   #>L0B44
         LDX   #^L0B44
         JSR   LDEBD
         BRL   LDB6E
LE171    LDA   #$06
         XBA
         LDA   #L0B30
         LDY   #>L0B30
         LDX   #^L0B30
         BRL   LDE84
LE17D    JSR   LE171
LE180    LDX   #$20
         JSR   LE4A7
         LDY   #^L0B30
         REP   #$30
         LDA   #L0B30
         SEP   #$30
         LDX   #$06
         JMP   L5E26      ;BRL L5E26
LE193    LDX   #$16
         BRA   LE199

*-----------------------
* COMPI()
*-----------------------

LE197    LDX   #$14
LE199    JSR   LE361
         JSR   LE318
         JSR   LE416
         BRL   LE460

*-----------------------
* CONV#()
*-----------------------

LE1A5    LDX   #$05
         BIT   $A5
         BMI   LE1D2
         BRL   LE44E

*-----------------------
* CONV()
*-----------------------

LE1AE    LDX   #$04
         BIT   $A5
         BMI   LE1D2
         BRL   LE44E

*-----------------------
* CONV&()
*-----------------------

LE1B7    LDX   #$03
         BIT   $A5
         BMI   LE1D2
         BRL   LE44E

*-----------------------
* CONV@()
*-----------------------

LE1C0    LDX   #$02
         BIT   $A5
         BMI   LE1D2
         BRL   LE44E

*-----------------------
* CONV%()
*-----------------------

LE1C9    LDX   #$01
         BIT   $A5
         BMI   LE1D2
         BRL   LE44E
LE1D2    PHX
         JSR   L73E4
         PLX
         BRL   LE44E

*-----------------------
* CONV$()
*-----------------------

LE1DA    LDX   #$07
         BIT   $A5
         BMI   LE233
         BVS   LE1E5
         JMP   L6F50      ;BRL L6F50
LE1E5    REP   #$30
         LDA   #$0000
         STA   L0331
         LDA   #$0001
         STA   L032F
         PEA   ^L032F
         PEA   L032F
         PEI   $A1
         PEI   $9F
         PEA   ^L034D
         PEA   L034D
         LDA   $A2
         ORA   #$000B
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         LDX   L0351
         STZ   L0352,X
         LDA   #$2D
         STA   L0351
         LDA   L034D
         ROR
         LDA   #L0351
         LDY   #>L0351
         LDX   #^L0351
         BCS   LE230
         INC
         BNE   LE230
         INY
         BNE   LE230
         INX
LE230    JMP   L6E5F      ;BRL L6E5F
LE233    RTS

LE234    LDX   #$07
         BRA   LE24E
LE238    LDX   #$03
         BRA   LE24E
LE23C    LDX   #$05
         BRA   LE24E
         LDX   #$04
         BRA   LE24E
         LDX   #$06
         BRA   LE24E
LE248    LDX   #$02
         BRA   LE24E
LE24C    LDX   #$01
LE24E    STX   $A4
         CPX   #$07
         BEQ   LE25B
         LDA   L1EC9,X
         STA   $A6
         STZ   $A7
LE25B    LDA   L1EC1,X
         STA   $A3
         LDA   L1ED1,X
         STA   $A5
         RTS

LE266    STX   $B4
         CPX   #$07
         BEQ   LE273
         LDA   L1EC9,X
         STA   $B6
         STZ   $B7
LE273    LDA   L1EC1,X
         STA   $B3
         LDA   L1ED1,X
         STA   $B5
         RTS

         STZ   $B9
         STZ   $BA
LE282    LDX   #$0A
LE284    STZ   L0AFF,X
         DEX
         BNE   LE284
         RTS

LE28B    STZ   $A9
         STZ   $AA
LE28F    LDX   #$0A
LE291    STZ   L0AEF,X
         DEX
         BNE   LE291
         RTS

LE298    JSR   LE28F
         LDA   #$01
         STA   L0AF0
         BIT   $A5
         BVS   LE2AE
         LDA   #$04
         JSR   LE372
         LDX   $A4
         BRL   LE456
LE2AE    RTS

LE2AF    LDX   $A4
         CPX   #$02
         BCS   LE2D1
         REP   #$30
         LDX   #$FFFF
         BIT   L0AF0
         BMI   LE2C0
         INX
LE2C0    STX   L0AF2
         STX   L0AF4
         STX   L0AF6
         SEP   #$30
         JSR   LE248
         BRL   LE460
LE2D1    RTS

LE2D2    LDX   $B4
         CPX   #$02
         BCS   LE2D1
         REP   #$30
         LDX   #$FFFF
         BIT   L0B00
         BMI   LE2E3
         INX
LE2E3    STX   L0B02
         STX   L0B04
         STX   L0B06
LE2EC    SEP   #$30
         LDX   #$02
LE2F0    JSR   LE266
         BRL   LE4D3
LE2F6    REP   #$30
         LDA   L0AF6
         BIT   L0AF2
         BMI   LE305
         ORA   L0AF4
         BRA   LE30D
LE305    CMP   #$FFFF
         BNE   LE30D
         CMP   L0AF4
LE30D    SEP   #$30
         BNE   LE314
         JSR   LE248
LE314    RTS

         BRL   LD58D
LE318    LDA   $B3
         CMP   #$00
         BEQ   LE328
LE31E    PHX
         JSR   LE329
         LDX   #$06
         JSR   LE266
         PLX
LE328    RTS

LE329    LDX   #$0E
LE32B    XBA
         TXA
         REP   #$30
         PEI   $B1
         PEI   $AF
         PEI   $B1
         PEI   $AF
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         BCC   LE346
         JSR   LE4FF
LE346    RTS

LE347    LDA   $B3
         XBA
         TXA
         REP   #$30
         PEI   $B1
         PEI   $AF
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         BCC   LE360
         JSR   LE4FF
LE360    RTS

LE361    LDA   $A3
         CMP   #$00
         BEQ   LE371
LE367    PHX
         JSR   LE372
         LDX   #$06
         JSR   LE24E
         PLX
LE371    RTS

LE372    LDX   #$0E
LE374    XBA
         TXA
         REP   #$30
         PEI   $A1
         PEI   $9F
         PEI   $A1
         PEI   $9F
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         BCC   LE38F
         JSR   LE4FF
LE38F    RTS

LE390    JSR   LE361
         REP   #$30
         LDA   L0B00
         PHA
         SEP   #$30
LE39B    LDA   $A3
         XBA
         TXA
         REP   #$30
         PEI   $A1
         PEI   $9F
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         BCC   LE3B4
         JSR   LE4FF
LE3B4    RTS

LE3B5    LDA   $B3
         XBA
         TXA
         REP   #$30
         PEI   $B1
         PEI   $AF
         PEI   $A1
         PEI   $9F
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         BCC   LE3D2
         JSR   LE4FF
LE3D2    RTS

LE3D3    JSR   LE361
         REP   #$30
         LDA   L0B00
         PHA
         SEP   #$30
LE3DE    LDA   $A3
         XBA
         TXA
         REP   #$30
         PEI   $A1
         PEI   $9F
         PHA
         LDX   #$0004
         JSL   L00F7
         SEP   #$30
         BCC   LE3F7
         JSR   LE4FF
LE3F7    RTS

LE3F8    LDA   $B3
         XBA
         TXA
         REP   #$30
         PEI   $B1
         PEI   $AF
         PEI   $A1
         PEI   $9F
         PHA
         LDX   #$0004
         JSL   L00F7
         SEP   #$30
         BCC   LE415
         JSR   LE4FF
LE415    RTS

LE416    LDA   $B3
         XBA
         TXA
         REP   #$30
         PEI   $B1
         PEI   $AF
         PEI   $A1
         PEI   $9F
         PEI   $A1
         PEI   $9F
         PHA
         LDX   #$0004
         JSL   L00F7
         SEP   #$30
         BCC   LE437
         JSR   LE4FF
LE437    RTS

         LDX   $0F
         BRA   LE44E
LE43C    LDX   #$01
         BRA   LE44E
LE440    LDX   #$02
         BRA   LE44E
         LDX   #$03
         BRA   LE44E
         LDX   #$04
         BRA   LE44E
LE44C    LDX   #$05
LE44E    TXA
         EOR   $A4
         BEQ   LE460
         JSR   LE361
LE456    JSR   LE24E
         LDX   #$10
         LDA   $A3
         JSR   LE374
LE460    LDA   #$01
         STA   $A9
         LDX   $A6
         CPX   #$01
         BNE   LE46B
         INX
LE46B    LDA   L0AEF,X
         AND   #$80
         STA   $AA
         REP   #$30
         LDA   L0AEE,X
         AND   #$7FFF
         BNE   LE489
LE47C    DEX
         DEX
         BEQ   LE487
         ORA   L0AEE,X
         BEQ   LE47C
         BNE   LE489
LE487    STZ   $A9
LE489    SEP   #$30
         RTS

LE48C    JSR   LE361
         JSR   LE39B
         BRA   LE460
LE494    JSR   LE361
         JSR   LE3B5
         BRA   LE460
LE49C    JSR   LE361
         JSR   LE318
         JSR   LE3F8
         BRA   LE460
LE4A7    JSR   LE361
         JSR   LE3DE
         BRA   LE460
LE4AF    LDX   #$01
         BRA   LE4B9
         LDX   #$04
         BRA   LE4B9
         LDX   #$05
LE4B9    TXA
         EOR   $B4
         BEQ   LE4D3
         JSR   LE318
         JSR   LE266
         LDX   #$10
         LDA   $B3
         JSR   LE32B
         BRA   LE4D3
LE4CD    JSR   LE318
         JSR   LE347
LE4D3    LDA   #$01
         STA   $B9
         LDX   $B6
         CPX   #$01
         BNE   LE4DE
         INX
LE4DE    LDA   L0AFF,X
         AND   #$80
         STA   $BA
         REP   #$30
         LDA   L0AFE,X
         AND   #$7FFF
         BNE   LE4FC
LE4EF    DEX
         DEX
         BEQ   LE4FA
         ORA   L0AFE,X
         BEQ   LE4EF
         BNE   LE4FC
LE4FA    STZ   $B9
LE4FC    SEP   #$30
         RTS

LE4FF    SEP   #$30
         AND   L0B84
         BEQ   LE556
         BIT   $D0
         BPL   LE531
         AND   #$7F
         CLC
         ADC   #$80
         STA   $CC
         REP   #$30
         LDA   $75
         STA   $C7
         LDA   $79
         STA   $C9
         SEP   #$30
         LDA   $7B
         STA   $CB
         REP   #$10
         LDX   $D4
         TXS
         SEP   #$30
         LDX   $0A
         STX   $09
         LDX   #$96
         BRL   L82C2
LE531    BVC   LE556
         LDX   #$4B
         BIT   #$20
         BNE   LE553
         LDX   #$48
         BIT   #$01
         BNE   LE553
         LDX   #$10
         BIT   #$08
         BNE   LE553
         LDX   #$09
         BIT   #$04
         BNE   LE553
         LDX   #$4A
         BIT   #$02
         BNE   LE553
         LDX   #$49
LE553    JMP   L3FA4      ;BRL L3FA4
LE556    CLC
LE557    RTS

LE558    LDX   #$01
         JSR   LE24E
         JSR   LE28B
         JSR   L3CC8
         REP   #$30
         LDA   $50
         AND   #$00FF
         PHA
         PEI   $4E
         LDA   #$0000
         STA   L0333
         PEA   ^L0333
         PEA   L0333
         PEA   ^L034D
         PEA   L034D
         PEA   ^L0335
         PEA   L0335
         PEA   $0002
         LDX   #$0002
         JSL   L00F7
         LDA   L0333
         SEP   #$30
         BEQ   LE5AD
         LDA   L0352
         CMP   #$49
         BEQ   LE601
         CMP   #$4E
         BNE   LE5B1
         REP   #$30
         LDA   L0355
         CMP   #$3131
         SEP   #$30
         BNE   LE601
LE5AD    CLC
         BRL   LE62D
LE5B1    JSR   L4F89
         BCC   LE5AD
         LDY   L0333
         LDA   [$4E],Y
         STZ   L0336
         CMP   #$23
         BNE   LE5C8
         DEC   L0336
         INC   L0333
LE5C8    REP   #$30
         LDA   L034F
         SEP   #$30
         BMI   LE5EC
         XBA
         BEQ   LE5DB
         CMP   #$14
         BCC   LE5EC
         BRL   L89F9
LE5DB    XBA
         CMP   #$0A
         BCS   LE5EC
         LDA   L0351
         ADC   L034F
         LDX   #$02
         CMP   #$0A
         BCC   LE603
LE5EC    LDA   L0351
         LDX   #$04
         CMP   #$08
         BCS   LE5FC
         BIT   L0336
         BPL   LE603
         LDA   #$0F
LE5FC    INX
         CMP   #$10
         BCC   LE603
LE601    LDX   #$06
LE603    JSR   LE24E
         REP   #$30
         LDA   $A2
         PEA   ^L034D
         PEA   L034D
         PEI   $A1
         PEI   $9F
         ORA   #$0009
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         BCC   LE626
         JSR   LE4FF
LE626    JSR   LE636
         JSR   LE460
         SEC
LE62D    PHP
         LDY   L0333
         JSR   L8C60
         PLP
         RTS

LE636    LDX   $A4
         CPX   #$02
         BNE   LE657
         BIT   L0AF1
         REP   #$30
         BMI   LE648
         LDA   L0AF2
         BRA   LE64E
LE648    LDA   L0AF2
         CMP   #$FFFF
LE64E    SEP   #$30
         BNE   LE657
         LDX   #$01
         JSR   LE24E
LE657    RTS

LE658    LDX   L0B20
         CPX   #$1C
         BCC   LE661
         LDX   #$1C
LE661    CPX   #$02
         BCS   LE667
         LDX   #$02
LE667    REP   #$30
         STZ   L032F
         STX   L0331
         STX   L0B20
         LDA   $A2
         PEA   ^L032F
         PEA   L032F
         PEI   $A1
         PEI   $9F
         PEA   ^L034D
         PEA   L034D
         ORA   #$000B
         PHA
         LDX   #$0000
         JSL   L00F7
         SEP   #$30
         JSR   LE6F7
         BIT   L0350
         BMI   LE6A7
         XBA
         BNE   LE6BB
         XBA
         CLC
         ADC   L0351
         BCS   LE6BB
         LDY   #$00
         BRA   LE6AC
LE6A7    XBA
         BNE   LE6BB
         XBA
         TAY
LE6AC    CMP   L0B20
         BEQ   LE6B3
         BCS   LE6BB
LE6B3    TYX
         REP   #$30
         LDA   #$0001
         BRA   LE6C1
LE6BB    REP   #$30
         DEX
         LDA   #$0000
LE6C1    STA   L032F
         STX   L0331
         PEA   ^L032F
         PEA   L032F
         PEA   ^L034D
         PEA   L034D
         PEA   ^L03B2
         PEA   L03B2
         PEA   $0001
         LDX   #$0002
         JSL   L00F7
         SEP   #$30
         JSR   LE739
         LDX   L03B2
         STZ   L03B3,X
         TXA
         XBA
LE6F0    LDA   #L03B3
         LDY   #>L03B3
         LDX   #^L03B3
         RTS

LE6F7    LDX   L0351
         CPX   #$01
         REP   #$10
         BNE   LE710
         LDA   L0352
         CMP   #$30
         BEQ   LE70B
         CMP   #$3A
         BCC   LE710
LE70B    LDY   #$0000
         BRA   LE720
LE710    LDY   L034F
LE713    DEX
         BEQ   LE720
         LDA   L0352,X
         CMP   #$30
         BNE   LE720
         INY
         BRA   LE713
LE720    STY   L034F
         REP   #$30
         TYA
         BPL   LE72C
         EOR   #$FFFF
         INC
LE72C    STA   L034B
         SEP   #$30
         INX
         STX   L0351
         STZ   L0352,X
         RTS

LE739    LDA   L032F
         BNE   LE771
         LDX   L03B2
         DEX
         LDA   L03B2,X
         CMP   #$2B
         BEQ   LE74D
         CMP   #$2D
         BNE   LE761
LE74D    LDA   L03B3,X
         STA   L03B4,X
         LDA   #$30
         STA   L03B3,X
         INC   L03B2
         LDA   #$45
         STA   L03B1,X
         RTS

LE761    DEX
LE762    DEX
         BEQ   LE771
         LDA   L03B3,X
         CMP   #$65
         BNE   LE762
         LDA   #$45
         STA   L03B3,X
LE771    RTS

LE772    REP   #$30
         CPX   #$0005
         BCC   LE77C
         JSR   L3F4C
LE77C    LDAL  $000018
         STA   L0B86
         LDAL  $00001A
         STA   L0B88
         LDA   L0B8A
         STAL  $000018
         LDA   L0B8A+2
         STAL  $00001A
         PHK
         JSR   (LE7D0,X)
         BCS   LE7BD
         LDA   L0B86
         STAL  $000018
         LDA   L0B88
         STAL  $00001A
         LDA   #$0000
         CLC
         BIT   L0B82
         BPL   LE7BC
         SEC
         LDA   L0B82
         STZ   L0B82
LE7BC    RTL

LE7BD    PHA
         LDA   L0B86
         STAL  $000018
         LDA   L0B88
         STAL  $00001A
         PLA
         JMP   L3F6A      ;BRL L3F6A

LE7D0    DA    LE7D6
         DA    LE7E9
         DA    LE7FC

LE7D6    SEP   #$10
         LDX   L0B6A
         PHX
         REP   #$10
         LDX   L0B68
         PHX
         LDA   L0B74
         LDY   L0B76
         RTL

LE7E9    SEP   #$10
         LDX   L0B6E
         PHX
         REP   #$10
         LDX   L0B6C
         PHX
         LDA   L0B74
         LDY   L0B76
         RTL

LE7FC    SEP   #$10
         LDX   L0B72
         PHX
         REP   #$10
         LDX   L0B70
         PHX
         LDA   L0B74
         LDY   L0B76
         RTL

LE80F    LDA   $1E
         ORAL  L0B80
         STAL  L0B82
         AND   #$001F
         RTL

         SEP   #$30

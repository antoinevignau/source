*
* Krue's music disk
*
* (c) 2011, Brutal Deluxe Software
*

* PLANE WINDOW INFORMATION:
* WIDTH = 4 BYTES
* HEIGHT = 8 LINES

* 0: First arrow is the no arrow (up)
* 1: Second arrow is the up arrow
* 2: Third arrow is the no arrow (down)
* 3: Fourth arrow is the down arrow

tblARROW    DA    ARROW0,ARROW1,ARROW2,ARROW3
ARROW0      DFB   8,4,1,8
ARROW1      DFB   8,4,1,8
ARROW2      DFB   8,4,183,8
ARROW3      DFB   8,4,183,8

*xARROW DFB 8,8,8,8
*yARROW DFB 1,1,183,183

tblARROWl   DFB   <WARROWNO,<WARROWUP,<WARROWNO,<WARROWDOWN
tblARROWh   DFB   >WARROWNO,>WARROWUP,>WARROWNO,>WARROWDOWN

WARROWNO    HEX   00000000
            HEX   00000000
            HEX   00000000
            HEX   00000000
            HEX   00000000
            HEX   00000000
            HEX   00000000
            HEX   00000000

WARROWUP    HEX   00F00000
            HEX   00FC8300
            HEX   00AF8F00
            HEX   E0ABBD00
            HEX   F8ABFD81
            HEX   00AB8D00
            HEX   00AB8D00
            HEX   00FF8F00

WARROWDOWN  HEX   00FF8F00
            HEX   00AB8D00
            HEX   00AB8D00
            HEX   F8ABFD81
            HEX   E0ABBD00
            HEX   00AF8F00
            HEX   00FC8300
            HEX   00F00000


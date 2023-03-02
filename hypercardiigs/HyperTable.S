*
* HypercardGS
* segment: $04 HyperTable
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HyperTable.l
         lst   off

*---------------------------------------

         use   HyperTable.E
         use   HyperTable.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L040000  ENT
         STR   ' "'
L040003  ENT
         STR   '"'
L040005  ENT
         STR   '"'
L040007  ENT
         DB    $0E
         DB    $01
L040009  ENT
         STR   'flush'
L04000F  ENT
         STR   'objnum'
L040016  ENT
         STR   'objLoc'
L04001D  ENT
         STR   'write'
L040023  ENT
         STR   'CreateList'
L04002E  ENT
         STR   'numtoref'
L040037  ENT
         STR   'cardHndl2'
L040041  ENT
         STR   'insertE'
L040049  ENT
         STR   'listinfo'
L040052  ENT
         STR   'GetEntry2'
L04005C  ENT
         STR   'ListHndl'
L040065  ENT
         STR   'pageHndl'
L04006E  ENT
         STR   'bkgnd'
L040074  ENT
         STR   'bkgndHndl NIL'
L040082  ENT
         STR   'getentry'
L04008B  ENT
         STR   'cardNumber'
L040096  ENT
         STR   'card'
L04009B  ENT
         STR   'infoHndl'
L0400A4  ENT
         STR   'That'27's all folks...'
L0400B8  ENT
         STR   'Tail'
L0400BD  ENT
         STR   'Stk Hdr'
L0400C5  ENT
         STR   'Stk Script'
L0400D0  ENT
         STR   'W Mast'
L0400D7  ENT
         STR   'ressrc'
L0400DE  ENT
         STR   'resdst'
L0400E5  ENT
         STR   'readres'
L0400ED  ENT
         STR   'writeRes'
L0400F6  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $C8
         DB    $05
         DB    $40
L040100  ENT
         STR   'ressrc2'
L040108  ENT
         STR   'createRes'
L040112  ENT
         STR   'resdst2'
L04011A  ENT
         STR   'readIndres'
L040125  ENT
         STR   'writeIndres'
L040131  ENT
         STR   'updateDstFile'
L04013F  ENT
         STR   'HyperTemp.'
L04014A  ENT
         STR   'seteof1'
L040152  ENT
         STR   'seteof2'
L04015A  ENT
         STR   'Close'
L040160  ENT
         STR   '?'
L040162  ENT
         STR   '?go '
L040167  ENT
         STR   'stack "'
L04016F  ENT
         STR   '"'
L040171  ENT
         STR   'stack "'
L040179  ENT
         STR   '"'
L04017B  ENT
         STR   'go '
L04017F  ENT
         STR   'go card id '
L04018B  ENT
         STR   ' of '
L040190  ENT
         STR   'on mouseUp'
L04019B  ENT
         STR   '?end mouseUp'
L0401A8  ENT
         STR   'on mouseUp'
L0401B3  ENT
         STR   'end mouseUp'
L0401BF  ENT
         STR   'Sample Button'
L0401CD  ENT
         STR   'Sample'
L0401D4  ENT
         STR   'The quick '
L0401DF  ENT
         STR   'B'
L0401E1  ENT
         STR   'C'
L0401E3  ENT
         STR   'brown fox'
L0401ED  ENT
         STR   'C'
L0401EF  ENT
         STR   'B'
L0401F1  ENT
         STR   ' takes a running leap over the lazy dog.'
L04021A  ENT
         STR   ''
L04021B  ENT
         STR   ''
L04021C  ENT
         STR   ''
L04021D  ENT
         STR   ' '
L04021F  ENT
         STR   'HPrintMain'
L04022A  ENT
         STR   'Big Buffer Busy Error #2'
L040243  ENT
         STR   '1.2'	; AV 202208
L040247  ENT
         STR   '1/'
L04024A  ENT
         STR   '*:System:'
L040254  ENT
         STR   '@:'
L040257  ENT
         STR   '1:'
L04025A  ENT
         STR   ''
L04025B  ENT
         STR   'HyperEdit'
L040265  ENT
         STR   'Paste '
L04026C  ENT
         STR   ''
L04026D  ENT
         STR   ''
L04026E  ENT
         STR   'Text'
L040273  ENT
         STR   'Button'
L04027A  ENT
         STR   'Field'
L040280  ENT
         STR   'Cut '
L040285  ENT
         STR   'Copy '
L04028B  ENT
         STR   'Clear '
L040292  ENT
         DB    $00
L040293  ENT
         DB    $00
L040294  ENT
         DB    $00
L040295  ENT
         DB    $00
L040296  ENT
         DB    $00
L040297  ENT
         STR   'Compact'
L04029F  ENT
         DB    $00
L0402A0  ENT
         DB    $00
L0402A1  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $AC
L0402A7  ENT
         DB    $00
L0402A8  ENT
         STR   'InfoDialog'
L0402B3  ENT
         STR   'HyperCard startup error $'
L0402CD  ENT
         STR   ' = "'
L0402D2  ENT
         STR   '"'
L0402D4  ENT
         STR   ' = "'
L0402D9  ENT
         STR   '"'
L0402DB  ENT
         DB    $00
L0402DC  ENT
         DB    $00
L0402DD  ENT
         STR   '0.######'
L0402E6  ENT
         STR   'true'
L0402EB  ENT
         STR   'false'
L0402F1  ENT
         STR   'a'
L0402F3  ENT
         STR   'Home'
L0402F8  ENT
         DB    $FF
         DB    $AA
         DB    $24
         DB    $CB
         DB    $0B
         DB    $FF
         DB    $EB
         DB    $AF
         DB    $DA
         DB    $3F
L040302  ENT
         DB    $FF
         DB    $AA
         DB    $24
         DB    $CB
         DB    $0B
         DB    $FF
         DB    $EB
         DB    $AF
         DB    $DA
         DB    $3F
L04030C  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040316  ENT
         DB    $00
L040317  ENT
         DB    $00
L040318  ENT
         DB    $00
L040319  ENT
         DB    $00
L04031A  ENT
         DB    $00
L04031B  ENT
         DB    $00
L04031C  ENT
         DB    $00
L04031D  ENT
         DB    $00
L04031E  ENT
         STR   'Cancel'
L040325  ENT
         STR   ','
L040327  ENT
         STR   ','
L040329  ENT
         STR   ','
L04032B  ENT
         STR   ','
L04032D  ENT
         STR   ','
L04032F  ENT
         STR   ','
L040331  ENT
         STR   'invalid date'
L04033E  ENT
         STR   'ATS0=0S7=1DT'
L04034B  ENT
         STR   'not found'
L040355  ENT
         STR   'Cancel'
L04035C  ENT
         STR   'Cancel'
L040363  ENT
         STR   'card id '
L04036C  ENT
         STR   ' of stack "'
L040378  ENT
         STR   '"'
L04037A  ENT
         STR   'Error '
L040381  ENT
         STR   'hand'
L040386  ENT
         STR   'busy'
L04038B  ENT
         STR   'arrow'
L040391  ENT
         STR   'none'
L040396  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0403A0  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0403AA  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0403B4  ENT
         DB    $00
L0403B5  ENT
         DB    $00
L0403B6  ENT
         DB    $00
L0403B7  ENT
         STR   ' button '
L0403C0  ENT
         STR   ' of card id '
L0403CD  ENT
         DB    $E1
         DB    $75
         DB    $58
         DB    $7F
         DB    $ED
         DB    $2A
         DB    $B1
         DB    $EC
         DB    $FE
         DB    $FF
L0403D7  ENT
         DB    $E1
         DB    $75
         DB    $58
         DB    $7F
         DB    $ED
         DB    $2A
         DB    $B1
         DB    $EC
         DB    $FE
         DB    $7F
L0403E1  ENT
         STR   '0'
L0403E3  ENT
         STR   '"'
L0403E5  ENT
         STR   '"'
L0403E7  ENT
         STR   'done'
L0403EC  ENT
         STR   'HPrintMain'
L0403F7  ENT
         STR   'Error '
L0403FE  ENT
         STR   'Error '
L040405  ENT
         STR   'LowMemCmds'
L040410  ENT
         STR   '-'
L040412  ENT
         STR   '('
L040414  ENT
         STR   'HyperCard'
L04041E  ENT
         STR   'English'
L040426  ENT
         STR   ''
L040427  ENT
         STR   ''
L040428  ENT
         STR   'card'
L04042D  ENT
         STR   'bkgnd'
L040433  ENT
         STR   ' id '
L040438  ENT
         STR   ' "'
L04043B  ENT
         STR   '"'
L04043D  ENT
         STR   ' id '
L040442  ENT
         STR   ' of stack "'
L04044E  ENT
         STR   '"'
L040450  ENT
         STR   'field '
L040457  ENT
         STR   'button '
L04045F  ENT
         STR   'card '
L040465  ENT
         STR   'bkgnd '
L04046C  ENT
         STR   'id '
L040470  ENT
         STR   '"'
L040472  ENT
         STR   '"'
L040474  ENT
         STR   ' of card '
L04047E  ENT
         STR   'id '
L040482  ENT
         STR   '"'
L040484  ENT
         STR   '"'
L040486  ENT
         STR   ' of stack "'
L040492  ENT
         STR   '"'
L040494  ENT
         STR   'transparent'
L0404A0  ENT
         STR   'opaque'
L0404A7  ENT
         STR   'rectangle'
L0404B1  ENT
         STR   'roundRect'
L0404BB  ENT
         STR   'shadow'
L0404C2  ENT
         STR   'checkBox'
L0404CB  ENT
         STR   'radioButton'
L0404D7  ENT
         STR   'scrolling'
L0404E1  ENT
         STR   'stack "'
L0404E9  ENT
         STR   '"'
L0404EB  ENT
         STR   ','
L0404ED  ENT
         STR   ','
L0404EF  ENT
         STR   ','
L0404F1  ENT
         STR   ','
L0404F3  ENT
         STR   'left'
L0404F8  ENT
         STR   'center'
L0404FF  ENT
         STR   'right'
L040505  ENT
         STR   '0.######'
L04050E  ENT
         STR   ''
L04050F  ENT
         STR   'big buffer busy error #8'
L040528  ENT
         STR   ''
L040529  ENT
         STR   ''
L04052A  ENT
         STR   ''
L04052B  ENT
         STR   ''
L04052C  ENT
         STR   ' = "'
L040531  ENT
         STR   '"'
L040533  ENT
         STR   ''
L040534  ENT
         STR   "B"
L040536  ENT
         STR   '--'
L040539  ENT
         STR   ''
L04053A  ENT
         STR   'big buffer busy error #4'
L040553  ENT
         STR   '0'
L040555  ENT
         STR   '.'
L040557  ENT
         STR   '0'
L040559  ENT
         STR   '-'
L04055B  ENT
         STR   ','
L04055D  ENT
         STR   ','
L04055F  ENT
         STR   ','
L040561  ENT
         STR   ','
L040563  ENT
         STR   '<background>'
L040570  ENT
         STR   '<card>'
L040577  ENT
         STR   '<chunk>'
L04057F  ENT
         STR   '<container>'
L04058B  ENT
         STR   'long'
L040590  ENT
         STR   'short'
L040596  ENT
         STR   'abbrev'
L04059D  ENT
         STR   ''
L04059E  ENT
         STR   ' seconds'
L0405A7  ENT
         STR   ' dateItems'
L0405B2  ENT
         STR   ' date'
L0405B8  ENT
         STR   ' time'
L0405BE  ENT
         STR   ''
L0405BF  ENT
         STR   ''
L0405C0  ENT
         STR   'bkgnd '
L0405C7  ENT
         STR   'card '
L0405CD  ENT
         STR   'field '
L0405D4  ENT
         STR   'button '
L0405DC  ENT
         STR   ''
L0405DD  ENT
         STR   'shiftKey'
L0405E6  ENT
         STR   ',optionKey'
L0405F1  ENT
         STR   'optionKey'
L0405FB  ENT
         STR   ',commandKey'
L040607  ENT
         STR   'commandKey'
L040612  ENT
         STR   'normal'
L040619  ENT
         STR   'chars'
L04061F  ENT
         STR   'word'
L040624  ENT
         STR   'string'
L04062B  ENT
         STR   'whole'
L040631  ENT
         STR   ','
L040633  ENT
         STR   '<type '
L04063A  ENT
         STR   '>'
L04063C  ENT
         DB    $00
L04063D  ENT
         DB    $00
L04063E  ENT
         DB    $00
L04063F  ENT
         DB    $00
L040640  ENT
         DB    $00
L040641  ENT
         DB    $00
L040642  ENT
         DB    $00
L040643  ENT
         DB    $00
L040644  ENT
         DB    $00
L040645  ENT
         DB    $00
L040646  ENT
         DB    $00
L040647  ENT
         DB    $00
L040648  ENT
         DB    $00
L040649  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040653  ENT
         STR   '.'
L040655  ENT
         STR   ''
L040656  ENT
         STR   '0'
L040658  ENT
         STR   '.'
L04065A  ENT
         STR   '0'
L04065C  ENT
         STR   '-'
L04065E  ENT
         STR   '-'
L040660  ENT
         STR   '0'
L040662  ENT
         STR   '-'
L040664  ENT
         STR   ''
L040665  ENT
         STR   'card'
L04066A  ENT
         STR   'bkgnd'
L040670  ENT
         STR   'char 1 to 1'
L04067C  ENT
         STR   'line '
L040682  ENT
         STR   'line '
L040688  ENT
         STR   'char '
L04068E  ENT
         STR   ' to '
L040693  ENT
         STR   ' of '
L040698  ENT
         STR   ' field '
L0406A0  ENT
         STR   ''
L0406A1  ENT
         STR   'card'
L0406A6  ENT
         STR   'bkgnd'
L0406AC  ENT
         STR   ' field '
L0406B4  ENT
         STR   'char '
L0406BA  ENT
         STR   ' to '
L0406BF  ENT
         STR   ' of '
L0406C4  ENT
         STR   'line '
L0406CA  ENT
         STR   ' of '
L0406CF  ENT
         STR   ''
L0406D0  ENT
         STR   'message box'
L0406DC  ENT
         STR   'card'
L0406E1  ENT
         STR   'bkgnd'
L0406E7  ENT
         STR   ' field '
L0406EF  ENT
         STR   'char '
L0406F5  ENT
         STR   ' to '
L0406FA  ENT
         STR   ' of '
L0406FF  ENT
         STR   'line '
L040705  ENT
         STR   ' of '
L04070A  ENT
         STR   ', '
L04070D  ENT
         STR   ' '
L04070F  ENT
         STR   ', '
L040712  ENT
         STR   ', '
L040715  ENT
         STR   ' '
L040717  ENT
         STR   ', '
L04071A  ENT
         STR   '0'
L04071C  ENT
         STR   '0'
L04071E  ENT
         STR   'applications'
L04072B  ENT
         STR   'documents'
L040735  ENT
         STR   'No such application'
L040749  ENT
         STR   'No such document'
L04075A  ENT
         DB    $00
L04075B  ENT
         DB    $00
L04075C  ENT
         DB    $00
L04075D  ENT
         STR   'it'
L040760  ENT
         DB    $00
L040761  ENT
         DB    $00
L040762  ENT
         STR   'plain'
L040768  ENT
         STR   'bold,'
L04076E  ENT
         STR   'italic,'
L040776  ENT
         STR   'underline,'
L040781  ENT
         STR   'outline,'
L04078A  ENT
         STR   'shadow,'
L040792  ENT
         STR   'condense,'
L04079C  ENT
         STR   'extend,'
L0407A4  ENT
         STR   '<< dummy handler >>'
L0407B8  ENT
         DB    $00
L0407B9  ENT
         DB    $00
L0407BA  ENT
         STR   'it'
L0407BD  ENT
         DB    $00
L0407BE  ENT
         STR   'MAIN'
L0407C3  ENT
         STR   'MAIN'
L0407C8  ENT
         STR   'Big Buffer Busy #1'
L0407DB  ENT
         STR   'HyperPaint'
L0407E6  ENT
         STR   'HyperPnt2'
L0407F0  ENT
         STR   'Paste '
L0407F7  ENT
         DB    $00
L0407F8  ENT
         DB    $00
L0407F9  ENT
         STR   'Text'
L0407FE  ENT
         STR   'Picture'
L040806  ENT
         STR   'Cut '
L04080B  ENT
         STR   'Copy '
L040811  ENT
         STR   'Clear '
L040818  ENT
         DB    $00
L040819  ENT
         DB    $00
L04081A  ENT
         DB    $00
L04081B  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $AC
L040821  ENT
         DB    $00
L040822  ENT
         DB    $00
L040823  ENT
         DB    $60
         DB    $00
L040825  ENT
         DB    $60
         DB    $00
L040827  ENT
         STR   'HPrintMix'
L040831  ENT
         STR   'Cancel'
L040838  ENT
         STR   'HPrintMix'
L040842  ENT
         STR   'HPrintGrx'
L04084C  ENT
         STR   'HPrintGrx'
L040856  ENT
         STR   'HPrintDlog'
L040861  ENT
         STR   'HPrintMix'
L04086B  ENT
         STR   'HPrintDlog'
L040876  ENT
         STR   'HPrintMix'
L040880  ENT
         STR   'HPrintMix'
L04088A  ENT
         STR   ' '
L04088C  ENT
         STR   ' '
L04088E  ENT
         STR   ' '
L040890  ENT
         STR   ' '
L040892  ENT
         STR   ' '
L040894  ENT
         DB    $00
L040895  ENT
         STR   '2'
L040897  ENT
         DB    $00
L040898  ENT
         STR   'HPrintRept'
L0408A3  ENT
         STR   'HPrintCard'
L0408AE  ENT
         STR   'Export template "'
L0408C0  ENT
         STR   '" to:'
L0408C6  ENT
         STR   'HPrintHF'
L0408CF  ENT
         DB    $00
L0408D0  ENT
         DB    $00
L0408D1  ENT
         STR   ' '
L0408D3  ENT
         STR   ' '
L0408D5  ENT
         STR   'HPrintHF'
L0408DE  ENT
         DB    $00
L0408DF  ENT
         DB    $00
L0408E0  ENT
         STR   'a'
L0408E2  ENT
         DB    $00
L0408E3  ENT
         DB    $00
L0408E4  ENT
         DB    $00
L0408E5  ENT
         DB    $00
L0408E6  ENT
         DB    $00
L0408E7  ENT
         STR   '"'
L0408E9  ENT
         STR   '"'
L0408EB  ENT
         STR   ' = "'
L0408F0  ENT
         STR   '"'
L0408F2  ENT
         STR   ' = "'
L0408F7  ENT
         STR   '"'
L0408F9  ENT
         DB    $00
L0408FA  ENT
         DB    $00
L0408FB  ENT
         STR   'big buffer busy error #3'
L040914  ENT
         DB    $00
L040915  ENT
         STR   'HPrintMain'
L040920  ENT
         STR   'That'27's all folks...'
L040934  ENT
         STR   'username'
L04093D  ENT
         DB    $00
L04093E  ENT
         STR   'you'
L040942  ENT
         DB    $00
L040943  ENT
         DB    $00
L040944  ENT
         DB    $00
L040945  ENT
         DB    $00
L040946  ENT
         STR   'Text'
L04094B  ENT
         STR   'Picture'
L040953  ENT
         STR   'Card'
L040958  ENT
         STR   'Button'
L04095F  ENT
         STR   'Field'
L040965  ENT
         DB    $00
L040966  ENT
         DB    $00
L040967  ENT
         DB    $00
L040968  ENT
         STR   'stacks'
L04096F  ENT
         STR   'stacks'
L040976  ENT
         DB    $00
L040977  ENT
         DB    $00
L040978  ENT
         DB    $00
L040979  ENT
         STR   'controlKey '
L040985  ENT
         STR   'functionKey '
L040992  ENT
         STR   'returnInField'
L0409A0  ENT
         STR   'enterInField'
L0409AD  ENT
         STR   'choose tool '
L0409BA  ENT
         STR   'set pattern to '
L0409CA  ENT
         STR   'doMenu "'
L0409D3  ENT
         STR   '"'
L0409D5  ENT
         DB    $10
         DB    $5A
         DB    $07
         DB    $00
L0409D9  ENT
         STR   '?'
L0409DB  ENT
         STR   '8:'
L0409DE  ENT
         STR   'stacks'
L0409E5  ENT
         STR   'applications'
L0409F2  ENT
         STR   'documents'
L0409FC  ENT
         STR   'Can'27't BufToScrn non aligned buffer'
L040A1F  ENT
         STR   'Bad vis src # '
L040A2E  ENT
         DB    $00
L040A2F  ENT
         DB    $00
L040A30  ENT
         DB    $00
L040A31  ENT
         DB    $00
L040A32  ENT
         DB    $00
L040A33  ENT
         DB    $00
L040A34  ENT
         DB    $00
L040A35  ENT
         STR   'Fresh Bits         '
L040A49  ENT
         STR   'Free Object        '
L040A5D  ENT
         STR   'That'27's all folks...'
L040A71  ENT
         DB    $00
L040A72  ENT
         DB    $00
L040A73  ENT
         DB    $00
L040A74  ENT
         DB    $00
L040A75  ENT
         DB    $00
L040A76  ENT
         DB    $00
L040A77  ENT
         STR   'home'
L040A7C  ENT
         DB    $00
L040A7D  ENT
         DB    $00
L040A7E  ENT
         STR   '*0'
L040A81  ENT
         DB    $00
L040A82  ENT
         DB    $00
L040A83  ENT
         DB    $00
L040A84  ENT
         DB    $00
L040A85  ENT
         DB    $00
L040A86  ENT
         STR   '0123456789ABCDEF'
L040A97  ENT
         STR   '0123456789ABCDEF'
L040AA8  ENT
         STR   '-'
L040AAA  ENT
         STR   'Tool'
L040AAF  ENT
         STR   'Message'
L040AB7  ENT
         STR   'Go'
L040ABA  ENT
         STR   'Pattern'
L040AC2  ENT
         DB    $00
L040AC3  ENT
         DB    $00
L040AC4  ENT
         STR   'Tool'
L040AC9  ENT
         STR   'Go'
L040ACC  ENT
         STR   'Pattern'
L040AD4  ENT
         STR   'Message'
L040ADC  ENT
         DB    $00
L040ADD  ENT
         DB    $08
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $0A
         DB    $00
         DB    $14
         DB    $00
         DB    $14
         DB    $00
         DB    $54
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $81
         DB    $03
         DB    $00
         DB    $00
         DB    $10
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040AF7  ENT
         DB    $00
         DB    $00
L040AF9  ENT
         DB    $00
         DB    $00
L040AFB  ENT
         DB    $00
         DB    $00
L040AFD  ENT
         DW    $0009      ; pCount
         ADRL  $00000001  ; ID
L040B03  ENT
         DW    $0001      ; rect
         DW    $0002
         DW    $0003
         DW    $0004
         ADRL  $80000000  ; procRef
         DW    $0001      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L040B25    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   0D         ; keyequivalent
         ASC   0D         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L040B25  STR   'OK'
L040B28  ENT
         DW    $0009      ; pCount
         ADRL  $00000002  ; ID
L040B2E  ENT
         DW    $0001      ; rect
         DW    $0002
         DW    $0003
         DW    $0004
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $3000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L040B50    ; titleRef
         ADRL  $00000000  ; colorTableRef
         ASC   1B         ; keyequivalent
         ASC   1B         ; 2nd key equivalent
         DW    $0000      ; keyModifiers
         DW    $0000      ; keyCareBits
L040B50  STR   'Cancel'
L040B57  ENT
         DW    $0000
         ADRL  $00870000
         DW    $0140
         DW    $FFFF
         DW    $0000
         DW    $0000
         ADRL  L040B9D
         ADRL  L040BBC
         ADRL  L040BD9
         ADRL  L040BF7
         ADRL  L040C17
         ADRL  L040C36
L040B7D  ENT
         ADRL  L040C4E
         ADRL  L040C7E
         ADRL  L040C96
         ADRL  L040CAE
         ADRL  L040CC6
         ADRL  L040CEF
         ADRL  L040D12
         ADRL  $00000000
L040B9D  DW    $0001
         DW    $0057
         DW    $00CC
         DW    $0063
         DW    $0136
         DW    $000A
         ADRL  L040BB5
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040BB5  STR   'Create'
L040BBC  DW    $0002
         DW    $0031
         DW    $00CC
         DW    $003D
         DW    $0136
         DW    $000A
         ADRL  L040BD4
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040BD4  STR   'Open'
L040BD9  DW    $0003
         DW    $0040
         DW    $00CC
         DW    $004C
         DW    $0136
         DW    $000A
         ADRL  L040BF1
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040BF1  STR   'Close'
L040BF7  DW    $0004
         DW    $000F
         DW    $00CC
         DW    $001B
         DW    $0136
         DW    $000A
         ADRL  L040C0F
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040C0F  STR   'Volumes'
L040C17  DW    $0005
         DW    $0068
         DW    $00CC
         DW    $0074
         DW    $0136
         DW    $000A
         ADRL  L040C2F
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040C2F  STR   'Cancel'
L040C36  DW    $0006
         DW    $001A
         DW    $00A9
         DW    $0058
         DW    $00C2
         DW    $000D
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
L040C4E  DW    $0007
         DW    $0000
         DW    $000A
         DW    $000C
         DW    $013B
         DW    $0014
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0008
         DW    $001A
         DW    $000A
         DW    $0058
         DW    $00AA
         DW    $0014
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040C7E  DW    $0008
         DW    $001A
         DW    $000A
         DW    $0058
         DW    $00AA
         DW    $0014
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040C96  DW    $0009
         DW    $005A
         DW    $000A
         DW    $0066
         DW    $00C8
         DW    $8014
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040CAE  DW    $000A
         DW    $0066
         DW    $000A
         DW    $0074
         DW    $00C2
         DW    $0011
         DW    $0000
         DW    $0000
         DW    $001E
         DW    $0000
         DW    $0000
         DW    $0000
L040CC6  DW    $000B
         DW    $000C
         DW    $000A
         DW    $0016
         DW    $00C8
         DW    $800F
         ADRL  L040CDE
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040CDE  STR   '^0 free of ^1 K.'
L040CEF  DW    $000C
         DW    $001D
         DW    $00CC
         DW    $0029
         DW    $0136
         DW    $000A
         ADRL  L040D07
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040D07  STR   'New Folder'
L040D12  DW    $000D
         DW    $0078
         DW    $000A
         DW    $0082
         DW    $00C8
         DW    $000B
         ADRL  L040D2A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040D2A  STR   'Copy Current Background'
L040D42  ENT
         DW    $0000
         ADRL  L086734
         DW    $4000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $001F
         DW    $0064
         DW    $0041
         DW    $01C2
         DW    $FFFF
         DW    $FFFF
         DW    $0000
         DW    $0000
L040D66  ENT
         ADRL  L040D7A
         ADRL  L040DA2
         ADRL  L040DCA
         ADRL  L040DF3
         ADRL  $00000000
L040D7A  DW    $0008      ; pCount
         ADRL  $00000001  ; ID
         DW    $0003      ; rect
         DW    $0014
         DW    $000D
         DW    $015E
         ADRL  $81000000  ; procRef
         DW    $FF03      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L040D9A    ; textRef
         DW    $0008      ; textSize
L040D9A  ASC   'Link to:'
L040DA2  DW    $0007      ; pCount
         ADRL  $00000002  ; ID
         DW    $0011      ; rect
         DW    $0014
         DW    $001E
         DW    $006E
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L040DC0    ; titleRef
L040DC0  STR   'This Card'
L040DCA  DW    $0007      ; pCount
         ADRL  $00000003  ; ID
         DW    $0011      ; rect
         DW    $0082
         DW    $001E
         DW    $00DC
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L040DE8    ; titleRef
L040DE8  STR   'This Stack'
L040DF3  DW    $0007      ; pCount
         ADRL  $00000004  ; ID
         DW    $0011      ; rect
         DW    $00F0
         DW    $001E
         DW    $014A
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000000  ; refCon
         ADRL  L040E11    ; titleRef
L040E11  STR   'Cancel'
L040E18  ENT
         DW    $0037
         DW    $0056
         DW    $0072
         DW    $022A
         DW    $0FA0
         DW    $C0C0
         DW    $C0C0
         ADRL  L040E3A
         ADRL  L040E52
         ADRL  L040E6A
         ADRL  L040E82
         ADRL  $00000000
L040E3A  DW    $0001
         DW    $0029
         DW    $00FC
         DW    $0036
         DW    $015B
         DW    $000A
         ADRL  L040E9A
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040E52  DW    $0002
         DW    $0029
         DW    $016E
         DW    $0036
         DW    $01C5
         DW    $000A
         ADRL  L040E9E
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040E6A  DW    $0003
         DW    $0007
         DW    $0050
         DW    $0010
         DW    $01C7
         DW    $800F
         ADRL  L040EA1
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040E82  DW    $0004
         DW    $0013
         DW    $0050
         DW    $001C
         DW    $01C7
         DW    $800F
         ADRL  L040EC5
         DW    $0000
         DW    $0000
         DW    $0000
         DW    $0000
L040E9A  STR   'Yes'
L040E9E  STR   'No'
L040EA1  STR   'Do you really want to delete the ^0'
L040EC5  STR   'template "^1".'
L040ED4  ENT
         DW    $012D
         ADRL  L041144
         DW    $0000
         ADRL  $00000000
L040EE0  ENT
         DW    $0191
         ADRL  L04115C
         DW    $0192
         ADRL  L041169
         DW    $0193
         ADRL  L041177
         DW    $0195
         ADRL  L041186
         DW    $0196
         ADRL  L041194
         DW    $0197
         ADRL  L0411A5
         DW    $0199
         ADRL  L0411B5
         DW    $019A
         ADRL  L0411C3
         DW    $019B
         ADRL  L0411CE
         DW    $019D
         ADRL  L0411D7
         DW    $0000
         ADRL  $00000000
L040F22  ENT
         DW    $00FA
         ADRL  L0411E6
         DW    $00FB
         ADRL  L0411EB
         DW    $00FC
         ADRL  L0411EF
         DW    $00FD
         ADRL  L0411F4
         DW    $00FE
         ADRL  L0411FA
         DW    $01FC
         ADRL  L041200
         DW    $01FD
         ADRL  L041209
         DW    $01FE
         ADRL  L041215
         DW    $01FF
         ADRL  L04121E
         DW    $0201
         ADRL  L041228
         DW    $0202
         ADRL  L041236
         DW    $0000
         ADRL  $00000000
L040F6A  ENT
         DW    $0259
         ADRL  L041241
         DW    $025A
         ADRL  L041246
         DW    $025B
         ADRL  L04124B
         DW    $025C
         ADRL  L041250
         DW    $025D
         ADRL  L041257
         DW    $025E
         ADRL  L04125D
         DW    $025F
         ADRL  L041262
         DW    $0260
         ADRL  L041267
         DW    $0261
         ADRL  L04126C
         DW    $0262
         ADRL  L041274
         DW    $0263
         ADRL  L04127C
L040FAC  ENT
         DW    $0000
         ADRL  $00000000
L040FB2  ENT
         DW    $0321
         ADRL  L04128B
         DW    $0322
         ADRL  L04129A
         DW    $0323
         ADRL  L0412A8
         DW    $0324
         ADRL  L0412B5
         DW    $0325
         ADRL  L0412C3
         DW    $0327
         ADRL  L0412D1
         DW    $0328
         ADRL  L0412DE
         DW    $032A
         ADRL  L0412EB
         DW    $032B
         ADRL  L0412F6
         DW    $032C
         ADRL  L041300
         DW    $0000
         ADRL  $00000000
L040FF4  ENT
         DW    $0385
         ADRL  L04130F
         DW    $0386
         ADRL  L041316
         DW    $0388
         ADRL  L041321
         DW    $0389
         ADRL  L041326
         DW    $038A
         ADRL  L04132D
         DW    $038B
         ADRL  L041334
         DW    $038C
         ADRL  L041340
         DW    $038D
         ADRL  L04134C
         DW    $038E
         ADRL  L041359
         DW    $038F
         ADRL  L041367
         DW    $0391
         ADRL  L041377
         DW    $0392
         ADRL  L04137E
         DW    $0394
         ADRL  L04138A
         DW    $0395
         ADRL  L04138F
         DW    $0000
         ADRL  $00000000
L04104E  ENT
         DW    $03E9
         ADRL  L041396
         DW    $03EA
         ADRL  L04139B
         DW    $03EB
         ADRL  L0413A3
         DW    $03ED
         ADRL  L0413AE
         DW    $03EE
         ADRL  L0413BB
         DW    $03EF
         ADRL  L0413CA
         DW    $03F0
         ADRL  L0413DA
         DW    $03F1
         ADRL  L0413ED
         DW    $03F3
         ADRL  L0413FE
         DW    $03F4
         ADRL  L04140A
         DW    $03F5
         ADRL  L041418
         DW    $03F6
         ADRL  L041426
L041096  ENT
         DW    $0000
         ADRL  $00000000
L04109C  ENT
         DW    $04B1
         ADRL  L04115C
         DW    $04B2
         ADRL  L041169
         DW    $04B3
         ADRL  L041177
         DW    $04B5
         ADRL  L0411B5
         DW    $04B6
         ADRL  L0411C3
         DW    $04B7
         ADRL  L0411CE
         DW    $04B9
         ADRL  L0411D7
         DW    $0000
         ADRL  $00000000
L0410CC  ENT
         DW    $00FA
         ADRL  L0411E6
         DW    $00FB
         ADRL  L0411EB
         DW    $00FC
         ADRL  L0411EF
         DW    $00FD
         ADRL  L0411F4
         DW    $00FE
         ADRL  L0411FA
         DW    $051C
         ADRL  L041200
         DW    $051D
         ADRL  L041209
         DW    $0000
         ADRL  $00000000
L0410FC  ENT
         DW    $0579
         ADRL  L04115C
         DW    $057A
         ADRL  L041169
         DW    $057B
         ADRL  L041177
         DW    $057D
         ADRL  L041434
         DW    $057E
         ADRL  L041444
         DW    $0580
         ADRL  L041186
         DW    $0581
         ADRL  L041194
         DW    $0582
         ADRL  L0411A5
         DW    $0584
         ADRL  L0411B5
         DW    $0585
         ADRL  L0411C3
         DW    $0586
         ADRL  L0411CE
         DW    $0588
         ADRL  L0411D7
L041144  STR   'About HyperCard IIGS...'
L04115C  STR   'New Stack...'
L041169  STR   'Open Stack...'
L041177  STR   'Save a Copy...'
L041186  STR   'Compact Stack'
L041194  STR   'Protect Stack...'
L0411A5  STR   'Delete Stack...'
L0411B5  STR   'Page Setup...'
L0411C3  STR   'Print Card'
L0411CE  STR   'Print...'
L0411D7  STR   'Quit HyperCard'
L0411E6  STR   'Undo'
L0411EB  STR   'Cut'
L0411EF  STR   'Copy'
L0411F4  STR   'Paste'
L0411FA  STR   'Clear'
L041200  STR   'New Card'
L041209  STR   'Delete Card'
L041215  STR   'Cut Card'
L04121E  STR   'Copy Card'
L041228  STR   'Text Style...'
L041236  STR   'Background'
L041241  STR   'Back'
L041246  STR   'Home'
L04124B  STR   'Help'
L041250  STR   'Recent'
L041257  STR   'First'
L04125D  STR   'Prev'
L041262  STR   'Next'
L041267  STR   'Last'
L04126C  STR   'Find...'
L041274  STR   'Message'
L04127C  STR   'Show All Cards'
L04128B  STR   'Button Info...'
L04129A  STR   'Field Info...'
L0412A8  STR   'Card Info...'
L0412B5  STR   'Bkgnd Info...'
L0412C3  STR   'Stack Info...'
L0412D1  STR   'Bring Closer'
L0412DE  STR   'Send Farther'
L0412EB  STR   'New Button'
L0412F6  STR   'New Field'
L041300  STR   'New Background'
L04130F  STR   'Select'
L041316  STR   'Select All'
L041321  STR   'Fill'
L041326  STR   'Invert'
L04132D  STR   'Pickup'
L041334  STR   'Trace Edges'
L041340  STR   'Rotate Left'
L04134C  STR   'Rotate Right'
L041359  STR   'Flip Vertical'
L041367  STR   'Flip Horizontal'
L041377  STR   'Opaque'
L04137E  STR   'Transparent'
L04138A  STR   'Keep'
L04138F  STR   'Revert'
L041396  STR   'Grid'
L04139B  STR   'FatBits'
L0413A3  STR   'Power Keys'
L0413AE  STR   'Line Size...'
L0413BB  STR   'Brush Shape...'
L0413CA  STR   'Edit Pattern...'
L0413DA  STR   'Choose ColorSet...'
L0413ED  STR   'Polygon Sides...'
L0413FE  STR   'Draw Filled'
L04140A  STR   'Draw Centered'
L041418  STR   'Draw Multiple'
L041426  STR   'Draw Outlined'
L041434  STR   'Import Paint...'
L041444  STR   'Export Paint...'
L041454  ENT
         DB    $01
         DB    $36
         DB    $01
         DB    $01
         DB    $01
         DB    $37
         DB    $35
         DB    $01
         DB    $05
         DB    $0B
         DB    $08
         DB    $07
         DB    $39
         DB    $09
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $06
         DB    $01
         DB    $01
         DB    $03
         DB    $01
         DB    $01
         DB    $02
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $0F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $12
         DB    $0D
         DB    $11
         DB    $0E
         DB    $10
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0D
         DB    $12
         DB    $0E
         DB    $10
         DB    $00
         DB    $14
         DB    $15
         DB    $16
         DB    $17
         DB    $18
         DB    $19
         DB    $1A
         DB    $1B
         DB    $1C
         DB    $00
         DB    $00
         DB    $1D
         DB    $1E
         DB    $00
         DB    $1F
         DB    $20
         DB    $00
         DB    $21
         DB    $22
         DB    $23
         DB    $00
         DB    $24
         DB    $25
         DB    $00
         DB    $00
         DB    $00
         DB    $26
         DB    $00
         DB    $27
         DB    $00
         DB    $11
         DB    $0C
         DB    $14
         DB    $15
         DB    $16
         DB    $17
         DB    $18
         DB    $19
         DB    $1A
         DB    $1B
         DB    $1C
         DB    $00
         DB    $00
         DB    $1D
         DB    $1E
         DB    $00
         DB    $1F
         DB    $20
         DB    $00
         DB    $21
         DB    $22
         DB    $23
         DB    $00
         DB    $24
         DB    $25
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $00
         DB    $00
         DB    $32
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $32
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $2C
         DB    $2B
         DB    $2E
         DB    $30
         DB    $2F
         DB    $00
         DB    $00
         DB    $1A
         DB    $2A
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $34
         DB    $2D
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $1E
         DB    $32
         DB    $00
         DB    $00
         DB    $00
         DB    $33
         DB    $31
         DB    $00
         DB    $00
         DB    $00
         DB    $34
         DB    $00
         DB    $29
         DB    $00
         DB    $00
         DB    $28
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $32
         DB    $28
         DB    $1A
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $33
         DB    $00
         DB    $1E
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L041554  ENT
         DB    $41
         DB    $42
         DB    $43
         DB    $3F
         DB    $44
         DB    $45
         DB    $00
         DB    $47
         DB    $00
         DB    $49
         DB    $00
         DB    $4A
         DB    $00
         DB    $46
         DB    $00
         DB    $48
         DB    $00
         DB    $4B
         DB    $00
         DB    $36
         DB    $00
         DB    $00
         DB    $40
         DB    $00
         DB    $3E
         DB    $00
         DB    $3D
L04156F  ENT
         DB    $08
         DB    $15
         DB    $0B
         DB    $0A
L041573  ENT
         DB    $43
         DB    $63
         DB    $82
         DB    $8D
         DB    $42
         DB    $62
         DB    $BA
         DB    $F5
         DB    $53
         DB    $73
         DB    $A7
         DB    $EA
L04157F  ENT
         STR   'On'
L041582  ENT
         STR   'Function'
L04158B  ENT
         STR   'If'
L04158E  ENT
         STR   'Then'
L041593  ENT
         STR   'Else'
L041598  ENT
         STR   'Repeat'
L04159F  ENT
         STR   'End'
L0415A3  ENT
         STR   'Exit'
L0415A8  ENT
         STR   'Pass'
L0415AD  ENT
         STR   'Next'
L0415B2  ENT
         ADRL  L04164A
         ADRL  L041669
         ADRL  L041685
         ADRL  L0416A1
         ADRL  L0416BD
         ADRL  L0416DC
         ADRL  L0416FE
         ADRL  L04171D
         ADRL  L041739
         ADRL  L041755
         ADRL  L041774
         ADRL  L041790
         ADRL  L0417AC
         ADRL  L0417CB
         ADRL  L0417E7
         ADRL  L041803
         ADRL  L04181F
         ADRL  L04183E
         ADRL  L04185A
         ADRL  L041876
         ADRL  $00000000
         ADRL  L041892
         ADRL  L0418AE
         ADRL  $00000000
         ADRL  L0418CA
         ADRL  L0418E9
         ADRL  L041905
         ADRL  L041924
         ADRL  L041943
         ADRL  L041962
         ADRL  L041981
         ADRL  L0419A0
         ADRL  L0419BF
         ADRL  L0419DE
         ADRL  L0419FD
         ADRL  L041A1C
         ADRL  $00000000
         ADRL  L041A56
L04164A  HEX   09000C00FF1FFFFECFFFFEC0FFFEDB1F ; cursor height
         HEX   E2DF67ECFFE7F3FFE7FCFFCFFF3F9F
L041669  HEX   08000C00FFFFFFFFFFFFE0001F9FFFE7
         HEX   BFFFF39FFFE3E00007F8001F
L041685  HEX   08000C00FFFFFF800007BFFFF7924927
         HEX   BFFFF7924927BFFFF7800007
L0416A1  HEX   08000C00FFFFFFC0C18FCFFFCFFFFFCF
         HEX   CFFFCFCFFFFFCFFFCFC60C0F
L0416BD  HEX   09000C00FC003FC3FFC73FFFF33FFFC7
         HEX   C1F83F0C07FF31FFFFC3FFFFF7FFFF
L0416DC  HEX   0A000C00FFF03FFFC79FFFC81FFF3F3F
         HEX   FF3CFFFCFCFFFCF3FFFC0FFFFC3FFFFC
         HEX   FFFF
L0416FE  HEX   09000C00FFC7FFFFB3FFFF83FFFF83FF
         HEX   FC007FF9FF3FF9FF3FFAAA3FF554FF
L04171D  HEX   08000C00FFFFFFFF8003FE7FE3F9FF93
         HEX   E7FE4780011F9FF87F8001FF
L041739  HEX   08000C00FFFFFFFFFE1FFFF87FFFE1FF
         HEX   FF87FFFE1FFFF87FFFE1FFFF
L041755  HEX   09000C00CCF87FF3331FCCC007FFDFE7
         HEX   FFDC07FFDDE7FFDC07FFDFE7FFC007
L041774  HEX   08000C00FFFFFF8000079FFFE79FFFE7
         HEX   9FFFE79FFFE79FFFE7800007
L041790  HEX   08000C00FFFFFFE0001F9FFFE79FFFE7
         HEX   9FFFE79FFFE79FFFE7E0001F
L0417AC  HEX   09000C00FF0FFFFE67FFFE07FFFC601F
         HEX   E3E6079FCFC3E3FE23FC71E7FF8FEF
L0417CB  HEX   08000C00FFFFFFFC01FFE3FE3FCFFF9F
         HEX   9FFFCFCFFF9FE3FE3FFC01FF
L0417E7  HEX   08000C00FFFFFFF1FF1FCE7CE79F33E7
         HEX   9F8FCF9FFF3FC7F8FFF807FF
L041803  HEX   08000C00FFFFFFFFC7FFFF83FFFF31FF
         HEX   FE78FFFC007FF9FE3FE0FC0F
L04181F  HEX   09000C00FFCFFFFE31FFF1FE3FCFFFCF
         HEX   CFFFCFCFFFCFF1FE3FFE31FFFFCFFF
L04183E  HEX   08000C00FFFFFFFF000FFCFF3FF3FCFF
         HEX   CFF3FFCFFCFFCFFF3FC0000F
L04185A  HEX   08000C00FFFFFF8000079777679DDDC7
         HEX   9777679DDDC7977767800007
L041876  HEX   08000C00FFFFFFE0001F9777679DDDC7
         HEX   9777679DDDC7977767E0001F
L041892  HEX   08000C00FFFFFFFC01FFE3763FCDDD9F
         HEX   97774FCDDD9FE3763FFC01FF
L0418AE  HEX   08000C00FFFFFFF1FF1FCE7CE79B33A7
         HEX   8E8ECF9BBB3FC6E8FFF807FF
L0418CA  HEX   09000C00FFCFFFFE21FFF1BA3FC6EECF
         HEX   CBBB8FC6EECFF1BA3FFE21FFFFCFFF
L0418E9  HEX   08000C00FFFFFFFF000FFCDD3FF374FF
         HEX   CDD3FFC774FFCDDD3FC0000F
L041905  HEX   09000C00FFFE07FFFE67F03E67E67E67
         HEX   CC00E79FFFCFCC001FE67FFFF03FFF
L041924  HEX   09000C00F0003FE4FF9FCE7FCF9F3FE7
         HEX   0000039E7FCF9E7FCF9E7FCF80000F
L041943  HEX   09000C00FF01FFFC387FF87C3FFFF87F
         HEX   FFE1FFFFC7FFFFFFFFFFC7FFFFC7FF
L041962  HEX   09000C000000033FFFF3218613218613
         HEX   3FFFF32186132186133FFFF3000003
L041981  HEX   09000C0081F07F99E67F99CCFF999807
         HEX   993FE799980799CCFF99E67F81F07F
L0419A0  HEX   09000C00FC1FFFF99FFFF33FFFE6000F
         HEX   CFFFCFE6000FF33FFFF99FFFFC1FFF
L0419BF  HEX   09000C00FFE0FFFFE67FFFF33FC0019F
         HEX   CFFFCFC0019FFFF33FFFE67FFFE0FF
L0419DE  HEX   09000C00F83E07F99E67FCCE67806667
         HEX   9FF267806667FCCE67F99E67F83E07
L0419FD  HEX   09000C00E01FFF9FE7FF3FF3FF3FF3FF
         HEX   9FE7FFE0107FFFF00FFFFC03FFFF83
L041A1C  HEX   09001800E00000000001E39555555551
         HEX   E00000000001E7FFFFFFFFF9E7FFFFFF
         HEX   FFF9E7FFFFFFFFF9E4CCCCCCCCC9E7FF
         HEX   FFFFFFF9E00000000001
L041A56  HEX   09000C00
         DB    $E0
         DB    $F8
         DB    $3F
         DB    $E6
         DB    $79
         DB    $9F
         DB    $F3
         DB    $3C
         DB    $CF
         DB    $01
         DB    $80
         DB    $67
         DB    $3F
         DB    $CF
         DB    $F3
         DB    $01
         DB    $80
         DB    $67
         DB    $F3
         DB    $3C
         DB    $CF
         DB    $E6
         DB    $79
         DB    $9F
         DB    $E0
         DB    $F8
         DB    $3F
L041A75  ENT
         DB    $00
         DB    $00
L041A77  ENT
         DB    $00
         DB    $00
         STR   'MAIN'
         DB    $80
         DB    $00
         DB    $80
         DB    $02
         DB    $01
         DB    $00
L041A84  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $C8
         DB    $00
         ASC   'Andy'
         DB    $00
         DB    $00
         ASC   'Stadler'
L041AB3  ENT
         DB    $44
         DB    $F4
         DB    $44
         DB    $44
         DB    $44
         DB    $F4
         DB    $44
         DB    $44
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $44
         DB    $44
         DB    $44
         DB    $F4
         DB    $44
         DB    $44
         DB    $44
         DB    $F4
         DB    $44
         DB    $44
         DB    $44
         DB    $F4
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $44
         DB    $F4
         DB    $44
         DB    $44
         DB    $05
         DB    $00
         DB    $50
         DB    $00
         DB    $05
         DB    $00
         DB    $50
         DB    $00
         DB    $50
         DB    $55
         DB    $05
         DB    $00
         DB    $05
         DB    $00
         DB    $50
         DB    $55
         DB    $50
         DB    $00
         DB    $05
         DB    $00
         DB    $50
         DB    $00
         DB    $05
         DB    $00
         DB    $05
         DB    $00
         DB    $50
         DB    $55
         DB    $50
         DB    $55
         DB    $05
         DB    $00
         DB    $64
         DB    $46
         DB    $44
         DB    $66
         DB    $66
         DB    $44
         DB    $46
         DB    $64
         DB    $46
         DB    $64
         DB    $66
         DB    $44
         DB    $44
         DB    $66
         DB    $64
         DB    $46
         DB    $64
         DB    $46
         DB    $44
         DB    $66
         DB    $66
         DB    $44
         DB    $46
         DB    $64
         DB    $46
         DB    $64
         DB    $66
         DB    $44
         DB    $44
         DB    $66
         DB    $64
         DB    $46
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $FF
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $00
         DB    $F0
         DB    $00
         DB    $00
         DB    $F0
         DB    $00
         DB    $F0
         DB    $F0
         DB    $00
         DB    $F0
         DB    $00
         DB    $00
         DB    $F0
         DB    $00
         DB    $F0
         DB    $F0
         DB    $00
         DB    $F0
         DB    $00
         DB    $00
         DB    $F0
         DB    $00
         DB    $F0
         DB    $F0
         DB    $00
         DB    $F0
         DB    $00
         DB    $00
         DB    $F0
         DB    $00
         DB    $F0
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $0F
         DB    $4F
         DB    $F1
         DB    $FF
         DB    $44
         DB    $FF
         DB    $1F
         DB    $1F
         DB    $F4
         DB    $F1
         DB    $FF
         DB    $F1
         DB    $FF
         DB    $1F
         DB    $F4
         DB    $FF
         DB    $1F
         DB    $FF
         DB    $44
         DB    $4F
         DB    $F1
         DB    $1F
         DB    $F4
         DB    $FF
         DB    $1F
         DB    $F1
         DB    $FF
         DB    $F1
         DB    $FF
         DB    $FF
         DB    $1F
         DB    $1F
         DB    $F4
         DB    $FF
         DB    $9F
         DB    $FF
         DB    $9F
         DB    $FF
         DB    $FF
         DB    $F9
         DB    $FF
         DB    $9F
         DB    $FF
         DB    $99
         DB    $FF
         DB    $F9
         DB    $99
         DB    $F9
         DB    $FF
         DB    $FF
         DB    $9F
         DB    $FF
         DB    $9F
         DB    $FF
         DB    $F9
         DB    $F9
         DB    $99
         DB    $9F
         DB    $F9
         DB    $9F
         DB    $FF
         DB    $FF
         DB    $F9
         DB    $FF
         DB    $FF
         DB    $9F
         DB    $77
         DB    $FF
         DB    $F9
         DB    $FF
         DB    $77
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $77
         DB    $FF
         DB    $F9
         DB    $9F
         DB    $77
         DB    $77
         DB    $F9
         DB    $9F
         DB    $FF
         DB    $77
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $77
         DB    $FF
         DB    $9F
         DB    $FF
         DB    $77
         DB    $F9
         DB    $16
         DB    $16
         DB    $16
         DB    $16
         DB    $61
         DB    $61
         DB    $61
         DB    $61
         DB    $16
         DB    $16
         DB    $16
         DB    $16
         DB    $61
         DB    $61
         DB    $61
         DB    $61
         DB    $16
         DB    $16
         DB    $16
         DB    $16
         DB    $61
         DB    $61
         DB    $61
         DB    $61
         DB    $16
         DB    $16
         DB    $16
         DB    $16
         DB    $61
         DB    $61
         DB    $61
         DB    $61
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $4F
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $75
         DB    $75
         DB    $75
         DB    $75
         DB    $57
         DB    $57
         DB    $57
         DB    $57
         DB    $75
         DB    $75
         DB    $75
         DB    $75
         DB    $57
         DB    $57
         DB    $57
         DB    $57
         DB    $75
         DB    $75
         DB    $75
         DB    $75
         DB    $57
         DB    $57
         DB    $57
         DB    $57
         DB    $75
         DB    $75
         DB    $75
         DB    $75
         DB    $57
         DB    $57
         DB    $57
         DB    $57
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $6F
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $7F
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $F7
L041CB3  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $F0
         DB    $00
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $F0
         DB    $00
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $33
         DB    $03
         DB    $66
         DB    $06
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $AA
         DB    $0A
         DB    $CC
         DB    $0C
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $33
         DB    $03
         DB    $66
         DB    $06
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $AA
         DB    $0A
         DB    $CC
         DB    $0C
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $B8
         DB    $0F
         DB    $FC
         DB    $0B
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $9F
         DB    $0A
         DB    $F9
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $B8
         DB    $0F
         DB    $FC
         DB    $0B
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $9F
         DB    $0A
         DB    $F9
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $02
         DB    $0F
         DB    $BF
         DB    $00
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $0F
         DB    $09
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $02
         DB    $0F
         DB    $BF
         DB    $00
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $0F
         DB    $09
         DB    $F0
         DB    $0F
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $09
         DB    $0F
         DB    $96
         DB    $00
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $AF
         DB    $00
         DB    $F0
         DB    $0E
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $09
         DB    $0F
         DB    $96
         DB    $00
         DB    $FF
         DB    $0F
         DB    $00
         DB    $00
         DB    $AF
         DB    $00
         DB    $F0
         DB    $0E
         DB    $FF
         DB    $0F
L041D53  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L041D73  ENT
         DB    $01
         DB    $00
         DB    $4A
         DB    $00
         ADRL  L041DAD
         DW    $01F5
         DW    $0220
         ADRL  L04284A
         DW    $03E9
         DW    $0417
         ADRL  L042A5A
         DW    $0835
         DW    $0859
         ADRL  L042BEF
         DW    $0BB9
         DW    $0C3D
         ADRL  L043127
         DW    $0ED8
         DW    $0F02
         ADRL  L043F53
         DW    $0F0A
         DW    $0F1C
         ADRL  L04403B
         DW    $FFFF
L041DAD  STR   'Failed to create new card.'
         STR   'Failed to create new stack.'
         STR   'Failed to save new picture.'
         STR   'Please select something first.'
         STR   'Not enough disk space to compact stack.'
         STR   'Couldn'27't create temporary file for compacting stack.'
         STR   'Can'27't delete the Home stack.'
         STR   'Can'27't delete protected stack.'
         STR   'Failed to delete the stack.'
         STR   'Home stack not found.'
         STR   'Those passwords didn'27't match.'
         STR   'The disk is too full.'
         STR   'Failed to create file.'
         STR   'Failed to modify the part.'
         STR   'Failed to create new background.'
         STR   'An error occurred while pasting the card.'
         STR   'Can'27't delete last card.  Use Delete Stack instead.'
         STR   'Can'27't delete protected card.'
         STR   'Can'27't delete last card of a protected background.'
         STR   'An error occurred while deleting the card.'
         STR   'Can'27't rename home stack.'
         STR   'Characters '27':'27' and '27'/'27' are not allowed in filenames.'
         STR   'Rename operation failed.'
         STR   'Not enough memory to display the picture.'
         STR   'HyperCard does not have enough memory to continue.'
         STR   'Can'27't open stack *0.  *1 $*2.'
         STR   'Unexpected GS/OS error'
         STR   'File is locked or in use  GS/OS error.'
         STR   'Unexpected file system error *0 detected at *1.'
         STR   'Can'27't read card or background id *0, program location *1.'
         STR   'Nothing to copy.  Try background.'
         STR   'An error occurred while copying the picture.'
         STR   'An error occurred while compacting the stack.'
         STR   'Unable to paste the new part.'
         STR   'The clipboard is too large to paste.'
         STR   'That tool is not available at the current user level.'
         STR   'File system error *0 while *1 the disk.'
         STR   'reading from'
         STR   'writing to'
         STR   'Not enough memory for the paint tools.'
         STR   'First select a button or field.'
         STR   'Please use the field tool and select a field.'
         STR   'Please use the button tool and select a button.'
         STR   'Couldn'27't save text of field.'
         STR   'Show card picture?'
         STR   'Show background picture?'
         STR   'Save changes to the script?'
         STR   'Can'27't modify this stack.'
         STR   'This stack is read-only.'
         STR   'Unable to read from that stack file.'
         STR   'This stack requires a newer version of HyperCard.'
         STR   'This stack is too old for this version of HyperCard.'
         STR   'Out of memory.'
         STR   'An error occurred while copying the card.'
         STR   'That password was incorrect.'
         STR   'Unknown bitmap compression format.'
         STR   'Unable to open and read that paint file.'
         STR   'Can'27't import that kind of paint file.'
         STR   'Paint file not found.'
         STR   'OK to lose changes to this script?'
         STR   'The script editor ran out of memory.'
         STR   'Unable to save the script.'
         STR   'An error occurred while importing the icon.'
         STR   'Script editor not available while painting.'
         STR   'Unable to load the text editor.'
         STR   'Unable to modify the card.'
         STR   'Unable to modify the bkgnd.'
         STR   'Failed to delete the file.'
         STR   'GS/OS error $*0 occurred while copying the stack.'
         STR   'Please un-write-protect the volume *0.  If you are unable to, HyperCard will have to quit and the stack "*1" could be permanently damaged.'
         STR   'Caution:  The stack "*0" may be damaged.'
         STR   'System Disk 5.0.4 or later is required to run HyperCard IIGS.'
         STR   'Not enough memory to compact the stack.'
         STR   'Invalid callback attempted by XCMD.'
L04284A  STR   'openStack'
         STR   'openBackground'
         STR   'openCard'
         STR   'openField'
         STR   'closeStack'
         STR   'closeBackground'
         STR   'closeCard'
         STR   'closeField'
         STR   'newStack'
         STR   'newBackground'
         STR   'newCard'
         STR   'newButton'
         STR   'newField'
         STR   'deleteStack'
         STR   'deleteBackground'
         STR   'deleteCard'
         STR   'deleteButton'
         STR   'deleteField'
         STR   'mouseDown'
         STR   'mouseStillDown'
         STR   'mouseUp'
         STR   'idle'
         STR   'mouseEnter'
         STR   'mouseWithin'
         STR   'mouseLeave'
         STR   'startup'
         STR   'resume'
         STR   'quit'
         STR   'suspend'
         STR   'hide menuBar'
         STR   'show menuBar'
         STR   'tabKey'
         STR   'returnKey'
         STR   'returnInField'
         STR   'enterKey'
         STR   'enterInField'
         STR   'arrowKey left'
         STR   'arrowKey right'
         STR   'arrowKey up'
         STR   'arrowKey down'
         STR   'help'
         STR   'edit script of this card'
         STR   'edit script of this background'
         STR   'edit script of this stack'
L042A5A  STR   'Home'
         STR   '9:Stacks:'
         STR   'New Button'
         STR   'Cut '
         STR   'Copy '
         STR   'Clear '
         STR   'Paste '
         STR   'Text'
         STR   'Picture'
         STR   ''
         STR   'Button'
         STR   'Field'
         STR   'Card'
         STR   'stack '
         STR   'background ID '
         STR   'card ID '
         STR   'Script of '
         STR   ' field ID '
         STR   ' button ID '
         STR   ' out of '
         STR   ''
         STR   ''
         STR   'New Stack Name:'
         STR   'Save copy of stack in:'
         STR   ''
         STR   ''
         STR   'Find "'
         STR   'Card'
         STR   'Bkgnd'
         STR   'Create paint document:'
         STR   'Find whole "'
         STR   'Where:  '
         STR   '"'
         STR   'Where is '
         STR   ''
         STR   '.copy'
         STR   'Background'
         STR   'Select a paint document:'
         STR   'The quick brown fox jumps over the lazy dog.'
         STR   ''
         STR   ''
         STR   ''
         STR   ''
         STR   'ID: '
         STR   '0 (none)'
         STR   'Choose a stack:'
         STR   ' from "'
L042BEF  STR   18
         STR   19
         STR   09' '0D
         STR   ''
         STR   'Page '
         STR   'Card ID #'
         STR   'HyperCard: '
         STR   'Now preparing page '
         STR   '.'
         STR   'The print tools ran out of memory. Make a safety copy of your stack before trying again.'
         STR   'Bk #'
         STR   'Field #'
         STR   ': '
         STR   ' Clip '
         STR   'Picture Insert'
         STR   'current '
         STR   'Unable to create the template on this volume.'
         STR   'Unable to duplicate the graphic parts of the template on this volume.'
         STR   'Can'27't export into the current stack. Use Duplicate instead.'
         STR   'This stack already contains the maximum of 32 templates.'
         STR   'Untitled'
         STR   'Missing driver: Specified printer driver not found.'
         STR   'Specified print port not selected.'
         STR   'Internal Print Error: Can'27't complete printing.'
         STR   'The version of the LaserPrep print file is incorrect.'
         STR   'The version of the LaserPrep print file is incorrect.'
         STR   'Connection can'27't be established with the printer.'
         STR   'Read-write error on the printer.'
         STR   'Connection can'27't be established with the printer.'
         STR   'Warning: too much memory in use to complete printing.'
         STR   'Sorry, no such cards to print.'
         STR   'Warning: There are no fields and no graphic area selected in the template. Nothing will be printed.'
         STR   'Warning: The content of the template is out of the page area. Nothing will be printed.'
         STR   '"From/To" range of pages out of limit. Nothing will be printed.'
         STR   'The background specified by the printTemplate has not been found. Try to print anyway?'
         STR   'Printing cancelled...'
         STR   '"From/To" limit of cards in the Template Dialog is out of range. Ignore limit?'
L043127  STR   'No such stack'
         STR   'No such card'
         STR   'Expected unsigned integer but found "*0".'
         STR   'Can'27't use a reserved word as a variable name.'
         STR   'Expected "of" but found "*0".'
         STR   'Can'27't access fields or buttons in other stacks.  Use Go.'
         STR   'That property is read-only.'
         STR   'Too many variables.'
         STR   'Can'27't DIV by zero.'
         STR   'Can'27't MOD by zero.'
         STR   'Destination does not contain a number.'
         STR   'No open file named "*0".'
         STR   'Can'27't find menu item "*0".'
         STR   'Translator failed to translate the message box into English.'
         STR   'Can'27't find "*0".'
         STR   'Not enough memory to set paint properties.'
         STR   'Can'27't open any more files.'
         STR   'Couldn'27't create file "*0".'
         STR   'Got error *0 while trying to open file "*1".'
         STR   'Never heard of *0 *1 number *2.'
         STR   'Not enough memory to read from file.'
         STR   'File system error *0.'
         STR   'No such button or field.'
         STR   'Can'27't set that *0 property.'
         STR   'Never heard of *0 *1 id *2.'
         STR   'button'
         STR   'field'
         STR   'card'
         STR   'bkgnd'
         STR   'stack'
         STR   'HyperCard'
         STR   'window'
         STR   'Not a scrolling field.'
         STR   'Can'27't set properties of that object.'
         STR   'Sort by what?'
         STR   'Not enough memory to sort this stack.'
         STR   'wait'
         STR   'Error writing to file "*0".'
         STR   'Translator failed to indent.'
         STR   'Fields can'27't hold more than 30000 characters.'
         STR   'Couldn'27't set that field.'
         STR   'Couldn'27't load external command.'
         STR   'Too much recursion.'
         STR   'Translator failed to translate to English.'
         STR   'Out of memory.'
         STR   'Help'
         STR   'Can'27't find icon named "*0".'
         STR   ''
         STR   'Script of '
         STR   'Expected ")" but found "*0".'
         STR   'Expected ")".'
         STR   'Need number after "-" but got "*0".'
         STR   'Can'27't understand what'27's after "*0".'
         STR   ''
         STR   'Need true or false after "not" but got "*0".'
         STR   ''
         STR   '*0 is not the right type for *1.'
         STR   ''
         STR   'Only fields, buttons, cards, and backgrounds have numbers.'
         STR   'Can'27't take the value of that expression.'
         STR   ''
         STR   'Can'27't get that property.'
         STR   'Never heard of that button or field.'
         STR   'Can'27't understand arguments of *0 *1.'
         STR   'Expected expression but found "*0".'
         STR   'Found "else" without "then".'
         STR   'Found "end if" without "if".'
         STR   'Found "end repeat" without "repeat".'
         STR   'Not enough ends.'
         STR   'Found "exit repeat" outside a repeat loop.'
         STR   'Already have a local variable named "*0".'
         STR   'Found "if" without "then".'
         STR   'Too many repeats.'
         STR   'Found "then" without "if".'
         STR   'Too many pending messages.'
         STR   ''
         STR   '"*0" is not an application.'
         STR   'Expected end of line after "*0".'
         STR   'Never heard of *0 *1 named "*2".'
         STR   'There isn'27't any selection.'
         STR   'Expression too complicated.'
         STR   'Too many nested blocks.'
         STR   'Expected "(".'
         STR   'Unexpected end of line.'
         STR   'Expected comma between arguments.'
         STR   'end of line'
         STR   'Found "next repeat" outside a repeat loop.'
         STR   'Translator failed to translate indent strings.'
         STR   'Translator failed to initialize itself.'
         STR   'Can'27't load that translator.'
         STR   'Don'27't have a translator for that language.'
         STR   'Old translator failed on quit.'
         STR   'Can'27't understand arguments to command '
         STR   'Can'27't interpret that keyword in the message box.'
         STR   'Can'27't understand "*0".'
         STR   ' <- compound date space character'
         STR   'Failed to sort this stack.'
         STR   'User level is too low to edit scripts.'
         STR   'Can'27't edit script of HyperCard.'
         STR   'Couldn'27't edit script of that object.  Maybe it'27's been deleted.'
         STR   '*0 is not a rectangle.'
         STR   '*0 is not a point.'
         STR   'Only cards and backgrounds have pictures.'
         STR   '*0 was not a valid expression for any card.'
         STR   'External commands and functions cannot have more than 16 parameters.'
         STR   ''
         STR   'No such button as hilited button of *0 family *2.'
         STR   'OK'
         STR   '0 is not a valid family number.'
         STR   ''
         STR   'There aren'27't any buttons of *0 family *2.'
         STR   'function'
         STR   'not'
         STR   'Scripts can'27't have more than 30000 characters.'
         STR   'command'
         STR   'select'
         STR   'There are no *1 on this *0.'
         STR   'buttons'
         STR   'fields'
         STR   '*0 *1 *2'
         STR   'Script editor not available while painting.'
         STR   'Needed non-negative integer but got *0.'
         STR   'Need an integer value for seconds.'
         STR   'Number is out of range for seconds.'
         STR   'No such bkgnd'
         STR   'Can'27't restrict command find to a card field.'
         STR   'Couldn'27't get that text.'
         STR   'Fonts can'27't be set larger than 80 points.'
         STR   'Modem communication error *0.'
         STR   'Only background parts can have that property.'
         STR   'Unable to select print template *0.'
         STR   'No such window.'
         STR   'Can'27't close that window.'
L043F53  STR   'Sun'
         STR   'Mon'
         STR   'Tue'
         STR   'Wed'
         STR   'Thu'
         STR   'Fri'
         STR   'Sat'
         STR   'Sunday'
         STR   'Monday'
         STR   'Tuesday'
         STR   'Wednesday'
         STR   'Thursday'
         STR   'Friday'
         STR   'Saturday'
         STR   'Jan'
         STR   'Feb'
         STR   'Mar'
         STR   'Apr'
         STR   'May'
         STR   'Jun'
         STR   'Jul'
         STR   'Aug'
         STR   'Sep'
         STR   'Oct'
         STR   'Nov'
         STR   'Dec'
         STR   'January'
         STR   'February'
         STR   'March'
         STR   'April'
         STR   'May'
         STR   'June'
         STR   'July'
         STR   'August'
         STR   'September'
         STR   'October'
         STR   'November'
         STR   'December'
         STR   '/'
         STR   ':'
         STR   ' PM'
         STR   ' AM'
         STR   ''
L04403B  STR   ' tool'
         STR   'browse'
         STR   'button'
         STR   'field'
         STR   'select'
         STR   'lasso'
         STR   'pencil'
         STR   'brush'
         STR   'eraser'
         STR   'line'
         STR   'spray'
         STR   'rectangle'
         STR   'round rect'
         STR   'bucket'
         STR   'oval'
         STR   'curve'
         STR   'text'
         STR   'regular polygon'
         STR   'polygon'

*
* Genesys v1.2.4
* Tool Table editor
*

         mx    %00
         rel
         lst   off

*----------------------------

         use   4/Ctl.Macs
         use   4/Int.Macs
         use   4/Mem.Macs
         use   4/QD.Macs
         use   4/Resource.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*----------------------------

GSOS     EQU   $E100A8

sizeHEADER	=	$000c	; standard header size
sizeSTDREC	=	$0054	; 12 entries x 4 + header = $54
sizeFULLREC	=	$0084	; 30 entries x 4 + header = $84
resTYPE	=	$8013	; resource type supported by the editor

*----------------------------

         LDA   $04,S
         STA   ptrBUFFER
         LDA   $06,S
         STA   ptrBUFFER+2
         JMPL  entryPOINT

*--- Show my editor window

showWINDOW
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^refreshWINDOW
         PEA   refreshWINDOW
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   ^myWINDOW
         PEA   myWINDOW
         PEA   $800E
         _NewWindow2
         PLA
         STA   haWINDOW
         PLA
         STA   haWINDOW+2
         LDA   haWINDOW+2
         PHA
         LDA   haWINDOW
         PHA
         _SetPort
         PEA   $0000
         PEA   $0000
         LDA   haWINDOW+2
         PHA
         LDA   haWINDOW
         PHA
         PEA   $0003
         PEA   ^ctlWINDOW
         PEA   ctlWINDOW
         _NewControl2
         PLA
         PLA
         PLB
         PLD
         RTL

ctlWINDOW
         ADRL  L010D
         ADRL  L012D
         ADRL  L014D
         ADRL  L016D
         ADRL  L018D
         ADRL  L01AD
         ADRL  L01CD
         ADRL  L01ED
         ADRL  L020D
         ADRL  L022D
         ADRL  L024D
         ADRL  L026D
         ADRL  L028D
         ADRL  L02AD
         ADRL  L02CD
         ADRL  L02ED
         ADRL  L030D
         ADRL  L032D
         ADRL  L034D
         ADRL  L036D
         ADRL  L038D
         ADRL  L03AD
         ADRL  L03CD
         ADRL  L03ED
         ADRL  L040D
         ADRL  L042D
         ADRL  L044D
         ADRL  L046D
         ADRL  L048D
         ADRL  L04AD
         adrl  cTANIM
         ADRL  c320
         ADRL  c640
         ADRL  cFAAW
         ADRL  cHWSHA
         adrl  cSHRON	; new
         ADRL  cPREF
         ADRL  $00000000

L010D    DW    $0008      ; pCount
         ADRL  $00000001  ; ID
         DW    $0005      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000001  ; refCon
         ADRL  L0714      ; titleRef
         DW    $0000      ; initialValue
L012D    DW    $0008      ; pCount
         ADRL  $00000002  ; ID
         DW    $000F      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000002  ; refCon
         ADRL  L0705      ; titleRef
         DW    $0000      ; initialValue
L014D    DW    $0008      ; pCount
         ADRL  $00000003  ; ID
         DW    $0019      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000003  ; refCon
         ADRL  L06F7      ; titleRef
         DW    $0000      ; initialValue
L016D    DW    $0008      ; pCount
         ADRL  $00000004  ; ID
         DW    $0023      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000004  ; refCon
         ADRL  L06EA      ; titleRef
         DW    $0000      ; initialValue
L018D    DW    $0008      ; pCount
         ADRL  $00000005  ; ID
         DW    $002D      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000005  ; refCon
         ADRL  L06DD      ; titleRef
         DW    $0000      ; initialValue
L01AD    DW    $0008      ; pCount
         ADRL  $00000006  ; ID
         DW    $0037      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000006  ; refCon
         ADRL  L06CF      ; titleRef
         DW    $0000      ; initialValue
L01CD    DW    $0008      ; pCount
         ADRL  $00000007  ; ID
         DW    $0041      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000007  ; refCon
         ADRL  L06C5      ; titleRef
         DW    $0000      ; initialValue
L01ED    DW    $0008      ; pCount
         ADRL  $00000008  ; ID
         DW    $004B      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000008  ; refCon
         ADRL  L06BF      ; titleRef
         DW    $0000      ; initialValue
L020D    DW    $0008      ; pCount
         ADRL  $00000009  ; ID
         DW    $0055      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000009  ; refCon
         ADRL  L06BB      ; titleRef
         DW    $0000      ; initialValue
L022D    DW    $0008      ; pCount
         ADRL  $0000000A  ; ID
         DW    $005F      ; rect
         DW    $000C
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000A  ; refCon
         ADRL  L06B6      ; titleRef
         DW    $0000      ; initialValue
L024D    DW    $0008      ; pCount
         ADRL  $0000000B  ; ID
         DW    $0005      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000B  ; refCon
         ADRL  L06A9      ; titleRef
         DW    $0000      ; initialValue
L026D    DW    $0008      ; pCount
         ADRL  $0000000C  ; ID
         DW    $000F      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000C  ; refCon
         ADRL  L06A4      ; titleRef
         DW    $0000      ; initialValue
L028D    DW    $0008      ; pCount
         ADRL  $0000000E  ; ID
         DW    $0019      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000E  ; refCon
         ADRL  L0695      ; titleRef
         DW    $0000      ; initialValue
L02AD    DW    $0008      ; pCount
         ADRL  $0000000F  ; ID
         DW    $0023      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000000F  ; refCon
         ADRL  L0688      ; titleRef
         DW    $0000      ; initialValue
L02CD    DW    $0008      ; pCount
         ADRL  $00000010  ; ID
         DW    $002D      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000010  ; refCon
         ADRL  L0678      ; titleRef
         DW    $0000      ; initialValue
L02ED    DW    $0008      ; pCount
         ADRL  $00000011  ; ID
         DW    $0037      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000011  ; refCon
         ADRL  L066A      ; titleRef
         DW    $0000      ; initialValue
L030D    DW    $0008      ; pCount
         ADRL  $00000012  ; ID
         DW    $0041      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000012  ; refCon
         ADRL  L065B      ; titleRef
         DW    $0000      ; initialValue
L032D    DW    $0008      ; pCount
         ADRL  $00000013  ; ID
         DW    $004B      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000013  ; refCon
         ADRL  L064D      ; titleRef
         DW    $0000      ; initialValue
L034D    DW    $0008      ; pCount
         ADRL  $00000014  ; ID
         DW    $0055      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000014  ; refCon
         ADRL  L0643      ; titleRef
         DW    $0000      ; initialValue
L036D    DW    $0008      ; pCount
         ADRL  $00000015  ; ID
         DW    $005F      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000015  ; refCon
         ADRL  L0634      ; titleRef
         DW    $0000      ; initialValue
L038D    DW    $0008      ; pCount
         ADRL  $00000016  ; ID
         DW    $0005      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000016  ; refCon
         ADRL  L0626      ; titleRef
         DW    $0000      ; initialValue
L03AD    DW    $0008      ; pCount
         ADRL  $00000017  ; ID
         DW    $000F      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000017  ; refCon
         ADRL  L0618      ; titleRef
         DW    $0000      ; initialValue
L03CD    DW    $0008      ; pCount
         ADRL  $00000019  ; ID
         DW    $0019      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000019  ; refCon
         ADRL  L0607      ; titleRef
         DW    $0000      ; initialValue
L03ED    DW    $0008      ; pCount
         ADRL  $0000001A  ; ID
         DW    $0023      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000001A  ; refCon
         ADRL  L05F8      ; titleRef
         DW    $0000      ; initialValue
L040D    DW    $0008      ; pCount
         ADRL  $0000001B  ; ID
         DW    $002D      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000001B  ; refCon
         ADRL  L05EB      ; titleRef
         DW    $0000      ; initialValue
L042D    DW    $0008      ; pCount
         ADRL  $0000001C  ; ID
         DW    $0037      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000001C  ; refCon
         ADRL  L05DE      ; titleRef
         DW    $0000      ; initialValue
L044D    DW    $0008      ; pCount
         ADRL  $0000001D  ; ID
         DW    $0041      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000001D  ; refCon
         ADRL  L05DA      ; titleRef
         DW    $0000      ; initialValue
L046D    DW    $0008      ; pCount
         ADRL  $0000001E  ; ID
         DW    $004B      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $0000001E  ; refCon
         ADRL  L059C      ; titleRef
         DW    $0000      ; initialValue
L048D    DW    $0008      ; pCount
         ADRL  $00000020  ; ID
         DW    $0055      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000020  ; refCon
         ADRL  L0597      ; titleRef
         DW    $0000      ; initialValue

L04AD    DW    $0008      ; pCount
         ADRL  $00000022  ; ID
         DW    $005F      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000022  ; refCon
         ADRL  L058D      ; titleRef
         DW    $0000      ; initialValue

cTANIM   DW    $0008      ; pCount
         ADRL  $00000025  ; ID
         DW    $0069      ; rect
         DW    $0138
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000022  ; refCon
         ADRL  sTANIM     ; titleRef
         DW    $0000      ; initialValue

c320     DW    $0008      ; pCount
         ADRL  $00000320  ; ID
         DW    $0077      ; rect
         DW    $000E
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000320  ; refCon
         ADRL  s320      ; titleRef
         DW    $0000      ; initialValue

c640     DW    $0008      ; pCount
         ADRL  $00000640  ; ID
         DW    $0081      ; rect
         DW    $000E
         DW    $0000
         DW    $0000
         ADRL  $84000000  ; procRef
         DW    $0005      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00000640  ; refCon
         ADRL  s640      ; titleRef
         DW    $0001      ; initialValue

cFAAW    DW    $0008      ; pCount
         ADRL  $00001001  ; ID
         DW    $0077      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00001001  ; refCon
         ADRL  sFAAW      ; titleRef
         DW    $0000      ; initialValue

cHWSHA   DW    $0008      ; pCount
         ADRL  $00001002  ; ID
         DW    $0081      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00001002  ; refCon
         ADRL  sHWSHA      ; titleRef
         DW    $0000      ; initialValue

cSHRON   DW    $0008      ; pCount
         ADRL  $00001003  ; ID
         DW    $008b      ; rect
         DW    $00A2
         DW    $0000
         DW    $0000
         ADRL  $82000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00001002  ; refCon
         ADRL  sSHRON      ; titleRef
         DW    $0000      ; initialValue

cPREF    DW    $0007      ; pCount
         ADRL  $00001000  ; ID
         DW    $007f      ; rect
         DW    $015C
         DW    $008c
         DW    $01C0
         ADRL  $80000000  ; procRef
         DW    $0000      ; flag
         DW    $1000      ; moreFlags
         ADRL  $00001000  ; refCon
         ADRL  sPREF      ; titleRef

sSHRON	str	'Keep SHR screen on'
sHWSHA	str	'Hardware shadowing'
sFAAW	str	'Fastport aware'

sTANIM	str	'Animation'
L058D    STR   'Text edit'
L0597    STR   'MIDI'
L059C    STR   'Resource manager'
sPREF    STR   'Preferred'
s640     STR   '640 Mode'
s320     STR   '320 Mode'
         STR   'Resource manager'
L05DA    STR   'ACE'
L05DE    STR   'List manager'
L05EB    STR   'Font manager'
L05F8    STR   'Note sequencer'
L0607    STR   'Note synthesizer'
L0618    STR   'Standard file'
L0626    STR   'Scrap manager'
L0634    STR   'Dialog manager'
L0643    STR   'Line edit'
L064D    STR   'Print manager'
L065B    STR   'QuickDraw Aux.'
L066A    STR   'System loader'
L0678    STR   'Control manager'
L0688    STR   'Menu manager'
L0695    STR   'Window manager'
L06A4    STR   'Text'
L06A9    STR   'Integer math'
L06B6    STR   'SANE'
L06BB    STR   'ADB'
L06BF    STR   'Sound'
L06C5    STR   'Scheduler'
L06CF    STR   'Event manager'
L06DD    STR   'Desk manager'
L06EA    STR   'QuickDraw II'
L06F7    STR   'Miscellaneous'
L0705    STR   'Memory manager'
L0714    STR   'Tool locator'
L0721    STR   ' Tool Table '

myWINDOW DW    $0050
         DW    $C080      ; frame bits
         ADRL  L0721      ; title ptr
         ADRL  $00000000  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L077E      ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $0000      ; data size
         DW    $0000
         DW    $0000      ; max size
         DW    $0000
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
         ADRL  $00000000  ; content defproc
         DW    $0024      ; content rect
         DW    $001E
         DW    $00ba	; was $A6
         DW    $01F4
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
         DW    $0000

L077E    DW    $0000
         DW    $0F00
         DW    $020F
         DW    $F0FF
         DW    $00F0

*--- Refresh window

refreshWINDOW
         PHD
         PHB
         PHK
         PLB
         PEA   $0000
         _GetCurResourceFile
         LDA   resfileID
         PHA
         _SetCurResourceFile
         PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
         PEA   $000A
         PEA   $0074	; was $006A
         _MoveTo
         PEA   $01CC
         PEA   $0074	; was $006A
         _LineTo
         _SetCurResourceFile
         PLB
         PLD
         RTL

         BRK   $69
         RTL

*--- Write the resource

writeRESOURCE
         TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $18
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _GetResourceAttr
         STA   L2BCB
         PLA
         STA   $16
         LDA   $16
         AND   #$0020
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   #$0001
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _MarkResourceChange
         STA   L2BCB
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _WriteResource
         STA   L2BCB
         LDA   L2BCB
         BNE   L0859
         BRL   L0896

* Cannot write resource

L0859    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L08E8
         PEA   L08E8
         LDA   #$0044
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0896
         BRL   L0896

* Resource is written

L0896    LDA   $16
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $21
         PHA
         LDX   $1F
         LDA   $1D
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $18
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $18
         LDA   $1B
         STA   $21
         LDA   $1A
         STA   $20
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         RTL

L08E8    ASC   '52~Tool editor: Resource write error. Resource possibly damaged.~^#0'

*--- Load a resource

readRESOURCE
         TSC
         SEC
         SBC   #$0028
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         STA   $16
         LDA   #$0000
         STA   $18
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $26
         LDA   L2BCB
         BNE   L0959
         BRL   L095C
L0959    BRL   L0A27

* File depth search failed

L095C    LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _GetResourceAttr
         STA   L2BCB
         PLA
         STA   $24
         LDA   L2BCB
         BNE   L0996
         BRL   L0999
L0996    BRL   L0A27

* Getting resource attributes failed

L0999    LDA   $24
         AND   #$0020
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   L2BCB
         BNE   L09BA
         BRL   L09BD
L09BA    BRL   L0A27

* Setting bit 5 failed

L09BD    PHA
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _LoadResource
         STA   L2BCB
         PLA
         STA   $20
         PLA
         STA   $22
         LDA   L2BCB
         BNE   L09E0
         BRL   L09E3
L09E0    BRL   L0A27

* Resource exists

L09E3    LDX   $22
         LDA   $20
         PHX
         PHA
         _HLock
         STA   L2BCB
         LDA   L2BCB
         BNE   L09FB
         BRL   L09FE
L09FB    BRL   L0A27

* memory lock failed

L09FE    LDA   $24
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _SetResourceAttr
         STA   L2BCB
         LDA   L2BCB
         BNE   L0A1C
         BRL   L0A1F
L0A1C    BRL   L0A27

L0A1F    LDX   $22
         LDA   $20
         STX   $18
         STA   $16

* If we're here, we've suffered a lot

L0A27    PHA
         LDA   $26
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $26
         LDA   $29
         STA   $2F
         LDA   $28
         STA   $2E
         LDX   $18
         LDY   $16
         PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         TYA
         RTL

*---

makeSTDRESOURCE
         TSC
         SEC
         SBC   #$0028
         TCS
         PHD
         INC
         TCD
         LDA   #$0001
         STA   $16
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         JSL   readRESOURCE
         STX   $22
         STA   $20
         LDA   $20
         ORA   $22
         BEQ   L0A75
         BRL   L0AB5

* Cannot load resource

L0A75    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L0D79
         PEA   L0D79
         LDA   #$003B
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0AB2
         BRL   L0AB2
L0AB2    BRL   L0D66

* Resource is loaded

L0AB5    LDX   $22
         LDA   $20
         PHX
         PHA
         _HUnlock
         STA   L2BCB
         LDA   #sizeSTDREC
         LDX   #$0000
         TAY
         BPL   L0ACF
         DEX
L0ACF    PHX
         PHA
         LDX   $22
         LDA   $20
         PHX
         PHA
         _SetHandleSize
         STA   L2BCB
         LDA   L2BCB
         BNE   L0AE9
         BRL   L0B67

* Cannot resize handle

L0AE9    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L0DB4
         PEA   L0DB4
         LDA   #$003B
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $2F
         PHA
         LDX   $2D
         LDA   $2B
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $24
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0B64
         BRL   L0B64
L0B64    BRL   L0D66

* Handle is resized

L0B67    LDX   $22
         LDA   $20
         PHX
         PHA
         _HLock
         STA   L2BCB

* Now, we init a blank resource

         LDY   #$0002	; get the pointer
         LDA   [$20],Y
         TAX
         LDA   [$20]
         STX   $08
         STA   $06

         LDA   #$0000	; format the header
         STA   [$06]
         LDY   #$0002
         LDA   #$C180	; with bit 8
         STA   [$06],Y
         LDY   #$0004
         LDA   #$0000
         STA   [$06],Y
         LDY   #$0006
         LDA   #$0000
         STA   [$06],Y
         INY
         INY
         LDA   #$0000
         STA   [$06],Y
         LDY   #$000A
         LDA   #$0012
         STA   [$06],Y

         LDY   #$000C	; format the toolrec
         PHY
         LDA   #$0001
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0003
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0002
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0004
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0003
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0005
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0004
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0006
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0005
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$000B
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0006
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$000E
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0007
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$000F
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0008
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0010
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$0009
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0012
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$000A
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0013
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$000B
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0014
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$000C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0015
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$000D
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0016
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$000E
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0017
         STA   [$06],Y
         LDY   #$000C
         PHY
         LDA   #$000F
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$001B
         STA   [$06],Y

         LDY   #$000C
         PHY
         LDA   #$0010
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$001C
         STA   [$06],Y

         LDY   #$000C
         PHY
         LDA   #$0011
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$001E
         STA   [$06],Y

         LDY   #$000C
         PHY
         LDA   #$0012
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   #$0022
         STA   [$06],Y

         LDA   #$0001
         STA   $26

L0D2E    LDY   #$000C
         PHY
         LDA   $26
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         TYA
         CLC
         ADC   #$0002
         TAY
         LDA   #$0000
         STA   [$06],Y

         INC   $26
         LDA   $26
         CMP   #$0013
         bne   L0D2E

*---

L0D54    pei   $2F
         pei   $2D
         pei   $2B
         JSL   writeRESOURCE
         LDA   #$0000
         STA   $16
L0D66    LDA   $29
         STA   $2F
         LDA   $28
         STA   $2E
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$002E
         TCS
         TXA
         RTL

L0D79    ASC   '52~Tool editor: Resource load error. Operation aborted.~^#0'
L0DB4    ASC   '52~Tool editor: Memory resize error. Operation aborted.~^#0'

*--- Update buffer

updateBUFFER
         TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0048	; flag
         LDA   [$00],Y
         ORA   #$6000	; bits 14-13
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0050
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036	; move resource type
         LDA   [$00],Y	; from offset $36
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]	; to offset $50

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; move resource ID
         LDA   [$00],Y	; from offset $3A
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0052	; to offset $52
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y

         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

*---

L0E80    TSC
         SEC
         SBC   #$0026
         TCS
         PHD
         INC
         TCD
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0E93
         DEX
L0E93    PHX
         PHA
         PLA
         STA   $16
         PLA
         STA   $18
         PHA
         PHA
         LDA   #$0001
         LDX   #$0000
         TAY
         BPL   L0EA7
         DEX
L0EA7    PHX
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003C	; memID
         LDA   [$00],Y
         PHA
         LDA   #$8000
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L0EC7
         DEX
L0EC7    PHX
         PHA
         _NewHandle
         STA   L2BCB
         PLA
         STA   haMEMORY2
         PLA
         STA   haMEMORY2+2
         LDA   L2BCB
         BNE   L0EE3
         BRL   L0F23
L0EE3    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L119F
         PEA   L119F
         LDA   #$003C
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0F20
         BRL   L0F20
L0F20    BRL   L1192
L0F23    PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $20
         LDA   L2BCB
         BNE   L0F3D
         BRL   L0F8F
L0F3D    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L11DB
         PEA   L11DB
         LDA   #$0036
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L0F8C
         BRL   L0F8C
L0F8C    BRL   L1192
L0F8F    PHA
         PHA
         LDA   #$FFFF
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         _UniqueResourceID
         STA   L2BCB
         PLA
         STA   $22
         PLA
         STA   $24
         LDA   L2BCB
         BNE   L0FBD
         BRL   L100F
L0FBD    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1211
         PEA   L1211
         LDA   #$0037
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L100C
         BRL   L100C
L100C    BRL   L1141
L100F    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         LDA   #$0000
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         _AddResource
         STA   L2BCB
         LDA   L2BCB
         BNE   L1043
         BRL   L10A3
L1043    LDX   haMEMORY2+2
         LDA   haMEMORY2
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1248
         PEA   L1248
         LDA   #$0043
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1092
         BRL   L1092
L1092    LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L109C
         DEX
L109C    STX   $24
         STA   $22
         BRL   L1141
L10A3    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         _WriteResource
         STA   L2BCB
         LDA   L2BCB
         BNE   L10CB
         BRL   L1119
L10CB    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L128B
         PEA   L128B
         LDA   #$003F
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1108
         BRL   L1108
L1108    LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L1112
         DEX
L1112    STX   $24
         STA   $22
         BRL   L1141
L1119    LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
L1141    PHA
         LDA   $20
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $20
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L115C
         DEX
L115C    CMP   $22
         BNE   L1162
         CPX   $24
L1162    BNE   L1167
         BRL   L1192
L1167    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   $24
         LDA   $22
         PHX
         PHA
         JSL   makeSTDRESOURCE
         TAX
         BNE   L1187
         BRL   L118A
L1187    BRL   L1192
L118A    LDX   $24
         LDA   $22
         STX   $18
         STA   $16
L1192    LDX   $18
         LDY   $16
         PLD
         TSC
         CLC
         ADC   #$0026
         TCS
         TYA
         RTL

L119F    ASC   '52~Tool editor: Memory creation error. Creation aborted.~^#0'
L11DB    ASC   '52~Tool editor: Depth get error. Creation aborted.~^#0'
L1211    ASC   '52~Tool editor: Could not get ID. Creation aborted.~^#0'
L1248    ASC   '52~Tool editor: Could not add resource error. Creation aborted.~^#0'
L128B    ASC   '52~Tool editor: Could not write resource. Creation aborted.~^#0'

*---

createRESOURCE    TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         AND   #$8000
         BNE   L12EA
         BRL   L1929
L12EA    LDA   $2B
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         JSL   readRESOURCE	; load resource
         STX   $18
         STA   $16
         LDA   $16	; check handle
         ORA   $18
         BEQ   L1304	; empty, error
         BRL   L1344	; not empty, continue

* Resource is not loaded, display error

L1304    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1939	; cannot load resource
         PEA   L1939
         LDA   #$003F
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1341
         BRL   L1341
L1341    BRL   L1929

* Resource is loaded

L1344    LDX   $18
         LDA   $16
         PHX
         PHA
         _HUnlock
         STA   L2BCB
         LDA   #sizeFULLREC
         LDX   #$0000
         TAY
         BPL   L135E
         DEX
L135E    PHX
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _SetHandleSize
         STA   L2BCB
         LDA   L2BCB
         BNE   L1378
         BRL   L13F6

* Resource cannot be resized, display error

L1378    PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $2B
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $1E
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1978	; cannot resize resource
         PEA   L1978
         LDA   #$0041
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L13F3
         BRL   L13F3
L13F3    BRL   L1929

* Resource is resized

L13F6    LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L2BCB

* Now, prepare the resource handle

         LDA   #$0000
         STA   $1C
         LDA   #$0001
         STA   $1A
L1410    PHA
         PHA
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         LDA   #$0000
         CLC
         ADC   $1A
         LDX   #$0000
         TAY
         BPL   L1426
         DEX
L1426    PHX
         PHA
         _GetCtlHandleFromID
         STA   L2BCB
         _GetCtlValue
         STA   L2BCB
         PLA
         BNE   L1442
         BRL   L149C
L1442    LDA   $1C
         CLC
         ADC   #$0001
         STA   $1C
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   $1A
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         CLC
         ADC   #$0002
         PHA
         LDA   $1A
         DEC
         ASL
         TAX
         LDA   theTOOLREC,X
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L149C    INC   $1A
         LDA   $1A
         CMP   #$000D
         BEQ   L14A8
         BRL   L1410

L14A8    LDA   #$000E
         STA   $1A
L14AD    PHA
         PHA
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         LDA   #$0000
         CLC
         ADC   $1A
         LDX   #$0000
         TAY
         BPL   L14C3
         DEX
L14C3    PHX
         PHA
         _GetCtlHandleFromID
         STA   L2BCB
         _GetCtlValue
         STA   L2BCB
         PLA
         BNE   L14DF
         BRL   L1539
L14DF    LDA   $1C
         CLC
         ADC   #$0001
         STA   $1C
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   $1A
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         CLC
         ADC   #$0002
         PHA
         LDA   $1A
         DEC
         ASL
         TAX
         LDA   theTOOLREC,X
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L1539    INC   $1A
         LDA   $1A
         CMP   #$0018
         BEQ   L1545
         BRL   L14AD
L1545    LDA   #$0019
         STA   $1A
L154A    PHA
         PHA
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         LDA   #$0000
         CLC
         ADC   $1A
         LDX   #$0000
         TAY
         BPL   L1560
         DEX
L1560    PHX
         PHA
         _GetCtlHandleFromID
         STA   L2BCB
         _GetCtlValue
         STA   L2BCB
         PLA
         BNE   L157C
         BRL   L15D6
L157C    LDA   $1C
         CLC
         ADC   #$0001
         STA   $1C
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   $1A
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         CLC
         ADC   #$0002
         PHA
         LDA   $1A
         DEC
         ASL
         TAX
         LDA   theTOOLREC,X
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
L15D6    INC   $1A
         LDA   $1A
         CMP   #$001F	; number of entries supported
         BEQ   L15E2
         BRL   L154A
L15E2    PHA
         PHA
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         LDA   #$0020
         LDX   #$0000
         TAY
         BPL   L15F5
         DEX
L15F5    PHX
         PHA
         _GetCtlHandleFromID
         STA   L2BCB
         _GetCtlValue
         STA   L2BCB
         PLA
         BNE   L1611
         BRL   L166D
L1611    LDA   $1C
         CLC
         ADC   #$0001
         STA   $1C
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   #$0020
         STA   [$00]
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         CLC
         ADC   #$0002
         PHA
         LDA   #$0020
         DEC
         ASL
         TAX
         LDA   theTOOLREC,X
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

L166D    PHA
         PHA
         PHA
         pei	$25
         pei	$23
         pea	$0000
         pea	$0022
         _GetCtlHandleFromID
         _GetCtlValue
         PLA
         beq   L16F7
         LDA   $1C
         CLC
         ADC   #$0001
         STA   $1C
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   #$0022
         STA   [$00]
*         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         CLC
         ADC   #$0002
         PHA
         LDA   #$0022
         DEC
         ASL
         TAX
         LDA   theTOOLREC,X
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

*--- Animation Tool

L16F7    PHA
         PHA
         PHA
         pei	$25
         pei	$23
         pea	$0000
         pea	$0025
         _GetCtlHandleFromID
         _GetCtlValue
         PLA
         beq   L16F8
         LDA   $1C
         CLC
         ADC   #$0001
         STA   $1C
         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   #$0025
         STA   [$00]
*         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$000C
         PHA
         LDA   $1C
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLA
         CLC
         ADC   #$0002
         PHA
         LDA   #$0025
         DEC
         ASL
         TAX
         LDA   theTOOLREC,X
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

*--- end of Animation Tool

L16F8    LDY   #$0002	; +0A - numTools
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$000A
         STA   $00
         STX   $02
         LDA   $1C
         STA   [$00]

         LDY   #$0002	; +02 - videoMode for 0
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0002
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]

         PHA		; +02 - videoMode for bit 14
         PHA
         PHA
         LDX   $25
         LDA   $23
         PHX
         PHA
         LDA   #$1001
         LDX   #$0000
         TAY
         BPL   L1734
         DEX
L1734    PHX
         PHA
         _GetCtlHandleFromID
         STA   L2BCB
         _GetCtlValue
         STA   L2BCB
         PLA
         beq   L1765

         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0002
         STA   $00
         STX   $02
         LDA   #$4000
         STA   [$00]

L1765    PHA		; +02 - videoMode for bit 15
         PHA
         PHA
         pei	$25
         pei	$23
         pea	$0000
         pea	$1002
         _GetCtlHandleFromID
         _GetCtlValue
         PLA
         beq   L17BF

         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0002
         PHA
*         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
*         LDY   #$0002
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

L17BF    PHA		; +02 - videoMode for bit 7
         PHA
         PHA
         pei	$25
         pei	$23
         pea	$0000
         pea	$0640
         _GetCtlHandleFromID
         _GetCtlValue
         PLA
         beq   L1819

         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0002
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         ORA   #$0080
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

*--- Begin of Leave SHR screen on

L1819    PHA		; +02 - videoMode for bit 8
         PHA
         PHA
         pei	$25
         pei	$23
         pea	$0000
         pea	$1003
         _GetCtlHandleFromID
         _GetCtlValue
         PLA
         beq   L181A

         LDY   #$0002
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0002
         PHA
*         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
*         LDY   #$0002
         LDA   [$00],Y
         ORA   #$0100	; This is bit 8
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

*--- end of "Leave SHR screen on"

L181A    LDY   #$0002	; +04 - resFileID
         LDA   [$16],Y
         TAX
         LDA   [$16]
         CLC
         ADC   #$0004
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]

         LDY   #$0002	; +06 - dPageHandle
         LDA   [$16],Y
         PHA
         LDA   [$16]
         PHA
         PLA
         CLC
         ADC   #$0006
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         LDA   #$0000
         STA   [$00]
         LDY   #$0002
         LDA   #$0000
         STA   [$00],Y

         LDX   $18
         LDA   $16
         PHX
         PHA
         _HUnlock
         STA   L2BCB
         LDA   $1C	; number of entries
         LDX   #$0004	; x 4
         JSL   L3154
         CLC
         ADC   #sizeHEADER	; + header
         LDX   #$0000
         TAY
         BPL   L1874
         DEX
L1874    PHX
         PHA
         LDX   $18
         LDA   $16
         PHX
         PHA
         _SetHandleSize
         STA   L2BCB
         LDA   L2BCB
         BNE   L188E
         BRL   L190C

* Memory handle cannot be resized, display error

L188E    PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $1E
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDA   $2B
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $1E
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $1E
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L19B9	; cannot resize handle
         PEA   L19B9
         LDA   #$003F
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1909
         BRL   L1909
L1909    BRL   L1929

* Resource is formatted

L190C    LDX   $18
         LDA   $16
         PHX
         PHA
         _HLock
         STA   L2BCB

         LDA   $2B
         PHA
         LDX   $29
         LDA   $27
         PHX
         PHA
         JSL   writeRESOURCE

L1929    LDA   $21
         STA   $2B
         LDA   $20
         STA   $2A
         PLD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L1939    ASC   '52~Tool editor: Could not load resource. Changes not saved.~^#0'
L1978    ASC   '52~Tool editor: Could not resize resource. Changes not saved.~^#0'
L19B9    ASC   '52~Tool editor: Could not resize handle. Changes not saved.~^#0'

*--- Init controls of the editor window

initWINCONTROLS    TSC
         SEC
         SBC   #$0028
         TCS
         PHD
         INC
         TCD
         LDA   #$0001
         STA   $16
         LDA   #$0001
         STA   $26
L1A0B    LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         LDA   #$0000
         CLC
         ADC   $26
         LDX   #$0000
         TAY
         BPL   L1A26
         DEX
L1A26    PHX
         PHA
         _GetCtlHandleFromID
         STA   L2BCB
         _SetCtlValue
         STA   L2BCB
         INC   $26
         LDA   $26
         CMP   #$000D
         BEQ   L1A48
         BRL   L1A0B

L1A48    LDA   #$000E
         STA   $26

L1A4D    LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pei	$26
         _GetCtlHandleFromID
         _SetCtlValue

         INC   $26
         LDA   $26
         CMP   #$0018
         bne   L1A4D

*---

L1A8A    LDA   #$0019
         STA   $26

L1A8F    LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pei	$26
         _GetCtlHandleFromID
         _SetCtlValue

         INC   $26
         LDA   $26
         CMP   #$001F
         bne   L1A8F

* MIDI Toolset

L1ACC    LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$0020
         _GetCtlHandleFromID
         _SetCtlValue

* Text Edit

         LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$0022
         _GetCtlHandleFromID
         _SetCtlValue

* Animation

         LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$0025
         _GetCtlHandleFromID
         _SetCtlValue

* Fastport aware

         LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$1001
         _GetCtlHandleFromID
         _SetCtlValue

* Hardware shadowing

         LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$1002
         _GetCtlHandleFromID
         _SetCtlValue

* Keep SHR screen on

         LDA   #$0000
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$1003
         _GetCtlHandleFromID
         _SetCtlValue

*---

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   readRESOURCE
         STX   $22
         STA   $20
         LDA   $20
         ORA   $22
         BEQ   L1BBC
         BRL   L1BFC
L1BBC    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L1DCF	; cannot load resource
         PEA   L1DCF
         LDA   #$003D
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1BF9
         BRL   L1BF9
L1BF9    BRL   L1D68
L1BFC    LDX   $22
         LDA   $20
         PHX
         PHA
         _HLock
         STA   L2BCB

         LDY   #$0002
         LDA   [$20],Y
         TAX
         LDA   [$20]
         STX   $08
         STA   $06

* Check bit 8

         LDY   #$0002
         LDA   [$06],Y
         AND   #$0100
         beq   L1C52

         LDA   #$0001
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$1003
         _GetCtlHandleFromID
         _SetCtlValue

* Check bit 15

L1C52    LDY   #$0002
         LDA   [$06],Y
         AND   #$8000
         beq   L1C53

         LDA   #$0001
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$1002
         _GetCtlHandleFromID
         _SetCtlValue

* Check bit 14

L1C53    LDY   #$0002
         LDA   [$06],Y
         AND   #$4000
         beq   L1C8E

         LDA   #$0001
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         pea	$1001
         _GetCtlHandleFromID
         _SetCtlValue

* Check Video Mode

L1C8E    LDY   #$0002
         LDA   [$06],Y
         
	ldy	#$0320	; mode 320
         
         AND   #$0080
         beq   L1CCC
	
	ldy	#$0640	; mode 640
	
L1CCC    LDA   #$0001
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         pea	$0000
         phy
         _GetCtlHandleFromID
         _SetCtlValue

*---

         LDY   #$000A
         LDA   [$06],Y
         STA   $0A
         LDA   #$0001
         STA   $26
         LDA   $0A
         SEC
         SBC   $26
         BVS   L1D10
         EOR   #$8000
L1D10    BMI   L1D15
         BRL   L1D63
L1D15    LDA   #$0001
         PHA
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         LDY   #$000C
         PHY
         LDA   $26
         DEC
         ASL
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         PLY
         LDA   [$06],Y
         CLC
         ADC   #$0000
         LDX   #$0000
         TAY
         BPL   L1D3F
         DEX
L1D3F    PHX
         PHA
         _GetCtlHandleFromID
         STA   L2BCB
         _SetCtlValue
         STA   L2BCB
         LDA   $0A
         CMP   $26
         BNE   L1D5E
         BRL   L1D63
L1D5E    INC   $26
         BRL   L1D15
L1D63    LDA   #$0000
         STA   $16
L1D68    PHA
         LDA   #$0001
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         LDA   #$0001
         EOR   #$FFFF
         INC
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         _ReleaseResource
         STA   L2BCB
         PHA
         LDA   $24
         PHA
         _SetResourceFileDepth
         STA   L2BCB
         PLA
         STA   $24
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0028
         TCS
         TXA
         RTL

L1DCF    ASC   '52~Tool editor: Could not load resource. Setting aborted.~^#0'

*--- Ask for memory

prepareWINDOW    TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD

         PHA		; space for result
         PHA
         LDA   #$000C
         LDX   #$0000
         TAY
         BPL   L1E21
         DEX
L1E21    PHX		; size of block to create
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003C
         LDA   [$00],Y
         PHA		; memory ID
         LDA   #$8000	; locked
         CLC
         ADC   #$4000	; fixed
         PHA		; attributes
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L1E45
         DEX
L1E45    PHX		; locationPtr
         PHA
         _NewHandle
         STA   L2BCB
         PLA
         STA   haMEMORY
         PLA
         STA   haMEMORY+2
         LDA   L2BCB
         BNE   L1E61
         BRL   L1EBC

* Memmory error

L1E61    LDA   busyFLAG
         BEQ   L1E69
         BRL   L1E7C
L1E69    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         CLC
         ADC   #$0036
         STA   $00
         STX   $02
         LDA   #$0000
         STA   [$00]
L1E7C    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L2054	; cannot open window
         PEA   L2054
         LDA   #$0035
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L1EB9
         BRL   L1EB9
L1EB9    BRL   L204C

* Memory is allocated

L1EBC    LDX   haMEMORY+2	; deref
         LDA   haMEMORY
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         STX   $08	; save pointer
         STA   $06
         PEI   $08
         PEI   $06
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036	; get supported resource type
         LDA   [$00],Y
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]	; +00 word - save supported resource type to newly allocated buffer

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; +02 long - source window pointer
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDY   #$0002
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y

         LDY   #$0006	; +06 word - zero
         LDA   #$0000
         STA   [$06],Y

         PHA
         PHA
         _FrontWindow
         STA   L2BCB
         LDY   #$0008	; +08 long - front window pointer
         PLA
         STA   [$06],Y
         INY
         INY
         PLA
         STA   [$06],Y

         JSL   showWINDOW	; show my new window

         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         _SetPort
         STA   L2BCB

         JSL   initWINCONTROLS
         TAX
         BNE   L1F4D
         BRL   L1F74

* Error at init

L1F4D    LDX   haMEMORY+2
         LDA   haMEMORY
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         _CloseWindow
         STA   L2BCB
         BRL   L204C

* No errors, we're good

L1F74    LDA   YCOORD
         CLC
         ADC   #$000A
         STA   YCOORD
         LDA   xCOORD
         CLC
         ADC   #$001E
         STA   xCOORD
         LDA   #$001E
         LDX   #$0001
         SEC
         SBC   YCOORD
         BEQ   L1F9B
         BVS   L1F99
         EOR   #$8000
L1F99    BMI   L1F9C
L1F9B    DEX
L1F9C    TXA
         PHA
         LDA   YCOORD
         LDX   #$0001
         SEC
         SBC   #$0050
         BEQ   L1FB1
         BVS   L1FAF
         EOR   #$8000
L1FAF    BMI   L1FB2
L1FB1    DEX
L1FB2    TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L1FBC
         BRL   L1FC2
L1FBC    LDA   #$001E
         STA   YCOORD
L1FC2    LDA   #$001E
         LDX   #$0001
         SEC
         SBC   xCOORD
         BEQ   L1FD5
         BVS   L1FD3
         EOR   #$8000
L1FD3    BMI   L1FD6
L1FD5    DEX
L1FD6    TXA
         PHA
         LDA   xCOORD
         LDX   #$0001
         SEC
         SBC   #$00B4
         BEQ   L1FEB
         BVS   L1FE9
         EOR   #$8000
L1FE9    BMI   L1FEC
L1FEB    DEX
L1FEC    TXA
         ORA   $01,S
         PLX
         TAX
         BNE   L1FF6
         BRL   L1FFC
L1FF6    LDA   #$001E
         STA   xCOORD
L1FFC    LDA   xCOORD	; X-coord
         PHA
         LDA   YCOORD	; Y-coord
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         _MoveWindow
         STA   L2BCB
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         _ShowWindow
         STA   L2BCB

         LDX   haMEMORY+2	; associate the newly allocated buffer
         LDA   haMEMORY		; to the refcon of the window
         PHX
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         _SetWRefCon
         STA   L2BCB

         LDA   busyFLAG		; set the busy flag
         CLC
         ADC   #$0001
         STA   busyFLAG
L204C    PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L2054    ASC   '52~Tool editor: Memory error. Cannot open window.~^#0'

getFRONTWINDOW    TSC
         SEC
         SBC   #$0016
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         _FrontWindow
         STA   L2BCB
         PLA
         STA   haWINDOW
         PLA
         STA   haWINDOW+2
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         _SetPort
         STA   L2BCB
         PHA
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         _GetWRefCon
         STA   L2BCB
         PLA
         STA   haMEMORY
         PLA
         STA   haMEMORY+2
         PLD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

*--- Create a resource and dispose memory

createDISPOSE    TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036	; supported resource type
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         LDX   haWINDOW+2
         LDA   haWINDOW
         PHX
         PHA
         JSL   createRESOURCE

         LDX   haWINDOW+2	; close the window
         LDA   haWINDOW
         PHX
         PHA
         _CloseWindow
         STA   L2BCB

         PHA
         PHA
         LDX   haMEMORY+2
         LDA   haMEMORY
         STA   $00
         STX   $02
         LDY   #$0002
         LDA   [$00],Y
         TAX
         LDA   [$00]
         PHX
         PHA
         _FindHandle
         STA   L2BCB
         PLA
         STA   $16
         PLA
         STA   $18
         LDA   L2BCB
         BNE   L2158
         BRL   L2198

* Handle not found

L2158    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L2213	; memory location error
         PEA   L2213	; ie. cannot find handle
         LDA   #$003F
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L2195
         BRL   L2195
L2195    BRL   L21ED

* Handle found, dispose it

L2198    LDX   $18
         LDA   $16
         PHX
         PHA
         _DisposeHandle
         STA   L2BCB
         LDA   L2BCB
         BNE   L21B0
         BRL   L21ED

* Dispose failed

L21B0    LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         LDA   #$0100
         PHA
         PEA   ^L2252	; memory disposal error
         PEA   L2252
         LDA   #$003E
         PHA
         JSL   copyDATA
         PHA
         LDA   #$0000
         PHA
         PEA   $0000
         PEA   $0000
         LDX   #^myBUFFER2
         LDA   #myBUFFER2
         PHX
         PHA
         _AlertWindow
         STA   L2BCB
         PLA
         BEQ   L21ED
         BRL   L21ED

* Dispose succeeded

L21ED    LDA   busyFLAG	; busy flag
         SEC
         SBC   #$0001
         STA   busyFLAG
         LDA   YCOORD
         SEC
         SBC   #$000A
         STA   YCOORD
         LDA   xCOORD
         SEC
         SBC   #$001E
         STA   xCOORD
         PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L2213    ASC   '52~Tool editor: Memory location error. Consider rebooting.~^#0'
L2252    ASC   '52~Tool editor: Memory disposal error. Consider rebooting.~^#0'

L2290    TSC
         SEC
         SBC   #$001A
         TCS
         PHD
         INC
         TCD
         PHA
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         _GetWRefCon
         STA   L2BCB
         PLA
         STA   $16
         PLA
         STA   $18
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$000E
         LDA   [$00],Y
         AND   #$0001
         BEQ   L22D9
         BRL   L231C
L22D9    LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDA   [$00]
         PHA
         LDY   #$0002
         LDA   [$16],Y
         TAX
         LDA   [$16]
         STA   $00
         STX   $02
         LDY   #$0004
         LDA   [$00],Y
         TAX
         LDY   #$0002
         LDA   [$00],Y
         PHX
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0012
         LDA   [$00],Y
         TAX
         LDY   #$0010
         LDA   [$00],Y
         PHX
         PHA
         JSL   createRESOURCE
L231C    PLD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

*--- Handle control click

doCONTROL
         TSC
         SEC
         SBC   #$0018
         TCS
         PHD
         INC
         TCD
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0028	; which control ID?
         LDA   [$00],Y
         TAX
         LDY   #$0026
         LDA   [$00],Y
         PHX
         PHA
         _LoWord
         STA   L2BCB
         PLA
         STA   $16
         LDA   $16
         BNE   L2359
         BRL   L2381

* Control ID exists

L2359    LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]

L2381    LDA   $16	; check the preferred button
         CMP   #$1000
         BEQ   L238B
         BRL   L23C9

* OK, make a preferred resource then

L238B    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         JSL   makeSTDRESOURCE
         TAX
         BNE   L23BC
         BRL   L23BF
L23BC    BRL   L23C9

* init the controls

L23BF    JSL   initWINCONTROLS
         TAX
         BNE   L23C9
         BRL   L23C9

L23C9    PLD
         TSC
         CLC
         ADC   #$0018
         TCS
         RTL

*--- Tool Table editor: entry point

entryPOINT
         TSC
         SEC
         SBC   #$0020
         TCS
         PHD
         INC
         TCD
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$004E	; get resource file ID
         LDA   [$00],Y
         STA   resfileID
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003E	; get command
         LDA   [$00],Y
         BRL   L27E6

*--- Command 0 - Prepare me

doCOMMAND0
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; is window open?
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L241E
         DEX
L241E    LDY   #$0001
         CMP   $01,S	; buffer+$38 = $0000?
         BEQ   L2426	; yes
         DEY		; no
L2426    TXA
         CMP   $03,S	; buffer+$3a = $0000?
         BEQ   L242E	; yes
         LDY   #$0000	; no
L242E    PLA
         PLA
         TYA
         BNE   L2436	; both are zeros, we are here
         BRL   L24DE	; prepare window

* We have a window

L2436    JSL   L0E80	; prepare the resource
         PHX
         PHA
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0038	; save the window/resource handle
         PHA		; at buffer + $38
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A	; check emptiness of window/resource ID
         LDA   [$00],Y
         PHA
         LDY   #$0038
         LDA   [$00],Y
         PHA
         LDA   #$0000
         LDX   #$0000
         TAY
         BPL   L2479
         DEX
L2479    LDY   #$0001
         CMP   $01,S
         BEQ   L2481
         DEY
L2481    TXA
         CMP   $03,S
         BEQ   L2489
         LDY   #$0000
L2489    PLA
         PLA
         TYA
         BNE   L2491
         BRL   L24B2

* we have no window/resource ID

L2491    LDA   busyFLAG	; are we busy?
         BEQ   L2499
         BRL   L24AC	; we are busy

* We're not busy

L2499    LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         CLC
         ADC   #$0036	; we have nothing
         STA   $00	; tell no resource type as well
         STX   $02
         LDA   #$0000
         STA   [$00]

L24AC    BRL   L24E2	; exit editor
         BRL   L24DE

* window/resource exists

L24B2    LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$0048
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0048
         LDA   [$00],Y
         ORA   #$8000
         PLX
         STX   $00
         PLX
         STX   $02
         STA   [$00]
         JSL   updateBUFFER
	 
L24DE    JSL   prepareWINDOW	; no active window
L24E2    BRL   exitEDITOR

*--- Command 1 - Return name of the editor

doCOMMAND1
         LDX   #^myBUFFER1	; return the name of the editor
         LDA   #myBUFFER1	; at buffer offset $2E
         PHX
         PHA
         LDA   #$FF01
         PHA
         PEA   ^strEDITOR
         PEA   strEDITOR
         LDA   strEDITOR2-strEDITOR	; length of string
         PHA
         JSL   copyDATA	; copy string

         PEA   ^myBUFFER1	; 0
         PEA   myBUFFER1	; 1
         LDA   ptrBUFFER+2
         PHA		; 2
         LDA   ptrBUFFER
         PHA		; 3
         PLA		; 3
         CLC
         ADC   #$002E
         PHA		; 3
         PLA		; 3
         STA   $00
         PLA		; 2
         STA   $02
         PLA		; 1
         STA   [$00]
         LDY   #$0002
         PLA		; 0
         STA   [$00],Y
         BRL   exitEDITOR

*--- Command 2 - Interact with window

doCOMMAND2
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$004A	; TaskMaster result
         LDA   [$00],Y
         CMP   #$0008	; activateEvent
         BEQ   L253C
         BRL   L2543

L253C    JSL   L2290	; get the refcon
         BRL   L259E

L2543    JSL   getFRONTWINDOW
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$004A	; TaskMaster result
         LDA   [$00],Y
         BRL   L256A

* wInGoAway

L2559    JSL   createDISPOSE	; create a resource and dispoes memory
         BRL   L259E	; exit editor

* wInControl

L2560    JSL   doCONTROL
         BRL   L259E	; exit editor
L2567    BRL   L259E	; exit editor

L256A    SEC
         SBC   #$0016
         CMP   #$000C
         BCC   L2576
         LDA   #$000C
L2576    ASL
         TAX
         LDAL  L2584,X
         BEQ   L2580
         PHA
         RTS

L2580    JSL   L2C09

L2584    DA    L2559-1	; 0 16 wInGoAway *
         DA    L2567-1	; 1 17 wInZoom
         DA    L2567-1	; 2 18 wInInfo
         DA    L2567-1	; 3 19 wInSpecial
         DA    L2567-1	; 4 1A wInDeskItem
         DA    L2567-1	; 5 1B wInFrame
         DA    L2567-1	; 6 1C wInactMenu
         DA    L2567-1	; 7 1D wClosedNDA
         DA    L2567-1	; 8 1E wCalledSysEdit
         DA    L2567-1	; 9 1F wTrackZoom
         DA    L2567-1	; A 20 wHitFrame
         DA    L2560-1	; B 21 wInControl * 
         DA    L2567-1	; C 22 wInControlMenu

L259E    BRL   exitEDITOR

*--- Command 3 - The init command

doCOMMAND3
         LDA   #$0000
         STA   YCOORD
         LDA   #$0000
         STA   xCOORD
         LDA   #$0000
         STA   busyFLAG

         LDX   #^myBUFFER1	; copy the name
         LDA   #myBUFFER1	; of the supported resource
         PHX			; returns the address in
         PHA			; the buffer at offset $2E
         LDA   #$FF01
         PHA
         PEA   ^strRESOURCE
         PEA   strRESOURCE
         LDA   #strRESOURCE2-strRESOURCE		; 'Tool table' is 10 chars
         PHA
         JSL   copyDATA
         PEA   ^myBUFFER1
         PEA   myBUFFER1
         LDA   ptrBUFFER+2
         PHA
         LDA   ptrBUFFER
         PHA
         PLA
         CLC
         ADC   #$002E	; source pointer of data to be copied
         PHA
         PLA
         STA   $00
         PLA
         STA   $02
         PLA
         STA   [$00]
         LDY   #$0002
         PLA
         STA   [$00],Y

         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         CLC
         ADC   #$0036
         STA   $00
         STX   $02
         LDA   #resTYPE	; resource type that the editor handles
         STA   [$00]

         LDA   #$0001	; prepare my resource data
         DEC
         ASL
         TAX
         LDA   #$0300
         STA   theTOOLREC,X
         LDA   #$0002
         DEC
         ASL
         TAX
         LDA   #$0300
         STA   theTOOLREC,X
         LDA   #$0003
         DEC
         ASL
         TAX
         LDA   #$0300
         STA   theTOOLREC,X
         LDA   #$0004
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0005
         DEC
         ASL
         TAX
         LDA   #$0302
         STA   theTOOLREC,X
         LDA   #$0006
         DEC
         ASL
         TAX
         LDA   #$0300
         STA   theTOOLREC,X
         LDA   #$0007
         DEC
         ASL
         TAX
         LDA   #$0200
         STA   theTOOLREC,X
         LDA   #$0008
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0009
         DEC
         ASL
         TAX
         LDA   #$0201
         STA   theTOOLREC,X
         LDA   #$000A
         DEC
         ASL
         TAX
         LDA   #$0202
         STA   theTOOLREC,X
         LDA   #$000B
         DEC
         ASL
         TAX
         LDA   #$0200
         STA   theTOOLREC,X
         LDA   #$000C
         DEC
         ASL
         TAX
         LDA   #$0201
         STA   theTOOLREC,X
         LDA   #$000D
         DEC
         ASL
         TAX
         LDA   #$0200
         STA   theTOOLREC,X
         LDA   #$000E
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$000F
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0010
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0011
         DEC
         ASL
         TAX
         LDA   #$0300
         STA   theTOOLREC,X
         LDA   #$0012
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0013
         DEC
         ASL
         TAX
         LDA   #$0300
         STA   theTOOLREC,X
         LDA   #$0014
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0015
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0016
         DEC
         ASL
         TAX
         LDA   #$0300
         STA   theTOOLREC,X
         LDA   #$0017
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$0018
         DEC
         ASL
         TAX
         LDA   #$0000
         STA   theTOOLREC,X
         LDA   #$0019
         DEC
         ASL
         TAX
         LDA   #$0104
         STA   theTOOLREC,X
         LDA   #$001A
         DEC
         ASL
         TAX
         LDA   #$0104
         STA   theTOOLREC,X
         LDA   #$001B
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$001C
         DEC
         ASL
         TAX
         LDA   #$0301
         STA   theTOOLREC,X
         LDA   #$001D
         DEC
         ASL
         TAX
         LDA   #$0101
         STA   theTOOLREC,X
         LDA   #$001E
         DEC
         ASL
         TAX
         LDA   #$0100
         STA   theTOOLREC,X
         LDA   #$001F
         DEC
         ASL
         TAX
         LDA   #$0000
         STA   theTOOLREC,X
         LDA   #$0020
         DEC
         ASL
         TAX
         LDA   #$0103
         STA   theTOOLREC,X
         LDA   #$0021
         DEC
         ASL
         TAX
         LDA   #$0000
         STA   theTOOLREC,X
         LDA   #$0022
         DEC
         ASL
         TAX
         LDA   #$0101
         STA   theTOOLREC,X
         LDA   #$0025
         DEC
         ASL
         TAX
         LDA   #$0100
         STA   theTOOLREC,X
         BRL   exitEDITOR
	 
*--- Command 4

doCOMMAND4
         JSL   getFRONTWINDOW
         JSL   createDISPOSE
         BRL   exitEDITOR

*--- Command 7

doCOMMAND7
         JSL   getFRONTWINDOW
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$0036		; supported resource type
         LDA   [$00],Y
         PHA
         LDX   ptrBUFFER+2
         LDA   ptrBUFFER
         STA   $00
         STX   $02
         LDY   #$003A		; window pointer?
         LDA   [$00],Y
         TAX
         LDY   #$0038
         LDA   [$00],Y
         PHX
         PHA
         LDX   haWINDOW+2	; GRAFPORT
         LDA   haWINDOW
         PHX
         PHA
         JSL   createRESOURCE	; format resource
         BRL   exitEDITOR

*--- Command 5
*--- Command 6
*--- Command 8

unsupCOMMAND    BRL   exitEDITOR

*--- Manages commands

L27E6    CMP   #$0008
         BCC   L27EE
         LDA   #$0008
L27EE    ASL
         TAX
         LDAL  L27FC,X
         BEQ   L27F8
         PHA
         RTS

L27F8    JSL   L2C09

L27FC    DA    doCOMMAND0-1	; 0
         DA    doCOMMAND1-1	; 1
         DA    doCOMMAND2-1	; 2
         DA    doCOMMAND3-1	; 3
         DA    doCOMMAND4-1	; 4
         DA    unsupCOMMAND-1	; 5
         DA    unsupCOMMAND-1	; 6
         DA    doCOMMAND7-1	; 7
         DA    unsupCOMMAND-1	; 8

exitEDITOR    LDA   #$0000
         STA   $16
         LDX   $16
         PLD
         TSC
         CLC
         ADC   #$0020
         TCS
         TXA
         RTL

strEDITOR	ASC   'Tool table editor v1.3'
strEDITOR2
strRESOURCE	ASC   'Tool table'
strRESOURCE2

YCOORD    DW    $0000
xCOORD    DW    $0000
ptrBUFFER    ADRL  $00000000	; pointer to the shell buffer
busyFLAG    DW    $0000		; LOGO - could be the non-reentrant flag
resfileID    DW    $0000
haMEMORY    ADRL  $00000000
haMEMORY2    ADRL  $00000000
haWINDOW    ADRL  $00000000
theTOOLREC    DS    $400	; 256 tools x 2 words

*--- Buffers

myBUFFER1    DS    $100
myBUFFER2    DS    $100

*--- Copy data
*
* long 11..14 - destination buffer
* word 0F..10 - 
* long 0B..0E - source buffer
* word 09..0A - source length

copyDATA    TDC
         TAX
         TSC
         SEC
         SBC   #$0005
         TCD
         DEC
         TCS
         PHX
         LDA   $09
         CMP   $0F
         BNE   L2AC7
         LDA   $13
         PHA
         LDA   $11
         PHA
         LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         BPL   L2AC0
         EOR   #$FFFF
         INC
         INC
L2AC0    PHA
         JSL   L2E77
         BRA   L2B3D

L2AC7    LDA   $0D
         PHA
         LDA   $0B
         PHA
         LDA   $09
         PHA
         JSR   L2B4D
         PLA
         STA   $09
         PLA
         STA   $0B
         PLA
         STA   $0D
         LDA   $13
         STA   $04
         LDA   $11
         STA   $02
         LDA   $0F
         BPL   L2AF2
         EOR   #$FFFF
         INC
         INC   $11
         BNE   L2AF2
         INC   $13
L2AF2    CMP   $09
         BCC   L2AF8
         LDA   $09
L2AF8    TAY
         STA   $00
         BEQ   L2B21
         LSR
         BCC   L2B17
         SEP   #$20
         LDA   [$0B]
         STA   [$11]
         REP   #$20
         INC   $0B
         BNE   L2B0E
         INC   $0D
L2B0E    INC   $11
         BNE   L2B14
         INC   $13
L2B14    DEY
         BEQ   L2B21
L2B17    DEY
         DEY
L2B19    LDA   [$0B],Y
         STA   [$11],Y
         DEY
         DEY
         BPL   L2B19
L2B21    LDY   $0F
         BPL   L2B2F
         SEP   #$20
         LDA   $00
         STA   [$02]
         REP   #$20
         BRA   L2B3D
L2B2F    LDY   $00
         CPY   $0F
         BCS   L2B3D
         SEP   #$20
         LDA   #$00
         STA   [$02],Y
         REP   #$20
L2B3D    LDA   $07
         STA   $13
         LDA   $06
         STA   $12
         CLC
         TDC
         ADC   #$0011
         PLD
         TCS
         RTL

L2B4D    PHD
         TSC
         TCD
         LDA   $05
         BEQ   L2B9D
         BPL   L2B8A
         INC
         BNE   L2B7B
         LDA   $09
         AND   #$00FF
         BNE   L2B64
         STZ   $05
         BRA   L2B9D
L2B64    LDA   #$0001
         STA   $05
         LDA   $09
         STAL  L2B9F
         LDA   #L2B9F
         STA   $07
         LDA   #^L2B9F
         STA   $09
         BRA   L2B9D
L2B7B    LDA   [$07]
         AND   #$00FF
         STA   $05
         INC   $07
         BNE   L2B88
         INC   $09
L2B88    BRA   L2B9D
L2B8A    LDX   $05
         LDY   #$0000
         SEP   #$20
L2B91    LDA   [$07],Y
         BEQ   L2B99
         INY
         DEX
         BNE   L2B91
L2B99    STY   $05
         REP   #$20
L2B9D    PLD
         RTS

L2B9F    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L2BAD
L2BAD    DB    $00
         DB    $00
         ADRL  L2BB3
L2BB3    DB    $00
         DB    $00
         DB    $00
         DB    $00
         ADRL  L2BBB
L2BBB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2BCB    DB    $00
         DB    $00
L2BCD    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2BD5    DB    $00
         DB    $00
L2BD7    DB    $00
         DB    $00
L2BD9    DB    $00
L2BDA    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L2BE7    PHA
         JSL   L2E62
         LDAL  L2BCD
         PHA
         _DisposeAll
         PLA
         JSL   GSOS
         DW    $0029      ; Quit
         ADRL  L2C03

L2C03    ADRL  L2C07      ;  path name
L2C07    DW    $0000      ;  flags

L2C09    PEA   $0008
         JSL   L2C16
         LDA   #$FFFF
         JMP   L2BE7

L2C16    LDA   $04,S
         PHA
         JSL   L2D39
         JMPL  L2C21

L2C21    PHK
         PLB
         LDA   L2BD9
         BNE   L2C2B
         BRL   L2D33
L2C2B    BRA   L2C45
L2C2D    STR   'Error occurred at line '
L2C45    PEA   ^L2C2D
         PEA   L2C2D
         _ErrWriteString
         LDA   L2BD9
         PHA
         PEA   $0001
         PEA   $0000
         PEA   $0001
         JSL   L31B3
         BRA   L2C74
L2C65    STR   ' in procedure '
L2C74    PEA   ^L2C65
         PEA   L2C65
         _ErrWriteString
         PEA   ^L2BDA
         PEA   L2BDA
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L31E3
         JSL   L2EC1
         LDA   L2BD5
         ORA   L2BD7
         BNE   L2CA3
         BRL   L2D33
L2CA3    PEA   $000D
         _ErrWriteChar
         PEA   $000A
         _ErrWriteChar
         BRA   L2CC6
L2CB9    STR   '  Line  Name'
L2CC6    PEA   ^L2CB9
         PEA   L2CB9
         _ErrWriteLine
         BRA   L2CE2
L2CD5    STR   '  ----  ----'
L2CE2    PEA   ^L2CD5
         PEA   L2CD5
         _ErrWriteLine
L2CEF    LDA   L2BD5
         ORA   L2BD7
         BEQ   L2D33
         LDA   L2BD9
         PHA
         PEA   $0006
         PEA   $0000
         PEA   $0001
         JSL   L31B3
         BRA   L2D0D
L2D0A    STR   '  '
L2D0D    PEA   ^L2D0A
         PEA   L2D0A
         _ErrWriteString
         PEA   ^L2BDA
         PEA   L2BDA
         PEA   $0000
         PEA   $0001
         PEA   $0001
         JSL   L31E3
         JSL   L2EC1
         BRA   L2CEF
L2D33    LDA   #$FFFF
         BRL   L2BE7

L2D39    PHD
         PEA   ^L2D63
         PEA   L2D63
         TSC
         TCD
         LDX   $0A
L2D44    DEX
         BEQ   L2D53
         SEC
         LDA   [$01]
         AND   #$00FF
         ADC   $01
         STA   $01
         BRA   L2D44
L2D53    _ErrWriteLine
         PLD
         LDA   $02,S
         STA   $04,S
         PLA
         STA   $01,S
         RTL

L2D63    STR   'Subrange exceeded'
         STR   'File is not open'
         STR   'Read while at end of file'
         STR   'I/O error'
         STR   'Out of memory'
         STR   'EOLN while at end of file'
         STR   'Set overflow'
         STR   'Jump to undefined case statement label'
         STR   'Integer math error'
         STR   'Real math error'
         STR   'Underflow'
         STR   'Overflow'
         STR   'Divide by zero'
         STR   'Inexact'
         STR   'Stack overflow'
L2E62    PHB
         PHK
         PLB
         STZ   L2EF2
         STZ   L2EF4
         LDX   #$0026
L2E6E    STZ   L2EF6,X
         DEX
         DEX
         BPL   L2E6E
         PLB
         RTL

L2E77    TDC
         TAX
         TSC
         SEC
         SBC   #$FFFF
         TCD
         DEC
         TCS
         PHX
         LDA   $03
         LSR
         BCC   L2E9D
         SEP   #$20
         LDA   [$05]
         STA   [$09]
         REP   #$20
         INC   $05
         BNE   L2E95
         INC   $07
L2E95    INC   $09
         BNE   L2E9B
         INC   $0B
L2E9B    DEC   $03
L2E9D    LDY   $03
         BEQ   L2EB1
         DEY
         DEY
         BEQ   L2EAD
L2EA5    LDA   [$05],Y
         STA   [$09],Y
         DEY
         DEY
         BNE   L2EA5
L2EAD    LDA   [$05]
         STA   [$09]
L2EB1    LDA   $01
         STA   $0B
         LDA   $00
         STA   $0A
         CLC
         TDC
         ADC   #$0009
         PLD
         TCS
         RTL

L2EC1    PHB
         PHK
         PLB
         LDA   L2BD7
         STA   $02
         LDA   L2BD5
         STA   $00
         LDY   #$0010
L2ED1    LDA   [$00],Y
         STA   L2BD5,Y
         DEY
         DEY
         BPL   L2ED1
         LDA   $02
         PHA
         LDA   $00
         PHA
         JSL   L2F1E
         PLB
         RTL

         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2EF2    DB    $00
         DB    $00
L2EF4    DB    $00
         DB    $00
L2EF6    DB    $00
         DB    $00
L2EF8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L2F1E    TSC
         PHD
         TCD
         LDY   $04
         LDX   $06
         SEC
         TYA
         SBC   #$0002
         STA   $04
         BCS   L2F30
         DEC   $06
L2F30    LDA   [$04]
         BNE   L2F3B
         TYA
         JSL   L3039
         BRA   L2F40
L2F3B    TYA
         JSL   L2F4C
L2F40    LDA   $00
         STA   $04
         LDA   $02
         STA   $06
         PLD
         PLA
         PLA
         RTL

L2F4C    PHA
         PHA
         PHA
         SEC
         SBC   #$0004
         BCS   L2F56
         DEX
L2F56    PHX
         PHA
         TSC
         PHD
         TCD
         LDA   [$01]
         BPL   L2F62
         BRL   L3031
L2F62    LDA   [$01]
         ORA   #$8000
         STA   [$01]
         LDY   #$0002
         LDA   [$01],Y
         STA   $09
         TAY
         LDA   $01
         LDX   $03
         JSL   L30AD
L2F79    LDA   $09
         CMP   #$1000
         BCC   L2F83
         BRL   L301F
L2F83    LDA   [$01]
         AND   $09
         BEQ   L2FDA
         SEC
         LDA   $01
         SBC   $09
         STA   $05
         LDA   $03
         SBC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BEQ   L2FA3
         BRL   L3031
L2FA3    LDA   [$05]
         BMI   L2FAA
         BRL   L3031
L2FAA    LDY   $09
         LDX   $03
         LDA   $01
         JSL   L30D8
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L30D8
         LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         ASL   $09
         LDA   $09
         LDY   #$0002
         STA   [$01],Y
         TAY
         LDA   $01
         LDX   $03
         JSL   L30AD
         BRA   L2F79
L2FDA    CLC
         LDA   $01
         ADC   $09
         STA   $05
         LDA   $03
         ADC   #$0000
         STA   $07
         LDY   #$0002
         LDA   [$05],Y
         CMP   $09
         BNE   L3031
         LDA   [$05]
         BPL   L3031
         LDY   $09
         LDX   $03
         LDA   $01
         JSL   L30D8
         LDY   $09
         LDX   $07
         LDA   $05
         JSL   L30D8
         ASL   $09
         LDY   #$0002
         LDA   $09
         STA   [$01],Y
         LDY   $09
         LDA   $01
         LDX   $03
         JSL   L30AD
         BRL   L2F79
L301F    LDY   $09
         LDA   $01
         LDX   $03
         JSL   L30D8
         LDA   $01
         LDX   $03
         JSL   L3039
L3031    PLD
         TSC
         CLC
         ADC   #$000A
         TCS
         RTL

L3039    PHA
         PHA
         SEC
         SBC   #$000E
         BCS   L3042
         DEX
L3042    PHX
         PHA
         TSC
         PHD
         TCD
         LDY   #$0002
         LDA   [$01],Y
         ORA   [$01]
         BNE   L3063
         LDY   #$0004
         LDA   [$01],Y
         STAL  L2EF2
         INY
         INY
         LDA   [$01],Y
         STAL  L2EF4
         BRA   L3078
L3063    LDA   [$01]
         STA   $05
         LDA   [$01],Y
         STA   $07
         LDY   #$0004
         LDA   [$01],Y
         STA   [$05],Y
         INY
         INY
         LDA   [$01],Y
         STA   [$05],Y
L3078    LDY   #$0004
         LDA   [$01],Y
         TAX
         INY
         INY
         ORA   [$01],Y
         BEQ   L3095
         LDA   [$01],Y
         STA   $07
         STX   $05
         LDY   #$0002
         LDA   [$01]
         STA   [$05]
         LDA   [$01],Y
         STA   [$05],Y
L3095    LDY   #$000A
         LDA   [$01],Y
         PHA
         DEY
         DEY
         LDA   [$01],Y
         PHA
         _DisposeHandle
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L30AD    PHX
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L3143
         LDY   #$0004
         LDAL  L2EF6,X
         STA   [$01],Y
         INY
         INY
         LDAL  L2EF8,X
         STA   [$01],Y
         LDA   $01
         STAL  L2EF6,X
         LDA   $03
         STAL  L2EF8,X
         PLD
         PLA
         PLA
         RTL

L30D8    PHX
         PHA
         LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         TSC
         PHD
         TCD
         TYA
         JSL   L3143
         LDAL  L2EF6,X
         STA   $05
         LDAL  L2EF8,X
         STA   $07
L30F5    LDA   $05
         CMP   $09
         BNE   L3101
         LDA   $07
         CMP   $0B
         BEQ   L3118
L3101    LDA   $05
         STA   $01
         LDA   $07
         STA   $03
         LDY   #$0004
         LDA   [$01],Y
         STA   $05
         INY
         INY
         LDA   [$01],Y
         STA   $07
         BRA   L30F5
L3118    LDY   #$0004
         LDA   $01
         ORA   $02
         BNE   L3131
         LDA   [$05],Y
         STAL  L2EF6,X
         INY
         INY
         LDA   [$05],Y
         STAL  L2EF8,X
         BRA   L313B
L3131    LDA   [$05],Y
         STA   [$01],Y
         INY
         INY
         LDA   [$05],Y
         STA   [$01],Y
L313B    PLD
         TSC
         CLC
         ADC   #$000C
         TCS
         RTL

L3143    LDX   #$0000
         DEC
         LSR
         LSR
         LSR
         BEQ   L3153
L314C    INX
         INX
         INX
         INX
         LSR
         BNE   L314C
L3153    RTL

L3154    TAY
         PHD
         TSC
         SEC
         SBC   #$0007
         TCD
         DEC
         TCS
         TYA
         LDY   #$0000
         BIT   #$8000
         BEQ   L316C
         EOR   #$FFFF
         INC
         INY
L316C    STA   $02
         TXA
         BPL   L3176
         DEY
         EOR   #$FFFF
         INC
L3176    STA   $04
         STY   $06
         LDY   #$0010
         LDA   #$0000
L3180    LSR   $02
         BCC   L3187
         CLC
         ADC   $04
L3187    ROR
         ROR   $00
         DEY
         BNE   L3180
         TAX
         BNE   L31A8
         LDA   $00
         BMI   L31A8
         LDY   $06
         BEQ   L319C
         EOR   #$FFFF
         INC
L319C    TAY
         TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         TYA
         CLV
         RTL

L31A8    TDC
         CLC
         ADC   #$0007
         TCS
         PLA
         TCD
         SEP   #$40
         RTL

L31B3    TSC
         PHD
         TCD
         PEA   ^L323F
         PEA   L323F
         LDA   $0A
         JSL   L3228
         PEA   ^L323F
         PEA   L323F
         LDA   $08
         PHA
         LDA   $06
         PHA
         LDA   $04
         PHA
         JSL   L31E3
         LDA   $02
         STA   $0A
         LDA   $00
         STA   $08
         PLD
         PLA
         PLA
         PLA
         PLA
         RTL

L31E3    TSC
         PHD
         TCD
         INC   $0A
         BNE   L31EC
         INC   $0C
L31EC    LDA   [$0A]
         AND   #$00FF
         SEC
         SBC   $08
         BPL   L3200
         EOR   #$FFFF
         INC
         LDY   $04
         JSL   L32DE
L3200    LDA   $0C
         PHA
         LDA   $0A
         PHA
         LDA   $06
         EOR   #$0001
         ASL
         ORA   $04
         XBA
         CLC
         ADC   #$1A0C
         TAX
         JSL   $E10000
         LDA   $02
         STA   $0C
         LDA   $00
         STA   $0A
         PLD
         CLC
         TSC
         ADC   #$000A
         TCS
         RTL

L3228    PHA
         PEA   ^L3269
         PEA   L3269
         PEA   $0028
         PEA   $0001
         _Int2Dec
         JMP   L3291

L323F    DB    $28
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L3269    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L3291    PHD
         TSC
         TCD
         SEP   #$20
         LDX   #$0000
         LDA   #$20
L329B    CMPL  L3269,X
         BNE   L32A4
         INX
         BRA   L329B
L32A4    REP   #$20
         TXA
         SEC
         SBC   #$0028
         EOR   #$FFFF
         INC
         SEP   #$20
         CMP   [$06]
         BEQ   L32B7
         BCS   L32CE
L32B7    LDY   #$0001
         STA   [$06],Y
L32BC    LDAL  L3269,X
         INY
         STA   [$06],Y
         INX
         CPX   #$0028
         BCC   L32BC
         REP   #$20
         CLV
         BRA   L32D2
L32CE    REP   #$20
         SEP   #$40
L32D2    LDA   $02,S
         STA   $06,S
         LDA   $04,S
         STA   $08,S
         PLD
         PLA
         PLA
         RTL

L32DE    PHA
         TYA
         XBA
         CLC
         ADC   #$180C
         PHA
         PHD
         TSC
         TCD
L32E9    PEA   $0020
         LDX   $03
         JSL   $E10000
         DEC   $05
         BNE   L32E9
         PLD
         PLA
         PLA
         RTL

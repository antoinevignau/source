*
* Memory Use
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	NDA
	dsk	Memory.Use.l

GSOS	EQU	$E100A8

*------------------------------
* MACROS
*------------------------------

	use	4/Ctl.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*------------------------------
* NDA entry point
*------------------------------

	ADRL	openROUTINE	; Open routine
	ADRL	closeROUTINE	; Close routine
	ADRL	actionROUTINE	; Action routine
	ADRL	initROUTINE	; Init routine
	DW	$003C       ; Period
	DW	$FFFF       ; Event mask
	ASC	'##Memory Use\H'
menuID	ASC '**'00

*------------------------------
* THE OPEN ROUTINE
*------------------------------

openROUTINE PHB
            PHK
            PLB
            LDA   fgSTART
            BEQ   openME
            BRL   imOPEN

*------------------------------

openME      PHA		; save cursor address
            PHA
            _GetCursorAdr
            PLA
            STA   saveCURSOR
            PLA
            STA   saveCURSOR+2
            _WaitCursor

            PHA
            PHA
            _TotalMem
            PLA
            STA   totalMEM
            PLA
            STA   totalMEM+2

            STZ   theRAM

            PEA   $0000	; save the current resource app ID
            _GetCurResourceApp
            PLA
            STA   saveRESID

            PHA		; get a Memory Manager ID
            _MMStartUp
            PLA
            STA   memID

            LDA   memID	; and start the resource manager
            PHA
            _ResourceStartUp
            BCC   okRES
            BRL   exitNORES

*------------------------------

okRES       PEA   $0000	; get my pathname
            PEA   $0000
            LDA   memID
            PHA
            PEA   $0001
            _LGetPathname2
            PLA
            STA   pathADDR
            PLA
            STA   pathADDR+2
            BCC   okPATH	; got it
            BRL   exitNORES	; no name...

*------------------------------

okPATH      JSL   GSOS
            DW    $201B       ; GetLevel
            ADRL  proSAVELEVEL
            JSL   GSOS
            DW    $201A       ; SetLevel
            ADRL  proSETLEVEL
            JSL   GSOS
            DW    $200F       ; GetSysPrefs
            ADRL  proSAVESYSPREFS

            LDA   proSAVESYSPREFS+2
            AND   #$7FFF
            ORA   #$8000	; Display Volume Mount dialog box
            STA   proSETSYSPREFS+2

            JSL   GSOS
            DW    $200C       ; SetSysPrefs
            ADRL  proSETSYSPREFS

*------------------------------

            PEA   $0000	; open my resource file, please
            PEA   $0001
            PEA   $0000
            PEA   $0000
            LDA   pathADDR+2
            PHA
            LDA   pathADDR
            PHA
            _OpenResourceFile
            PLA
            STA   resID
            BCC   okMYRES	; ok
            BRL   exitNOWIN	; not ok

*------------------------------

okMYRES     PEA   $0000	; load my window
            PEA   $0000	; but do not show it
            PEA   ^winTITLE
            PEA   winTITLE
            PEA   $0000
            PEA   $0000
            PEA   ^winREFRESH
            PEA   winREFRESH
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0001
            PEA   $800E
            _NewWindow2
            PLX
            PLA
            BCC   okWIN
            BRL   exitNOWIN

*------------------------------

okWIN       STX   ptrWINDOW	; save my window pointer
            STA   ptrWINDOW+2
            STA   $07,S
            TXA
            STA   $05,S

            LDA   ptrWINDOW+2	; make it my port
            PHA
            LDA   ptrWINDOW
            PHA
            _SetPort

            LDA   ptrWINDOW+2	; make it a system window
            PHA
            LDA   ptrWINDOW
            PHA
            _SetSysWindow

*------------------------------

            PHA		; which mode are we in?
            _GetMasterSCB
            PLA
            AND   #$0080
            BNE   set640	; 640...
            BRL   set320	; or 320

set640      PEA   ^tblCOLOR640
            PEA   tblCOLOR640
            LDA   ptrWINDOW+2
            PHA
            LDA   ptrWINDOW
            PHA
            _SetFrameColor
            LDA   #^pattern640
            STA   busyPATTPTR+2
            LDA   #pattern640
            STA   busyPATTPTR
            BRL   showMYWIN

set320      PEA   ^tblCOLOR320
            PEA   tblCOLOR320
            LDA   ptrWINDOW+2
            PHA
            LDA   ptrWINDOW
            PHA
            _SetFrameColor
            LDA   #^pattern320
            STA   busyPATTPTR+2
            LDA   #pattern320
            STA   busyPATTPTR

*------------------------------

showMYWIN   LDA   ptrWINDOW+2	; show the window
            PHA
            LDA   ptrWINDOW
            PHA
            _ShowWindow

            LDA   #$FFFF	; say we ARE started
            STA   fgSTART

*------------------------------

restorePREFS
            JSL   GSOS	; restore the original values
            DW    $201A       ; SetLevel
            ADRL  proSAVELEVEL
            JSL   GSOS
            DW    $200C       ; SetSysPrefs
            ADRL  proSAVESYSPREFS

restoreRES  LDA   saveRESID	; restore the user resource ID
            PHA
            _SetCurResourceApp

            LDA   saveCURSOR+2	; restore the cursor
            PHA
            LDA   saveCURSOR
            PHA
            _SetCursor

imOPEN      PLB		; and exit
            RTL		; yeepee


*------------------------------
* ERROR MESSAGES
*------------------------------

exitNORES   LDA   #strNORES
            LDY   #^strNORES
            JSR   showERROR
            BRA   restoreRES

exitNOWIN   LDA   #strNOWIN
            LDY   #^strNOWIN
            JSR   showERROR
            BRA   restorePREFS

            LDA   #strNOCTL
            LDY   #^strNOCTL
            JSR   showERROR
            LDA   #$0000
            STA   $07,S
            STA   $05,S
            LDA   ptrWINDOW+2
            PHA
            LDA   ptrWINDOW
            PHA
            _CloseWindow
            BRA   restorePREFS

*------------------------------
* DATA
*------------------------------

pathADDR    ADRL  $00000000	; path to my NDA

saveRESID   DW    $0000	; the previous resource ID

saveCURSOR  ADRL  $00000000	; the previous cursor address

            DW    $0000	; not used

proSAVELEVEL
            DW    $0001       ; Parms for SetLevel
            DW    $0000       ;  ref num

proSETLEVEL DW    $0001       ; Parms for SetLevel
            DW    $0000       ;  ref num

proSAVESYSPREFS
            DW    $0001       ; Parms for SetSysPrefs
            DW    $0000       ;  preferences

proSETSYSPREFS
            DW    $0001       ; Parms for SetSysPrefs
            DW    $0000       ;  preferences

*------------------------------
* INIT
*------------------------------

initROUTINE
            PHB
            PHK
            PLB
            CMP   #$0000	; is it a DeskStartUp?
            BNE   initSHUT	; no...
            PLB		; yes, exit
            RTL

initSHUT    STZ   fgSTART	; we had a DeskShutDown call
            LDA   #$0000	; clear our data
            LDY   #$0014	; clear the extended record
            STA   taskDATA
            STA   taskDATA+2
L0267       STA   taskEXT,Y
            DEY
            DEY
            BPL   L0267

            LDA   #$FFFF	; reset task mask
            STA   taskMASK
            LDA   #$001F
            STA   taskMASK+2
            PLB
            RTL

*------------------------------
* CLOSE
*------------------------------

closeROUTINE
            PHB
            PHK
            PLB
            LDA   fgSTART	; were we started?
            BEQ   L02B3	; no

            STZ   fgSTART
            LDA   ptrWINDOW+2
            PHA
            LDA   ptrWINDOW
            PHA
            _CloseWindow
            LDA   resID
            PHA
            _CloseResourceFile
            LDA   memID
            PHA
            _SetCurResourceApp
            _ResourceShutDown
L02B3       PLB
            RTL

*------------------------------
* ACTION
*------------------------------

actionROUTINE
            PHB		; set my bank
            PHK
            PLB
            PHA		; A: action code
            PHY		; YX: point to the
            PHX		; event record

            PEA   ^taskREC	; move 16 bytes from Y/X to
            PEA   taskREC	; the taskREC
            PEA   $0000
            PEA   $0010
            _BlockMove
            PLA		; restore the action code
            ASL
            TAX
            JSR   (tblACTION,X)
            PLB
            RTL

*------------------------------

tblACTION   DA    doSAYOK	; 0
            DA    doEVENT	; 1 eventAction
            DA    showTHERMO	; 2 runAction
            DA    doSAYOK	; 3 cursorAction
            DA    doSAYOK	; 4 not used
            DA    doSAYOK	; 5 undoAction
            DA    doSAYOK	; 6 cutAction
            DA    doSAYOK	; 7 copyAction
            DA    doSAYOK	; 8 pasteAction
            DA    doSAYOK	; 9 clearAction

*------------------------------

doSAYOK     LDA   #$FFFF	; return TRUE
            RTS

*------------------------------

doEVENT     PEA   $0000	; space for result
            PEA   $FFFF	; eventMask - not used
            PEA   ^taskREC	; taskRecPtr
            PEA   taskREC
            _TaskMasterDA
            PLA
            LDA   #$0000	; always return OK
            RTS

*------------------------------
* SHOW THE THERMO "REFRESH"
*------------------------------

showTHERMO  PHA		; save port
            PHA
            _GetPort

            LDA   ptrWINDOW+2	; set my port
            PHA
            LDA   ptrWINDOW
            PHA
            _SetPort

            PEA   $0000	; get current free RAM
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            _RealFreeMem

            PEA   $0000	; multiply by 100
            PEA   $0064
            _LongMul
            PLA
            STA   freeRAM
            PLA
            STA   freeRAM+2
            PLA
            PLA

            PEA   $0000	; and divide
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   freeRAM+2
            PHA
            LDA   freeRAM
            PHA
            LDA   totalMEM+2
            PHA
            LDA   totalMEM
            PHA
            _LongDivide
            PLA		; to get the real free RAM
            STA   freeRAM
            PLA
            STA   freeRAM+2
            PLA
            PLA

            LDA   #$0064	; calculate thermo limit
            SEC
            SBC   freeRAM	; - freeRAM
            CMP   #$0064	; 100
            BCC   L038A
            LDA   #$0064	; 100
L038A       CLC
            ADC   busyRECT_X1	; + left
            CMP   theRAM	; end reached?
            BEQ   L03CA	; yes, the same, exit
            STA   busyRECT_X2	; set right
            STA   theRAM	; save width
            STA   freeRECT_X1	; free begins after used
            LDA   #$006A	; 110
            STA   freeRECT_X2	; until its right limit

            PEA   ^busyRECT	; fill the busy RAM rectangle
            PEA   busyRECT
            LDA   busyPATTPTR+2
            PHA
            LDA   busyPATTPTR
            PHA
            _FillRect

            PEA   ^freeRECT	; draw the free CPU rectangle
            PEA   freeRECT
            PEA   ^freePATTERN
            PEA   freePATTERN
            _FillRect
L03CA       LDA   #$0000
            _SetPort
            RTS

*------------------------------

freeRAM     ADRL  $00000000
totalMEM    ADRL  $00000000
theRAM      DW    $0000

*------------------------------
* WINDOW REFRESH ROUTINE
*------------------------------

winREFRESH  PHB
            PHK
            PLB
            LDA   ptrWINDOW+2
            PHA
            LDA   ptrWINDOW
            PHA
            _DrawControls
            PEA   $0000
            _SetSolidPenPat
            PEA   ^frameRECT
            PEA   frameRECT
            _FrameRect
            STZ   theRAM
            JSR   showTHERMO
            PLB
            RTL

*------------------------------

frameRECT   DW    $0003
            DW    $0007
            DW    $000C
            DW    $006C

busyRECT    DW    $0004
busyRECT_X1 DW    $0008
            DW    $000B
busyRECT_X2 DW    $006A

freeRECT    DW    $0004
freeRECT_X1 DW    $0008
            DW    $000B
freeRECT_X2 DW    $006A

busyPATTPTR ADRL  pattern320

freePATTERN HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
pattern320  HEX   77777777777777777777777777777777
            HEX   77777777777777777777777777777777
pattern640  HEX   44444444444444444444444444444444
            HEX   44444444444444444444444444444444

*------------------------------
* SOHW THE ERROR AND DISABLE ME
*------------------------------

showERROR   STA   ptrSTRING
            STY   ptrSTRING+2
            PEA   $0000
            PEA   ^strFATAL
            PEA   strFATAL
            LDA   ptrSTRING+2
            PHA
            LDA   ptrSTRING
            PHA
            PEA   ^strRETURN
            PEA   strRETURN
            PEA   ^strSPACE
            PEA   strSPACE
            _TLTextMountVolume
            PLA

            LDA   menuID	; disable my menu item :-(
            PHA
            _DisableMItem
            RTS

*------------------------------

ptrSTRING   ADRL  $00000000

strFATAL    STR   'Memory Use:Fatal Error Occurred.'
strRETURN   STR   'Press RETURN to continue.'
strSPACE    STR   ' '

strNORES    STR   'Cannot open Resource Fork.'
strNOWIN    STR   'Cannot open window.'
strNOCTL    STR   'Cannot access controls.'

*------------------------------

fgSTART     DW    $0000	; 0: not started, -1: started
memID       DW    $0000	; my Memory Manager ID
resID       DW    $0000	; my Resource Manager ID
            DW    $0000

winTITLE    STR   ' Memory Use... '

ptrWINDOW   ADRL  $00000000	; pointer to my window port

tblCOLOR320 DW    $0000	; color table for the 320-mode window
            DW    $0F04
            DW    $024F
            DW    $F0FF
            DW    $00F0

tblCOLOR640 DW    $0000	; color table for the 640-mode window
            DW    $0F01
            DW    $021F
            DW    $F0FF
            DW    $00F0

taskREC     DW    $0000	; event code
            ADRL  $00000000	; event message
            ADRL  $00000000	; tick count
            DW    $0000	; mouse location
            DW    $0000
            DW    $0000	; modifiers
taskDATA    ADRL  $00000000	; task data
taskMASK    ADRL  $001FFFFF	; task mask
taskEXT     ADRL  $00000000
            DW    $0000
            ADRL  $00000000
            ADRL  $00000000
            ADRL  $00000000
            DW    $0000
            DW    $0000

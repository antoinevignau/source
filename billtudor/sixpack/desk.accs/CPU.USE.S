*
* Memory Use
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	NDA
	dsk	CPU.Use.l

GSOS	EQU	$E100A8

*------------------------------
* MACROS
*------------------------------

	use	4/Ctl.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
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
	DW	$0000	; Period
	DW	$FFFF	; Event mask
	ASC	'##CPU Use\H'
menuID          ASC             '**'00

*------------------------------
* THE OPEN ROUTINE
*------------------------------

openROUTINE
            PHB
            PHK
            PLB
            LDA   fgSTART	; is it our first start?
            BEQ   openME	; yup
            BRL   imOPEN	; no

*------------------------------

openME      PHA		; save cursor address
            PHA
            _GetCursorAdr
            PLA
            STA   saveCURSOR
            PLA
            STA   saveCURSOR+2
            _WaitCursor

            STZ   theTIME

            PEA   $0000	; save the curent resource app ID
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

set640      PEA   ^tblCOLOR640	; window in 640-mode
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

set320      PEA   ^tblCOLOR320	; window in 320-mode
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

            PEA   ^myHEARTBEAT	; set my heart beaet
            PEA   myHEARTBEAT
            _SetHeartBeat

            DEC   fgHEARTBEAT	; set it is installed

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

exitNOCTL   LDA   #strNOCTL	; not used
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
            BRA   restorePREFS	; ...until here

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
            LDA   fgHEARTBEAT	; yes, was the heartbeat routine
            BEQ   L0267	; installed? Yes
            
            PEA   ^myHEARTBEAT	; no... install it
            PEA   myHEARTBEAT
            _DelHeartBeat
            STZ   fgHEARTBEAT	; say it is installed
L0267       PLB
            RTL

*------------------------------

fgHEARTBEAT DW    $0000

*------------------------------

initSHUT    STZ   fgSTART	; we had a DeskShutDown call
            LDA   #$0000	; clear our data
            LDY   #$0014	; clear the extended task record
            STA   taskDATA
            STA   taskDATA+2
L027A       STA   taskEXT,Y
            DEY
            DEY
            BPL   L027A

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
            BEQ   L02DB	; nada

            LDA   fgHEARTBEAT	; was the heartbeat installed?
            BEQ   L02AC	; nada
            PEA   ^myHEARTBEAT
            PEA   myHEARTBEAT
            _DelHeartBeat
            STZ   fgHEARTBEAT
L02AC       STZ   fgSTART
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
L02DB       PLB
            RTL

*------------------------------
* ACTION ROUTINE
*------------------------------

actionROUTINE
            PHB		; set my bank
            PHK
            PLB
            PHA		; A: action code
            PHY		; YX point to the 
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
            DA    doRUN	; 2 runAction
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

doRUN       INC   theTIME	; say we must do something
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

            LDA   theTIME	; calculate thermo limits
            ASL
            CMP   #$0064
            BCC   L0356
            LDA   #$0064	; 100
L0356       STA   curBUSY
            LDA   #$0064	; 100
            SEC
            SBC   curBUSY	; - theTIME
            CLC
            ADC   busyRECT_X1	; + left
            CMP   oldBUSY	; end reached?
            BEQ   L03A0	; yes, the same, exit
            STA   busyRECT_X2	; set right
            STA   oldBUSY	; save width
            STA   freeRECT_X1	; free begins after used
            LDA   #$006B	; 111
            STA   freeRECT_X2	; until its right limit

            PEA   ^busyRECT	; fill the busy CPU rectangle
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
L03A0       _SetPort
            RTS

*------------------------------

curBUSY     DW    $0000
            DW    $0000	; not used
oldBUSY     DW    $0000

theTIME     DW    $0000

*------------------------------
* WINDOW REFRESH ROUTINE
*------------------------------

winREFRESH  PHB
            PHK
            PLB
            LDA   ptrWINDOW+2	; set my port
            PHA
            LDA   ptrWINDOW
            PHA
            _DrawControls
            PEA   $0000	; force white
            _SetSolidPenPat
            PEA   ^frameRECT	; erase the full frame
            PEA   frameRECT
            _FrameRect
            JSR   showTHERMO	; show the usage
            PLB
            RTL

*------------------------------

frameRECT   DW    $0003	; the complete frame rectangle
            DW    $0007
            DW    $000C
            DW    $006D

busyRECT    DW    $0004	; the CPU used rectangle
busyRECT_X1 DW    $0008
            DW    $000B
busyRECT_X2 DW    $006A

freeRECT    DW    $0004	; the CPU unused rectangle
freeRECT_X1 DW    $0008
            DW    $000B
freeRECT_X2 DW    $006A

busyPATTPTR ADRL  pattern320	; pointer to fill data

freePATTERN HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF	; pattern
            HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
pattern320  HEX   77777777777777777777777777777777	; red
            HEX   77777777777777777777777777777777
pattern640  HEX   44444444444444444444444444444444	; red
            HEX   44444444444444444444444444444444

*------------------------------
* SHOW THE ERROR AND DISABLE ME
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

strFATAL    STR   'CPU Use:Fatal Error Occurred.'
strRETURN   STR   'Press RETURN to continue.'
strSPACE    STR   ' '

strNORES    STR   'Cannot open Resource Fork.'
strNOWIN    STR   'Cannot open window.'
strNOCTL    STR   'Cannot access controls.'

*------------------------------

fgSTART     DW    $0000	; 0: not started, -1: started
memID       DW    $0000	; my Memory Manager ID
resID       DW    $0000	; my Resource Manager ID

winTITLE    STR   ' CPU Use... '

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

*------------------------------

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

*------------------------------
* THIS IS THE REFRESH HEARTBEAT
*------------------------------

myHEARTBEAT
            ADRL  $00000000	; This heartbeat refreshes
            DW    $001E	; the thermometer display
            DW    $A55A	; when possible

            REP   #$30
            LDAL  $E100FF	; is system busy?
            BEQ   L0584	; no...
            LDA   #$0001	; yes, so retry faster
            BRA   L0595
L0584       PHB		; no...
            PHK
            PLB
            JSR   showTHERMO	; refresh data
            PLB
            LDA   #$0000
            STAL  theTIME
            LDA   #$001E	; 30 = 1/2 second
L0595       STAL  myHEARTBEAT+4
            SEP   #$30
            RTL



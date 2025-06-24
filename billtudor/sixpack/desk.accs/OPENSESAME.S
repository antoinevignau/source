*
* Open Sesame
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	NDA
	dsk	OpenSesame.l

BUFFSIZE	=	510

*------------------------------

	use	4/Desk.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Sch.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*------------------------------
* NDA
*------------------------------

	ADRL	openROUTINE	; Open routine
	ADRL	closeROUTINE	; Close routine
	ADRL	actionROUTINE	; Action routine
	ADRL	initROUTINE	; Init routine
	DW	$FFFF	; Period
	DW	$FFFF	; Event mask
	ASC	'##OpenSesame\H'
menuID	ASC	'**'00

*------------------------------
* ROUTINES 
*------------------------------

closeROUTINE
actionROUTINE
initROUTINE
            RTL

*------------------------------
* OPEN ROUTINE
*------------------------------

openROUTINE
            PHB		; my bank
            PHK
            PLB
            _WaitCursor

            PHA		; are we running on...
            _QDVersion
            PLA
            AND   #$0FFF
            CMP   #$0307	; System 6 or above?
            BCS   L0056	; yes

            LDA   menuID	; no, disable me
            PHA
            _DisableMItem
            _SysBeep
            BRL   exitNOW

L0056       PHA		; get an ID
            _MMStartUp
            PLA
            STA   memID
            JSR   doOPEN	; do the action
            BCS   exitNOW

            PHA		; add a task
            PEA   ^myTASK
            PEA   myTASK
            _SchAddTask
            PLA
            BNE   exitNOW	; added successfully

            _InitCursor	; failed to add task
            PHA
            PEA   $0020
            PEA   $0000
            PEA   $0000
            PEA   ^errNOTASK
            PEA   errNOTASK
            _AlertWindow
            PLA

exitNOW     LDA   #$0000	; we are good, exit
            STA   $07,S
            STA   $05,S
            _InitCursor
            PLB
            RTL

*------------------------------
* TASK
*------------------------------

myTASK      PHB
            PHK
            PLB

            PEA   $0104	; finderSaysBeforeOpen
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   ^dataIn
            PEA   dataIn
            PEA   ^dataOut
            PEA   dataOut
            _SendRequest
            BCC   taskOK

            PEA   $0105	; finderSaysOpenFailed
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   ^dataIn
            PEA   dataIn
            PEA   ^dataOut
            PEA   dataOut
            _SendRequest
            BCC   taskOK

            STZ   myQUEUE+4
            PEA   ^myQUEUE
            PEA   myQUEUE
            _AddToRunQ

taskOK      PLB
            RTL

*------------------------------
* TELL FOUND NO ONE
*------------------------------

myQUEUE     ADRL  $00000000
            DW    $0000
            DW    $A55A
            ADRL  $00000000

            PEA   ^myQUEUE	; remove me
            PEA   myQUEUE
            _RemoveFromRunQ

            PHA		; save the cursor
            PHA
            _GetCursorAdr
            _InitCursor	; show the std cursor

            PHA		; and tell no FE handled the request
            PEA   $0020
            PEA   $0000
            PEA   $0000
            PEA   ^errNOFOUND
            PEA   errNOFOUND
            _AlertWindow
            PLA

            _SetCursor	; restore the cursor
            RTL		; and exit

*------------------------------
* START STANDARD FILE
*------------------------------

startSF     STZ   fgSF
            STZ   haDP
            STZ   haDP+2
            PHA
            _SFStatus
            PLA
            BCS   loadSF	; not here
            BNE   exitSFOK	; here and active

loadSF      PEA   $0017	; load Standard File
            PEA   $0101
            _LoadOneTool
            BCC   okSF

errSF       _SysBeep	; cannot load
            SEC
            RTS

okSF        PHA		; ask for one DP page
            PHA
            PEA   $0000
            PEA   $0100
            LDA   memID
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLX
            PLA
            BCS   errSF
            STX   haDP
            STA   haDP+2

            PHD		; deref
            PHA
            PHX
            TSC
            TCD
            LDA   [$01]
            TAX		; in X
            PLY
            PLY
            PLD

            LDA   memID
            PHA
            PHX		; my DP
            _SFStartUp
            INC   fgSF	; SF started

exitSFOK    CLC
            RTS

*------------------------------
* STOP STANDARD FILE
*------------------------------

stopSF      LDA   fgSF	; is Standard File started?
            BEQ   L01E4	; no

            _SFShutDown	; yes...
            PEA   $0017
            _UnloadOneTool

            LDA   haDP	; do we have a DP handle?
            ORA   haDP+2
            BEQ   L01E4

            LDA   haDP+2	; yes, dispose it?
            PHA
            LDA   haDP
            PHA
            _DisposeHandle
L01E4       RTS

*------------------------------

fgSF        DW    $0000
haDP        ADRL  $00000000

*------------------------------
* OPEN ROUTINE
*------------------------------

doOPEN      JSR   startSF	; start the tool
            BCC   openOK
            RTS

L01F1       _SysBeep	; error, exit
            JSR   stopSF
            SEC
            RTS

openOK      PEA   $0010	; Let the user
            PEA   $0028	; select files
            PEA   $0000
            PEA   ^strOPEN
            PEA   strOPEN
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^replyPtr
            PEA   replyPtr
            _InitCursor
            _SFGetFile2
            BCS   L01F1

            _WaitCursor

            LDA   replyPtr	; do we have a selection?
            BNE   handleIT	; yes

            JSR   stopSF	; no, exit
            SEC
            RTS

*------------------------------

handleIT    LDA   nameRef+2	; dispose the filename handle
            PHA
            LDA   nameRef
            PHA
            _DisposeHandle

            LDA   pathRef+2	; but lock the path one
            PHA
            LDA   pathRef
            PHA
            _HLock

            LDA   pathRef	; dereference it
            LDX   pathRef+2
            PHD
            PHX
            PHA
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            PLY
            PLY
            PHX
            INC
            INC
            PHA
            LDA   [$01]	; check size
            CMP   #BUFFSIZE
            BCS   handleKO	; too big!!

            PEA   ^myBUFFER	; move to my byffer
            PEA   myBUFFER
            PEA   $0000
            INC
            INC
            PHA
            _BlockMove
            PLD

            JSR   stopSF	; stop the Std File toolset

            LDA   pathRef+2	; and dispose the handle
            PHA
            LDA   pathRef
            PHA
            _DisposeHandle

            LDA   fileType	; copy the file and aux types
            STA   diFiletype
            LDA   auxType
            STA   diAuxtype
            LDA   auxType+2
            STA   diAuxtype+2
            CLC		; return OK
            RTS

*------------------------------

handleKO    PLA		; pathname too long
            PLA
            PLD

            JSR   stopSF	; stop the Std File toolset

            LDA   pathRef+2	; and dispose the handle
            PHA
            LDA   pathRef
            PHA
            _DisposeHandle
            SEC		; return NOT OK
            RTS

*------------------------------
* DATA
*------------------------------

strOPEN     STR   'Open which file:'

replyPtr    DW    $0000	; New-style reply record
fileType    DW    $0000
auxType     ADRL  $00000000
            DW    $0003	; Reference is undefined
nameRef     ADRL  $00000000
            DW    $0003	; Reference is undefined
pathRef     ADRL  $00000000

memID       DW    $0000

dataIn      DW    $0007	; number of parameters
            ADRL  myBUFFER	; pointer to class-one pathname
            ADRL  $00000000	; pointer to rectangle to zoom out from
diFiletype  DW    $0000	; filetype
diAuxtype   ADRL  $00000000	; auxiliary type
            DW    $0000	; modifiers
            ADRL  $00000000	; theIconObj
            DW    $0000	; printFlag

dataOut     DW    $0000
            DW    $0000
            DW    $0000
            DW    $0000

*------------------------------

myBUFFER    DS    BUFFSIZE

*------------------------------

errNOFOUND  ASC   '52~None of the installed System Extensions could open this file.~^#6'00
errNOTASK   ASC   '52~The System is too busy at this time to handle this request.~^#6'00


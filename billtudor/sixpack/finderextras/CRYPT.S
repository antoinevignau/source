*
* Crypt v1.0
*
* (c) 1992, William H. Tudor
* (s) 2025, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	PIF
	dsk	Crypt.l

GSOS	EQU	$E100A8

fileTYPE	=	$e0
auxTYPE  =	$800c

*------------------------------

	use	4/Ctl.Macs
	use	4/List.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Menu.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*------------------------------

            PHB
            PHK
            PLB
            PHA
            _QDVersion	; are we running under 6.0?
            PLA
            AND   #$0FFF
            CMP   #$0307
            BCC   L004D	; no
            PEA   ^cStringPtr	; yes
            PEA   cStringPtr
            PEA   ^iconPtr
            PEA   iconPtr
            _ShowBootInfo
            PEA   ^nameSTR
            PEA   nameSTR
            PHA
            _MMStartUp
            PLA
            STA   appID
            PHA
            ORA   #$0100
            STA   myID
            PEA   ^myREQUEST
            PEA   myREQUEST
            _AcceptRequests
L004D       PLB
            RTL

*------------------------------
*
*------------------------------

cStringPtr  ASC   'Crypt                 v01.00'00
nameSTR     STR   'Tudor~Crypt~'
iconPtr     DW    $0080       ; Icon type
            DW    $00C8       ; Icon size
            DW    $0014       ; Icon height
            DW    $0014       ; Icon width
            HEX   0000000000000000DDDD  ; Icon image
            HEX   0FFFFFFFFFFFFF0F0DDD
            HEX   0FCCF33F00FCFF0FF0DD
            HEX   0FFFFFF0FF0FFF0000CD
            HEX   0F3F33F0FF0FCFFFF0CD
            HEX   0FFFFF000000FFFFF0CD
            HEX   0FCCCF000000FF33F0CD
            HEX   0FFFFF000000FFFFF0CD
            HEX   0FCCFF000000CCFCF0CD
            HEX   0FFFFFFFFFFFFFFFF0CD
            HEX   0F0FC03F0FF0FC03F0CD
            HEX   0F0F0F0F0FF0F0F0F0CD
            HEX   0F0FC03F0FF0FC03F0CD
            HEX   0FFFFFFFFFFFFFFFF0CD
            HEX   0FC03F0FC03F0FF0F0CD
            HEX   0F0F0F0F0F0F0FF0F0CD
            HEX   0FC03F0FC03F0FF0F0CD
            HEX   0FFFFFFFFFFFFFFFF0CD
            HEX   000000000000000000CD
            HEX   FCCCCCCCCCCCCCCCCCCD
            HEX   FFFFFFFFFFFFFFFFFFFF  ; Icon mask
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF
            HEX   FFFFFFFFFFFFFFFFFFFF

*-----------------------------
* MY REQUEST PROCEDURE
*-----------------------------
			
myREQUEST   PHD
            TSC
            TCD
            LDA   $0E
            CMP   #$0100	; finderSaysHello
            BNE   L0221
            JSR   doHELLO
            BRL   requestOK
L0221       CMP   #$0101	; finderSaysGoodbye
            BNE   L022C
            JSR   doGOODBYE
            BRL   requestOK
L022C       CMP   #$0108	; finderSaysExtrasChosen
            BEQ   doEXTRAS
            CMP   #$0003	; srqGoAway
            BNE   L0257

            LDY   #$0002	; I accept to be kicked out
            LDAL  appID	; see page 114 of Toolbox Ref Volume 6.0
            STA   [$06],Y
            INY
            INY
            LDA   #$0000
            STA   [$06],Y
            BRL   requestOK

doEXTRAS    LDA   $0A
            CMPL  dataOut1+4	; is Encrypt menu chosen?
            BEQ   L025F	; yes
            CMPL  dataOut2+4	; is Decrypt menu chosen?
            BEQ   L025A	; yes
L0257       BRL   L0304

L025A       LDA   #$0000	; decrypt
            BRA   L0262
L025F       LDA   #$FFFF	; encrypt
L0262       STAL  fgCRYPT

            PEA   $0000	; open my resource file
            _GetCurResourceApp
            LDAL  appID
            PHA
            _ResourceStartUp
            PEA   $0000
            PEA   $0003
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDAL  appID
            PHA
            PEA   $0001
            _LGetPathname2
            _OpenResourceFile
            PLA
            BCS   L02F1

            PHB
            PHK
            PLB
            PEA   $0000	; get current text substitution array
            PEA   $0000	; for the Control Manager
            _GetCtlParamPtr
            PLA
            STA   oldSubArray
            PLA
            STA   oldSubArray+2

            PEA   ^mySubArray	; install mine
            PEA   mySubArray
            _SetCtlParamPtr

            JSR   doCRYPT	; do the work

            LDA   myID	; dispose memory
            PHA
            _DisposeAll

            LDA   oldSubArray+2 ; restore the text substitution array
            PHA
            LDA   oldSubArray
            PHA
            _SetCtlParamPtr

            _InitCursor	; init cursor
            PLB

L02F1       _ResourceShutDown	; exit
            _SetCurResourceApp

requestOK   LDA   #$8000	; handled request
            STA   $10

L0304       PLD		; exit request procedure
            LDA   $02,S
            STA   $0C,S
            LDA   $01,S
            STA   $0B,S
            PLY
            PLY
            PLY
            PLY
            PLY
            RTL

*-----------------------------
* finderSaysHello
*-----------------------------
			
doHELLO     PHB		; Add the two menu items
            PHK
            PLB
            PEA   $800F	; tellFinderAddToExtras
            PEA   $0001
            PEA   ^strFINDER
            PEA   strFINDER
            PEA   ^dataIn1
            PEA   dataIn1
            PEA   ^dataOut1
            PEA   dataOut1
            _SendRequest
            PEA   $800F	; tellFinderAddToExtras
            PEA   $0001
            PEA   ^strFINDER
            PEA   strFINDER
            PEA   ^dataIn2
            PEA   dataIn2
            PEA   ^dataOut2
            PEA   dataOut2
            _SendRequest
            PLB
            RTS

*-----------------------------
* finderSaysGoodbye
*-----------------------------
			
doGOODBYE   PHB		; Remove the two menu items
            PHK
            PLB
            PEA   $8014	; tellFinderRemoveFromExtras
            PEA   $0001	; sendToName
            PEA   ^strFINDER
            PEA   strFINDER
            PEA   $0000
            LDA   dataOut1+4	; menu ID
            PHA
            PEA   ^dataOut3
            PEA   dataOut3
            _SendRequest
            PEA   $8014	; tellFinderRemoveFromExtras
            PEA   $0001	; sendToName
            PEA   ^strFINDER
            PEA   strFINDER
            PEA   $0000
            LDA   dataOut2+4	; menu ID
            PHA
            PEA   ^dataOut3
            PEA   dataOut3
            _SendRequest
            STZ   dataOut1+4
            STZ   dataOut2+4
            PLB
            RTS

*-----------------------------
* DATA
*-----------------------------
			
appID       DW    $0000
myID        DW    $0000
menu1STR    STR   'EncryptI'
menu2STR    STR   'DecryptI'
strFINDER   STR   'Apple~Finder~'

dataOut3    DW    $0000	; recvCount
            DW    $0000	; finderResult

dataOut2    DW    $0000	; recvCount
            DW    $0000	; finderResult
            DW    $0000	; menuItemNumber
            DW    $0000	; IDExtrasMenu

dataOut1    DW    $0000	; recvCount
            DW    $0000	; finderResult
            DW    $0000	; menuItemNumber
            DW    $0000	; IDExtrasMenu

dataIn1     DW    $8000	; version (divider needed)
            DW    $0000	; itemID
            DB    $00	; itemChar
            DB    $00	; itemAltChar
            DW    $0000	; itemCheck
            DW    $0000	; itemFlag
            ADRL  menu1STR	; itemTitleRef
	  
dataIn2     DW    $0000	; version
            DW    $0000	; itemID
            DB    $00	; itemChar
            DB    $00	; itemAltChar
            DW    $0000	; itemCheck
            DW    $0000	; itemFlag
            ADRL  menu2STR	; itemTitleRef

*-----------------------------
* DEREFERENCE HANDLE
*-----------------------------
			
derefHANDLE PHD
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
            PLD
            RTS

*-----------------------------
* SHOW THE RIGHT BUTTON
*-----------------------------

showTHERIGHTBUTTON
            LDA   fgCRYPT	; what do we do?
            BNE   L0428

            LDA   #strKEY_ENTER	; ...decrypt
            STA   L10D4
            LDA   #^strKEY_ENTER
            STA   L10D4+2
            LDA   #strDECRYPT
            STA   L10D0
            LDA   #^strDECRYPT
            STA   L10D0+2
            LDA   #$0003	; ID=3
            BRA   L0443

L0428       LDA   #strKEY_REMEMBER	; ...encrypt
            STA   L10D4
            LDA   #^strKEY_REMEMBER
            STA   L10D4+2
            LDA   #strENCRYPT
            STA   L10D0
            LDA   #^strENCRYPT
            STA   L10D0+2
            LDA   #$0002	; ID=2

L0443       PEA   $0000
            PEA   $0000
            LDX   myPORT+2
            PHX
            LDX   myPORT
            PHX
            PEA   $0000
            PHA		; control ID = 2 or 3
            _GetCtlHandleFromID
            PLA
            STA   haBUTTON
            PLY
            STY   haBUTTON+2	; get its handle
            PHY
            PHA
            _ShowControl	; show it
            RTS

*-----------------------------
* 
*-----------------------------

L046E       STZ   L11A7
            STZ   L11E1
            LDA   stringPtr+2
            STA   L11A1+2
            STA   L120D+2
            LDA   stringPtr
            CLC
            ADC   offsetLIST
            STA   L11A1
            STA   L120D
            PHD
            LDA   stringPtr+2
            PHA
            LDA   stringPtr
            PHA
            TSC
            TCD
            LDY   offsetLIST
            STY   L0636
            LDA   [$01],Y
            INC
            INC
            CLC
            ADC   offsetLIST
            STA   offsetLIST
            TAY
            DEY
            LDX   #$0001
L04AB       DEY
            LDA   [$01],Y
            AND   #$007F
            CMP   #$003A
            BEQ   L04C1
            INX
            CPX   #$0020
            BCC   L04AB
            PLY
            PLY
            PLD
            SEC
            RTS

L04C1       STX   L1163
            STX   L0634
            INY
            LDX   #$0001
            SEP   #$20
L04CD       LDA   [$01],Y
            STA   L1163,X
            INX
            INY
            DEC   L0634
            BNE   L04CD
            REP   #$20
            LDY   L0636
            LDA   L1163
            AND   #$00FF
            STA   L0634
            LDA   [$01],Y
            TAX
            CLC
            SBC   L0634
            STX   L0634
            STA   [$01],Y

            JSL   GSOS
            DW    $2009       ; SetPrefix
            ADRL  L1209

            LDY   L0636
            LDA   L0634
            STA   [$01],Y
            PLY
            PLY
            PLD

            PEA   $0000	; hilite the Cancel button
            PEA   $0000
            PEA   $0000
            LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            PEA   $0000
            PEA   $0004
            _GetCtlHandleFromID
            _HiliteControl

            PEA   $0000	; hilite the line edit control
            PEA   $0000
            PEA   $0000
            LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            PEA   $0000
            PEA   $0005
            _GetCtlHandleFromID
            _HiliteControl
            JSR   hideTHERMO

            PEA   $0000	; space
            PEA   $0000
            PEA   ^eventPtr	; eventPtr
            PEA   eventPtr
            PEA   $0000	; updateProc
            PEA   $0000
            PEA   $8000	; eventHook
            PEA   $0000
            PEA   $0000	; beepProc
            PEA   $0000
            PEA   $0008	; flags
            _DoModalWindow
            PLA
            PLX
            PEA   $0000
            PEA   $0000
            LDA   myPORT+2	; get stat text handle
            PHA
            LDA   myPORT
            PHA
            PEA   $0000
            PEA   $0007
            _GetCtlHandleFromID
            _DrawOneCtl	; and draw the control

            LDY   #$0038	; clear buffer
            LDA   #$0000
L05A7       STA   myBUFFER,Y
            DEY
            BNE   L05A7

            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCC   L05C1
L05B9       STA   theERROR
            JSR   showERROR
            SEC
            RTS

L05C1       LDA   L119F
            STA   proCLOSE1+2
            STA   L11EB
            LDA   #$0038
            STA   L11F1
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            PHP
            PHA
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE1
            PLA
            PLP
            BCS   L05B9
            LDA   L11AB
            CMP   #$000F
            BNE   L05FF
            LDA   #$0002
L05F5       JSR   showALERT
            SEC
            RTS
L05FA       LDA   #$0008
            BRA   L05F5

L05FF       LDA   fgCRYPT
            BNE   L0632	; skip if encrypt

            LDA   L0C1D	; decrypt
            CMP   #$4320	; " c"
            BNE   L05FA
            LDA   L0C1F
            CMP   #$59D2	; "ry"
            BNE   L05FA
            LDA   L0C21
            CMP   #$54D0	; "pt"
            BNE   L05FA
            LDA   L0C2D
            STA   L0C0D
            LDY   #$0016
L0625       LDA   L0C2F,Y
            EOR   L0C0D
            STA   L0C2F,Y
            DEY
            DEY
            BPL   L0625
L0632       CLC
            RTS

*-----------------------------
			
L0634       DW    $0000
L0636       DW    $0000

*-----------------------------
* HIDE THE THERMOMETER
*-----------------------------
			
hideTHERMO  PEA   $0000
            PEA   $0000
            LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            PEA   $0000
            PEA   $0009	; ID of the thermometer
            _GetCtlHandleFromID
            _HideControl
            RTS

*-----------------------------
* SHOW ALERT
*-----------------------------
			
showALERT   STA   alertRef
            _InitCursor
            PHA
            PEA   $0037	; flags: 0011_0111 - 5:awButtonLayout, 4:awForceBeep, 3:awTextFullWidth, 2-1:invalid!, 0:Pascal str
            PEA   ^mySubArray
            PEA   mySubArray
            LDA   alertRef+2
            PHA
            LDA   alertRef
            PHA
            _AlertWindow
            PLA
            RTS

*-----------------------------
			
alertRef    ADRL  $00000000

*-----------------------------
* SET FILE TYPE AND AUXTYPE
*-----------------------------

setMYTYPE   LDA   #fileTYPE
            STA   myFILETYPE
            LDA   #auxTYPE
            STA   myAUXTYPE
            RTS

*-----------------------------
* ENCRYPT OR DECRYPT...
*-----------------------------

doCRYPT     _WaitCursor
            JSR   setMYTYPE	; set my file info
	  
            PEA   $8004	; tellFinderGetSelectedIcons
            PEA   $0001
            PEA   ^strFINDER
            PEA   strFINDER
            PEA   $0000	; no dataIn
            PEA   $0000
            PEA   ^dataOut	; dataOut
            PEA   dataOut
            _SendRequest
            BCC   L06BD	; we're good
L06BC       RTS

L06BD       LDA   dataOut+2	; did the Finder return an error?
            BNE   L06BC	; yes, exit
	  		; no
            LDA   stringList+2
            PHA
            LDA   stringList
            PHA
            _HLock
            LDA   stringList	; dereference the handle
            LDX   stringList+2
            JSR   derefHANDLE
            STX   stringPtr+2	; save the pointer
            STA   stringPtr
            PHD		; push the pointer
            PHX
            PHA
            TSC
            TCD
            LDA   [$01]	; get the number of records
            PLY
            PLY
            PLD
            CMP   #$0000	; zero selected icons?
            BNE   L06F7	; no
            LDA   #$0001	; yezs
            JSR   showALERT
            BRA   L0746

L06F7       STA   nbICONS	; save the number of selected icons
            LDA   #$0002
            STA   offsetLIST

            PEA   $0000	; and open the window
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^DRAWCONTROLS
            PEA   DRAWCONTROLS
            PEA   $0000
            PEA   $0000
            PEA   $0002	; by resource
            PEA   $0000
            PEA   $0064	; resource ID
            PEA   $800E
            _NewWindow2
            STA   theERROR
            PLA		; save the port
            STA   myPORT
            PLA
            STA   myPORT+2
            BCC   L076B	; we're good
            BRA   L0743	; an error occured
            STA   theERROR	; dead code
L0743       JSR   showERROR

L0746       _WaitCursor	; the end
            LDA   stringList	; cleat the handle
            ORA   stringList+2
            BEQ   L076A	; if it exists
            LDA   stringList+2
            PHA
            LDA   stringList
            PHA
            _DisposeHandle
            STZ   stringList
            STZ   stringList+2
L076A       RTS		; and return

*-----------------------------
* 
*-----------------------------
			
L076B       PHA
            PHA
            _GetPort
            PLA
            STA   savePORT
            PLA
            STA   savePORT+2
            LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            _SetPort
            JSR   showTHERIGHTBUTTON
            LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            _ShowWindow
            STZ   L105C
            STZ   L105E
            STZ   fgCANCEL
L07A6       LDA   fgCANCEL
            BNE   L07CE
            STZ   L1058
            JSR   L046E
            BCC   L07BA
            DEC   nbICONS
            BNE   L07A6
            BRA   L07CE

L07BA       _InitCursor
L07C1       LDA   L1058
            BNE   L07C9
            BRL   L07EF
L07C9       DEC   nbICONS	; next icon
            BNE   L07A6	; please

L07CE       LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            _CloseWindow
            LDA   savePORT+2
            PHA
            LDA   savePORT
            PHA
            _SetPort
            BRL   L0746

*-----------------------------
* 
*-----------------------------
			
L07EF       PEA   $0000	; space
            PEA   $0000
            PEA   ^eventPtr	; eventPtr
            PEA   eventPtr
            PEA   $0000	; updateProc
            PEA   $0000
            PEA   $8000	; eventHook
            PEA   $0000
            PEA   $0000	; beepProc
            PEA   $0000
            PEA   $0008	; flags
            _DoModalWindow
            PLA
            PLX
            CMP   #$0000
            BEQ   L082E
            CMP   #$0006
            BCS   L082E
            DEC
            ASL
            TAX
            JSR   (L0831,X)
            LDA   fgCANCEL
            BNE   L07CE
L082E       BRL   L07C1

*-----------------------------
			
L0831       DA    L0E0C	; 1 rectangle (title)
            DA    L0952	; 2 button (encrypt)
            DA    L0849	; 3 button (decrypt)
            DA    L083B	; 4 button (cancel)
            DA    doLINEEDIT	; 5 line edit

*-----------------------------
* BUTTON CANCEL
*-----------------------------
			
L083B       _WaitCursor
            DEC   L1058
            DEC   fgCANCEL
            RTS

*-----------------------------
* BUTTON DECRYPT
*-----------------------------
			
L0849       _WaitCursor
            JSR   calcKEY
            CMP   L0C0D
            BNE   L0872
            LDA   L10A0
            AND   #$00FF
            TAX
            SEP   #$20
L0861       LDA   L10A0,X
            CMP   L0C2F,X
            BNE   L0870
            DEX
            BPL   L0861
            REP   #$20
            BRA   L0883
L0870       REP   #$20
L0872       LDA   #$0003
L0875       JSR   showALERT
L0878       JSR   hideTHERMO
            _InitCursor
            RTS

L0883       LDA   L0C0D
            STA   myKEY
            LDA   L0C23
            STA   L107C
            LDA   L0C25
            STA   L107E
            LDA   L0C25+2
            STA   L107E+2
            _WaitCursor
            JSR   L0F61
            BCS   L0878
            _WaitCursor

            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCC   L08BD
            BRL   L093D
L08BD       LDA   L119F
            STA   proCLOSE1+2
            STA   L11EB
            LDA   #$0038
            STA   L11F1
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            BCS   L092D

            LDA   L11B1	; storageType
            STA   proCREATE+14
            LDA   L107C	; fileType
            STA   proCREATE+8
            LDA   L107E	; auxType
            STA   proCREATE+10
            LDA   L107E+2
            STA   proCREATE+10+2

            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  proDESTROY

            JSL   GSOS
            DW    $2001       ; Create
            ADRL  proCREATE
            BCS   L091E

            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L11D7
            BCS   L091E
            LDA   L11D9
            STA   proCLOSE2+2
            STA   L11FB
            BRL   L0A77
L091E       STA   theERROR
            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  proDESTROY
            BRA   L0930
L092D       STA   theERROR
L0930       JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE1
            JSR   showERROR
L093D       LDA   replyPTR+16+2
            PHA
            LDA   replyPTR+16
            PHA
            _DisposeHandle
            LDA   #$0006
            BRL   L0875

*-----------------------------
* BUTTON ENCRYPT
*-----------------------------

L0952       _WaitCursor
            LDA   L11C7
            ORA   L11C7+2
            BNE   L0972
            LDA   #$0007
L0964       JSR   showALERT
L0967       JSR   hideTHERMO
            _InitCursor
            RTS

L0972       JSR   L0F61
            BCS   L0967
            _WaitCursor
            JSR   calcKEY
            STA   myKEY
            LDY   #$0016
L0987       LDA   L10A0,Y
            EOR   myKEY
            STA   L1088,Y
            DEY
            DEY
            BPL   L0987

            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCC   L09A3
            BRL   L0A5C

L09A3       LDA   L119F
            STA   proCLOSE1+2
            STA   L11EB

            LDA   L11B1	; storageType
            STA   proCREATE+14
            LDA   myFILETYPE
            STA   proCREATE+8
            LDA   myAUXTYPE
            STA   proCREATE+10
            STZ   proCREATE+10+2

            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  proDESTROY

            JSL   GSOS
            DW    $2001       ; Create
            ADRL  proCREATE
            BCS   L0A4D

            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L11D7
            BCS   L0A3B

            LDA   L11D9
            STA   proCLOSE2+2
            STA   L11FB
            LDA   L11AB
            STA   L107C
            LDA   L11AD
            STA   L107E
            LDA   L11AD+2
            STA   L107E+2

            PEA   ^headerENCRYPT
            PEA   headerENCRYPT
            PEA   ^myBUFFER
            PEA   myBUFFER
            PEA   $0000
            PEA   $0038
            _BlockMove
            LDA   #$0038
            STA   L1201
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L11F9
            BCS   L0A2C
            BRL   L0A77
L0A2C       STA   theERROR
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE2
            BRA   L0A3E
L0A3B       STA   theERROR
L0A3E       JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  proDESTROY
            JSR   showERROR
            BRA   L0A62
L0A4D       STA   theERROR
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE1
            BRA   L0A5F
L0A5C       STA   theERROR
L0A5F       JSR   showERROR
L0A62       LDA   replyPTR+16+2
            PHA
            LDA   replyPTR+16
            PHA
            _DisposeHandle
            LDA   #$0006
            BRL   L0964
L0A77       _WaitCursor
            JSR   L0D0F
            STZ   L0C0B
            LDA   #$0100
            STA   L11F1
            JSL   DRAWCONTROLS
L0A8E       INC   L0C0B
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            BCC   L0ADF
            CMP   #$004C
            BEQ   L0B0C
L0AA2       STA   theERROR
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE1
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE2
            JSL   GSOS
            DW    $2002       ; Destroy
            ADRL  proDESTROY
            JSR   showERROR
            LDA   #$0006
L0AC9       JSR   showALERT
            JSR   hideTHERMO
            LDA   replyPTR+16+2
            PHA
            LDA   replyPTR+16
            PHA
            _DisposeHandle
            RTS

L0ADF       LDY   #$0000
L0AE2       LDA   myBUFFER,Y
            EOR   myKEY
            STA   myBUFFER,Y
            INY
            INY
            CPY   #$0100
            BCC   L0AE2
            LDA   L11F5
            STA   L1201
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L11F9
            BCS   L0AA2
            LDA   L0C0B
            JSR   L0D9B
            BRA   L0A8E
L0B0C       LDA   L11B1
            CMP   #$0005
            BNE   L0B8C
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE1
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE2
            LDA   #$0001
            STA   L11A7
            STA   L11E1
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L119D
            BCS   L0B6F
            LDA   L119F
            STA   L11EB
            STA   proCLOSE1+2
            JSL   GSOS
            DW    $2010       ; Open
            ADRL  L11D7
            BCS   L0B6F
            LDA   L11D9
            STA   proCLOSE2+2
            STA   L11FB
L0B5B       INC   L0C0B
            JSL   GSOS
            DW    $2012       ; Read
            ADRL  L11E9
            BCC   L0B72
            CMP   #$004C
            BEQ   L0B8C
L0B6F       BRL   L0AA2
L0B72       LDA   L11F5
            STA   L1201
            JSL   GSOS
            DW    $2013       ; Write
            ADRL  L11F9
            BCS   L0B6F
            LDA   L0C0B
            JSR   L0D9B
            BRA   L0B5B
L0B8C       JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE1
            JSL   GSOS
            DW    $2014       ; Close
            ADRL  proCLOSE2

            PHD
            LDA   proCREATE+2+2
            PHA
            LDA   proCREATE+2
            PHA
            TSC
            TCD
            LDA   [$01]
            STA   L0C05
            CMP   #$0003
            BCC   L0BF1
            TAY
L0BB6       LDA   [$01],Y
            AND   #$007F
            CMP   #$003A
            BEQ   L0BC6
            DEY
            CPY   #$0003
            BCS   L0BB6
L0BC6       DEY
            DEY
            TYA
            STA   [$01]

            PEA   $800C	; tellFinderAboutChange
            PEA   $0001
            PEA   ^strFINDER
            PEA   strFINDER
            LDA   proCREATE+2+2	; dataIn
            PHA
            LDA   proCREATE+2
            PHA
            PEA   ^dataOutChange	; dataOut
            PEA   dataOutChange
            _SendRequest

            LDA   L0C05
            STA   [$01]
L0BF1       PLA
            PLA
            PLD
            DEC   L1058
            LDA   #$0004
            LDX   fgCRYPT
            BNE   L0C02
            LDA   #$0005
L0C02       BRL   L0AC9

*-----------------------------
* 
*-----------------------------
			
L0C05       DW    $0000

dataOutChange
            DW    $0000	; recvCount
            DW    $0000	; finderResult

L0C0B       DB    $00
            DB    $00
L0C0D       DW    $0000
myBUFFER    DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C1D       DB    $00
            DB    $00
L0C1F       DB    $00
            DB    $00
L0C21       DB    $00
            DB    $00
L0C23       DW    $0000
L0C25       ADRL  $00000000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0C2D       DB    $00
            DB    $00
L0C2F       DS    $E0

*-----------------------------
* 
*-----------------------------
			
L0D0F       LDA   L11C7
            CLC
            ADC   L11CF
            STA   L0D97
            LDA   L11C7+2
            ADC   L11CF+2
            STA   L0D97+2
            PHA
            PHA
            PHA
            PHA
            LDA   L0D97+2
            PHA
            LDA   L0D97
            PHA
            PEA   $0000
            PEA   $0100
            _LongDivide
            PLY
            PLX
            PLA
            PLA
            PEA   $0000
            PHY
            PEA   $0000
            PEA   $0000
            LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            PEA   $0000
            PEA   $0009
            _GetCtlHandleFromID
            PLA
            STA   L0DAC
            PLA
            STA   L0DAC+2
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _SetCtlTitle
            PEA   $0000
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _SetCtlValue
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _ShowControl
            RTS

L0D97       ADRL  $00000000
L0D9B       PHA
            LDA   L0DAC+2
            PHA
            LDA   L0DAC
            PHA
            _SetCtlValue
            RTS

*-----------------------------
			
L0DAC       ADRL  $00000000

*-----------------------------
* CLICK ON LINE EDIT
*-----------------------------
			
doLINEEDIT  LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            PEA   $0000
            PEA   $0005
            PEA   ^L10A0
            PEA   L10A0
            _GetLETextByID
            LDA   L10A0
            AND   #$00FF
            BEQ   L0DF1
            LDA   L105E
            BNE   L0E0B
            PEA   $0000
            LDA   haBUTTON+2
            PHA
            LDA   haBUTTON
            PHA
            _HiliteControl
            LDA   #$FFFF
            STA   L105E
            RTS

L0DF1       LDA   L105E
            BEQ   L0E0B
            PEA   $00FF
            LDA   haBUTTON+2
            PHA
            LDA   haBUTTON
            PHA
            _HiliteControl
            STZ   L105E
L0E0B       RTS

*-----------------------------
* CLICK ON TITLE BAR
*-----------------------------
			
L0E0C       PEA   $0000
            PEA   $0000
            LDA   myPORT+2
            PHA
            LDA   myPORT
            PHA
            PEA   $0000
            PEA   $0066
            _GetCtlHandleFromID
            PLA
            STA   L0E6B
            PLA
            STA   L0E6B+2
            BCS   L0E6A
            LDA   L105C
            BEQ   L0E49
            STZ   L105C
            LDA   L0E6B+2
            PHA
            LDA   L0E6B
            PHA
            _HideControl
            RTS

L0E49       DEC   L105C
            LDA   L0E6B+2
            PHA
            LDA   L0E6B
            PHA
            _ShowControl
            LDA   L0E6B+2
            PHA
            LDA   L0E6B
            PHA
            _DrawOneCtl
L0E6A       RTS

*-----------------------------
			
L0E6B       ADRL  $00000000

*-----------------------------
* CALCULATE KEY
*-----------------------------
			
calcKEY     LDA   L10A0
            AND   #$00FF
            BEQ   L0E8B
            TAY
            XBA
            LDX   #$0001
            SEP   #$20
L0E7E       EOR   L10A0,X
            CLC
            ADC   L10A0,X
            INX
            DEY
            BNE   L0E7E
            REP   #$20
L0E8B       RTS

*-----------------------------
* DRAW THE WINDOW CONTROLS
*-----------------------------
			
DRAWCONTROLS
            PHA
            PHA
            _GetPort
            _DrawControls
            RTL

*-----------------------------
* SHOW THE ERROR
*-----------------------------
			
showERROR   PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   theERROR
            PHA
            _InitCursor
            _ErrorWindow
            PLA
            SEC
            RTS

*-----------------------------
* STARTUP STANDARD FILE
*-----------------------------
			
startupSF   STZ   fgSTDFILE
            STZ   haDP
            STZ   haDP+2
            PHA
            _SFStatus
            PLA
            BCS   L0ED4
            BNE   L0F2B
L0ED4       PEA   $0017	; load Standard File Toolset
            PEA   $0101
            _LoadOneTool
            BCC   L0EEB
L0EE3       STA   theERROR
            JSR   showERROR
            SEC
            RTS

L0EEB       PHA		; we need one direct page
            PHA
            PEA   $0000
            PEA   $0100
            LDA   myID
            PHA
            PEA   $C005
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLX
            PLA
            BCS   L0EE3
            STX   haDP
            STA   haDP+2
            PHD		; dereference it
            PHA
            PHX
            TSC
            TCD
            LDA   [$01]
            TAX
            PLY
            PLY
            PLD
            LDA   appID
            PHA
            PHX
            _SFStartUp	; start the tool set
            INC   fgSTDFILE	; say we're done
L0F2B       CLC
            RTS

*-----------------------------
* SHUT DOWN TOOLSET
*-----------------------------
			
shutdownSF  LDA   fgSTDFILE
            BEQ   L0F5A
            _SFShutDown
            PEA   $0017
            _UnloadOneTool
            LDA   haDP
            ORA   haDP+2
            BEQ   L0F5A
            LDA   haDP+2
            PHA
            LDA   haDP
            PHA
            _DisposeHandle
L0F5A       RTS

*-----------------------------
			
fgSTDFILE   DW    $0000	; 0: not started, <>0: started
haDP        ADRL  $00000000

*-----------------------------
* 
*-----------------------------
			
L0F61       JSR   startupSF
            BCC   L0F72
            RTS

L0F67       STA   theERROR
            JSR   showERROR
            JSR   shutdownSF
            SEC
            RTS

L0F72       PEA   $0078	; coordinates
            PEA   $0028
            PEA   $0000

            LDA   fgCRYPT	; which option?
            BNE   L0F88

            PEA   ^strSAVED	; decrypt
            PEA   strSAVED
            BRA   L0F8E
L0F88       PEA   ^strSAVEE	; encrypt
            PEA   strSAVEE

L0F8E       PEA   $0000	; pointer
            PEA   ^strFILESAVE ; GS/OS class 1 input string
            PEA   strFILESAVE
            PEA   ^replyPTR
            PEA   replyPTR
            _SFPutFile2
            BCS   L0F67	; an error occured
            _WaitCursor
            LDA   replyPTR	; did we cancel?
            BNE   L0FB7	; no
            JSR   shutdownSF	;yes
            SEC
            RTS

L0FB7       LDA   replyPTR+12	; dispose the pathname handle
            PHA
            LDA   replyPTR+10
            PHA
            _DisposeHandle
            LDA   replyPTR+18	; lock the filename handle
            PHA
            LDA   replyPTR+16
            PHA
            _HLock
            LDX   replyPTR+16+2 ; dereference the handle
            LDA   replyPTR+16
            JSR   derefHANDLE
            INC		; +2 b/c GS/OS output string
            INC
            STA   proDESTROY+2
            STA   L11DB
            STA   proCREATE+2
            STX   proDESTROY+4
            STX   L11DB+2
            STX   proCREATE+2+2
            JSR   shutdownSF
            CLC
            RTS

*-----------------------------

            DW    $0000
strSAVED    STR   'Save Descrypted File as:'
strSAVEE    STR   'Save Encrypted File as:'
strFILESAVE STRL  'Untitled'

replyPTR    DW    $0000	;  0
            DW    $0000	;  2
            ADRL  $00000000	;  4
            DW    $0003	;  8 handle to
            ADRL  $00000000	; 10 ...pathname
            DW    $0003	; 14 handle to
            ADRL  $00000000	; 16 ...filename

myFILETYPE  DW    $0000
myAUXTYPE   DW    $0000
myPORT      ADRL  $00000000
savePORT    ADRL  $00000000
theERROR    DW    $0000
fgCRYPT     DW    $0000	; 0: decrypt, -1: encrypt
L1058       DW    $0000
fgCANCEL    DW    $0000
L105C       DW    $0000
L105E       DW    $0000
haBUTTON    ADRL  $00000000
nbICONS     DW    $0000	; number of selected icons
offsetLIST  DW    $0000	; offset in stringList

*-----------------------------
* HEADER IS 58 BYTES
*-----------------------------

headerENCRYPT
            ASC   'ENCRYPTED FILE C'
            ASC   "R"
            ASC   'Y'
            ASC   "P"
            ASC   'T'
L107C       DW    $0000
L107E       ADRL  $00000000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
myKEY       DB    $00
            DB    $00
L1088       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

L10A0       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

*--- dataOut for tellFinderGetSelectedIcons

dataOut     DW    $0000	; recvCount
L10BA       DW    $0000	; finderResult
            ADRL  $00000000	; pointer to window
stringList  ADRL  $00000000	; stringListHandle

stringPtr   ADRL  $00000000
oldSubArray ADRL  $00000000
mySubArray  ADRL  L1163

L10D0       ADRL  strWHAT
L10D4       ADRL  strWHAT
            ADRL  L10A0
strWHAT     STR   '???'
strENCRYPT  STR   'Encrypting '
strDECRYPT  STR   'Decrypting '

strKEY_REMEMBER
            STR   'You must remember the key in order to decrypt this file.'
strKEY_ENTER
            STR   'Enter the key that was used to encrypt this file.'

L1163       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

proCREATE   DW    $0005       ;  0 Parms for Create
            ADRL  $00000000   ;  2 file name
            DW    $00C3       ;  6 access
            DW    $0000       ;  8 file type
            ADRL  $00000000   ; 10 aux type
            DW    $0000       ; 14 storage

proCLOSE1   DW    $0001       ; Parms for Close
            DW    $0000       ;  ref num

proCLOSE2   DW    $0001       ; Parms for Close
            DW    $0000       ;  ref num

L119D       DW    $000E       ; Parms for Open
L119F       DW    $0000       ;  ref num
L11A1       ADRL  $00000000   ;  path name
            DW    $0001       ;  req access
L11A7       DW    $0000       ;  res num
            DW    $0000       ;  access
L11AB       DW    $0000       ;  file type
L11AD       ADRL  $00000000   ;  aux type
L11B1       DW    $0000       ;  storage
            DS    8           ;  creation date
            DS    8           ;  modification date
            ADRL  $00000000   ;  option list
L11C7       ADRL  $00000000   ;  end of file
            ADRL  $00000000   ;  blocks used
L11CF       ADRL  $00000000   ;  resource eof
            DB    $00
            DB    $00
            DB    $00
            DB    $00

L11D7       DW    $0004       ; Parms for Open
L11D9       DW    $0000       ;  ref num
L11DB       ADRL  $00000000   ;  path name
            DW    $0003       ;  req access
L11E1       DW    $0000       ;  res num

proDESTROY  DW    $0001       ; Parms for Destroy
            ADRL  $00000000   ;  file name

L11E9       DW    $0004       ; Parms for Read
L11EB       DW    $0000       ;  ref num
            ADRL  myBUFFER    ;  buffer ptr
L11F1       ADRL  $00000100   ;  request count
L11F5       ADRL  $00000000   ;  transfer count

L11F9       DW    $0004       ; Parms for Write
L11FB       DW    $0000       ;  ref num
            ADRL  myBUFFER    ;  buffer ptr
L1201       ADRL  $00000100   ;  request count
            ADRL  $00000000   ;  transfer count

L1209       DW    $0002       ; Parms for SetPrefix
            DW    $0008       ;  prefix num
L120D       ADRL  $00000000   ;  prefix ptr

eventPtr    DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00


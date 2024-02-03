*
* NTP Player
* v1.0
*
* (c) 2019-2023, Brutal Deluxe Software
*

* v1.0b0 - 20190523
*   I replaced the pei $0a with lda $0a stal ptrSAVE
*   The final version will have them back to shorten code
*
* v1.0b1 - 20190523
*   Everything is in place, must test now
*
* v1.0b2 - 20190524
*   Oops, not finderSaysBeforeOpen MUST go to myREQUEST4, not 3
*   That's what happens when you modify your code from 1994 :-)
*
* v1.0 - 20230318
*   GS/OS string buffer is now bigger
*   We DO NOT have an icon yet
*   Some bugs fixed
*   Better lisibility of the source code
*
* v1.1 - 20240203
*   Removed code for srqGoAway
*

            mx        %00
            rel
            typ       $B6
	dsk       NTPPlayer.l
            lst       off

*----------------------------

            use       4/Locator.Macs
            use       4/Mem.Macs
            use       4/Tool222.Macs
            use       4/Misc.Macs
            use       4/Util.Macs

*----------------------------

ntpTOOL     =	222
ntpVERSION  =	$0100
ntpTYPE     =	$d5
ntpAUXTYPE  =	$08

GSOS        =	$E100A8

result	=	$10
reqCode	=	$0e
dataIn	=	$0a
dataOut	=	$06

*----------------------------

            phb
            phk
            plb

            pha
            _MMStartUp
            pla
            ora	#$0100
            sta	myID

            PushLong	#myBRUTAL
            PushWord	myID
            PushLong	#myREQUEST
            _AcceptRequests

	PushLong	#mySTRING
	PushLong	#0	; myICON
	_ShowBootInfo

            plb
            rtl

*----------------------------
*
*doSRQGOAWAY	ldy	#2
*	lda	#0	; do not remove me from memory
*	sta	[dataOut],y
*	bra	myREQUEST3
*
*----------------------------

myREQUEST   phd
            tsc
            tcd
            lda	reqCode
*	cmp	#3	; srqGoAway
*	beq	doSRQGOAWAY	; nah, I want to stay in memory...
            cmp	#$0101	; finderSaysGoodbye
            beq	doBYE
myREQUEST2  cmp	#$0104	; finderSaysBeforeOpen
            bne	myREQUEST4
            beq	doOPEN

myREQUEST3  lda	#$8000	; call handled
            sta	result

myREQUEST4  pld
            lda	$02,s
            sta	$0c,s
            lda	$01,s
            sta	$0b,s
            ply
            ply
            ply
            ply
            ply
            rtl

*----------------------------

doBYE       ldal      fgTOOL222    ; did I activate the tool?
            beq       doBYE9       ; nope

            _NTPShutDown           ; yes, stop music & tool

            PushWord  #ntpTOOL     ; unload it!
            _UnloadOneTool

doBYE9      lda       #0           ; tool is off
            stal      fgTOOL222

            bra       myREQUEST3   ; call handled

*----------------------------

doOPEN      ldy       #$0016
            lda       [dataIn],y      ; printFlag
            beq       doOPEN2      ; 0 for open
doOPEN1     bra       myREQUEST4

doOPEN2     ldy       #$000a       ; is it a NTP file?
            lda       [$0a],y
            cmp       #ntpTYPE
            bne       doOPEN1
            iny
            iny
            lda       [dataIn],y
            cmp       #ntpAUXTYPE
            bne       doOPEN1

*--- Is tool in memory?

            ldal      fgTOOL222
            bne       doOPEN3      ; yes

            PushWord  #ntpTOOL
            PushWord  #ntpVERSION
            _LoadOneTool
            bcs       doOPEN1

            lda       #1
            stal      fgTOOL222

            ldal      myID
            pha
            _NTPStartUp

*--- Now, copy the GS/OS (STRL) pathname, we need a STR

doOPEN3     lda       dataIn	; save dataIn ptr
            stal      ptrSAVE
            lda       dataIn+2
            stal      ptrSAVE+2

            ldy       #2           ; pathPtr
            lda       [dataIn],y
            tax
            iny
            iny
            lda       [dataIn],y
            sta       dataIn+2
            stx       dataIn

            ldy       #768-2       ; copy path
]lp         tyx
            lda       [dataIn],y
            stal      pathSONG,x
            dey
            dey
            bpl       ]lp

            ldal      pathSONG     ; from STRL to STR
            xba                    ; if path is long...
            stal      pathSONG     ; ...ahem

            ldal      ptrSAVE+2
            sta       dataIn+2
            ldal      ptrSAVE
            sta       dataIn

*--- Now, play the song

            PushLong  #pathSONG2
            _NTPLoadOneMusic
            bcc       doOPEN4
            brl       myREQUEST4   ; error

doOPEN4     PushWord  #0           ; no loop
            _NTPPlayMusic
            brl       myREQUEST3   ; muzak is playing!

*----------------------------

fgTOOL222   ds        2            ; <>0 if tool in mem
myID        ds        2            ; memID

ptrSAVE     ds        4            ; save dataIn ptr
pathSONG    ds        1            ; STRL from GS/OS
pathSONG2   ds        768          ; STR to the NTP tool

*----------------------------

myBRUTAL    str       'BrutalDeluxe~NTPPlayer~'

mySTRING asc 'NTPPlayer             v01.01  by Brutal Deluxe'00

*myICON	dw	$0080 ; Icon type
*	dw	$00C8 ; Icon size
*	dw	$0014 ; Icon height
*	dw	$0014 ; Icon width
*	hex	33333333333333333333 ; Icon image
*	hex	3AAAAAAAAAAAAAAAAA83
*	hex	3A88888888888888A883
*	hex	3A8888888888888AA883
*	hex	3A8811111111111AA883
*	hex	3A88111111111FFAA883
*	hex	3A8811FFFF11111AA883
*	hex	3A88111111111FFAA883
*	hex	3A881FFFF111FFFAA883
*	hex	3A8811111111111AA883
*	hex	3A88EE1111EE111AA883
*	hex	3A886EEEEE6EEEEAA883
*	hex	3A8864EE666666EAA883
*	hex	3A88644EEEEE644AA883
*	hex	3A886646EE64466AA883
*	hex	3A88AAAAAAAAAAAAA883
*	hex	3A8AAAAAAAAAAAAAA883
*	hex	3AA88888888888888883
*	hex	3A888888888888888883
*	hex	33333333333333333333
*	hex	FFFFFFFFFFFFFFFFFFFF ; Icon mask
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF
*	hex	FFFFFFFFFFFFFFFFFFFF


*
* Devices
* Show all connected devices
*
* (c) 2023, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	mx        %00
                rel
	typ       S16
                dsk       devices.l      
                lst       off            

*----------

                use       4/Int.Macs     
                use       4/Locator.Macs 
                use       4/Mem.Macs     
                use       4/Misc.Macs    
                use       4/Text.Macs    
                use       4/Util.Macs    

Debut           =         $00            
GSOS            =         $e100a8        

*----------

dcREMOVE        =         $0004          
dcONLINE        =         $0010          
dcBLOCKDEVICE   =         $0080          

*----------

                phk                      
                plb                      

                tdc                      
                sta       myDP           

                _TLStartUp                 
                pha                      
                _MMStartUp                 
                pla                      
                sta       appID          
                ora       #$0100         
                sta       myID           

                _MTStartUp                 
                _TextStartUp                 
                _IMStartUp                 

                pha                      
                pha                      
                PushLong  #$010000       
                PushWord  myID           
                PushWord  #%11000000_00011100
                PushLong  #0             
                _NewHandle                 
                phd                      
                tsc                      
                tcd                      
                lda       [3]            
                sta       ptrBUFFER      
                ldy       #2             
                lda       [3],y          
                sta       ptrBUFFER+2    
                pld                      
                ply                      
                sty       haBUFFER       
                plx                      
                stx       haBUFFER+2     

*----------

                PushWord  #$00FF         
                PushWord  #$0080         
                _SetInGlobals                 
                PushWord  #$00FF         
                PushWord  #$0080         
                _SetOutGlobals                 
                PushWord  #$00FF         
                PushWord  #$0080         
                _SetErrGlobals                 

                PushWord  #0             
                PushLong  #3             
                _SetInputDevice                 
                PushWord  #0             
                PushLong  #3             
                _SetOutputDevice                 
                PushWord  #0             
                PushLong  #3             
                _SetErrorDevice                 

                PushWord  #0             
                _InitTextDev                 
                PushWord  #1             
                _InitTextDev                 
                PushWord  #2             
                _InitTextDev                 

                PushWord  #$0c           ; home
                _WriteChar                 

*----------------------------
* MAIN MENU
*----------------------------

mainMENU        PushLong  #strMAINMENU   
                _WriteCString                 

	jsr	waitFORKEY
	cmp	#"Q"
	beq	doQUIT
	cmp	#"q"
	beq	doQUIT
	cmp	#"1"
	beq	setALL
	cmp	#"2"
	beq	setBLOCK
	bne	mainMENU

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT          _IMShutDown                 
                _TextShutDown                 
                _MTShutDown                 

                PushWord  myID           
                _DisposeAll                 

                PushWord  appID          
                _MMShutDown                 

                _TLShutDown                 

                jsl       GSOS      
                dw        $2029          
                adrl      proQUIT        

                brk       $bd            

*----------------------------
* HANDLE MENU
*----------------------------

setALL	lda	#$ffff
	bne	showALL
setBLOCK	lda	#dcBLOCKDEVICE

showALL	sta	devMASK
	jsr	pollDEVICES
	jsr	waitFORKEY
	jmp	mainMENU
	
*----------------------------
* POLL DEVICES
*----------------------------
                                         
pollDEVICES     lda	#1             ; start with device 1
                sta	proDINFO+2     

]lp             jsl	GSOS           ; do a DInfo
                dw	$202c          
                adrl	proDINFO       
                bcc	found          

                cmp	#$0011         ; no more devices
                bne	loop           
                rts
   
loop            inc	proDINFO+2     
                bra	]lp       

*---------- Show device

found           lda	proDINFO+8     ; block device
                and	devMASK
                beq	loop           

                jsr	showDEVICEINFO 
                bra	loop           

*--- Sub routines
*
* x - $xxxx - .NAMEOFDEVICE

showDEVICEINFO  lda	proDINFO+2     
                pha                      ; from a word to a string
                pha                      
                pha                      
                _HexIt                   
                PullLong	strDEVID       

                PushLong	#strDEV        ; show the string
                _WriteCString                 

*--- characteristics

                lda	proDINFO+8     
                pha                      ; from a word to a string
                pha                      
                pha                      
                _HexIt                   
                PullLong	strDEVID       

                PushLong	#strDEV        ; show the string
                _WriteCString                 

*--- name
                                         
                lda	devINFO1       ; from a STRL to a STR
                xba                      
                sta	devINFO1       
                                         
                PushLong	#devINFO2      
                _WriteString                 
                                         
                PushWord	  #$0d           
                _WriteChar                 
                rts                      
                                         
*---------- Data
                                         
strDEV          asc	'$'            
strDEVID        asc	'0000 - '00    
                                         
*----------------------------
* TEXT ROUTINES
*----------------------------
                                         
*---------- Wait for a key
                                         
waitFORKEY      PushWord	#0             ; wait for key
                PushWord	#1             ; echo char
                _ReadChar                 
                                         
waitKEY1        lda	1,s            ; check CR
                and	#$ff           ; of typed
                sta	1,s            ; in char
                cmp	#$8d           
                beq	waitKEY9       
                                         
waitKEY8        PushWord	#$0d           ; return
                _WriteChar                 
                                         
waitKEY9        pla                      ; restore entered char
                rts                      
                                         
*----------------------------
* DATA
*----------------------------

*--- Text

strMAINMENU	asc	0d'Show devices'0d
	asc	'(c) 2023, Brutal Deluxe Software'0d
	asc	' 1. Show all devices'0d
	asc	' 2. Show block devices only'0d
	asc	' Q. Quit'0d00

*--- GS/OS

devMASK	dw	dcBLOCKDEVICE  ; default for block devices

proQUIT         dw	2              ; pcount
                ds	4              ; pathname
                ds	2              ; flags
                                         
proDINFO        dw	8              ; Parms for DInfo
                ds	2              ; 02 device num
                adrl	devINFO        ; 04 device name
                ds	2              ; 08 characteristics
                ds	4              ; 0A total blocks
                ds	2              ; 0E slot number
                ds	2              ; 10 unit number
                ds	2              ; 12 version
                ds	2              ; 14 device id
                                         
devINFO         dw	$0032          ; buffer size
devINFO1        db	$00            ; length
devINFO2        db	$00            
devINFO3        ds	$30            ; data

*----------
                                         
appID           ds	2              
myID            ds	2              
                                         
myDP            ds	2              
ptrBUFFER       ds	4              
haBUFFER        ds	4              

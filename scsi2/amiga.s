*
* Amiga
* Copy a HDD
*
* (c) 2026, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	mx	%00
                rel
                lst	off            

*----------

                use	4/Int.Macs     
                use	4/Locator.Macs 
                use	4/Mem.Macs     
                use	4/Misc.Macs    
                use	4/Text.Macs    
                use	4/Util.Macs    

KBD	=	$c000
GSOS	=	$e100a8        

*----------

dcREMOVE	=	$0004          
dcONLINE	=	$0010          
dcBLOCKDEVICE	=	$0080          

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

mainMENU	jsr	pollDEVICES

	PushLong	#strMAINMENU   
	_WriteCString                 

	jsr	waitFORKEY
	cmp	#"Q"
	beq	doQUIT
	cmp	#"q"
	beq	doQUIT
	cmp	#"1"
	bcc	mainMENU
	cmp	#"9"+1
	bcs	mainMENU

	jsr	copyDISK
	jmp	mainMENU

*----------------------------
* QUIT PROGRAM
*----------------------------

doQUIT          _IMShutDown                 
                _TextShutDown                 
                _MTShutDown                 

                PushWord	myID           
                _DisposeAll                 

                PushWord	appID          
                _MMShutDown                 

                _TLShutDown                 

                jsl	GSOS      
                dw	$2029          
                adrl	proQUIT        

                brk	$bd            

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
* COPY DISK
*----------------------------

copyDISK	sec
	sbc	#"0"
	sta	proDREAD+2

	stz	proDREAD+12
	stz	proDREAD+14

	jsl	GSOS	; create
	dw	$2001
	adrl	proCREATE
	jsl	GSOS
	dw	$2010
	adrl	proOPEN
	
	lda	proOPEN+2
	sta	proWRITE+2
	sta	proCLOSE+2
	
copyDISK_LOOP	lda	KBD-1
	bmi	copyDISK_END
	
	jsl	GSOS
	dw	$202f	; DRead
	adrl	proDREAD
	cmp	#$2d	; end of data
	beq	copyDISK_END
	cmp	#$27	; I/O error
	beq	copyDISK_NOTOK
	bne	copyDISK_OK

copyDISK_END	jsl	GSOS
	dw	$2014
	adrl	proCLOSE
	jmp	waitFORKEY

copyDISK_NOTOK	lda	#theEMPTYBUFFER
	bra	copyDISK_DO
copyDISK_OK	lda	#theBUFFER
copyDISK_DO	sta	proWRITE+4

	jsl	GSOS
	dw	$2013
	adrl	proWRITE
	
	inc	proDREAD+12
	bne	copyDISK_LOOP
	inc	proDREAD+14
	bne	copyDISK_LOOP

	lda	proDREAD+14	; unused code
	cmp	#$0001
	bne	copyDISK_LOOP
	lda	proDREAD+12
	cmp	#$A000
	bne	copyDISK_LOOP
	beq	copyDISK_END
		
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

strMAINMENU	asc	0d'> Select disk to copy: '00

*--- GS/OS

devMASK	dw	dcBLOCKDEVICE  ; default for block devices

proCREATE	dw	6	; 00 pcount
	adrl	pFILE	; 02 pathname
	dw	$c3	; 06 access
	dw	$06	; 08 fileType
	ds	4	; 0A auxType
	dw	$01	; 0E storageType
	ds	4	; 10 eof

proDESTROY	dw	1	; 00 pcount
	adrl	pFILE	; 02 pathname

proOPEN	dw	5	; pcount
	ds	2	; ref_num
	adrl	pFILE	; pathname
	ds	2	; request_access
	ds	2	; resource_num
	ds	2	; access

proWRITE	dw	5	; +00 pcount
	ds	2	; +02 ref_num
	adrl	theBUFFER	; +04 data_buffer
	adrl	512	; +08 request_count
	ds	4	; +12 transfer_count
	dw	1	; +16 cache_priority

proCLOSE	dw	1	; pcount
	ds	2	; ref_num

proQUIT         dw	2	; pcount
                ds	4	; pathname
                ds	2	; flags
                                         
proDINFO        dw	8	; Parms for DInfo
                ds	2	; 02 device num
                adrl	devINFO	; 04 device name
                ds	2	; 08 characteristics
                ds	4	; 0A total blocks
                ds	2	; 0E slot number
                ds	2	; 10 unit number
                ds	2	; 12 version
                ds	2	; 14 device id

proDREAD	dw	6	; Parms for DRead
	ds	2	; 02 device num
	adrl	theBUFFER	; 04 buffer
	adrl	512	; 08 request count
	ds	4	; 0C starting block
	dw	512	; 10 block size
	ds	4	; 12 transfer count
                                         
devINFO         dw	$0032	; buffer size
devINFO1        db	$00	; length
devINFO2        db	$00            
devINFO3        ds	$30	; data

pFILE	strl	'/HFS/Amiga.iso'

*----------
                                         
appID           ds	2              
myID            ds	2              
                                         
myDP            ds	2              
ptrBUFFER       ds	4              
haBUFFER        ds	4              

*----------

theEMPTYBUFFER	ds	512,$bd
theBUFFER	ds	512

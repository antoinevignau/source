*
* I'm fEDD up ;-)
*
* (c) 2012-2017, Brutal Deluxe Software
*

*----------------------------

xOPTIONS      =     0
yOPTIONS      =     7

xENDTRK       =     16
yENDTRK       =     9

xSTEP         =     16
ySTEP         =     10

xGUESS        =     16
yGUESS        =     11

xWRITEFDI     =     36
yWRITEFDI     =     8

xWRITENIB     =     36
yWRITENIB     =     9

xWRITENIT     =     36
yWRITENIT     =     10

xRETRY35      =     36
yRETRY35      =     11

xDCCSLOT      =     16
yDCCSLOT      =     14

xTIMEBITS     =     16
yTIMEBITS     =     15

xPOS          =     36
yPOS          =     14

xPOD          =     36
yPOD          =     15

xOVERWRITE    =     16
yOVERWRITE    =     18

xPREFIX       =     16
yPREFIX       =     19

*----------

doOPTIONS     =     *

              jsr   refreshOPT

*----------

mainOPT       ldx   #xCURSOR
              ldy   #yCURSOR
              jsr   tabXY

]lp           jsr   K7
              bcc   ]lp

* and #maskLOWER ; lowercase
              cmp   #keyESC
              bne   notESC

              jsr   saveCONFIG              ; save our config
              jmp   mainMENU

notESC        ldx   #0
]lp           cmp   tblKEYOPT,x
              beq   foundKEYOPT
              inx
              cpx   #tblDOKEYOPT-tblKEYOPT  ; nbCMD
              bcc   ]lp

              jsr   BELL
              jmp   mainOPT

foundKEYOPT   txa
              asl
              tax
              lda   tblDOKEYOPT,x
              sta   foundADROPT+1
              lda   tblDOKEYOPT+1,x
              sta   foundADROPT+2

foundADROPT   jsr   $bdbd
              jmp   mainOPT

*----------

tblKEYOPT     asc   "TSECOBPFWNRX"

tblDOKEYOPT   da    doTRACK,doSTEP,doDCCSLOT,doPOS
              da    doOVERWRITE,doTIMEBITS
              da    doPREFIX
              da    doGUESS
              da    doWRITENIB
              da    doWRITENIT
              da    doRETRY35
              da    doWRITEFDI

*----------

doPREFIX      jsr   menuPREFIX

refreshOPT    =     *
              jsr   HOME
              jsr   showHEADER
              jsr   showOPTIONS
              rts

*----------

doTRACK       lda   ENDTRK
              clc
              adc   #4                      ; default step
              cmp   #maxEND
              bcc   doTRACK1
              beq   doTRACK1

              lda   #dftEND
doTRACK1      sta   ENDTRK
              jsr   shTRACK
              rts

*----------

doSTEP        ldx   STEP
              lda   stepNEXT,x
              sta   STEP
              jsr   shMSTEP
              rts

stepNEXT      hex   0004010002

*----------

doDCCSLOT     ldx   #xDCCSLOT
              ldy   #yDCCSLOT
              jsr   keySLOT
              bcs   doDCC1

              sta   DCCSLOT

doDCC1        jsr   shDCCSLOT
              rts

*----------

doPOS         ldx   #xPOS
              ldy   #yPOS
              jsr   keySLOT
              bcs   doPOD

              sta   POS

doPOD         jsr   shPOS

              ldx   #xPOD
              ldy   #yPOD
              jsr   tabXY

              jsr   RDKEY
              cmp   #"1"
              beq   doPOD1
              cmp   #"2"
              bne   doPODend

doPOD1        and   #driveMASK
              sta   POD

doPODend      jsr   shPOD
              rts

*----------

doTIMEBITS    lda   TIMEBITS
              and   #$02
              bne   doTIME1
              inc   TIMEBITS                ; was 1
              jmp   doTIME2
doTIME1       dec   TIMEBITS                ; was 2

doTIME2       jsr   shTIMEBITS
              rts

*----------

doOVERWRITE   lda   fgOVERWRITE
              eor   #$01
              sta   fgOVERWRITE
              jsr   shOVERWRITE
              rts

*----------

doWRITEFDI    lda   fgWRITEFDI
              eor   #$01
              sta   fgWRITEFDI
              jsr   shWRITEFDI
              rts

*----------

doGUESS       lda   fgGUESS
              eor   #$01
              sta   fgGUESS
              jsr   shGUESS
              rts

*----------

doWRITENIB    lda   fgWRITENIB
              eor   #$01
              sta   fgWRITENIB
              jsr   shWRITENIB
              rts

*----------

doWRITENIT    lda   fgWRITENIT
              eor   #$01
              sta   fgWRITENIT
              jsr   shWRITENIT
              rts

*----------

doRETRY35     lda   fgRETRY35
              eor   #$01
              sta   fgRETRY35
              jsr   shRETRY35
              rts

*----------------------------
* THE INPUT PART
*----------------------------

keySLOT       jsr   tabXY

              jsr   RDKEY
              cmp   #"0"
              bcc   keySLOT1
              cmp   #"7"+1
              bcs   keySLOT1

              and   #slotMASK

              clc
              rts

keySLOT1      sec
              rts

*----------------------------
* THE MENU PART
*----------------------------

shOPTIONS     ldx   #xOPTIONS
              ldy   #yOPTIONS
              jsr   tabXY

              ldx   #>strOPTIONS
              ldy   #<strOPTIONS
              jsr   printCSTR
              rts

*---------- Number of tracks

showOPTIONS   =     *

              jsr   shOPTIONS

              jsr   shPREFIX
              jsr   shWRITEFDI
              jsr   shWRITENIB
              jsr   shWRITENIT
              jsr   shRETRY35
              jsr   shGUESS
              jsr   shOVERWRITE
              jsr   shPOD
              jsr   shPOS
              jsr   shTIMEBITS
              jsr   shDCCSLOT
              jsr   shMSTEP

*---------- Number of tracks

shTRACK       ldx   #xENDTRK
              ldy   #yENDTRK
              jsr   tabXY

              lda   ENDTRK
              lsr
              lsr
              jsr   PRBYTE
              rts

*---------- Step

shMSTEP       ldx   #xSTEP
              ldy   #ySTEP
              jsr   tabXY

              lda   STEP
              lsr
              asl
              tax
              lda   tblMSTEP,x
              tay
              lda   tblMSTEP+1,x
              tax
              jsr   printCSTR
              rts

*---------- Prefix

shPREFIX      ldx   #xPREFIX
              ldy   #yPREFIX
              jsr   tabXY

              ldx   #>ptrPREFIX
              ldy   #<ptrPREFIX
              jsr   printSTR
              rts

*---------- EDD card

shDCCSLOT     ldx   #xDCCSLOT
              ldy   #yDCCSLOT
              jsr   tabXY

              lda   DCCSLOT
              ora   #'0'
              jsr   printCHAR
              rts

*---------- Timebits

shTIMEBITS    ldx   #xTIMEBITS
              ldy   #yTIMEBITS
              jsr   tabXY

              lda   TIMEBITS
              ora   #'0'
              jsr   printCHAR
              rts

*---------- Original slot and drive

shPOS         ldx   #xPOS
              ldy   #yPOS
              jsr   tabXY

              lda   POS
              ora   #'0'
              jsr   printCHAR
              rts

*----------

shPOD         ldx   #xPOD
              ldy   #yPOD
              jsr   tabXY

              lda   POD
              ora   #'0'
              jsr   printCHAR
              rts

*----------

shOVERWRITE   ldx   #xOVERWRITE
              ldy   #yOVERWRITE
              jsr   tabXY

              lda   fgOVERWRITE
shOVER0       beq   shOVER1

              ldx   #>strYES
              ldy   #<strYES
              jmp   shOVER2

shOVER1       ldx   #>strNO
              ldy   #<strNO
shOVER2       jsr   printSTR
              rts

*----------

shGUESS       ldx   #xGUESS
              ldy   #yGUESS
              jsr   tabXY

              lda   fgGUESS
              jmp   shOVER0

*----------

shWRITEFDI    ldx   #xWRITEFDI
              ldy   #yWRITEFDI
              jsr   tabXY

              ldx   #>strEDD
              ldy   #<strEDD

              lda   fgWRITEFDI              ; O EDD
              beq   shWRITEFDI1

              ldx   #>strFDI
              ldy   #<strFDI
shWRITEFDI1   jsr   printSTR
              rts

strEDD        str   'EDD'
strFDI        str   'FDI'

*----------

shWRITENIB    ldx   #xWRITENIB
              ldy   #yWRITENIB
              jsr   tabXY

              lda   fgWRITENIB
              jmp   shOVER0

*----------

shWRITENIT    ldx   #xWRITENIT
              ldy   #yWRITENIT
              jsr   tabXY

              lda   fgWRITENIT
              jmp   shOVER0

*----------

shRETRY35     ldx   #xRETRY35
              ldy   #yRETRY35
              jsr   tabXY

              lda   fgRETRY35
              jmp   shOVER0

*---

strYES        str   'YES'
strNO         str   'NO '

*----------

strOPTIONS    =     *
              asc   '                                        '
              asc   ' ORIGINAL DISKETTE       EiXnPORT AS:'0d
              asc   '    LAST iTnRACK:         iWnRITE .NIB:'0d
              asc   '          iSnTEP:         WRITE .iNnIT:'0d
              asc   '  GUESS iFnORMAT:     iRnETRY 3.5" ERR:'0d
              asc   ''0d
              asc   ' iEnDD CARD            DISK II iCnARD'0d
              asc   '          SLOT:               SLOT:'0d
              asc   '      TIMEiBnITS:              DRIVE:'0d
              asc   ''0d
              asc   ' DESTINATION FOLDER'0d
              asc   '     iOnVERWRITE:'0d
              asc   '        iPnREFIX:'00

*---------------------------
* The read options part
*---------------------------

readCONFIG    =     *

* V2.2 - Globalize the IIgs detection

              sec                           ; are we on a //gs?
              jsr   IDROUTINE
              bcs   readCONFIG1             ; no, exit

              ldal  OS_BOOT                 ; cold P8 boot?
              bne   readCONFIG2             ; no, exit

              ldal  NumBanks
              cmp   #minBANKS               ; 3MB?
              bcc   readCONFIG2             ; no, exit

              lda   #1                      ; We are good!
              sta   fgIIGS
              jmp   readCONFIG2

* V2.3 - Are we running on a //e w/4MB?

readCONFIG1   lda   MACHID
              and   #%10110000              ; //e with 128K or more?
              cmp   #%10110000
              bne   readCONFIG2

              jsr   iieCHECKRAM             ; check amount of RAM

* V2.1 - Always get the boot prefix

readCONFIG2   jsr   PRODOS
              dfb   $c7                     ; it is GET_PREFIX
              da    proSETPFX               ; but use SET_PFX data

              ldx   ptrPREFIX               ; shorten it
]lp           lda   ptrPREFIX,x
              cmp   #keySLASH
              beq   readCONFIG3
              dex
              bpl   ]lp

              inx
readCONFIG3   stx   ptrPREFIX               ; we have the pathname

*--- Now, move it for later

              ldx   #0                      ; save app prefix at $300
]lp           lda   ptrPREFIX,x
              sta   ptrOPTPFX,x
              inx
              bpl   ]lp                     ; only 128 bytes

*---

              jsr   setPREFIX               ; get app prefix

              jsr   PRODOS
              dfb   $c8
              da    proOPTOPEN
              bcs   readCONFIG9

              lda   proOPTOPEN+5
              sta   proOPTREAD+1
              sta   proCLOSE+1

              jsr   PRODOS
              dfb   $ca
              da    proOPTREAD
              bcs   readCONFIG8

              lda   L4000                   ; is this our config file?
              cmp   #$BD                    ; if not, we won't spoil
              bne   readCONFIG8
              lda   L4000+1                 ; our variables!!
              cmp   #$ED
              bne   readCONFIG8

              ldx   #16-1                   ; move data
]lp           lda   L4000,x
              sta   optDATA,x
              dex
              bpl   ]lp

              ldx   #128-1                  ; move the prefix
]lp           lda   L4000+$10,x
              sta   ptrPREFIX,x
              dex
              bpl   ]lp

              jsr   setPREFIX               ; set it

readCONFIG8   jsr   PRODOS                  ; close our file
              dfb   $cc
              da    proCLOSE

readCONFIG9   rts                           ; return

*---------------------------
* The save options part
*---------------------------

saveCONFIG    =     *
              jsr   setOPTPREFIX

              ldx   #16-1                   ; copy filename
]lp           lda   fileOPT,x
              sta   fileP8,x
              dex
              bpl   ]lp

              jsr   PRODOS                  ; create
              dfb   $c0
              da    proCREATE
              bcc   saveCONFIG1

              jsr   PRODOS                  ; file exists
              dfb   $c4
              da    proGETINFO

              lda   proGETINFO+4
              sta   proSETINFO+4
              lda   proGETINFO+5
              sta   proSETINFO+5
              lda   proGETINFO+6
              sta   proSETINFO+6

              jsr   PRODOS                  ; unlock it
              dfb   $c3
              da    proSETINFO

              jsr   PRODOS                  ; destroy
              dfb   $c1
              da    proDESTROY

              jsr   PRODOS                  ; recreate
              dfb   $c0
              da    proCREATE

saveCONFIG1   jsr   PRODOS                  ; open
              dfb   $c8
              da    proOPEN
              bcs   saveCONFIG9

              lda   proOPEN+5               ; move ref_num
              sta   proOPTHDR+1
              sta   proOPTPFX+1
              sta   proCLOSE+1

              jsr   PRODOS                  ; write header
              dfb   $cb
              da    proOPTHDR

              jsr   PRODOS                  ; write the pfx
              dfb   $cb
              da    proOPTPFX

              jsr   PRODOS                  ; write it
              dfb   $cc
              da    proCLOSE

saveCONFIG9   jsr   setPREFIX               ; restore the data prefix
              rts

*---------------------------
* Handle the destination prefix
*---------------------------

setPREFIX     jsr   PRODOS
              dfb   $c6
              da    proSETPFX
              bcc   setPREFIX9

              ldx   #0                      ; restore app prefix at $300
]lp           lda   ptrOPTPFX,x
              sta   ptrPREFIX,x
              inx
              bpl   ]lp                     ; only 128 bytes

setPREFIX9    rts

*---------------------------

setOPTPREFIX  jsr   PRODOS                  ; set the app prefix
              dfb   $c6
              da    proSETOPTPFX
              rts

*---------------------------
*--- MLI data

proOPTOPEN    dfb   $03
              da    fileOPT
              da    ptrBUFFER
              ds    1

proOPTREAD    dfb   $04
              ds    1
              da    L4000
              dw    256                     ; for later!
              ds    2

proOPTHDR     dfb   $04                     ; write header
              ds    1
              da    optDATA
              dw    16
              ds    2

proOPTPFX     dfb   $04                     ; write prefix
              ds    1
              da    ptrPREFIX
              dw    128
              ds    2

proSETOPTPFX  dfb   $01
              da    ptrOPTPFX

fileOPT       str   'CONFIG.IFU'

*----------
* All options that are saved!

* Size of file : 2 + 14 + 128 of prefix at $280 = 144 bytes

* Header 2

optDATA       hex   BD                      ; Brutal Deluxe
              hex   ED                      ; imfEDdup

* Data 16+128

POS           DFB   $06                     ; Original slot
POD           DFB   $01                     ; Original drive
DCCSLOT       DFB   $00                     ; Slot EDD card
STARTTRK      DFB   $00                     ; Track $00
ENDTRK        DFB   $88                     ; Track $22
STEP          DFB   $04                     ; Step  1.0
TIMEBITS      DFB   $02                     ; OR 1

fgGUESS       ds    1                       ; no by default
fgWRITENIB    db    1                       ; yes by default (if EDD present)
fgWRITENIT    db    1                       ; yes by default
fgRETRY35     db    1                       ; yes by default
fgOVERWRITE   ds    1                       ; 0 dont, 1 do
fgWRITEFDI    ds    1                       ; 0 EDD, 1 FDI
              ds    1                       ; room for later

* ds \


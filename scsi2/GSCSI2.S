*
* GSCSI2
* Test our new CD driver
*
* (c) 2018, Brutal Deluxe Software
*

              mx        %00
              rel
              dsk       GSCSI2.l
              lst       off

*----------------------------

              use       4/Locator.Macs
              use       4/Mem.Macs
              use       4/Misc.Macs
              use       4/Util.Macs

GSOS          =         $e100a8

dcREMOVE      =         $0004
dcONLINE      =         $0010
devCDROM      =         $0007

*----------------------------

*---------- Start up

              phk
              plb

              clc
              xce
              rep       #$30

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

              jsr       playNOW
              jsr       waitKEY

*---------- Shut down

              _MTShutDown

              PushWord  myID
              _DisposeAll

              PushWord  appID
              _MMShutDown

              _TLShutDown

              jsl       GSOS
              dw        $2029
              adrl      proQUIT

              brk       $bd            ; because

*---

waitKEY       ldal      $e0bfff
              bpl       waitKEY
              stal      $e0c00f
              rts


*----------------------------
* 202c DInfo
* 202d DStatus
* 202e DControl
* 202f DRead
* 2030 DWrite
* 2036 DRename

playNOW
              lda       #proQUIT
              stal      $300
              lda       #^proQUIT
              stal      $302

              lda       #1
              sta       proDINFO+2

]lp           jsl       GSOS
              dw        $202c
              adrl      proDINFO
              bcc       found

              cmp       #$0011         ; no more devices
              bne       loop
              rts                      ; none, we exit

loop          inc       proDINFO+2
              bra       ]lp

*----------

found         lda       proDINFO+8
              and       #dcREMOVE
              beq       loop

              lda       proDINFO+20
              cmp       #devCDROM
              bne       loop

*--- We have our CDROM

              lda       proDINFO+2
              sta       proREADTOC+2
              sta       proSUB+2
              sta       proHEADER+2    ; for data cd only
              sta       proPLAY10+2
              sta       proPLAY12+2
              sta       proPLAYMSF+2
              sta       proPLAYTR10+2
              sta       proPLAYTR12+2
              sta       proCONTROL+2
              sta       proPAUSE+2
              sta       proRESUME+2

* READ TOC 43

              jsl       GSOS
              dw        $202d
              adrl      proREADTOC
              sta       errCODE

* READ SUB CHANNEL 42

              jsl       GSOS
              dw        $202d
              adrl      proSUB
              sta       errCODE1

* READ HEADER 44

* jsl GSOS
* dw $202d
* adrl proHEADER
* sta errCODE2

* PLAY AUDIO(10) 45

* jsl GSOS
* dw $202e
* adrl proPLAY10
* sta errCODE3
* jsr waitKEY

* PLAY AUDIO(12) A5

* jsl GSOS
* dw $202e
* adrl proPLAY12
* sta errCODE4
* jsr waitKEY

* PLAY AUDIO MSF 47

* jsl GSOS
* dw $202e
* adrl proPLAYMSF
* sta errCODE5
* jsr waitKEY

* PLAY TRACK RELATIVE(10) 49

              jsl       GSOS
              dw        $202e
              adrl      proPLAYTR10
              sta       errCODE6
              jsr       waitKEY

* PLAY TRACK RELATIVE(12) A9

              jsl       GSOS
              dw        $202e
              adrl      proPLAYTR12
              sta       errCODE7
              jsr       waitKEY

* PLAY AUDIO TRACK INDEX 48

              jsl       GSOS
              dw        $202e
              adrl      proCONTROL
              sta       errCODE9

* PAUSE RESUME 4B

* jsr waitKEY

* jsl GSOS
* dw $202e
* adrl proPAUSE
* sta errCODE10

* jsr waitKEY

* jsl GSOS
* dw $202e
* adrl proRESUME
* sta errCODE11

              rts

*----------------------------

*---------- Program

myDP          ds        2
appID         ds        2
myID          ds        2

*---------- GS/OS

              asc       "proQUIT"

proQUIT       dw        2              ; pcount
              ds        4              ; pathname
              ds        2              ; flags

              asc       "errorCODE"

errCODE       ds        2
errCODE1      ds        2
errCODE2      ds        2
errCODE3      ds        2
errCODE4      ds        2
errCODE5      ds        2
errCODE6      ds        2
errCODE7      ds        2
errCODE8      ds        2
errCODE9      ds        2
errCODE10     ds        2
errCODE11     ds        2

              asc       "proDINFO"

proDINFO      dw        8              ; Parms for DInfo
              ds        2              ; 02 device num
              adrl      devINFO        ; 04 device name
              ds        2              ; 08 characteristics
              ds        4              ; 0A total blocks
              ds        2              ; 0E slot number
              ds        2              ; 10 unit number
              ds        2              ; 12 version
              ds        2              ; 14 device id

              asc       "devINFO"

devINFO       dw        $0032          ; buffer size
devNAMEopen   db        $00            ; length
devNAMEopen1  db        $00
devNAMEopen2  ds        $30            ; data

              asc       "proDSTATUS"

proDSTATUS    dw        5              ; 00 pcount
              ds        2              ; 02 device num
              ds        2              ; 04 status code
              adrl      devSTATUS      ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "devSTATUS"

devSTATUS     ds        8

*---

              asc       "proHEADER"

proHEADER     dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $8044          ; 04 status code
              adrl      headerLIST     ; 06 status list
              adrl      1024           ; 0A request count
              ds        4              ; 0E transfer count

              asc       "headerLIST"

headerLIST    ds        2              ; 00
              hex       44             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       00             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       04             ; 7
              hex       00             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      headerBUFF     ; 04
headerBUFF    ds        1024
              ds        8

*---

              asc       "proSUB"

proSUB        dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $8042          ; 04 status code
              adrl      subLIST        ; 06 status list
              adrl      1024           ; 0A request count
              ds        4              ; 0E transfer count

              asc       "subLIST"

subLIST       ds        2              ; 00
              hex       42             ; 0
              hex       00             ; 1
              hex       40             ; 2
              hex       01             ; 3
              hex       00             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       04             ; 7
              hex       00             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      subBUFF        ; 04
subBUFF       ds        1024
              ds        8

*--- PAUSE

              asc       "proPAUSE"

proPAUSE      dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $804b          ; 04 status code
              adrl      pauseLIST      ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "pauseLIST"

pauseLIST     ds        2              ; 00
              hex       4b             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       00             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       00             ; 7
              hex       00             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      pauseBUFF      ; 04
pauseBUFF     ds        1024
              ds        8
*---

              asc       "proRESUME"

proRESUME     dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $804b          ; 04 status code
              adrl      resumeLIST     ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "resumeLIST"

resumeLIST    ds        2              ; 00
              hex       4b             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       00             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       00             ; 7
              hex       01             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      resumeBUFF     ; 04
resumeBUFF    ds        1024
              ds        8

*--- READ TOC

proREADTOC    dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $8043          ; 04 status code
              adrl      readtocLIST    ; 06 status list
              adrl      1024           ; 0A request count
              ds        4              ; 0E transfer count

              asc       "readtocLIST"

readtocLIST   ds        2              ; 00
              hex       43             ; 0
              hex       02             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       00             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       04             ; 7
              hex       00             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      readtocBUFF    ; 04
readtocBUFF   ds        1024
              ds        8

*--- PLAY AUDIO TRACK INDEX

              asc       "proCONTROL"

proCONTROL    dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $8048          ; 04 status code
              adrl      controlLIST    ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "controlLIST"

controlLIST   ds        2              ; 00
commandDATA   hex       48             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       01             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       01             ; 7
              hex       00             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      commandBUFF
commandBUFF   ds        1024
              ds        8

*--- PLAY AUDIO(10)

              asc       "proPLAY10"

proPLAY10     dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $8045          ; 04 status code
              adrl      play10LIST     ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "play10LIST"

play10LIST    ds        2              ; 00
              hex       45             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       30             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       20             ; 7
              hex       00             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      play10BUFF
play10BUFF    ds        1024
              ds        8

*--- PLAY AUDIO(12)

              asc       "proPLAY12"

proPLAY12     dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $80a5          ; 04 status code
              adrl      play12LIST     ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "play12LIST"

play12LIST    ds        2              ; 00
              hex       a5             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       20             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       10             ; 7
              hex       08             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      play12BUFF
play12BUFF    ds        1024
              ds        8

*--- PLAY AUDIO MSF

              asc       "proPLAYMSF"

proPLAYMSF    dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $8047          ; 04 status code
              adrl      playmsfLIST    ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "playmsfLIST"

playmsfLIST   ds        2              ; 00
              hex       47             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       14             ; 3
              hex       15             ; 4
              hex       00             ; 5
              hex       17             ; 6
              hex       16             ; 7
              hex       00             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      playmsfBUFF
playmsfBUFF   ds        1024
              ds        8

*--- PLAY AUDIO TRACK RELATIVE(10)

              asc       "proPLAYTR10"

proPLAYTR10   dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $8049          ; 04 status code
              adrl      playtr10LIST   ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "playtr10LIST"

playtr10LIST  ds        2              ; 00
              hex       49             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       00             ; 4
              hex       08             ; 5
              hex       01             ; 6
              hex       00             ; 7
              hex       10             ; 8
              hex       00             ; 9
              hex       00             ; A
              hex       00             ; B

              adrl      playtr10BUFF
playtr10BUFF  ds        1024
              ds        8

*--- PLAY AUDIO TRACK RELATIVE(12)

              asc       "proPLAYTR12"

proPLAYTR12   dw        5              ; 00 pcount
              ds        2              ; 02 device num
              dw        $80a9          ; 04 status code
              adrl      playtr12LIST   ; 06 status list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "playtr12LIST"

playtr12LIST  ds        2              ; 00
              hex       a9             ; 0
              hex       00             ; 1
              hex       00             ; 2
              hex       00             ; 3
              hex       06             ; 4
              hex       00             ; 5
              hex       00             ; 6
              hex       00             ; 7
              hex       80             ; 8
              hex       00             ; 9
              hex       01             ; A
              hex       00             ; B

              adrl      playtr12BUFF
playtr12BUFF  ds        1024
              ds        8

*---

              asc       "proDCONTROL"

proDCONTROL   dw        5              ; 00 pcount
              ds        2              ; 02 device num
              ds        2              ; 04 control code
              adrl      devCONTROL     ; 06 control list
              ds        4              ; 0A request count
              ds        4              ; 0E transfer count

              asc       "devCONTROL"

devCONTROL    ds        512

*----------


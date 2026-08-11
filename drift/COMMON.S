*
* Krue's music disk
*
* (c) 2011, Brutal Deluxe Software
*

            mx    %11
            lst   off

*
* $0800 : menu.txt
* $0c00 : prodos buffer
* $1000 : main program
* $2000 : hgr
* $4000 : hgr2
* $4000 : music info
* $6000 : icons
* $7000 : musics
*

*-----------------------------
* IIGS / SET SPEED SLOW
*-----------------------------

iigsOFF     =     *

            SEC               ; Are we on a //gs?
            JSR   IDROUTINE
            BCS   iigsOFF99   ; Carry clear = //gs

            LDA   CYAREG      ; Set slow speed
            STA   saveCYAREG  ; Save current speed
            AND   #%01111111  ; Mask bit 7
            STA   CYAREG      ; And force slow speed

            LDA   TBCOLOR     ; Save current screen colors
            STA   saveSCREEN
            LDA   #$F0        ; Set white text on black background
            STA   TBCOLOR

            LDA   CLOCKCTL    ; Save current border color
            STA   saveBORDER
            AND   #$F0        ; Set black background
            STA   CLOCKCTL

iigsOFF99   RTS

*-----------------------------
* IIGS / SET SPEED HIGH
*-----------------------------

iigsON      =     *

            SEC               ; Are we on a //gs?
            JSR   IDROUTINE
            BCS   iigsON99    ; Carry clear = //gs

            LDA   saveCYAREG  ; Restore speed
            STA   CYAREG

            LDA   saveSCREEN  ; Restore text and background color
            STA   TBCOLOR

            LDA   saveBORDER  ; Restore border color
            STA   CLOCKCTL
iigsON99    RTS

*-----------

saveCYAREG  ds    1
saveSCREEN  ds    1
saveBORDER  ds    1


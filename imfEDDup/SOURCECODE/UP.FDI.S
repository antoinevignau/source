*
* I'm fEDD up ;-)
*
* (c) 2012-2017, Brutal Deluxe Software
*

*----------------------------
* Create EDD/FDI file
*----------------------------

createFDI   lda   fgWRITEFDI
            bne   createFDI1

            lda   #fileEDD       ; create the EDD file
            jmp   createFILE     ; error is returned

createFDI1  lda   #fileFDI       ; create a FDI file
            jsr   createFILE
            bcs   createFDI9     ; exit on error

            ldx   #fileFDI       ; set suffix
            lda   tblSUFFIX,x
            sta   dpFROM
            lda   tblSUFFIX+1,x
            sta   dpFROM+1

            lda   #<fdiHEADER    ; set address
            sta   proWRITE+2
            lda   #>fdiHEADER
            sta   proWRITE+3

            lda   #$00           ; length is #$0208
            sta   proWRITE+4
            lda   #$02
            sta   proWRITE+5
            jsr   saveFILE1      ; save header

createFDI9  rts                  ; return

*----------------------------
* Save EDD/FDI file
*----------------------------

saveFDI     lda   fgWRITEFDI
            bne   saveFDI1

            lda   #fileEDD       ; save the EDD file
            jmp   saveFILE       ; error is returned

* First, write the track header

saveFDI1    ldx   #fileFDI       ; set suffix
            lda   tblSUFFIX,x
            sta   dpFROM
            lda   tblSUFFIX+1,x
            sta   dpFROM+1

            lda   #<fdiTHEADER   ; set address
            sta   proWRITE+2
            lda   #>fdiTHEADER
            sta   proWRITE+3

            lda   #8             ; length is #8
            sta   proWRITE+4
            lda   #0
            sta   proWRITE+5
            jsr   saveFILE1      ; save track header

* Now, save the bitstream data

            lda   #fileFDI       ; save a FDI file
            jsr   saveFILE
            bcs   saveFDI9       ; exit on error

* Finally, save the padding data

            ldx   #fileFDI       ; set suffix
            lda   tblSUFFIX,x
            sta   dpFROM
            lda   tblSUFFIX+1,x
            sta   dpFROM+1

            lda   #<fdiPADDING   ; set address
            sta   proWRITE+2
            lda   #>fdiPADDING
            sta   proWRITE+3

            lda   #$f8           ; length is 248 bytes long
            sta   proWRITE+4
            lda   #0
            sta   proWRITE+5
            jsr   saveFILE1      ; save padding

saveFDI9    rts                  ; exit

*----------------------------
* The FDI data
*----------------------------

* The FDI header is 512 bytes long

fdiHEADER   HEX   466F726D6174746564204469736B2049
            HEX   6D6167652066696C650A0D6465666564
            HEX   642C2076657273696F6E20302E306120
            HEX   2020202020202020200A0D1A1A1A1A1A
            HEX   1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            HEX   1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            HEX   1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            HEX   1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
            HEX   1A1A1A1A1A1A1A1A1A1A1A1A0200009F
            HEX   0001AC0005050000D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D241D241D241D241D241D241D241D241
            HEX   D2410000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000

* Each track header is 8 bytes long

fdiTHEADER  HEX   0002000000000000

* The FDI padding is 248 bytes

fdiPADDING  ds    256            ; make it 256 of DOS 3.X support


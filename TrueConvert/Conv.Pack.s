*
* Convert 3200 (GS/OS)
*
* Module: Unpackers, Packers
*
* (c) 1995, Brutal Deluxe
*

*---------------------------------------
* CONSTANTS
*---------------------------------------

maxWIDTH = 1280
maxHEIGHT = 800

dpBUF = $10
dpPIC = $14
dpPAL = $18
dpLIGNES = $1c
dpSCB = $20
dpSCB2 = $24
dpGS = $28 ; Formats GS: SCB, palettes
dpGS2 = $2c ; APF: ScanLineDirectory
dpTHERMO = $30 ; Adresse du thermo

*---------------------------------------
* PICTURES UNPACKING MAIN ROUTINE
*---------------------------------------

 mx %00

doUNPACKERS lda menuOPEN
 dec
 asl
 tax
 lda ptrUNPACKERS,x
 sta doUNPACKERS2+1

 jsr doINIT

doUNPACKERS2 jsr $ffff
 bcs doUNPACKERS3

 jsr setPARAMETERS
 jsr convertPAL
 _errOK
doUNPACKERS3 brl GSOSerror

*---------------------------------------
* PICTURES PACKING MAIN ROUTINE
*---------------------------------------

doPACKERS lda menuSAVE10
 dec
 asl
 tax
 lda ptrPACKERS,x
 sta doPACKERS1+1

doPACKERS1 jsr $ffff
 bcs doPACKERS2
 lda #0
 rts
doPACKERS2 brl GSOSerror

*---------------------------------------
* MEMOIRE
*---------------------------------------

makePIC lda picWIDTH
 beq makePIC0
 cmp #maxWIDTH
 bcc makePIC1
 beq makePIC1
makePIC0 _errSIZE

makePIC1 lda picHEIGHT
 beq makePIC0
 cmp #maxHEIGHT
 bcc makePIC2
 beq makePIC2

 lda #maxHEIGHT
 sta picHEIGHT

makePIC2 pha
 pha
 pha
 pha
 PushWord picWIDTH
 PushWord picHEIGHT
 _Multiply
 PushLong #$010000
 _FixDiv
 pla
 pla
 inc
makePIC3 sta nbankCOL
 lsr
 inc
makePIC4 sta nbankNB

 jsr clearBANKS

 ldy #0 ; demande de bancs couleurs
 tyx
makePIC5 phy
 phx
 jsr makeHANDLE
 plx
 lda ptrADDRESS
 sta dpPIC
 sta bankCOL,x
 lda ptrADDRESS+2
 sta dpPIC+2
 sta bankCOL+2,x
 lda haADDRESS
 sta haCOL,x
 lda haADDRESS+2
 sta haCOL+2,x
 bcc makePIC6
 ply
 _errMEMORY

makePIC6 ldy #0 ; clear memory
 tya
]lp sta [dpPIC],y
 iny
 iny
 bne ]lp

 inx
 inx
 inx
 inx
 ply
 iny
 cpy nbankCOL
 bne makePIC5

 ldy #0 ; demande de bancs n/b
 tyx
makePIC7 phy
 phx
 jsr makeHANDLE
 plx
 lda ptrADDRESS
 sta dpPIC
 sta bankNB,x
 lda ptrADDRESS+2
 sta dpPIC+2
 sta bankNB+2,x
 lda haADDRESS
 sta haNB,x
 lda haADDRESS+2
 sta haNB+2,x
 bcc makePIC8
 ply
 _errMEMORY
makePIC8 inx
 inx
 inx
 inx
 ply
 iny
 cpy nbankNB
 bne makePIC7

 lda #1
 sta fgLOAD

 stz numLIGNE
 stz numCOLONNE
 stz nbankCURRENT

 lda nbankCOL
 sta nbankCOL+2
 lda nbankNB
 sta nbankNB+2

 lda ptrBUFFER
 sta dpBUF
 lda ptrBUFFER+2
 sta dpBUF+2

 lda bankCOL
 sta dpPIC
 lda bankCOL+2
 sta dpPIC+2

 lda ptrLIGNES
 sta dpLIGNES
 lda ptrLIGNES+2
 sta dpLIGNES+2

 jsr calcLINE

 jsr calcTHERMO

 clc
 rts

*--- Demande un bloc de 64ko

makeHANDLE pha
 pha
 PushLong #$10000
 PushWord myID
 PushWord #%11000000_00011100
 PushLong #0
 _NewHandle
 phd
 tsc
 tcd
 ldy #0
 lda [3],y
 sta ptrADDRESS
 ldy #2
 lda [3],y
 sta ptrADDRESS+2
 pld
 pla
 sta haADDRESS
 pla
 sta haADDRESS+2
 rts

*--- Effacement des bancs precedemment reserves

clearBANKS lda fgLOAD
 bne clearBANKS1
 rts

clearBANKS1 ldy #0
 tyx
]lp phy
 phx
 lda haCOL+2,x
 pha
 lda haCOL,x
 pha
 _DisposeHandle
 plx
 inx
 inx
 inx
 inx
 ply
 iny
 cpy nbankCOL+2
 bne ]lp

 ldy #0
 tyx
]lp phy
 phx
 lda haNB+2,x
 pha
 lda haNB,x
 pha
 _DisposeHandle
 plx
 inx
 inx
 inx
 inx
 ply
 iny
 cpy nbankNB+2
 bne ]lp
 rts

*--- Retourne les parametres de l'image

setPARAMETERS lda ptrCODE
 clc
 adc #$0100
 sta Debut
 lda ptrCODE+2
 adc #0
 sta Debut+2

 lda picWIDTH ; largeur de l'image
 sta [Debut]
 inc Debut
 inc Debut
 lda picHEIGHT ; hauteur de l'image
 sta [Debut]
 inc Debut
 inc Debut
 lda fgIMAGE256 ; image 16 palettes ?
 sta [Debut]

 lda ptrCODE ; Les bancs NB
 clc
 adc #$0110
 sta Debut
 lda ptrCODE+2
 adc #0
 sta Debut+2

 ldy #0
 tyx
]lp lda bankNB+2,x
 xba
 sta [Debut]
 inc Debut
 inc Debut
 inx
 inx
 inx
 inx
 iny
 cpy nbankNB
 bne ]lp

 lda ptrCODE ; Data3/Pic16/Pic256/Pic8Bit
 clc
 adc #$0120
 sta Debut
 lda ptrCODE+2
 adc #0
 sta Debut+2

 ldx #0
]lp lda ptrDATA3+2,x
 xba
 sta [Debut]
 inc Debut
 inc Debut
 inx
 inx
 inx
 inx
 cpx #4*4
 bne ]lp
 rts

*--- Calcul des numeros de ligne

calcLINE jsr nextLINE3
]lp jsr nextLINE
 bcc ]lp

 stz numLIGNE
 stz nbankCURRENT

 lda bankCOL
 sta dpPIC
 lda bankCOL+2
 sta dpPIC+2

 lda ptrLIGNES
 sta dpLIGNES
 lda ptrLIGNES+2
 sta dpLIGNES+2
 rts

*--- Calcul de la ligne suivante

nextLINE inc numLIGNE

 lda dpPIC ; address of next line
 clc
 adc picWIDTH
 sta dpPIC
 bcs nextLINE1

 lda dpPIC
 clc
 adc picWIDTH
 bcc nextLINE3
 beq nextLINE3

nextLINE1 lda nbankCURRENT ; cross the bank
 cmp nbankCOL
 bne nextLINE2
 sec
 rts
nextLINE2 inc  ; not the last bank
 sta nbankCURRENT ; get the address of
 asl  ; the next bank
 asl
 tay
 lda bankCOL,y
 sta dpPIC
 lda bankCOL+2,y
 sta dpPIC+2

nextLINE3 lda numLIGNE ; retourne l'adresse de
 cmp picHEIGHT ; la ligne suivante
 bcs nextLINE4 ; mais sur 3 octets
 asl  ; et non 4
 clc
 adc numLIGNE
 tay
 lda dpPIC
 sta [dpLIGNES],y
 iny
 lda dpPIC+1
 sta [dpLIGNES],y
 clc
 rts
nextLINE4 sec
 rts

*--- Avancement du thermometre

calcTHERMO lda fgALL
 beq calcTHERMO1
 rts
calcTHERMO1 jsr showWINDOW

 stz nbTHERMO
 stz cxTHERMO

 lda #$61d8
 sta dpTHERMO
 lda #$0001
 sta dpTHERMO+2

 ldy #40
 ldx picHEIGHT
 cpx #40
 bcs calcTHERMO2

 tya
 txy
 tax

calcTHERMO2 pha
 pha
 pha
 pha
 pea $0000
 phx
 pea $0000
 phy
 _LongDivide
 pla
 sta nbTHERMO+2
 pla
 pla
 pla
 rts

showTHERMO lda fgALL
 beq showTHERMO1
 rts
showTHERMO1 inc nbTHERMO
 lda nbTHERMO
 cmp nbTHERMO+2
 bcs showTHERMO2
 rts

showTHERMO2 phx
 phy
 stz nbTHERMO
 inc cxTHERMO
 ldy cxTHERMO
 cpy #44
 bcs showTHERMO3

 ldx #5
]lp sep #$20
 lda #$22
 sta [dpTHERMO],y
 rep #$20
 tya
 clc
 adc #160
 tay
 dex
 bne ]lp

showTHERMO3 ply
 plx
 rts

*--- Inversion A&B si Motorola

unpSWAP bit TIFFendian
 bpl unpSWAP1
 xba
 sec
 rts
unpSWAP1 clc
 rts

*-- Initialisations d'entree

doINIT lda #320 ; Init d'entree
 sta picWIDTH
 lda #200
 sta picHEIGHT
 lda #256
 sta picCOLORS
 stz APFfg
 stz APFfg3200
 stz fgIMAGE256
 lda #$00 ; Mode 320
 jsr initSCB
 jsr initPALETTE

 lda ptrPIC16
 sta dpGS
 lda ptrPIC16+2
 sta dpGS+2

 lda ptrBUFFER
 sta dpBUF
 lda ptrBUFFER+2
 sta dpBUF+2

 rts

*--- Routines palette

initPALETTE stz indicePALETTE

 lda #pcPALETTE
 sta dpPAL
 lda #^pcPALETTE
 sta dpPAL+2

 ldy #0
 tya
]lp sta [dpPAL],y
 iny
 iny
 cpy #256*3
 bne ]lp
 rts

savePALETTE phy
 ldy indicePALETTE
 cpy #256*3
 bcs savePALETTE1
 sep #$20
 sta [dpPAL],y
 rep #$20
 iny
 sty indicePALETTE
 ply
 clc
 rts
savePALETTE1 ply
 sec
 rts

*--- Conversion de palette

convertPAL ldx #0
]lp lda pcPALETTE,x
 sta pcPALETTE1,x
 inx
 inx
 cpx #256*3
 bne ]lp

 lda ptrPALETTE
 sta dpPAL
 lda ptrPALETTE+2
 sta dpPAL+2

 stz indicePALETTE

 ldy #0 ; Clear dest palette
 tya
]lp sta [dpPAL],y
 iny
 iny
 cpy #256*2
 bne ]lp

 lda menuOPEN ; Si c'est un format GS
 cmp #1 ; alors ne pas faire de
 beq convertPAL1 ; conversion
 cmp #8 ; idem pour le format ST
 beq convertPAL1
 brl convertPAL2

* Palette d'une image GS (sauf le GIF GS: menuOPEN modifie de 1 a 3)
* On doit quand meme creer une palette PC pour le save GS to PC/MAC

convertPAL1 ldx #0
 txy

 sep #$20

]lp lda pcPALETTE+1,x
 and #$0f ; R
 asl
 asl
 asl
 asl
 sta pcPALETTE1,y

 lda pcPALETTE,x ; V
 and #$f0
 sta pcPALETTE1+1,y

 lda pcPALETTE,x ; B
 and #$0f
 asl
 asl
 asl
 asl
 sta pcPALETTE1+2,y
 iny
 iny
 iny
 inx
 inx
 cpx #256*2
 bne ]lp

 rep #$20

 ldy #0
]lp lda pcPALETTE,y
 sta [dpPAL],y
 iny
 iny
 cpy #256*2
 bne ]lp
 clc
 rts

*---

convertPAL2 lda picCOLORS ; Si on a que 2 couleurs
 cmp #2 ; alors pas besoin de
 bne convertPAL3 ; modifier la palette PC

 lda menuOPEN ; Le TIFF a defini les 2 couleurs
 cmp #6 ; N/B pour le 1 bit
 beq convertPAL3

 ldy #2
 lda #$0fff
 sta [dpPAL],y

*----

convertPAL3 lda #$4a4a ; Teste la profondeur en bits
 sta convertPAL5 ; de chaque composante

 ldx #0
]lp lda pcPALETTE,x
 and #$00ff
 cmp #$0040
 bcs convertPAL4
 inx
 cpx #256*3
 bne ]lp

 lda #$eaea
 sta convertPAL5

convertPAL4 lda #0

 sep #$20 ; Divise chaque composante
 ; par 16 ou 4
 ldx #0
]lp lda pcPALETTE,x
 lsr
 lsr
convertPAL5 lsr
 lsr
 sta pcPALETTE,x
 inx
 cpx #256*3
 bne ]lp

 rep #$20

*---

 ldx #0
 txy

]lp lda pcPALETTE,x
 and #$000f
 xba
 pha

 lda pcPALETTE+1,x
 and #$000f
 asl
 asl
 asl
 asl
 ora 1,s
 sta 1,s

 lda pcPALETTE+2,x
 and #$000f
 ora 1,s
 sta 1,s

 pla
 sta [dpPAL],y
 inx
 inx
 inx
 iny
 iny

 inc indicePALETTE
 lda indicePALETTE
 cmp picCOLORS
 bne ]lp
 clc
 rts

*--- Routines de SCB

initSCB ldx ptrSCB+2
 stx dpSCB+2
 ldy ptrSCB
 sty dpSCB

 ldy #0
 sep #$20
]lp sta [dpSCB],y
 iny
 cpy #200
 bne ]lp
 rep #$20
 stz indiceSCB
 rts

*--- Sauve 1 SCB

saveSCB phy
 ldy indiceSCB
 cpy #200
 bcs saveSCB1
 sep #$20
 sta [dpSCB],y
 rep #$20
 iny
 sty indiceSCB
saveSCB1 ply
 rts

*--- Comparaison des palettes et des modes

compareSCB sty dpSCB2
 stx dpSCB2+2

 ldy #0 ; Compare les palettes
 lda [dpSCB2],y ; pour savoir si
 and #%0000_1111 ; on a une image
 sta temp ; de 16 palettes ou non
]lp lda [dpSCB2],y
 and #%0000_1111
 cmp temp
 bne compareSCB1
 iny
 cpy #200
 bne ]lp
 bra compareSCB2 ; Image monopalette

compareSCB1 lda #1 ; Image 16 palettes
 sta fgIMAGE256

compareSCB2 ldy #0 ; Now compare the SCB
 lda [dpSCB2],y
 and #%1000_0000
 sta temp
]lp lda [dpSCB2],y
 and #%1000_0000
 cmp temp
 bne compareSCB4
 iny
 cpy #200
 bne ]lp

 lda APFfg
 bne compareSCB3

 lda temp
 jsr initSCB
 ldy #0
]lp lda [dpSCB2],y
 jsr saveSCB
 iny
 cpy #200
 bne ]lp

compareSCB3 clc
 rts
compareSCB4 _errFORMAT

*--- Routine de modification 3200 couleurs

count3200 sty dpGS
 stx dpGS+2

 lda picHEIGHT
 asl
 asl
 asl
 asl
 asl  ; *32
 sta countLENGTH

 ldx #0
]lp stz zoneTAMPON,x
 inx
 inx
 cpx #4096*2
 bne ]lp

*---

 lda APFfg3200 ; Si APF, ne retourne pas
 bne count3203

 ldy #$0000 ; Retourne les valeurs
count3201 ldx #$000f ; 16 couleurs a empiler
 sty count3202+1
]lp lda [dpGS],y
 pha
 iny
 iny
 dex
 bpl ]lp

count3202 ldy #$0000 ; 16 couleurs a depiler
 ldx #$000f
]lp pla
 sta [dpGS],y
 iny
 iny
 dex
 bpl ]lp
 cpy countLENGTH
 bne count3201

*---

count3203 ldy #0
]lp lda [dpGS],y
 asl
 tax
 inc zoneTAMPON,x
 iny
 iny
 cpy countLENGTH
 bne ]lp

 ldx #0
 txy
]lp lda zoneTAMPON,x
 beq count3204
 txa
 lsr
 sta [dpPAL],y
 tya
 lsr
 sta zoneTAMPON,x
 iny
 iny
 cpy #512
 bcs count3205
count3204 inx
 inx
 cpx #4096*2
 bne ]lp
 tya
 lsr
 sta picCOLORS
 clc
 rts
count3205 _errCOLORS

*--- Format non reconnu

doNOT _errFORMAT

*---------------------------------------
* DATA
*---------------------------------------

*--- Parametres thermometre

nbTHERMO ds 4
cxTHERMO ds 2

*--- Reservation memoire

ptrADDRESS ds 4
haADDRESS ds 4
nbankCOL ds 4
nbankNB ds 4
nbankCURRENT ds 2

bankCOL ds 20*4
haCOL ds 20*4
bankNB ds 10*4
haNB ds 10*4

*---

numLIGNE ds 2
numCOLONNE ds 2
indicePALETTE ds 2
indiceSCB ds 2

*--- Informations sur l'image

picBITS ds 2 ; 1/2/4/8
picPLANES ds 2 ; 1/2/3/4
picCOMPRESS ds 2 ; Type of Compression
picCOLORS ds 2
picWIDTH ds 2
picHEIGHT ds 2

*---

ptrUNPACKERS da unpGS,unpBMP,unpGIF,unpIFF,unpPCX,unpTIFF,unpBIN
 da unpST,unpICON,unpICON,unpMAC

ptrPACKERS da packAPF,packBMP,packPCX,packTIFF,packBIN
 da packRAW

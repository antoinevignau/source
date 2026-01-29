
*-----------------------*
* New Player Soundsmith *
*-----------------------*

* P8 Player.

* (c) FUN & FTA 1989-90.

* Coding : Huibert Aalbers
*          Olivier Goguel.


* Version : 12-MAY-90

                  org   $A000
                  lst   off
                  tr    on
                  xc
                  xc

*-------------------------------

Wave_WBNK         Equ   $030000
Music_File        Equ   $050000

SonREG            Equ   $C03E
SonDATA           Equ   $C03D
SonCTRL           Equ   $C03C


* Constantes
*------------

FREQUENCE         =     $FA
Nb_Track          =     #14
Taille_Inst       =     #12

*-------------------------------

                  jmp   INIT_SOUND           ; Mise en route des interruptions
                                             ; musicales...
                  jmp   PLAY_SOUND           ; Lancement du morceau...
                  jmp   STOP_SOUND           ; Arret de la musique et des interruptions

Performing        dfb   0                    ; Flag permettant l'arret momentanee de
                                             ; la musique si = 0

Music_Loop        dfb   0                    ; Flag permettant @ la musique de
                                             ; boucler infiniment si = 0

PLAY_SOUND        clc
                  xce
                  rep   #$30
                  jsr   Play
                  sec
                  xce
                  sep   #$30
                  rts

STOP_SOUND        =     *

                  sep   #$30
                  ldal  $E100CA
                  and   #%00001111           ; Access to the DOC
                  sta   SonCTRL

                  ldx   #$A0
]loop             txa
                  sta   SonREG
                  lda   #1
                  sta   SonDATA
                  inx
                  cpx   #$C0
                  bne   ]loop

                  lda   #$E1
                  sta   SonREG
                  lda   #62
                  sta   SonDATA
                  rts


INIT_SOUND        clc
                  xce
                  sep   #$30

                  sei

                  lda   #%01100000
                  sta   SonCTRL
                  stz   $C03E
                  stz   $C03F
                  rep   $30

                  Ldx   #0
]loop             stz   Timer,x
                  inx
                  inx
                  cpx   #Last-Timer
                  bcc   ]loop

                  lda   #Wave_WBNK+2
                  sta   $00
                  lda   #^Wave_WBNK+2
                  sta   $02

                  sep   #$20

                  ldy   #0
]ICI              lda   [$00],Y
                  sta   SonDATA
                  iny
                  bne   ]ICI

                  stz   Performing

                  rep   #$30

* d{tournement vecteur *

                  dfb   $A9,$5C,#<SoundIRQrtn
                  stal  $E1002C
                  dfb   $A9,#>SoundIRQrtn,#^SoundIRQrtn
                  stal  $E1002E

                  sep   $30

                  lda   #$00
                  sta   SonCTRL

                  ldy   #0
]loop             lda   Table_Son,Y
                  sta   SonREG
                  lda   Table_Son+1,Y
                  sta   SonDATA
                  iny
                  iny
                  cpy   #7*2
                  bne   ]loop

                  rep   #$30

                  lda   #Music_File+600
                  clc
                  adcl  Music_File+6
                  sta   Effects1+1
                  pha
                  sep   #$20
                  lda   #^Music_File
                  adc   #0
                  sta   Effects1+3
                  rep   #$20
                  pla
                  clc
                  adcl  Music_File+6
                  sta   Effects2+1
                  sep   #$20
                  lda   #^Music_File
                  adc   #0
                  sta   Effects2+3
                  rep   #$20

* Sauve la stereo pour chaque track.

                  lda   #^Music_File
                  sta   $02

                  ldal  Music_File+6
                  asl
                  bcc   no_onemorebank
                  inc   $02
no_onemorebank    clc
                  adcl  Music_File+6
                  adc   #600
                  adc   #Music_File
                  sta   $00
                  lda   $02
                  adc   #0
                  sta   $02

                  ldy   #$1E
]loop             lda   [$00],y
                  sta   StereoTable,y
                  dey
                  dey
                  bpl   ]loop

* Move les parametres des instruments...

                  ldx   #0
                  ldy   #0

                  ldal  Wave_WBNK
                  and   #$00FF
                  sta   InstIndex
]loopaga          pha

                  lda   #6
]loop             pha
                  ldal  Wave_WBNK+$010022,X
                  sta   instdef,Y
                  iny
                  iny
                  inx
                  inx
                  pla
                  dec
                  bne   ]loop

                  txa
                  clc
                  adc   #$5C-12
                  tax

                  pla
                  dec
                  bne   ]loopaga

                  ldy   #0
]loop             ldal  Wave_WBNK+$01005E,x
                  sta   CompactTable,y
                  iny
                  iny
                  inx
                  inx
                  cpy   #32
                  bcc   ]loop

                  sec
                  xce
                  sep   #$30
                  cli
                  rts

                  MX    %00

Play              =     *

                  stz   Timer
                  ldal  Music_File+470
                  and   #%0000000011111111
                  sta   NumberOfBlocks
                  stz   NotePlayed
                  stz   BlockIndex
                  ldal  Music_File+472
                  and   #%0000000011111111
                  asl   a
                  tax
                  lda   BlockTable,x
                  sta   NoteIndex

                  ldal  Music_File+8
                  sta   Tempo

                  ldy   #0
                  ldx   #$2C
]loop             ldal  Music_File,X
                  sta   VolumeTable,Y
                  txa
                  clc
                  adc   #$1E
                  tax
                  iny
                  iny
                  cpy   #30
                  bcc   ]loop

                  sep   #$20
                  lda   #1
                  sta   Performing
                  rep   #$20
                  rts


SoundIRQrtn       =     *
                  sep   #$30

                  phb
                  phk
                  plb

bcleWait          lda   SonCTRL
                  bmi   bcleWait
                  and   #%10011111           ; Disable auto-inc. and access DOC reg.
                  sta   SonCTRL

                  lda   #$E0
                  sta   SonREG               ; On lit le registre d'interruptions
                  lda   SonDATA              ; pour savoir quel osc. a genere
                  lda   SonDATA              ; l'interruption.
                  and   #%01111111
                  sta   SonDATA

                  and   #%00111110
                  lsr   a
                  beq   TimerInterrupt       ; c'est l'interruption 50Hz.

                  clc
                  adc   #$A0
                  sta   SonREG
                  lda   SonDATA
                  lda   SonDATA
                  bit   #%00001000
                  beq   No_Op
                  and   #%11111110
                  sta   SonDATA

No_Op             clc
                  plb
                  rtl

Get_Effects1      =     *
Effects1          ldal  0,x
                  rts

Get_Effects2      =     *
Effects2          ldal  0,x
                  rts

TimerInterrupt    lda   Performing           ; Les interruptions 50Hz etant generees
                  and   #$00FF
                  bne   WeCanPlay            ; en permanance, on utilise Performing
                  jmp   EndInterrupt         ; pour savoir si on doit jouer les notes

WeCanPlay         stz   Temporary            ; compteur contenant le numero du track
                                             ; courant
                  inc   Timer
                  lda   Timer
                  cmp   Tempo                ; on joue les notes lorsque Timer=Tempo
                  beq   PlayTracks

                  jmp   HandleEffects        ; les effets sont mis a jour tous les
                                             ; 1/50 de secondes
PlayTracks        stz   Timer                ; remise a zero du Timer

NewTrack          rep   #$30
                  sep   #$20

                  ldx   NoteIndex
                  ldal  Music_File+600,x     ; Lit la note a jouer

                  rep   #$20

                  and   #%0000000011111111
                  beq   NotValid
                  cmp   #128                 ; Si la note est > 128, c'est une
                  bcs   NotValid             ; commande
                  bra   NoteFound

NotValid          inc   NoteIndex

                  cmp   #129                 ; NXT
                  bne   notNXT

                  lda   #63
                  sta   NotePlayed

                  bra   NotSTP

* Passage au block suivant

notNXT            cmp   #128                 ; STP
                  bne   NotSTP

                  lda   Temporary
                  asl   a
                  tax
                  lda   #0
                  sta   TrueVolumeTbl,x

                  sep   #$20

                  lda   SonCTRL
                  and   #%10011111
                  sta   SonCTRL

                  lda   Temporary
                  asl   a
                  clc
                  adc   #$A2
                  lda   SonREG
                  lda   SonREG
                  and   #%11101111
                  ora   #%00000001
                  sta   SonDATA              ; Stop osc.
                  lda   Temporary
                  asl   a
                  clc
                  adc   #$A3
                  lda   SonREG
                  lda   SonREG
                  and   #%11101111
                  ora   #%00000001
                  sta   SonDATA              ; Stop osc.b

NotSTP            sep   #$20                 ; Pour l'instant, on ne reconnait pas
; d'autres commandes.

                  inc   Temporary            ; On passe au track suivant.
                  lda   Temporary
                  cmp   #Nb_Track
                  beq   NextTrack
                  jmp   NewTrack

NextTrack         rep   #$20

                  jmp   EndPlay

NoteFound         sta   Semitone             ; On sauvegarde la note lue

                  sep   #$20

                  jsr   Get_Effects1
                  ldy   Temporary            ; que l'on doit reutiliser le dernier
                  and   #%11110000           ; sample joue.
                  bne   ThereIsASample
                  lda   SampleTable,y
ThereIsASample    sta   SampleTable,y        ; Sinon, on sauve le numero du sample
                  lsr   a
                  lsr   a
                  lsr   a
                  lsr   a
                  dec   a
                  asl   a
                  tay
                  lda   VolumeTable,y
                  lsr   a
                  sta   VolumeInt

                  rep   #$20

                  jsr   Get_Effects1
                  and   #%0000000000001111
                  bne   NotArpegiatto        ; Si l'effet est 0, c'est peut-etre
                  jsr   Get_Effects2

                  sep   #$20

                  ldy   Temporary            ; On sauve la valeur de l'effet dans
                  sta   ArpegiattoTbl,y      ; une table
                  lda   Semitone             ; On sauve la note de depart qui sera
                  sta   ArpegeToneTbl,y      ; ensuite modifiee par l'effet

                  rep   #$20

                  jmp   NoTempoChange        ; Fin de la preparation de l'Arpegiatto

NotArpegiatto     pha

                  sep   #$20

                  ldy   Temporary            ; Il faut arreter l'effet d'Arpegiatto
                  lda   #0
                  sta   ArpegiattoTbl,y

                  rep   #$20

                  pla

                  cmp   #$03                 ; Effet $3=changement de volume
                  bne   NoVolChange

                  jsr   Get_Effects2
                  and   #%0000000011111111
                  lsr   a
                  sta   VolumeInt

ChangeVol         lda   Semitone
                  bne   NoTempoChange

                  lda   Temporary
                  inc   a
                  asl   a
                  sta   OscNumber

                  sep   #$20

SetAutoInc        lda   SonCTRL
                  bmi   SetAutoInc
                  ora   #%00100000           ; Auto-incrementation
                  and   #%10111111
                  sta   SonCTRL

                  lda   OscNumber
                  clc
                  adc   #$40
                  sta   SonREG
                  lda   VolumeInt
                  sta   SonDATA              ; Volume pair
                  sta   SonDATA              ; Volume impair

                  rep   #$20

                  bra   NoTempoChange

NoVolChange       cmp   #$06                 ; Effet $6=baisse du volume
                  bne   NoVolChange2

                  jsr   Get_Effects2
                  and   #%0000000011111111
                  lsr   a
                  sta   TempInterrupt
                  lda   VolumeInt
                  sec
                  sbc   TempInterrupt
                  bpl   VolOk
                  lda   #0
VolOk             sta   VolumeInt
                  jmp   ChangeVol

NoVolChange2      cmp   #$05                 ; Effet $5=Augmentation du volume
                  bne   NoVolChange3

                  jsr   Get_Effects2
                  and   #%0000000011111111
                  lsr   a
                  clc
                  adc   VolumeInt
                  bvc   VolOk2
                  lda   #$7F
VolOk2            sta   VolumeInt
                  jmp   ChangeVol

NoVolChange3      cmp   #$0F                 ; Effet $F=changement de tempo
                  bne   NoTempoChange
                  jsr   Get_Effects2
                  and   #%0000000000001111
                  sta   Tempo

NoTempoChange     lda   Temporary
                  asl   a
                  tax
                  lda   VolumeInt
                  sta   TrueVolumeTbl,x
                  lda   Semitone
                  bne   PlayIt

                  inc   NoteIndex
                  jmp   NotSTP

PlayIt            lda   Temporary            ; La paire 0-1 d'oscillos etant utilisee
                  inc   a                    ; pour generer les interruptions, le
                  asl   a                    ; track 0 utilise la paire 2-3, etc.
                  sta   OscNumber

                  sep   #$20

                  lda   SonCTRL
                  and   #%10011111
                  sta   SonCTRL

                  lda   OscNumber
                  clc
                  adc   #$A0
                  sta   SonREG
                  lda   SonDATA
                  lda   SonDATA
                  and   #%11110111
                  ora   #%00000001
                  sta   SonDATA              ; Arrete l'oscillateur pair
                  lda   OscNumber
                  clc
                  adc   #$A1
                  sta   SonREG
                  lda   SonDATA
                  lda   SonDATA
                  and   #%11110111
                  ora   #%00000001
                  sta   SonDATA              ; Arrete l'oscillateur impair

                  ldy   Temporary
                  lda   SampleTable,y

                  rep   #$20

                  and   #%0000000011110000
                  lsr   a
                  lsr   a
                  lsr   a
                  lsr   a
                  dec   a
                  cmp   InstIndex
                  bcc   SampleExists
                  jmp   IgnoreSample
SampleExists      asl   a
                  tax
                  lda   InstIndexTable,x     ; Offset du debut de la definition de
SearchingA        tax
                  lda   instdef,x
                  and   #%0000000011111111
                  cmp   Semitone             ; Si Semitone < Topkey on utilise cette
                  bcs   FoundWaveListA       ; WaveList. Sinon, on va essayer la
                  txa                        ; suivante.
                  clc
                  adc   #6
                  bra   SearchingA

FoundWaveListA    stx   IndexInterrupt
                  inx
                  lda   instdef,x            ; On lit la taille et l'adresse de la
                  sta   TempInterrupt        ; wave pour l'osc. pair
                  inx
                  inx
                  lda   instdef,x            ; On lit le mode a utiliser pour l'osc.
                  and   #%0000000011111111   ; pair
                  sta   Temp2Interrupt
                  lda   StereoMode           ; Si StereoMode vaut zero, on utilise
                  beq   StereoOk             ; le Mode de l'osc. pour la stereo.
                  lda   Temp2Interrupt       ; Sinon on utilise la table StereoTable
                  and   #%0000000000001111   ; pour determiner si le son doit sortir
                  sta   Temp2Interrupt       ; a droite ou a gauche.
                  lda   Temporary            ; (0=droite $FFFF=gauche)
                  asl   a
                  tax
                  lda   StereoTable,x
                  beq   StereoOk
                  lda   Temp2Interrupt
                  ora   #%0000000000010000
                  sta   Temp2Interrupt

StereoOk          lda   IndexInterrupt       ; On cherche une WaveList commencant
SearchEndOfA      tax                        ; par $7F. La premiere WaveList pour
                  lda   instdef,x            ; l'oscillo B commence 6 bytes plus
                  and   #%0000000011111111   ; loin.
                  cmp   #$7F
                  beq   FoundEndOfA
                  txa
                  clc
                  adc   #6
                  bra   SearchEndOfA

FoundEndOfA       txa
                  clc
                  adc   #6

SearchingB        tax                        ; Memes manoeuvres pour l'osc. B
                  lda   instdef,x
                  and   #%0000000011111111
                  cmp   Semitone
                  bcs   FoundWaveListB
                  txa
                  clc
                  adc   #6
                  bra   SearchingB

FoundWaveListB    inx
                  lda   instdef,x
                  sta   Temp3Interrupt
                  inx
                  inx
                  lda   instdef,x
                  and   #%0000000011111111
                  sta   Temp4Interrupt
                  lda   StereoMode
                  beq   StereoOk2
                  lda   Temp4Interrupt
                  and   #%0000000000001111
                  sta   Temp4Interrupt
                  lda   Temporary
                  asl   a
                  tax
                  lda   StereoTable,x
                  beq   StereoOk2
                  lda   Temp4Interrupt
                  ora   #%0000000000010000
                  sta   Temp4Interrupt

StereoOk2         lda   Semitone             ; On convertit un semitone en une
                  asl   a                    ; frequence comprehensible pour le
                  tax                        ; DOC.
                  lda   FreqTable,x
                  jsr   Calc_Freq
                  sta   TempFreqInt
                  lda   #0

                  sep   #$20

bcleWait2         lda   SonCTRL
                  bmi   bcleWait2
                  ora   #%00100000           ; Auto-incrementation
                  and   #%10111111
                  sta   SonCTRL

                  lda   OscNumber
                  sta   SonREG
                  lda   TempFreqInt
                  sta   SonDATA              ; Frequency low pair
                  sta   SonDATA              ; Frequency low impair
                  lda   OscNumber
                  clc
                  adc   #$20
                  sta   SonREG
                  lda   TempFreqInt+1
                  sta   SonDATA              ; Frequency high pair
                  sta   SonDATA              ; Frequency high impair
                  lda   OscNumber
                  clc
                  adc   #$40
                  sta   SonREG
                  ldy   VolumeInt
                  lda   VolumeConversion,y
                  sta   SonDATA              ; Volume pair
                  sta   SonDATA              ; Volume impair
                  lda   OscNumber
                  clc
                  adc   #$80
                  sta   SonREG
                  lda   TempInterrupt
                  sta   SonDATA              ; Wave Adress pair
                  lda   Temp3Interrupt
                  sta   SonDATA              ; Wave Adress impair
                  lda   OscNumber
                  clc
                  adc   #$C0
                  sta   SonREG
                  lda   TempInterrupt+1
                  sta   SonDATA              ; Wave Size pair
                  lda   Temp3Interrupt+1
                  sta   SonDATA              ; Wave Size impair
                  lda   OscNumber
                  clc
                  adc   #$A0
                  sta   SonREG
                  lda   Temp2Interrupt
                  sta   SonDATA              ; Control register pair
                  lda   Temp4Interrupt
                  sta   SonDATA              ; Control register impair

IgnoreSample      rep   #$20

                  inc   NoteIndex            ; C'est fini, on passe au track
                  inc   Temporary            ; suivant...
                  lda   Temporary
                  cmp   #Nb_Track
                  beq   EndPlay

                  sep   #$20

                  jmp   NewTrack

                  MX    %00

EndPlay           =     *

                  inc   NotePlayed           ; Si la position de la ligne jouee
                  lda   NotePlayed           ; vaut 64, on doit lire un nouveau
                  cmp   #64                  ; block
                  bne   EndInterrupt
                  stz   NotePlayed
                  inc   BlockIndex           ; On verifie si on n'a pas fini
                  ldx   BlockIndex
                  cpx   NumberOfBlocks
                  beq   Finished
                  ldal  Music_File+472,x     ; Sinon, on cherche le numero du
                  and   #%0000000011111111   ; block a jouer
                  asl   a
                  tax
                  lda   BlockTable,x         ; et on actualise NoteIndex en fonction
                  sta   NoteIndex            ; du block a jouer.
                  bra   EndInterrupt

Finished          =     *

                  lda   Music_Loop
                  and   #$00FF
                  bne   Stop_Music

                  jsr   Play
                  bra   EndInterrupt

Stop_Music        =     *

                  sep   #$30

                  stz   Performing

EndInterrupt      =     *

                  clc
                  plb
                  rtl

HandleEffects     sep   #$30                 ; Gestion des effets

                  stz   Temporary
bcleHandleArp     lda   Temporary
                  asl   a
                  tax
                  lda   TrueVolumeTbl,x
                  cmp   #3
                  bcc   Set0
                  sec
                  sbc   #3
                  bra   TrueVolOk
Set0              lda   #0
TrueVolOk         sta   TrueVolumeTbl,x

                  ldy   Temporary
                  lda   ArpegiattoTbl,y
                  bne   ThereIsAnArp
                  jmp   NoArpegiatto

ThereIsAnArp      lda   Timer                ; On calcule Timer modulo 6
                  cmp   #6
TryAgain          bcc   StartArp
                  sec
                  sbc   #6
                  bra   TryAgain

StartArp          cmp   #1                   ; l'arpegiatto fait varier la
                  beq   Stage1               ; frequence de la note en fonction
                  cmp   #4                   ; du temps.
                  beq   Stage1               ; Lorsque Timer=1 ou 4 on ajoute le
                  cmp   #2                   ; premier nibble de la valeur de l'effet
                  beq   Stage2               ; a la note jouee
                  cmp   #5                   ; Lorsque Timer=2 ou 5 on ajoute le
                  beq   Stage2               ; second nibble de la valeur de l'effet
                                             ; a la note jouee.
Stage3            lda   ArpegiattoTbl,y      ; Lorsque Timer=3 ou soustrait la somme
                  and   #%00001111           ; du premier et du second nibble de la
                  sta   TempInterrupt        ; valeur de l'effet a la note jouee.
                  lda   ArpegiattoTbl,y
                  lsr   a
                  lsr   a
                  lsr   a
                  lsr   a
                  clc
                  adc   TempInterrupt
                  sta   TempInterrupt
                  lda   ArpegeToneTbl,y
                  sec
                  sbc   TempInterrupt
                  sta   ArpegeToneTbl,y
                  bra   ModifieFreq

Stage1            lda   ArpegiattoTbl,y
                  lsr   a
                  lsr   a
                  lsr   a
                  lsr   a
                  clc
                  adc   ArpegeToneTbl,y
                  sta   ArpegeToneTbl,y
                  bra   ModifieFreq

Stage2            lda   ArpegiattoTbl,y
                  and   #%00001111
                  clc
                  adc   ArpegeToneTbl,y
                  sta   ArpegeToneTbl,y

ModifieFreq       rep   #$20

                  and   #%0000000011111111   ; On calcule la nouvelle frequence
                  asl   a
                  tax
                  lda   FreqTable,x
                  jsr   Calc_Freq
                  sta   TempFreqInt

                  sep   #$20

                  lda   Temporary
                  inc   a
                  asl   a
                  sta   OscNumber
bcleWait3         lda   SonCTRL              ; et on modifie les Frequency registers
                  bmi   bcleWait3
                  ora   #%00100000
                  and   #%10111111
                  sta   SonCTRL

                  lda   OscNumber
                  sta   SonREG
                  lda   TempFreqInt
                  sta   SonDATA              ; Frequency low pair
                  sta   SonDATA              ; Frequency low impair
                  lda   OscNumber
                  clc
                  adc   #$20
                  sta   SonREG
                  lda   TempFreqInt+1
                  sta   SonDATA              ; Frequency high pair
                  sta   SonDATA              ; Frequency high impair

NoArpegiatto      inc   Temporary
                  lda   Temporary
                  cmp   #Nb_Track
                  beq   Fini
                  jmp   bcleHandleArp

Fini              =     *

                  clc
                  plb
                  rtl

                  mx    %00
Calc_Freq         php
                  rep   #$30
                  pha
                  lda   Temporary
                  and   #$00FF
                  asl
                  tay
                  lda   CompactTable,y
                  tay
                  pla
                  cpy   #0
                  beq   End_Lsr
]loop             lsr
                  dey
                  bne   ]loop
End_Lsr           plp
                  rts

BlockTable        =     *
]A                =     0

                  lup   50
                  da    Nb_Track*64*]A
]A                =     ]A+1
                  --^

StereoMode        da    $FFFF

InstIndexTable    =     *

]A                =     0
                  lup   15
                  da    Taille_Inst*]A
]A                =     ]A+1
                  --^

VolumeConversion  dfb   0,2,4,5,6,7,9,$A,$C,$D,$F,$10,$12,$13,$15
                  dfb   $16,$18,$19,$1B,$1C,$1E,$1F,$21,$22,$24,$25
                  dfb   $27,$28,$2A,$2B,$2D,$2E,$30,$31,$33,$34,$36
                  dfb   $37,$39,$3A,$3C,$3D,$3F,$40,$42,$43,$45,$46
                  dfb   $48,$49,$4B,$4C,$4E,$4F,$51,$52,$54,$55,$57
                  dfb   $58,$5A,$5B,$5D,$5E,$60,$61,$63,$64,$66,$67
                  dfb   $69,$6A,$6C,$6D,$6F,$70,$72,$73,$75,$76,$78
                  dfb   $79,$7B,$7C,$7E,$7F,$81,$82,$84,$85,$87,$88
                  dfb   $8A,$8B,$8D,$8E,$90,$91,$93,$94,$96,$97,$99
                  dfb   $9A,$9C,$9D,$9F,$A0,$A2,$A3,$A5,$A6,$A8,$A9
                  dfb   $AB,$AC,$AE,$AF,$B1,$B2,$B4,$B5,$B7,$B8,$BA
                  dfb   $BB,$BD,$BE,$C0,$C0

FreqTable         da    $00,$16,$17,$18,$1A,$1B,$1D,$1E,$20,$22,$24,$26  ; Octave 0
                  da    $29,$2B,$2E,$31,$33,$36,$3A,$3D,$41,$45,$49,$4D  ; Octave 1
                  da    $52,$56,$5C,$61,$67,$6D,$73,$7A,$81,$89,$91,$9A  ; Octave 2
                  da    $0A3,$0AD,$0B7,$0C2,$0CE,$0D9,$0E6,$0F4,$102,$112,$122,$133  ; Octave 3
                  da    $146,$15A,$16F,$184,$19B,$1B4,$1CE,$1E9,$206,$225,$246,$269  ; Octave 4
                  da    $28D,$2B4,$2DD,$309,$337,$368,$39C,$3D3,$40D,$44A,$48C,$4D1  ; Octave 5
                  da    $51A,$568,$5BA,$611,$66E,$6D0,$737,$7A5,$81A,$895,$918,$9A2  ; Octave 6
                  da    $A35,$AD0,$B75,$C23,$CDC,$D9F,$E6F,$F4B,$1033,$112A,$122F,$1344  ; Octave 7
                  da    $1469,$15A0,$16E9,$1846,$19B7,$1B3F
                  da    $1CDE,$1E95,$2066,$2254,$245E,2688  ; Octave 8

Table_Son         dfb   $00,<FREQUENCE
                  dfb   $20,>FREQUENCE
                  dfb   $40,0                ; Volume
                  dfb   $80,0                ; RamSon
                  dfb   $C0,0                ; Taille
                  dfb   $E1,$3C
                  dfb   $A0,$08              ; Mode FreeRun

Timer             =     *
NumberOfBlocks    =     *+2
NotePlayed        =     *+4
BlockIndex        =     *+6
NoteIndex         =     *+8
PositionBlock     =     *+10
Tempo             =     *+12
VolumeInt         =     *+14
InstIndex         =     *+16

SampleTable       =     *+18
ArpegiattoTbl     =     Nb_Track+*+18
ArpegeToneTbl     =     Nb_Track*2+*+18
TrueVolumeTbl     =     Nb_Track*3+*+18

OscNumber         =     Nb_Track*5+*+18
Temporary         =     Nb_Track*5+*+20
Semitone          =     Nb_Track*5+*+22
TempInterrupt     =     Nb_Track*5+*+24
Temp2Interrupt    =     Nb_Track*5+*+26
Temp3Interrupt    =     Nb_Track*5+*+28
Temp4Interrupt    =     Nb_Track*5+*+30
TempFreqInt       =     Nb_Track*5+*+32
IndexInterrupt    =     Nb_Track*5+*+34

VolumeTable       =     Nb_Track*5+*+36
StereoTable       =     Nb_Track*5+*+36+32
CompactTable      =     Nb_Track*5+*+36+64
instdef           =     Nb_Track*5+*+36+96
Last              =     16*12+instdef


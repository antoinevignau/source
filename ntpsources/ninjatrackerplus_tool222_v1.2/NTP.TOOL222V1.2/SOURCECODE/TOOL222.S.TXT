*
* Tool222 - NinjaTrackerPlus
* by Ninjaforce, 2018-2021
* Visit ninjaforce.com
*
* by FTA & ESP, 1990
* See disclaimer below
* Visit freetoolsassociation.com
*
* Toolified by Brutal Deluxe Software, 2018-2021
* Visit brutaldeluxe.fr
*
* v1 - Sep/2018
* v1.1 - Jan/2020
* v1.2 - Apr/2021
*

	lst	off
	rel
	typ	$BA
	dsk	Tool222.l

	use	4/Mem.Macs
	use	4/Util.Macs
	
*------------------------------------------------- Tool222

Version	=	$0102
HTool	=	$DE00

	Dum	$C
Wave_Ptr	ds	4
Music_Ptr	ds	4
Buf_Ptr	ds	4
BatchPos	ds	2
ListPlay_Ptr	ds	4
ListPlay_Pos	ds	2
Music_Hdl	ds	4
BatchList	ds	2
	Dend

SonREG	=	$E1C03E
SonDATA	=	$E1C03D
SonCTRL	=	$E1C03C

*-------------------------------------------------

Max_Batch Equ  26

Err_AlreadyInit	=	HTool+$1
Err_STNotInit		=	HTool+$2
Err_NoMusInMem		=	HTool+$3
Err_BadMusic		=	HTool+$4
Err_STMusicExist	=	HTool+$5
Err_STBatchNumber	=	HTool+$6
Err_STNoBatchMusic	=	HTool+$7
Err_BadPlayList	=	HTool+$8
Err_BadWave		=	HTool+$9

*-------------------------------------------------

_STErr   MAC
         bcc   No_Err
         brl   STDeath
No_Err   <<<

*-------------------------------------------------

STCallTable adrl STEndTable-STCallTable/4

         adrl  STBootInit-1	; 1
         adrl  STStartUp-1	; 2
         adrl  STShutDown-1	; 3
         adrl  STVersion-1	; 4
         adrl  STReset-1	; 5
         adrl  STStatus-1	; 6
         adrl  STReset-1	; 7
         adrl  STReset-1	; 8

         adrl  STLoadOneMusic-1 ; $09
         adrl  STPlayMusic-1 ; $0A
         adrl  STStopMusic-1 ; $0B
         adrl  STGetEndOfMusic-1 ; $0C
         adrl  STAddToBatch-1 ; $0D
         adrl  STSelectBatch-1 ; $0E
         adrl  STKillBatch-1 ; $0F
         adrl  STGetPlayingMusic-1 ; $10
         adrl  STPlayBatch-1 ; $11
         adrl  STGetTrackVU-1 ; $12
         adrl  STPauseMusic-1 ; $13
         adrl  STContinueMusic-1 ; $14

*-------------------------------------------------

STEndTable
         asc "-* NinjaTrackerPlus Tool *- "
         asc   "-* (c) Ninjaforce, 2018-2021 *- "
         asc   "-* (c) FTA, 1990 *- "
         asc   "-* (c) 1990, ToolBox-Mag *-"
         asc   "-* v1.2, Brutal Deluxe Software, Apr-2021 *-",00

*-------------------------------------------------

         mx    %00

STDeath
         pha
         pea   ^Death_Msg
         pea   Death_Msg
         ldx   #$1503
         jsl   $E10000
Death_Msg str  'NinjaTrackerPlus Tool Error : $'

*------------------------------------------------- OK

STReset
STBootInit 
         lda   #$FFFF	; AV 201506 was #$FFF
         stal  Current_Music
         lda   #0
         stal  ST_OpenFlag	; Outil Ferme
         stal  OldPerforming
         stal  playing	; AV 201809
         clc
         rtl

*------------------------------------------------- OK

STPauseMusic
         ldal  playing
         beq   No_SaveSoundRegister
         stal  OldPerforming
         
         lda   #0
         stal  playing

         php
         sep   $30
         sei

]lp      ldal  SonCTRL
         bmi   ]lp
         ldal  $E100CA
         and   #$0F
         stal  SonCTRL

         ldx   #0
]loop    txa
         clc
         adc   #$A0
         stal  SonREG
         ldal  SonDATA
         ldal  SonDATA
         stal  SoundRegisters,X ; Sauvegarde les
         txa
         clc
         adc   #$A1
         stal  SonREG
         ldal  SonDATA
         ldal  SonDATA
         stal  SoundRegisters+1,X

         ldy   #2         ; 2fois pour arreter
]lp      txa              ; les sons qui bouclent
         clc
         adc   #$A0
         stal  SonREG
         lda   #%0000_0001 ; Arret de l'oscillo
         stal  SonDATA    ; en mode free run...
         txa
         clc
         adc   #$A1
         stal  SonREG
         lda   #%0000_0001
         stal  SonDATA
         dey
         bne   ]lp

         inx
         inx
         cpx   #32
         bne   ]loop

         plp

         lda   #0	; v1.1.3
No_SaveSoundRegister
         clc
         rtl

SoundRegisters ds 32

*------------------------------------------------- OK

         mx    %00
	 
STContinueMusic
         lda #0
OldPerforming = *-2
         beq   DontModifyPerforming
         stal  playing

         lda   #0
         stal  OldPerforming

         php

         sep   $30
         sei

]lp      ldal  SonCTRL
         bmi   ]lp

         ldal  $E100CA
         and   #$0F
         stal  SonCTRL

         ldx   #0
]lp      txa
         clc
         adc   #$A0
         stal  SonREG
         ldal  SoundRegisters,X
         stal  SonDATA
         inx
         cpx   #32
         bne   ]lp

         plp

         lda   #0	; v1.1.3
DontModifyPerforming
         clc
         rtl

*------------------------------------------------- OK

         mx    %00

STStartUp 
         lda   7,S        ; Prend UserId
         stal  UserId
         lda   5,S
         sta   7,S
         lda   3,S
         sta   5,S
         lda   1,S
         sta   3,S
         pla
         lda   #0
ST_OpenFlag =  *-2
         beq   NotYet
         lda   #Err_AlreadyInit
         sec
         rtl

NotYet   phb
         phd
         sei
         phk
         plb

         pha
         pha
         pea   $0000
         pea   $0100      ; Une Page Zero
         lda   UserId
         pha
         pea   $C001
         pea   $0000
         pea   $0000
         _NewHandle
         _STErr
         pla
         pla
         tsc
         sec
         sbc   #4
         tcs
         inc
         tcd
         lda   [$00]
         sta   ST_ZPage
         lda   $00
         sta   ZPage_Hdl
         lda   $02
         sta   ZPage_Hdl2
         tsc
         clc
         adc   #4
         tcs
         lda   #0
ST_ZPage =     *-2
         tcd
         ldx   #$100-2
]lp      stz   $00,x
         dex
         dex
         bpl   ]lp

         lda   #1
         sta   ST_OpenFlag ; InitFlag
         lda   #$FFFF
         sta   Current_Music

         lda   #0
StartupErr
         pld
         plb
         cli
         cmp   #1
         rtl

*-------------------------------------------------

         mx    %00

STShutDown
         phb
         phd
         php
         sei
         phk
         plb

         lda   ST_OpenFlag
         beq   NotInit

         lda   ST_ZPage
         tcd

         ldal  Current_Music
         cmp   #$FFFF
         beq   ShutStop

         jsl   StopMusic	; v1.1.3 - instead of JSR

ShutStop
         jsr   Dispose_OneMusic
         jsr   Dispose_BatchMusic

         pea   #0
ZPage_Hdl2 =   *-2
         pea   #0
ZPage_Hdl =    *-2
         _DisposeHandle
         _STErr

NotInit  jsl   STReset	; AV 201506

* v1.1.3 - STReset returns wih A=0

         plp
         pld
         plb
         clc
         rtl

UserId   ds    2

*------------------------------------------------- OK

         mx    %00

STVersion
         lda   #Version
         sta   7,S
         lda   #0
         clc
         rtl

*------------------------------------------------- OK

         mx    %00

STStatus
         ldal  ST_OpenFlag
         sta   7,S
         lda   #0
         clc
         rtl

*------------------------------------------------- OK

         mx    %00

STGetTrackVU
         lda   #vu_data
         sta   7,s
         lda   #^vu_data
         sta   9,s
         
         lda   #0	; v1.1.3
         clc
         rtl

*------------------------------------------------- OK

         mx    %00

STStopMusic
         ldal  ST_OpenFlag
         beq   No_Init0

         ldal  Current_Music
         cmp   #$FFFF
         beq   DontStop

         jsl   StopMusic	; v1.1.3 - prefer JSL

         phd
         ldal  ST_ZPage
         tcd
         stz   ListPlay_Ptr
         stz   ListPlay_Ptr+2
         pld
DontStop
         lda   #0	; v1.1.3
No_Init0 clc
         rtl

*------------------------------------------------- OK

         mx    %00

StopMusic
         php
         sei
         rep   $30

         jsl   stop
         
         lda   #0
         stal  OldPerforming
         lda   #$FFFF
         stal  Current_Music

         plp
         clc
         rtl	; v1.1.3 - instead of RTS

         mx    %00

*------------------------------------------------- OK

         mx    %00

STGetEndOfMusic
         ldx   #-1
         ldal  playing
         beq   MusicStop
         inx
MusicStop
         txa
         sta   7,s
         lda   #0
         clc
         rtl

*------------------------------------------------- OK

         mx    %00

STGetPlayingMusic
         lda #0
Current_Music = *-2
         sta   7,s
         lda   #0
         clc
         rtl

*------------------------------------------------- OK

         mx    %00

STAddToBatch
         phb
         phk
         plb
         phd
         lda   ST_ZPage
         tcd
         lda   ST_OpenFlag
         bne   Al4
         lda   #Err_STNotInit
         bra   Batch_Return

Music_Still_Exist
         lda   #Err_STMusicExist
         bra   Batch_Return
Bad_BatchNumber
         lda   #Err_STBatchNumber
         bra   Batch_Return

Al4      lda   10,S
         beq   Bad_BatchNumber
         cmp   #Max_Batch
         bcs   Bad_BatchNumber

         dec
         asl
         asl
         asl
         sta   BatchPos
         tax
         lda   BatchList,x ; Sauvegarde Hdl
         ora   BatchList+2,x
         ora   BatchList+4,x
         ora   BatchList+6,x
         bne   Music_Still_Exist

         lda   14,S       ; Music_Path
         tax
         lda   12,S
         jsr   ReadFile
         bcs   Batch_Return

         ldx   BatchPos
         lda   $00
         sta   BatchList,x
         lda   $02
         sta   BatchList+2,x

         lda   #0
Batch_Return
         tax
         pld
         plb
         lda   5,S
         sta   11,S
         lda   3,S
         sta   9,S
         lda   1,S
         sta   7,S
         pla
         pla
         pla
         txa
         cmp   #1
         rtl

*------------------------------------------------- OK

         mx    %00

STKillBatch
         phb
         phk
         plb
         phd
         lda   ST_ZPage
         tcd

         lda   ST_OpenFlag
         bne   Al6
         lda   #Err_STNotInit
         brl   KillBatch_Return

Al6      lda   10,s
         beq   GoKill_All

         cmp   #Max_Batch
         bcc   Maybe_Good1
Bad_BatchNumber1
         lda #Err_STBatchNumber
         brl   KillBatch_Return
No_BatchMusic1
         lda #Err_STNoBatchMusic
         brl   KillBatch_Return
GoKill_All
         brl Kill_All

Maybe_Good1 dec
         asl
         asl
         asl
         sta   BatchPos
         tax
         lda   BatchList,x ; Sauvegarde Hdl
         ora   BatchList+2,x
         ora   BatchList+4,x
         ora   BatchList+6,x
         beq   No_BatchMusic1

         lda   BatchList,x
         stz   BatchList,x
         sta   $00
         lda   BatchList+2,x
         stz   BatchList+2,x
         sta   $02

         lda   [$00]
         cmp   Music_Ptr
         bne   No_CurrentMusic
         ldy   #2
         lda   [$00],y
         cmp   Music_Ptr+2
         bne   No_CurrentMusic

         jsl   StopMusic	; v1.1.3 - instead of JSR

         stz   Music_Ptr
         stz   Music_Ptr+2

No_CurrentMusic
         pei   $02   ; \a, c'{tait une faute!
         pei   $00
         _DisposeHandle
         _STErr

         ldx   BatchPos
         lda   BatchList+6,x
         stz   BatchList+6,x
         pha
         lda   BatchList+4,x
         stz   BatchList+4,x
         pha
         _DisposeHandle
         _STErr
         bra   KillBatch_End

Kill_All lda   Music_Hdl
         ora   Music_Hdl+2
         bne   OneMusicPlaying

         jsl   StopMusic	; v1.1.3 - instead of JSR
         stz   Music_Ptr
         stz   Music_Ptr+2

OneMusicPlaying
         jsr Dispose_BatchMusic

KillBatch_End
         lda #0
KillBatch_Return
         tax
         pld
         plb
         lda   5,s
         sta   7,s
         lda   3,s
         sta   5,s
         lda   1,s
         sta   3,s
         pla
         txa
         cmp   #1
         rtl

*------------------------------------------------- OK

         mx    %00

STPlayBatch
         phb
         phk
         plb
         phd
         lda   ST_ZPage
         tcd
         lda   ST_OpenFlag
         bne   Al7
         lda   #Err_STNotInit
         bra   PlayBatch_Return

Al7      jsl   StopMusic	; v1.1.3 - instead of JSR

         lda   10,s
         sta   ListPlay_Ptr
         lda   12,s
         sta   ListPlay_Ptr+2

         ldy   #0
         sty   ListPlay_Pos

]lp      lda   [ListPlay_Ptr],y
         beq   EndCheckList
         cmp   #$FFFF
         beq   EndCheckList
         dec
         asl
         asl
         asl
         tax
         lda   BatchList,x ; Sauvegarde Hdl
         ora   BatchList+2,x
         ora   BatchList+4,x
         ora   BatchList+6,x
         beq   BadList
         iny
         iny
         bra   ]lp

BadList  lda   #Err_BadPlayList
         bra   PlayBatch_Return

EndCheckList
         cpy #0
         beq   NothingInList

         lda   [ListPlay_Ptr]
         sta   Patch_Current
         pha
         ldx   #$0EDE
         jsl   $E10000	; _NTSelectBatch(batchID)
         _STErr
         pea   $0000	; NoLoop
         ldx   #$0ADE
         jsl   $E10000	; _NTPPlayMusic(word)
         _STErr

         inc   ListPlay_Pos
         inc   ListPlay_Pos

NothingInList
         lda #0
PlayBatch_Return
         tax
         pld
         plb
         lda   5,s
         sta   9,s
         lda   3,s
         sta   7,s
         lda   1,s
         sta   5,s
         pla
         pla
         txa
         cmp   #1
         rtl

*------------------------------------------------- OK

         mx    %00

STSelectBatch
         phb
         phk
         plb
         phd
         lda   ST_ZPage
         tcd

         lda   ST_OpenFlag
         bne   Al5
         lda   #Err_STNotInit
         bra   SelectBatch_Return

Al5      jsl   StopMusic	; v1.1.3 - instead of JSR

         lda   10,s
         beq   Bad_BatchNumber0
         cmp   #Max_Batch
         bcc   Maybe_Good
Bad_BatchNumber0
         lda   #Err_STBatchNumber
         bra   SelectBatch_Return
No_BatchMusic
         lda   #Err_STNoBatchMusic
         bra   SelectBatch_Return

Maybe_Good
         dec
         asl
         asl
         asl
         sta   BatchPos
         tax
         lda   BatchList,x ; Sauvegarde Hdl
         ora   BatchList+2,x
         ora   BatchList+4,x
         ora   BatchList+6,x
         beq   No_BatchMusic

         lda   10,s
         sta   Patch_Current

         jsr   Dispose_OneMusic

         ldx   BatchPos
         lda   BatchList,x
         sta   $00
         lda   BatchList+2,x
         sta   $02

         ldy   #2
         lda   [$00]
         sta   Music_Ptr
         lda   [$00],y
         sta   Music_Ptr+2

         lda   #0

SelectBatch_Return
         tax
         pld
         plb
         lda   5,s
         sta   7,s
         lda   3,s
         sta   5,s
         lda   1,s
         sta   3,s
         pla
         txa
         cmp   #1
         rtl

*------------------------------------------------- OK

         mx    %00

STLoadOneMusic
         phb
         phk
         plb
         phd
         lda   ST_ZPage
         tcd

         lda   ST_OpenFlag
         bne   Al3
         lda   #Err_STNotInit
         bra   LoadOne_Return

Al3      jsl   StopMusic  ; v1.1.3 - instead of JSR - Arrete la music
         jsr   Dispose_OneMusic

         stz   ListPlay_Ptr
         stz   ListPlay_Ptr+2

         lda   12,S       ; Music_Path
         tax
         lda   10,S
         jsr   ReadFile
         bcs   LoadOne_Return

         lda   $00
         sta   Music_Hdl
         lda   $02
         sta   Music_Hdl+2

         lda   $04
         sta   Music_Ptr
         lda   $06
         sta   Music_Ptr+2

         stz   Patch_Current

         lda   #0

LoadOne_Return tax
         pld
         plb

         lda   5,s
         sta   9,s
         lda   3,s
         sta   7,s
         lda   1,s
         sta   5,s
         pla
         pla
         txa
         cmp   #1
         rtl

*------------------------------------------------- OK

         mx    %00

STPlayMusic
         phb
         phd
         phk
         plb

         lda   ST_ZPage
         tcd

         lda   ST_OpenFlag
         bne   al2
         lda   #Err_STNotInit
         bra   PlayOne_Return

al2      lda   Music_Ptr
         ora   Music_Ptr+2
         bne   Some2
BadMus2
         lda   #Err_NoMusInMem
         bra   PlayOne_Return

Some2    stz   OldPerforming

         ldx   Music_Ptr
         ldy   Music_Ptr+2
         jsl   prepare
         bcs   BadMus2
         
         lda   #0
Patch_Current = *-2
         sta   Current_Music

         lda   10,s
         eor   #1
         jsl   play

         lda   #0

PlayOne_Return
         tax
         pld
         plb
         lda   5,s
         sta   7,s
         lda   3,s
         sta   5,s
         lda   1,s
         sta   3,s
         pla
         txa
         cmp   #1
         rtl

*------------------------------------------------- Sous Routines

         mx    %00

Dispose_OneMusic
         lda   Music_Hdl
         ora   Music_Hdl+2
         beq   No_OldOneMusic
         
         pei   Music_Hdl+2
         pei   Music_Hdl
         _DisposeHandle
         _STErr
         stz   Music_Hdl
         stz   Music_Hdl+2
No_OldOneMusic
         rts

*------------------------------------------------- Sous Routines

         mx    %00

Dispose_BatchMusic
         ldx   #BatchList
]loop    phx
         lda   $00,x
         ora   $02,x
         beq   No_Music
         lda   $02,x
         pha
         lda   $00,x
         pha
         stz   $00,x
         stz   $02,x
         _DisposeHandle
         _STErr
No_Music pla
         clc
         adc   #4
         tax
         cmp   #$0100
         bcc   ]loop
         rts

*------------------------------------------------- Sous Routines

         mx    %00

ReadFile sta   Parm0
         stx   Parm0+2
         jsl   $E100A8
         dw    $10
         adrl  Params
         bcc   No_ErrOpen
         rts
No_ErrOpen 
         jsl $E100A8
         dw    $19
         adrl  Params
         bcc   No_ErrGetEof
         pha
         jsr   Go_Close
         pla
         sec
         rts
No_ErrGetEof
         pha
         pha
         lda   Parm0+2
         sta   Parm1+2
         pha
         lda   Parm0
         sta   Parm1
         pha
         lda   UserId
         pha
         pea   $C000
         pea   $0
         pea   $0
         ldx   #$0902     ; NewHandle
         jsl   $E10000
         _STErr
         pla
         sta   $00
         pla
         sta   $02
         ldy   #2
         lda   [$00],Y
         sta   Parm0+2
         tax
         lda   [$00]
         sta   Parm0
         sta   $04
         stx   $06
         jsl   $E100A8
         dw    $12        ; Read
         adrl  Params
         bcc   Go_Close
         pha
         pei   $02        ; Libere la wave
         pei   $00
         ldx   #$1002
         jsl   $E10000
         _STErr
         jsr   Go_Close
         pla
         sec
         rts
Go_Close
         jsl   $E100A8
         dw    $14        ; Close
         adrl  Params
         rts

Params   dw    0
Parm0    adrl  0
Parm1    adrl  0
         adrl  0

*------------------------------------------------- Tool222

         put   ninjatrackerplus

* End of code (AV)


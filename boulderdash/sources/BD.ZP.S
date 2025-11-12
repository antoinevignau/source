*
* Boulderdash
*
* (c) 1984, First Star
* (s) 2022-2025, Brutal Deluxe Software
*

*-----------------------------
* ZERO PAGE USAGE
*-----------------------------

saveA	=	$02
theX	=	$03
theY	=	$04
*
theDIR	=	$0F	; player's direction
			; 0: no, 1: left, 2: right, 3: up, 4: down
rndPTR1	=	$10	; word
rndPTR2	=	$12	; word
rndVALUE1	=	$14
rndVALUE2	=	$15
rndVALUE3	=	$16
rndVALUE4	=	$17
rndVALUE5	=	$18
theCOUNTER	=	$19	; the game counter
saveTIME	=	$1A	; level time copy
theTIME	=	$1B	; level time
enchCOUNTER	=	$1C	; enchantment period counter
*
scoreP1	=	$1E	; adr - 1E..1F..20
scoreP2	=	$21	; adr - 21..22..23

extraP1	=	$24	; mid-score to reach to get an extra life
extraP2	=	$25	; mid-score to reach to get an extra life
curPLAYER	=	$26	; 0: PLR1, 1: PLR2
nbPLAYER	=	$27	; -1:DEMO, 0:1P, 1:2P
livesP1	=	$28	; start with 3 lives
livesP2	=	$29	; start with 3 lives
caveP1	=	$2A	; cave of P1
caveP2	=	$2B	; cave of P2
levelP1	=	$2C	; difficulty level of P1
levelP2	=	$2D	; difficulty level of P2
fgWON	=	$2F	; -1: Rockford is on the exit block
theACTION	=	$31	; action to perform
			; 00: 
			; 01: draw std bar
			; 10: out of time
			; FF: player is dead
flashCOUNTER	=	$32	; 00: black sprite
			; <128: white sprite once
			; >127: random, 256-value times
fgENCH	=	$33	; 0: inactive
			; 1: running
			; FF: deactivated
rndMASK	=	$35	; 7F: std mask, 0F: reduced mask
fgEXIT	=	$4C	; 0: exit off, -1: exit on
fgPAUSE	=	$4D	; 0: no pause, -1: pause allowed
joyX	=	$50	; Apple analog joystick X
joyY	=	$51	; Apple analog joystick Y
joyBTN	=	$52	; 0 if not pressed, $80 if pressed
idxDEMO	=	$55	; index in demo data
ptrROW1	=	$56	; reference row
ptrROW2	=	$58	; one row below
ptrROW3	=	$5a	; two rows below
fgROW1	=	$5c	; tell which sprite to change
fgROW2	=	$84	; on three consecutive rows
fgROW3	=	$ac	; of the game board
* D4..D7
sprA	=	$D3
sprX	=	$D4
sprY	=	$D5	;
strX	=	$D8
strY	=	$D9	; first line where to draw block

* $E7 is not used
fgSOUND	=	$E8	; call SPKR if not 0
fgSOUND1	=	$E9	; we have 12 because
fgSOUND2	=	$EA	; we see 12 rows
fgSOUND3	=	$EB	; on screen
fgSOUND4	=	$EC	; 
fgSOUND5	=	$ED	; 
fgSOUND6	=	$EE	; 
fgSOUND7	=	$EF	; 
fgSOUND8	=	$F0	; 
fgSOUND9	=	$F1	; 
fgSOUND10	=	$F2	; 
fgSOUND11	=	$F3	; 

* $F4..$FB are for the music player

ptrCAVE	=	$F8	; word - pointer to a compressed level
theTRACK	=	$F8	; track to load
diffCOUNTER2	=	$F8	; the default value saved
diffCOUNTER	=	$F9	; the difficulty counter
			; the higher, the less the player... plays
fgHIGH	=	$ff	; 0: no need to save scores file on disk, <>0: save it please
			
*-----------------------------
* EQUATES
*
* fgINPUT     DB    $55	; $00: Apple, $55: none, $FF: Atari

moveNONE	=	0
moveLEFT	=	1
moveRIGHT	=	2
moveUP	=	3
moveDOWN	=	4

MAXCAVES	=	19	; maximum number of caves
MAXLEVELS	=	4	; maximum number of difficulties
NBLIVES	=	3	; number of lives
MAXLIVES	=	9	; maximum number of lives
MAXPLRS	=	2	; max number of players
MAXHIGH	=	5	; max number of high scores
SIZEHIGH	=	9	; size of a high-score entry
SIZESCORE	=	3	; size of a score

WIDTH	=	40	; size of a board
HEIGHT	=	22

*-----------------------------
* ADDRESSES
*-----------------------------

LD000	=	$D000	; for RANDOM
LFF00	=	$FF00	; for RANDOM

*-----------------------------
* ALPHABET
* 
* 0 00
* 1 02
* 2 04
* 3 06
* 4 08
* 5 0A
* 6 0C
* 7 0E
* 8 10
* 9 12
* A 14
* B 16
* C 18
* D 1A
* E 1C
* F 1E
* G 20
* H 22
* I 24
* J 26
* K 28
* L 2A
* M 2C
* N 2E
* O 30
* P 32
* Q 34
* R 36
* S 38
* T 3A
* U 3C
* V 3E
* W 40
* X 4E
* Y 44
* Z 46
* : 48
* , 4A
* / 4C
* diamond from top bar 4E

* All chars are 8px high
chrDIAMOND	= 	$4E	; diamond

* All sprites are 16px high
sprWTITA	=	$60	; titanium wall
sprWTITA2	=	$64	; titanium wall
sprWALL	=	$68	; standard wall
sprGRASS	=	$6c	; grass
sprEMPTY	=	$70	; empty block
sprSPACE	=	$74	; space character
sprFIREFLY	= 	$80	; enemy
sprBUTTERFLY	=	$84	; enemy
sprBOULDER	=	$88	; boulder
sprDIAMOND	=	$8c	; diamond
sprAMEOBA	=	$90	; enemy
sprWENCH	=	$94	; enchanted wall
sprEXIT	=	$98	; exit
sprENTRY	=	$9c	; entry
sprDISGRASS	=	$a0	; disappearing grass
sprAMEDIA	=	$b0	; ameoba becomes diamond
sprROCKFORD	=	$f0	; Rockford

sprAFIREFLY	=	$c0	; anim steps of the firefly
sprABUTTERFLY	=	$d0	; anim steps of the butterfly
sprAAMEOBA	=	$50	; anim steps of the ameoba
sprADIAMOND	=	$e0	; anim steps of the diamond

* The following sprites are 16px high
* 50 amoeba step 1
* 52 -
* 54 amoeba step 2
* 56 -
* 58 amoeba step 3
* 5A -
* 5C amoeba step 4
* 5E -
* 60 titanium wall step 1
* 62 -
* 64 titanium wall step 2
* 66 -
* 68 wall
* 6A -
* 6C grass
* 6E -
* 70 empty block
* 72 -
* 74 empty block
* 76 -
* 78 white block
* 7A -
* 7C empty block
* 7E -
* 80 firefly
* 82 -
* 84 butterfly
* 86 -
* 88 boulder
* 8A -
* 8C diamond
* 8E -
* 90 amoeba
* 92 -
* 94 enchanted wall?
* 96 -
* 98 exit (titanium wall)
* 9A -
* 9C entry (titanium wall)
* 9E -
* A0 disappearing grass
* A2 -
* A4 disappearing grass
* A6 -
* A8 disappearing grass
* AA -
* AC disappearing grass
* AE -
* B0 amoeba becomes diamonds
* B2 -
* B4 grass becomes diamonds
* B6 -
* B8 grass becomes diamonds
* BA -
* BC grass becomes diamonds
* BE -
* C0 firefly step 1
* C2 -
* C4 firefly step 2
* C6 -
* C8 firefly step 3
* CA -
* CC firefly step 4
* CE -
* D0 butterfly step 1
* D2 -
* D4 butterfly step 2
* D6 -
* D8 butterfly step 3
* DA -
* DC butterfly step 4
* DE -
* E0 diamond step 1
* E2 -
* E4 diamond step 2
* E6 -
* E8 diamond step 3
* EA -
* EC diamond step 4
* EE -
* F0 Rockford
* F2 -
* F4 empty block
* F6 -
* F8 empty block
* FA -
* FC empty block
* FE -

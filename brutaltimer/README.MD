Brutal Timer,
(c) 2026, Plamen Vaysilov from a2heaven
(c) 2026, Brutal Deluxe Software

The Brutal Timer card was designed for benchmarking purposes on the Apple II. It offers two independent timers which counts up to 2^32 bits. Its easy programming interface allows a programmer to benchmark the throughput of a disk interface card, the speed of a 6502 routine, and many other possibilities.

The Timer 1 (T1) runs at 20 MHz which makes a step of 50ns whereas the Timer 2 (T2) can be set to run at different speeds:
- A2-F0 at 1MHz, step is 1ms
- A2-7MHz at 7MHz, step is 143ns
- 20 MHz, step is 50ns, similar to T1
- Custom speed up to 100 MHz, step is as low as 10ns

The Brutal Timer card can be connected to an external LCD display to print the value of T2.

-------------------------------------------------
Communication------------------------------------

C0x0 write #0	reset T1 and T2 (reset value to 0)
C0x0 write #1	reset T1 (reset value to 0)
C0x0 write #2	reset T2 (reset value to 0)

C0x1 write #0	start T1 and T2
C0x1 write #1	start T1
C0x1 write #2	start T2

C0x1 read status
	bit 7=0 : T1 not started or paused
	bit 7=1 : T1 started
	bit 6=0 : T2 not started or paused
	bit 6=1 : T2 started

C0x2 write #0	stop T1 and T2
C0x2 write #1	stop T1
C0x2 write #2	stop T2

C0x4 write #0	set T2 frequency to A2-F0 clock
C0x4 write #1	set T2 frequency to A2-3.5 MHz
C0x4 write #2	set T2 frequency to 20 MHz clock
C0x4 write #3	set T2 frequency to Custom quartz
  => Use T2 frequency of A2-F0 clock to count 6502 cycles

C0x5 write #0	stop T2 display
C0x5 write #1	show T2 display
  -> The default state is stopped
  -> Read status is not implemented due to chip size limit
  
C0x4 read T2 frequency
	bits 7-6
	00: T2 frequency is A2-F0 clock
	01: T2 frequency is A2-3.5 MHz
	10: T2 frequency is 20 MHz clock
	11: T2 frequency is Custom quartz

C0x8 read 7-0	read T1 value
C0x9 read 15-8
C0xA read 23-16
C0xB read 31-24

C0xC read 7-0	read T2 value
C0xD read 15-8
C0xE read 23-16
C0xF read 31-24

-------------------------------------------------
Things to know-----------------------------------

On cold (power up) and warm resets, the counters are stopped and cleared, and the T2 frequency is set to A2-F0 clock.
To count cycles accurately, set the T2 frequency to the A2-F0 clock.

If you want to count cycles, note that the Brutal Timer counter begins after the STA $C081,X, and the counter ends after the $C082,X.
In the following example, let's consider that the counters are zero and the timers are not running:

	LDX	#SLOT16	; 2 cycles not counted
	LDA	#1	; 2 not counted - Set T2 freq to A2-F0
	STA	$C084,X	; 5 not counted
	LDA	#2	; 2 not counted	- Start T2
	STA	$C081,X	; 5 not counted
	NOP		; -> 2 counted
	NOP		;    2 counted
	NOP		;    2 counted
	LDA	#2	;    2 counted - Stop T2
	STA	$C082,X	;    5 counted <-

For the Brutal Timer card, the number of cycles of the above routine is 13 cycles.
The cycle count is correct when you run at 1.0xx MHz (xx being the PAL/NTSC difference), but if you run on an accelerated Apple II, then you must take the speed difference into consideration.

The timebase is constant and does not change over computers, except for the PAL/NTSC difference in frequency for F0 -> 14.318/14 or 14.250/14.
To detect the presence of PAL or NTSC, you can use a 20MHz for T2, and compute the time difference between the two results.

-------------------------------------------------
Programming examples-----------------------------

T0	=	0
T1	=	1
T2	=	2

T2_A2-F0	=	0
T2_A2-7M	=	1
T2_20MHZ	=	2
T2_CUSTOM	=	3

OFF	=	0
ON	=	1

- INIT
	LDA	#T0	; stop the two timers
	STA	$C082,X
	LDA	#T0	; reset values of T1 and T2 to 0
	STA	$C080,X
	LDA	#T1	; start T1
	STA	$C081,X
	LDA	#T2_A2-F0	; set T2 frequency to A2-F0 clock
	STA	$C084,X
	LDA	#T2	; start T2
	STA	$C081,X
	
- READ T1
	LDA	#T1	; pause T1
	STA	$C082,X
	LDA	$C088,X	; read 32-bit value
	STA	$00
	LDA	$C089,X	
	STA	$01
	LDA	$C08A,X
	STA	$02
	LDA	$C08B,X
	STA	$03
	LDA	#T1
	STA	$C081,X	; restart T1

- READ T2
	LDA	#T2	; pause T2
	STA	$C082,X
	LDA	$C08C,X	; read 32-bit value
	STA	$00
	LDA	$C08D,X	
	STA	$01
	LDA	$C08E,X
	STA	$02
	LDA	$C08F,X
	STA	$03
	LDA	#T2
	STA	$C081,X	; restart T2

- STOP T1
	LDA	$C081,X	; is T1 started?
	BPL	end	; no
	LDA	#T1
	STA	$C082,X	; yes, stop it
end	RTS

- STOP T2
	LDA	$C081,X	; is T2 started?
	ASL
	BPL	end	; no
	LDA	#T2
	STA	$C082,X	; yes, stop it
end	RTS

- STOP DISPLAY
	LDA	#OFF	; stop T2 display
	STA	$C085,X
	RTS

- START DISPLAY
	LDA	#ON	; start T2 display
	STA	$C085,X
	RTS


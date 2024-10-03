
Requires: Apple IIGS with 3MB+ and a platinum 3.5" drive.

Note: As of 9/7/15 all known emulators fail to run this properly due to
incorrect emulation and timing of the Sony drive microcontroller (RDY line).

-- Usage --
Note: These programs can crash GSOS and should be run from Prodos8. They are
tools-free and directly write to 3MB of memory from bank $02 through bank $2C.
Ram disks may also be overwritten and should be disabled before use.

"-DiskImage" to read the disk in s5,d1, with timestamps, and display in SHR.

"-CalcTime" to convert the timestamps to per-nibble cycle times.

"call -151" to enter the monitor and inspect/modify/extract data.

"\01<2/0.ffffp" to find the start of side 0 track 1 (end of track 0).

"\d5 a 96\<2/0.2710p" to find all sector headers in side 0 track 0.

To look at timestamps for specific nibble data, add $16 to the bank address:
"18/0.2710" to view the timestamps for all nibbles on side 0 track 0.

You can copy tracks/sectors to bank 0 and save them:
"\0/1000<2/0.2710m" to move side 0 track 0 to bank 0.
"bsave mydiskS0T0,a$1000,l$2710" to write it to a drive.


-- DiskImage --
This utility will read all the bits off a 3.5" disk and display them on the
SHR screen. As it displays the disk nibbles, it also stores the bit image
to memory along with a timestamp of how many 1MHz cycles were required to
read each nibble.

The timestamp indicates which nibbles have extra hidden 0 bits in front of
them, and whether the nibble is valid or abnormal (due to float-bit protection
or a failing disk). This is useful for copying protected programs, backing
up failing disks, and accurate usage of custom DOS disks on modern
emulators.

This program relies on some of my custom GS DOS routines to control the IWM
and 3.5" drive. It demonstrates extremely fast disk I/O and head stepping
in a tiny amount of code (512 bytes).


-- Data format --
Disk image data is written to memory at $02/0000-$16/FF00. Side 0, tracks 0-79
are stored first in ascending order, followed by side 1 tracks 79-0 in
descending order.

The first byte of each track contains the track number 0-79, followed by disk
nibble bytes ($80-$FF), as read from the IWM.

Timestamp data is written to memory $18/0000-$2C/FF00. Each timestamp byte
corresponds 1-to-1 with each image byte and is simply the Mega II 1MHz counter
read from $C02F and stored to memory.

The first timestamp byte of each track indicates the time the track read was
started.

Note: the high bit of each timestamp has the video scan line even/odd bit.
Since scan lines take ~64 microseconds, and typical disk nibble reads take
~16us, you'll normally see 4 timestamps with the high bit set, followed by
4 timestamps with the high bit 0.

10-bit sync nibbles take 20us to read and will often have 3 timestamps with
the same high bit.


-- CalcTime --
After reading the disk image into memory with DiskImage, run CalcTime to
convert the absolute 1MHz timestamps into a relative, per-byte 1MHz cycle
count which is much easier to inspect and understand.

The 1MHz Mega II cycles are actually 980ns in length. See Apple GS TN 39 for
 more on the Mega II 1MHz timer at $C02F.

Normal 8-bit nibble data takes ~16us to read and has timestamp cycle times
of $0F, $10, or $11.

10-bit self-sync $FF nibbles will have times like $13, $14, $15.

There is some timing jitter both between the drive and the IWM, and between
the IWM and the Mega II $C02F counter, so timestamps can vary by ~+/-2 us.

CalcTime does not alter the nibble data, and just converts the data timestamps
to a relative cycle time. It preserves the high bit (scan line) when
converting each timestamp.

CalcTime does not alter the first timestamp of each track, leaving it as
an absolute $C02F time.


-- Road map --

Future versions will support 5.25" disks, and a more compact "track bit
array" format which can be easily written to disk or used by emulators.

Add support for explicit track synchronization data for sync & spiral
copy protection schemes.

Ultimately, I'd like to see this technology and these techniques integrated
into existing Apple II copy and image utilites like fEDD-up and ADT.

I'd also like to use this tech in a data-recovery utility for failing disks.


-JBrooks
9/7/2015

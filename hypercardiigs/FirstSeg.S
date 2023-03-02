*
* HypercardGS
* segment: $02 FirstSeg
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   FirstSeg.l
         lst   off

*---------------------------------------

         use   FirstSeg.E

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

         PHY
         PHY
         _TotalMem
         PLY
         PLA
         CMP   #$001D
         BCS   L020021
         PEA   $0000
         _PurgeAll
         _CompactMem
L020021  RTL


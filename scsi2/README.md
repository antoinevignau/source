# SCSI
The SCSI folder for the Apple IIgs

It contains the following code and releases:

1. CD-Audio SCSI-2 commands
Those were added in the SCSICD.Driver in 2018 and allowed anyone to listen to the music of their Audio-CD with a SCSI-2-compliant peripheral.
Find the Media Controller drivers in the BD.CDSCSI2 disk images under the disks folder.

2. Processor and Communication drivers
Those were added in August 2026 to support the BlueSCSI-v2 (for WiFi) device under GS/OS in the Apple IIgs. The DaynaLink emulated device is seen as a Processor device hence the dedicated SCSI driver. I also wrote a Communication device as the two support more or less the same SCSI command set.
The BlueSCSI disk image contains the drivers that can be installed thanks to the provided application.
The documentation on the BlueSCSI toolbox is available @ https://github.com/BlueSCSI/BlueSCSI-v2/wiki/Toolbox-Developer-Docs
If you know how to send a SCSI command through the DControl and DStatus GS/OS calls, then you can communicate with the BlueSCSI toolbox.
This opens the route for a Marinetti link layer to connect your Apple IIgs to the internet via WiFi.

More information:
- SCSI-2 standard @ https://www.staff.uni-mainz.de/tacke/scsi/SCSI2-introduction.html
- BlueSCSI @ https://github.com/BlueSCSI

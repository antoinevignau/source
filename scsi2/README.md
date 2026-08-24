# SCSI
The SCSI folder for the Apple IIgs

It contains the following code and releases:

1. CD-Audio SCSI-2 commands
Those were added in the SCSICD.Driver in 2018 and allowed anyone to listen to the music of their Audio-CD with a SCSI-2-compliant peripheral.
Find the Media Controller drivers in the BD.CDSCSI2 disk images under the disks folder.
Target audience: end-users


2. Processor and Communication drivers
Those were added in August 2026 to support the BlueSCSI-v2 (for WiFi) device under GS/OS in the Apple IIgs. The DaynaLink emulated device is seen as a Processor device hence the dedicated SCSI driver. I also wrote a Communication device as the two support more or less the same SCSI command set.
The BlueSCSI disk image contains the drivers that can be installed thanks to the provided application.
The documentation on the BlueSCSI toolbox is available @ https://github.com/BlueSCSI/BlueSCSI-v2/wiki/Toolbox-Developer-Docs
If you know how to send a SCSI command through the DControl and DStatus GS/OS calls, then you can communicate with the BlueSCSI toolbox.
This opens the route for a Marinetti link layer to connect your Apple IIgs to the internet via WiFi.
Target audience: developers

What if I want to write a Marinetti link layer?

1- Search for an APPLESCSI.PROC01.00 device with the DInfo call

2- If found, save the Device ID for use on the DControl and DStatus calls, and continue

3- Perform a DStatus SCSI Inquiry ($12) call, and check the following two information:

Vendor identification is "Dayna" (offset +$8 of status data)
Product identification is "SCSI/Link" (offset +$10 of status data)

4. Perform a DStatus SCSI TOOLBOX_GET_METADATA ($D9) call with sub-command GET_CAPABILITIES ($01), and check the following information:

API Version value is 0 (unsigned byte at offset +$0 of status data)
The SCSI Processor device driver supports commands for the API version 0. A change of the API version may require a change in the SCSI commands.

5. Connect to the WiFi access point using the DControl SCSI Receive Diag ($1C) call with subcommand SCSI_NETWORK_WIFI_CMD_JOIN ($05)

6. Send ethernet frames with the DControl SCSI Send ($0A) command, and

7. Receive ethernet frames with the DStatus SCSI Receive ($08) command.


More information:
- SCSI-2 standard @ https://www.staff.uni-mainz.de/tacke/scsi/SCSI2-introduction.html
- BlueSCSI @ https://github.com/BlueSCSI

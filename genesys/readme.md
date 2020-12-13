Genesys v1.3.4 Readme - November 2020

The well-known resource editor for the Apple IIgs, originally developed and distributed by SSSi, Inc. until 1991, is now available in a new version that supports resource controls introducted in System 6.0 and 6.0.1, and even more.

A resource editor is a desktop program that helps create resources for a desktop program: a menu bar with its menus, a window with its controls, etc.

Shell
- It is based on v1.2.4 (I do not find v1.3 reliable)
- I've added ten resource types that were not included in the display (it does not mean the resource type has a dedicated editor)
- The help menu is updated (the data is a resource type $5751 in file Gen.Data)

Editors
- Control
	It handles the new bits in icon, line edit, and static text controls
	I have added support for rectangle and thermometer controls
- Update Info
	A new editor to create rUpdateInfo resources for Ewen Wannop's Versions software

Export
- APW REZ
	Thanks to Chris Vavruska, one can generate rez files of new controls, new control data, and rUpdateInfo
	
Idea
- I realized that a control can be created from the Add Control pop-up menu or after creating a window. But you cannot add to the window an already created control. You must create it from zero. That is weird, one should be able to add to the window an available control.

If you want to test, report bugs, ask for features... https://github.com/antoinevignau/source/tree/main/genesys

Thank you Ewen Wannop and Chris Vavruska!

Antoine Vignau & Olivier Zardini
Brutal Deluxe Software
brutaldeluxe.fr
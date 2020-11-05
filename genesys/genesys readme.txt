Genesys v1.3.4 Readme - November 2020

Shell
- it is based on v1.2.4 (I do not find v1.3 reliable)
- I've added ten resource types that were not included in the display (it does not mean the resource type has a dedicated editor)
- the help menu is updated (the data is a resource type $5751 in file Gen.Data)

Editors
- Control
	- It handles the new bits in icon, line edit, and static text controls
	- I have added support for rectangle and thermometer controls

Idea
- I realized that a control can be created from the Add Control pop-up menu or after creating a window. But you cannot add to the window an already created control. You must create it from zero. That is weird, one should be able to add to the window an available control.

The shell and the editors communicate through a 64-byte buffer. That is mandatory to understand to write new editors. My plan is to create a Versions editor (Ewen's Versions is a cool product).

No work has been done on exporting resource files.

If you want to test, report bugs, ask for features... https://github.com/antoinevignau/source/tree/main/genesys